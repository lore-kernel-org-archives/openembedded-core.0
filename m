Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED58C36008
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 07:35:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.13628.1743492903010923928
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 00:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S9D9AnQL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2700681f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743492901; x=1744097701; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UDuqhNhmAZnfIZXmO24Ra4dCuxeVCIIfnBP77g1zfU8=;
        b=S9D9AnQLLYPsUVVfDGYLdmulACa1Vj929gBH8LQgIC8w6f4TEv5H6okfe84r+MVf1Z
         dGD8iq3oXEkBn2td8CLFlIVXsqnvOaPci3zHd9LpU+WfnG1vlyG+CwQMxeL+TF6AHx/p
         0SiYcfMPmFgGIbOdifYpxcSPjzeue99bxIJuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743492901; x=1744097701;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UDuqhNhmAZnfIZXmO24Ra4dCuxeVCIIfnBP77g1zfU8=;
        b=q3713SRih3TDojyJz1QNWQeoMUI8uhQ5KkVTkpL2rQXrWvjugJldui7vV0lroj37mb
         TZSl/Q511NLORcrzMF0AA+kXRujZj5NdQYBjaR99kTQK8Buxmo4dbqYYr5a8WernMify
         laKlH4or4EdHzyxSb7sXEJQ/tGY2Xe/Ts38cZjGLBJ+foS274GFbd5DhTkJGvezMtRUN
         39W8l3RlX7l/sM0lLwfoKHGUrfdFS8MgkRPgtZ6z+3eWuq02ofCBcktl0NCEb5uNCneT
         6+d3AaFl47zfUWQppon6d5YMajQ8b5oI+RMcEXrjymvG4J2M4HlXr1+ggHSsfB6L0FLe
         q/Hg==
X-Gm-Message-State: AOJu0Yx/yVeCZ6ItPsAhpyjH5IGIQBOO5YI8prf75DizqcW9orXVlAj6
	Wk+rEZP2NiAmqkzRNC7XOinZHcwCO1a/y5CurTL06CNojPJbm5F0zWGU870s64k=
X-Gm-Gg: ASbGnctiGpxdjBG1JqF3D1f2S2o0bsY3ebWk33VmuWIGU1Z348yutc98dLD4XXsOECk
	tUefmLJ1RHmzGnIJooF7H+al/nzFxceLcNzTQhSreZ7eLg9zEpk97TDZg7yQ2Fzjpu4xWQCppaz
	33nz27ScLYG/dDEnAg2BWNEOTRP3V0h8JMPOtHC7EyZt/IbyewU7XFImCVAom7h8cSOcMJ/ty/Y
	O+HVnrV4qlK+t0aJMWFm5N/YNJPlzVn2/zG3b/FcEDKb9dxl2/sbOClbpxr4G/RmB1uBIrNCPpb
	lDnDXQwy5OTa9oqqjAcVbmofmP70W6/yMz8KHazNmXaDW6eabvOUA2CK2DF84H1UDNgD3OyAt0W
	HNpdCTCxaXWFqvbEHd9wcxRMIHZ7NdZDyyA==
X-Google-Smtp-Source: AGHT+IFMJZTRq8r+1DIQaaLAJNWNyfzcpTsueAS7XisxhI5YwSzvtAJ9wB6WgHRQo/vLlJN0BGEWGQ==
X-Received: by 2002:a5d:47cd:0:b0:390:fc83:a070 with SMTP id ffacd0b85a97d-39c1208cf23mr8950097f8f.0.1743492901271;
        Tue, 01 Apr 2025 00:35:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f463:b16e:827e:c6a2? ([2001:8b0:aba:5f3c:f463:b16e:827e:c6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d2bc7fsm8043165e9.0.2025.04.01.00.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 00:35:00 -0700 (PDT)
Message-ID: <0ffd9405cc6d36130436edcbffef826dc3f29b4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust-llvm: Compile llvm to use dynamic
 libraries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, raj.khem@gmail.com, 
 "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "Shinde, Yash"
 <yash.shinde@windriver.com>, Deepesh Varatharajan	
 <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 01 Apr 2025 08:34:58 +0100
In-Reply-To: <1832019BE8984F8C.2063@lists.openembedded.org>
References: <20250331133044.1944108-1-richard.purdie@linuxfoundation.org>
			 <CAMKF1sr8AqkmjQca6fYe90oOU3h=++A2=7RpaWkRFEuS38oyHg@mail.gmail.com>
			 <9fe3cc25-c6fc-410a-b819-58e1e1db818e@windriver.com>
		 <1831FE10390FE3BE.19875@lists.openembedded.org>
	 <1832019BE8984F8C.2063@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 07:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214004

On Mon, 2025-03-31 at 22:49 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2025-03-31 at 21:44 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Mon, 2025-03-31 at 15:08 -0400, Randy MacLeod wrote:
> > > =C2=A0
> > > On 2025-03-31 12:13 p.m., Khem Raj via lists.openembedded.org
> > > wrote:
> > > =C2=A0
> > > > On Mon, Mar 31, 2025 at 6:30=E2=80=AFAM Richard Purdie via
> > > > lists.openembedded.org
> > > > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
> > > > wrote:
> > > > > Our main llvm recipe uses dynamic linking already but rust-
> > > > > llvm
> > > > > does not.
> > > > > =C2=A0Enabling this significanly reduces the size of llvm-rust to
> > > > > about a third
> > > > > =C2=A0of what it was, which is a bettter configuration for us
> > > > > leading to smaller
> > > > > =C2=A0TMPDIR and sstate objects
> > > > >=20
> > > > =C2=A0
> > > >=20
> > > > =C2=A0
> > > > =C2=A0
> > > > It will slow down the compiler execution and sometimes its
> > > > could
> > > > be significant as well we have seen this with clang so it would
> > > > be good to have some idea around that least we provide a slow
> > > > compiler compared to other distro infrastructures=20
> > > > =C2=A0
> > > > =C2=A0
> > > > =C2=A0
> > > > =C2=A0
> > > =C2=A0
> > > We'll get some performance info from the YP AB perf builds.
> >=20
> > https://valkyrie.yocto.io/pub/non-release/20250331-105/testresults/buil=
dperf-debian11/perf-debian12-vk_master-next_20250331181527_9ba5b4f4e4.html
> > https://valkyrie.yocto.io/pub/non-release/20250331-104/testresults/buil=
dperf-alma8/perf-alma8-vk_master-next_20250331181513_9ba5b4f4e4.html
> >=20
> > The build time is fractionally faster (1%?) but hard to say within
> > noise.
> >=20
> > The diskspace drop is convincing, 2.3GB less TMPDIR size (2.3%).
> >=20
> > The rm_work TMPDIR size also drops by 1GB (6%) which is
> > particularly
> > significant and nice to have.
> >=20
> > In builds with rust-llvm as well as rust-llvm-native, this will
> > double up for a double win.
>=20
> The analysis is a bit flawed as it is contrasting master with master-
> next which has 1.85 as well as other changes. We need to remove that
> from the equation.

There are a direct comparison with just the patch added:

https://valkyrie.yocto.io/pub/non-release/20250331-129/testresults/buildper=
f-debian11/perf-debian12-vk_master-next_20250331220727_26fa862acd.html
https://valkyrie.yocto.io/pub/non-release/20250331-128/testresults/buildper=
f-alma8/perf-alma8-vk_master-next_20250331220715_26fa862acd.html

So the buildtime is around the same (or less with rm_work), it is hard
to say from the daya. TMPDIR is 3.6GB less and 1GB less with rm_work so
definitely improved.

Enough of an improvement in space usage I think this is worthwhile. In
general space usage does correlate with build speed.

Cheers,

Richard

