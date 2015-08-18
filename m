Return-Path: <dbaryshkov@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 60A2060043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 15:05:13 +0000 (UTC)
Received: by iodv127 with SMTP id v127so176647336iod.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xN3tCFsHwMU3cH8RdHnrGebbVvdO7+Dm/zRWw1QYzbw=;
	b=rq8Ixvor1n9f8AjYm2reysHu9uyqH4Q+/mkZj6hGjegmv1UkiOH7oelEFs5HfsAq66
	ujVPMHNi8Q3e+SVFut9jGzKwFQnyQSdnhA2mI54QhNmRFWsFAqJueGwHvI4TTJ1mVLNP
	xQDuxT6lmZmLCDOs65EgfmzKA3PWciCZOPbJyYqLrRAFfnFvLx611kSCf1xFNWtd+Icl
	WxwGx3WvQaOWOczb5AwPFG3NXo5hEacXitA8JVEo/94uDzyC70L6FTrNlbXbtM1v4RHI
	/KwNngk0Hz+qqOWMO7dURdy4NnfKBLO1mdUgGSucfNu2h1KKB/UoTvT/MOHe+PKGQT4p
	Nh/A==
MIME-Version: 1.0
X-Received: by 10.107.150.145 with SMTP id y139mr7084964iod.128.1439910313871; 
	Tue, 18 Aug 2015 08:05:13 -0700 (PDT)
Received: by 10.64.38.229 with HTTP; Tue, 18 Aug 2015 08:05:13 -0700 (PDT)
In-Reply-To: <CALT56yN=2EJosZX+RKF-3YfJsQxgRSVUWRA-+UAWv9woHSojsw@mail.gmail.com>
References: <1435759342-5312-1-git-send-email-dbaryshkov@gmail.com>
	<1435759342-5312-5-git-send-email-dbaryshkov@gmail.com>
	<B8E44407-53A5-4332-8124-3DC507180D8E@gmail.com>
	<CALT56yOdHWxUkEpvMfi6u22mUX16HjvOLFOM+QEsgYyBqYOiRw@mail.gmail.com>
	<CAMKF1sqN_moGReYFdyLEWm+C1EGBXfLs5vTvT9KDH36EV2M+sQ@mail.gmail.com>
	<CALT56yN=2EJosZX+RKF-3YfJsQxgRSVUWRA-+UAWv9woHSojsw@mail.gmail.com>
Date: Tue, 18 Aug 2015 18:05:13 +0300
Message-ID: <CALT56yO_KcWOJQrGY+NeOiozza3za6Wd5PDaqThjdCufLNAV_g@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] glibc: don't override TUNE_CCARGS for MIPS
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
X-List-Received-Date: Tue, 18 Aug 2015 15:05:14 -0000
Content-Type: text/plain; charset=UTF-8

2015-08-17 18:30 GMT+03:00 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>:
> 2015-08-16 3:29 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>> On Sat, Aug 15, 2015 at 4:15 PM, Dmitry Eremin-Solenikov
>> <dbaryshkov@gmail.com> wrote:
>>> 2015-08-15 22:34 GMT+03:00 Khem Raj <raj.khem@gmail.com>:
>>>>
>>>>> On Jul 1, 2015, at 7:02 AM, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com> wrote:
>>>>>
>>>>> Overriding TUNE_CCARGS this way breaks MULTILIB setup for MIPS. This
>>>>> override disables multilib handling of tunes for TUNE_CCARGS, thus
>>>>> enforcing glibc's TUNE_CCARGS to the TUNE_CCARGS of main DEFAULTTUNE.
>>>>>
>>>>> Glibc perfectly build without this override for both simple and multilib
>>>>> cases.
>>>>>
>>>>
>>>> this patch has been applied however we should reopen it.
>>>> This has to be fixed differently. its not a build time issue but a runtime one. So find
>>>> alternative way of passing these options to glibc build to accommodate your changes.
>>>
>>> What is the issue that you  are facing with the current OE-Core?
>>>
>>
>> systemd remount segfaults in glibc. The problems will be more where it
>> will use wrong syscall headers.
>
> Hmm. N32 and N64 packages seem to work for me. O32 programs segfault
> with illegal
> instruction. I'll take a look.

It looks like something is broken wrt. MIPS64 kernel or QEMU. Because N64 kernel
causes segfaults with plain O32 rootfs. O32 kernel + O32 rootfs work w/o
any issues on emulated mips32. Emulated MIPS64 boots  32-bit kernel just fine,
but then the rootfs segfaults (?).

-- 
With best wishes
Dmitry

