Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id E0E3C6FF7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:36:51 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id s198-v6so3116479oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=noiCqEV7YvcdRThLpkYxP02B1ZsIfpai+/7g+VyJvP2l87s4gNPCoUtC0VhINqlv/J
	9TyYxpLHRKTaek+9RsTNx5QVs7N2tq4wHOZNFNVk7r2DrvJRaa2G356zc/oSMvGs7u84
	RStven0/SHhNiQVZFzmM6B9uBtWZyXU39RS8gTY9NSx/NyJWv1JYp+CUYK2Ftc08kSy4
	g4s7JhFQ4CcHEgYi3uOqElOQfo32+kVQ/lE43IzW+GuNuMLlolvGMUOIl3MYKacWdC3I
	kGGyr0Ek+5VMnfGTXptwFu+8hb7aNhH23wxVDfYNNtg0FRfRJ5Vuvt3JHszJaeeIoy+K
	DiTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=mZxSwXXos1mPptWvaAn0eqCSVShneLYJ42SU+gRlvohcMCxN50iEJLn4g1icwCz9PB
	1U2goxDgFiUSUzmHAaDLwwXAjByyAspBGTd0/8IMJsNA9R46Tlct0NO40zSPB+lOUdrY
	vaMRrruBWgeJy5ds9LFFt5V/xBAOlq76t2ozFLRv5qs1D6eN3DiKo/P9xnVMiOYUCx/W
	UDlBz1M2p6o5GgkWI4AFslRAvU7AmD51u/FJNZjSQou3WXhS7X15Vi1s7f+NAlfgVX9I
	xLmLoLkS4toPx7fPeFSQqmE4rtpASQ1t8HrKCWXjPeC4Odn/ChqOwdSSotgxUkS3iq+f
	5PBg==
X-Gm-Message-State: APzg51C123P4zV5XNkEVswD9p27smKAVMOlJx9QjxAAwqBq8wokAiT9z
	Dco2NRHnHW3nM1Poh5eMCR79p6+V6gQ=
X-Google-Smtp-Source: ANB0VdYHKINP5pyBJsIBDfUQfHiEQ4sooq3WifPVErCemuRgtRLmEScL1B2jpB1rDv9e936KZmZFFQ==
X-Received: by 2002:aca:b355:: with SMTP id c82-v6mr4074951oif.9.1534945012676;
	Wed, 22 Aug 2018 06:36:52 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3746773oib.55.2018.08.22.06.36.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:36:52 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 19:05:27 +0530
Message-Id: <1534944940-21566-21-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944940-21566-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V2 21/34] libsndfile1: CVE-2017-14634
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
X-List-Received-Date: Wed, 22 Aug 2018 13:36:52 -0000

double64_init: Check psf->sf.channels against upper bound

This prevents division by zero later in the code.

While the trivial case to catch this (i.e. sf.channels < 1) has already
been covered, a crafted file may report a number of channels that is
so high (i.e. > INT_MAX/sizeof(double)) that it "somehow" gets
miscalculated to zero (if this makes sense) in the determination of the
blockwidth. Since we only support a limited number of channels anyway,
make sure to check here as well.

CVE-2017-14634

Closes: #318

Affects libsndfile1 = 1.0.28

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../libsndfile/libsndfile1/CVE-2017-14634.patch    | 42 ++++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
new file mode 100644
index 0000000..39b4ec1
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2017-14634.patch
@@ -0,0 +1,42 @@
+From 85c877d5072866aadbe8ed0c3e0590fbb5e16788 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Thu, 28 Sep 2017 12:15:04 +0200
+Subject: [PATCH] double64_init: Check psf->sf.channels against upper bound
+
+This prevents division by zero later in the code.
+
+While the trivial case to catch this (i.e. sf.channels < 1) has already
+been covered, a crafted file may report a number of channels that is
+so high (i.e. > INT_MAX/sizeof(double)) that it "somehow" gets
+miscalculated to zero (if this makes sense) in the determination of the
+blockwidth. Since we only support a limited number of channels anyway,
+make sure to check here as well.
+
+CVE: CVE-2017-14634
+
+Closes: https://github.com/erikd/libsndfile/issues/318
+
+Upstream-Status: Backport [https://github.com/erikd/libsndfile/commit/85c877d5072866aadbe8ed0c3e0590fbb5e16788]
+
+Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ src/double64.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/double64.c b/src/double64.c
+index b318ea8..78dfef7 100644
+--- a/src/double64.c
++++ b/src/double64.c
+@@ -91,7 +91,7 @@ int
+ double64_init	(SF_PRIVATE *psf)
+ {	static int double64_caps ;
+ 
+-	if (psf->sf.channels < 1)
++	if (psf->sf.channels < 1 || psf->sf.channels > SF_MAX_CHANNELS)
+ 	{	psf_log_printf (psf, "double64_init : internal error : channels = %d\n", psf->sf.channels) ;
+ 		return SFE_INTERNAL ;
+ 		} ;
+-- 
+2.13.3
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index c6f2a46..ed43b74 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-8362.patch \
            file://CVE-2017-8363.patch \
            file://CVE-2017-14245-14246.patch \
+           file://CVE-2017-14634.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.7.4


