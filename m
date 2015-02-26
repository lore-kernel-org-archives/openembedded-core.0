Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id C778A605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 13:05:48 +0000 (UTC)
Received: by lbvp9 with SMTP id p9so10641444lbv.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 05:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BoUTcrF03ECifRc0IjU8ovn9ZQMmiqyMfXbr0ctGpZg=;
	b=xjrUtcSI1PQYZu489jGrU4qJrZLgMy6uWkIUqcoP71ag1EFIsl5egkxxuzGF8wVZqX
	0FALJMmpRfynwya3HQo8CYzEU5AIgWAqnOuHLKbh3ksDrmH6ra1gaqkEQlVMRNaYrWAI
	VUTWB6UeLSZth3QcOP39lEQzAW4/PI32mzP46nmj/eWXcX6itkBdqO6X2geXJtKNpcgN
	6zQEUrNZtkyFCJ+hqM6SdIpLZixhSDglmovrjSoHuNOwy1GA0s3p6obgkA9zHgr3P+/s
	HEoDp4STA7VprSzbYbMBJn80G8UV5694FwoiednAPhQY3oURMi9Ku3BROaNs1v+KLNjq
	OLTA==
MIME-Version: 1.0
X-Received: by 10.112.162.232 with SMTP id yd8mr2319868lbb.41.1424955948348;
	Thu, 26 Feb 2015 05:05:48 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Thu, 26 Feb 2015 05:05:48 -0800 (PST)
In-Reply-To: <4BEA3FF3CAA35E408EA55C7BE2E61D05943CBA6B1A@xmail3.se.axis.com>
References: <cover.1424456540.git.bruce.ashfield@windriver.com>
	<a9038233862667971dc193ad0e160a7b28ef252a.1424456540.git.bruce.ashfield@windriver.com>
	<4BEA3FF3CAA35E408EA55C7BE2E61D05943CBA6B1A@xmail3.se.axis.com>
Date: Thu, 26 Feb 2015 08:05:48 -0500
Message-ID: <CADkTA4N7apAtwX85swEzaK9_TLDtc8BKBm-Q0omXHhzKxeOGkA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ola X Nilsson <ola.x.nilsson@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] linux-yocto: warn when a generated BSP description is used
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
X-List-Received-Date: Thu, 26 Feb 2015 13:05:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 26, 2015 at 2:21 AM, Ola X Nilsson <ola.x.nilsson@axis.com> wrote:
> We use a custom yocto-style kernel recipe to build our non-yocto-style kernel.
>
> To do this we add a defconfig file to the SRC_URI variable and then a bunch of scc files to the KERNEL_FEATURES variable.
>
> I guess this makes our BSP description auto generated.  Can we have an option to turn the warning off?

At the moment, no. Ignore it for now, and I can tweak the message to detect
and skip this scenario.

File a bugzilla enhancement request, and I can take care of it.

Cheers,

Bruce

>
> --
> Ola X Nilsson
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of Bruce Ashfield
>> Sent: den 20 februari 2015 19:38
>> To: richard.purdie@linuxfoundation.org
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 5/5] linux-yocto: warn when a generated BSP
>> description is used
>>
>> The meta data (in tree or out of tree) that describes a BSP, its patches and
>> configuration is not always available when a new/default or manually
>> configured machine is built.
>>
>> When this happens, the tools generate a skeleton BSP and use a architecture
>> defconfig for the build. If this is by design, the build is typically sane and
>> everything works fine. If an existing BSP description was expected, chances
>> are that the resulting kernel will not be correct.
>>
>> To avoid surprising the user when a default/skeleton BSP is used for the build,
>> we can make it obvious to the user by emitting a warning like the following:
>>
>>    WARNING: [kernel]: An auto generated BSP description was used, this
>> normally indicates a misconfiguration.
>>             Check that your machine (myqemux86-64) has an associated kernel
>> description.
>>
>> [YOCTO: #3383]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>  meta/classes/kernel-yocto.bbclass | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-
>> yocto.bbclass
>> index 0cbbb5f2d22f..a5e2b180c496 100644
>> --- a/meta/classes/kernel-yocto.bbclass
>> +++ b/meta/classes/kernel-yocto.bbclass
>> @@ -281,6 +281,15 @@ python do_kernel_configcheck() {
>>              with open (nonhw_file, "r") as myfile:
>>                  results = myfile.read()
>>                  bb.warn( "[kernel config]: BSP specified non-hw
>> configuration:\n\n%s" % results)
>> +
>> +    bsp_desc = "${S}/" + kmeta + "/" + "top_tgt"
>> +    if os.path.exists(bsp_desc):
>> +        with open (bsp_desc, "r") as myfile:
>> +                bsp_tgt = myfile.read()
>> +                m = re.match("^(.*)scratch.obj(.*)$", bsp_tgt)
>> +                if not m is None:
>> +                    bb.warn( "[kernel]: An auto generated BSP description was used,
>> this normally indicates a misconfiguration.\n" +
>> +                             "Check that your machine (%s) has an
>> + associated kernel description." % "${MACHINE}" )
>>  }
>>
>>  # Ensure that the branches (BSP and meta) are on the locations specified by
>> --
>> 2.1.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

