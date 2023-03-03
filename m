Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7E5C7EE37
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.27631.1677860295058854966
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pRx7qnAp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id a2so3197840plm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u19ySk5mzWwdtnN97PsRUuXvNnggpXfKO+LxfPiPQk8=;
        b=pRx7qnAp0MsNhTvh6MOSW1gONvA1CAa9fUvxqjdwhEPErz5uSZZKMfPBzUujmPnZsP
         YEwudmi1DQpBX2VXhNzjkRtCbW2Vvlf2rGyoTkrxw1GMdXNvAFs3yHeDZyr+r5rxKEZ1
         V4YsgiChJXn3/hWl9snf0g3au0aupOICETZKhOWsUTzNMydFN2nDOx52ApnLG2HfO03R
         wIS1FlPyjmh9jQyUZ33qEl2OwSdapgfUCGnvCdCdHFMJ6EJVFGLnPQG/mSg1NB5Xw9bR
         /Yq8hchui2dzjr1DN1WbXBuxscA10SjH3T22l4V+MVhV9DlV4NxPOgOxB3HHSHrl8to2
         Jsaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u19ySk5mzWwdtnN97PsRUuXvNnggpXfKO+LxfPiPQk8=;
        b=MPiWsTiOw4ylp3ULP61QRP/S67aSHsOSjNORQYaV5ru+mZutQqvuoAkT2IQ2qG74Cy
         OUvSEkSapeusB5+REhQk0J5NQNe8F9rEc2saC1fIANMKaEtX521EtDKWRSRpXzEUp3wa
         7SKMQ7HLrdjv7m/dpMum/ziT40NPp6iICIdx+zYfm03CU+3zYAn9FiXNP/G3rUavS8fi
         3iAICH9b6MKK04bC99oNKHlKW0EQIL1sDcIv+juuywhaONAQ4ztb0gnAmBM7IAgbHnBq
         efKLshfy7l80N5JV52raruB30vsl8JTmQ20465i7sFYvOZu9K317oIOTafIYMA7Jrn0W
         fzJg==
X-Gm-Message-State: AO0yUKVpuATWqT9O0Cnx0xD9jzJBIhCkc8AVUQqnI38Q3/rlQ2GlQNuf
	/sSMYtM+Pd26HZsBjP4IuFSZAVUbst+dM7nFI1E=
X-Google-Smtp-Source: AK7set+WTDmAtQ1OxIjhNIu7im6EpE7UJI4S1qioH+zpNQQzPTQ+btAE1hDKDpob2x52qbp5+WC35A==
X-Received: by 2002:a17:903:1103:b0:19c:da7f:a234 with SMTP id n3-20020a170903110300b0019cda7fa234mr2761342plh.67.1677860294025;
        Fri, 03 Mar 2023 08:18:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/29] lib/buildstats: handle tasks that never finished
Date: Fri,  3 Mar 2023 06:17:22 -1000
Message-Id: <99941d6d0fac1ec046eddcc605ce67f139231b38.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178013

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


