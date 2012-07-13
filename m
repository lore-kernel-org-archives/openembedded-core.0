Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SpclC-0003QL-OS
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 12:06:06 +0200
Received: by yenl13 with SMTP id l13so3115689yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4JNCvgC3/H+PSPrOaxbNHwCbDX9KS7d76itYrU0t2Mg=;
	b=qU1qpGF5KesAzYBjdD/GiGhvajSk0/AZhpvAp0k0a1tZ1RKwnF1bJef5rQgn6j+bDr
	WkXsLEyEb9i2d6PAnWRuDKYGB0EeSweJwidLzyT5Rw5IxdelHAQx6OyV0LjO4p4TF0KF
	b5OmWNCTnJq50pNbAZMcORe0PfcmDpvehUlFsJlAshnfXTH3h7n8Q3MlT1W727APcQP1
	D1mi71NmsmhxANLw2hQh4TqnrPH2v+098K597da7kGB4scb/ufowUQ/ivgnu1p0+fYRl
	rDh9AShLjMdZUGXGqDqUERaOPiplDMT3+cd/5u2DzrEw36CEs5ss/10YmI6Ph2SMuQW0
	nHuA==
MIME-Version: 1.0
Received: by 10.50.158.130 with SMTP id wu2mr743048igb.32.1342173291815; Fri,
	13 Jul 2012 02:54:51 -0700 (PDT)
Received: by 10.64.35.109 with HTTP; Fri, 13 Jul 2012 02:54:51 -0700 (PDT)
In-Reply-To: <CAK18fxErPLi5685HPfL8HtvF7fziHHBc0cc+=MKWnec4Lurgug@mail.gmail.com>
References: <cover.1342116650.git.andrei@gherzan.ro>
	<8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
	<4FFF23E2.5040007@linux.intel.com>
	<54ABEC81-9673-446D-AD9A-79394DEEA6E8@dominion.thruhere.net>
	<CAAQYJAv0Zigzx2JrqOhd9_jNN8gFryw4ikhqsRK0e74Fim6=wA@mail.gmail.com>
	<CAK18fxErPLi5685HPfL8HtvF7fziHHBc0cc+=MKWnec4Lurgug@mail.gmail.com>
Date: Fri, 13 Jul 2012 11:54:51 +0200
Message-ID: <CAAQYJAsNv_R_GXrXY2OjU8Y-ft52V9Wzp6Y24sZX=d-hn=Zcig@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 10:06:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 13, 2012 at 11:44 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> On Fri, Jul 13, 2012 at 11:19 AM, Andrea Adami <andrea.adami@gmail.com>
> wrote:
>>
>> On Fri, Jul 13, 2012 at 8:45 AM, Koen Kooi <koen@dominion.thruhere.net>
>> wrote:
>> >
>> > Op 12 jul. 2012, om 21:22 heeft Saul Wold het volgende geschreven:
>> >
>> >> On 07/12/2012 11:58 AM, Koen Kooi wrote:
>> >>> Any volunteers to test this on a system with >4 real cores?
>> >>>
>> >>
>> >> Koen,
>> >>
>> >> Does OE-Core or Poky have an image setup for using .xz by default?
>> >
>> > No, and as you can see from Andrei's patches, it would have never worked
>> > :)
>> >
>> > regards,
>> >
>> > Koen
>> >
>>
>> This leads to a similar remark for lzma:
>>
>> The xz/lzma have been added with commit  38334ac and at that time both
>> where using XZ_COMPRESSION_LEVEL.
>>
>> The code has been refactored afterwards and what happened is that lzma
>> now defaults to compression 7 (the default) while xz is way too high
>> (default is 6).
>>
>
> Nope. It's default value is -9.
>

Well, in oe-core maybe.
Upstream they are more conservative, see that man.

"The default preset level in LZMA Utils is -7 while in XZ Utils it is
-6, so both use 8 MiB dictionary by default."

Cheers

Andrea

>>
>> There is a well hidden pitfall with that, being that any image,
>> including the initramfs, will use that compression factor.
>>
>> As you can notice in that (old) man xz [2]  the memory requirements
>
>
> What old version?
>
>>
>> are very high and what did happen to me was that the cpio.lzma could
>> not be decompressed thus kernel could not boot (we override now the
>> value setting "-e2" in our BSP).
>>
>
> Without threads, memory demand was around 700mb. So it should be ok for most
> of machines.
>
>> Adding more threads will multiply that figures.
>>
>
> Indeed. With 8GB memory at my disposal i couldn't compress an image with -e
> -9 and -T 0 (-T 4)/
>
> @g
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


