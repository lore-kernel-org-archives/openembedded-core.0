Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9A40C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 10:28:49 +0000 (UTC)
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
 by mx.groups.io with SMTP id smtpd.web10.70491.1705919324528548254
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 02:28:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm3 header.b=y5q3sljx;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=tb0uJtC/;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.19, mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id CA6713200AA5;
	Mon, 22 Jan 2024 05:28:41 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute4.internal (MEProxy); Mon, 22 Jan 2024 05:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1705919321; x=1706005721; bh=E3zfiQhX+n
	WEcPerOaFALdtK7jMsNKosEjbOclJ7mHs=; b=y5q3sljxoASRPzsy9/9MBSs5XQ
	gyS17OXvdsRVQfnFAxoHl1jwbD8LhfSCp6nosViB6g762+sbUn4baBFy6QDDlO7G
	mNfutaa3KVrxM3nL19LIUsy5aqHVhC/xkNDw7UbYkJjWbXkREJBcKxu0EnzD8lsW
	jNmjA9U3qmVfGpKoEbkcgEgJ71sv25/ZFlEiP188auImbKiMkkzR+rgL0oopC4C0
	4nigoWOxMynAl2UB+S5fllrAA7hbxaBsysUQbuJ0UXjRhk2jOjXDTv4Xnn6+nCWl
	FOjhPlkFAvwZCsU/piChPWTSJkY+GMJ1DBAVTN5V2b3aCh4bP+cqpRu/D+4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705919321; x=1706005721; bh=E3zfiQhX+nWEcPerOaFALdtK7jMs
	NKosEjbOclJ7mHs=; b=tb0uJtC/HjnN8lCncnqHMU4mvke2mg2N4OWs7DeZIhPL
	gObCjHOCZcB1L/DxZxUF8+hWMyrR9lyWmLfoAvqc5+d/2uiA7odvXD573Z5TBVrr
	0PmgVutIiADA3JBJ02QA+sGJmeu7oIVi/mC5rQt5H/Nd/4mlyRnfLR3rzb6gy7pM
	6xjmL1tV+Td4OJUZUV9S8qD5rw2TqpoE/zAtIdPm7aB0PF5Zw2E3ekDOrXU6C7LC
	9TIk80xe70YpHGAkceKUAbAga3w66o9GqgXvbN0hPgF6Yy3FDpO4fyCkhwRkp+CN
	gNCm+okTe5UBNOaTRWtvuIXCZjQO/WLtMiuEtY30+g==
X-ME-Sender: <xms:WUOuZajj4QnIlfXpPU4Twmid9dAqXHeg6RdQpOW8w1MS0UcLiyEa1w>
    <xme:WUOuZbD6jP7ItEGPBXLFKeTRbSOEpQ7cthPKmkvMHyVFF3Dgsm9IerNZaO1griXDc
    7SYaMzuFRTdWXjxKqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdekiedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsegrtderreerredtnecuhfhrohhmpedfrfgr
    vhgvlhcukghhuhhkohhvfdcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtf
    frrghtthgvrhhnpeejhfejvdevgfefvddvhfevfeehtddttdegieejveffveduffdtveeh
    geeigedtveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhophgvnhgvmhgsvgguug
    gvugdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:WUOuZSE14bzaAZepXn5E_np-4l1LGW4nkjU63AoXgRkp2xaRFQ8kRw>
    <xmx:WUOuZTSx7p6kAqC9ktkpzhVaekzWEKZsISd7CUl4USCWtHwtwhFq7Q>
    <xmx:WUOuZXzvCc-xV1xeWsum1Wl5zUUTLohHd1jf4xRzLxl4Wzey1kaYsw>
    <xmx:WUOuZYvTE1vo7pKP_VROoCxgd4oBOM2AazqKy6YnMKSoeu_k2lrMVw>
Feedback-ID: ib94946c9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 143EDB6008D; Mon, 22 Jan 2024 05:28:41 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1374-gc37f3abe3d-fm-20240102.001-gc37f3abe
MIME-Version: 1.0
Message-Id: <c8a2cb0e-e2d5-4232-bdb1-a854f8fb6705@app.fastmail.com>
In-Reply-To: 
 <CANNYZj-YMGJQ_9s=GE=6gFWcqrz=+OJdPZnRrzq54Hp=GO=eYw@mail.gmail.com>
References: <20240122085443.637472-2-pavel@zhukoff.net>
 <20240122085443.637472-4-pavel@zhukoff.net>
 <CANNYZj-YMGJQ_9s=GE=6gFWcqrz=+OJdPZnRrzq54Hp=GO=eYw@mail.gmail.com>
Date: Mon, 22 Jan 2024 11:28:23 +0100
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] mdadm: Disable ptest
Content-Type: multipart/alternative;
 boundary=1681ce1d876d46c78d95caae6d8ae78d
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 10:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194137

--1681ce1d876d46c78d95caae6d8ae78d
Content-Type: text/plain

Yes, Yoann has mentioned this already.
Seems like recipes use both PTEST_ENABLED and PTESTS_PROBLEMS for this purposes and I've not found any documentation. I'll update the patch to use PTESTS_PROBLEMS instead 

-- 
Pavel

On Mon, Jan 22, 2024, at 11:21, Alexander Kanavin wrote:
> On Mon, 22 Jan 2024 at 09:55, Pavel Zhukov <pavel@zhukoff.net> wrote:
> > mdadm tests are flaky and cause a lot of failures on autobuilder.
> > Disable them for now. Keeping ptest code in the recipe to fix/enable
> > in the future
> >  SRC_URI = "git://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=https;branch=master \
> > -           file://run-ptest \
> > +# Disable ptests for now as they're flaky
> > +# but keeping ptest code in case we want to enable them in the future
> > +PTEST_ENABLED="0"
> > +SRC_URI:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' file://run-ptest', '', d)}"
> 
> The correct way to do this is to modify
> conf/distro/include/ptest-packagelists.inc. There's a specific
> exclusion list made for that purpose in there at the end.
> 
> Alex
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194135): https://lists.openembedded.org/g/openembedded-core/message/194135
> Mute This Topic: https://lists.openembedded.org/mt/103882792/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

--1681ce1d876d46c78d95caae6d8ae78d
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>Yes, Yoann has =
mentioned this already.<br></div><div>Seems like recipes use both PTEST_=
ENABLED and PTESTS_PROBLEMS for this purposes and I've not found any doc=
umentation. I'll update the patch to use PTESTS_PROBLEMS instead&nbsp;<b=
r></div><div><br></div><div>--&nbsp;<br></div><div>Pavel</div><div><br><=
/div><div>On Mon, Jan 22, 2024, at 11:21, Alexander Kanavin wrote:<br></=
div><blockquote type=3D"cite" id=3D"qt" style=3D""><div>On Mon, 22 Jan 2=
024 at 09:55, Pavel Zhukov &lt;<a href=3D"mailto:pavel@zhukoff.net">pave=
l@zhukoff.net</a>&gt; wrote:<br></div><div>&gt; mdadm tests are flaky an=
d cause a lot of failures on autobuilder.<br></div><div>&gt; Disable the=
m for now. Keeping ptest code in the recipe to fix/enable<br></div><div>=
&gt; in the future<br></div><div>&gt;&nbsp; SRC_URI =3D "git://<a href=3D=
"http://git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=3Dhttps;br=
anch=3Dmaster">git.kernel.org/pub/scm/utils/mdadm/mdadm.git;protocol=3Dh=
ttps;branch=3Dmaster</a> \<br></div><div>&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://run-ptest \<br></div><div>&gt=
; +# Disable ptests for now as they're flaky<br></div><div>&gt; +# but k=
eeping ptest code in case we want to enable them in the future<br></div>=
<div>&gt; +PTEST_ENABLED=3D"0"<br></div><div>&gt; +SRC_URI:append =3D "$=
{@bb.utils.contains('PTEST_ENABLED', '1', ' file://run-ptest', '', d)}"<=
br></div><div><br></div><div>The correct way to do this is to modify<br>=
</div><div>conf/distro/include/ptest-packagelists.inc. There's a specifi=
c<br></div><div>exclusion list made for that purpose in there at the end=
.<br></div><div><br></div><div>Alex<br></div><div><br></div><div><br></d=
iv><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div>Link=
s: You receive all messages sent to this group.<br></div><div>View/Reply=
 Online (#194135):&nbsp;<a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/194135">https://lists.openembedded.org/g/openembed=
ded-core/message/194135</a><br></div><div>Mute This Topic:&nbsp;<a href=3D=
"https://lists.openembedded.org/mt/103882792/6390638">https://lists.open=
embedded.org/mt/103882792/6390638</a><br></div><div>Group Owner:&nbsp;<a=
 href=3D"mailto:openembedded-core%2Bowner@lists.openembedded.org">openem=
bedded-core+owner@lists.openembedded.org</a><br></div><div>Unsubscribe:&=
nbsp;<a href=3D"https://lists.openembedded.org/g/openembedded-core/unsub=
">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D=
"mailto:pavel@zhukoff.net">pavel@zhukoff.net</a>]<br></div><div>-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div><br></div><div><br><=
/div></blockquote><div><br></div></body></html>
--1681ce1d876d46c78d95caae6d8ae78d--

