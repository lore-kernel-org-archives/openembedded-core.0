Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id A5C3A91697
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:18 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id a33so3920296pgm.5
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vdfIz9s/fH6/ksMfaoPYxo2bhk4nsnyEgldgXGRmqeM=;
	b=WlsBMs64jMKBhdo+7n9HEObcXat9Z8W5XRdmdJh/QqMGHr5GS+EG/tJ52qtQkBOXxI
	12ggmHSmsM8G2QNKG04eaSD0xpgZeX3rVrXxIeWfBQYkMR7sAglKDc29tRvmHOSGRP3i
	GkFw0AQx9dzvzm85+Rwr0tXS3ZFLj7y6PXVBz6mMap/wDUhVXkk6mdauNkWbCpMYcyJw
	AAeneqb1bvdlLZy1Xv9VtFVj1wpuIhNEfrCe7BuLwMr7qLe4YylUaTvcDVA43BNmIJec
	33CzG+3gRZxFEBtoQV61fHi2CevGaOCrUjzlIw9UN0iKhKaYkIf7hucxwj3heNaTi9R2
	Xmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vdfIz9s/fH6/ksMfaoPYxo2bhk4nsnyEgldgXGRmqeM=;
	b=G57mjDO1VXZEHiE18H/VMnWRgLy3WINhzW3Kx7jWqpHPY0GtoFVjYfH5hcA0t/Zh1T
	uDoMG90V2n8gcalhF5j8stunWF11eaQjkl2lwiCEDIbtU27DGas4qURCht0D/OSA70nS
	LSPRFlQ+7tmyvyGiPPHyQwVn1JNlIiAHZQLVjJlKFV21DC8d7RwDGaELd+gwKxyEHUEm
	zvVwiZ7n0MXq0Wv4AURf/6DZlHF5hSjqP2WkFRheKmphc++i82hp0iR0H/7iHtJ87yN4
	ceJHlOoG/9lWWdcO3zj7ssq6CPWPrR3p7dhrHtjWMGYIlvSa4R2voPQ3vngKBT4Dqjeg
	WMoA==
X-Gm-Message-State: APjAAAV1CRvrQngjlJK8jcrP2jMbm2NRTSxBJMfIA9ZTCNoDAZqsdrsf
	9NtCr745b1d6OM3pwymHKDasr8kE
X-Google-Smtp-Source: APXvYqxy8crENJRyC7OR6W9Vw316RdrSnpGhsMwJI9Bgnho7NMNv4lF4tUmPDAQr5BbB0dq4mUZteg==
X-Received: by 2002:aa7:864f:: with SMTP id a15mr12513818pfo.136.1580055919768;
	Sun, 26 Jan 2020 08:25:19 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.19
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:54 -0800
Message-Id: <a63d59f64a2d1f450a7639426cae8e0373a2d764.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 29/29] sanity.bbclass: Move sanity_info from conf to cache
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:18 -0000

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/sanity.bbclass     | 2 +-
 meta/lib/oeqa/buildperf/base.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 9429202dca..3b41c69ef6 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -919,7 +919,7 @@ def check_sanity(sanity_data):
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


