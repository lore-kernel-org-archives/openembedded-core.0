Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F338EC433FE
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:00:44 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.27927.1653314438056136453
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1yGRO90y;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id f21so1426823pfa.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+OaF9KpcMiwqvDT9lS/7b98nnKVkvzI2aLlT0Lki4To=;
        b=1yGRO90ywoJBBfie5UUFBPkvtxGTrMsNBmP/2+mymSx7/r1LSAgqmgtFJzueXXpEBf
         g1FYs+2OqiCSKFf0tOFloD8hCcD5n8SBwxLDZq1EuOirLUvWxYa7cgr0OwDB6gDQ40KC
         MMIj4VCuWhepwcbr+DEYs8bgIeeWUCuctEYO9RE6P2j5m05yq1tXR2ByiUjmjC3ui09g
         q1bCkBlLoXcwk7Dre8fH2620IyeDdPjQVzlKmdyH+asj7IoPNIVEzfKWsonQ6UKgqrNZ
         B4YrZYN3RjNNzLjuGI0495XyMQXTfwc0Yr9+bM+fF6suIZelCs4YyTMAcepICOyQC8ep
         XgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+OaF9KpcMiwqvDT9lS/7b98nnKVkvzI2aLlT0Lki4To=;
        b=qPwhw+qUQVV2hroKPdbw0ArVr2rSm/7r7rr10TfocG2aZqyUNdI7SC+KyLxnk+D98B
         DJYY0awOIsIxhE0/OjDir9/XISYfN75v739bPCv4Adv/469DFUVr6VJI9J7uZrtUpr4o
         VdGuB+K3IcmD3F6h2jDPghW0L4X+GrlPMxOjb020sxB+aQmpunjWoOZG5vQ11k6l9IiG
         2HBkCbBT/aPpejSFaNPJyZQFFyQp4pwG5wBUYSMpH+xBev4XWI6O7/sZ6D08k2DjojHk
         8WpbG9sQos0xv8pQbdOwRvzhU2dGZ3AgJypEX1FqitEcmgdBk/Mr2UluU7r0ohb8I1ii
         UifQ==
X-Gm-Message-State: AOAM533JgsUbWaQSX/JE6GqK4IwxtdnRzw79M0P4mEYGXqf3ke0r06Lt
	oswimHfcylzXsUpKKqnlvARaNYxb29hD3k1s
X-Google-Smtp-Source: 
 ABdhPJw0nB8ARAv9ji4b4nrvUSVBAxQ37phT3x1Y+IeoVnB5p+oOxfwOpJcL2zExVRm7Ut8Q5Fi9/A==
X-Received: by 2002:a65:5c48:0:b0:382:2c7:28e9 with SMTP id
 v8-20020a655c48000000b0038202c728e9mr20714869pgr.472.1653314436872;
        Mon, 23 May 2022 07:00:36 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m10-20020a637d4a000000b003c14af505fcsm4778952pgn.20.2022.05.23.07.00.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 07:00:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 8/9] staging: Fix rare sysroot corruption issue
Date: Mon, 23 May 2022 03:59:47 -1000
Message-Id: 
 <927837e29a1e79e8eeecaacc6de6b8f9e6aa6f70.1653313955.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653313955.git.steve@sakoman.com>
References: <cover.1653313955.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:00:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166031

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
(cherry picked from commit f4b1cecc82435b71135d7b65f6ea67be0e4f8c66)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/staging.bbclass | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 9fc8f4f283..8372a4574a 100644
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
2.25.1


