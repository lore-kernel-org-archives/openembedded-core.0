Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd19416.kasserver.com (dd19416.kasserver.com [85.13.139.185])
	by mail.openembedded.org (Postfix) with ESMTP id D3BA16B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 09:46:13 +0000 (UTC)
Received: from [129.70.144.11] (hooge.TechFak.Uni-Bielefeld.DE [129.70.144.11])
	by dd19416.kasserver.com (Postfix) with ESMTPSA id 945861840EBE;
	Thu, 18 Jul 2013 11:46:13 +0200 (CEST)
Message-ID: <51E7B962.4050108@herbrechtsmeier.net>
Date: Thu, 18 Jul 2013 11:46:10 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1374050422-5056-1-git-send-email-net147@gmail.com>
	<51E66038.8000109@herbrechtsmeier.net>
	<51E6689B.8060400@gmail.com> <51E678AF.2010001@gmail.com>
	<51E68A45.7090001@herbrechtsmeier.net>
	<CANwerB3M3p7q1iMHUcjdNdL68ozr0VDcDwor0afiSjZdx+24AQ@mail.gmail.com>
In-Reply-To: <CANwerB3M3p7q1iMHUcjdNdL68ozr0VDcDwor0afiSjZdx+24AQ@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: set ar/ld/nm/objcopy/objdump/ranlib/strip native paths
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
X-List-Received-Date: Thu, 18 Jul 2013 09:46:14 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 18.07.2013 02:47, schrieb Jonathan Liu:
> On 17 July 2013 22:12, Stefan Herbrechtsmeier
> <stefan@herbrechtsmeier.net> wrote:
>> Am 17.07.2013 12:57, schrieb Jonathan Liu:
>>
>>> On 17/07/2013 7:49 PM, Jonathan Liu wrote:
>>>> On 17/07/2013 7:13 PM, Stefan Herbrechtsmeier wrote:
>>>>> Am 17.07.2013 10:40, schrieb Jonathan Liu:
>>>>>> The CMAKE_{AR,LINKER,NM,OBJCOPY,OBJDUMP,RANLIB,STRIP} cmake variables
>>>>>> are currently set to values like CMAKE_LINKER-NOTFOUND for native
>>>>>> recipes because the host paths are not searched. This is because the
>>>>>> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM cmake variable is set to ONLY.
>>>>>>
>>>>>> To resolve this, explicitly set the variables using FIND_PROGRAM and
>>>>>> pass the CMAKE_FIND_ROOT_PATH_BOTH option so the host paths are also
>>>>>> searched.
>>>>> Can you please debug the issue. Regarding my current check the variables
>>>>> are set in CMakeFindBinUtils.cmake and this is included by
>>>>> CMakeDetermineCCompiler.cmake. The later set _CMAKE_TOOLCHAIN_LOCATION based
>>>>> on the CMAKE_C_COMPILER variable and this is used as search location for the
>>>>> find_program calls. Can you check the value of _CMAKE_TOOLCHAIN_LOCATION?
>>>>>
>>>> Within the context of the CMakeLists.txt file:
>>>> CMAKE_C_COMPILER is /usr/bin/gcc.
>>>> _CMAKE_TOOLCHAIN_LOCATION is not set to anything.
>>>>
>>>> If I add message(test) to
>>>> build/tmp/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/CMakeDetermineCCompiler.cmake,
>>>> it doesn't get printed out when running cmake on CMakeLists.txt (cmake is
>>>> build/tmp/sysroots/x86_64-linux/usr/bin/cmake).
>>>>
>>>> Regards,
>>>> Jonathan
>>> For:
>>> find_program(CMAKE_AR NAMES
>>> ${_CMAKE_TOOLCHAIN_PREFIX}ar${_CMAKE_TOOLCHAIN_SUFFIX} HINTS
>>> ${_CMAKE_TOOLCHAIN_LOCATION})
>>>
>>> It seems the ${_CMAKE_TOOLCHAIN_LOCATION} hint is not used when
>>> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM is set to ONLY.
>> You are right. The CMAKE_FIND_ROOT_PATH is used also as base for the HINTS
>> paths.
>>
>> You can use _CMAKE_TOOLCHAIN_LOCATION to pass NO_CMAKE_FIND_ROOT_PATH to the
>> find_program calls:
>> set(_CMAKE_TOOLCHAIN_LOCATION "" NO_CMAKE_FIND_ROOT_PATH)
>>
>> This should work but I am not sure if it is a good solution.
>>
> I prefer setting documented variables rather than hacking the
> undocumented _CMAKE_TOOLCHAIN_LOCATION variable to add the
> NO_CMAKE_FIND_ROOT_PATH flag for FIND_PROGRAM.
I think it is a issue in cmake and the _CMAKE_TOOLCHAIN_LOCATION don't 
work with CMAKE_FIND_ROOT_PATH_MODE_PROGRAM set to ONLY.
I have open an issue in cmake to get some feedback. The could patch all 
find_program calls in CMakeFindBinUtils.cmake modules:
-  find_program(CMAKE_AR NAMES 
${_CMAKE_TOOLCHAIN_PREFIX}ar${_CMAKE_TOOLCHAIN_SUFFIX} HINTS 
${_CMAKE_TOOLCHAIN_LOCATION})
+  find_program(CMAKE_AR NAMES 
${_CMAKE_TOOLCHAIN_PREFIX}ar${_CMAKE_TOOLCHAIN_SUFFIX} PATHS 
"${_CMAKE_TOOLCHAIN_LOCATION}" NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
+  find_program(CMAKE_AR NAMES 
${_CMAKE_TOOLCHAIN_PREFIX}ar${_CMAKE_TOOLCHAIN_SUFFIX})

Additionally there is a second issue as cmake fails to add the paths to 
the CMAKE_C*_COMPILER variables in CMakeDetermineC*Compiler modules and 
thereby couldn't set the _CMAKE_TOOLCHAIN_LOCATION. But this is a issue 
of oe as we should pass the full path of the compilers.


