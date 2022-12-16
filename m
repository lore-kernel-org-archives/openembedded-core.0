Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F61C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.15110.1671202682004738349
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZR9cbBmz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id a9so2549670pld.7
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/admdcopI1vh0Uz80RzbhFOG4gBk3tb6VcKExV0aiPY=;
        b=ZR9cbBmz2XTzDHGv6A70HNqKIGmhUQrIFWciZANiear7B+/DnXoBiqVcA54zOxKUHY
         k3pL1I1xVXffpyh5gCXu0pRVpFcwZquc43Ao2WZ4wDq895dgXzft3S1hyIs+SCMUyFrQ
         3cVIlGAlrCk+NVPeOxldO+cCzssi8xXVBY9A4xFYn1LP67TPCiuu+UnaWJh9eCH4qwuQ
         uSmKFL1ZMeAxoeeK8a2yAkTyT7ZLjbFQ9VE8bovIr1wq0b+3OyD7VHzZx9l5feSus1+T
         vQlCKl02hShn63MFqy3fJ9gM1JJwS9to5Yr2zLsAVQvUFlOKRrIvwDR6BsgVz/2vgOiw
         emAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/admdcopI1vh0Uz80RzbhFOG4gBk3tb6VcKExV0aiPY=;
        b=FF2XIxYAVykQG90Fd94zjVpcdT7ddYB5TwN1a0b7EDkrIMk3nij/fOBL6ng+uG0IwE
         z5OOb87GFNVkO0NEljmZMh2AG1AO4kFfAYHNVBoNzZv7Gtlcby4tD7Vpju9sYNtum9u+
         EOXhdNfxX/mjN/SuA8xo5qrhA2eBFHeZn/y3al3+IXYx17cTz5Z2q3hiqDh68y+Lg9cx
         gQqPzrTNaF6Ff7QGvfhFCfs+JJldgLBsRlrmVYwndHBcE+zeujrVT4paPI/1xKzQ9GEO
         +mBT0mlBlbyNbvwV03fPVD0f3swfz/87pFXMhDydDU/wwIhuurnSEfGDLGrXrmmOj0IK
         yuLA==
X-Gm-Message-State: ANoB5pn9CSvmllHnzF2RlwMEETPTj3a7lS58j+rLjVsBySeDLZA0niwb
	PfQSjXF7aho4fiyOhZjfEjxqf20/3yOhPFPD97w=
X-Google-Smtp-Source: AA0mqf5Qerx44J0GsF2TD+8wtv/MeeWhKYNqGYgYTO7oZ89BXm4pEpfDNxS9iLecq0y6nyoKa9yorg==
X-Received: by 2002:a17:90a:420e:b0:213:9000:907f with SMTP id o14-20020a17090a420e00b002139000907fmr33997919pjg.39.1671202680879;
        Fri, 16 Dec 2022 06:58:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.57.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:58:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/13] xserver-xorg: backport fixes for CVE-2022-3550, CVE-2022-3551 and CVE-2022-3553
Date: Fri, 16 Dec 2022 04:57:40 -1000
Message-Id: <081ac12677096886b25023a03df06b99585ef18c.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671202568.git.steve@sakoman.com>
References: <cover.1671202568.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174745

From: Minjae Kim <flowergom@gmail.com>

<CVE-2022-3550>
xkb: proof GetCountedString against request length attacks
Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=11beef0b7f1ed290348e45618e5fa0d2bffcb72e]

<CVE-2022-3551>
xkb: fix some possible memleaks in XkbGetKbdByName
Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=18f91b950e22c2a342a4fbc55e9ddf7534a707d2]

<CVE-2022-3553>
xquartz: Fix a possible crash when editing the Application
menu due to mutaing immutable arrays
Upstream-Status: Backport[https://cgit.freedesktop.org/xorg/xserver/commit/?id=dfd057996b26420309c324ec844a5ba6dd07eda3]

Signed-off-by:Minjae Kim <flowergom@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2022-3550.patch          | 40 ++++++++++++
 .../xserver-xorg/CVE-2022-3551.patch          | 64 +++++++++++++++++++
 .../xserver-xorg/CVE-2022-3553.patch          | 49 ++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |  3 +
 4 files changed, 156 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
new file mode 100644
index 0000000000..efec7b6b4e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
@@ -0,0 +1,40 @@
+From d2dcbdc67c96c84dff301505072b0b7b022f1a14 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Sun, 4 Dec 2022 17:40:21 +0000
+Subject: [PATCH 1/3] xkb: proof GetCountedString against request length
+ attacks
+
+GetCountedString did a check for the whole string to be within the
+request buffer but not for the initial 2 bytes that contain the length
+field. A swapped client could send a malformed request to trigger a
+swaps() on those bytes, writing into random memory.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Ustream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=11beef0b7f1ed290348e45618e5fa0d2bffcb72e]
+CVE: CVE-2022-3550
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
+
+---
+ xkb/xkb.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 68c59df..bf8aaa3 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5138,6 +5138,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
+     CARD16 len;
+ 
+     wire = *wire_inout;
++
++    if (client->req_len <
++        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
++	return BadValue;
++
+     len = *(CARD16 *) wire;
+     if (client->swapped) {
+         swaps(&len);
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
new file mode 100644
index 0000000000..a3b977aac9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
@@ -0,0 +1,64 @@
+From d3787290f56165f5656ddd2123dbf676a32d0a68 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Sun, 4 Dec 2022 17:44:00 +0000
+Subject: [PATCH 2/3] xkb: fix some possible memleaks in XkbGetKbdByName
+
+GetComponentByName returns an allocated string, so let's free that if we
+fail somewhere.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=18f91b950e22c2a342a4fbc55e9ddf7534a707d2]
+CVE: CVE-2022-3551
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
+
+---
+ xkb/xkb.c | 26 +++++++++++++++++++-------
+ 1 file changed, 19 insertions(+), 7 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index bf8aaa3..f79d306 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5908,19 +5908,31 @@ ProcXkbGetKbdByName(ClientPtr client)
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
++    }
+     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
+     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
+ 
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
new file mode 100644
index 0000000000..94cea77edc
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
@@ -0,0 +1,49 @@
+From 57ad2c03730d56f8432b6d66b29c0e5a9f9b1ec2 Mon Sep 17 00:00:00 2001
+From: Jeremy Huddleston Sequoia <jeremyhu@apple.com>
+Date: Sun, 4 Dec 2022 17:46:18 +0000
+Subject: [PATCH 3/3] xquartz: Fix a possible crash when editing the
+ Application menu due to mutaing immutable arrays
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
+
+Upstream-Status: Backport [https://cgit.freedesktop.org/xorg/xserver/commit/?id=dfd057996b26420309c324ec844a5ba6dd07eda3]
+CVE: CVE-2022-3553
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
+
+---
+ hw/xquartz/X11Controller.m | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/hw/xquartz/X11Controller.m b/hw/xquartz/X11Controller.m
+index 3efda50..9870ff2 100644
+--- a/hw/xquartz/X11Controller.m
++++ b/hw/xquartz/X11Controller.m
+@@ -467,8 +467,12 @@ extern char *bundle_id_prefix;
+     self.table_apps = table_apps;
+ 
+     NSArray * const apps = self.apps;
+-    if (apps != nil)
+-        [table_apps addObjectsFromArray:apps];
++
++    if (apps != nil) {
++        for (NSArray <NSString *> * row in apps) {
++            [table_apps addObject:row.mutableCopy];
++        }
++    }
+ 
+     columns = [apps_table tableColumns];
+     [[columns objectAtIndex:0] setIdentifier:@"0"];
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
2.25.1


