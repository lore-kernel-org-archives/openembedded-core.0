Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA31CA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 10:29:48 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.35681.1725272983242022192
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 03:29:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BAd9yG+7;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53351642021so4296894e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 03:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725272981; x=1725877781; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48OOJv0V5HR247+mivhJbbNCw+pHwe2Oj5DCjtHgwcA=;
        b=BAd9yG+7sh2pRuEWlRD51cRah8uSQZ3vSMqpsBfVw8x2dnKfdcN+Nn+NCBsbzgj00y
         NmMD4VkXHu+tYkhjXLU3WR1wMGq7XNOaJL9FVof6Qo27fnsi5JeCFTSuMbe4VEeqKhLE
         CGXkbGT2NepJiHc29MaKSm14xhlO3bfG4KaOmVjLvF3MolVGr1Ne6X3vNf/1NVVy55F7
         CZnlZshgqfrDOI+9ZeVrXJotqHNXYH+UoO+5nKiG8W/k9mTw+gpT7sHxudv6lcAZzk98
         xayaymoYM0qPuqO3chMV5Ii6jl5Vi572UVcUQlKcXYYcqP9g4dAjwRDTsLBpNMOQ/DpU
         +DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272981; x=1725877781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48OOJv0V5HR247+mivhJbbNCw+pHwe2Oj5DCjtHgwcA=;
        b=l9xjOdt6rW2VuJq5l86tpcJDjm9+r2SA13/sDwLS3VokjgRELgTcPeDDr94yGaWuUx
         r2GxZJs7Qq2ri/MX88fKgqeBrNPhBlo4Kk0TxuBcNLW+QNMj6xS72civeUHp/oxxxCz8
         iUNSKFdYuxo9oPPJc11sVZXIJLGoG4kYsueEyooX5SMjYknhXa8T5TacfS/8WcVd44dT
         mL2lFEiw4jZ8L59nO08ZIwdH71mIuKZG7ZtwCXe1toZ3ExQEniBOdEg2Uf+SdmOnTJox
         nzJ12NcH5srxnVXgT/tV/pN3xwcVj/TlWQV3ydy+sqwX7wh4N63v1kQyJGAcDw0MVNO4
         yCVw==
X-Forwarded-Encrypted: i=1; AJvYcCU5q+WcySQ6BoJX8Ffi9/IivJRi4QCjZja3KAeHiUiGgsNmPVlO9sh8XPZJ/DyfptPEzmyiQ1nIqOfauS5Z2fgzHA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRiGfxZyBkuVXxHXNkOp628wz3NdiTVr9kpHoBuLUnQ7322nlr
	s+Uaf6b5mycSqL0rXg290uCT9kvAj0+T+vc/U4fBkHeM76Gtq+c5Ohr7Tt1wcL4=
X-Google-Smtp-Source: AGHT+IFYJjCJzfRMAeXC6RHQsw19R6jUfu32AjaE+TW2PD/HpJpAKCmawj3l++21R5gYP/3aAn7RwA==
X-Received: by 2002:a05:6512:2345:b0:52f:c833:861a with SMTP id 2adb3069b0e04-53546bb06dfmr6589827e87.51.1725272980831;
        Mon, 02 Sep 2024 03:29:40 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540827b3esm1540950e87.143.2024.09.02.03.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:29:40 -0700 (PDT)
Date: Mon, 2 Sep 2024 13:29:38 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org,
	Erik Schilling <erik.schilling@linaro.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] systemd-tools: add recipe
Message-ID: <ZtWTkiaC-D06aXn_@nuoska>
References: <20240902094117.31156-1-mikko.rapeli@linaro.org>
 <20240902094117.31156-2-mikko.rapeli@linaro.org>
 <99e13a8ab6cea2424298d97466ad48540cee1209.camel@linuxfoundation.org>
 <ZtWOBWtSoCnyZ2DF@nuoska>
 <CANNYZj-57xLA-UnJ+nJvdpcu=+AgygMPoz2Pjzxs-QE+vxJ=nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-57xLA-UnJ+nJvdpcu=+AgygMPoz2Pjzxs-QE+vxJ=nQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 10:29:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204079

Hi,

On Mon, Sep 02, 2024 at 12:17:53PM +0200, Alexander Kanavin wrote:
> Wait. Isn't this ukify.py thingy already provided from
> systemd-boot-native recipe?

Oh, it is. I've somehow missed this. Will switch over to it.

Cheers,

-Mikko

