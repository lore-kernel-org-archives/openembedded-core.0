Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SpbHG-00074G-Uy
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 10:31:07 +0200
Received: by ghbz2 with SMTP id z2so3072162ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=oa/PstzowJvllIfDkLOtCCV+q66eyE+PoDWZaH4dRrY=;
	b=iZGYpQyn+niqeaKRbMzJdbW2MVdHlliZX4cYjW2zEYaHFaLg/IgIJjwBUs0qFLK87O
	1DrT8TlrzDObXF6uWIoPDyciZEuporyZ5uuZxu7J7Qool36WRnfJuYNoY9Ev3IqFyhgj
	CaESGyT5DIIZ9bAQp7z0vf1lkIoC+GArp2DOJ36lXgI0f/WwlbIpVEIt208GBuCPdsAX
	2JARlGbH3c9Hqip22BEjDuimkHQATAWcJS6g0CnMEEMtoeMCwKZbv1bvMDsFQd4DcxVy
	uCfNezvCpexrrY2AoJtmIZ1Ptym6Bz3SqaMBNKEDE1DzgIZHRXPV30SsOgM2T/A6oNTJ
	oTaw==
MIME-Version: 1.0
Received: by 10.50.216.167 with SMTP id or7mr140966igc.32.1342167592130; Fri,
	13 Jul 2012 01:19:52 -0700 (PDT)
Received: by 10.64.35.109 with HTTP; Fri, 13 Jul 2012 01:19:52 -0700 (PDT)
In-Reply-To: <54ABEC81-9673-446D-AD9A-79394DEEA6E8@dominion.thruhere.net>
References: <cover.1342116650.git.andrei@gherzan.ro>
	<8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
	<4FFF23E2.5040007@linux.intel.com>
	<54ABEC81-9673-446D-AD9A-79394DEEA6E8@dominion.thruhere.net>
Date: Fri, 13 Jul 2012 10:19:52 +0200
Message-ID: <CAAQYJAv0Zigzx2JrqOhd9_jNN8gFryw4ikhqsRK0e74Fim6=wA@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Jul 2012 08:31:07 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 13, 2012 at 8:45 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 12 jul. 2012, om 21:22 heeft Saul Wold het volgende geschreven:
>
>> On 07/12/2012 11:58 AM, Koen Kooi wrote:
>>> Any volunteers to test this on a system with >4 real cores?
>>>
>>
>> Koen,
>>
>> Does OE-Core or Poky have an image setup for using .xz by default?
>
> No, and as you can see from Andrei's patches, it would have never worked =
:)
>
> regards,
>
> Koen
>

This leads to a similar remark for lzma:

The xz/lzma have been added with commit  38334ac and at that time both
where using XZ_COMPRESSION_LEVEL.

The code has been refactored afterwards and what happened is that lzma
now defaults to compression 7 (the default) while xz is way too high
(default is 6).

There is a well hidden pitfall with that, being that any image,
including the initramfs, will use that compression factor.

As you can notice in that (old) man xz [2]  the memory requirements
are very high and what did happen to me was that the cpio.lzma could
not be decompressed thus kernel could not boot (we override now the
value setting "-e2" in our BSP).

Adding more threads will multiply that figures.

My 2 cents

Andrea

[1] http://cgit.openembedded.org/openembedded-core/log/meta/classes/image_t=
ypes.bbclass
[2] http://www.linuxcertif.com/man/1/xz

>>
>> I will run it on a machine I have, just want to make sure I am doing the=
 same tests that Andrei is running.
>>
>> I was about to ask what msm asked about the Memory info.
>>
>>
>> Sau!
>>
>>> Op 12 jul. 2012, om 20:13 heeft Andrei Gherzan het volgende geschreven:
>>>
>>>> Koen suggested to add -T to xz commands. We have this option implement=
ed in our current version .1alpha.
>>>>
>>>> -T threads, --threads=3Dthreads
>>>>              Specify the number of worker threads to use.  Setting thr=
eads to
>>>>              a special value 0 makes xz use as many threads as there a=
re  CPU
>>>>              cores  on  the system.  The actual number of threads can =
be less
>>>>              than threads if the input file is not big enough  for  th=
reading
>>>>              with  the  given  settings or if using more threads would=
 exceed
>>>>              the memory usage limit.
>>>>
>>>> -------------------
>>>>
>>>> Memory: 7.8 GiB
>>>> Processor:: Intel=AE Core=99 i5-2540M CPU @ 2.60GHz =D7 4
>>>>
>>>> File to compress: 1.9G
>>>>
>>>> xz -f -k -e -9 --check=3Dcrc32 (current configuration)
>>>> Memory: 673Mb
>>>> real    6m37.170s
>>>> user    6m35.389s
>>>> sys     0m0.884s
>>>> Compressed file size: 3.4Mb
>>>>
>>>> xz -f -k -e -9 -T 4 --check=3Dcrc32
>>>> Memory: Cannot allocate memory
>>>>
>>>> xz -f -k -e -8 -T 4 --check=3Dcrc32
>>>> Memory: 1.8G
>>>> real    3m24.462s
>>>> user    12m8.502s
>>>> sys     0m2.180s
>>>> Compressed file size: 3.4Mb
>>>>
>>>> xz -f -k -T 4 --check=3Dcrc32 (-e defaults to -6)
>>>> Memory: 471Mb
>>>> real    1m9.265s
>>>> user    4m8.972s
>>>> sys     0m0.944s
>>>> Compressed file size: 3.4Mb
>>>>
>>>> So my conclusion would be to use the default -e -6 with -T 0.
>>>>
>>>> The following changes since commit 90ad663909c0c8a405b22a510c9f957007d=
02669:
>>>>
>>>>  upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>>>>
>>>> are available in the git repository at:
>>>>
>>>>  git://git.yoctoproject.org/poky-contrib ag/xz
>>>>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dag/xz
>>>>
>>>> Andrei Gherzan (3):
>>>>  image_types.bbclass: Fix COMPRESS_CMD for xz to redirect compressed
>>>>    data to file
>>>>  image_types.bbclass: Add XZ variable to set number of threads to be
>>>>    used while compressing
>>>>  image_types.bbclass: Default XZ_COMPRESSION_LEVEL to -e -6
>>>>
>>>> meta/classes/image_types.bbclass |    5 +++--
>>>> 1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> --
>>>> 1.7.9.5
>>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


