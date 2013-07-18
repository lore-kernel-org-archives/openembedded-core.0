Return-Path: <net147@gmail.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id A25E96B1B2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 00:47:35 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id da11so1989694veb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 17:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CQfuPjd0GtvMXx5ZmhzOv1OtbQiZk6NqNMEx7Zhg1fc=;
	b=EETfJ4Je87qwkkpk++W7hldGVfYJVe1TfqSBCnJf7txtqkXe9e70YpoC+K8DHBYX/h
	kaUEgC4ZelNV7qQ143flFgiyEwUELFfHMXlE2FA6UE2Wf2dFJTac0v7UN00HJwtPRDYI
	EHmojXyZAKTcBPysB5la7Yb6iG+ds9x44BdR5i+dcIz2HRdHa1HaUcMHp3+fONmPY6RZ
	YhFtpOImB2Ms7qaQal7rlVE4nnJntXFTr/Xn/6E370DmB7emPX0PlJs2QXS0a9Mo2qB0
	MzLQ/CkXbRqaZaeVp2dRB2jt0yzvT9FDMNWlaFtIhhz4RKXZIHawssbOBJo/gbmSO+rA
	cCmg==
MIME-Version: 1.0
X-Received: by 10.52.21.196 with SMTP id x4mr2538074vde.65.1374108455690; Wed,
	17 Jul 2013 17:47:35 -0700 (PDT)
Received: by 10.58.68.170 with HTTP; Wed, 17 Jul 2013 17:47:35 -0700 (PDT)
In-Reply-To: <51E68A45.7090001@herbrechtsmeier.net>
References: <1374050422-5056-1-git-send-email-net147@gmail.com>
	<51E66038.8000109@herbrechtsmeier.net> <51E6689B.8060400@gmail.com>
	<51E678AF.2010001@gmail.com> <51E68A45.7090001@herbrechtsmeier.net>
Date: Thu, 18 Jul 2013 10:47:35 +1000
Message-ID: <CANwerB3M3p7q1iMHUcjdNdL68ozr0VDcDwor0afiSjZdx+24AQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
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
X-List-Received-Date: Thu, 18 Jul 2013 00:47:35 -0000
Content-Type: text/plain; charset=UTF-8

On 17 July 2013 22:12, Stefan Herbrechtsmeier
<stefan@herbrechtsmeier.net> wrote:
> Am 17.07.2013 12:57, schrieb Jonathan Liu:
>
>> On 17/07/2013 7:49 PM, Jonathan Liu wrote:
>>>
>>> On 17/07/2013 7:13 PM, Stefan Herbrechtsmeier wrote:
>>>>
>>>> Am 17.07.2013 10:40, schrieb Jonathan Liu:
>>>>>
>>>>> The CMAKE_{AR,LINKER,NM,OBJCOPY,OBJDUMP,RANLIB,STRIP} cmake variables
>>>>> are currently set to values like CMAKE_LINKER-NOTFOUND for native
>>>>> recipes because the host paths are not searched. This is because the
>>>>> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM cmake variable is set to ONLY.
>>>>>
>>>>> To resolve this, explicitly set the variables using FIND_PROGRAM and
>>>>> pass the CMAKE_FIND_ROOT_PATH_BOTH option so the host paths are also
>>>>> searched.
>>>>
>>>> Can you please debug the issue. Regarding my current check the variables
>>>> are set in CMakeFindBinUtils.cmake and this is included by
>>>> CMakeDetermineCCompiler.cmake. The later set _CMAKE_TOOLCHAIN_LOCATION based
>>>> on the CMAKE_C_COMPILER variable and this is used as search location for the
>>>> find_program calls. Can you check the value of _CMAKE_TOOLCHAIN_LOCATION?
>>>>
>>> Within the context of the CMakeLists.txt file:
>>> CMAKE_C_COMPILER is /usr/bin/gcc.
>>> _CMAKE_TOOLCHAIN_LOCATION is not set to anything.
>>>
>>> If I add message(test) to
>>> build/tmp/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/CMakeDetermineCCompiler.cmake,
>>> it doesn't get printed out when running cmake on CMakeLists.txt (cmake is
>>> build/tmp/sysroots/x86_64-linux/usr/bin/cmake).
>>>
>>> Regards,
>>> Jonathan
>>
>> For:
>> find_program(CMAKE_AR NAMES
>> ${_CMAKE_TOOLCHAIN_PREFIX}ar${_CMAKE_TOOLCHAIN_SUFFIX} HINTS
>> ${_CMAKE_TOOLCHAIN_LOCATION})
>>
>> It seems the ${_CMAKE_TOOLCHAIN_LOCATION} hint is not used when
>> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM is set to ONLY.
>
> You are right. The CMAKE_FIND_ROOT_PATH is used also as base for the HINTS
> paths.
>
> You can use _CMAKE_TOOLCHAIN_LOCATION to pass NO_CMAKE_FIND_ROOT_PATH to the
> find_program calls:
> set(_CMAKE_TOOLCHAIN_LOCATION "" NO_CMAKE_FIND_ROOT_PATH)
>
> This should work but I am not sure if it is a good solution.
>

I prefer setting documented variables rather than hacking the
undocumented _CMAKE_TOOLCHAIN_LOCATION variable to add the
NO_CMAKE_FIND_ROOT_PATH flag for FIND_PROGRAM.

Regards,
Jonathan

