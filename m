Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21161C79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 16:43:00 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12320.1788885778534574070
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 09:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BA9W4vrk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so58458425e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788885777; x=1789490577; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GajZOIolrG/ir/QEvMLdEIamd3ha2M/Y8jl7r/eO1Gk=;
        b=BA9W4vrklGO54yJ6xa+nLjbCzX3uXk7foLtGqCFbm+24rWo3Hk+8zLvLZV99w5q6HE
         dGEVPZdZj/M7H7VTJ4CY2JGToMU1+P9/ZMLpMa8DDNjg82gnMpjKtAiPOHM61Mpi38HJ
         ChtLIQsOjVUhgUYurPzdrmWthJwKZJEv6PHfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885777; x=1789490577;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GajZOIolrG/ir/QEvMLdEIamd3ha2M/Y8jl7r/eO1Gk=;
        b=kVm35aiqsAXfS3eq0U8Ks344VUk6bB/ZNWfxebtj9MosARHKLWbVrVdAtxLBzUh9qy
         AU5G9HbhE3p73ijlTxMFDFmH1Z8K82OB4pi4u1/VY0RcPXY9qISqeo5OqUHZrjKNGc8z
         wF/lZXiW17or6YuezZ8Oy9TAEZrsOHQEvS7CrBdUgSXY/wTz6ergvvEhDzR8TNWOw7s2
         rmihfh4Vpq6enlA+kmuFPrBOR9mIC0oHm0+EC+K+l4382MqmQOYKV21tdcS+/gw1brZW
         CQFf+X4fySTmCdPPO4Eo5xr2Ux1WydOYUKkDfPzxKR4Nj6aEzOmvK1TKPbjStukVmFvJ
         cRyw==
X-Forwarded-Encrypted: i=1; AKwUvBzeQGbDxhaFP0D+RWjWuzYx4vno84he3ClislYPugqQvlecdOw2JP2ITUdcgPdJY4B494dUbgfAwRY+I7aA87RwBQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++k4s4Hsaamrzn78LsnxGLsuegtHbTmSRpHREEnGyUs9qAHdvD7w
	tFLCsgaRBDeVsNbWpRbGuKqvUNA9qGEoVaK+2b+vP3b2VJgoYlQCrhjjgVJOqrwsCaA=
X-Gm-Gg: AYBFou0+JAvtM97QmWGFFEho1+AxtvkPQWLU6KQAEAYq1bsy0hwhFqnHRbgKCU/+v+B
	Mg1TnWbr4/0Om9pMjkidsmyjivGnJHw3/RkE8v/DxDEce6ZgZYrol7DnSJ6aRTwuw347iFWSrCe
	etCeU7LiX+CxceI0rbMo1qaui17vFaFzNnhKRoUpG5xgJ0brRImBeUg1WTOY6amARAAl/v7ZeZM
	iZrljB+xpe940U0TIj+M5vbMYLG7h2upDsfxUQ9RIMilTR9zLFxxa03OT/YbnBrZgO2jVKCJEsy
	kvcYqRRHVtWHyspcYCaIPQDQMzzPI7D3lDRDvWMJq/d4w3cegXKEsBUN7+1fV5/YNhzsuR22tId
	bfMFtcCCpdMetTzdYhvVc9H8UM3hq2F+OB42WKF1nHkUM68kDY0RgYDMy8Zjzw2nUIacsRUw6kN
	3imEhWvhgsn93VgiThuQ8yYRO6LAIaexB3T9IAv0xWOOS6bAm9qa2oWDOUpJWV9hBKH4jdLhHT5
	w/jZPbLDM5/G4dFT2HUvwvMtX6BjVCEAhHi2MU6RZ+cAu1DpkOa8g==
X-Received: by 2002:a05:600c:3551:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49d16df85a8mr92571305e9.4.1788885776621;
        Tue, 08 Sep 2026 09:42:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3b52:472d:bd88:cdf3? ([2001:8b0:aba:5f3c:3b52:472d:bd88:cdf3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce591f846sm235231425e9.1.2026.09.08.09.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:42:55 -0700 (PDT)
Message-ID: <29b3f1b7f25651426b52e95340392037067c6b3f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] sbom-cve-check: Update to version 1.3.4
 and enable offline mode
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: benjamin.robin@bootlin.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Peter.Marko@siemens.com,
 olivier.benjamin@bootlin.com, 	mathieu.dubois-briand@bootlin.com,
 thomas.petazzoni@bootlin.com, 	pascal.eberhard@se.com, wahid.essid@se.com
Date: Tue, 08 Sep 2026 17:42:54 +0100
In-Reply-To: <20260907-sbom-cve-check-update-1-3-4-v1-0-93034b6bd44c@bootlin.com>
References: 
	<20260907-sbom-cve-check-update-1-3-4-v1-0-93034b6bd44c@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 16:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245382

On Mon, 2026-09-07 at 14:11 +0200, Benjamin Robin via lists.openembedded.or=
g wrote:
> This series update sbom-cve-check to the latest release.
> This release of sbom-cve-check addresses various fixes and
> improvements
> as detailed in the changelog [1]
>=20
> This series also enable the new offline mode in the the sbom-cve-
> check
> class.
>=20
> [1]
> https://github.com/bootlin/sbom-cve-check/blob/main/CHANGELOG.md#v134
>=20
> Signed-off-by: Benjamin Robin (Schneider Electric)
> <benjamin.robin@bootlin.com>
> ---
> Benjamin Robin (Schneider Electric) (2):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-sbom-cve-check: update to version =
1.3.4
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sbom-cve-check: enable offline mode

These are merged, big thanks for adding the offline mode option as I
think it helps our use case a lot.

Cheers,

Richard

