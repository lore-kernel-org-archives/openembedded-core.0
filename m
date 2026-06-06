Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08244CD8C85
	for <webhook@archiver.kernel.org>; Sat,  6 Jun 2026 12:34:58 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15179.1780749294010943388
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Jun 2026 05:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Xrz/yd/o;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45eee266c6cso2239276f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 05:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780749292; x=1781354092; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1chuvk0STKFviBT31JRQa8UXSNPNuUjgxV9/3flz8Mc=;
        b=Xrz/yd/oGUAaM7PXYmqGzATxytAynmzUXyIGoqdQ37olVD9CqR1cBgoIx+06zR4Sul
         S6s3dmpzgH5W3K1TFXGkROZqoy/8qq/vVoXYgk3GqLUWRp+qLbJVKWutwSVCvzHZpuIT
         FzkY3Qzdnwgw9eqYiR9JkVt7/MXHR6YeN+f39I1YmWjHmW2XMnbwZ11qheRcitdjYuHA
         mTBii1Ey6EpZbF5YQFdbvaxp+JFLzcetYBiws0sF/QvFhBqkeSfJPNK2qNFBG8XkygJu
         qqO+toR91KRAd4s3umG0PmG0uSzMfhHYRBuky91dquoBFCDDIYJAsWJgY82ZT9xBwwBM
         7HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780749292; x=1781354092;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1chuvk0STKFviBT31JRQa8UXSNPNuUjgxV9/3flz8Mc=;
        b=B5kskSr1lEYqqcAh1Co87qxCafMlKM87lpm7NF0/1aYGjW9NC48RNzAFFyXTP26ES+
         9GauqtJaRoF7WbVLPkh2gfyq/KIRw13443QpHGptnCWu6lu4J+plF/oRWj+ITO0LKQXt
         hCtUlP5em+ms7MamhgE93H2XJz4z75g0QAY1mz5Zl0LsPdXD8AkXd6Hnya1WAo9vy/b5
         ujP/idOcwGW0+MTGeo6dMwBU4UlprRPn8As/OiMwq3RPvg/qJ+AnU7QoCxEFBJKkrRFb
         VY0Ja4nNk5qOuinDPZb1goWkjps+K93UJYkiz7Bnh16by0SwJZYAUHixghl47HGUV7yd
         WjbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kaROTdzMKStC5T70FwmRbcfonKmvKJfW/lql4z+eVUxUJETaakbSyNW6mj579onYwI3KxigXnPaP8c6FB6ZGPZQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxCf1EbURccgO0J64+X7KOJc7qCpzfbzONBl03mQHgLHKlPdUs+
	FAzGz29/rCEJQr7G2FFyo6EDsIly8TxuBQzejcLQYqQDP1Uth0FTLgAt
X-Gm-Gg: Acq92OFyqEU0koeoc8uZsbX83oVrHAmkKqhEYLoyUEm6lAl67J3bAYURRel//prGJGh
	8ddvG7hpWuBwdXsBdnvnaPQwAg67IHendks334Xs8v1D3KPmgFqCnHVXgKAR6PtoIYYlee/foO4
	44JAv0DjwbOTanoklLq5obKAD4w5JTlZXoxD4kLQRD95cGOo73gppgg8W7wU0F9GekuUAuyK7s1
	EdSFVaHPsFHFN3ulODd3gQdFrKCDrFvyK7VkwabIqON/cpPmBMa7y0RqOYcR2ZeW93wYmEmJEc7
	BQq/pqpNcRn3r98qJbZ36FEwnYMhmjXwVvYE2ky30RqJrbl6Nt13KyiktIOfqILcjekl7plgFjY
	EAZli+6xk9jz98hK6igAlK1UTJkoQmrY5+NJ5BnucC9DfNarWD3W6zc75yZZ7ibbf1ErNdsWwFp
	TYjlC188hG48IRDr9xIvLMJjAr+5ahC+VxNmJLSHYssjCHwfKHPli4/v90ZiRP8BMkG7BYlTrsm
	wGntHfBXqg=
X-Received: by 2002:a5d:5a05:0:b0:43d:dd:8ca4 with SMTP id ffacd0b85a97d-460302e8165mr9566030f8f.14.1780749292182;
        Sat, 06 Jun 2026 05:34:52 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm34606568f8f.33.2026.06.06.05.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 05:34:51 -0700 (PDT)
Message-ID: <79971080ba8500d2c590f3b241d2ac7236288411.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 1/2] uboot-sign: sign SPL FIT
 configurations instead of images
From: adrian.freihofer@gmail.com
To: rybczynska@gmail.com, openembedded-core@lists.openembedded.org
Date: Sat, 06 Jun 2026 14:34:51 +0200
In-Reply-To: <20260603105453.25881-1-marta.rybczynska@ygreky.com>
References: <20260603105453.25881-1-marta.rybczynska@ygreky.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Jun 2026 12:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238221

Hi Marta,

Thank you for the patches. I agree, that the configuration nodes should
be signed rather than the image nodes.

I was also testing your patches on my WIP branch here:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dadrianf/fit=
-improvements

The first three patches of this branch have been sent out for testing:
https://lists.openembedded.org/g/openembedded-core/message/238216

From your perspective that probably means:
- Patch1: trivial white space
- Patch2: I hope this fixes the build failure caused by your v2  =C2=A0
https://lists.openembedded.org/g/openembedded-core/topic/patch_v3_2_2_oe_se=
lftest/119626514
- Patch3: Major test improvements which require an almost ff rebase
          of your patches (see version on my branch)

Regards,
Adrian

