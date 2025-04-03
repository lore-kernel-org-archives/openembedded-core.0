Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4C7C3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 10:11:00 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.9901.1743675059212541067
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 03:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gsaejozU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ac9aea656so611096f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 03:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743675057; x=1744279857; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TQc2xqQURGWU97KGb++5Ue06DN7TFLqKk7nMYZKUosw=;
        b=gsaejozUhPtOGQtMzUF/dfM+WgUAlqAXbd08+9cMlhWrwBPvJlNICe2Gq0L6RDlYgE
         CmgnKeFwYiA1M/hxFKgV7g3YwBoKtN61xKeakoRQYSfYJxGUuTrffmJ3peiCJ7b4KhsD
         s4NbyFGXO0n0wmEf51FGge7cdwU5tOyuYr+r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743675057; x=1744279857;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQc2xqQURGWU97KGb++5Ue06DN7TFLqKk7nMYZKUosw=;
        b=wB0tiNaw7qJizeRW0eTWU53joxYog2qh35ztFPg8EckQO8IN0vDQm1RFW9g6+BwJB2
         o/g6MGQl+if3nnGOuD+jvy1myTsIU7zqhdiArXpXml9D5zDH/1IBEqbOjyTF2H9ZEap0
         CPS5d0bbLkfhSZDQpfflrmcUklX1DapIfNyYUutIYJs4GOc20NuJIjWR5zpxs5YUpC2U
         aaai7+sCpBLZAanCJIAmFeR9hVRSlxEDtfR2x8lXQyCmKpNLIltVr5CV67yxy63TCfsu
         zWINDR1kaGYpdBDsPV0QNjsvc6lb2yZXaGpki9kDuieFmVrjkUBBMBJ0l1UyisHaiZ+1
         8aWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWB21esoE+VfnK0uTSeQ7pbc4AdrZ6mx0weO2+3QjA+W8V4uYplB0a/oFJAL7wwoldBR9s49zCz92IVFmjn1orN9Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw7I02UaweKJ9Na7n7fKcc32CnkfwVYUChbQwcMtv7ej0yvkWYh
	uXp7m1iQVdn6Kc3RuJBWJwUTGd3VsOnVEqk/e35B3vmQKECC0tfpotMKiUgMiZw=
X-Gm-Gg: ASbGncuif78VvVnE3psn7BHWwnMhikX5EuFezYwp3iwSTNA4LDn4LmJcQeNQRfnv05j
	4IFIfrRxH2uTVY2YkTgrJCLVqe2YTp2esc+s/8txCA0kqAv8duztvpyq/TMMfQbP59qukkcTRXy
	VXUuSRmPq61QXTfLPJrYs9ben/pRFXjVNxnSUQ1PmJT6I9vIuNuCHcPBE7jQ94iTJK8Kmp6qaNA
	Red6LDxeBmObqCbj8/9mNc773Fqr7b67jo7HK6zj+x1NUvsKi5oPAH/IF+NhE9FC93qLRAx6+dH
	ic7Kob4/2VzSumDHj4AO5jYGLIvy66haebQUsIMst5ZYOtTmEwtKaTup0OP+vkyhzVcxhgD56I4
	Aoyw/uKverVfK1MvRcbpOWYnwMbJI2RI63Q==
X-Google-Smtp-Source: AGHT+IGIUMCgNzV6N68Uuh0vZuirYoJx7NrYNGqKXVod0Nec80jYmc4E+Ruvatfb8Y0dqi+X4cXRcg==
X-Received: by 2002:a05:6000:2483:b0:39c:142a:ed6c with SMTP id ffacd0b85a97d-39c142aed73mr16519042f8f.40.1743675057502;
        Thu, 03 Apr 2025 03:10:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270? ([2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec17b0d06sm17115205e9.35.2025.04.03.03.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:10:56 -0700 (PDT)
Message-ID: <6c36d9830745cb739f1dcb968d74a43395117fa1.camel@linuxfoundation.org>
Subject: Re: [scarthgap] multilib_header class: issue with custom multilib
 setup
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, Khem Raj
 <raj.khem@gmail.com>,  Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 03 Apr 2025 11:10:55 +0100
In-Reply-To: <5746f47c-7e5d-46f5-b089-c613b7275d2b@bootlin.com>
References: <5746f47c-7e5d-46f5-b089-c613b7275d2b@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 10:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214310

On Thu, 2025-04-03 at 12:07 +0200, Joao Marcos Costa wrote:
> Hello,
>=20
> I'm facing the conflict below (among other conflicts of the same kind)=
=20
> during the rootfs creation of my image, and I would like to ask for some=
=20
> help on this:
>=20
> file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted=20
> installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and=20
> libc6-dev-2.37-r0.riscv64
>=20
> AFAIK, multilib_header.bbclass is meant to handle this kind of=20
> situation, so I tried the approach below:
>=20
> do_install:append() {
> =C2=A0=C2=A0=C2=A0=C2=A0 oe_multilib_header gnu/lib-names-lp64d.h
> }
>=20
> this one too, just in case:
>=20
> do_install:append:virtclass-multilib-libcfi() {
> =C2=A0=C2=A0=C2=A0=C2=A0 oe_multilib_header gnu/lib-names-lp64d.h
> }
>=20
> Am I missing something here?
>=20
> With both approaches, I get the error below:
>=20
> file /usr/include/gnu/lib-names-lp64d-64.h conflicts between attempted=
=20
> installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and=20
> libc6-dev-2.37-r0.riscv64
>=20
> and if I try running 'bitbake -c rootfs myimage' once again:
>=20
> file /usr/include/gnu/lib-names-lp64d-64-64.h conflicts between=20
> attempted installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and=20
> libc6-dev-2.37-r0.riscv64
>=20
> I added some debug prints to understand what exactly was being renamed=
=20
> by oe_multilib_handler, and:
>=20
> "renaming gnu/lib-names-lp64d.h to gnu/lib-names-lp64d-64.h"
>=20
> That looks correct, but I don't quite understand why the original header=
=20
> remains there:
>=20
> $ find image/usr/include/gnu/ -name lib-names-lp64d*h
> image/usr/include/gnu/lib-names-lp64d-64.h
> image/usr/include/gnu/lib-names-lp64d.h
>=20
> For info, my multilib suffix is 'cfi' rather than '32' or '64'. Am I=20
> right to presume I would need to adapt oe_multilib_header to it?
>=20
> Thanks in advance, any help provided is appreciated.

The code works by injecting a generated header file which does
redirection depending upon which compiler is being used. "lib-names-
lp64d.h" will therefore likely be a template generated file which
directs to lib-names-lp64d-64.h or lib-names-lp64d-32.h depending on
which multilib is in use.

You will almost certainly have to adapt that code for cfi.

Cheers,

Richard



