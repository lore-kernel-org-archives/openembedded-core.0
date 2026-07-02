Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D24C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 14:09:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70036.1783001376339594032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 07:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Psk1OkZt;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493c19bad03so15414775e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 07:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783001374; x=1783606174; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/H+seNVMeh66/C4Un5/P5ZGgfnKmeEaqWpP2Beo84To=;
        b=Psk1OkZtkaOAM4o/bbo0XwARgtJdZOEXm1XzV1a9MseMYPyWCKF6+bxCFtvZEZ48Bj
         zI3Rmj+A8vdD7qM2ti30lvATFbap8z+DKyB/eV6eZXFv6abGNkBFHUSzP59aGmD4ijaT
         5RO2eZ+GiIueKNeg6BYzTplN3LNcfQeyma+FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783001374; x=1783606174;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/H+seNVMeh66/C4Un5/P5ZGgfnKmeEaqWpP2Beo84To=;
        b=g9+LW8w5m7beFh+daZBEAOM0Y1d5cyITQZY29NQzkuEwenM8gohDFi1HDmWTK3ryYt
         uTAqPfL0IvcH5Zo93PL0wT1ML41KOkary1N+z51HZcvG6mYUT88pSymLeba5OtcYXy7T
         lXvnks3C9Z6z6lHy1SOlBDcz5HGQpD5Qiy5s1iPXHO6MhcBqbVl0T9ZD1v4tGcWpCF+e
         2KfkDFfto5Ab3jL0/Hz6IBR9TC5T/uOcy33X93jO/DYRjQ3sy8UvCxHWzgHJLoeLXEtO
         oEyfxiYg7HsnHj++KGS0TyPhE8k1pVvX7dfAbqVY34hTZij28ojlVakokQHW8PTphykK
         OAQA==
X-Gm-Message-State: AOJu0YzYEgLdyjYkc94j6DlzNSZSlPkFv+dL1C6Twf0x02ptEyPvhSYP
	BjDia0fnXu32rh8enirxslAkuQgW8yrkogDLh39QtY87dwS7qf6J50auKpkyv0hLsgw=
X-Gm-Gg: AfdE7ckBdZuXtREf8SuCGJg2IUG0zAKoiFl3FQI2hqoNYLJbGewvoqi4RN90S87WgTX
	9mmaAr2qwirt1XtFgmNJBUfQS04XDwFy1M3Anmq5/S0HyVrdFzvszJJc5kzxy1quiYgvRxebWFQ
	eSiNMtamfbgPbGgcNNdCT0hLij2mapLmqyTw1DWdwRmiU0HhCTqpZfgdddVp5D4Xr/WpLs0Bh+4
	GXuX0a0GKXV/VkcbCVy4pyenCaR83dCZ7o5Ohbg2eylvvPbeiKZSyl2vID1smz0l6+8mPJ0Gjr0
	QzVnJx+y0L+I6K4FIdzHpw3zLVXK9WOGzZ3sifX5moON2ToiYfcWZncntNaB8RhLXfSmhEv7Rv7
	Xx0vJtz5RRX9L3R49Qb/PmcMOUnXkia9qDw5HhHIbHbqfVMn1iMsMfdAF/0I0KCr56YulRasIpH
	yVlW8jrWWep5OwAlfedjEquHzYjt594eShGPD4nj5xg9U/k4cgUjIuyxwbsbnhC23/97yqnZV6o
	jEVpA==
X-Received: by 2002:a05:600c:524c:b0:493:b6e4:fb2b with SMTP id 5b1f17b1804b1-493c2b88afemr84060525e9.25.1783001374574;
        Thu, 02 Jul 2026 07:09:34 -0700 (PDT)
Received: from localhost (2a01cb001331aa00c56cc01f8c3c1c95.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c56c:c01f:8c3c:1c95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef17c82sm89999305e9.1.2026.07.02.07.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 07:09:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 16:09:33 +0200
Message-Id: <DJO58J8D7X5G.2FRK2OBFYWIDO@smile.fr>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: Re: [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to support
 Ubuntu 26.04 on Scarthgap
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, <ccasciato@21sw.us>,
 <paul@pbarker.dev>, <randy.macleod@windriver.com>, <ross.burton@arm.com>,
 <sundeep.kokkonda@windriver.com>, <SunilKumar.Dora@windriver.com>,
 "Alexander Kanavin" <alex@linutronix.de>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr> <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com> <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr> <DJJV9FGWRHJB.26TA7NN2T8LVS@smile.fr> <CANNYZj8nhGqmvy0tTnUHCNtnjkjweE-OwqL3gDL0mOYGgQO8OQ@mail.gmail.com>
In-Reply-To: <CANNYZj8nhGqmvy0tTnUHCNtnjkjweE-OwqL3gDL0mOYGgQO8OQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 14:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240055

On Sat Jun 27, 2026 at 5:16 PM CEST, Alexander Kanavin wrote:
> On Sat, 27 Jun 2026 at 15:29, Yoann Congal <yoann.congal@smile.fr> wrote:
>> [...]
>> I'll pull on that but suggestions welcome!
>
> The log is misleading. The actual crash happens in a different, later
> rustc, which does link to libllvm statically via librustc_driver:
> [...]
> Alex

Thanks Alex, you were right!


To anyone interested in using Ubuntu 26.04 to build scarthgap:
I'm at the point where I need to stop investigating this and drop
Ubuntu 26.04 for scarthgap until someone fixes this situation.

Here is my analysis:
On current scarthgap, rustc links statically to libLLVM (via
librustc_driver). For unclear reasons, when libLLVM comes from recent
distro and rustc is built on old distro, it ends in a segfault.

To fix this, master changed to dynamically link to libLLVM but that is a
major change that I'm not comfortable doing on a stable branch. So, in
this RFC, I've tried limiting the change to -native/nativesdk-. That
does not work because ultimately, target rust does a bootstrap where it
builds a native rustc using target build options (in this case, static
link to libLLVM) and reproduce the segfault.

I thought about using the rust-native we built to bootstrap rust target
but that looks way too intrusive for stable (and also, not trivial!).

One workaround could be to hinder sstate sharing to prevent sharing
accros host distros (opposite of what uninative does), but I don't know
if we could get this idea to a mergeable state.

Finally, support of recent host distros for stable is nice but only as
long as the changes for it are not too intrusive and obey the stable
policy. In this case, I could not not find a fix for this issue that
works under the policy.

Regards,
--=20
Yoann Congal
Smile ECS


