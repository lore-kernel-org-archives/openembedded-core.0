Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4040B7C7A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 09:24:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l2so52752211wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 02:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=k9fe8/0ZFeEDAs4iETwVGJfOSnKcucbbqkI0mMgcB5w=;
	b=SXWP7KVdY8iMCgNEkbQRTiZTGCtWLm7mI15432lBVpeubTEYq7r3SefZFFkKxuMeY1
	h1mgf9n2RVbvFamduuWn8l8BLjhs5sK/VC4cx9LlBq+18xzfdw56axOjYQuDFfD04XFZ
	h5w6H6n0kJDfkNaGEiIrHUDhvanE3kjSvymtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=k9fe8/0ZFeEDAs4iETwVGJfOSnKcucbbqkI0mMgcB5w=;
	b=W+xSXXRXqJRL9FlxHQO65BX+SNiWuxvCNJouEoV6VG8k+YXT29LnBe1yihI0N9WLiu
	1vhbb4aeugTa1cmP2KS6fOupS9FWcRevTeEDTl/5GpuADRAjHVGelPWO/oaZAau8Q8dJ
	P/hFkNSnSWx5zRFQYhWK/WeI6n5Xo2ggVSLxjQyDdkagkRI4s2pkKmdfM7FAhO0JrtJW
	S55jzrgxT1EBHyhVKMfJ2eK28AUYjQ524SUNLjBjP7F96DSQ3gf3cXQfKI7YqXpltW0v
	Jl3VwPKRxKUd3ECbkKkhiwudWvTevo5lwH4T8mOp1gZEZVvSJ5BrRcakEuNd1Mxlcxl6
	JQLg==
X-Gm-Message-State: APjAAAXRbmwM/qejQ05PFe3o+ZZEFULlwQgSwXhaTjjETqVzNCDkJlp8
	wHrSWA1y4wyfx6rGmEAnPq74Onab23U=
X-Google-Smtp-Source: APXvYqzvw5mbnI9YL2JwagGNIqtph/I3k3umyWVEL1w3UoalvuMPvLXizKJlXOCNPgwGYVy/zNySbg==
X-Received: by 2002:a1c:4e14:: with SMTP id g20mr22709398wmh.3.1564392251893; 
	Mon, 29 Jul 2019 02:24:11 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c30sm115382610wrb.15.2019.07.29.02.24.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 29 Jul 2019 02:24:11 -0700 (PDT)
Message-ID: <94cb7605aac2de544bd8e1bd3784dbc226b6e73b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 10:24:10 +0100
In-Reply-To: <20190729013309.22223-1-zangrc.fnst@cn.fujitsu.com>
References: <20190729013309.22223-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCHv2] mdadm:add mdmonitor.service
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
X-List-Received-Date: Mon, 29 Jul 2019 09:24:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-07-29 at 09:33 +0800, Zang Ruochen wrote:
> -The original file mdmonitor.service is as follows:
> ...
> > [Service]
> > Environment=  MDADM_MONITOR_ARGS=--scan
> > EnvironmentFile=-/run/sysconfig/mdadm
> > ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
> > ExecStart=/sbin/mdadm --monitor -y $MDADM_MONITOR_ARGS
> ...
> -It has a syntax error and it doesn't work properly, 
>  so add new file mdmonitor.service to overwrite it.

This is better as it tells us what the problem is but it still isn't
quite what I asked for.

Can we patch the file that mdadm is installing so the difference is
clear to anyone reading the recipe? The patch will also have comments
as above so that people don't have to find this commit to understand
why we're changing it and what the problem is. If/as/when upstream
fixes it we'll also be able to drop the patch, rather than not knowing
if/when its fixed.

Thanks,

Richard


