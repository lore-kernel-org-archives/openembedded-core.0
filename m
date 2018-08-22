Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2A56779276
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:17:32 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id y207-v6so2434884oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=hj5L5S9Z73J4TvTKG4zByZqVsfaOy2YaeqAhkR2n+q0TQE5hGIr4QUSkbk5DDQv3Mq
	5M8iSrWUXokr6IBU50Bhig8BvO3UCJ+UQq0SSXrkdsC28voi7msZiCtPS3QBC0lxqAsd
	ji67hwJGTZXiOZUjHWerK8y2T0WlXxkd4p8zqb9fm6iF5jgR6kbaFcdqeJh34DEAeIss
	fte/tDNTTBL5VkZYESkGnpNw7sgAFk97FoafEHdwYr20Vu+GH1pfRwVrysKO3gUischC
	ysKhUMr6MBHfXyK2cml3XrIXiwFP4ybqlYh5zakJGcK/jBPCtEwraOHvBdqxweqpPkjy
	yUKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=W64TEyImG+qR6Wi5aOOQqvc1QQDF1VrLgiud+xPwh3J14l8fkJY5tQyPfLwKJC27wF
	RIe93WciEpAUkcRc4fYm3nlNSf5jsBQrALgZMPfal+s2LDIuJUdlstKieooZai0B4X6f
	eqJwGplnjnyR3wUYa30GrLGoVBwLVoNd6j5nQoIoZFDuAUoMhOmsNsA5PrGACeO3IYI6
	PxCEJSS7EbqzcSgcf1kdY5jgCuaylwTxySv+xacfcw6u29KsNgZNLUQvyMIdSjaquTzc
	6I/+Qlrevpu8DBFL/l51azJpqxAQMYwPg/T30d5QmY5ENkV6pLK2O2QegH+4bRQz/a59
	OlDQ==
X-Gm-Message-State: APzg51BogKPgnI0p88ziVTflmp5TteDkUNwrOlstcq1a6YRcg9suEDh8
	VFIEK9Fo6YRXYh1Rs8SwP+pH8J3YjA8=
X-Google-Smtp-Source: ANB0VdbYV/SMT/w9Zxi+mewEgB9X8/H97lA4vgThs0+x7RwUsfhPOKnimSCk9jofTkqqMQPNvasSCA==
X-Received: by 2002:aca:40d6:: with SMTP id
	n205-v6mr3647942oia.35.1534936653097; 
	Wed, 22 Aug 2018 04:17:33 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:17:32 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:44 +0530
Message-Id: <1534936615-11658-8-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 08/19] libsndfile1: CVE-2017-14634
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
X-List-Received-Date: Wed, 22 Aug 2018 11:17:32 -0000

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


