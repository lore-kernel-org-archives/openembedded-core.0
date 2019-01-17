Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34D217C216
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 00:00:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0HNxQmu032187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jan 2019 15:59:36 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Thu, 17 Jan 2019 15:59:15 -0800
To: Douglas Royds <douglas.royds@taitradio.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20190116225154.12180-1-douglas.royds@taitradio.com>
	<b08ee857fa323713a81f69c756169807f62a2ba2.camel@linuxfoundation.org>
	<48037e45-c43c-ad6e-8b99-a4b797e601d8@taitradio.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <3aae69e3-a2e2-6c17-f808-33f89b002576@windriver.com>
Date: Thu, 17 Jan 2019 18:59:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <48037e45-c43c-ad6e-8b99-a4b797e601d8@taitradio.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] cmake.bbclass: make cleaning of build directory on configure optional
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
X-List-Received-Date: Fri, 18 Jan 2019 00:00:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 1/16/19 7:38 PM, Douglas Royds wrote:
> On 17/01/19 12:01 PM, Richard Purdie wrote:
> 
>> On Thu, 2019-01-17 at 11:51 +1300, Douglas Royds wrote:
>>> From: Sam Nobs <samuel.nobs@taitradio.com>
>>>
>>> The do_configure task is sensitive to changes in recipes and
>>> configuration files.
>>> This can be time consuming because cmake.bbclass deletes the ${B}
>>> directory
>>> at the beginning of the do_configure task. CMake figures
>>> out what to do when it's run again, so unless your cmake files are
>>> buggy, there shouldn't
>>> be any need to erase the build directory and start afresh.
>>>
>>> This change allows you to turn this behaviour off, either globally or
>>> on a per-recipe basis, e.g.
>>>
>>> OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE_pn-yourrecipe = ""
>>>
>>> Signed-off-by: Sam Nobs <samuel.nobs@taitradio.com>
>>> ---
>>>   meta/classes/cmake.bbclass | 23 ++++++++++++++++++-----
>>>   1 file changed, 18 insertions(+), 5 deletions(-)
>> This may give a speed boost for some cases but it does come at a
>> potential risk of determinism issues.
>>
>> I appreciate you've made it configurable but that actually further
>> concerns me as we now have two code paths which potentially both have
>> to be tested.
>>
>> Is this change really worth it?
>>
>> Cheers,
>>
>> Richard
> 
> 
> For us, the benefit is beyond question - on our proprietary C++ 
> component, the compile from scratch after a configure is punishing, 10s 
> of minutes per MACHINE.
> 
> We are counting on binary reproducibility to flush out any determinism 
> issues with the CMake code, that is, we will be comparing our 
> incremental builds with our clean builds. Note also that we are deleting 
> all the generated CMake artefacts, but leaving the object files behind. 
> CMake will force a complete rebuild should there be any change in the 
> CFLAGS and friends.

Douglas,

What workflow are you trying to optimize?

If you're strictly changing existing source files
then you shouldn't need to run configure again so I'm confused.

Also, have you tried using ccache as per:
    d014c8c11f cmake.bbclass: Make it work with ccache
and if so why doesn't that work for you?

Thanks,
../Randy

> 
> 
>>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>>> index fa7f68c99b..b9ec68ac9a 100644
>>> --- a/meta/classes/cmake.bbclass
>>> +++ b/meta/classes/cmake.bbclass
>>> @@ -63,6 +63,11 @@ EXTRA_OECMAKE_BUILD_prepend_task-install =
>>> "${PARALLEL_MAKEINST}"
>>>   OECMAKE_TARGET_COMPILE ?= "all"
>>>   OECMAKE_TARGET_INSTALL ?= "install"
>>> +# Clean the build directory before configuring.
>>> +# Some recipes don't want/need this as cmake is perfectly
>>> +# capable of figuring out what to do, so we allow it to be turned
>>> off
>>> +OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE ??= "true"
>>> +
>>>   # CMake expects target architectures in the format of uname(2),
>>>   # which do not always match TARGET_ARCH, so all the necessary
>>>   # conversions should happen here.
>>> @@ -133,12 +138,20 @@ cmake_do_configure() {
>>>           bbnote "cmake.bbclass no longer uses
>>> OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds
>>> with B=WORKDIR/build."
>>>       fi
>>> -    if [ "${S}" != "${B}" ]; then
>>> -        rm -rf ${B}
>>> -        mkdir -p ${B}
>>> -        cd ${B}
>>> +    if [ ${@oe.types.boolean('${OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE
>>> }')} = True ]; then
>>> +        if [ "${S}" != "${B}" ]; then
>>> +            rm -rf ${B}
>>> +            mkdir -p ${B}
>>> +            cd ${B}
>>> +        else
>>> +            # For an in-tree build, delete all object files
>>> and CMake artefacts
>>> +            find ${B} -name CMakeFiles -or -name Makefile
>>> -or -name cmake_install.cmake -or -name CMakeCache.txt -delete
>>> +        fi
>>>       else
>>> -        find ${B} -name CMakeFiles -or -name Makefile -or -name
>>> cmake_install.cmake -or -name CMakeCache.txt -delete
>>> +        # Selectively delete CMake artefacts to ensure that -c
>>> configure has a consistent result
>>> +        rm -f CMakeCache.txt
>>> +        cmake_version=$(cmake --version | head -1 | sed
>>> 's#^[^0-9]*\([0-9.]*\).*$#\1#' )
>>> +        rm -fr CMakeFiles/$cmake_version/
>>>       fi
>>>       # Just like autotools cmake can use a site file to cache result
>>> that need generated binaries to run
>>> -- 
>>> 2.17.1
>>>
> 


-- 
# Randy MacLeod
# Wind River Linux

