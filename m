Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id EB062782B5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 13:27:35 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id v105so28447656wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kGmFCaLiC4RoMOJvOaQ9+Hm6vznW5Tyv6BxJD8IH3C8=;
	b=vGMASMfh+Nq5yefYd9WSSI9t5HT+Bfg5FpZ36LLM4Il2cE5nukPuelkcbdLv1USk/B
	pPa8vQxAAwQkB6/WC9ltrVaV5Bs/ZXAs6K1S+OqEWwvlNXJvt4H5X1oMhAA0c/OcYNNd
	wtlDMUk0eTRXukAZNMlQ3srG/OFntKCHT2BlyenkTozrVmv6w0+IijU0LMc/HkrPxBaB
	Hvq2yK8pM4BdC9DEAa8IHxrbJykk2IDJ7bw9mJ+S9ReeX/fAm5CPR45vcFF4CDhb79RT
	ZvnW/WbF0Nu8gYNs5M13NqtwKFp9SQqnhaAzjN5E64yGqbSvbGL3Ap+o0D8vNETFtKe7
	XXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kGmFCaLiC4RoMOJvOaQ9+Hm6vznW5Tyv6BxJD8IH3C8=;
	b=Ji5YgU/d8BAskXI/jAt8xt5URSTlsvKJ5QG60G3m+fnPEi0yV6I09Ohkfk5FGx3b/R
	ErL81xNTvv5kYNe8/IkgKSP+zgfn0jfqTTGTECjtephN/vOE+6hh4hNVHfP6e2PstuOg
	x2Toqu97qGq4utHjGHCdFWwKT9uWAS3jC58EDz5l0YGQsBADYWLIj9oPY8rz4x4V23Yn
	VYYJkW2G8TGJcvstwcAQVK07rkGj1R6/pDnaX6NnR88RtlThTOkRMaa70clOZTfVK0Ml
	15Nz9C7R+gARzfGahEznF3v2smtP70gmWOtBPaZKHJ659aPLCKIYvJQSZQ+JTlh3KjYs
	pu+Q==
X-Gm-Message-State: AIVw111BAsY8MDXDPcOGxiTQILJgKgJjNLIfYsPMJaourTNE8cnHIX1C
	qMg2SVi4vuIKzzYO940=
X-Received: by 10.223.149.65 with SMTP id 59mr382341wrs.292.1500470856782;
	Wed, 19 Jul 2017 06:27:36 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	l31sm5911891wrc.12.2017.07.19.06.27.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jul 2017 06:27:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 14:27:32 +0100
Message-Id: <20170719132732.6933-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170719132732.6933-1-ross.burton@intel.com>
References: <20170719132732.6933-1-ross.burton@intel.com>
Subject: [PATCH][krogoth 2/2] libgcrypt: fix CVE-2017-9526
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
X-List-Received-Date: Wed, 19 Jul 2017 13:27:36 -0000

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
index 404f870db03..8e7a38f8940 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -18,6 +18,7 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-${PV}.tar.gz \
            file://add-pkgconfig-support.patch \
            file://libgcrypt-fix-building-error-with-O2-in-sysroot-path.patch \
            file://fix-ICE-failure-on-mips-with-option-O-and-g.patch \
+           file://0001-ecc-Store-EdDSA-session-key-in-secure-memory.patch \
            file://CVE-2017-7526.patch \
 "
 
-- 
2.11.0


