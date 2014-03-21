Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 22F876FA71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 19:41:56 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id cz12so3097455veb.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Mar 2014 12:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=dYzrLEXk+9LO0+1E2a+e6CjVETbmBH4mnw8J3Oa0jzg=;
	b=Ix8YgdPhiOLzOhEJi3cVjQi/CjTHJfjyBnyGn5jm+AtCDoDCKRusLniHMkNX8K1Dvu
	KxePBibeFl59he6e88MU5UpVDjdd+R1Lmy2NVdlfK9+td6hEWxpd6tncw5/SDR5Oj8+q
	FDCIFczlUTnwJ1FYY/2yfBpAKZtBQ7InO7sEmwLqUWo1bRcdMn2lcf/pdOdF6Kjr7dUF
	XhGfUEaa+0CWftbFwvvnKZL1SUslMQAXJpPbBtKi/OUKfPrW1CMt8jcF+kH7qt7j7Mm3
	Vsshy6eKGsf0qkyX7yGnHceibhSRSw5Xa/SZDmDf5qTH36u2SvvB0KpjSr6Dzu3OkNyk
	b6ew==
X-Received: by 10.52.253.75 with SMTP id zy11mr1956318vdc.10.1395430916837;
	Fri, 21 Mar 2014 12:41:56 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 21 Mar 2014 12:41:16 -0700 (PDT)
In-Reply-To: <CAMKF1sq7QUcKypgyn8auurnqRd5ZfztdymcxquRwsRxvN4seqw@mail.gmail.com>
References: <CANyK_8e6dfzu64SRLzZdXFE3obT6Td-8UUDqfcoSAqWTjoOq3g@mail.gmail.com>
	<CAMKF1sq7QUcKypgyn8auurnqRd5ZfztdymcxquRwsRxvN4seqw@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 21 Mar 2014 19:41:16 +0000
X-Google-Sender-Auth: BuCYD6Ad7lrkC4VFvqVeY3r-ZK0
Message-ID: <CANyK_8ecTyGxdha8E=cTX0KEYcVfezZZBGtGuQuYi3_GBEg8nw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded and musl-libc
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
X-List-Received-Date: Fri, 21 Mar 2014 19:42:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 21 March 2014 18:22, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Mar 21, 2014 at 5:34 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>> Hi all,
>>
>> musl-libc hit version 1.0.0 yesterday and is starting to look good to
>> me. It's basically a really small but very functional libc that would
>> suit embedded environments very well as an alternative to
>> eglibc/uclibc. I'm personally very interested in using it in my
>> projects and I also think it could fit in well with the aims of
>> poky-tiny.
>>
>> http://www.etalabs.net/compare_libcs.html gives some pretty useful info.
>>
>> I'm basically emailing to see if anyone else is interested in this or
>> if anyone has looked at using it before in OpenEmbedded as a google
>> for previous discussions didn't turn anything up.
>>
>> I'm currently very busy between various projects so I don't have time
>> to hack together a musl-libc recipe myself but I should have time to
>> help test it.
>
> it has been under my radar for a while. I have actually locally made
> toolchains with
> clang+musl and it seems to be coming along. its licensed differently thats
> the biggest attraction for folks who do static linking. Otherwise it still
> doesnt yet support variety of architectures that other libcs support. given
> now we have kconfig for eglibc too may be it fills in the nommu gap much
> like uclibc does today. I have some plans for 1.7 for adding it to OE
> may be in a layer
> of its own first and then migrate it to OE-core
>

Yea, that's the sort of approach I was expecting. Getting musl to
build is the easy bit, making it usable as the system libc for an
entire image is the difficult bit. I think at least initially we'd
need a few bbappends in a meta-musl layer to fix packages which don't
compile out-of-the-box with musl.

I don't think musl fills the nommu gap though - from the comparison
page I linked to it says musl doesn't support mmu-less
microcontrollers.

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

