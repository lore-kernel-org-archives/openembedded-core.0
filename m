Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBF5C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 19:18:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20209.1787771880135703688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 12:18:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X1MSyuEM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so1050731f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 12:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787771878; x=1788376678; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qy4+Pg/mQkrw6CaT31t21Q6+Pq4Cmtw/WpMjUDdn0Tg=;
        b=X1MSyuEMquaqaSogRQIUkCRbVEWRHOHT9oew7F/KQ/36AcCScdwXZ3HnzfCL7/NxSC
         OC2JAdKkF+jvuZPLsngit50AcJGp0WchXiRpW3mwRyuRVzgNSoiXbGqa95i7DdlPQbua
         ST/igBVA2dLb2HiEUmLCx8VCH00NpzOrWNSsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787771878; x=1788376678;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qy4+Pg/mQkrw6CaT31t21Q6+Pq4Cmtw/WpMjUDdn0Tg=;
        b=kFPkzQxVeBQ2Bja5586I0BS3lMKfbxAxIvGv6V0U5NysH+tA90aD0ouRy0VHGnvlJf
         sTmMP+zIpO1dowoNWQTN8h4C0AX+7c0qfqqW3JccMEdHL+VZfH4wFWs2vgbX3PYJg6+n
         wh/M0HeLQLb1FBma9t8x1X4Uk2tu2/ty+e6P9YTrJzty1XsbWlKvJ1zayLNJPZRPlL2A
         0tML14pb7cdqFzy/nHX+OdB5l46j6iCQRvxmXkeyma1v4jOjCjbMtWlFAyJqsyn4juF6
         KhmgP7gSZ3xrUD65US7tcrdWeWDSSz10cZevt/2JRMtcWLKT7SFGw45ztibnOuhc0dpy
         UD+g==
X-Forwarded-Encrypted: i=1; AHgh+RpOxCphBeEuCSgyqz2cstZEzNeNYeC6PKfrkhguuVgiGKgculugv1erHMJl1+9jhFoVLFMPCVKSvZQI09k3GZEx6w==@lists.openembedded.org
X-Gm-Message-State: AFuF++mamM288Z2ZWj6tdy1Roas+ye/ypJRntQZ4qOKQFDTeiaYcAksg
	YGR6UmPyMGRopfY4zpbhVB6u/3Tcr1DomqxGI2in1eOxWI7pMvlkZp0kWK5OKgLboGQ=
X-Gm-Gg: AR+sD11RBb+Dv1uUw55CeEZoJBJr9BhC0ZEPpsMoPUNj8oVjyQWGA3gAQsUf820Q5M0
	lYNlrF/VsfbzXb6MrtUlp0sCOu44o1uUz6Vc9zZrdiLIgMGsNmnScvsQY1cYnzSPxMLgDa9NE75
	x7qcY9cqk3UX55xs/O36x+zcnR8FAB+T/T8BcZXzPVO7Pdp6TlIDLo8WzzC29zzo7FiuFPlssaa
	Lx3NbAXbxsfufLqzgVbzliPjwCZNEcvvr20m/cAU5hX6SYW6RyNAyPf6WEZQ7i6bcaywBU1KLEv
	7qD45meckcTLXxTyALdIJijxxqB2jWeDDryuRrhKFL8Cz7V3wagLSXXhidAiGPTtd2YbKTwntdv
	Vt+k+IPKji3W+/bhLOe3WUfipho1HoBd5o2QEqny8jzY5XVZNVtpqgl+RlFAQ1KvU0piMz2pm42
	Y+ENPi2nTk0XK9AHdJOKgjpr9JD6SHpdE4Q0VcI5hm4CI5TQcD2dYt2v7LaA+bgPr4dDye+nswE
	OCm1Aw7GZshRB1zxFuoc5/5ENG+ur4pnHyky6qgqtyTrDvRYXWo2g==
X-Received: by 2002:a05:600c:8a09:20b0:49b:12c2:104f with SMTP id 5b1f17b1804b1-49b12c21164mr1854305e9.1.1787771878087;
        Wed, 26 Aug 2026 12:17:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e581:1e52:aeaa:4925? ([2001:8b0:aba:5f3c:e581:1e52:aeaa:4925])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca9fc48sm35095055e9.8.2026.08.26.12.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 12:17:57 -0700 (PDT)
Message-ID: <fac01045131c56332854097dc98f0744a0e5ee5a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] rust: Avoid passing host-specific
 information to crates Strict Version Hash
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: SunilKumar.Dora@windriver.com, openembedded-core@lists.openembedded.org,
  Alejandro Hernandez Samaniego	 <alhe@linux.microsoft.com>
Date: Wed, 26 Aug 2026 20:17:56 +0100
In-Reply-To: <2326647.1787768749336187635@lists.openembedded.org>
References: <20260826155417.2774608-1-alhe@linux.microsoft.com>
	 <2326647.1787768749336187635@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 19:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244412

On Wed, 2026-08-26 at 11:25 -0700, Dora, Sunil Kumar via lists.openembedded=
.org wrote:
> Hi Alejandro,
>=20
> Thanks for chasing this one down. Small notes on v3:
>=20
> The commit is tagged [YOCTO #15554], but that bug is "reproducibility
> failures with 'rustdoc' on rust 1.75" (path-length dependent), RESOLVED F=
IXED
> since 2024-08-01 via codegen-units=3D1 / lto=3Doff.
>=20
> What you describe here - artifacts differing by build host arch, causing
> cross-architecture sstate matches - looks like:
>=20
> =C2=A0 [YOCTO #16376] AB-INT: build system architecture reproducibility i=
ssue
> =C2=A0 https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16376
>=20
> which is still open. Could you retag it in v4, unless you had a reason to
> point at 15554 that I'm missing?
> ---
> One pointer that may or may not be relevant: the 1.97.1 upgrade (65271a5d=
3b)
> carries an LLVM backport:
>=20
> =C2=A0 0043-LoopUnroll-Iterate-exit-fold-candidates-in-determini.patch
>=20
> added for a repro issue seen with rust 1.97.0. I haven't looked at whethe=
r it
> interacts with the SVH path at all - just flagging it in case it's useful=
 context.

I put v3 in for testing on the autobuilder and it looks promising, there ar=
e some rust test suite failures though:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/28/builds/4472
https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/4577

and probably more to follow. We may need to exclude those tests?

I also triggered the reproducibility test targets:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/121/builds/3
https://autobuilder.yoctoproject.org/valkyrie/#/builders/119/builds/3
https://autobuilder.yoctoproject.org/valkyrie/#/builders/120/builds/3

those builds are ongoing.

Cheers,

Richard

