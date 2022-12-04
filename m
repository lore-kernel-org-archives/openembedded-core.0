Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE635C4321E
	for <webhook@archiver.kernel.org>; Sun,  4 Dec 2022 18:40:07 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.135044.1670179203397140210
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 10:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jb/IVRWI;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: flowergom@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id fc4so16031358ejc.12
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Dec 2022 10:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upwpL1PaYj8WeZkCTKoJJahOEPAAN7jHs7277DEGtGk=;
        b=jb/IVRWIQ5mjbBtUI/xJdtqmc3qdbWuqnW/OnTD/JZit6cQ88s9ihD618MhTnsZHC8
         /S4S9Tw/MRPWoTIOXmr8WGY6P87ZcpoIc5+H4WfAVI8Jt99SttriXjBQrus58qb5KGs5
         8XKQ6YIBIRAroKb/8NoKeI2rW4/hFGyNRXIOA0QVXXU/EPqlmHPMBf7lp5sS932sRHhD
         Ki18p0bHWO84Ut+WnGZh8nCwrMaLmTc32Kx0KK6ZxCQez9iHQKEVN4FYVJaaUBM/Unqj
         f4PMmztZQW/27dIEtLegbNnkTi+vbwt9BBuWEYzWM8zhD64KJryZbsu6jP5MlhMRE8zU
         TWKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upwpL1PaYj8WeZkCTKoJJahOEPAAN7jHs7277DEGtGk=;
        b=I5CWMGH/gwAnnujCokVVlZhUV62/zbhsjqqJd9ugU3qFy5J0oNxpWK6QO3M8mRCy3n
         0tsaQ9N6NLqumaAwsBbY6G7/9P911Cwf6N6NEv43slRaI5lKXnURvWY/pJayxeszIlgi
         afEaDktHi83EMBRT8clxkSoiQsstNiK2A9SxZOfRdmJnL6W33pcR+4QtQTv5lswj0UnF
         zfb2tlaTubYDYhhh26a+Pf2ADd39eHTbPia4ZRnOL3XKjjIIOwZ8B3wgZ8l1azU08N3H
         9cV8RquBUQwiSYZBkrYKG3ttUVzm1HxiSXx3myIkI6gMyLxxkvezwHdmwUTVC2IGisMf
         PCfg==
X-Gm-Message-State: ANoB5pn5uwmaVbpe65NofcihruECpGG4tK+/wHt672dvTWGviKuS4OEu
	Muxjn7eYomoZbgUtCk+g144up1sW8ee5MD21
X-Google-Smtp-Source: AA0mqf6dRUV3PBzhN32pUHkHl85ISEaV+xbUSajKavbbLF77smVbt1mfh56Um+Lp4VIxKiHuSEeNbA==
X-Received: by 2002:a17:906:704:b0:7a1:b555:6f1 with SMTP id y4-20020a170906070400b007a1b55506f1mr69752992ejb.29.1670179201216;
        Sun, 04 Dec 2022 10:40:01 -0800 (PST)
Received: from localhost.localdomain (ip5b423fb4.dynamic.kabel-deutschland.de. [91.66.63.180])
        by smtp.gmail.com with ESMTPSA id p13-20020a056402154d00b0046778ce5fdfsm1878760edx.10.2022.12.04.10.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:40:00 -0800 (PST)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [dunfell][PATCHv2] xserver-xorg: backport fixes for CVE-2022-3550, CVE-2022-3551 and CVE-2022-3553
Date: Sun,  4 Dec 2022 18:39:27 +0000
Message-Id: <20221204183927.13808-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Dec 2022 18:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174255

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
index 0000000000..9674b548d9
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
+Ustream-Status: Backport
+[https://cgit.freedesktop.org/xorg/xserver/commit/?id=11beef0b7f1ed290348e45618e5fa0d2bffcb72e]
+
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
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
index 0000000000..c1313b5ad6
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
+Upstream-Status: Backport
+[https://cgit.freedesktop.org/xorg/xserver/commit/?id=18f91b950e22c2a342a4fbc55e9ddf7534a707d2]
+
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
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
index 0000000000..d06dc2cf79
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
+Upstream-Status: Backport
+[https://cgit.freedesktop.org/xorg/xserver/commit/?id=dfd057996b26420309c324ec844a5ba6dd07eda3]
+
+Signed-off-by:Minjae Kim <flowergom@gmail.com>
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
2.17.1


