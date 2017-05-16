Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1A40E77E08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 16:29:56 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 16 May 2017 09:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="262299649"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 16 May 2017 09:29:57 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<79e18217-d4ed-8356-9532-7da63a420d6f@topic.nl>
	<1494922912.1179.306.camel@intel.com>
	<aaeaad51-6bd1-10c4-ce22-4381c07bd9a8@linux.intel.com>
	<1494942469.28624.10.camel@intel.com>
	<4da20a5f-4d38-e3fb-b31e-f42ce8505564@linux.intel.com>
	<1494944734.28624.19.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9c9cbdd2-3b19-1624-8c0a-0b091b4cfb57@linux.intel.com>
Date: Tue, 16 May 2017 19:27:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1494944734.28624.19.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/6] development vs. production builds
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
X-List-Received-Date: Tue, 16 May 2017 16:29:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2017 05:25 PM, Patrick Ohly wrote:
>>
>> It is done like that already, it's just not very consistent from what I
>> can see. For example, core-image-sato-dev.bb:
>> =============
>> require core-image-sato.bb
>>
>> DESCRIPTION = "Image with Sato for development work. It includes
>> everything \
>> within core-image-sato plus a native toolchain, application development
>> and \
>> testing libraries, profiling and debug symbols."
>>
>> IMAGE_FEATURES += "dev-pkgs"
>> =============
>
> That's different. Here an image recipe specifies what it is meant to
> *contain*, not how it is meant to *behave*.

You can totally specify behavioral IMAGE_FEATURES in image recipes. The 
distinction is not formally specified or enforced anywhere, as far as I 
know.

> One would need core-image-sato-dev-production.bb (no debug-tweaks,
> dev-pkgs), core-image-sato-dev-debug.bb (debug-tweaks, dev-pkgs),
> core-image-sato-production.bb (no debug-tweaks, no dev-pkgs),
> core-image-sato-debug.bb (debug-tweaks, no dev-pkgs).
>
> Allowing EXTRA_IMAGE_FEATURES in local.conf.sample avoids that.

Consider that the suffix in image recipe name is essentially same as 
your IMAGE_MODE idea. It specifies who is the target audience for the 
image. Then you can avoid combinatorial explosion, if you define who the 
image is meant for:

someimage-developers.bb (debug tweaks, dev-pkgs)
someimage-endusers.bb (no debug tweaks, no dev-pkgs)

>> I'm not a big fan of placing INHERIT into local.conf either, by the way.
>> I believe in functional programming principles, and this goes directly
>> against them.
>
> It makes sense to me when the functionality is orthogonal to the
> content, like enabling buildhistory.

Unfortunately, there is no way to enforce orthogonality. The door is 
wide open for awful hacks here.

Alex


