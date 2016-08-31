Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id CF4FE6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 10:15:44 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 76so2638246uak.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HuwBaXpcr9lNlRu6dwu7bv5YTNmj3TOyC52cp++yrQE=;
	b=EawefNp/GQdSzjsISE7EaJk7LHjfbUo9fRAXbh6rdytMhzSBdt4W8lBJx7ZeUMIydM
	hVwxM2xZFYjTQqlf4IShB0HUcj3Q/5Eg46iZ+QvGM/YV7xPQ5AbrHBdJOMyaL58lxF3G
	p2D2prHPHnUE3Zr2uIKSaqexbt5TcJlF7CSGQ6hiGfH7aHgLcjdxNuuSHuL7jRHsJj/O
	VQCHMiPSkc40Aq94Mbd/uB3NkaGkLbasmOxsup44DPEVOe00X7eU/EJs9WXNK6FjomiE
	tYhEtQMHY9FVGxq6aEm/oRIsQjjGYkD9aB6tCiW+IfiLd3YB9RGOaUSrlzEfYNTe8WAf
	4dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HuwBaXpcr9lNlRu6dwu7bv5YTNmj3TOyC52cp++yrQE=;
	b=YQG2qZ5yP1GkwBsDKfiXmD74pkEyvChAoNd9paH5kezgrbnGPbAnXaUaWS5RmuUwNz
	FPcZaLtC7710F/J3lmM3m7okqD0gmOwCK3aNQwynpCYPcimJY/krgD+0MlMIosF24SXG
	p9e8eyrKKoB9vSQdszjwssICQNjlRyv5oyo0KmPZvGEYjonPMDZS6fTNF9vxLTwjVxs4
	amlOi9Lafo+yQMUkrKjED2Y1aSG9zdRdMOrATxkzV3NICJYMMp/h0tkZIooOtvH19gIM
	5IqQOLVaY4GNfa/5OtgcwSI1A1uRc16YGT4C++1pm76hi3g5e4O2SVj6YgF8UdrEZ5xU
	eMrA==
X-Gm-Message-State: AE9vXwNoExJpSHOEO+9vptm4f5FXom9cbc3vavZmiUDmT03yQ6vPde6rjHqSFSeym8RL1zMkg2+6AI1fLU6t9w==
X-Received: by 10.159.34.177 with SMTP id 46mr4994400uan.111.1472638545297;
	Wed, 31 Aug 2016 03:15:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 31 Aug 2016 03:15:44 -0700 (PDT)
In-Reply-To: <e6cfe9ed-fb20-7966-43b5-e8d7d8666470@embed.me.uk>
References: <1472577240-5378-1-git-send-email-schnitzeltony@googlemail.com>
	<e6cfe9ed-fb20-7966-43b5-e8d7d8666470@embed.me.uk>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 31 Aug 2016 12:15:44 +0200
Message-ID: <CALbNGRTyPiF+jk47Co9N83GCC_jJfYAcEyL8hcP+Jeo+VjzcjA@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 31 Aug 2016 10:15:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 31, 2016 at 11:25 AM, Jack Mitchell <ml@embed.me.uk> wrote:
> On 30/08/16 18:14, Andreas M=C3=BCller wrote:
>>
>> since gcc6 we see many cmake/c++ based packets failing with:
>>
>> | fatal error: stdlib.h: No such file or directory
>>
>> a fix from gcc is not to expect [1] so work around by replacing '-isyste=
m'
>> by
>> '-I' for c++.
>>
>> Build tested with many recipes in meta-qt5-extra / meta-oe inheriting
>> cmake.
>>
>> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70129
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> ---
>>  meta/recipes-devtools/cmake/cmake-native_3.6.1.bb  |  1 +
>>  .../0001-GNU.cmake-replace-isystem-by-I.patch      | 42
>> ++++++++++++++++++++++
>>  2 files changed, 43 insertions(+)
>>  create mode 100644
>> meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.pa=
tch
>>
>> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
>> b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
>> index 33930fb..900091e 100644
>> --- a/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
>> +++ b/meta/recipes-devtools/cmake/cmake-native_3.6.1.bb
>> @@ -6,6 +6,7 @@ DEPENDS +=3D "bzip2-native zlib-native"
>>
>>  SRC_URI +=3D "\
>>      file://cmlibarchive-disable-ext2fs.patch \
>> +    file://0001-GNU.cmake-replace-isystem-by-I.patch \
>>  "
>>
>>  # Disable ccmake since we don't depend on ncurses
>> diff --git
>> a/meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.=
patch
>> b/meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.=
patch
>> new file mode 100644
>> index 0000000..4c06490
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/cmake/cmake/0001-GNU.cmake-replace-isystem-by-I.=
patch
>> @@ -0,0 +1,42 @@
>> +From a84d20abe6bc68f8d1a597a22af1ca98d62a5ce4 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@google=
mail.com>
>> +Date: Fri, 26 Aug 2016 12:14:12 +0200
>> +Subject: [PATCH] GNU.cmake: replace -isystem by -I
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +since gcc6 we see many c++ based packes failing with:
>> +
>> +| fatal error: stdlib.h: No such file or directory
>> +
>> +a fix from gcc is not to expect [1] so work around
>> +
>> +[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D70129
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> +---
>> + Modules/Compiler/GNU.cmake | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/Modules/Compiler/GNU.cmake b/Modules/Compiler/GNU.cmake
>> +index c2d393d..9d1477d 100644
>> +--- a/Modules/Compiler/GNU.cmake
>> ++++ b/Modules/Compiler/GNU.cmake
>> +@@ -53,6 +53,10 @@ macro(__compiler_gnu lang)
>> +   set(CMAKE_${lang}_CREATE_PREPROCESSED_SOURCE "<CMAKE_${lang}_COMPILE=
R>
>> <DEFINES> <INCLUDES> <FLAGS> -E <SOURCE> > <PREPROCESSED_SOURCE>")
>> +   set(CMAKE_${lang}_CREATE_ASSEMBLY_SOURCE "<CMAKE_${lang}_COMPILER>
>> <DEFINES> <INCLUDES> <FLAGS> -S <SOURCE> -o <ASSEMBLY_SOURCE>")
>> +   if(NOT APPLE OR NOT CMAKE_${lang}_COMPILER_VERSION VERSION_LESS 4) #
>> work around #4462
>> +-    set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
>> ++    if("${lang}" STREQUAL "CXX")
>> ++      set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-I ")
>> ++    else()
>> ++      set(CMAKE_INCLUDE_SYSTEM_FLAG_${lang} "-isystem ")
>> ++    endif()
>> +   endif()
>> + endmacro()
>> +--
>> +2.5.5
>> +
>>
>
> Thanks for the patch Andreas, this fixes my build for now but as you
> mentioned is a bit of a hack to get round the issue. As this fixes my
> problem does it mean that it's not bitbake which is injecting the isystem=
,
> but instead a CMake recipe somewhere?
>
> Regards,
> Jack.
> --
I don't know your recipe but I think -isystem in bitbake.conf would
only cause trouble for native recipes.

As a heavy cmake-qt5 user (kde/lxqt/hawaii) I had many failing
cross-recipes not finding stdlib.h. After reading the gcc-bug I check
compile logs and they were full of -isystem on sysroot/usr/include -
had no idea where they came from.
First I grepped oe-core but did not find suspicious (e.g bitbake.conf
- see above). Then I grepped cmake sources and found GNU.cmake,
patched it to affect c++ only and my build errors were gone.

Andreas

