Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3516BC7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 21:40:07 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x15so49101861wmj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 14:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=jjOpvK+5n2VaaY0zgLkYhVzXrfhATFTfWiGynhx4HmE=;
	b=VEjbdfCT4pK7HF18o41Yu9SlgoyH/2Fzyg6/J7LG4k8PzRTPWSdRB71LZqVheu9oa3
	Lbz0tDkWks+K8BkD7WPGVfef3zXi0NAONUvOxRLWwofH65ybBT0wcuevgKfUeT8p/yTz
	AUHuPjlO6LZj2Kp1xCpa39JelRz3kkPsBmZ5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=jjOpvK+5n2VaaY0zgLkYhVzXrfhATFTfWiGynhx4HmE=;
	b=be6hO+b7rtoqv6LxTWIHQsDYMWkAJvi2gShbMJ+4tYhy3LtPuiaZN6KOTh49HjpoeG
	twgbJ28hw/Ms3+p3Yiwlqh0u1Sk9qUvVSR89SCwGt/UTnBQ7OHfgeqGSNfgh8UDx6jAb
	25SN+IitsukxEAfNjT9eSdulUiWxsqvh/8Mw6EW2k3Y3r8rkurlF7ow2fKQXdBKmi5SI
	iaiJKuUN4P9aOhwX7BqaSptBh6ePJ/muor4/EOkGwfaW5XaIhEu3Hsn4EbiQDv/QIUfe
	uDLPV4vokLb9ghW1S9WBS8V7RfOMqtZzyZJpNvznMF6aRnWEJwfMsakkWSxAes/sdHqo
	4bqg==
X-Gm-Message-State: APjAAAWpH5MWOmKCA5g4SkTR44UjixO/y4gTRNlD8IAR0+UJQvOnsagx
	G1FI091apXYkXfki24ox2U6cJA==
X-Google-Smtp-Source: APXvYqyRLKbhcLN9G1qZezy/DjFkBUsUX3rfVGs9TPI1392scNPA+c13DsVCQLEYTIkOLOJTqKqFkQ==
X-Received: by 2002:a05:600c:212:: with SMTP id
	18mr36702445wmi.88.1564177208034; 
	Fri, 26 Jul 2019 14:40:08 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s188sm44043584wmf.40.2019.07.26.14.40.07
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Jul 2019 14:40:07 -0700 (PDT)
Message-ID: <0c505fd8dd1e01a8ff06eea35144466d3662f67d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: kai.kang@windriver.com
Date: Fri, 26 Jul 2019 22:40:06 +0100
In-Reply-To: <20190726092342.37231-1-kai.kang@windriver.com>
References: <20190726092342.37231-1-kai.kang@windriver.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] core-image-sato-sdk: test image with 512M memory
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
X-List-Received-Date: Fri, 26 Jul 2019 21:40:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-26 at 05:23 -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> When run do_testimage for core-image-sato-sdk, it fails to pass test
> case:
> 
> > RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED
> > (0.43s)
> 
> It is OOM issue and daemon rpc.statd is killed:
> 
> >  [  531.306146] Out of memory: Kill process 193 (rpc.statd) score
> > 200 or sacrifice child
> 
> Increase the memory of qemu to 512M to avoid such OOM issue.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-sato/images/core-image-sato-sdk.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-sato/images/core-image-sato-sdk.bb
> b/meta/recipes-sato/images/core-image-sato-sdk.bb
> index d7cc52b52b..f7963d018e 100644
> --- a/meta/recipes-sato/images/core-image-sato-sdk.bb
> +++ b/meta/recipes-sato/images/core-image-sato-sdk.bb
> @@ -9,3 +9,4 @@ IMAGE_FEATURES += "dev-pkgs tools-sdk \
>  
>  IMAGE_INSTALL += "kernel-devsrc"
>  
> +TEST_QEMUPARAMS = "-m 512"

Any idea what is using so much memory in the image when this happens?

Its rather sad that we can't have NFS+systemd with 256MB memory...

Cheers,

Richard


