Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC94C61DF7
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:53:38 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.92461.1700751212676141805
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:53:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VrScMxcR;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a02d91ab195so129798866b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700751211; x=1701356011; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqWruC7S6YE8KsJn9yGR7WAQpX0Ill2HQzSKy+VW+8c=;
        b=VrScMxcRpwxhgUzupAMOutR59IyJIsDltc4ZP1Ss8yYW9vSoMYnTqkW2aJQlSAaQnI
         nLtj7d2jxpw+WiJuwM501Tt0dP3jRNDcDT827SyYhGdov8REcRsDHyS2lvk8lqF/0WMb
         9vmvGa8hepmGLUoDpHA4j7kUYZ1Lg9q7KoPHHVoXA/2zzukH6SQU56xQU2vQPBoTcJ3P
         tPhhy6mCzcG3Pohfc7CgOkigJmkn2AmyJQJ7ZcIbULm/10/i+nUBFA/wCn0Chdf4O8xm
         C4ynR8b2gqBUuTiJG/XcwZuC79W5QLFzJg+jzq2riVll6qDlMZS+qXQpsGv3/Gk6Vifk
         dGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751211; x=1701356011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqWruC7S6YE8KsJn9yGR7WAQpX0Ill2HQzSKy+VW+8c=;
        b=YchsC9U0wzdWVMmcpgA+elqvmh3GTSNhSRlp8g31D28r/FiVdYjpTQxuFP1vNnrwej
         QDo8nVu/gIO23Metd64EbDLYmMAnvhd4qN0C8cMprD4jikGdaJXxVIO/0SKEGTDzIxIk
         l5dGuhVmYgCL33g9wQLpiicqRnnxHKUn+c9jXf1bBc1UxtTBsmyijGcePPovyPbec1JV
         zs00tGFC0giPMfiY06msh3YolvDKBo32SLONgOcbm4S7d5s3upSPZr5RAhAFeLkXmoIA
         3+2GZFS1UHzA932w9GsZ2aPgyUQBKJ7kyJPPaBLOq8XLbJ4X5y/5gCyYJQEq4vgcn/LY
         fi8g==
X-Gm-Message-State: AOJu0YzkWXzsA6zFZtHpN8rE+XZWIKyMoNbSX559Rwg5ykrYx44fh74M
	b1oaesC5wX4qKzWdg8POClYHSiY33Dwa4sCooVzM6w==
X-Google-Smtp-Source: AGHT+IEAUOSV5G18MtGchm0wjU9RkGwOCFm4LxJFprjTCtyrcyDEUJRtCtQ8LzmmCbwRiXly4Xa07BHYv6YhX0hbxO4=
X-Received: by 2002:a17:906:8a:b0:a00:163f:4b98 with SMTP id
 10-20020a170906008a00b00a00163f4b98mr3682843ejc.44.1700751211103; Thu, 23 Nov
 2023 06:53:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1700620126.git.steve@sakoman.com> <8726ae02d760270f9e7fe7ef5715d8f7553371ce.1700620126.git.steve@sakoman.com>
 <375cd11f8849681f65762a53db3716f5753f3e60.camel@linuxfoundation.org> <CADkTA4OXFOpmukoMC_+Z4O7rEBHSH5g=g5hi=MUK3yBspAg+zg@mail.gmail.com>
In-Reply-To: <CADkTA4OXFOpmukoMC_+Z4O7rEBHSH5g=g5hi=MUK3yBspAg+zg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 23 Nov 2023 04:53:20 -1000
Message-ID: <CAOSpxdaphzYG-myGzUm25KtN72xuO30niR5ROm8LhrVn=2+how@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 15/16] goarch: Move Go architecture mapping
 to a library
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191165

On Thu, Nov 23, 2023 at 3:45=E2=80=AFAM Bruce Ashfield <bruce.ashfield@gmai=
l.com> wrote:
>
> On Thu, Nov 23, 2023 at 7:40=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2023-11-21 at 16:31 -1000, Steve Sakoman wrote:
> > > From: Peter Marko <peter.marko@siemens.com>
> > >
> > > Other spaces uses the Go architecture definitions as their own (for
> > > example, container arches are defined to be Go arches). To make it
> > > easier for other places to use this mapping, move the code that does =
the
> > > translation of OpenEmbedded arches to Go arches to a library.
> > >
> > > (From oe-core rev: 3e86f72fc2e1cc2e5ea4b4499722d736941167ce)
> > >
> > > This commit together with meta-virtualization commit
> > > 115f6367f37095415f289fb6981cda9608ac72ff
> > > broke meta-virtualization master used with
> > > meta-lts-mixins kirkstone/go which is our primary
> > > usecase for having kirkstone/go mixin layer
> > >
> > > Manually crafted since cherry-pick had too many conflicts:
> > > * different path to classes
> > > * additional architecture loongarch64
> > > * different way how to import library
> > >
> > > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > > Cc: Joshua Watt <JPEWhacker@gmail.com>
> > > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > Cc: Jose Quaresma <jose.quaresma@foundries.io>
> > > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > > ---
> > >  meta/classes/base.bbclass   |  2 +-
> > >  meta/classes/goarch.bbclass | 27 +++------------------------
> > >  meta/lib/oe/go.py           | 32 ++++++++++++++++++++++++++++++++
> > >  3 files changed, 36 insertions(+), 25 deletions(-)
> > >  create mode 100644 meta/lib/oe/go.py
> >
> > This did cause problems for some layers such as meta-virtualization so
> > I'd want to check those layers are ok with this?
> >
>
> It should be fine, the issues were around it not being present and recipe=
s
> trying to use the mapping directly without the go.bbclass being inherited=
.
>
> It won't be used in kirkstone, so is a no-op there (for meta-virt), but t=
hat
> does mean some mixin and multi release compatible layers can more
> easily to backports.

Thanks for reviewing Richard and Bruce!

Since Bruce confirms there are no issues with meta-virt I'll leave
this in the series.

Steve

