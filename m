Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6A34F615CC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 00:51:25 +0000 (UTC)
Received: by mail-lb0-f180.google.com with SMTP id q8so1074603lbi.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 17:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=KyohmpBNieCPx8UDbF+ntP3Gl/nyQvY6hiudBzzdjXk=;
	b=rFySCID2wv/uZFDjHhsrK8EVmp2QoJS6qKr4uBvjUWWSgXH3AyuKvFRmJRq+ILdakV
	HZgxNsY74QFrKBg/vUjjpITbY9yQs2bwyW3i4X1OOyf/IbS+Cfo3GQcxQliqY6oggYs/
	XrJjLoUO2Ckfvdcbf3oTGXg+JAa1zItA1YrHrZHjGVztIZ4fsBT118G18uDoCSca4+Nf
	lTwGuqmhhSdJ52IXXyDlia+6ADCHXirmt2hTjRMdyb4hXwK6oWK4DJwS9rk0MNXycb2L
	2+vQVhojTtI8aodZCokB6I5TxdCuIWs7AD7TAoC/q+vjvEiVmYbpq3G3OXL0C8cHOJa8
	3uNA==
MIME-Version: 1.0
X-Received: by 10.152.2.4 with SMTP id 4mr4960868laq.0.1378342286128; Wed, 04
	Sep 2013 17:51:26 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 4 Sep 2013 17:51:25 -0700 (PDT)
In-Reply-To: <1378332114.1059.260.camel@ted>
References: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
	<1378332114.1059.260.camel@ted>
Date: Wed, 4 Sep 2013 20:51:25 -0400
Message-ID: <CADkTA4NbnmnQZXB2YLv5psJwA=gDAh9Bi4sGOr2dp30sTR0bJg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Thu, 05 Sep 2013 00:51:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Sep 4, 2013 at 6:01 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2013-09-04 at 17:22 +0100, Ross Burton wrote:
>> Only qemumips was recommending kernel-modules which meant that the other qemu
>> machines were missing some kernel modules, for example binfmt-misc.
>>
>> Move the recommends to qemu.inc so that all qemu machines pull in the kernel
>> modules that have been built.
>>
>> [ YOCTO #4863 ]
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/conf/machine/include/qemu.inc |    2 ++
>>  meta/conf/machine/qemumips.conf    |    2 --
>>  meta/conf/machine/qemumips64.conf  |    2 --
>>  3 files changed, 2 insertions(+), 4 deletions(-)
>
> How many modules are built for the qemu machines? Are they all useful?
> I'm just trying to get a feel for how much we're adding here and whether
> this is the right thing to be doing...

We can control the configs as tightly as we want, so if we are building too much
for this, I'm happy to trim things down.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
>
>>
>> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
>> index 545f8d1..7baf13e 100644
>> --- a/meta/conf/machine/include/qemu.inc
>> +++ b/meta/conf/machine/include/qemu.inc
>> @@ -27,3 +27,5 @@ EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
>>
>>  # Provide the nfs server kernel module for all qemu images
>>  KERNEL_FEATURES_append_pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
>> +
>> +MACHINE_EXTRA_RRECOMMENDS = "kernel-modules"
>> diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
>> index ce1c419..89721a6 100644
>> --- a/meta/conf/machine/qemumips.conf
>> +++ b/meta/conf/machine/qemumips.conf
>> @@ -9,5 +9,3 @@ KERNEL_IMAGETYPE = "vmlinux"
>>  KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>>
>>  SERIAL_CONSOLE = "115200 ttyS0"
>> -
>> -MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
>> diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
>> index b2c7998..7ba98cb 100644
>> --- a/meta/conf/machine/qemumips64.conf
>> +++ b/meta/conf/machine/qemumips64.conf
>> @@ -9,5 +9,3 @@ KERNEL_IMAGETYPE = "vmlinux"
>>  KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>>
>>  SERIAL_CONSOLE = "115200 ttyS0"
>> -
>> -MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

