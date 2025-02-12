Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E965C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 12:46:06 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
 by mx.groups.io with SMTP id smtpd.web10.14771.1739364360983391974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 04:46:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VRH44A+H;
 spf=pass (domain: gmail.com, ip: 209.85.221.170, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-520335ff378so1110639e0c.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 04:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739364360; x=1739969160; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=11DCIr3w143/ANiCw0DquP8Fjl9Clwhbd5tUB4Z/3aI=;
        b=VRH44A+HV/3dwbTcXLUEKq+TDUPCk7b42LXiuOcfw036ZDy0OPZhEvzZ5R6pZfPUf6
         2c7Y9dQuKK1DZAc3F1yN9YQ/X5dVBoIN9TbJhalxja+k+tDyDQNHrhDBZi588B95Ms41
         wmZ4GgnXO15je1bz1b1vUoZFv8WtYI72xG+ckY0F33iZI0h97AyurKNJHhl+xRGxouHx
         Vq4h/Hga1WAM4uDW63411DARW9PdfZqBFwX1q65fnfbNjWPB5NiXs2h1XOm1qfDot7+l
         EEPE/PmbhOzPwy3isVvYM7XsAfJ+lu7ftPO4kPMQIjM6KukVwLHFP0xLz1PBaC10z22X
         jawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739364360; x=1739969160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11DCIr3w143/ANiCw0DquP8Fjl9Clwhbd5tUB4Z/3aI=;
        b=HLicNFotXovR1M88pC6PcDkTlXw1+skZ16+C7eAG+SfylgQSR0AHnYk1Pv6tDkr27a
         W/38l1Bd9xk+H86Rn17HLlecg0L7sUKrOGU96IoJc1bVOeKiRIVuo7SxOcuaxLE8cEx3
         a/DxT7mNRcCv5ig44OZferVZCdsw73lIFAEbynkvGL001l0q3p1kcg3K+XjtcIeBmVZe
         uX2ybl3krIwVMGLEhITZ3tlfFiI+EkKu7O/pOPyqSbMdjRUO0EyScFgMlQAZDYml6swQ
         aJgznri11mImGx1DgC6EfNi4RvL/JP2Sopx9D7LYxpPEqAJT0clpvykIul2H1a2VYf3u
         0tdw==
X-Gm-Message-State: AOJu0YysE4fT/KGk28lAjEjx1n/3aCGeSfoL4/zFI6Erf23zL1OhPwh+
	PJiunIPHYW8R7SCm1xBMv+0RWHhAZ1WArETJMrP547UZzhh/HZxRtRJC9RO8bx8CMXaE8kx41eS
	zGuwRvn1mWz8Siobx2W3T0Hu/hGI=
X-Gm-Gg: ASbGnctvTsETuaoyRdPit4eza2vffu97zy6DxjeiJKTTNWkYK2dgaCtT3sEkfAXTtSv
	odBYhOr6h4NoXtBXFq5+qIdENwWkAbml4Wz6xr3kq5MOP+hmw1YowKa71O/QX53Kds01jCHjTtK
	XMTq2vgkqu0vxBMSzUwL/ioAW/dA==
X-Google-Smtp-Source: AGHT+IFdr6ElAZKNyDri41GUJgZETT1QcQ+Eypf5pwmnHG7NFK0VBp9tDCmwY4OobcWLse/10h696KaDwHTPj8vRo2s=
X-Received: by 2002:a05:6122:250f:b0:51f:3ffb:79ab with SMTP id
 71dfb90a1353d-52067ca3051mr1870583e0c.8.1739364359976; Wed, 12 Feb 2025
 04:45:59 -0800 (PST)
MIME-Version: 1.0
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-7-stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <20250211150034.18696-7-stefan.herbrechtsmeier-oss@weidmueller.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Wed, 12 Feb 2025 13:45:49 +0100
X-Gm-Features: AWEUYZkS-D0W_M-BG10RjkaqLGlFJZCc44gS-aRO9vZws4qMeRELPd_Zyvj98UU
Message-ID: <CA+cAkep+TSaFr5pqKDjxRh07ApMTwtnspTvYAMVOU_ax3kP3Ug@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 06/30] lib: oe: vendor: add cargo support
To: stefan.herbrechtsmeier-oss@weidmueller.com
Cc: openembedded-core@lists.openembedded.org, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000cfbf2c062df15244"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 12:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211231

--000000000000cfbf2c062df15244
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2025 at 16:01, Stefan Herbrechtsmeier via
lists.openembedded.org <stefan.herbrechtsmeier-oss=
weidmueller.com@lists.openembedded.org> wrote:

> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>
> Add a vendor module for cargo to resolve dependencies and populate
> vendor directories from a Cargo.lock file.
>
>
>
Hello,

Have you looked at vendor subcommand of cargo :
https://doc.rust-lang.org/cargo/commands/cargo-vendor.html ?
I didn't read the series but the commit message makes me think that "cargo
vendor" already exists for resolving dependencies
and populating a vendor directory.

--000000000000cfbf2c062df15244
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 11 Feb 2025=
 at 16:01, Stefan Herbrechtsmeier via <a href=3D"http://lists.openembedded.=
org">lists.openembedded.org</a> &lt;stefan.herbrechtsmeier-oss=3D<a href=3D=
"mailto:weidmueller.com@lists.openembedded.org">weidmueller.com@lists.opene=
mbedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Stefan Herbrechtsmeier &lt;<a href=3D"mailto:stefan.herbre=
chtsmeier@weidmueller.com" target=3D"_blank">stefan.herbrechtsmeier@weidmue=
ller.com</a>&gt;<br>
<br>
Add a vendor module for cargo to resolve dependencies and populate<br>
vendor directories from a Cargo.lock file.<br>
<br><br></blockquote><div><br></div><div>Hello,=C2=A0</div><div><br></div><=
div>Have you looked at vendor subcommand of cargo :=C2=A0<a href=3D"https:/=
/doc.rust-lang.org/cargo/commands/cargo-vendor.html">https://doc.rust-lang.=
org/cargo/commands/cargo-vendor.html</a> ?</div><div>I didn&#39;t read the =
series but the commit message makes me think that &quot;cargo vendor&quot; =
already exists for resolving dependencies</div><div>and populating a vendor=
 directory.</div><div><br></div></div></div>

--000000000000cfbf2c062df15244--

