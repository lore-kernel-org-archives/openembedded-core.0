Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E0E8471A38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 19:22:43 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f193so154753wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 12:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SW3S/ajAooJey9cWFc8SxKjljEQTZ9i6b+QLEGood5s=;
	b=RG/GCQLGPzEPQQTX8DODc80TswvS3S+y5K7bvQoAOOUmPq837fUAGTRqoQZRDw+/Ms
	zyUxWcyjO94ITmaUQ07a7pMGlo23xJ4lLP0h5uTpRK5app+f1Wm1UrG33NAPXvk+Lodl
	kI7z/GQBSnOKywfUu8ucU15xZKYxDDp5dTn35NxSE2jk/b3RsCZuQP2qbPVuiR6zfYM3
	YjI2i34r5G0LHsoW0KBCbk4XCc7B7Xki4ILSVonSezUexukJnG2BEhLtxyuE0TSgfZdv
	Yrt+iUq93gPTbldw494+o0H/aqvAtGulKdQnvLGQUncWOZiMYygHjBpHYCu/ns8DeMy7
	lNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SW3S/ajAooJey9cWFc8SxKjljEQTZ9i6b+QLEGood5s=;
	b=dGt1zGjhU2H/HSY47vjL3s9kVJg9lffJBSISI0kQpMJ9yZSOsnRuDe4YZm1kKxavg/
	JcNFcCKPs1G0hjPJJ2cFK4Wn6Wdo1IA+a0DvcOtE649NtTh+Rf6pGk4mOPbnCBa/ibSO
	F/Ty5WmNs68CC/Cg8EJX4R/LyMDVWZZmIzEdXZVZjqiz8nSMqK9Up1rCzQVBZp3TPL+h
	9nPvr08cAaa80dJ4XR971zpTIG5ikWzx6wuI/aMJwOEhn465waOaiNZEpklVYYY0snxn
	FQoED7bv4FOmL+CxKMCZwK4OffoLIulag/pXH8HFeDlzejWrxGYthflZjF2yZ2GAFieo
	KUdw==
X-Gm-Message-State: ABUngveEluRNUEkVGSohUUHJS459ZRpZWAEqgjm9KUHVSEmhT99RSXMPedyTMZS2dhnaJQ==
X-Received: by 10.194.240.129 with SMTP id wa1mr1971503wjc.116.1477077764594; 
	Fri, 21 Oct 2016 12:22:44 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:18a5:22c4:b359:6709])
	by smtp.gmail.com with ESMTPSA id
	r63sm5683940wmb.24.2016.10.21.12.22.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Oct 2016 12:22:44 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 21:22:34 +0200
Message-Id: <1477077754-6211-2-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477077754-6211-1-git-send-email-ulfalizer@gmail.com>
References: <1477077754-6211-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 1/1] task-time: Add simple buildstats analysis script
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
X-List-Received-Date: Fri, 21 Oct 2016 19:22:44 -0000

The 'task-time' Python script is used for simple manual analysis of
buildstats. It displays task timing information in the same format (and
using the same calculation) as the Bash 'time' builtin, and can
optionally sort tasks by real (wall-clock), user (user space CPU), or
sys (kernel CPU) time used.

The timing information comes from the getrusage(2) fields added by
commit adfdca4df18f ("buildstats: Improve to add getrusage data and
corrected IO stats"). That commit is required for the script to work.

Example 1: Running 'task-time' on a specific task buildstat:

  $ task-time ./20161005235448/gettext-0.16.1-r6/do_compile
  ./20161005235448/gettext-0.16.1-r6/do_compile:
  real  0m54.560s
  user  0m46.028s
  sys   0m2.772s

Example 2: Running 'task-time' on a directory, sorting on wall-clock
time:

  $ task-time tmp/buildstats/20161018083535 --sort real
  tmp/buildstats/20161018083535/bash-4.3.30-r0/do_fetch:
  real    10m59.140s
  user    0m1.152s
  sys     0m0.320s

  tmp/buildstats/20161018083535/readline-native-6.3-r0/do_fetch:
  real    8m57.310s
  user    0m0.860s
  sys     0m0.288s

  tmp/buildstats/20161018083535/perl-5.22.1-r0/do_compile:
  real    4m28.840s
  user    4m1.348s
  sys     0m15.816s

  ...

Example 3: Running 'task-time' on all do_compile buildstats for a
particular build by using shell globbing, sorting on user space CPU
time:

  $ task-time tmp/buildstats/20161018083535/*/do_compile --sort user
  tmp/buildstats/20161018083535/qemu-native-2.7.0-r1/do_compile:
  real    0m49.570s
  user    21m45.236s
  sys     1m44.380s

  tmp/buildstats/20161018083535/linux-yocto-4.8+gitAUTOINC+03bf3dd731_67813e7efa-r0/do_compile:
  real    0m49.530s
  user    21m39.588s
  sys     1m59.576s

  tmp/buildstats/20161018083535/gcc-cross-i586-6.2.0-r0/do_compile:
  real    1m8.130s
  user    15m54.256s
  sys     1m28.776s

  ...

Example 4: Comparing a task between two builds:

  $ task-time 201610052{25856,35448}/gettext-0*/do_compile --sort real
  20161005235448/gettext-0.16.1-r6/do_compile:
  real	0m54.560s
  user	0m46.028s
  sys	0m2.772s

  20161005225856/gettext-0.19.8.1-r0/do_compile:
  real	0m41.520s
  user	2m17.312s
  sys	0m7.536s

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 scripts/task-time | 132 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100755 scripts/task-time

diff --git a/scripts/task-time b/scripts/task-time
new file mode 100755
index 0000000..e58040a
--- /dev/null
+++ b/scripts/task-time
@@ -0,0 +1,132 @@
+#!/usr/bin/env python3
+
+import argparse
+import os
+import re
+import sys
+
+arg_parser = argparse.ArgumentParser(
+    description="""
+Reports time consumed for one or more task in a format similar to the standard
+Bash 'time' builtin. Optionally sorts tasks by real (wall-clock), user (user
+space CPU), or sys (kernel CPU) time.
+""")
+
+arg_parser.add_argument(
+    "paths",
+    metavar="path",
+    nargs="+",
+    help="""
+A path containing task buildstats. If the path is a directory, e.g.
+build/tmp/buildstats, then all task found (recursively) in it will be
+processed. If the path is a single task buildstat, e.g.
+build/tmp/buildstats/20161018083535/foo-1.0-r0/do_compile, then just that
+buildstat will be processed. Multiple paths can be specified to process all of
+them. Files whose names do not start with "do_" are ignored.
+""")
+
+arg_parser.add_argument(
+    "--sort",
+    choices=("none", "real", "user", "sys"),
+    default="none",
+    help="""
+The measurement to sort the output by. Defaults to 'none', which means to sort
+by the order paths were given on the command line. For other options, tasks are
+sorted in descending order from the highest value.
+""")
+
+args = arg_parser.parse_args()
+
+# Field names and regexes for parsing out their values from buildstat files
+field_regexes = (("elapsed",    ".*Elapsed time: ([0-9.]+)"),
+                 ("user",       "rusage ru_utime: ([0-9.]+)"),
+                 ("sys",        "rusage ru_stime: ([0-9.]+)"),
+                 ("child user", "Child rusage ru_utime: ([0-9.]+)"),
+                 ("child sys",  "Child rusage ru_stime: ([0-9.]+)"))
+
+# A list of (<path>, <dict>) tuples, where <path> is the path of a do_* task
+# buildstat file and <dict> maps fields from the file to their values
+task_infos = []
+
+def save_times_for_task(path):
+    """Saves information for the buildstat file 'path' in 'task_infos'."""
+
+    if not os.path.basename(path).startswith("do_"):
+        return
+
+    with open(path) as f:
+        fields = {}
+
+        for line in f:
+            for name, regex in field_regexes:
+                match = re.match(regex, line)
+                if match:
+                    fields[name] = float(match.group(1))
+                    break
+
+        # Check that all expected fields were present
+        for name, regex in field_regexes:
+            if name not in fields:
+                print("Warning: Skipping '{}' because no field matching '{}' could be found"
+                      .format(path, regex),
+                      file=sys.stderr)
+                return
+
+        task_infos.append((path, fields))
+
+def save_times_for_dir(path):
+    """Runs save_times_for_task() for each file in path and its subdirs, recursively."""
+
+    # Raise an exception for os.walk() errors instead of ignoring them
+    def walk_onerror(e):
+        raise e
+
+    for root, _, files in os.walk(path, onerror=walk_onerror):
+        for fname in files:
+            save_times_for_task(os.path.join(root, fname))
+
+for path in args.paths:
+    if os.path.isfile(path):
+        save_times_for_task(path)
+    else:
+        save_times_for_dir(path)
+
+def elapsed_time(task_info):
+    return task_info[1]["elapsed"]
+
+def tot_user_time(task_info):
+    return task_info[1]["user"] + task_info[1]["child user"]
+
+def tot_sys_time(task_info):
+    return task_info[1]["sys"] + task_info[1]["child sys"]
+
+if args.sort != "none":
+    sort_fn = {"real": elapsed_time, "user": tot_user_time, "sys": tot_sys_time}
+    task_infos.sort(key=sort_fn[args.sort], reverse=True)
+
+first_entry = True
+
+# Catching BrokenPipeError avoids annoying errors when the output is piped into
+# e.g. 'less' or 'head' and not completely read
+try:
+    for task_info in task_infos:
+        real = elapsed_time(task_info)
+        user = tot_user_time(task_info)
+        sys = tot_sys_time(task_info)
+
+        if not first_entry:
+            print()
+        first_entry = False
+
+        # Mimic Bash's 'time' builtin
+        print("{}:\n"
+              "real\t{}m{:.3f}s\n"
+              "user\t{}m{:.3f}s\n"
+              "sys\t{}m{:.3f}s"
+              .format(task_info[0],
+                      int(real//60), real%60,
+                      int(user//60), user%60,
+                      int(sys//60), sys%60))
+
+except BrokenPipeError:
+    pass
-- 
2.7.4


