Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F318FC001DF
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 17:25:57 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.2155.1689096348438354849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 10:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=dDtoaoRe;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-766b22593faso435744585a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 10:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689096347; x=1691688347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPRTxXGhgbGjkoQfHRb5F7WpJw9JU2vEo8CTLiGaeII=;
        b=dDtoaoReplSBT9JpudwxgiohiNmfj3EcqKNpqJhs4AEYTEoXWokEIgEdnOG0FeI/lb
         DwkHUJElIj9os737+mJQa39eV1ZpRZsfanGbyW/TpTHVMbupcb+ae44dT6oU4nnOeHSN
         Gr1MIuYbszFqif1Y3k0IlTteEczGtSpOiCzrjB2jwW9gdvLstLjS/WcIB0K/2eNleoWI
         EZb0HoFUMFR24OgeRImmmku2IBzcJ+4i75p6J5TYex4sym48mks/93WU+1xTTSUZCIzL
         yFwt9GpCyzPje69t0ovvRGcNnRq/GWB9bHyUUfZXygzp4jeMcgmboi0Baa3XYEyY63j7
         UKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689096347; x=1691688347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GPRTxXGhgbGjkoQfHRb5F7WpJw9JU2vEo8CTLiGaeII=;
        b=Oge2gU8eNn5G73ewPwXx7e3Y8Mzqx20k7hDqiLEPQYgc36wKd3xfOBjK8n3UGOTDRP
         BZvpMXsiT0BQL+M8CrsUWC1/f0IuCX/9G4BPs7/QUf9wyCUBsrXHnojKGNzzNOL+oGeT
         5W0bWpS6mtjHtGyzRqJORst8ZQpCRLSdCySqU4IdUXZdNYBqMmlWbbCYV3EywZmzbLzo
         z6DCIXri5hRQVgg33OLcqR3wIUfLxWGokP/Ipa9eQthh4/GT5F37JDFSpIEAW+BeyZO4
         6bU5NBNLdQGw5rBkj55J7altIpVxO5c7hiHxjlKjNxMFomGR7hHzzMHf0yTZWOXoQIAx
         o80Q==
X-Gm-Message-State: ABy/qLY/TAXhVo1hgDD/E8H2AGvk6SzWVWpy+YOmJkA/8xEt7vJVAG1Y
	pr1339VT1w+TLua6+lU7GdJG4Nkq78+v9ksE2Lk=
X-Google-Smtp-Source: APBJJlFM95lgI9J/1mbZNCNBrrdn6qgULn1nnVkC47wVXTKK2Ftc7edj5csROlyLvh3m6h8jCniUQQ==
X-Received: by 2002:a05:620a:298c:b0:765:abeb:a148 with SMTP id r12-20020a05620a298c00b00765abeba148mr20974039qkp.37.1689096347057;
        Tue, 11 Jul 2023 10:25:47 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id w25-20020ae9e519000000b007676f3859fasm1208919qkf.30.2023.07.11.10.25.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 10:25:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: parallelize ptests, add test_cppext dependencies
Date: Tue, 11 Jul 2023 13:25:45 -0400
Message-ID: <20230711172545.738677-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 17:25:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184149

This is based on a previous patch from Alex Kanavin (thanks Alex),
but it retains our use of sed to parse the test output into a usable
form. The intent was to use the test module's --junit-xml feature and
parse the resulting log instead of using sed, but various errors were
encountered when testing this method, so that will need further
investigation before we can consider adopting it. Two missing ptest
dependencies on python3-cgitb and python3-zipapp were already merged
in a previous patch, so only gcc, g++, and binutils were left to add
as ptest RDEPENDS.

ptest output and runtime with this change:

== Tests result: SUCCESS ==

405 tests OK.

29 tests skipped:
    test_asdl_parser test_check_c_globals test_clinic test_curses
    test_devpoll test_gdb test_idle test_ioctl test_kqueue
    test_launcher test_msilib test_ossaudiodev test_readline
    test_smtpnet test_socketserver test_startfile test_tcl test_tix
    test_tk test_ttk_guionly test_ttk_textonly test_turtle
    test_urllib2net test_urllibnet test_winconsoleio test_winreg
    test_winsound test_xmlrpc_net test_zipfile64

Total duration: 5 min 3 sec

[YOCTO #13298]

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/recipes-core/images/core-image-ptest.bb   | 1 +
 meta/recipes-devtools/python/python3/run-ptest | 2 +-
 meta/recipes-devtools/python/python3_3.11.4.bb | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index ddc56c8f9f..74cf933b72 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -26,6 +26,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
+QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
 
 TEST_SUITES = "ping ssh parselogs ptest"
diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
index 05396e91ab..ee1130284b 100644
--- a/meta/recipes-devtools/python/python3/run-ptest
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v -j 4 | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
index 86ecc4e297..2d7b1bac2c 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -426,7 +426,7 @@ FILES:${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS:libpython3:append:libc-glibc = " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed"
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-fr-fr locale-base-en-us locale-base-tr-tr locale-base-de-de"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
-- 
2.41.0


