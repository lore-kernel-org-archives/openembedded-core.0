Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C84EBC25B10
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 14:46:29 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.14770.1714747582760561066
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 07:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bNHdFR/r;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2db7c6b5598so118047081fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714747581; x=1715352381; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HZ/edHkEFZ6Q28MviKCZ/Rj8xeZ/qG5VdBnYipUNHB8=;
        b=bNHdFR/r4T3UV8w04MoBht2SAg/TCPcKIYhnawBjVAfQnu5ak/sF+BiVP9Ax2wuJjq
         xK8QRiX3U+hjDjMxLTUMYN3nQYOQn5DSWwfahSProU8UUmGCAM5lMMys0q8a6CqLsQkl
         INjRTf+SuMyNiYyIb9TJo1Bpw366xiON1Oyqm0AbNmZS5OLVDGzCl1DDYD0BDZVmf1BF
         1t9/R+qzIw0pnZtQeySRml6f79xf1tM9vvgXA4wJqvGO12Lw2agvsg9rgDfWAyTMPMNe
         fwVD7leQIPcK1J2Ul1XzctEK1NHnyD51m81w7o8tIzujQLzRyDcRuzMBCrsYzxLMiJ4f
         J2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714747581; x=1715352381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZ/edHkEFZ6Q28MviKCZ/Rj8xeZ/qG5VdBnYipUNHB8=;
        b=HnBBrs9rwHTzPewcQ0cWF16BAxZ1jWyqwZh+BRCV1u/huhu1I8AOU6jPIwaUuWhS0F
         2Rh8ss3MMBlNDs+trNyOyD7o9z1F99VJdRvT/eE7S8qV79IDtM0J+7LvNrDB6mcFPxOv
         4TOWk6vzMJfViTfwvG1vsC6m0eOOrsfE6W5gFypRovXBWaCSve+aIUWB+pp8IPYF+aVk
         wCHmDwxbuocZQw4hzNdpemSReKBoe0dEOYjYtPo8D2h0DbEVxNyKrxIW64aaU4A5lXgh
         Vf7FSuBpUehcZsRp6Dj9wR7at2bx0iQ4pbDGnznEEAcB+66zd7icGx9ZubT/XRQQVA/Y
         75sQ==
X-Gm-Message-State: AOJu0Yw7hAQBMbVM2MqIcWLHAxd/d/VjHd38sPxVZhk60jsiNK+5W4Xj
	zTv51O1Odb+jdbk6lhUUhCXges3wulQHDs/wY+f+882Qm3L9MY8XIwIgE/v8K8U=
X-Google-Smtp-Source: AGHT+IELVsgcC2+FgYA26UH+JzpsbbG3o4PJyjm18Oy/Fd+onFhZ9ronhVImX+uD4l1tQRRL14DN/w==
X-Received: by 2002:ac2:53bb:0:b0:51e:e876:3504 with SMTP id j27-20020ac253bb000000b0051ee8763504mr1938653lfh.16.1714747580779;
        Fri, 03 May 2024 07:46:20 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512348400b00518c86b3eb7sm548159lfr.80.2024.05.03.07.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 07:46:20 -0700 (PDT)
Date: Fri, 3 May 2024 17:46:18 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] openssl: fix pkgconfig path problems
Message-ID: <ZjT4utgM3YAUM1BF@nuoska>
References: <20240503105921.3734301-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503105921.3734301-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 14:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199002

Hi,

On Fri, May 03, 2024 at 10:59:21AM +0000, Ross Burton via lists.openembedded.org wrote:
> OpenSSL 3.3.0 introduced new pkgconfig generators which interact badly
> with our incorrect setting of --libdir, which is documented as being
> the name of the directory _under $prefix_, not an absolute path.  This
> resulted in the pkgconfig files have libdir=/usr which mostly works as
> the actual library directory is on the search path, but can break other
> recipes (such as tpm2-openssl).

This fixes tpm2-openssl build for me. Thanks!

Cheers,

-Mikko

