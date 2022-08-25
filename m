Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66CBC64990
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 07:34:07 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web12.21212.1661412838037496596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 00:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=first header.b=Q7jsRqFv;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from [192.168.64.75] (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id 02D88E6236;
	Thu, 25 Aug 2022 07:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1661412834; bh=f4NA5RRPWtWN9oQfuJ2xQOkyJdYa81yiZmyFqTf6pwU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Q7jsRqFv8Uelzc+HweG16w2z7yS3wXgrIDoz6C9W29Q7gRe0YD4yIPpIQL98w3KNA
	 nmXAq22p+6ll3KkccmsFS8PyGPf5ymVhLOJBDVVOZ7UZaP6feju8sEPUgM7S771QJc
	 mIkC0nUTJa4V2wv5L9qsXAbvn2h9toecXx5vdgAMWHJ+ZSyXhh3VE91BCMBoi4vXgf
	 I/47pfv7c0b7mdc7CQF/KIDhw2/7glOmJ9z5aDY6JaII65vJwDXOke7/Xx5uYmwi7g
	 OoKVrHHpyMzSFzQBMBJZlFSjCqLe6nm/+vlSUVXZLZtR7XEWzvrlSI5/pE1iu0Dkse
	 zhur3c2d6zsOw==
Message-ID: <c1c09bd5-48aa-c371-fb67-2907041da36a@geanix.com>
Date: Thu, 25 Aug 2022 09:33:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [OE-core] [PATCH v2 1/2] zlib: split SRC_URI into inc file
Content-Language: en-US
From: Sean Nyekjaer <sean@geanix.com>
To: Ross Burton <Ross.Burton@arm.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, "denis@denix.org"
 <denis@denix.org>, Khem Raj <raj.khem@gmail.com>
References: <20220715115515.4012984-1-sean@geanix.com>
 <FAA024DD-6837-47D2-A00C-A37B146CA2D9@arm.com>
 <20220808102009.ktrplj7e4eif2k7c@Seans-MBP.hinnerup>
In-Reply-To: <20220808102009.ktrplj7e4eif2k7c@Seans-MBP.hinnerup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 07:34:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169836



On 08/08/2022 12.20, Sean Nyekjaer wrote:
> On Mon, Jul 18, 2022 at 04:12:25PM +0000, Ross Burton wrote:
>> This still seems overkill.  You can build minizip from inside the zlib recipe by fixing the minizip Makefile (fix posted to https://github.com/madler/zlib/pull/681) and then adding one line to do_compile:
>>
>>      oe_runmake -C contrib/minizip CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
>>
>> A corresponding manual do_install too, obviously.
>>
>> Ross
>>
> 
> Hi Ross,
> 
> Thanks for the patch :)
> 
> However this will create a minizip that is statically linked with zlib :(
> 
> Guess we need to add some more to the Makefile (or just use the
> autotools generated one)
> 
> Something along this:
> 
> diff --git a/contrib/minizip/Makefile b/contrib/minizip/Makefile
> index 4a0465f..cf9e79a 100644
> --- a/contrib/minizip/Makefile
> +++ b/contrib/minizip/Makefile
> @@ -1,13 +1,26 @@
>   CPPFLAGS = -I../..
>   
> -UNZ_OBJS = miniunz.o unzip.o ioapi.o ../../libz.a
> -ZIP_OBJS = minizip.o zip.o   ioapi.o ../../libz.a
> +libminizip_so_SOURCES = \
> +	ioapi.c \
> +	mztools.c \
> +	unzip.c \
> +	zip.c
>   
> -all: miniunz minizip
> +miniunzip_SOURCES = miniunz.c
> +miniunzip_LDADD = libminizip.so
> +minizip_SOURCES = minizip.c
> +minizip_LDADD = libminizip.so -lz
>   
> -miniunz:  $(UNZ_OBJS)
> +all: libminizip.so miniunz minizip
>   
> -minizip:  $(ZIP_OBJS)
> +libminizip.so:
> +	$(CC) -fPIC -shared $(libminizip_so_SOURCES) -o libminizip.so
> +
> +miniunz: libminizip.so
> +	$(CC) $(miniunzip_SOURCES) $(miniounzip_LDADD) -o miniunz
> +
> +minizip: libminizip.so
> +	$(CC) $(minizip_SOURCES) $(minizip_LDADD) -o minizip
>   
>   test:	miniunz minizip
>   	@rm -f test.*
> 
> Or?
> 
Hi Ross, Richard

Back from vacation? :)

/Sean

