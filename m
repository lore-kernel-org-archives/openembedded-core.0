Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1R3VT0-00019O-W3
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 18:04:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8DFx0rw022656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Sep 2011 08:59:00 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 13 Sep 2011 08:58:59 -0700
Message-ID: <4E6F7DC2.4010000@windriver.com>
Date: Tue, 13 Sep 2011 10:58:58 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:6.0.2) Gecko/20110902 Thunderbird/6.0.2
MIME-Version: 1.0
To: "Xu, Dongxiao" <dongxiao.xu@intel.com>
References: <cover.1315815933.git.dongxiao.xu@intel.com>
	<85e223c8783eca48835226c2786e60b2c67e66df.1315815933.git.dongxiao.xu@intel.com>
	<4E6E1C8A.5060508@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D754AFF1@shsmsx501.ccr.corp.intel.com>
	<4E6F76C7.6050606@windriver.com>
	<D5AB6E638E5A3E4B8F4406B113A5A19A12D754B5B6@shsmsx501.ccr.corp.intel.com>
In-Reply-To: <D5AB6E638E5A3E4B8F4406B113A5A19A12D754B5B6@shsmsx501.ccr.corp.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] package_rpm: add architecture info in rpm spec file
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
X-List-Received-Date: Tue, 13 Sep 2011 16:04:11 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 9/13/11 10:41 AM, Xu, Dongxiao wrote:
> Hi Mark,
> 
>> -----Original Message-----
>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>> Sent: Tuesday, September 13, 2011 11:29 PM
>> To: Xu, Dongxiao
>> Cc: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 1/3] package_rpm: add architecture info in rpm
>> spec file
>>
>> On 9/12/11 9:24 PM, Xu, Dongxiao wrote:
>>> Hi Mark,
>>>
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>>> Of Mark Hatle
>>>> Sent: Monday, September 12, 2011 10:52 PM
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: Re: [OE-core] [PATCH 1/3] package_rpm: add architecture info
>>>> in rpm spec file
>>>>
>>>> This patch is incorrect.  Architectural information should not be in
>>>> the dependencies within RPM packages.
>>>>
>>>> RPM is expected to find the proper version of a package to install
>>>> based on the existing dependency information.  I'm in the process of
>>>> investigating why certain items are not found properly.
>>>
>>> Take "task-core-boot-1.0-r8.qemux86_64.rpm" as an example, and it has
>> dependency on tinylogin, how can it determine whether it is depends on "
>> tinylogin-1.4-r7.x86_64.rpm" or "tinylogin-1.4-r7.x86.rpm".
>>
>> In this case, it should not matter which one it uses.  If the dependency is on
>> "tinylogin", then either of them fulfills the dependency.  RPM should be
>> selecting which one to bring in using it's internal policy manager.  (I believe
>> the default is that 64-bit wins...)
> 
> I think it DOES matter on which one it uses. Thinking the case that if a user wants to build a pure 64 bit system, and if it could not correctly choose the 64 bit of tinylogin, then his system will be contaminated with 32bit programs/libraries. 

With the current way oe-core processes packages into images it uses the
dependencies.. so no matter what you have built you are only guaranteed that the
resulting image contains that final dependency and whatever is needed to make it
"work".  There is nothing that says (today) that you will get a pure 64-bit or
32-bit system -- other then as an artifact of only building 32-bit or 64-bit
software.

There are different strategies we can use to deal with these situations.

1) Resolve the "base" non-multilib system "first", then augment it with the
multilib components.  This results in a "base system" + alternative packages.

2) Resolve the system as whole, including multilibs, and use the policy
components to determine the "best match".  (best match may not be working right
today)  This results in a system based purely on dependency matches.

Either way, our current implementation doesn't quite match either of them.
We're closer to the second version of the implementation today....

If the base system approach is what we want, vs the pure dependency based
system, then we will need to change the way the dependencies are being resolved
and the ordering of the resolution in the packages_rpm.bbclass (or
rootfs_rpm.bbclass).  Basically:

*) take the list of dependencies and filter out any multilibs, and only scan
them against the base archs.

*) add to that resolution any multilib components that had been filtered out and
scan against the all archs.

....

*) install as we do today

--Mark

> Also during my testings, I found rpm will select the "wrong" version (x86 tinylogin).
> 
> Thanks,
> Dongxiao
> 
>>
>> For libraries where it does matter, the dependency system should already be
>> finding the correct architecture for the library.
>>
>> This does raise an issue in my mind though.  Is an architecture for "tasks"
>> justifiable?  Why isn't the task-core-boot an all or noarch package?
>>
>> Is there any difference between a task-core-boot and "lib32-task-core-boot"?
>>
>> Should we expect a difference between the two?
>>
>> --Mark
>>
>>> Thanks,
>>> Dongxiao
>>>
>>>>
>>>> --Mark
>>>>
>>>> On 9/12/11 3:33 AM, Dongxiao Xu wrote:
>>>>> For supporting multilib, architecture information is needed in
>>>>> package require/provide/suggest/recommend fields.
>>>>>
>>>>> Use DEFAULTTUNE value as the postfix.
>>>>>
>>>>> For "all" arch recipe, it requires "all" arch recipe with no
>>>>> postfix, but provides all possible multilib archs.
>>>>>
>>>>> For example, qemu-config:
>>>>>
>>>>> Requires: rsync
>>>>> Requires: update-rc.d
>>>>> Requires: task-core-nfs-server
>>>>> Requires: distcc
>>>>> Requires: oprofileui-server
>>>>> Requires: dbus-x11
>>>>> Requires: bash
>>>>> Provides: qemu-config.x86
>>>>> Provides: qemu-config.x86-64
>>>>>
>>>>> For other recipe like zlib:
>>>>>
>>>>> Requires: libc6.x86-64 >= 2.13
>>>>> Provides: zlib.x86-64
>>>>>
>>>>> [YOCTO #1457]
>>>>>
>>>>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>>>>> ---
>>>>>  meta/classes/multilib.bbclass    |    1 +
>>>>>  meta/classes/package_rpm.bbclass |   36
>>>> ++++++++++++++++++++++++++++++++++++
>>>>>  2 files changed, 37 insertions(+), 0 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes/multilib.bbclass
>>>>> b/meta/classes/multilib.bbclass index 583d76b..76c86b2 100644
>>>>> --- a/meta/classes/multilib.bbclass
>>>>> +++ b/meta/classes/multilib.bbclass
>>>>> @@ -23,6 +23,7 @@ python multilib_virtclass_handler () {
>>>>>      e.data.setVar("PN", variant + "-" + e.data.getVar("PN", False))
>>>>>      e.data.setVar("SHLIBSDIR_virtclass-multilib-" +
>>>> variant ,e.data.getVar("SHLIBSDIR", False) + "/" + variant)
>>>>>      e.data.setVar("TARGET_VENDOR_virtclass-multilib-" + variant,
>>>>> e.data.getVar("TARGET_VENDOR", False) + "ml" + variant)
>>>>> +    e.data.setVar("SAVED_DEFAULTTUNE",
>>>> e.data.getVar("DEFAULTTUNE",
>>>>> + True))
>>>>>      e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) +
>>>>> override)  }
>>>>>
>>>>> diff --git a/meta/classes/package_rpm.bbclass
>>>>> b/meta/classes/package_rpm.bbclass
>>>>> index 9ef1acd..ea0a079 100644
>>>>> --- a/meta/classes/package_rpm.bbclass
>>>>> +++ b/meta/classes/package_rpm.bbclass
>>>>> @@ -350,6 +350,7 @@ package_install_internal_rpm () {  python
>>>>> write_specfile () {
>>>>>  	import textwrap
>>>>>  	import oe.packagedata
>>>>> +	import re
>>>>>
>>>>>  	# We need a simple way to remove the MLPREFIX from the package
>> name,
>>>>>  	# and dependency information...
>>>>> @@ -498,6 +499,8 @@ python write_specfile () {
>>>>>
>>>>>  		splitname    = strip_multilib(pkgname, d)
>>>>>
>>>>> +		defaulttune = bb.data.getVar('DEFAULTTUNE', localdata, True)
>>>>> +
>>>>>  		splitsummary = (bb.data.getVar('SUMMARY', localdata, True) or
>>>> bb.data.getVar('DESCRIPTION', localdata, True) or ".")
>>>>>  		splitversion = (bb.data.getVar('PKGV', localdata, True) or
>>>> "").replace('-', '+')
>>>>>  		splitrelease = (bb.data.getVar('PKGR', localdata, True) or "")
>> @@
>>>>> -528,6 +531,39 @@ python write_specfile () {
>>>>>  		if pkg == d.getVar("PN", True):
>>>>>  			splitrprovides = splitrprovides + " " +
>>>>> (d.getVar('ALTERNATIVE_LINK', True) or '') + " " +
>>>>> (d.getVar('ALTERNATIVE_LINKS', True) or '')
>>>>>
>>>>> +		package_arch = bb.data.getVar('PACKAGE_ARCH', localdata,
>> True)
>>>>> +
>>>>> +		splitrprovides = splitrprovides + " " + splitname + "." +
>> defaulttune
>>>>> +		if package_arch != "all":
>>>>> +			pattern = '\([^()]*\)'
>>>>> +			prog = re.compile(pattern)
>>>>> +
>>>>> +			str_list = [splitrdepends, splitrrecommends, splitrsuggests]
>>>>> +			for e in range(len(str_list)):
>>>>> +				brackets = prog.findall(str_list[e])
>>>>> +				for i in range(len(brackets)):
>>>>> +					str_list[e] = str_list[e].replace(brackets[i],
>>>> "#BRACKETS"+str(i)+"#")
>>>>> +				tmp = ""
>>>>> +				for i in str_list[e].split():
>>>>> +					if i.startswith("#BRACKETS"):
>>>>> +						tmp += " " + str(i)
>>>>> +						continue
>>>>> +					tmp += " " + str(i) + "." + defaulttune
>>>>> +				str_list[e] = tmp
>>>>> +				for i in range(len(brackets)):
>>>>> +					str_list[e] =
>> str_list[e].replace("#BRACKETS"+str(i)+"#",
>>>>> +brackets[i])
>>>>> +
>>>>> +			[splitrdepends, splitrrecommends, splitrsuggests] = str_list
>>>>> +		else:
>>>>> +			variants = (bb.data.getVar("MULTILIB_VARIANTS",
>> localdata,
>>>> True) or "").split()
>>>>> +			for variant in variants:
>>>>> +				tune =
>> bb.data.getVar("DEFAULTTUNE_virtclass-multilib-" +
>>>> variant, localdata, True) or ""
>>>>> +				if tune:
>>>>> +					splitrprovides = splitrprovides + " " + splitname +
>> "." +
>>>> tune
>>>>> +			tune = bb.data.getVar("SAVED_DEFAULTTUNE", localdata,
>> True)
>>>> or ""
>>>>> +			if tune:
>>>>> +				splitrprovides = splitrprovides + " " + splitname + "." +
>> tune
>>>>> +
>>>>>  		# Gather special src/first package data
>>>>>  		if srcname == splitname:
>>>>>  			srcrdepends    = splitrdepends
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 



