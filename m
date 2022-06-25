Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD28EC43334
	for <webhook@archiver.kernel.org>; Sat, 25 Jun 2022 16:55:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.21794.1656176148180006655
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 09:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ETliAmpG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id i1so2684413wrb.11
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jun 2022 09:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=/e0wxm34KJxyneDuziMtrU91O3PqW2fqAEElm7zpu/M=;
        b=ETliAmpGk/vK0nFhfMp2PgZ5hbwCPwFw4jSqreHPvradDdPwXXxPYDYGJm0DWBFxkW
         n2Ma1IH4XSag7h/FKnvZbugsIaQ2p1z89bipAPcSxntDKSz5imkDbptM6Uj8Lp0DydsN
         nYPPKtKF0IC4O/znFq5drGsSnps1WtqPw61C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=/e0wxm34KJxyneDuziMtrU91O3PqW2fqAEElm7zpu/M=;
        b=liuifo6EFvIOE4fAvrmSErdVx0E4JGbylVT9Lqs4d+PiXrijotaUnMYBcquw/d7zpc
         IFMhwswhNzF3WgbU/Vw3GpPJ030tJkuXLb4q0VSxSUag+70v0bbxRSl7PjatG50MqkEt
         +BJhr0nS3mD4uCl/4s7a6b0v49Up3DfY8MbH5T30SHAqUTsH99+KaFtt7vuli0A5rCL5
         AtwqswmD7GD8jOoVA8g4KVWHCNDOwCV+yGF6hq2+4+8NXCwjUjjpAvBCnZ7TmEW4XHLb
         q7a9h9JaKaIC+7W5wuqawSAWVVyoeKyr3kApeyziB3+4wiuHfY2hphMBjzzcXD3FtUVA
         x8jA==
X-Gm-Message-State: AJIora9+Yooo9fkpfUJkN29LDbgL48nb/1YdSyz6OaCY6g8vHXOheaPV
	azgC84Mq4nEmYzvqLalX3D6Vcw==
X-Google-Smtp-Source: 
 AGRyM1s5maVPMHddyrnkh6OZIlhBCLikq9fyDeK6xUas2UegBWZ0O6O4C4vqhfHMiEtIcL9yLgkl+w==
X-Received: by 2002:adf:f10f:0:b0:21b:8f54:722c with SMTP id
 r15-20020adff10f000000b0021b8f54722cmr4458479wro.401.1656176146645;
        Sat, 25 Jun 2022 09:55:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94fb:7e7b:31cf:be7f?
 ([2001:8b0:aba:5f3c:94fb:7e7b:31cf:be7f])
        by smtp.gmail.com with ESMTPSA id
 x11-20020adff0cb000000b0021b92171d28sm6912557wro.54.2022.06.25.09.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 09:55:45 -0700 (PDT)
Message-ID: 
 <b9d79d0231537cfcb8f75bd0e728d76bbdb64f1a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] ptest.bbclass: Honor PARALLEL_MAKE,
 PARALLEL_MAKEINST
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Date: Sat, 25 Jun 2022 17:55:45 +0100
In-Reply-To: <20220622191615.10168-1-niko.mauno@vaisala.com>
References: <20220622191615.10168-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jun 2022 16:55:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167297

On Wed, 2022-06-22 at 22:16 +0300, niko.mauno@vaisala.com via
lists.openembedded.org wrote:
> Since oe_runmake wrapper doesn't by default involve PARALLEL_MAKE
> outside do_compile() nor PARALLEL_MAKEINST outside do_install(),
> enable parallellized make by default when oe_runmake is invoked from
> do_compile_ptest() or do_install_ptest() by declaring wrapper task
> specific EXTRA_OEMAKE overrides in fashion similar to do_compile and
> do_install overrides in meta/conf/bitbake.conf.
>=20
> Parallel make can still be disabled by resetting bbclass specific
> PTEST_PARALLEL_MAKE and PTEST_PARALLEL_MAKEINST variables in recipe
> e.g. if a race issue needs to be avoided without modifying source code.
>=20
> Tested by issuing following command sequence on a 32-core build host:
>=20
>   $ bitbake -c clean util-linux && bitbake --skip-setscene -c compile uti=
l-linux && time bitbake --skip-setscene -c compile_ptest_base util-linux
>=20
> and found that before this change the result was
>=20
>   real	0m34.684s
>   user	0m0.753s
>   sys	0m0.131s
>=20
> and after this change
>=20
>   real	0m9.868s
>   user	0m0.749s
>   sys	0m0.150s
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/classes/ptest.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)

This has merged but is causing a few problems. So far, elfutils and
flex both ran into make races with a ton of failed builds as a result.
I've a patch to disable paralell compile for those two recipes in the
ptest compile. Ideally we'd look into and get this issues fixed
upstream.

Some random build failure links (there are many more in that build):

https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/3045
https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/5446
https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/5417
https://autobuilder.yoctoproject.org/typhoon/#/builders/95/builds/3428

Cheers,

Richard



