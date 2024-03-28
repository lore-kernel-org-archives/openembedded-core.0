Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE84CD11DD
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 17:49:55 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.3195.1711648189688276494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 10:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=URhtKmFa;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34175878e30so871378f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 10:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648188; x=1712252988; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv6yHFcZUnBYYrA8Uf7FVpyPYu7C1vFSgjj8PIvIka4=;
        b=URhtKmFadjLmsKSNBUpa431mr/sbvuhlihjwtHKnHkyQQC88HInmeZ/o0/vgQ6e9Lf
         y7nlUJafp/X7T2Lgkis7iq5acB09Kp+745d5UX8iUhpj608rVxu1WY1RKIhj9CDW/1SP
         pOuEWSLB2TK14eNVyhbcscDks9EDHtroM1gds8jQXLkPvFzsbIU07VhuC8IyRgVEublM
         d7IbgelI1vCH9k6wUHvmIxMNMglnxltpTug7wIsRULaU4Eybn1FNqWYMZ2Gb9jC+sEPC
         jVAyroQdQTpnMLryXGhFJmJskjsW8W2LZOY6G3xpF+LkbC8REmRT8Ea3Pqn4I2G10Ybe
         P0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648188; x=1712252988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gv6yHFcZUnBYYrA8Uf7FVpyPYu7C1vFSgjj8PIvIka4=;
        b=Dqg6yoP2Qdl43S5yJQpfQSG7kRXl7yywXfCF48qVAazsPFpgz7Hymt7LVYMFiV7J2J
         4H3QuFOs+FzOMk9fijLfWjdVcerE5J50vfgySvv7RtEuT+qG/VTi86miS+Apx0kW/Clr
         rAfI3PtYkUgJZy8+pi7l9CR2M8zXnGk/CUnG+nDaYNPeagQjiz2/RNFZoJBDccL5/mju
         esaI2VrBLYmZxh9oaFItNwP0mzyRb3NaNQusdFuKDkt4C1tP9jPSfSSxQNMvK2wmiVN3
         qMfri/HVIBQTl+GZWFr//vWbZmZ6yw+Q659ALoWJRqlAsHX1cWCsm3j72lfcuVjcdU2H
         4HxQ==
X-Gm-Message-State: AOJu0YxIJN5au/unFJ5CPLs310w+PNypIGG3AL9Zi5MIF4UuIvAOl13w
	UwksaYjfactt4Tf3O29qWtUAJwhnUNww1+fGCuWo3H+fPBFJe2Tjb/JekFofXUnWofcTPKYwkNQ
	QMctPFm8Loxynppwzh3PJpDNLqEc=
X-Google-Smtp-Source: AGHT+IHcZdofkYUEv5FJLLmfCkOZzItkXzU1DUQN+gHWuyn1wouljDJWYLRUhrFaTmwo89SUaDxHPBOarkfuwy1aLwI=
X-Received: by 2002:a05:6000:1970:b0:33e:b758:a039 with SMTP id
 da16-20020a056000197000b0033eb758a039mr2589904wrb.28.1711648187871; Thu, 28
 Mar 2024 10:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240325102055.1037135-1-max.oss.09@gmail.com>
 <20240325102055.1037135-2-max.oss.09@gmail.com> <f20b7698786cba79ea6b4eaa8cf5d2792b78d193.camel@linuxfoundation.org>
In-Reply-To: <f20b7698786cba79ea6b4eaa8cf5d2792b78d193.camel@linuxfoundation.org>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 28 Mar 2024 18:49:36 +0100
Message-ID: <CAEHkU3UVmUmJVfVpikhzMV_wf7aNnnRUvF-MA66ZHaF0jzsRPQ@mail.gmail.com>
Subject: Re: [OE-core][Patch v1 2/2] perf: tests: fix qa error, missing perl
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 17:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197600

On Tue, Mar 26, 2024 at 6:10=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-03-25 at 11:20 +0100, Max Krummenacher wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > Kernel commit 61d348f1e96f ("perf testsuite: Add common output checking
> > helpers") added with 6.9-rc1 added addional testscripts written in perl=
.
> >
> > Fixes:
> > > ERROR: perf-1.0-r0 do_package_qa: QA Issue: /usr/libexec/perf-core/te=
sts/shell/common/check_no_patterns_found.pl contained in package perf-tests=
 requires /usr/bin/perl, but no providers found in RDEPENDS:perf-tests? [fi=
le-rdeps]
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  meta/recipes-kernel/perf/perf.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/per=
f/perf.bb
> > index 6408c65462..4b6834e614 100644
> > --- a/meta/recipes-kernel/perf/perf.bb
> > +++ b/meta/recipes-kernel/perf/perf.bb
> > @@ -383,7 +383,7 @@ RDEPENDS:${PN} +=3D "elfutils bash"
> >  RDEPENDS:${PN}-archive =3D+ "bash"
> >  RDEPENDS:${PN}-python =3D+ "bash python3 python3-modules ${@bb.utils.c=
ontains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
> >  RDEPENDS:${PN}-perl =3D+ "bash perl perl-modules"
> > -RDEPENDS:${PN}-tests =3D+ "python3 bash"
> > +RDEPENDS:${PN}-tests =3D+ "perl python3 bash"
> >
> >  RSUGGESTS:${PN} +=3D "${PN}-archive ${PN}-tests \
> >                      ${@bb.utils.contains('PACKAGECONFIG', 'perl', '${P=
N}-perl', '', d)} \
>
> Does perf avoid perl dependencies currently? Would it make more sense
> to put that script in ${PN}-perl?

There's a packageconfig which enables the ${PN}-perl content. Whatever
that stuff is used for.

However kernel 6.9-rc1 added new *.pl files which are called from a
shell script deployed into ${PN}-tests. So I think those new perl
scripts need to go into ${PN}-tests.

Regards
Max

>
> Cheers,
>
> Richard
>
>

