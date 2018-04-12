Return-Path: <california.l.sullivan@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9F07469B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 21:38:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2018 14:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,443,1517904000"; d="scan'208";a="42909633"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga003.jf.intel.com with ESMTP; 12 Apr 2018 14:38:42 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Trevor Woerner <twoerner@gmail.com>, bruce.ashfield@windriver.com
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
	<CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <ada194d6-5653-fde7-a70a-64646b08b281@intel.com>
Date: Thu, 12 Apr 2018 14:38:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Thu, 12 Apr 2018 21:38:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

If you're using a non-linux-yocto kernel you likely need to apply this 
patch to your kernel as well:

https://git.yoctoproject.org/cgit/cgit.cgi/meta-intel/tree/recipes-kernel/linux/linux-intel/0001-menuconfig-check-lxdiaglog.sh-Allow-specification-of.patch

(This is in all linux-yocto kernels, I'm only linking to meta-intel 
because I knew where it was off the top of my head)

This was sent upstream but last I looked it didn't gain any traction. I 
think Bruce resent it recently but I can't be sure.

Thanks,
Cal

On 04/12/2018 01:28 PM, Andreas Müller wrote:
> On Mon, Apr 2, 2018 at 11:57 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>> On Sun 2018-04-01 @ 11:49:58 PM, Andreas Müller wrote:
>>> When running bitbake -cmenuconfig virtual/kernel I get a flood of
>>> undefined reference errors. Am I alone here?
>> Sadly, I think you might be.
>>
>>          $ bitbake virtual/kernel -c menuconfig
>>
>> works fine for me.
>>
>> I assume you're doing this for something RaspberryPi-ish?
>>
>>          Build Configuration:
>>          BB_VERSION           = "1.37.0"
>>          BUILD_SYS            = "x86_64-linux"
>>          NATIVELSBSTRING      = "opensuse-42.3"
>>          TARGET_SYS           = "arm-oe-linux-gnueabi"
>>          MACHINE              = "raspberrypi3"
>>          DISTRO               = "nodistro"
>>          DISTRO_VERSION       = "nodistro.0"
>>          TUNE_FEATURES        = "arm armv7ve vfp thumb neon vfpv4 callconvention-hard cortexa7"
>>          TARGET_FPU           = "hard"
>>          meta-raspberrypi     = "master:63e53f919089027259a513dc2cd4b140789bf1a3"
>>          meta                 = "master:4cedddb83623c79980b354642dfeaf78218ca4b7"
>>          meta-oe
>>          meta-gnome
>>          meta-python
>>          meta-networking
>>          meta-multimedia      = "master:b9d1d8718834f7287e5a65373b952cbfe9ce83fe"
>>          meta-qt5             = "master:e60e849de1158c879bd2c150fe79b207cdac031a"
>>          meta-qt5-extra       = "master:a0cf057b2f335e8d2be9180f20770773334ec209"
>>          meta-realtime        = "master:250bc6eaa47e550c1db5e2b0ebd42d86ee43650e"
>>          meta-browser         = "master:d1c902440cba26a9d1271cfb914633c68ee3791c"
> OK I found that I am not alone [1] and followed the suggestion to
> install ncurses-devel. Strange: it install ncurses-libs x86_64. Now I
> have back menuconfig but it looks horrible: All framing chars are
> displayed as '@'. If I remember correct there was such an issue long
> lime ago.
>
> However it is not beautiful but I can work with it.
>
> [1] https://github.com/crops/poky-container/issues/17
>
> Andreas


