Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04F2C433F5
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 11:57:16 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web11.4817.1640087834119820079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 03:57:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=pLs5n3ca;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id DB17C5C02ED
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 06:57:10 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Tue, 21 Dec 2021 06:57:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm3; bh=qVMiWLjCS7LgFbAQkBd7i8ICWEzASZ6
	K2r5JUjZxb/s=; b=pLs5n3cazPNtrDO0fAZrAJ/NBnT2DEBj7yphkziVb6Y4z5s
	sx6cHTFFFVVOjbKTlJeSAJk93VSQ39PGOM/Bc+91Sdx6BIqRG9fcpd9QLYiR9nyh
	GOLwkxrSY8TiOuvlIAbxGN979xtDt99pd7LmWXb7DvyoPoHM7VqMAaX/osU66a7z
	bbCsM2afAvecnoJeECAPjBtxwXl7nhjDWBBSjVRD46a4DEAiHS3FkxNBRQ3ylFT5
	6LUNVtKHxh/JWSrjAWNPuU0EsRSaxlSheMZCNaybtPR0QV7HvFPiUtUKh+icshs/
	KCxtOOR1UFrHDfmU5jFySzJEs/B/nv0CMacig5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qVMiWL
	jCS7LgFbAQkBd7i8ICWEzASZ6K2r5JUjZxb/s=; b=AFnFgeZVvhhaoM9cLF7NCh
	16c9QuqVywT3yLyNCw2/vwMsOPROxd+fdMaXneGRFTQUH0EmJuTD62XvkS0DnNO9
	ZxetccZofCNP17Ne3neEPlA+HbkqIQxHnsT01+ZU0K++QvkEw2SkFejPSn9dtUYn
	I+cUOcY95GQ2OA+YvGGIAUOFwSP2/zTT42apM+FCyy/i+4/vMPPDK+uEtuEdcIDI
	+kZ0TDLpHwG6XSqqmov2pjcZFhUUzWiI0+5NjtG5jtGePYjRkcU/a9hDqV0zfLQ0
	+P2NJ+vHHk9p5Ft5yIcBzenTd6oyJLPSExcQ1JPsZ+7boN6e3bdZS1mih6ee3URQ
	==
X-ME-Sender: <xms:FsHBYfMMfCHMvZrqUN3wnkHuaR2pGRL9C70rINsGD2kqHOmvk6KIRQ>
    <xme:FsHBYZ_xbacmGuT543xX9PoTghwzn-cez2IEXqTfYQU0MolPtBqyUj5g3lMRXiFst
    j3nfeyAZQMj-PzD55I>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddruddtgedgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsegrtd
    erreerreejnecuhfhrohhmpedftehnughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgv
    ihesghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepvdekieeggffgjeeife
    efhfefiefhfeelleeuveeuteduhefguddtudekteetjedvnecuffhomhgrihhnpehophgv
    nhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:FsHBYeQS2aj2KH0osplstVefyHiqN5bgCGSKmnQUDOzIaad8RFxLpg>
    <xmx:FsHBYTtPeVLalcnf4m8bcaIdWL4V8ha3fikb8g9qmp4cxeZkoiVoXQ>
    <xmx:FsHBYXeCfYt3h9fv1BTHs3VamZCSfwP6ET8mMMhyYZO9wY44czs3Vw>
    <xmx:FsHBYRoDeLWMGlqyOZYjFXIag5kyjiW4g7ottJk2kTfFgx78RYJ6Tg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A3EAF3C00CF; Tue, 21 Dec 2021 06:57:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4525-g8883000b21-fm-20211221.001-g8883000b
Mime-Version: 1.0
Message-Id: <429927de-21b9-4c9a-8a8f-93a3b64242b1@www.fastmail.com>
In-Reply-To: <28190.1639964358069173094@lists.openembedded.org>
References: <09f8ff3a-829d-41e4-95c1-fd203eaba643@www.fastmail.com>
 <28190.1639964358069173094@lists.openembedded.org>
Date: Tue, 21 Dec 2021 11:56:49 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcc: Fix tm.h plugin header
Content-Type: multipart/alternative;
 boundary=2f5233ba3baa4861b68a8ac2c9b1c22b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 11:57:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159913

--2f5233ba3baa4861b68a8ac2c9b1c22b
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Dec 2021, at 01:39, Bernhard Rosenkr=C3=A4nzer via lists.open=
embedded.org wrote:
> On Thu, Dec 9, 2021 at 07:40 PM, Andrei Gherzan wrote:
>=20
>> On Thu, 9 Dec 2021, at 16:40, Khem Raj wrote:
>>=20
>>> On Thu, Dec 9, 2021 at 7:40 AM Andrei Gherzan <andrei@gherzan.com> w=
rote:
>>>=20
>>>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>>>=20
>>>> On x86-64, tm.h (needed to build gcc plugins) tries to include
>>>> config/i386/linux64.h, which isn't installed. Fortunately it also i=
sn't
>>>> used, so simply removing the include statement is an ok fix.
>>> is it due to multilib support ? if so we might be ok since we may not
>>> be using it
>>> but really it will be good to check it with multilib builds of x86_6=
4/x86
>> I don't think it is related to multilib but I'll give multilib a try.=
 In my case, the issue was revealed when compiling a kernel plugin confi=
g. I can't remember right now which one but I can replicate it for logs.
> Hi,
> I've had a closer look at the problem, and can confirm the patch doesn=
't break even in multilib setups.
>=20
> The problem is that in a non-multilib setup, the config/i386/linux64.h=
 header is not generated, but tm.h tries to include it nevertheless, cau=
sing any gcc plugin that #includes tm.h (such as all the gcc plugins in =
the kernel -- tm.h is included by scripts/gcc-plugins/gcc-common.h) to f=
ail to build.
> An alternative fix would be adding
> mkdir -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/config=
/i386
> touch ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugin/include/config/i3=
86/linux64.h
> (creating the file if it isn't there) instead. This would make sure th=
at in cases where config/i386/linux64.h does exist, it doesn't get remov=
ed from tm.h (potentially fixing plugins that reference any of the #defi=
nes in i386/linux64.h without including the file manually -- but I have =
yet to see any such plugin).
>=20
> I will try to get a better fix (not adding the include statement to tm=
.h in the first place rather than having to remove it later in install s=
cripts) upstream, but in the mean time, the patch fixes our builds befor=
e the better fix is ready/applied.

Ping on this patch. Any chance we can pull it in as a first iteration of=
 the solution?

---
Andrei

--2f5233ba3baa4861b68a8ac2c9b1c22b
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>On Mon, 20 Dec =
2021, at 01:39, Bernhard Rosenkr=C3=A4nzer via lists.openembedded.org wr=
ote:<br></div><blockquote type=3D"cite" id=3D"qt" style=3D""><div>On Thu=
, Dec 9, 2021 at 07:40 PM, Andrei Gherzan wrote:<br></div><div> <br></di=
v><blockquote><div>On Thu, 9 Dec 2021, at 16:40, Khem Raj wrote:<br></di=
v><div> <br></div><blockquote><div>On Thu, Dec 9, 2021 at 7:40 AM Andrei=
 Gherzan &lt;andrei@gherzan.com&gt; wrote:<br></div><div> <br></div><blo=
ckquote><div>From: Andrei Gherzan &lt;andrei.gherzan@huawei.com&gt;<br><=
/div><div><br></div><div>On x86-64, tm.h (needed to build gcc plugins) t=
ries to include<br></div><div>config/i386/linux64.h, which isn't install=
ed. Fortunately it also isn't<br></div><div>used, so simply removing the=
 include statement is an ok fix.<br></div></blockquote><div>is it due to=
 multilib support ? if so we might be ok since we may not<br></div><div>=
be using it<br></div><div>but really it will be good to check it with mu=
ltilib builds of x86_64/x86<br></div></blockquote><div>I don't think it =
is related to multilib but I'll give multilib a try. In my case, the iss=
ue was revealed when compiling a kernel plugin config. I can't remember =
right now which one but I can replicate it for logs.<br></div></blockquo=
te><div>Hi,<br></div><div>I've had a closer look at the problem, and can=
 confirm the patch doesn't break even in multilib setups.<br></div><div>=
<br></div><div>The problem is that in a non-multilib setup, the config/i=
386/linux64.h header is not generated, but tm.h tries to include it neve=
rtheless, causing any gcc plugin that #includes tm.h (such as all the gc=
c plugins in the kernel -- tm.h is included by scripts/gcc-plugins/gcc-c=
ommon.h) to fail to build.<br></div><div>An alternative fix would be add=
ing<br></div><div>mkdir -p ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/plugi=
n/include/config/i386<br></div><div>touch&nbsp;${D}${libdir}/gcc/${TARGE=
T_SYS}/${BINV}/plugin/include/config/i386/linux64.h<br></div><div>(creat=
ing the file if it isn't there) instead. This would make sure that in ca=
ses where config/i386/linux64.h does exist, it doesn't get removed from =
tm.h (potentially fixing plugins that reference any of the #defines in i=
386/linux64.h without including the file manually -- but I have yet to s=
ee any such plugin).<br></div><div><br></div><div>I will try to get a be=
tter fix (not adding the include statement to tm.h in the first place ra=
ther than having to remove it later in install scripts) upstream, but in=
 the mean time, the patch fixes our builds before the better fix is read=
y/applied.<br></div></blockquote><div><br></div><div>Ping on this patch.=
 Any chance we can pull it in as a first iteration of the solution?<br><=
/div><div><br></div><div>---<br></div><div>Andrei<br></div><div><br></di=
v></body></html>
--2f5233ba3baa4861b68a8ac2c9b1c22b--

