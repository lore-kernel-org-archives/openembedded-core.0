Return-Path: <petr.vorel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A81C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 17:48:38 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.28209.1707241713160686404
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 09:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Osw4kTIb;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: petr.vorel@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a26f73732c5so838167666b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 09:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707241711; x=1707846511; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkUaRtFbx84e0fVE5D53Q+2g/acA4FM/NMYQBBiiJ14=;
        b=Osw4kTIbtbhd2koSfxV7BmSZXHLWbWdjM1sbnnarrqXYuBqvl+5SK44KDaEGZn1DIu
         lD058BfGILFSZkH0RmTO6eonRDi2RaQUyCbGsQJtSMiKvzpD6OV7Ump3iqczt2fHheMR
         cy2A+chqZU++zEKtHiIB5ohO2jiUk+mrHZRcmybqfhxpETrXRObDLC+MVpkzYzE3NvZH
         KfNP0OfBzeBuBiV2JL6qDe7EjOy8PvM1zwSGTpgEnJK0+LpT+TkKbgbKMddAGQAm72Rh
         Yhr2VBpY0XgNGGDUFZ6cDrg2ROgftA8WkBh3vbzWTeVngmF4eaExzcBys8+Ky90cvAz3
         McbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707241711; x=1707846511;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkUaRtFbx84e0fVE5D53Q+2g/acA4FM/NMYQBBiiJ14=;
        b=V5nIiOSvd5//dx5TczrX5+0F44YbQweAhSJcuWSPK3CNTY4RoHi1RGXveB6/DRVeEY
         1KTI2gOMsBDim0c8Pw3wu7TgG9gvxhRv49I8RXV2rl4gMhKTs/Ml+6h7g2oL/Hnvv873
         szxPO8SMpX8brieose/XNpuZqmllvLbuQfgbhn9KFWfFH6q4jtVrkSnnIQDV0G37AaP7
         0+J0Z+mJicuBb0zRO7lTaxitexrXySlSyqU11b/+jTM7mA5p3M3v7dvH67u9lyiGarDA
         m2ZH6CAQtHTWluBZqBvHStdn81wypMx6Vw5DlxDSAjNjPYzEMq0HB4v462kOjx1iL8e+
         lJuA==
X-Gm-Message-State: AOJu0YwH/vdwsw/ofFdVynB5tcJhpJ7JAohlkRMSpsMhw/emgfvkVtSx
	3u27bH9dss6g20y2wk5/85YYMcCULLDJKviIW1tkZnvV/KMAWS1J
X-Google-Smtp-Source: AGHT+IGap2TUBtc8FWB6jDqxThbFiP2r3+C5jhdqCqtYPDZk0PU/ZRi/Yufp9ZQyYrEY9InJPuzv3A==
X-Received: by 2002:a17:906:acd:b0:a37:adee:509f with SMTP id z13-20020a1709060acd00b00a37adee509fmr2623813ejf.12.1707241711302;
        Tue, 06 Feb 2024 09:48:31 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id dc11-20020a170906c7cb00b00a36ffe7656esm1379106ejb.198.2024.02.06.09.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 09:48:30 -0800 (PST)
Date: Tue, 6 Feb 2024 18:48:28 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] ltp: Try re-enabling problematic test
Message-ID: <20240206174828.GB43734@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20240206102246.2569704-1-richard.purdie@linuxfoundation.org>
 <20240206102246.2569704-2-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206102246.2569704-2-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 17:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195015

Hi Richard,

> The proc01 test used to hang when reading /proc/kmsg. This issue could
> have been a number of issues which were fixed in the meantime. Try
> re-enabling the test to see if the issue is still present.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Crossed fingers to get it either fixed or logs which shows what's wrong.

Thanks!

Kind regards,
Petr

