Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C9A5A7E323
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 15:31:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 458tkf5S6jz63;
	Thu, 23 May 2019 17:31:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558625467;
	bh=39D3ean6hMTCDrNs3EceuoGQ5AGGntIZUsWvA8RQzMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+YHKLtX6c8aWDtBZ4E3kW139TlCcbu/PoxoTf/XxAXv/OOOZPYDfjYc6BJc2UtVZ
	r3BiMu5gtRKm61z38/v4AYiLTNhbK+CCj2Zc/j9Jt3YkteyC+oQTofW3uzEFfIB0Vf
	gcELw1fwWuMGcFL1i5XKxQzYatHnWg8Z6lU4IXc9b7RgUUyqz00emDzQE4NE7zHBEs
	57dBsUw0cv68MnopRRqJ4W4OEVYWbMcbJrBdTW9BpLXCKl0wsKsAX/6xmW+KQkuAEQ
	npL0xZ/Ca5lMULIyU9J/TM/vocom6dSDpWNh1dVBgYny93j4ZwgOocI8WY2KSyAJXd
	GKRvZqcQQd9Fz/yFuN4xZ4ebiTdbMc048wmsp13VhTzlouJhheBzLl/iYM2PRjqHzs
	OZaq2rKodsScw+IyrpNxQX0oyYTgpj4MMJ0rxalGA2zKXibGX5eJqCbNK/mLiE1p3/
	6gz/oiQ/xpCzGPof6FIIutpgeohxVBoFdqNP505eBI4Gzv9pvDE7KG29hquWK9tuvr
	V45INBrctn9mdH1I8UOOdBFRE90IvRamuDgXo0Oa2862ypjAJL0dbaGeN6wD0T+NHA
	Vahvo5LQOYrfa3hsYXItE8OvUAkwHtyPqmJ+5oyWIN4uS/3ywIRpgvrMXT6ChwUGz0
	EYDFtYXVDaazSvSl+QQoDVts=
Date: Thu, 23 May 2019 18:31:04 +0300
From: Adrian Bunk <bunk@stusta.de>
To: =?utf-8?B?QW5kcsOp?= Draszik <git@andred.net>
Message-ID: <20190523153104.GA3348@localhost>
References: <20190523074703.17145-1-nick83ola@gmail.com>
	<7193bf9fbc6d557744214a3dc82ded086f441f0d.camel@andred.net>
	<CABPh3UNdOXZraHAurMyH+x3YSJbnQJif6Ff_oHTU2W+8t=0hDg@mail.gmail.com>
	<33eea54007fc51700266a93daf84496a5fd405fb.camel@andred.net>
MIME-Version: 1.0
In-Reply-To: <33eea54007fc51700266a93daf84496a5fd405fb.camel@andred.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: fix segfault with musl >2.21
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
X-List-Received-Date: Thu, 23 May 2019 15:31:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 23, 2019 at 02:56:11PM +0100, André Draszik wrote:
>...
> Also, in connman's gweb.c 'addr' is initialised to NULL. Again,
> NULL isn't anything 'returned by getaddrinfo()', so even in glibc
> it only works by pure luck.
>...

Not pure luck, free(NULL) is valid but passing random garbage to 
freeaddrinfo() would always fail.[1]

The critical point is that freeaddrinfo(NULL) working with a C library
is only an implementation detail of this specific version of the library,
not something a C library has to support according to POSIX.

> Cheers,
> Andre'

cu
Adrian

[1] unless the garbage happens to be NULL

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


