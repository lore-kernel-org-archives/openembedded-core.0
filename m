Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDAECDB471
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 15:33:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46050.1782142383221651950
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 08:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JLTAz783;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b1bbcf3aso29870075e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782142381; x=1782747181; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/3tXxhPLgx0cXdTYlTrmelvoXy3BZevDGAKFMw3CcY=;
        b=JLTAz783BT5lH3iHVL1fpB7bOlhBddBk/iJ35PbhagjCBGRB3pZg0cZaPHeJV2wHWb
         BzpbmfbeA5YpLO+4CI4hPSw1R4i8PP4ryCNPEJPolbIQjJ2nqMAJ1a2yNn4uTxyhHZw1
         VmG6tZ+7E5l657VsK5shDY8Z8hXVmAU+PAPH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142381; x=1782747181;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O/3tXxhPLgx0cXdTYlTrmelvoXy3BZevDGAKFMw3CcY=;
        b=Om/AcOAtxOgmJ0yuTFIVKDR5A1M6zr0HVE8NZ6bLg0WSxgUlNIsxi2Dp0VdgVboGXV
         2xKPwAL9ojWuRR+ziVPFxiPshadRgQgkmB72T0lbxhR7CEMlWvsgySDABD8p7s1shUDH
         WPrGmEe3Ey3oirrTEljkwZHuB68zOANlYxX/rrW+vm/CRL/RBPEbS5zoXSShQca5v8uW
         sLeG1xrxABT6DxBUIzXXqEZVXjMN0yXkjvm0v8oqN9Yx6MTkduKag82hglovBV+/LdiG
         atQEbNW2a5gCJYISWFqTdG1WQ7x4k2nMom61okf4AGKxKf6UAQkdkIIa8h3DUvUpMwaO
         y+3Q==
X-Forwarded-Encrypted: i=1; AFNElJ9HuIOdAzQx4U5j/MTEDfU7C0+eQSNmWPadEiFTHzAZAtgcJCu94YA5RtrbsJuRNwSpbhUeSI8D58fO3+teny0jng==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywphvb/Vj37JH/lQ5fPa4ObIKcJhVI7Bj0rcVhXlNYjiJZqUq4l
	s923t07jXNyMblqx4VGhpMs0I+ETUZ+GGLyQkQ7SA5ezxuQZC7W/ac4EzmuOJm2POuo=
X-Gm-Gg: AfdE7cnXzQcSyAZLeo3XKrS4IfHPL8/aeBWabLbXQ1FkK7MYGdYvP90mpu1qRHE/jwo
	uvW8f6QVY+xCoSEx705de9Xhd9ImozbLzOmfab1tjAeW2yCamIj7/OAsD95z0y7nZBJD7VNYcPz
	WV2/3bB2nCEvoW8SAvdls/r4mYvJLBL72ynWCZhh+UVOB83FzRnKZ7cLYWAcebworg2OCBk6pLZ
	Rh+3XQyBdn+Q+AIrn1IM+s49QzwVt4LXD5p7uFzM4F9G8V0gE5+LlMUqLh/dINluQrIFtqizlwJ
	4emq/0roEiirSfi4MH8sjK8k4grgo0gH+6kWUkXQ3XkLP4RLe4Ng5wkFkjrROhEIf00W8nJMB4z
	8IHplv9kXknLYe3stcW9PvJw0c9JvP+96HPo3LSVOqPCaER+Ra+JIn1Vwn9YCJICEzfwqZXESzN
	AaoEGIVX04J33rvSOiSI/9+Ra0yfpHnRNQwgImd/2A74LmUXNHU6KsmqCavz/u0Z5QGNqIlEIXb
	GWQ+iB769ZCTsY=
X-Received: by 2002:a05:600c:a51:b0:492:379c:32ee with SMTP id 5b1f17b1804b1-49249083c09mr176594455e9.6.1782142381077;
        Mon, 22 Jun 2026 08:33:01 -0700 (PDT)
Received: from localhost (2a01cb001331aa00ae343d7f26e6048e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:ae34:3d7f:26e6:48e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a712sm284565755e9.13.2026.06.22.08.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 08:33:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 17:33:00 +0200
Message-Id: <DJFOQZ6T299R.PF4HY5RJ2PND@smile.fr>
Subject: Re: OE-core CVE metrics for master on Mon Jun 22 16:14:33 2026
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, "OE-Core ML"
 <openembedded-core@lists.openembedded.org>, "Yocto Security ML"
 <yocto-security@lists.yoctoproject.org>
X-Mailer: aerc 0.20.0
References: <20260622151809.1336050-1-yoann.congal@smile.fr>
 <20260622151809.1336050-2-yoann.congal@smile.fr>
In-Reply-To: <20260622151809.1336050-2-yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 15:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239310

Note: NVD API is currently having difficulties (slowness, 5xx errors):
the CVE metrics for scarthgap will come later.

Regards,

On Mon Jun 22, 2026 at 5:18 PM CEST, Yoann Congal wrote:
> Branch: master
>
> New this week: 23 CVEs
> CVE-2025-15661 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2025-15661 *
> CVE-2026-12003 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-12003 *
> CVE-2026-45961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-45961 *
> CVE-2026-45991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-45991 *
> CVE-2026-46331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46331 *
> CVE-2026-52908 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-52908 *
> CVE-2026-52909 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-52909 *
> CVE-2026-52910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-52910 *
> CVE-2026-55199 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-55199 *
> CVE-2026-55200 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-55200 *
> CVE-2026-56131 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56131 *
> CVE-2026-56132 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56132 *
> CVE-2026-56403 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56403 *
> CVE-2026-56404 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56404 *
> CVE-2026-56405 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56405 *
> CVE-2026-56406 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56406 *
> CVE-2026-56407 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56407 *
> CVE-2026-56408 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56408 *
> CVE-2026-56409 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56409 *
> CVE-2026-56410 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56410 *
> CVE-2026-56411 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56411 *
> CVE-2026-56412 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56412 *
> CVE-2026-8461 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2026-8461 *
>
> Removed this week: 44 CVEs
> CVE-2026-11822 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-11822 *
> CVE-2026-11824 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-11824 *
> CVE-2026-23679 (CVSS3: N/A): libusb1 https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2026-23679 *
> CVE-2026-29518 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-29518 *
> CVE-2026-31688 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-31688 *
> CVE-2026-3276 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-3276 *
> CVE-2026-34180 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-34180 *
> CVE-2026-34181 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-34181 *
> CVE-2026-34182 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-34182 *
> CVE-2026-34183 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-34183 *
> CVE-2026-42764 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-42764 *
> CVE-2026-42766 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-42766 *
> CVE-2026-42767 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-42767 *
> CVE-2026-42768 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-42768 *
> CVE-2026-42769 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-42769 *
> CVE-2026-42770 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-42770 *
> CVE-2026-43617 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-43617 *
> CVE-2026-43618 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-43618 *
> CVE-2026-43619 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-43619 *
> CVE-2026-43620 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-43620 *
> CVE-2026-45232 (CVSS3: N/A): rsync:rsync-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-45232 *
> CVE-2026-45445 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-45445 *
> CVE-2026-45446 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-45446 *
> CVE-2026-45447 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-45447 *
> CVE-2026-46727 (CVSS3: N/A): ruby:ruby-native https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2026-46727 *
> CVE-2026-47104 (CVSS3: N/A): libusb1 https://web.nvd.nist.gov/view/vuln/d=
etail?vulnId=3DCVE-2026-47104 *
> CVE-2026-47167 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2026-47167 *
> CVE-2026-50256 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-50256 *
> CVE-2026-50257 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-50257 *
> CVE-2026-50258 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-50258 *
> CVE-2026-50259 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-50259 *
> CVE-2026-50260 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-50260 *
> CVE-2026-50263 (CVSS3: N/A): xserver-xorg:xwayland https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-50263 *
> CVE-2026-50292 (CVSS3: N/A): libinput https://web.nvd.nist.gov/view/vuln/=
detail?vulnId=3DCVE-2026-50292 *
> CVE-2026-52858 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2026-52858 *
> CVE-2026-52859 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2026-52859 *
> CVE-2026-6846 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nativ=
e:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2026-6846 *
> CVE-2026-7210 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-7210 *
> CVE-2026-7383 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-7383 *
> CVE-2026-7774 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-7774 *
> CVE-2026-8328 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-8328 *
> CVE-2026-8376 (CVSS3: N/A): perl:perl-native https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2026-8376 *
> CVE-2026-9076 (CVSS3: N/A): openssl:openssl-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-9076 *
> CVE-2026-9669 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2026-9669 *
>
> Full list:  Found 115 unpatched CVEs
> CVE-2011-3374 (CVSS3: N/A): apt https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2011-3374 *
> CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2022-4543 *
> CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-6238 *
> CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-6240 *
> CVE-2024-2236 (CVSS3: N/A): libgcrypt:libgcrypt-native https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2024-2236 *
> CVE-2024-43802 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2024-43802 *
> CVE-2024-47850 (CVSS3: N/A): cups https://web.nvd.nist.gov/view/vuln/deta=
il?vulnId=3DCVE-2024-47850 *
> CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2024-50613 *
> CVE-2024-52005 (CVSS3: N/A): git:git-native https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2024-52005 *
> CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://w=
eb.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2024-6519 *
> CVE-2025-15366 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2025-15366 *
> CVE-2025-15367 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2025-15367 *
> CVE-2025-15661 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2025-15661 *
> CVE-2025-50422 (CVSS3: N/A): cairo:cairo-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2025-50422 *
> CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2025-52194 *
> CVE-2025-71074 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2025-71074 *
> CVE-2025-71306 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2025-71306 *
> CVE-2025-71308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2025-71308 *
> CVE-2025-71313 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2025-71313 *
> CVE-2026-12003 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-12003 *
> CVE-2026-23328 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-23328 *
> CVE-2026-23374 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-23374 *
> CVE-2026-23377 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-23377 *
> CVE-2026-23459 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-23459 *
> CVE-2026-28529 (CVSS3: N/A): cryptodev-linux https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2026-28529 *
> CVE-2026-3099 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/de=
tail?vulnId=3DCVE-2026-3099 *
> CVE-2026-31501 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-31501 *
> CVE-2026-31771 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-31771 *
> CVE-2026-31777 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-31777 *
> CVE-2026-3184 (CVSS3: N/A): util-linux:util-linux-libuuid:util-linux-libu=
uid-native:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-2026-3184 *
> CVE-2026-3441 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nativ=
e:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2026-3441 *
> CVE-2026-3442 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nativ=
e:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2026-3442 *
> CVE-2026-3632 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/de=
tail?vulnId=3DCVE-2026-3632 *
> CVE-2026-3633 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/de=
tail?vulnId=3DCVE-2026-3633 *
> CVE-2026-3634 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/de=
tail?vulnId=3DCVE-2026-3634 *
> CVE-2026-37555 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-37555 *
> CVE-2026-40930 (CVSS3: N/A): libpng:libpng-native https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2026-40930 *
> CVE-2026-4271 (CVSS3: N/A): libsoup https://web.nvd.nist.gov/view/vuln/de=
tail?vulnId=3DCVE-2026-4271 *
> CVE-2026-43009 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43009 *
> CVE-2026-43022 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43022 *
> CVE-2026-43042 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43042 *
> CVE-2026-43045 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43045 *
> CVE-2026-43053 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43053 *
> CVE-2026-43095 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43095 *
> CVE-2026-43115 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43115 *
> CVE-2026-43131 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43131 *
> CVE-2026-43174 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43174 *
> CVE-2026-43191 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43191 *
> CVE-2026-43204 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43204 *
> CVE-2026-43228 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43228 *
> CVE-2026-43299 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43299 *
> CVE-2026-43308 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43308 *
> CVE-2026-43310 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43310 *
> CVE-2026-43311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43311 *
> CVE-2026-43326 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43326 *
> CVE-2026-43344 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43344 *
> CVE-2026-43391 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43391 *
> CVE-2026-43443 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-43443 *
> CVE-2026-45850 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-45850 *
> CVE-2026-45945 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-45945 *
> CVE-2026-45961 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-45961 *
> CVE-2026-45963 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-45963 *
> CVE-2026-45991 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-45991 *
> CVE-2026-46008 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46008 *
> CVE-2026-46017 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46017 *
> CVE-2026-46032 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46032 *
> CVE-2026-46054 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46054 *
> CVE-2026-46153 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46153 *
> CVE-2026-46203 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46203 *
> CVE-2026-46210 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46210 *
> CVE-2026-46245 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46245 *
> CVE-2026-46252 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46252 *
> CVE-2026-46298 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46298 *
> CVE-2026-46302 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46302 *
> CVE-2026-46311 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46311 *
> CVE-2026-46320 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46320 *
> CVE-2026-46330 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46330 *
> CVE-2026-46331 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-46331 *
> CVE-2026-48914 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://=
web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2026-48914 *
> CVE-2026-50219 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-50219 *
> CVE-2026-52860 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2026-52860 *
> CVE-2026-52908 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-52908 *
> CVE-2026-52909 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-52909 *
> CVE-2026-52910 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vu=
ln/detail?vulnId=3DCVE-2026-52910 *
> CVE-2026-5435 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/deta=
il?vulnId=3DCVE-2026-5435 *
> CVE-2026-54411 (CVSS3: N/A): libpam https://web.nvd.nist.gov/view/vuln/de=
tail?vulnId=3DCVE-2026-54411 *
> CVE-2026-55199 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-55199 *
> CVE-2026-55200 (CVSS3: N/A): libssh2:libssh2-native https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2026-55200 *
> CVE-2026-56131 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56131 *
> CVE-2026-56132 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56132 *
> CVE-2026-56403 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56403 *
> CVE-2026-56404 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56404 *
> CVE-2026-56405 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56405 *
> CVE-2026-56406 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56406 *
> CVE-2026-56407 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56407 *
> CVE-2026-56408 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56408 *
> CVE-2026-56409 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56409 *
> CVE-2026-56410 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56410 *
> CVE-2026-56411 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56411 *
> CVE-2026-56412 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2026-56412 *
> CVE-2026-5673 (CVSS3: N/A): libtheora https://web.nvd.nist.gov/view/vuln/=
detail?vulnId=3DCVE-2026-5673 *
> CVE-2026-5704 (CVSS3: N/A): tar https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2026-5704 *
> CVE-2026-5928 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/deta=
il?vulnId=3DCVE-2026-5928 *
> CVE-2026-6238 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/deta=
il?vulnId=3DCVE-2026-6238 *
> CVE-2026-6844 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nativ=
e:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2026-6844 *
> CVE-2026-6845 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-nativ=
e:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE=
-2026-6845 *
> CVE-2026-8461 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2026-8461 *
>
> Summary of CVE counts by recipe:
>   linux-yocto: 65
>   expat:expat-native: 13
>   libsoup: 5
>   binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
>   glibc: 3
>   libsndfile1: 3
>   libssh2:libssh2-native: 3
>   python3:python3-native: 3
>   qemu:qemu-native:qemu-system-native: 2
>   vim: 2
>   apt: 1
>   cairo:cairo-native: 1
>   cryptodev-linux: 1
>   cups: 1
>   ffmpeg: 1
>   git:git-native: 1
>   libgcrypt:libgcrypt-native: 1
>   libpam: 1
>   libpng:libpng-native: 1
>   libtheora: 1
>   tar: 1
>   util-linux:util-linux-libuuid:util-linux-libuuid-native:util-linux-nati=
ve: 1
>
> For further information see: https://valkyrie.yocto.io/pub/non-release/pa=
tchmetrics/


--=20
Yoann Congal
Smile ECS


