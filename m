Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id CCF3C7C137
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 16:53:48 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id x10so15884032wrs.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 08:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=pxhmZJ+AmDaRNvjO/l4E0Gf3qA/lETDJw6PTrZl/X0A=;
	b=AmXOGqGcskRaKPYF/Tp/hCHjp7Bm0kH4vUd0gxSo0sF/nfdxKqpJUlSrWeogJR27Pi
	TtbJGyyYLxTv5DUlRg0ZVe7ol/vx+I4XxCTVrd4O5JRJOq61PKpvdJ3s5wB95pHaqv/j
	/MgHp7z8X2uAPhGLBYofyon2YxnQhNBVbaXzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=pxhmZJ+AmDaRNvjO/l4E0Gf3qA/lETDJw6PTrZl/X0A=;
	b=uDryd0O9i1mjuTCbOGbXxnwhRldX+DwOvgLZkss/1fAvzbjLNvZaSmyXnJO1B2Nxas
	sVNi0fqRK+5W2CVOEpElPRPcyutGP3q4weo/Ti1KQFg6JDYgLSFCl6pSHXY4b6ZerFwW
	KSUh9RUFHEj7/hXC90ljOjfds5nMjsZ9ljENnTf2xW0EvUZHlmYNp0DPUEHHxESMdIRS
	r6TYgDFQA0ci+fMvg+unk1EFGjJeRbQdcWQ+dU1uU3pD6dDopdnyVEL0W7ANmVa65had
	eMRZNBqL9SUkZOWi8IU0twrltfDopSbzeJ+69XemtKJFO2E1lP/fmOdr6IBBW2FD2Xn9
	TdGw==
X-Gm-Message-State: AJcUukdZBSPOKeUdq6GKH27tGLrada1pPpq4nczIk7s8Tus9Qg5tjnMp
	VnNCWWgZtJOXngx5BB0tqTVK9ECH3ztT1g==
X-Google-Smtp-Source: ALg8bN6POInz3qIfN49w8kgfc9OUwVsTwqGf0dBfXjFoTRBSXbFGugFOUfberoQG/s2o/gRZr9II9w==
X-Received: by 2002:a5d:5089:: with SMTP id a9mr14560583wrt.327.1547225629483; 
	Fri, 11 Jan 2019 08:53:49 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	10sm24078591wmy.40.2019.01.11.08.53.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 Jan 2019 08:53:48 -0800 (PST)
Message-ID: <47731964b9ae52ac23e67b92bbfd1a1ad3e2acc0.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2019 16:53:47 +0000
In-Reply-To: <20190111164951.8329-1-mac@mcrowe.com>
References: <20190111164951.8329-1-mac@mcrowe.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Subject: Re: [PATCHv2] glibc: Separate out AArch64 multilib loader symlink creation
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
X-List-Received-Date: Fri, 11 Jan 2019 16:53:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-01-11 at 16:49 +0000, Mike Crowe wrote:
> Until now, glibc was responsible for creating an AArch64 dynamic
> loader symlink if required for ABI compatibility.
> 
> Unfortunately, using multilib with AArch64 caused the rmdir in
> glibc-package.inc:do_poststash_install_cleanup to fail because that
> task did not expect to find the dynamic loader symlink in /lib.
> 
> Also, although glibc-package.inc:do_install_append_aarch64 made use
> of ${nonarch_base_libdir} to create the dynamic loader symlink in a
> way that was compatible with usrmerge, it unfortunately explicitly
> added only /lib to libc_baselibs, so the symlink was not packaged
> correctly when using usrmerge.
> 
> Attempting to fix both of these problems within glibc-package.inc in
> various ways created a bit of a mess. It seemed much simpler to
> invent a new package for the symlink and have glibc RDEPEND on that
> package if required.
> 
> Richard Purdie suggested[1] that ${nonarch_base_libdir} should not be
> used in this way. I've switched to using ${root_prefix}/lib which
> continues to work both with and without usrmerge.
> 
> Unfortunately, it appears not to be possible to specify the name of
> the loader via a variable with an override, since the _aarch64
> override is applied even for _aarch64-be.

I wish there was a simpler way to do this. How ugly is the patch to fix
this without adding the new recipe? Adding new recipes which are arch
specific like this is a pain for world builds and I think this patch
will have problems with those :(.

Cheers,

Richard


