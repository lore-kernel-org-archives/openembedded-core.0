Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E497C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 21:17:37 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.659.1787347054711923129
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 14:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VILbH8Iu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4957eefd361so10095365e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 14:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787347053; x=1787951853; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nJWJdl+1kG2tQUPTxDiZNnYyDkYGSp2VR1vdzP8IFsY=;
        b=VILbH8IuCC0yZBqwgNoHLyABqiFEfY0l62evFC4MjV+KEulqBA4pN3I77Nd8Wdbfs1
         cFSII2Kf4wRELK8hnh7/s0TnRKbqe7D+/A5wCscV5rUPWnsJuwb7S+UT8KmijU6ZJLm/
         Y+llsDjrwQw3M+1RIpEZFbhrMi6nZ7JDRJM/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787347053; x=1787951853;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJWJdl+1kG2tQUPTxDiZNnYyDkYGSp2VR1vdzP8IFsY=;
        b=kV7x3QgPDBcU0F4PH9v+qdm3lVQWef6EtAp0CshBBIWWM2BOfl57fMdtVh7Yd2l6do
         qRrrNTYl68fFXpEp5rLZgRDziPDmPf6cmgM13zHztbBHfPASNnWO/trEMMTHQecbbBg3
         X8SzSnUEYxQgpzDbpMkvbWBqU+ytCYz493X09yni5sXgMhixwOJNeZPZkLHijigfqrwA
         qOynuHL6wwvj+WVo5UJNySFglh4QkWKyxnxl1B9qCVaUjfxLeJu1y7RY7l44ZZhlSlT8
         +FxIolGjbebsbt58B2TE1j214qsFeN17GFec2t6YI85o8IGZEyYMyLORJ81B+gU43+1W
         c1Yw==
X-Forwarded-Encrypted: i=1; AHgh+RowOqwaQOAPg1CVN45OacnmTIM3iBqq+PHS9Uij6+HquJc5c4/sV7qWGwe91ort/6LHmG4eQeJN7cFTIKuDj4d/bg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mN98qWGm8Xx5p/DnvH/WG1BPYcOltHrP0AQkxRxsJniwV5mpXr
	sj0LJ0Cm3gz2qGefkmGS76M6DyOAvj9C3A1m/A1F/dAsBRP0VNRkyLgwNycfnf8NZbM=
X-Gm-Gg: AR+sD13J/UEmIx+sxEr6qpmA13BpAAmEDel7AGWxsr6wTL8azKg73aJVCUoYWEPB96h
	Q1u2lwqP0SueybwS7Bo03o3UbK4mwrX7Bt5qNt2mPk0FaQwNl4e5BQpxNlH/7JsndSwJMKZyhaH
	rDsI1gPcczzFsSM7w4jScQ44wIfWoPBozrkoWPBSzLT1C42RDuzsqRXa0XZgldiqbd/JaAMC3em
	PFyPGeonQ0r9Muk+M3ik5b6+KYPiWqZ/I3HTyJ5w4juuBNXrFzpgErqI9hDO0zVU4BBSx9JkLtE
	QICddz4naQpQPfsTKrTq47+IvOyY/42YYu78RCq3M33tC/ZpUeyOxPisj/I3xT/W+rGPbqLpatK
	1BUFMmP5IsPgEAut/Uhyh1gJ56VlDcC6xKpGrHHhZhuh78BXdA9p09j0z8gZxsVSXXIwfGkpmnH
	5W+WpUNwwjPcX6/aGrYLgJ1tjDwfdoV20Eos6pUyasKNA68GN/WhDDyl26Fl/wwfqpql9KoU3K5
	gckdJ4KLn8Ljbv1WYKuKHQxtKc4l5kr5Fh872tmHLu8uE969G1LDQ==
X-Received: by 2002:a05:600c:4704:b0:499:9069:c2c9 with SMTP id 5b1f17b1804b1-499b84613fcmr119364355e9.11.1787347052881;
        Fri, 21 Aug 2026 14:17:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030? ([2001:8b0:aba:5f3c:e5fd:eed9:eff8:d030])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b78eb4sm121656f8f.13.2026.08.21.14.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 14:17:31 -0700 (PDT)
Message-ID: <9a98b9099e927565c0ed867b7598ccea9afdbfe4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC v2 0/6] openssl: upgrade to 4.0.1 and fix
 dependent recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
Date: Fri, 21 Aug 2026 22:17:29 +0100
In-Reply-To: <20260820181022.44434-1-jaipaul.cheernam@est.tech>
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech>
	 <20260820181022.44434-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 21:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243955

On Thu, 2026-08-20 at 20:10 +0200, Jaipaul Cheernam via lists.openembedded.=
org wrote:
> This series upgrades OpenSSL from 3.5.7 to 4.0.1 and fixes all
> dependent recipes that break due to API changes in OpenSSL 4.0.
>=20
> Changes since v1:
> - u-boot: moved patch from u-boot-tools_2026.07.bb to u-boot-common.inc
> =C2=A0 so it applies to both u-boot and u-boot-tools (fixes riscv64 build
> =C2=A0 failure reported from autobuilder)
> - u-boot, kea: corrected Upstream-Status from Backport to Submitted
> =C2=A0 (neither has been merged upstream yet)
> - Dropped rust 1.97.1 from this series (now merged in master)
> - No external dependencies =E2=80=94 wpa-supplicant 2.12 and rust 1.97.1
> =C2=A0 are both merged in master now
>=20
> OpenSSL 4.0 is a major release with several breaking changes:
> - ENGINE API fully removed
> - SSLv3 support removed
> - Per-version TLS method functions (SSLv3_method etc.) removed
> - ASN1_STRING made opaque
> - const qualifiers added to X509 getter functions
>=20
> Patches:
> =C2=A0 1/6 openssl: upgrade 3.5.7 -> 4.0.1
> =C2=A0 2/6 python3: backport OpenSSL 4.0 support (CPython commit 3364e7e6=
2fa2)
> =C2=A0 3/6 socat: fix ASN1_STRING opaque struct access
> =C2=A0 4/6 serf: fix ASN1_STRING opaque struct access
> =C2=A0 5/6 u-boot: backport Provider API (replaces removed ENGINE API)
> =C2=A0 6/6 kea: add const qualifiers to X509 pointers
>=20
> Testing:
> - bitbake world -k: passes on qemux86-64, qemuarm64, qemuarm, qemuriscv64
> - openssl ptest on qemux86-64: 362 files, 4310 tests, all passed
> =C2=A0 (338 passed, 24 skipped - fips/lms/rc5/tfo/compression - all expec=
ted)
>=20
> Sharing this to get feedback and see if there are other recipes that
> break with OpenSSL 4.0 that we may have missed.
>=20
> Notes on upstream status:
> - python3: fix on CPython main, backport PR #146403 closed without merge
> - socat: submitted to socat@dest-unreach.org
> - serf: fix in trunk (r1935023), no release yet
> - u-boot: PR #918 open since March 2026, under review
> - kea: tracked as issue #4673, milestone kea3.3.2
>=20
> Jaipaul Cheernam (6):
> =C2=A0 openssl: upgrade 3.5.7 -> 4.0.1
> =C2=A0 python3: backport OpenSSL 4.0 support from upstream
> =C2=A0 socat: fix build with OpenSSL 4.0
> =C2=A0 serf: fix build with OpenSSL 4.0
> =C2=A0 u-boot: fix build with OpenSSL 4.0
> =C2=A0 kea: fix build with OpenSSL 4.0

Thanks for putting this together. It is definitely getting there but
there were some issues.

There are some failing selftests:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4629
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4449

and python ptest doesn't look happy:


https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4352
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1004

and multilib looks broken:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/4423
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4476

Nothing too unexpected with a change that invasive though!

Cheers,

Richard

