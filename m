Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 445467D2FD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 13:58:06 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id h18so8409976wml.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 06:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=N2igmQL3qMs6tSBo36Yj7XZI4ioN7EZYbiqg2hu4v+U=;
	b=Gpc99USXJaatmMr9klaD/DgQ8E/pIMjrd3UPsijT2+16ahfXKPHLZekipJPbOxcX42
	E79V/AfFvAX1ZeI/kT7J3xfRs1SOPclyDuanAYS5UIQIwvF3vOxENfH0lRP2y/VETZ+R
	Nc8vNkxAKnxXdyjA7Ztl3tw43GMG9LkrG+KJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=N2igmQL3qMs6tSBo36Yj7XZI4ioN7EZYbiqg2hu4v+U=;
	b=UGhhARRSMxDaERDhgF9B/zYd/YXrD11ult1YzYAPA0rKMYKXaiClMfZcfx8+cdslfb
	0pciyUvVv6vxkxQD9bFIyjY6w8Un3hOBvMK2NQeK51DdWsTTrZo0BYokY46D3HZqNT2x
	Ozp2K8x9q6ZGa2rwYT4kDDk6B4M+5pqHQVREgOd5QljaMJUzS/FKVzKPrpMoZNgCL50F
	4HEf9lrQ+gQcCFKa4rVDbJEkq1a6GOgVnBUMfVCMXgbKppn810IR6cdqnxZS7jhUdQ3k
	LhHhz5622nGVf2OKnsjjoblf19Ik4Crzb8YFc0yd1NNkDEFAI/1gpeHYGk8sgDogMjsw
	zruQ==
X-Gm-Message-State: APjAAAUKDQHVnsXpmcnl4CcDRdJcx6Mr/RWRij7lxacVrv2baCz6uF8R
	wa/vZGvpj8b1YrIUoY73D6TkJQ==
X-Google-Smtp-Source: APXvYqzMdnDO1VL8VRuP50x/SSoaETw2XLgxwbCFFNOvCxej6+T9zCewrU2Z5obPMQM/5w9SApiLYQ==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr58331wmb.47.1554299886938;
	Wed, 03 Apr 2019 06:58:06 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v16sm25212311wru.76.2019.04.03.06.58.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 03 Apr 2019 06:58:05 -0700 (PDT)
Message-ID: <089f9da0ec7f175fcf327994f31e0728f75313a0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <sno@netbsd.org>, openembedded-core@lists.openembedded.org
Date: Wed, 03 Apr 2019 14:58:04 +0100
In-Reply-To: <20190403131822.19503-1-sno@netbsd.org>
References: <20190403131822.19503-1-sno@netbsd.org>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [PATCH] support CONFIG_MODULE_COMPRESS=y
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
X-List-Received-Date: Wed, 03 Apr 2019 13:58:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-03 at 15:18 +0200, Jens Rehsack wrote:
> In case, kernel config enables compressed modules, support of
> splitting via split_kernel_module_packages won't find any module.
> So, first expand module pattern regex to recognize compressed
> modules and then objcopy on temporary extacted to extract module
> information.
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/kernel-module-split.bbclass | 36 +++++++++++++++++-----
> --
>  1 file changed, 26 insertions(+), 10 deletions(-)

There is a lot of whitespace noise in this, could you clean that up and
resend please?

Cheers,

Richard


