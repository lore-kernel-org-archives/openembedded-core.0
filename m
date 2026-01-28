Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F2ED25B46
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 11:32:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11020.1769599951060823965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 03:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fRQGnjwz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4806bf03573so7450765e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 03:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1769599949; x=1770204749; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P008Ui2W44lGAZaE5bgvCLgCPYz2tgKDoHBEfSgU634=;
        b=fRQGnjwzHjz1+hBSd6qk/MJYrs+Xvo/nQpLryL64+0U8/GAQ/20y6q5jMHudZKzwwQ
         KTmCGGojUK9uLcsT3OVTe+55QIqKJB0hZ39qtWskKg+EpXWtU+R9ZoocTaeQ0CBdSeI4
         ku1EovUEYqaopaZpn5rjl+SlBZ1ktCCrbuT5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599949; x=1770204749;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P008Ui2W44lGAZaE5bgvCLgCPYz2tgKDoHBEfSgU634=;
        b=FAoJ8NsLn5JnoRmfAP6yd7Pmoln+cdyqmN0qR2A7uazaOOEWjdORbf0wokuwsGg/mZ
         u9SqEfwe/0toEXYQPbGr3a7eHg52CX8sa/wv7GFnVLh5Ek81ad002Z91WLdqO7kag3gg
         mEwf6t8y5rdFKrpMxQOQGNhegjlkxVeCg3Cc4zIDPLye9vUctyetE3rL0VFmVeMeaA+T
         br+EyBBmLV/YWaRPD/MBeTG1yX7sCAd1nmhDqmjs5E7X1vX67AwH1n3betE+miG/Ez6L
         u1kOe9uM5NAFRoljYOr615orsL8eiJNFdeEXujluPhAdVTVQ1Q9YjCiXi29KMgsEj5Sf
         gCyw==
X-Forwarded-Encrypted: i=1; AJvYcCXPBmoBSaLCHQo+7ji/m6bTd5mfemsm+cs2bFXalCEHsx5L9FB+HbAIDHJ0bPwZV+qG2kT6k+N6vWlt3nyByqDUiw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywnvfn83VrjMmet/SUaGlMGnxCeoXMXpvaJVibwKMgWXXxvtb87
	dowrVX0fE1ZnftPqd0jqtKM3SM34GJssFGhCaVNJcY8JD1ecTheYWfoPgQYJlictzgY=
X-Gm-Gg: AZuq6aIsGIJ4gjEsPeTIRN9MFdz2Tuf3hX1dNiwZh3+ciOluzMA3xAONJhcUCKzyXSo
	fsElwxbSFzlkJslqzsuGvziqHtGJ8YaEHNiFEnR0VTBN4WZspE0U6T5z+ekvVQF388Xo8IK5Xw5
	GyOPrEFkvjySvfecN8ldTauQQ3U7pPOiPrH3Q4g3MXa+FArV3SxRojmtChVQZUupfYN5ArdNON0
	TYA3TrMpFl2L9v0rI3iSBoBC5iKdz+pWRPnw6Hhhghqvjsmz2ij8lUd7tVrKmf9V3Mauon4MlSI
	4Tb+y9ZiL2bN8Dirv9pix/rsJhxyxL6GvLcqU78lwB2w6Q3hsVjL3EFQyVnGZyCBMBu2tnrL2aW
	waasAaBYOrhu0jZ72I5lcmBqhvcB662MAwATQ6o+AQpTUzw5FMmNfFK5bc6rgLGSY5ytcakrOW9
	MDXaiw2JK/oo/24ElyKYg6VjFboN27HBkuKc9b9Q==
X-Received: by 2002:a05:600c:37cc:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-48069c86407mr65347245e9.24.1769599949276;
        Wed, 28 Jan 2026 03:32:29 -0800 (PST)
Received: from [172.27.246.141] ([212.187.182.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806e28fda1sm4895625e9.4.2026.01.28.03.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:32:28 -0800 (PST)
Message-ID: <9b4c9e13e430e3cbf0a45fe15b5a361b63a2b250.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3] procps: support ptest when TCLIBC is glibc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2026 11:32:26 +0000
In-Reply-To: <20260127085808.1980602-1-changqing.li@windriver.com>
References: <48503D06-1C65-407A-8EE8-B2E5099C797C@arm.com>
	 <20260127085808.1980602-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 11:32:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230089

On Tue, 2026-01-27 at 16:58 +0800, Changqing Li via lists.openembedded.org =
wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> * support ptest for procps TCLIBC is glibc. The configure.ac only match
> =C2=A0 LINUX as "linux-gnu", we can patch it to make test can run on musl=
 lib
> system, but the upstream testsuite should only run on gnu libc host,
> some test cases only suitable for glibc, eg: Some of the error messages
> for free command on musl system is not the same as glibc system, which
> will make test failed. In order to avoid some other unexpected failure,
> just support ptest for glibc.
>=20
> * procps's testsuite use DejaGnu test framework.=C2=A0 The testsuite is
> =C2=A0 expected to run during build time, this implementation create the =
same
> folder structure as the testsuite expected to make it can work well.
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0.../distro/include/ptest-packagelists.inc=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 +
> =C2=A0meta/recipes-extended/procps/procps/run-ptest | 24 ++++++++
> =C2=A0meta/recipes-extended/procps/procps_4.0.5.bb=C2=A0 | 57 +++++++++++=
+++++++-
> =C2=A03 files changed, 81 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 meta/recipes-extended/procps/procps/run-ptest

This might trigger a ptest warning:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2990

Cheers,

Richard

