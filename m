Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFF6F364A9
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 17:34:39 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.138171.1775756073257876062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 10:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=f5L3clDr;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8d4f78fc9f6so127066285a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 10:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775756072; x=1776360872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ8TuocVpx1YYvkZjz6AB4mHhTAL+zxv/CpLbOW8D+E=;
        b=f5L3clDrg0i+UGrQrEShMbiFwycPCTK7NKADMfAam2QMA4qQ2pcgbu5ZI0nQCuQL+e
         QhUsz0hw1mcw1YAg/2M2w+xJscjnqW5nA8TLwEXshyuHUimQzLmaMPtFc+4oafWbKbH9
         pnh2Jy9IiOx2tl9uESA6vRMcGfufS7yk0c+B4AAag7SrWJ83luP0HfL0jDf83cvDV7yM
         rRcEaoaU6tkqDvceM3QhpWTAdAb3dRPf7YO6Kis8ypIgnsR6uvSYNW8tzVrXzMReNNLO
         viCHKYM0nKtIhsWDkAxEM0jcEm5Rywkc+idXVVEDXcTvYnj1GQ4e6eCEmOpawpZPjZ/i
         4srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775756072; x=1776360872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJ8TuocVpx1YYvkZjz6AB4mHhTAL+zxv/CpLbOW8D+E=;
        b=EHiMQi5LGh6g/4o/QdfkFwf5p9xv7qhytSRviZYpEfI4X2PhpK5fFURwkVGmsgzw5I
         2QliFz6vyYX5YswVGwCADTvYhjqv+8tPSwQRwEC68U6myIqkfQBs86eX+7MuAHgk5NeE
         KjbFDG/7sPtFT5MVauv6QFHr5zRCCUvQbvaM8/oMprkKPGMy0TRQpvBSwbdiifRH7rC6
         yWzCaBLhSiPaqKRAEjmGT43WWOg2SoJul/EOTItuN2KpNrE9Y9xzPVc9/ubVXX0UmbxC
         E/XrcArqpYVfnsPoOxud+qgSBEjnc5Tg57D4DNanpESnWfh3sZeJOdrrKF9opxAJkgSV
         jGig==
X-Gm-Message-State: AOJu0YwMAWPt/Qzv0FEBDAexScyWLIipsgLUECPqmTAuR2QozodGu0AM
	mhHu6ZTJqblhfdxxT/D5b3h7DJ+6pGxC33Z4xoBa24qp1UyGGaAldv3vIZn77fsmhsYUJGnygf2
	UMKMY
X-Gm-Gg: AeBDiesr+onATsU0qoQfOVlRcpDfJEW+NUwF6g9OD+1uBk0k6L+jBxsVT3gAUFzfYhw
	jvdaIvuL2VCZ5B01CvPSnjhW4l6Wf4tbIfqaDnk5qxkYIJg7qfMxXzjQirSUHqIe4OeSd0GzaZA
	380u5HXMumNCWv1yUMpg8mFtGRVjWjmlG8Y7p0NsEEvJaQaYosr7Q/+Fo+Uxc7in0D6hnZW2kg/
	feHbOhTsO1VUuSfUquzgLTlXQ+lkiNKzY8gSioSdsKU3TZIs8u3S2zdKJcDjwSWISAdSpbZ50VP
	RHxzDhlCFM/DBP9KrTBC5XhN/lSB4VGNhtCv+tYw6fu0a8FU/dPuia14B5gC2+w7Y9o7Q626JQn
	lFZwiUtsvjXQ9CNM3+T++qjlyezfHUjlxCLee13V0nHzAAxfkijj/boqr0R7ihzVEaGIv3veIhL
	o5F8cGyrnjpvMArX4qF8YXXKFINBk=
X-Received: by 2002:a05:620a:440e:b0:8cd:8f04:50ec with SMTP id af79cd13be357-8dc3b03cfe9mr651963985a.2.1775756071433;
        Thu, 09 Apr 2026 10:34:31 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb646dbd3sm6483485a.16.2026.04.09.10.34.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:34:30 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: upgrade 3.14.3 -> 3.14.4
Date: Thu,  9 Apr 2026 13:34:28 -0400
Message-ID: <20260409173428.3599371-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 17:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234938

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-14-4-final

Drop patches:

- 0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch since
  it was a backport and is now included in 3.14.4.
- 0001-test_pyrepl-skip-test_pyrepl_eio.patch, the test for which was
  determined flaky and dropped upstream in commit 9743d88334ad.

ptests look OK:

|Ran 353 tests in 74.012s
|
|OK (skipped=43)
|
|== Tests result: SUCCESS ==
|
|28 tests skipped:
|    test.test_asyncio.test_windows_events
|    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
|    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
|    test.test_gdb.test_misc test.test_gdb.test_pretty_print
|    test_android test_apple test_asdl_parser test_clinic test_devpoll
|    test_free_threading test_generated_cases test_idle test_kqueue
|    test_launcher test_msvcrt test_startfile test_tcl test_tkinter
|    test_ttk test_ttk_textonly test_turtle test_winapi
|    test_winconsoleio test_winreg test_wmi
|
|9 tests skipped (resource denied):
|    test_curses test_peg_generator test_smtpnet test_socketserver
|    test_urllib2net test_urllibnet test_winsound test_xpickle
|    test_zipfile64
|
|455 tests OK.
|
|Total duration: 3 min 42 sec
|Total tests: run=46,926 skipped=2,469
|Total test files: run=483/492 skipped=28 resource_denied=9
|Result: SUCCESS
|DURATION: 223
|END: /usr/lib/python3/ptest
|2026-04-09T14:44
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0
|root@qemux86-64:~#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3_3.14.3.bb => python3_3.14.4.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.3.bb => python3_3.14.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.3.bb
rename to meta/recipes-devtools/python/python3_3.14.4.bb
index c40742fb43..f48dbc6996 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.4.bb
@@ -33,15 +33,14 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch \
            file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch \
            file://0001-Skip-flaky-test_default_timeout-tests.patch \
-           file://0001-gh-144787-tests-Allow-TLS-v1.2-to-be-minimum-version.patch \
            file://0001-test_only_active_thread-skip-problematic-test.patch \
-           file://0001-test_pyrepl-skip-test_pyrepl_eio.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
 SRC_URI[sha256sum] = "a97d5549e9ad81fe17159ed02c68774ad5d266c72f8d9a0b5a9c371fe85d902b"
+SRC_URI[sha256sum] = "d923c51303e38e249136fc1bdf3568d56ecb03214efdef48516176d3d7faaef8"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.53.0


