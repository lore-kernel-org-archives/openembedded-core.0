Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9DD47E3CA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 11:44:26 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id d18so4006653wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 04:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=12KazM48HAd0H8a6KIXSVIekSPWaoqueUni4qnEQOa0=;
	b=MYVMyTTIkqKFaydLuHdMF0PfcrAHvUmMtmelc/s9ljB/2Uj7uZt4gFQJ8j9AJNL5A8
	uYEblPnAkpZkovlRmCUD+ECyqlyJdCR/p79yp9Rx6U75zOyJ2m+17FL7btUfy/mPuKl5
	RyJAnLhGPboNda/xlk1X7e9okoQomM5pxXf6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=12KazM48HAd0H8a6KIXSVIekSPWaoqueUni4qnEQOa0=;
	b=iRRJbgk5AuCqW56dNrYU2XoqTRb3DHr4qaJr0BAuXmbcTM4552U9EXPgYeDFiWCtNs
	T+g/WEXbKKMSlaPhFb+PPOaEmgmrYDYy/n6SUbH8Dk8aAjuSPe7IYxF1IE3RxZgxS06L
	tj42CCR8PdTRIRA5OckYq/lZyKLM4EBkBZkIxQvXOtDyudKZcl2YZpLkyVS92d5wK4tw
	VTMzpHYYXYO36WlxXPBOfIgXt8GdmDY0IvNZejfFpeOZMvsUhf0+6W/iuvJ3zkdt2IcS
	SYDvCO3rsHnTsNfIN19p2mTDZAnVg50bSLL+U2+XmKzZu9X8Z60DOpuNH3/iEpSvV8EL
	LTKg==
X-Gm-Message-State: APjAAAWpghoQ9G5XXUYwEOew/79Yx4eVhkUFMXq0bkP7qn3GrHG4dceN
	ErauGtToQFY/AAlUh2yHupONtA==
X-Google-Smtp-Source: APXvYqy9xPcpPSRGdlRL5zBkOrJETSuJfhNiU68hepyyAIxL7QaN2SOXOuxdEr4YBVsRzD6s4uwKgg==
X-Received: by 2002:a5d:4310:: with SMTP id h16mr2415883wrq.331.1559216667544; 
	Thu, 30 May 2019 04:44:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id r9sm2681931wrq.0.2019.05.30.04.44.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 04:44:26 -0700 (PDT)
Message-ID: <39d1e5c522b70d7c6dad4cb37641c0c1ae7cbd41.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Thu, 30 May 2019 12:44:25 +0100
In-Reply-To: <20190530092232.169453-2-kai.kang@windriver.com>
References: <20190530092232.169453-1-kai.kang@windriver.com>
	<20190530092232.169453-2-kai.kang@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: poky@yoctoproject.org, peter.kjellerstedt@axis.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-poky][PATCH v4 1/3] poky.conf: make systemd as default init manager
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
X-List-Received-Date: Thu, 30 May 2019 11:44:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 05:22 -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Move configurations from local.conf.sample.extended to poky.conf to
> make
> systemd as default init manager for poky. Introduce a new variable
> 'POKY_INIT_MANAGER' whose value should be either 'systemd' or
> 'sysvinit'
> to configure the init manager setting.
> 
> For users who still want to use sysvinit, set in local.conf or any
> other
> configure file with:
> 
>   POKY_INIT_MANAGER = "sysvinit"
> 
> [YOCTO #13031]
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta-poky/conf/distro/poky.conf           | 10 ++++++++++
>  meta-poky/conf/local.conf.sample.extended |  9 ---------
>  2 files changed, 10 insertions(+), 9 deletions(-)

Thanks for working on this patchset, I think its nearly there. I'm
wondering if we should set 

POKY_INIT_MANAGER_libc-musl = "sysvinit"

since I am worried about what I read about musl and systemd from a
security perspective.

I'm also wondering what we need to do with the autobuilder init system
tests, I think those may need rewriting to add some sysvinit tests.

Does POKY_INIT_MANAGER = "sysvinit systemd" work for the mode where we
allow old sysvinit scripts for compatibility?

Cheers,

Richard


