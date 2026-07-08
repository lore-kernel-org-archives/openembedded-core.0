Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCCBC43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 15:19:12 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10911.1783523948589348944
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 08:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=fuq9/zPY;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493c19bad03so7874725e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783523947; x=1784128747; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pzPHHCG4CAvkn29P2S5Jiz3tMyAeOS6vEkbPEwf6CMo=;
        b=fuq9/zPYABZ4OrcPg5EE0hfg6O2vgr/i52ICAPgccZP091stYB9OaoR7lupA/RwUwm
         M60sJUf2Gkkv6t77ehnYx3+/vugxtrdeBDDNHp1VE0SKEinMbceJ372Y4J+GkWwzmp+b
         5ebs+CLzJWj6i7KSxUJQKRjGyzV2U1Eu5d7us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523947; x=1784128747;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pzPHHCG4CAvkn29P2S5Jiz3tMyAeOS6vEkbPEwf6CMo=;
        b=RJNIWZp9nrgXdSNkKLFPYYhbtY9tGmBsBuag7eNOOP/dd7wm/GHVWCga/Iq74Kr2G6
         2tJECvfVwl9iwLzgI9NYzlg7vXafiKsaR4z8q3Wm+c9jYkMZp9qQTqNkmGxmi6JJ+lwv
         8jjOGA+cUhKm0seYkDnC8sxI55QGYRcwlR6sUt2OH78GqKCetUNrU8sg7ZRo4vsZjDBT
         i9HRUtKrmc1MmTkkvaXc8BjUu2Kw2+I39I2vlta3dWNaz4Y1MkqAM3bKskSC9EnHoXv8
         tCAkse2XdHTLMe3DMKH/PwjTAKFHYYS14Mz4LtCn4S/vhs/UboSLu/JsO5oOMfVZdXcZ
         r7aA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4TB3Djh4V9ZM8DIrl1HVKgkXiAc3/FF7L77gd/tGL/0Rwt94QWJJCGjO6UGp8ZOYoOOWZLooZlqO06obWpRfQzA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwpK7KEsau/lVf2CZAjNhZn5uMMBlrjx8fGkVxzui55eYL+ksY/
	iMfdk/HD4Xii3nMORhbf4wkeP+SnEvzXN7o9xUo7pmBkfDbdiWE/5FAvW4GDZI65J6U=
X-Gm-Gg: AfdE7cnZeQRVkEtzIR9inW205446tQ+h2TqpC9WG4v0gDt9tT0HSY94l/re68sywuN6
	9Eaar+VbBC/fZxxdmYw1W950U7IlMCoOk0LUupdHhpWK/Yn7Zs+ebWVMDQun0WCk1s2QmedKjX/
	671iXbziv/B+ztKaA0XN1wOPLgL8/Y6uYY9iIiC2lVuZ8+m7gMuMoMM+e5OCzTfClX6fbCItYKe
	UCGRBPPLH1kQ35E5rNVTGnQVrDL009MjnO5H8YOSa6SCYnQwzToIs0YXRR9EGzQ7usomH+qDL/b
	XOcn7JDyHai00HWTAai2DbzI9EVRB0IyvYitI71WkQoiGz8uqyKoKPGZIzFvi48CXLY9I3+05va
	LGDAB/IfUClebpvMsZVq6XoD13I5QvwPBk9Cquiedtuh4yFPYiPNsRl0KpUzRLtYyPmqeUjOeOK
	eknOyWA8jQ3AkdiuFNbNllqzXuFljppzwA7ccTp5DIhQVVgcRKNG3iqJ3PV9z7h8Qp2Rwgo3qe
X-Received: by 2002:a05:600c:8b34:b0:493:b03c:5650 with SMTP id 5b1f17b1804b1-493e685f1dbmr30462405e9.19.1783523946642;
        Wed, 08 Jul 2026 08:19:06 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ebf593sm152818185e9.0.2026.07.08.08.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:19:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 17:19:05 +0200
Message-Id: <DJTAH1N4F2K6.2E4QADD7JMHLN@smile.fr>
Subject: Re: [OE-core] [PATCH] gzip: fix CVE-2026-41992
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <jaipaul.cheernam@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20260707143421.34255-1-jaipaul.cheernam@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 15:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240490

On Tue Jul 7, 2026 at 4:34 PM CEST, Jaipaul Cheernam via lists.openembedded=
.org wrote:
> Backport upstream fix for a global buffer overflow in the LZH
> decompression logic (unlzh.c). The left[] and right[] global arrays
> shared across LZW and LZH decompression routines are not reinitialized
> between files processed in the same invocation, allowing an
> out-of-bounds read in the LZH decoder.
>
> Reference: https://nvd.nist.gov/vuln/detail/CVE-2026-41992
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>  .../gzip/gzip-1.14/CVE-2026-41992.patch       | 32 +++++++++++++++++++
>  meta/recipes-extended/gzip/gzip_1.14.bb       |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.p=
atch
>
> diff --git a/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch b/=
meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
> new file mode 100644
> index 0000000000..5d3534fcb1
> --- /dev/null
> +++ b/meta/recipes-extended/gzip/gzip-1.14/CVE-2026-41992.patch
> @@ -0,0 +1,32 @@
> +From 63dbf6b3b9e6e781df1a6a64e609b10e23969681 Mon Sep 17 00:00:00 2001
> +From: Paul Eggert <eggert@cs.ucla.edu>
> +Date: Wed, 15 Apr 2026 12:00:17 -0700
> +Subject: gzip: don't mishandle .lzh after .Z
> +
> +Problem reported by Michal Majchrowicz.
> +* unlzh.c (read_c_len): Clear left and right when n =3D=3D 0.
> +
> +CVE: CVE-2026-41992
> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/gzip.g=
it/commit/?id=3D63dbf6b3b9e6e781df1a6a64e609b10e23969681]
> +Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

Hello,

This patch is slightly different from upstream (without explanation):
-Subject: =3D?UTF-8?q?gzip:=3D20don=3DE2=3D80=3D99t=3D20mishandle=3D20.lzh=
=3D20after=3D20.Z?=3D
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
+Subject: gzip: don't mishandle .lzh after .Z

-Problem reported by Micha=C5=82 Majchrowicz.
+Problem reported by Michal Majchrowicz.

... and the THANKS file was dropped.

Micha=C5=82 name was transcribed as Michal. I don't know how "nitpickery" i=
t
is...

Regards,
--=20
Yoann Congal
Smile ECS


