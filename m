Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	by mail.openembedded.org (Postfix) with ESMTP id 056527ED9A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 15:47:34 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id z3so34899477iog.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 08:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FMhr60Vaou8Iz5bnbX4C+yzbwayufOGrcTA+q8y2pGA=;
	b=nxZGHHdxh3W6UDSFIQ6TG+5/CCLXbK08Cir+r11DE2JlkW5MxzbUXvBSTNzRCl9sXB
	IqluagACaWNskNgiGRGnYDYefolyWrjxC0dQm/SHBSEPcvOtTLI41VnMP/TGkiKbqOmu
	G42pJT9xgeZ1loahLyqSMR3CwMi9xdtQEJA8LLrUXTmkyol68IRyXb+Mik8V6CFFbQ4y
	b2/jqDeMjCtiVDQ7g01hOpkzawQZfQoTgtTC4TkfUAhuoWTm4HjdMKCp8mjbjwQpOOoU
	zBKYaL3dX0Sd8V7Rgvhhd5RxrhVmKkW+L0MVP54nYP1jItIEWEAwPEOdcBmZ39PgACxx
	bJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FMhr60Vaou8Iz5bnbX4C+yzbwayufOGrcTA+q8y2pGA=;
	b=tpSRLsbC4/TlK1i2g/XWetZHIa0GOJZ4WLvASpd/sxt4PB+JdKqHnCR5LJA4Wl23BS
	9xwFUfbh4zR3GthFKbA+6PMXJ3+HQV7bV2x2vWU5gj2dDFdBtsuvxRm9EdFFYtfG30AK
	xBn5TNN35igOumtw8kns4F78MBC7NGXYql0YtC1pFolZ+hbB36gYFvz5evsjSnUVQnou
	hMK2ZssYFb6IUfeM7od/wPBURv1QhAvmQwNz9LFt7hQ5u8UJKcmJPWorDiUwes2MmBWM
	hGRKpKf2Y25/ZIywAZHkdBbCdVlkstfwK9gy0nUCar8/b4VYgp3C5FukqBvw2M6QFV21
	abZw==
X-Gm-Message-State: APjAAAXbL5WHn9X8KDGZbHx7x7+jP7bVGktenjTA0+vn3WlArYV7muqF
	1Qqk6dyspLAX42RFrQeLq9uIwNmh
X-Google-Smtp-Source: APXvYqyHBsXVlOvrS2kNgbCin2jiKe8NOHNJVQN1osNsk8BLk+n2OEbUfEIxpvESucvMXJ6iwQ/XRw==
X-Received: by 2002:a02:b78a:: with SMTP id f10mr29566563jam.5.1563205655710; 
	Mon, 15 Jul 2019 08:47:35 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	x22sm13899336iob.84.2019.07.15.08.47.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Jul 2019 08:47:35 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2019 10:47:33 -0500
Message-Id: <20190715154733.10774-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] scripts/buildstats-diff: Add option to filter tasks
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
X-List-Received-Date: Mon, 15 Jul 2019 15:47:35 -0000
Content-Transfer-Encoding: 8bit

Adds a command line option to filter out the buildstats-diff report by
one more more tasks. e.g.:

 buildstats-diff --only-task do_compile A B

will only show the differences for do_compile tasks. The --only-task
option can be specified multiple times to filter out multiple tasks at
once.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/buildstats-diff   | 14 ++++++++------
 scripts/lib/buildstats.py |  6 +++++-
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/scripts/buildstats-diff b/scripts/buildstats-diff
index c179c93528..2f6498ab67 100755
--- a/scripts/buildstats-diff
+++ b/scripts/buildstats-diff
@@ -114,7 +114,7 @@ def print_ver_diff(bs1, bs2):
             print(fmt_str.format(name, field1, field2, maxlen=maxlen))
 
 
-def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absdiff',)):
+def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absdiff',), only_tasks=[]):
     """Diff task execution times"""
     def val_to_str(val, human_readable=False):
         """Convert raw value to printable string"""
@@ -151,8 +151,9 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
         """Get cumulative sum of all tasks"""
         total = 0.0
         for recipe_data in buildstats.values():
-            for bs_task in recipe_data.tasks.values():
-                total += getattr(bs_task, val_type)
+            for name, bs_task in recipe_data.tasks.items():
+                if not only_tasks or name in only_tasks:
+                    total += getattr(bs_task, val_type)
         return total
 
     if min_val:
@@ -163,7 +164,7 @@ def print_task_diff(bs1, bs2, val_type, min_val=0, min_absdiff=0, sort_by=('absd
                 val_to_str(min_absdiff, True), val_to_str(min_absdiff)))
 
     # Prepare the data
-    tasks_diff = diff_buildstats(bs1, bs2, val_type, min_val, min_absdiff)
+    tasks_diff = diff_buildstats(bs1, bs2, val_type, min_val, min_absdiff, only_tasks)
 
     # Sort our list
     for field in reversed(sort_by):
@@ -248,6 +249,8 @@ Script for comparing buildstats of two separate builds."""
     parser.add_argument('--multi', action='store_true',
                         help="Read all buildstats from the given paths and "
                              "average over them")
+    parser.add_argument('--only-task', dest='only_tasks', metavar='TASK', action='append', default=[],
+                        help="Only include TASK in report. May be specified multiple times")
     parser.add_argument('buildstats1', metavar='BUILDSTATS1', help="'Left' buildstat")
     parser.add_argument('buildstats2', metavar='BUILDSTATS2', help="'Right' buildstat")
 
@@ -266,7 +269,6 @@ Script for comparing buildstats of two separate builds."""
 
     return args
 
-
 def main(argv=None):
     """Script entry point"""
     args = parse_args(argv)
@@ -290,7 +292,7 @@ def main(argv=None):
             print_ver_diff(bs1, bs2)
         else:
             print_task_diff(bs1, bs2, args.diff_attr, args.min_val,
-                            args.min_absdiff, sort_by)
+                            args.min_absdiff, sort_by, args.only_tasks)
     except ScriptError as err:
         log.error(str(err))
         return 1
diff --git a/scripts/lib/buildstats.py b/scripts/lib/buildstats.py
index 1adab06edf..c69b5bf4d7 100644
--- a/scripts/lib/buildstats.py
+++ b/scripts/lib/buildstats.py
@@ -261,13 +261,17 @@ class BuildStats(dict):
             self[pkg].aggregate(data)
 
 
-def diff_buildstats(bs1, bs2, stat_attr, min_val=None, min_absdiff=None):
+def diff_buildstats(bs1, bs2, stat_attr, min_val=None, min_absdiff=None, only_tasks=[]):
     """Compare the tasks of two buildstats"""
     tasks_diff = []
     pkgs = set(bs1.keys()).union(set(bs2.keys()))
     for pkg in pkgs:
         tasks1 = bs1[pkg].tasks if pkg in bs1 else {}
         tasks2 = bs2[pkg].tasks if pkg in bs2 else {}
+        if only_tasks:
+            tasks1 = {k: v for k, v in tasks1.items() if k in only_tasks}
+            tasks2 = {k: v for k, v in tasks2.items() if k in only_tasks}
+
         if not tasks1:
             pkg_op = '+'
         elif not tasks2:
-- 
2.21.0


