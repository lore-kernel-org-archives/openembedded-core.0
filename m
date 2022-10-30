Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B53ECAAA1
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 13:39:04 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.8365.1667137142340087535
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 06:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YmHJI3gH;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: flowergom@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id cl5so911395wrb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIawP1Fqv2zjLwA8h/hJd5cPi/pLMDSSekK17g9kwm0=;
        b=YmHJI3gHWE0f2yKxPOao2Tr5gksEUHjgwyldEU2LcYZm43uSZ6zXuBPNbhty7AM+ic
         jJw1HfHHcrSLfPtNg1DC9Mpbvoim+0eE/waAtIHeGQE0xnx63AIpoX4mdnyagl6ZnFP9
         Iwm6SoCbl1MOsV+ySOi+t3Tr/FD1Q1pVR9IKWBy/8lHMLyQ3469rIbnr2pUTD0JvF/8y
         ojiI5xk0kkq8B1KjmWKW2SIyYbwkSnuYX51sSLhDZ9fymUlUfjTmPnpbL+LJpGo7VmRh
         XvUAjhOHcpsR7skiYjogC1OWgKj8ovcIYXSdO/wBIpFqtJIZzxWdK6A9mnxxTABpHtsa
         LHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIawP1Fqv2zjLwA8h/hJd5cPi/pLMDSSekK17g9kwm0=;
        b=VTTNKZv/P7fXD+qXc5T9pff450DO1wvdEbYFDhw7TumPmNezA7TYrB6IPlSj+TPjNc
         KJIFMdlfy7d+zlLl113svvSgMDHxHyXyu7kKXGAWPpM0lsOny+GOhF9TIICAjDYu0Qpa
         ZZzFdmeH9GKOM9APeF1JqsSSqvDlTS8vtqWQ7kN1zSGAig2OHgOlCXJKLbnQ8LBuft7k
         IU3eXWMr0Mv9KreKg5SLvTgci73wBVseYSE24hSVosZFL2yKNNFHqLWIOswsrSrB3VXI
         5HA66UhwhPnJA0GD6R3dHcTkVx+w6rHjjgX3KYpP4ex9ZQWzvRd6LWJiabb9rP7xbLxC
         AHgg==
X-Gm-Message-State: ACrzQf0zefmo/Mk8dwx64ZD5fMoPNupzFn0XttY/RFzEej/GXZKGoHSu
	LfGPhjdMHl9I8x/rsbEYuUgtHjYh1ao=
X-Google-Smtp-Source: AMsMyM4kaLE3w9LpvIbpIcv4jCsLxDEcT2Ux9y4OOfezp146oxo6Mq/eRPgNcMAPhf1B2J6L8R9UBg==
X-Received: by 2002:a5d:6185:0:b0:236:776f:2bed with SMTP id j5-20020a5d6185000000b00236776f2bedmr4924852wru.535.1667137140169;
        Sun, 30 Oct 2022 06:39:00 -0700 (PDT)
Received: from f5a5b6a73ef9.eu-central-1.compute.internal (ec2-18-158-203-36.eu-central-1.compute.amazonaws.com. [18.158.203.36])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c3b1500b003c6edc05159sm4559132wms.1.2022.10.30.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:38:59 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>
Subject: [dunfell][PATCH] xserver-xorg: backport fixes for CVE-2022-3550, CVE-2022-3551 and CVE-2022-3553
Date: Sun, 30 Oct 2022 13:38:47 +0000
Message-Id: <20221030133847.1756435-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 13:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172282

From: Steve Sakoman <steve@sakoman.com>

<CVE-2022-3550>
xkb: proof GetCountedString against request length attacks
pstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=11beef0b7f1ed290348e45618e5fa0d2bffcb72e]

<CVE-2022-3551>
xkb: fix some possible memleaks in XkbGetKbdByName
Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=18f91b950e22c2a342a4fbc55e9ddf7534a707d2]

<CVE-2022-3553>
xquartz: Fix a possible crash when editing the Application
menu due to mutaing immutable arrays
Upstream-Status: Backport[https://cgit.freedesktop.org/xorg/xserver/commit/?id=dfd057996b26420309c324ec844a5ba6dd07eda3]

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 .../xserver-xorg/CVE-2022-3550.patch          | 34 +++++++++++
 .../xserver-xorg/CVE-2022-3551.patch          | 60 +++++++++++++++++++
 .../xserver-xorg/CVE-2022-3553.patch          | 44 ++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |  3 +
 4 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
new file mode 100644
index 0000000000..c1241f6ac5
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
@@ -0,0 +1,34 @@
+From 27963f7eb6d986f20c88daa40af39834ee9cf9ec Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Sun, 30 Oct 2022 13:02:46 +0000
+Subject: [PATCH] xkb: proof GetCountedString against request length attacks
+
+GetCountedString did a check for the whole string to be within the
+request buffer but not for the initial 2 bytes that contain the length
+field. A swapped client could send a malformed request to trigger a
+swaps() on those bytes, writing into random memory.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+ xkb/xkb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 68c59df..c9726bc 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5138,6 +5138,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
+     CARD16 len;
+ 
+     wire = *wire_inout;
++
++    if (client->req_len <
++        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
++        return BadValue;
++
+     len = *(CARD16 *) wire;
+     if (client->swapped) {
+         swaps(&len);
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
new file mode 100644
index 0000000000..365b11ea1c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
@@ -0,0 +1,60 @@
+From a13cd058d30f30537f7e68b934238fab20f6d55a Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Sun, 30 Oct 2022 13:09:00 +0000
+Subject: [PATCH] xkb: fix some possible memleaks in XkbGetKbdByName
+
+GetComponentByName returns an allocated string, so let's free that if we
+fail somewhere.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+ xkb/xkb.c | 27 ++++++++++++++++++++-------
+ 1 file changed, 20 insertions(+), 7 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index c9726bc..072c138 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5908,19 +5908,32 @@ ProcXkbGetKbdByName(ClientPtr client)
+     xkb = dev->key->xkbInfo->desc;
+     status = Success;
+     str = (unsigned char *) &stuff[1];
+-    if (GetComponentSpec(&str, TRUE, &status))  /* keymap, unsupported */
+-        return BadMatch;
++    {
++        char *keymap = GetComponentSpec(&str, TRUE, &status);  /* keymap, unsupported */
++        if (keymap) {
++            free(keymap);
++            return BadMatch;
++        }
++    }
+     names.keycodes = GetComponentSpec(&str, TRUE, &status);
+     names.types = GetComponentSpec(&str, TRUE, &status);
+     names.compat = GetComponentSpec(&str, TRUE, &status);
+     names.symbols = GetComponentSpec(&str, TRUE, &status);
+     names.geometry = GetComponentSpec(&str, TRUE, &status);
+-    if (status != Success)
+-        return status;
+-    len = str - ((unsigned char *) stuff);
+-    if ((XkbPaddedSize(len) / 4) != stuff->length)
+-        return BadLength;
++    if (status == Success) {
++        len = str - ((unsigned char *) stuff);
++        if ((XkbPaddedSize(len) / 4) != stuff->length)
++            status = BadLength;
++    }
+ 
++    if (status != Success) {
++        free(names.keycodes);
++        free(names.types);
++        free(names.compat);
++        free(names.symbols);
++        free(names.geometry);
++         return status;
++    }
+     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
+     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
new file mode 100644
index 0000000000..3026225129
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
@@ -0,0 +1,44 @@
+From d3de2d4ea02c5898ea7af93a68933bb1059b4f0d Mon Sep 17 00:00:00 2001
+From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
+Date: Sun, 30 Oct 2022 13:13:41 +0000
+Subject: [PATCH] xquartz: Fix a possible crash when editing the Application
+ menu due to mutaing immutable arrays
+
+Crashing on exception: -[__NSCFArray replaceObjectAtIndex:withObject:]: mutating method sent to immutable object
+
+Application Specific Backtrace 0:
+0   CoreFoundation                      0x00007ff80d2c5e9b __exceptionPreprocess + 242
+1   libobjc.A.dylib                     0x00007ff80d027e48 objc_exception_throw + 48
+2   CoreFoundation                      0x00007ff80d38167b _CFThrowFormattedException + 194
+3   CoreFoundation                      0x00007ff80d382a25 -[__NSCFArray removeObjectAtIndex:].cold.1 + 0
+4   CoreFoundation                      0x00007ff80d2e6c0b -[__NSCFArray replaceObjectAtIndex:withObject:] + 119
+5   X11.bin                             0x00000001003180f9 -[X11Controller tableView:setObjectValue:forTableColumn:row:] + 169
+
+Fixes: https://github.com/XQuartz/XQuartz/issues/267
+Signed-off-by: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
+---
+ hw/xquartz/X11Controller.m | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/hw/xquartz/X11Controller.m b/hw/xquartz/X11Controller.m
+index 3efda50..4e9a5c9 100644
+--- a/hw/xquartz/X11Controller.m
++++ b/hw/xquartz/X11Controller.m
+@@ -467,9 +467,11 @@ extern char *bundle_id_prefix;
+     self.table_apps = table_apps;
+ 
+     NSArray * const apps = self.apps;
+-    if (apps != nil)
+-        [table_apps addObjectsFromArray:apps];
+-
++    if (apps != nil) {
++        for (NSArray <NSString *> * row in apps) {
++            [table_apps addObject:row.mutableCopy];
++        }
++    }
+     columns = [apps_table tableColumns];
+     [[columns objectAtIndex:0] setIdentifier:@"0"];
+     [[columns objectAtIndex:1] setIdentifier:@"1"];
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
index d176f390a4..4f5528f78b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.14.bb
@@ -5,6 +5,9 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://0001-test-xtest-Initialize-array-with-braces.patch \
            file://sdksyms-no-build-path.patch \
            file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
+           file://CVE-2022-3550.patch \
+           file://CVE-2022-3551.patch \
+           file://CVE-2022-3553.patch \
            "
 SRC_URI[md5sum] = "453fc86aac8c629b3a5b77e8dcca30bf"
 SRC_URI[sha256sum] = "54b199c9280ff8bf0f73a54a759645bd0eeeda7255d1c99310d5b7595f3ac066"
-- 
2.17.1


