Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEE2C54798
	for <webhook@archiver.kernel.org>; Sat,  2 Mar 2024 16:41:17 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.53476.1709397672039246743
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Mar 2024 08:41:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=JQ062uac;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id E41D7240101
	for <openembedded-core@lists.openembedded.org>; Sat,  2 Mar 2024 17:41:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1709397669; bh=9YXCCfFTJBg6mQ1RkAOkD6PgbJBNRYRbE2ROkyIyEC0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=JQ062uacp5lF63ETQy7F7KKIcST0LTujj700htsKIPcnKIHt50NILMNlYbbxjRPfC
	 O33d/b18YK2a+oO9W5a0TsnFQZ/rrITjy8jC4Y+uQUywCcJL9UgseKJCRDZHRkDfAy
	 5plzHs2PNIui9mTe6hTdXcT3VxaR4fpcNmVRO8g4Xt64/yqMQqArX/s9JppYKnPR4B
	 stpIDobW+IGHN0a9zDbTsvcmgFj4Ivwb2ywXm2P3//2aXZx6SVeezfcOAC7VzohliA
	 rHl/UR64XIt7rBJ+YOnYu+Dc3KxZB/3iiRTG5bPEc3E24qo238wrq8ILwQy5b2cMyQ
	 fFApBYQg7j/xA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Tn9h51V8Dz6tm4;
	Sat,  2 Mar 2024 17:41:08 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] qemu: backport patch for ui/clipboard issue
Date: Sat,  2 Mar 2024 16:40:52 +0000
Message-Id: <20240302164052.2040716-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Mar 2024 16:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196549

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Backported from upstream to fix CVE-2023-6683

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-6683.patch             | 91 +++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index a403f7d69f..e8c8c049cf 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz \
            file://fixedmeson.patch \
            file://no-pip.patch \
            file://fix_segv.patch \
+           file://CVE-2023-6683.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            "
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch b/meta/r=
ecipes-devtools/qemu/qemu/CVE-2023-6683.patch
new file mode 100644
index 0000000000..1c0223e239
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-6683.patch
@@ -0,0 +1,91 @@
+From 405484b29f6548c7b86549b0f961b906337aa68a Mon Sep 17 00:00:00 2001
+From: Fiona Ebner <f.ebner@proxmox.com>
+Date: Wed, 24 Jan 2024 11:57:48 +0100
+Subject: [PATCH] ui/clipboard: mark type as not available when there is =
no
+ data
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+With VNC, a client can send a non-extended VNC_MSG_CLIENT_CUT_TEXT
+message with len=3D0. In qemu_clipboard_set_data(), the clipboard info
+will be updated setting data to NULL (because g_memdup(data, size)
+returns NULL when size is 0). If the client does not set the
+VNC_ENCODING_CLIPBOARD_EXT feature when setting up the encodings, then
+the 'request' callback for the clipboard peer is not initialized.
+Later, because data is NULL, qemu_clipboard_request() can be reached
+via vdagent_chr_write() and vdagent_clipboard_recv_request() and
+there, the clipboard owner's 'request' callback will be attempted to
+be called, but that is a NULL pointer.
+
+In particular, this can happen when using the KRDC (22.12.3) VNC
+client.
+
+Another scenario leading to the same issue is with two clients (say
+noVNC and KRDC):
+
+The noVNC client sets the extension VNC_FEATURE_CLIPBOARD_EXT and
+initializes its cbpeer.
+
+The KRDC client does not, but triggers a vnc_client_cut_text() (note
+it's not the _ext variant)). There, a new clipboard info with it as
+the 'owner' is created and via qemu_clipboard_set_data() is called,
+which in turn calls qemu_clipboard_update() with that info.
+
+In qemu_clipboard_update(), the notifier for the noVNC client will be
+called, i.e. vnc_clipboard_notify() and also set vs->cbinfo for the
+noVNC client. The 'owner' in that clipboard info is the clipboard peer
+for the KRDC client, which did not initialize the 'request' function.
+That sounds correct to me, it is the owner of that clipboard info.
+
+Then when noVNC sends a VNC_MSG_CLIENT_CUT_TEXT message (it did set
+the VNC_FEATURE_CLIPBOARD_EXT feature correctly, so a check for it
+passes), that clipboard info is passed to qemu_clipboard_request() and
+the original segfault still happens.
+
+Fix the issue by handling updates with size 0 differently. In
+particular, mark in the clipboard info that the type is not available.
+
+While at it, switch to g_memdup2(), because g_memdup() is deprecated.
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2023-6683
+Reported-by: Markus Frank <m.frank@proxmox.com>
+Suggested-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Signed-off-by: Fiona Ebner <f.ebner@proxmox.com>
+Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
+Tested-by: Markus Frank <m.frank@proxmox.com>
+Message-ID: <20240124105749.204610-1-f.ebner@proxmox.com>
+
+CVE: CVE-2023-6683
+
+Upstream-Status: Backport [https://github.com/qemu/qemu/commit/405484b29=
f6548c7b86549b0f961b906337aa68a]
+Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
+
+---
+ ui/clipboard.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/ui/clipboard.c b/ui/clipboard.c
+index 3d14bffaf80f..b3f6fa3c9e1f 100644
+--- a/ui/clipboard.c
++++ b/ui/clipboard.c
+@@ -163,9 +163,15 @@ void qemu_clipboard_set_data(QemuClipboardPeer *pee=
r,
+     }
+=20
+     g_free(info->types[type].data);
+-    info->types[type].data =3D g_memdup(data, size);
+-    info->types[type].size =3D size;
+-    info->types[type].available =3D true;
++    if (size) {
++        info->types[type].data =3D g_memdup2(data, size);
++        info->types[type].size =3D size;
++        info->types[type].available =3D true;
++    } else {
++        info->types[type].data =3D NULL;
++        info->types[type].size =3D 0;
++        info->types[type].available =3D false;
++    }
+=20
+     if (update) {
+         qemu_clipboard_update(info);
--=20
2.39.2


