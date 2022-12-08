Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43AADC001B2
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:14 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.4563.1670539384446843153
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=sXxbYxSf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id u5so2931925pjy.5
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROdS+nBgcJ04okS1NXGqbedWyrzPoBcLMkEuFrqq7mw=;
        b=sXxbYxSffrI7L77MosGF8svDvDWV00rpEf/8+DUCqzuVOfSvFYyMnlOLfgLT2f3as0
         8kolkWG2tRkR29AV8xpvLQAVQuRT9ImNBkU9qMzHo4WGJ/2crF94EiivLf6NEQzh4SvZ
         ki+8vJ7SY2MCcXds1fLvZqro143DW+F/NRyYb/vPWGEG91CCtLE7GBjPgHGNEeDszfRT
         ggyD/8iXGFRZFvNMo4QGaQdRLAlZHeVkg7tUvmkNAA+eBk6P+atyb3QVR3LO5eeUN8oR
         /mFwQhGev5PYVeS6f9InmzS7qQsTneKGvV62TFT8mmpcAMj9k5bCFG1YTrLdUUDui+ed
         mi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROdS+nBgcJ04okS1NXGqbedWyrzPoBcLMkEuFrqq7mw=;
        b=moGCJM9lvw4h6rth35DEF5PGJ5eB6SRFLLlEu7uJymAbVWbvYJcvSHmuCw4ZL68hw5
         L7cRGERa8cV/dWbIxmDqSx7VZTX1cnCKRfjjojaRniXX9J0ciZMJ2itUzcLudHLsfrmp
         KsYQU2mfxaVbEc+n8Z01akuNUuxHyakNHMZqpMhcgekMo2bnOkIQGXxqfjO4nqhT7o5l
         Epn3Hq6XHZTHIDVfbS4Z+wbRJvSiuD5PBpVtKJ+bZaDSHjAyQGXlXlE3QtGRVWn6TFAQ
         vuF9fHe63dPl2JUwMXe+aOZHdG1mwTdzpSxg6JPFUXN2PB8SrHz5RoF930A8TM5JFyFQ
         TrSA==
X-Gm-Message-State: ANoB5pnTzzgg6PX57bPAuBCdo3UjIM0rXCVyMnaWXz52Gi/9oCrGQ83/
	xNrMYoheGZ3fhqVycF0RjVUTvGQc85cpprtIcbwlBg==
X-Google-Smtp-Source: AA0mqf4xnRonRZ7nRP4w67AhK6OFT7+5iUoaWU0oCSmyPEmLCsid0Rb6WtX8ARKNm0pZrVckF2BzQw==
X-Received: by 2002:a17:902:e983:b0:189:6457:4e14 with SMTP id f3-20020a170902e98300b0018964574e14mr3788529plb.8.1670539383413;
        Thu, 08 Dec 2022 14:43:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/12] xserver-xorg: backport fixes for CVE-2022-3550 and CVE-2022-3551
Date: Thu,  8 Dec 2022 12:42:42 -1000
Message-Id: <e40a8d939535bbb2f89aabd48c1cf843be5bb564.1670539236.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174414

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit e32401d8bf44afcca88af7e4c5948d2c28e1813f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...possible-memleaks-in-XkbGetKbdByName.patch | 63 +++++++++++++++++++
 ...ntedString-against-request-length-at.patch | 38 +++++++++++
 .../xorg-xserver/xserver-xorg_21.1.4.bb       |  2 +
 3 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
new file mode 100644
index 0000000000..0e61ec5953
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
@@ -0,0 +1,63 @@
+CVE: CVE-2022-3551
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 18f91b950e22c2a342a4fbc55e9ddf7534a707d2 Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Wed, 13 Jul 2022 11:23:09 +1000
+Subject: [PATCH] xkb: fix some possible memleaks in XkbGetKbdByName
+
+GetComponentByName returns an allocated string, so let's free that if we
+fail somewhere.
+
+Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
+---
+ xkb/xkb.c | 26 ++++++++++++++++++++------
+ 1 file changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/xkb/xkb.c b/xkb/xkb.c
+index 4692895db..b79a269e3 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5935,18 +5935,32 @@ ProcXkbGetKbdByName(ClientPtr client)
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
++    if (status == Success) {
++        len = str - ((unsigned char *) stuff);
++        if ((XkbPaddedSize(len) / 4) != stuff->length)
++            status = BadLength;
++    }
++
++    if (status != Success) {
++        free(names.keycodes);
++        free(names.types);
++        free(names.compat);
++        free(names.symbols);
++        free(names.geometry);
+         return status;
+-    len = str - ((unsigned char *) stuff);
+-    if ((XkbPaddedSize(len) / 4) != stuff->length)
+-        return BadLength;
++    }
+ 
+     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
+     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
+-- 
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
new file mode 100644
index 0000000000..6f862e82f9
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
@@ -0,0 +1,38 @@
+CVE: CVE-2022-3550
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 11beef0b7f1ed290348e45618e5fa0d2bffcb72e Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 5 Jul 2022 12:06:20 +1000
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
+index f42f59ef3..1841cff26 100644
+--- a/xkb/xkb.c
++++ b/xkb/xkb.c
+@@ -5137,6 +5137,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
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
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
index b9cbc9989e..aba09afec3 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
@@ -2,6 +2,8 @@ require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+           file://0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch \
+           file://0001-xkb-proof-GetCountedString-against-request-length-at.patch \
            "
 SRC_URI[sha256sum] = "5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587"
 
-- 
2.25.1


