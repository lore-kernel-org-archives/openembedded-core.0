Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16B3C43217
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:21 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.16632.1667744301214995771
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yfFAaBGm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id l6so8385542pjj.0
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4UHWedPmUt/kubi54M5W4t7Hjmojl8r8sJ2YVG1frw=;
        b=yfFAaBGmtmSwRYOod4VVTydxa4W3KBwuShnWhpLU2UoLGZpW+njazTXX3nJ3KpLMbs
         +MVd2OFYq/wFouRtVCe/y1GYbRKc6rC25+MbKw/P3s6fgR+Ie7lLhzuUMaRYFP78jjhk
         nFb5EkhRAlH73wz6TrBvrD1PDsvaLNDld2pkAhGFNFylO15MnrmANfL3oOPnyTd8eeho
         LDNYF5a8j6bT9wypT7jHR0POmorlXJUYCZTqh9X49Z8xAGCXfVpABzqe9gvrwe1aOP2q
         2Ex5qq1QF+hLALVgroFqjLAAee9ccMt82yzY4m7dNLruWZfb3zqJuYznMNxT8v/9DzMx
         Vyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4UHWedPmUt/kubi54M5W4t7Hjmojl8r8sJ2YVG1frw=;
        b=LVBK5D7pos93c23dXjpW/ykSyBkrBUWT8nt0NsGO8U4uk+WL5R95JKtigRKHOO8GQu
         To8ZwUXPp80GSMEaY/xiUutKmcBU+7EsjP6xm3wBuQHjyZdNy/jrK4Xx+ZixUuDfN6sT
         l9I62SSOcomd6opUZm5RCMWn6h0Sj3m95E8priiI5WyRnY7JxvZfnOn2Rd7fgWM423jO
         WowbxWBnt0h6VoqT8h77q7SQ4VqMMd2T21c+mUGO+9PYi6/426MKIOMb1cAOqyN7mGME
         YQZBWWSYW/lZdaliYTj72yE96tEJOdnvvqC4/HCZ+TupdBi+lm6QDlbCbpIdmRLEUHWE
         CGNw==
X-Gm-Message-State: ACrzQf3Q/RnSSlAicOpZEGfhbS+IYHKT8QzLTCst1B44pUXUlZFWTZRd
	yIWkNWR2cRs7cnfpVfVvfEid+8/bC6CjyY4t
X-Google-Smtp-Source: AMsMyM7Kats5TToVKCuHnwnfdk2JseyGQRslgVcuKa98j64bFa+avub6EECoYMJJwyZEH39Bn0d2ZA==
X-Received: by 2002:a17:90b:4f8a:b0:213:48f0:296f with SMTP id qe10-20020a17090b4f8a00b0021348f0296fmr63497372pjb.140.1667744300284;
        Sun, 06 Nov 2022 06:18:20 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 25/34] wic: honor the SOURCE_DATE_EPOCH in case of updated fstab
Date: Sun,  6 Nov 2022 04:17:08 -1000
Message-Id: <4d3f43fe06186b6580395a161fdbc4470b8aab62.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172793

From: Sergei Zhmylev <s.zhmylev@yadro.com>

In case user requested to build a binary repeatable package,
it's required to honor the SOURCE_DATE_EPOCH environment
variable. So forcefully set mtime inside all the routines
which modify fstab in case it is updated.

Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 99719a3712a88dce8450994d995803e126e49115)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/partition.py             | 7 ++++++-
 scripts/lib/wic/plugins/imager/direct.py | 3 +++
 scripts/lib/wic/plugins/source/rootfs.py | 2 +-
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index e50871b8d7..bc889bdeb9 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -294,6 +294,11 @@ class Partition():
                 f.write("cd etc\n")
                 f.write("rm fstab\n")
                 f.write("write %s fstab\n" % (self.updated_fstab_path))
+                if os.getenv('SOURCE_DATE_EPOCH'):
+                    fstab_time = int(os.getenv('SOURCE_DATE_EPOCH'))
+                    for time in ["atime", "mtime", "ctime"]:
+                        f.write("set_inode_field fstab %s %s\n" % (time, hex(fstab_time)))
+                        f.write("set_inode_field fstab %s_extra 0\n" % (time))
             debugfs_cmd = "debugfs -w -f %s %s" % (debugfs_script_path, rootfs)
             exec_native_cmd(debugfs_cmd, native_sysroot)
 
@@ -353,7 +358,7 @@ class Partition():
         exec_native_cmd(mcopy_cmd, native_sysroot)
 
         if self.updated_fstab_path and self.has_fstab and not self.no_fstab_update:
-            mcopy_cmd = "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
+            mcopy_cmd = "mcopy -m -i %s %s ::/etc/fstab" % (rootfs, self.updated_fstab_path)
             exec_native_cmd(mcopy_cmd, native_sysroot)
 
         chmod_cmd = "chmod 644 %s" % rootfs
diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index da483daed5..3e766972b4 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -149,6 +149,9 @@ class DirectPlugin(ImagerPlugin):
             self.updated_fstab_path = os.path.join(self.workdir, "fstab")
             with open(self.updated_fstab_path, "w") as f:
                 f.writelines(fstab_lines)
+            if os.getenv('SOURCE_DATE_EPOCH'):
+                fstab_time = int(os.getenv('SOURCE_DATE_EPOCH'))
+                os.utime(self.updated_fstab_path, (fstab_time, fstab_time))
 
     def _full_path(self, path, name, extention):
         """ Construct full file path to a file we generate. """
diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index fc06312ee4..e29f3a4c2f 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -224,7 +224,7 @@ class RootfsPlugin(SourcePlugin):
             if part.update_fstab_in_rootfs and part.has_fstab and not part.no_fstab_update:
                 fstab_path = os.path.join(new_rootfs, "etc/fstab")
                 # Assume that fstab should always be owned by root with fixed permissions
-                install_cmd = "install -m 0644 %s %s" % (part.updated_fstab_path, fstab_path)
+                install_cmd = "install -m 0644 -p %s %s" % (part.updated_fstab_path, fstab_path)
                 if new_pseudo:
                     pseudo = cls.__get_pseudo(native_sysroot, new_rootfs, new_pseudo)
                 else:
-- 
2.25.1


