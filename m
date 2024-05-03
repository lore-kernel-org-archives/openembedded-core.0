Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF14C10F16
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 10:36:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.9432.1714732613541236486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 03:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=kRI1NFtM;
 spf=pass (domain: linaro.org, ip: 209.85.167.44, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5171a529224so11151090e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714732612; x=1715337412; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ny0HZfLZFgVUFfoSu9z+6QIJgR/uYzPPEo5oa0olM/8=;
        b=kRI1NFtMMH7CsdYtzdNT8Jb+2QjDPv7XtF7oStvw2Krvxs2+HvVFAYNHjBbRfwwEv1
         VuFA/FSYtMGXIunv7vI0j0oA/UhyNFqF3SRQxF1uUuaOxpn4ro5+MqSr8//A4sXjy0q+
         l70m++Ynnm22Yr29qmgobUcR4dN9Bnk7CmZK4K8d9xRd3glFT7gfk4AHHZKCDKpn/KPB
         Ciw0T8/0PZ7636mfxtghuHzC5lmG9eA/T4YhfQEUMQBDndCpO/otSrR1Yw2TYdyGVb80
         M8IjMR6MnamsasrKaEhuQlsCz5xZeFIZEBtBSKFRSTQhUazlDflnzWRIA37wJGu5gkm0
         YErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714732612; x=1715337412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny0HZfLZFgVUFfoSu9z+6QIJgR/uYzPPEo5oa0olM/8=;
        b=D1X9JMmi74kQhKCiKt+DQCsTD45fIZOULfEKjXImG2yLLUVCxWXxybmtxKrSKefF8T
         1hWvgLWoxT0aBRoX7g+aSWpOasWBoS1nrr3JVd4E1o8gY6SiTFBnX8YjTNibriSfPBzw
         DKXXQUNeyYF1/W32KYBRk+uBZsi+my50vhvJTLbIOPr42eHoLJLfvibf2saGYTQeg+Bs
         lqDUx7niYfjMRYrrUGwr5vvVaACVVIP043f4TSuWSJBMGuOSfaiEzU8MnzutvBc7fRDX
         QxxFOufwFJ7nUoYo4ipfoRftG5nxEbm9x0lw0if31/SY2GCmSdsQ2EwGhQ9kfYHqhcWI
         MtgA==
X-Gm-Message-State: AOJu0Yypy1TVD0wsTRP6ZI6uNNQa3ajsihoFgEd2yBCoM8nUMkkcvImz
	rEsu4ZlPj1c2HdsEbcMRwFNaPg1QWQIoFM7wBpR5ZQuD9AoR6DqAcEFNXwBY0L4=
X-Google-Smtp-Source: AGHT+IH4+EpWYoCQZ/7shGslat97HdU9xT9nytSRPbc+gcLQn+c67hpOs5Gjxeysoo7Ft9s9bJYHJw==
X-Received: by 2002:a19:f003:0:b0:51f:6a38:be0c with SMTP id p3-20020a19f003000000b0051f6a38be0cmr1487690lfc.22.1714732611623;
        Fri, 03 May 2024 03:36:51 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id l14-20020ac24a8e000000b0051b64830d48sm500033lfp.85.2024.05.03.03.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 03:36:51 -0700 (PDT)
Date: Fri, 3 May 2024 13:36:49 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] openssl: fix pkg-config file libdir from /usr
 back to /usr/lib
Message-ID: <ZjS-QQ1wDTt-lXsc@nuoska>
References: <20240503102624.594443-1-mikko.rapeli@linaro.org>
 <CANNYZj8RStk4X-HkTp01THZdrtZ+AF3pLoDm6v04TsFKumSVDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj8RStk4X-HkTp01THZdrtZ+AF3pLoDm6v04TsFKumSVDA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198971

Hi,

On Fri, May 03, 2024 at 12:32:42PM +0200, Alexander Kanavin wrote:
> I’m sorry, this doesn’t look right. Shouldn’t we rather ensure $(LIBDIR) is
> correctly set? Besides, hardcoding to lib is certainly incorrect as it will
> break multilib. We constantly have to fix upstreams in the opposite
> direction.

Yes, you and Ross on #yocto are right. This is not right. I tried also setting
LIBDIR=${BASELIB} in do_install() and do_configure but those did not work
either. openssl builds scripts are quite hard to work with...

Cheers,

-Mikko

