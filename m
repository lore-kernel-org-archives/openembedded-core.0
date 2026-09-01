Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775A4C61DD3
	for <webhook@archiver.kernel.org>; Tue,  1 Sep 2026 08:25:26 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3116.1788251119319870815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 01:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vVZJrbK4;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482f9309813so572253f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788251117; x=1788855917; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Okm3/T7XRXu8WY2UaJ3JbBL5g0oRCPtH7Rta9vHzUeY=;
        b=vVZJrbK4QMaC449IniED/q8IONs4JSk7xSmuDPECVqiEjB3suyCEazaJvnoTS0W9Jc
         qPMxInRo/EAcXaC/pXez4h7NxvT4bcyibGHNBh3z9YVgybio9RgETOu8hYYw2OoB1s5B
         /IFNbYihNTSnZ0WKLnNFA5jTCWpGvpd5wxcqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251117; x=1788855917;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Okm3/T7XRXu8WY2UaJ3JbBL5g0oRCPtH7Rta9vHzUeY=;
        b=n+42KcAtOC3TigJLNTWURiWyFNl39d+Ig/4qbd3i+J7VSAegK35NY4C3ivkwE5DrPA
         mz2LWFHgaj0NkHi2z+4ijG3T4c5178FORv36TmXnI0TzeyxsLFu9IYuNiE4zVO2Pzbl5
         MQiaZW0P/HRRJjKXR38fJb7OUyDxlmVpXrQW/mMXbBYuRpgs8Ud7RBNptMaBSVMVT4Vv
         hZXIwbsVfMBMGSDZv71RG0kX2zIgRUvRb+EJ5ogkASobJkMfXjQ0lnc7YsLoxV3cevyW
         KrFe0gmvtyu01Xx0M6kHiwypkY2iVvaPKz8Wsqqq53HyrrPfw4vy68IX0SoClihhwthc
         oXWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoCGjtN5EMxTytBFmeedEwVGOeBqPm4VsLyd6Lm8tmhZD79x+2sIx49LpAn1JdN1NjYJOXRUza+RWW3Hf239Ozr3w==@lists.openembedded.org
X-Gm-Message-State: AFuF++kHvW50n6O1kTfKFPuH93DkDw1SUtVVv+XiYHYu2KYkW9mDCtE+
	0kfk3QFFwDElnOVexVPIYVINdc57CLSnlJhinT1qWj2P1y3Ik+3Dsz6G0MzJ5ei09UA=
X-Gm-Gg: AR+sD125RT1nvwkPOUb206dQbUf+4HGXyzdWsJWB8zWC9nzI/U+WxJGOe/OemEva48Q
	1yb98LVIwd2fDNMWyJj3Jb1agExy8CDiFAtBCEC/qgsQSm3YTD1U4TdNFbgSMe/Cv4QMr1OidG3
	crbNG9LnVyfRww0Gw2eyPj12e2MReIu55r2nwlVe6TaEdm8CNuI61itx+F5MlwJFgwNLy9fI/hw
	fNKU4CNvVJNdkfl528FjW8Y4f9uLESQl7mn068p8/yMkajEImz+q5p+7iIneEYw8YZLrmgJcZQC
	srOxwyEmQcouL6oHeNXw7c+W3f6N+Vit2uREk0qzWjtv3pnS0+I2i1GcnEoYXYdKUflN88LPLPw
	VnCYbew6zzN1pV5KXH+fqyFIXvk0VUMo0gUFILErm2D/tONYj9pgtnrrTSB1i2za+JJzpqYx9xk
	DMx0EYCMtJjifqKn2QK4QPoo6CSH0a0qrZ8eH7nitc44KQ+ml7QjzONlrNgBPHhF1AYS+z2HefI
	RKv3OxCeiq+ylzcX0MY+7MhRy8Rz+5CB2tk5kxStlifTgYo
X-Received: by 2002:a05:600c:4443:b0:499:b3f0:ff05 with SMTP id 5b1f17b1804b1-49b91c56f41mr458522785e9.13.1788251117348;
        Tue, 01 Sep 2026 01:25:17 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd8148fbdsm74888845e9.3.2026.09.01.01.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:25:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Sep 2026 10:25:16 +0200
Message-Id: <DL3U45PSQCW3.19FJ2SIN19176@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH] initscripts: avoid service
 dependency in mountnfs.sh
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>, <to@cisco.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: <shinucha@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260825052051.2023677-1-shinucha@cisco.com>
In-Reply-To: <20260825052051.2023677-1-shinucha@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2026 08:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244806

On Tue Aug 25, 2026 at 7:20 AM CEST, Shinu Chandran via lists.openembedded.=
org wrote:
> mountnfs.sh uses "service rpcbind status" only to avoid
> starting rpcbind twice before mounting remote filesystems. That
> pulls init-system-helpers-service into images solely to provide
> /usr/sbin/service.
>
> Use start-stop-daemon test mode for the rpcbind status check
> instead. The script already uses start-stop-daemon to start rpcbind,
> so this keeps the duplicate-start protection without requiring the
> Debian service wrapper.
>
> With mountnfs.sh no longer invoking service, drop
> init-system-helpers-service from the initscripts runtime dependencies.
>
> Signed-off-by: Shinu Chandran <shinucha@cisco.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/initscripts/initscripts-1.0/mountnfs.sh | 3 +--
>  meta/recipes-core/initscripts/initscripts_1.0.bb          | 1 -
>  2 files changed, 1 insertion(+), 3 deletions(-)

Hello,

Thanks for the patch but, to me, this looks like a cleanup fix without
fixing any bugs. Those are not usually acceptable per stable policy.

So, I'm not going to take this unless I'm wrong.
(And, if I'm wrong, then, it would also require an equivalent on
wrynose)

Regards,
--=20
Yoann Congal
Smile ECS


