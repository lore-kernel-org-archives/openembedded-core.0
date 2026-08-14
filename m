Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09052C5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 10:48:56 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10379.1786704515892351912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 03:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ggck/9rC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4813ea321cdso1305983f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 03:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786704514; x=1787309314; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EUEKAM3oIQdu0KNsOtyx7mTdq7F8qaoXFQR9ZNBcTmE=;
        b=ggck/9rCJPOKEo/EmkUpiGWonSBnBF6WPx9mGE5waGwXPn1WoSGhxen40mzxfK/hWk
         I1zy/DHTB2v4dhhQZj0fUb3WbLlwNQ8qvEzB2XlmjwPsRLHmJ7bNZpEKmpHEj3PntBPL
         chvqsqSe2ssmbli2sYa03E6p7V3gUX6SkXQSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786704514; x=1787309314;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUEKAM3oIQdu0KNsOtyx7mTdq7F8qaoXFQR9ZNBcTmE=;
        b=pyc4AIq88k9dwhMaLOmtsDsDZ2Olz5TprWqRKdAVMa/LiUf871lYn9rYQEf6yAJGSe
         aWoL7WJ2tb0KF6WzIW5cuiWBQfuPRqE/IB+wSeSoTii6S8BYEAtAMy6B8lj0wFfqN0u/
         gjwSBIgNNht38vc9m0X9Vh9OT+rZIsfm0lsbf4XbYIopnsEyNhOkKKHVK1qTzzS5KTgv
         fJLHtjnpVH1coJ8RNXHBulcn6wThpWQe8xLN86tyh9/n8vJmdXwpc0umrp563W/ztOAw
         yYc+QMMuS3iWlecnatPbDX1Ku1f4LmlPcTJzMRFSJNdSbqoUPQ1UIaBCBvyU/IBy8Mvw
         QIZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJq8Rlkk7eOx4KvPzyUhdVopRMHVHikHglMxnsxWmrwxZUveUD7wNwvfbmT8gwk3OR+T/W9u6N4eeUY4LWrQc0/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLzUbTf5uyyhscBoZlTXI0KzVyTcKsG2MuvcYJ8k/SOOz51iwy
	/rXOnOUTmC7jEpx2nxjTzmpyCgrKSTSy+vsR53KgOwtmSfRJS08RDY4Lxqhtt9Ggal0zgHBWhj8
	sVpo1lVk=
X-Gm-Gg: AR+sD10oz2N37Kt3Y8s5KbDTqMyFho5rZA6K4E5XLIS5dWWj93lfAMOjsf/ehCNGE5e
	NhYB9roBHzdupSfLieYpbrqKyL81kGL3PGNpzhQZldqI40fMCEgeGXpt8AJZJ32Q1dYHPHPbK/m
	tcRcelpv3IMCOPhMXOZNLv+g9MJsDyyUOHC3u4RUKMg9F26pNyUNqWHKA9vp3ZpbXTci5JV4+Y4
	T7LM95P8Y2JSRmpLda/EkDdSLqEJpXNmI+iNOyQGr0+B9ZgKMhbgFVQlek17q8YTBYqVC5S4u0/
	n3+avGNcEOpJCRITIauVsn1yKhwU/4CZGnXaBofKYSNc1PmKqgbuQoPhs9kxiaiUb63GVG1n5Kf
	meKAsSXKt+MRdmi4f1/mhxI9+EpmjnsC1qrAXjvSzJObanFOZu/KgL64Ie1g1sHDmB0vlViKZLX
	6CkWRTUYZ5t7ksYYGypevgxvtwSafCxfKxm4zU6y9H4e6kjCnCgeib1IuAZjtY4GBCdIPdbXeSl
	Zy5OF8znXnF7l4p3hh86PcN3w3FAQtm01o2Th9BuJ2kNeaNlPEa2Q==
X-Received: by 2002:a05:600c:ce:b0:499:7f37:cb74 with SMTP id 5b1f17b1804b1-499821546afmr151007685e9.1.1786704513982;
        Fri, 14 Aug 2026 03:48:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:9095:412f:3012:ddca? ([2001:8b0:aba:5f3c:9095:412f:3012:ddca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f2b13c3sm5867370f8f.19.2026.08.14.03.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 03:48:33 -0700 (PDT)
Message-ID: <2b6fbd07547d07ddb00539fc0bf7b8434633f26e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] lttng-modules: update from 2.15.2 to
 2.16.0-rc2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 14 Aug 2026 11:48:32 +0100
In-Reply-To: <20260814064812.1071873-2-mikko.rapeli@linaro.org>
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
	 <20260814064812.1071873-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 10:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243438

On Fri, 2026-08-14 at 09:48 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> To support kernel version 7.2. Fixes build error:
>=20
> > lttng-syscalls.c: In function 'lttng_syscall_event_enabler_create_event=
':
> > lttng-syscalls.c:612:17: error: implicit declaration of function 'strnc=
py' [-Wimplicit-function-declaration]
> > =C2=A0 612 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncpy(ev.name, desc->event_name, =
LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~
> > lttng-syscalls.c:101:1: note: include '<string.h>' or provide a declara=
tion of 'strncpy'
> > =C2=A0 100 | #include <instrumentation/syscalls/syscalls_unknown.h>
> > =C2=A0 +++ |+#include <string.h>
> > =C2=A0 101 | #undef TRACE_SYSTEM
> > lttng-syscalls.c:612:17: warning: incompatible implicit declaration of =
built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > =C2=A0 612 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncpy(ev.name, desc->event_name, =
LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~
> > lttng-syscalls.c:612:17: note: include '<string.h>' or provide a declar=
ation of 'strncpy'
> > lttng-syscalls.c:704:17: warning: incompatible implicit declaration of =
built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
> > =C2=A0 704 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncpy(ev.name, desc->event_name, =
LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~
> > lttng-syscalls.c:704:17: note: include '<string.h>' or provide a declar=
ation of 'strncpy'
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0.../{lttng-modules_2.15.2.bb =3D> lttng-modules_2.16.0-rc2.bb} | 5 =
+++--
> =C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-kernel/lttng/{lttng-modules_2.15.2.bb =3D> lttn=
g-modules_2.16.0-rc2.bb} (94%)

This probably needs to have a PV of 2.16.0~rc2 else the version sorting
when we upgrade to the release won't work...

Do we know how far off the final release is?

Cheers,

Richard

