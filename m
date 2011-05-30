Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QQvj1-0007mW-Ur
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 08:13:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 May 2011 23:10:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,290,1304319600"; 
   d="scan'208";a="3819634"
Received: from kyu3-desk.ccr.corp.intel.com (HELO [10.238.154.142])
	([10.238.154.142])
	by azsmga001.ch.intel.com with ESMTP; 29 May 2011 23:10:05 -0700
Message-ID: <4DE334BC.9000307@intel.com>
Date: Mon, 30 May 2011 14:10:04 +0800
From: Yu Ke <ke.yu@intel.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306530446.git.sgw@linux.intel.com>	<8046a9b60d086b3f82c0733ecbf24785066625e4.1306530446.git.sgw@linux.intel.com>	<1306531463.3120.124.camel@lenovo.internal.reciva.com>	<1306534987.27470.307.camel@rex>
	<4DE07DE3.1090303@intel.com> <1306570025.27470.320.camel@rex>
In-Reply-To: <1306570025.27470.320.camel@rex>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] xserver: force to use libdl
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
X-List-Received-Date: Mon, 30 May 2011 06:13:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

on 2011-5-28 16:07, Richard Purdie wrote:
> On Sat, 2011-05-28 at 12:45 +0800, Yu Ke wrote:
>> The marco in question is in xorg-server-1.10.1/configure.ac
>> "
>> AC_CHECK_FUNC([dlopen], [],
>>       AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
>> AC_SUBST(DLOPEN_LIBS)
>> "
>>
>> Ideally, the dlopen test should fail since dlopen is not available in
>> libc, and then DLOPEN_LIBS="-ldl" is executed. In this case, the later
>> build will correctly link libdl. qemux86 fall into this case.
>>
>> But in ppc case, the dlopen test unfortunately pass, and DLOPEN_LIBS
>> become "", which caused later linker error of unresolved dlopen
>> reference. but I did not yet understand why ppc is so special.
>>
>> For detail, I've attached two config.log, one for ppc, one for qemux86.
>> in ppc,
>> configure:15235: checking for dlopen
>> configure:15235: result: yes
>
> Thanks. If you look at config.log you'll see this near the top:
>
> | #modphp
> | ac_cv_c_bigendian_php=${ac_cv_c_bigendian_php=yes}
> | ac_cv_sizeof_ptrdiff_t=${ac_cv_sizeof_ptrdiff_t=4}
> | ac_cv_func_dlopen=${ac_cv_func_dlopen=yes}
> | lt_cv_dlopen_self=${lt_cv_dlopen_self=yes}
>
> and then if you look at the configure script for the xserver you'll see
> ${ac_cv_func_dlopen} being set to yes is likely triggering the bad
> result.
>
> These are coming from the powerpc site files:
>
> richard@rex:poky/meta/site$ grep dlopen * -r
> powerpc-common:ac_cv_func_dlopen=${ac_cv_func_dlopen=yes}
> powerpc-common:lt_cv_dlopen_self=${lt_cv_dlopen_self=yes}
>
> and I suspect if you remove those two lines, things will work a lot
> better!
>
> Only powerpc has the broken site file which is why only powerpc is
> affected.
>

Thanks Richard. This make sense and explain why only powerpc has this 
issue. I've remove these two line, and build the core-image-sato-sdk 
qemuppc, it passed. I will send out the patch.

Regards
Ke


