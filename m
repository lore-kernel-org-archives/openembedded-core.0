Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id CB0C96014F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 09:25:35 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <1472577240-5378-1-git-send-email-schnitzeltony@googlemail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <e6cfe9ed-fb20-7966-43b5-e8d7d8666470@embed.me.uk>
Date: Wed, 31 Aug 2016 10:25:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472577240-5378-1-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [RFC][PATCH] cmake-native: work around gcc6's '-isystem'-allergy
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
X-List-Received-Date: Wed, 31 Aug 2016 09:25:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/08/16 18:14, Andreas Müller wrote:
> since gcc6 we see many cmake/c++ based packets failing with:
>
> | fatal error: stdlib.h: No such file or directory
>
> a fix from gcc is not to expect [1] so work around by replacing '-isystem' by
> '-I' for c++.
>
> Build tested with many recipes in meta-qt5-extra / meta-oe inheriting cmake.
>
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129
>
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ---
>  meta/recipes-devtools/cmake/cmake-native_3.6.1.bb  |  1 +
>  .../0001-GNU.cmake-replace-isystem-by-I.patch      | 42 ++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
>  create mode 100644 meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.patch
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
> index 33930fb..900091e 100644
> --- a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
> +++ b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
> @@ -6,6 +6,7 @@ DEPENDS += "bzip2-native zlib-native"
>
>  SRC_URI += "\
>      file://cmlibarchive-disable-ext2fs.patch \
> +    file://0001-GNU.cmake-replace-isystem-by-I.patch \
>  "
>
>  # Disable ccmake since we don't depend on ncurses
> diff --git a/meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.patch b/meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.patch
> new file mode 100644
> index 0000000..4c06490
> --- /dev/null
> +++ b/meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.patch
> @@ -0,0 +1,42 @@
> +From a84d20abe6bc68f8d1a597a22af1ca98d62a5ce4 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> +Date: Fri, 26 Aug 2016 12:14:12 +0200
> +Subject: [PATCH] GNU.cmake: replace -isystem by -I
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +since gcc6 we see many c++ based packes failing with:
> +
> +| fatal error: stdlib.h: No such file or directory
> +
> +a fix from gcc is not to expect [1] so work around
> +
> +[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=70129
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> +---
> + Modules/Compiler/GNU.cmake | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/Modules/Compiler/GNU.cmake b/Modules/Compiler/GNU.cmake
> +index c2d393d..9d1477d 100644
> +--- a/Modules/Compiler/GNU.cmake
> ++++ b/Modules/Compiler/GNU.cmake
> +@@ -53,6 +53,10 @@ macro(__compiler_gnu lang)
> +   set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
> +   set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE "<CMAKE_${lang}_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -S <SOURCE> -o <ASSEMBLY_SOURCE>")
> +   if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION VERSION_LESS 4) # work around #4462
> +-    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
> ++    if("${lang}" STREQUAL "CXX")
> ++      set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-I ")
> ++    else()
> ++      set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
> ++    endif()
> +   endif()
> + endmacro()
> +--
> +2.5.5
> +
>

Thanks for the patch Andreas, this fixes my build for now but as you 
mentioned is a bit of a hack to get round the issue. As this fixes my 
problem does it mean that it's not bitbake which is injecting the 
isystem, but instead a CMake recipe somewhere?

Regards,
Jack.

