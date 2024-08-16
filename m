Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83F8C52D7D
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 21:47:47 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.159245.1723844865285185452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 14:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CcBFjpr9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-428243f928fso24714585e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 14:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723844864; x=1724449664; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44y5cpurkIC6cQ1IXUmttBJSfLIPtfiuLR4RsNtaHHs=;
        b=CcBFjpr9X3iLtYpZlU+p4hFyEkr+QUL6qLneYXqc7tSOpu7k8cFaGzr2bBKriEvRa6
         VCToCWsnijcTgqD8MVzpjitMjipJUPPE6c+cfloTJqCZy0w2Bv3oQMGQ2cFIJECrGgrC
         aGtGkS9/fLjnwwzgUYnlUKKO8tmH5LFJds204=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723844864; x=1724449664;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=44y5cpurkIC6cQ1IXUmttBJSfLIPtfiuLR4RsNtaHHs=;
        b=JI8WQdh32mGgy4OVdKegR+o8/WX3R7HtkCF2JQFMCtMPDpbU4MOeOoKM4Uk1rG8O6K
         ARfpYOpFfnJY9wNM4UE6uSifybdYyNh//l/M0QOJymS/a40Vev7MjwpKdr9UbpG8F/8U
         Ip4el1K60aI0lqJLs+KSoOIsrzXGwp3zCr5r/tA97fc8sjhWwF1sGqlFNFv3FfBcPIEe
         p+uGLcoTP3YQgDUjXISQUS7tYwck+cdZMhG9/2DD8M9E9441UsHQmF42QA4aOoIh2/iL
         zC0he2nbHWdxUHynI+xy1rJIIrIDmCh5xcJOawg2vbf+Ui+SxtLcwpWI4Zb0gNtRnvgW
         9t3g==
X-Forwarded-Encrypted: i=1; AJvYcCVqp7woNmL6PkBxCMrT8/eDEziXenn7pz7BUE8CYOCO/jjkU4H16Vm/TpL9r9iNQHJ4bGHJSo5M0/PLZVOw2GWupNUsHS0FGD2aeVk90htvYg7OHrWPFWat
X-Gm-Message-State: AOJu0Yxolyr7XCV7vxdtfRtUO335B20bcfj3WN9+3onL2b9v/3OPbmh4
	ZrFceWzMh2laVltvLlCxtrpNPTFfi0dGV1tMeuLCMO8vx6sY00592QFJTNxQKETzweR+NeX6qyv
	m3dE=
X-Google-Smtp-Source: AGHT+IHk+dECQnQoSw8MY9VpH3buewYDSmYuo2jywlAJZIJT0d9SLaTIfvn/l0oJgi1qxvT3Zf4woA==
X-Received: by 2002:a05:600c:1d05:b0:426:6ed5:fcb with SMTP id 5b1f17b1804b1-429ed78409bmr35168085e9.4.1723844863503;
        Fri, 16 Aug 2024 14:47:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3e75:5a87:4426:a5fd? ([2001:8b0:aba:5f3c:3e75:5a87:4426:a5fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed65079fsm32672715e9.16.2024.08.16.14.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 14:47:43 -0700 (PDT)
Message-ID: <06f400db1cfee385b6f5b0ef384fe212e5c32c1d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] makedevs: Fix matching uid/gid
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaeyoon.jung@lge.com, openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2024 22:47:40 +0100
In-Reply-To: <20240814025507.2284408-1-jaeyoon.jung@lge.com>
References: <20240814025507.2284408-1-jaeyoon.jung@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 21:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203475

On Wed, 2024-08-14 at 11:55 +0900, Jaeyoon Jung (LGE) via lists.openembedde=
d.org wrote:
> From: Jaeyoon Jung <jaeyoon.jung@lge.com>
>=20
> Use strcmp over strncmp to exact-match uid or gids. Otherwise it may end
> up with returning a wrong id that matches partially.
>=20
> Signed-off-by: Jaeyoon Jung <jaeyoon.jung@lge.com>
> ---
> =C2=A0meta/recipes-devtools/makedevs/makedevs/makedevs.c | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/re=
cipes-devtools/makedevs/makedevs/makedevs.c
> index 2254b54891..84b38d2b74 100644
> --- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
> +++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
> @@ -202,7 +202,7 @@ static unsigned long convert2guid(char *id_buf, struc=
t name_id *search_list)
> =C2=A0		// Check for bad user/group name
> =C2=A0		node =3D search_list;
> =C2=A0		while (node !=3D NULL) {
> -			if (!strncmp(node->name, id_buf, strlen(id_buf))) {
> +			if (!strcmp(node->name, id_buf)) {
> =C2=A0				fprintf(stderr, "WARNING: Bad user/group name %s detected\n", i=
d_buf);
> =C2=A0				break;
> =C2=A0			}
> @@ -212,7 +212,7 @@ static unsigned long convert2guid(char *id_buf, struc=
t name_id *search_list)
> =C2=A0	} else {
> =C2=A0		node =3D search_list;
> =C2=A0		while (node !=3D NULL) {
> -			if (!strncmp(node->name, id_buf, strlen(id_buf)))
> +			if (!strcmp(node->name, id_buf))
> =C2=A0				return node->id;
> =C2=A0			node =3D node->next;
> =C2=A0		}

I'm afraid I don't understand the problem here. If partial matching is
occurring, doesn't that mean MAX_ID_LEN is wrong?

If we drop the strncmp() here, that appears to put us at risk of buffer
overflow problems, particularly if MAX_ID_LEN is too short?

Can you give an example of how this is failing and where the above
change helps?

Thanks,

Richard

