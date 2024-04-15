Return-Path: <timon.bergelt@pm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F710C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 07:21:16 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
 by mx.groups.io with SMTP id smtpd.web11.15593.1713165672540573567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 00:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pm.me header.s=protonmail3 header.b=WTKWe90E;
 spf=pass (domain: pm.me, ip: 185.70.40.131, mailfrom: timon.bergelt@pm.me)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1713165670; x=1713424870;
	bh=7bxOKcA/RbRqthGFdTSKL1x4he2C0fArxwVBkVS0Wo0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=WTKWe90EKDvB8IJs2MCOHzUB/ZurvfeZBD3GSXPdebDtdib+wuvT4+AugXyrzSX2A
	 AyXIdLMugBLbk3xy2QLxAbnZXWkf9PWeo35qY1jOUxN7U41lFrCRDlA37+8LOIhIP7
	 v+asgnw8Y75XfCW8KqHwpuLmJU3mpBrKej5bp9xmwNVH/cddCZVBXhLpVK6Ai0byR0
	 4nLmiJUF/O4QaNHhZmH65ogUPlaMvW3+lGkFySJFDd9tersanTefz80EVStfpNUqW5
	 85vkLbri+edz5zTzSW507OJGr7rYT0ow13Muy6shjchaUdlWbdyc0BXpJZ5Fmh6rGA
	 8BfDyZqV1Q3zQ==
Date: Mon, 15 Apr 2024 07:21:04 +0000
To: openembedded-core@lists.openembedded.org
From: Timon Bergelt <timon.bergelt@pm.me>
Cc: Timon Bergelt <timon.bergelt@pm.me>
Subject: [dunfell][PATCH] populate_sdk_ext.bbclass: only overwrite lsb string if uninative is used
Message-ID: <20240415072048.2008418-1-timon.bergelt@pm.me>
Feedback-ID: 31630908:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 07:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198221

Overwriting the lsb string without inheriting from uninative causes
shared state cache entries to end up in the wrong path where they are
not beeing picked up by the extensible SDK environment.

Signed-off-by: Timon Bergelt <timon.bergelt@pm.me>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_=
sdk_ext.bbclass
index 1bdfd92847..899f198659 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -449,7 +449,7 @@ python copy_buildsystem () {
     bb.utils.remove(sstate_out, True)
=20
     # uninative.bbclass sets NATIVELSBSTRING to 'universal%s' % oe.utils.h=
ost_gcc_version(d)
-    fixedlsbstring =3D "universal%s" % oe.utils.host_gcc_version(d)
+    fixedlsbstring =3D "universal%s" % oe.utils.host_gcc_version(d) if bb.=
data.inherits_class('uninative', d) else ""
=20
     sdk_include_toolchain =3D (d.getVar('SDK_INCLUDE_TOOLCHAIN') =3D=3D '1=
')
     sdk_ext_type =3D d.getVar('SDK_EXT_TYPE')
--=20
2.34.1



