Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAA6E7B60F
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 13:07:42 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.17722.1696424856453901224
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 06:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nmZ+SeiQ;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50306b2920dso1159983e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696424854; x=1697029654; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MPyEd9Y1dDYG7TvLHKlroqxYZVJwUNexnTKSbnvnHho=;
        b=nmZ+SeiQ4fTt6VU9mjh926mAfIXujREtaOVvxSqIg4uPiyafMyfEbOnjbMCH6aFQOp
         n2F7Y7xgkKEeoQ7JVBVagaEYitFTIYVjU84eCHgbkg5J0PqIUpRlW4aDrgYaXEPhMUSe
         Qdkn0taiHu1KrvoSPUFF7mWDuueAzOEBYyOTrLW/Slx7VPUBtUpAlAT2ey3DDu6Lp1Yv
         vq9VyZ2pcFMidrF6LxxkCOPRymvuRTl8KiDrhqpHzvmzZDHAqRvhXG5w0cWH6pA9U7Z2
         lWTDBsXzUj/eeCRYzR048sNi/x275Tgih6rrdImMJCLruCgH1pamo2j4uypu781DnKsy
         dj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424854; x=1697029654;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPyEd9Y1dDYG7TvLHKlroqxYZVJwUNexnTKSbnvnHho=;
        b=cXooGelJjZgXSU4eZUkf6jSHoC34ZwckC32j4Unxmsbi1gCskAieAGhsXCrhiYof0h
         YkYt4H2YIaIpW1xzRS/S+ZDiut6m6EZxBb0f+oJVHU/azqaqcGqTp9pKn5JkIA5RPpJ6
         2oTqMjEEczMyzqAZ+Wc/pju5d794YtXaFbMrKsdsgicCFMbuQVQ5ElrXcqTPwpmW5ea1
         +KJwWhu6VxQoqR4YIX31uYbYQCiv4JeiYZpZ6WcOvtRcVy6Z/BgOVCbHoT6FzNfOkH46
         Wns+96rjRe4PFHmljQ5hrU8Ov8vqO2DJ1tmc3GZTtPkynDSLRYCvS9310KBRKib5a2dE
         aCqg==
X-Gm-Message-State: AOJu0YyQVrQ2+yqPTj1lGx5gnP9+VMTjVAmnpK/sYEjBLxb8h57OTzAp
	DXoPaF45Bdw1ZFY9rI6s7MyEQZziU2E+Xfjupkk=
X-Google-Smtp-Source: AGHT+IHza9/l/ECchPVn1djfqqgZHld+sLevds7e64BGaSNYDp904S9TGb0XXQITZZWzLuDmAwSa8g==
X-Received: by 2002:a19:711e:0:b0:502:9fce:b6e6 with SMTP id m30-20020a19711e000000b005029fceb6e6mr1978136lfc.1.1696424853864;
        Wed, 04 Oct 2023 06:07:33 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhpy-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::198])
        by smtp.gmail.com with ESMTPSA id a8-20020ac25208000000b004fe461aab36sm593739lfl.129.2023.10.04.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 06:07:33 -0700 (PDT)
Date: Wed, 4 Oct 2023 16:07:31 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 5/5] qemurunner: Show both the login console
 log and all logging upon failure
Message-ID: <ZR1jk6AlAXCswWJw@nuoska>
References: <20231004123823.2990916-1-richard.purdie@linuxfoundation.org>
 <20231004123823.2990916-5-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004123823.2990916-5-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 13:07:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188685

Hi,

Acked-by: Mikko Rapeli <mikko.rapeli@linaro.org>

for the full series. I hope our discussion over #yocto irc channel
helped resolve these and the test failures seen with master-next.

Cheers,

-Mikko

