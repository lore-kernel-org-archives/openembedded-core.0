Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5662A77D88
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:25:36 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id f102so2436678ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=k6wTkcCiqUiDuDHI5Z5iDjRDrcA9sE0m0QQBnY7WDtU=;
	b=T26ZE7wWbsFfep+rHomTx4QKWKLY865rADLITuB3JQCz9Gzw1EadUT8WevYxJqRslJ
	iQJ8oTjl+Jujn1W6EfzjvkMdY5uRGW0MCt3jN0IgC2XFYFPE8ez70BARzYo66A8GzB/E
	CQ5zg9CQOzVNO+9Gea0YB6MLJlHPhOoCQAsxywJpSGXzcOz230fyqnDOMxwYzPFk+eBz
	6HksrcXhvRMeoIqPODxULaSlW4TtzRDNWaRR0vJhrySqslmo5UDX8toqm9tp8/vGccuW
	Q7Le7yTi84mAIwv3v7FXhwTEcuZNAkl5WnEglnTosxYt0A84Uqf3ri3iX6M5yGjOS/pw
	yp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=k6wTkcCiqUiDuDHI5Z5iDjRDrcA9sE0m0QQBnY7WDtU=;
	b=t/gmO6XZopYsBwZymBqTZS5ss8rpD1sO7AqvLGIo7zymYCAQ27f0hcOCVI3U00NNnM
	lmf8ZhKMITneICOsjBZsPNJ2yaaXade7pIJsfFhJGT6lYVVyrZDbzeO1kF9x8tfC+fRn
	1JMFl4uhTYJvT3pSIRr2kn8u5ljWK7AhObxiSP6y2o+doaT8+penUMtQbMO/Mg1oFCvP
	+UXjNS7gLanJXgEZj0+EjAohLvYXQF0CfFIPRbxuBCH9I9NIj4htYGf873u92SgqMCpU
	mtf4lyDrBnUuV3SfTyOo62QZhvzEpCcDiJfhLvMhyEEiwGLiS3PT1JQlFq40lEplqlsG
	m/wA==
X-Gm-Message-State: AN3rC/7zYwuByJiCv+WZpno63HQ3BPjvhCHdPsj0QHhRRS30GznkISTr
	0Hsefs+mf5ZP6I5Q
X-Received: by 10.107.142.198 with SMTP id q189mr53842538iod.49.1493979938235; 
	Fri, 05 May 2017 03:25:38 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8E982.dip0.t-ipconnect.de.
	[93.232.233.130])
	by smtp.gmail.com with ESMTPSA id m41sm786759iti.0.2017.05.05.03.25.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 May 2017 03:25:37 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 12:25:25 +0200
Message-Id: <3271b1e944d47cf8e40dec219925959fe06b5981.1493979782.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.56e4687985cb836a3bd5be5472b8e1f028840858.1493979782.git-series.patrick.ohly@intel.com>
References: <cover.56e4687985cb836a3bd5be5472b8e1f028840858.1493979782.git-series.patrick.ohly@intel.com>
In-Reply-To: <cover.56e4687985cb836a3bd5be5472b8e1f028840858.1493979782.git-series.patrick.ohly@intel.com>
References: <cover.56e4687985cb836a3bd5be5472b8e1f028840858.1493979782.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] archiver.bbclass: do not cause kernel rebuilds
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
X-List-Received-Date: Fri, 05 May 2017 10:25:37 -0000

Adding or removing archiver.bbclass from a build configuration causes
rebuilds of linux-yocto-based kernels because of the
do_kernel_configme->do_unpack_and_patch task dependency.

This particular dependency can be ignored for the do_kernel_configme
sstate signature calculcation. Idea for the fix from Richard Purdie.

Note that building the kernel and adding archiver.bbclass later to
archive sources leads to do_unpack_and_patch running after
do_kernel_configme (because that already ran in the first build),
which might be problematic. This is independent of the change here.

The use case in YOCTO #11441 is to removed archiver.bbclass between a
production build with archiving enabled and builds via oe-selftests
without archiving. That direction is fine.

Fixes: YOCTO #11441

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/archiver.bbclass | 5 ++++-
 meta/lib/oe/sstatesig.py      | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index ea00ab3..647d2cf 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -442,7 +442,10 @@ do_deploy_all_archives() {
 }
 
 python () {
-    # Add tasks in the correct order, specifically for linux-yocto to avoid race condition
+    # Add tasks in the correct order, specifically for linux-yocto to avoid race condition.
+    # sstatesig.py:sstate_rundepfilter has special support that excludes this dependency
+    # so that do_kernel_configme does not need to run again when do_unpack_and_patch
+    # gets added or removed (by adding or removing archiver.bbclass).
     if bb.data.inherits_class('kernel-yocto', d):
         bb.build.addtask('do_kernel_configme', 'do_configure', 'do_unpack_and_patch', d)
 }
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index f087a01..b8dd4c8 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -20,8 +20,12 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
     def isImage(fn):
         return "/image.bbclass" in " ".join(dataCache.inherits[fn])
 
-    # Always include our own inter-task dependencies
+    # (Almost) always include our own inter-task dependencies.
+    # The exception is the special do_kernel_configme->do_unpack_and_patch
+    # dependency from archiver.bbclass.
     if recipename == depname:
+        if task == "do_kernel_configme" and dep.endswith(".do_unpack_and_patch"):
+            return False
         return True
 
     # Quilt (patch application) changing isn't likely to affect anything
-- 
git-series 0.9.1

