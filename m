Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B699CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 10:29:04 +0000 (UTC)
Received: from mail-wr2-f18.google.com (mail-wr2-f18.google.com [74.125.225.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8199.1790936942920041768
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 03:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=p18623rV;
 spf=pass (domain: smile.fr, ip: 74.125.225.82, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f18.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so915246f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 03:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790936941; x=1791541741; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZD1jwC/jZAVt5Vdz+DT6t4KliCNIfZD2gzMhSM3BH7Y=;
        b=p18623rVnGsV/Q5JsegaFhMXZ+3ftZGtQ5CF95RztsnwRSRWexY7AlYYkeA/fjTRnl
         iaGZkRZgrnWuj0ykZE1a/x3s05u+MEzY++E7hjlfGx0R1PyihcpcjiQ6GKX5XfgO85LG
         7eGOqsWO1MD9igJbOQvmSH6F3TlKS5j3LDZFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936941; x=1791541741;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZD1jwC/jZAVt5Vdz+DT6t4KliCNIfZD2gzMhSM3BH7Y=;
        b=rEgpm1794HcA4Oj9r3CQtUbR0SrJT4CTiNsa6zfDEACMjkHhmpS5VZyRT4MlD7Va3R
         9Mu3B6FyCxovTSQTfV5b7qWgQPVtpcI9xIUbrGJzp5VEMjAFX001fAO7iTi4+nR7ydSa
         cBYYYgaZJ3Aa2izR5a+k4r1OO6idNABIoSql4w01zbr5rdXYvDjBIVV2nEmvlKTAMq7E
         FATT1uOQ0kRz/vPrpnxFxmGBuopculUKu963T3KOBM2BKpeg1ap9uBMn822epnNckmyb
         OkopLO0lv+nOVOAQwNPaWaBffdzVqpFyYmlwzH+Xuu3wzzU+nRI48F7Xy2KXxrGcVCTN
         WkPw==
X-Forwarded-Encrypted: i=1; AKwUvBz94VbjRe2kXV37SLT2fD6aC34nY06SCKAwCOC85dxePADMzI4pScW+skXcLkW9bSkB4N5gcjdQq/RCauT5EQxaDg==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKPJmPSwV3/Xl/F4D3EOdJJY8SibACqZ8XR57rBXox1aisy4VKi
	U9wpX9tMDUclSGjr0z7WugfjlWqDCXKUqsvPw5I3piIfOpUFO9SmgwDJt4u3XbRkuyU=
X-Gm-Gg: AYBFou2fcWNxayPfQCONooMjT2/6t6kGo96ptExUe1uzPsJFkg+tMgtI0VXEqs7XRxd
	F6NIFrHa5cslLvv4KMOZEguH/IIzbAEqNicyTLY9BS8toy6u9oUfpq1M2pwegZHSxM2YvZjyWS2
	yKBCyMe/ADndILa39y1D0VtZ8O8Wb8ezHpyUD4yY3fftMi+e9vAGHUxxFi68q9+nnMjdeDJzrSA
	+zkyaliIg6LwxOZJPndgPZ6d2YIn8RZdoGVNbIivSOZc0plulfofQSBnNCY7heIhFVx5wp0odKT
	hz68OQCzSHa2YxX2bjbqq5dZxP1wNU8h0wbAcohTvay4e/gysMaOGQkyEyExdjYeugEHISt2ymu
	osX8/MJ1wl9wrpaVEOKMNJJI+cUzgpVUrSOz+yw/cAywaAoWD0pm86yV76Y1OU/92dIup/clkBG
	Sn8v8wojhgcEFiBZ6Jt5f2TMKLG1V597Ipg2tX+8K8oETqb3tW0c6fKl3eIfOrFMonv1DVCa80b
	6wHtPxhTt9ktRst9HBIJ846b5Pz/UzRSwNX6US8+cV6Tm5Zww+7BzumAotm8m+kXAJ8DmuV
X-Received: by 2002:a5d:5e84:0:b0:48a:f52d:ca47 with SMTP id ffacd0b85a97d-48b1275c366mr3795887f8f.22.1790936940930;
        Fri, 02 Oct 2026 03:29:00 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e7esm4167771f8f.0.2026.10.02.03.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:29:00 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 12:28:59 +0200
Message-Id: <DLUA5S2BP8SG.3M190Q21H66YW@smile.fr>
Subject: Re: [OE-core][scarthgap][patch v2 1/4] libxfont: Drop obsolete
 md5sum checksum
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260912114431.357816-1-vanusuri@mvista.com>
In-Reply-To: <20260912114431.357816-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 10:29:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247100

On Sat Sep 12, 2026 at 1:44 PM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb b/meta/reci=
pes-graphics/xorg-lib/libxfont_1.5.4.bb
> index fa6585d6dc..9ec7cc30f5 100644
> --- a/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxfont_1.5.4.bb
> @@ -19,7 +19,6 @@ XORG_EXT =3D "tar.bz2"
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -SRC_URI[md5sum] =3D "16eaf156edd79b68038b6a7c44aa9e9b"
>  SRC_URI[sha256sum] =3D "1a7f7490774c87f2052d146d1e0e64518d32e6848184a186=
54e8d0bb57883242"
> =20
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"

Hello,

This is a cleanup and this is not usually accepted under stable policy.
Unless this fixes a real problem, I have to reject it.

FYI, I merged patches 2-4/4 of this series.

Thanks!
--=20
Yoann Congal
Smile ECS


