Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C61C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 12:21:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7696.1787055683742509580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 05:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q87Wlv8e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2792867f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787055682; x=1787660482; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KIgQlnnOTRNYZL68+hmHjknY3KlstPPwsPaitlYdB/k=;
        b=Q87Wlv8eSKIlJa6A5nV5W/yajDhcVT4TDDNNlLrqNa1EtKlfa/kGFxNj7EMXD6XSRP
         BHsSF0yUepUZvY+p43yUcWUC7WxKsO0ESz1V3uYc+Sj7+CdG522mpNk2wlpflhsml7I7
         l6X9aMsyoiCj7ZxS3BUcfYlSMOmQlwv8sRFYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787055682; x=1787660482;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIgQlnnOTRNYZL68+hmHjknY3KlstPPwsPaitlYdB/k=;
        b=pzw1xugrPS+jJ4bv4ILk62V23w3s7R1SDrxxCtkMKCItC/14ct3aO8NCWy9Sy3zlNs
         5gGglT+ZH1VzVl3p2NaB5ZMMVUM8emzxy/L8aQ1JeELuMxI9TkluiYyNvBVhBt/8lwoj
         6RIcnOuryRCuCtt0JDzEPweoR4hln3eI7qh04Gvx2xkZpWTzW12FKvL+MPJDC8+DAiMI
         5XvUHHgl3/XjvHOB9U4voh/PJiIuCp8nCs4W15nja2eAB7ZnqhmfNppVamZZmND3dqnn
         9oIFRBUjsm2aWHNoJvlh7wvBvtKyW/TWIMqBETv0NmmXX5b3x2h2j0Zw4kjj4x6r02Z7
         s8dw==
X-Forwarded-Encrypted: i=1; AHgh+RpRArdWlYiVlrDSTcYPyhQEgTCKzj0LvyAiG3dttn+zO14WbWBBzO0anuTpmGKXkO+IRli7cGF//BDKjEvmPZyUag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxg2FYaxMSMhhNhbhjfldmUe88EAdpY6MlxRwqWOULqStyyBzfo
	dy+M7gDy0AUb70Wsfil92hfNiPe/Ys2uvCcGj/BzUYslxKYwuuNFyVTViAmb4NxC6Pg=
X-Gm-Gg: AR+sD11w3M1yoNndKFYu7qvfBAqp2UDUNLWzC4Air9jeg8Q/NMpAPekNxF2IUQq/ECB
	R5ieVCmzW1inyCOGgFoVmJiMG6H+7/unQjwBMuHUTi8Y2DzaxFxxh139dSPsiwy7odOi4EJy9Ol
	yP+oPeH6i4iVdkuD24Miekk+8DfeNDM70lA69p1O5kYI/riuD2HMWlqzimGKQKu6R+YQMT/bxq8
	IfwOlDCwQKD0RyrJh277cFGKInsRDzKbMPuwV/8qHnYJ5DuEuaPVQv6ciW6qgUKmQW9M0+6nL5C
	T5Zcp07vA5ysJmje6zEXt6DhodLLQ9DlBZuyb3ioxb98aDA4cuKenOkOIXCwu33ph3leHSh6D8P
	0AnKMYodFySGyIImfVbFMqQMq2n05A1mJaUgEc9gcuX1Ldhrp9dcKTFwcOOrjPx9zDuYWOVj6Qg
	+YUhTMjpwKERo+SONWFj4FDr3rDYC+GAnz4jbKjt3tLg6MmSuPmicTRsAxgTTUjso0Q42hm3/Ll
	ReGFpdjAOvQfu5Wjdw58mAgCNmOV+tQL/tL/1cKfmWzFGntUqPWxg==
X-Received: by 2002:a05:600c:608a:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-499a202cb4cmr109727155e9.6.1787055681899;
        Tue, 18 Aug 2026 05:21:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ee4b:f6b4:d308:732d? ([2001:8b0:aba:5f3c:ee4b:f6b4:d308:732d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b7cd38sm12546440f8f.32.2026.08.18.05.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:21:21 -0700 (PDT)
Message-ID: <83662673baa05f5459809f9eecf886fc3b978b33.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/4] lttng-modules: fix build with kernel
 7.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Aug 2026 13:21:20 +0100
In-Reply-To: <20260817112129.1271154-2-mikko.rapeli@linaro.org>
References: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
	 <20260817112129.1271154-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 12:21:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243677

On Mon, 2026-08-17 at 14:21 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> With patches from upstream 2.15 stable branch.
> Fixes build error:
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

I think 2.15.3 has released now!

Cheers,

Richard

