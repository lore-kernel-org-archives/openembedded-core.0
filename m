Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C134C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 21:18:29 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.201.1788470299070983650
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 14:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=pQ5XO2sp;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so3286585e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 14:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788470297; x=1789075097; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RgS5/SGhbrV22rCfZd/orG+4yCTVCh4dvwwHWbCn3RI=;
        b=pQ5XO2sp5AfB+CRZ/hBU7C1jIxAtAbAfxLoavYT5KRRvMbjl2UkbiJy4n/OXzqVnEg
         wsZnwoaWth6dV8yVfGoAakbz2XIsWfV8XOUSGxotS9Hrs2n99AqKHz6wHxnmMbRBrpHT
         ZreLHfvWHC0yTmw2vRuuyQ0jDnPpaq25k2sQA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788470297; x=1789075097;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RgS5/SGhbrV22rCfZd/orG+4yCTVCh4dvwwHWbCn3RI=;
        b=bO0gp1RgLvTNs1OnlZkt8ACFRtdjipG7bv+0aGjx7um10Pp7Ubp678XFG63C2O9Elj
         0Gb+MGJh0NfC5FRXpUaXesYlh5Zcf7rqJOSPlkvUq+xOnQmyo72uYopv56/sEtO/x2UB
         yKvsUYPSDiP6Ms68B83glg3+imQkamtoIybMci2bVsHGjayhKfsglkQIhwLbUp0gkGe/
         barWKJXdYdlc4xrNBvvffDA0mmkt+DOkoQ4ooE+L8aNlzHs3NrwnEEWr7ahmPzopvZ2k
         tOsfKdd8bNaPQoTFc4qfkQrKEtcW3o+uhMVw6M6QgTSLz3VzeQ2x92BlGXKV3fvc3cu0
         4diw==
X-Forwarded-Encrypted: i=1; AKwUvBx05PwREt3U1Yq+XoSkDT9IyPmVXr6JCyBpcOddyi0bZEr0xukqD0+FWDIWFW+5Nx+7ByMkqLE+FsBQQ+sloLHXFQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++mMSFkURjlHVTTaRdwsY/BTldp1cz5iK3NROVCM90aeklLPqi/g
	sZAII5hVEclthwbUBNJdWBuEFJ8719XJVHwFDgbWyTTT9N6SrnjT4unlqCppDAC6uENy4mTptpn
	Tf+ouYYU=
X-Gm-Gg: AYBFou3yveNcOGJypTQe550PwaOF97pYwmXh86nVIkEu0A6K+o9u2j2mjwHeMlZ5DtV
	eBugvlFXqfyOF5yIwDgAEjMGA3v5gCRO38C92WO56cX44kJ5ZVflyhweIH2Dyfk7e+lnleF8UMu
	HIvo3Pt2YCzSadScC9euUDAU/AnSpUkF78MASumOlZIyuXPismxlWJAr9Y1f0NnkxzGyZxbY2dL
	AtaegRr1aqbInOLomK5/pjWd931CdFXzHzqMB99nL7tQXs5t3l8dzhUk2SpGh7v+JtkZ+bfoqlX
	M5jOagltam62pW1PovPRajrz4pWEBEcKq9mxKPIu3emSy728Klye/zFGSxUXXbEbGE0yliZ3KKb
	X/1mfhlzClN62616p/OQ5oDxVd6RkXVnLh3ltTVjtwYCfSouKKq8T+oxv56fyk1wenQHL2TL9BU
	Czg+3UZgn4VvxUiKVhqq6Oj2VKbmK/UnzzmbtsiX3uvEaAYmIs3EpTd0nMb/Ju5EdP81feywcGY
	dyuxzV9KVY3IZoBzdnctACPtGRizk+mRtH7bV2cqtFwExrePkI=
X-Received: by 2002:a05:600c:350f:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49cf825d1dcmr8975985e9.11.1788470297323;
        Thu, 03 Sep 2026 14:18:17 -0700 (PDT)
Received: from localhost (2a01cb001331aa00939d825f00cb3861.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:939d:825f:cb:3861])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588134c0csm1592011f8f.3.2026.09.03.14.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 14:18:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 23:18:16 +0200
Message-Id: <DL5ZT3T1IIG3.2FR7K7OK18ID@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 2/4] wget: Fix CVE-2026-58470
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
X-Mailer: aerc 0.20.0
References: <20260722100754.1568842-1-hthakar@cisco.com>
 <20260722100754.1568842-2-hthakar@cisco.com>
In-Reply-To: <20260722100754.1568842-2-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 21:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245044

On Wed Jul 22, 2026 at 12:07 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://gitlab.com/gnuwget/wget/-/commit/43d3ba9336bc94937e6fae2365c6=
ffd30c34ffcf
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58470
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../wget/wget/CVE-2026-58470.patch            | 79 +++++++++++++++++++
>  meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58470.patch

Hello,

The master patch you sent contained a regression fix that is not in this
wrynose version (also not in your scarthgap version).

Can you send a v2 with the regression fix?

Thanks!
--=20
Yoann Congal
Smile ECS


