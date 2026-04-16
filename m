Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148ABF8A174
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:20:04 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13843.1776345594522092145
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 06:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ok15LJO0;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so106334525e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776345593; x=1776950393; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6X7HeqCNAFzHsPc19miYKi37KOc/fHU4ilGI58YSqU=;
        b=Ok15LJO0l4QFZ6otSWrsPyOdZE0hka3Wtallxs2RjCPZ90XRVwEISHfgLKU1X/gO5S
         GLrkKOF0M2leTBVPgcBnQR+VA05o0a/VH0jjJPBOBDsNPlknacy9SknPNIQ8R3jk9aT0
         9W7cQR3MaChvbk5Re6WPod5baCQkXXvXDXh7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345593; x=1776950393;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v6X7HeqCNAFzHsPc19miYKi37KOc/fHU4ilGI58YSqU=;
        b=TBmb1QtgHVzLofVpg4K3qgQBifRwOYUxfrUVXbVHlmhTEqgL97XJtyTnktWiEBRvZL
         9MHo1lRSvbVgqoZLRgiQVBgbtk+UvtWtJzNQMzLCrSd+gbzVoblUX429xyUIybbIQeWL
         wk1fbR/ZYV+N/ahpnmeWVXBadKatfJpdlAXKG70PMojKjVddNPj60PyTWcY1Ss1N6W3+
         VcKGQ8cKpDV31PQncwc1aIULhO7lxTsbw3WzjMUlXtycVxtLmaXxRrdQ0YdSPuAIukfe
         +MDGkdYzopR4BEXZdqR9BOxN59X2fHvmfpsI/jwt6pao1+OB5LqBz6ZzG1lT7DlA+iQX
         3P+w==
X-Forwarded-Encrypted: i=1; AFNElJ+kSWJlO7yehhqRjDAS9zSBwhW6fbQbQqB/l/R2/PZ75MRZ52VWiju4uuaqrhFL8y3V0w4dEbduY55IAR+Y+hucmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzyDdK3355iF7YRuB5pxTl9xqSOJvdG0xAymSI7ZrXsVA4Xg1uD
	SvY1odJVo7hjJM0VrUDHkLxUSchfu9s+QOW9WETTuoGtjc9WQXupbTuYtJUfTHSvVJ8=
X-Gm-Gg: AeBDies6OYE8WdWnIouYCq7bqgcbFJP08kZ7V940BKvnysatihentq6fGSh7Spnomix
	3XfCIFJlhFBkDr+VDI/m2D4D5x+2E8XYPZQGJBO34/cHLNFRyju9ZHj99ysBryf9P0jGJWADhRE
	hczNeS8IRG07dB6qL8JyYf/moN4dSNndeRJHFuC25/0/DXOMhuC6Z2Ny3IXMTLre7cS4Zf1SR7S
	7ys1nCQ1u7nyuXt3HsE1dqD96sC2sJPaCFRLOrMveBwQ+28ndh0W67LJ4FomBx87uDlQ747Aety
	hwJDIP2GXRDGZM1pxkyHnpNJz52U55dUzo2muMhnhc+4rQy2is3g1pRWuwEdFuubE/Vh5SPNSDQ
	3FuKfXj0+P6lfyWMZQy7DvRVL3kniRqiDD8SxNnKRYCTPiZbQCOUqoUd4kxd4dJNqIDOz3xixkH
	NDsVFm9c8i9SUbGu7YGLUyLEUP6XnsDdngX+5x6VdrHcnhSbcDGyA+yFFOIER3ZgTYgWYayngbe
	I2WbLR785YLxYV3WDXZwneuCA==
X-Received: by 2002:a05:600c:c08b:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-488d68867a0mr258388875e9.22.1776345592559;
        Thu, 16 Apr 2026 06:19:52 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f584e243sm96417465e9.10.2026.04.16.06.19.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:19:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 15:19:51 +0200
Message-Id: <DHULYJ36CDIF.32QMQXYLS5FSU@smile.fr>
Subject: Re: [OE-core] [whinlatter 00/47] Patch review
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1776321810.git.yoann.congal@smile.fr>
 <899824.1776341286874679261@lists.openembedded.org>
In-Reply-To: <899824.1776341286874679261@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 13:20:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235405

On Thu Apr 16, 2026 at 2:08 PM CEST, Hemanth Kumar M D via lists.openembedd=
ed.org wrote:
> Hi Yoann,
>
> As discussed, I have rebased the binutils 2.45.1 upgrade on top of your l=
atest whinlatter branch and sent v4.
> ref : https://lists.openembedded.org/g/openembedded-core/message/235400
>
> I=E2=80=99d like to get this merged so that whinlatter has the latest bin=
utils updates.

Thanks!

I've tested that locally and will sent it through testing on
autobuilder.

>
> Thanks,
> Hemanth


--=20
Yoann Congal
Smile ECS


