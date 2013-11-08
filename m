Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 960286D2F5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 15:54:36 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id oz11so335298veb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 07:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8MxsdvJ/STU5zHF9RXDmG+IHEeFjs3LyHLEBVp2qSZw=;
	b=RYg98b66E3l5in+dfDRc+EA1JiLoj3SUpVan7W+OFI+KHfEX2MdZUoRXTGDsEKzGnH
	PIIBYgwcCG/C54swjkzr7mr7mFT+0hKCY9DLWc9Uzqiq3B81HJQuM1gQpXcwGkec5ln6
	t1bv3f+MdtrZKTyZgBibV+bbyT5ANxL9PtWQJ+nJ2jQYPkTldrLPclh7fA1AWbjs29Wt
	ytLU94vNp+/ENxHRccHxQOXGQlxB1Li0+lcxLtQWMiMm3C+7Xm6gCANfTgdXXJeZ3Xo3
	6m4zLD2AHa1/P4tOohZ/PnXkddHJvO4iGFVKLN2H9oWRg/8yYBAYbQxo0ccyOT6+Igx6
	w7RQ==
MIME-Version: 1.0
X-Received: by 10.52.233.197 with SMTP id ty5mr76320vdc.48.1383926077850; Fri,
	08 Nov 2013 07:54:37 -0800 (PST)
Received: by 10.52.249.19 with HTTP; Fri, 8 Nov 2013 07:54:37 -0800 (PST)
In-Reply-To: <527D0624.3060407@windriver.com>
References: <1383923880.2345.4.camel@ted>
	<527D0624.3060407@windriver.com>
Date: Fri, 8 Nov 2013 16:54:37 +0100
Message-ID: <CAFyqS9oA4ZYpbV3mBj2OpKEar2wjR799s-+YWUXNykB7PMw-5w@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: "Hart, Darren" <darren.hart@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Use hardlinks for do_populate_sysroot for speed
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
X-List-Received-Date: Fri, 08 Nov 2013 15:54:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 8, 2013 at 4:41 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 13-11-08 10:18 AM, Richard Purdie wrote:
>>
>> The kernel tree is large and doesn't need to be copied. Override
>> the default sysroot handling function to use a hardlink copying
>> function in python.
>>
>> This commit also drops the copying of the /lib directory which
>> just contains the kernel modules. We never use those in the sysroot
>> so there is little point in carrying those around.
>>
>> For linux-yocto this takes the do_populate_sysroot time 24s -> 14s.
>
>
> Fantastic. One less thing for me to dig into later. I thought this
> was already in place, so I'm pleasantly surprised that there was a
> time savings to be found!
>

+1
Looks really promising. Trying them out now in my Yocto dora branch.
Btw, would it make sense to group these into a patch set and then
number them appropriately?
I realized this when I was trying to apply them since I had to take
some care not mixing them up.

Thanks.
Hans


> Bruce
>
>
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 0b6360f..e793ccb 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -308,8 +308,8 @@ kernelscripts_sstate_postinst () {
>>         fi
>>   }
>>
>> -sysroot_stage_all_append() {
>> -       sysroot_stage_dir ${D}${KERNEL_SRC_PATH}
>> ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>> +python sysroot_stage_all () {
>> +    oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"),
>> d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>>   }
>>
>>   kernel_do_configure() {
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

