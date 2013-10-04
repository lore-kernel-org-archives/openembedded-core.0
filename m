Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 689CC61963
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 20:24:19 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id x12so3142479qcv.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Oct 2013 13:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=m09bM3cw38TdNbhJKQmXckCIERockAw110BnTACq2vU=;
	b=Y4puCpWnfkfAZ0U1g4BmcCKStuMaD6Q8gQVg6+JbvrJErPn1UNvpyDYxfRu68H9L1o
	RWfDC1YYjLReWxYmzaGWiK5vBi+DevdT6sM/Ej1eJi6QWwQq+CDCav7mGJUhDNIQz9SI
	myaAIsnM2bbnLY+8fo1rMRmo9vdlgf7xVEHnU1DU9RARRdjbueBUSjnAG+SLg9P1Qnue
	EqJD/YV7AQBvmLL1EB9eor6niRpLk7NRPuUHEu3pUmphctB3IGpYHRkPSFT2cmtWFYyb
	TBHhQ2HK6+6YuVJPieOvjN98vsbtajTiM1r2MoUnUIF/VXx7Qp/tAT+0tzFAnUJ3U9pO
	azNg==
X-Received: by 10.224.80.194 with SMTP id u2mr5885557qak.121.1380918261073;
	Fri, 04 Oct 2013 13:24:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.10.201 with HTTP; Fri, 4 Oct 2013 13:23:51 -0700 (PDT)
In-Reply-To: <524EB7C8.4010402@windriver.com>
References: <cover.1380844647.git.bruce.ashfield@windriver.com>
	<d8f31589fe2bf6f63ef55fca4c6f5182971e1441.1380844647.git.bruce.ashfield@windriver.com>
	<1380872773.18603.570.camel@ted> <524EB7C8.4010402@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 Oct 2013 13:23:51 -0700
Message-ID: <CAMKF1soxf5hym6f5RqeTcWXWjvgPa81jKEqcUzhD35Vdz88KTQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel: restore scripts in the sysroot
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
X-List-Received-Date: Fri, 04 Oct 2013 20:24:19 -0000
Content-Type: text/plain; charset=UTF-8

Bruce

Besides the sstate problem RP mentioned your patch worked fine.

On Fri, Oct 4, 2013 at 5:42 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 13-10-04 03:46 AM, Richard Purdie wrote:
>>
>> On Thu, 2013-10-03 at 20:02 -0400, Bruce Ashfield wrote:
>>>
>>> When building against the sysroot, out of tree modules can require
>>> modpost
>>> and other utilities normally found in the kernel's scripts directory. For
>>> the kernel source in the staging dir, these scripts have been removed to
>>> avoid mixing archiectures when packaging kernel-dev (among other things).
>>
>>
>> Its also to avoid mixing architectures when packaging the sstate for
>> do_populate_sysroot. The sstate for that task is now native arch
>> specific after this patch but its task hash is not. Even if we made it
>> native specific, that means the kernel would rebuild entirely if you
>> switch 32 bit to 64 bit native machine. We therefore cannot merge this
>> patch as is.
>
>
> Aha! I knew there was a lurking element I wouldn't know about. I nearly
> put "RFC" in the patch .. and clearly should have :)
>
>
>>
>> Instead do something like:
>>
>>
>> SSTATEPOSTINSTFUNCS += "kernelheaders_sstate_postinst"
>>
>> kernelheaders_sstate_postinst () {
>>         if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o
>> "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
>>         then
>>                 ( cd ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH};
>>                   oe_runmake scripts
>>                 )
>>         fi
>> }
>>
>> This will rerun the oe_runmake scripts each time the sstate package is
>> installed. It slows down the use of sstate but should be correct whether
>> the build machine is 32 or 64 bit.
>
>
> I'll try what you have above and re-spin the patch.
>
> Cheers,
>
> Bruce
>
>>
>>
>> Cheers,
>>
>> Richard
>>
>>
>

