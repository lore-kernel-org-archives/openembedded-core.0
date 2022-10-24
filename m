Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BD0ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 15:07:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.20526.1666624069657098538
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 08:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92F4E153B;
	Mon, 24 Oct 2022 08:07:55 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DBCA13F792;
	Mon, 24 Oct 2022 08:07:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] xserver-xorg: backport fixes for CVE-2022-3550 and CVE-2022-3551
Date: Mon, 24 Oct 2022 16:07:45 +0100
Message-Id: <20221024150745.3917987-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024150745.3917987-1-ross.burton@arm.com>
References: <20221024150745.3917987-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 15:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172104

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...possible-memleaks-in-XkbGetKbdByName.patch | 63 +++++++++++++++++++
 ...ntedString-against-request-length-at.patch | 38 +++++++++++
 .../xorg-xserver/xserver-xorg_21.1.4.bb       |  2 +
 3 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-=
xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-=
xkb-proof-GetCountedString-against-request-length-at.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix=
-some-possible-memleaks-in-XkbGetKbdByName.patch b/meta/recipes-graphics/=
xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKb=
dByName.patch
new file mode 100644
index 00000000000..0e61ec5953c
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-p=
ossible-memleaks-in-XkbGetKbdByName.patch
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
+     xkb =3D dev->key->xkbInfo->desc;
+     status =3D Success;
+     str =3D (unsigned char *) &stuff[1];
+-    if (GetComponentSpec(&str, TRUE, &status))  /* keymap, unsupported =
*/
+-        return BadMatch;
++    {
++        char *keymap =3D GetComponentSpec(&str, TRUE, &status);  /* key=
map, unsupported */
++        if (keymap) {
++            free(keymap);
++            return BadMatch;
++        }
++    }
+     names.keycodes =3D GetComponentSpec(&str, TRUE, &status);
+     names.types =3D GetComponentSpec(&str, TRUE, &status);
+     names.compat =3D GetComponentSpec(&str, TRUE, &status);
+     names.symbols =3D GetComponentSpec(&str, TRUE, &status);
+     names.geometry =3D GetComponentSpec(&str, TRUE, &status);
+-    if (status !=3D Success)
++    if (status =3D=3D Success) {
++        len =3D str - ((unsigned char *) stuff);
++        if ((XkbPaddedSize(len) / 4) !=3D stuff->length)
++            status =3D BadLength;
++    }
++
++    if (status !=3D Success) {
++        free(names.keycodes);
++        free(names.types);
++        free(names.compat);
++        free(names.symbols);
++        free(names.geometry);
+         return status;
+-    len =3D str - ((unsigned char *) stuff);
+-    if ((XkbPaddedSize(len) / 4) !=3D stuff->length)
+-        return BadLength;
++    }
+=20
+     CHK_MASK_LEGAL(0x01, stuff->want, XkbGBN_AllComponentsMask);
+     CHK_MASK_LEGAL(0x02, stuff->need, XkbGBN_AllComponentsMask);
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-pro=
of-GetCountedString-against-request-length-at.patch b/meta/recipes-graphi=
cs/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-requ=
est-length-at.patch
new file mode 100644
index 00000000000..6f862e82f93
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetC=
ountedString-against-request-length-at.patch
@@ -0,0 +1,38 @@
+CVE: CVE-2022-3550
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 11beef0b7f1ed290348e45618e5fa0d2bffcb72e Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Tue, 5 Jul 2022 12:06:20 +1000
+Subject: [PATCH] xkb: proof GetCountedString against request length atta=
cks
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
+@@ -5137,6 +5137,11 @@ _GetCountedString(char **wire_inout, ClientPtr cl=
ient, char **str)
+     CARD16 len;
+=20
+     wire =3D *wire_inout;
++
++    if (client->req_len <
++        bytes_to_int32(wire + 2 - (char *) client->requestBuffer))
++        return BadValue;
++
+     len =3D *(CARD16 *) wire;
+     if (client->swapped) {
+         swaps(&len);
+--=20
+2.34.1
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb b/=
meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
index b9cbc9989eb..aba09afec3c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.4.bb
@@ -2,6 +2,8 @@ require xserver-xorg.inc
=20
 SRC_URI +=3D "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-h=
ardwar.patch \
            file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
+           file://0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName=
.patch \
+           file://0001-xkb-proof-GetCountedString-against-request-length=
-at.patch \
            "
 SRC_URI[sha256sum] =3D "5cc4be8ee47edb58d4a90e603a59d56b40291ad38371b0bd=
2471fc3cbee1c587"
=20
--=20
2.34.1


