Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F11F0C79FB9
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 10:38:10 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10876.1789036688547008417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 03:38:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f6A7Z9pe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so54129835e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 03:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789036687; x=1789641487; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UzNFqdDpixwNfysGnjHgBLSG1Rb1IMxqHHBfsHq625c=;
        b=f6A7Z9peKeAsZiCXYXOwik5Q02Cudz4yxWbPjTAmMA/8QKV+4WB4UXKLN4RY8NPWRa
         2DyOZgDHh9KnCWc/gxC/wTgl3xrmWXK2yHWmf+GT3o3SzsIIGB1+Vgov8nFteoserSGZ
         4f4VRQ+0UEbDDCPFbW5MCHO4bqbMIabPXKYM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036687; x=1789641487;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UzNFqdDpixwNfysGnjHgBLSG1Rb1IMxqHHBfsHq625c=;
        b=kWURIk2REKDrpLJUMYmcSfZbt7xh3TYsDMMOq1W3+icJLNsvkUKnI4SM8OROSSvk/8
         qPhTb1Pvwg1ZcNz471iQ6ct/9vyW78JK3J1ADyvUexs6g9hECwauu1pHxtNk3aYBuZj9
         32eRu80LNYuYBXLQCGQkioocYtznMDqU2xVCAHqoaN3xyG3t+S5v8ibmD1sr10XI4KKm
         AKPPZaB8IBRR3uJiaaELORC/qAAQnflotmuhQiFpH7zJrP/KqLHyf8CSmQkzOVpuj/sO
         wP7JvpDfbf5fWMQEaxgrSiPf8sE554ITJ27HcSBUQfzHXu7PC86io6CJwwjPKim1R8pO
         aufw==
X-Forwarded-Encrypted: i=1; AKwUvBw2Qkxbq6CpwpLWHdYElzm9cwT5a4yJVkDKc5jmc3ipL1ERa4M/l5d43HyVbch4xlUlt5TtkG/h8acKzJpE0GdG4w==@lists.openembedded.org
X-Gm-Message-State: AFuF++kHKtCs6UBy+OGr6ADN77uWvAXvxPmxzmNjPDFePnpCkHbHxnEf
	AhVehDYp0t6fno4+XIyYdvJIs4bTtICZb9/Oi+lNReEiZCzjUbBKQtljA30G//LiSo47LA+sa9a
	ovvlnl1U=
X-Gm-Gg: AYBFou1j9mMtwi5vvwH5d4JMYWWAqBrCvr5f+XmnnQhdO/NuFTO6oR/Vq7x5kakNwrY
	v4avn73TED0uA0I2US6u7JJicFDA4rGwHmrx4cQJ1hf1YRFqrAIKr/a8OrdZbc4pNwJx9ORMP/1
	RiJuYI/2YQ+WDrcPefNPplMXP7FqS/ChzegDUGgxnkhFW17X84c32bv2CPR5mM9McvjpFW0kFg4
	hfSaJi4MjpJSP6w8m1ZPU1X1fXTQFlSkxd8RsYQNxPGAPl/BeMw4skJALGDup1s4nqi8FOkt7RW
	O8VlDgi9eTR4cWcWLw7ad5T1K4EdcIlmQsBCwinoi/83/SW0hjEFg1jF+j1rjFUGPMbUe0Ns1y/
	wAQ3+eyefPkHrCn2hIE5uFVNA+bDwhvNO1xOaRcDf/c/T2BHM1sR1D3JPkE2XJcj5edX6X3cLM7
	l93lDXgTz7BliLD5HcTnTm86NajVTJHhIh/EG5UcfW5UZeRS0SuZ1XKRdgMhw5/6Dy6Y/rppjf2
	I2hxGEGzcKmeSGylbSTO7jUhx/qjRLUPjWPkoBmElYfWXghpP1xGYyL76UUbVznMQ==
X-Received: by 2002:a05:600c:46d1:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49cf820c992mr420531745e9.6.1789036686797;
        Thu, 10 Sep 2026 03:38:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:788a:18da:6c2a:9f16? ([2001:8b0:aba:5f3c:788a:18da:6c2a:9f16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26bdb789sm74735735e9.1.2026.09.10.03.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:38:05 -0700 (PDT)
Message-ID: <50f193055b9887a99bab6d90ce6a499ac7fab1ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] maintainers.inc: Update owner for strace pigz
 libcap-ng popt
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kris.Gavvala@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2026 11:38:04 +0100
In-Reply-To: <20260902001329.31484-1-kris.gavvala@windriver.com>
References: <20260902001329.31484-1-kris.gavvala@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 10:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245549

Hi,

On Tue, 2026-09-01 at 19:13 -0500, Gavvala, Kris via lists.openembedded.org=
 wrote:
> I offer to take ownership for the following recipes:
>=20
> - strace
> - pigz
> - libcap-ng
> - popt
>=20
> Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
> ---
> =C2=A0meta/conf/distro/include/maintainers.inc | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
> index 2966cddc05..7532f6173a 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -323,7 +323,7 @@ RECIPE_MAINTAINER:pn-libatomic-ops =3D "Unassigned <u=
nassigned@yoctoproject.org>"
> =C2=A0RECIPE_MAINTAINER:pn-libbsd =3D "Yi Zhao <yi.zhao@windriver.com>"
> =C2=A0RECIPE_MAINTAINER:pn-libc-test =3D "Unassigned <unassigned@yoctopro=
ject.org>"
> =C2=A0RECIPE_MAINTAINER:pn-libcap =3D "Yi Zhao <yi.zhao@windriver.com>"
> -RECIPE_MAINTAINER:pn-libcap-ng =3D "Yi Zhao <yi.zhao@windriver.com>"
> +RECIPE_MAINTAINER:pn-libcap-ng =3D "Kris Gavvala <kris.gavvala@windriver=
.com>"
> =C2=A0RECIPE_MAINTAINER:pn-libcap-ng-python =3D "Yi Zhao <yi.zhao@windriv=
er.com>"

I just realised you should take libcap-ng-python as well as they're
paired to the same source tarball.

Cheers,

Richard

