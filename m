Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F5CCD13CF
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 09:07:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.34630.1725268048557222674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 02:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rt1BypNt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bb8cf8a5bso29921245e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725268047; x=1725872847; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+vpbBgPCs67vNRl/L61RX9txtqbC9YjG/a+Dwx5qD/A=;
        b=Rt1BypNtSox5jhmXmDCM3k6Oc0CPHUD/NEdyGozViaDT/Zt2QAswX9kWqtP3MIcRqr
         0b1GMqkbn17DgButm6CCE2Cl2466HNyvRsc6BPGzmL55b7FGJIPoVvJsibjXd+My6dz/
         lySzE5qmsTTH2x6dns6FosLVBhfejILZ9swrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725268047; x=1725872847;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vpbBgPCs67vNRl/L61RX9txtqbC9YjG/a+Dwx5qD/A=;
        b=KmLReEMDzEAGeOXS3cqqelizLtzS7P6jepOjVaojaVSu7OCRzaZXRJKP8Au/R0sMNA
         I6o0VW+6TYnGCIwlEgcCqJTdB5HgoYMWtY7Ozz9Bi84ihrlptO1rNWHVpjWFinJBiPPI
         2+BdxSQA70NOFuB5z9U0IoYzU+vHmLll3SYSy7RQi+4U5UJl7MOs4HPRnRNUL7caZr1P
         SknO7SqCIG1TMt1XhwsN+1RQsSVf4I5xtGS96B1F2SnBepAVpiEkWFYZR+dysw+7NEub
         WGYmVvlxOYSHpWa3EODGeXMunQ1RMSBdqUzZH8XSWrAqHhMueBGApeXvmz+yMDDOSxiQ
         XCKw==
X-Forwarded-Encrypted: i=1; AJvYcCWuzoaNWSQoJ7Jqy++mglwFWPNeJkDiDkHBnDqcFnpd+tmQ/7mKlOyPB7urOak8ET/xKEfbfAvKfKTQyEFVahKMmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzewBSGVufu9xHr5twp4KS3QrbYAVoACdnJQ0jiEO2pNCYR+bBU
	VqvErV0d4YvEZqJ7cdWZAPOO0Ah4pOsteQLXs9DP06GyQ0hlAQvDIv8iOiOhLL8=
X-Google-Smtp-Source: AGHT+IHmFsAET8Be3v2y6xXbHuX2mtlFxbk9s9s713pqdEabp1AfSdbXW+TsETJLNYc/UVWvWuklPg==
X-Received: by 2002:a05:600c:1ca1:b0:426:6667:bbbe with SMTP id 5b1f17b1804b1-42c82f531efmr21179875e9.9.1725268046679;
        Mon, 02 Sep 2024 02:07:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d? ([2001:8b0:aba:5f3c:ed45:1ec7:2c83:ff6d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df84b9sm130882475e9.24.2024.09.02.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 02:07:26 -0700 (PDT)
Message-ID: <bd31fb7301b3ebb5c8dcedbe29ef30aab1d99a21.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc-sanitizers: Add ptest support for
 AddressSanitizer tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Mon, 02 Sep 2024 10:07:25 +0100
In-Reply-To: <20240902073918.490722-1-Deepthi.Hemraj@windriver.com>
References: <20240902073918.490722-1-Deepthi.Hemraj@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 09:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204063

On Mon, 2024-09-02 at 00:39 -0700, Hemraj, Deepthi via lists.openembedded.o=
rg wrote:
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>=20
> [YOCTO #15338]
> Enabled ptest integration in gcc-sanitizers.inc to facilitate the proper =
testing and execution of address sanitizer (ASan)
>=20
> Defined the do_check task to execute ASan tests with proper environment s=
etup and updated do_install_ptest_base to copy ASan test executables to the=
 ptest directory. Included the run-ptest script to automate test execution.
>=20
> The run-ptest script iterates through executable files copied from the ho=
st, runs each on the target, and logs the outcomes as either 'PASS' or 'XFA=
IL'. XFAIL is because these tests are expected to fail on the host system a=
s per dejagnu as { dg-shouldfail "asan" }
>=20
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
> =C2=A0.../distro/include/ptest-packagelists.inc=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 1 +
> =C2=A0meta/recipes-devtools/gcc/gcc-14.2.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A0meta/recipes-devtools/gcc/gcc-sanitizers.inc=C2=A0 | 43 +++++++++++=
+++++
> =C2=A0meta/recipes-devtools/gcc/gcc/asan-exp.patch=C2=A0 | 51 +++++++++++=
++++++++
> =C2=A0meta/recipes-devtools/gcc/gcc/run-ptest=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 28 ++++++++++
> =C2=A05 files changed, 125 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/asan-exp.patch
> =C2=A0create mode 100755 meta/recipes-devtools/gcc/gcc/run-ptest

Would it make more sense to run this as part of the other gcc testsuites?

It looks like there is a lot of duplication in these changes including
a lot of ptest code.

I'm also quite concerned at the buildpaths exceptions, build paths
would be pointless in target packages so I'm not sure why those are
present.

Cheers,

Richard

