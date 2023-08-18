Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E43DC001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 09:39:41 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web10.7538.1692351577580706275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 02:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@zhukoff.net header.s=fm1 header.b=fLqn8FJE;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=kn8u3QhM;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.24, mailfrom: pavel@zhukoff.net)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 84572320093E;
	Fri, 18 Aug 2023 05:39:34 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 18 Aug 2023 05:39:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1692351573; x=1692437973; bh=sB
	7N5l15kQG0Slm5P1RQFFihN49zWjcVWdVRKLxGWLU=; b=fLqn8FJEoIgBTo6KSj
	+8AaKpTKt10riT54O8MjjcgHypRihchm6ub8c4iTVkRoORPGTyLy+lpQrw2S5SMB
	JdIHBij6EopcWjGPm7s2IjVw8u+JfVclh/FhF4O5N0PveDcTIEpuFczByG1PGbvm
	uiqi8e4B6+PKsYA99qvXs+T6LWvXNNGToVoti+pb0rDdaFTcqdE4GAoSMxyy082a
	nzkkC8ATGafZKNmTjhoRyFup0rYMjPst9B41bOTNBNBfq2dmbmiBxUZcVFtKPwiv
	i+fBFeyDUZHHKodO3iwKxhb0KBg3+ARb8U1Mjqot2J6K5snX0wDjf94HcPndwtO5
	Z92A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692351573; x=1692437973; bh=sB7N5l15kQG0S
	lm5P1RQFFihN49zWjcVWdVRKLxGWLU=; b=kn8u3QhMji+gJklc3woC03wdnTgiu
	gGg/g0WEm2fvvobvo/vLNOFZPIlOR0LqOvDnvsuDNRNZLblTJZ7LJ6WL1v/7cks2
	Cs8WlJnIblrBkSOFo8zVs4ITTUP72mc8bVIVDe0b1UVONO1cf+CoX/rT1n+VC/mu
	/5/zN3VcCGGPR2jMEBOG06CsfKvgTCYKYWmGMAsm6j/Vh2TmcFH1GSXAmcAThOIL
	hhUmVUSQoYgXbBUusEcMbz4Sm4gZTmuIDAEqGlXQ/wx9He8c271+z8ceExYNgFzg
	gAnzX86BuICGQdIh+IlN+qxcSSWpf2zFT6xqNc79LOFRqCaWn/Yfpz1Eg==
X-ME-Sender: <xms:VTzfZGrdYCOK0eVH1k1URlwWHY5BVMwMkcIPhcK9GFKDXBD6xSKKFw>
    <xme:VTzfZEqe2WjlCJf6VHHTyveGX7sZeisfbi2jZOFc_O_8bS06mUzHiOBmTkPTL82bd
    qnbswR_2O1oF7fap1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddufedgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsegrtd
    erreerredtnecuhfhrohhmpedfrfgrvhgvlhcukghhuhhkohhvfdcuoehprghvvghlseii
    hhhukhhofhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeejudevhefhteekvdefvdeive
    ettdehkeffjeeujeeihfduheegffejledvgeehvdenucffohhmrghinhepohhpvghnvghm
    sggvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:VTzfZLM5dzjTwR2x1m_q2Dc0wYMdxFk7d_1Uf6mdiTq25l07X2ryAg>
    <xmx:VTzfZF7PgdhAiQy0Ojew5E_1mYMcqF-jJ9RXPSrHS3ua0wIUr54pug>
    <xmx:VTzfZF6Df7qYLUsvChjR4yA5DPq_kWMk9GsZtgFmOcMJ2vuvQdCFOA>
    <xmx:VTzfZGWQ0_Oq-JTSKskW8MGNSoi2oASrDGiDToaMAKkBft1EF_TBqQ>
Feedback-ID: ib94946c9:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6777BB60089; Fri, 18 Aug 2023 05:39:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <2e707be5-5139-4e2c-a967-ff258d69eaec@app.fastmail.com>
In-Reply-To: <20230818093056.10499-1-aplanas@suse.com>
References: <20230818093056.10499-1-aplanas@suse.com>
Date: Fri, 18 Aug 2023 11:39:12 +0200
From: "Pavel Zhukov" <pavel@zhukoff.net>
To: aplanas@suse.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] bitbake.conf: add bunzip2 in HOSTTOOLS
Content-Type: multipart/alternative;
 boundary=2a7e27e9e5544717907dfa5e8d5ec469
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 09:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186354

--2a7e27e9e5544717907dfa5e8d5ec469
Content-Type: text/plain

Hi Alberto,
Looks like the regression has been  introduced in  previous update. This patch https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=eb3ec7469fff857c819332371ad1d586f43c79c3 (which was reverted by https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=3aba44a75dd565b192f7328f2a0150a313de3cc1 )  solved the issue without bringing bunzip to every system

-- 
Pavel

On Fri, Aug 18, 2023, at 11:30, Alberto Planas via lists.openembedded.org wrote:
> From: Alberto Planas <aplanas@suse.com>
> 
> rpm2cpio.sh can make calls to bunzip2 to uncompress the RPM payload that
> conform the cpio file.
> 
> bzip2 is already part of HOSTTOOLS, as a link to the system installed
> bzip2.
> 
> This patch add bunzip2 in HOSTOOLS list as a non-optional binary, so is
> available to rpm2cpio.sh when it is required.
> 
> The currect rpm2cpio.sh has other calls to gunzip (present in HOSTOOLS),
> xzcat (missing), unlzma (missing) and unzstd (present in HOSTTOOLS since
> bff58d337890e804d33d7decbaa46065a4d3bba4)
> 
> Adding the missing ones will not add any new host dependency as xz-utils
> is already listed as a requirement.
> 
> Signed-off-by: Alberto Planas <aplanas@suse.com>
> ---
> meta/conf/bitbake.conf | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 599bbc4ba8..b19f265b3d 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -516,7 +516,7 @@ HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
>  
> # Tools needed to run builds with OE-Core
> HOSTTOOLS += " \
> -    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
> +    [ ar as awk basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
>      head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
> -- 
> 2.41.0
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186353): https://lists.openembedded.org/g/openembedded-core/message/186353
> Mute This Topic: https://lists.openembedded.org/mt/100817328/6390638
> Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-core%2Bowner@lists.openembedded.org>
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pavel@zhukoff.net]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

--2a7e27e9e5544717907dfa5e8d5ec469
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>Hi Alberto,<br>=
</div><div>Looks like the regression has been&nbsp; introduced in&nbsp; =
previous update. This patch&nbsp;<a href=3D"https://git.openembedded.org=
/openembedded-core/commit/?h=3Dmaster-next&amp;id=3Deb3ec7469fff857c8193=
32371ad1d586f43c79c3">https://git.openembedded.org/openembedded-core/com=
mit/?h=3Dmaster-next&amp;id=3Deb3ec7469fff857c819332371ad1d586f43c79c3</=
a>&nbsp;(which was reverted by&nbsp;<a href=3D"https://git.openembedded.=
org/openembedded-core/commit/?h=3Dmaster-next&amp;id=3D3aba44a75dd565b19=
2f7328f2a0150a313de3cc1">https://git.openembedded.org/openembedded-core/=
commit/?h=3Dmaster-next&amp;id=3D3aba44a75dd565b192f7328f2a0150a313de3cc=
1</a>&nbsp;)&nbsp; solved the issue without bringing bunzip to every sys=
tem</div><div><br></div><div>--&nbsp;<br></div><div>Pavel</div><div><br>=
</div><div>On Fri, Aug 18, 2023, at 11:30, Alberto Planas via lists.open=
embedded.org wrote:<br></div><blockquote type=3D"cite" id=3D"qt" style=3D=
""><div>From: Alberto Planas &lt;<a href=3D"mailto:aplanas@suse.com">apl=
anas@suse.com</a>&gt;<br></div><div><br></div><div>rpm2cpio.sh can make =
calls to bunzip2 to uncompress the RPM payload that<br></div><div>confor=
m the cpio file.<br></div><div><br></div><div>bzip2 is already part of H=
OSTTOOLS, as a link to the system installed<br></div><div>bzip2.<br></di=
v><div><br></div><div>This patch add bunzip2 in HOSTOOLS list as a non-o=
ptional binary, so is<br></div><div>available to rpm2cpio.sh when it is =
required.<br></div><div><br></div><div>The currect rpm2cpio.sh has other=
 calls to gunzip (present in HOSTOOLS),<br></div><div>xzcat (missing), u=
nlzma (missing) and unzstd (present in HOSTTOOLS since<br></div><div>bff=
58d337890e804d33d7decbaa46065a4d3bba4)<br></div><div><br></div><div>Addi=
ng the missing ones will not add any new host dependency as xz-utils<br>=
</div><div>is already listed as a requirement.<br></div><div><br></div><=
div>Signed-off-by: Alberto Planas &lt;<a href=3D"mailto:aplanas@suse.com=
">aplanas@suse.com</a>&gt;<br></div><div>---<br></div><div>meta/conf/bit=
bake.conf | 2 +-<br></div><div>1 file changed, 1 insertion(+), 1 deletio=
n(-)<br></div><div><br></div><div>diff --git a/meta/conf/bitbake.conf b/=
meta/conf/bitbake.conf<br></div><div>index 599bbc4ba8..b19f265b3d 100644=
<br></div><div>--- a/meta/conf/bitbake.conf<br></div><div>+++ b/meta/con=
f/bitbake.conf<br></div><div>@@ -516,7 +516,7 @@ HOSTTOOLS_DIR =3D "${TM=
PDIR}/hosttools"<br></div><div>&nbsp;<br></div><div># Tools needed to ru=
n builds with OE-Core<br></div><div>HOSTTOOLS +=3D " \<br></div><div>-&n=
bsp;&nbsp;&nbsp; [ ar as awk basename bash bzip2 cat chgrp chmod chown c=
hrpath cmp comm cp cpio \<br></div><div>+&nbsp;&nbsp;&nbsp; [ ar as awk =
basename bash bunzip2 bzip2 cat chgrp chmod chown chrpath cmp comm cp cp=
io \<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp; cpp cut date dd diff diffsta=
t dirname du echo egrep env expand expr false \<br></div><div>&nbsp;&nbs=
p;&nbsp;&nbsp; fgrep file find flock g++ gawk gcc getconf getopt git gre=
p gunzip gzip \<br></div><div>&nbsp;&nbsp;&nbsp;&nbsp; head hostname ico=
nv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \<br></di=
v><div>--&nbsp;<br></div><div>2.41.0<br></div><div><br></div><div><br></=
div><div><br></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br=
></div><div>Links: You receive all messages sent to this group.<br></div=
><div>View/Reply Online (#186353):&nbsp;<a href=3D"https://lists.openemb=
edded.org/g/openembedded-core/message/186353">https://lists.openembedded=
.org/g/openembedded-core/message/186353</a><br></div><div>Mute This Topi=
c:&nbsp;<a href=3D"https://lists.openembedded.org/mt/100817328/6390638">=
https://lists.openembedded.org/mt/100817328/6390638</a><br></div><div>Gr=
oup Owner:&nbsp;<a href=3D"mailto:openembedded-core%2Bowner@lists.openem=
bedded.org">openembedded-core+owner@lists.openembedded.org</a><br></div>=
<div>Unsubscribe:&nbsp;<a href=3D"https://lists.openembedded.org/g/opene=
mbedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/u=
nsub</a> [<a href=3D"mailto:pavel@zhukoff.net">pavel@zhukoff.net</a>]<br=
></div><div>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br></div><div>=
<br></div><div><br></div></blockquote><div><br></div></body></html>
--2a7e27e9e5544717907dfa5e8d5ec469--

