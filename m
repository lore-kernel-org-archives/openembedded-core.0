Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF59k-0004og-7n
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 17:28:40 +0200
Received: from localhost ([127.0.0.1]:34109 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF4xQ-0002nw-0l
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 15:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=eK70CtKKc8ilwqmYOSQ75K5jIds=; b=wxCP1PFeVhizJszeHn0Lor3seTgs
	dTlNHrWR7LOXz8uSyL0DPVe1pl0+CFV3Kg/mJcyimxuuTXG/+LTkokqAPztqwLs8
	6z1ChliazSPqmPRJQuiEI26+vpBL+sVekngz614gGG+N2JwL/6vMI6JiJ9XnIeOO
	cVXTghZd2kLcFqg=
Received: from [195.171.99.130] (port=11681 helo=[192.168.0.42])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TF4xP-0002np-Sy
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 15:15:56 +0000
Message-ID: <505C8503.2040907@communistcode.co.uk>
Date: Fri, 21 Sep 2012 16:17:23 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <505C7402.4060604@communistcode.co.uk> <505C7F3A.7020400@intel.com>
In-Reply-To: <505C7F3A.7020400@intel.com>
Subject: Re: ld problems with relocated toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 15:28:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 21/09/12 15:52, Laurentiu Palcu wrote:
>
> On 09/21/2012 05:04 PM, Jack Mitchell wrote:
>> I am currently having issues building my application with the latest
>> toolchain.
>>
>> I have used the new capabilities of it being relocatable to place it
>> somewhere sensible and I think this may be what is breaking it. My old
>> toolchain in /opt still works perfectly.
>>
>> The error I receive is:
>>
>> /home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld:
>> cannot find crtbegin.o: No such file or directory
>> collect2: error: ld returned 1 exit status
>> make: *** [R0005] Error 1
> Did this error appear after the latest SDK fixes that were merged today?
> Can you activate compiler verbose mode so we can see the arguments
> passed to the linker? Does it work if you install in the default
> location? Or better, can you tell the exact steps you followed to get
> this issue?

Exact steps:

bitbake meta-toolchain
run toolchain setup script
tell application to use new toolchain and sysroot
compile

This was appearing before the patches that were merged today.

Works fine when installed in default location.

Some more verbose output:

/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/as 
-v -I 
/home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/include 
-mcpu=cortex-a8 -mfloat-abi=softfp -mfpu=neon -meabi=5 -o 
src/systemConfig.o /tmp/ccr24jiu.s
GNU assembler version 2.22 (arm-poky-linux-gnueabi) using BFD version 
(GNU Binutils) 2.22
COMPILER_PATH=/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/:/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/
LIBRARY_PATH=/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/:/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../lib/armv7a-vfp-neon-poky-linux-gnueabi/gcc/
COLLECT_GCC_OPTIONS='-I' 
'/home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi/usr/include' 
'-O0' '-mfpu=neon' '-mfloat-abi=softfp' '-mcpu=cortex-a8' '-g3' '-Wall' 
'-Wextra' '-c' '-fmessage-length=0' '-v' '-MMD' '-MP' '-MF' 
'src/systemConfig.d' '-MT' 'src/systemConfig.d' '-o' 
'src/systemConfig.o' '-mtls-dialect=gnu'
/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
cannot find crt1.o: No such file or directory
/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
cannot find crti.o: No such file or directory
/home/jack/Projects/R0005-SDK-210912/sysroots/x86_64-pokysdk-linux/usr/bin/armv7a-vfp-neon-poky-linux-gnueabi/../../libexec/armv7a-vfp-neon-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/4.7.2/ld: 
cannot find crtbegin.o: No such file or directory
/lib/libpthread.so.0: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status
make: *** [R0005] Error 1

>
> Thanks,
> Laurentiu
>> However, crtbeign.o is at the path:
>>
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ pwd
>> /home/jack/Projects/R0005-SDK-210912/sysroots/armv7a-vfp-neon-poky-linux-gnueabi
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ find . -name
>>      crtbegin.o
>>      ./usr/lib/arm-poky-linux-gnueabi/4.7.2/crtbegin.o
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/lib
>>      lib/     libexec/
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$ ls usr/libexec/
>>      pt_chown
>>      [jack@archHP armv7a-vfp-neon-poky-linux-gnueabi]$
>>
>>
>> Does anyone have an idea what is the issue here? Why can't it find the
>> object file?
>>

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



