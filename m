Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A937F6C466
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 16:43:21 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x7so7272193wmj.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 08:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=BtHUXn6wVJ6Cj29L6R7GwCR1U09OBuOvCrKFe5Zgud4=;
	b=NuFhtQ93GPYplM0UBZ1osV38TWZcHtvN+asetn4KYx+vIL4yfn4k2POHrTs5r2yyoG
	fpEFADaBP2JZMycwXdrpFNaSPHa7Q4RaAw2gqIZEkRpvYVAxQu00zO/Fjw0hnyaXLBuZ
	jHyOue6ZGyzPF3+57/YCD/7n+dD4iFHqUUySc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=BtHUXn6wVJ6Cj29L6R7GwCR1U09OBuOvCrKFe5Zgud4=;
	b=XP9w63ZHVN0i3qT12MaxUSL8DeOX2G4nMTo1twERlPrHPHnckm46ML+gKjpTtUQGbh
	91iyEMOvW5rJadpSMbohVoEsnZNlXgeN48/8IIg4QvPb2j6ECXJS8+D3vzi36P7gx7JB
	5mgeYcdJiYWa4IMwMnxFkZ/NTkLORoK9/1vHvFpLIF7PE1881zNllUFHQDJmTHH6x+2q
	oH9wm+v7MLKs35j7/8AAMfQ+k2BS0x+0d7Ej1UJbY+Dw4N3j2Qe6hovnxGnswhjYIOOv
	KSxH6Yf3sYohDdIwZHz4aGEI0ds0SAWQN2bFaj/z3ivC3lD+q1eHH6/GsXCILEL8YSOS
	czvA==
X-Gm-Message-State: AHQUAuaI7EBOtTW01nLxBuhkTclziZOiXXdS1/4Xj+3nTvZArdJlaWx5
	VStFl9U03W7hZ0wgaYSCUPmBAw==
X-Google-Smtp-Source: AHgI3IafyUjFgisXWdEk2vYCAjcylpzoADk5jcT6+DPrr5caYCCRrJPRFGsbJFVQGpOBgSl1PkRl7A==
X-Received: by 2002:a1c:2885:: with SMTP id o127mr2263629wmo.135.1550681002155;
	Wed, 20 Feb 2019 08:43:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u15sm7347680wmu.17.2019.02.20.08.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 20 Feb 2019 08:43:20 -0800 (PST)
Message-ID: <7e7bf60a91548dc0373fd53b32baa28f163cb86a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 16:43:19 +0000
In-Reply-To: <20190220135043.25837-1-alex.kanavin@gmail.com>
References: <20190220135043.25837-1-alex.kanavin@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] pango: convert from autotools to meson
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
X-List-Received-Date: Wed, 20 Feb 2019 16:43:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-20 at 14:50 +0100, Alexander Kanavin wrote:
> libxft is a hard dependency now, accordingly drop the patch that
> was made for it being optional.

That breaks the no-x11 builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/311

I'm also wondering about the warnings in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/309/steps/7/logs/warnings

and I think we have a race:

http://errors.yoctoproject.org/Errors/Details/229403/

So making progress but not quite there yet! :)

Cheers,

Richard


