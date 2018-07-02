Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7AA78542
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 09:46:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w629k7Cj012095
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Jul 2018 02:46:07 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 2 Jul 2018 02:46:07 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20180702011534.4676-1-kai.kang@windriver.com>
	<CAMKF1sqcV=tq1XMSktRNuvTJeEX4sYd=4yBfP8JhukPtqo1pTA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <dba93e8e-abcb-3f83-1749-07a41da95214@windriver.com>
Date: Mon, 2 Jul 2018 17:45:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqcV=tq1XMSktRNuvTJeEX4sYd=4yBfP8JhukPtqo1pTA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: 2.20.2 -> 2.20.3
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
X-List-Received-Date: Mon, 02 Jul 2018 09:46:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年07月02日 14:06, Khem Raj wrote:
> On Sun, Jul 1, 2018 at 6:49 PM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Upgrade webkitgtk from 2.20.2 to 2.20.3.
>> * update context of 0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
>> * remove detect-atomics-during-configure.patch that webkitgtk 2.20.3
>>    contains the commit of better solution, see
>>    https://bugs.webkit.org/show_bug.cgi?id=161900#c9
> If you build it with clang on qemux86 then we can verify if the
> alternative fix is functional
> for the original intent of this patch that we are dropping here.
Hi Khem,

I tried with clang and built webkitgtk pass.

1. clone layer meta-clang https://github.com/kraj/meta-clang.git and add 
to bblayers
2. set TOOLCHAIN = "clang" for webkitgtk
3. bitbake webkitgtk successfully.

Regards,
Kai

>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   ...acros-Append-to-I-and-not-to-isystem.patch | 12 +++---
>>   .../detect-atomics-during-configure.patch     | 43 -------------------
>>   ...ebkitgtk_2.20.2.bb => webkitgtk_2.20.3.bb} |  5 +--
>>   3 files changed, 8 insertions(+), 52 deletions(-)
>>   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
>>   rename meta/recipes-sato/webkit/{webkitgtk_2.20.2.bb => webkitgtk_2.20.3.bb} (96%)
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
>> index 034219f826..b31026448c 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
>> +++ b/meta/recipes-sato/webkit/webkitgtk/0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch
>> @@ -41,18 +41,18 @@ index b3c7e0b..88446de 100644
>>    target_link_libraries(jsc ${JSC_LIBRARIES})
>>
>>   diff --git a/Source/WebCore/PlatformGTK.cmake b/Source/WebCore/PlatformGTK.cmake
>> -index 32c6ccc..fef5e8b 100644
>> +index f7d8d70a..3c27b8bc 100644
>>   --- a/Source/WebCore/PlatformGTK.cmake
>>   +++ b/Source/WebCore/PlatformGTK.cmake
>> -@@ -159,7 +159,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
>> -         ${GTK2_INCLUDE_DIRS}
>> -         ${GDK2_INCLUDE_DIRS}
>> +@@ -157,7 +157,7 @@ if (ENABLE_PLUGIN_PROCESS_GTK2)
>> +     target_include_directories(WebCorePlatformGTK2 PRIVATE
>> +         ${WebCore_INCLUDE_DIRECTORIES}
>>        )
>>   -    target_include_directories(WebCorePlatformGTK2 SYSTEM PRIVATE
>>   +    target_include_directories(WebCorePlatformGTK2 PRIVATE
>>            ${WebCore_SYSTEM_INCLUDE_DIRECTORIES}
>> -     )
>> -     target_link_libraries(WebCorePlatformGTK2
>> +         ${GTK2_INCLUDE_DIRS}
>> +         ${GDK2_INCLUDE_DIRS}
>>   @@ -183,7 +183,7 @@ add_dependencies(WebCorePlatformGTK WebCore)
>>    target_include_directories(WebCorePlatformGTK PRIVATE
>>        ${WebCore_INCLUDE_DIRECTORIES}
>> diff --git a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch b/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
>> deleted file mode 100644
>> index bbdb64490a..0000000000
>> --- a/meta/recipes-sato/webkit/webkitgtk/detect-atomics-during-configure.patch
>> +++ /dev/null
>> @@ -1,43 +0,0 @@
>> -From d907ac649ff5514826af9ad7e97e15dfcf79909c Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 17 May 2017 22:34:24 -0700
>> -Subject: [PATCH] webkitgtk: Fix build for armv5
>> -
>> -Taken from
>> -https://bugs.webkit.org/show_bug.cgi?id=161900
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> -
>> ----
>> - Source/WTF/wtf/CMakeLists.txt | 10 +++++++++-
>> - 1 file changed, 9 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/Source/WTF/wtf/CMakeLists.txt b/Source/WTF/wtf/CMakeLists.txt
>> -index 220bafd..4e1e9f8 100644
>> ---- a/Source/WTF/wtf/CMakeLists.txt
>> -+++ b/Source/WTF/wtf/CMakeLists.txt
>> -@@ -315,7 +315,6 @@ set(WTF_HEADERS
>> -
>> - set(WTF_SOURCES
>> -     Assertions.cpp
>> --    Atomics.cpp
>> -     AutomaticThread.cpp
>> -     BitVector.cpp
>> -     CPUTime.cpp
>> -@@ -458,6 +457,15 @@ if (NOT USE_SYSTEM_MALLOC)
>> -     list(APPEND WTF_LIBRARIES bmalloc)
>> - endif ()
>> -
>> -+file(WRITE ${CMAKE_BINARY_DIR}/test_atomics.cpp
>> -+     "int main(void)\n"
>> -+     "{ long long x = 1; return (int) __sync_add_and_fetch_8(&x, 1); }\n")
>> -+try_compile(ATOMICS_BUILD_SUCCEEDED ${CMAKE_BINARY_DIR} ${CMAKE_BINARY_DIR}/test_atomics.cpp)
>> -+if (NOT ATOMICS_BUILD_SUCCEEDED)
>> -+    list(APPEND WTF_SOURCES Atomics.cpp)
>> -+endif ()
>> -+file(REMOVE ${CMAKE_BINARY_DIR}/test_atomics.cpp)
>> -+
>> - list(APPEND WTF_SOURCES
>> -     unicode/CollatorDefault.cpp
>> -
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
>> similarity index 96%
>> rename from meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
>> rename to meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
>> index a68a69f43c..9d0f00a6d6 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.20.2.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.20.3.bb
>> @@ -17,15 +17,14 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>>              file://0001-Tweak-gtkdoc-settings-so-that-gtkdoc-generation-work.patch \
>>              file://x32_support.patch \
>>              file://cross-compile.patch \
>> -           file://detect-atomics-during-configure.patch \
>>              file://0001-WebKitMacros-Append-to-I-and-not-to-isystem.patch \
>>              file://0001-Fix-build-with-musl.patch \
>>              file://detect-gstreamer-gl.patch \
>>              file://0012-soup-Forward-declare-URL-class.patch \
>>              "
>>
>> -SRC_URI[md5sum] = "3fdda40dc10eb2a00d5fba4219b83967"
>> -SRC_URI[sha256sum] = "dffe93a241f03f1c73b369f4e323e4d8f12e39d33d5515948cbf454ca4b526e2"
>> +SRC_URI[md5sum] = "efb69a0cc3cc67ef2647efec22e44c69"
>> +SRC_URI[sha256sum] = "579b307d78fa16a73f112790178022166d7ad17d4147492ced9b9fba48f20dd8"
>>
>>   inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
>>
>> --
>> 2.17.1
>>

-- 
Regards,
Neil | Kai Kang


