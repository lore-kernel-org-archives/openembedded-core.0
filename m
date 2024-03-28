Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3A2CD1283
	for <webhook@archiver.kernel.org>; Thu, 28 Mar 2024 15:54:39 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.20365.1711641271758024841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Mar 2024 08:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LzvPiyRl;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso12671531fa.1
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711641270; x=1712246070; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WsswBLM4CWatjj81clAypTVce77oA4Ex4rUwxlX7LZQ=;
        b=LzvPiyRlgZDiZbRwSBsim0+HcjmLfOmtnSmeFAb5Vl4Z8wRZMPrk+73kfnXePsY5lJ
         8St42lJ7O6UydZOOH/mehkysS2/1i35L5lhh4Z3srUCdKcq2wdcIxsmsXetYAfJS1nhC
         j2JQG5WA7uoBNOn29GWXtJb0dbaF3jY033Xjhn0XnUDGXZ0qZmKAW4Bf3IUPzXmNWpqN
         CGhdbg6Br//4UJnE84Gsfa8F8S/4Dn59HMxWRllXZDLhNbJi9NFL2AoL61X0mzZ7FrMl
         gO5SMEkU+/q9EnvwkyUJSQmRh0872Cu/Ql1Ytggv8bXesvlJKluUA0BGxll4ymyIBMJC
         83mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711641270; x=1712246070;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsswBLM4CWatjj81clAypTVce77oA4Ex4rUwxlX7LZQ=;
        b=fY/MPMbvVrElLUMgGesuoiEpFyh/xVn4i9XTH+UVjX+syHDL0v/gr0METgHCCtnIpe
         PysPI6XbVJ2+XLmMUxHDEzvdf9QJrtkMEThA1wG7GTgYc1L8NlMLM3gbbICJ+Q5ab9EC
         6dyjpaV1TCTQOl/UZZuufkges2lVWFDTHsCZx7bTtOCRz3zm9C6rpvIMwStpiolaZUBR
         1Ds/XsvBE3SX+po9KIEkVH2lWCYadh+IkR+YqeGjK2kdYnkZt2F9MM1+p1WOnC1Hrfvl
         jMu6TLO01S28qM7oN+eT/eFSyLXUf/t/eT/ODuBc06xE85gB6NUW2iwrQNAoxHZMtWea
         avEg==
X-Gm-Message-State: AOJu0YzDIjlJiurCOkGB3EZWPN+YzXc8okjuLVm+rLR2o2rAufWNGlEk
	KBYtL4jzl3to3gOn6DWOVYGgzAQTYBr4c333HCGVdf1o7CKMa31DZ+CNxzmCVcAYX8+6c0FYDpr
	4jBTNjNgfqq8Yt8Mv8cpEWshBm2M=
X-Google-Smtp-Source: AGHT+IH8ryOAphgVkgGmD6RESqwAoQq+zUCzHDkN0pYwmA5IwwhiXHvpbJl1Kq870fi9MDdJ713LPqXgBETs5QZqd5E=
X-Received: by 2002:a2e:b0e7:0:b0:2d4:37eb:21ad with SMTP id
 h7-20020a2eb0e7000000b002d437eb21admr2410283ljl.40.1711641269586; Thu, 28 Mar
 2024 08:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240328153243.4101823-1-jdmason@kudzu.us>
In-Reply-To: <20240328153243.4101823-1-jdmason@kudzu.us>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Mar 2024 16:54:17 +0100
Message-ID: <CANNYZj_n5bf=Fh1Pq1eb1HeTNfW6a4krFcyrC0Vt_f7kPQT4VA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipeutils: use UPSTREAM_CHECK_URI in get_recipe_upstream_version
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Mar 2024 15:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197584

Unfortunately this isn't correct either. UPSTREAM_CHECK_URI is already
checked by the wget fetcher to override the default (which is first
entry in SRC_URI), so if you need it in other fetchers (e.g git), you
should either add support for it there as well, or remove the code
from wget fetcher at the same time. Otherwise, this change will make
things very inconsistent and confusing.

Alex

On Thu, 28 Mar 2024 at 16:32, Jon Mason <jdmason@kudzu.us> wrote:
>
> Currently, get_recipe_upstream_version blindly takes the first entry in
> SRC_URI to see if the recipe is at the latest version.  If
> UPSTREAM_CHECK_URI is specified in a recipe, it is probably what should
> be used to check for the latest version.  Use that as the first check,
> otherwise default back to the first entry in SRC_URI.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/lib/oe/recipeutils.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> index de1fbdd3a8c8..a42609060cd9 100644
> --- a/meta/lib/oe/recipeutils.py
> +++ b/meta/lib/oe/recipeutils.py
> @@ -1041,8 +1041,13 @@ def get_recipe_upstream_version(rd):
>          ru['datetime'] = datetime.now()
>          return ru
>
> -    # XXX: we suppose that the first entry points to the upstream sources
> -    src_uri = src_uris.split()[0]
> +    # If UPSTREAM_CHECK_URI is specified, assume it is correct and use
> +    # it.  Otherwise, use the first SRC_URI specified to determine the
> +    # latest version.
> +    if rd.getVar('UPSTREAM_CHECK_URI'):
> +        src_uri = str(rd.getVar('UPSTREAM_CHECK_URI'))
> +    else:
> +        src_uri = src_uris.split()[0]
>      uri_type, _, _, _, _, _ =  decodeurl(src_uri)
>
>      (pv, pfx, sfx) = get_recipe_pv_with_pfx_sfx(rd.getVar('PV'), uri_type)
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197580): https://lists.openembedded.org/g/openembedded-core/message/197580
> Mute This Topic: https://lists.openembedded.org/mt/105198896/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

