Return-Path: <timon.bergelt@pm.me>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B30C54E67
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 11:06:18 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web11.13015.1711623975029804766
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 04:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pm.me header.s=protonmail3 header.b=nfN/bNYw;
 spf=pass (domain: pm.me, ip: 185.70.43.22, mailfrom: timon.bergelt@pm.me)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1711623972; x=1711883172;
	bh=Ptstc6X2R3HX35f/YLgqT79AF4fnMiOeo6FW5wErdqo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nfN/bNYwS4SnvAy4UHU/CUBWd2uQE9BbFW+ZmKfzuZWFnVJZ4rCxk9DITcTSXkmTH
	 1Y2nPti93GlzN2ChPCiAUZLLdJXQDLwckf4AEYWueFhPFOV7MiJJWTO2g4sMxWmcQZ
	 CHmR7g6ggPqzz9mpBAej/QVVoA2Yob5Kcn6+vy4W03paiq+IJQm9byfO6yqMd/kjoE
	 t67ZdfxHOqog/+3w39B1lpXI+qKq58D4zk4tmkXt3cTMw0Lndh7fw+Y02cOqXVEKV9
	 cYRsRNpgJUbiJDAoZGZ55sn22iRo5ejCIv4L2/x+zOaowd+RoB6LwuitIQCzBlu4uq
	 R00ClhKldTqsQ==
Date: Thu, 28 Mar 2024 11:06:08 +0000
To: openembedded-core@lists.openembedded.org
From: Timon Bergelt <timon.bergelt@pm.me>
Cc: Timon Bergelt <timon.bergelt@pm.me>
Subject: [PATCH] populate_sdk_ext.bbclass: only overwirte lsb string if uninative is used
Message-ID: <20240328110551.869306-1-timon.bergelt@pm.me>
Feedback-ID: 31630908:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 11:06:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197573

Overwriting the lsb string without inheriting from uninative causes
shared state cache entries to end up in the wrong path where they are
not beeing picked up by the extensible SDK environment.

Signed-off-by: Timon Bergelt <timon.bergelt@pm.me>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-re=
cipe/populate_sdk_ext.bbclass
index f209becae1..f5687e5899 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -494,7 +494,7 @@ def prepare_locked_cache(d, baseoutpath, derivative, co=
nf_initpath):
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



