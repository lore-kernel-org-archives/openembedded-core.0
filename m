Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30F3EC61DD6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 06:11:20 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6019.1788329469415552318
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 23:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=inI1owC0;
 spf=pass (domain: smile.fr, ip: 209.85.218.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c250c6a6a6eso86127366b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 23:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788329467; x=1788934267; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aYZvxZiGwZtdraWdi7J0Ly30C2RRueiH3HYsvOsD+VU=;
        b=inI1owC0Ycz6NX4T5fiZSgrtvp1lThcH1CEFaeyW19XaFnSTgRJdcjL5S1nw+NHzR4
         vZEir3J/Pr4/8TaK8Kbc68JzdyzT00fxsuODIfaHAF0Kp61QaLU92gswpcux6yCLtiGl
         olPwZa8Zn+kGRLHr2ScXFjyHvxuFjca0BSjjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788329467; x=1788934267;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYZvxZiGwZtdraWdi7J0Ly30C2RRueiH3HYsvOsD+VU=;
        b=qO7SyHCA88XS2LHusZDC6Gq1Ul6rmagVvkP6OBInd5uKaAOcfqBtE0zraCzhv3qzg8
         Axp2/EylzIfg6BuLn1D0M1kwn59gJx1w+FO9V3O/tX5mu3Grt87G0QZci+CuG0b6AGQk
         8qfoR3U6IeAX6fh09o5YmLYcVb3vKaDVpZskzsqXw/3daBeU9RULsOa208M1UW4Av4b2
         X1RacJ7X5UM+zaPzj0HdD3zuMJAJYIvEb/YkEyMFVNIe8YCxlAdxmIqBfI4UeUHJ4xk8
         aYjSG5LVdOHZ0rtCdocKOZx5/zcrL4oNeIGogB46gEJO8LLS+YI5PNcOxz1YjVvhUBhu
         Iztg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4zH0zerQMNszGw+5E/Yw8sFNABLhw/cXWm2ZmUQXV1xiaQyoo36HPPAv2aZeOyzAYjxARzLwko9eYYUhsLId/1g==@lists.openembedded.org
X-Gm-Message-State: AFuF++mNmVa6zjisagESfUeUq0V/1l6qXlfe5poBFfKsCNSu2NAtQInb
	4K3L/ah2Wt8q3pGZWE8HhW2boddnsEJ9dzx9I4Frx1xGi7APV4fqgodJulursenJrUc=
X-Gm-Gg: AR+sD11lqU9N1GCWv0fUdeSaquofd6jHLg2idF+qiygMUnqhU6hrw8JtZ6u91ftHYLH
	7ONT6kP46KpJxZnXMKVcbtse1ptpALPYVcvraSW5jwAe0DqjDGWL2Yq2XCqFK6oacUKFE7uJRQu
	qC0JyyUI7fkDfFpX23VB5yO35zeD3wP2rqn9dmdwDF6kWqGCoizEFvNUqrnyshOmtg+aKKgT7HD
	UlXNSUu4SujSXxf7TXfU+7hDL8rmMKLOhlxpDNv+TlWRzflqrIwzw40EvzusE9NmECm4k3piKIQ
	CRQqKckgh4lafwItLejGLWaaJ3u6QWVbri922ny+33hrfuAXwVboV+lggKpzrILVVol/LSgD7rV
	apxZnyTeiQ+1PtXIF5kO6icKBs9IT3p+QgCgCjHuE7QDNDs30BbeptIqhY/+gThW4b45/Wn81b1
	FNZR1ieMzNs8Wi5A72iE7aoXC0Bu0+kvCnxZDIXYfLA6SoVImwnvmtzHVq0iUYedjkMwnebxuw4
	liBsFL4GyglfnWWZfWAGw+xkse2hnbdxHeAxu6cIjKFtTlfKg==
X-Received: by 2002:a17:907:8e86:b0:c25:608d:7934 with SMTP id a640c23a62f3a-c25d543f85bmr146693866b.12.1788329467498;
        Tue, 01 Sep 2026 23:11:07 -0700 (PDT)
Received: from localhost (2a02-8440-2607-5ad5-e257-1b9f-da87-0e1f.rev.sfr.net. [2a02:8440:2607:5ad5:e257:1b9f:da87:e1f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d042efc2sm69656366b.59.2026.09.01.23.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 23:11:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 08:11:06 +0200
Message-Id: <DL4LVZ66P1HD.10FI9J12FE2L0@smile.fr>
Subject: Re: [OE-core][wrynose][patch 3/3] p11-kit: upgrade 0.26.4 -> 0.26.5
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260814101941.873295-1-vanusuri@mvista.com>
 <20260814101941.873295-3-vanusuri@mvista.com>
In-Reply-To: <20260814101941.873295-3-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 06:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244892

On Fri Aug 14, 2026 at 12:19 PM CEST, Vijay Anusuri via lists.openembedded.=
org wrote:
> From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
>
> ChangeLog: https://github.com/p11-glue/p11-kit/releases/tag/0.26.5
>
> 0.26.5 (stable)
> * rpc: guard against overflow when decoding nested attributes (CVE-2026-1=
8938) [PR#777]
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 21a2c91ccca5257ede8994d30460b0dcda617c3a)
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../p11-kit/{p11-kit_0.26.4.bb =3D> p11-kit_0.26.5.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/p11-kit/{p11-kit_0.26.4.bb =3D> p11-kit_0.26=
.5.bb} (98%)
>
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb b/meta/recipe=
s-support/p11-kit/p11-kit_0.26.5.bb
> similarity index 98%
> rename from meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> rename to meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> index 9219e9eefc..8229cf96c9 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.26.4.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.26.5.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D "gitsm://github.com/p11-glue/p11-kit;branch=
=3Dmaster;protocol=3Dhttps;tag=3D
>             "
>  SRCREV =3D "8e6e4e6d64d9fe91c62b0052c105b2b72d4c24ef"
>  SRC_URI =3D "gitsm://github.com/p11-glue/p11-kit;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV}"
> -SRCREV =3D "a14788849d1ef44422d679534a13821eab5bb5f4"
> +SRCREV =3D "120050e353e8f43d7c40bbcc047f667f903f4de5"

Hello,

It did not happened in this patch but some thing is wrong here: we have
2 SRCREV assignments.

Can you send a v2 with that fixed and rebase it on top of latest
wrynose?
Be aware that "p11-kit: upgrade 0.26.2 -> 0.26.4" should merge soon
(currently in wrynose-next).

Regards,
--=20
Yoann Congal
Smile ECS


