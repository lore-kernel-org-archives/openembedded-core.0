Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Sg11v-0006Oe-L1
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 23:59:39 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 14:48:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="166512312"
Received: from unknown (HELO envy.home) ([10.255.12.121])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2012 14:48:58 -0700
Message-ID: <4FDCFEFB.3090004@linux.intel.com>
Date: Sat, 16 Jun 2012 14:47:39 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1339799869.git.dvhart@linux.intel.com>
	<5f472764f7cea2d386b7ee572870fc03769868fc.1339799869.git.dvhart@linux.intel.com>
	<4FDBBD8D.1050201@linux.intel.com>
	<1339863500.3339.150.camel@x121e.pbcl.net>
	<4FDCB690.8090004@linux.intel.com>
	<CAMKF1soXK8fTW_LJZy2a0Mr1K1Aiwv-OA1rj_d_DGF8vHga5cg@mail.gmail.com>
In-Reply-To: <CAMKF1soXK8fTW_LJZy2a0Mr1K1Aiwv-OA1rj_d_DGF8vHga5cg@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Cc: Phil Blundell <philb@gnu.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Include setsid and cttyhack in defconfig
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Jun 2012 21:59:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06/16/2012 10:47 AM, Khem Raj wrote:
> On Sat, Jun 16, 2012 at 9:38 AM, Darren Hart <dvhart@linux.intel.com> wrote:
>>
>>
>> On 06/16/2012 09:18 AM, Phil Blundell wrote:
>>> On Fri, 2012-06-15 at 15:56 -0700, Darren Hart wrote:
>>>> So the delta for including SETSID and CTTYHACK is 2560 bytes.
>>>
>>> Personally I am still not in favour of adding this to the default
>>> configuration.  I appreciate that it's "only" 2.5k in this case, but
>>> every time we make a change like this the binary gets a little bit
>>> bigger and, over time, it does add up.  This sort of gradual bloat is
>>> quite insidious and difficult to combat after the fact.
>>>
>>> So, I continue to think that poky-tiny should just provide its own
>>> busybox configuration and turn on the options that it wants just like
>>> other DISTROs do.  No doubt there are some things currently included in
>>> the oe-core defaults that poky-tiny doesn't need, so you would probably
>>> get a smaller binary that way as well.
> 
> in retrospect I agree with Phil on gradual bloat. busybox and other
> kconfig based
> packages will always have fine tunings that we can never say one size
> fits all unless
> you enable everything and I think the purpose of using kconfig in
> those packages is to provide this fine level of configuration
> 
>>
>> You are correct that poky-tiny would benefit from a smaller config. My
>> original intent was to update the busybox recipe to use the new
>> merge-config.sh that we pushed to the upstream Linux kernel (which
>> should work with busybox as it uses the same config mechanism). This
>> would allow us to maintain a base busybox config with a several config
>> fragments that can be easily added via DISTRO_FEATURES rather than the
>> complicated hack that is in busybox now for handling DISTRO_FEATURES. I
>> prefer this approach as it reduces (if not eliminates) the need for the
>> proliferation of busybox.bbappend files.
>>
> 
> . using merge-config.sh will probably make things better but until
> then I don't think its a bad thing to have bbappends in current
> scenario
> 
>> However, this is a larger project and my immediate goal is to get
>> poky-tiny into better shape in terms of the initial experience. This is
>> why I originally implemented it as a "tiny" DISTRO_FEATURE as that would
>> migrate naturally to the config fragment approach. You and others
>> objected to that approach, and I do understand not wanting to complicate
>> the DISTRO_FEATURE logic further.
>>
>> With the above goal in mind, can you accept either of my proposed
>> patches as an interim solution? Either as an added tiny DISTRO_FEATURE
>> or as a simple addition to the defconfig? I do believe these two
>> features are useful beyond poky-tiny.
> 
> I think best approach here is to have the defconfig of own in
> poky-tiny layer. It will
> be a contained change.

Note that poky-tiny is not currently in its own layer, but is included
in the meta-intel layer. I will look into ways to accomplish this
without adding to the core busybox config and not having to break out
poky-tiny into its own layer.

I appreciate the careful thought and consideration.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel




