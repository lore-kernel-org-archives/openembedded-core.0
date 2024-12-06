Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511E6E77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 10:40:30 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.34096.1733481623759534933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 02:40:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZOd1/ua4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a099ba95so19540045e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 02:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733481622; x=1734086422; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3mLOvG/0+K5t9Z3auqaJxUMYNZBHJvzmxyYdYA5SuDI=;
        b=ZOd1/ua4R3HW2Ho+PFr4E6Yr0IORD6FbHTwSdNsT2T1xHiLAHH4p3gnxGj76MLYsz4
         qPUejK3KPATaVLJB1qz+PW6HVPeCglxebflJnu4emH4MtyMrob514kGFBbWRvqnoU5+2
         AcaLyHEGapDhvCbsO8je/FC1dMAfTn7SDH32g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733481622; x=1734086422;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3mLOvG/0+K5t9Z3auqaJxUMYNZBHJvzmxyYdYA5SuDI=;
        b=Xx1s4oJRw+8fQopYdmCrfN7imJTkbcw7lRZUsPyFuIrZxcrNwHsogVS9Fhx/g6/Pem
         swVw1f5MLUehwUmnHnrraRTirj3KEz/Ws8qiwSHzqy4j9la3w6BHIGGJ629gm5W5I8FD
         bxH9R6Z76Notq13SNLISuSFPxSBhPTrC6bHdgg0My57cklOKUfm1xlS2hkMkcx0xSWb4
         DtoXLRyX3e1zU3ZYm/TX6TcGlIxGIe5979BbDMUorkg1wM+JHPtz6/0AMEePtmuPZljg
         Z6uSDSQ4iGgcYVe2N6Ox7sweG2g8pnLz7+tr4ioJj4XrbgE5QV0wbsahvsowvrwOlS3H
         6idw==
X-Forwarded-Encrypted: i=1; AJvYcCV3GGmqMPpOCYbjHtaxWMaFA8bn6BPmOGOtM2aBMiY1z7bhKul7NR8OTc3UX4j8Y2uWdMlO4wH886H9DVPOTbCa4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzXmgYXxkSQefWnzjZH9DOdUTfW02SMqMG00fHDlWjeFNZ0adOP
	rcwwHMRSzc6FPmR/BXnun+MWgPavjRYNYae2oDOioV/CQ/I3w2YwzNzbmUjQDwnHrTi6HSNWAMK
	p
X-Gm-Gg: ASbGnctik4ZSiZQiHQw1aY/U5cw68CCPDcU0slgrsCdP2pxLTzGZwjsLhpFQdPln37h
	hZ5FdLzbXsJcPFnYqF1PmDmVAicgmU9ZQl33EeS2ojQ0EnCOH2I2i8Tel1sSOVF/ZzjKVVUlJL/
	KT0B0jtpfStxEV+Z+78B+eYVV/p8acE5sU5Nx68CGWW6RCfRc+TKV0Ca+3ChSRWUkrjB5uRuIAr
	EjS0xfKyyMa8zXFwt3kI3TIsp8H8Hvrc8ltYFms69LLdhNb4d87MCM4MIB+cNBjedFLn5+0x0sH
	3IeyhmnTRDXnzmOPWiAJX0fAcY0+wFsUBnfff2U=
X-Google-Smtp-Source: AGHT+IF9WshO9nAsknh8RGzipPEJkKT+RE5HMU4QTB0xa5AxBXKITibJ6PfT9rhx6PxBvnB5yNuBVQ==
X-Received: by 2002:a05:6000:481e:b0:385:fb8d:8658 with SMTP id ffacd0b85a97d-3862b3b58cfmr1834749f8f.40.1733481621792;
        Fri, 06 Dec 2024 02:40:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7cbf:88df:d5a4:1257? ([2001:8b0:aba:5f3c:7cbf:88df:d5a4:1257])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59cedfsm4262423f8f.28.2024.12.06.02.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 02:40:21 -0800 (PST)
Message-ID: <dc94ff4219543832f6839246f4220a2299d8471b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base.bbclass: fix RRECOMMENDS extend issue
 for multilib
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Fri, 06 Dec 2024 10:40:20 +0000
In-Reply-To: <20241206084550.2424753-1-changqing.li@windriver.com>
References: <20241206084550.2424753-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 10:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208418

On Fri, 2024-12-06 at 16:45 +0800, Changqing Li via lists.openembedded.org =
wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> After following commit in meta-oe,
> [fe3ba7ac5c cryptsetup: demote udev runtime dependency to recommendation]
>=20
> bitbake lib32-cryptsetup will failed with error:
> ERROR: QA Issue: lib32-cryptsetup package lib32-cryptsetup - suspicious v=
alues 'udev lvm2' in RRECOMMENDS [multilib]
>=20
> This is because RRECOMMENDS is not extended with mlprefix, with
> this fix, RRECOMMENDS:lib32-cryptsetup is corrected.
>=20
> Without this fix:
> RRECOMMENDS:lib32-cryptsetup=3D"kernel-module-aes-generic kernel-module-c=
bc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic ke=
rnel-module-xts udev lvm2"
> Whith this fix:
> RRECOMMENDS:lib32-cryptsetup=3D"kernel-module-aes-generic kernel-module-c=
bc kernel-module-dm-crypt kernel-module-md5 kernel-module-sha256-generic ke=
rnel-module-xts lib32-udev lib32-lvm2"
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0meta/classes-global/base.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index b81e61fdb7..3aaabb67e9 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -471,7 +471,7 @@ python () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def appendVar(varname, a=
ppends):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if not appends:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if va=
rname.find("DEPENDS") !=3D -1:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if va=
rname.find("DEPENDS") !=3D -1 or varname.find("RRECOMMENDS") !=3D -1:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if bb.data.inherits_class('nativesdk', d) or bb.da=
ta.inherits_class('cross-canadian', d) :
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 appends =3D expandFilter(a=
ppends, "", "nativesdk-")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 elif bb.data.inherits_class('native', d):

When proposing a change like this to something as core as base.bbclass,
you need to explain why the issue is occurring and why it hasn't been
seen before.

I couldn't see why this was a special case until I opened up
base.bbclass locally, then I see that appendVar is in the PACKAGECONFIG
processing block and that at least then lets me guess at the issue. I'm
going to guess that these RRECOMMENDS are being added by some
PACKAGECONFIG code.=C2=A0The commit message should mention that!

appendVar is called in the form:

        appendVar('DEPENDS', extradeps)
        appendVar('RDEPENDS:${PN}', extrardeps)
        appendVar('RRECOMMENDS:${PN}', extrarrecs)
        appendVar('PACKAGECONFIG_CONFARGS', extraconf)

so there are a specific list of entries being processed and you're
expanding that condition to include another of the cases.

I'd note that ".find() !=3D -1" is old python and
varname.startswith("RRECOMMENDS") would be much nicer in modern code.

Cheers,

Richard




