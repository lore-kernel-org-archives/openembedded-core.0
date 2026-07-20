Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73378C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 11:19:58 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6791.1784546396684916768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 04:19:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Dv8IZJol;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so69770305e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 04:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784546395; x=1785151195; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnFw9rrid4/Va0HhzxT1y/4PkoqlAqAQ1XDS2b/PtY4=;
        b=Dv8IZJolK5dr8ReI5HBL1MfE8wvwG8yvYQUN4Jx/1eFqrjoIHQzYO4TBIye686D/ky
         1UXuMaCa99h/Xfx9m/1TFxm3liYmzfn2IsEtFrYimQClibpFvZXwYQ3wsDnifggaNNSs
         jzrxRV5MCvP4wih59G8LmMLu+U9rkzsDaagBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546395; x=1785151195;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dnFw9rrid4/Va0HhzxT1y/4PkoqlAqAQ1XDS2b/PtY4=;
        b=SR3VH88HWYtZSMvistddn73P75dDtnrOM3XqtQzZO3KHKkgpiQ0jWHzvsr2P/AiYpP
         waPfjxkLa1HTljXqiivdIZO4VO3jZ4WVoEyFuppkut4uFzip2qjHePpo7B5M7K0fThxa
         F5gYuc4UYqRg1YoMTPCJKexH9wmH1k37e8iPv/XZyTdCVvNBb6mNQaKlBpgQWtDF8c9M
         ZZlU/cd58i01PoD+vzcF10qcE2CwyKlJ+bgmdIGdqqVGx6LZJwS4X0Bu4xgB9KnbL8BO
         knAYUFhXM7zWXAfNeAumksuJig0NDEEEk7HTUein0PKjcvcp9E/5yOdnm4J+YIi4fJy4
         Sv6w==
X-Forwarded-Encrypted: i=1; AHgh+RoaSSMmM2+Uv5zwdpC1EMRNzAtbce2e8l71XwTtUIiL/DOcyB7J92WxhnYj+F3X31L+38PFNTF+2ANR1RMZz3DMEA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyV459GdpmlfsEb+8lf5wlhkkNLzshzAqglU3/3Fh1r3i7Ch5yP
	JJ5BtOaczMYBZG2SDrteAnHO9fcfL4mY+nsJlcN4vNoMs9K8fsoHMJCJ0kf3Y+5obbI=
X-Gm-Gg: AfdE7ckdvuCjlCwmJ3XlCdTHNAT73lKxKkcWeHKCdflHxMU2rto48anCAhBaJljLdmc
	vh7NvpZ+VwJ7PcTAWw0XnqroVxSroGyPPNDNEbfRkel6aAd9HhzI25f8CbMtJ5ZVpI3h4fmSO2r
	5F60N0nS7MCUEiEIwa1kLBL4cWZmcyPHuHEA25DqRvnYFs6DV7MWJQC1sSAW94s7NT11LftmoPK
	uU5aHrz2YgE2kwSgNlU7b/Nn0DG7daK6J6/xSXI9hsoUA8xYW5OVfObmJgHXPIvhWLS3xLOabgq
	xRBCy9KTYwQu+ntmD+nG4m5gGyQrelTIDGiybaMg2YHh8/OoPYiDOkjkvdjrqCd3lGoG66wpvSD
	WmMWy31009ONt2ABlw5OBb7E9QPl3g4vk7HXjuxwrjG/1tUULobCu9wUJ32cSxvtNzir8ZlfAH+
	/9WgrCQ6nobivdKxI9svzGZTF2zX763gH86UNxOvG5S7DlqeDFyaDDJAnfLy6EKw==
X-Received: by 2002:a05:600c:45d3:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-495503fd2a0mr99116425e9.9.1784546394875;
        Mon, 20 Jul 2026 04:19:54 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2e850dsm303233685e9.9.2026.07.20.04.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 04:19:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 13:19:54 +0200
Message-Id: <DK3CWFWYP9UE.5WID74XZESIV@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/2] gnutls: Fix CVE-2026-3832
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260720110548.2458865-1-deeratho@cisco.com>
In-Reply-To: <20260720110548.2458865-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 11:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241363

On Mon Jul 20, 2026 at 1:05 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream fix [1] and test coverage [2], as
> referenced in [3], to address multi-record OCSP response handling where
> GnuTLS could check revocation status from the wrong OCSP entry.
>
> [1] https://gitlab.com/gnutls/gnutls/-/commit/731861b9de8dccaf7d3b0c14468=
33051e48670c2
> [2] https://gitlab.com/gnutls/gnutls/-/commit/d52d5f4f383e8c5d8e9a03334f2=
421ff35d37d2e
> [3] https://security-tracker.debian.org/tracker/CVE-2026-3832
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2026-3832
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>

Hello,

All that series should be tagged v2 with a changelog where appropriate:
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#tak=
ing-patch-review-into-account

Can you resend it with the v2 tag? You can use -v2 if you use git-send-emai=
l.

Adding these tags/changelog helps me a lot when tracking patch status.

Thanks!
--=20
Yoann Congal
Smile ECS


