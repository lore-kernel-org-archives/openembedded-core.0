Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD36C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 13:20:58 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.13608.1715865649735109877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 06:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Afvg/rUW;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6f4e59081e6so158004b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 06:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715865649; x=1716470449; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2FI8NEgbjNznd62uCxcvZI9JdvN9lciR7XB8ctfquUs=;
        b=Afvg/rUWMynvEMKFeoIaSoWDLLFqtLjQlUjvk+2n8W3I0dXLlmzSmIDRTL3S/GvU0s
         HZt0cvlQXyyDhhBbnHgR2kc6oQP6Y339kXXNQi6cAfRqpSHXV45jL0prbZ3tI4WqhOwc
         CuxfFLfLhZG9SDAl5zmdyQGz7l8ENn8vnp1c3ksYr7a79hRz8osF95DiP1ROmQl/eBY6
         sg7FFQ/6w6Atnthw122BMPtNBZzs5WtMtRgyqJv5OQyGU8IekZjrEdzjn/JR06m2Uyps
         d9f/zNCKPor+numIvowNLTO4bMKelbCS4nB7RiDYZSP3wSigzjWFQ7Jklc83aesdkQvJ
         yMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715865649; x=1716470449;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2FI8NEgbjNznd62uCxcvZI9JdvN9lciR7XB8ctfquUs=;
        b=ZVOeuegEs9+iqIO3ZDi7xedtB7mG6q2gIIlEJholxdRmHz1SC8Vvzc2oLDLibbFwPe
         HJQVcTtQ3nzRJUxxoOx7varoNeEEsBuseJqUC0Nu5A83QxdzanR98vgZc/58pWofrx7/
         vaWejwrifwjegEtMmbwsRoWaDW5SXu3gaTzvMpubb+HpB0eaJNhKzU2G58pzrgzH2VnY
         C7I9GmmZZl9c2BbpveYDIpYYA9w/h2KfPfU26AjviKYZw4xUG74xhnw4EmxpVO4sOsN7
         SlURzI1roYQJtoqRFozXUsVYDjL0xOxepIwwKgTxrxDjdGkAFLppZDJ152QgEdODdjtF
         NhVg==
X-Forwarded-Encrypted: i=1; AJvYcCXOO+bOdHEMP6YogAD6WB/b4dhTIaa93QIt+CJWpEbh+O+w2n35NGgZjoqvpKvjciOdgM41iWAyMbsp97EqX6OFrTpYVLjeccuGfGXQXPkBw3usKQjW8sZB
X-Gm-Message-State: AOJu0YwPTlNVxawH9i4xrLpZqeeadQkzDo7LstuUWp1iwvt3mCxZE/G6
	K7gA/xubrQkX+FqAvhVPl5O2MuVIWHkl0oiNDK3oMKPpkMYXEcCrYiRZRLxPpu/m5kHo2nfNlLl
	SD5/lGWxRyxU9wpdYUVwfH48MDWo=
X-Google-Smtp-Source: AGHT+IHzAbL0iVtje6pdRtYOJd/HcwM4gY9yjb/dRT0m8OlZzdO8SgZNRzDLyu9/E3Uz1D2QEdnGLFJSUUP1sUiovq8=
X-Received: by 2002:a05:6a20:9f9a:b0:1af:fbab:cfaf with SMTP id
 adf61e73a8af0-1affbabd262mr8742125637.62.1715865649005; Thu, 16 May 2024
 06:20:49 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 16 May 2024 15:20:36 +0200
Message-ID: <CAApg2=SACqdG_g=2LUj1=-ECJY20p=r8RoPTag-if-kpo0ozQg@mail.gmail.com>
Subject: CVE status for scathgap on 2024-05-16 and ask for help
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Steve Sakoman <steve@sakoman.com>, 
	liezhi.yang@windriver.com, wangmy@fujitsu.com, Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007dd1a70618921a6a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 13:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199486

--0000000000007dd1a70618921a6a
Content-Type: text/plain; charset="UTF-8"

Hello all,
The prototype CVE check via the MITRE database is giving the following for
scathgap today (adding maintainers of affected packages in copy):

CVE-2024-32002.json: affected: git 2.44.0
CVE-2024-32004.json: affected: git 2.44.0
CVE-2024-32020.json: affected: git 2.44.0
CVE-2024-32021.json: affected: git 2.44.0
CVE-2024-3205.json: affected: libyaml 0.2.5
CVE-2024-32465.json: affected: git 2.44.0
CVE-2024-33599.json: affected glibc 2.39
CVE-2024-33600.json: affected: glibc 2.39
CVE-2024-33601.json: affected: glibc 2.39
CVE-2024-33602.json: affected: glibc 2.39

I would also like to ask for volunteers to help with looking up the
following CVEs and submitting fixes to
https://github.com/mrybczyn/cvelistV5-overrides/tree/overrides if they are
malformed:
go: CVE-2024-24788, CVE=2024-24787
aiohttp: CVE-2024-30251
x server: CVE-2024-31053, CVE-2024-31082
bluez: CVE-2023-27349, CVE-2023-50229, CVE-2023-50230
gstreamer: CVE-2023-50186, CVE-2023-44446
less: CVE-2024-32407
ncurses: CVE-2023-45988
ofono: CVE-2023-4234, CVE-2023-4233

If you have any question on how to do that, ask me.

Kind regards,
Marta

--0000000000007dd1a70618921a6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>The prototype CVE check via the =
MITRE database is giving the following for scathgap today (adding maintaine=
rs of affected packages in copy):<br></div><div><br></div><div>CVE-2024-320=
02.json: affected: git 2.44.0<br>CVE-2024-32004.json: affected: git 2.44.0<=
br>CVE-2024-32020.json: affected: git 2.44.0<br>CVE-2024-32021.json: affect=
ed: git 2.44.0<br>CVE-2024-3205.json: affected: libyaml 0.2.5<br>CVE-2024-3=
2465.json: affected: git 2.44.0<br>CVE-2024-33599.json: affected glibc 2.39=
<br>CVE-2024-33600.json: affected: glibc 2.39<br>CVE-2024-33601.json: affec=
ted: glibc 2.39<br>CVE-2024-33602.json: affected: glibc 2.39</div><div><br>=
</div><div>I would also like to ask for volunteers to help with looking up =
the following CVEs and submitting fixes to <a href=3D"https://github.com/mr=
ybczyn/cvelistV5-overrides/tree/overrides">https://github.com/mrybczyn/cvel=
istV5-overrides/tree/overrides</a> if they are malformed:</div><div>go: CVE=
-2024-24788, CVE=3D2024-24787</div><div>aiohttp: CVE-2024-30251</div><div>x=
 server: CVE-2024-31053, CVE-2024-31082</div><div>bluez: CVE-2023-27349, CV=
E-2023-50229, CVE-2023-50230</div><div>gstreamer: CVE-2023-50186, CVE-2023-=
44446</div><div>less: CVE-2024-32407</div><div>ncurses: CVE-2023-45988</div=
><div>ofono: CVE-2023-4234, CVE-2023-4233</div><div><br></div><div>If you h=
ave any <span class=3D"ng" style=3D"background:none!important">question</sp=
an> on how to do that, ask me.</div><div><br></div><div>Kind regards,</div>=
<div>Marta<br></div></div>

--0000000000007dd1a70618921a6a--

