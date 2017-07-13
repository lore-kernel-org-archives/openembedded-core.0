Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id EF8117197A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 17:48:25 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id r103so56739188wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 10:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hZILFyQRl9Qgy/KBwP+pATSqWPvrC+UPE6MLO3ckwg0=;
	b=hQxGAqAaoU16taI2ets6mY2f6SF4w48AY8Jaian4AMu4Qye0qXR37HUpF5gRkz1eSQ
	tC2CBcAPNhNAZ3syOr3RWeNspzXlv1Lw1Xn1V3CB/qNP7uBcIzkYAPUzgYFlKlxOF9OM
	XQ02y/nIRbh6/eI0aMXtg+8KNyo5ccU/UQgnXKwAC3DxRuI3rogneQNE2xSfBAcLfy3K
	33FIybjOiXVD5cED6S8ZIV5W3AOraFAn8PlfHcqPpwUPORDC03H2AtyOTvkFQIkzd5Bx
	v4kgu6t1HwpOgTSmCyDoBgT+jbQhVTKMUZkDgqGtQNRNhLC+hBRUl2P+UHp5c3emTNxb
	qqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hZILFyQRl9Qgy/KBwP+pATSqWPvrC+UPE6MLO3ckwg0=;
	b=n3+0gDCotET2MPxhXrVL2Jy5muyma+fWSJM+jqw7DmYcYHyPB6g5kNiM0OZA9UC+W8
	gcK9Ivf4Wop3oU1/1qX+uafeqfP6OnPnJ0otWlH4fkn+jVlaVL81iWK6wFQBeVgBzDhc
	JPZqXd20g2tWWUF+uLF2zySJ6m1eTl2Dlk6asNgUmD1bxguRrqNpABgyWC+l9s56I014
	RyXfrNtpoWCqyLeWI6jXvgRBINu6yD1s6Aw0QkH6SmSoajKnqv2hb/XvLlI2LPmutN6G
	Dehv7jfNz6VZttaRVCMsIEVztUOuJnt67iJBTu65LW5JwZ7+ndMNc0ptTA4I6VtMSmrU
	3LTg==
X-Gm-Message-State: AIVw113/RFWPDUvH3jK76N97bX/QrXc/+y847WjWrHX39uIkZMqIHhsy
	O/wznAvHGABSCoMHZAU=
X-Received: by 10.223.169.51 with SMTP id u48mr2233759wrc.176.1499968106249;
	Thu, 13 Jul 2017 10:48:26 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	185sm7228710wmn.33.2017.07.13.10.48.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 10:48:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jul 2017 18:48:21 +0100
Message-Id: <20170713174821.20071-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][pyro] libgcrypt: fix CVE-2017-9526
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
X-List-Received-Date: Thu, 13 Jul 2017 17:48:26 -0000

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


