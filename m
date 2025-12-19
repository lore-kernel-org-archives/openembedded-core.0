Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC30FD78776
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 13:47:49 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17008.1766152067082589586
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 05:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=eA+eC758;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4ee0ce50b95so25183271cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 05:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766152065; x=1766756865; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rMfk1fQfUJ+v7ew51paJsXyzNvMAcN2M38yxpeo8KD8=;
        b=eA+eC758Z+JbU81bfUxce8Yu+rNvVvY969ykXLatM7tKqp/lxp5BrimLvOUq03DQeg
         V/mlYrpbUfkcgaOBBU5x2UgXMqqY1d+XwccNuaJWA9pi3hMdBDYhPfeTQw3TDAtzZc7e
         mIbKfcLHxSOng2YtXfByWXPdPiJ2ilbLisILW+t4p0tq6Hm8oqxQhcRtDAB09V6BM8sV
         FPAnqkeEEuZV5zHCXWwtn3BnBls0/2ylgCW4dHOSh0B/1wANOhpkIUX5BzduqLVyGz2+
         tZ81B0WL7ZgyeUC3yj0/PG8lC3IzfSsZYYQATfjgEafvfoFcz0hvI7JZP27+Pk2+hds3
         m19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766152065; x=1766756865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMfk1fQfUJ+v7ew51paJsXyzNvMAcN2M38yxpeo8KD8=;
        b=RN+AWX3R3XOR+5+Tm482Ldc1NGyNwuRz5FG6fBtt+qWp5O1dYgcPl3TC0yxuzANsws
         7GqjM2fngF1QurjghPYG7y9lZdKaC8RsooCHb4VhRQjJ2i/Mgf6zu5rk/z+3NRLLnnRz
         5sQt6arWIF8DqjnQxBX8ObSfD/6d5E/HCCdhyWJJDuHUm/sxoCxAeVvA+6mEhk3CLfNd
         S+yMX8AFvsuYMF16MtNkyzx1CwHBPpETfH4cZ+NxdTbZi7EYxRmT8UFobnoOsXsfmPkB
         9BMOl4yX63VzW58+wXF7FL4pgMBXXPgl5phz0Gw07BEuSdVyHzv1ukvDY5bOsANfwDQv
         ltoA==
X-Gm-Message-State: AOJu0YyJAetq3fKtif6uJLBC9ighRa69LrK/xmXIQa67yQEhdly3x0G4
	lvEsC0ImDVhSMLchMQP/o9f8KVZyfwSnnznCuqb9Ko8Qbl4WhFGoiP0Q2NXvE8QpAG9t7MB5lha
	iTlLFY7I=
X-Gm-Gg: AY/fxX66H9HJhWfdxXIHPkz5fstyZGdsSGsepZ8jpN0boRX25k9WfBakPPkAw0Z9uDo
	dsETM+1owLLxtsYQg2NYtcWS2Kt4yb0icVCy77guzqHXZ1v43yIdT8Hl+2HNkFImvhHnwOXRMAm
	DwAB89Ju4rbIt69zy7hqH/mvkKecZ/QsHNdx/RdpOHWpqeTcmUfktVPbQm0mGcOLKrpiyKQP5kW
	7rPQECJ1wzwFLTpMGevEqLwn3QonWEAEqvw/njddbK1z08x+lyEI9dHSz7vp6ev6occIXVwZ5bp
	YjCDBB+uOvHhVNG66j8wGNct42aO9ERZjZP1fu5P+ZGh6h16qEUPMV7FIsj5qoJWICC2gg9ki9J
	sxO9SOg/YFxyC5sWra10UiKQwsf41Tk11Nu7BgtDlvA0IhciXt3auVlGI9+n+mou3ZPYd/cMhFi
	1iM7Omer6EfHg+un8=
X-Google-Smtp-Source: AGHT+IEOk2rc2Jcv+ZV0kzxCMmY3PsBayMXThOP0hVG/XPVUgk8I0DX61njvInzdzK7yiLdhFaejqA==
X-Received: by 2002:a05:622a:5791:b0:4ed:2715:6130 with SMTP id d75a77b69052e-4f4aae2ef81mr47810011cf.36.1766152065270;
        Fri, 19 Dec 2025 05:47:45 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac4451afsm16769251cf.0.2025.12.19.05.47.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 05:47:44 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5 v2] python3: upgrade 3.14.0 -> 3.14.2
Date: Fri, 19 Dec 2025 08:47:33 -0500
Message-ID: <20251219134734.842422-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219134734.842422-1-tgamblin@baylibre.com>
References: <20251219134734.842422-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 13:47:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228236

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


