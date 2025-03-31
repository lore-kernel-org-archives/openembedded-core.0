Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16B1C36014
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:49:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.4934.1743457774046362482
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MHXnxyV2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so48535685e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 14:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743457772; x=1744062572; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hhn0rBv+oDYCcj9+U7LdzZingUtwXZwsq2aSqLWJ5+4=;
        b=MHXnxyV2i8TZGrI4S5A42yGqvn6HcsZ0amwm+inhnj1oFsbbFz6cp/rZv3iO19DcR9
         qfBjugZyB666VGSxnX9ZrDVqAnLni5/ceat67xA+uW/AD+1yHcaeyAqXytk0EcCHxRP5
         vVs9miKnj3jkXrHsTDMqRcq5vYJnY3od15o4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457772; x=1744062572;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hhn0rBv+oDYCcj9+U7LdzZingUtwXZwsq2aSqLWJ5+4=;
        b=V6eYuLcHYGdy9sH+glNESxCG6dB2ZAZ4vV+Uj4ibFWnLZsE/3/cj8oMsAMq1xi3ZOf
         7THF49fR7FRziyEIu25uzhhYpCSsXfdSEj6qcpv06HS+nNsI7va/SJyWZiQQZyZ97zxa
         PzoRus7IyTdmU2jemOHBghvaZ2R5QTya5GsNsE2nR93kCTkntKeWkEJDUszcLc9m8D9y
         oyK+YDJPCwHhChXO6taL3qquk6IYOC7fu1912ZBY21j55ZUZg3bIArhEUCLeBgSnCtks
         hi2KbVYRiFIuF+KbGTl8DiN4LG82R4RyccYATdN5GHLeG4mfXMAoZ4TlNSPkkNxlYt+C
         tQNw==
X-Gm-Message-State: AOJu0YxPFjCt1Ruy2c6XhyqJXjSGjgu2fz6ANc2CwbmcI3nBOqUOUoA/
	isqHFJIcJos1PzVQFj2m9nNVzUWghHDrJc7ZcEVPNAZuDK+AqnIdNsAAM7nMjj4=
X-Gm-Gg: ASbGncu+zTEheKqXZkSKdsx1vz4u8L+dmc+FB4eK0vg454RQmzGQqPXxPaSu6pLqFWr
	5cG7eh42wHDJhNDAzwLN0eWliCnwjuOYgiOVLEHHbnhTkFnSwt9+KAvoNBh+0jALXVOWcK770wQ
	QPMQK8/Rnjkng5jKwdT7sF2N+DQml/inSxZ3HwlbNm29dhBXPd2ec0K1WMktBOY6Y+LQCUVie+z
	LpdOcUUTzC9FvBXVRqb3w2UsKjWIV0BOwyq/OF2tuKZlWURn/kXckNrs6QqXrSQPm1tu8FfcSvW
	c54CpfvK7adLb4SUnY9a4GrKiE3Yb2j28DMq+BK9hvlNkVsQTDxHEAgE+KfXAVy5QS65iMxANXX
	1gCrM3GYd2to1QcPH7nXlvSf5p0BDoUSFdg==
X-Google-Smtp-Source: AGHT+IGxvRa27vmN0K6SniVIsWjams+ZwSJfjlakU5hsZfevMoCRKeIp7MWYX8BU3UBVZFJ3uDmTEA==
X-Received: by 2002:a05:600c:1c9e:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-43db61e0723mr88645155e9.6.1743457772476;
        Mon, 31 Mar 2025 14:49:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6d6e:8a56:fa3e:c2d4? ([2001:8b0:aba:5f3c:6d6e:8a56:fa3e:c2d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b7a4351sm12543533f8f.98.2025.03.31.14.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:49:31 -0700 (PDT)
Message-ID: <dea1caad9a219f5c93a168680911f6ab984b1f5c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust-llvm: Compile llvm to use dynamic
 libraries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, raj.khem@gmail.com, 
 "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "Shinde, Yash"
 <yash.shinde@windriver.com>, Deepesh Varatharajan	
 <Deepesh.Varatharajan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2025 22:49:30 +0100
In-Reply-To: <1831FE10390FE3BE.19875@lists.openembedded.org>
References: <20250331133044.1944108-1-richard.purdie@linuxfoundation.org>
		 <CAMKF1sr8AqkmjQca6fYe90oOU3h=++A2=7RpaWkRFEuS38oyHg@mail.gmail.com>
		 <9fe3cc25-c6fc-410a-b819-58e1e1db818e@windriver.com>
	 <1831FE10390FE3BE.19875@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 21:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213997

On Mon, 2025-03-31 at 21:44 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Mon, 2025-03-31 at 15:08 -0400, Randy MacLeod wrote:
> > =C2=A0
> > On 2025-03-31 12:13 p.m., Khem Raj via lists.openembedded.org
> > wrote:
> > =C2=A0
> > > On Mon, Mar 31, 2025 at 6:30=E2=80=AFAM Richard Purdie via
> > > lists.openembedded.org
> > > <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org>
> > > wrote:
> > > > Our main llvm recipe uses dynamic linking already but rust-llvm
> > > > does not.
> > > > =C2=A0Enabling this significanly reduces the size of llvm-rust to
> > > > about a third
> > > > =C2=A0of what it was, which is a bettter configuration for us
> > > > leading to smaller
> > > > =C2=A0TMPDIR and sstate objects
> > > >=20
> > > =C2=A0
> > >=20
> > > =C2=A0
> > > =C2=A0
> > > It will slow down the compiler execution and sometimes its could
> > > be significant as well we have seen this with clang so it would
> > > be good to have some idea around that least we provide a slow
> > > compiler compared to other distro infrastructures=20
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0
> > =C2=A0
> > We'll get some performance info from the YP AB perf builds.
>=20
> https://valkyrie.yocto.io/pub/non-release/20250331-105/testresults/buildp=
erf-debian11/perf-debian12-vk_master-next_20250331181527_9ba5b4f4e4.html
> https://valkyrie.yocto.io/pub/non-release/20250331-104/testresults/buildp=
erf-alma8/perf-alma8-vk_master-next_20250331181513_9ba5b4f4e4.html
>=20
> The build time is fractionally faster (1%?) but hard to say within
> noise.
>=20
> The diskspace drop is convincing, 2.3GB less TMPDIR size (2.3%).
>=20
> The rm_work TMPDIR size also drops by 1GB (6%) which is particularly
> significant and nice to have.
>=20
> In builds with rust-llvm as well as rust-llvm-native, this will
> double up for a double win.

The analysis is a bit flawed as it is contrasting master with master-
next which has 1.85 as well as other changes. We need to remove that
from the equation.

Cheers,

Richard

