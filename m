Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD797197A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 17:48:06 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id y28so4944573wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=T9C7+IZXyo+NxKSrHe0J03E7J6Hzq8mzqUeu1tOy4MA=;
	b=C4cPfPm7aRwP5bfSW/spLpLTzyGB1yHnDEp/PU5hz1aoeGly+Cf9DN/15RZBOEl78W
	lFbeWM5pg7hD9GLYyRjsyYq9HqY8wDYws0fO62+hAZOkBQ+RhbxBeFar4qNF03LZw+6+
	679dwQkOOu2odaKy600zO9g5SQCuZBXtWRitAwnhmsfFk2tl0amcRFSwP7VelLZRUjfx
	PEA0ZkJAPwzPAWp/fx/9AvlCAMWjBXzvzok7vIyQdihhUz5Brc8uEotVfzqoXLSJs0M8
	2iFaowlIlpFLXFiRRMo4+KS+YCSCZzRK4vyjSvThqTFiAejtTYt4C63ULCGAYmJtdjln
	ICow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=T9C7+IZXyo+NxKSrHe0J03E7J6Hzq8mzqUeu1tOy4MA=;
	b=IHYkzu2UYuz0QBVxMRDNxnhYyh8zAVHI/wlsrHl83zSOpQz4kgR5qJMNVOvzmWighi
	J17dWu1hVXObByrOJ9i2UAA1mG1yph5PWTxZ+Yscffl/ssdmnbUteFX7NDpk8gpsDTkE
	MbntvKVmf57kdf0bsStrY44aN+SvjGy1fD4N49xlkTrDyTuZxcnsIgs9WrJafaihL3U+
	4uHFVo4PD6xJHTpBNcSMISqm6L7ZPut6tJmDSWDElK3O8RtrpmCwi/O4pGkQrf2nGEVI
	V8pb0CNnDVCkH9AolIDRgry4rLoX5deGX0ynUeh6NXoO8hHa7M5vm1F48yCr1eKKt7UG
	xGAw==
X-Gm-Message-State: AIVw112m8zRWelkGq1ff6HJFPILwMs3Z4bezYBfwPoR7koNCLyM6H3n4
	kkRgCeKVUF0UF/hvxjc=
X-Received: by 10.223.136.135 with SMTP id f7mr2277267wrf.148.1499968086590;
	Thu, 13 Jul 2017 10:48:06 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l12sm7159061wrc.46.2017.07.13.10.48.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 10:48:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jul 2017 18:47:43 +0100
Message-Id: <20170713174743.19954-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][morty] libgcrypt: fix CVE-2017-9526
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
X-List-Received-Date: Thu, 13 Jul 2017 17:48:06 -0000

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
index 00000000000..f6c4ca76f33
--- /dev/null
+++ b/meta/recipes-support/libgcrypt/files/0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch
@@ -0,0 +1,39 @@
+CVE: CVE-2017-9526
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From b3cab278eb9c2ceda79f980bc26460d97f260041 Mon Sep 17 00:00:00 2001
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
index 15805cd4365..7c4c0e83b53 100644
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


