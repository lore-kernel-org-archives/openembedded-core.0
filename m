Return-Path: <ovpanait@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9124477E58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 08:25:54 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id y134so3383400itc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 01:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NOde8uKnysXui9MlLUCzaS7GStCbo6HqogC2j2GIiCY=;
	b=Dq+3lhi1PnWhw5YpXfX9PiUuwP8VkjXBDYwZJXZpQaov/yHIX6eYtjAEEZ2xJITB3t
	W2zmY3YdCTGcYmyQGrXpbyqm2oewBGZ9OJmAuCOYO99+eQZ3YoNuWPtrgVEiX6gW2/gS
	i94KoHgpFd9bwXwFvmQLWzWyehm4aTTczmAF5Tgi0IwQhoZh0xw27QJhjJzcYFzYGjJZ
	zNGMhLY30z+EIfUNIIUYGE5lP2fZyazTx/ilONgkLecad8VPjqtkxlsujws1V/Y9Rfp1
	9/FoO1UJwlayMvSGuUQoW6dpKp8Vlni1l5K6yEkJihIz9+vPiwv3Huh1kngJJswWQU2g
	YObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NOde8uKnysXui9MlLUCzaS7GStCbo6HqogC2j2GIiCY=;
	b=e/jfjAZo4SZE3Ri/dkyC2FMwnzeu/AQrxMKEXu9uJQCHAKtA4EcZKdRKhwPiW3ZrRf
	VXfYuj81+8hWgaZE9d+SwzlSwukq7DQUuu/u61tVwX9OFXgz+MQeFYwHsXMSbhxSW+5q
	wluimJpp7F3LKkFJEOOXDY4xGOzGUKeI75QPdCwDcS1LAZ7QzzkuUqkpSfCv7SRvYs0d
	X64MIEW+58HUtEk0CvvYFIdiCxj7pavgY73OPreuVdaZ5laBbDohm43h6oDLd2JVh1KF
	mCpKqYeVd5A/9tDoT+Ehl2BogdQkKk9R0kOUupGVWvbiWHSpoxhoECkF2lK8v5snklQP
	oAJA==
X-Gm-Message-State: AKS2vOx2WQNPEFYZsL1Hy+PSJvkwNLCG7Y26vcuiykcsck6HM/sJYOTk
	2V3Fvl3h5DCL03WB+Yf1aA==
X-Received: by 10.36.103.143 with SMTP id u137mr836137itc.118.1498119956233;
	Thu, 22 Jun 2017 01:25:56 -0700 (PDT)
Received: from uidivo.corp.ad.wrs.com ([89.121.200.102])
	by smtp.googlemail.com with ESMTPSA id
	e34sm636816ioj.62.2017.06.22.01.25.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 22 Jun 2017 01:25:55 -0700 (PDT)
From: Ovidiu Panait <ovpanait@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jun 2017 11:23:36 +0300
Message-Id: <1498119816-31276-1-git-send-email-ovpanait@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ovidiu Panait <ovpanait@gmail.com>
Subject: [PATCH] libgcrypt: CVE-2017-9526
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
X-List-Received-Date: Thu, 22 Jun 2017 08:25:55 -0000

In Libgcrypt before 1.7.7, an attacker who learns the EdDSA session key 
(from side-channel observation during the signing process) can easily
recover the long-term secret key. 1.7.7 makes a cipher/ecc-eddsa.c change
to store this session key in secure memory, to ensure that constant-time
point operations are used in the MPI library.

References:
https://nvd.nist.gov/vuln/detail/CVE-2017-9526

Upstream patch:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgcrypt.git;a=commitdiff;h=5a22de904a0a366ae79f03ff1e13a1232a89e26b

Signed-off-by: Ovidiu Panait <ovpanait@gmail.com>
---
 .../libgcrypt/files/CVE-2017-9526.patch            | 36 ++++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-support/libgcrypt/files/CVE-2017-9526.patch

diff --git a/meta/recipes-support/libgcrypt/files/CVE-2017-9526.patch b/meta/recipes-support/libgcrypt/files/CVE-2017-9526.patch
new file mode 100644
index 0000000..26b570f
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/CVE-2017-9526.patch
@@ -0,0 +1,36 @@
+From 5a22de904a0a366ae79f03ff1e13a1232a89e26b Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport
+CVE: CVE-2017-9526
+
+Signed-off-by: Jo Van Bulck <jo.vanbulck@cs.kuleuven.be>
+Signed-off-by: Ovidiu Panait <ovpanait@gmail.com>
+---
+ cipher/ecc-eddsa.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cipher/ecc-eddsa.c b/cipher/ecc-eddsa.c
+index f91f848..813e030 100644
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
+2.7.4
+
diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 3c7e89a..d6d5bd9 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
            file://fix-undefined-reference-to-pthread.patch \
+            file://CVE-2017-9526.patch \
 "
 
 BINCONFIG = "${bindir}/libgcrypt-config"
-- 
2.7.4


