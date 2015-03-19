Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id AFA6265CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 20:19:26 +0000 (UTC)
Received: by oier21 with SMTP id r21so74957314oie.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 13:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Wb66vRrpRwjrIcdquP4Z7hm2UrLKSbTf2w2VkM4ETdM=;
	b=Et+ykl6SMvKLUkBmRb23wuCl2MxChpN7tv/JgE7gRX7cDjzgmSWZrILoHmrfCK1In7
	ibr7ezu5fA6NygXK/vBkqk7fD2MOVyyYQT9oHRDRe+mcdBh0rsK7UjL+hCdsT2Engh/8
	1Lhpo3EGPvk/yRuTZ5qpgUZTzxUkIGnt/G8znwEIRbcBZOQtlXT3c1yIztK9M6PJaiRQ
	GUM4t1vQJLCUmJcMQiu/gTnDN60SaClI0eEKUojt33rOMAC2AMXA6LUDQqOe3KSLPmUO
	MX5N/qEAldHj4RJo79xQJgduzN94ZNeMvg57KC9TX3sILgHoK2LCkU2//iKtdwoxmya3
	Pntg==
MIME-Version: 1.0
X-Received: by 10.202.74.143 with SMTP id x137mr8705758oia.118.1426796367489; 
	Thu, 19 Mar 2015 13:19:27 -0700 (PDT)
Received: by 10.202.217.69 with HTTP; Thu, 19 Mar 2015 13:19:27 -0700 (PDT)
In-Reply-To: <CAP9ODKo7=Ehs-BOL3NUFXXx8Mjt4tMR6GeKyZtokXfugEnX6BA@mail.gmail.com>
References: <1426746558-2920-1-git-send-email-armccurdy@gmail.com>
	<CAP9ODKo7=Ehs-BOL3NUFXXx8Mjt4tMR6GeKyZtokXfugEnX6BA@mail.gmail.com>
Date: Thu, 19 Mar 2015 13:19:27 -0700
Message-ID: <CAJ86T=UH09ye6Vpfv+exa4rwJjeQkbixx0wy_gd=4H8Xnv-8GA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-plugins-good: fix nondeterministic udev dependency
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
X-List-Received-Date: Thu, 19 Mar 2015 20:19:28 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 19, 2015 at 5:20 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Mar 19, 2015 at 3:29 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> Make the v4l PACKAGECONFIG option control building of the video4linux2
>> plug-in (not use of libv4l, as it did before) and enable by default.
>> Add a separate libv4l PACKAGECONFIG to control use of libv4l (disabled
>> by default since libv4l is not part of oe-core).
>>
>> The default config for gst-plugins-good and gstreamer1.0-plugins-good
>> is now aligned with regards to v4l, ie:
>>
>>   v4l support: enabled by default
>>   v4l use of libgudev: enabled by default
>>   v4l use of libv4l2: disabled by default
>>
>> This commit fixes the following build-deps QA Warnings:
>>
>>   WARNING: QA Issue: gst-plugins-good-video4linux2 rdepends on libudev, but it isn't a build dependency? [build-deps]
>>   WARNING: QA Issue: gst-plugins-good-video4linux2 rdepends on libgudev, but it isn't a build dependency? [build-deps]
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>> index 85f2196..af18281 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>>
>>  PR = "r8"
>>
>> -PACKAGECONFIG ?= "jpeg \
>> +PACKAGECONFIG ?= "jpeg v4l \
>
> This is not needed.

The reasons I had for explicit enabling were:

- The video4linux2 plug-in is typically being built now and judging by
the patches to gst-plugins-good it's not unusual for it to break
during kernel upgrades, so keeping it enabled maintains that test
coverage.

- The video4linux2 plug-in is enabled by default in
gstreamer1.0-plugins-good (with a hardcoded option passed via
EXTRA_OECONF), so explicit enabling in gst-plugins-good keeps the two
versions in sync.


>>      ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>>  "
>> @@ -16,7 +16,9 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
>>  PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
>>  PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
>>  PACKAGECONFIG[gdkpixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
>> -PACKAGECONFIG[v4l] = "--with-libv4l2,--without-libv4l2,libv4l"
>> +PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2 --without-gudev,udev"
>> +# sub-feature of v4l, but control separately since libv4l is not part of oe-core
>> +PACKAGECONFIG[libv4l] = "--with-libv4l2,--without-libv4l2,libv4l"
>>  PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
>>  PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
>>  PACKAGECONFIG[x11] = "--enable-x,--disable-x,virtual/libx11 libxfixes libxdamage"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

