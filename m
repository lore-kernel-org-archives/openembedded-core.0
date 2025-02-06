Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A49EC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 12:09:15 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.38994.1738843747287490744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 04:09:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dU4CShpM;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b6eb531e13so38437585a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 04:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738843746; x=1739448546; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcE7kGhatpY672dPoL+9oJBxmnBb2+IY4v+IqerusGI=;
        b=dU4CShpMUnq2iH4vqHDUpAGWRtTGaAsblS9xDTip+D4fFXCR55u5kY3YRbIhLLXsyx
         KuLP9WKFZEdkIdSghubH2qBJQrdjH2kpzKX8hTqNu6FDh5EwAg1miM/z9kWQIKFhwtSM
         oZdsLM9V9OWEHr+5bUU6+9m82Dh91AC1Wg4rA6UUX8BeUk5xZMkFjFoM16L2lQMJzHNg
         pw/CQuMFGpubiUwZQaNgnAuKn4rQaSZRqnhn2C2OtEOxLyJmq6zABIWwUVrtuAILAGjw
         4oeFmiL2f5s/uHW/TaSkscNKyyXD2Ys7J5u1ANfwvROdmIxKQ7Xuvfzd69vzYWq5Vf8v
         3Miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738843746; x=1739448546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HcE7kGhatpY672dPoL+9oJBxmnBb2+IY4v+IqerusGI=;
        b=bqSp5BGXdbWXx5yPdclNp9gEKmj/qWZQ6OM1+0WnSLlqTcHBlIDtwYCsCSSgEoOJS/
         pHizju/nqIF3H1E5ywAcSQ3HdIRBkEtfJFkAAhXiHVcq/LHLCveBH/Tda2Wtl3hOQT1j
         dM3I+Qt7S3WxsAweS+bYRPsqW4DTGnuKttReIzECYRJagZ8hexR7/g8IJHzzBBuMNrms
         2I3QJ/Iv+RDcqgE8LCWxBwQ5S5AxbFfW3dVSKMy8S1dFOtbG8uOq5a5TeXt0YyYCt2ke
         ONoQf181CamjcIf/By8B8n22JKvzp0hod51bGv3PftIPz7cKWq+U7WRazY3WycAoF/Dv
         uqgg==
X-Forwarded-Encrypted: i=1; AJvYcCU4lmldykC0vwfBZ5bf1YlsGiqBLQJwJyluHiXS+/w8m2vtX8lLIFj2UydYVrkMrPIef3FiRcqjMdMjokHeXgCz/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyF21YQuelq1wrS/TA7cqtdAZtxIX85G0zlTrlQTeoMoy+mTsla
	jfG2EskZPa0T+4WDPucan3jeMmp5vsFFSzGwS193kgjY+b/tjU5UUe3rzMwDmRXrjNv+6g+wBWC
	1frf71QwqnBmBVd4nmfAMdPLTJ+g=
X-Gm-Gg: ASbGncsmzxHtSulRiUW+VqFFeLG564sTYs5EQBoXjAzLWBZa9NCLEwO6oQv3YkM5R6G
	P+Jo4uuP+tMQvit3R646BOh+mZx2ZgmxMsQf3WNKIn3Ws0h8tTyz8/wg2HNJZBPg6pEgk4hGCu2
	Iexiy+R7t4zNG+IbYqna2khcDM2VQwUUg=
X-Google-Smtp-Source: AGHT+IHvsXGTCXtAXTMrnt2xHLSAHisFNgmjDYUa4qWaumcgeZNk8ACP8hY8TeDny2B55WWBzjcYWthtGPdDaWG29bI=
X-Received: by 2002:a05:6214:20a5:b0:6e4:3c52:d684 with SMTP id
 6a1803df08f44-6e43c52db5cmr21106726d6.19.1738843746270; Thu, 06 Feb 2025
 04:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20250206055222.3319167-1-zboszor@gmail.com> <D7LA9XGPGG5H.287DBDA93AM2K@bootlin.com>
 <07b393e5-06c0-45c2-8864-9a9251eef30d@gmail.com> <182198F3C56EC291.752@lists.openembedded.org>
 <CANNYZj_BrS8MMwzqrxehg91SFp6OFHEjOyfzcxdZ4wnH2TV7Vg@mail.gmail.com> <90e2e812-27e3-4828-b6c7-6d374e3cfe34@gmail.com>
In-Reply-To: <90e2e812-27e3-4828-b6c7-6d374e3cfe34@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 6 Feb 2025 13:08:55 +0100
X-Gm-Features: AWEUYZlRzJ7WX_KHFsknqDvl_P2HqdN9Z1ivtS4GWYEDamIzG11zncr_b9zOQB4
Message-ID: <CANNYZj8akDdXKQRqo83z-VxaN=B7Nod74GihYSt8e47+07zatQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v8 1/5] rpm-sequoia-crypto-policy: New recipe
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 12:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210929

On Thu, 6 Feb 2025 at 12:49, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
> I patched the Makefile in a way that's already in its mindset.
> asciidoc can already be overridden, I just made the same with xlstproc.
> The PR against the upstream sources was created, it's referenced
> in the patches in the recipe.
>
> I just sent the v9 series with the two patches, hopefully it will work no=
w.

Thanks, if there are no further autobuilder fails, then the patchset is fin=
e.

Alex

