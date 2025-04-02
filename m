Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91049C3601E
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 08:32:48 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.3043.1743582764163047665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 01:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FYQPKoWI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-391342fc0b5so4641928f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 01:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743582762; x=1744187562; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ukSGMgWURucYkyw33NdEFgW9ZiQVhq87JPBlMQf9PM4=;
        b=FYQPKoWI5QEg9l5acCTvLo/l06gLNKJw5zuX+w/o9FOxluwsESNcjohsSiUwEcb6KP
         rNwxOHzEDXd0mLEihBTbQW7gwJ2EynSB/YKVATTFPH62L2n0RY7w5wFCQTBt4BCJKSO1
         rzvE7AyrW8XGjuSMBjlqTFXipCihlK25KqcWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743582762; x=1744187562;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukSGMgWURucYkyw33NdEFgW9ZiQVhq87JPBlMQf9PM4=;
        b=qi6wI3mYmOCEki4mbr8hjcBiuAuvmfHfjgMfhxDQvzOGHqX7eCN53Irq2IMIIFv66y
         rkEcyI2qtD6PnJ93J83kGmsy3JGa9/gYc6yq2Z+EShLVEc2afZsZdQm701fqAvL+xgr6
         buCgSz165sPRAMrdlgiLLdN6NmlKWNuZNBFANCa0PUqxL2wdqByhlEKHXTjJctoz/LEj
         iRO66EcXXYZdf7VCZgYWvA1I7MDY5rJc+CL1YiuE438IPojkMBki80KtuWjIPdUGzbAf
         34HyvvLSA0jPflOYZAzw2PTSj8XK/h2w2oWPlTAzCUUVYbRBcjV+XjGEBS9Dtuu2fXKB
         dR7g==
X-Gm-Message-State: AOJu0YyMEFzD/uqoNAu5fexkCQ0yiy9wry2A6ySnoZez3Ir/3DffDDxi
	WV5G/ruVft7AT0Uvswikn72UAKTFvD44rAOQLZ0x6BehoXwR4DOGBoGTDqUI8KM=
X-Gm-Gg: ASbGncv8hLTXxddjSLOsT5+YwLcc4h5Xgn5ho8HN3RnZ27afsTPq5HBPcQocumAG2Yn
	8MierHE2KSXUz6+dYQGeyEHibxQ7FCNBClroJTP9HHzl6NHzRvyy8pVc9KGq3wjc/Hd09wGMtLq
	aOq3m3+jND3keqTM56toSvfDMYFvGdit26UZSgdMe7oIhgVUYyxeb9q+C0UjVLNOcxraTeadufY
	U7vlUDc4cRhAEsv8ovwh8f9LkBrU3mCgkZugJBTMA6zC882H3BF9eydW3ZnKeoBjntv5Q2TDXFl
	vwBTh6nyond+bXsyPbpagrooc4vxgfrIFVfKoRQmi7Ysxgj2vCN7LFHNhJg+yb0zq+QwWq3+S+8
	VPZa6e1qQqDMcH+orDMOORvZUXlQcOia2Tw==
X-Google-Smtp-Source: AGHT+IGAvkvQlpdPreZQXX41pSkTCXHekNqpPGZzkJixarIONwxEKoRf4VGl7TzPrvtkTROiIuG16A==
X-Received: by 2002:a05:6000:22c7:b0:390:fc5a:91c8 with SMTP id ffacd0b85a97d-39c1211df1bmr11847440f8f.53.1743582762431;
        Wed, 02 Apr 2025 01:32:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:24b8:b374:749c:8558? ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb613ae24sm13277445e9.40.2025.04.02.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:32:41 -0700 (PDT)
Message-ID: <1af4162fab2f465870ee58b9a2ffa8f1c4c710f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/48] btrfs-tools: upgrade 6.13 -> 6.14
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 02 Apr 2025 09:32:40 +0100
In-Reply-To: <CANNYZj-+wZBvKBKWU-Yr4an=eXxhFZ2kceX1VfmLUaZat4x2GA@mail.gmail.com>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
	 <20250402071017.2157620-5-richard.purdie@linuxfoundation.org>
	 <CANNYZj-+wZBvKBKWU-Yr4an=eXxhFZ2kceX1VfmLUaZat4x2GA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 08:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214230

On Wed, 2025-04-02 at 09:17 +0200, Alexander Kanavin wrote:
> On Wed, 2 Apr 2025 at 09:10, Richard Purdie via
> lists.openembedded.org
> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>=20
> > +SRC_URI =3D "git://github.com/kdave/btrfs-
> > progs.git;branch=3Dmaster;protocol=3Dhttps;tar=3Dv${PV} \
>=20
> 'tag'. Not 'tar'.

Thanks, well spotted. Fixed on the branch.

Cheers,

Richard

