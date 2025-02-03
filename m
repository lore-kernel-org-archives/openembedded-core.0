Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A639FC02195
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:24:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.91764.1738599885148042775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LNI3ZkH6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e3621518so2213782f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738599883; x=1739204683; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rAkimvLgPU0nsQ1qKa2D9Y0cG1GTso6DHnWDpM/IS4M=;
        b=LNI3ZkH6P9PzDg6qAYGEYKjdXYDRR9jpvGOGh2aKrOZWxr1OjMHiLqKzzg0jZKOgv3
         MTXfTRmaO0su5AVAIJCmMl2MpIC3E7EOEoIjSzZj19rgKsEOyn7pvAUyjbMyZ+Ny9ERd
         KFmCtQlvkxHdRZ57SLNxfTnMzCPkgYdkjyrmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738599883; x=1739204683;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rAkimvLgPU0nsQ1qKa2D9Y0cG1GTso6DHnWDpM/IS4M=;
        b=Ydcvo+jdq0b++yOpcOPwi4pk/JG+dMvPuV9gKv4ybbTlZOjHD3ao9Lps+ZpQ5tnfUw
         AeK4/GrMr2K4Thh76nyLiiep+N7p6UZmZM9UekBaUfkYKOrqsDVIuM7glJj2d2du0yp2
         Npjp3RlNM8fL0QtPjUMAA5v/K7dgl4uAZZy5RirjuC6B2U9mFB0CJ6WJkUzauq3mEgga
         nx83/VGoEs7uWHjE7npMXT49yhdK+thHCHAo5XTudcNkWJdTZFLCQbJGjU/fWzKxZ5Jn
         1ZwbCqQVLrrUzu87TidF2rMeTMJT8RjlxqDcAVYyo19v/HnJ9Cnu/acyhw4m37LJpJ+9
         b5jg==
X-Gm-Message-State: AOJu0Yz6B721AsCqeugDQP4/vVVLv3g2SsENiDu5kKiuuYbqtxFGaw0t
	WKfhpBCqQlNBGCPKmtAyRNmTmOg8F+DNUvPEzv2gNt3DyEAj1eGCgHQjRksrR0w=
X-Gm-Gg: ASbGncs+Ik2myhHtJ2J7aDYDNHOUxs3e7LyYt9sfXCNkp2snjTNPZHjdLrr0jx6gBDP
	t4IBMAwb8QwQD6d0eAY1yn1s2o/ppS0Dkps4QRjJmueK3FqAN16GAqtDVpHEv0mCT14dr40GWQz
	H38QyRMjCFien7mUbtIH7zJokR/8ci9A2QmTEd/dvA7a8HcwjQKXuGgg9ATPxlp3N5Si/2H0B90
	uIf7+Ez2EvH+20cU9EX4o7RtTHix35wHFya7iRssFoy/l9COycpM95mffdEJNBRFBD6rAoar3w0
	1BClwmvbFcpOf/yhtjeRgRxQtlkzytg3SKiZWi5Kbo8PtvnstqFhjgXOjIHieqZ2YUk+to65Zfe
	UibHy
X-Google-Smtp-Source: AGHT+IF65W3SGlB2oi93P2OdWDKl+HG/npMRJz87yqXPpu7AtrvLiLO3ne1g+aZCRF+FbaYOUdOEaw==
X-Received: by 2002:a05:6000:1fa4:b0:385:dc45:ea26 with SMTP id ffacd0b85a97d-38c5195e85cmr17403394f8f.12.1738599883560;
        Mon, 03 Feb 2025 08:24:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:41c1:3919:865f:692c? ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1cf831sm13441703f8f.90.2025.02.03.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:24:42 -0800 (PST)
Message-ID: <db7915d3754efd75c2bc07fc5b81b9e8a3702adf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] pango: upgrading to 1.56.1 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: auh@yoctoproject.org, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 03 Feb 2025 16:24:42 +0000
In-Reply-To: <01010194c1ac03e5-85b47374-6f7f-404a-91f5-949edd047468-000000@us-west-2.amazonses.com>
References: 
	<01010194c1ac03e5-85b47374-6f7f-404a-91f5-949edd047468-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210666

On Sat, 2025-02-01 at 13:21 +0000, Auto Upgrade Helper via lists.openembedd=
ed.org wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *pango* to *1.56.1* h=
as Succeeded.
>=20
> Next steps:
> =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-pango-upgrade-1.55.5-1.=
56.1.patch
> =C2=A0=C2=A0=C2=A0 - check the changes to upstream patches and summarize =
them in the commit message,
> =C2=A0=C2=A0=C2=A0 - compile an image that contains the package
> =C2=A0=C2=A0=C2=A0 - perform some basic sanity tests
> =C2=A0=C2=A0=C2=A0 - amend the patch and sign it off: git commit -s --res=
et-author --amend
> =C2=A0=C2=A0=C2=A0 - send it to the appropriate mailing list
>=20
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>=20
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>=20

FWIW this has docs issues:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/856/step=
s/11/logs/stdio

Cheers,

Richard

