Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F014C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 11:13:44 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.7365.1699096415914860564
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 04 Nov 2023 04:13:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iKyB3BOX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.178, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c5056059e0so41177351fa.3
        for <Openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 04:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699096414; x=1699701214; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MNm7PIeKpEaIp+l/eQip1MbqryPPp1V/0YyOVQLx1ig=;
        b=iKyB3BOX56pCQrp8pdia7sauPOXrLeeC205gQlTnBSewMzCNf9SuIdIBKJcbI2Enh3
         YwprqpFwIAC3K6lRw634s8b5tatXt4c8Vx05rRNwqelfzppZUSmyur87MNttHudHJatQ
         YpWgRgZnAQSc6juTDGLbtLxXzTTAxQ1x7uA1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699096414; x=1699701214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MNm7PIeKpEaIp+l/eQip1MbqryPPp1V/0YyOVQLx1ig=;
        b=MdcPL4XomvaQx5Leys4hGuhC/NFQTaPhGJ9u6uraGu3s1plKVT5iUILHNmsrdLVkiF
         oHV/ot5G9z7K+pzsjBOcySEHXO5jL9dZdkdO7QsDpUlvnJ/TGpCFNMDrkvax51mTbMdg
         k5BohGO/KFLBSx5GzWMQYy3PsSWR+CjQ8ZHypTsxLBtMr4Kg3EeZorng2BJ7PvMz1Zfw
         Rk2QaSucq1x69i+edF/ygPivJbfJ5qASPmrnCgsNiJXH1WLANilFfaSo1bQo7K1YCRfm
         z/HOFXi8RnQ4LHjYFUOWtBA7w+j2d5QntSad9agswIVOoM7OoQ0rUGSb+qXVDnELIsRS
         gGlw==
X-Gm-Message-State: AOJu0YxCCdoEHoZxI2FwY8+gKdI1iQ4dMRrNnazl8lCcxj5nFgV0n7ep
	L6B9SJP7wJAvJjLZRS0XApFAhFO9H82k+HjmOt8=
X-Google-Smtp-Source: AGHT+IFjIOZQuOUEBpHzE6qhBiMu7nAY7m3KrSzUYU1EV5S8R4ugs5wjGKevLle7KCxW7JWXAdyZ6w==
X-Received: by 2002:a05:651c:200c:b0:2c5:2d7:412 with SMTP id s12-20020a05651c200c00b002c502d70412mr16072381ljo.19.1699096413863;
        Sat, 04 Nov 2023 04:13:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7cfb:21f7:ac1a:8b7c? ([2001:8b0:aba:5f3c:7cfb:21f7:ac1a:8b7c])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b004053e9276easm5305306wmi.32.2023.11.04.04.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Nov 2023 04:13:33 -0700 (PDT)
Message-ID: <eee499bd9c5445eeae353677ed3d9611a046845a.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] scripts/resulttool: group all regressions in
 regression report
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Sat, 04 Nov 2023 11:13:32 +0000
In-Reply-To: <20231103205018.19693-1-alexis.lothore@bootlin.com>
References: <20231103205018.19693-1-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Nov 2023 11:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190172

On Fri, 2023-11-03 at 13:50 -0700, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> From: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
>=20
> Commit c304fcbe0588b1078373558c2ddf36064bcdf214 introduced a grouping whe=
n
> listing regressions. This grouping has been added only for ptests. It has
> been observed that any other kind of tests could benefit from it. For
> example, current regression reports can show the following:
>=20
> 1 regression(s) for oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash
>     oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash: PASSED -> SKIPP=
ED
> 1 regression(s) for oescripts.OEPybootchartguyTests.test_pybootchartguy_h=
elp
>     oescripts.OEPybootchartguyTests.test_pybootchartguy_help: PASSED -> S=
KIPPED
> 1 regression(s) for oescripts.OEPybootchartguyTests.test_pybootchartguy_t=
o_generate_build_pdf_output
>     oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build=
_pdf_output: PASSED -> SKIPPED
> 1 regression(s) for oescripts.OEPybootchartguyTests.test_pybootchartguy_t=
o_generate_build_png_output
>     oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build=
_png_output: PASSED -> SKIPPED
> 1 regression(s) for oescripts.OEPybootchartguyTests.test_pybootchartguy_t=
o_generate_build_svg_output
>     oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build=
_svg_output: PASSED -> SKIPPED
> [...]
>=20
> This output is not so useful in its current state and should be grouped p=
er
> test type too.
> Enable grouping for all kind of tests, to make it llok like the following
> in reports:
> 5 regression(s) for oescripts
>     oescripts.OEGitproxyTests.test_oegitproxy_proxy_dash: PASSED -> SKIPP=
ED
>     oescripts.OEPybootchartguyTests.test_pybootchartguy_help: PASSED -> S=
KIPPED
>     oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build=
_pdf_output: PASSED -> SKIPPED
>     oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build=
_png_output: PASSED -> SKIPPED
>     oescripts.OEPybootchartguyTests.test_pybootchartguy_to_generate_build=
_svg_output: PASSED -> SKIPPED
>=20

Do you have a different example? This one is tricky as I happen to know
that test depends on the host distro and the things available there.
There are some distros it will pass on, there are some where it is
always skipped. There was a recipetool test added recently which will
do something similar depending upon host python version.

The challenge is we run the test on different host distros so it is
hard to see it as a regression. I don't know what we can do to make
this "clear" to the report reader...

The patch is probably ok as it doesn't make the output worse but it has
probably already obfuscated things a bit.

Cheers,

Richard

