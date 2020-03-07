Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B10C6610A4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 18:09:42 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f7so1271487wml.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 10:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=W3j7jS+Ke3F0Dm05uygTFWBA7xwWK/el4IdH97Doiic=;
	b=C7XsrVI0lE3X890+WEsbH7NLpONOCxTQDZ+igfF8E6IWnXOwy8uNP53eq+5mVuGAJw
	U71TgW8FDfF7Wb+kL6j9gaSvudJKC1YYPdLFW3VyjG//mzFaq7yu6L9khsDMqB+l2eDh
	wRVExKr4Z/aZo3Vcc8oq/s4vX3sf9rn57NvgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=W3j7jS+Ke3F0Dm05uygTFWBA7xwWK/el4IdH97Doiic=;
	b=H6TeiDj99nIqmTH4UZvKwr7W9lx+u9BdtTFltmFo2+mgoculFooimT6gs6g6H66lCH
	7wrJdenZ1CA3KSRFZktvi5jbx/TVx1SYVd8IECnyk5GhRqutvAoD1JYCDudiTLiZC0am
	vLqd4yppT1IY0eHqc/Lz1S4UPUUVZZtxtvWgwnndzFUZ/6o4qszbsTzygbJ2tU2cvtpU
	T1FqalJsTsMb8wAzfVydC+WgesmF57rs2OwdmS7xIYtszxhRgzRF6JTLJxDWV3EyO1iC
	/iHeZJ6G6TwIJAXf12SRztkI7/9Z32zh/t9aBZ5qGQKn0APo9vXR6m92I2IKf1a0f0Ad
	/K6g==
X-Gm-Message-State: ANhLgQ11+8vstAAcS9xupq43rP7ISGEFdmY38wSiMFwnLlL55MRiG8oJ
	JSRx+8237srrAsNUqWrgvwy0zg==
X-Google-Smtp-Source: ADFU+vsawOF+OvsPtSbDFJVlNnUho27XBdcMjqa83KJlGfutiXSL/wHCw0fXpt+VEZTQhx6xYpsz3Q==
X-Received: by 2002:a7b:c450:: with SMTP id l16mr11102985wmi.31.1583604582969; 
	Sat, 07 Mar 2020 10:09:42 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	j15sm14296866wrp.85.2020.03.07.10.09.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 07 Mar 2020 10:09:42 -0800 (PST)
Message-ID: <9f8bb6a3d6cb168c1ec2ddb5e2ff5e5970f5668d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 07 Mar 2020 18:09:40 +0000
In-Reply-To: <20200307150145.3100113-1-adrian.freihofer@siemens.com>
References: <20200307150145.3100113-1-adrian.freihofer@siemens.com>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: Re: [PATCH v3] runqemu: support multiple NICs
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
X-List-Received-Date: Sat, 07 Mar 2020 18:09:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-07 at 16:01 +0100, Adrian Freihofer wrote:
> Emulating more than one network interface with runqemu is sometimes a
> bit tricky, but possible. For example, this leads to an emulated device
> with eth0 and eth1:
> 
> QB_NETWORK_DEVICE_prepend = " \
>     -device virtio-net-device,mac=52:54:00:12:34:03 \
> "
> 
> Note:
>  On some emulated NIC types, Qemu and the kernel enumerate the eths in
>  the guest in reverse order to how the device parameters are passed to
>  Qemu. So in this case it is important that the additional NICs are
>  prepended to the -device parameter, which gets automatically added by
>  Qemu. Otherwise, the interface eth1 will be connected to the host, but
>  eth0 will be assigned the IP address 192.168.7.x, which obviously does
>  not work.
> 
> When booting Qemu with two NICs, but only one set of network
> configuration parameters gets passed to the kernel, the kernel seems to
> search for a configuration for all NICs. This delays the boot process
> for a very long time.
> 
> This change solves the timeout problem. Tested with:
>  oe-selftest --run-tests runqemu

This appears to break our automated testing, e.g.:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/1657

(there is a full list of failures on 
https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/779
but the missing xz ones aren't yours!)

Cheers,

Richard


