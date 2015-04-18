Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1E0586AC24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Apr 2015 00:19:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 17 Apr 2015 17:19:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,598,1422950400"; d="scan'208";a="681950438"
Received: from aehernan-devstation.zpn.intel.com (HELO [10.219.4.80])
	([10.219.4.80])
	by orsmga001.jf.intel.com with ESMTP; 17 Apr 2015 17:19:56 -0700
Message-ID: <5531A32F.2010302@linux.intel.com>
Date: Fri, 17 Apr 2015 19:19:59 -0500
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1429177203.git.alejandro.hernandez@linux.intel.com>	
	<1ca6d1e0276189ecb640f08ce5afee34a788c163.1429177203.git.alejandro.hernandez@linux.intel.com>
	<1429307402.6976.207.camel@linuxfoundation.org>
In-Reply-To: <1429307402.6976.207.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] python3-native: Fix pip install issue due to unclean build directory
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
X-List-Received-Date: Sat, 18 Apr 2015 00:19:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17/04/15 16:50, Richard Purdie wrote:
> On Thu, 2015-04-16 at 09:45 +0000, Alejandro Hernandez wrote:
>> When installing python3-native sometimes pips default build
>> directory (which is on the host and is user dependant) is left unclean,
>> due to this, when python3-core is being installed it tries to use
>> the same directory producing an error, this explicitly removes
>> what the previous installation might have left behind, fixing the issue.
>>
>> Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
>> ---
>>   .../python/python3-native_3.4.2.bb                 |  1 +
>>   .../python3/pip_build_directory_unclean.patch      | 28 ++++++++++++++++++++++
>>   2 files changed, 29 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3/pip_build_directory_unclean.patch
> The problem here is that two builds of python3-native could be happening
> on the same system at the same time. In fact I'd bet that is why its
> breaking on the autobuilder. Can we not tell it to use something in
> WORKDIR as its temp directory instead?
>
> Cheers,
>
> Richard
Hmm, that's potentially what is happening, in fact, my first thought was 
to do that and use something within the WORKDIR, but I wasn't able to do 
that because they do something weird to install pip, they bootstrap the 
installation and they use python wheels, so the actual part of the code 
where one could specify a different build directory for pip is inside 
one of the wheels, making it complicated to modify.
The only other thing that occurs to me would be to just make it sleep or 
make it wait somehow (we could modify the queue?) until the directory is 
empty.

I still think this should work, I only saw cases where the build 
directory is left with one empty file, another reason why I decided to 
explicitly delete it instead of forcing it to delete everything inside 
the directory, disabling pip is not an option because it is required 
since python 3.4 as I stated on the upgrade patch, we could try this, 
and if it doesn't work I'll find another workaround, but let me know 
what you think.


Alejandro

