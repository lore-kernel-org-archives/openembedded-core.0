Return-Path: <rich@richelberger.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1124FC636D6
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 13:14:47 +0000 (UTC)
Received: from a11-132.smtp-out.amazonses.com (a11-132.smtp-out.amazonses.com [54.240.11.132])
 by mx.groups.io with SMTP id smtpd.web10.8317.1677071685747023449
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Feb 2023 05:14:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@richelberger.com header.s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd header.b=A6+xfIB9;
 spf=pass (domain: amazonses.com, ip: 54.240.11.132, mailfrom: 010001867943142a-876d7cb9-5f8a-4e70-87b8-295959c37148-000000@amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=5u2mht5g5nbgnd5xxu4iibla5zobc5bd; d=richelberger.com;
	t=1677071684;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
	bh=d8KbiMWiHsliOngBAVcVezfv6MHlV2UCLgl7jGxE8XI=;
	b=A6+xfIB9BrqKwKhFn64NNHoOb5IP7P59mln+pMF709zZkeAMDAMe0h0PCM9B8E9z
	K4Xuk5gZyLjvuM0YuTwa51LmFx9zaq/Tcc05tIzDPRkEXlVBfhXVOVF8qwfK0z1Kqnb
	mcpWN3gGof506ISEP031eOwWTeBWgrgYfknZMxcc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1677071684;
	h=Subject:From:To:Cc:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
	bh=d8KbiMWiHsliOngBAVcVezfv6MHlV2UCLgl7jGxE8XI=;
	b=W/HQYT9ecsQJs9hOtX0Djbyvu/fOjDvmOhidyiszebAUQgZA3boYPinnYiEoWgop
	eXNES6E7pBK2q4JA03exd7FQ/nyjiMjLHGMrOk5fi9EXn5w/P78ZlewsXg0N8gOjQoG
	Sr7gcSwCTLK5s7mPMbpQ7w7OPk6nRj9Ug/0P2pI4=
Subject: Re: [OE-core] [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor
 for style, add version check regex
From: =?UTF-8?Q?Richard_Elberger?= <rich@richelberger.com>
To: =?UTF-8?Q?Ross_Burton?= <Ross.Burton@arm.com>
Cc: =?UTF-8?Q?openembedded-core=40lists=2Eopenembedded=2Eorg?=
  <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2023 13:14:44 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AAEE0F32-07A5-421A-96CE-CC6DC5409CB6@arm.com>
References: <20230219213807.3415938-1-rich@richelberger.com> 
 <20230219213807.3415938-2-rich@richelberger.com> 
 <010001866b9d0634-676dbda8-5f68-4a16-b3f2-5b80d490524a-000000@email.amazonses.com> 
 <AAEE0F32-07A5-421A-96CE-CC6DC5409CB6@arm.com> 
 <d78abdec-39a4-2aa1-8379-a875010e8270@richelberger.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHZRKp3Rd+89yRvQFycCVf28l/dgwAAALvortlsCIAAhUpRjg==
Thread-Topic: [OE-core] [PATCH 2/2] [YOCTO #13270] docbook-xml-dtd: refactor
 for style, add version check regex
X-Wm-Sent-Timestamp: 1677071683
Message-ID: <010001867943142a-876d7cb9-5f8a-4e70-87b8-295959c37148-000000@email.amazonses.com>
Feedback-ID: 1.us-east-1.LF00NED762KFuBsfzrtoqw+Brn/qlF9OYdxWukAhsl8=:AmazonSES
X-SES-Outgoing: 2023.02.22-54.240.11.132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 13:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177569

Ross, I found the problem. Since I can't build world I will do best=20=0D=
=0Aeffort and build core-image-minimal through. In the patch I with put=20=
=0D=0Acomment, with additional explanation in the commit message, about t=
he=20=0D=0Amagic variable. In my opinion a couple lines are misplaced but=
 for sake=20=0D=0Aof not causing a patch domino effect I will revert to t=
he old behavior.=20=0D=0AI'll let the core group decide if you want to li=
ve with it or make a=20=0D=0Aworkitem for future effort.=0D=0A=0D=0AOn 2/=
21/23 08:45, Ross Burton wrote:=0D=0A> Sorry, but this doesn=E2=80=99t wo=
rk:=0D=0A>=0D=0A> If you build xmlto-native:=0D=0A>=0D=0A>   validity err=
or : Could not load the external subset "http://www.oasis-open.org/docboo=
k/xml/4.2/docbookx.dtd"=0D=0A>   Document /yocto/ross/build/tmp/work/aarc=
h64-linux/xmlto-native/0.0.28+0.0.29+gitAUTOINC+6fa6a0e076-r0/build/../gi=
t/doc/xmlif.xml does not validate=0D=0A>=0D=0A>   /yocto/ross/build/tmp/w=
ork/aarch64-linux/xmlto-native/0.0.28+0.0.29+gitAUTOINC+6fa6a0e076-r0/bui=
ld/../git/doc/xmlif.xml:4: warning: failed to load external entity "http:=
//www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"=0D=0A>      "http://ww=
w.oasis-open.org/docbook/xml/4.2/docbookx.dtd=E2=80=9D>=0D=0A>=0D=0A> Ros=
s=0D=0A

