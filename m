Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6518BC48BF6
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 20:31:16 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.4358.1708979473309240312
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 12:31:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ELncfsBx;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33de64c91abso298026f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 12:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708979472; x=1709584272; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyjMYQfuKQ3x+jUqVeWk2wncWYBZ4KlEnqsc/AdQ180=;
        b=ELncfsBxILjSX2FQqc8Sgjd2ogBiE9fl57WnS1yixLVAPvf9oZKpT2R6exd+QG/zNZ
         Xxm2MKTd2JVEchQRe+/xW3aM5kxuUpf8MbPkskSEfbGjskIv7+jMaEAOoHu7nHwWcmah
         UfBAu7XmvB1PockNWZ8IrJg7RPeXKLj85DHOECAAk8rjyeqaOwy6Uf6O75JNWBFAtxJx
         9yFLM0SSFiZkP1Yxcd5HwPLYBRh8sa7Gb2zRQS2UBzIJqYKLbNbsti6IBLzw4OnElJzx
         XEiDvybeyoBAvBrh439kDvYfyz1ysYSxu7deIh80E5HfKrQdbpzt1wN8XG8FITMzq8BS
         EXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708979472; x=1709584272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yyjMYQfuKQ3x+jUqVeWk2wncWYBZ4KlEnqsc/AdQ180=;
        b=TFWZ4DtSE6A97jTRJGg5fK/u/Rq56vTxOy1iNkkwjGWdueOq/l0HeYg5bb0knRhb+8
         rJwpRJVBrwbQiUpcpRBQwHax8M32Wpbtwsw9obgEKOivWzpvxrW08orhiOVZ94YJY9d+
         yINdRrPZ0I4Yksaeshu/dlApf5WePF7ht67WaVjtRzLNEdmr4zueaO/+4wp7JwPf4g/m
         X32Y7xXGxCHLW7lnexfb3A5nx7pz8LXsN4pcrZjct1Jccq5a65E2T+fLVlAIQu41m6dM
         6Dgg8ug0vkVvEccNzNUrgOfN4ivIjLAVypmrTjhTaI79uALcwibShuP2/Sie1tWODqie
         bxqA==
X-Gm-Message-State: AOJu0YwJ8TD5Xc33MZgaUNT0JRmSsthRzpDNIMXOgOtq1JIw/XCHNuFq
	0WEe5MI5S3AuedNDSj+NhHcfq88ze4ek/mGUKV6s9Ug/gsChBWGuSmHw0lyOnleQ/ERA/IhA5Kq
	v6keag17ObqfQy9C+Ay61f/VaYVU=
X-Google-Smtp-Source: AGHT+IFqu9eu/tcvT8ZOYW5NDlPeiDOLpytJesWwFSxeWJD9ci+WQ2KwAHxClIUJus8KPiLOVUsjKvDCmFPr/l2T6/0=
X-Received: by 2002:a05:6000:71b:b0:33d:c652:7c41 with SMTP id
 bs27-20020a056000071b00b0033dc6527c41mr5522067wrb.71.1708979471488; Mon, 26
 Feb 2024 12:31:11 -0800 (PST)
MIME-Version: 1.0
References: <20221109202112.2035727-1-alex@linutronix.de> <20221109202112.2035727-5-alex@linutronix.de>
In-Reply-To: <20221109202112.2035727-5-alex@linutronix.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Feb 2024 21:30:57 +0100
Message-ID: <CA+chaQerbCc-1Tq4Co2M4WTPBCtS8j4bUnpqgWu9VyvcMbqdew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 5/5] sanity.bbclass: do not check for
 presence of distutils
To: Alexander Kanavin <alex.kanavin@gmail.com>, Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 20:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196218

On Wed, Nov 9, 2022 at 9:21=E2=80=AFPM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> This will be removed in 3.12 and has been deprecated for a while.
>
> If anything breaks because of its absence on the host, this would
> expose the breakage so it can be fixed.

I've sent a fix for glib-2.0-native yesterday:
https://lists.openembedded.org/g/openembedded-core/message/196136
which is now queued in master-next

> icu source specifically does not refer to distutils anywhere.

yes, that was removed in 65-1 release with
https://github.com/unicode-org/icu/commit/b4d41b0561b6e8de38b99850ce0e4be8e=
f536bb1

FWIW: in gentoo with python-3.12.1 I can still use distutils (provided
by setuptools):
$ python3.12
Python 3.12.2 (main, Feb 17 2024, 22:28:14) [GCC 13.2.1 20240210] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import distutils
>>>

so I've noticed this issue only after ubuntu-24.04 switched the
default python3 from 3.11 to 3.12 and my Dockerfile was installing
only python3-distutils, not python3-setuptools:

# python3-distutils is needed by few components:
# icu-native, ovmf-native:
# x86_64-linux/icu-native/64.2-r0/temp/log.do_configure.28031:ModuleNotFoun=
dError:
No module named 'distutils.sysconfig'
# x86_64-linux/ovmf-native/edk2-stable201905-r0/temp/log.do_compile.67451:P=
ython
reported: "No module named 'distutils.util"
# in Ubuntu the python3 package doesn't pull python3-distutils:
# python3 -m distutils.sysconfig
# /usr/bin/python3: No module named distutils.sysconfig

# This issue with icu-native with Yocto 3.0 Zeus was discussed here:
# https://www.yoctoproject.org/pipermail/yocto/2019-October/047169.html
# https://www.mail-archive.com/yocto@yoctoproject.org/msg46284.html
# icu-native/65.1 and newer (in Yocto 3.1 Dunfell) doesn't need
python3-distutils
# anymore, it was removed here:
# https://github.com/unicode-org/icu/commit/b4d41b0561b6e8de38b99850ce0e4be=
8ef536bb1

# Re-reported upstream in:
# http://lists.openembedded.org/pipermail/openembedded-core/2020-March/2939=
84.html

RUN apt-get install -y python3-distutils

Not sure what to do with python-3.12 in kirkstone, icu is fine there
(70.1), ovmf-native should be fine as well (distutils removed in
edk2-stable202108-rc0:
https://github.com/tianocore/edk2/commit/fc50df0d8eb5331b6641daeedd7f05ae75=
014ece
https://github.com/tianocore/edk2/commit/0b1b0a9674e27c858f05436ed92250f449=
8245cf
kirkstone has edk2-stable202202)

So we might be able to drop it as well with only that glib-2.0 fix
backported to kirkstone.

+Steve if he agrees with this plan for kirkstone or would prefer not
to support python 3.12 there.

Cheers,

>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/sanity.bbclass | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/san=
ity.bbclass
> index 606444cae1..38f4a4b22f 100644
> --- a/meta/classes-global/sanity.bbclass
> +++ b/meta/classes-global/sanity.bbclass
> @@ -625,11 +625,9 @@ def check_sanity_version_change(status, d):
>      # never again until the sanity version or host distrubution id/versi=
on changes.
>
>      # Check the python install is complete. Examples that are often remo=
ved in
> -    # minimal installations: glib-2.0-natives requries # xml.parsers.exp=
at and icu
> -    # requires distutils.sysconfig.
> +    # minimal installations: glib-2.0-natives requries # xml.parsers.exp=
at
>      try:
>          import xml.parsers.expat
> -        import distutils.sysconfig
>      except ImportError as e:
>          status.addresult('Your Python 3 is not a full install. Please in=
stall the module %s (see the Getting Started guide for further information)=
.\n' % e.name)
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173054): https://lists.openembedded.org/g/openembedde=
d-core/message/173054
> Mute This Topic: https://lists.openembedded.org/mt/94921928/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Ma=
rtin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

