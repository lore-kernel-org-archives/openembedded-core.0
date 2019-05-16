Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D13FA6B07E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 08:23:22 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id c66so6453754wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 01:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=p7+3GQE8uwpLE3H31ucAhsmZdQNhWqXDN2Q4K+/GDPs=;
	b=OAGfw0TcOElRBBf1xroIH+KZXrywTuoHjwsJPy54RHTED1NcWaosSwPC+LUkbb36/O
	R2Z2o1UsddauIq3aBLYeX/mKKIFOMT+nlGfmDJ8kqpmv+jLW2cG2JIIxO++3FT+OFI9k
	aciBYrdtH/tt1l0WyNY98nHPqCnchJhE3j1fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=p7+3GQE8uwpLE3H31ucAhsmZdQNhWqXDN2Q4K+/GDPs=;
	b=QgyG00MYSrACBdsKo+qDQB6DxOAzjVk6N6L4xIgUkEBmGCz2/4SIlDd9eyxhN4UOq8
	3/vV9LbGtoxEquUSRrfk3vXgrlU97P1OOzDi0unN2uHKCIi4lfGpPEx65q/HV7Rs8PSo
	EHiZDRDi/cQnsAt91MSuxxeCQgeE8G5OdldkEd0nnky9JWPbspq6noLnR816OPpI/Awk
	GNlITXHXrncquBozdQkhnvmLacv9B4odmy1rMHoG6gPDfR1qphoBbP7zA+cBlDfS/d25
	PP9ZMdcAnuZM4oNh7vHQ6Ii4nF5NASsKQyaMjS9GA5MkP6YK7XJ5m2mJY0I9auD982WX
	B8MQ==
X-Gm-Message-State: APjAAAWWfr5gAm7D7Hwgge2KPenT98CbaPp263qw9Y1mLuF8y7LZ3XAj
	30gmyP0NQqjfK9Y5/CGwffXpsQ==
X-Google-Smtp-Source: APXvYqzk1Au3aH8dRAiha94z+cNXFYSeWA1f+LvK9mgucKlwP36okH0po9FkpTIfCwpJrUZOdOiL6g==
X-Received: by 2002:a1c:6a0e:: with SMTP id f14mr1952980wmc.69.1557995003596; 
	Thu, 16 May 2019 01:23:23 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id f2sm5144449wme.12.2019.05.16.01.23.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 May 2019 01:23:22 -0700 (PDT)
Message-ID: <9c2a9bbda97c6540061fd7a945f9d3eba0f1453c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 09:23:21 +0100
In-Reply-To: <1557948156-10879-1-git-send-email-liu.ming50@gmail.com>
References: <1557948156-10879-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: stefan.agner@toradex.com, luka.pivk@toradex.com
Subject: Re: [PATCH] meta: handle UBOOT_CONFIG in image.bbclass
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
X-List-Received-Date: Thu, 16 May 2019 08:23:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-15 at 21:22 +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> The code dealing with IMAGE_FSTYPES in uboot-config.bbclass would not
> take any effect since it's in a uboot particular class, but it's not
> being inherited by any image recipes.
> 
> Move the IMAGE_FSTYPES handling part to image.bbclass would make it
> really work.
> 
> Also drop some trivial debug code.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/image.bbclass        | 12 ++++++++++++
>  meta/classes/uboot-config.bbclass | 17 ++++-------------
>  meta/conf/documentation.conf      |  2 +-
>  3 files changed, 17 insertions(+), 14 deletions(-)

This doesn't make sense, if we want to set IMAGE_FSTYPES, lets just set
that.

I'd imagine the code is designed so you'd inherit uboot-config in the
machine and this therefore could be made to work as is.

Moving the code to image.bbclass is the wrong thing to do though and
I'd question whether we want UBOOT_CONFIG doing this at all...

Cheers,

Richard


