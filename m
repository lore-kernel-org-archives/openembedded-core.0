Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FB6D26D65
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:07:09 +0000 (UTC)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11930.1767971224095433937
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=iPnauYx+;
 spf=pass (domain: baylibre.com, ip: 209.85.217.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ec96028b32so2108995137.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 07:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767971222; x=1768576022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMfk1fQfUJ+v7ew51paJsXyzNvMAcN2M38yxpeo8KD8=;
        b=iPnauYx+A+7E/zDYi0eWmcuHX64kO09LcQoCSBal3atubnMZLFVWMQJCGazfOKtayy
         Cb6LHzqCN62E+9bWNQ10gbrD8gqwWQ95VxPcle8P11YDX4RDaWxna0rae0pz+Cz8AH56
         tJuh4/ErRVl/5bqXd5uqwGljVNlXSjcliMBqSPBCKVErb9FWTpMNfU43iNQhpDM+JY7Y
         1XXrGGZBEkd+G+gB3DWFWcCi5a9HbX8ZDpqetPPjgnszLBA0RrBYaw6tpgf/tiVbLqXi
         pqTa7MRx1YdL8laQ4xJxPu+qKrAglbzd8IOSe6G5yAdqEZet6bEldDQTUGcGoUANcmuU
         4Cpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971222; x=1768576022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMfk1fQfUJ+v7ew51paJsXyzNvMAcN2M38yxpeo8KD8=;
        b=GNfWOy9qbXi3GBmX0n8YoPRP3UU/3Ryyjii13glczRQjJUQn3IxAUIO9KJl+BGAExC
         FzlCphAKXNtrzSgwHwXxAQenyDAfQ1atXORkDIeorAWmKnE9oTG30EX8jmMnihgXQSfn
         DCy3hZ3BkY9ZUtrdXMybdfDMcivX1ck585IN5rF+zlshBfhxJyuu81NlyW88oZ+49kI5
         M/ErN/lRMfcvsNl9tkcT6E/8u4A/fNT1S0nYnqZRp0IjVIjUNayR+S5sQFTEpjY+u35d
         sDlSoRA8rUUrgqG20iBcHWemlBu34xeCw2tPSwT8e4EyvdjcJflxMtM6wre98pve2eWJ
         0wrw==
X-Gm-Message-State: AOJu0YzCG0A6QkeFYZIyaM5AaILTSg7BitVsajwtevsQjuaf58FSbRVV
	Qj5UHEeVY1vX3KdnU6LZn+1gZU8gAHwjwtKOse3oL6BYPT0wAx1x9IOW30fDJsovBPY+LNEpvDy
	MZCqdcVU=
X-Gm-Gg: AY/fxX6iPTnUM9Ln4HtWTVbDPQk/T1C4YqJzcfoRCJhFV+p7bZO24UFLmYQR7xYmqrm
	C3K9tV0winb07eOIp35Wzru5G0rHU7Fc/4V1XqFgikyjsEAmc8+8ILrzBcXwHEqRMj5gBAoA8ps
	sGPUMv+EsYg1bSRo3ertlx1hOCb2iu6ySAp//fTBtAZqPKV5p30UKjse0gMLe1hm6CBvobgmf4B
	G2tVC/NCV1kbP2zPFqNTlutvHTAcjSSUkFHt7DtxDCToE4vga/MCxvvV7wFidPkyDEY+uA+mdhh
	3igC4JuVkijmnFAzBLz6zCb9hBKdC8H/MODMs2ybaeLBWfcia7SxhhBmTO678tWZG6YzudGYupf
	KiTV+ITHLTdl/j9nmVPNrPmKksORlO04nmKLMSVOSTBQTdISJsb7hFLkRS9pDokWoB4ldFH00L5
	ZXjVaEFoC52Gio9sM=
X-Google-Smtp-Source: AGHT+IHBgxtQazZOqJBSjIymQ1dSEGPx5CTpF4X2lLYcAp+LGQx8X0suVD7fHFZ4sBp9pU6VZHw6Ag==
X-Received: by 2002:a05:6102:5048:b0:5db:debf:6588 with SMTP id ada2fe7eead31-5ecb675dcd6mr3721072137.9.1767971222198;
        Fri, 09 Jan 2026 07:07:02 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077268016sm76001416d6.46.2026.01.09.07.07.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:07:01 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/6 v3] python3: upgrade 3.14.0 -> 3.14.2
Date: Fri,  9 Jan 2026 10:06:49 -0500
Message-ID: <20260109150651.469332-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109150651.469332-1-tgamblin@baylibre.com>
References: <20260109150651.469332-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 15:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229130

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


