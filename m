Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F24F46130
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:40:26 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18914.1774276491779280657
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=J0GdbdNJ;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: brgl@kernel.org)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 18CCF41A24
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:34:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66F6C2BC9E
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276490;
	bh=5ecn7LU7E8Vdn29yau00qUT+q/ZUSd5HCTIuAOtG7bw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=J0GdbdNJzMnc6Yc57vkflsUhgk82B+vhWu0chAZ75RA7l5ULgaOWDNAgWZMowt7Ar
	 95W8etqHCvmiPLm0R0bcQyTamS+WZTTqNN5Nb5r8UBd5iRfL57fm/YfJNxb2pufzuo
	 tIMqJBCw+imtt9RelleNHqjDSM+yrBIhEAabl3/qgScwY1fcO/J/xHazE2RFJ5qEHa
	 8Fx99U7Zvcoy9cvpaHXpk1o/fskDReFINZOGL18CLCOXT5ENUJZijyKdBLRs4kSBno
	 Vk3js3hbarDMrc6opeL4rZfxh01TAyes9mXoEdjxm3EXipKQ7ai8dneUwrO+OXA90j
	 SVWMEbpnSDVdA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38bf132993dso2106891fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:34:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUO1GNNtepzscXIuEMLUDioS8nHj3fXcEQ/YKHk9fh40burQsYK9xN6hVRQevQtON+VoYIOmTyUXFKIkGL7XXL+1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzWsQ7qIlJQsBv81/xIlIZp6n/0s/e7wdJa6quKLabSSoSNXodX
	59gtKilDf5TWGzr3QzhBy1pGzuNvpCbol3waf/KB19Wy0qvvrgOiDS0sbNIEHKjkSWS4PSJ2zby
	6Udssodwzdj+ynivHXfSuxVT/brgY3x4cw/mqzSpC7g==
X-Received: by 2002:a05:651c:4092:b0:38a:32af:9219 with SMTP id
 38308e7fff4ca-38bf96079e4mr33378081fa.3.1774276489567; Mon, 23 Mar 2026
 07:34:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 07:34:47 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 23 Mar 2026 07:34:47 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com>
MIME-Version: 1.0
References: <20260312120024.3745232-1-zboszor@gmail.com> <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com>
Date: Mon, 23 Mar 2026 07:34:47 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
X-Gm-Features: AaiRm52gPvu-zUNwlc9yQxbkoKhRDW9Yf3_Eq8Vr8NGDvdWgo8kF-tLlsjqfgkk
Message-ID: <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for free threading
To: zboszor@gmail.com
Cc: "Zoltan Boszormenyi via lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233738

On Mon, 23 Mar 2026 15:23:52 +0100, "Zoltan Boszormenyi via
lists.openembedded.org" <zboszor=3Dgmail.com@lists.openembedded.org>
said:
>>
>> Any hints on what could be wrong? The same config builds fine without th=
e
>> new option. It's just a core-image-minimal on poky with a few python pac=
kages
>> from meta-openembedded.
>
> The problem is that now the directories are
> ${libdir}/python3.14t and ${includedir}/python3.14t
>
> Note the "t" suffix.
>
> diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb
> b/meta/recipes-devtools/python/python3_3.14.3.bb
> index 7a1ad1e386..492f2f93f0 100644
> --- a/meta/recipes-devtools/python/python3_3.14.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.3.bb
> @@ -47,7 +47,7 @@ UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)=
+).tar"
>
>  =C2=A0CVE_PRODUCT =3D "python:python python_software_foundation:python c=
python"
>
> -PYTHON_MAJMIN =3D "3.14"
> +PYTHON_MAJMIN =3D "3.14${@bb.utils.contains('PACKAGECONFIG', 'freethread=
ing', 't', '', d)}"
>
>  =C2=A0S =3D "${UNPACKDIR}/Python-${PV}"
>

I think it's more fine-grained, because I'm seeing this:

ERROR: Task (/home/brgl/workspace/yocto/python-freethreaded/sources/openemb=
edded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_prepa=
re_recipe_sysroot)
failed with exit code '1'
ERROR: python3-3.14.3-r0 do_package: QA Issue: python3:
Files/directories were installed but not shipped in any package:
  /usr/bin/python3.14
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
python3: 1 installed and not shipped files. [installed-vs-shipped]
ERROR: python3-3.14.3-r0 do_package: Fatal QA errors were found, failing ta=
sk.
ERROR: Logfile of failure stored in:
/home/brgl/workspace/yocto/python-freethreaded/build/tmp/work/x86-64-v3-pok=
y-linux/python3/3.14.3/temp/log.do_package.2308607
ERROR: Task (/home/brgl/workspace/yocto/python-freethreaded/sources/openemb=
edded-core/meta/recipes-devtools/python/python3_3.14.3.bb:do_package)
failed with exit code '1'

The MAJMIN seems to be used for the executable as well and with this change=
,
it's missing from FILES.

Bart

