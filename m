Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162A0C531C9
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 20:57:44 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17925.1785099459858243956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 13:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Iyj3TxRp;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-476a130c138so2030579f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 13:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785099458; x=1785704258; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2kQ3ebscO3VJS96yI6WZIPyRqCvGyoMdjFCh0uSvayg=;
        b=Iyj3TxRpBqsDUWMDg7jmcN4NpsoGtPNo5r9pCmGW/MwF5BXlNFJoVqtEE/KRJOb23v
         VhfF56WnuBWM7ZQ2OopmqPXPa0fdger5zKJeVw/lMDrqZ23u4i0TA4XMySDLv069HCYe
         cyNodNpEtqIDrtwWqjv/drWMp/+QiHx73QRCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785099458; x=1785704258;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2kQ3ebscO3VJS96yI6WZIPyRqCvGyoMdjFCh0uSvayg=;
        b=HxeCTGbFIuZjkiFMnZ9V+B/sAaCFkth4tkcQzRd1bld1voFwEvUBkIBJf1Ykx7rREb
         mbOccaITDCW2sydjlyIRxHon6YN3qopCj7DP1WZ+peutIdjryJLpZ+Lk5GPaoMf0ZbhJ
         kIMFrxjLiLt5xUJ2uBn1orpzowNDbr9DZ1kqk8oiZycGuWMTf1ckcG8P/ktJzev6eGmX
         3K2YesTYGnfKSytL+ZQYHjIU+mVbIzEpAzeaNXrItFEAi8c/9njwu7CvoYKewnzV3U6X
         5kgyuCarvQ3v2KHK2zoL3Zkt+tVBw5xzwRahw4U+pU5oQAY16qXWnIYp5w/cmKuP7kww
         P5iA==
X-Forwarded-Encrypted: i=1; AHgh+RpE60UB4u/R2aAtV+r+6DELbHQpFtAREEMnFX82VOJ4PY0oLDGAr1cxUj2PV6JxGTLk+bhpu5+dVhl1jKH2kdTc+g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwFTTE+E1nz4VEHF4NQgpRsec871hi68YkMR7Cp0GckQ+ouMTYd
	xR8Ampv3IhBNAX70caylzTt/6mcK9J7bxMoBepQsg7zJN78aKVuTN7KsxpVD0QETg+U=
X-Gm-Gg: AR+sD10b+o2y4LnQmRI1ufJW4JoCHO2ostJvVHAzyBle+FuNmH6ssaG0zdnTGdN3vjd
	0OrXv5OwEQp7erPzgmrXlrgRLAOBrRTPlRY5Jgvx3UEezk/cMKM2CraHVHbxM3Jop4ffrkddcVW
	9wm2XEV2okNYchm/7cT4J9m5a6136vgWKciGWyX8oRU7Mw2NUm4FDY+k97tfc2B23VXHtVa9boD
	9v4f8S6wjETkDBGp1Eyu3lAVsmsWoPQ8Cw1d5aTWNvfEfd053phusaxxNEkq5JuS2Nx4EBRKLNF
	bC7Quh1Dks8gY5XMFFvjuEad8gIXxw5sPYJdG8sLyg4tyKfnJk+pKD35ssx+k9bV8lx6igM1PUK
	DAmJi3tGYG56tkz4RZ+MTsSQb6p3/6045Ofgw/2X2VyeeLOiMd6S3kJSYCc2ssjcHzJevwNlu5e
	y5vHL09Xiq3agJzw+hsWBOmUpIonwOcf+5mwNofhPgW+1nCcYo8AtiNCGE/PoNOehA9g==
X-Received: by 2002:a05:6000:178d:b0:475:f100:35fb with SMTP id ffacd0b85a97d-47f9fea9de3mr8015048f8f.56.1785099458097;
        Sun, 26 Jul 2026 13:57:38 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm41882347f8f.16.2026.07.26.13.57.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 13:57:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 22:57:37 +0200
Message-Id: <DK8SY1QBHDG2.101O7THERYBW3@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/5] wget: fix CVE-2026-58470
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260722082330.15415-1-amaury.couderc@est.tech>
In-Reply-To: <20260722082330.15415-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 20:57:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242022

On Wed Jul 22, 2026 at 10:23 AM CEST, Amaury Couderc via lists.openembedded=
.org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> Backport patch to fix CVE-2026-58470.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-58470
>   https://www.cve.org/CVERecord?id=3DCVE-2026-58470
>   https://security-tracker.debian.org/tracker/CVE-2026-58470
>   https://ubuntu.com/security/CVE-2026-58470
>   https://osv.dev/list?q=3DCVE-2026-58470
>
> Upstream fix:
>   https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6ff=
d30c34ffcf [nvd]
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../wget/wget/CVE-2026-58470.patch            | 78 +++++++++++++++++++
>  meta/recipes-extended/wget/wget_1.21.4.bb     |  1 +
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

Review from Hetvi Thakar:
On Thu Jul 23, 2026 at 10:44 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) wrote:
> I reviewed the earlier series.
> It looks like the follow-up upstream regression fixes for
> CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
> These follow-up commits are required to complete the backport, and I
> have included them in my series .
> I kindly request you to review my series as well.
--=20
Yoann Congal
Smile ECS


