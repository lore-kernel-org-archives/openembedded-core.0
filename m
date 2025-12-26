Return-Path: <victor.kamensky7@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D08E7AD7D
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 02:58:35 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148285.1766717910010632817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Dec 2025 18:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T7x7wvJf;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: victor.kamensky7@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b736ffc531fso1257977066b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Dec 2025 18:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766717908; x=1767322708; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbXxIaBmtpgDEAHvtXZsWiBNKYULNIXO+vQeidq1l70=;
        b=T7x7wvJf5ldtth7fAa0kwVYFO89MREp7XCAB7iu8bzecKBnFrnafG/CTk6rF3Ti8ts
         jWdrHJU32pJU197b2FacHtp7vCA9GMN4gk67XaQ9GpUJNo2xOcescw6gfFcUA5FkcyPW
         ESVcvXDpSio+Kljh+QxQm3bSvslmbjAef2cbUk5/GzG6sL4Qv6SrBag22/vXZnAUE2NW
         Ln9gyNvg4jb0ksKmiedFtSFLzLd7blRp+g1o4xsLWzKwh0asIogBVg5a5zp66zdtGgk/
         Ao9FocKlLkdnNN3O68gbgZFCyQb6XpI6RKvln70mf0gdkbNtCKtmErSxzRg/5EXqyg26
         rmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766717908; x=1767322708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PbXxIaBmtpgDEAHvtXZsWiBNKYULNIXO+vQeidq1l70=;
        b=CAgd/nnDghSO7ndwSZ3eCG4UsHfAvkbo2MyYhNC+pYjlsPGURQKX5IxINTmWxaWRJJ
         JhhGALsTZ7hLx5Nt9eMogqhhUcDkLCjpucyqdftUzuSpAQugdWXx0fkKmcAjMKUGLhGv
         kq+twCt0xM2UxnavVoaLPNShtWFSAYC2CTbEjVtiwNmB2MiGSibz5GHLyrINn8X98VnK
         rKuCBgcmdYgSz4wT/AKWG8sp3RTLDm8lB4/a/oh/gloC5jHYcN71Pk42/4MXzkojoJ5d
         TLYPCzP2ll2y5vXlBX0Kd+tWSfdhIrUFfO/IB7huEkBYNOpHTfo6KbtccKp3tWZiEFH6
         XoOw==
X-Gm-Message-State: AOJu0YxAcydTs7UbPIPOUKMSgXvUnLy/O9Itayea2sqVpVCJYKq0mOs4
	w4VZfrsRoPbZx1+yK3+6xf6M2Tvorjt4wqhCFAja5PoNW5et2eYo1H44qR1CvaKLXhskXJw0noC
	Zs5DWxBFRVNp/fXsMU7kHQtLqkHFTNmQ=
X-Gm-Gg: AY/fxX5XBC9n6JORpdp4o7qh0SpxDaTyj2taev9COOkei4aNEZ0oGlNWMpAq1yxecrO
	bv4UfJnugRoTzC9Oilz98WFREn3V0F1hykUwzgO0nJ6dPRqlPn88IVt82ZDxVBzPDtfwUeE4A7f
	k21eeQmC3trtpO/3ZkpxWuqSKk4EaHkvgrVonxfi8751J1btABHQpRGpw4rlQTVUVYiFfnLTf+3
	N7TY00pFOquiMKduSBmbUBSea2bAtolV1T4gnJ8b2wViwjjlNx7y9tVWe6xMiBqLVb4+VOXcIzp
	qENhOF/bCQ==
X-Google-Smtp-Source: AGHT+IHPocpatrsEmr+SIJ1qJ+rSpclhAwjR6vSMF9g7yCzmfDy4sbR4QV9tAv4Pj1S1y6ZYdZYFylhC9WU7ATys6fg=
X-Received: by 2002:a17:907:720f:b0:b73:79e9:7d3b with SMTP id
 a640c23a62f3a-b8036f29b57mr2318622766b.25.1766717907986; Thu, 25 Dec 2025
 18:58:27 -0800 (PST)
MIME-Version: 1.0
References: <20251221072824.3981-1-victor.kamensky7@gmail.com> <DF4LLAR0AM9L.1NMHO4TTMJ27O@bootlin.com>
In-Reply-To: <DF4LLAR0AM9L.1NMHO4TTMJ27O@bootlin.com>
From: Victor Kamensky <victor.kamensky7@gmail.com>
Date: Thu, 25 Dec 2025 18:58:16 -0800
X-Gm-Features: AQt7F2p3eudXtHjzALtWcorGE0NrYdhb9_KlwxSRsrX9_U64Gxlh3WV2JQ_T73s
Message-ID: <CAHSqoWv4TUX1YMqkUPyAV7N_84b+4fxHZM+mS2bGTqX=rouuyQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemtap: upgrade 5.3 -> 5.4
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Dec 2025 02:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228546

On Mon, Dec 22, 2025 at 12:21=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Sun Dec 21, 2025 at 8:28 AM CET, Victor Kamensky via lists.openembedde=
d.org wrote:
> > * removed upstreamed patch
> > * fixed patch fuzz issue
> >
> > Signed-off-by: Victor Kamensky <victor.kamensky7@gmail.com>
> > ---
>
> Hi Victor,
>
> Thanks for your patch.
>
> It look like the build is failing on various platforms:
>
> ERROR: systemtap-5.4-r0 do_compile: Execution of '/srv/pokybuild/yocto-wo=
rker/qemux86/build/build/tmp/work/core2-32-poky-linux/systemtap/5.4/temp/ru=
n.do_compile.1003148' failed with exit code 1
> ...
> | In file included from ../sources/systemtap-5.4/staptree.h:27,
> |                  from ../sources/systemtap-5.4/elaborate.h:12,
> |                  from ../sources/systemtap-5.4/elaborate.cxx:11:
> | ../sources/systemtap-5.4/elaborate.cxx: In member function 'virtual voi=
d const_folder::visit_defined_op(defined_op*)':
> | ../sources/systemtap-5.4/elaborate.cxx:5119:33: error: format '%ld' exp=
ects argument of type 'long int', but argument 2 has type 'int64_t' {aka 'l=
ong long int'} [-Werror=3Dformat=3D]
> |  5119 |       session.print_warning (_F("Collapsing unresolved @define =
to %ld [stapprobes]", value), e->tok);
> |       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
> | ../sources/systemtap-5.4/staputil.h:54:27: note: in definition of macro=
 '_'
> |    54 | #define _(string) gettext(string)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2874
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2926
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2738
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2867
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2904
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2878
>
> Can you have a look at this issue?

Hi Mathieu,

I am sorry about that. I did test qemux86-64, qemuarm64, qemuriscv64
before posting, but none of 32 bit machines :(. I've sent a second version
of the patch with a 32bit build upstream fix backported.

Thanks,
Victor


> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

