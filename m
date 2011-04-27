Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QFDcZ-0001MJ-8V
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Apr 2011 00:54:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2011 15:51:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,277,1301900400"; d="scan'208";a="426722553"
Received: from unknown (HELO [10.255.13.18]) ([10.255.13.18])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 15:51:38 -0700
Message-ID: <4DB89DFA.2010303@linux.intel.com>
Date: Wed, 27 Apr 2011 15:51:38 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1303757256.git.raj.khem@gmail.com>	<4e4ad27e7940760928c4ed79ca0b1948912ac881.1303757256.git.raj.khem@gmail.com>	<4DB72173.4000902@linux.intel.com>	<BANLkTinACj_iaWW6bgz3_tCd73_9NnPJrg@mail.gmail.com>
	<BANLkTi=7023boON7yZ4GGssxWw4h_xFwUg@mail.gmail.com>
In-Reply-To: <BANLkTi=7023boON7yZ4GGssxWw4h_xFwUg@mail.gmail.com>
Subject: Re: [PATCH 01/17] gettext.bbclass: Use _append instead of	=+
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
X-List-Received-Date: Wed, 27 Apr 2011 22:54:12 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/26/2011 03:17 PM, Khem Raj wrote:
> On Tue, Apr 26, 2011 at 1:02 PM, Khem Raj<raj.khem@gmail.com>  wrote:
>> On Tue, Apr 26, 2011 at 12:48 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>>> On 04/25/2011 11:54 AM, Khem Raj wrote:
>>>>
>>>> Ensure gettext and gettext-native are removed from DEPENDS when
>>>> not using NLS
>>>>
>>>> Use append instead of += to get gettext dependecies processed
>>>> correctly in all cases
>>>>
>>>> Dont remove gettext-native for native recipes as ENABLE_NLS is
>>>> only for target and not for native recipes
>>>>
>>>> Replace using 1 for a boolean type with True
>>>>
>>>> Honor INHIBIT_DEFAULT_DEPS
>>>>
>>>> Remove the added dependencies for gettext if INHIBIT_DEFAULT_DEPS is non
>>>> null
>>>>
>>> Khem,
>>>
>>> This patch seems to be causing a circular dependency when you try to build
>>> meta-toolchain-sdk, not sure if you tested that target.
>>>
>>
>> No I did not. Let me try it out.

Khem,

There still seems to be a problem with binutil-cross-canadian and 
gcc-cross-canadian not finding the gettext-native, it suggests to have 
these recipe inherit gettext, which binutils does via it's .inc file, 
but gcc-cross-canadian did not seem to do.  I tried to add inherit 
gettext to the cross-canadian.bbclass but that did not solve the issue.

Currently the meta-toolchain gmae builds show this problem.

Thanks
	Sau!

>>
>>> % bitbake meta-toolchain-sdk -n
>>> NOTE: Out of date cache found, rebuilding...
>>> WARNING: No bb files matched BBFILE_PATTERN_yocto
>>> '^/intel/poky/distro/meta-yocto/'
>>> Parsing recipes: 100% |#########################################| Time:
>>> 00:00:15
>>> Parsing of 796 .bb files complete (0 cached, 796 parsed). 1008 targets, 6
>>> skipped, 0 masked, 0 errors.
>>>
>>> OE Build Configuration:
>>> BB_VERSION        = "1.11.0"
>>> METADATA_BRANCH   = "stage"
>>> METADATA_REVISION = "86f12953dbf57264cfcc06feac446f3edf0c6d8f"
>>> TARGET_ARCH       = "i586"
>>> TARGET_OS         = "linux"
>>> MACHINE           = "qemux86"
>>> DISTRO            = "poky-lsb"
>>> DISTRO_VERSION    = "1.0+snapshot-20110426"
>>> TARGET_FPU        = ""
>>>
>>> NOTE: Resolving any missing task queue dependencies
>>> NOTE: Preparing runqueue
>>> ERROR: Task
>>> virtual:nativesdk:/intel/poky/distro/meta/recipes-core/gettext/gettext_0.17.bb
>>> (do_package) has circular dependency on
>>> virtual:nativesdk:/intel/poky/distro/meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb
>>> (do_package)
>>>
>>> Is there dependencies on this patch with the other patches? (ie can I take
>>> part of your other patches or just hold off)?
>>>
>>
>> This patch is kind of needed for few of them for parsing sake.
>> some of them dont depend on this e.g.
>>
>> [PATCH 05/17] sstate.bbclass: Reduce SSTATE_MANIFESTS assignment to be weak
>> [PATCH 09/17] libiconv: update from 1.9.2 ->  1.11.1
>> [PATCH 12/17] elfutils_0.148.bb: Fix compilation issues on uclibc
>> [PATCH 13/17] perl_5.12.2.bb: Undefine features not found in uclibc
>> [PATCH 14/17] xorg-lib: inherit gettext class instead of adding
>> gettext to DEPENDS directly
>> [PATCH 15/17] attr: Fix compilation on uclibc
>> [PATCH 16/17] linux-tools.inc: Dummify do_compile_perf and
>> do_install_perf for uclibc
>
>
> Saul
>
> I have fixed this patch and pushed it to the pull tree. Can you pull fresh
> from the pull request tree and give it a shot ? Let me know how it goes
>
>>> Sau!
>>>
>>>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>> ---
>>>>   meta/classes/gettext.bbclass |   31 +++++++++++++++++++------------
>>>>   1 files changed, 19 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
>>>> index a40e74f..a6f80f2 100644
>>>> --- a/meta/classes/gettext.bbclass
>>>> +++ b/meta/classes/gettext.bbclass
>>>> @@ -1,17 +1,24 @@
>>>>   def gettext_after_parse(d):
>>>> -    # Remove the NLS bits if USE_NLS is no.
>>>> -    if bb.data.getVar('USE_NLS', d, 1) == 'no':
>>>> -        cfg = oe_filter_out('^--(dis|en)able-nls$',
>>>> bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
>>>> -        cfg += " --disable-nls"
>>>> -        depends = bb.data.getVar('DEPENDS', d, 1) or ""
>>>> -        bb.data.setVar('DEPENDS',
>>>> oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
>>>> -        bb.data.setVar('EXTRA_OECONF', cfg, d)
>>>> -
>>>> +   # Remove the NLS bits if USE_NLS is no.
>>>> +   if bb.data.getVar('USE_NLS', d, True) == 'no':
>>>> +       cfg = oe_filter_out('^--(dis|en)able-nls$',
>>>> bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
>>>> +       cfg += " --disable-nls"
>>>> +       depends = bb.data.getVar('DEPENDS', d, True) or ""
>>>> +       depends =
>>>> oe_filter_out('^(virtual/libiconv|virtual/libintl|virtual/gettext|gettext)$',
>>>> depends, d)
>>>> +       if not oe.utils.inherits(d, 'native', 'nativesdk', 'cross',
>>>> 'crosssdk'):
>>>> +           depends = oe_filter_out('^(gettext-native)$', depends, d)
>>>> +       bb.data.setVar('DEPENDS', depends, d)
>>>> +       bb.data.setVar('EXTRA_OECONF', cfg, d)
>>>> +   # check if INHIBIT_DEFAULT_DEPS is 1 then we forcibly remove
>>>> dependencies
>>>> +   # added by this class through DEPENDS_GETTEXT
>>>> +   if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True):
>>>> +       depends = bb.data.getVar('DEPENDS', d, True) or ""
>>>> +       gettext_deps = '^(' + bb.data.getVar('DEPENDS_GETTEXT', d, True) +
>>>> ')$'
>>>> +       depends = oe_filter_out(gettext_deps, depends, d)
>>>> +       bb.data.setVar('DEPENDS', depends, d)
>>>>   python () {
>>>>       gettext_after_parse(d)
>>>>   }
>>>> -
>>>> -DEPENDS_GETTEXT = "gettext gettext-native"
>>>> -
>>>> -DEPENDS =+ "${DEPENDS_GETTEXT}"
>>>>   EXTRA_OECONF += "--enable-nls"
>>>> +DEPENDS_GETTEXT ?= "virtual/gettext"
>>>> +DEPENDS_append = " ${DEPENDS_GETTEXT} "
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


