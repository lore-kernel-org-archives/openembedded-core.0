Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 42FA07D40E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 20:57:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id u16so3345308wrr.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2019 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gJE64gPwC9zN3FukteL4+dmDNeljUtWhURF2mXvEygY=;
	b=iD14HI0V5xWh5GFcZaTK2DixdzMZqkE5741e/exHXenLs63UZsIERWFRXQknUtJ7Qb
	9jg4sXpAbn7oU2UaiF0j774AfXEkL10Cw38YLHbO4zoVjd+Xf98B522/J+DCKjZ2159/
	WznELx5Xp958ZgpqMnsqWY4qGpOhBL4m6tcuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gJE64gPwC9zN3FukteL4+dmDNeljUtWhURF2mXvEygY=;
	b=M3j+BfwiZ1dZCV7Dq8UCXAMZaxOh3umPv5kINunTokrj1IsH3B/HV1QIT67flvAWO/
	Kx6NgbdAXjhijjPfMw0gh7ioGYV6W+oRwXvL5Pie4WBBDWqfjK25CyfvybprpENxSYaA
	vTntpp3ncBaDFh7xI4cjAps8MJOw19Rwo7t7HaD+ZD3aeGXRZaAydozhUVz24yW8yW3T
	l49FUG4Fu/412l0xQk7KDswSYbPGrxw7RrIvHxexiocQSRd4lHmWND7oZoLRPQjBbayn
	j1s4HqXKTuNj/czLSh1rylgDehcBdy3bputcjzb4787WhEyoJspqN8w+W7SJuvH68Scp
	KxPA==
X-Gm-Message-State: APjAAAVncH5yCO9WWPEzcBFZbJ9P1ypRpcTsqGSiLyXRfY3nhlufEqdw
	lwY8zuP65TadLlw81oiozADoqA==
X-Google-Smtp-Source: APXvYqwLjoZOAYUcsyGv1I0+strP1RmpRnrgoG6X/i0j/C8D5tNf9H7qIg9Y035fU8M4ejQCBytEiA==
X-Received: by 2002:adf:ea89:: with SMTP id s9mr44697722wrm.76.1566421062903; 
	Wed, 21 Aug 2019 13:57:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	e3sm29855248wrs.37.2019.08.21.13.57.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 21 Aug 2019 13:57:41 -0700 (PDT)
Message-ID: <e6423f026434414f58509f3acec443d1cd681dfa.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Asselstine <mark.asselstine@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2019 21:57:40 +0100
In-Reply-To: <20190820175239.19769-1-mark.asselstine@windriver.com>
References: <20190820175239.19769-1-mark.asselstine@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] sdkext: use simpler kernel module for devtool test
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
X-List-Received-Date: Wed, 21 Aug 2019 20:57:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-20 at 13:52 -0400, Mark Asselstine wrote:
> The current devtool test for the building of an out-of-tree kernel
> module uses something which requires several "high order" kconfigs to
> be set. This results in the test failing, not for expected reasons,
> but rather because it depends on specific kernel configuration.
> 
> You will get error messages such as
> 
>   ERROR: "video_ioctl2"
>   [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-
> driver/v4l2loopback.ko]
>   undefined!
>   ERROR: "video_unregister_device"
>   [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-
> driver/v4l2loopback.ko]
>   undefined!
> 
> Using a simpler hello-world kernel module example will only require
> that CONFIG_MODULE is enabled, thus avoiding a false positive.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> 
> Richard, it is unclear if I need to match this change in
> meta/lib/oeqa/manual/crops.json.

Those are manual tests for crops. They probably do also need this
change as it would make them more reliable if/as anyone every automates
them, or runs them manually.

>  Please let me know and I
> send a V2 which does this. I am not fond of pointing at
> my own github but it was the best option to ensure it will
> exist and not be messed with.

The best option may be to put that repo onto git.yoctoproject.org?

Cheers,

Richard



