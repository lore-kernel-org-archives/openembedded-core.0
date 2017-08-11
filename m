Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D494678268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 09:08:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Aug 2017 02:08:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,356,1498546800"; d="scan'208";a="888938450"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Aug 2017 02:08:46 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
	<41176f6a-807d-f488-7f55-38ee82cc48bf@linux.intel.com>
	<1502110800.18633.220.camel@linuxfoundation.org>
	<d6c76558-21f5-c41d-9f47-2677644e4087@linux.intel.com>
	<b8ccbfdc-cb51-69e2-7516-5f95e949e170@windriver.com>
	<dbc83877-5b7e-fadb-0e0a-e8edb82386a2@linux.intel.com>
	<1502373956.29285.12.camel@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4dcba5de-0e7f-fb09-62c2-3c0f61e8cab2@linux.intel.com>
Date: Fri, 11 Aug 2017 12:05:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502373956.29285.12.camel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Meson support in oe-core
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
X-List-Received-Date: Fri, 11 Aug 2017 09:08:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/10/2017 05:05 PM, Leonardo Sandoval wrote:

>> After meson support is in master, we can start converting recipes from
>> autotools to meson. That requires careful manual work, but the good news
>> is that it can be done piece-meal; there's no need to switch everything
>> at once.
>>
> 
> Alex, is there a autotools-to-meson guide? I like to participate on this
> migration.


If you mean a guide for how to switch yocto recipes from building using 
autotools to building using meson (when upstream provides both options, 
or switched from one to the other), then no. No one has done this before 
:) You can get a rough idea of what is involved by looking here:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/meson&id=7442c79a8e03ac457bca34bbbf0c5c74c89dba6a

So:

1) inherit meson instead of autotools
2) replace autotools specific build flags with meson-specific ones (in 
PACKAGECONFIG etc.)
3) fix other issues until no errors happen
4) verify that everything that was previously installed and packaged is 
still installed and packaged.

I don't think there can be a generic guide, it's manual work which 
requires the broad recipe maintenance skillset :)

Now, If you meant writing meson support into the upstream source code, 
then that is even more specific to each project. You need to first 
carefully study what is being built, using which toolchain, and what are 
the various options, and then write meson.build files that do the same 
thing. And you also need to convince the upstream to take it, because 
it's generally not something we want to maintain as custom patches. 
Actually it's complicated enough, that I only want to attempt it for 
gettext.

Alex

