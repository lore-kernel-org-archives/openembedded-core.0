Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15106C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 15:26:47 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.12833.1743262004209106277
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Mar 2025 08:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OynKI4jx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3913d45a148so2695694f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743262002; x=1743866802; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=50SRXvYlEULMbaIKzkt0y11dNWErCSJPogmYibpzknc=;
        b=OynKI4jx9AyDKPyj7LqcBdl+sIu5alGMosLWJ/OqE2T/80enidIKa3np/xwVjPwOk5
         0GumzOOM4g6f/fn6E3DVmPCAD+gGxLajsbT6IHKu1E07EEa1Ha5BaPEINoskYnSkHtPE
         pe3cdJIRT9i31NoJhacFH0CPlue2Ag0iNPUvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743262002; x=1743866802;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=50SRXvYlEULMbaIKzkt0y11dNWErCSJPogmYibpzknc=;
        b=N8lN3dDGYRxecSwZq9ZVbgUxhyGzogO7eSHlArQYLYVauxgJ+M9KW4S5eNhW/okT0q
         AsAkjf/eyhQg4GzMDSBCgfaPFBkJZaXtbYZBFeNCuc+bIcGi50cGwWJNB2RNIDPWUSrt
         hx2LFXCMszP0UaLBH9aSDLsyt1TrNPaYUA6ONRR/zFyGzALtpJlkcvjZ/taZwKowRcSK
         hbAf4yq23EqBhEnWvyVrnImsXeef68MNK2/kxExLVMg6jBrRym/bm822thBA1DFpQgpg
         T5frKNEVpI93PyPnGLokEnGZTP3Qqt3I+lUppepLmWWHKyAA79XydDfO30rfFkG8gOLY
         NjUA==
X-Forwarded-Encrypted: i=1; AJvYcCXcX9TzKd1crz3dSrSQ3HJAktvxBdyhAhimqY32WsHNZsDqcwZNhMM7x5qaeGhCDVlTVZeolgJc6hq6+5pigsYpSw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyeUCkBxcPDQWIGglBujG/ZMBzF5+TQcNtLfBCzX8Zh+qs8yydf
	+TivLJMitw5822123ItXK/JnT+GQUZV/i1Qyr0JQm3i2VYrZdGkMlCJP1KkTfiaWr4H5Rqiwvdn
	V
X-Gm-Gg: ASbGnct4NzzULzdAWTks9397iy46wccDKEjCEh8i++qFoDcQSkN4ZAd/3b/j0VHaydC
	COcDBHuxwSX4cQwQ6y3+oX8ZuV+r5BlqSgY8OfV4igsZzwdd6pe76WmkvB8BIMApa4rRry6M2jx
	o4WWfLadsVil5e77QL5nQ/BossGotmV9MJwH+szBWasTHHNQS9RbuhelXJTia8zTQa9r4dCRUn4
	LbdTjeN6Ss7yrUctUDGF7Mr/gll4YY5C4Mhku/KSMQikYKdK5iKJvdaG6wXavEQjeS8lrHZCCLt
	S23k7+PcjCIToaymO9YDhVeUT+fHmOK3NB4SComIgpWw9RbYwtGMpecBcwOw9toW9pUOL4cKMd+
	FMf+/7+PzHgSL2xmkBPfCVYJl5d67
X-Google-Smtp-Source: AGHT+IHhB7bVkCi7YkPzzBKIAJAGKjMS/drEvpgdUxVGkauc1HOp79rIwBKRoNU+8PH2vkNL0s9Jog==
X-Received: by 2002:a5d:5983:0:b0:390:ebae:6c18 with SMTP id ffacd0b85a97d-39c120db794mr2206430f8f.12.1743262002554;
        Sat, 29 Mar 2025 08:26:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aa52:226c:d1da:79? ([2001:8b0:aba:5f3c:aa52:226c:d1da:79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e0a3sm6113952f8f.71.2025.03.29.08.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 08:26:40 -0700 (PDT)
Message-ID: <12776bb304a6c5a98f34325fca117ae7a541ef2e.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Yash.Shinde@windriver.com, 
	openembedded-core@lists.openembedded.org, Deepesh Varatharajan
	 <Deepesh.Varatharajan@windriver.com>
Cc: Sundeep.Kokkonda@windriver.com
Date: Sat, 29 Mar 2025 15:26:38 +0000
In-Reply-To: <e961e1bc-bfd6-49b0-82dc-c00ac879ad76@windriver.com>
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
	 <20250328143005.880998-2-Yash.Shinde@windriver.com>
	 <e961e1bc-bfd6-49b0-82dc-c00ac879ad76@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Mar 2025 15:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213882

On Fri, 2025-03-28 at 16:56 -0400, Randy MacLeod wrote:
> =C2=A0On 2025-03-28 10:30 a.m., Yash.Shinde@windriver.com wrote:
> >=20
> > =C2=A0RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
> > =C2=A0
> >=20
> >=20
> >=20
> > -#After updating to Rust 1.85 we can revert this removal of "src/gcc"
> > -remove_gcc_directory() {
> > -    # Ensure the gcc directory exists
> > -    gcc_dir=3D"${S}/src/gcc"
> > -    if [ -d "$gcc_dir" ]; then
> > -        rm -rf "$gcc_dir"
> > -    fi
> > -}
> > -# Add postfunc to the do_unpack task
> > -do_unpack[postfuncs] +=3D "remove_gcc_directory"
> > -
> > =C2=A0
> >=20
> >=20
> >=20
> =C2=A0
>=20
>=20
>=20
>=20
> =C2=A0On IRC, Richard said:
> =C2=A0=C2=A0=C2=A0=C2=A0 I'm puzzled as the rust space fix didn't have th=
e impact on the metrics I'd hoped for :/
> =C2=A0=C2=A0=C2=A0=C2=A0 I think there is something else going on. ...
> =C2=A0
>=20
>=20
>=20
> =C2=A0

I a look and realised the issue, the trouble is S is not always
RUSTSRC. I've sent a patch, hopefully the metrics look better this
time.

Cheers,

Richard

