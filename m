Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2F7C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 15:36:31 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.17995.1741880185183218750
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 08:36:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NBrvaXU6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390f5f48eafso662560f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741880183; x=1742484983; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wB9tAXMvfc+a+xtegJck+Y6j3rCbeTu7d2jnFiAZEUI=;
        b=NBrvaXU6rXcQs9b9LyM1Ri0kq2DSkBn5khBjUFyFlD2wdqLaecRtE/fGn1kn23eH3Q
         ruNfMkU3jUp+QIUWGrQ/4d7UqAyHL+DiuhQ24gP7/71k+5KWu69IgHAMPqIg3WA0BYl1
         t4yIoVIyU6RIFptVHPJt9HYnmMsXYRhT74pW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741880183; x=1742484983;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wB9tAXMvfc+a+xtegJck+Y6j3rCbeTu7d2jnFiAZEUI=;
        b=E756TYXMj9yYc0bWMnRZPMNvVpf1DnPRR9qkoKBZmLs3Y9LW70LsJZpDjyDGO3RePO
         OB6RtcdoXyZfVjTdaesTK+3ayss30DG614cE+TCFhrVSPwvgiD90Kx9z1JWJtagEbIqN
         UWq+b99rpQiYQ4N08hBV397uPxL5nn/1DI7/u/mfSj8LfdIgn9M2LIEXlWacd8vzmvCm
         VQys8YgiOyOswQxxLmysRZGvlGRaV3PJpC02fOQYzvEmFak32DM0r03WgMX37rjeexxe
         y7WbW0QoWoO1hOhtEvcAsGs8dwJVcklU0IfwEfrzsdo8XdZQbkksdMFXNGueLhTt/Yed
         h8Ig==
X-Forwarded-Encrypted: i=1; AJvYcCUecbeC5DclnEnhSRQx/WpjBx6CIAqWedwOrQqirIi88sYsosQCfIEtM+xN+qapAdygtsX9s9dWv6rY4Jb1/zFixA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxlcZe5WO1vSWGJ0s7GLvqnJBJmDWxMNArJ6CrhGbVsPc67Mfxa
	6yEd1EV+eYbzKx8nx6syriHbKBUldKX4Q9f4Qlt58nK1NgYk7y48LecmqnYosf4=
X-Gm-Gg: ASbGncvuAjj5Ny/UWMupRfaG+GIaTw8jRSPKMLrlJv3gq0CWiAGADlzhTMaPh7kIrpZ
	Ikec5OSfg9Xe5atvMqFuf8xV0k1aixusfXwp6Ekj+fMhGregBLMevsx8h4ImH1MhZJ1saaPiY0f
	d3tDsPD/nrRykUdx37+BUIrTTfKfe1KZknlUP766q0/yoopOnFM6MS+aj6E+NPSV3wS5UZSzohK
	AcQdN6ZqYjbvgkxi8fe7rEx/QXZfS2+zsDvm3M2gDwC5GZsxhT69XB2pyNoi7vYt9dnFAKJ4Mv3
	HnMUHHQ2wLmVMscPnp5Oihcl1gc9Nd1Q4EF+NJpzOtkMfWTg1NuBTJ3b4fZTnwhjp6VK5D6Rm6i
	wte0P/tSIlVYdkkaL0vkPaeDIcpDjCzbhFw==
X-Google-Smtp-Source: AGHT+IFV6wnNq3C1/N0kVnXkEtWPzKPaldqgxN2/uivTZPD1ibMnI6bnwvjm+uYnwHko958BJe4xdg==
X-Received: by 2002:a05:6000:156b:b0:38d:e304:7478 with SMTP id ffacd0b85a97d-39132dc56f2mr22867127f8f.38.1741880183604;
        Thu, 13 Mar 2025 08:36:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8? ([2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6e4esm2447842f8f.29.2025.03.13.08.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 08:36:22 -0700 (PDT)
Message-ID: <a8cf46a2a03bb8958bd29a7773d7b23ab959dafb.camel@linuxfoundation.org>
Subject: Re: SPDX 3 Improvements for performance and VEX
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, OE-core	
 <openembedded-core@lists.openembedded.org>, Ross Burton
 <ross.burton@arm.com>,  Colin <colinmca242@gmail.com>, Marta Rybczynska
 <rybczynska@gmail.com>
Date: Thu, 13 Mar 2025 15:36:21 +0000
In-Reply-To: <CAJdd5GZNUAHKx1SH-8HCkRJ111zheEA_aLPJg3bRkt8==niqFg@mail.gmail.com>
References: 
	<CAJdd5GZNUAHKx1SH-8HCkRJ111zheEA_aLPJg3bRkt8==niqFg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 15:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212786

On Thu, 2025-03-13 at 08:28 -0600, Joshua Watt wrote:
> I've push a very rough draft of some proposed changes to SPDX 3 to
> help with the performance and also the generation of VEX data:
> https://git.yoctoproject.org/poky-contrib/log/?h=3Djpew/spdx-3-improvemen=
ts
>=20
> Richard: Most of these changes are pretty straightforward, so I'm not
> worried about them. The only one where I fear I may have committed
> crimes against bitbake is the very top change ("spdx: Add product
> SBoM
> collection"); If you would mind taking a look I'd appreciate it.

Joshua and I talked. The summary was instead of the first task, to
write the data somewhere in an sstate task stored under "PN".

The collection task can then walk it's taskgraph (from BB_TASKDEPDATA)
and look up each of the PN files as needed.

This has the benefit of a simplified task graph and no need to use
locks as the recipes just write under "PN" which they own the namespace
too.

Cheers,

Richard

