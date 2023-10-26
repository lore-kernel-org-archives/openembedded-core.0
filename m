Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016C4C25B6B
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 07:33:25 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.194774.1698305597013774078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Oct 2023 00:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Lh7r6WZb;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507a98517f3so728456e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698305595; x=1698910395; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBOMB2oK0wUEGi9PLGtaudR1vtJURKbyBq9MzQqrxdA=;
        b=Lh7r6WZbcgpv0pRigc+wH+7aZHV65afT7Hoc0tlp4EDcNcmYQ47p2vUCy5pyWUszTD
         Jkak1vo0Q3Wwsqo1VKPgpxeMe24H6YPctcqagPBvB7vKGKwOJuQPLBETdLhY6nLiUoH+
         YvNLCW01/pnzIoJZ4QEpFNpBkJZlDJaIljeKOsJ8VDAobr0OokRrYf8Vh3Vh9sonePTG
         jqo11up5nWuaa6ohl5j6iFEhjzxDg0HsCJo0ytYqVeOSKAjSGbs5QPLygqLSY4qNJTBZ
         bHBjFD6fXfZEcIc44t0BujxxSU9v7/Wr/LzEtTqOhpVlSZDDmN32/5dEsluiFjPwIcUi
         Rq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698305595; x=1698910395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBOMB2oK0wUEGi9PLGtaudR1vtJURKbyBq9MzQqrxdA=;
        b=DIdq2WEdZfkWEvoG0RmL1OsEFbglULxMbkWwn5v8vis4VKkWtKG4Z4ayGZvySiFiHQ
         ay0yLxTHtCPDeagiWtiO0gTvB09XgNgzCQ/rIxYsSHs+boZ8uEuZheqrXvOnybSnyuRC
         Qyx6lKQbisLFSH3vBl7QKEM0GvURS82oiLUNO0Ee45GyX/H9yOQlCagBZkia71Ccq7ng
         HL3PR6q4us/yLYYBvQ4GybYeY/q1G2ci61Kqng4ok423sLZR9g0xG9182VglHBNX392b
         szmQA9y8eeQNyOa457undNWZA1mShAKwSKhZOvqrslOj1TTqdVxJZirViBfMKvlrwfmc
         zGOw==
X-Gm-Message-State: AOJu0YzlQXGzjIo9UhBsqg5BF6dRxRhwmLjfDBnldR47FlPmtV/uCPM/
	rTY6hsZbMn7lgX+ZptJ+iYlR1HhxMg0kCyWxBZM=
X-Google-Smtp-Source: AGHT+IFDvM+IcR4CBw9E9Xz0LWXFVmaMyMzBX3jQSXoCadLSQnBzFCSKg1c6dWOtIAlUcNorAByV6A==
X-Received: by 2002:a05:6512:201c:b0:507:a624:3f36 with SMTP id a28-20020a056512201c00b00507a6243f36mr11790277lfb.11.1698305595155;
        Thu, 26 Oct 2023 00:33:15 -0700 (PDT)
Received: from nuoska (dc7g6tyyyyyyyyyyyyhlt-3.rev.dnainternet.fi. [2001:14ba:16cb:a800::193])
        by smtp.gmail.com with ESMTPSA id x12-20020a056512078c00b00507a4661f76sm2894575lfr.145.2023.10.26.00.33.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 00:33:14 -0700 (PDT)
Date: Thu, 26 Oct 2023 10:33:08 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] cve-check.bbclass: support embedded SW components
 with different version number
Message-ID: <ZToWNBD4lXRRxocy@nuoska>
References: <20231020074926.230734-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020074926.230734-1-mikko.rapeli@linaro.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 07:33:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189702

Hi Richard,

I see master-next has both v1 and v2 of this change. If there is a rebase,
maybe you can squash them into a single commit which is v2.

Cheers,

-Mikko

