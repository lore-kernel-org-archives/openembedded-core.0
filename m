Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1B87E94A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 10:55:28 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k11so2059376wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2019 03:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=PAauaX2xSNa4KZnpjQukYKwyM0h13ue3p2JQNN5WNRw=;
	b=ef3axHoLlPNfn0q7iJX6UCwSNey3ulSNCL2Diu7FmGGLmG3rkEhLo7MNC8UkHPu8Dk
	8HS9pj1r59NUraHi+qRm32031OLnpEfcJ5QrChgXx0IkIToRU5bDeFeszuksT6Gm4iSl
	eicKYc7bms8JKBYLvNetStcIJ8yo6Cn/j0LKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=PAauaX2xSNa4KZnpjQukYKwyM0h13ue3p2JQNN5WNRw=;
	b=esaC8GsjpKVMcMHcRn2kwoDQVgFdKn/GX/KimbkpT6EyiEumiFbUlVgtfYFK0Eg8EF
	F8AJmMBoT5buA4vEh0HXp+lQmAdn9nJKf/Xmuo42lXmgUva6T92ceu90itDr9cLa3Ew0
	cs4g4Z3xq8C0FrICvz7ejS76ml9eqm6K6MOIM7xX+s4pCGNwH3M/N6mw8sB6DlFlu97L
	Z2M6ZOabDOcC5s8ONeFIm+TZzk3uwZSrqsvCc3VgoIeydNnYV5lmU1b0SL4JYgHCAml8
	qE5/l1Aua/ufVYz2esQqd+0fJMNaYNJqzNFGHhTe3qJkfUGKwFzhCdJ13m6HjdkkQLw5
	n0dw==
X-Gm-Message-State: APjAAAWUOfSsAx1jKcxBn4rhB8ABVsXiJIZ7GkdWhnptz76rZA1+jgxl
	NsI0ZWlUElQinatFspRjYsL6Rg==
X-Google-Smtp-Source: APXvYqz9cNM8vZwizQgM+j1pNeektGeO6ygEaCGiZzNGn6G7OWEC5WbvXPa9o7XIbd4Y+QYbMvdiQA==
X-Received: by 2002:adf:83e5:: with SMTP id 92mr39041551wre.274.1560509729058; 
	Fri, 14 Jun 2019 03:55:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i188sm4578280wma.27.2019.06.14.03.55.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 03:55:28 -0700 (PDT)
Message-ID: <a7a06678f3346863015258fec2ed65e7d8065196.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 14 Jun 2019 11:55:27 +0100
In-Reply-To: <20190613175442.26121-1-m.felsch@pengutronix.de>
References: <20190613175442.26121-1-m.felsch@pengutronix.de>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: kernel@pengutronix.de
Subject: Re: [PATCH 1/2] mesa: make gallium swrast target optional
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Jun 2019 10:55:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-06-13 at 19:54 +0200, Marco Felsch wrote:
> Most of the time we are compiling for embedded targets which have
> dedicated hardware combinations. Enabling swrast by default isn't a
> good
> solution for such devices because if the hardware render node has an
> issue or doesn't support a special format/request Mesa will fallback
> to
> the software renderer. This will make it harder to debug performance
> issues.
> 
> A better way is to let the user decide if a software renderer is
> needed e.g. if the system has no hardware renderer or to have such a
> fallback device. This way the user knows that the software renderer
> is
> enabled.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> v3
> - rebased on current master-next branch

I think this breaks the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/694

Cheers,

Richard


