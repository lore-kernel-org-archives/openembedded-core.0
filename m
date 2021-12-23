Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 357AAC433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 12:28:41 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web12.32168.1640262519688706945
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 04:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=nOMnqnC1;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 0F3FE5C0193;
	Thu, 23 Dec 2021 07:28:39 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Thu, 23 Dec 2021 07:28:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type:content-transfer-encoding; s=fm3; bh=1WdAW
	x9uupfeWdfnzFxdPkd6Le9RJhRVLoAMvjVDxpU=; b=nOMnqnC1hTbU0QV4CY0Pj
	B/2ZCPfZlUbH1t5p/lZeVgR6yKZnnbkIy0g6Od+vAJEChz+hSnO0hJix9jyhm+Uu
	TDAuqkWUn3GKJNKZ/+rz2VmaXnKxR7uXqYhabkihe47CIJ3BT5fiDOaElXekFbST
	9p6aqxLjZX75pc9AJef+zUiSAHjg51/RI78p4X/sE9uMM3xzvPvsKyD7VkK5Zbsu
	gkvr0CCaIdekrys96BPX7zuc29p+iO8InKnaAG6yzWRUMfDp6rBfyF5AaKnubDyc
	XPpdR4D4M3HtTRRo962zBML/iiQLwLBWiSOB9s5RjjtWwfty1T+lFNL1x8Id1Dv1
	w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; bh=1WdAWx9uupfeWdfnzFxdPkd6Le9RJhRVLoAMvjVDx
	pU=; b=VksxiKkBqlNlZeNVIYPMugx6Ck+WN5pPMwmoGcWaGsPZkKh4xjKUl36Cs
	vFIyIHwldOd99FRj2nn74P1KtLBXN7PgU6IOipzWQJtjT7fqHX4gUUCAgw1i4anD
	0l9W5buII2nfVAhxJdPjmqLl7Q3LiR2d2MmbqwhbtVWeKGiEBMmzM369I0dEnIF7
	KCPputR/V1FmPo7Kf5VrB06IGhcZ40kN/7YjCxVSv8o6Nmf8CUVVhUxNDgxu9klc
	4uDYx+BkM/8IDeKKJqncIt8Oss++FtJbxFTZncMCK8ipmiull8lqENn47NH0jD7m
	Gc09EfpVlshGb/ibVfZjP0Gjspxmw==
X-ME-Sender: <xms:dmvEYcbyj9ojeWbQYNMl3w-q_IV94nbEu_67nhFXFXQOKEORFFGIyw>
    <xme:dmvEYXZe5i3y90NW8i-yGs--WG2JFDjz3_dwpj2YDz1X0-8axdY7EDvEzgtUM9812
    vllk3lCcW71HzXnON8>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddruddtkedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
    ughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqne
    cuggftrfgrthhtvghrnhepheejfeejuefhfeevudejleehkeetfefhteeulefhhfdtudej
    vdeufeeiudelgefgnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
    ihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:dmvEYW-UHOQi0l3v38TwXmJIPyyoN6O-rlJJBufdEfmFyNqn_5DwDg>
    <xmx:dmvEYWpZviq0pPzuQLpAQH6wA-Qf85bLVjrCrKjyayEGpztJdjXx2g>
    <xmx:dmvEYXoSXc3bou6ZS0N61AY203WysTcefOjRmBvEgU_eUIklcYxB1A>
    <xmx:d2vEYRGqL2Cr6n5kffyazJyIr_zN9i4f0K8wwNCLe_fDY4x9qdYjuA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CC1AA3C00CF; Thu, 23 Dec 2021 07:28:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4525-g8883000b21-fm-20211221.001-g8883000b
Mime-Version: 1.0
Message-Id: <1392c736-4b3a-469a-9f5a-c8e27694f73d@www.fastmail.com>
In-Reply-To: 
 <fdca8e9d3824e0cf0782cf54d2967c7796b44e28.camel@linuxfoundation.org>
References: <09f8ff3a-829d-41e4-95c1-fd203eaba643@www.fastmail.com>
 <28190.1639964358069173094@lists.openembedded.org>
 <429927de-21b9-4c9a-8a8f-93a3b64242b1@www.fastmail.com>
 <fdca8e9d3824e0cf0782cf54d2967c7796b44e28.camel@linuxfoundation.org>
Date: Thu, 23 Dec 2021 12:28:17 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcc: Fix tm.h plugin header
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 12:28:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159979

Hi Richard,

On Tue, 21 Dec 2021, at 12:04, Richard Purdie wrote:
> On Tue, 2021-12-21 at 11:56 +0000, Andrei Gherzan wrote:
>> On Mon, 20 Dec 2021, at 01:39, Bernhard Rosenkr=C3=A4nzer via
>> lists.openembedded.org wrote:
>> > On Thu, Dec 9, 2021 at 07:40 PM, Andrei Gherzan wrote:
>> > =C2=A0
>> > > On Thu, 9 Dec 2021, at 16:40, Khem Raj wrote:
>> > > =C2=A0
>> > > > On Thu, Dec 9, 2021 at 7:40 AM Andrei Gherzan <andrei@gherzan.c=
om>
>> > > > wrote:
>> > > > =C2=A0
>> > > > > From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> > > > >=20
>> > > > > On x86-64, tm.h (needed to build gcc plugins) tries to include
>> > > > > config/i386/linux64.h, which isn't installed. Fortunately it =
also
>> > > > > isn't
>> > > > > used, so simply removing the include statement is an ok fix.
>> > > > is it due to multilib support ? if so we might be ok since we m=
ay not
>> > > > be using it
>> > > > but really it will be good to check it with multilib builds of
>> > > > x86_64/x86
>> > > I don't think it is related to multilib but I'll give multilib a =
try. In
>> > > my case, the issue was revealed when compiling a kernel plugin co=
nfig. I
>> > > can't remember right now which one but I can replicate it for log=
s.
>> > Hi,
>> > I've had a closer look at the problem, and can confirm the patch do=
esn't
>> > break even in multilib setups.
>> >=20
>> > The problem is that in a non-multilib setup, the config/i386/linux6=
4.h
>> > header is not generated, but tm.h tries to include it nevertheless,=
 causing
>> > any gcc plugin that #includes tm.h (such as all the gcc plugins in =
the
>> > kernel -- tm.h is included by scripts/gcc-plugins/gcc-common.h) to =
fail to
>> > build.
>> > An alternative fix would be adding
>> > mkdir -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/con=
fig/i386
>> > touch=C2=A0${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/c=
onfig/i386/lin
>> > ux64.h
>> > (creating the file if it isn't there) instead. This would make sure=
 that in
>> > cases where config/i386/linux64.h does exist, it doesn't get remove=
d from
>> > tm.h (potentially fixing plugins that reference any of the #defines=
 in
>> > i386/linux64.h without including the file manually -- but I have ye=
t to see
>> > any such plugin).
>> >=20
>> > I will try to get a better fix (not adding the include statement to=
 tm.h in
>> > the first place rather than having to remove it later in install sc=
ripts)
>> > upstream, but in the mean time, the patch fixes our builds before t=
he better
>> > fix is ready/applied.
>>=20
>> Ping on this patch. Any chance we can pull it in as a first iteration=
 of the
>> solution?
>
> I don't like sed in this context as if the code changes, it silently s=
tops
> working and we struggle to know what broke or whether we need to fix i=
t. We
> don't have any test case.
>
> Given all that, the touch of the file is a neater solution as it is mo=
re obvious
> what it is doing. I'd also want to see some more detailed comments in =
the code
> about what it is doing and why.
>
> Maintainability of these kinds of fixes is key.

I totally agree so I dug a bit more into this and arrived at a different=
 fix. Pushed it to the ml - https://lists.openembedded.org/g/openembedde=
d-core/message/159978

---
Andrei

