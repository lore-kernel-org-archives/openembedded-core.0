Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3525DC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:17:47 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.6095.1701209859787844002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout03.t-online.de (Postfix) with SMTP id BA1E11B0EA
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:17:36 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.157]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r86Oe-1g3dSr0; Tue, 28 Nov 2023 23:17:36 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCHv3] default-providers.inc: add PREFERRED_PROVIDER variables for llvm
Date: Tue, 28 Nov 2023 23:17:54 +0100
Message-ID: <20231128221754.2830475-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1701209856-30FF6937-09703700/0/0 CLEAN NORMAL
X-TOI-MSGID: 67f421d7-8f0b-4c10-a853-db6e2f407b78
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191390

gallium-llvm needs to be built with clang if you, for example
want to have support for opencl or want to build the intel-clc compiler.
meta-clang recommends to set

PREFERRED_PROVIDER_llvm =3D "clang"
PREFERRED_PROVIDER_llvm-native =3D "clang-native"

The current problem is that this is not taken into account in mesa and th=
erefore
both llvm and clang are included. This leads to files that are provided b=
y both
packages and would also unnecessarily increase the build time.
---
 meta/conf/distro/include/default-providers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
index d18173c744..10b771f7f9 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -38,6 +38,8 @@ PREFERRED_PROVIDER_dbus-glib-native ?=3D "dbus-glib-nat=
ive"
 PREFERRED_PROVIDER_gdk-pixbuf ?=3D "gdk-pixbuf"
 PREFERRED_PROVIDER_libgcc ?=3D "libgcc"
 PREFERRED_PROVIDER_nativesdk-libgcc ?=3D "nativesdk-libgcc"
+PREFERRED_PROVIDER_llvm ?=3D "llvm"
+PREFERRED_PROVIDER_llvm-native ?=3D "llvm-native"
 PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers"
 PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?=3D "nativesdk-linux-li=
bc-headers"
 PREFERRED_PROVIDER_matchbox-panel ?=3D "matchbox-panel-2"
--=20
2.42.1


