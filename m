Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 302567D2AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 01:52:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4R1pAAF014893
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 26 May 2019 18:51:20 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 26 May 2019 18:50:59 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Khem Raj
	<raj.khem@gmail.com>
References: <20190523082558.3805-1-kai.kang@windriver.com>
	<20190523082558.3805-2-kai.kang@windriver.com>
	<36fa4c4d62d448588b54a0a4b0a5c92a@XBOX04.axis.com>
	<CAMKF1spu88QXmGms77KzQXVGYSw7dR=40G_Ldd37G0DC1pc68w@mail.gmail.com>
	<7977f33e2ada4c18a52446f9cb1511ed@XBOX04.axis.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <e3af3be2-c739-fa69-720f-d08ddef76b28@windriver.com>
Date: Mon, 27 May 2019 09:49:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7977f33e2ada4c18a52446f9cb1511ed@XBOX04.axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] local.conf.sample: make systemd as default init manager
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
X-List-Received-Date: Mon, 27 May 2019 01:52:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/5/25 上午3:23, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Khem Raj <raj.khem@gmail.com>
>> Sent: den 23 maj 2019 22:59
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Cc: kai.kang@windriver.com; openembedded-core@lists.openembedded.org; richard.purdie@linuxfoundation.org
>> Subject: Re: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as default init manager
>>
>> On Thu, May 23, 2019 at 1:41 PM Peter Kjellerstedt <mailto:peter.kjellerstedt@axis.com> wrote:
>>> -----Original Message-----
>>> From: mailto:openembedded-core-bounces@lists.openembedded.org <openembedded-
>>> mailto:core-bounces@lists.openembedded.org> On Behalf Of
>>> mailto:kai.kang@windriver.com
>>> Sent: den 23 maj 2019 10:26
>>> To: mailto:richard.purdie@linuxfoundation.org
>>> Cc: mailto:openembedded-core@lists.openembedded.org
>>> Subject: [OE-core] [PATCH v3 1/2] local.conf.sample: make systemd as
>>> default init manager
>>>
>>> From: Kai Kang <mailto:kai.kang@windriver.com>
>>>
>>> Move configurations from local.conf.sample.extended to local.conf.sample
>>> to make systemd as default init manager for poky.
>> If we're going to change the default init manager to be systemd, wouldn't
>> it be more appropriate to change the real default values in bitbake.conf
>> and http://packagegroup-core-boot.bb? And then include an example in
>> local.conf.sample.extended to show how to configure sysvinit as init
>> manager?
>>
>> That would change it for Oe-core and other distributions as well which
>> is not the intention
> Ok, then I'd say the change belongs in poky.conf. Doing this kind of changes
> in local.conf.sample seems very wrong to me. Why? Because if I have an
> existing build tree it will not be affected, but if I setup a new tree with
> oe-init-build-env it will all of a sudden behave differently from the old
> tree. In my mind, local.conf.sample should only be used for things the user
> are likely to want to configure to adapt the build for his/her environment,
> not to define the distribution (that's what poky.conf is for).


If put the settings to poky.conf, it is complicated to override the 
settings and hard for users to turn back to sysvinit when he/she wants.
And every time updates local.conf.sample which is not just update 
comments, the old build and new build are differently, such as

commit 18bead102afabffcf3842ee099dcd22b8a598b8d
Author: Alexander Kanavin <alex.kanavin@gmail.com>
Date:   Wed Feb 27 18:47:33 2019 +0100

     local.conf.sample: adjust the qemu configuration to refer to 
qemu-system-native

     (From meta-yocto rev: aa16ed1b2c0f358d244a50a41be19d80935d3cc8)

     Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-poky/conf/local.conf.sample 
b/meta-poky/conf/local.conf.sample
index 267108d685..9068e567dc 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -241,7 +241,7 @@ BB_DISKMON_DIRS ??= "\
  # seen. The two lines below enable the SDL backend too. By default 
libsdl2-native will
  # be built, if you want to use your host's libSDL instead of the 
minimal libsdl built
  # by libsdl2-native then uncomment the ASSUME_PROVIDED line below.
-PACKAGECONFIG_append_pn-qemu-native = " sdl"
+PACKAGECONFIG_append_pn-qemu-system-native = " sdl"
  PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
  #ASSUME_PROVIDED += "libsdl2-native"


and more earlier:

commit 63dcfa8f1394475073f6dbb5f3f6ede284d5a305
Author: Mark Hatle <mark.hatle@windriver.com>
Date:   Mon Aug 15 16:29:34 2016 -0500

     Revert "local.conf.sample: Disable prelink by default"

     This reverts commit 300f858ba07c938427ccd05a3d7220027a03d461.

     Reenable prelink

     (From meta-yocto rev: 91705d8ae9f56d1de4f0fdcd6a9654b75921aa8c)

     Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta-poky/conf/local.conf.sample 
b/meta-poky/conf/local.conf.sample
index a7b2d8065d..365b6eb20c 100644
--- a/meta-poky/conf/local.conf.sample
+++ b/meta-poky/conf/local.conf.sample
@@ -152,8 +152,7 @@ EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
  #   - 'image-swab' to perform host system intrusion detection
  # NOTE: if listing mklibs & prelink both, then make sure mklibs is 
before prelink
  # NOTE: mklibs also needs to be explicitly enabled for a given image, 
see local.conf.extended
-# image-prelink disabled for now due to issues with IFUNC symbol relocation
-USER_CLASSES ?= "buildstats image-mklibs"
+USER_CLASSES ?= "buildstats image-mklibs image-prelink"

  #
  # Runtime testing of images


Regards,
Kai

>
> //Peter
>

-- 
Kai Kang


