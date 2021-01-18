Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.3331.1611009464097294304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:37:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Hb5UUKNB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id o20so2622108pfu.0
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=v/El9FqxQFAX4U9QDBMNFyiWS90EhvYDUR2QHMgh4HM=;
        b=Hb5UUKNBIg0avyqLItqk2iH2kOlOt2w2WhbVwscLQDjoHK4kCvEmEhrIagzT+94VGH
         vZ8RMMO5+dsqvBC3+KJvhg2QPL6OdxjenIgfWnI1xTGOboZSeVVVCkvLKqUp5IISZJyr
         7gKP04mLEP/ytsQ2/NzH3h395JIv+xqU7iyuEbeiOrkBFdWQ5jg4MuG4atPvQQk1q3zj
         vZ/Pd9ErBRwLEppf+DX/iy3QpCAKptVrqvXXC0gGRKJ0EMoLXLecr+kJk+Kx8x2+IWro
         XlHKPniJy9sLkaFbOLqwuYnB7NstU5cHCbxCHBuSdqNwqQ8jK/kdZT3TaVaHQ6wxReYh
         RGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=v/El9FqxQFAX4U9QDBMNFyiWS90EhvYDUR2QHMgh4HM=;
        b=MIUUJ0z0Gue84r/0tWyUJBw6ZF15oOtPIHUkKfM4ytb+KyAxEOs6BZYZuB7K7gZne3
         FbxBAP69BExDCueoBIFL+uR8zBMwPChY1Jf7yBt8sfE9kNZVLwnlPeeNllZUUJB+7HBu
         IlKebE7IV/YGnCeA7JKlEHt4X0qQqfP6qgBZzDxXxxxOGF2ViXzU6fPjBwL+MWn1Xv9s
         14b/nZk4/RitbxEIca77z5WsTC+DJTCi1lfVWaZsVVOinPfo6cTwDAnH2WPQUzWJ2Ma+
         keBA/UPzHIydoMonwZzihDbT7eobomWqvJhPVRpOos2JdC0+Yay1XKslee+6H3F6El3q
         B2Pg==
X-Gm-Message-State: AOAM532rFONREBrnBtfG6lOMe3XF7ZFlH+sqH/DRjmydesjle0xpeJn7
	JsIKYnl0qJ5Y4z3lnynpV6gxPpyr2B6LGvj6Rz0=
X-Google-Smtp-Source: ABdhPJzntmM5RlEAqSA4hz9GHOgMPIMQKwWj10GL0p1jOzLOijQxoBJfkIsROPSmhpoQBvH5+8gF6g==
X-Received: by 2002:a63:101d:: with SMTP id f29mr1661098pgl.165.1611009463025;
        Mon, 18 Jan 2021 14:37:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.37.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:37:41 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/19] buildstats.bbclass: add functionality to collect build system stats
Date: Mon, 18 Jan 2021 12:36:16 -1000
Message-Id: <d01d149f6cb6fb86b8fafd1424bd37682aa9e76b.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Sakib Sajal <sakib.sajal@windriver.com>

There are a number of timeout and hang defects where
it would be useful to collect statistics about what
is running on a build host when that condition occurs.

This adds functionality to collect build system stats
on a regular interval and/or on task failure. Both
features are disabled by default.

To enable logging on a regular interval, set:
BB_HEARTBEAT_EVENT = "<interval>"
BB_LOG_HOST_STAT_ON_INTERVAL = <boolean>
Logs are stored in ${BUILDSTATS_BASE}/<build_name>/host_stats

To enable logging on a task failure, set:
BB_LOG_HOST_STAT_ON_FAILURE = "<boolean>"
Logs are stored in ${BUILDSTATS_BASE}/<build_name>/build_stats

The list of commands, along with the desired options, need
to be specified in the BB_LOG_HOST_STAT_CMDS variable
delimited by ; as such:
BB_LOG_HOST_STAT_CMDS = "command1 ; command2 ;... ;"

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit edb7098e9e0a8978568a45057c1c3ad2c6cacd67)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/buildstats.bbclass | 40 ++++++++++++++++++++++++++++++---
 1 file changed, 37 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
index 2590c60c63..43472f1988 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -106,14 +106,46 @@ def write_task_data(status, logfile, e, d):
             f.write("Status: FAILED \n")
         f.write("Ended: %0.2f \n" % e.time)
 
+def write_host_data(logfile, e, d):
+    import subprocess, os, datetime
+    cmds = d.getVar('BB_LOG_HOST_STAT_CMDS')
+    if cmds is None:
+        d.setVar("BB_LOG_HOST_STAT_ON_INTERVAL", "0")
+        d.setVar("BB_LOG_HOST_STAT_ON_FAILURE", "0")
+        bb.warn("buildstats: Collecting host data failed. Set BB_LOG_HOST_STAT_CMDS=\"command1 ; command2 ; ... \" in conf\/local.conf\n")
+        return
+    path = d.getVar("PATH")
+    opath = d.getVar("BB_ORIGENV", False).getVar("PATH")
+    ospath = os.environ['PATH']
+    os.environ['PATH'] = path + ":" + opath + ":" + ospath
+    with open(logfile, "a") as f:
+        f.write("Event Time: %f\nDate: %s\n" % (e.time, datetime.datetime.now()))
+        for cmd in cmds.split(";"):
+            if len(cmd) == 0:
+                continue
+            try:
+                output = subprocess.check_output(cmd.split(), stderr=subprocess.STDOUT, timeout=1).decode('utf-8')
+            except (subprocess.CalledProcessError, subprocess.TimeoutExpired, FileNotFoundError) as err:
+                output = "Error running command: %s\n%s\n" % (cmd, err)
+            f.write("%s\n%s\n" % (cmd, output))
+    os.environ['PATH'] = ospath
+
 python run_buildstats () {
     import bb.build
     import bb.event
     import time, subprocess, platform
 
     bn = d.getVar('BUILDNAME')
-    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
-    taskdir = os.path.join(bsdir, d.getVar('PF'))
+    ########################################################################
+    # bitbake fires HeartbeatEvent even before a build has been
+    # triggered, causing BUILDNAME to be None
+    ########################################################################
+    if bn is not None:
+        bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
+        taskdir = os.path.join(bsdir, d.getVar('PF'))
+        if isinstance(e, bb.event.HeartbeatEvent) and bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_INTERVAL")):
+            bb.utils.mkdirhier(bsdir)
+            write_host_data(os.path.join(bsdir, "host_stats"), e, d)
 
     if isinstance(e, bb.event.BuildStarted):
         ########################################################################
@@ -188,10 +220,12 @@ python run_buildstats () {
         build_status = os.path.join(bsdir, "build_stats")
         with open(build_status, "a") as f:
             f.write(d.expand("Failed at: ${PF} at task: %s \n" % e.task))
+            if bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_FAILURE")):
+                write_host_data(build_status, e, d)
 }
 
 addhandler run_buildstats
-run_buildstats[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed"
+run_buildstats[eventmask] = "bb.event.BuildStarted bb.event.BuildCompleted bb.event.HeartbeatEvent bb.build.TaskStarted bb.build.TaskSucceeded bb.build.TaskFailed"
 
 python runqueue_stats () {
     import buildstats
-- 
2.17.1

