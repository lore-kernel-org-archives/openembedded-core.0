Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D334CC433EF
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 10:20:38 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.27108.1652696437716029783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 03:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ApdITs3L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id w4so19799474wrg.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 03:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VF0Q/aM6OY/uLd/4R+9qeI9LTwLSJ9yFQ0oWan04gSA=;
        b=ApdITs3LeFr+AQYHdDIH7ynNGtKwJ1SqJCwCtaEHUg+TJfVxVgb+CDw2undJKvgy3r
         fy71LJQkXBDlRfcN16uDBBwDJlAG98VYhQhkFc7sgfeptnhHvsC+D71L2V5yIE2/r/G7
         9gxhRVna0fOIbYd7/sH95uXZOSajB60JKWd2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VF0Q/aM6OY/uLd/4R+9qeI9LTwLSJ9yFQ0oWan04gSA=;
        b=kuZl6sPrc0C7Izw/BcyxjgTp/7w0sMhAH29nO5Z+DtfIcDGLdkXTK9Hp6fTJGTDQGZ
         kOHcdNmbWCLjI7xbYCSiZHiryNF6cypVDugzN86r9F50BHVmBTRlaZZaGUWwPpG0KtKL
         x9CYh0M5c5l3lWsnz6udbEMcPGEG+VJ/9/hDPut26Sl37Rgi5WlDJcN1wOXEW8gIF/Dm
         AF0z8hcdDMxezxyT7Z4/x6di8+eyBpUB+jtiA4Muuajbf2K4FvZjvvg/KTLAZVxqKhBW
         g4QF2IDj+IcnOLGHWznHUuv1X/o8eCYiQUhui1Mu2n7BHVN9arwhKpE3FnP/t0X5+V40
         vcxA==
X-Gm-Message-State: AOAM531nJPkBihgsm4jQgZGefA+f9w/HiJId0Iuf/X2R7/6si3qMFtWD
	GTRyUp3D4p8TwilXkuE5zvz8QmzRFKVzjpxv
X-Google-Smtp-Source: 
 ABdhPJxCL+rmm0oVLf6t+FTCEMm1A1/33xhtlncSyU7Q5XHM9MZOWh6SK0gvOq3iNcvZx4+UW7Dw2Q==
X-Received: by 2002:a05:6000:16c6:b0:20c:f5f2:9b24 with SMTP id
 h6-20020a05600016c600b0020cf5f29b24mr9955568wrf.523.1652696436029;
        Mon, 16 May 2022 03:20:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:907b:5576:ab63:2b17])
        by smtp.gmail.com with ESMTPSA id
 d19-20020adf9b93000000b0020d03b5c33dsm4645895wrc.46.2022.05.16.03.20.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 03:20:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] staging: Fix rare sysroot corruption issue
Date: Mon, 16 May 2022 11:20:34 +0100
Message-Id: <20220516102034.444690-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 10:20:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165672

We've seen failures on the autobuilder in oe-selftest where things which should
be in the sysroot aren't. The exact steps to reproduce the exact failure are
elusive and probably hash equivalance dependency but this set of steps does
reproduce corruption which is probably of the same origin:

Add DISTRO_FEATURES += "systemd"

  bitbake dbus

Remove DISTRO_FEATURES += "systemd"

  bitbake dbus
  bitbake dbus -c clean
  bitbake dbus -c configure

Add DISTRO_FEATURES += "systemd"

  bitbake quilt-native
  bitbake dbus -c populate_sysroot

Remove DISTRO_FEATURES += "systemd"

  bitbake dbus -c compile

Where dbus will now fail as the compiler was no longer in the sysroot.

This works by clearing x11 and other values out of DISTRO_FEATURES so the x11
dependencies are removed from the sysroot. The configure stamp remains valid so
when the original configuration is restored, it becomes valid again but a load
of the sysroot disappeared and build failures result.

Fix this by removing stamps when we remove things from the sysroot.

Depends on a change to bitbake build.py to add the clean_stamp API.

[YOCTO #14790]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 9fc8f4f2839b..8372a4574ace 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -404,7 +404,9 @@ python extend_recipe_sysroot() {
     # All files that we're going to be installing, to find conflicts.
     fileset = {}
 
+    invalidate_tasks = set()
     for f in os.listdir(depdir):
+        removed = []
         if not f.endswith(".complete"):
             continue
         f = depdir + "/" + f
@@ -414,6 +416,28 @@ python extend_recipe_sysroot() {
             sstate_clean_manifest(depdir + "/" + lnk, d, canrace=True, prefix=workdir)
             os.unlink(f)
             os.unlink(f.replace(".complete", ""))
+            removed.append(os.path.basename(f.replace(".complete", "")))
+
+        # If we've removed files from the sysroot above, the task that installed them may still
+        # have a stamp file present for the task. This is probably invalid right now but may become
+        # valid again if the user were to change configuration back for example. Since we've removed
+        # the files a task might need, remove the stamp file too to force it to rerun.
+        # YOCTO #14790
+        if removed:
+            for i in glob.glob(depdir + "/index.*"):
+                if i.endswith("." + mytaskname):
+                    continue
+                with open(i, "r") as f:
+                    for l in f:
+                        if l.startswith("TaskDeps:"):
+                            continue
+                        l = l.strip()
+                        if l in removed:
+                            invalidate_tasks.add(i.rsplit(".", 1)[1])
+                            break
+    for t in invalidate_tasks:
+        bb.note("Invalidating stamps for task %s" % t)
+        bb.build.clean_stamp(t, d)
 
     installed = []
     for dep in configuredeps:
-- 
2.34.1


