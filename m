Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 501157807A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 22:07:16 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id v105so18225630wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=hZILFyQRl9Qgy/KBwP+pATSqWPvrC+UPE6MLO3ckwg0=;
	b=t4yrLkDzxEIQ6AqI7FFNT3jRfBQ+73/RnOnmaCvvVuKTUx38LAFrfYYrtmDvYDBd1g
	ruCVIE2tuWKzlnfb7MTYRo4pKJ64ktYERxswjg9LBLNZmq2N5dFBqGI62Ed0HoS3NbX4
	66Yj0lcDsiRYAbYTZ8s5T5SEFVNJ7iKcpPEsEioLPj+qFE/oU9y9TxZPzle2F7fKF6eV
	rsrL2QRlJim7ZkgNkOxBlfiodHPa8epas80UNwY0kY1AMKax6Go88cptx5xBa9nxOp0N
	qWkGZBAJVs0XunXSje6vi9kNuTZRchrWV2fH3NxWNyRyMiozMuOb5BjBXyNf8IwSpuvf
	Fi/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=hZILFyQRl9Qgy/KBwP+pATSqWPvrC+UPE6MLO3ckwg0=;
	b=LCkJNAKxojl4XflzhdjBTLbrmZ34qZwCtfh+s5Sv7mHVKrYbzoTmnZUemwtCuNbqDe
	HgqJqUVQD9qKOvzkyDc1SGuRuWD7yizvQTaMfDjeMdwek+bttDV2Ua7lvhQFRaRz/KsK
	GYitl6Ect7fFDXwVyWdmMVFwbJhLlDmVybX5IlfQ4AlWR1iBnGtDGyCrS2/QmOg+FuPb
	ylG9li7CapGEgbAUka70mQsKwZQL3PCyeBIgTanBFeonGat58yBktlBVkMCwD5yPy10a
	MtY+TdYiERBBg73NhQVDvW+dzbcjRoU40qkjSWt8P2Gvy0ypiJuNQZyZSc2UeY1dHKib
	rchQ==
X-Gm-Message-State: AIVw113u1pCSSF3gNjDMO5FtszlJrUohkooqYLhwb3xVdLAfW4rhFC9l
	SIuHON7Pqc0E9As2TCw=
X-Received: by 10.28.26.2 with SMTP id a2mr3679397wma.32.1500415636790;
	Tue, 18 Jul 2017 15:07:16 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	x98sm5193449wrb.47.2017.07.18.15.07.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 15:07:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 23:07:08 +0100
Message-Id: <20170718220710.6362-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][pyro 1/2] libgcrypt: fix CVE-2017-9526
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jul 2017 22:07:16 -0000

In libgcrypt before 1.7.7, an attacker who learns the EdDSA session key (from
side-channel observation during the signing process) can easily recover the
long-term secret key. 1.7.7 makes a cipher/ecc-eddsa.c change to store this
session key in secure memory, to ensure that constant-time point operations are
used in the MPI library.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-Store-EdDSA-session-key-in-secure-memory.patch | 39 ++++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch

diff --git a/meta/recipes-support/libgcrypt/files/0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch b/meta/recipes-support/libgcrypt/files/0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch
new file mode 100644
index 00000000000..0a4dfe67737
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch
@@ -0,0 +1,39 @@
+CVE: CVE-2017-9526
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 4a1768d683f6572ad86d833508c70e6b3dc1efdc Mon Sep 17 00:00:00 2001
+From: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
+Date: Thu, 19 Jan 2017 17:00:15 +0100
+Subject: [PATCH] ecc: Store EdDSA session key in secure memory.
+
+* cipher/ecc-eddsa.c (_gcry_ecc_eddsa_sign): use mpi_snew to allocate
+session key.
+--
+
+An attacker who learns the EdDSA session key from side-channel
+observation during the signing process, can easily revover the long-
+term secret key. Storing the session key in secure memory ensures that
+constant time point operations are used in the MPI library.
+
+Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
+---
+ cipher/ecc-eddsa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cipher/ecc-eddsa.c b/cipher/ecc-eddsa.c
+index f91f8489..813e030d 100644
+--- a/cipher/ecc-eddsa.c
++++ b/cipher/ecc-eddsa.c
+@@ -603,7 +603,7 @@ _gcry_ecc_eddsa_sign (gcry_mpi_t input, ECC_secret_key *skey,
+   a = mpi_snew (0);
+   x = mpi_new (0);
+   y = mpi_new (0);
+-  r = mpi_new (0);
++  r = mpi_snew (0);
+   ctx = _gcry_mpi_ec_p_internal_new (skey->E.model, skey->E.dialect, 0,
+                                      skey->E.p, skey->E.a, skey->E.b);
+   b = (ctx->nbits+7)/8;
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 84c1cc018b3..e95c059c875 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
            file://fix-undefined-reference-to-pthread.patch \
+           file://0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch \
 "
 
 BINCONFIG = "${bindir}/libgcrypt-config"
-- 
2.11.0


