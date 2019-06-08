Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D2B4960272
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 09:19:53 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id h19so5606904wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jun 2019 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=6+QrByKC0tITq5mneznZKeHkPdVNWEnfjyWW6ElR2ig=;
	b=alegfwMRDlrERnHbp66q61pJNdXnPRbh6klYtBtJuUxb9dy5y+giRJqYE58dmYg9JV
	hNboMUyLs82z+BAqPRHURJjlszfWwyH4Qm56NACHB3s6j70//G0dFM3tiL5faOLnVseW
	bfkrBEiHQlDKSNjmN+R4c5Tc9wf/xepqOslIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6+QrByKC0tITq5mneznZKeHkPdVNWEnfjyWW6ElR2ig=;
	b=LrTjAn+xNMa49wYKZbG5wezrWF2IWxW6ElK07RWcZKlOY7HJBnmQ0Wzcpubi1OdUGL
	i4jQAPS2gY80vxgHdK4ETBFWxql7CcInTzc5NZhAshrCcWQhaO3stK6ldnZTzT4I4WfA
	hd3G5BEyUlZbzaBtqJjVJnV/AkokkRi3NRz9MZzyWsQAljovxIJ1U6ySOI9xYTijoxwC
	an12KTEs9yGdfgSBO+jrYHcNRglDp/IZZwNyJjejSXZ0rbyhJZF92C35WU4J9lj2RjrJ
	HtpvnVza55U2c7/iKh4BPGzsYyvUX3ts4CDvrkMPKwiaZnl4stgtqV738FaBhKw43k4W
	LGTg==
X-Gm-Message-State: APjAAAV4Xz9ikRJdNALBx7NahphGiHTUuzdNTPZPdNNF+Q3NAeZqOwam
	bg+jYA2BepNjVNv7UHf3BJeFlQ==
X-Google-Smtp-Source: APXvYqxyNxAdiHGK1veazTZPOP/HPR6FO/0nxk5moO+Ow1DGZ5JHQ/RvljbXbUplkoziUEQaLeD6Tw==
X-Received: by 2002:a1c:544d:: with SMTP id p13mr6975460wmi.78.1559985594570; 
	Sat, 08 Jun 2019 02:19:54 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n1sm3909941wrx.39.2019.06.08.02.19.53
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 08 Jun 2019 02:19:54 -0700 (PDT)
Message-ID: <41ee86105d0ff71384c9e2bdb51612431e047bfa.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Adrian Freihofer <adrian.freihofer@siemens.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 08 Jun 2019 10:19:52 +0100
In-Reply-To: <20190608075948.30537-4-adrian.freihofer@siemens.com>
References: <20190608075948.30537-1-adrian.freihofer@siemens.com>
	<20190608075948.30537-4-adrian.freihofer@siemens.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH v3 3/4] runqemu: support non-bootable wic images
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
X-List-Received-Date: Sat, 08 Jun 2019 09:19:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-06-08 at 09:59 +0200, Adrian Freihofer wrote:
> wic images are handled as vmtype images. Starting qemu with "-kernel"
> parameter and an image of type wic is not supported. Especially for
> "-machine virt" the combination of wic with -kernel parameter would
> be beneficial.
> 
> This patch changes the runqemu script to support this. If QB_MACHINE
> contains "-machine virt" and the image is of type wic a -kernel
> parameter is expected. Otherwise wic images are handled as before.
> 
> Example:
> QB_DEFAULT_FSTYPE = "wic"
> QB_KERNEL_ROOT = "/dev/vda1"
> QB_SYSTEM_NAME = "qemu-system-aarch64"
> QB_MACHINE = "-machine virt"
> ...
> 
> [YOCTO #13336]
> 
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>

I'm afraid I don't like this at all, it feels like a horrible interface
which won't scale. The fact the machine sets QB_MACHINE to use virt has
no real relation to whether the image contains a kernel or not, it just
happens to match the current defaults.

Can we add a specific parameter which controls this explicitly?

Perhaps something like a generic "fsinfo" parameter:

QB_FSINFO = "wic:kernel-in-fs"

with wic specific information in it?

I do much prefer the wic-fs and wic-vm change though as it means more
than "wic-nb" did.

Cheers,

Richard




