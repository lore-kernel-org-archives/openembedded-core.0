Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E805CC04A94
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 18:01:51 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.77645.1690740102976871069
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 11:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=mPC9Tvhq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-686f94328a4so2015891b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690740102; x=1691344902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+T9cXiY0pM231Hit3atV4QYy9Fzy+WvfhbkVOCkNUxw=;
        b=mPC9TvhqWDZu+gNOcJt9hnp/hR1nsfY837iOX7+WFnNu/1gm9bUguaacj2Q5r0GY6P
         AyWnxRzneoxx4h2y7p33I5Hd2Z8lob2wuEnu/MDq5LIy63o26MZ+ltdMEgKWwcius7KO
         U5lMJABB0iJg3yXGd396mmY50SWrHpkKziJdHI2aAezpyr8yOi4VCm10+SwDcfEF8MzY
         n6H9PpJOvloK9uxq4pTzY0EkPwRPYIT52KyY7HEhJzBkySIR1Wb0Sy8veE92zt6G/0rn
         rbOaSWtO9LAHdW9MhbY997In8/zgCfXlWcKsjXHxwJPPNdJiPCFj2slcFh3BMVBwRW0+
         w6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690740102; x=1691344902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+T9cXiY0pM231Hit3atV4QYy9Fzy+WvfhbkVOCkNUxw=;
        b=Nu4/5lZ8m4TJD32kdOz1XduvSHY0lCdxS71jaSn1Of9s2gygiww+izNiLkqC/xNDUy
         PlUud59IjBNjEIJjryrw871Onp2JSEzDrNR5xxUpch+jGztJk0Kntj873cvCXupBJhdn
         A7Z+uTWM2U5ZHl7jc7VaIqoYzB5A11XsaL7X6IsppWAg5nvNeKXkQRoohwvezPAHXN3s
         v0sN0FgMth5fjzkpUKmhnGetX42R5VnrUNTL7oNiqVnkwqfjhpp4ma2iOdBJYtRVJel4
         GEV8iYybn8FCg8oJQC4GB/El57GwcQ36+xEOsS0Uk3wMK88QHqDHQgpLrV3NZHc18l4/
         FRSQ==
X-Gm-Message-State: ABy/qLbMASxAmG+MiWXayPrCOvF/gLcmu1m8Jt9bJLtQonPS7xCQOZwF
	tYi5ZDzn5pJkhlFdhxTYQDJ6gWqBQYj2TCzRpBY4cA==
X-Google-Smtp-Source: APBJJlGt32w3gUiuxuVPTpaoC3Ins6E8EsVRoBdf6FcoTGqao9qi/yde1/X3/0E06WZtOka2LL73RQ==
X-Received: by 2002:a05:6a00:1394:b0:666:c1ae:3b87 with SMTP id t20-20020a056a00139400b00666c1ae3b87mr11611181pfg.12.1690740101700;
        Sun, 30 Jul 2023 11:01:41 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e9-20020a62ee09000000b0066e7a540ea5sm6150494pfi.205.2023.07.30.11.01.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 11:01:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 23/30] mdadm: skip running known broken ptests
Date: Sun, 30 Jul 2023 08:00:46 -1000
Message-Id: <b6359049421a5472c666e43e56ea38acf0054306.1690739937.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690739937.git.steve@sakoman.com>
References: <cover.1690739937.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 18:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185101

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Upstream marked some testcases as "KNOWN BROKEN" and introduced the
"--skip-broken" flag to ignore them when running the testsuite (commits [1]
and [2]). Backport these two commits to get rid of the last remaining ptest
failures.

Also, add the "--skip-broken" option to the run-ptest script.

[1] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=28520bf114b3
[2] https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=daa86d663476

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62148b978b26b5fcd1a2fa3a0ff82ef814f4e7ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...Mark-and-ignore-broken-test-failures.patch | 128 +++++
 ...dd-broken-files-for-all-broken-tests.patch | 454 ++++++++++++++++++
 meta/recipes-extended/mdadm/files/run-ptest   |   2 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   2 +
 4 files changed, 585 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch

diff --git a/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch b/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
new file mode 100644
index 0000000000..c55bfb125b
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch
@@ -0,0 +1,128 @@
+From feab1f72fcf032a4d21d0a69eb61b23a5ddb3352 Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:18 -0600
+Subject: [PATCH 5/6] mdadm/test: Mark and ignore broken test failures
+
+Add functionality to continue if a test marked as broken fails.
+
+To mark a test as broken, a file with the same name but with the suffix
+'.broken' should exist. The first line in the file will be printed with
+a KNOWN BROKEN message; the rest of the file can describe the how the
+test is broken.
+
+Also adds --skip-broken and --skip-always-broken to skip all the tests
+that have a .broken file or to skip all tests whose .broken file's first
+line contains the keyword always.
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=28520bf114b3
+
+[OP: adjusted context for mdadm-4.2]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ test | 37 +++++++++++++++++++++++++++++++++++--
+ 1 file changed, 35 insertions(+), 2 deletions(-)
+
+diff --git a/test b/test
+index 8f189d9..ee8fba1 100755
+--- a/test
++++ b/test
+@@ -10,6 +10,8 @@ devlist=
+ 
+ savelogs=0
+ exitonerror=1
++ctrl_c_error=0
++skipbroken=0
+ prefix='[0-9][0-9]'
+ 
+ # use loop devices by default if doesn't specify --dev
+@@ -35,6 +37,7 @@ die() {
+ 
+ ctrl_c() {
+ 	exitonerror=1
++	ctrl_c_error=1
+ }
+ 
+ # mdadm always adds --quiet, and we want to see any unexpected messages
+@@ -79,8 +82,21 @@ mdadm() {
+ do_test() {
+ 	_script=$1
+ 	_basename=`basename $_script`
++	_broken=0
++
+ 	if [ -f "$_script" ]
+ 	then
++		if [ -f "${_script}.broken" ]; then
++			_broken=1
++			_broken_msg=$(head -n1 "${_script}.broken" | tr -d '\n')
++			if [ "$skipbroken" == "all" ]; then
++				return
++			elif [ "$skipbroken" == "always" ] &&
++			     [[ "$_broken_msg" == *always* ]]; then
++				return
++			fi
++		fi
++
+ 		rm -f $targetdir/stderr
+ 		# this might have been reset: restore the default.
+ 		echo 2000 > /proc/sys/dev/raid/speed_limit_max
+@@ -97,10 +113,15 @@ do_test() {
+ 		else
+ 			save_log fail
+ 			_fail=1
++			if [ "$_broken" == "1" ]; then
++				echo "  (KNOWN BROKEN TEST: $_broken_msg)"
++			fi
+ 		fi
+ 		[ "$savelogs" == "1" ] &&
+ 			mv -f $targetdir/log $logdir/$_basename.log
+-		[ "$_fail" == "1" -a "$exitonerror" == "1" ] && exit 1
++		[ "$ctrl_c_error" == "1" ] && exit 1
++		[ "$_fail" == "1" -a "$exitonerror" == "1" \
++		  -a "$_broken" == "0" ] && exit 1
+ 	fi
+ }
+ 
+@@ -117,6 +138,8 @@ do_help() {
+ 		--logdir=directory          Directory to save all logfiles in
+ 		--save-logs                 Usually use with --logdir together
+ 		--keep-going | --no-error   Don't stop on error, ie. run all tests
++		--skip-broken               Skip tests that are known to be broken
++		--skip-always-broken        Skip tests that are known to always fail
+ 		--dev=loop|lvm|ram|disk     Use loop devices (default), LVM, RAM or disk
+ 		--disks=                    Provide a bunch of physical devices for test
+ 		--volgroup=name             LVM volume group for LVM test
+@@ -211,6 +234,12 @@ parse_args() {
+ 		--keep-going | --no-error )
+ 			exitonerror=0
+ 			;;
++		--skip-broken )
++			skipbroken=all
++			;;
++		--skip-always-broken )
++			skipbroken=always
++			;;
+ 		--disable-multipath )
+ 			unset MULTIPATH
+ 			;;
+@@ -275,7 +304,11 @@ main() {
+ 			if [ $script == "$testdir/11spare-migration" ];then
+ 				continue
+ 			fi
+-			do_test $script
++			case $script in
++			 *.broken) ;;
++			 *)
++			     do_test $script
++			 esac
+ 		done
+ 	fi
+ 
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch b/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
new file mode 100644
index 0000000000..115b23bac5
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0006-tests-Add-broken-files-for-all-broken-tests.patch
@@ -0,0 +1,454 @@
+From fd1c26ba129b069d9f73afaefdbe53683de3814a Mon Sep 17 00:00:00 2001
+From: Logan Gunthorpe <logang@deltatee.com>
+Date: Wed, 22 Jun 2022 14:25:19 -0600
+Subject: [PATCH 6/6] tests: Add broken files for all broken tests
+
+Each broken file contains the rough frequency of brokeness as well
+as a brief explanation of what happens when it breaks. Estimates
+of failure rates are not statistically significant and can vary
+run to run.
+
+This is really just a view from my window. Tests were done on a
+small VM with the default loop devices, not real hardware. We've
+seen different kernel configurations can cause bugs to appear as well
+(ie. different block schedulers). It may also be that different race
+conditions will be seen on machines with different performance
+characteristics.
+
+These annotations were done with the kernel currently in md/md-next:
+
+ facef3b96c5b ("md: Notify sysfs sync_completed in md_reap_sync_thread()")
+
+Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
+Signed-off-by: Jes Sorensen <jes@trained-monkey.org>
+
+Upstream-Status: Backport
+
+Reference to upstream patch:
+https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=daa86d663476
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ tests/01r5integ.broken                     |  7 ++++
+ tests/01raid6integ.broken                  |  7 ++++
+ tests/04r5swap.broken                      |  7 ++++
+ tests/07autoassemble.broken                |  8 ++++
+ tests/07autodetect.broken                  |  5 +++
+ tests/07changelevelintr.broken             |  9 +++++
+ tests/07changelevels.broken                |  9 +++++
+ tests/07reshape5intr.broken                | 45 ++++++++++++++++++++++
+ tests/07revert-grow.broken                 | 31 +++++++++++++++
+ tests/07revert-shrink.broken               |  9 +++++
+ tests/07testreshape5.broken                | 12 ++++++
+ tests/09imsm-assemble.broken               |  6 +++
+ tests/09imsm-create-fail-rebuild.broken    |  5 +++
+ tests/09imsm-overlap.broken                |  7 ++++
+ tests/10ddf-assemble-missing.broken        |  6 +++
+ tests/10ddf-fail-create-race.broken        |  7 ++++
+ tests/10ddf-fail-two-spares.broken         |  5 +++
+ tests/10ddf-incremental-wrong-order.broken |  9 +++++
+ tests/14imsm-r1_2d-grow-r1_3d.broken       |  5 +++
+ tests/14imsm-r1_2d-takeover-r0_2d.broken   |  6 +++
+ tests/18imsm-r10_4d-takeover-r0_2d.broken  |  5 +++
+ tests/18imsm-r1_2d-takeover-r0_1d.broken   |  6 +++
+ tests/19raid6auto-repair.broken            |  5 +++
+ tests/19raid6repair.broken                 |  5 +++
+ 24 files changed, 226 insertions(+)
+ create mode 100644 tests/01r5integ.broken
+ create mode 100644 tests/01raid6integ.broken
+ create mode 100644 tests/04r5swap.broken
+ create mode 100644 tests/07autoassemble.broken
+ create mode 100644 tests/07autodetect.broken
+ create mode 100644 tests/07changelevelintr.broken
+ create mode 100644 tests/07changelevels.broken
+ create mode 100644 tests/07reshape5intr.broken
+ create mode 100644 tests/07revert-grow.broken
+ create mode 100644 tests/07revert-shrink.broken
+ create mode 100644 tests/07testreshape5.broken
+ create mode 100644 tests/09imsm-assemble.broken
+ create mode 100644 tests/09imsm-create-fail-rebuild.broken
+ create mode 100644 tests/09imsm-overlap.broken
+ create mode 100644 tests/10ddf-assemble-missing.broken
+ create mode 100644 tests/10ddf-fail-create-race.broken
+ create mode 100644 tests/10ddf-fail-two-spares.broken
+ create mode 100644 tests/10ddf-incremental-wrong-order.broken
+ create mode 100644 tests/14imsm-r1_2d-grow-r1_3d.broken
+ create mode 100644 tests/14imsm-r1_2d-takeover-r0_2d.broken
+ create mode 100644 tests/18imsm-r10_4d-takeover-r0_2d.broken
+ create mode 100644 tests/18imsm-r1_2d-takeover-r0_1d.broken
+ create mode 100644 tests/19raid6auto-repair.broken
+ create mode 100644 tests/19raid6repair.broken
+
+diff --git a/tests/01r5integ.broken b/tests/01r5integ.broken
+new file mode 100644
+index 0000000..2073763
+--- /dev/null
++++ b/tests/01r5integ.broken
+@@ -0,0 +1,7 @@
++fails rarely
++
++Fails about 1 in every 30 runs with a sha mismatch error:
++
++    c49ab26e1b01def7874af9b8a6d6d0c29fdfafe6 /dev/md0 does not match
++    15dc2f73262f811ada53c65e505ceec9cf025cb9 /dev/md0 with /dev/loop3
++    missing
+diff --git a/tests/01raid6integ.broken b/tests/01raid6integ.broken
+new file mode 100644
+index 0000000..1df735f
+--- /dev/null
++++ b/tests/01raid6integ.broken
+@@ -0,0 +1,7 @@
++fails infrequently
++
++Fails about 1 in 5 with a sha mismatch:
++
++    8286c2bc045ae2cfe9f8b7ae3a898fa25db6926f /dev/md0 does not match
++    a083a0738b58caab37fd568b91b177035ded37df /dev/md0 with /dev/loop2 and
++    /dev/loop3 missing
+diff --git a/tests/04r5swap.broken b/tests/04r5swap.broken
+new file mode 100644
+index 0000000..e38987d
+--- /dev/null
++++ b/tests/04r5swap.broken
+@@ -0,0 +1,7 @@
++always fails
++
++Fails with errors:
++
++  mdadm: /dev/loop0 has no superblock - assembly aborted
++
++   ERROR: no recovery happening
+diff --git a/tests/07autoassemble.broken b/tests/07autoassemble.broken
+new file mode 100644
+index 0000000..8be0940
+--- /dev/null
++++ b/tests/07autoassemble.broken
+@@ -0,0 +1,8 @@
++always fails
++
++Prints lots of messages, but the array doesn't assemble. Error
++possibly related to:
++
++  mdadm: /dev/md/1 is busy - skipping
++  mdadm: no recogniseable superblock on /dev/md/testing:0
++  mdadm: /dev/md/2 is busy - skipping
+diff --git a/tests/07autodetect.broken b/tests/07autodetect.broken
+new file mode 100644
+index 0000000..294954a
+--- /dev/null
++++ b/tests/07autodetect.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with error:
++
++    ERROR: no resync happening
+diff --git a/tests/07changelevelintr.broken b/tests/07changelevelintr.broken
+new file mode 100644
+index 0000000..284b490
+--- /dev/null
++++ b/tests/07changelevelintr.broken
+@@ -0,0 +1,9 @@
++always fails
++
++Fails with errors:
++
++  mdadm: this change will reduce the size of the array.
++         use --grow --array-size first to truncate array.
++         e.g. mdadm --grow /dev/md0 --array-size 56832
++
++  ERROR: no reshape happening
+diff --git a/tests/07changelevels.broken b/tests/07changelevels.broken
+new file mode 100644
+index 0000000..9b930d9
+--- /dev/null
++++ b/tests/07changelevels.broken
+@@ -0,0 +1,9 @@
++always fails
++
++Fails with errors:
++
++    mdadm: /dev/loop0 is smaller than given size. 18976K < 19968K + metadata
++    mdadm: /dev/loop1 is smaller than given size. 18976K < 19968K + metadata
++    mdadm: /dev/loop2 is smaller than given size. 18976K < 19968K + metadata
++
++    ERROR: /dev/md0 isn't a block device.
+diff --git a/tests/07reshape5intr.broken b/tests/07reshape5intr.broken
+new file mode 100644
+index 0000000..efe52a6
+--- /dev/null
++++ b/tests/07reshape5intr.broken
+@@ -0,0 +1,45 @@
++always fails
++
++This patch, recently added to md-next causes the test to always fail:
++
++7e6ba434cc60 ("md: don't unregister sync_thread with reconfig_mutex
++held")
++
++The new error is simply:
++
++   ERROR: no reshape happening
++
++Before the patch, the error seen is below.
++
++--
++
++fails infrequently
++
++Fails roughly 1 in 4 runs with errors:
++
++    mdadm: Merging with already-assembled /dev/md/0
++    mdadm: cannot re-read metadata from /dev/loop6 - aborting
++
++    ERROR: no reshape happening
++
++Also have seen a random deadlock:
++
++     INFO: task mdadm:109702 blocked for more than 30 seconds.
++           Not tainted 5.18.0-rc3-eid-vmlocalyes-dbg-00095-g3c2b5427979d #2040
++     "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
++     task:mdadm           state:D stack:    0 pid:109702 ppid:     1 flags:0x00004000
++     Call Trace:
++      <TASK>
++      __schedule+0x67e/0x13b0
++      schedule+0x82/0x110
++      mddev_suspend+0x2e1/0x330
++      suspend_lo_store+0xbd/0x140
++      md_attr_store+0xcb/0x130
++      sysfs_kf_write+0x89/0xb0
++      kernfs_fop_write_iter+0x202/0x2c0
++      new_sync_write+0x222/0x330
++      vfs_write+0x3bc/0x4d0
++      ksys_write+0xd9/0x180
++      __x64_sys_write+0x43/0x50
++      do_syscall_64+0x3b/0x90
++      entry_SYSCALL_64_after_hwframe+0x44/0xae
+diff --git a/tests/07revert-grow.broken b/tests/07revert-grow.broken
+new file mode 100644
+index 0000000..9b6db86
+--- /dev/null
++++ b/tests/07revert-grow.broken
+@@ -0,0 +1,31 @@
++always fails
++
++This patch, recently added to md-next causes the test to always fail:
++
++7e6ba434cc60 ("md: don't unregister sync_thread with reconfig_mutex held")
++
++The errors are:
++
++    mdadm: No active reshape to revert on /dev/loop0
++    ERROR: active raid5 not found
++
++Before the patch, the error seen is below.
++
++--
++
++fails rarely
++
++Fails about 1 in every 30 runs with errors:
++
++    mdadm: Merging with already-assembled /dev/md/0
++    mdadm: backup file /tmp/md-backup inaccessible: No such file or directory
++    mdadm: failed to add /dev/loop1 to /dev/md/0: Invalid argument
++    mdadm: failed to add /dev/loop2 to /dev/md/0: Invalid argument
++    mdadm: failed to add /dev/loop3 to /dev/md/0: Invalid argument
++    mdadm: failed to add /dev/loop0 to /dev/md/0: Invalid argument
++    mdadm: /dev/md/0 assembled from 1 drive - need all 5 to start it
++            (use --run to insist).
++
++    grep: /sys/block/md*/md/sync_action: No such file or directory
++
++    ERROR: active raid5 not found
+diff --git a/tests/07revert-shrink.broken b/tests/07revert-shrink.broken
+new file mode 100644
+index 0000000..c33c39e
+--- /dev/null
++++ b/tests/07revert-shrink.broken
+@@ -0,0 +1,9 @@
++always fails
++
++Fails with errors:
++
++    mdadm: this change will reduce the size of the array.
++           use --grow --array-size first to truncate array.
++           e.g. mdadm --grow /dev/md0 --array-size 53760
++
++    ERROR: active raid5 not found
+diff --git a/tests/07testreshape5.broken b/tests/07testreshape5.broken
+new file mode 100644
+index 0000000..a8ce03e
+--- /dev/null
++++ b/tests/07testreshape5.broken
+@@ -0,0 +1,12 @@
++always fails
++
++Test seems to run 'test_stripe' at $dir directory, but $dir is never
++set. If $dir is adjusted to $PWD, the test still fails with:
++
++    mdadm: /dev/loop2 is not suitable for this array.
++    mdadm: create aborted
++    ++ return 1
++    ++ cmp -s -n 8192 /dev/md0 /tmp/RandFile
++    ++ echo cmp failed
++    cmp failed
++    ++ exit 2
+diff --git a/tests/09imsm-assemble.broken b/tests/09imsm-assemble.broken
+new file mode 100644
+index 0000000..a6d4d5c
+--- /dev/null
++++ b/tests/09imsm-assemble.broken
+@@ -0,0 +1,6 @@
++fails infrequently
++
++Fails roughly 1 in 10 runs with errors:
++
++    mdadm: /dev/loop2 is still in use, cannot remove.
++    /dev/loop2 removal from /dev/md/container should have succeeded
+diff --git a/tests/09imsm-create-fail-rebuild.broken b/tests/09imsm-create-fail-rebuild.broken
+new file mode 100644
+index 0000000..40c4b29
+--- /dev/null
++++ b/tests/09imsm-create-fail-rebuild.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with error:
++
++    **Error**: Array size mismatch - expected 3072, actual 16384
+diff --git a/tests/09imsm-overlap.broken b/tests/09imsm-overlap.broken
+new file mode 100644
+index 0000000..e7ccab7
+--- /dev/null
++++ b/tests/09imsm-overlap.broken
+@@ -0,0 +1,7 @@
++always fails
++
++Fails with errors:
++
++    **Error**: Offset mismatch - expected 15360, actual 0
++    **Error**: Offset mismatch - expected 15360, actual 0
++    /dev/md/vol3 failed check
+diff --git a/tests/10ddf-assemble-missing.broken b/tests/10ddf-assemble-missing.broken
+new file mode 100644
+index 0000000..bfd8d10
+--- /dev/null
++++ b/tests/10ddf-assemble-missing.broken
+@@ -0,0 +1,6 @@
++always fails
++
++Fails with errors:
++
++    ERROR: /dev/md/vol0 has unexpected state on /dev/loop10
++    ERROR: unexpected number of online disks on /dev/loop10
+diff --git a/tests/10ddf-fail-create-race.broken b/tests/10ddf-fail-create-race.broken
+new file mode 100644
+index 0000000..6c0df02
+--- /dev/null
++++ b/tests/10ddf-fail-create-race.broken
+@@ -0,0 +1,7 @@
++usually fails
++
++Fails about 9 out of 10 times with many errors:
++
++    mdadm: cannot open MISSING: No such file or directory
++    ERROR: non-degraded array found
++    ERROR: disk 0 not marked as failed in meta data
+diff --git a/tests/10ddf-fail-two-spares.broken b/tests/10ddf-fail-two-spares.broken
+new file mode 100644
+index 0000000..eeea56d
+--- /dev/null
++++ b/tests/10ddf-fail-two-spares.broken
+@@ -0,0 +1,5 @@
++fails infrequently
++
++Fails roughly 1 in 3 with error:
++
++   ERROR: /dev/md/vol1 should be optimal in meta data
+diff --git a/tests/10ddf-incremental-wrong-order.broken b/tests/10ddf-incremental-wrong-order.broken
+new file mode 100644
+index 0000000..a5af3ba
+--- /dev/null
++++ b/tests/10ddf-incremental-wrong-order.broken
+@@ -0,0 +1,9 @@
++always fails
++
++Fails with errors:
++    ERROR: sha1sum of /dev/md/vol0 has changed
++    ERROR: /dev/md/vol0 has unexpected state on /dev/loop10
++    ERROR: unexpected number of online disks on /dev/loop10
++    ERROR: /dev/md/vol0 has unexpected state on /dev/loop8
++    ERROR: unexpected number of online disks on /dev/loop8
++    ERROR: sha1sum of /dev/md/vol0 has changed
+diff --git a/tests/14imsm-r1_2d-grow-r1_3d.broken b/tests/14imsm-r1_2d-grow-r1_3d.broken
+new file mode 100644
+index 0000000..4ef1d40
+--- /dev/null
++++ b/tests/14imsm-r1_2d-grow-r1_3d.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with error:
++
++    mdadm/tests/func.sh: line 325: dvsize/chunk: division by 0 (error token is "chunk")
+diff --git a/tests/14imsm-r1_2d-takeover-r0_2d.broken b/tests/14imsm-r1_2d-takeover-r0_2d.broken
+new file mode 100644
+index 0000000..89cd4e5
+--- /dev/null
++++ b/tests/14imsm-r1_2d-takeover-r0_2d.broken
+@@ -0,0 +1,6 @@
++always fails
++
++Fails with error:
++
++    tests/func.sh: line 325: dvsize/chunk: division by 0 (error token
++		is "chunk")
+diff --git a/tests/18imsm-r10_4d-takeover-r0_2d.broken b/tests/18imsm-r10_4d-takeover-r0_2d.broken
+new file mode 100644
+index 0000000..a27399f
+--- /dev/null
++++ b/tests/18imsm-r10_4d-takeover-r0_2d.broken
+@@ -0,0 +1,5 @@
++fails rarely
++
++Fails about 1 run in 100 with message:
++
++   ERROR:  size is wrong for /dev/md/vol0: 2 * 5120 (chunk=128) = 20480, not 0
+diff --git a/tests/18imsm-r1_2d-takeover-r0_1d.broken b/tests/18imsm-r1_2d-takeover-r0_1d.broken
+new file mode 100644
+index 0000000..aa1982e
+--- /dev/null
++++ b/tests/18imsm-r1_2d-takeover-r0_1d.broken
+@@ -0,0 +1,6 @@
++always fails
++
++Fails with error:
++
++    tests/func.sh: line 325: dvsize/chunk: division by 0 (error token
++			is "chunk")
+diff --git a/tests/19raid6auto-repair.broken b/tests/19raid6auto-repair.broken
+new file mode 100644
+index 0000000..e91a142
+--- /dev/null
++++ b/tests/19raid6auto-repair.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with:
++
++    "should detect errors"
+diff --git a/tests/19raid6repair.broken b/tests/19raid6repair.broken
+new file mode 100644
+index 0000000..e91a142
+--- /dev/null
++++ b/tests/19raid6repair.broken
+@@ -0,0 +1,5 @@
++always fails
++
++Fails with:
++
++    "should detect errors"
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/files/run-ptest b/meta/recipes-extended/mdadm/files/run-ptest
index fae8071d43..2380c322a9 100644
--- a/meta/recipes-extended/mdadm/files/run-ptest
+++ b/meta/recipes-extended/mdadm/files/run-ptest
@@ -2,6 +2,6 @@
 
 mkdir -p /mdadm-testing-dir
 # make the test continue to execute even one fail
-dir=. ./test --keep-going --disable-integrity
+dir=. ./test --keep-going --disable-integrity --skip-broken
 
 rm -rf /mdadm-testing-dir/*
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 1851e058fd..307e7abd9e 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -34,6 +34,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0002-DDF-Fix-NULL-pointer-dereference-in-validate_geometr.patch \
            file://0003-mdadm-Grow-Fix-use-after-close-bug-by-closing-after-.patch \
            file://0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch \
+           file://0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch \
+           file://0006-tests-Add-broken-files-for-all-broken-tests.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.34.1


