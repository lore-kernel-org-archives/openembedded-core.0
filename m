Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB0E78282
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 16:33:17 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u191so2880830pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 09:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tg3geIDbBBMJk0+j+cb7glXJWz7abmQX03UvH+jg/L0=;
	b=kOhFbGHBQJNNNeRLmd7Nwyde03GvjCjxyreq6Xnt/5zSTRDRUMKc9qdiUohM+ft+EG
	LK7Jzn2HwX3CyZk3AY3WpmtbsQgVOe2wE4OgsTHCddRM/xGQUV0EjXyE4MP1BQzofar/
	SqqokiAGRWDUY44rCyGgya0/fD/wv2ID+d8S+MO3F9rJdDavx9n3jP9EU1n3nLAj091q
	tgMFdRsPRY1FQXsIGWjtdiS7Xc4nM6QpbG7/pd5KHNp9DX6xm+6A6IfNc0uTv/+Y4puV
	n0sYMA+PAA7YUkoKWHN+vSN0jJpSi6krd4O9yXI2neyaKeO8RTGbFNI+vMFkBNlOMZ44
	vVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tg3geIDbBBMJk0+j+cb7glXJWz7abmQX03UvH+jg/L0=;
	b=lFYq+DLga6Uxq8ooFtvhcH18QgNHxrMtcODopPYQHqrZ+A49fMWRf7zdu9Fi2eTAXs
	xzr4+EydM37RqYlwax6KqruMzyyy5l2GW8SIYrM+YKVjD1iGnMbf8lYZfjcjv15VqrZQ
	+GHZ1aY+XU3OM/MwIm8Ja6NMtUB2gfkYBmtLXOiFv1JZUmdyaxFZeEieTY9HhjVkEXs1
	TPFNXFz+yh39lFmdTQ1RBd5GV6BIu8DKdM6yDFwOkjZReIJsH6J4ezoxaZ2iusChlGMz
	YvlAzLzDee8pZzvP8Bd3/cROAGksY64FMVhO6dMbEmSvODOmFYSHAu4+rWu0KiEckwDm
	Ey7Q==
X-Gm-Message-State: AHYfb5iZ7B1VildW10qwVVIimJcjl8cH/ca51GkY2WanphC8wcm/jJSW
	ls5dQ6m5zea05ODiTJPhnZhJrCQ0dA==
X-Received: by 10.98.15.209 with SMTP id 78mr1309846pfp.136.1503419598678;
	Tue, 22 Aug 2017 09:33:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.167.2 with HTTP; Tue, 22 Aug 2017 09:32:48 -0700 (PDT)
In-Reply-To: <1503397329.32591.79.camel@linuxfoundation.org>
References: <20170821205721.20086-1-Martin.Jansa@gmail.com>
	<20170821205721.20086-2-Martin.Jansa@gmail.com>
	<1503397329.32591.79.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Aug 2017 09:32:48 -0700
Message-ID: <CAMKF1sqp=9QZqWKhKP4Go51jny13eY7P4TZ2cRRB9jzOUzWC0g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] grub2: fix build with gcc-7
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
X-List-Received-Date: Tue, 22 Aug 2017 16:33:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 3:22 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2017-08-21 at 22:57 +0200, Martin Jansa wrote:
>> * build with gcc-7 fails with:
>>   | ./config-util.h:1504:48: error: this use of "defined" may not
>> be   portable [-Werror=expansion-to-defined]
>>   |              || (defined _FORTIFY_SOURCE && 0 < _FORTIFY_SOURCE \
>>   |                                                 ^~~~~~~~~~~~~~~
>>   and we're not building on Apple or BSD, so we should be able
>>   to just ignoreit until it's resolved properly in some newer gnulib
>>   and imported from gnulib to grub-2
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/recipes-bsp/grub/grub-efi_2.02.bb | 6 ++++++
>>  1 file changed, 6 insertions(+)
>
> Sadly this appears to break grub-efi everywhere on the autobuilder,
> e.g.:
>
> https://autobuilder.yocto.io/builders/nightly-no-x11/builds/428/steps/BuildImages/logs/stdio
>
> I took a risk and tried to get this into M3 buts its not paid off and
> we'll need another rebuild :(.
>

It did not occur to me that this option is introduced in gcc7+ which means
it will not work on hosts using old gcc versions. Sorry

> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

