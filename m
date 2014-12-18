Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 8FAA1728A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 18:41:07 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id z12so1466440lbi.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 10:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tuOAAg0LShx3thrkZtUxhf/5LDiro0J3a1unawHczAM=;
	b=EfIVvxgI103dX1fu8gwkAzMwb4UURa9at1y40jukgKY5jFYzaFH3Wu0zUKQrjsNKq/
	OI8kRn+C+CT1nhQ8QDGuwapPd8PBjVga7UlADghdsIxA67l7W8MInBd0YQOiSJM2/o0n
	HQazVid73hHCIvSm7koUYs662n8sntnpXa4eAqr1eWlbbe5AC6Lo7Uz4NQRVv5NtcF7D
	HY2czoY4sH8ztCuXyY570lve+NfLJW61he11KgBxKl9LVEEw/iBEGtNHnCa34pAQx4XH
	pJWEwX8DCSj4rCtv70AshfEFDEozu0E6BAmnNsQCR9YGCtWqS1RVuGKSh7BO5pyRzKE4
	bhLA==
MIME-Version: 1.0
X-Received: by 10.152.116.46 with SMTP id jt14mr3766923lab.59.1418928066868;
	Thu, 18 Dec 2014 10:41:06 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Thu, 18 Dec 2014 10:41:06 -0800 (PST)
In-Reply-To: <54931166.2050006@windriver.com>
References: <cover.1418220684.git.bruce.ashfield@windriver.com>
	<b18c4c9970004784d031a0776245fad792fc6a28.1418220684.git.bruce.ashfield@windriver.com>
	<CAJTo0Lb3-sYAyMreFv2AFhEo4Ejzmg3eDYOs6avJMjVO5SVjOQ@mail.gmail.com>
	<54931166.2050006@windriver.com>
Date: Thu, 18 Dec 2014 13:41:06 -0500
Message-ID: <CADkTA4MV7PqCqRC_+pkpnKsfJNG5qUL65qh52AUDr5kcU6E5qw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/9] linux-libc-headers: update to 3.17
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
X-List-Received-Date: Thu, 18 Dec 2014 18:41:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 18, 2014 at 12:39 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 2014-12-18, 12:13 PM, Burton, Ross wrote:
>>
>>
>> On 10 December 2014 at 14:16, Bruce Ashfield
>> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>>
>> wrote:
>>
>>     -LINUXLIBCVERSION ?= "3.16"
>>     +LINUXLIBCVERSION ?= "3.17"
>>
>>
>> So this is causing (at least) socat to fail to build as the configure
>> script does a test for a working <linux/errqueue.h> but that is now
>> failing:
>>
>> /data/poky-master/tmp/sysroots/nuc/usr/include/linux/errqueue.h:33:18:
>> error: array type has incomplete element type
>>
>> Line 33 is this member in a struct:
>>
>>     struct timespec ts[3];
>>
>> Presumably everything else that includes that header also includes
>> something that defines struct timespec.  Socat has a missing feature
>> check so whilst the configure test says that linux/errqueue.h isn't
>> present and continues, the build then fails.  Presumably the user-space
>> linux/errqueue.h needs another #include?
>
>
> This is unlikely to be fixed in the kernel header, but in the
> applications themselves.
>
> In this case, I see no changes to errqueue.h itself since 2012,
> but the uapi did go through some changes in 3.17 .. but then no
> more changes for 3.18.
>
> So if this is broken, socat should be breaking on every distro that
> uses 3.17+ kernel headers.
>
> I see that our socat is still the latest.
>
> .. and a quick search shows a fix:
>
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-misc/socat/files/socat-1.7.2.4-linux-3.17.patch?view=markup
>
> Did you want me to try a build and stack up the fix ?

I can confirm that this fixes things here. I'll send the patch shortly
(once I spruce up
the header).

Bruce

>
> Bruce
>
>
>
>
>
>>
>> Ross
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

