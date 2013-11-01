Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 73A5D6D1BB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 15:38:02 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id n12so4615107oag.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=tgU8Rgija1MtOTgt6nYk1gOgR5b+ismoaibJFdg8unY=;
	b=r3/oHoIdpnHtwltqXmGpy1DNGK4xX515YxMGtPqfhw0goqpklHHsd+DD5vE2tjOFB4
	D8GWX3a09hTYrq2pbZVmmM0YwdhW8ssLyEABFfLKdEm4APOjzWUp16u5+gnNbsCK2Vnh
	mcJIy+9+w1WXD4wO0xV6bTBM2T+SWIQaK78KRzQVBWGkDpX6WwcB7Dpj7yld2f6CuAWP
	J2oKpBLaxpXeDtfGpokRsQc60NdHzGk1AVMnCJ1IKg/Tvvo3V3JaI6XkLCmliEKT11XU
	Zwzh7YzZMxT/PtU957VoWyJNMfHskbp0y0lSgIbW/8dDpmJUF+zHhsDiiH5ICc5rztlg
	I6bw==
MIME-Version: 1.0
X-Received: by 10.60.45.102 with SMTP id l6mr3049978oem.36.1383320284075; Fri,
	01 Nov 2013 08:38:04 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 1 Nov 2013 08:38:03 -0700 (PDT)
In-Reply-To: <1383316571.6271.33.camel@ted>
References: <5273B339.6090700@gmail.com>
	<1383316571.6271.33.camel@ted>
Date: Fri, 1 Nov 2013 13:38:03 -0200
X-Google-Sender-Auth: qVtyMxiB4_4jfRGCv-YdJhkQyI0
Message-ID: <CAP9ODKqww_Vv_7d8senAB2t96KvKNp2un8CuyzGudAqYDO5WBg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: Patch file search order in DORA (1.5)
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
X-List-Received-Date: Fri, 01 Nov 2013 15:38:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 1, 2013 at 12:36 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-11-01 at 15:57 +0200, Janis Coders wrote:
>> Hi, I am working on Freescale's BSP with my custom layer which overrides
>> (appends) the Linux kernel's recipe.
>> In version 1.4 my custom recipe's defconfig had priority over the
>> 'original' layer's defconfig, but in 1.5 the priority has
>> changed. After some debugging I found out that seems like order of patch
>> file searching has changed in version 1.5.
>>
>> Order in 1.4 (example):
>> DEBUG: Searching for defconfig in paths:
>> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/arm
>> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/armv7a
>> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/mx5
>> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/mx53
>> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/imx53be
>> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/poky
>> /home/chocis/projects/balticembedded-bsp/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/
>> /home/chocis/projects/balticembedded-bsp/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/arm
>> /home/chocis/projects/balticembedded-bsp/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/armv7a
>> /home/chocis/projects/balticembedded-bsp/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/mx5
>>
>>      ......
>> Order in 1.5 (example):
>> /home/chocis/projects/testdorafreescale/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/poky
>> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm-extra/recipes-kernel/linux/linux-imx-2.6.35.3/poky
>> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/poky
>> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx/poky
>> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/files/poky
>> /home/chocis/projects/testdorafreescale/sources/meta-balticembedded/recipes-balticembedded/linux/linux-imx/imx53be
>> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm-extra/recipes-kernel/linux/linux-imx-2.6.35.3/imx53be
>> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx-2.6.35.3/imx53be
>> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/linux-imx/imx53be
>> /home/chocis/projects/testdorafreescale/sources/meta-fsl-arm/recipes-kernel/linux/files/imx53be
>>      .........
>>
>> Was this intended and specially changed in version 1.5? Because now I
>> have to move my defconfig one directory deeper
>> to get the priority.
>
> It was not in the 1.5 release however I have just realised it is in the
> dora branch and it is a change of behaviour there. I'm not sure it was
> intentionally included for 1.5.1 and that is something we need to
> discuss.
>
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?h=dora&id=0bd63125c3b44a656e44f2a76cc5f832c9db4bbd
>
> I would say that the change is in master and is intentional however and
> if you look at the search order, it does make more sense this way
> around. Any distro override file should come first, then say armv7, then
> armv6 and so on. In the original order, arm overrides armv7 which
> overrides machine specific which makes no sense.
>
> On those grounds it is a valid bug fix for 1.5.1 IMO.

The only thing which worries me is walking in same overrides across
layers. I'd expect it to respect the layer preference here.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

