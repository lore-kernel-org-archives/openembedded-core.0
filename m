Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DA5C3DA79
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 23:11:48 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.7002.1672355500803060280
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 15:11:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cEPBImoD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id m3so5225602wmq.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 15:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4rYp5LH6EtcKiAJR7Mvp0MdaYssNpVDE93913IULzeI=;
        b=cEPBImoDYpksuRPoTUdmPqKgo2N9moNE6WOjVF15/PzTQGh3gKI8nr0xtSwevTaC3w
         WoUFu2ViA5hJpuLDt1uWauMDCn0T0Iy49mrVkiuckxB9v/TLEvrKybKLoDE3xWN1ICcA
         qOjQNBIK8wk9GR9PJawgcV0at3O3e+sFc6Q1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4rYp5LH6EtcKiAJR7Mvp0MdaYssNpVDE93913IULzeI=;
        b=ZMwSY7dtxWszUInX0UwdhvTAY+f1va/kRwMtSo3oUzIOgusFbCHb9peYJRkgOEYIpn
         WEcYHdHG/KAiM59xQcsRedEYMxcBrJGOFZz1UGLJYS3DfG6asvCs70wxvUQ5i/i40bPB
         gPVf77az1TEZw+q4aVpg+kg1VlfnbmIenMEaTt951piV5lkW06JSan6cqmevv7VMZzfJ
         NxMW2Isl7j4jhW6M+cf6zM+D1lLYQGktJVkMPUmwwMVjnedr9U+yib9/ThGYuMVzrpSy
         EGvYm5ce70blWD1TeQq6pZbzGc2HHYmeL1mhLcy7uivYrlz0L27EnzMG6lDie02j3CQP
         6Ezw==
X-Gm-Message-State: AFqh2kpLigSjvV4J7iNNRH1mD2DaQCkgpRbMNGfGyx6fWYMaeRDLkTBu
	5EE0bM1uZ+OlKhqmyumKmzlPKQ==
X-Google-Smtp-Source: AMrXdXtMXJBJUeWj+O0FjucZuDHQyfDN0F7RZcKKMIvoHjMwMlCvgw1Qhx5thHtOo849z2IWRzNMHw==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:b07a:cd2f with SMTP id ay29-20020a05600c1e1d00b003cfb07acd2fmr20805463wmb.37.1672355499426;
        Thu, 29 Dec 2022 15:11:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fd62:db1:ca71:a503? ([2001:8b0:aba:5f3c:fd62:db1:ca71:a503])
        by smtp.gmail.com with ESMTPSA id e16-20020a05600c4e5000b003c21ba7d7d6sm26410583wmq.44.2022.12.29.15.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 15:11:39 -0800 (PST)
Message-ID: <2bdd585e090a4615a53f1b67d1346861abc4c701.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cargo: Do not use open64 on musl anymore
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Dec 2022 23:11:36 +0000
In-Reply-To: <CAMKF1sq7+8u+pA5duTdpXn86qQySVdE482U+GLQpQS=xTzOVrA@mail.gmail.com>
References: <20221229190918.2242791-1-raj.khem@gmail.com>
	 <CAO5Uq5SXZrmiu-RsxaJ_yxj6RV=+-LH1765D7Dqdz+a1DCecMA@mail.gmail.com>
	 <CAMKF1sq7+8u+pA5duTdpXn86qQySVdE482U+GLQpQS=xTzOVrA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 23:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175132

On Thu, 2022-12-29 at 11:21 -0800, Khem Raj wrote:
> On Thu, Dec 29, 2022 at 11:11 AM Alex Kiernan <alex.kiernan@gmail.com> wr=
ote:
> >=20
> > Should we just move these patches to rust-source and apply them for eve=
ryone who consumes it?
>=20
> A common source will certainly be better however, we do not use shared
> workspace for rust recipes
> so it does not matter as much.

I think this may be why cargo was failing in my test build. There were
some other issues there too.

Cheers,

Richard

