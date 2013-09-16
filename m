Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 80FFE6BF60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 16:06:43 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id uz6so3981058obc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MrkJTa0AvZ0P85NLACbh720Rp/H5f8KqIg+4e+rXKQs=;
	b=g4ZsyLFblKp8FWtCSueyb/nT4jkchcsFN7Oz1XEeEe0oAuddakITQGCvGw5mQbr3Cw
	ffiPApq1FL1n7oQzTvDmAMm4s/aSxePA0mAtXsC5gMp6+OS17NUPsMVr1EDgH8tl2MTO
	YfuKwN8LBt/oxee9T2J6g6l1ojyX63vgWF8uRGNAexyNmHoF6SdbXH+6nWHLxU21qN+R
	cOcNEub0MEGA45LFMwP4J/eykCh4YTbbQYX2w3MCont9T43mcFlBSP4BOxZgnyMLD0Sy
	4anzjsnm8Ytx9k6OjsF0tqtcEj09pny4ckanPYqKAZVr/CEgsvqWrDmguwQSlgWydWXc
	7c8g==
MIME-Version: 1.0
X-Received: by 10.182.181.34 with SMTP id dt2mr472312obc.30.1379347604802;
	Mon, 16 Sep 2013 09:06:44 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Mon, 16 Sep 2013 09:06:44 -0700 (PDT)
In-Reply-To: <52372815.50200@windriver.com>
References: <1379071094.3484.245.camel@ted>
	<52372815.50200@windriver.com>
Date: Mon, 16 Sep 2013 18:06:44 +0200
Message-ID: <CAFyqS9oWkQ4o1Xpb3v6wLggskjcK7gOHW8=ySMszH2VO63teUA@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: Add big warning about antisocial behaviour
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
X-List-Received-Date: Mon, 16 Sep 2013 16:06:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 16, 2013 at 5:47 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 9/13/13 6:18 AM, Richard Purdie wrote:
>>
>> I'm getting concerned with the number of people forking this recipe
>> and not understanding what they're doing. I'm therefore proposing
>> adding in a suitable warning to people thinking of copying it.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> index 96fe2ff..79b7dc4 100644
>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> @@ -2,6 +2,28 @@ DESCRIPTION = "Sanitized set of kernel headers for the C
>> library's use."
>>   SECTION = "devel"
>>   LICENSE = "GPLv2"
>>
>> +#########################################################################
>> +####                        PLEASE READ
>> +#########################################################################
>> +#
>> +# You're probably looking here thinking you need to create some new copy
>> +# of linux-libc-headers since you have your own custom kernel. To put
>> +# this simply, you DO NOT.
>> +#
>> +# Why? These headers are used to build the libc. If you customise the
>> +# headers you are customising the libc and the libc becomes machine
>> +# specific. Most people do not add custom libc extensions to the kernel
>> +# and have a machine specific libc.
>> +#
>> +# But you have some kernel headers you need for some driver? That is fine
>> +# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
>> +# This will make the package using them machine specific but this is much
>> +# better than having a maching specific C library. This does mean your
>
>
> Typo in the above, "maching" should be "machine"...
>
>
>> +# recipe needs a DEPENDS += "virtual/kernel" but again, that is fine and
>> +# makes total sense.
>> +#
>> +# -- RP
>> +
>
>
> I am completely in favor of this.  People don't get that custom kernel
> headers have severe ramifications in projects.  I've had to explain this to
> hundreds over the last few years (and they keep doing it anyway)..
>
> Acked-by: Mark Hatle  (with change mentioned above)
>
> --Mark
>
I can only agree to that what you are saying makes perfectly sense. Do
not fix what is not broken ;)
However, we did stumble into one problem when stepping up to a later
baseline using a 3.8 kernel. The patch for Makefile.headerinst could
not be applied to our vendor specific 3.6 kernel branch so we were
force to disable it completely. Did we take the wrong turn somewhere?

Thanks.
Hans


>
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>>
>>   python __anonymous () {
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

