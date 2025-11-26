Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5C9D1039B
	for <webhook@archiver.kernel.org>; Wed, 26 Nov 2025 16:41:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17965.1764175311082787058
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Nov 2025 08:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hhqbAYR5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so57183095e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 08:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1764175309; x=1764780109; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bCbTX1sID0medkcuRlTTX7pGDSr7Eko0J3uSLZaJhY=;
        b=hhqbAYR5j5NJM7nRgOa93UvuOv9KW1Yz0Ewctt9Foutunz8KKLAJXz3m75pXSUHPsF
         SeDOovsOyeoBAFLSSE9wSeTer1E1O+2fex1Eog8cHFsAqyDAoCAbzDbtFy5g6uRDU+MV
         EidVPdvlkuM5NHA3IiiU0eKjT3Kn2jEid0hB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764175309; x=1764780109;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7bCbTX1sID0medkcuRlTTX7pGDSr7Eko0J3uSLZaJhY=;
        b=BRjz1yeNZ+wWggHOmeUXWax9SVeYLPwNFzst4aWyyN4WXYVQMZ5d8C0QbDvTrsyNrO
         iL36RFVn69K+HcRZAh+P3mRXqj5YJiLfz1JzStI4OGeijAZOe2Nf63AUXG5mBDt7qQnq
         1itATCFAkqYdnnJPR1QNz9cO8x46XvUWsiRbFVZCNdeZaYH76H5++V57gLLfGUuj1/C7
         V21re4jB8zEUVxrJQiJuchVyZTiPP/GBV/AoHeMuqCZLA++obhSuHgr/92rJCAaC9KBt
         n6YzQ8/wm8ZpHExWMimgD+USAcG1j071ZHkFVkAF0yFVjL2dM9dBNlY60exaSqizkJt9
         Q/ow==
X-Gm-Message-State: AOJu0YwIWYA6KuSDyifE0gNxKORmsUSJn15gyRGTM4a/+5n+PvjfIYbM
	0FRA04YXCeSeriKr5kSe0+846/HgDTb6IWv559gFrW3KvENxBagu3KUdVxhnGeFplss=
X-Gm-Gg: ASbGncsyHb4zJnHwuHaDIZ53Aerf8jUbD3/HE8TRABkKLXFxYM9GXCqY7wbfcUjBMec
	LIicLXrChNWaXHpwOcPabmlGPHycm646/oNRKUV+C5nw9QRCK8lPQ78/TIMGF3IJVZSqnXvfhrT
	5kuXwbPMdduq4hw8ZsE05n5fuy981yYP0dyCdDHPaXUPj6B+pNkj7YjdhbcDSTyXKVf097axZIi
	WUcCFZbWxGQQMmWhsF9ti/ncVcd5VwpT1u5CIiJHU+pL64rTfMtNbLL1PxJ3/2RqIG+Q+YCoPbJ
	aq1kj2duu0HwBWAW3aTkUp9quW2snZIailNvwvuKjx1+3/8ldZwfw2rzVsxUaoawjHaxaKUOno5
	po1FOaJmV+BVetCFILpUKI6yhXKAY92KRAV7rjQUyewg1bFWSmcNHqlfrMZpZgqYly1d2pp+aDA
	MyAFeUeRAkkRRPO8ByHBrPEeQFNeaAX4wrBGl1SGkD0sCvFC9IXFPOUQuKN2DP8eWH8u3JwFKlY
	3A=
X-Google-Smtp-Source: AGHT+IGHynHD6+r52THlFrqpGMNBw4nLmaq4+2ntyQm9Uko6ctAp7915a4uPfo52xEKKbND7k0a2Rw==
X-Received: by 2002:a05:600c:4fce:b0:477:9aeb:6a8f with SMTP id 5b1f17b1804b1-47904ad9438mr67400365e9.9.1764175309469;
        Wed, 26 Nov 2025 08:41:49 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ade:4a28:9c89:1a41? ([2001:8b0:aba:5f3c:8ade:4a28:9c89:1a41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc6f7bsm56411825e9.2.2025.11.26.08.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:41:48 -0800 (PST)
Message-ID: <7cefc9025cec54cc835cd3b065aa653f95a38634.camel@linuxfoundation.org>
Subject: Re: sharing sstate in bitbake-setup
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>
Cc: ",openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>, Joshua Watt
 <jpewhacker@gmail.com>
Date: Wed, 26 Nov 2025 16:41:48 +0000
In-Reply-To: <CANNYZj_QRWSTZMne1B0PO8rdo19Ltb=QqQGVmSRk7ZpnaY2MAQ@mail.gmail.com>
References: 
	<CAK5yBb8SJ79GDs5aGpz0MGuNNdKf26Z7nw81yNtAsUr9VNq01A@mail.gmail.com>
	 <187B446507D0D6B0.100836@lists.yoctoproject.org>
	 <CANNYZj_QRWSTZMne1B0PO8rdo19Ltb=QqQGVmSRk7ZpnaY2MAQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Nov 2025 16:41:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226805

On Wed, 2025-11-26 at 17:13 +0100, Alexander Kanavin wrote:
> On Tue, 25 Nov 2025 at 14:54, Alexander Kanavin via
> lists.yoctoproject.org <alex.kanavin=3Dgmail.com@lists.yoctoproject.org>
> wrote:
> > BB_HASHSERVE_SHARED_DB =3D "/path/to/common/hashserv.db"
> >=20
> > bitbake-setup would put this (and SSTATE_DIR) into site.conf that is
> > symlinked into every build.
>=20
> I quickly hacked bitbake's cooker.py to try this out:
>=20
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dbfile =3D (self.data.getVar("PERSISTENT_DIR") or
> self.data.getVar("CACHE")) + "/hashserv.db"
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dbfile =3D "/home/alex" + "/hashserv.db"
>=20
>=20
> And then made two build directories with shared SSTATE_DIR.
>=20
> TL;DR: everything ran smoothly and as expected.
>=20
> I ran overlapping builds, added no-ops to gnu-config recipe to 'force'
> hash equivalency, and there were no errors or crashes, and sstate was
> reused as expected.
>=20
> So I think we should do it like this, subject to 'shared-sstate'
> setting in bitbake-setup, on by default.

PERSISTENT_DIR is *not* designed to be shared between builds. it might
happen to work but is a really bad idea. Personally, I think those
cache directory variables and cache layout need redesigning so we
should probably take the opportunity to do that.

Cheers,

Richard

