Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90822EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:46:00 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.23033.1688651160045436852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 06:46:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=U/1n72b2;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76714d3c3a7so71773085a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 06:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688651158; x=1691243158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0MKDGcikqhGKpyvtD3PxBlpeOM8U5nw9e9E8/O24MyQ=;
        b=U/1n72b264VewFg69Nu+5ekQYaq4s1uzXtZxzHFI5ec1GP2PCy0TyQzuqZYDzBanmN
         2vRnuYmfY4Yq2FClOzadjQEIqlzYujagPu45Q9VFNwhCxmhhNXJ80aGvwpxt8ZmKUHiy
         CJBR7iM5qzJp+uwb5v1iNkIk0N0tcmAdpZ7uZoTy/Bit+FwpyeXRMbc/TAZk76ATwaK7
         yxmWs8hQm5YIdHEtR4lY4SXBqJfBTjEUziqi6W0C2VhIRT6fOuNNw6kInSzuomBUj8Lf
         YQuyu+NNP+myOcxZrY4kk3C4Hm/M1c96wgRRerMRdBmRXDd7q3xi1ky5qybBtPPJYNkA
         CLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688651158; x=1691243158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MKDGcikqhGKpyvtD3PxBlpeOM8U5nw9e9E8/O24MyQ=;
        b=c7TGsyrbUgaasxrfaNUAYvymUD8kTxuPx1oAnV48M0Kj+2c+M4m3BrJ0/3lMbWdk90
         W8fQPbrJL1TGujh6El/y8B9OajB0UhqopwpPwCF6FZrgY/OvAZUbEL1lHK1gPVVE+vxl
         hEHjaZi1TOLm0CD6O/x6YbRTofGUZcfalBubAAUtd/fheo/GI4k1s4ATqPicw8VsAs4n
         AuFXzbo0UC2IFXthj5Pr7KX30wh0+e2at3TIlw6tl1u5bPynRITBB/v50H3iGVHO4Hxv
         lhHzQ9TurEmkxXq325WfFSlzweSXliLAPoLh9Kygz5ILYTljX9K+DEkx81cP8BXQwhsE
         VsCw==
X-Gm-Message-State: ABy/qLbOWVzBleE5h5hEBxtHrSQ53TKU0xfWhm36QKKox7PPy5l9exsi
	3i9IgXMgEg8tCWWW0b/9m4uKYP+XBCl3f9s79IA=
X-Google-Smtp-Source: APBJJlFJJz7N754mQHa6ZlJJWvA50IkQ9ZUZM+OYIrvCpgmBHkjntg+9XrDAaxSg1enzUJvgCZKd3w==
X-Received: by 2002:a05:620a:4782:b0:765:5441:3193 with SMTP id dt2-20020a05620a478200b0076554413193mr1779746qkb.6.1688651158533;
        Thu, 06 Jul 2023 06:45:58 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i21-20020a05620a075500b007677f66b160sm728648qki.124.2023.07.06.06.45.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 06:45:58 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3: disable test_cppext ptest
Date: Thu,  6 Jul 2023 09:45:56 -0400
Message-ID: <20230706134556.2824413-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 13:46:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183947

This ptest requires gcc, g++, and binutils to pass. This is a lot to add
for one test, so disable it instead.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...-test_cppext-omit-from-python3-ptest.patch | 37 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.11.4.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
new file mode 100644
index 0000000000..9fca815368
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_cppext-omit-from-python3-ptest.patch
@@ -0,0 +1,37 @@
+From 11f77795efa9aa15b0459006a16e3bbc72ec69b9 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Wed, 5 Jul 2023 14:29:33 -0400
+Subject: [PATCH] test_cppext: omit from python3 ptest
+
+These tests fail when running python3 ptests because gcc, g++, and
+binutils aren't present. This is a lot to add to the RDEPENDS, so
+disable the tests instead.
+
+[YOCTO # 13298]
+
+Upstream-Status: Inappropriate (OE-Specific)
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_cppext.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Lib/test/test_cppext.py b/Lib/test/test_cppext.py
+index 465894d24e..93b71d5100 100644
+--- a/Lib/test/test_cppext.py
++++ b/Lib/test/test_cppext.py
+@@ -17,9 +17,11 @@
+ 
+ @support.requires_subprocess()
+ class TestCPPExt(unittest.TestCase):
++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
+     def test_build_cpp11(self):
+         self.check_build(False, '_testcpp11ext')
+ 
++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
+     def test_build_cpp03(self):
+         self.check_build(True, '_testcpp03ext')
+ 
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
index 6b074c48cf..6a471e706d 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -32,6 +32,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
+           file://0001-test_cppext-omit-from-python3-ptest.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.41.0


