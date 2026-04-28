Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50ACFF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:36:23 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11280.1777376176528683627
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 04:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ahU9cMax;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso156680435e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 04:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777376175; x=1777980975; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdy61pdFrem2ppU0nHAq44q9Vnuy88b2JvC41FI9NcI=;
        b=ahU9cMaxWqhC1/ml8kiaPWJFG24OkkGRNO+IQeagLHvx904kmPvM8UqTjChuKH4Mdn
         SDHO/6GuFeluyFviI5/yslCn95hjyNEYvxPch00/gwnViH7ooX3T3jiSjp8BplDUWv5Q
         FW6b49Z+bLjogNEQXxt3P0TeI9vVAjHCVmvhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376175; x=1777980975;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdy61pdFrem2ppU0nHAq44q9Vnuy88b2JvC41FI9NcI=;
        b=HFb3iziP3BIcp7RnZ86EdeHAFy7Te3TsY0sKndFscCPnFR0FQL1En8iaala4HAjHCP
         hFEpQtk3nExBJ/nrUgCuO5hOydvbshXiOCluSafsHx1r3hN5de7jt+sKdX6Jhzt9NoUg
         auoqNXothy4zJHpndDs7q4+UORWCHiN1mqJpiLnPecVmxo87vkpGvIoyAevy3FtZWXlg
         AOzXgDRoVmQgIW4lQXEeF45+gOII1kiOYTdQtqKyuLn2bq0M9pU12DHphNVtirUSmUdi
         0lOo9nVM0y7HwR0F84m8KT9VYAJTn+fqM7vSy0Usom3jzA2DyOcOCeR0EleHR3zIBRSi
         pHaA==
X-Forwarded-Encrypted: i=1; AFNElJ8X/VBx68Y1k1KWRq33+L5fHmwoK5g1NRfFvQJ7emwFNvJfjUB0AqjQSu7Gx0OIjcJKAJWqwuzVyghz3gEtbB+1dQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxqbw+upIt5x6M5rTR7J2l2bBReZ/q4A7dwoydvIO1N46064+mS
	/wlfw25YJeG0x1bY1CifIgvmES5yUNj+zPVTUvkMELIWrfvRpXKwX2zvfx7GaeMzwMc=
X-Gm-Gg: AeBDietjmv42YT6pjmoOwyCqHWjWZ58/Ruw32fB7wM0UF+k3Y7yWnBd54oeCyjC9K02
	Ee8wwk5VeZINl+nN6cb1XDNctMxx3Pq03BuPeYBj/yTeHxmJAlYEJoCoYo/rcmLXoLF+YJr0TUX
	/NAcq7EcsDXK/90spyld5UitsP0sIX9OzpHvjr/IXXfpGyuylx+0tQEXXI5CitI+xfC+erJ7YRV
	Karm1x+IfIvXAYL5KUV2B4N4f0PX2w6Jgl56C4rCds9GsxsB8gOdsFVYQBEm8T/I19C4XtOWoaY
	bQec1xjMOai9geAJl19JRFQNPVPVARWL+pvAmzBPPYWMnmw0nrOaz6SlUvd8DO4+ZncnDjaPmCh
	N4vWdh3ZBBFP2QWRG/0is3BUakeG1x3tOMOCV0xvKSQ20/BXEP9kwAJ9tdMUkaqsOKWpaeb58+I
	ucrcHKbSXpSgz4JfRMqqGlLz5B3uBm8HB4iBpW/Gcg5MfPkAYGY6IHEROSqQ/+OyzIojHA23+5g
	JnQ/0+pu6LrjJNQ3r60Knv8XbA=
X-Received: by 2002:a05:600c:630f:b0:488:c014:34da with SMTP id 5b1f17b1804b1-48a77b204d9mr40374805e9.26.1777376174803;
        Tue, 28 Apr 2026 04:36:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9? ([2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77b29487sm48015085e9.13.2026.04.28.04.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 04:36:14 -0700 (PDT)
Message-ID: <c222df959189ef167ca167ba79152454df00d351.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] mirrors: switch Yocto Project mirrors to HTTPS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: viswanath.kraleti@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2026 12:36:13 +0100
In-Reply-To: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com>
References: <20260427103040.1519121-1-viswanath.kraleti@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 11:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236054

On Mon, 2026-04-27 at 16:00 +0530, Viswanath Kraleti via lists.openembedded=
.org wrote:
> downloads.yoctoproject.org supports access over HTTPS, which provides
> better security and reliability than HTTP.
>=20
> Switch the default Yocto Project mirror URLs to use HTTPS instead of
> HTTP to improve fetch reliability.
>=20
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>

I'm not going to fight against the current on this one but keep in mind
we checksum/verify anything we download, so http vs https doesn't
actually matter as much as people think here.

What we did used to care about more was the load on the server of https
vs http. I'm therefore not convinced about reliability or security.

Cheers,

Richard






