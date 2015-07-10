Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id A678D73710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 19:19:59 +0000 (UTC)
Received: by qkcl188 with SMTP id l188so30161345qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 12:19:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=IdqTmhbgcTNmVAM71Z/+8N/0tNBjDUHCI0tZ6QMp/9k=;
	b=lZI0go3vXGgJKhDX57vwp1wguBjQC2a0T3u6M8xmkDCnA7GBONLoYwJeJzRAUoqIMS
	KyEs7V2OOP3QfBWp1QgqE1ViSPeocGYLVLsWGgP8gphZ4mVAGBLSGwppkv182XLuvVlC
	xp4zyGYmZrIx1++SpnWTgq34MG+SoeCLQe6p2EU7WI6RdxxZ6nsg7b57f/ADnI45J8ut
	3WbDRpqknqACQcbeVTWZZa6Cn4gpSqsvpkIHDkucXgfX2bsxs62RQ3e1B/2H1VzEvTAJ
	UFlM6bIG1RPASxZ/DU6Hh2Ar5Yvbp1kcfTJIGrvVMbgh/afBZv1oc1JCZBc3ubBYPC+O
	UobQ==
X-Gm-Message-State: ALoCoQkzFdiak/Aiz7NgS7YGzosrRTuACxLKoSE4ZRMt9FjDqncTZKjj32ilZZ++6jfwwuQt3qcn
X-Received: by 10.55.23.86 with SMTP id i83mr35893428qkh.100.1436555999514;
	Fri, 10 Jul 2015 12:19:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 12:19:40 -0700 (PDT)
In-Reply-To: <559FFC43.4030505@ni.com>
References: <559F02AE.3010501@ni.com>
	<CAJTo0LZwXTDEKtR8+3EHfdEpMbB4P9nxyaC1odqW_dGHz5svAQ@mail.gmail.com>
	<559FFC43.4030505@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 20:19:40 +0100
Message-ID: <CAJTo0LakPEddo8FYyLk20McCR0Pkhrnt7Oab+rM+-HnoRV5piw@mail.gmail.com>
To: Connor Smith <connor.smith@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Library Patches Causing Many Packages to Rebuild
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
X-List-Received-Date: Fri, 10 Jul 2015 19:20:03 -0000
Content-Type: multipart/alternative; boundary=001a11470c8a0d2a71051a8a42a8

--001a11470c8a0d2a71051a8a42a8
Content-Type: text/plain; charset=UTF-8

On 10 July 2015 at 18:09, Connor Smith <connor.smith@ni.com> wrote:

> Ah, that makes sense. I investigated some more, and the do_package task
> has a hard-coded dependency on rpm-native. Removing this dependency and
> rebuilding resolved the issue; the only ipks being rebuilt now are from
> packages that depend on openssl and need to be recompiled.
>
> Should this dependency be based off PACKAGE_CLASSES, or is it necessary
> to always depend on rpm-native? We're using opkg, not rpm.
>

do_package() uses rpmdeps-oecore built by rpm-native to inject
dependencies, so you'll always need to build rpm-native.

Ross

--001a11470c8a0d2a71051a8a42a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 July 2015 at 18:09, Connor Smith <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:connor.smith@ni.com" target=3D"_blank">connor.smith@ni.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div text=3D"#000000" bgcolor=
=3D"#FFFFFF">Ah, that makes sense. I investigated some more, and the do_pac=
kage
    task<br>
    has a hard-coded dependency on rpm-native. Removing this dependency
    and<br>
    rebuilding resolved the issue; the only ipks being rebuilt now are
    from<br>
    packages that depend on openssl and need to be recompiled.<br>
    <br>
    Should this dependency be based off PACKAGE_CLASSES, or is it
    necessary<br>
    to always depend on rpm-native? We&#39;re using opkg, not rpm.</div></b=
lockquote></div><br>do_package() uses rpmdeps-oecore built by rpm-native to=
 inject dependencies, so you&#39;ll always need to build rpm-native.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a11470c8a0d2a71051a8a42a8--
