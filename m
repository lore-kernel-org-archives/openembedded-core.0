Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CFCC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:41 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.1930.1667356952965183414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qpR/PJyn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id k22so15213059pfd.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ROdS+nBgcJ04okS1NXGqbedWyrzPoBcLMkEuFrqq7mw=;
        b=qpR/PJynzHXwpJuXt4GdXpF1TgcWoAkIch3vBhQeMh+j3MPd+SXDtJ4/H3JU2h8rfD
         GdIlVYpbkejZa8ENtm9EWAM+GyTl9GffHFh/q4hGyiStOifF7hK3ZMx/oKm8160jmPmN
         sdOoBwVy201u+2qn59i5ziL5BFW2q8gYyUxQ7rG18uToX2WfzEbi3J9aJ0R7t7XcB03K
         tyPoXd5rPFX1cyPvpcMWT0fVm557XTT9E6OUoOIvxUXXklXHar0F18WXS7wW6YYNCfhb
         ty0UHtWyPwpV3GGrzWns03eI0GnLBVVpSmsgV3ZtoMNVNJ/wHiB3nB956pfap4Ft4EKi
         5kiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROdS+nBgcJ04okS1NXGqbedWyrzPoBcLMkEuFrqq7mw=;
        b=OIh+bxp5a4CjRhUeYLSv4InTjfC4ULEN4NuopXXXIzTuHiWPchD58KevLQg6DxH4VP
         9/bqybNSNasSL+nt0jUB0WnW6QudvqNAahbtjkZ25fhLqdMc5iZBEANiOgEOsDz+wjA0
         gR6PqpnnZx2ZSTy+OZlVHSPS3we8Do9n1Q2zSm1F9/JTlDJ0qGUKZHbY4XXYpIXPgzqf
         OvifliBvbR+z+RSZQs/FyJaozzkPcAQqtIWh/R63oLmz0vaF1fXAf/idyKb+6mBxZJtn
         mdORQ2Wx87YiOnvTxAqyFB1r91HtyyX2UsBp8i2iEAgbmJBlm01xLMm1RnP0j2n0B3or
         JswQ==
X-Gm-Message-State: ACrzQf1kgv+V3dLTr2/C7l5Gpd+fJhpP6/SJ17KtWV11N1mAJ2fTMZ3E
	wtKmg3JikS+nBMx8sorjS2hGZXuhzi+2oLvO
X-Google-Smtp-Source: AMsMyM78dftZDFXGoe5MzPlW2WHNLvaz+VzpZFx8oZW21j10epLt08LilBeKhc3iD34fr1WAd9pHtQ==
X-Received: by 2002:a63:cf0d:0:b0:46e:96b9:2760 with SMTP id j13-20020a63cf0d000000b0046e96b92760mr19630950pgg.328.1667356951883;
        Tue, 01 Nov 2022 19:42:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 04/20] xserver-xorg: backport fixes for CVE-2022-3550 and CVE-2022-3551
Date: Tue,  1 Nov 2022 16:41:54 -1000
Message-Id: <9163db79ec90ff4b8ecd189f5fb6e44e27b9e53b.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172544

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


