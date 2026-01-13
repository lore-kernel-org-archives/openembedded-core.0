Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B80CD2F352
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 17:58:14 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65239.1768327091538214783
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 09:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=JqJZTPkK;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c52f15c5b3so16127785a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 09:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1768327089; x=1768931889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMfk1fQfUJ+v7ew51paJsXyzNvMAcN2M38yxpeo8KD8=;
        b=JqJZTPkKV1bd5emEw+cuU2qaeb2ctwf1J2qyH5XSq2/J2AKfnw4vIl9xUZiCibE9IR
         atUiarCcGx7jA4ZYdrLXt+2e4S5o9BCMQ2dBWusJ3EHfhc5RE17KVhNBgEC7suXsOwTn
         HUidBEs6oLRi2n6AH0gKgwO4M5KDtzlUm9yQf6b9BBcJPK0CKokxfKYp62MuLpaAetKT
         muhn4Ssp5bOXpYv2H8FMGufwxgtDgYZ35PEKOOBsAePU0uqZ304smEEoLbYwg3saMjc+
         +No7KHVhHY3QRhIvDqueB+8XYQ56/jwlTx06nMz09vSL4Ra0qksQuzZMdiIB1Zxl6T0s
         C48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768327089; x=1768931889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMfk1fQfUJ+v7ew51paJsXyzNvMAcN2M38yxpeo8KD8=;
        b=WQ7F7ChiUTIVwjwi56x56OtdI3T4Bz8FRR+3GXdDWg20zIggKHrY/ZgrHnlJV1l9d+
         Z1qiTic/KyrP9V/x3VAGosA7LB8aCBfPjaMa5W8jyHGEFzTCh7LVaSciVziy5V5Sn5lH
         kFkj6egcciozs2rOBLaerCzHwg3tmTJZsqORYQjWxjVIRWfr2kLchCLoXn8AQARGBDhx
         Iwmi47GeIdscVpUHMvGNlwiKu7tbJViB0cmtDOCWqrU8YBXE3firwnc6G75iLt3fNrUZ
         DDSbANR9GYiL/Y5aLqJC//sK4/xTj8jT+eaqD7hMoc0wZl14JEPm5IeV3xoJB40onoZP
         RgEA==
X-Gm-Message-State: AOJu0YznmUi6nQ1POmnpNVEUt/0RxsoRdO9L7W8zWtfrNFUvhQTTfwdw
	Xyoalp8f2ShigEa7WOEcCasoMqBLIcRBz4ZK/VBmOkQ1T/h7STew0efvFvPtMjGI92mWqDZXBCe
	a2gkdTOM=
X-Gm-Gg: AY/fxX4ytxOR9Ul/TXsDzN7pSchQhqCiyY+/5iEH7/u/61tvWJ71fOkhTY4STXHhLU1
	8BDXfr9ZG01EOOk+oSeqdVHvA2KTuiJJmy95t7t9IfIYaAx/Qc3j76aNKelkCVA0gYnLfAIyiGo
	6RHR8oktokkqKmeIHP3Opq0aCb4JOaq0PGnGoxoHdPImKdKZ2mxto7VzVRhcIMwyHNUwHysGRQ0
	NWWaINV9/KnK6djp9Pw+vUN6mKxBP8jhRImO/BuGKOh5sTsrxkZQBG2J3XbmId5F38Rxg2VFMVa
	PoZC8UPhJDcG6PPFSqu597qFobaOrn4rYCPqOXni2GHhGgyY+1LuxDkfffAtfEwaAfCqqyCN270
	UcpvczH1UUs8hQlTROAg4UW5qNnH+ssMmCc7u62JVVsncIgVUqrr2dFVRKMpa4vz0W/KphyM6tL
	ZbOa/5Bpz31rbDbLg=
X-Google-Smtp-Source: AGHT+IESvE3ytODKmNeV4CB0E9uwZo69EcFk+YRDt08ZR+ggs1tdzLW6HzBrw5NcmtgPdz0aH96Y7A==
X-Received: by 2002:a05:6214:5509:b0:88a:525a:8db8 with SMTP id 6a1803df08f44-8908424fc75mr327013626d6.35.1768327089239;
        Tue, 13 Jan 2026 09:58:09 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8907727c6besm159888986d6.54.2026.01.13.09.58.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:58:08 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/7 v4] python3: upgrade 3.14.0 -> 3.14.2
Date: Tue, 13 Jan 2026 12:57:55 -0500
Message-ID: <20260113175758.1409859-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113175758.1409859-1-tgamblin@baylibre.com>
References: <20260113175758.1409859-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 17:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229284

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-14-2-final

Builds OK:

|BUILDALL-QEMU LOG FOR python3
|START TIME: 2025-12-12_14:47:51
|HOSTNAME: megalith
|HOST OS: Fedora Linux 43 (Server Edition)
|HOST KERNEL: 6.17.10-300.fc43.x86_64
|===============
|BUILD RESULTS:
|[glibc]
|PASS: qemuarm
|PASS: qemuarm64
|PASS: qemuarmv5
|PASS: qemuloongarch64
|PASS: qemumips
|PASS: qemumips64
|PASS: qemuppc
|PASS: qemuppc64
|PASS: qemuriscv32
|PASS: qemuriscv64
|PASS: qemux86-64
|PASS: qemux86
|[musl]
|PASS: qemuarm
|PASS: qemuarm64
|PASS: qemuarmv5
|FAIL: qemuloongarch64
|PASS: qemumips
|PASS: qemumips64
|PASS: qemuppc
|PASS: qemuppc64
|PASS: qemuriscv32
|PASS: qemuriscv64
|PASS: qemux86-64
|PASS: qemux86
|===============
|PASSED: 23
|FAILED: 1

Reproducibility OK:

|2025-12-12 14:18:33,082 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/tgamblin/workspace/yocto/openembedded-core/build-st/conf/local.conf
|2025-12-12 14:18:33,082 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
|2025-12-12 14:18:33,083 - oe-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTests.test_reproducible_builds)
|2025-12-12 14:19:11,420 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
|2025-12-12 14:23:50,788 - oe-selftest - INFO - Building reproducibleB-extended (sstate NOT allowed)...
|2025-12-12 14:45:12,673 - oe-selftest - INFO - Checking deb packages for differences...
|2025-12-12 14:45:13,888 - oe-selftest - INFO - Reproducibility summary for deb: same=2261 different=0 different_excluded=0 missing=0 total=2261
|unused_exclusions=[]
|2025-12-12 14:45:13,888 - oe-selftest - INFO - Checking ipk packages for differences...
|2025-12-12 14:45:15,874 - oe-selftest - INFO - Reproducibility summary for ipk: same=2261 different=0 different_excluded=0 missing=0 total=2261
|unused_exclusions=[]
|2025-12-12 14:45:15,875 - oe-selftest - INFO - Checking rpm packages for differences...
|2025-12-12 14:45:17,945 - oe-selftest - INFO - Reproducibility summary for rpm: same=2261 different=0 different_excluded=0 missing=0 total=2261
|unused_exclusions=[]
|2025-12-12 14:45:17,946 - oe-selftest - INFO -  ... ok
|2025-12-12 14:46:22,556 - oe-selftest - INFO - ----------------------------------------------------------------------
|2025-12-12 14:46:22,556 - oe-selftest - INFO - Ran 1 test in 1670.130s
|2025-12-12 14:46:22,556 - oe-selftest - INFO - OK
|2025-12-12 14:46:25,595 - oe-selftest - INFO - RESULTS:
|2025-12-12 14:46:25,595 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1604.86s)
|2025-12-12 14:46:27,441 - oe-selftest - INFO - SUMMARY:
|2025-12-12 14:46:27,441 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1670.130s
|2025-12-12 14:46:27,441 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

ptests look OK:

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
|8 tests skipped (resource denied):
|    test_curses test_peg_generator test_smtpnet test_socketserver
|    test_urllib2net test_urllibnet test_winsound test_zipfile64
|
|455 tests OK.
|
|Total duration: 3 min 45 sec
|Total tests: run=46,462 skipped=2,384
|Total test files: run=483/491 skipped=28 resource_denied=8
|Result: SUCCESS
|DURATION: 225
|END: /usr/lib/python3/ptest
|2025-12-12T19:14
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3_3.14.0.bb => python3_3.14.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.14.0.bb => python3_3.14.2.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.14.0.bb b/meta/recipes-devtools/python/python3_3.14.2.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.0.bb
rename to meta/recipes-devtools/python/python3_3.14.2.bb
index 7b917a02dd..61ab10a710 100644
--- a/meta/recipes-devtools/python/python3_3.14.0.bb
+++ b/meta/recipes-devtools/python/python3_3.14.2.bb
@@ -37,7 +37,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "2299dae542d395ce3883aca00d3c910307cd68e0b2f7336098c8e7b7eee9f3e9"
+SRC_URI[sha256sum] = "ce543ab854bc256b61b71e9b27f831ffd1bfd60a479d639f8be7f9757cf573e9"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.52.0


