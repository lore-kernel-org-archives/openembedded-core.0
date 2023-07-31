Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5578BC001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 10:16:06 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.4213.1690798557858748801
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 03:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ckNmYLaf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe28f92d8eso2327917e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 03:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690798556; x=1691403356;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lpg7H23eZlwr8aZLqK3+aQAgXtZGDpOzLTlX4ZNwUBw=;
        b=ckNmYLafQUg4MmcABvgNdQ/ibr++17qZPadkZkZBHyw2b/jDKPs+KbLIOhpsJEDgbb
         ZfKdPXzXBrJ1Yf4ZUq4pHaBd2PsDhfRYehd2Jg//mTdTbwcezPt879mHR37ReBNC+P6w
         hCPeYhvrxD9linOLsfKWefKf/juRWMIarRe0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690798556; x=1691403356;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lpg7H23eZlwr8aZLqK3+aQAgXtZGDpOzLTlX4ZNwUBw=;
        b=gCSPO7SFzSrwjSKMBu1o5NLhZb386+MFema/0tgJOYjKPyqU3xsSKFOSIQqdN9I3PH
         jm2YWpsUP3HQTu5ocDPTxvvGiAyagF06cKxRPk/5qVgjRom1wa7tB/dzBMpJqMf3VDA7
         FNFmZ7Gf0UW37iqGrU4yGjJJszVEcOpD0RhK2p8/oVTbOOoMsgBZmrq6V/T/fapE5FOG
         mpDR7q5hqM6dEPqIJp8bFbkn1DJqE/VrmlV4YIhYFHHYzqHAStBDb1bI6blXBDEPvofz
         x5aaJe+Olm5Ddtb+tCzGF0YJ4eyauCJqVvoYIeRxRB6tRgas/bfwwULip0IIdsoTFb87
         hhYA==
X-Gm-Message-State: ABy/qLYNmy1RlFJehKnmLEICnfdkvAQxxlRoDYemlab0FLMxuaOqxe6J
	zo2Hj7faArdYw+4odVGknfLKgw==
X-Google-Smtp-Source: APBJJlHh5Kg47Mv+z9dhjFXLRmztKChMamB2u7dQDBP6tOJnFr29WoUzoa7HmHhXRrIqKZFaclaZ9A==
X-Received: by 2002:a2e:9bcc:0:b0:2b9:ebcb:9c80 with SMTP id w12-20020a2e9bcc000000b002b9ebcb9c80mr1397111ljj.39.1690798555721;
        Mon, 31 Jul 2023 03:15:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6f93:b696:bedd:c076? ([2001:8b0:aba:5f3c:6f93:b696:bedd:c076])
        by smtp.gmail.com with ESMTPSA id b3-20020a05600c4a8300b003fe1b3e0852sm8740690wmp.0.2023.07.31.03.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 03:15:55 -0700 (PDT)
Message-ID: <fe958ac3d572d910e9f4eb861b18c4df40381a1e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: fix dependency chain issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Suti <peter.suti@streamunlimited.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2023 11:15:54 +0100
In-Reply-To: <20230731093415.261532-1-peter.suti@streamunlimited.com>
References: <20230731093415.261532-1-peter.suti@streamunlimited.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 10:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185132

On Mon, 2023-07-31 at 11:34 +0200, Peter Suti wrote:
> Fixes [YOCTO #15164]
>=20
> Instead of deleting setscene tasks, now SSTATE_SKIP_CREATION is set inste=
ad.
>=20
> This seems to fix the compile issues where the populate_sysroot task was
> not run when an externalsrc recipe was built as a dependency.
>=20
> Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> ---
>  meta/classes/externalsrc.bbclass | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

I think this is going to swap one set of issues for another.

Setting the skip creation option will stop sstate from being generated
but it won't stop bitbake reusing existing sstate. In the case of
externalsrc, we need to stop it using sstate at all so this patch won't
always have the effect we need :(

Cheers,

Richard


>=20
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.=
bbclass
> index a649bcdff8..12f2718850 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -76,6 +76,8 @@ python () {
> =20
>          # Dummy value because the default function can't be called with =
blank SRC_URI
>          d.setVar('SRCPV', '999')
> +        # sstate is never going to work for external source trees, disab=
le it
> +        d.setVar('SSTATE_SKIP_CREATION', '1')
> =20
>          if d.getVar('CONFIGUREOPT_DEPTRACK') =3D=3D '--disable-dependenc=
y-tracking':
>              d.setVar('CONFIGUREOPT_DEPTRACK', '')
> @@ -83,10 +85,7 @@ python () {
>          tasks =3D filter(lambda k: d.getVarFlag(k, "task"), d.keys())
> =20
>          for task in tasks:
> -            if task.endswith("_setscene"):
> -                # sstate is never going to work for external source tree=
s, disable it
> -                bb.build.deltask(task, d)
> -            elif os.path.realpath(d.getVar('S')) =3D=3D os.path.realpath=
(d.getVar('B')):
> +            if os.path.realpath(d.getVar('S')) =3D=3D os.path.realpath(d=
.getVar('B')):
>                  # Since configure will likely touch ${S}, ensure only we=
 lock so one task has access at a time
>                  d.appendVarFlag(task, "lockfiles", " ${S}/singletask.loc=
k")
> =20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185127): https://lists.openembedded.org/g/openembedde=
d-core/message/185127
> Mute This Topic: https://lists.openembedded.org/mt/100458147/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ri=
chard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


