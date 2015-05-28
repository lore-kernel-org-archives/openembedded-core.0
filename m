Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 71A197568E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 04:49:09 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so103033121igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 21:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HJORQ8iyE9pQsbwrpSx0j897hvb0iykNwQiHCTyN5SQ=;
	b=LFU0hPO0ndVA4DcKbu+hV7EgTHrSBPqN/lQ7rcOGHhZVQp2drSd8m9VGIBKtqmuFUD
	l7DFP4RGEjLbejN6nEiQB/7FEA9GWy2Ew99vh5hCLxhk7epc8n6kFYhAF1gmwqgHDNc2
	+Au/pWyskvmBxTkhhJGfnybWmZxzYzB0+W7e9Y4l2TIxHarVW4zxcenueiGAOGtgoawl
	hOLktVJJeXOMh9rBp4KaHms51ecLNqSuJu49JS+NzFgZTmQCHHW/zzzCcHYBUs49xJc5
	+TV+Dgjp+0vtcc+fvtKqLEvPtcfUV7Ge3ybsfaUCMjo+SMUDuF/4ZkdIwwbutvLjdDXm
	z4Ww==
X-Received: by 10.43.56.146 with SMTP id wc18mr7490186icb.24.1432788550271;
	Wed, 27 May 2015 21:49:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Wed, 27 May 2015 21:48:39 -0700 (PDT)
In-Reply-To: <3ABA6702-FFD6-448B-99B2-5DD5723A3AD3@gmail.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
	<e5260dbf168f3c51d9114e4c4cb1fca49abc83b1.1432320274.git.tanu.kaskinen@linux.intel.com>
	<1432448758.12832.67.camel@linuxfoundation.org>
	<3ABA6702-FFD6-448B-99B2-5DD5723A3AD3@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 May 2015 21:48:39 -0700
Message-ID: <CAMKF1sqm97zeLZ5v70-BKW=+tPCn+w_bDibFkM2q6714kpABJg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Thu, 28 May 2015 04:49:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 27, 2015 at 9:19 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On May 23, 2015, at 11:25 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Fri, 2015-05-22 at 21:51 +0300, Tanu Kaskinen wrote:
>>> When PulseAudio is installed, alsa-plugins is needed to provide
>>> compatibility for ALSA applications.
>>>
>>> The dependencies are set up so that pulseaudio-server depends on
>>> alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf depends
>>> on the PulseAudio plugins. This should make the ALSA->PulseAudio
>>> compatibility configuration work out of the box, while leaving the
>>> PulseAudio specific configuration out on systems that don't have
>>> pulseaudio-server installed.
>>>
>>> The alsa-plugins recipes in meta-guacamayo and meta-webos were used as
>>> references, but this recipe is not a straight copy of either.
>>>
>>> Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
>>
>> FWIW this new recipe failed on the autobuilder when it was tested in a
>> multilib build:
>>
>> ERROR: QA Issue: lib32-alsa-plugins: Files/directories were installed
>> but not shipped in any package:
>>  /usr/lib32/alsa-lib/libasound_module_rate_speexrate_medium.so
>>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_order.so
>>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_medium.so
>>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_best.so
>>  /usr/lib32/alsa-lib/libasound_module_rate_samplerate_linear.so
>>  /usr/lib32/alsa-lib/libasound_module_rate_speexrate_best.so
>> Please set FILES such that these items are packaged. Alternatively if
>> they are unneeded, avoid installing them or delete them within
>> do_install. [installed-vs-shipped]
>>
>> I created a follow up patch:
>>
>> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=bd4f5e346550f961f7a1056661f9b9fefdc8fff6
>>
>> which fixed this and meant to merge it immediately after your commit
>> however it looks like I squashed the patches accidentally. In comes down
>> to the class extension code not being able to rewrite entries from
>> PACKAGES_DYNAMIC.
>
>
> There are more errors I am seeing, I wonder if they are parallel install issues
>
> | mv: cannot stat '/home/kraj/work/rdk/build-b2120-h412-a9/tmp/work/cortexa9hf-vfp-neon-rdk-linux-gnueabi/alsa-plugins/1.0.29-r0/image/usr/share/alsa/alsa.conf.d/99-pulseaudio-default.conf.example': No such file or directory
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_install (log file is located at /home/kraj/work/rdk/build-b2120-h412-a9/tmp/work/cortexa9hf-vfp-neon-rdk-linux-gnueabi/alsa-plugins/1.0.29-r0/temp/log.do_install.30933)
> ERROR: Task 4117 (/home/kraj/work/rdk/openembedded-core/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb, do_install) failed with exit code '1'

I sent a patch to fix this but then there still are issues.

WARNING: QA Issue: alsa-plugins-pulseaudio-conf rdepends on
libasound-module-conf-pulse, but it isn't a build dependency?
[build-deps]
WARNING: QA Issue: alsa-plugins-pulseaudio-conf rdepends on
libasound-module-ctl-pulse, but it isn't a build dependency?
[build-deps]
WARNING: QA Issue: alsa-plugins-pulseaudio-conf rdepends on
libasound-module-pcm-pulse, but it isn't a build dependency?
[build-deps]

