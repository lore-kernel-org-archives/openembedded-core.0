Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDA2D5E38D
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 14:39:26 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24248.1765895957562177398
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 06:39:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MZ9D/spK;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a379ca088so22189396d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 06:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765895956; x=1766500756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMfk1fQfUJ+v7ew51paJsXyzNvMAcN2M38yxpeo8KD8=;
        b=MZ9D/spKGU6mrI6bpXJb+wyNqGbAuNlfCZEV0PUmyM5pfN8F9a5Frvdyl280NFS70/
         aBAjk0qIW/I2FZi5mxwBgESV2c9OCuE/ZiJzoIppEa4RsePxt1kBklYEu1Dp9TDn7HM6
         v4G/GhCvz1Ujniuv2wOTo05oLdBmp51/5+4t5fy0rHaqWRdYw3EbwooxEMhT/Ce4IB+1
         t//oyoMs22K6cxRI/7YSyuPJOydaH5+9i4bLbVKPZo7tWpPgZ7q8nzhiRYdE3BjIc3XQ
         x/5uqDI04Y+hkVXVbLKzCmFa4fdy7nlf3n8f8OBOp4NFAx17IddO3cJ6GBuRKsxy5poq
         yFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895956; x=1766500756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMfk1fQfUJ+v7ew51paJsXyzNvMAcN2M38yxpeo8KD8=;
        b=J318+nLo6saaX+IgZj4wgPW3UDBiaooUYVZsO4P1qiZNQHCis5gJZZt8Ib7cFv+oQg
         LZQsbjDj7jbXQl15KYRm2teSmeU9DMPPxqtey4oCOx8Rjyq1+X9eYcsrdbh7T33pGk6x
         JQ24v7p8LGfJCj4rrrKVbSIWYRcHLih8F16kBrPUqPS8u1scqyawqVNXCmrwbrd2SLQB
         EXbN1C7WcQLiu9yezbcx35LysfJCZrD+ihzk5C6hI/v3IIZu7wDNy7+eJoRVFid1XCtF
         o/7YOSsmC3Mm2rgOBSZqDRLMN8ziJ5gS/Te1jkIm81Hqkyh8lY9Tiz0kOncMwaM+kd5b
         7bbA==
X-Gm-Message-State: AOJu0Ywoz3FIGMl7829+HHGTiVsYHKrWJDwLNUSkIrSG6gwGqzO8lPjC
	oim3MLdjcU0Di4uPZOo9QL6RKyGxMK42unZ8WHTT07QfUYdp/M/MZQ/AyNdHg4uWleqI1LHrWWr
	fxyRcTjw=
X-Gm-Gg: AY/fxX5dqvGmkORrkD9MqaWZxBqDVpXruLmeWpoLhsjAZ427U7/yhtnBE7SNu01Qnw4
	t/ZGGp9tPVWBrg+Y3Qt9yUdFeHa6PdyaPaFhqkgXouFt8XpaNyBySmH2DzqZG7OvoDwm314RQML
	6Bw47cc5pDydyDaEk/0WpHZrAObj+LhBKMwZ1gH0cHOj9BPsamlBTS88snxPS8+e5hcdx/V83O2
	e9Ca4Xecq+yWt0qIJPWtzCNFICGGvoaMH79XG7xa7woMBUuFyN3kTXuu21c7etU5+7Z0/pMU1SA
	3K4Eesryv/huo51Ciqe4p8DJ7ngX9VNWy7rEssCJZHTNHg9HMQ2gJfmEmi50cmG/ekD/ns/nwQN
	29DJWxyTXcYs7QEQ3BHS6MvcVuDIIO1sRRLmpK4xDFyl49XXzO1ctDmuVjOfop4eJrN5Zcce0q6
	zN68Mk+bKRb9t0cHzAg/w4ou0k5A==
X-Google-Smtp-Source: AGHT+IEqtvKeX3MYasoprBZiQut58e5OsiiS5wJQEtoSZFK1r/507k9+D8Iy0jhwiSM5apRmx3NyKQ==
X-Received: by 2002:a05:6214:2b87:b0:86b:9167:b0e9 with SMTP id 6a1803df08f44-8887feff208mr221630076d6.4.1765895955675;
        Tue, 16 Dec 2025 06:39:15 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8be30d86b00sm193277485a.20.2025.12.16.06.39.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 06:39:14 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 5/6] python3: upgrade 3.14.0 -> 3.14.2
Date: Tue, 16 Dec 2025 09:39:00 -0500
Message-ID: <20251216143901.2542490-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216143901.2542490-1-tgamblin@baylibre.com>
References: <20251216143901.2542490-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 14:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227960

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


