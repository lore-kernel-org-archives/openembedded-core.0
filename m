Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838DDF94CD2
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 06:44:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72710.1776840262511405092
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 23:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cEt0szjs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso46209065e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 23:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776840261; x=1777445061; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvhOEM66GUAIXRyU/dbka3GTIqb7iND+GS6JK4wnhsk=;
        b=cEt0szjs3X9kkTGOTbLL8Z/PooKjDVlQ4Vg5ZriGwCXfITsb9W3kRIyOQPMf3yVrTa
         l/Vnmkbhyj+J6r0OLSyW8+/rwHhXC6Uvi/50FpWGm+4RfcTu6y9jnaNPIP4dEsD6r4fs
         KiSvZ2sp3oBvZuhV6SY/0PZVF77VFUxJ98C4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776840261; x=1777445061;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dvhOEM66GUAIXRyU/dbka3GTIqb7iND+GS6JK4wnhsk=;
        b=HhkerCkiU3Ky4pBOUBvJVURkhAw/oKhSEysKdz5nY0e9Aja6w6fM2YlmzEn5uH5hIO
         Lu4F6YdDpRGrpUizJWfxnw3ghuYPO8yH7hToJF+NIe6cs9GahxKULTOrr7msNEw3z4Xx
         6J3ufVA6yeyr7sjVPx0Dv1uGa7M/SsVicLBjMAn2Qc32fQJFdWJDgJL28FdDiuhIp9f8
         R12XwfC3001QY9MVMxL6AWoyDjk1041PF6OFZkk/js51oD7+2zgcMo1uSTWTGl29GDI9
         eu1aHJYKY/5PQUdmIf8A/Xmzh3v5omGPZbvomJrTZu3/hF6zkCXWXq/708B2jlPMCuIz
         1sdw==
X-Forwarded-Encrypted: i=1; AFNElJ8cmAUH6T1PIcysXNRjK7C4BwHmE4/0gB79DtbpNRSYm/5fBLeFndyEfNgtwAgQ9ovqc4B6cvzYC5LKa3kiUK73bg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxXy+DNJSjnyFw8xdMpiCkaU9Abgjb8Bu7CMNL5NDjHC0YOy7mJ
	oLVoKa/VxFcRBmgNU8Q+4Z8iMtIAm59C7pcId/mH8LDIyBqBzhN7IvYxDAzvwgm96+1kqk+NbCO
	NVn5Ao/A=
X-Gm-Gg: AeBDies9POD8DRGCpyD7JB9CUCi4kqIwHGWW7eSwQQzRbAyt2ED9sYCzV7B8lKeBth8
	WKwcyJLhKH3eA71ICdgitgGQ/2S4ycYiFkyY5GFrZriPRifJoLNN/+oazTczVtrHOYYhw/DrPVw
	5sOO8Y30+IWx74euvHdt3oUAXzcUgERugTWfVWunDmEgVlu5CHHTuva4+SIQoiGVodXp8D1sICw
	V1bw/f6EH9Ber3yqU2K/p2f/MNrdQ5oZx3LUq8tvLwu8NE1nolTsuW7ErX3vuoEAc0a3TIXscVt
	Qpn88GKHreAZrcWdv4P6f3DzIyIFbI9TprR/ny2JNuO9R9rCN3ghb2f7XwboQ9/ZhZV1yKTlEsI
	O481g08/jJlXd9I8ds+BNfIXqXRU4yLBn5AgPjApTVtJ56ObaqZnqUgeeCj8Jps+D0f5sz5Po2r
	ROKgmW9lFDpeTPkzSD2zdPsqv1SbmqcUxSXQux2Y61Qgq0bKyvNclWitxDATOH85zyPR6LoHpaE
	ah6ZofYGcCXAx4DK9SdJUjFFrQ=
X-Received: by 2002:a05:600c:c4a6:b0:48a:761:57fe with SMTP id 5b1f17b1804b1-48a07615be4mr149537145e9.0.1776840260675;
        Tue, 21 Apr 2026 23:44:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a9c6:3deb:bd01:ef01? ([2001:8b0:aba:5f3c:a9c6:3deb:bd01:ef01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm388130995e9.5.2026.04.21.23.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 23:44:20 -0700 (PDT)
Message-ID: <8c39da9ca3535ca2fd4c6a4b69e0de4072ffdec8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] shadow: Drop pointless patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2026 07:44:18 +0100
In-Reply-To: <cf156897-8a47-45cf-a64d-7ab8eb07085d@windriver.com>
References: <20260421104147.1994119-1-richard.purdie@linuxfoundation.org>
	 <20260421104147.1994119-3-richard.purdie@linuxfoundation.org>
	 <cf156897-8a47-45cf-a64d-7ab8eb07085d@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 06:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235696

Hi Qi,

On Wed, 2026-04-22 at 13:51 +0800, ChenQi wrote:
> =C2=A0I'm the author of the original patch, so I just double checked it.
>
> This might be counter-intuitive, but this patch does solve some
> problem in pseudo environment.
>=20
> Without this patch, running a simple 'bitbake ptest-runner' fails.
> The error message is like:
>=20
> NOTE: ptest-runner: Performing useradd with [--root
> /path/to/build/tmp/work/x86-64-v3-poky-linux/ptest-
> runner/2.5.1/recipe-sysroot --system --no-create -home --home / --
> user-group ptest]
> =C2=A0useradd: cannot open /etc/passwd
> =C2=A0ERROR: ptest-runner: useradd command did not succeed.
>=20
> Anyway, I see in another patch, you switched from '--root' to '--
> prefix', so I guess this patch is not needed after the switch.

I did suspect it was working around some issue but the patch does not
explain what and in theory it should be no change. I therefore sent a
"remove it " patch to work out if it was still needed after 12 years
and if so, what the real issue was.

It turns out that shadow-native on systems using fortify source would
break when building something like ptest-runner. Initially I tested on
a system without fortify source where you don't see the issue.

Looking at the useradd binary from shadow, it was optimising open() to
call __open_2(), and it turns out we're missing a wrapper for that in
pseudo.

I've therefore added it to pseudo and that should remove the need for
the patch. A local test on a system I reproduced it on did show it
being fixed.

We still needed to do this even with the --prefix change, I'll probably
hold off that until the next development cycle though.

Cheers,

Richard


