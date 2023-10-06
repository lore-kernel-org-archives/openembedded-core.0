Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0711FE81E19
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 16:12:13 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.17178.1696608727874230838
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 09:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=OstzJDag;
 spf=pass (domain: baylibre.com, ip: 209.85.219.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-65af1037ca8so12494396d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696608726; x=1697213526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q5gwuNHvrTIzjhuQrnNiuaU0ae4eaXH6S99Y3A92q2o=;
        b=OstzJDagj5bDsca4LzKH8Or8eqWdrXs5w+1oGOxR9qap0WNnjoY3EqydiI19Rk7qHu
         9l8pM0fGEFVlmc7vmwVUInSPpXGXTmo/rocpFr579ZjcNNHZovlNwac2JACR8uNLSVFg
         tVDSqeiH3dtatB5W6O1I5+7jwxPgBNPIubh/oX6owCRQIgu2uAx/BKxC+5bcY4mNGRhB
         VC/hMN2ZAQtRxIItyS034s4D0NjvU0quoJYMKym1FbVDLoKM4gRE819fCbdx06aA/22g
         2bnxlsgR5QPeKImSaCPxwk0+vsQHdR3B1QkVLHSycmHebiQe0XTz4aoLxmgZlMP2zgXW
         ubHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696608726; x=1697213526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5gwuNHvrTIzjhuQrnNiuaU0ae4eaXH6S99Y3A92q2o=;
        b=eN+zkj/Bg1vx91kay3ljDZFmlV930WC0y35ry/bV8CX+fzkb4uNI3N2EJus0kjUwLc
         d3klB+gT1YwWf1IeFgG2ngTXQU3FbHEAopvK/bZZY0ky+48AuYYDUUI/d2sw2Kj8pt3B
         i60HHsxD5oLR8fLKzRgGSsiK7Roq0/IDkle0ICQj/Ms/WN6Cp0+BCIgRtBeZG3s5fb/c
         CVgBnAIP0bInbcLGSHFFcwM3vEWPAk+aMpCBXiUaqB1B+LQFSaFgZCfzdwx8VvLYd7jc
         /egEVggddAdVtkmmYWSPDQZkfjxlA0mBDgx1stct6PRdjUimCBHpVLU07GbwFlVlUySp
         cxJA==
X-Gm-Message-State: AOJu0YwVLDqvcwS7QUz8BmapgG3YJQQoQGGYDw2OR/ncSrlAuqHoLms8
	i5ChAtFIDCLdoxD2re2p5mkFgdmu/Qc6JKeMEiZGCQ==
X-Google-Smtp-Source: AGHT+IEieyVoYCiw6Fo3tPYJ9cS8WLFKnDJXUM3xKESsPADstjqWvyJFfP5GKpPSYE4E4WzRWu/2bA==
X-Received: by 2002:a05:6214:519d:b0:658:8767:8d50 with SMTP id kl29-20020a056214519d00b0065887678d50mr10372198qvb.24.1696608726446;
        Fri, 06 Oct 2023 09:12:06 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id n20-20020a0cdc94000000b0065b1e6c33dfsm1496785qvk.18.2023.10.06.09.12.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 09:12:05 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-ptest: skip test_storlines
Date: Fri,  6 Oct 2023 12:12:04 -0400
Message-ID: <20231006161204.1651139-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 16:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188777

[YOCTO #14933]

test_storlines is yet another Python ptest that fails intermittently on
the Yocto AB, so disable it during ptests for now.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...orlines-skip-due-to-load-variability.patch | 32 +++++++++++++++++++
 .../recipes-devtools/python/python3_3.11.5.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
new file mode 100644
index 00000000000..199031d42aa
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
@@ -0,0 +1,32 @@
+From 013ff01fdf2aa6ca69a7c80a2a2996630877e4ea Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Fri, 6 Oct 2023 10:59:44 -0400
+Subject: [PATCH] test_storlines: skip due to load variability
+
+This is yet another test that intermittently fails on the Yocto AB when
+a worker is under heavy load, so skip it during testing.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+[YOCTO #14933]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_ftplib.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
+index 082a90d46b..508814d56a 100644
+--- a/Lib/test/test_ftplib.py
++++ b/Lib/test/test_ftplib.py
+@@ -629,6 +629,7 @@ def test_storbinary_rest(self):
+             self.client.storbinary('stor', f, rest=r)
+             self.assertEqual(self.server.handler_instance.rest, str(r))
+ 
++    @unittest.skip('timing related test, dependent on load')
+     def test_storlines(self):
+         data = RETR_DATA.replace('\r\n', '\n').encode(self.client.encoding)
+         f = io.BytesIO(data)
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/python/python3_3.11.5.bb b/meta/recipes-devtools/python/python3_3.11.5.bb
index 8e023c7dfb8..d375de4b19c 100644
--- a/meta/recipes-devtools/python/python3_3.11.5.bb
+++ b/meta/recipes-devtools/python/python3_3.11.5.bb
@@ -33,6 +33,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-Update-test_sysconfig-for-posix_user-purelib.patch \
            file://0001-skip-no_stdout_fileno-test-due-to-load-variability.patch \
+           file://0001-test_storlines-skip-due-to-load-variability.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.41.0


