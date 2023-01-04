Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECCBC4708E
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.9390.1672830381716210439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iVwKc7Zt;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id b24-20020a05600c4a9800b003d21efdd61dso26142082wmp.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WW+PCwbEHAgRhx5/Zz47GnzG1vSFaFkpwdMKVm8yw8k=;
        b=iVwKc7Ztrr0Rx/tFeovRjN2KJ5ucpnnFckTYQ012NvG+YRw3d5qFHOfsR96ZFOkAVs
         C5bxeNc6OpCdhqxWBZsnucTcMdyogV7X3/eUgb57HExONCqD7M2G4JytuNpdKTRGSTjJ
         UfFvFH4+4KqcKi6oZ6ltPpMM5NR6YdQ28vX2GAvlNKObvW+o/MRPE89B2ukF38OTeEAe
         82NAvVycd1+5l/4n3p0jwyuVHiyTGM1CkEUQ8x3tN+Oud3RR1i5X8c3Kg+nvqxdjEtpx
         iMVfesaP/iBRzhOk3sOx5VSR58L5g3aQbr+lkrpXEtsM4SMGZYSlFsFYK4G/g6eP/aKX
         8UcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WW+PCwbEHAgRhx5/Zz47GnzG1vSFaFkpwdMKVm8yw8k=;
        b=ANr0IiRfyCQMHYu9rotW0O8PR6FYgSe9FmIli1ZANcpEi2IfZ6Nl2Q3WURMY6HdWGM
         03qYsNzFdueQX+CO/wHmvOc1OjQZp7LN/VlrobhpeAVhwdF1f6CYyuSrAUItYOzi/agS
         pOUMeZlSqH/Ar4rk7WLaEPGrkIJbUVBzJXabGHc+eEqlvWdkpBuK3M0GoCucf73n6zyB
         DdvDRxd9WJE1fYonbntSUKPU+kfzJkB4oXgFYbMmV5T0txDYEJf51mNMaur+dFc9tvL8
         /e5+9Jtwf/lodYbp23GMNK2h7/WaCt3eQctuQP8iRa3ukz8dUxHaFnT8uuJBqpCKwuV7
         NyYg==
X-Gm-Message-State: AFqh2krAXCNI1FLFW9suEMYYiC1gla3t15WOymYGNjNcGSBNIYPMWUGS
	rO/Nr42+vqAAXJEZ1CKBUOXIgEJt/5A=
X-Google-Smtp-Source: AMrXdXsmpSRScyYu1t+xui+8HzQggwbIpQXI7qw1TE8NC2yzlZh6414Tqn6Okwg5n1WtE/gM8mWyXw==
X-Received: by 2002:a05:600c:3493:b0:3d2:370b:97f4 with SMTP id a19-20020a05600c349300b003d2370b97f4mr37604487wmq.16.1672830380157;
        Wed, 04 Jan 2023 03:06:20 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 36/77] xserver-xorg: upgrade 21.1.4 -> 21.1.6
Date: Wed,  4 Jan 2023 12:05:07 +0100
Message-Id: <20230104110548.2537259-36-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175422

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...possible-memleaks-in-XkbGetKbdByName.patch | 63 -------------------
 ...ntedString-against-request-length-at.patch | 38 -----------
 ...-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} |  4 +-
 3 files changed, 1 insertion(+), 104 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
deleted file mode 100644
index 0e61ec5953..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-CVE: CVE-2022-3551
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 18f91b950e22c2a342a4fbc55e9ddf7534a707d2 Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Wed, 13 Jul 2022 11:23:09 +1000
-Subject: [PATCH] xkb: fix some possible memleaks in XkbGetKbdByName
-
-GetComponentByName returns an allocated string, so let's free that if we
-fail somewhere.
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
----
- xkb/xkb.c | 26 ++++++++++++++++++++------
- 1 file changed, 20 insertions(+), 6 deletions(-)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index 4692895db..b79a269e3 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -5935,18 +5935,32 @@ ProcXkbGetKbdByName(ClientPtr client)
-     xkb = dev->key->xkbInfo->desc;
-     status = Success;
-     str = (unsigned char *) &stuff[1];
--    if (GetComponentSpec(&str, TRUE, &status))  /* keymap, unsupported */
--        return BadMatch;
-+    {
-+        char *keymap = GetComponentSpec(&str, TRUE, &status);  /* keymap, unsupported */
-+        if (keymap) {
-+            free(keymap);
-+            return BadMatch;
-+        }
-+    }
-     names.keycodes = GetComponentSpec(&str, TRUE, &status);
-     names.types = GetComponentSpec(&str, TRUE, &status);
-     names.compat = GetComponentSpec(&str, TRUE, &status);
-     names.symbols = GetComponentSpec(&str, TRUE, &status);
-     names.geometry = GetComponentSpec(&str, TRUE, &status);
--    if (status != Success)
-+    if (status == Success) {
-+        len = str - ((unsigned char *) stuff);
-+        if ((XkbPaddedSize(len) / 4) != stuff->length)
-+            status = BadLength;
-+    }
-+
-+    if (status != Success) {
-+        free(names.keycodes);
-+        free(names.types);
-+        free(names.compat);
-+        free(names.symbols);
-+        free(names.geometry);
-         return status;
--    len = str - ((unsigned char *) stuff);
--    if ((XkbPaddedSize(len) / 4) != stuff->length)
--        return BadLength;
-+    }
- 
-     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
-     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
deleted file mode 100644
index 6f862e82f9..0000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-CVE: CVE-2022-3550
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 11beef0b7f1ed290348e45618e5fa0d2bffcb72e Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Tue, 5 Jul 2022 12:06:20 +1000
-Subject: [PATCH] xkb: proof GetCountedString against request length attacks
-
-GetCountedString did a check for the whole string to be within the
-request buffer but not for the initial 2 bytes that contain the length
-field. A swapped client could send a malformed request to trigger a
-swaps() on those bytes, writing into random memory.
-
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
----
- xkb/xkb.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/xkb/xkb.c b/xkb/xkb.c
-index f42f59ef3..1841cff26 100644
---- a/xkb/xkb.c
-+++ b/xkb/xkb.c
-@@ -5137,6 +5137,11 @@ _GetCountedString(char **wire_inout, ClientPtr client, char **str)
-     CARD16 len;
- 
-     wire = *wire_inout;
-+
-+    if (client->req_len <
-+        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
-+        return BadValue;
-+
-     len = *(CARD16 *) wire;
-     if (client->swapped) {
-         swaps(&len);
--- 
-2.34.1
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
index aba09afec3..256903ce5f 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.6.bb
@@ -2,10 +2,8 @@ require xserver-xorg.inc
 
 SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
-           file://0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch \
-           file://0001-xkb-proof-GetCountedString-against-request-length-at.patch \
            "
-SRC_URI[sha256sum] = "5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd2471fc3cbee1c587"
+SRC_URI[sha256sum] = "1eb86ed674d042b6c8b1f9135e59395cbbca35ed551b122f73a7d8bb3bb22484"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
2.30.2


