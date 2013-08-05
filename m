Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 95AC86AF5C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 05:10:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2013 22:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,816,1367996400"; d="scan'208";a="357496856"
Received: from unknown (HELO [10.255.14.110]) ([10.255.14.110])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2013 22:10:06 -0700
Message-ID: <51FF33AE.20302@linux.intel.com>
Date: Sun, 04 Aug 2013 22:10:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F97628.9040801@linux.intel.com>
	<7705A938-20F6-4100-AB3A-99BDF5023118@gmail.com>
	<13A232F2-9B2C-427E-B5F0-26138984D099@gmail.com>
	<51F9948F.1000908@linux.intel.com>
	<08E217DF-FA59-4DAB-BB7F-0369A4BB3165@gmail.com>
	<51F99839.4020003@linux.intel.com>
	<FEC3604F-BE31-4146-AA6B-A16CB22C8D3F@gmail.com>
	<51FB3B2F.1060908@linux.intel.com>
	<45FADA31-8F4F-4BF7-A672-D083C3353813@gmail.com>
	<51FD840E.7000004@linux.intel.com>
In-Reply-To: <51FD840E.7000004@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Mon, 05 Aug 2013 05:10:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2013 03:28 PM, Saul Wold wrote:
> On 08/02/2013 12:27 AM, Khem Raj wrote:
>>
>> On Aug 1, 2013, at 9:53 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>>> On 08/01/2013 01:19 PM, Khem Raj wrote:
>>>>
>>>> On Jul 31, 2013, at 4:05 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>
>>>>> On 07/31/2013 03:51 PM, Khem Raj wrote:
>>>>>>
>>>>>> On Jul 31, 2013, at 3:49 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>>>
>>>>>>>
>>>>>>> Still seems to failing in Jinja, I wonder if the dependencies are
>>>>>>> correctly sinec it's nooking for native bits and the
>>>>>>> python3-native had not been installed yet.
>>>>>>>
>>>>>>>
>>>>>>
>>>>>> in my build from scratch several times, I never had this issue.
>>>>>> Did you do an incremental build to get to this issue ?
>>>>>>
>>>>>
>>>>> Yes, most of my builds are incremental until I throw them against
>>>>> the Autobuilder!
>>>>
>>>> Saul,
>>>>
>>>> I was able to reproduce the incremental build issue. I have now
>>>> fixed it and pushed a rebased branch to pull tree
>>>> in contrib. Please try it out
>>>>
>>>
>>> Almost there!  It looks like you have a ${PN} in the tarball name
>>> instead of ${BPN} and it's causing a multilib failure for zeromq.
>>
>> Yes. Pushed a fix on top of the branch plus another fix that I ran
>> into was missing dependency on virtual/libntl
>>
>>
> OK, Ran it on the Autobuilder last night, and came up with the following
> on a World build with multilib enabled:
>
>> ERROR: This autoconf log indicates errors, it looked at host include
>> and/or library paths while determining system capabilities.
>> Rerun configure task after fixing this. The path was
>> '/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.3.2-r0.0/Python-3.3.2'
>>
>> ERROR: Function failed: do_qa_configure
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/x86-pokymllib32-linux/lib32-python3/3.3.2-r0.0/temp/log.do_configure.13443
>>
>> NOTE: recipe lib32-python3-3.3.2-r0.0: task do_configure: Failed
>> ERROR: Task 11368
>> (virtual:multilib:lib32:/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/meta/recipes-devtools/python/python3_3.3.2.bb,
>> do_configure) failed with exit code '1'
>> NOTE: Running task 10412 of 21582 (ID: 12424,
>> virtual:multilib:lib32:/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/meta/recipes-connectivity/bluez/bluez-hcidump_2.5.bb,
>> do_packagedata)
>> NOTE: recipe lib32-quota-4.01-r1: task do_compile: Started
>> ERROR: This autoconf log indicates errors, it looked at host include
>> and/or library paths while determining system capabilities.
>> Rerun configure task after fixing this. The path was
>> '/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/python3/3.3.2-r0.0/Python-3.3.2'
>>
>> ERROR: Function failed: do_qa_configure
>> ERROR: Logfile of failure stored in:
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/build/tmp/work/i586-poky-linux/python3/3.3.2-r0.0/temp/log.do_configure.15796
>>
>> NOTE: recipe python3-3.3.2-r0.0: task do_configure: Failed
>> ERROR: Task 80
>> (/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/nightly-world/build/meta/recipes-devtools/python/python3_3.3.2.bb,
>> do_configure) failed with exit code '1'
>
> Summary of local.conf changes:
> DISTRO = "poky"
> PACKAGE_CLASSES = "package_rpm package_deb package_ipk"
> BB_NUMBER_THREADS = "16"
> PARALLEL_MAKE = "-j 16"
> SDKMACHINE ?= "x86_64"
> DL_DIR = "/srv/www/vhosts/autobuilder.yoctoproject.org/current_sources"
> require conf/multilib.conf
> MULTILIBS = "multilib:lib32"
> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
> SSTATE_DIR ?= "/srv/www/vhosts/sstate.yoctoproject.org//multilib"
> MACHINE = "qemux86"
> PREMIRRORS = ""
> BB_GENERATE_MIRROR_TARBALLS = "1"
> ADTREPO = "http://adtrepo.yoctoproject.org//1.4+snapshot"
>
>

Khem:

This are kind of killing my enthusiasm with python3

Another issue in jinja:

> RefactoringTool: There was 1 error:
> RefactoringTool: Can't parse ./ez_setup.py: ParseError: bad input: type=22, value='=', context=('', (54, 19))
> --- ./jinja/translators/python.py       (original)
> +++ ./jinja/translators/python.py       (refactored)

Sau!


> Sau!
>
>
>>
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

