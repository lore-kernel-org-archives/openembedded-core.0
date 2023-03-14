Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4227FC6FD1D
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 14:39:42 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.10447.1678804771666562123
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 07:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=XvAZDUSs;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id da10so63071879edb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 07:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678804770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUVKZXKdhGEx2c6jzuH6SASPExdPzF8L9U8J/YivZjQ=;
        b=XvAZDUSs/ybPSHUu1UEoxfmW0WHaQCS34u2kP3sv2LNIZFuOVKRmBYxj+M7ANfyBNE
         rbHX0JCrUFcFQuQwPAlYUF6K9GW4M/npUKer/jYhjwgt4FLhxjimp9ZxZAOuZuKxTPcQ
         P32uh6Ndx1KQj2w9cRVvgxf+3j0gPwY4jBYNP8xb7WlexJXwIy43h3n1Tp/GgEGaFmir
         2HP6ZpRDUJKP0SkYJuy0L798u++OlDdkB0sRZ1ofuCc30vDuLHgTdBtWJgr69LB9L8SB
         6og/EZ+dMFWtvbkdRHcpuuMHdWpR61Ix+XIXFjUYVsNo/Yvj3QiqkduR9FsePB5xEI5T
         HobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678804770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUVKZXKdhGEx2c6jzuH6SASPExdPzF8L9U8J/YivZjQ=;
        b=AigBpqfSRO8iFog7+pvKlCgJjNpfRk9cfHuIQNtF4AeX/FP4+D32wGZXfxRimoZ/tM
         i0Wh/Y4cAIj7TJvK8oIXM5yCIi9ezBT4LVZlnp/kxvWeZ1tzketdbGlC9lAsL3+OOhdz
         HZ6DDomTr6uZUozBXyjVFBd8bYoBSNQRUNKxtYjiCd0e32xJZ+YlG1V8snCRaks+gSj7
         +APJISSgslFoFCG0blviZ1CKMIDickbdBK7yTHPl1fe/2hJ9HmIGnruUWrPT2AGa9k+M
         Ahs4teY74cyMCIKZbURyvRqaXCFp0iVItCGdfSaFgBcTfJtuySr8kdxWCBJZOryR53Qz
         nIZg==
X-Gm-Message-State: AO0yUKVUMs9Uz1Ua3YaZ1SwOS6k8gX8jpT6Ppy5vGtLD5HOmu3addJUD
	qtgMP8+0Oj3icVFVdgRrhUAgSYeGubdbPGJBK83wPA==
X-Google-Smtp-Source: AK7set+tZfA7Z9VQMcULMdLeHRW0js8HhSOxPavZKaazZ140RmM1K5SY/MrSvYNatx7oI22a3mDVfjImPDMxP/mKIE0=
X-Received: by 2002:a17:906:b351:b0:91f:79d3:d3e2 with SMTP id
 cd17-20020a170906b35100b0091f79d3d3e2mr1365689ejb.3.1678804769783; Tue, 14
 Mar 2023 07:39:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSpxdZm91QVn9tEjKeoXC79rxNNwkeDz2qWzgPTakJ4k6Jo2w@mail.gmail.com>
 <20230310095402.85948-1-andrej.valek@siemens.com> <20230310095402.85948-2-andrej.valek@siemens.com>
 <174C4F5C0F6A96A7.18998@lists.openembedded.org>
In-Reply-To: <174C4F5C0F6A96A7.18998@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 14 Mar 2023 04:39:18 -1000
Message-ID: <CAOSpxdb1J=XFjJ+1oxysiGSxMC7ec5TSuHqnokSotQGPZyVftA@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH 2/2] curl: whitelists CVE-2022-42915,
 CVE-2022-42916 and CVE-2022-43551
To: steve@sakoman.com
Cc: Andrej Valek <andrej.valek@siemens.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 14:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178494

On Tue, Mar 14, 2023 at 4:26=E2=80=AFAM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> On Thu, Mar 9, 2023 at 11:54=E2=80=AFPM Andrej Valek <andrej.valek@siemen=
s.com> wrote:
> >
> > All mentioned CVEs are related to HSTS check feature, which is not
> > implemented in version 7.69.1 .
>
> Is this due to an error in the CPE database?  If so, perhaps the
> better approach would be to send a version correction request to
> cpe_dictionary@nist.gov

Hmmm . . . looking at the most recent dunfell CVE report I see that
only CVE-2022-42916 is listed.

The CPE database indicates the issue is present for versions 7.57.0
onwards up to but not including 7.88.0

Steve


> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >  meta/recipes-support/curl/curl_7.69.1.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-su=
pport/curl/curl_7.69.1.bb
> > index 899daf8eac..ea36c0bd3d 100644
> > --- a/meta/recipes-support/curl/curl_7.69.1.bb
> > +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> > @@ -56,6 +56,9 @@ CVE_CHECK_WHITELIST =3D "CVE-2021-22922 CVE-2021-2292=
3 CVE-2021-22926 CVE-2021-229
> >  # This CVE issue affects Windows only Hence whitelisting this CVE
> >  CVE_CHECK_WHITELIST +=3D "CVE-2021-22897"
> >
> > +# HSTS check feature is not implemented
> > +CVE_CHECK_WHITELIST +=3D "CVE-2022-42915 CVE-2022-42916 CVE-2022-43551=
"
> > +
> >  inherit autotools pkgconfig binconfig multilib_header
> >
> >  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}=
 gnutls libidn proxy threaded-resolver verbose zlib"
> > --
> > 2.39.2
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178493): https://lists.openembedded.org/g/openembedde=
d-core/message/178493
> Mute This Topic: https://lists.openembedded.org/mt/97516349/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

