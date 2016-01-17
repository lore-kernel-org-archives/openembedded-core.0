Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 612527705D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:48 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id n128so142177180pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wSZhI4EP0JGuHmBZYcjYCt3KrBLIUig0QlUW8weJdMk=;
	b=0SGiNKha6Tyuap0Umzr9kf6sLDMDvvAHmMsgM+UAip89xsi5E2Y0aisSp2S54uiaEG
	aQzRMsRZcRTpBr4a3PXzsiw261k9wdN0oz3voFLXiFgSyEX5UZ41QXnEdZNAO0d3a5G9
	QPiJlBR+CVXvkWgog4JVvfVXt1rKDCCPJmy+EHwqikzQ4DHuzBYO617uIVQrnIFwJPkp
	pNcFNEIxPWvXJeFWbjT+vbmJLH6A1ttXVDaVIPZCkzi/Hkrk2K94B+ttzDyX6rAXbKcQ
	mZtt99uazXYMQMA0oVgo78wFstP6okh3jjwk+fH22ULlwwMI+4/P6E4uD6dlGBsSfqnT
	+p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=wSZhI4EP0JGuHmBZYcjYCt3KrBLIUig0QlUW8weJdMk=;
	b=OjHzSyqQ27gjV2+Qx+79HcYVgVHOWWWD5gHnY5xS8FeVZqJsXn2l1LnWA6sxzeRvYW
	V59fwAT/7nTVtn3EDmVokPmhMbUJ8LehYwsMoEjCeDw19g8RaAwMV53DihQcxEXdsHcn
	jWrw0v858nrW/HJZPZH+iri3caC4AObkcwr6Hs0AnO0tRV+CFgjqvSqjB0d3gRDD/mxm
	le3LCAHnRWBe6xbQ2BMjIPOLg+ojFTLG9bH5AO+GjBfbAH/6xK3HzdXv2OfymR2zrcim
	4L2i+EUey8x3FtY+mGOB50IxaxPgpJdpuTtAEgsrlMTLQCNU/8TWiMAA9pVwd4Ty0q19
	jWhw==
X-Gm-Message-State: ALoCoQkr+QxA36Kbb+6H8lpKHWTgCI7Z8Gn9r3pkXxSiJvjzwwoNefr7wRJp9zu4i8PMevmf+jYs4+EoCKDtFAKLClVFtGI/OA==
X-Received: by 10.98.72.200 with SMTP id q69mr28088927pfi.159.1453030669386;
	Sun, 17 Jan 2016 03:37:49 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:48 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:28 -0800
Message-Id: <38a3fc3dcf21625a5c5e968a82b400c736deb6f0.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 55/73] apmd: Fix build with musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:48 -0000

Fix error like below
| apmd.c:372:41: error: use of undeclared identifier '__WCOREFLAG'
|                                 status = __W_EXITCODE(0, SIGTERM) | __WCOREFLAG;
|                                                                     ^
| apmd.c:392:41: error: use of undeclared identifier '__WCOREFLAG'
|                                 status = __W_EXITCODE(0, SIGTERM) | __WCOREFLAG;

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/apmd/apmd/wexitcode.patch | 26 ++++++++++++++++++++++++++
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb     |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-bsp/apmd/apmd/wexitcode.patch

diff --git a/meta/recipes-bsp/apmd/apmd/wexitcode.patch b/meta/recipes-bsp/apmd/apmd/wexitcode.patch
new file mode 100644
index 0000000..c5faa85
--- /dev/null
+++ b/meta/recipes-bsp/apmd/apmd/wexitcode.patch
@@ -0,0 +1,26 @@
+Define non-posix W* funcitons
+
+C libraries like musl dont define them
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: apmd-3.2.2.orig/apmd.c
+===================================================================
+--- apmd-3.2.2.orig.orig/apmd.c
++++ apmd-3.2.2.orig/apmd.c
+@@ -55,6 +55,14 @@
+ #define MINIMUM_RATE_CALC_TIME  120
+ #endif
+ 
++#ifndef _POSIX_SOURCE
++
++#define	__WCOREFLAG  0200
++#define __WCOREDUMP(x)  (_W_INT(x) & __WCOREFLAG)
++#define	__W_EXITCODE(ret, sig) ((ret) << 8 | (sig))
++
++#endif
++
+ /*
+  * For the verbosity level feature to be useful,
+  * we rely on the fact that syslog.h assigns adjacent
diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
index 9492c69..a932375 100644
--- a/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
+++ b/meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
@@ -13,6 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=tarball \
            file://legacy.patch \
            file://libtool.patch \
            file://unlinux.patch \
+           file://wexitcode.patch \
            file://init \
            file://default \
            file://apmd_proxy \
-- 
2.7.0


