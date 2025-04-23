Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D012FC369D1
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 16:27:28 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.92.1745425638874315910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 09:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Qu8R5LXq;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6ecfbf1c7cbso639236d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 09:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745425637; x=1746030437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0sp4iP6cICRD6HwV7B1yf+WP/gBri/vm4uzcPczyNhI=;
        b=Qu8R5LXq9uajHzdzxVJcFo8cfv9AfWqM5nof4pV8PIHijyOO6b7CrfIJEn+d+Sxgu6
         yZOXnCqcmeZ4QEZJo1+8rQunhz/f0n8lopOVkvvaaYeWoG3IoQH2p3rcZdgjhZiutUGP
         +tjDXxkaJyuseAWwNBTo1LNb3L20pc7tcAoHlnCRrCTMlb1gkFl/8wEtIi3v1k6Irx6s
         mGjTWHuHCnlI3M9QrnBzrSaDnpV0qAsi9UOVn1CaL7dbWZ3OZtkJ/D4AujBK1VTLb9cT
         7saYJxyqHQJAg3Yf5VbLViiAvAbt/gq4PY8lHQpIPzPrwVQkf4rro7O8gbz1ANnemXys
         kGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745425637; x=1746030437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0sp4iP6cICRD6HwV7B1yf+WP/gBri/vm4uzcPczyNhI=;
        b=J0OXcwNG5wAveBM+SMMI2Z3ED5m46tQFXOD0ZeNQjuHC67r3bF/Jr+b+k4UHFM2+l9
         gETnTJn6FlfHM7ZJQJFU7CgDE1hqLaivY1eFwDoICypCDKb4tqEk4vXEXfjVbU3STQGK
         81H9pKAJkFA3QhTkQSTAvUCygnB+gzKhzHGCKR/KINS4UGuAeSNdm4Ibzxt9jInrK8yw
         3BT+blfMIVtn2HDYSaWl028InZV59Ajgama4AJu9ae/Po/ebNGklC1ddFU8aO4ufURG9
         P21N9iIzxVS/nrch+r9tOthvKKfc62uzhrXLAzWANmtF6eo4fUxZTD1dkOIsov+uEcg4
         pGRg==
X-Gm-Message-State: AOJu0YwEv2kajVyYYbP3S7FozVHe6kpOANPSLalWQ15gHxIjAJXdZj75
	K2vH/bRlFHRtucst25Jt32/+QXbeTwxvEoSu4CgwFshA9DO54O7/ly7vy2JwHZDqnY80K6UMvaL
	J8gQ=
X-Gm-Gg: ASbGnctpqNUofkJZBsliBjFsvocuJ0/YncqwBFwUFHuIU5uvawoLayIYcczcCLOz6Bl
	W79YoUMb4UeUpAHoszCEJ8dcTq7ufaJdhF/t33e45HuFIyXUiXMs/IOUHg6gVqO0f9tFdiG7/Jj
	ZQhMqHVgP0L9Tx3CSBwjwLkZV7tW8P+/SykI3iiX8KeiO6QSW2a7mn6dVbBSBYBI2bfsGCHdpvK
	xNIAapy+7uvAFNXQjBapKaaXrHKFbWqaUySfwqw+Oc8/ZrUK2xRNaQveHOjMMTeHD88VmdOF8DR
	yAsUm1rbF8k7jNN1OuabDxX206UzF2RWXJ3xl0eAV3FsU98w7g6kwakwiu+IZLt5aDpA7VFiIri
	F
X-Google-Smtp-Source: AGHT+IELkL/CK3tiDHm+Va34TMJGGU3uW7bmYf0jAf3RMmyNsNCrhmj0rLOMShSt4MMcDryZam1+/Q==
X-Received: by 2002:a05:6214:5cc:b0:6f2:c9e1:8511 with SMTP id 6a1803df08f44-6f2c9e1f24dmr242718876d6.39.1745425636852;
        Wed, 23 Apr 2025 09:27:16 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c3a842sm72024036d6.119.2025.04.23.09.27.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:27:16 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: upgrade 3.13.2 -> 3.13.3
Date: Wed, 23 Apr 2025 12:27:14 -0400
Message-Id: <20250423162714.2261296-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 16:27:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215317

This adds some security fixes and many new changes to the library.

Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-3-final

Reproducibility looks OK.

ptest results OK:

|----------------------------------------------------------------------
|Ran 81 tests in 4.331s
|
|OK (skipped=2)
|
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
|Total duration: 2 min 51 sec
|Total tests: run=43,896 skipped=2,268
|Total test files: run=471/480 skipped=29 resource_denied=9
|Result: SUCCESS
|DURATION: 171
|END: /usr/lib/python3/ptest
|2025-04-15T17:54
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3_3.13.2.bb => python3_3.13.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.13.2.bb => python3_3.13.3.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-devtools/python/python3_3.13.3.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.13.2.bb
rename to meta/recipes-devtools/python/python3_3.13.3.bb
index 0f0505c66c7..4977808cd30 100644
--- a/meta/recipes-devtools/python/python3_3.13.2.bb
+++ b/meta/recipes-devtools/python/python3_3.13.3.bb
@@ -36,7 +36,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "d984bcc57cd67caab26f7def42e523b1c015bbc5dc07836cf4f0b63fa159eb56"
+SRC_URI[sha256sum] = "40f868bcbdeb8149a3149580bb9bfd407b3321cd48f0be631af955ac92c0e041"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.39.5


