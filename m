Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50CBE75449
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 10:41:08 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.104950.1696329663953026969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 03:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RhV9/0As;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so947348e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696329662; x=1696934462; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bKgBx0jHD8pBDcOPTAMHmsEDM/fzWJMzIgwyBcnvdEo=;
        b=RhV9/0As+cWWAW0nt6RkuV2/oFVVpg2Nn6BDoyHtgy98r3Ms7NdRzkzsDX0Hav9Fds
         4LIhh3/RP1dh7gjZ+UDRTMGG6YIg3XEufjvf9adRh0fT7iMg8K+MRkWuXBaOmt5j66xk
         u/AJGBf5UE4QfyCyS7+fFSG1n9TzvbJH2/pTUIQle6sX78TY+A1orIfS7e73dapEavyp
         srx/7B6k/jUYzxqJBTVsZ7p+2UAY7JZuIVKaT9pRqvXGBM/Cf+QT1kNL93TpB39iQOAP
         QAxScwtI+e+j7NAGx8a4CMMQjLEJZOL9UTC8drVnSVIzyCX7gV6rgIvC69Taimf/kUVR
         OcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696329662; x=1696934462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKgBx0jHD8pBDcOPTAMHmsEDM/fzWJMzIgwyBcnvdEo=;
        b=SjWYf8ulVfN0TQW27jlzVjzYV/8oCunl3xKgK1B+Qw4hhA9XNwsx93m8NrDspzUu3i
         o+DF3NMAz6BUH+d0FlfcLnI3t66UZe8ScqkiSEZxFAVar6fYlYIX/Xl4/IRxAQFM9j5I
         u4RlBHmcqPNSHfZPATlBcnJLHVHRWQP6GVOY/y/uI/5SYFK9wEvtrP9HHWGHh/x0NDRM
         9X3R8+jHxjw3+mzYMJUpGlXF8KGeaZKBusPZUcsakCx+mc92yzFKUaE1FQFp0mXosKKd
         u638LZGPTrJ0MxmY/yVVaQEr+yZTcijOWgjzHeWdKbYhJqn1dK1j59OKtmVUgLr2GAZ3
         dEsg==
X-Gm-Message-State: AOJu0YzUyZA6l3jUvbG8OhSlCxVMr7OqatA+yN1FHdL+yHP+7Gz6/Hkb
	sr51rgkBnrmIXhb9YHb4JUlPD/TWgO5zBRgCTno=
X-Google-Smtp-Source: AGHT+IEQ4cE8AE0R72SHYoo1s4qk9cyMcB7QYbDb3nME/L/vCW2hFE8dEkGQ/jOCflh6TieQQGrNFg==
X-Received: by 2002:a05:6512:15d:b0:503:3587:fd15 with SMTP id m29-20020a056512015d00b005033587fd15mr11096675lfo.61.1696329661946;
        Tue, 03 Oct 2023 03:41:01 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id b20-20020ac25634000000b004fbab80ecefsm143790lff.145.2023.10.03.03.41.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 03:41:01 -0700 (PDT)
Date: Tue, 3 Oct 2023 13:40:58 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] qemurunner.py: capture raw boot log
Message-ID: <ZRvvur2grAF8gXYB@nuoska>
References: <178A92BD7CE204A5.31348@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178A92BD7CE204A5.31348@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 10:41:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188632

Hi,

These are for master-next.

Cheers,

-Mikko

