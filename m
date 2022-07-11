Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A61C433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 08:29:19 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.26161.1657528157846686274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:29:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CnPIewkI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id q9so5980746wrd.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 01:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Hj65bWBHJJmAZ4bOFcWeq6Fui5McCwXpLL5CpEMu0FE=;
        b=CnPIewkIrnCPkOTtT5lk1YKdN7EgVqNz5wwFb6fTVT+mMkl9CJGmvM/Icbsfi9TdK/
         tYn4KOY9bLeEfp2cI39KltkwjjaJhABgLrRKMP8gNZde6dxDaaS+D3xjXWlgiuxpfFFs
         mjvSExwL3CCOK2tE9m1gJEVxNntCGJbH0n0Co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Hj65bWBHJJmAZ4bOFcWeq6Fui5McCwXpLL5CpEMu0FE=;
        b=DbYSukjwpEYMuDhyRVs2/9FdryyrI2sTasdRMti5svuD9XbBV2aaruO2JOaPLQjgTV
         Iy1/J5ggZOhZ5l6G1LZdXU7mUQgYHUYc7pnW5jXlAU4PE6aPKenl2RGw4iDXeEt0XJkH
         E9rOCIxOxl8tF1b9dorHFTZhMEqQjd0WpFB09OoQ3huHXR7jcExtJKa6gslBGn3hAWJN
         bx6PSBtCL0wIw8yQN7xflU4TJtkaLQ1gqfU1KO2g9i4LkmEEngtZblp5GqXkYyLMd2Mr
         L9xQsrf7xlATmMQZQM624kkM7PcK83Ufi/dNXVOxe9hChSBN/o25xIQoFqLETBz7i8V4
         IlOg==
X-Gm-Message-State: AJIora9x5W3BXCS1/TTI9XMvtJbAUCDQHKX1jHl6D/eNCH55oJWTtpaM
	1UhjWOkNLrXpucUko1U27hxg5g==
X-Google-Smtp-Source: 
 AGRyM1v5cPcBr5kz9+XeJPW4gGKCmHT2ylz3sgrcVBjjaVjMEG9nqohFSejuOLy49AJ4FRuMv4EkTg==
X-Received: by 2002:adf:fdc4:0:b0:21d:6f76:5193 with SMTP id
 i4-20020adffdc4000000b0021d6f765193mr14655601wrs.606.1657528156259;
        Mon, 11 Jul 2022 01:29:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:33cc:9a17:a076:b55d?
 ([2001:8b0:aba:5f3c:33cc:9a17:a076:b55d])
        by smtp.gmail.com with ESMTPSA id
 r3-20020adfe683000000b0021b81855c1csm6283521wrm.27.2022.07.11.01.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 01:29:15 -0700 (PDT)
Message-ID: 
 <ac55c4c365dec2b3dcc4e1d664a176b0f71a08d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclass: Avoid stripping signed
 kernel modules in splitdebuginfo
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christoph Lauer <christoph.lauer@email.de>,
	openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Date: Mon, 11 Jul 2022 09:29:14 +0100
In-Reply-To: <20220710153638.61096-1-christoph.lauer@email.de>
References: <20220710153638.61096-1-christoph.lauer@email.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 08:29:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167860

On Sun, 2022-07-10 at 17:36 +0200, Christoph Lauer wrote:
> From: Christoph Lauer <christoph.lauer@xtronic.de>
>=20
> Since commit d756b346f248df47b0540644adb1d0f17bcc4b6e kernel modules are =
stripped by the functions 'runstrip' and 'splitdebuginfo'. Signed modules m=
ust not be stripped. Function 'runstrip' avoids this by running is_kernel_m=
odule_signed. Apply the same check to splitdebuginfo.
>=20
> Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> ---
>  meta/classes/package.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 4850134022..5328c6bc8b 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -382,6 +382,10 @@ def splitdebuginfo(file, dvar, dv, d):
>      debugfile =3D dvar + dest
>      sources =3D []
>=20
> +    if oe.package.is_kernel_module_signed(file):
> +        bb.debug(1, "Skip strip on signed module %s" % file)
> +        return (file, sources)
> +
>      # Split the file...
>      bb.utils.mkdirhier(os.path.dirname(debugfile))
>      #bb.note("Split %s -> %s" % (file, debugfile))

This isn't as simple as it may first appear. That is going to do open()
and read() calls on many files which aren't kernel modules and it will
impact the speed of the do_package task for recipes with large numbers
of files (perl, ltp and so on).

Cam we use the filename to limit which ones we scan a bit?
Even=C2=A0something like:

if ".ko" in file:

would help a lot but I'm not sure that covers everything.

Cheers,

Richard


