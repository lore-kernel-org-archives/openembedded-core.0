Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CE5CD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:32:28 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46185.1778491939583953820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 02:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YOd5I5cj;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d68f702851so459491185a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 02:32:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778491938; cv=none;
        d=google.com; s=arc-20240605;
        b=haeTCcdNFYu7u+xTnFh/cihlVApd9gdjiocPOYLUNzspJ9JiQc/WKWZO9+kH7HdhiX
         oNGHl6gSr/nDuqhAiiClTt0Y3ci7C6TqZDi4+LWREkbzKFDnGWeDmKe/0b1XbQ+y01xn
         gWqQ7Em/gAwOK6rXIVndyGWdXiCM5bhVqcszdgCNEn6aA+uvoHnPGTb8Tao4RiVm+vlO
         3OxFOTeUUOs2H+Qgag7Ra2/06OIHgtQaAm0hz8bViVR6oo+QQBCzRDCdjbrR54P5uYyh
         deiWZFhmoN0zeoYVSn4my2BfXJrcsgyVHE+SBIVjKL7Rt37kRsdS4FcKNSFWYllznyPb
         A1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m8QNDoqzTB3O61K1jC2KelTUgkCSm7x1KOeHDjaxVoU=;
        fh=6D08F4ViEPMn9fNUTnXxh/MfSY/OtXZrNXQvtB6wCB0=;
        b=AKpQ1qDUinv2Fp7B/7F2Ii5S/io31OBaTJw7HfBMNTwCLxL6vnZRgL8xnwty6FfDmH
         bgWOVAad+a2CTAPqGY1MnA2oja1gX+YaYCfYw2FptLwcLzTIUDF4h2MPQcVEhIivv2XU
         sbhAef4AI6W01p0we4oqzXtMEvJ9mjJSCThx9czvWm0jegXvu3sCrXiPF4OFBu+ZpQee
         zhbe1cE9Jm6KKZQCiNBk7aKc7HovV/OPxHrYwkrFeuZWi6LEkhnR3D1tB5xogWzoryHx
         OOb+90UuF6KjRrg4T/zEg76Ux5Lo6zkAcD6ttEMFsX8Ltcw+U/7hcvW5rN7u/r+Q6O+Q
         kaoQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778491938; x=1779096738; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m8QNDoqzTB3O61K1jC2KelTUgkCSm7x1KOeHDjaxVoU=;
        b=YOd5I5cjJQJ7uVRdcqk68aGWDV6shZc9gCNrMfR2EgtBFneJwpTO87zgpogIV90+lq
         I8se12ijA3tKkcNrfGv5GpXH8W2hRJiHivecEYPJO4yA7DemrMJR/HJ2rih6DVomPqUm
         dvYWG67vx5kjZ/QwH5LNHDFaLhi5rtAxWMue0Q8PxjGXRH1feefIEnhfG/zQ/CWQqxcb
         aFKWrOnmd+gQeBPCEtf4BFOTBOFp34nZ+1ugHrPWpW7U8svHVc7VCrXbTLtrq4AYJnCY
         ST12sHVVnqn3PeTkiabICTuqeGcLB+9ma+44WJfvV3NnCscf58hwEA8o1+7LLIbhycvW
         ClDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491938; x=1779096738;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8QNDoqzTB3O61K1jC2KelTUgkCSm7x1KOeHDjaxVoU=;
        b=mpV02w9b9dQQNm0DSLVB6AMYYRsIP6VW8R7jE3UvPod0WpzMK+iJCUe5jnhlE8AY2j
         j0LjMuD8WAh3MJ/lR+Yc/G1Vj+YGQz4G04gbh7EW2pOqCU0M6jtLlZS0J6/7nCNkTlCv
         e7CVFRsN0vyVTEgurvzmeWDUZ75M9qmX2/8s19m+2G4itjHdA81eGuJFuExzgqFdg+Qb
         PTweoBmTtuii8gSNttN9feiJMKBgPuxkVDiFh/OaZf+xAC4aNh7d2YRG1YGQCzkUykyV
         e7VfAjM2zUZwO6IeZVLPRIzA47H4lTDNOGHFFjoJM8qG/0b6q2UJ3WjZd+uL3PtE26Nz
         Rmvw==
X-Gm-Message-State: AOJu0Yzb3caNx8Sd4chZTWCQChf+j0qX81hQE1uDrkQHuroX6LPe6yBl
	ycrSpQw1ck+9PKqUFcQOWjs/v1WkQe2L6ekaqF/4DWtESjVuoBywlYhEea9zEY45mJph/gdwBXh
	tbU0i80N4VvoYNmfZGGt7r1MJagKmueTsNQ==
X-Gm-Gg: Acq92OFP7yb72Z/wwpjdExILF+/7Z8OkVcNpITabmQrDMo3OiHulAxKpFM1Wg7dwstY
	QccUjS9SBEed98T85bhJZJ7y37z+O+FZy0XkIFw7G5vQRqqSpjUFPQEPmIQQYl4pqlHDtxlahUf
	3M2ZGvw03IIRTsx+7yUwfc0FVCbieVDpSBkGd/47lid78m2Lu7cKs/fMMNaB+L7X0jhJZUXwNGP
	ZjNeVjWvwnhDYNfH0/by04GhQbbl7lRMrljBNDHk4eGa1PHBbxoPWDQtPTaVj1iz+VXiIGMuZYq
	LJZ+Jv8dCsUEQhXFyMgGzeS8OJTw0u44USRJAyf8Ww==
X-Received: by 2002:a05:620a:6989:b0:8d6:2958:ec16 with SMTP id
 af79cd13be357-909111f13ebmr1162139385a.60.1778491938500; Mon, 11 May 2026
 02:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260509053033.1565462-1-Qi.Chen@windriver.com> <20260509053033.1565462-2-Qi.Chen@windriver.com>
In-Reply-To: <20260509053033.1565462-2-Qi.Chen@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 11 May 2026 11:32:07 +0200
X-Gm-Features: AVHnY4Kd677BiWl2BAkaxwCIDQsIijhRwnHcJeWIvwmPKK2EBZ9VS_MPhcyK3XM
Message-ID: <CANNYZj8ZMjaCQ9LOtqkw_JgF=Q4mg3vxOT0z6STu-whEKQ61cA@mail.gmail.com>
Subject: Re: [OE-core][PATCH V3 2/6] upstream-stable-release-point.bbclass:
 add bbclass for stable point upgrade
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 09:32:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236794

On Sat, 9 May 2026 at 07:30, <Qi.Chen@windriver.com> wrote:
> +def get_majmin_version_regex(d):
> +    pv = d.getVar('PV')
> +    v_parts = pv.split('.')
> +    if len(v_parts) == 1:
> +        return pv
> +    else:
> +        return '\.'.join(v_parts[:-1])

To be honest, I would not special-case the len(v_parts) == 1, as the
class becomes somewhat inconsistent:

x -> x.1 is supported
x.y -> x.y.1 is not supported (instead it treats the stable versions
as x.y -> x.y+1 )

These are two different schemes, so I would not mix them in a single
class, and support only:

x.y -> x.y+1
x.y.z -> x.y.z+1
x.y.z.zz -> x.y.z.zz+1
etc

For x->x.1 we can make a different class,
'upstream-stable-release-append-number' maybe ?

> +MAJMIN_VERSION_REGEX = "${@get_majmin_version_regex(d)}"
> +UPSTREAM_STABLE_RELEASE_REGEX = "${MAJMIN_VERSION_REGEX}\.\d"

\.\d should be (\.\d+)+ to allow numbers bigger than 9 and multiple
.number parts one after another.

Alex

