Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id BD4EC6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 14:39:13 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id q83so101779546iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 07:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DNr+Rajmq2sVZyHJTxRu0CPKLPwCdVe+2Zv28r0aGhk=;
	b=i74DqPOBooxQs/80VRk072Tw8gpH7hksKV2cyV65ZLEaLRQ9S2bAJB6hNAoP9mzX7H
	3cXh5j/XhUzxb3kHWrSOK53m+ESHOrxGu+zCV6CqWYChwC9ORdPuepn+fw66LFIY8rZM
	Tg3ZupJWb8cG7i7Kwnl72Zwovv8nF1iwCNInA/uFWoUqpk5cvtg3jqDSd2LVbvSWJ2i8
	gOaWnizaXNJsXWOx9ahQO1mXGW61+WlRsGwBffdbq7GUdYYWX2vS7ZYTZ0yis4igo2TM
	NMcUa7K6TpywuegasAV5C0UTE947aZzCqPrVcFSrkOZcBBihxQ7dgSXOKal0MtrZC5TD
	NNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DNr+Rajmq2sVZyHJTxRu0CPKLPwCdVe+2Zv28r0aGhk=;
	b=Vioab5OBoGHTdHUMVT2XeGOU0pNufN1jA/62wrqyM2wkpkjSI3izMolq592BXacaLt
	k0G6/4Wn5oONSFUTIX6LrsbYWMO3LbgQi+11KcJONGDB0XvC/Xw5NhQCQsQBF1kkJRSu
	LnrRsorS0fh/kNudfv10iyEaTal5DtPqig7/9klUXQj5pTjW4mhMVJ/QEXwjakltoLtf
	8L0zZCoza3wJvpr8Rgy4mLIV22o7eMnp+xV2rANVnvS/rfIoERSbAw6G50h4Y4Hae5Ja
	WsU7T74F3FmwhfQrdLi065P64A5adV8RKkrZ2t8eICnIDPXcRr2vDtlO5wJs5LZA60el
	vlAg==
X-Gm-Message-State: AEkooutFtQ5dAMJkkjnpG+NU2wbf/A27P9AfwCz9H3O+N2jdUozR6asZEiuQ1k6zLz3poV5Nm7bcMwBR453rTzZX
X-Received: by 10.107.154.196 with SMTP id c187mr37040614ioe.99.1469716753963; 
	Thu, 28 Jul 2016 07:39:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 28 Jul 2016 07:38:54 -0700 (PDT)
In-Reply-To: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
References: <1469714682-31488-1-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jul 2016 15:38:54 +0100
Message-ID: <CAJTo0LYu47+WLP0TXBsiVsm+orsqo_3wS0+7F2fs1suP+-jC9g@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth] [PATCH 00/12] fix checkuri failures for krogoth
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jul 2016 14:39:17 -0000
Content-Type: multipart/alternative; boundary=001a1140e81e0a80aa0538b319c4

--001a1140e81e0a80aa0538b319c4
Content-Type: text/plain; charset=UTF-8

On 28 July 2016 at 15:04, Maxin B. John <maxin.john@intel.com> wrote:

> Recipes that use DEBIAN_MIRROR in SRC_URI are setting themselves up for
> failure
> as the Debian mirror network only stores active releases, so once a
> version we
> use isn't in oldstable/stable/testing/unstable then it will be removed.
>
> The solution here is to use the snapshot.debian.org service for the
> SRC_URI,
> and set UPSTREAM_CHECK_URI to the relevant pool directory on
> DEBIAN_MIRRORS.
> This way we get a stable SRC_URI but still have new upstream release
> checking.
>

Will these all apply to master too?

Ross

--001a1140e81e0a80aa0538b319c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 July 2016 at 15:04, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2f5" class=3D"a3=
s aXjCH m15631d6668b51e0f">Recipes that use DEBIAN_MIRROR in SRC_URI are se=
tting themselves up for failure<br>
as the Debian mirror network only stores active releases, so once a version=
 we<br>
use isn&#39;t in oldstable/stable/testing/unstable then it will be removed.=
<br>
<br>
The solution here is to use the <a href=3D"http://snapshot.debian.org" rel=
=3D"noreferrer" target=3D"_blank">snapshot.debian.org</a> service for the S=
RC_URI,<br>
and set UPSTREAM_CHECK_URI to the relevant pool directory on DEBIAN_MIRRORS=
.<br>
This way we get a stable SRC_URI but still have new upstream release checki=
ng.<br></div></blockquote></div><br>Will these all apply to master too?</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a1140e81e0a80aa0538b319c4--
