Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2033F7E075
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 21:16:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 457BXj4Xsqz63;
	Mon, 20 May 2019 23:16:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558386998;
	bh=gWqs+FVU+ZPccApWaqjL/lXb1eyAdskWFHaVMHdq6yU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxu3VvGnZVshB7TBcp6rR+uaf2CcUvM7V+3U4hsVeHljr3KXC/UWbMdGj+ANHDNcL
	eEgRLDPAXxmWRTuGzrM+j8jYPBAiSsvVW2Bm0xscNKx20XKLYxRK72Dwyh6O9aJDir
	6IMeqs7hLx7O4sZ5+ezGlbUNMnfxQWe4t+Oj7xniUzuftKGS+dPTurQU72F7i0b2No
	6EF7c9/rlYPaS5RUQ/iAJfKFlBljVk6J6IYPQmr5LUuxOa1Pl8JWEi4tv6A7FrvGCd
	jH5Wbahd8DMPXS6JsBUPT4M7qcisQAyxNdxsH6SHdCKgFrdX0piDT+7GmJrqewqsbk
	Nn2Qxwi3Hye2/UebTc+v+HFOpRBUWiF8ExswBorXvFFqN2BCSOhhdVC2T0FaU1WlRk
	5DA3o2sRyECc+/3/RpOjDSjXfLi9tfEFCe6+UaT2z1qmXcJwTIHxV8Fa//cgv+tenX
	DUgqkX+7WmHWhSzFNN1qdSuK5HGLlKZ6scNrr8rJPUN5BqRZ5vqZWvU7tq5NFvs+1I
	JThg7Iic3jp2m/SaOrptLRlIy19YOTMFp0U6nIhDcH4AdC2EksTi6O+BgdO7F7kCWy
	fM4FWTQWWpLzx4S54uPHOBjhkzwnzqhXBVxgknKVsVDvMY34PB0XUECWPsfyWdsolr
	S2x1j3UDt0W9jpM6kyJNECvA=
Date: Tue, 21 May 2019 00:16:35 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190520211635.GA22230@localhost>
References: <20190516074834.3014-1-bunk@stusta.de>
	<8e01a707-fda6-ba0e-5731-4fdc337b09b3@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8e01a707-fda6-ba0e-5731-4fdc337b09b3@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] musl: Add TEMP_FAILURE_RETRY from glibc
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
X-List-Received-Date: Mon, 20 May 2019 21:16:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, May 20, 2019 at 01:19:38PM -0700, Khem Raj wrote:
> 
> 
> On 5/16/19 12:48 AM, Adrian Bunk wrote:
> > Patch it into musl instead of patching all users
> > (currently elfutils and next ofono).
> 
> this violates musl philosophy, and I would like to stay as close as we can,
> so I would suggest that you propose this patch to upstream musl first and
> get an opinion, if it gets accepted, we can change OE

"musl philosophy" is that musl does include the GNU extensions Rich Felker 
likes, and does not include the GNU extensions Rich Felker dislikes.[1]

TEMP_FAILURE_RETRY is in the latter category.

For TEMP_FAILURE_RETRY it's either patching musl once or patching random 
packages all the time, and the patch is not invasive.

> Richard,
> 
> Please revert this patch, I know its now in master, but we should wait until
> upstream agrees to apply this, we are trying to extend C library which would
> fall on us eventually forever if upstream does not accept it.

What is actually the strategy for handling musl changes that will have 
to be shipped in OE forever?

Especially systemd/musl is a combination that will bring an ever-growing 
amount of changes that cannot be upstreamed on either side.

And some of the OE patches to systemd make things compile but are of the
"I wonder if I can get a CVE for that" kind.

The alternative would be to mark systemd as incompatible with musl,
which might be the sustainable thing to do.

cu
Adrian

[1] There seem to be sound technical reasons behind what he likes,
    but this doesn't help when a distribution wants to get existing
    software building with musl.

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


