Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id B07DD7EFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 02:51:06 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id C298B220232;
	Thu, 11 Jul 2019 14:51:05 +1200 (NZST)
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
	<1543494097-19534-4-git-send-email-mikko.rapeli@bmw.de>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <bb5aeb0e-14b2-4304-3c95-e546159792ed@taitradio.com>
Date: Thu, 11 Jul 2019 14:51:05 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1543494097-19534-4-git-send-email-mikko.rapeli@bmw.de>
Subject: Re: [PATCH 3/5] cmake.bbclass: append includedir to implicit include dirs
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
X-List-Received-Date: Thu, 11 Jul 2019 02:51:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

This commit is having an unintended side-effect in the -native (and 
probably nativesdk) case.

In the target build, $includedir is normally /usr/include, 
fully-qualified. This path is already in CMake's list of implicit 
include directories, and we don't include any header files from the 
build PC's /usr/include in a target build in any case. This addition to 
CMAKE_C/CXX_IMPLICIT_INCLUDE_DIRECTORIES has no effect.

In the -native case, the $includedir is set to STAGING_INCDIR_NATIVE, 
but this path has already been added to the BUILD_CPPFLAGS as a system 
include directory, so there will already be no warnings for any header 
file in the STAGING_INCDIR_NATIVE.

There is a nasty side-effect in the -native case: CMake excludes headers 
in the CMAKE_C/CXX_IMPLICIT_INCLUDE_DIRECTORIES from its generated 
dependency files, meaning that a change in any library header file will 
not trigger a recompile of affected source files in the dependent CMake 
component. In out-of-tree builds this isn't a problem, as cmake.bbclass 
deletes the *entire* ${B} directory at configure time, but where this is 
not the case, the build breaks with any change in library headers.

I haven't examined the nativesdk case. The $includedir is set off to 
$SDKPATHNATIVE/usr/include, but this path is not added as a system 
include dir. The same problem will apply as in the -native case, that 
CMake will not generate dependencies for headers staged in the 
SDKPATHNATIVE.

Was nativesdk perhaps the intended case for this commit? Is there a 
better way to silence warnings in this case? Do we need to silence 
library header warnings at all? Should we instead add 
$SDKPATHNATIVE/usr/include as a system include dir via the 
BUILDSDK_CPPFLAGS?

I examined this problem using the Unix Makefiles generator. CMake 
appears to equally exclude these headers from the ninja *.o.d dependency 
files, though I haven't examined it closely.


On 30/11/18 1:21 AM, Mikko Rapeli wrote:

> From: Michael Ho <Michael.Ho@bmw.de>
>
> This resolves issues with paths being marked as system includes that
> differ from /usr/include but are considered implicit by the toolchain.
> This enables developers to add directories to system includes
> to supress compiler compiler warnings from them.
>
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> Cc: Pascal Bach <pascal.bach@siemens.com>
> ---
>   meta/classes/cmake.bbclass | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
> index fd40a98..485aea6 100644
> --- a/meta/classes/cmake.bbclass
> +++ b/meta/classes/cmake.bbclass
> @@ -108,6 +108,10 @@ list(APPEND CMAKE_MODULE_PATH "${STAGING_DATADIR}/cmake/Modules/")
>   # add for non /usr/lib libdir, e.g. /usr/lib64
>   set( CMAKE_LIBRARY_PATH ${libdir} ${base_libdir})
>   
> +# add include dir to implicit includes in case it differs from /usr/include
> +list(APPEND CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${includedir})
> +list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${includedir})
> +
>   EOF
>   }
>   



