Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3979C7EE33
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 10:20:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.4955.1750933232230846742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 03:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=adyJkKFc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so5067885e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 03:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750933231; x=1751538031; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ph71GIAhK4pfyUr7CI40C2M/5W2dDjXNU7eEi+yjE3E=;
        b=adyJkKFcWVhOlFYETBqX38ZBY5GqVDpH2wEHtxC8rRBFOCaFDGCyexhpSMqDCGDT1z
         /D7HbY8T5/UfEaXTeHSDP1iueThVXA/ExtAZhAMO36EdKXLDxtAPhNbtP0+/iT8QEGhj
         MuGCPAtCxsKpv0hhA0SoEngM/o+2JlapDGrtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750933231; x=1751538031;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ph71GIAhK4pfyUr7CI40C2M/5W2dDjXNU7eEi+yjE3E=;
        b=RC3Styy3J/DI/e08N3DUMvlZ2Lrc2UymcyfXgKihtoSFXA5V6OnZakbJGYOV1VKNe7
         Z5Fs0m4UjxYBRCZL1l92c4iRL9hHJufk0eay7FiTPbjDTp1vHicKkTTAWr8bLon4hUY3
         v+0MkuTOiIX9yXpBq8EnQFfySxjXGXegbSBSkQ7LtgZ2orF79c2/CwgiHj7IbFbH5GVi
         mZJgUwatQSDH9pBehAR/13fIBuTKI/QQczh81Yo8xqMCCwDAfZd5op7zfTVL9FB3m08y
         eZRGsn3mIcGmEnh69AETtVC5fhOwKQbMkWDoLggIPnIlWM8YLqcQBPRhrsw31ZQpO83X
         hTug==
X-Forwarded-Encrypted: i=1; AJvYcCWeOs3Beqo4JLy06M09i7gVwOiWcAHYAYnjL7yxJMe46rsPT2mA7Os4g/v25HjzTTuW2vP0+JA9Jb276Cskjx0MVg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxp+DiWghFrjD6Nck7Pq+Q+suYl8QHN/8OHvjbjFH/703n7ILmx
	Olnt0ZoCVwS/PRPysAIRVMsrhuRdICOBxhNNxpQZTS8ZXaFmb0aRIpl1VX/5bqOlwIcqU7W7KwM
	FnIHG
X-Gm-Gg: ASbGnctvcTJRXNa5g6XYFo5pDIuhNxJGkP45XqxEwriw07h6/ppGmBg158gfGsZ59kd
	3Y45v7zKUZIp+Kq04TiPnq1AIrJvwyGCz3b3zW4z0J6Y/vT3UcUXzJ+FNFSDQ975aRlpo8Gqx92
	19JvPv4JKbFnNeXmxy5Ckk2FwSNDodLyj0y/NZJeY9wyVDHvnxR75g13yCmfilIBE39CCw4+iH6
	gNSXYxsMmwPi6mLcnKdDDv8tmNOCfGFEPzaEZ2ehatsmVdTHgRqKFbXn38T6QmuKK3LCAdFH2+B
	A1iqb7wao07Vkl9rTm0kBMrYTPjd15Sso5okLeHJSybpWM/+UgHHrH/WfNokGGi5OiV0AhfqT4w
	Fvv1MGY5CLI5SXab2D5bkvTQvgvER4KbzzQXPXhrI8i1O0XBv6iQ=
X-Google-Smtp-Source: AGHT+IFBkSWY1KeIaLYCpyHdmxd2VyNtHntjQPpqWB/yKl7Vzx/gps3qZsDYkJWwvxlb+I3xhMf+zQ==
X-Received: by 2002:a05:600c:548d:b0:453:1058:f8c1 with SMTP id 5b1f17b1804b1-453886d3681mr33264595e9.3.1750933230540;
        Thu, 26 Jun 2025 03:20:30 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3006:882d:8520:75c1? ([2001:8b0:aba:5f3c:3006:882d:8520:75c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a306a01sm16142045e9.0.2025.06.26.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 03:20:29 -0700 (PDT)
Message-ID: <c8c74ff4ff7f39153ab934c1ff4210ad8ed1feca.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RESEND][PATCH 0/8] fix runtime versions
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: yi.zhao@eng.windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>
Date: Thu, 26 Jun 2025 11:20:29 +0100
In-Reply-To: <20250624104155.559827-1-yi.zhao@windriver.com>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 10:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219344

On Tue, 2025-06-24 at 18:41 +0800, Yi Zhao via lists.openembedded.org wrote=
:
> This series of patches was sent in April. Ross suggested discussing this
> with upstream to see if they could update the scripts to address the
> issue. I talked to upstream and they declined because they believed that
> "autoreconf may result in different built source code than what has been
> distributed"[1].
> I found that Debian maintains a similar patch in their own repo[2], as
> it was also rejected upstream[3].
>=20
>=20
> [1] https://lists.gnupg.org/pipermail/gnupg-devel/2025-May/035913.html
> [2] https://salsa.debian.org/debian/gnupg2/-/blob/debian/unstable/debian/=
patches/debian-packaging/avoid-beta-warning.patch
> [3] https://lists.gnupg.org/pipermail/gnupg-devel/2014-November/029068.ht=
ml
>=20
> Yi Zhao (8):
> =C2=A0 libgpg-error: drop -unknown suffix from version number
> =C2=A0 pinentry: drop -unknown suffix from version number
> =C2=A0 libgcrypt: drop -unknown suffix from version number
> =C2=A0 gnupg: drop -unknown suffix from version number
> =C2=A0 libassuan: drop -unknown suffix from version number
> =C2=A0 libksba: drop -unknown suffix from version number
> =C2=A0 procps: fix runtime version when using git shallow tarball
> =C2=A0 psmisc: fix runtime version when using git shallow tarball

I did also want to ask if WindRiver have considered a slightly
different approach to testing some of this. We already have some tests
which run things like "dnf --help" and "dnf --version" on the target
using the runtime testing. Those did catch a missing dependency in the
recent dnf upgrade so they do add some value.

I've been wondering for a while about extending this to run those kinds
of options against more of our binaries. In this specific case, we
could check that "unknown" doesn't creep back in.

Is that something WindRiver would be intersted in extending our runtime
tests to do, at least for some set of binaries. We can guard the tests
on whether the images contain the appropriate packages.

Cheers,

Richard

