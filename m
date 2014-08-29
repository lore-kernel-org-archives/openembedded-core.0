Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42D2B60169
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 01:42:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7T1gCf6020510
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 Aug 2014 18:42:12 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 28 Aug 2014 18:42:11 -0700
Message-ID: <53FFDA72.1090703@windriver.com>
Date: Thu, 28 Aug 2014 20:42:10 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <info@sd-kyber.com>, Khem Raj <raj.khem@gmail.com>
References: <D435FD3B-FAF6-4EA2-BADF-95F56CD6775F@sd-kyber.com>
	<53FB5549.3020504@windriver.com> <20140825154657.GA21358@haswell>
	<50009FD0-69EF-4A10-962A-5FE6D2428FE0@sd-kyber.com>
In-Reply-To: <50009FD0-69EF-4A10-962A-5FE6D2428FE0@sd-kyber.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [bitbake-devel] *-dbg package...
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
X-List-Received-Date: Fri, 29 Aug 2014 01:42:23 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 8/28/14, 8:27 PM, info@sd-kyber.com wrote:
> Thank you very much for the detailed answer(s) and comments.
>
> My next question would be for some advice where to find more information on
> topics like
>
> - default splitting policy (settings)
> - flags as INHIBIT_PACKAGE_DEBUG_SPLIT
> -  etc…

The best thing to do is ask questions on these topics, and then submit 
suggestions for the Yocto Project manual.

Much of this code predates the documentation, and is considered "advanced" 
topics.  We'd like to get them documented, but it's easy to forget various 
features exists.

> May be there is some ‘obvious logic’ in files splits, etc. which would make
> reading the code easily….
>
> So far, I tried to read the manuals, Yocto book… It looks like those papers are
> covering well the general ideas and strategies.
> But as they say - ‘ the devil is in details’,
> And so far, I have hard time to find info on such details…

Add a docs bug in the yocto project bugzilla, we want to start enhancing the 
manual with more advanced topics.

--Mark

> Once again, thanks for the kind attention to this matter.
> And my apology that I put the original message within the wrong list.
>
> Michael.
>
>
>
>> On Aug 25, 2014, at 11:46 AM, Khem Raj <raj.khem@gmail.com
>> <mailto:raj.khem@gmail.com>> wrote:
>>
>> On 14-08-25 10:24:57, Mark Hatle wrote:
>>> First this is the wrong list.  The question should have gone to oe-core
>>> devel, or openembedded-devel lists.  (I have CC'd the first)
>>>
>>> On 8/21/14, 9:59 PM,info@sd-kyber.com <mailto:info@sd-kyber.com>wrote:
>>>> Hi,
>>>> I’m trying to write ( and to use ) a recipe which should build a simple  .rpm,
>>>> which contains the /usr/lib/libaffinity.so and a  few header files within
>>>> /usr/include/affinity/* subdir.
>>
>> if you install it right then you should get one rpm with library another
>> one ${PN}-dev which should contain the headers and all debug info will
>> be split out into a rpm of its own ${PN}-dbg, this is standard
>> packaging strategy in OE.
>>
>>
>>>>
>>>> However, it looks like bitbake is trying / “forcing” me to  build a ${PN}-dbg
>>>> package….:
>>
>> Yes it will, is there any issue with that ?
>>
>>
>>>>
>>>> I’m doing the following steps:
>>>>
>>>> 1. recipe:
>>>> “
>>>> …
>>>> inherit  cmake pkgconfig
>>>>
>>>> PACKAGES = "${PN}"
>>
>> overriding PACKAGES will leave some unpackaged files.
>>
>>>> FILES_${PN} = "${libdir}/libaffinity.so /usr/include/affinity/*”
>>>> …
>>
>> I would suggest to use standard packaging split if thats not a big
>> issue.
>>
>>>> “
>>>
>>> Just removing '${PN}-dbg' does not inform the system that you do not want
>>> debug information to be generated.  There is a set of standard routines,
>>> performed after do_install, that will generate the debug information unless
>>> disabled.
>>>
>>> To disable the routines you set:
>>>
>>> INHIBIT_PACKAGE_DEBUG_SPLIT = '1'
>>> INHIBIT_PACKAGE_STRIP = '1'
>>>
>>> There are two settings they can be used separately, but in your case you
>>> likely want both.
>>>
>>> INHIBIT_PACKAGE_DEBUG_SPLIT = '1' disables the files in your package from
>>> being split into run-time and debug components.
>>>
>>> INHIBIT_PACKAGE_STRIP = '1' disabled the system from attempting to strip the
>>> run-time components of debug information.
>>>
>>> --Mark
>>>
>>>> So, I assume  I’ m asking to build only 1 package.
>>>>
>>>> 2. During the bitbake processing, as the compilation, build,  and installation
>>>> are over, the  files are copied into the ${D} directory, as expected:
>>>> “
>>>> michael@localhost image]$ pwd
>>>> /home/michael/Devlab/poky/build-atmel/tmp/work/cortexa5t2hf-vfp-poky-linux-gnueabi/affinityng/0.1-r0/image
>>>> [michael@localhost image]$ cd usr
>>>> [michael@localhost usr]$ ls -la
>>>> total 16
>>>> drwxr-xr-x. 4 michael michael 4096 Aug 21 19:57 .
>>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 ..
>>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 include
>>>> drwxr-xr-x. 2 michael michael 4096 Aug 21 19:57 lib
>>>> “
>>>> So far, everything as expected in accordance with the Yocto reference.
>>>>
>>>> 3. According to the manual reference  - "The |do_package| and
>>>> |do_packagedata| tasks combine to analyze the files found in the |D|
>>>> <http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#var-D>
>>>> directory…”,
>>>> I would expect that the package would be build.
>>>> However, the  attempt to build is failing. with the error:
>>>> “…
>>>> ERROR: QA Issue: affinityng: Files/directories were installed but not shipped
>>>>  /usr/src
>>>>  /usr/lib/.debug
>>>>  /usr/lib/.debug/libaffinity.so
>>>>  /usr/src/debug
>>>>  /usr/src/debug/affinityng
>>>>  /usr/src/debug/affinityng/0.1-r0
>>>>  /usr/src/debug/affinityng/0.1-r0/kernel
>>>> …
>>>> “
>>>>
>>>> 4. Following the reference, I checked the PKGD directory, where the files should
>>>> be before split….
>>>> And I noticed that there is the src directory there,  in addition to
>>>> directories — include and lib — the only ones I was expecting to see there.
>>>> ( see log below ) .
>>>>
>>>> “
>>>> /home/michael/Devlab/poky/build-atmel/tmp/work/cortexa5t2hf-vfp-poky-linux-gnueabi/affinityng/0.1-r0/package/usr
>>>> ….
>>>> [michael@localhost usr]$ ls -la
>>>> total 20
>>>> drwxr-xr-x. 5 michael michael 4096 Aug 21 19:57 .
>>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 ..
>>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 include
>>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 lib
>>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 src
>>>> [michael@localhost usr]$ pwd
>>>> /home/michael/Devlab/poky/build-atmel/tmp/work/cortexa5t2hf-vfp-poky-linux-gnueabi/affinityng/0.1-r0/package/usr
>>>> [michael@localhost usr]$ cd src
>>>> [michael@localhost src]$ ls -la
>>>> total 12
>>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 .
>>>> drwxr-xr-x. 5 michael michael 4096 Aug 21 19:57 ..
>>>> drwxr-xr-x. 3 michael michael 4096 Aug 21 19:57 debug
>>>> [michael@localhost src]$
>>>> “
>>>> 5. It looks like that as result of package split, the  include & lib directories
>>>> are used properly to build affinityng package, at least it is shown in
>>>> packages-split properly.
>>>> But then ,  the content of the src directory is causing the problem with QA.
>>>>
>>>> 6. At the same time, if I ask to build  ${PN}-dbg package in addition - both
>>>> packages are build, no QA complains, and all src/debug/* are going into the -dbg
>>>> package…
>>>>
>>>> I wonder,
>>>> - why does the src directory appear within  PKGD/usr? ( If there is no such
>>>> directory within the ${D} directory...)
>>>> - where is the definition for  -dbg package is coming from, and is it possible
>>>> to disable it?
>>>>
>>>> May be somebody have the answer or suggestion what to check next….
>>>>
>>>> Thanks for a kind attention to the matter.
>>>>
>>>> Have a great day,
>>>> Michael.
>>>>
>>>>
>>>>
>>>
>>> --
>>> _______________________________________________
>>> bitbake-devel mailing list
>>> bitbake-devel@lists.openembedded.org
>>> <mailto:bitbake-devel@lists.openembedded.org>
>>> http://lists.openembedded.org/mailman/listinfo/bitbake-devel
>> --
>> _______________________________________________
>> bitbake-devel mailing list
>> bitbake-devel@lists.openembedded.org <mailto:bitbake-devel@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/bitbake-devel
>


