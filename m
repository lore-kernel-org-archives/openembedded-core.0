Return-Path: <net147@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id AA56E6B6AE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 22:47:32 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bj1so45510pad.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 15:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=WkKSJyi6ThcF5urtABJusRPdzzBOB8E/uChFPYA0rT4=;
	b=MfCijb0jw+RZUaUlKdR13WcdofSNlI338YlxwvCvIcJpWdC0l9m91u0SeYRi4CUtmx
	qMYNgFU0FMobb+SZ+8mz9OJeDzBrN5ogPzYXW+e640JhjXexd62hDF7MA6yVAVWdlV64
	UI0jDkOm0bD5vlPG9+cAHgRuAnjrD+yGtpcZMs+26c5bwEECfSNrnGzhM1pJMrJohzLH
	MNgbIfAr/LKaMBxB/3FODRk+XF28NE/i3zoH05BO7gH2vatLjlGQEzbr5+tRkA/vvTBP
	ecM7/Lh39NVdBS0lxubNzUjqNSw6VWolcy3g5V47y3RoiLPPU572Wn/PTyjcX2uETjW0
	25jQ==
X-Received: by 10.66.175.133 with SMTP id ca5mr6411740pac.40.1377038853223;
	Tue, 20 Aug 2013 15:47:33 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id uw6sm4361566pbc.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 15:47:32 -0700 (PDT)
Message-ID: <5213F0D8.90102@gmail.com>
Date: Wed, 21 Aug 2013 08:42:32 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1376993441-15007-1-git-send-email-net147@gmail.com>
	<20130820102427.GE522@jama> <521347BF.7090507@gmail.com>
	<20130820210902.GF522@jama>
In-Reply-To: <20130820210902.GF522@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: enable additional drivers for gallium-llvm x86/x86-64
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
X-List-Received-Date: Tue, 20 Aug 2013 22:47:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2013 7:09 AM, Martin Jansa wrote:
> On Tue, Aug 20, 2013 at 08:41:03PM +1000, Jonathan Liu wrote:
>> On 20/08/2013 8:24 PM, Martin Jansa wrote:
>>> On Tue, Aug 20, 2013 at 08:10:41PM +1000, Jonathan Liu wrote:
>>>> The additional Gallium drivers are needed for open source ATI Radeon
>>>> and NVIDIA graphics drivers.
>>>>
>>>> The radeonsi and r600 drivers require LLVM 3.3 built with r600
>>>> PACKAGECONFIG so they must be explicitly enabled by adding r600 to the
>>>> mesa PACKAGECONFIG.
>>> BTW: I just got interesting question about egl_gallium:
>>>
>>> libEGL warning: Could not open driver /usr/lib/egl/egl_gallium.so
>>> (libLLVM-3.3.so: cannot open shared object file: No such file or
>>> directory)
>>> Could not initialize egl display
>>>
>>> EGL error
>>> Aborted
>>> root@qemux86:~# ls -alh /usr/lib/llvm3.3/
>>> drwxr-xr-x    2 root     root        1.0K Aug 20 02:47 .
>>> drwxr-xr-x   35 root     root       10.0K Aug 20 02:47 ..
>>> -rwxr-xr-x    1 root     root       15.8M Aug 19 14:02 libLLVM-3.3.so
>>> -rwxr-xr-x    1 root     root       78.2K Aug 19 14:02 libLTO.so
>>> -rwxr-xr-x    1 root     root       10.1K Aug 19 14:02 libprofile_rt.so
>>>
>>> I don't know yet why it worked in my tests when I was updating mesa and
>>> llvm, but it's true that we need to make sure that mesa finds
>>> libLLVM-3.3.so in versioned subdirectory in runtime.
>> LLVM has been working fine for me with llvmpipe (Intel GMA 3600 -
>> PowerVR-based), radeon (ATI Radeon HD5450) and nouveau (NVIDIA ION
>> GeForce 9400M) drivers.
>>
>> There is a symbolic link in /usr/lib:
>> $ cd /usr/lib
>> $ ls -l libLLVM-3.3.so
>> lrwxrwxrwx 1 root root 22 Aug 19 21:03 libLLVM-3.3.so ->
>> llvm3.3/libLLVM-3.3.so
> But this one is from llvm3.3-dev package which isn't installed by
> default, isn't it in your setup?
Right. It's in llvm3.3-dev. I have been testing it in my dev image which 
includes the dev packages.
It needs to be moved into the main package.

Regards,
Jonathan
>
>> I intend to submit xf86-video-ati and xf86-video-nouveau to
>> meta-openembedded later this week. I tested this change using those
>> recipes, linux-firmware (needed for ATI 3D acceleration) and the
>> following kernel options:
>> CONFIG_DRM_RADEON=m
>> CONFIG_DRM_RADEON_KMS=y
>> CONFIG_DRM_NOUVEAU=y
>>
>> Regards,
>> Jonathan
>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>> ---
>>>>    meta/recipes-graphics/mesa/mesa.inc | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>>>> index 447e186..e985d67 100644
>>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>>> @@ -50,6 +50,10 @@ PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disa
>>>>    PACKAGECONFIG[openvg] = "--enable-openvg, --disable-openvg"
>>>>    
>>>>    GALLIUMDRIVERS = "swrast"
>>>> +GALLIUMDRIVERS_LLVM33 = "${@base_contains('PACKAGECONFIG', 'r600', 'radeonsi,r600', '', d)}"
>>>> +GALLIUMDRIVERS_LLVM = "r300,svga,nouveau${@base_version_less_or_equal('MESA_LLVM_RELEASE', '3.2', '', ',${GALLIUMDRIVERS_LLVM33}', d)}"
>>>> +GALLIUMDRIVERS_append_x86 = "${@base_contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
>>>> +GALLIUMDRIVERS_append_x86-64 = "${@base_contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
>>>>    # keep --with-gallium-drivers separate, because when only one of gallium versions is enabled, other 2 were adding --without-gallium-drivers
>>>>    PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
>>>>    PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
>>>> -- 
>>>> 1.8.3.4
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


