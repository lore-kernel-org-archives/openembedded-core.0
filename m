Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99175C27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 17:12:32 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.25359.1718039545637914658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jun 2024 10:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=NReUa6Oe;
 spf=pass (domain: baylibre.com, ip: 209.85.128.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a2424ecb8so43365667b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718039544; x=1718644344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/rvO60PVPE2lgyBds/GguhDO4bnTIiXz+lNSRFVuA0=;
        b=NReUa6OejUgjp7eJRuQYD7P2x91lAC6wqQLIMLBcJPajF9WjhKvFmHeWA+RktQfmxd
         n0ZywtDpTkr9W3IqHlgdXdLujHOG0IDVtIgFZnAa/2OPSkwBomOCz7ryf7zim+L4g0or
         Zaz9ulfdm36w4itxAmV2VVgl0JcMhrSVSn+SFEFqc633zM+Q1YpaEkHib6qhHgGJid6A
         HH7NWLMg77tIRuD+Ertshekuf+iJJoLKGIxs4fK4VkTPNSL/I+IFowWgRLyyXzlR+b/1
         hfDBl4UDtISt5s9JIFT4AB80ZRz3TgfPBgGxptWkSDLDMAShCExBOHbCHiSKxysZ7G/Z
         h6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718039544; x=1718644344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/rvO60PVPE2lgyBds/GguhDO4bnTIiXz+lNSRFVuA0=;
        b=cy2LC8TQTvpZHOWCdYSdF3cSoSok+vs5L0OUHcPx+YoImfC23VkiX9fxs6hWdQklDP
         DKO2dn2cYcasj0cXkUCMmnZj9IOrFrfB0+4Qa7Aab3uTQvrNcn3ndl+vGuBNyd5tdl7c
         DNr+/CiJaNX58JWjo7K6x3UaAf0hV06flddabx2Dzbtv8gjZ0+oEhEX41fCJoAT+YDil
         DgcvIxLm9TbW3b7gzqrWdXyY8PcJPrBwwXLZWS2vj9xPU67SokQ1+DhMisXxjdgnGSV2
         iaIyCVnrWYdF3QHs0Vq5xYpu39aC0J3kYkG9hRzeGsC32izS1cGT1I1WIHLvufQf5DOa
         4xgg==
X-Gm-Message-State: AOJu0YwoJPIXuMSJ9X0NK3z/rnr5aHk4LlboskW0s1RVJ+yp/7JT5fzm
	bMN8NGIZLsjW6ixqj5JAZq3wV8HwLd0d2fizcdt9QBnivDYJUv8vN0KA3FKJKrITiv1qrkIFXxI
	b
X-Google-Smtp-Source: AGHT+IGcmWjZtbVJ7ZACRhQNQNsqkr0j9cxUp7qOr8m+nBsm0y9If/0MYp+y6zvt0RHnusH2AV8JCQ==
X-Received: by 2002:a0d:eb87:0:b0:609:ff2d:1814 with SMTP id 00721157ae682-62cd5668c43mr88882327b3.37.1718039543721;
        Mon, 10 Jun 2024 10:12:23 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b081482b5dsm8992286d6.33.2024.06.10.10.12.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 10:12:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: upgrade 3.12.3 -> 3.12.4
Date: Mon, 10 Jun 2024 13:12:21 -0400
Message-ID: <20240610171221.766534-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jun 2024 17:12:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200482

This release contains numerous security updates and fixes to
regressions. Changelog:

https://docs.python.org/release/3.12.4/whatsnew/changelog.html#python-3-12-4-final

Results of ptests in core-image-ptest-python3 (qemux86-64):

== Tests result: SUCCESS ==

26 tests skipped:
    test.test_asyncio.test_windows_events
    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
    test.test_gdb.test_misc test.test_gdb.test_pretty_print
    test_asdl_parser test_clinic test_devpoll test_idle test_ioctl
    test_kqueue test_launcher test_msilib test_startfile test_tcl
    test_tix test_tkinter test_ttk test_ttk_textonly test_turtle
    test_winapi test_winconsoleio test_winreg test_wmi

9 tests skipped (resource denied):
    test_curses test_ossaudiodev test_smtpnet test_socketserver
    test_urllib2net test_urllibnet test_winsound test_xmlrpc_net
    test_zipfile64

454 tests OK.

Total duration: 2 min 45 sec
Total tests: run=41,470 skipped=1,548
Total test files: run=480/489 skipped=26 resource_denied=9
Result: SUCCESS
DURATION: 165
END: /usr/lib/python3/ptest
2024-06-10T17:03
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../python/{python3_3.12.3.bb => python3_3.12.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.3.bb => python3_3.12.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.3.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.3.bb
rename to meta/recipes-devtools/python/python3_3.12.4.bb
index e74c0a27aa..49c134fc7c 100644
--- a/meta/recipes-devtools/python/python3_3.12.3.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -37,7 +37,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "56bfef1fdfc1221ce6720e43a661e3eb41785dd914ce99698d8c7896af4bdaa1"
+SRC_URI[sha256sum] = "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.45.2


