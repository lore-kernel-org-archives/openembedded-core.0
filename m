Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BCE3C531C7
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 08:46:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19137.1784796408856595036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 01:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jbQcXoVT;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f6de72faso1796855e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784796407; x=1785401207; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfZeRrV+FKjPDAPUsepEpIjamzKHab/W7jAWbZQ2n7k=;
        b=jbQcXoVTDzBPiiPqQXjEcnmBiCRbtZz+WsvhwiKkmYo5af6VGt0TDHixhQDraer+Gd
         XMXcVk55SF4EFp5/DYgwRIl7nUC3/hhE/hngZgstAQsM1sSoiJsMN36yy/T2G7CFbas3
         K8ZRzBDYO1dF+Fa8tGpj58U9p+s+UgPJuk+io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784796407; x=1785401207;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tfZeRrV+FKjPDAPUsepEpIjamzKHab/W7jAWbZQ2n7k=;
        b=jOpoK/A6dkDNnhdBBMZdSZKXniZqlfyk51/OWmTgVITZr9sgUFrR0R06iRr1K6Egzq
         m3r92smjO3ucNd3Q/GJipmgc6J2Zq0ltLwIu/k1W30QTPWvRusTInSQZlqqnMN3Lfebl
         ceje0hK4tnLN/dZY3nOZ0qR35K1CO1QLYCE9kLpdZS4c2C+oMThIhFFwimseh/UMEqTe
         5CJvUEO8d6xcrxT8cXgYykCbHQFUoSVArZT20OmN3ncI0itUny8f415/VvN8J1UYzjiq
         YnKUNU4xlBuJwFHE65ybbc9KWfwYoeQezQT1jVm2+WkZNJUzZJap/7cJWYMumxefvoIv
         noUQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVJjTD7m3AGBQmU/uuChhPfPqVQqAJq4v5O1do1ODKtgRV0Ox0bDLyu5RunFMMRI/oEl5xtq8TlgtuNC0nwVUkqQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzrEgM6fcQAlqaFxh73Dnt4MiJR8bFUKyHyODbejFL6hHM+9Pq2
	MW9FCOp5APc38iBoMi2uDMwm81n90jNX3df45KkaEC3YFdK+K1kVTuBmozDzgPnx3nY=
X-Gm-Gg: AR+sD11a6UaF2XNCLLI58OCWihvdUPGw3VHVebFfrAJ52lGc9PwaLYcZl5k+JhqqQ0n
	jTNo3bbGgAXXOmTWkskRYYX7A2TIVOuusulWE9i3eiOdihS7AZDy+4TE0Sny7s5dWj3DQDKrtAq
	EnImSjO5nvg8LgueIX+ZuNrOq/WEsk4F0FDMn+P1KnXxY2DG2d9STJKlJKaJ1U82OwgD6UEaFb2
	PGFH6WFJM/ubGzrTQMkbcC1vOTUzt229BnCGPUvnvQrK4WrNSD1Gm3vzXnuH9L3XYGFptEK89us
	S/NRBWiWT62wojWrcb245EE7eq66KxtkJ9LljR8TFKbrWeGgKXVZ/mQISboPSDq3pqjYhWZ+1CK
	0H4KBvn7D3Y3pdqOE11T8UUea2BRhAe6nLLXiL2x+Oj5J/TJsITnwoXGcRw/k3ops9Iy35rsec3
	9gg+MHrcfazB/3f6F33lkL2Z/FBpeLT4xj19FJO6QgowBJDDKC71SINiPjpkaVl7rMPX+1A/52a
	f2G
X-Received: by 2002:a05:600c:1385:b0:495:4f84:7280 with SMTP id 5b1f17b1804b1-49574581036mr16974555e9.4.1784796406871;
        Thu, 23 Jul 2026 01:46:46 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653698bcsm185809335e9.2.2026.07.23.01.46.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 01:46:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 10:46:46 +0200
Message-Id: <DK5TITVHE132.3976J7GCA45FS@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] bzip2: fix 'bzip2 --version >
 /tmp/aaa 2>&1' hang
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260716085422.20905-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260716085422.20905-1-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 08:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241797

Hello,

Following up on Paul's review:
https://lore.kernel.org/all/333e485ec6c7e75b8bdbbd18d85398afb8079828.camel@=
pbarker.dev/T/#m03bd736e6e764ed3eb653941a1a42dd762769077

While this is a backport from master, we need a little bit more info for
merging this into stable.

On Thu Jul 16, 2026 at 10:54 AM CEST, Jaipaul Cheernam via lists.openembedd=
ed.org wrote:
> From: Hongxu Jia <hongxu.jia@windriver.com>
>
> According to [1]
>
> As of the current version 1.0.8, bzip2 --version will print version
> info but it will also continue compressing stdin:

Is this something new in 1.0.8 or did it always behaved this way?
>
>   $ ./bzip2 --version
>   bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.
>
>      Copyright (C) 1996-2019 by Julian Seward.
>
>      This program is free software; [...]
>
>   bzip2: I won't write compressed data to a terminal.
>   bzip2: For help, type: `bzip2 --help'.
>
> Debian (and its downstreams like Ubuntu) will patch this out [2],
> making the < /dev/null unnecessary, port a part of debian patch
> to fix the issue
>
> [1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-=
a-program-like-bzip2
> [2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy=
.patch/
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit ae4fe4263ba9d372f9b9e80df4ec4697b51c1f9b)
  ^ Add the added info here in your v2 commit message.
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  ...-fix-bzip2-version-tmp-aaa-will-hang.patch | 62 +++++++++++++++++++
>  meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
>  2 files changed, 63 insertions(+)
>  create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-vers=
ion-tmp-aaa-will-hang.patch
>
> diff --git a/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp=
-aaa-will-hang.patch b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-ver=
sion-tmp-aaa-will-hang.patch
> new file mode 100644
> index 0000000000..84206b2a4d
> --- /dev/null
> +++ b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-wi=
ll-hang.patch
> @@ -0,0 +1,62 @@
> +From a9dd6acbaca836fc4e943e69a31b2e7acda32045 Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 13 Nov 2024 19:49:23 +0800
> +Subject: [PATCH] fix 'bzip2 --version > /tmp/aaa 2>&1' hang
> +
> +According to [1]
> +
> +As of the current version 1.0.8, bzip2 --version will print version
> +info but it will also continue compressing stdin:
> +
> +  $ ./bzip2 --version
> +  bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.
> + =20
> +     Copyright (C) 1996-2019 by Julian Seward.
> + =20
> +     This program is free software; [...]
> + =20
> +  bzip2: I won't write compressed data to a terminal.
> +  bzip2: For help, type: `bzip2 --help'.
> +
> +Debian (and its downstreams like Ubuntu) will patch this out [2],
> +making the < /dev/null unnecessary:
> +
> +[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with=
-a-program-like-bzip2
> +[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legac=
y.patch/
> +
> +Upstream-Status: Submitted [bzip2-devel@sourceware.org]

Change this to a more precise URL (I think sourceware has publicly
accessible archives). I'd really like to check why it has not merged, if
it received comments, etc.

Please send a v2 with the above changes.

Thanks!
--=20
Yoann Congal
Smile ECS


