Return-Path: <stefan@herbrechtsmeier.net>
Received: from dd5638.kasserver.com (dd5638.kasserver.com [85.13.130.155])
	by mail.openembedded.org (Postfix) with ESMTP id E291775C54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jun 2015 10:35:32 +0000 (UTC)
Received: from [129.70.144.65] (astra.TechFak.Uni-Bielefeld.DE [129.70.144.65])
	by dd5638.kasserver.com (Postfix) with ESMTPSA id 312EC56012C4;
	Tue, 30 Jun 2015 12:35:32 +0200 (CEST)
To: openembedded-devel@lists.openembedded.org
References: <5591E548.8090706@gmail.com>
	<CAJTo0LbVgo+rn3rPPbj=ho-aDc6WuHTq83UcR8Y=HNAique81w@mail.gmail.com>
	<mmtpa9$67d$1@ger.gmane.org>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <55927020.3010605@herbrechtsmeier.net>
Date: Tue, 30 Jun 2015 12:32:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.0.1
MIME-Version: 1.0
In-Reply-To: <mmtpa9$67d$1@ger.gmane.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] cmake update broke mariadb
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
X-List-Received-Date: Tue, 30 Jun 2015 10:35:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Am 30.06.2015 um 11:59 schrieb Koen Kooi:
> Burton, Ross schreef op 30-06-15 om 11:44:
>> On 30 June 2015 at 01:39, akuster808 <akuster808@gmail.com> wrote:
>>
>>> eo-core commit f8661aa "cmake: Upgrade 2.8.12.2 -> 3.2.2" broke mariadb
>>> in meta-oe.
>>>
>>> DOes  the person who updated cmake need to fix this or the person who
>>> is feeling the pain will be fixing it ?
>>>
>> Depends on what the breakage is really.  Can you provide build logs?
> ERROR: Function failed: do_configure (log file is located at
> /build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.44-r0/temp/log.do_configure.25603)
> ERROR: Logfile of failure stored in:
> /build/linaro/build/build/tmp-glibc/work/x86_64-linux/mariadb-native/5.5.44-r0/temp/log.do_configure.25603
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | -- Running cmake version 3.2.2
> | -- The C compiler identification is GNU 4.8.3
> | -- The CXX compiler identification is GNU 4.8.3
> | CMake Error at CMakeLists.txt:86 (PROJECT):
> |   The CMAKE_C_COMPILER:
> |
> |     gcc
> |
> |   is not a full path and was not found in the PATH.
> |
> |   Tell CMake where to find the compiler by setting either the environment
> |   variable "CC" or the CMake cache entry CMAKE_C_COMPILER to the full path to
> |   the compiler, or to the compiler name if it is in the PATH.
> |
> |
> | CMake Error at CMakeLists.txt:86 (PROJECT):
> |   The CMAKE_CXX_COMPILER:
> |
> |     g++
> |
> |   is not a full path and was not found in the PATH.
> |
> |   Tell CMake where to find the compiler by setting either the environment
> |   variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the full path
> |   to the compiler, or to the compiler name if it is in the PATH.
> |
> |
> | -- Configuring incomplete, errors occurred!
The problem should be the usage of cmake for a native package.

The cmake.bbclass disables the host path and thereby CMake could not 
find the gcc binary.

I think the cmake.bbclass need to distinguish between cross and native 
build and set the following for native build:
set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM BOTH )
set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH )
set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )

This allows CMake to search the binaries, libraries and includes first 
in the CMAKE_FIND_ROOT_PATH, then in the CMAKE_SYSROOT and then in the 
non-rooted directories.


