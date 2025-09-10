Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB28ACA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:26:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.17708.1757510802346152761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 06:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jv6P3rz4;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-336b88c5362so61833391fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757510800; x=1758115600; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xt1GRDt00qlb/AYJO/ahCUiG0ndTC2NE7mQYX+BUYo4=;
        b=jv6P3rz4bwd2gbk1shhdiOg1a+f3t9lyaMwdy/R0S/QcgSkW3dTJFWKfVIFOIqlSBB
         WhJ6QbDpTQfh71nt8AAALsClnrZgWxZfjVcJp+XgQ+DPLuSc7arCr5kIytEHKndSeBn5
         pWAqHs0DmId134PsfUyNgz9opsWcBatNVD6TNqgfhKgg7G9aCWi5AyDfGmy8C4htNXXn
         N8Hudkn4HDwE8bcbEnhbUz6ocZNCDhH6chfNSHliznDAZycAuhoZhvJp8ofdIi3lwmfi
         Vk3FIMcOck8CrnVPrQqbkbKpazSESff3XTOTIwm/ChWb+oo2jFTEB6PeHS2FM+eqHmGi
         +6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757510800; x=1758115600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xt1GRDt00qlb/AYJO/ahCUiG0ndTC2NE7mQYX+BUYo4=;
        b=VftU864r4QXOlDGMiwCQHT5aBo/ECy6qgOoFGySbfE3nEPRdDltZnEk0CggpOokbVo
         CLslw2jZFewA2PPllX6acOLgZDoC/KdeS6eiTqTIDGakUAX2yqgYwabrc0F170KL0RbO
         /ABEkCzBUuy927+oC/k8QJWMsJx622awluPGrC7Iz86qPkQBLsxlaOJuiRI/wAZDGugX
         6dTgW1Kfg++e934nG2XlLAcsF+q+EFVgC32iL9R8qFnu9B3Ea+px5ruM0wwM6V9Uitcq
         MM5iDZa9oAvZ4vos7nek//gry/2HMBHTmJO3uue86oRVLJvHzXgk6N3iPc+5nR9TKpDw
         WYKA==
X-Forwarded-Encrypted: i=1; AJvYcCVLao7ha1lp4Ga0F1fcSVzQ+SiOYE8OM3zR6qUvu+19NeZXi+iBTR7Rk6eZ278WPxB3DvK7xXQKVK/QfvxSL+QNnQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwzpBTmke21xut54CoKNNUhI+8rnteA6Z+9KUmrk2jxf/S6gV5d
	QtZdRwDesTbsPxu9+EGAkcL/qfBnG78rwEehFecg0MKBtcIMjGwqWboahzT7l4O6PwY=
X-Gm-Gg: ASbGncumxun8HjvoSjyHSmskP/7RSwON83toHIumFckuBSmtjqdXxyGDITaYdbZMCaY
	WPeH9vLhoOtm66DzBWl9uPnBZjNEXdxYSDMurDYKso5LyfdXab6/LEgVbZCmbJO+JYe/t7m5jxA
	rJcwuhYn6nwpdan0HSPQz7i0PmdXxDewpeh0gWRL37On+7RJ0f23EgA8PtUS4LAxHd6CMp0z617
	GX+KVUiEEuZIOnUkaGuHuwIZVq6uQDLFjcpGyTUACYwzjR6DBj3HzDT9JCkAXjuuIsw+IDy14bI
	1ZVK+6iLNmWMLkNADpshONPLXDgRb7SlJAFEcwlGiTto7Oa4ZA++4OaCFf70FG3fIygTn1dTI7U
	upWVcEoLqOQn97Nkiugc5USjAjYi2NeAqRSOsx+dXv2C1R+XV5wrLgqj3rVgEtqtIPA==
X-Google-Smtp-Source: AGHT+IFMd/YD9DusPiJTvK0DUw20jIWUMUkQACQOdFD7tGpvhL/p8AIseAQHXKBATfNOLnHCyrOVXw==
X-Received: by 2002:a05:651c:408c:b0:333:f086:3092 with SMTP id 38308e7fff4ca-33b50f93d33mr31991351fa.11.1757510800355;
        Wed, 10 Sep 2025 06:26:40 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c5039asm44204071fa.6.2025.09.10.06.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:26:39 -0700 (PDT)
Date: Wed, 10 Sep 2025 16:26:38 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: bruce.ashfield@gmail.com
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org, ross.burton@arm.com
Subject: Re: [PATCH 0/4] kernel-yocto: 6.16 fixups and genericarm64
Message-ID: <aMF8jgdGtg6M0TAj@nuoska>
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 13:26:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223210

Hi,

I missed "poky: bump default kernel reference to 6.16" from
emails and can't find from list archives, but it's leaving
"poky-altcfg" distro with 6.12 kernel. Is this the plan?

When building "poky-altcfg" distro, the machines can't override
kernel version. I would like to see genericarm64 systemd
builds, e.g. "poky-altcfg" distro with the new kernel.

Plain old "poky" sysvinit without systemd, udev etc is hard
to support on broad range of HW. Thus I am testing genericarm64
with "poky-altcfg", which can't easily update to 6.16 kernel,
at least without https://lists.yoctoproject.org/g/poky/message/13742

Cheers,

-Mikko

