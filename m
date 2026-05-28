Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89969CD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 12:23:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9574.1779970978869939457
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 05:22:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VDPsQL1z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so133686425e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 05:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779970977; x=1780575777; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9OyEiX6thGtShjBZUOIz+ifhxBHuQvtnONLWfOMI7ys=;
        b=VDPsQL1zRAezFwwi/V60+3GEFgRJUUKgVIb0WBbyrdboffTh8884kzbUhW+ZDK8bkr
         EvNnTZhldiM8FW6mha3QtR/8vXXabLUX5dF/cv8jnaO2uF8kEhXIsj0+iWsRPCp4fOHP
         icAvk6WmijNHMAD1IxRXavVo2a4Lkgx8tUZHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779970977; x=1780575777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9OyEiX6thGtShjBZUOIz+ifhxBHuQvtnONLWfOMI7ys=;
        b=qQHMgMTNQK7Ay0+Ct+Uv7QQV6xW99/1yAIAuIJObOmK6/N4ZIwJVbkU4RAym/zqICx
         +8q3liW3IcWQ65eYyKbpgkqBOP5uKrVqYxFzRpVwSwltFOU1WAJN7uQHqyFDv0f9Tr3l
         OOakeY8yKzIGLMzJ/Ee3Lyogf6ASfCfmATTjlAkPERXkZFIp3rm1dJ4ec3R8ludvcF19
         SSBj4MU6dW/FuqBS8envUF0zAcbpk2Usnu6ZrGijBSJ856olOWyiTtFnpWJbt3UMhYsn
         hUP2+Z0kD3KQ862HI7dXMsQzmJfejJI4ifiSM4qFKAUIiqrJXsVNt6F+xZFrRR5OwMX6
         ReRg==
X-Forwarded-Encrypted: i=1; AFNElJ9eADPtRwMu2nRj8XDitJtbgfjlmehhIWzyx1YEbXPDL+ZZploqJdUBm9nxV/pxOC4Ue5lDs7VXxTBlyRrL66doNA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyhkL5vklZ0hVA5hxh7bTlMgF2jU0CiocvvRDw2KbMpg4BvBRxM
	K3Lg1fl1SSRYwg/DjHYbo4OMORcC+2aMw+yKyXf91xRoC4oMSnt3pV+mEQM6ZHJtxnA=
X-Gm-Gg: Acq92OHo1pZXvVnVi0CYF0nNr9gHAnBRTcECWFdonBUYJk3MJw7j+lvgSpfT491HDZI
	rWWSB4wQAug3JM3ivzR24rEnSsAmAcNU5aVxtU4SLtxKgbmv/qLPBSZa6n3NUJS5xgWQe6l2w6r
	Gk8FecZerNvGPwqwLFc90f42H3ASJDblBTT0iVBfy3EYAcO+RKXq7ytzUNa82CDHTLVDnFZpPgI
	xLx70WRy7AZ4uMvWIdBPJ2pXjtMbQruGANoDq7NG7LP+Hj3jTP5+Y7hg6x1M0slqjkpWy8Y7Njv
	MMFKo2Rko/ll0byhidUUKefrGJ/JcXmY1tljMWc3iz74nxVCbxfEkfSgULjHdlvwYfK5BGeQzXC
	ejjFcKv4xWqcQtAhnRjZjR7x1l/u0b5PusXgFbcPYo7tdWXW0kMNgPzu0Ulk8kSjllDqKyjZ1Mb
	g8U1XFL0A8//ayQ55tZl/p8t7GvchWSwdOOj4HKkJNK/UpQGqT2+lddb1mg2Z47BslHRYG+L9CC
	c9qEo01C3R1GUJ0suOamLj5sNwjmfErEtM=
X-Received: by 2002:a05:600c:4f0f:b0:490:5149:a242 with SMTP id 5b1f17b1804b1-4905149afd4mr441902445e9.5.1779970977159;
        Thu, 28 May 2026 05:22:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd? ([2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908b423c29sm29239065e9.0.2026.05.28.05.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:22:56 -0700 (PDT)
Message-ID: <5fb41f04863d45fa6de4c230125ed6eb8c27364a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] sbom-cve-check: Fix empty IMAGE_LINK_NAME
 handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com
Date: Thu, 28 May 2026 13:22:55 +0100
In-Reply-To: <20260526060000.874022-2-niko.mauno@vaisala.com>
References: <20260526060000.874022-1-niko.mauno@vaisala.com>
	 <20260526060000.874022-2-niko.mauno@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 12:23:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237702

On Tue, 2026-05-26 at 06:00 +0000, Niko Mauno via lists.openembedded.org wr=
ote:
> Avoid following build breakage when IMAGE_LINK_NAME is set as empty
> string:
>=20
> =C2=A0 sbom-cve-check: error: [Errno 2] No such file or directory: '/buil=
d/layers/openembedded-core/build/tmp/deploy/images/qemuarm/.spdx.json'
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
> =C2=A0meta/classes-recipe/sbom-cve-check.bbclass | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-re=
cipe/sbom-cve-check.bbclass
> index fe145a2212..39719d51dd 100644
> --- a/meta/classes-recipe/sbom-cve-check.bbclass
> +++ b/meta/classes-recipe/sbom-cve-check.bbclass
> @@ -14,9 +14,11 @@ python do_sbom_cve_check() {
> =C2=A0=C2=A0=C2=A0=C2=A0 """
> =C2=A0=C2=A0=C2=A0=C2=A0 Task: Run sbom-cve-check analysis on SBOM.
> =C2=A0=C2=A0=C2=A0=C2=A0 """
> -=C2=A0=C2=A0=C2=A0 sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_L=
INK_NAME}.spdx.json")
> =C2=A0=C2=A0=C2=A0=C2=A0 image_name =3D d.getVar("IMAGE_NAME")
> =C2=A0=C2=A0=C2=A0=C2=A0 link_name =3D d.getVar("IMAGE_LINK_NAME")
> +=C2=A0=C2=A0=C2=A0 sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_L=
INK_NAME}.spdx.json") \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if link_name else \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json")
> =C2=A0=C2=A0=C2=A0=C2=A0 run_sbom_cve_check(d, sbom_path, image_name, lin=
k_name)
> =C2=A0}

Whilst that works, is there any reason we shouldn't just always use IMAGE_N=
AME?

Conditional code is harder to maintain/test...

Cheers,

Richard

