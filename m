Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76805C433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 19:38:57 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.1797.1634153936497837816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 12:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f0OPWCyx;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: danismostlikely@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so3061714pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UCaoikEZgiJ1yV8qkY5Aj5OdIlNqRJXivwRdEiwswAI=;
        b=f0OPWCyxYz7Uqn74x3CgXiKsh8ygo4Bba5/B9KYsCL1aFgyUuayLaEsUpCqVegFo2h
         6EFd6GeEiWffF/sxPQsqco2kG0vAiDYXfCw6Z8mNsdpsG5Ct5nnGsso3AkJ9wtxLBd0G
         mIvi2WoxPqgTDe25Hj2O0T5HCarDqFZpjDPbYOkCMh7gpxGA6WFeeKeels8aafFSTRuv
         lU8cGVITBosQN/eaInhKw2/5FZfphsiMEvsmXlzk5bMm9RQK/sXk1AmKRD3MEvfOXUpi
         TVtTBciwiUZMwSdd/jFmrCONsflCc90v7LOgtxNjTUWISKbeoe2IXtcyMabrCHP1I/YJ
         byWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UCaoikEZgiJ1yV8qkY5Aj5OdIlNqRJXivwRdEiwswAI=;
        b=rlODNJGAUEoQVZNyKa1AQbrrUFG7HmOQ5lMBE8kmwGNo8lkJgoL89rwD0R1Yi4uZfu
         bHXD3JWOs/XwDehUnFi0OIPDtJKy08Kwa/Jq+OXLHlQM99TLwswECY5TATzuJixHRCiA
         lZfWGSEWaL7RqKEKrAnT7a7qNGGBOZ0EFbCckrDYywHtL78SCPZ6v5iT8SHRY1MDjCh4
         KPk5WQw6w2lXcbk8cc3ReO/fmXiIuVDaqgAgdRAfjU3O2NmcjMJBiN4s8ldoZxN6stmh
         IgBwepG3JOcrIyFbe+1a4Q+q/3ip0E7VKNMP9iChJVH2U0VkxwBwNZRw9ca1Yz6dIprJ
         8/5w==
X-Gm-Message-State: AOAM531v0VcdqIDAbdu0jNckwwHetBcCHATAS9rYxIxxVg+JgUUaf30g
	p6z91aclgyufIZ5Kme+5DaF7OO2gCH9cl1ZuMcQ=
X-Google-Smtp-Source: 
 ABdhPJwg6hP6b9spMu5VOPlBmECCvvtmulEE2vNQdPTVmyyjRprHJAXWXHVzlSnSUjZ96ODlR5I4MUyZ11gzUitllNc=
X-Received: by 2002:a17:90a:4509:: with SMTP id
 u9mr15961612pjg.79.1634153935859;
 Wed, 13 Oct 2021 12:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211012111726.493810-1-zboszor@pr.hu>
In-Reply-To: <20211012111726.493810-1-zboszor@pr.hu>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Wed, 13 Oct 2021 13:38:45 -0600
Message-ID: 
 <CACS+7ZTXToShB1BjSA3WBB7CbcqWCeRotU3Ki3+WrzJDLLajqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libpam: Fix build with DISTRO_FEATURES usrmerge
To: zboszor@pr.hu
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 19:38:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156921

Thanks for this. I hit it pretty immediately.

On Tue, 12 Oct 2021 at 05:17, Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
>
> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/recipes-extended/pam/libpam_1.5.2.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/pam/libpam_1.5.2.bb b/meta/recipes-ext=
ended/pam/libpam_1.5.2.bb
> index a3c4a50cb3..ee3a84a3b6 100644
> --- a/meta/recipes-extended/pam/libpam_1.5.2.bb
> +++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
> @@ -147,8 +147,10 @@ do_install() {
>         if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false=
',d)}; then
>                 echo "session optional pam_systemd.so" >> ${D}${sysconfdi=
r}/pam.d/common-session
>         fi
> -        install -d ${D}/${libdir}/
> -       mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
> +       if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','false','tru=
e',d)}; then

In the patch I made that I kept local for now my condition was

if [ "${base_libdir}" !=3D "${libdir}" ]

It could be that a user sets libdir and base_libdir to be equal
without enabling usrmerge, but both checks solve the immediate
problem.


> +               install -d ${D}/${libdir}/
> +               mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
> +       fi
>  }
>
>  do_install_ptest() {
> --
> 2.31.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156873): https://lists.openembedded.org/g/openembedde=
d-core/message/156873
> Mute This Topic: https://lists.openembedded.org/mt/86259670/3617261
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [da=
nismostlikely@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

