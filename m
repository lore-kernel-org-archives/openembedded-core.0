Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7018DC531C9
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 21:45:01 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29206.1784929500057194649
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 14:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VTOZBY55;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f6609c657so416876f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784929498; x=1785534298; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWJz1OdRCR9Mx6tRLPh05NZnQ2u82z03zW60uTKpjpU=;
        b=VTOZBY55E4QtD7FpPjMJgI4JHQ8fwsfPOVCDAwFfakqyC+6vREmC6KxwRI84O+DRce
         Z4Ygeyzt82bZbkpVgiaP5oF1hsQFnNzVmFNdfXplYWh38pD/XshCxGBy7RHJ3V80wKfz
         u+uBuK0ZCbnlKfPUBXx0TVhVSUiwa2Hn6W99o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784929498; x=1785534298;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWJz1OdRCR9Mx6tRLPh05NZnQ2u82z03zW60uTKpjpU=;
        b=gX6zscQntGcU7neLt4Vv7gDfkN5PPZzs8Vzqc6gRhWSFBzR5Xzi9bthgBZlAF6WP+I
         i+9PKZLi/0VHWTAqB8IgiBTgOHgHkgkYXJ7haf+s0sNxGwFYUauZPhVF/b4gnN5dRxi8
         RPCerVFZg7SB8JPyu69A3z5LgwBfbygee40c3gfgykVYHdFO9SDBhs+vaB1hNoYRXJH1
         w6204g6FW7awjok2ON+Wl1CYb/Hq9Vf+XuaDEBn2nr5gkJCu4/sEDqIWI1pMGZQdjrtC
         qvfUyMzlP+jbYB1sc9zI/eZEpLFVQjJpcol+ZO/tZoaONhBtW07solDgY4bakzRxqYgn
         dH/w==
X-Forwarded-Encrypted: i=1; AHgh+RrMNBRE2xIpU1Tw+TtM1cd2OBy3j2C13QGEv8UNQOsMBoblN5RotcLSQ2RjMA564INR7lVReOD2U2ZCxCBBpkcjmw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw9NW5KuW4JNEdz+7z9qtc8MB3nhLeqIUf5KIMD97ABKdgmU5Ka
	ecL2ysxe/zDYgR9z4cow6ek1FyX2rNJgtcA7V4Xm+qOYnZfllptoRPBSBjbfrFe1Y5k=
X-Gm-Gg: AR+sD133q9Qau/12212/BOQjCUvi04+GrImFO++++0UJPfAOeNh7+gR29EAC/WgOcok
	/FeUsWaLet9yyQcDLSk8lEAyiklqTtL5vTvuh9xrk6jOJ8F9gGasJpjLT6XRUmwGw6v/koaOXrT
	w52kadnFBfLpQ1eWu79Mt8lI1XkU85qpUlfu9LNAFhasJQcOhCP3y7DwXrGKer9lN7+dU14GN/A
	VNSFIuraMP97t2N2R9vhXYBDPpgyFhJANl4SEWUMOoLIvaygaKjZn7G9KjU+LRZOWBrsLnLjRri
	e5nHUFf03vP/QRdpA6HS564T1oXDBckn3cKTYhNuRl2WpSfE0qHrW+nGJF6xX55aiYRPQQcIPzk
	o8ms6xAL1VDlracczhiT6g0IbLyLu7N76Huh3eh56AgzPqk0McxHwfQIC1EYyQycEkotd4SQu+F
	zqjHW7dsKP2j9+dazxdjjQAMyu0b5Qj/RK8nZKA92KE1ni5N11EiG5NnF7bkEd42EqfQ==
X-Received: by 2002:a05:6000:2410:b0:45e:64b3:af44 with SMTP id ffacd0b85a97d-47f8dca37b5mr11547200f8f.36.1784929498069;
        Fri, 24 Jul 2026 14:44:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm25809166f8f.16.2026.07.24.14.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 14:44:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 23:44:56 +0200
Message-Id: <DK74P6NLY1E7.3GR713DLXYJ6H@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCHv2 02/13] vim: Security Fix for
 CVE-2026-42307
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260723092354.54697-1-sdoshi@mvista.com>
 <20260723092354.54697-2-sdoshi@mvista.com>
In-Reply-To: <20260723092354.54697-2-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 21:45:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241951

On Thu Jul 23, 2026 at 11:23 AM CEST, Siddharth Doshi via lists.openembedde=
d.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> References:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-42307
> [2] https://security-tracker.debian.org/tracker/CVE-2026-42307
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../vim/files/CVE-2026-42307.patch            | 121 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 122 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-42307.patch

Hello,

As far as I can tell CVE-2026-42307 applies to wrynose but I can't find
a fix for this CVE on wrynose.

Can you send fixes for CVEs from this series to wrynose when it is
applicable?

In the meantime, I'll hold this series.

Regards,
--=20
Yoann Congal
Smile ECS


