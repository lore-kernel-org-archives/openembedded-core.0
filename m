Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D325C64ED6
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 17:03:16 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.69611.1677430992870919457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 09:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=VhGboYGv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id ky4so4431742plb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 09:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u19ySk5mzWwdtnN97PsRUuXvNnggpXfKO+LxfPiPQk8=;
        b=VhGboYGvIYRV9NCBGxlVU0M3HXDyRjIoyZjp3M2hcLq/32j56FVnfESyt6wzPkmjx1
         Dxvbm+X1cT3mSDeGqExBxa4P7R+JlYg+kk0TjdDnArrVuu3I2rpUbS8IZSME7YmJ7XMJ
         //AJCKvSF2OdRY756Myoa/R68ItpMY4+w/nfEdNkwRsWsd64GzGGteIBlr9IkD+EzEEl
         4NvOfL4M108LDbnH96gbFXlmj690Fkl8rlvV/ju0nAlxrzZl4B+7xXAAFXPvUwzzOZV6
         wne+v2V8UKQLSCc8T7CkkpFM+Jgwlk3lLyhWm5BE7oQYLnSXPhGSlEELeW0zI7o+2ihB
         TPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u19ySk5mzWwdtnN97PsRUuXvNnggpXfKO+LxfPiPQk8=;
        b=yYMPovJNYkBUWTfzHPbzjkA3gR0g8cLjI7OH65RKbAcEYd28u3X8Ieikrd6w/zDKZU
         7S8SYePXDy9I4X61pz2GtTUrgg4dX6ugEEsoyojri26V3v/AztwR1hm/tYvAh1MlVVZT
         WojzLX4cpiSeCont59QGChaVuQE2bK+1GM8InLpNNKxmIsRL7FFAhT8fiKXh9VLNGMiM
         y5qCyQF3/bwLiCEVt3yqPOVFZa5jTpOX4p8FmYAYkXWtpQGj6DENGnV2pzzCdha1hjad
         kAmW3FrFZyoOfConROz/MUtfe/BIZ5E+7URahE+z5DSb3ont2sl7e9AiZ4sbhzMT+b+R
         9G3w==
X-Gm-Message-State: AO0yUKXfoqNBTeHPoh8YQnIdkcl2EGczOn3SpYoOZkZv4GGKEdz1GSO0
	tQZMHDke7Q/bEdQZV7puSyJ59JfvnGb0cQhEdlQ=
X-Google-Smtp-Source: AK7set+8jDz8NRF+diB1IXXCpvd5QuFro3hUoewgIu3oWo07hN8kcTGGQYcrHdSDFaMQtGP3gU24BA==
X-Received: by 2002:a05:6a20:3d17:b0:cc:75b8:7cba with SMTP id y23-20020a056a203d1700b000cc75b87cbamr10717467pzi.43.1677430991890;
        Sun, 26 Feb 2023 09:03:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a63af59000000b004f1cb6ffe81sm2500856pgo.64.2023.02.26.09.03.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 09:03:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 23/28] lib/buildstats: handle tasks that never finished
Date: Sun, 26 Feb 2023 07:02:19 -1000
Message-Id: <51e5e085400bb818d43ad82ffcf8548665bbd1d0.1677430770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677430770.git.steve@sakoman.com>
References: <cover.1677430770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 17:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177761

From: Ross Burton <ross.burton@arm.com>

If a task is aborted the buildstats file isn't complete, so calculate
when the build finished and use that as a end time.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 23ebaec476dc46aebe5997f025661137f3e341bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/buildstats.py | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index 3b76286ba5..fa94c65539 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -79,8 +79,8 @@ class BSTask(dict):
             return self['rusage']['ru_oublock']
 
     @classmethod
-    def from_file(cls, buildstat_file):
-        """Read buildstat text file"""
+    def from_file(cls, buildstat_file, fallback_end=0):
+        """Read buildstat text file. fallback_end is an optional end time for tasks that are not recorded as finishing."""
         bs_task = cls()
         log.debug("Reading task buildstats from %s", buildstat_file)
         end_time = None
@@ -108,7 +108,10 @@ class BSTask(dict):
                     bs_task[ru_type][ru_key] = val
                 elif key == 'Status':
                     bs_task['status'] = val
-        if end_time is not None and start_time is not None:
+        # If the task didn't finish, fill in the fallback end time if specified
+        if start_time and not end_time and fallback_end:
+            end_time = fallback_end
+        if start_time and end_time:
             bs_task['elapsed_time'] = end_time - start_time
         else:
             raise BSError("{} looks like a invalid buildstats file".format(buildstat_file))
@@ -226,15 +229,33 @@ class BuildStats(dict):
         epoch = match.group('epoch')
         return name, epoch, version, revision
 
+    @staticmethod
+    def parse_top_build_stats(path):
+        """
+        Parse the top-level build_stats file for build-wide start and duration.
+        """
+        with open(path) as fobj:
+            for line in fobj.readlines():
+                key, val = line.split(':', 1)
+                val = val.strip()
+                if key == 'Build Started':
+                    start = float(val)
+                elif key == "Elapsed time":
+                    elapsed = float(val.split()[0])
+        return start, elapsed
+
     @classmethod
     def from_dir(cls, path):
         """Load buildstats from a buildstats directory"""
-        if not os.path.isfile(os.path.join(path, 'build_stats')):
+        top_stats = os.path.join(path, 'build_stats')
+        if not os.path.isfile(top_stats):
             raise BSError("{} does not look like a buildstats directory".format(path))
 
         log.debug("Reading buildstats directory %s", path)
-
         buildstats = cls()
+        build_started, build_elapsed = buildstats.parse_top_build_stats(top_stats)
+        build_end = build_started + build_elapsed
+
         subdirs = os.listdir(path)
         for dirname in subdirs:
             recipe_dir = os.path.join(path, dirname)
@@ -244,7 +265,7 @@ class BuildStats(dict):
             bsrecipe = BSRecipe(name, epoch, version, revision)
             for task in os.listdir(recipe_dir):
                 bsrecipe.tasks[task] = BSTask.from_file(
-                    os.path.join(recipe_dir, task))
+                    os.path.join(recipe_dir, task), build_end)
             if name in buildstats:
                 raise BSError("Cannot handle multiple versions of the same "
                               "package ({})".format(name))
-- 
2.34.1


