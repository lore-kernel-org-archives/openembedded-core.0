Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7A2605BA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 16:03:24 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id f206so28417063wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 08:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Wfi56MEAzMJMGh6jpkVJ8uYtcHMXbhtLiX1ROTSmObI=;
	b=a8aTvgvChgVE2Zhbb/2nEJBJxewX8v2Dl+OmNTSzMYIjK1uSyGkZ4Rw70+pTLmqv0H
	8zJiYHMwQgsuS5B2nevMt3Lx7aAr+gwR0J67E2idZQam9JWLmcSt4bt//05dLGaHoXt7
	RTT1Cu1Fd983OngjksRDkQ/K6uhW5ZZzFHHv6ZR3a1LsVQD5C7tzqdaSGpZaJn05f22T
	QTzL4anxMLhNSVHhMNrYQ5k5mE4xlIODCbQ1ytHLdTW+gGs3SH4Luwv0g7ig2+P6nEYI
	g2m0TNuOr/y+yA4TWZTBf9sL05S9wzo3z8j9kcRr3mi8yvIevoerCl4zkCdRLwSrSFqT
	I29g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Wfi56MEAzMJMGh6jpkVJ8uYtcHMXbhtLiX1ROTSmObI=;
	b=RbfQ9nYQ/0KHnf3oskDshh2Eo4T1zMvlMDh8JMoWs/1iIZ6lo67+4UHa2c8ZfymmMZ
	M3WjuNXd7TOU6/CfVEWuAM8T14Tl3672z3UKVYEIj8iyRjgczivjSh5VJnLy4QteWzyK
	cTrVhEWfEcuqfJHP3nopX5FjooDrqTWBA+VKlpsUVSzzt33fE3uDcvIgscG5lcOfALxZ
	o1xLN/WvrAR+f2BTIHrbOF0wp9A7acBCRFczUbH1fDcy0x1ANaocAdejPgXldDleL+2X
	1ZEGOhDgzz94gVT6z95Zdfs9kFF6iiC0yJ6nqHJO3uvAJO9EM0I0azlPtKErfeXGLBKw
	42lA==
X-Gm-Message-State: ALoCoQnGMPzj2m+kU7jb3xrk4l0pBqXq0fWVuUOihO76FfpPruA6p0+L5GgVzDYR8Z1wiHvVMkn1D/3YcI8c8Ij0Tj81/uVLYQ==
X-Received: by 10.28.55.209 with SMTP id e200mr5152944wma.2.1452009804747;
	Tue, 05 Jan 2016 08:03:24 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	a126sm4216719wmh.0.2016.01.05.08.03.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Jan 2016 08:03:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 16:03:20 +0000
Message-Id: <1452009800-7349-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] uclibc: disable parallel builds
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
X-List-Received-Date: Tue, 05 Jan 2016 16:03:28 -0000

There appears to be a parallel make race in uclibc:

 GEN /extra/locale/locale_collate.h
 xargs: ../..//extra/locale/gen_collate: Text file busy
 make[1]: *** [../..//extra/locale/locale_collate.h] Error 126

As uclibc is slated to be removed in the 2.1 cycle let's just disable parallel
building for now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/uclibc/uclibc.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index ff7d744..2b34c34 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -39,6 +39,12 @@ COMPATIBLE_HOST = ".*-uclibc.*"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+# There appears to be a parallel race in uclibc:
+# GEN /extra/locale/locale_collate.h
+# xargs: ../..//extra/locale/gen_collate: Text file busy
+# make[1]: *** [../..//extra/locale/locale_collate.h] Error 126
+PARALLEL_MAKE = ""
+
 # do_stage barfs on a CC with whitespace, therefore put the 'HOST_CC_ARCH' in
 # the CFLAGS (when building the utils).
 OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}'"
-- 
2.6.4


