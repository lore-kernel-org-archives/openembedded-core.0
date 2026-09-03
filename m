Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89243C624DB
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 20:45:55 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.772.1788468347364140032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 13:45:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uLvbcSkX;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47fe89fb333so220579f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 13:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788468345; x=1789073145; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V80ZTyKuOBXKbpy0R/j0ATCUJCCsCsa+XKi9BIGpwiw=;
        b=uLvbcSkX/ZTVOAt3Gb9l/h43MpVBhWFRikEY/jRpWK5HUKD8IjSG5a4UTHQv/ecA8Q
         3ynbTkuQf9i42iusynGkshTM8cevK6re3jTn6aVlPYwjeHDt2jHRJ8ebjrDtehZdms7V
         8A7Bw/cWV7PElD11VLrUl92ZIWlGUEsQX16f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788468345; x=1789073145;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V80ZTyKuOBXKbpy0R/j0ATCUJCCsCsa+XKi9BIGpwiw=;
        b=jtmAe8Fo9CxPB3B4w6ua1yG2G0Kpokr++ZT+hCekI2S5wJVHuK2RA3XcFQpmoXlum/
         zs22NeBZW1urR2DhEBSsVRpSmZlJAoHyNAnxeXLUH7tavdIDH/TQrH1xMSyaj6cVUB6P
         v0RnQDhut5ulqoUrzzGD40I6f4Fr3nULkzZRWhimazWBeE36olKlfkCesk/6SLZaV1KA
         6tW8JltdVxMcenKg+52oYJJTlA56L0g+7yu1ouH4lFMqR9J83J+Mtm3PyYAAa4d7CAJs
         /QG9QKO7zfXxWJVFQ4DST5+MfQfR5Nq2Y/v4CJYzDTP56Mh2OR2Imrl4Nh+lSmHVp813
         oNGw==
X-Forwarded-Encrypted: i=1; AKwUvBxjV9O1PtQnGXq6URNRAunG6OsTe6PjTgmpSXJrj5NoVxphIQumokLIac22WW5AKWKU+6qVmLhmlhB7A7kQBC/HuQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++kbUqBal6wB1bU8cVYqB3hlWRqo0YfS+m96aAzy33cQ10OLAniY
	Pzy77i2EwPQkYW/y99Fv+KTqc00j1ec+FNaQZlCRuLhJuX6TWR/VDQY+RSLus7nZfNo=
X-Gm-Gg: AYBFou3unEsV044kG24Qvsx5dRV3aEvVBbSonlEJsXeSSwcZC+qqNzzZXql9M502td9
	aDdcklCNGM8UbYpR+Qzbj7VS+niYoTzrPnQl2hRuAc+upjarQW7V9ET1zsdJWAXT1fXq4FwXAE+
	csW7hLEIZIWYJRphgVgr3pIlBUkVqhtHkk4f3Q7w21T/LluribdQL6FXy3/2FwTJuF2PJP71fyd
	uXnF91W4n32FHEE1NITclrZdI1mX0ZOT+XjZIAy9AUrOzv5H03+oQ8KRr4invcKEr9MiAFHJE8Q
	Ur24BwPNieFvAEw+kNhzOdsaWbfEfArrpwE/xsOnVgsgU2Wqi2eL1re3+fXYBjsh60vkfjBsPwb
	Nma+3A5GBzZTAMQyFgmGMAPZJTHWaJ2ZcFrO7wHfsqmzDo+Q4SEajobr3wCkuMW9zUKJpghVe3c
	p55+JK0QmXMtEhRasKmTxZ0A/xAoYQY1xFHKaQ649y9eqMtpavDnygJGusaIHC0zLi5xvzzQAZG
	SW/eRrP+1nTLYWFXJB+OxumPWRQJy2syYy9XCdbdADOd6iXp6nGwUKWRIfrow==
X-Received: by 2002:a05:6000:29d2:b0:484:3cbf:f254 with SMTP id ffacd0b85a97d-485872ae327mr2117179f8f.21.1788468345547;
        Thu, 03 Sep 2026 13:45:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa00939d825f00cb3861.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:939d:825f:cb:3861])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm1007545f8f.26.2026.09.03.13.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:45:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 22:45:44 +0200
Message-Id: <DL5Z475KF36A.2GWHJC82115IA@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 1/3] libslirp: fix upstream version
 check
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260823155741.2091982-1-peter.marko@siemens.com>
In-Reply-To: <20260823155741.2091982-1-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 20:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245042

On Sun Aug 23, 2026 at 5:57 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>
> The regex excludes bogus old yyyymmdd tags which sort higher than real ve=
rsions.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (From OE-Core rev: 2a60e5db4460cd8ec99b43d8f2ff733ba509c373)
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta/recipes-connectivity/slirp/libslirp_4.9.1.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb b/meta/rec=
ipes-connectivity/slirp/libslirp_4.9.1.bb
> index 9f7005d709..50577fd4ae 100644
> --- a/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
> +++ b/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbca0186b14e6=
b05e338e729f106db727"
> =20
>  SRC_URI =3D "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=3D=
https;branch=3Dmaster"
>  SRCREV =3D "9c744e1e52aa0d9646ed91d789d588696292c21e"
> +UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> =20
>  DEPENDS =3D "glib-2.0"
> =20

Hello Peter,

Thanks for the series. But, with regrets, I don't think it is acceptable
under the policy:
* 1&3/3 are not bug fixes (UPSTREAM_CHECK_GITTAGREGEX is not used right
  now on stables)
* 2/3 is the upgrade. It contains:=20
  "Changed: bootp: allow https for UEFI HTTP boot"
  and that is a feature change (even if, behind it there is only a one
  line change)

I think you did this backport to fix CVE-2026-9539. I think we'll have
to backport the fix, (like you did on scarthgap).

Thanks!
--=20
Yoann Congal
Smile ECS


