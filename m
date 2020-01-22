Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id AA4E791454
	for <openembedded-core@openembedded.org>;
	Wed, 22 Jan 2020 05:48:20 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id u63so1696853pjb.0
	for <openembedded-core@openembedded.org>;
	Tue, 21 Jan 2020 21:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Yb0a9GFqgBIduL6TmqMpG81mTt/LgmddeehLudLiA/U=;
	b=ZMbbNmAZy4k2EOP/KhcHu6QUbk5RoH3HzQJtV+O/9pOas+mAkUMEAcyXLvJE9cZ0Wk
	fPSZ5U4pqTw29Bcksca1wG36OhrVz+7fsm5HIW2Dkx+9dfc8IS3HeG/tVdDg9wltk9di
	iVU997els0QwwEh8hzGTkPsFMb4P8t8idjn6JDKzZB5fs3821jb0fuIBfpKjjCSAPwmY
	oRP905I6E2iXBdkZxARr2CZ1P5Zoumu1xRRGRxki9MLvIytCionUdjOfrDIBDLVVn3Y5
	xo/zXDILoInbmR9N0njnueSPgY/gZuveEylfd87Y2F84hhVI2slkJ3oyqOK9j/Br3k9s
	xgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Yb0a9GFqgBIduL6TmqMpG81mTt/LgmddeehLudLiA/U=;
	b=sZsA2bbQpv9SGG8UACr09OH4YD8vTaiTIjHcoWYqJ5zgm7rWDAvPg8RENsieTpEaMG
	bWG1Z1fm+kKqlBVCEP7Tecr43pX/ny4t1+Ygjr+EZLJJzRp2X12qghjQWc6Yxw/Vu4xk
	/eWCBcnJfbpwDRdojH4KfD9JAyJYU7Q7YUaXkaInInFx8raWqLNOBlIuBLciRcGR87e0
	L7camMvGW9cruhLCFuPo8KgGI7fHKUdkr5LteaYe0+eXgda8SrByjcCnnZoiGZmdvTO+
	OQj61qM5ZtmI5ymgR9dmZKM2I7pIbCtLb1/lcXepiLwrY2ls8intg/p3vm1eLTSNoDZw
	ekXg==
X-Gm-Message-State: APjAAAWt7mSMP3MXVzo4U1YJNOWebfnleE/P3It1Xvzv1Kgg5iPooBjC
	M2vORmlaf4lHfQK7jaHVE/k2Po0e
X-Google-Smtp-Source: APXvYqxEa2JPRp202vzDvLQIa69NY+iMKyRHu+BwVIen8lJjlA/4PZ90OxKtf+JMDf6Uej4QNFFDrw==
X-Received: by 2002:a17:90b:8b:: with SMTP id
	bb11mr1144197pjb.27.1579672101641; 
	Tue, 21 Jan 2020 21:48:21 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:682c:76b9:6d8a:bbd2])
	by smtp.gmail.com with ESMTPSA id p18sm1413247pjo.3.2020.01.21.21.48.20
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 21:48:21 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 21 Jan 2020 21:48:08 -0800
Message-Id: <f1a609e7176a37e7e5f86f0b786f7da915085f83.1579672034.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579672034.git.akuster808@gmail.com>
References: <cover.1579672034.git.akuster808@gmail.com>
Subject: [zeus 03/11] sanity.bbclass: Move sanity_info from conf to cache
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
X-List-Received-Date: Wed, 22 Jan 2020 05:48:20 -0000

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

Since this file is written during recipe parsing, having it in the
${BUILDDIR}/conf directory, which is covered by an inotify watcher,
will trigger a re-parse the next time bitbake is run and the resident
bitbake server is enabled. This causes the sanity_info file to be
updated again, which triggers a new parse the next time bitbake is run
ad infinitum. Moving it to ${BUILDDIR}/cache should avoid this.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f98103b548aa7dba6b1be6c8e02ef41858a8e85c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/sanity.bbclass     | 2 +-
 meta/lib/oeqa/buildperf/base.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9d0c784032..936fe913b4 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -927,7 +927,7 @@ def check_sanity(sanity_data):
     last_tmpdir = ""
     last_sstate_dir = ""
     last_nativelsbstr = ""
-    sanityverfile = sanity_data.expand("${TOPDIR}/conf/sanity_info")
+    sanityverfile = sanity_data.expand("${TOPDIR}/cache/sanity_info")
     if os.path.exists(sanityverfile):
         with open(sanityverfile, 'r') as f:
             for line in f:
diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index 3b2fed549f..5f1805d86c 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -462,7 +462,7 @@ class BuildPerfTestCase(unittest.TestCase):
     def rm_tmp(self):
         """Cleanup temporary/intermediate files and directories"""
         log.debug("Removing temporary and cache files")
-        for name in ['bitbake.lock', 'conf/sanity_info',
+        for name in ['bitbake.lock', 'cache/sanity_info',
                      self.bb_vars['TMPDIR']]:
             oe.path.remove(name, recurse=True)
 
-- 
2.17.1


