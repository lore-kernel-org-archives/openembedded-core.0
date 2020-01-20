Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
	[209.85.210.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8A3957FC09
	for <openembedded-core@openembedded.org>;
	Mon, 20 Jan 2020 06:38:26 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id q10so15326330pfs.6
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 22:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Yb0a9GFqgBIduL6TmqMpG81mTt/LgmddeehLudLiA/U=;
	b=NpqEyZj4feJ7GNjqGh+w4tzGMEzPvMoJrx5i2UG+M5Af/zO7vP03E6gzd8/PbZKV16
	oteqq9JAGjsACuF/W0nOiHqPV3+M6efrTON7xm06lAjtkHEhJIpXrSx5zTobIZBg1ttD
	1AFQPx+oT38ImqNcAEOqphTjmcGhKSZTMT3fBiVHmILXW3q0WLm9QkBGX+OSR5zsc/eV
	D68KRLtrJTE2TQoiSqayiFc6q4XOSt4VnaRRDQ19FI0eiq8Bm/2Ul9abHAHYX9mPphdm
	OoElwgz4Fm0fuCs2VL0+18iyVIr+F83XkLWuYpoPRNejXhrkmsE1068LgeM/WKVtBAMn
	ZSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Yb0a9GFqgBIduL6TmqMpG81mTt/LgmddeehLudLiA/U=;
	b=Z/SK9If9Dl6arwS7/0PgCbOaDlt7315Jctz2JQpQ2KZQ1tBfxW62YXOhSnB1X7I0mn
	VO0nzTF0TdGWXXTXx3fH3TOrWr80DXukIKAAyg+hAYH9wHXVasJLKCaSg0HWUqVRaQ/+
	VVwQyLa4ra2Jy6ASgum1fmrhP6xPhelObBxq+XK5F9HZvnTpOekuMF/nabkY01lM5iYr
	3dU55ncMz8rahya5sumiXody/8y7+S9Tkha8F/JHgnpk850t9RbOHl0VmzbO0xV9B6mc
	MHgnVxYFR4jx6yBq8XMzv5i9BK7xyCMMZVXRYLuzJe+1jAZ4K5jdfUKZZo9aBDOgqPFc
	Ar5Q==
X-Gm-Message-State: APjAAAVLnSMbnreKoecsYYOHQA6vt+EROxxEsGbv7M5D5TBcswyXtPVt
	QLk9CUb5qeBNpGzrzexbabuOEiLa
X-Google-Smtp-Source: APXvYqyMJPpVdSZcxVVL3ue69i1sw+UouLyJUfWHbbDrazVhHlQOJjVrrXB1m3GcORDjjXSgiKvvUA==
X-Received: by 2002:a62:ac08:: with SMTP id v8mr16067464pfe.83.1579502307340; 
	Sun, 19 Jan 2020 22:38:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:b5ff:6d3b:2415:6395])
	by smtp.gmail.com with ESMTPSA id
	p28sm36310484pgb.93.2020.01.19.22.38.26
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 22:38:26 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 22:38:19 -0800
Message-Id: <f1a609e7176a37e7e5f86f0b786f7da915085f83.1579502114.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579502114.git.akuster808@gmail.com>
References: <cover.1579502114.git.akuster808@gmail.com>
Subject: [zeus 3/5] sanity.bbclass: Move sanity_info from conf to cache
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
X-List-Received-Date: Mon, 20 Jan 2020 06:38:26 -0000

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


