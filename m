Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id ACCFE7807D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 22:07:38 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id w4so47375797wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 15:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=T9C7+IZXyo+NxKSrHe0J03E7J6Hzq8mzqUeu1tOy4MA=;
	b=jWxoO8fsBVyowdgbz8vcgg/UsQ8KCc8FMNvEbjGS7ESb61z72IsbHi3AvGSL/Af4UN
	8xyzuuJM/BYhuaUP9rX7RmUwW0Coq3KknbNuS9A2VC9btK5N7X0xGSymKVNu8cyA+4nm
	5O3+KUew8JzOX/jnQWKFOd+CbPYmYDgOTE2Oyn2NZzW2etgc8n16A7V3K0KXbKMH1TTL
	RQ0iPn7eRimIddaaRX1rMpT7c7VjX0OdwDDItJxitgPsQHiFw2BZBuMYwyHZAkxvIASe
	vLXgJeXUBn53ymY4jbSOU07xxgNdMmiZivzdWFD2jb9zXIwxz+QX+IDH8idkdWHz4eCl
	7LOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=T9C7+IZXyo+NxKSrHe0J03E7J6Hzq8mzqUeu1tOy4MA=;
	b=Nd3m2aMhsd3udhV03i5GyiZypZti6jtAmmGsHNonkoekmkypXIL7VodUnF+hNpvMiU
	RzuBMiO19mWVkbSk3ZXFu0DrwMP0lUhZEfJpPQTMXwmTn838+1UAos7FhqHjT6TElzOi
	kEeTSg+CRVw4kYNZELws8C5UJmI9I8e/1f70vh/Z3sSEiujbqSUMORLzOsF3v2aYGtAN
	sEWk4rk9c8cgj43X+IEhKrr5Jytzf780ynODkgEV5m/Fot4VwcH3JvdCU3lwAOgvn+Yz
	Z3K5MKvJXWC/kgBOAcd4nPCA6LXDmplnaW2wKakSdhn3LOehiQ2u/lc36Id8z9Mz0eMp
	j9rw==
X-Gm-Message-State: AIVw110O/bVr2rr39AacLfuJ+JAIczXXYXSa5uQGI+bL6FU9c3hncKxI
	BF7ugml1wm8tI9jvx+g=
X-Received: by 10.223.150.54 with SMTP id b51mr2461459wra.185.1500415659348;
	Tue, 18 Jul 2017 15:07:39 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	z108sm5690851wrb.41.2017.07.18.15.07.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jul 2017 15:07:38 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jul 2017 23:07:34 +0100
Message-Id: <20170718220735.6547-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][morty 1/2] libgcrypt: fix CVE-2017-9526
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
X-List-Received-Date: Tue, 18 Jul 2017 22:07:39 -0000

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


