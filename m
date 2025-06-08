Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E14BC5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 21:56:01 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.45923.1749419754645638875
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 14:55:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=UWU1T4OX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250608215552b8d0790225195d4cbc-njii1s@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250608215552b8d0790225195d4cbc
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Jun 2025 23:55:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8jQ0OPyz6C/xHcTvhURWDb2Wud3AuVjfHdaNF1G+hHY=;
 b=UWU1T4OXyi41iAxEmawFNEAmP4jFC4f2pCH83wqftARR/Vj15UZIsoIoXxKxQxm0/WjobU
 b8u0UL0vBWEnJlPcyl6+91wyKzx8YtonCujq2eIVUBXbtkR3TtyABJEuIojZ8nHs6ORLrXGg
 EmjcKSZrrjXX4bsB1XmAAiFeq5vUd5T3mOA5nHHoMbcswL3QOkg08Hs9qDHXgUkOPd24qCYE
 83a6xZW8De++ELHYbXz1uZFHUl+dl+clMSOwoJQ2QISITdT1rExrjjNoRqsnTvpitlQknTxH
 AFiIqwZEfTxozupJOnHyccfxxD7g7nsyY7aJD5VpVb0SksZCOK4oKiqg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH v2 3/4] python3: upgrade 3.13.2 -> 3.13.3
Date: Sun,  8 Jun 2025 23:54:35 +0200
Message-Id: <20250608215436.2428591-3-peter.marko@siemens.com>
In-Reply-To: <20250608215436.2428591-1-peter.marko@siemens.com>
References: <20250608215436.2428591-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 21:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218236

From: Trevor Gamblin <tgamblin@baylibre.com>

This adds some security fixes and many new changes to the library.

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-3-final

Modify 0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
to remove 'test_types' from the pgo-wrapper call, since that fails now
under qemu.

Reproducibility looks OK.

ptest results OK:

|== Tests result: SUCCESS ==
|
|29 tests skipped:
|    test.test_asyncio.test_windows_events
|    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
|    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
|    test.test_gdb.test_misc test.test_gdb.test_pretty_print
|    test_android test_apple test_asdl_parser test_clinic test_devpoll
|    test_free_threading test_generated_cases test_idle test_ioctl
|    test_kqueue test_launcher test_msvcrt test_startfile test_tcl
|    test_tkinter test_ttk test_ttk_textonly test_turtle test_winapi
|    test_winconsoleio test_winreg test_wmi
|
|9 tests skipped (resource denied):
|    test_curses test_peg_generator test_pyrepl test_smtpnet
|    test_socketserver test_urllib2net test_urllibnet test_winsound
|    test_zipfile64
|
|442 tests OK.
|
|Total duration: 2 min 48 sec
|Total tests: run=43,896 skipped=2,268
|Total test files: run=471/480 skipped=29 resource_denied=9
|Result: SUCCESS
|DURATION: 169
|END: /usr/lib/python3/ptest
|2025-05-12T12:34
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

(From OE-Core rev: 063d5a5fb2f71b523f378b95167553b28804c3ad)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...e-use-qemu-wrapper-when-gathering-profile.patch | 14 +++++++++++---
 .../{python3_3.13.2.bb => python3_3.13.3.bb}       |  2 +-
 2 files changed, 12 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.13.2.bb => python3_3.13.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 508754286f..39b62f6f26 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -1,16 +1,21 @@
-From 701720a5bab5b42fd7520fd9dd95fd2c7e42c186 Mon Sep 17 00:00:00 2001
+From e7a8a7385f561f214054cf95f0a22bfa064eee0b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 30 Jan 2019 12:41:04 +0100
 Subject: [PATCH] Makefile.pre: use qemu wrapper when gathering profile data
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+Update to remove test_types from the test list, since that fails under
+qemu now.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  Makefile.pre.in | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/Makefile.pre.in b/Makefile.pre.in
-index f9932dd..be1b9ea 100644
+index 3bd4495f95b..8e8fc60bc76 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
 @@ -751,8 +751,7 @@ profile-run-stamp:
@@ -19,7 +24,10 @@ index f9932dd..be1b9ea 100644
  	# Next, run the profile task to generate the profile information.
 -	@ # FIXME: can't run for a cross build
 -	$(LLVM_PROF_FILE) $(RUNSHARED) ./$(BUILDPYTHON) $(PROFILE_TASK)
-+	./pgo-wrapper ./python -m test.regrtest --pgo test_grammar test_opcodes test_dict test_types
++	./pgo-wrapper ./python -m test.regrtest --pgo test_grammar test_opcodes test_dict
  	$(LLVM_PROF_MERGER)
  	# Remove profile generation binary since we are done with it.
  	$(MAKE) clean-retain-profile
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.2.bb
rename to meta/recipes-devtools/python/python3_3.13.3.bb
index 8e16ce90dc..6839d28e19 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.3.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56"
+SRC_URI[sha256sum] = "40f868bcbdeb8149a3149580bb9bfd407b3321cd48f0be631af955ac92c0e041"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"

