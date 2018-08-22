Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id B113E79491
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:47 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id c190-v6so3705028oig.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=Bu4mbsOlnOj6uta6nZis0fLTqVSNoC/el7JZ3x5KObwGNNzzlGgW1uF+Km2vmEReOZ
	7s70JiR+QY1tjhfoYKeaG2Df+yXXIRClOu9cD2+xAeTSJuNul7e84hM2+nB4KYMxHvaj
	13uqB1YZi6cx14X5Ve5U6w4TUvWlaTIjPDrw6zufIQKCWSZPv/WS1pIPtu21MQDPmcrH
	7OcsUKjHWBa0IGUEzrvAl7GRDSSSCMbSc4/Xc1zZr5/syz3XiYSW5BvM+BERJV3Kyg+c
	64F5T/XSeRytZwG2HK3ZD7teHs56GCmS9vqCEulSb0vqacnZL5iZ6RuMjmbsIopmRP7/
	9aJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=eY9tKzw5nqV0GcKKDvLuxCgoaPjApEpeaXcAXzlE5NztNUpvV69+wL2H20S/Su9b3F
	qeKwCqnxB5ebErUmfutzHSQV2aNz7Wgv2H5DslJteYnz1JjbLs1uoUpsAz4oC31SNBc7
	b7cAW8Kvv91oJIeQWcEVJ71a/bY3fzxaqCNv5WczowPvkreqTPdzlbr2anikAbaRWGmu
	nG/nRI1AiUyE6Q5zvHTQ9r9x9+ZvWsTnFrPJPmUXrbcVRLV4bl2x3Z3FgwwVj6cAQtcr
	VLT9ivWLTIMBUNxKQxAhMxJGZsYTTnk6b97ZF148RdD1zakh0P6JSAOT+gnoq9UeO7ge
	MUJA==
X-Gm-Message-State: APzg51D8DQNd/n6rS0u0ry1LUzaTts5hCA2Aifs17wbTXAvm0cMbrZ21
	CNG1HcGAyFYXywws/wd27YaQmKA5FME=
X-Google-Smtp-Source: ANB0VdY0B7RUq5WuVRO8Kf39A6ztv6teyGF6L0oShxXMl3MZXzTTyltUuwURDNz9b6knno+Io02rRg==
X-Received: by 2002:aca:4ed3:: with SMTP id
	c202-v6mr4613314oib.92.1534950588637; 
	Wed, 22 Aug 2018 08:09:48 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:48 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:39 +0530
Message-Id: <1534950532-23850-21-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 21/34] libsndfile1: CVE-2017-14634
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:47 -0000

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


