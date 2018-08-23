Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id A00AE79498
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 02:37:39 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id q204-v6so6722679oig.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 19:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=cpdqfCE//U8tIRL3Fc/9LKMXkMxtbVvnexL4/UIG10wzJBUaordOIthVLQOIbOeyRe
	rOOcBHwhFz86bO9oGZ5qeeHUI7N9/TB3P40KNtmwzOO3gmGMwRdcMSdVA/+fGWzzq12z
	s9EvMnCzhqrHn0aIBXvwxSHTJ28oWlcYyNPOMwqiZAolPOe/5lvRqYB9k39qFHIjTIAR
	bf5utBSg6Kk5DzuvOSZJXsS7ooo/bybyCWMqnDaa6XRApEUo6qGEuWOj62LFeagIoPIH
	en6QRgwuKaYLHt7wRiV0ASWmraoNItfCgTeO/uL295cdETqVu3qwIlgnTS+0cYiP7E2p
	4HkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y4Nh6rOj88MWjicoY7bIJIWzAa3Mj02Is47U6JkJtd0=;
	b=A0anq18lLvJBP6lmqDzbVyn5/9Wa+VzTR+X+WcsCEua2AL1RFGITC/MU+AAZ1zFPR7
	UgRofSJy/Gl/dRqKCLlmgDBqKtw0hCCMqY6t2XWV/GFrzQS5jsXr1Q4E050vkyQmQGX8
	Ca3jxwZqbTVfPgRCqKVnv97SIu+r4/6OmdKVhbLkSnGYFO8ipEi/uHzBW6RncKYJQooY
	WFcWRBPyT+Y10+azgSolBdeTCvgMKs027/hlHOnx1n1MNFmcuiU9R0c0Q2hvL3h0wiMz
	+ZT9acaY3NYUIkcrS20RUdLQAcxvYxGVoVTVtej70+VKD1ROYSRTqKWH3y9tRCKfUO0w
	4K0A==
X-Gm-Message-State: APzg51DjwCSLvh0ILkgsih7i4NI4PeI91KogR6LlPEuPI2T3R2l2nN7P
	0WzkW25BIIhXH1lJDAGjQuy0Lf0A24c=
X-Google-Smtp-Source: ANB0Vdaab5iLus5CBR0R3ayAV//Oq69EQ0a9KRzq/j8dmWZPrfsxNYCduBPqAvPxZbvGbkb2QLM7rQ==
X-Received: by 2002:aca:5f8b:: with SMTP id
	t133-v6mr3548060oib.194.1534991860553; 
	Wed, 22 Aug 2018 19:37:40 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.119.250])
	by smtp.gmail.com with ESMTPSA id
	n84-v6sm1844493oif.23.2018.08.22.19.37.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 19:37:40 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 08:07:28 +0530
Message-Id: <1534991850-3341-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534991850-3341-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534991850-3341-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH resend V2 2/4] libsndfile1: CVE-2017-14634
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
X-List-Received-Date: Thu, 23 Aug 2018 02:37:39 -0000

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


