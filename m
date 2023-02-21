Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FB7C636D7
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:14:57 +0000 (UTC)
Received: from a48-179.smtp-out.amazonses.com (a48-179.smtp-out.amazonses.com [54.240.48.179])
 by mx.groups.io with SMTP id smtpd.web10.42850.1676988890878635006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:14:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=a6k/tatN;
 spf=pass (domain: amazonses.com, ip: 54.240.48.179, mailfrom: 010001867453baf1-8b731419-55f4-45b4-bd0f-0a7d97fc3023-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1676988890;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=LaimQqsVSFbs9b3DvhMMeyMyHkrSDWN7aWYYM6axWRM=;
	b=a6k/tatN2VR6H+2X+9VoveUnjmJJesSHYo8CAHjKyVlLsqEAPfecCXdE8eff5qec
	mj/DDVaDA7DoJLXYpJInL+rlxtLJ2sdPsirgLB8HLyUG3Vln8XYWpCvLlsS8uz7WnDj
	dIwL0iIGAaaq6lbIJS8Pl64yOJ8Tnq84pt0gYbDY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1676988890;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=LaimQqsVSFbs9b3DvhMMeyMyHkrSDWN7aWYYM6axWRM=;
	b=i6ICJHTE1ybDuZs/Gpzxf3NX15/WiJa3vc0H/kn6k3kmP38Qw+aZHIVs+cvW4Ns3
	ZoukMLHRlIcg43tA57TP+8dxLhN2GTsqVEJNLKhzEBkKeNzCgwsf0cr9JE81rcbRPeC
	yhY3PtxFS7SdYsLXNqdYmEKLxbAPUVQ2Wk6muplc=
Subject: Re: [OE-core] [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor
 for style, add version check regex
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?Ross_Burton?= <Ross.Burton@arm.com>
Cc: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2023 14:14:49 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AAEE0F32-07A5-421A-96CE-CC6DC5409CB6@arm.com>
References: <20230219213807.3415938-1-rich@richelberger.com> 
 <20230219213807.3415938-2-rich@richelberger.com> 
 <010001866b9d0634-676dbda8-5f68-4a16-b3f2-5b80d490524a-000000@email.amazonses.com> 
 <AAEE0F32-07A5-421A-96CE-CC6DC5409CB6@arm.com> 
 <d4237fbd-e369-8572-170c-3300e1fd41d9@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRKp3Rd+89yRvQFycCVf28l/dgwAAALvortlsCIAAVRiyOQ==
Thread-Topic: [OE-core] [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor
 for style, add version check regex
X-Wm-Sent-Timestamp: 1676988887
Message-ID: <010001867453baf1-8b731419-55f4-45b4-bd0f-0a7d97fc3023-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.21-54.240.48.179
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177499

Hello Ross,=0D=0A=0D=0AIt wasn't entirely clear to me that the patch woul=
d be required if taken=20=0D=0Afrom docbook, but I see that my "test scop=
e" was not appropriate and you=20=0D=0Ahave surfaced why patching is requ=
ired. Now that I have a test target=20=0D=0Athis helps but in future I pr=
obably should build world but... just tried=20=0D=0Athat and got a gtk4 d=
ependency error.=0D=0A=0D=0Arpcme@proteus:~/elinux/oe-core/meta/recipes-d=
evtools/docbook-xml$=20=0D=0Abitbake world=0D=0ALoading cache: 100%=20=0D=
=0A|#####################################################################=
########################################|=20=0D=0ATime: 0:00:00=0D=0ALoad=
ed 1692 entries from dependency cache.=0D=0ANOTE: Resolving any missing t=
ask queue dependencies=0D=0AERROR: Nothing PROVIDES 'gtk4' (but=20=0D=0A/=
home/rpcme/elinux/oe-core/meta/recipes-gnome/libportal/libportal_0.6.bb=20=
=0D=0ADEPENDS on or otherwise requires it)=0D=0Agtk4 was skipped: missing=
 required distro feature 'opengl' (not in=20=0D=0ADISTRO_FEATURES)=0D=0AE=
RROR: Required build target 'meta-world-pkgdata' has no buildable=20=0D=0A=
providers.=0D=0AMissing or unbuildable dependency chain was: ['meta-world=
-pkgdata',=20=0D=0A'libportal', 'gtk4']=0D=0A=0D=0AGiven oe-core is distr=
oless (this is my first time not using a distro=20=0D=0Aconf), how best t=
o ensure I'm checking everything I need to check=20=0D=0A(beyond getting =
the patch right to make this buildable).=0D=0A=0D=0AWill do it this eveni=
ng after normal working hours ... the workday is=20=0D=0Anow in full swin=
g and cannot work on it right now...=0D=0A=0D=0AOn 2/21/23 08:45, Ross Bu=
rton wrote:=0D=0A> Sorry, but this doesn=E2=80=99t work:=0D=0A>=0D=0A> If=
 you build xmlto-native:=0D=0A>=0D=0A>   validity error : Could not load =
the external subset "http://www.oasis-open.org/docbook/xml/4.2/docbookx.d=
td"=0D=0A>   Document /yocto/ross/build/tmp/work/aarch64-linux/xmlto-nati=
ve/0.0.28+0.0.29+gitAUTOINC+6fa6a0e076-r0/build/../git/doc/xmlif.xml does=
 not validate=0D=0A>=0D=0A>   /yocto/ross/build/tmp/work/aarch64-linux/xm=
lto-native/0.0.28+0.0.29+gitAUTOINC+6fa6a0e076-r0/build/../git/doc/xmlif.=
xml:4: warning: failed to load external entity "http://www.oasis-open.org=
/docbook/xml/4.2/docbookx.dtd"=0D=0A>      "http://www.oasis-open.org/doc=
book/xml/4.2/docbookx.dtd=E2=80=9D>=0D=0A>=0D=0A> Ross=0D=0A

