Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U2oZd-0005LM-Ch
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 20:52:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Feb 2013 11:37:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,609,1355126400"; d="scan'208";a="199010526"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Feb 2013 11:37:05 -0800
Message-ID: <51115F61.3050900@linux.intel.com>
Date: Tue, 05 Feb 2013 11:37:05 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>
References: <1359977606-15432-1-git-send-email-constantinx.musca@intel.com>
	<20130204122309.12582d0b@e6410-2> <1360020111.14071.172.camel@ted>
	<20130204172705.0e18d279@e6410-2> <1360021079.14071.174.camel@ted>
	<20130204175024.3af7b9b2@e6410-2> <5110B6CE.1050504@intel.com>
	<20130205131555.46c685fb@e6410-2>
In-Reply-To: <20130205131555.46c685fb@e6410-2>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: fix sqlite path and package missing files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 19:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/05/2013 11:15 AM, Peter Seebach wrote:
> On Tue, 5 Feb 2013 09:37:50 +0200
> Constantin Musca <constantinx.musca@intel.com> wrote:
>
>> On 02/05/2013 01:50 AM, Peter Seebach wrote:
>>> On Mon, 4 Feb 2013 23:37:59 +0000
>>> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>>>
>>>> Agreed. Can someone send me a patch which makes it all work
>>>> please? :)
>>> I probably can. I think the 1.4.3 patch I sent out recently (sgw was
>>> looking at it, but the binaries weren't up on the downloads server
>>> yet) probably covers most of it, but not the case where
>>> sqlite-libdir isn't lib, which is probably (??) a target-only case.
>>>
>>> Can someone show me a test case where it fails, so I can add that
>>> to my pile of pseudo test cases, and then stare at it for a while?
>>>
>>> -s
>> Here's a test case:
>>       1. local.conf:
>>           MACHINE = "qemux86-64"
>>           require conf/multilib.conf
>>           MULTILIBS = "multilib:lib32"
>>           DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>>
>>       2. build pseudo
>
> *pulls off mask, revealing he was the pseudo maintainer all along*
>
> And I would have gotten away with it, too, if it hadn't been for you
> meddling multilibs!
>
> Okay, got a tentative fix for this in my tree, will probably resend my
> pseudo 1.4.3 patch with this changed, once it makes it through my
> ever-growing collection of pseudo tests.
>
> The guts of the change:
>
> [...]
> +SQLITE_LIB = "${baselib}"
> +SQLITE_LIB_native = "lib"
> +
Do you really mean _class-native here?

Sau!


>   # Compile for the local machine arch...
>   do_compile () {
>          if [ "${SITEINFO_BITS}" = "64" ]; then
> -         ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
> +         ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite-lib=${SQLITE_LIB} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --cflags="${CFLAGS}" --bits=${SITEINFO_BITS} --enable-static-sqlite --without-rpath
>          else
>
> This appears to be working for all the cases I've tried.
>
> -s
>


