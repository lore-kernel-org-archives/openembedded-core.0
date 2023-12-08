Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D93C10F04
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:39 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.11143.1702002818471187046
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=osVevNZz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d08a924fcfso14843585ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002817; x=1702607617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c79vRigKah5WGQ+zaQb4Whks6tKwpTVaF1sgLWxe/og=;
        b=osVevNZzM3AGV75tfmnPsQFZ/HxJt4BciQpR62g4U0OXaEOjBa/UmogkoniafV5xt5
         ejR9ao/6yCGbPhNUDspGKJRQee4GEscI55aGbmz5GGxBR/90PzQxjT4CMmZRw5r0O6hY
         0B+M2Opff1xwScseMftJBvlfhCrUm2YTBAFRos5Yhiy4JgKEtHdUcndAlfkFlJaB+pXW
         SP+zpaByNNA4Wl3GjBhtqzrYVTbQqKF5v21zJ8Us+ZuL4SM/hE90hvw2c2i00ygRzvE0
         OTi7wW6lHqWGjWlfFq7pKK7Rtyl0eFqf3a3IZ/nACNOrhFROdBf06ZuecP4Y4wJ75Esp
         qerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002817; x=1702607617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c79vRigKah5WGQ+zaQb4Whks6tKwpTVaF1sgLWxe/og=;
        b=nDA7fVEmkekC/KfqTC6L971PZh2iL759ygIuWQRUkVMhWtDsPlb/JSwlTor/E6wZdr
         dgZJ3knttgviO9NlIIDrXMFZR6JX8F/icQrYPOGDH59MgGNoPmQHEcyRuNqtmqHn3qjK
         g1IyzmKYvEDkMdme5VIDhtohWhy2ckbM2YDM7ln5ZT+BPjS5bEiG8UMZiGbu+zCA0FPy
         zxrwI5XI9wet4nn/f5DUsUUbV3ZUPQr6FqK9PYWfx6Sy5pAn/nvuew/z1u5EX+VzKfof
         4VThkTyob9KVx32nnQD2V7nf0ZnsCBqQYAugDZcaS6CD4x06gAQevuNs2BCxPCcDfEbl
         N7rA==
X-Gm-Message-State: AOJu0YzzW5qwA+mzuWq4m5V4NffADpM4yAtLioPppNw1gNoN5Y3pbACR
	YPgFefleuxrb5tOv95UA5orjQXUTyq72u9VDK1Q=
X-Google-Smtp-Source: AGHT+IHLRxZOfQfByrGdpHnYjV1O794wzSqvn5wU66+89YCr1KIqkKe+h+ljc0baqC2wfBtikb0oJQ==
X-Received: by 2002:a17:902:e88a:b0:1d0:68a:4a46 with SMTP id w10-20020a170902e88a00b001d0068a4a46mr4359214plg.3.1702002817070;
        Thu, 07 Dec 2023 18:33:37 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/15] xwayland: fix CVE-2023-5367
Date: Thu,  7 Dec 2023 16:33:08 -1000
Message-Id: <9c21b08c18414bb61abebcbbb8704946ea288a7b.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702002667.git.steve@sakoman.com>
References: <cover.1702002667.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191994

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2023-5367.patch     | 85 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  4 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-5367.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2023-5367.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-5367.patch
new file mode 100644
index 0000000000..d4da1ecb4b
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2023-5367.patch
@@ -0,0 +1,85 @@
+CVE: CVE-2023-5367
+Upstream-Status: Backport [ https://gitlab.freedesktop.org/xorg/xserver/-/commit/541ab2ecd41d4d8689e71855d93e492bc554719a ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 541ab2ecd41d4d8689e71855d93e492bc554719a Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 3 Oct 2023 11:53:05 +1000
+Subject: [PATCH] Xi/randr: fix handling of PropModeAppend/Prepend
+
+The handling of appending/prepending properties was incorrect, with at
+least two bugs: the property length was set to the length of the new
+part only, i.e. appending or prepending N elements to a property with P
+existing elements always resulted in the property having N elements
+instead of N + P.
+
+Second, when pre-pending a value to a property, the offset for the old
+values was incorrect, leaving the new property with potentially
+uninitalized values and/or resulting in OOB memory writes.
+For example, prepending a 3 element value to a 5 element property would
+result in this 8 value array:
+  [N, N, N, ?, ?, P, P, P ] P, P
+                            ^OOB write
+
+The XI2 code is a copy/paste of the RandR code, so the bug exists in
+both.
+
+CVE-2023-5367, ZDI-CAN-22153
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+ Xi/xiproperty.c    | 4 ++--
+ randr/rrproperty.c | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Xi/xiproperty.c b/Xi/xiproperty.c
+index 066ba21fba..d315f04d0e 100644
+--- a/Xi/xiproperty.c
++++ b/Xi/xiproperty.c
+@@ -730,7 +730,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom property, Atom type,
+                 XIDestroyDeviceProperty(prop);
+             return BadAlloc;
+         }
+-        new_value.size = len;
++        new_value.size = total_len;
+         new_value.type = type;
+         new_value.format = format;
+ 
+@@ -747,7 +747,7 @@ XIChangeDeviceProperty(DeviceIntPtr dev, Atom property, Atom type,
+         case PropModePrepend:
+             new_data = new_value.data;
+             old_data = (void *) (((char *) new_value.data) +
+-                                  (prop_value->size * size_in_bytes));
++                                  (len * size_in_bytes));
+             break;
+         }
+         if (new_data)
+diff --git a/randr/rrproperty.c b/randr/rrproperty.c
+index c2fb9585c6..25469f57b2 100644
+--- a/randr/rrproperty.c
++++ b/randr/rrproperty.c
+@@ -209,7 +209,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom property, Atom type,
+                 RRDestroyOutputProperty(prop);
+             return BadAlloc;
+         }
+-        new_value.size = len;
++        new_value.size = total_len;
+         new_value.type = type;
+         new_value.format = format;
+ 
+@@ -226,7 +226,7 @@ RRChangeOutputProperty(RROutputPtr output, Atom property, Atom type,
+         case PropModePrepend:
+             new_data = new_value.data;
+             old_data = (void *) (((char *) new_value.data) +
+-                                  (prop_value->size * size_in_bytes));
++                                  (len * size_in_bytes));
+             break;
+         }
+         if (new_data)
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 6919ba421b..94797be8e0 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -9,7 +9,9 @@ HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
 
-SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
+SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
+           file://CVE-2023-5367.patch \
+"
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
 UPSTREAM_CHECK_REGEX = "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+)\.tar"
-- 
2.34.1


