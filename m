Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC85C54FCD
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:24:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1053.1785565481788636448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y32xvnkT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4980dc26022so1116705e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 23:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785565480; x=1786170280; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dM5i8ZRmxQMudh2zAK20HEz8K3C/IyQjgHVc0qdOJCI=;
        b=Y32xvnkTZdoiEbW9i5FPNRMUiniokw5r1ZaIIv1jT5YqB5fZi6OkTf+l8H773lNOet
         KToQniVkmQCh/Cq0exBiaey1RJjnjsPk2KfV4xLiLrrhEitoDEI2XesmbGe2B4058FLw
         GrtoBTdHfa5lf0fleBKm6tledAN+v6gmEHWKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785565480; x=1786170280;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dM5i8ZRmxQMudh2zAK20HEz8K3C/IyQjgHVc0qdOJCI=;
        b=bmvKjfwEtzNU54UtHFTHqIAwNH7QeKNwQ1KZguP0SIEfhR8hYtYBJWK/JktQL7CXVL
         XBz15cKt3+Vx9pXJixhKUH6u6ntq/B5X3N2To4v1NMBphHcDHfYq8VeHVk1dnR5YLF8I
         4+b514D2L0Z4Dx2vjR2c9pierTGvR2TajUaN5uzXc6tq5AFGvFsZmdKNT+nQYsw3erKc
         f8ORLPxLeYAY26bgphI1qb8Vqbqq+ti4QyB7vtCIcHpu4ydTW7+P8to5rGW51PG9MfH/
         2FZ5JnSdb/nHleJqY/IWQ+sVynyt2IWScd3SUvYM7bTYqb4EuzrL9bzmioD+ybaTbaOL
         /b8A==
X-Forwarded-Encrypted: i=1; AHgh+RrGqYNPUnIRbG0aDFOiyW5y59HM0Uelu8TCFPfESCei5S5Hs1IpODlKTMZwkv5YnwQEmh0R7KSA6rrWuegMxUs1hQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YziRqJlouEoeG3u5adkP4vjaJo5q/jE3T6bNGh0Z4z+a6jV0tuY
	csNBUnt6TE5maogsNxKfdq9OGq/aComUgw1jmFaBumviWEkQ8PSiQmY592vS/Y9cJJw=
X-Gm-Gg: AR+sD11uGCLTisA1Swvy3fBtBYi0uVm/w7PfArhYFKYlhs3X0NdGMtcekvU4XeD05yi
	GSczF5yT9pzNCWAj7GqjA9AEaq9cO0RTMP93i+T+cl3nCCbIO5fA5+N87Z7bBVI9l7ElxKaht0+
	TXVdJyG9SD9hTUFY0EktWGupsDccAREL3b6//tzJjYa9BJdejgqEI68z8qHPyPyeCtknYcB/803
	vmyigFYULXEcWHChgWwsT6gGoGN1HuVKjrU6ycuK0dWpQlpTlMwMEpUoKnQ/gw41Fw0Fb4ydNiU
	fCp3UVuV+jZxn9BSq3ZR0c/FmCcoGl3K7M9/oGz3t1rqZPtCVTxa1jvCRr/aXUdoYGcudv8aMt2
	UHdNGBqK14M9X8kaq0ErSHZo7Ab+HZ3mH9qwWkVy5HHeHQgK73t6/3oathHsVCx8KwuHrrjAxxK
	hvaVaAjdIebMHabTqg6IK/1kW7RFPsexpiBRQy56S2VuSn76fQpSpeIu7Ms8Jg8Udxa3lfBsIP2
	sAjDMJnK/rlV/OyWur0zm5gp8lUy0VpTq04cr2aJRDJni/lB7pvCg==
X-Received: by 2002:a05:600d:8443:20b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4980c6562c5mr14351415e9.16.1785565479929;
        Fri, 31 Jul 2026 23:24:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585? ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498081a12a3sm43567995e9.8.2026.07.31.23.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:24:39 -0700 (PDT)
Message-ID: <e90714b981bce6a12f01c1a3555dc190f7c0211a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [AUH] nghttp2: upgrading to 1.70.0 SUCCEEDED
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Cc: "daniel.turull" <daniel.turull@ericsson.com>
Date: Sat, 01 Aug 2026 07:24:38 +0100
In-Reply-To: <0101019fb18e1f88-465e0adb-d4fd-4e74-882f-0dc06a073f4b-000000@us-west-2.amazonses.com>
References: 
	<0101019fb18e1f88-465e0adb-d4fd-4e74-882f-0dc06a073f4b-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242475

On Thu, 2026-07-30 at 05:45 +0000, Auto Upgrade Helper via lists.openembedd=
ed.org wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *nghttp2* to *1.70.0*=
 has Succeeded.
>=20
> Next steps:
> =C2=A0=C2=A0=C2=A0 - apply the patch: git am 0001-nghttp2-upgrade-1.69.0-=
1.70.0.patch
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
> Regards,
> The Upgrade Helper
>=20
> -- >8 --
> From 36063f945b3eb63dc4dd395bef9a587d67a22573 Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Thu, 30 Jul 2026 05:44:55 +0000
> Subject: [PATCH] nghttp2: upgrade 1.69.0 -> 1.70.0
>=20
> Source: ChangeLog
>=20
> commit 85e300c79fb6dbcfa9c1013215c8710c1c2cd3d2
> Merge: a399ab72 dedad37d
> Author:=C2=A0=C2=A0=C2=A0=C2=A0 Tatsuhiro Tsujikawa <404610+tatsuhiro-t@u=
sers.noreply.github.com>
> AuthorDate: 2026-07-29
> Commit:=C2=A0=C2=A0=C2=A0=C2=A0 GitHub <noreply@github.com>
> CommitDate: 2026-07-29
>=20
> =C2=A0=C2=A0=C2=A0 Merge pull request #2823 from nghttp2/nghttpx-reset-qu=
ic-upstream-addr-fd
>=20
> =C2=A0=C2=A0=C2=A0 nghttpx: Reset quic upstream addr fd to the current pa=
th
>=20
> commit dedad37defa9ab3c5ae818e526679c25623732e2
> AuthorDate: 2026-07-29
> CommitDate: 2026-07-29
>=20
[...]
> =C2=A0=C2=A0=C2=A0 ---
> =C2=A0=C2=A0=C2=A0 updated-dependencies:
> =C2=A0=C2=A0=C2=A0 - dependency-name: github.com/quic-go/quic-go
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependency-version: 0.61.0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependency-type: direct:production
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 update-type: version-update:semver-minor
>=20
> [Changelog truncated as it exceeds 3000 characters;
> the full changelog can be found in an attachment to the AUH email]

The changelog is interesting on this one. I ended up replacing it with:

https://github.com/nghttp2/nghttp2/releases/tag/v1.70.0

Cheers,

Richard

