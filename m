Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 962E6C4332F
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 23:31:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.6556.1702337492862665836
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 15:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gk0Gnj5A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so36851645e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 15:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702337491; x=1702942291; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qm4HFV7JWUzrEd2J080itVrawF4kN8jSjz8AW4Htk1U=;
        b=gk0Gnj5Aaew2VaYtn22bmdaHcRMQN6rW0q0pG8xn7YX/n1fNa5hJM3/Rg++ZNPiC0p
         niPFuMKOD6jttpBK1r4OiK0Xu45qk8XwcsY0JQ732nApF2gnsvK9K34/q9MmxLRY3B79
         CUn96d6wqqcFJ39/z30N904zXP5nomRJeJr7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702337491; x=1702942291;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qm4HFV7JWUzrEd2J080itVrawF4kN8jSjz8AW4Htk1U=;
        b=v1HGin+SoxsTyqLzhQFjzPjGsjBjPlcz3mUtI4FOGrcw64QLBR6118I90rPMHGu3nX
         mga8dX/zJghmu4xdHVTNT/mmvhc0Jjj/eEGrE8ONClBcc81Pdb/mwVW5QOssNM5JaNTI
         8zivAdBK5XWX6+xrzH+IwcW9lcsZwmsXgQIxa+qq9Wd4GkuKousIG9X75MqlyVb2mkWy
         Ztjc3LXDwKfuEpyb0OCxp3qDb6oxCGt1zk9Zyaf2dn5Albq251D2mKPfIArOwJFqZjQj
         U5zt+9tFgp+DJywkbuKbKdaYQWz+pVvNv71Pw7w6pfaP5QBU76gbu+ZPMyxw7futfqFt
         AlgA==
X-Gm-Message-State: AOJu0YytIHe3/pVstYUVXB7SsGUA7JYWL7Gu8K/Anu8HHVUxLbJlZEnT
	BGXJmwzF9JIj3v1dm0gFk3sUNg==
X-Google-Smtp-Source: AGHT+IG0ng3ZrbmiJ9zgHoujFFE5sIxtORtbDbZbiVc88v3Jp1443pMCALTsOEnzgVX6zFD8kgU4bA==
X-Received: by 2002:a05:600c:444c:b0:40c:370d:71ef with SMTP id v12-20020a05600c444c00b0040c370d71efmr2544220wmn.82.1702337491059;
        Mon, 11 Dec 2023 15:31:31 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ff87:5732:c58a:3da8? ([2001:8b0:aba:5f3c:ff87:5732:c58a:3da8])
        by smtp.gmail.com with ESMTPSA id m24-20020a05600c3b1800b0040c251a1014sm73193wms.0.2023.12.11.15.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 15:31:30 -0800 (PST)
Message-ID: <22d695d53844c3ad595879e44d4f943365e0623b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC] bitbake.conf/pseudo: Switch from
 exclusion list to inclusion list
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Dec 2023 23:31:30 +0000
In-Reply-To: <EB76304D-B0BE-46D9-83D7-A627844088DC@arm.com>
References: <20231211173553.2421931-1-richard.purdie@linuxfoundation.org>
	 <EB76304D-B0BE-46D9-83D7-A627844088DC@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 23:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192186

On Mon, 2023-12-11 at 20:35 +0000, Ross Burton wrote:
> On 11 Dec 2023, at 17:35, Richard Purdie via lists.openembedded.org <rich=
ard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
> >=20
> > Currently, pseudo tracks all files referenced within it's presence unle=
ss
> > they're listed in an exclusion list. The exclusion list has grown to be
> > fairly unwieldy.
> >=20
> > This patch swaps PSEUDO_IGNORE_PATHS for PSEUDO_INCLUDE_PATHS which in
> > theory should be easier and more explicit to maintain.
>=20
> I=E2=80=99ve never understood the rationale behind exclude over include (=
then again there=E2=80=99s lots I don=E2=80=99t understand), so I=E2=80=99m=
 very much for this in principle.

If you create a file and then move it into pseudo's "sight",
problematic things can happen. That sounds like an odd thing to do
until you see tmp files created in /tmp, or a "cp /dev/null newfile" or
the fun games you can play with /proc.

Another example would be create something in cwd (not included), then
move it so becomes something which is included and the permissions are
lost.

The argument was that exclusions were therefore safer than inclusions
and in some ways that is true. The question is which is going to work
the best and be the most maintainable too. This patch at least allows
us to experiment with the other choice.

Cheers,

Richard

