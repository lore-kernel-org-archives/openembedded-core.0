Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415C01098789
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 14:26:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14057.1774016799438961578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 07:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bmVU6pw1;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso17547865e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774016798; x=1774621598; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ya1AmScwUxQzSnZUTWz938jebwLdMdLYcDhgFnTSEp0=;
        b=bmVU6pw1/k+kxjrXGmTVWb/Xjesdrw+8TBDvoBSx5WdexSkRPnI1gRW1P/yaI/bOnI
         xdjwVeIEgrTan1eXPTqFz8YuLilEuUm5HssX/yWC8YSvQvarfWfHvjRKL6Rzar7RFtal
         eWawE8vnLdB076QNXB2HxMcJeA+yBs4wnJecs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774016798; x=1774621598;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ya1AmScwUxQzSnZUTWz938jebwLdMdLYcDhgFnTSEp0=;
        b=UmABEEC3WvIbpyqNxH47KRYUFIkJ2wRyGX4ivYYOh4EfvKcjyATKKT7td4FpuAg650
         tdXRNfK6WnYPc/LyRmv8Ck/Z7Yb2/SkMBwNIzp4wRrJr/dFWRnCsZZb7GU4P4fB+3fPT
         3pHvRXmjRNCeF7Waj5VSZ1buSDyjG7+TKIrj0GaxgXwzqhUCYIgKC+742B0sc2secHre
         xtvoScRa4ROZPZLVLDGnUN1hzg70aHcR9X2to9pre4mut+lMEBbfXIxvaK6MXR4eWEMD
         SsqviVV9VvJjXWTYvEngpjhSrg4oE/AmFdqdOuQ5YM5Mu61qfYkLQpAPsXtPX+n8bCw2
         NYAw==
X-Forwarded-Encrypted: i=1; AJvYcCXL+knZL9wmd34/uV9AQ1oh/WBfLn81JV/9Y3F/oN8hlIQhzWg4/VqEPfv0VE4NbIsRt4s3NWaSnuchD8yVFsiVZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxluNK7raViNUqkw0hMG+4CLgce1lGy90ga2vAjex5taEJXYC/P
	c2rJ5EDbmZ25fjYXA8bZnOlvJpEeUBO5/6E3wUjEJdhZTaDbJqhPWalbvQcjXWWRqMc=
X-Gm-Gg: ATEYQzyjuy5PsGDf/E6T2ASBlwewhi58GYPZqpy7WosG29o1NcOGAn9YX7xM+2ERxwl
	zuBZjuhof5GaJ6QOpH5SErSlsrtra5hdijhDfXpRMN4hRYODEhyzkBCIlUAJbrQWdwo2Qm3Op3V
	wMy0hrWr31efn5VVcBo27uhRiPcHQeLgrIv4aCJaacQC8KxySn55MQX3Rpeqg/wot/NlfjRTo4a
	97y1x24Gu5sK+QFPT+okl+oJAZ9q6fs7TFwYI6Fh1ajuFiTPdLQCtICvwUeL53Mgo4AiJURT2l6
	GrLJ299YXZ2ynohV3F+EQFiNor9GpL/Y2vpQ9NvAZHsZ9BAzYr7qsQeMYHRi9l+CY1jA0E8ILjo
	fVl/tXkFvKG1csP0xFi0A3QQOP2xLMnxHRx1BbNswj58rTQR06kmNN7zejX138C/CwU7xDos9Jx
	g0Vboy9FkJrGoeiVAAoBBlFZVvy6iS51vGdO4796cctg/FZXA6FOBl29fHjAEQO3RxgFAOJbj9h
	UPa5Ptm++Rd7kE=
X-Received: by 2002:a05:600c:8011:b0:485:3f65:94a1 with SMTP id 5b1f17b1804b1-486ff0255camr51604925e9.18.1774016797540;
        Fri, 20 Mar 2026 07:26:37 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d9896sm77088805e9.2.2026.03.20.07.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 07:26:36 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 15:26:36 +0100
Message-Id: <DH7OGXEKFQQS.32SSA2VCYO6IY@smile.fr>
Subject: Re: [OE-core] [kirkstone][PATCH 2/2] vim: Upgrade 9.1.2128 ->
 9.1.2144
From: "Fabien Thomas" <fabien.thomas@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0
References: <20260317061405.278524-1-hprajapati@mvista.com>
 <20260317061405.278524-2-hprajapati@mvista.com>
In-Reply-To: <20260317061405.278524-2-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 14:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233611

On Tue Mar 17, 2026 at 7:14 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Upgrade from 9.1.2128 to 9.1.2144 to include the fix for
> CVE-2026-25749 [1] [2].
>
> [1] https://github.com/vim/vim/security/advisories/GHSA-5w93-4g67-mm43
> [2] https://github.com/vim/vim/commit/0714b15940b245108e6e9d7aa2260dd849a=
26fa9
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  meta/recipes-support/vim/vim.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/=
vim.inc
> index 0ce6aa71a4..7a7bedf863 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -18,8 +18,8 @@ SRC_URI =3D "git://github.com/vim/vim.git;branch=3Dmast=
er;protocol=3Dhttps \
>             file://no-path-adjust.patch \
>             "
> =20
> -PV .=3D ".2128"
> -SRCREV =3D "392b428d1239e963020b73682cd03f17ffb538b3"
> +PV .=3D ".2144"
> +SRCREV =3D "55c12373f073bacfc97d757e8f4da3daf472e4ac"
> =20
>  # Do not consider .z in x.y.z, as that is updated with every commit
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+\.\d+)\.0"

Hi Hitendra,=20

Upgrading from 9.1.1683 to 9.1.2144 involves over 460 versions and over 100=
0=20
commits. As previously discussed here [1], so many changes seems too risky =
for=20
a stable/LTS branch.

So, without a exemption granted by Yocto Project TSC for Vim,=20
backporting patches is the best solution for addressing CVEs.=20

Regards,

[1] https://lore.kernel.org/openembedded-core/AS1PR10MB56978C6748852F61C4F7=
109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM/
--=20
Fabien Thomas
Smile ECS


