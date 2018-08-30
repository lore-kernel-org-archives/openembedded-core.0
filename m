Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3271B79006
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 07:54:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7U7s8jK018987
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Aug 2018 00:54:08 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 30 Aug 2018 00:54:07 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1535434045-243085-1-git-send-email-changqing.li@windriver.com>
	<CA+chaQe_aCKVNZnxJbpTibeBYnxTePVbFo=sTC2K=b_ZFYBpkg@mail.gmail.com>
	<b61b6426-93ce-8959-87ac-9bc57d6f7def@windriver.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <d1eff080-eb69-1d61-68cd-12d63457ba40@windriver.com>
Date: Thu, 30 Aug 2018 15:54:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <b61b6426-93ce-8959-87ac-9bc57d6f7def@windriver.com>
X-Originating-IP: [128.224.162.228]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libjpeg-turbo: Upgrade 1.5.3 -> 2.0.0
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
X-List-Received-Date: Thu, 30 Aug 2018 07:54:08 -0000
Content-Type: multipart/alternative;
	boundary="------------8F2935241C424096CC42B595"
Content-Language: en-US

--------------8F2935241C424096CC42B595
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 08/30/2018 12:37 PM, Changqing Li wrote:
>
>
>
> On 08/30/2018 07:47 AM, Martin Jansa wrote:
>> This change is breaking spice build and might break some other 
>> components as well.
>>
>> It was discussed in 2008 here:
>> https://bugzilla.redhat.com/show_bug.cgi?id=427616
>>
>> And now HAVE_STDLIB_H is here again with the upgrade from 1.5.3 to 2.0
>
> Thanks. I will try to fix this.
>
> //Sandy

Have send patch for fix this.

//Sandy

>
>> spice-native fails like this:
>> | In file included from ../../git/spice-common/common/mem.h:27:0, | 
>> from ../../git/spice-common/common/marshaller.h:25, | from 
>> ../../git/server/red-common.h:30, | from 
>> ../../git/server/jpeg-encoder.c:24: | ../config.h:65:0: error: 
>> "HAVE_STDLIB_H" redefined [-Werror] | #define HAVE_STDLIB_H 1 | | In 
>> file included 
>> fromx86_64-linux/spice-native/0.14.0+gitAUTOINC+f1050bfc76_95743f40a2-r0/recipe-sysroot-native/usr/include/jpeglib.h:29:0, 
>> | from ../../git/server/jpeg-encoder.c:22: 
>> |x86_64-linux/spice-native/0.14.0+gitAUTOINC+f1050bfc76_95743f40a2-r0/recipe-sysroot-native/usr/include/jconfig.h:42:0: 
>> note: this is the location of the previous definition | #define 
>> HAVE_STDLIB_H
>> It used to define it with 1 to match the rest of the world, here is 
>> the relevant part of jconfig.h diff between 1.5.3 and 2.0.0:
>> @@ -28,43 +33,37 @@
>>  #define BITS_IN_JSAMPLE  8      /* use 8 or 12 */
>>  /* Define to 1 if you have the <locale.h> header file. */
>> -#define HAVE_LOCALE_H 1
>> +#define HAVE_LOCALE_H
>>  /* Define to 1 if you have the <stddef.h> header file. */
>> -#define HAVE_STDDEF_H 1
>> +#define HAVE_STDDEF_H
>>  /* Define to 1 if you have the <stdlib.h> header file. */
>> -#define HAVE_STDLIB_H 1
>> +#define HAVE_STDLIB_H
>> +
>> +/* Define if you need to include <sys/types.h> to get size_t. */
>> +#define NEED_SYS_TYPES_H
>> +
>> Can you check why it was redefined like this and if we can change it 
>> back?
>>
>> On Tue, Aug 28, 2018 at 7:27 AM <changqing.li@windriver.com 
>> <mailto:changqing.li@windriver.com>> wrote:
>>
>>     From: Changqing Li <changqing.li@windriver.com
>>     <mailto:changqing.li@windriver.com>>
>>
>>     License-Update: Copyright Year Update
>>
>>     1. Upgrade from 1.5.3 -> 2.0.0, change from autools to cmake
>>     2. Add a patch for fix package qa error
>>     3. remove --with-build-date since 2.0.0 not support config build date
>>
>>     Signed-off-by: Changqing Li <changqing.li@windriver.com
>>     <mailto:changqing.li@windriver.com>>
>>     ---
>>      .../0001-libjpeg-turbo-fix-package_qa-error.patch  | 32
>>     ++++++++++++++++++++++
>>      ...bjpeg-turbo_1.5.3.bb <http://bjpeg-turbo_1.5.3.bb> =>
>>     libjpeg-turbo_2.0.0.bb <http://libjpeg-turbo_2.0.0.bb>} | 29
>>     ++++++++------------
>>      2 files changed, 43 insertions(+), 18 deletions(-)
>>      create mode 100644
>>     meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
>>      rename meta/recipes-graphics/jpeg/{libjpeg-turbo_1.5.3.bb
>>     <http://libjpeg-turbo_1.5.3.bb> => libjpeg-turbo_2.0.0.bb
>>     <http://libjpeg-turbo_2.0.0.bb>} (61%)
>>
>>     diff --git
>>     a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
>>     b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
>>     new file mode 100644
>>     index 0000000..44c2c76
>>     --- /dev/null
>>     +++
>>     b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
>>     @@ -0,0 +1,32 @@
>>     +From 0a24f03a67425a7b58b3fd40d965c0c9801ae7a1 Mon Sep 17
>>     00:00:00 2001
>>     +From: Changqing Li <changqing.li@windriver.com
>>     <mailto:changqing.li@windriver.com>>
>>     +Date: Mon, 27 Aug 2018 16:10:55 +0800
>>     +Subject: [PATCH] libjpeg-turbo: fix package_qa error
>>     +
>>     +Fix package qa errors like below:
>>     +libjpeg.so.62.3.0 contains probably-redundant RPATH /usr/lib
>>     [useless-rpaths]
>>     +usr/bin/cjpeg contains probably-redundant RPATH /usr/lib
>>     +
>>     +Upstream-Status: Inappropriate[oe-specific]
>>     +
>>     +Signed-off-by: Changqing Li <changqing.li@windriver.com
>>     <mailto:changqing.li@windriver.com>>
>>     +---
>>     + CMakeLists.txt | 2 --
>>     + 1 file changed, 2 deletions(-)
>>     +
>>     +diff --git a/CMakeLists.txt b/CMakeLists.txt
>>     +index 1719522..682cef1 100644
>>     +--- a/CMakeLists.txt
>>     ++++ b/CMakeLists.txt
>>     +@@ -109,8 +109,6 @@ endif()
>>     +
>>     + include(cmakescripts/GNUInstallDirs.cmake)
>>     +
>>     +-set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})
>>     +-
>>     + macro(report_directory var)
>>     +   if(CMAKE_INSTALL_${var} STREQUAL CMAKE_INSTALL_FULL_${var})
>>     +     message(STATUS "CMAKE_INSTALL_${var} =
>>     ${CMAKE_INSTALL_${var}}")
>>     +--
>>     +2.7.4
>>     +
>>     diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
>>     <http://libjpeg-turbo_1.5.3.bb>
>>     b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
>>     <http://libjpeg-turbo_2.0.0.bb>
>>     similarity index 61%
>>     rename from meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
>>     <http://libjpeg-turbo_1.5.3.bb>
>>     rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
>>     <http://libjpeg-turbo_2.0.0.bb>
>>     index 6be6aa5..7737a59 100644
>>     --- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
>>     <http://libjpeg-turbo_1.5.3.bb>
>>     +++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.0.bb
>>     <http://libjpeg-turbo_2.0.0.bb>
>>     @@ -4,16 +4,17 @@ HOMEPAGE = "http://libjpeg-turbo.org/"
>>
>>      LICENSE = "BSD-3-Clause"
>>      LIC_FILES_CHKSUM =
>>     "file://cdjpeg.h;endline=13;md5=8184bcc7c4ac7b9edc6a7bc00f231d0b \
>>     - file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72 \
>>     + file://jpeglib.h;endline=16;md5=7ea97dc83b0f59052ee837e61ef0e08f \
>>     file://djpeg.c;endline=11;md5=c59e19811c006cb38f82d6477134d314 \
>>      "
>>      DEPENDS_append_x86-64_class-target = " nasm-native"
>>      DEPENDS_append_x86_class-target    = " nasm-native"
>>
>>     -SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
>>     +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
>>     + file://0001-libjpeg-turbo-fix-package_qa-error.patch"
>>
>>     -SRC_URI[md5sum] = "7c82f0f6a3130ec06b8a4d0b321cbca3"
>>     -SRC_URI[sha256sum] =
>>     "b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d93d73ee6b592523"
>>     +SRC_URI[md5sum] = "b12a3fcf1d078db38410f27718a91b83"
>>     +SRC_URI[sha256sum] =
>>     "778876105d0d316203c928fd2a0374c8c01f755d0a00b12a1c8934aeccff8868"
>>      UPSTREAM_CHECK_URI =
>>     "http://sourceforge.net/projects/libjpeg-turbo/files/"
>>      UPSTREAM_CHECK_REGEX =
>>     "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
>>
>>     @@ -25,32 +26,24 @@ RPROVIDES_${PN} += "jpeg"
>>      RREPLACES_${PN} += "jpeg"
>>      RCONFLICTS_${PN} += "jpeg"
>>
>>     -inherit autotools pkgconfig
>>     +inherit cmake pkgconfig
>>
>>      # Add nasm-native dependency consistently for all build arches
>>     is hard
>>     -EXTRA_OECONF_append_class-native = " --without-simd"
>>     +EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
>>
>>      # Work around missing x32 ABI support
>>     -EXTRA_OECONF_append_class-target = "
>>     ${@bb.utils.contains("TUNE_FEATURES", "mx32", "--without-simd",
>>     "", d)}"
>>     +EXTRA_OECMAKE_append_class-target = "
>>     ${@bb.utils.contains("TUNE_FEATURES", "mx32",
>>     "-DWITH_SIMD=False", "", d)}"
>>
>>      # Work around missing non-floating point ABI support in MIPS
>>     -EXTRA_OECONF_append_class-target = "
>>     ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf", "--without-simd",
>>     "", d)}"
>>     +EXTRA_OECMAKE_append_class-target = "
>>     ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf",
>>     "-DWITH_SIMD=False", "", d)}"
>>
>>      # Provide a workaround if Altivec unit is not present in PPC
>>     -EXTRA_OECONF_append_class-target_powerpc = "
>>     ${@bb.utils.contains("TUNE_FEATURES", "altivec", "",
>>     "--without-simd", d)}"
>>     -EXTRA_OECONF_append_class-target_powerpc64 = "
>>     ${@bb.utils.contains("TUNE_FEATURES", "altivec", "",
>>     "--without-simd", d)}"
>>     +EXTRA_OECMAKE_append_class-target_powerpc = "
>>     ${@bb.utils.contains("TUNE_FEATURES", "altivec", "",
>>     "-DWITH_SIMD=False", d)}"
>>     +EXTRA_OECMAKE_append_class-target_powerpc64 = "
>>     ${@bb.utils.contains("TUNE_FEATURES", "altivec", "",
>>     "-DWITH_SIMD=False", d)}"
>>
>>      DEBUG_OPTIMIZATION_append_armv4 = "
>>     ${@bb.utils.contains('TUNE_CCARGS', '-mthumb',
>>     '-fomit-frame-pointer', '', d)}"
>>      DEBUG_OPTIMIZATION_append_armv5 = "
>>     ${@bb.utils.contains('TUNE_CCARGS', '-mthumb',
>>     '-fomit-frame-pointer', '', d)}"
>>
>>     -def get_build_time(d):
>>     -    if d.getVar('SOURCE_DATE_EPOCH') != None:
>>     -        import datetime
>>     -        return " --with-build-date="+
>>     datetime.datetime.utcfromtimestamp(float(d.getVar('SOURCE_DATE_EPOCH'))).strftime("%Y%m%d")
>>     -    return ""
>>     -
>>     -EXTRA_OECONF_append_class-target = "${@get_build_time(d)}"
>>     -
>>      PACKAGES =+ "jpeg-tools libturbojpeg"
>>
>>      DESCRIPTION_jpeg-tools = "The jpeg-tools package includes client
>>     programs to access libjpeg functionality.  These tools allow for
>>     the compression, decompression, transformation and display of
>>     JPEG files and benchmarking of the libjpeg library."
>>     -- 
>>     2.7.4
>>
>>     -- 
>>     _______________________________________________
>>     Openembedded-core mailing list
>>     Openembedded-core@lists.openembedded.org
>>     <mailto:Openembedded-core@lists.openembedded.org>
>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
> -- 
> BRs
>
> Sandy(Li Changqing)
> Wind River Linux
>
>

-- 
BRs

Sandy(Li Changqing)
Wind River Linux


--------------8F2935241C424096CC42B595
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 08/30/2018 12:37 PM, Changqing Li
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:b61b6426-93ce-8959-87ac-9bc57d6f7def@windriver.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <p><br>
      </p>
      <br>
      <div class="moz-cite-prefix">On 08/30/2018 07:47 AM, Martin Jansa
        wrote:<br>
      </div>
      <blockquote type="cite"
cite="mid:CA+chaQe_aCKVNZnxJbpTibeBYnxTePVbFo=sTC2K=b_ZFYBpkg@mail.gmail.com">
        <div dir="ltr">This change is breaking spice build and might
          break some other components as well.
          <div><br>
          </div>
          <div>It was discussed in 2008 here:</div>
          <div><a
              href="https://bugzilla.redhat.com/show_bug.cgi?id=427616"
              moz-do-not-send="true">https://bugzilla.redhat.com/show_bug.cgi?id=427616</a><br>
          </div>
          <div><br>
          </div>
          <div>And now <span style="color:rgb(0,0,0);white-space:pre-wrap">HAVE_STDLIB_H is here again with the upgrade from 1.5.3 to 2.0</span></div>
        </div>
      </blockquote>
      <br>
      Thanks. I will try to fix this.<br>
      <br>
      //Sandy<br>
    </blockquote>
    <br>
    Have send patch for fix this.<br>
    <br>
    //Sandy<br>
    <br>
    <blockquote type="cite"
      cite="mid:b61b6426-93ce-8959-87ac-9bc57d6f7def@windriver.com"> <br>
      <blockquote type="cite"
cite="mid:CA+chaQe_aCKVNZnxJbpTibeBYnxTePVbFo=sTC2K=b_ZFYBpkg@mail.gmail.com">
        <div dir="ltr">
          <div><span style="color:rgb(0,0,0);white-space:pre-wrap">
</span></div>
          <div><span style="color:rgb(0,0,0);white-space:pre-wrap">spice-native fails like this:</span></div>
          <div><font color="#000000"><span style="white-space:pre-wrap">| In file included from ../../git/spice-common/common/mem.h:27:0,                                                                                                            
|                  from ../../git/spice-common/common/marshaller.h:25,
|                  from ../../git/server/red-common.h:30,                                                                                                                    
|                  from ../../git/server/jpeg-encoder.c:24:
| ../config.h:65:0: error: "HAVE_STDLIB_H" redefined [-Werror]                                                                                                               
|  #define HAVE_STDLIB_H 1    
|                                                                                                                                                                            
| In file included fromx86_64-linux/spice-native/0.14.0+gitAUTOINC+f1050bfc76_95743f40a2-r0/recipe-sysroot-native/usr/include/jpeglib.h:29:0,                                                                                                                                                           
|                  from ../../git/server/jpeg-encoder.c:22:
|x86_64-linux/spice-native/0.14.0+gitAUTOINC+f1050bfc76_95743f40a2-r0/recipe-sysroot-native/usr/include/jconfig.h:42:0: note: this is the location of the previous definition
|  #define HAVE_STDLIB_H                               </span></font><br>
          </div>
          <div><font color="#000000"><span style="white-space:pre-wrap">
</span></font></div>
          <div><font color="#000000"><span style="white-space:pre-wrap">It used to define it with 1 to match the rest of the world, here is the relevant part of jconfig.h diff between 1.5.3 and 2.0.0:</span></font></div>
          <div><font color="#000000"><span style="white-space:pre-wrap">
</span></font></div>
          <div><font color="#000000">
              <div><span style="white-space:pre-wrap">@@ -28,43 +33,37 @@           </span></div>
              <div><span style="white-space:pre-wrap"> #define BITS_IN_JSAMPLE  8      /* use 8 or 12 */                                                                                                                           </span></div>
              <div><span style="white-space:pre-wrap">                              </span></div>
              <div><span style="white-space:pre-wrap"> /* Define to 1 if you have the &lt;locale.h&gt; header file. */                                                                                                                   </span></div>
              <div><span style="white-space:pre-wrap">-#define HAVE_LOCALE_H 1      </span></div>
              <div><span style="white-space:pre-wrap">+#define HAVE_LOCALE_H                                                                                                                                                       </span></div>
              <div><span style="white-space:pre-wrap">                              </span></div>
              <div><span style="white-space:pre-wrap"> /* Define to 1 if you have the &lt;stddef.h&gt; header file. */                                                                                                                   </span></div>
              <div><span style="white-space:pre-wrap">-#define HAVE_STDDEF_H 1      </span></div>
              <div><span style="white-space:pre-wrap">+#define HAVE_STDDEF_H                                                                                                                                                       </span></div>
              <div><span style="white-space:pre-wrap">                              </span></div>
              <div><span style="white-space:pre-wrap"> /* Define to 1 if you have the &lt;stdlib.h&gt; header file. */</span></div>
              <div><span style="white-space:pre-wrap">-#define HAVE_STDLIB_H 1</span></div>
              <div><span style="white-space:pre-wrap">+#define HAVE_STDLIB_H</span></div>
              <div><span style="white-space:pre-wrap">+</span></div>
              <div><span style="white-space:pre-wrap">+/* Define if you need to include &lt;sys/types.h&gt; to get size_t. */</span></div>
              <div><span style="white-space:pre-wrap">+#define NEED_SYS_TYPES_H</span></div>
              <div><span style="white-space:pre-wrap">+</span></div>
              <div style="white-space:pre-wrap">
</div>
              <div style="white-space:pre-wrap">Can you check why it was redefined like this and if we can change it back?</div>
            </font></div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr">On Tue, Aug 28, 2018 at 7:27 AM &lt;<a
              href="mailto:changqing.li@windriver.com"
              moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0 0 0
            .8ex;border-left:1px #ccc solid;padding-left:1ex">From:
            Changqing Li &lt;<a href="mailto:changqing.li@windriver.com"
              target="_blank" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
            <br>
            License-Update: Copyright Year Update<br>
            <br>
            1. Upgrade from 1.5.3 -&gt; 2.0.0, change from autools to
            cmake<br>
            2. Add a patch for fix package qa error<br>
            3. remove --with-build-date since 2.0.0 not support config
            build date<br>
            <br>
            Signed-off-by: Changqing Li &lt;<a
              href="mailto:changqing.li@windriver.com" target="_blank"
              moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
            ---<br>
             .../0001-libjpeg-turbo-fix-package_qa-error.patch  | 32
            ++++++++++++++++++++++<br>
             ...<a href="http://bjpeg-turbo_1.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">bjpeg-turbo_1.5.3.bb</a>
            =&gt; <a href="http://libjpeg-turbo_2.0.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">libjpeg-turbo_2.0.0.bb</a>}
            | 29 ++++++++------------<br>
             2 files changed, 43 insertions(+), 18 deletions(-)<br>
             create mode 100644
meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch<br>
             rename meta/recipes-graphics/jpeg/{<a
              href="http://libjpeg-turbo_1.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libjpeg-turbo_1.5.3.bb</a>
            =&gt; <a href="http://libjpeg-turbo_2.0.0.bb"
              rel="noreferrer" target="_blank" moz-do-not-send="true">libjpeg-turbo_2.0.0.bb</a>}
            (61%)<br>
            <br>
            diff --git
a/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch
b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch<br>
            new file mode 100644<br>
            index 0000000..44c2c76<br>
            --- /dev/null<br>
            +++
b/meta/recipes-graphics/jpeg/files/0001-libjpeg-turbo-fix-package_qa-error.patch<br>
            @@ -0,0 +1,32 @@<br>
            +From 0a24f03a67425a7b58b3fd40d965c0c9801ae7a1 Mon Sep 17
            00:00:00 2001<br>
            +From: Changqing Li &lt;<a
              href="mailto:changqing.li@windriver.com" target="_blank"
              moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
            +Date: Mon, 27 Aug 2018 16:10:55 +0800<br>
            +Subject: [PATCH] libjpeg-turbo: fix package_qa error<br>
            +<br>
            +Fix package qa errors like below:<br>
            +libjpeg.so.62.3.0 contains probably-redundant RPATH
            /usr/lib [useless-rpaths]<br>
            +usr/bin/cjpeg contains probably-redundant RPATH /usr/lib<br>
            +<br>
            +Upstream-Status: Inappropriate[oe-specific]<br>
            +<br>
            +Signed-off-by: Changqing Li &lt;<a
              href="mailto:changqing.li@windriver.com" target="_blank"
              moz-do-not-send="true">changqing.li@windriver.com</a>&gt;<br>
            +---<br>
            + CMakeLists.txt | 2 --<br>
            + 1 file changed, 2 deletions(-)<br>
            +<br>
            +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
            +index 1719522..682cef1 100644<br>
            +--- a/CMakeLists.txt<br>
            ++++ b/CMakeLists.txt<br>
            +@@ -109,8 +109,6 @@ endif()<br>
            + <br>
            + include(cmakescripts/GNUInstallDirs.cmake)<br>
            + <br>
            +-set(CMAKE_INSTALL_RPATH ${CMAKE_INSTALL_FULL_LIBDIR})<br>
            +-<br>
            + macro(report_directory var)<br>
            +   if(CMAKE_INSTALL_${var} STREQUAL
            CMAKE_INSTALL_FULL_${var})<br>
            +     message(STATUS "CMAKE_INSTALL_${var} =
            ${CMAKE_INSTALL_${var}}")<br>
            +-- <br>
            +2.7.4<br>
            +<br>
            diff --git a/meta/recipes-graphics/jpeg/<a
              href="http://libjpeg-turbo_1.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libjpeg-turbo_1.5.3.bb</a>
            b/meta/recipes-graphics/jpeg/<a
              href="http://libjpeg-turbo_2.0.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libjpeg-turbo_2.0.0.bb</a><br>
            similarity index 61%<br>
            rename from meta/recipes-graphics/jpeg/<a
              href="http://libjpeg-turbo_1.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libjpeg-turbo_1.5.3.bb</a><br>
            rename to meta/recipes-graphics/jpeg/<a
              href="http://libjpeg-turbo_2.0.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libjpeg-turbo_2.0.0.bb</a><br>
            index 6be6aa5..7737a59 100644<br>
            --- a/meta/recipes-graphics/jpeg/<a
              href="http://libjpeg-turbo_1.5.3.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libjpeg-turbo_1.5.3.bb</a><br>
            +++ b/meta/recipes-graphics/jpeg/<a
              href="http://libjpeg-turbo_2.0.0.bb" rel="noreferrer"
              target="_blank" moz-do-not-send="true">libjpeg-turbo_2.0.0.bb</a><br>
            @@ -4,16 +4,17 @@ HOMEPAGE = "<a
              href="http://libjpeg-turbo.org/" rel="noreferrer"
              target="_blank" moz-do-not-send="true">http://libjpeg-turbo.org/</a>"<br>
            <br>
             LICENSE = "BSD-3-Clause"<br>
             LIC_FILES_CHKSUM = "<a class="moz-txt-link-freetext"
              href="file://cdjpeg.h;endline=13;md5=8184bcc7c4ac7b9edc6a7bc00f231d0b"
              moz-do-not-send="true">file://cdjpeg.h;endline=13;md5=8184bcc7c4ac7b9edc6a7bc00f231d0b</a>
            \<br>
            -                    <a class="moz-txt-link-freetext"
              href="file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72"
              moz-do-not-send="true">file://jpeglib.h;endline=16;md5=f67d70e547a2662c079781c72f877f72</a>
            \<br>
            +                    <a class="moz-txt-link-freetext"
              href="file://jpeglib.h;endline=16;md5=7ea97dc83b0f59052ee837e61ef0e08f"
              moz-do-not-send="true">file://jpeglib.h;endline=16;md5=7ea97dc83b0f59052ee837e61ef0e08f</a>
            \<br>
                                 <a class="moz-txt-link-freetext"
              href="file://djpeg.c;endline=11;md5=c59e19811c006cb38f82d6477134d314"
              moz-do-not-send="true">file://djpeg.c;endline=11;md5=c59e19811c006cb38f82d6477134d314</a>
            \<br>
             "<br>
             DEPENDS_append_x86-64_class-target = " nasm-native"<br>
             DEPENDS_append_x86_class-target    = " nasm-native"<br>
            <br>
            -SRC_URI =
            "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"<br>
            +SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz
            \<br>
            +           <a class="moz-txt-link-freetext"
              href="file://0001-libjpeg-turbo-fix-package_qa-error.patch"
              moz-do-not-send="true">file://0001-libjpeg-turbo-fix-package_qa-error.patch</a>"<br>
            <br>
            -SRC_URI[md5sum] = "7c82f0f6a3130ec06b8a4d0b321cbca3"<br>
            -SRC_URI[sha256sum] =
            "b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d93d73ee6b592523"<br>
            +SRC_URI[md5sum] = "b12a3fcf1d078db38410f27718a91b83"<br>
            +SRC_URI[sha256sum] =
            "778876105d0d316203c928fd2a0374c8c01f755d0a00b12a1c8934aeccff8868"<br>
             UPSTREAM_CHECK_URI = "<a
              href="http://sourceforge.net/projects/libjpeg-turbo/files/"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://sourceforge.net/projects/libjpeg-turbo/files/</a>"<br>
             UPSTREAM_CHECK_REGEX =
            "/libjpeg-turbo/files/(?P&lt;pver&gt;(\d+[\.\-_]*)+)/"<br>
            <br>
            @@ -25,32 +26,24 @@ RPROVIDES_${PN} += "jpeg"<br>
             RREPLACES_${PN} += "jpeg"<br>
             RCONFLICTS_${PN} += "jpeg"<br>
            <br>
            -inherit autotools pkgconfig<br>
            +inherit cmake pkgconfig<br>
            <br>
             # Add nasm-native dependency consistently for all build
            arches is hard<br>
            -EXTRA_OECONF_append_class-native = " --without-simd"<br>
            +EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"<br>
            <br>
             # Work around missing x32 ABI support<br>
            -EXTRA_OECONF_append_class-target = "
            ${@bb.utils.contains("TUNE_FEATURES", "mx32",
            "--without-simd", "", d)}"<br>
            +EXTRA_OECMAKE_append_class-target = "
            ${@bb.utils.contains("TUNE_FEATURES", "mx32",
            "-DWITH_SIMD=False", "", d)}"<br>
            <br>
             # Work around missing non-floating point ABI support in
            MIPS<br>
            -EXTRA_OECONF_append_class-target = "
            ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf",
            "--without-simd", "", d)}"<br>
            +EXTRA_OECMAKE_append_class-target = "
            ${@bb.utils.contains("MIPSPKGSFX_FPU", "-nf",
            "-DWITH_SIMD=False", "", d)}"<br>
            <br>
             # Provide a workaround if Altivec unit is not present in
            PPC<br>
            -EXTRA_OECONF_append_class-target_powerpc = "
            ${@bb.utils.contains("TUNE_FEATURES", "altivec", "",
            "--without-simd", d)}"<br>
            -EXTRA_OECONF_append_class-target_powerpc64 = "
            ${@bb.utils.contains("TUNE_FEATURES", "altivec", "",
            "--without-simd", d)}"<br>
            +EXTRA_OECMAKE_append_class-target_powerpc = "
            ${@bb.utils.contains("TUNE_FEATURES", "altivec", "",
            "-DWITH_SIMD=False", d)}"<br>
            +EXTRA_OECMAKE_append_class-target_powerpc64 = "
            ${@bb.utils.contains("TUNE_FEATURES", "altivec", "",
            "-DWITH_SIMD=False", d)}"<br>
            <br>
             DEBUG_OPTIMIZATION_append_armv4 = "
            ${@bb.utils.contains('TUNE_CCARGS', '-mthumb',
            '-fomit-frame-pointer', '', d)}"<br>
             DEBUG_OPTIMIZATION_append_armv5 = "
            ${@bb.utils.contains('TUNE_CCARGS', '-mthumb',
            '-fomit-frame-pointer', '', d)}"<br>
            <br>
            -def get_build_time(d):<br>
            -    if d.getVar('SOURCE_DATE_EPOCH') != None:<br>
            -        import datetime<br>
            -        return " --with-build-date="+
datetime.datetime.utcfromtimestamp(float(d.getVar('SOURCE_DATE_EPOCH'))).strftime("%Y%m%d")<br>
            -    return ""<br>
            -<br>
            -EXTRA_OECONF_append_class-target = "${@get_build_time(d)}"<br>
            -<br>
             PACKAGES =+ "jpeg-tools libturbojpeg"<br>
            <br>
             DESCRIPTION_jpeg-tools = "The jpeg-tools package includes
            client programs to access libjpeg functionality.  These
            tools allow for the compression, decompression,
            transformation and display of JPEG files and benchmarking of
            the libjpeg library."<br>
            -- <br>
            2.7.4<br>
            <br>
            -- <br>
            _______________________________________________<br>
            Openembedded-core mailing list<br>
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
            <a
              href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
              rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
          </blockquote>
        </div>
      </blockquote>
      <br>
      <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
Wind River Linux</pre>
      <!--'"--><br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
BRs

Sandy(Li Changqing)
Wind River Linux</pre>
  </body>
</html>

--------------8F2935241C424096CC42B595--
