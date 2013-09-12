Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6C66C6B1E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 17:09:33 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2013 10:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,891,1371106800"; d="scan'208";a="294120436"
Received: from unknown (HELO [10.255.14.99]) ([10.255.14.99])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2013 10:09:31 -0700
Message-ID: <5231F548.6010801@linux.intel.com>
Date: Thu, 12 Sep 2013 10:09:28 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<522F9030.3020804@linux.intel.com>
	<CAFyqS9qRvPafVSt90BQe6F3Vaz8f0P2E2R4PLKh5Zz8JH8T6Vw@mail.gmail.com>
	<CAFyqS9rvPFr2F8+Tb1P0BLn84jJ0Q+cSCM-9pt8gOATquo4Gig@mail.gmail.com>
In-Reply-To: <CAFyqS9rvPFr2F8+Tb1P0BLn84jJ0Q+cSCM-9pt8gOATquo4Gig@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] libtool: fix resolve of lt_sysroot
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
X-List-Received-Date: Thu, 12 Sep 2013 17:09:59 -0000
X-Groupsio-MsgNum: 44891
Content-Type: multipart/mixed; boundary="------------050101090900090203070907"

--------------050101090900090203070907
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 09/11/2013 09:05 AM, Hans Beckérus wrote:
> On Wed, Sep 11, 2013 at 10:15 AM, Hans Beckérus <hans.beckerus@gmail.com> wrote:
>> On Tue, Sep 10, 2013 at 11:33 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>> On 09/10/2013 07:56 AM, hans.beckerus@gmail.com wrote:
>>>>
>>>> From: Hans Beckerus <hans.beckerus at gmail.com>
>>>>
>>>> This patch updates libtool.m4 (and its output) to resolve a problem
>>>> with variable 'lt_sysroot' not being properly updated if the option
>>>> '--with[-libtool]-sysroot' is not provided when running the 'configure'
>>>> script for a package.
>>>>
>>>> According to the help text ouput from 'configure':
>>>> --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>>>>                          (or the compiler's sysrooot if not specified).
>>>>
>>>> Due to swapped cases in a switch statement, when checking if the option
>>>> was specified or not, wrong actions were taken resulting in an
>>>> incorrect sysroot and failures to properly locate e.g. .la files.
>>>>
>>> What kind of testing have you done with this?  Have you tried a full world
>>> build?  This kind of change scares me a little as what issues we might have
>>> patched around or behavior built into software.
>>>
>> In the area of testing, it has been verified in my local environment,
>> which covers a few different ARM based images and SDK installs. I have
>> not done a build of all possible packages in my Yocto branch.
>>
>>> I just completed a world build locally and have failures in file-native
>>> guile-native, and gtk+3, not sure if we need to invalidate sstate, I am
>>> starting a clean build.
>>>
>> I have no issues with neither of those packages, at least not in
>> stand-alone builds.
>> Can you specify a little more exactly what goes wrong during the build stage?
>>
> Actually, someone else here hit a couple of packages that had  SDK
> build failures after applying the patch.
> In this case it was gettext-native and gnutls-native. After doing a
> 'cleanall' of those packages rebuild went fine.
> So, yes, sstate should probably be invalidated after a change like
> this since some packages does not seem to be rebuilt properly
> otherwise. Are they missing a DEPEND to libtool maybe?
>
No, these are from a clean build space with no sstate either, I wanted 
to verify that.

Also, anything that inherits autotools automagically gets a libtool 
dependency added, so we should not be adding that kind of dependency in 
recipes.

I have attached the 3 failures I saw for a completely clean build, note 
these are native tools: file-native, guile-native and apr-util-native.


Sau!

>> Thanks,
>> Hans
>>
>>> I have not dug too deeply into this yet.
>>>
>>> Sau!
>>>
>>>
>>>
>>>
>>>> For current upstream status see:
>>>> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>>>>
>>>> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>>> ---
>>>>    meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
>>>>    .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 35
>>>> ++++++++++++++++++++++
>>>>    2 files changed, 36 insertions(+)
>>>>    create mode 100644
>>>> meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>>
>>>> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>> b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>> index bb4ddf0..92e4949 100644
>>>> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>> @@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>>>>             file://respect-fstack-protector.patch \
>>>>               file://norm-rpath.patch \
>>>>               file://dont-depend-on-help2man.patch \
>>>> +           file://fix-resolve-lt-sysroot.patch \
>>>>              "
>>>>
>>>>    SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
>>>> diff --git
>>>> a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>> new file mode 100644
>>>> index 0000000..5a6335b
>>>> --- /dev/null
>>>> +++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>> @@ -0,0 +1,35 @@
>>>> +
>>>> +Upstream-Status: Pending
>>>> +
>>>> +This patch updates libtool.m4 (and its output) to resolve a problem
>>>> +with variable 'lt_sysroot' not being properly updated if the option
>>>> +'--with[-libtool]-sysroot' is not provided when running the 'configure'
>>>> +script for a package.
>>>> +
>>>> +I have also reported the problem to libtool here
>>>> +
>>>> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>>>> +
>>>> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>>> +---
>>>> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
>>>> libtool-2.4.2/libltdl/m4/libtool.m4
>>>> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4   2013-09-05
>>>> 10:37:24.690013000 +0200
>>>> ++++ libtool-2.4.2/libltdl/m4/libtool.m4        2013-09-05
>>>> 12:05:51.560281000 +0200
>>>> +@@ -1234,7 +1234,7 @@
>>>> + dnl in case the user passed a directory name.
>>>> + lt_sysroot=
>>>> + case ${with_libtool_sysroot} in #(
>>>> +- yes)
>>>> ++ no)
>>>> +    if test "$GCC" = yes; then
>>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>>> +    fi
>>>> +@@ -1242,7 +1242,7 @@
>>>> +  /*)
>>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>>> +    ;; #(
>>>> +- no|'')
>>>> ++ yes|'')
>>>> +    ;; #(
>>>> +  *)
>>>> +    AC_MSG_RESULT([${with_libtool_sysroot}])
>>>>
>>>
>
>

--------------050101090900090203070907
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile.28609"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile.28609"

DEBUG: Executing shell function do_compile
NOTE: make -j 16
make  all-recursive
make[1]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/build'
Making all in lib
make[2]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/build/lib'
rm -f alloca.h-t alloca.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  cat /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r=
0/guile-2.0.9/lib/alloca.in.h; \
	} > alloca.h-t && \
	mv -f alloca.h-t alloca.h
rm -f c++defs.h-t c++defs.h && \
	sed -n -e '/_GL_CXXDEFS/,$p' \
	  < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/=
guile-2.0.9/build-aux/snippet/c++defs.h \
	  > c++defs.h-t && \
	mv c++defs.h-t c++defs.h
rm -f warn-on-use.h-t warn-on-use.h && \
	sed -n -e '/^.ifndef/,$p' \
	  < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/=
guile-2.0.9/build-aux/snippet/warn-on-use.h \
	  > warn-on-use.h-t && \
	mv warn-on-use.h-t warn-on-use.h
rm -f arg-nonnull.h-t arg-nonnull.h && \
	sed -n -e '/GL_ARG_NONNULL/,$p' \
	  < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/=
guile-2.0.9/build-aux/snippet/arg-nonnull.h \
	  > arg-nonnull.h-t && \
	mv arg-nonnull.h-t arg-nonnull.h
rm -f configmake.h-t && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  echo '#define PREFIX "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/usr"'; \
	  echo '#define EXEC_PREFIX "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64=
-linux/usr"'; \
	  echo '#define BINDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/usr/bin"'; \
	  echo '#define SBINDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-lin=
ux/usr/sbin"'; \
	  echo '#define LIBEXECDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-=
linux/usr/lib/guile"'; \
	  echo '#define DATAROOTDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64=
-linux/usr/share"'; \
	  echo '#define DATADIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-lin=
ux/usr/share"'; \
	  echo '#define SYSCONFDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-=
linux/etc"'; \
	  echo '#define SHAREDSTATEDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86=
_64-linux/com"'; \
	  echo '#define LOCALSTATEDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/var"'; \
	  echo '#define INCLUDEDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-=
linux/usr/include"'; \
	  echo '#define OLDINCLUDEDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include"'; \
	  echo '#define DOCDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/usr/share/doc/guile"'; \
	  echo '#define INFODIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-lin=
ux/usr/share/info"'; \
	  echo '#define HTMLDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-lin=
ux/usr/share/doc/guile"'; \
	  echo '#define DVIDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/usr/share/doc/guile"'; \
	  echo '#define PDFDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/usr/share/doc/guile"'; \
	  echo '#define PSDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux=
/usr/share/doc/guile"'; \
	  echo '#define LIBDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/usr/lib"'; \
	  echo '#define LISPDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-lin=
ux/usr/share/emacs/site-lisp"'; \
	  echo '#define LOCALEDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/share/locale"'; \
	  echo '#define MANDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/usr/share/man"'; \
	  echo '#define MANEXT ""'; \
	  echo '#define PKGDATADIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-=
linux/usr/share/guile"'; \
	  echo '#define PKGINCLUDEDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include/guile"'; \
	  echo '#define PKGLIBDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/lib/guile"'; \
	  echo '#define PKGLIBEXECDIR "/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/lib/guile/guile"'; \
	} | sed '/""/d' > configmake.h-t && \
	mv -f configmake.h-t configmake.h
rm -f unused-parameter.h-t unused-parameter.h && \
	sed -n -e '/GL_UNUSED_PARAMETER/,$p' \
	  < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/=
guile-2.0.9/build-aux/snippet/unused-parameter.h \
	  > unused-parameter.h-t && \
	mv unused-parameter.h-t unused-parameter.h
/bin/mkdir -p sys
/bin/mkdir -p sys
rm -f sys/types.h-t sys/types.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_SYS_TYPES_H''@|<sys/types.h>|g' \
	      -e 's|@''WINDOWS_64_BIT_OFF_T''@|0|g' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/sys_types.in.h; \
	} > sys/types.h-t && \
	mv sys/types.h-t sys/types.h
rm -f wctype.h-t wctype.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's/@''HAVE_WCTYPE_H''@/1/g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_WCTYPE_H''@|<wctype.h>|g' \
	      -e 's/@''GNULIB_ISWBLANK''@/0/g' \
	      -e 's/@''GNULIB_WCTYPE''@/0/g' \
	      -e 's/@''GNULIB_ISWCTYPE''@/0/g' \
	      -e 's/@''GNULIB_WCTRANS''@/0/g' \
	      -e 's/@''GNULIB_TOWCTRANS''@/0/g' \
	      -e 's/@''HAVE_ISWBLANK''@/1/g' \
	      -e 's/@''HAVE_ISWCNTRL''@/1/g' \
	      -e 's/@''HAVE_WCTYPE_T''@/1/g' \
	      -e 's/@''HAVE_WCTRANS_T''@/1/g' \
	      -e 's/@''HAVE_WINT_T''@/1/g' \
	      -e 's/@''REPLACE_ISWBLANK''@/0/g' \
	      -e 's/@''REPLACE_ISWCNTRL''@/0/g' \
	      -e 's/@''REPLACE_TOWLOWER''@/0/g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/wctype.in.h; \
	} > wctype.h-t && \
	mv wctype.h-t wctype.h
rm -f sys/uio.h-t sys/uio.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_SYS_UIO_H''@|<sys/uio.h>|g' \
	      -e 's|@''HAVE_SYS_UIO_H''@|1|g' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/sys_uio.in.h; \
	} > sys/uio.h-t && \
	mv -f sys/uio.h-t sys/uio.h
/bin/mkdir -p arpa
rm -f dirent.h-t dirent.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''HAVE_DIRENT_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_DIRENT_H''@|<dirent.h>|g' \
	      -e 's/@''GNULIB_OPENDIR''@/0/g' \
	      -e 's/@''GNULIB_READDIR''@/0/g' \
	      -e 's/@''GNULIB_REWINDDIR''@/0/g' \
	      -e 's/@''GNULIB_CLOSEDIR''@/0/g' \
	      -e 's/@''GNULIB_DIRFD''@/1/g' \
	      -e 's/@''GNULIB_FDOPENDIR''@/0/g' \
	      -e 's/@''GNULIB_SCANDIR''@/0/g' \
	      -e 's/@''GNULIB_ALPHASORT''@/0/g' \
	      -e 's/@''HAVE_OPENDIR''@/1/g' \
	      -e 's/@''HAVE_READDIR''@/1/g' \
	      -e 's/@''HAVE_REWINDDIR''@/1/g' \
	      -e 's/@''HAVE_CLOSEDIR''@/1/g' \
	      -e 's|@''HAVE_DECL_DIRFD''@|1|g' \
	      -e 's|@''HAVE_DECL_FDOPENDIR''@|1|g' \
	      -e 's|@''HAVE_FDOPENDIR''@|1|g' \
	      -e 's|@''HAVE_SCANDIR''@|1|g' \
	      -e 's|@''HAVE_ALPHASORT''@|1|g' \
	      -e 's|@''REPLACE_OPENDIR''@|0|g' \
	      -e 's|@''REPLACE_CLOSEDIR''@|0|g' \
	      -e 's|@''REPLACE_DIRFD''@|0|g' \
	      -e 's|@''REPLACE_FDOPENDIR''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/dirent.in.h; \
	} > dirent.h-t && \
	mv dirent.h-t dirent.h
rm -f arpa/inet.h-t arpa/inet.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''HAVE_FEATURES_H''@|1|g' \
	      -e 's|@''NEXT_ARPA_INET_H''@|<arpa/inet.h>|g' \
	      -e 's|@''HAVE_ARPA_INET_H''@|1|g' \
	      -e 's/@''GNULIB_INET_NTOP''@/1/g' \
	      -e 's/@''GNULIB_INET_PTON''@/1/g' \
	      -e 's|@''HAVE_DECL_INET_NTOP''@|1|g' \
	      -e 's|@''HAVE_DECL_INET_PTON''@|1|g' \
	      -e 's|@''REPLACE_INET_NTOP''@|0|g' \
	      -e 's|@''REPLACE_INET_PTON''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/arpa_inet.in.h; \
	} > arpa/inet.h-t && \
	mv arpa/inet.h-t arpa/inet.h
rm -f fcntl.h-t fcntl.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_FCNTL_H''@|<fcntl.h>|g' \
	      -e 's/@''GNULIB_FCNTL''@/0/g' \
	      -e 's/@''GNULIB_NONBLOCKING''@/0/g' \
	      -e 's/@''GNULIB_OPEN''@/1/g' \
	      -e 's/@''GNULIB_OPENAT''@/0/g' \
	      -e 's|@''HAVE_FCNTL''@|1|g' \
	      -e 's|@''HAVE_OPENAT''@|1|g' \
	      -e 's|@''REPLACE_FCNTL''@|0|g' \
	      -e 's|@''REPLACE_OPEN''@|0|g' \
	      -e 's|@''REPLACE_OPENAT''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/fcntl.in.h; \
	} > fcntl.h-t && \
	mv fcntl.h-t fcntl.h
rm -f iconv.h-t iconv.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_ICONV_H''@|<iconv.h>|g' \
	      -e 's/@''GNULIB_ICONV''@/1/g' \
	      -e 's|@''ICONV_CONST''@||g' \
	      -e 's|@''REPLACE_ICONV''@|0|g' \
	      -e 's|@''REPLACE_ICONV_OPEN''@|0|g' \
	      -e 's|@''REPLACE_ICONV_UTF''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/iconv.in.h; \
	} > iconv.h-t && \
	mv iconv.h-t iconv.h
rm -f langinfo.h-t langinfo.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''HAVE_LANGINFO_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_LANGINFO_H''@|<langinfo.h>|g' \
	      -e 's/@''GNULIB_NL_LANGINFO''@/1/g' \
	      -e 's|@''HAVE_LANGINFO_CODESET''@|1|g' \
	      -e 's|@''HAVE_LANGINFO_T_FMT_AMPM''@|1|g' \
	      -e 's|@''HAVE_LANGINFO_ERA''@|1|g' \
	      -e 's|@''HAVE_LANGINFO_YESEXPR''@|1|g' \
	      -e 's|@''HAVE_NL_LANGINFO''@|1|g' \
	      -e 's|@''REPLACE_NL_LANGINFO''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/langinfo.in.h; \
	} > langinfo.h-t && \
	mv langinfo.h-t langinfo.h
rm -f locale.h-t locale.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_LOCALE_H''@|<locale.h>|g' \
	      -e 's/@''GNULIB_LOCALECONV''@/1/g' \
	      -e 's/@''GNULIB_SETLOCALE''@/0/g' \
	      -e 's/@''GNULIB_DUPLOCALE''@/1/g' \
	      -e 's|@''HAVE_DUPLOCALE''@|1|g' \
	      -e 's|@''HAVE_XLOCALE_H''@|1|g' \
	      -e 's|@''REPLACE_LOCALECONV''@|0|g' \
	      -e 's|@''REPLACE_SETLOCALE''@|0|g' \
	      -e 's|@''REPLACE_DUPLOCALE''@|0|g' \
	      -e 's|@''REPLACE_STRUCT_LCONV''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/locale.in.h; \
	} > locale.h-t && \
	mv locale.h-t locale.h
rm -f math.h-t math.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT_AS_FIRST_DIRECTIVE''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_AS_FIRST_DIRECTIVE_MATH_H''@|<math.h>|g' \
	      -e 's/@''GNULIB_ACOSF''@/0/g' \
	      -e 's/@''GNULIB_ACOSL''@/0/g' \
	      -e 's/@''GNULIB_ASINF''@/0/g' \
	      -e 's/@''GNULIB_ASINL''@/0/g' \
	      -e 's/@''GNULIB_ATANF''@/0/g' \
	      -e 's/@''GNULIB_ATANL''@/0/g' \
	      -e 's/@''GNULIB_ATAN2F''@/0/g' \
	      -e 's/@''GNULIB_CBRT''@/0/g' \
	      -e 's/@''GNULIB_CBRTF''@/0/g' \
	      -e 's/@''GNULIB_CBRTL''@/0/g' \
	      -e 's/@''GNULIB_CEIL''@/1/g' \
	      -e 's/@''GNULIB_CEILF''@/0/g' \
	      -e 's/@''GNULIB_CEILL''@/0/g' \
	      -e 's/@''GNULIB_COPYSIGN''@/0/g' \
	      -e 's/@''GNULIB_COPYSIGNF''@/0/g' \
	      -e 's/@''GNULIB_COPYSIGNL''@/0/g' \
	      -e 's/@''GNULIB_COSF''@/0/g' \
	      -e 's/@''GNULIB_COSL''@/0/g' \
	      -e 's/@''GNULIB_COSHF''@/0/g' \
	      -e 's/@''GNULIB_EXPF''@/0/g' \
	      -e 's/@''GNULIB_EXPL''@/0/g' \
	      -e 's/@''GNULIB_EXP2''@/0/g' \
	      -e 's/@''GNULIB_EXP2F''@/0/g' \
	      -e 's/@''GNULIB_EXP2L''@/0/g' \
	      -e 's/@''GNULIB_EXPM1''@/0/g' \
	      -e 's/@''GNULIB_EXPM1F''@/0/g' \
	      -e 's/@''GNULIB_EXPM1L''@/0/g' \
	      -e 's/@''GNULIB_FABSF''@/0/g' \
	      -e 's/@''GNULIB_FABSL''@/0/g' \
	      -e 's/@''GNULIB_FLOOR''@/1/g' \
	      -e 's/@''GNULIB_FLOORF''@/0/g' \
	      -e 's/@''GNULIB_FLOORL''@/0/g' \
	      -e 's/@''GNULIB_FMA''@/0/g' \
	      -e 's/@''GNULIB_FMAF''@/0/g' \
	      -e 's/@''GNULIB_FMAL''@/0/g' \
	      -e 's/@''GNULIB_FMOD''@/0/g' \
	      -e 's/@''GNULIB_FMODF''@/0/g' \
	      -e 's/@''GNULIB_FMODL''@/0/g' \
	      -e 's/@''GNULIB_FREXPF''@/0/g' \
	      -e 's/@''GNULIB_FREXP''@/1/g' \
	      -e 's/@''GNULIB_FREXPL''@/0/g' \
	      -e 's/@''GNULIB_HYPOT''@/0/g' \
	      -e 's/@''GNULIB_HYPOTF''@/0/g' \
	      -e 's/@''GNULIB_HYPOTL''@/0/g' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/math.in.h | \
	  sed -e 's/@''GNULIB_ILOGB''@/0/g' \
	      -e 's/@''GNULIB_ILOGBF''@/0/g' \
	      -e 's/@''GNULIB_ILOGBL''@/0/g' \
	      -e 's/@''GNULIB_ISFINITE''@/0/g' \
	      -e 's/@''GNULIB_ISINF''@/1/g' \
	      -e 's/@''GNULIB_ISNAN''@/1/g' \
	      -e 's/@''GNULIB_ISNANF''@/1/g' \
	      -e 's/@''GNULIB_ISNAND''@/1/g' \
	      -e 's/@''GNULIB_ISNANL''@/1/g' \
	      -e 's/@''GNULIB_LDEXPF''@/0/g' \
	      -e 's/@''GNULIB_LDEXPL''@/0/g' \
	      -e 's/@''GNULIB_LOG''@/1/g' \
	      -e 's/@''GNULIB_LOGF''@/0/g' \
	      -e 's/@''GNULIB_LOGL''@/0/g' \
	      -e 's/@''GNULIB_LOG10''@/0/g' \
	      -e 's/@''GNULIB_LOG10F''@/0/g' \
	      -e 's/@''GNULIB_LOG10L''@/0/g' \
	      -e 's/@''GNULIB_LOG1P''@/1/g' \
	      -e 's/@''GNULIB_LOG1PF''@/0/g' \
	      -e 's/@''GNULIB_LOG1PL''@/0/g' \
	      -e 's/@''GNULIB_LOG2''@/0/g' \
	      -e 's/@''GNULIB_LOG2F''@/0/g' \
	      -e 's/@''GNULIB_LOG2L''@/0/g' \
	      -e 's/@''GNULIB_LOGB''@/0/g' \
	      -e 's/@''GNULIB_LOGBF''@/0/g' \
	      -e 's/@''GNULIB_LOGBL''@/0/g' \
	      -e 's/@''GNULIB_MODF''@/0/g' \
	      -e 's/@''GNULIB_MODFF''@/0/g' \
	      -e 's/@''GNULIB_MODFL''@/0/g' \
	      -e 's/@''GNULIB_POWF''@/0/g' \
	      -e 's/@''GNULIB_REMAINDER''@/0/g' \
	      -e 's/@''GNULIB_REMAINDERF''@/0/g' \
	      -e 's/@''GNULIB_REMAINDERL''@/0/g' \
	      -e 's/@''GNULIB_RINT''@/0/g' \
	      -e 's/@''GNULIB_RINTF''@/0/g' \
	      -e 's/@''GNULIB_RINTL''@/0/g' \
	      -e 's/@''GNULIB_ROUND''@/1/g' \
	      -e 's/@''GNULIB_ROUNDF''@/0/g' \
	      -e 's/@''GNULIB_ROUNDL''@/0/g' \
	      -e 's/@''GNULIB_SIGNBIT''@/0/g' \
	      -e 's/@''GNULIB_SINF''@/0/g' \
	      -e 's/@''GNULIB_SINL''@/0/g' \
	      -e 's/@''GNULIB_SINHF''@/0/g' \
	      -e 's/@''GNULIB_SQRTF''@/0/g' \
	      -e 's/@''GNULIB_SQRTL''@/0/g' \
	      -e 's/@''GNULIB_TANF''@/0/g' \
	      -e 's/@''GNULIB_TANL''@/0/g' \
	      -e 's/@''GNULIB_TANHF''@/0/g' \
	      -e 's/@''GNULIB_TRUNC''@/1/g' \
	      -e 's/@''GNULIB_TRUNCF''@/0/g' \
	      -e 's/@''GNULIB_TRUNCL''@/0/g' \
	  | \
	  sed -e 's|@''HAVE_ACOSF''@|1|g' \
	      -e 's|@''HAVE_ACOSL''@|1|g' \
	      -e 's|@''HAVE_ASINF''@|1|g' \
	      -e 's|@''HAVE_ASINL''@|1|g' \
	      -e 's|@''HAVE_ATANF''@|1|g' \
	      -e 's|@''HAVE_ATANL''@|1|g' \
	      -e 's|@''HAVE_ATAN2F''@|1|g' \
	      -e 's|@''HAVE_CBRT''@|1|g' \
	      -e 's|@''HAVE_CBRTF''@|1|g' \
	      -e 's|@''HAVE_CBRTL''@|1|g' \
	      -e 's|@''HAVE_COPYSIGN''@|1|g' \
	      -e 's|@''HAVE_COPYSIGNL''@|1|g' \
	      -e 's|@''HAVE_COSF''@|1|g' \
	      -e 's|@''HAVE_COSL''@|1|g' \
	      -e 's|@''HAVE_COSHF''@|1|g' \
	      -e 's|@''HAVE_EXPF''@|1|g' \
	      -e 's|@''HAVE_EXPL''@|1|g' \
	      -e 's|@''HAVE_EXPM1''@|1|g' \
	      -e 's|@''HAVE_EXPM1F''@|1|g' \
	      -e 's|@''HAVE_FABSF''@|1|g' \
	      -e 's|@''HAVE_FABSL''@|1|g' \
	      -e 's|@''HAVE_FMA''@|1|g' \
	      -e 's|@''HAVE_FMAF''@|1|g' \
	      -e 's|@''HAVE_FMAL''@|1|g' \
	      -e 's|@''HAVE_FMODF''@|1|g' \
	      -e 's|@''HAVE_FMODL''@|1|g' \
	      -e 's|@''HAVE_FREXPF''@|1|g' \
	      -e 's|@''HAVE_HYPOTF''@|1|g' \
	      -e 's|@''HAVE_HYPOTL''@|1|g' \
	      -e 's|@''HAVE_ILOGB''@|1|g' \
	      -e 's|@''HAVE_ILOGBF''@|1|g' \
	      -e 's|@''HAVE_ILOGBL''@|1|g' \
	      -e 's|@''HAVE_ISNANF''@|1|g' \
	      -e 's|@''HAVE_ISNAND''@|1|g' \
	      -e 's|@''HAVE_ISNANL''@|0|g' \
	      -e 's|@''HAVE_LDEXPF''@|1|g' \
	      -e 's|@''HAVE_LOGF''@|1|g' \
	      -e 's|@''HAVE_LOGL''@|1|g' \
	      -e 's|@''HAVE_LOG10F''@|1|g' \
	      -e 's|@''HAVE_LOG10L''@|1|g' \
	      -e 's|@''HAVE_LOG1P''@|1|g' \
	      -e 's|@''HAVE_LOG1PF''@|1|g' \
	      -e 's|@''HAVE_LOG1PL''@|1|g' \
	      -e 's|@''HAVE_LOGBF''@|1|g' \
	      -e 's|@''HAVE_LOGBL''@|1|g' \
	      -e 's|@''HAVE_MODFF''@|1|g' \
	      -e 's|@''HAVE_MODFL''@|1|g' \
	      -e 's|@''HAVE_POWF''@|1|g' \
	      -e 's|@''HAVE_REMAINDER''@|1|g' \
	      -e 's|@''HAVE_REMAINDERF''@|1|g' \
	      -e 's|@''HAVE_RINT''@|1|g' \
	      -e 's|@''HAVE_RINTL''@|1|g' \
	      -e 's|@''HAVE_SINF''@|1|g' \
	      -e 's|@''HAVE_SINL''@|1|g' \
	      -e 's|@''HAVE_SINHF''@|1|g' \
	      -e 's|@''HAVE_SQRTF''@|1|g' \
	      -e 's|@''HAVE_SQRTL''@|1|g' \
	      -e 's|@''HAVE_TANF''@|1|g' \
	      -e 's|@''HAVE_TANL''@|1|g' \
	      -e 's|@''HAVE_TANHF''@|1|g' \
	      -e 's|@''HAVE_DECL_ACOSL''@|1|g' \
	      -e 's|@''HAVE_DECL_ASINL''@|1|g' \
	      -e 's|@''HAVE_DECL_ATANL''@|1|g' \
	      -e 's|@''HAVE_DECL_CBRTF''@|1|g' \
	      -e 's|@''HAVE_DECL_CBRTL''@|1|g' \
	      -e 's|@''HAVE_DECL_CEILF''@|1|g' \
	      -e 's|@''HAVE_DECL_CEILL''@|1|g' \
	      -e 's|@''HAVE_DECL_COPYSIGNF''@|1|g' \
	      -e 's|@''HAVE_DECL_COSL''@|1|g' \
	      -e 's|@''HAVE_DECL_EXPL''@|1|g' \
	      -e 's|@''HAVE_DECL_EXP2''@|1|g' \
	      -e 's|@''HAVE_DECL_EXP2F''@|1|g' \
	      -e 's|@''HAVE_DECL_EXP2L''@|1|g' \
	      -e 's|@''HAVE_DECL_EXPM1L''@|1|g' \
	      -e 's|@''HAVE_DECL_FLOORF''@|1|g' \
	      -e 's|@''HAVE_DECL_FLOORL''@|1|g' \
	      -e 's|@''HAVE_DECL_FREXPL''@|1|g' \
	      -e 's|@''HAVE_DECL_LDEXPL''@|1|g' \
	      -e 's|@''HAVE_DECL_LOGL''@|1|g' \
	      -e 's|@''HAVE_DECL_LOG10L''@|1|g' \
	      -e 's|@''HAVE_DECL_LOG2''@|1|g' \
	      -e 's|@''HAVE_DECL_LOG2F''@|1|g' \
	      -e 's|@''HAVE_DECL_LOG2L''@|1|g' \
	      -e 's|@''HAVE_DECL_LOGB''@|1|g' \
	      -e 's|@''HAVE_DECL_REMAINDER''@|1|g' \
	      -e 's|@''HAVE_DECL_REMAINDERL''@|1|g' \
	      -e 's|@''HAVE_DECL_RINTF''@|1|g' \
	      -e 's|@''HAVE_DECL_ROUND''@|1|g' \
	      -e 's|@''HAVE_DECL_ROUNDF''@|1|g' \
	      -e 's|@''HAVE_DECL_ROUNDL''@|1|g' \
	      -e 's|@''HAVE_DECL_SINL''@|1|g' \
	      -e 's|@''HAVE_DECL_SQRTL''@|1|g' \
	      -e 's|@''HAVE_DECL_TANL''@|1|g' \
	      -e 's|@''HAVE_DECL_TRUNC''@|1|g' \
	      -e 's|@''HAVE_DECL_TRUNCF''@|1|g' \
	      -e 's|@''HAVE_DECL_TRUNCL''@|1|g' \
	  | \
	  sed -e 's|@''REPLACE_CBRTF''@|0|g' \
	      -e 's|@''REPLACE_CBRTL''@|0|g' \
	      -e 's|@''REPLACE_CEIL''@|0|g' \
	      -e 's|@''REPLACE_CEILF''@|0|g' \
	      -e 's|@''REPLACE_CEILL''@|0|g' \
	      -e 's|@''REPLACE_EXPM1''@|0|g' \
	      -e 's|@''REPLACE_EXPM1F''@|0|g' \
	      -e 's|@''REPLACE_EXP2''@|0|g' \
	      -e 's|@''REPLACE_EXP2L''@|0|g' \
	      -e 's|@''REPLACE_FABSL''@|0|g' \
	      -e 's|@''REPLACE_FLOOR''@|0|g' \
	      -e 's|@''REPLACE_FLOORF''@|0|g' \
	      -e 's|@''REPLACE_FLOORL''@|0|g' \
	      -e 's|@''REPLACE_FMA''@|0|g' \
	      -e 's|@''REPLACE_FMAF''@|0|g' \
	      -e 's|@''REPLACE_FMAL''@|0|g' \
	      -e 's|@''REPLACE_FMOD''@|0|g' \
	      -e 's|@''REPLACE_FMODF''@|0|g' \
	      -e 's|@''REPLACE_FMODL''@|0|g' \
	      -e 's|@''REPLACE_FREXPF''@|0|g' \
	      -e 's|@''REPLACE_FREXP''@|0|g' \
	      -e 's|@''REPLACE_FREXPL''@|0|g' \
	      -e 's|@''REPLACE_HUGE_VAL''@|0|g' \
	      -e 's|@''REPLACE_HYPOT''@|0|g' \
	      -e 's|@''REPLACE_HYPOTF''@|0|g' \
	      -e 's|@''REPLACE_HYPOTL''@|0|g' \
	      -e 's|@''REPLACE_ILOGB''@|0|g' \
	      -e 's|@''REPLACE_ILOGBF''@|0|g' \
	      -e 's|@''REPLACE_ISFINITE''@|0|g' \
	      -e 's|@''REPLACE_ISINF''@|0|g' \
	      -e 's|@''REPLACE_ISNAN''@|1|g' \
	      -e 's|@''REPLACE_ITOLD''@|0|g' \
	      -e 's|@''REPLACE_LDEXPL''@|0|g' \
	      -e 's|@''REPLACE_LOG''@|0|g' \
	      -e 's|@''REPLACE_LOGF''@|0|g' \
	      -e 's|@''REPLACE_LOGL''@|0|g' \
	      -e 's|@''REPLACE_LOG10''@|0|g' \
	      -e 's|@''REPLACE_LOG10F''@|0|g' \
	      -e 's|@''REPLACE_LOG10L''@|0|g' \
	      -e 's|@''REPLACE_LOG1P''@|0|g' \
	      -e 's|@''REPLACE_LOG1PF''@|0|g' \
	      -e 's|@''REPLACE_LOG1PL''@|0|g' \
	      -e 's|@''REPLACE_LOG2''@|0|g' \
	      -e 's|@''REPLACE_LOG2F''@|0|g' \
	      -e 's|@''REPLACE_LOG2L''@|0|g' \
	      -e 's|@''REPLACE_LOGB''@|0|g' \
	      -e 's|@''REPLACE_LOGBF''@|0|g' \
	      -e 's|@''REPLACE_LOGBL''@|0|g' \
	      -e 's|@''REPLACE_MODF''@|0|g' \
	      -e 's|@''REPLACE_MODFF''@|0|g' \
	      -e 's|@''REPLACE_MODFL''@|0|g' \
	      -e 's|@''REPLACE_NAN''@|0|g' \
	      -e 's|@''REPLACE_REMAINDER''@|0|g' \
	      -e 's|@''REPLACE_REMAINDERF''@|0|g' \
	      -e 's|@''REPLACE_REMAINDERL''@|0|g' \
	      -e 's|@''REPLACE_ROUND''@|0|g' \
	      -e 's|@''REPLACE_ROUNDF''@|0|g' \
	      -e 's|@''REPLACE_ROUNDL''@|0|g' \
	      -e 's|@''REPLACE_SIGNBIT''@|0|g' \
	      -e 's|@''REPLACE_SIGNBIT_USING_GCC''@|0|g' \
	      -e 's|@''REPLACE_SQRTL''@|0|g' \
	      -e 's|@''REPLACE_TRUNC''@|0|g' \
	      -e 's|@''REPLACE_TRUNCF''@|0|g' \
	      -e 's|@''REPLACE_TRUNCL''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	} > math.h-t && \
	mv math.h-t math.h
rm -f netdb.h-t netdb.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_NETDB_H''@|<netdb.h>|g' \
	      -e 's|@''HAVE_NETDB_H''@|1|g' \
	      -e 's/@''GNULIB_GETADDRINFO''@/1/g' \
	      -e 's|@''HAVE_STRUCT_ADDRINFO''@|1|g' \
	      -e 's|@''HAVE_DECL_FREEADDRINFO''@|1|g' \
	      -e 's|@''HAVE_DECL_GAI_STRERROR''@|1|g' \
	      -e 's|@''HAVE_DECL_GETADDRINFO''@|1|g' \
	      -e 's|@''HAVE_DECL_GETNAMEINFO''@|1|g' \
	      -e 's|@''REPLACE_GAI_STRERROR''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/netdb.in.h; \
	} > netdb.h-t && \
	mv netdb.h-t netdb.h
rm -f poll.h-t poll.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''HAVE_POLL_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_POLL_H''@|<poll.h>|g' \
	      -e 's/@''GNULIB_POLL''@/1/g' \
	      -e 's|@''HAVE_POLL''@|1|g' \
	      -e 's|@''REPLACE_POLL''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/poll.in.h; \
	} > poll.h-t && \
	mv -f poll.h-t poll.h
rm -f signal.h-t signal.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_SIGNAL_H''@|<signal.h>|g' \
	      -e 's|@''GNULIB_PTHREAD_SIGMASK''@|0|g' \
	      -e 's|@''GNULIB_RAISE''@|1|g' \
	      -e 's/@''GNULIB_SIGNAL_H_SIGPIPE''@/0/g' \
	      -e 's/@''GNULIB_SIGPROCMASK''@/0/g' \
	      -e 's/@''GNULIB_SIGACTION''@/0/g' \
	      -e 's|@''HAVE_POSIX_SIGNALBLOCKING''@|1|g' \
	      -e 's|@''HAVE_PTHREAD_SIGMASK''@|1|g' \
	      -e 's|@''HAVE_RAISE''@|1|g' \
	      -e 's|@''HAVE_SIGSET_T''@|1|g' \
	      -e 's|@''HAVE_SIGINFO_T''@|1|g' \
	      -e 's|@''HAVE_SIGACTION''@|1|g' \
	      -e 's|@''HAVE_STRUCT_SIGACTION_SA_SIGACTION''@|1|g' \
	      -e 's|@''HAVE_TYPE_VOLATILE_SIG_ATOMIC_T''@|1|g' \
	      -e 's|@''HAVE_SIGHANDLER_T''@|1|g' \
	      -e 's|@''REPLACE_PTHREAD_SIGMASK''@|0|g' \
	      -e 's|@''REPLACE_RAISE''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/signal.in.h; \
	} > signal.h-t && \
	mv signal.h-t signal.h
rm -f stdio.h-t stdio.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_STDIO_H''@|<stdio.h>|g' \
	      -e 's/@''GNULIB_DPRINTF''@/0/g' \
	      -e 's/@''GNULIB_FCLOSE''@/0/g' \
	      -e 's/@''GNULIB_FDOPEN''@/0/g' \
	      -e 's/@''GNULIB_FFLUSH''@/0/g' \
	      -e 's/@''GNULIB_FGETC''@/1/g' \
	      -e 's/@''GNULIB_FGETS''@/1/g' \
	      -e 's/@''GNULIB_FOPEN''@/0/g' \
	      -e 's/@''GNULIB_FPRINTF''@/1/g' \
	      -e 's/@''GNULIB_FPRINTF_POSIX''@/0/g' \
	      -e 's/@''GNULIB_FPURGE''@/0/g' \
	      -e 's/@''GNULIB_FPUTC''@/1/g' \
	      -e 's/@''GNULIB_FPUTS''@/1/g' \
	      -e 's/@''GNULIB_FREAD''@/1/g' \
	      -e 's/@''GNULIB_FREOPEN''@/0/g' \
	      -e 's/@''GNULIB_FSCANF''@/1/g' \
	      -e 's/@''GNULIB_FSEEK''@/0/g' \
	      -e 's/@''GNULIB_FSEEKO''@/0/g' \
	      -e 's/@''GNULIB_FTELL''@/0/g' \
	      -e 's/@''GNULIB_FTELLO''@/0/g' \
	      -e 's/@''GNULIB_FWRITE''@/1/g' \
	      -e 's/@''GNULIB_GETC''@/1/g' \
	      -e 's/@''GNULIB_GETCHAR''@/1/g' \
	      -e 's/@''GNULIB_GETDELIM''@/0/g' \
	      -e 's/@''GNULIB_GETLINE''@/0/g' \
	      -e 's/@''GNULIB_OBSTACK_PRINTF''@/0/g' \
	      -e 's/@''GNULIB_OBSTACK_PRINTF_POSIX''@/0/g' \
	      -e 's/@''GNULIB_PCLOSE''@/0/g' \
	      -e 's/@''GNULIB_PERROR''@/0/g' \
	      -e 's/@''GNULIB_POPEN''@/0/g' \
	      -e 's/@''GNULIB_PRINTF''@/1/g' \
	      -e 's/@''GNULIB_PRINTF_POSIX''@/0/g' \
	      -e 's/@''GNULIB_PUTC''@/1/g' \
	      -e 's/@''GNULIB_PUTCHAR''@/1/g' \
	      -e 's/@''GNULIB_PUTS''@/1/g' \
	      -e 's/@''GNULIB_REMOVE''@/0/g' \
	      -e 's/@''GNULIB_RENAME''@/1/g' \
	      -e 's/@''GNULIB_RENAMEAT''@/0/g' \
	      -e 's/@''GNULIB_SCANF''@/1/g' \
	      -e 's/@''GNULIB_SNPRINTF''@/1/g' \
	      -e 's/@''GNULIB_SPRINTF_POSIX''@/0/g' \
	      -e 's/@''GNULIB_STDIO_H_NONBLOCKING''@/0/g' \
	      -e 's/@''GNULIB_STDIO_H_SIGPIPE''@/0/g' \
	      -e 's/@''GNULIB_TMPFILE''@/0/g' \
	      -e 's/@''GNULIB_VASPRINTF''@/0/g' \
	      -e 's/@''GNULIB_VDPRINTF''@/0/g' \
	      -e 's/@''GNULIB_VFPRINTF''@/1/g' \
	      -e 's/@''GNULIB_VFPRINTF_POSIX''@/0/g' \
	      -e 's/@''GNULIB_VFSCANF''@/0/g' \
	      -e 's/@''GNULIB_VSCANF''@/0/g' \
	      -e 's/@''GNULIB_VPRINTF''@/1/g' \
	      -e 's/@''GNULIB_VPRINTF_POSIX''@/0/g' \
	      -e 's/@''GNULIB_VSNPRINTF''@/1/g' \
	      -e 's/@''GNULIB_VSPRINTF_POSIX''@/0/g' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/stdio.in.h | \
	  sed -e 's|@''HAVE_DECL_FPURGE''@|1|g' \
	      -e 's|@''HAVE_DECL_FSEEKO''@|1|g' \
	      -e 's|@''HAVE_DECL_FTELLO''@|1|g' \
	      -e 's|@''HAVE_DECL_GETDELIM''@|1|g' \
	      -e 's|@''HAVE_DECL_GETLINE''@|1|g' \
	      -e 's|@''HAVE_DECL_OBSTACK_PRINTF''@|1|g' \
	      -e 's|@''HAVE_DECL_SNPRINTF''@|1|g' \
	      -e 's|@''HAVE_DECL_VSNPRINTF''@|1|g' \
	      -e 's|@''HAVE_DPRINTF''@|1|g' \
	      -e 's|@''HAVE_FSEEKO''@|1|g' \
	      -e 's|@''HAVE_FTELLO''@|1|g' \
	      -e 's|@''HAVE_PCLOSE''@|1|g' \
	      -e 's|@''HAVE_POPEN''@|1|g' \
	      -e 's|@''HAVE_RENAMEAT''@|1|g' \
	      -e 's|@''HAVE_VASPRINTF''@|1|g' \
	      -e 's|@''HAVE_VDPRINTF''@|1|g' \
	      -e 's|@''REPLACE_DPRINTF''@|0|g' \
	      -e 's|@''REPLACE_FCLOSE''@|0|g' \
	      -e 's|@''REPLACE_FDOPEN''@|0|g' \
	      -e 's|@''REPLACE_FFLUSH''@|0|g' \
	      -e 's|@''REPLACE_FOPEN''@|0|g' \
	      -e 's|@''REPLACE_FPRINTF''@|0|g' \
	      -e 's|@''REPLACE_FPURGE''@|0|g' \
	      -e 's|@''REPLACE_FREOPEN''@|0|g' \
	      -e 's|@''REPLACE_FSEEK''@|0|g' \
	      -e 's|@''REPLACE_FSEEKO''@|0|g' \
	      -e 's|@''REPLACE_FTELL''@|0|g' \
	      -e 's|@''REPLACE_FTELLO''@|0|g' \
	      -e 's|@''REPLACE_GETDELIM''@|0|g' \
	      -e 's|@''REPLACE_GETLINE''@|0|g' \
	      -e 's|@''REPLACE_OBSTACK_PRINTF''@|0|g' \
	      -e 's|@''REPLACE_PERROR''@|0|g' \
	      -e 's|@''REPLACE_POPEN''@|0|g' \
	      -e 's|@''REPLACE_PRINTF''@|0|g' \
	      -e 's|@''REPLACE_REMOVE''@|0|g' \
	      -e 's|@''REPLACE_RENAME''@|0|g' \
	      -e 's|@''REPLACE_RENAMEAT''@|0|g' \
	      -e 's|@''REPLACE_SNPRINTF''@|0|g' \
	      -e 's|@''REPLACE_SPRINTF''@|0|g' \
	      -e 's|@''REPLACE_STDIO_READ_FUNCS''@|0|g' \
	      -e 's|@''REPLACE_STDIO_WRITE_FUNCS''@|0|g' \
	      -e 's|@''REPLACE_TMPFILE''@|0|g' \
	      -e 's|@''REPLACE_VASPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VDPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VFPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VSNPRINTF''@|0|g' \
	      -e 's|@''REPLACE_VSPRINTF''@|0|g' \
	      -e 's|@''ASM_SYMBOL_PREFIX''@||g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	} > stdio.h-t && \
	mv stdio.h-t stdio.h
rm -f stdlib.h-t stdlib.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_STDLIB_H''@|<stdlib.h>|g' \
	      -e 's/@''GNULIB__EXIT''@/0/g' \
	      -e 's/@''GNULIB_ATOLL''@/0/g' \
	      -e 's/@''GNULIB_CALLOC_POSIX''@/0/g' \
	      -e 's/@''GNULIB_CANONICALIZE_FILE_NAME''@/1/g' \
	      -e 's/@''GNULIB_GETLOADAVG''@/0/g' \
	      -e 's/@''GNULIB_GETSUBOPT''@/0/g' \
	      -e 's/@''GNULIB_GRANTPT''@/0/g' \
	      -e 's/@''GNULIB_MALLOC_POSIX''@/1/g' \
	      -e 's/@''GNULIB_MBTOWC''@/1/g' \
	      -e 's/@''GNULIB_MKDTEMP''@/0/g' \
	      -e 's/@''GNULIB_MKOSTEMP''@/0/g' \
	      -e 's/@''GNULIB_MKOSTEMPS''@/0/g' \
	      -e 's/@''GNULIB_MKSTEMP''@/0/g' \
	      -e 's/@''GNULIB_MKSTEMPS''@/0/g' \
	      -e 's/@''GNULIB_POSIX_OPENPT''@/0/g' \
	      -e 's/@''GNULIB_PTSNAME''@/0/g' \
	      -e 's/@''GNULIB_PTSNAME_R''@/0/g' \
	      -e 's/@''GNULIB_PUTENV''@/1/g' \
	      -e 's/@''GNULIB_RANDOM''@/0/g' \
	      -e 's/@''GNULIB_RANDOM_R''@/0/g' \
	      -e 's/@''GNULIB_REALLOC_POSIX''@/0/g' \
	      -e 's/@''GNULIB_REALPATH''@/1/g' \
	      -e 's/@''GNULIB_RPMATCH''@/0/g' \
	      -e 's/@''GNULIB_SECURE_GETENV''@/0/g' \
	      -e 's/@''GNULIB_SETENV''@/1/g' \
	      -e 's/@''GNULIB_STRTOD''@/0/g' \
	      -e 's/@''GNULIB_STRTOLL''@/0/g' \
	      -e 's/@''GNULIB_STRTOULL''@/0/g' \
	      -e 's/@''GNULIB_SYSTEM_POSIX''@/0/g' \
	      -e 's/@''GNULIB_UNLOCKPT''@/0/g' \
	      -e 's/@''GNULIB_UNSETENV''@/0/g' \
	      -e 's/@''GNULIB_WCTOMB''@/0/g' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/stdlib.in.h | \
	  sed -e 's|@''HAVE__EXIT''@|1|g' \
	      -e 's|@''HAVE_ATOLL''@|1|g' \
	      -e 's|@''HAVE_CANONICALIZE_FILE_NAME''@|1|g' \
	      -e 's|@''HAVE_DECL_GETLOADAVG''@|1|g' \
	      -e 's|@''HAVE_GETSUBOPT''@|1|g' \
	      -e 's|@''HAVE_GRANTPT''@|1|g' \
	      -e 's|@''HAVE_MKDTEMP''@|1|g' \
	      -e 's|@''HAVE_MKOSTEMP''@|1|g' \
	      -e 's|@''HAVE_MKOSTEMPS''@|1|g' \
	      -e 's|@''HAVE_MKSTEMP''@|1|g' \
	      -e 's|@''HAVE_MKSTEMPS''@|1|g' \
	      -e 's|@''HAVE_POSIX_OPENPT''@|1|g' \
	      -e 's|@''HAVE_PTSNAME''@|1|g' \
	      -e 's|@''HAVE_PTSNAME_R''@|1|g' \
	      -e 's|@''HAVE_RANDOM''@|1|g' \
	      -e 's|@''HAVE_RANDOM_H''@|1|g' \
	      -e 's|@''HAVE_RANDOM_R''@|1|g' \
	      -e 's|@''HAVE_REALPATH''@|1|g' \
	      -e 's|@''HAVE_RPMATCH''@|1|g' \
	      -e 's|@''HAVE_SECURE_GETENV''@|1|g' \
	      -e 's|@''HAVE_DECL_SETENV''@|1|g' \
	      -e 's|@''HAVE_STRTOD''@|1|g' \
	      -e 's|@''HAVE_STRTOLL''@|1|g' \
	      -e 's|@''HAVE_STRTOULL''@|1|g' \
	      -e 's|@''HAVE_STRUCT_RANDOM_DATA''@|1|g' \
	      -e 's|@''HAVE_SYS_LOADAVG_H''@|0|g' \
	      -e 's|@''HAVE_UNLOCKPT''@|1|g' \
	      -e 's|@''HAVE_DECL_UNSETENV''@|1|g' \
	      -e 's|@''REPLACE_CALLOC''@|0|g' \
	      -e 's|@''REPLACE_CANONICALIZE_FILE_NAME''@|0|g' \
	      -e 's|@''REPLACE_MALLOC''@|0|g' \
	      -e 's|@''REPLACE_MBTOWC''@|0|g' \
	      -e 's|@''REPLACE_MKSTEMP''@|0|g' \
	      -e 's|@''REPLACE_PTSNAME''@|0|g' \
	      -e 's|@''REPLACE_PTSNAME_R''@|0|g' \
	      -e 's|@''REPLACE_PUTENV''@|0|g' \
	      -e 's|@''REPLACE_RANDOM_R''@|0|g' \
	      -e 's|@''REPLACE_REALLOC''@|0|g' \
	      -e 's|@''REPLACE_REALPATH''@|0|g' \
	      -e 's|@''REPLACE_SETENV''@|0|g' \
	      -e 's|@''REPLACE_STRTOD''@|0|g' \
	      -e 's|@''REPLACE_UNSETENV''@|0|g' \
	      -e 's|@''REPLACE_WCTOMB''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _Noreturn/r /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/build-aux/snippet/_Noreturn.h'=
 \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	} > stdlib.h-t && \
	mv stdlib.h-t stdlib.h
rm -f string.h-t string.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_STRING_H''@|<string.h>|g' \
	      -e 's/@''GNULIB_FFSL''@/0/g' \
	      -e 's/@''GNULIB_FFSLL''@/0/g' \
	      -e 's/@''GNULIB_MBSLEN''@/0/g' \
	      -e 's/@''GNULIB_MBSNLEN''@/0/g' \
	      -e 's/@''GNULIB_MBSCHR''@/0/g' \
	      -e 's/@''GNULIB_MBSRCHR''@/0/g' \
	      -e 's/@''GNULIB_MBSSTR''@/0/g' \
	      -e 's/@''GNULIB_MBSCASECMP''@/0/g' \
	      -e 's/@''GNULIB_MBSNCASECMP''@/0/g' \
	      -e 's/@''GNULIB_MBSPCASECMP''@/0/g' \
	      -e 's/@''GNULIB_MBSCASESTR''@/0/g' \
	      -e 's/@''GNULIB_MBSCSPN''@/0/g' \
	      -e 's/@''GNULIB_MBSPBRK''@/0/g' \
	      -e 's/@''GNULIB_MBSSPN''@/0/g' \
	      -e 's/@''GNULIB_MBSSEP''@/0/g' \
	      -e 's/@''GNULIB_MBSTOK_R''@/0/g' \
	      -e 's/@''GNULIB_MEMCHR''@/1/g' \
	      -e 's/@''GNULIB_MEMMEM''@/0/g' \
	      -e 's/@''GNULIB_MEMPCPY''@/0/g' \
	      -e 's/@''GNULIB_MEMRCHR''@/0/g' \
	      -e 's/@''GNULIB_RAWMEMCHR''@/0/g' \
	      -e 's/@''GNULIB_STPCPY''@/0/g' \
	      -e 's/@''GNULIB_STPNCPY''@/0/g' \
	      -e 's/@''GNULIB_STRCHRNUL''@/0/g' \
	      -e 's/@''GNULIB_STRDUP''@/0/g' \
	      -e 's/@''GNULIB_STRNCAT''@/0/g' \
	      -e 's/@''GNULIB_STRNDUP''@/0/g' \
	      -e 's/@''GNULIB_STRNLEN''@/0/g' \
	      -e 's/@''GNULIB_STRPBRK''@/0/g' \
	      -e 's/@''GNULIB_STRSEP''@/0/g' \
	      -e 's/@''GNULIB_STRSTR''@/0/g' \
	      -e 's/@''GNULIB_STRCASESTR''@/0/g' \
	      -e 's/@''GNULIB_STRTOK_R''@/0/g' \
	      -e 's/@''GNULIB_STRERROR''@/0/g' \
	      -e 's/@''GNULIB_STRERROR_R''@/0/g' \
	      -e 's/@''GNULIB_STRSIGNAL''@/0/g' \
	      -e 's/@''GNULIB_STRVERSCMP''@/0/g' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/string.in.h | \
	  sed -e 's|@''HAVE_FFSL''@|1|g' \
	      -e 's|@''HAVE_FFSLL''@|1|g' \
	      -e 's|@''HAVE_MBSLEN''@|0|g' \
	      -e 's|@''HAVE_MEMCHR''@|1|g' \
	      -e 's|@''HAVE_DECL_MEMMEM''@|1|g' \
	      -e 's|@''HAVE_MEMPCPY''@|1|g' \
	      -e 's|@''HAVE_DECL_MEMRCHR''@|1|g' \
	      -e 's|@''HAVE_RAWMEMCHR''@|1|g' \
	      -e 's|@''HAVE_STPCPY''@|1|g' \
	      -e 's|@''HAVE_STPNCPY''@|1|g' \
	      -e 's|@''HAVE_STRCHRNUL''@|1|g' \
	      -e 's|@''HAVE_DECL_STRDUP''@|1|g' \
	      -e 's|@''HAVE_DECL_STRNDUP''@|1|g' \
	      -e 's|@''HAVE_DECL_STRNLEN''@|1|g' \
	      -e 's|@''HAVE_STRPBRK''@|1|g' \
	      -e 's|@''HAVE_STRSEP''@|1|g' \
	      -e 's|@''HAVE_STRCASESTR''@|1|g' \
	      -e 's|@''HAVE_DECL_STRTOK_R''@|1|g' \
	      -e 's|@''HAVE_DECL_STRERROR_R''@|1|g' \
	      -e 's|@''HAVE_DECL_STRSIGNAL''@|1|g' \
	      -e 's|@''HAVE_STRVERSCMP''@|1|g' \
	      -e 's|@''REPLACE_STPNCPY''@|0|g' \
	      -e 's|@''REPLACE_MEMCHR''@|0|g' \
	      -e 's|@''REPLACE_MEMMEM''@|0|g' \
	      -e 's|@''REPLACE_STRCASESTR''@|0|g' \
	      -e 's|@''REPLACE_STRCHRNUL''@|0|g' \
	      -e 's|@''REPLACE_STRDUP''@|0|g' \
	      -e 's|@''REPLACE_STRSTR''@|0|g' \
	      -e 's|@''REPLACE_STRERROR''@|0|g' \
	      -e 's|@''REPLACE_STRERROR_R''@|0|g' \
	      -e 's|@''REPLACE_STRNCAT''@|0|g' \
	      -e 's|@''REPLACE_STRNDUP''@|0|g' \
	      -e 's|@''REPLACE_STRNLEN''@|0|g' \
	      -e 's|@''REPLACE_STRSIGNAL''@|0|g' \
	      -e 's|@''REPLACE_STRTOK_R''@|0|g' \
	      -e 's|@''UNDEFINE_STRTOK_R''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/string.in.h; \
	} > string.h-t && \
	mv string.h-t string.h
/bin/mkdir -p sys
/bin/mkdir -p sys
/bin/mkdir -p sys
rm -f sys/file.h-t sys/file.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's/@''HAVE_SYS_FILE_H''@/1/g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_SYS_FILE_H''@|<sys/file.h>|g' \
	      -e 's/@''HAVE_FLOCK''@/1/g' \
	      -e 's/@''GNULIB_FLOCK''@/1/g' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/sys_file.in.h; \
	} > sys/file.h-t && \
	mv sys/file.h-t sys/file.h
/bin/mkdir -p sys
rm -f sys/select.h-t sys/select.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_SYS_SELECT_H''@|<sys/select.h>|g' \
	      -e 's|@''HAVE_SYS_SELECT_H''@|1|g' \
	      -e 's/@''GNULIB_PSELECT''@/0/g' \
	      -e 's/@''GNULIB_SELECT''@/1/g' \
	      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''HAVE_PSELECT''@|1|g' \
	      -e 's|@''REPLACE_PSELECT''@|0|g' \
	      -e 's|@''REPLACE_SELECT''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/sys_select.in.h; \
	} > sys/select.h-t && \
	mv sys/select.h-t sys/select.h
rm -f sys/socket.h-t sys/socket.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_SYS_SOCKET_H''@|<sys/socket.h>|g' \
	      -e 's|@''HAVE_SYS_SOCKET_H''@|1|g' \
	      -e 's/@''GNULIB_CLOSE''@/1/g' \
	      -e 's/@''GNULIB_SOCKET''@/1/g' \
	      -e 's/@''GNULIB_CONNECT''@/1/g' \
	      -e 's/@''GNULIB_ACCEPT''@/1/g' \
	      -e 's/@''GNULIB_BIND''@/1/g' \
	      -e 's/@''GNULIB_GETPEERNAME''@/1/g' \
	      -e 's/@''GNULIB_GETSOCKNAME''@/1/g' \
	      -e 's/@''GNULIB_GETSOCKOPT''@/1/g' \
	      -e 's/@''GNULIB_LISTEN''@/1/g' \
	      -e 's/@''GNULIB_RECV''@/1/g' \
	      -e 's/@''GNULIB_SEND''@/1/g' \
	      -e 's/@''GNULIB_RECVFROM''@/1/g' \
	      -e 's/@''GNULIB_SENDTO''@/1/g' \
	      -e 's/@''GNULIB_SETSOCKOPT''@/1/g' \
	      -e 's/@''GNULIB_SHUTDOWN''@/1/g' \
	      -e 's/@''GNULIB_ACCEPT4''@/0/g' \
	      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''HAVE_WS2TCPIP_H''@|0|g' \
	      -e 's|@''HAVE_STRUCT_SOCKADDR_STORAGE''@|1|g' \
	      -e 's|@''HAVE_STRUCT_SOCKADDR_STORAGE_SS_FAMILY''@|1|g' \
	      -e 's|@''HAVE_SA_FAMILY_T''@|1|g' \
	      -e 's|@''HAVE_ACCEPT4''@|1|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/sys_socket.in.h; \
	} > sys/socket.h-t && \
	mv -f sys/socket.h-t sys/socket.h
/bin/mkdir -p sys
rm -f sys/stat.h-t sys/stat.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_SYS_STAT_H''@|<sys/stat.h>|g' \
	      -e 's|@''WINDOWS_64_BIT_ST_SIZE''@|0|g' \
	      -e 's/@''GNULIB_FCHMODAT''@/0/g' \
	      -e 's/@''GNULIB_FSTAT''@/1/g' \
	      -e 's/@''GNULIB_FSTATAT''@/0/g' \
	      -e 's/@''GNULIB_FUTIMENS''@/0/g' \
	      -e 's/@''GNULIB_LCHMOD''@/0/g' \
	      -e 's/@''GNULIB_LSTAT''@/1/g' \
	      -e 's/@''GNULIB_MKDIRAT''@/0/g' \
	      -e 's/@''GNULIB_MKFIFO''@/0/g' \
	      -e 's/@''GNULIB_MKFIFOAT''@/0/g' \
	      -e 's/@''GNULIB_MKNOD''@/0/g' \
	      -e 's/@''GNULIB_MKNODAT''@/0/g' \
	      -e 's/@''GNULIB_STAT''@/1/g' \
	      -e 's/@''GNULIB_UTIMENSAT''@/0/g' \
	      -e 's|@''HAVE_FCHMODAT''@|1|g' \
	      -e 's|@''HAVE_FSTATAT''@|1|g' \
	      -e 's|@''HAVE_FUTIMENS''@|1|g' \
	      -e 's|@''HAVE_LCHMOD''@|1|g' \
	      -e 's|@''HAVE_LSTAT''@|1|g' \
	      -e 's|@''HAVE_MKDIRAT''@|1|g' \
	      -e 's|@''HAVE_MKFIFO''@|1|g' \
	      -e 's|@''HAVE_MKFIFOAT''@|1|g' \
	      -e 's|@''HAVE_MKNOD''@|1|g' \
	      -e 's|@''HAVE_MKNODAT''@|1|g' \
	      -e 's|@''HAVE_UTIMENSAT''@|1|g' \
	      -e 's|@''REPLACE_FSTAT''@|0|g' \
	      -e 's|@''REPLACE_FSTATAT''@|0|g' \
	      -e 's|@''REPLACE_FUTIMENS''@|0|g' \
	      -e 's|@''REPLACE_LSTAT''@|0|g' \
	      -e 's|@''REPLACE_MKDIR''@|0|g' \
	      -e 's|@''REPLACE_MKFIFO''@|0|g' \
	      -e 's|@''REPLACE_MKNOD''@|0|g' \
	      -e 's|@''REPLACE_STAT''@|0|g' \
	      -e 's|@''REPLACE_UTIMENSAT''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/sys_stat.in.h; \
	} > sys/stat.h-t && \
	mv sys/stat.h-t sys/stat.h
/bin/mkdir -p sys
rm -f sys/time.h-t sys/time.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's/@''HAVE_SYS_TIME_H''@/1/g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_SYS_TIME_H''@|<sys/time.h>|g' \
	      -e 's/@''GNULIB_GETTIMEOFDAY''@/0/g' \
	      -e 's|@''HAVE_WINSOCK2_H''@|0|g' \
	      -e 's/@''HAVE_GETTIMEOFDAY''@/1/g' \
	      -e 's/@''HAVE_STRUCT_TIMEVAL''@/1/g' \
	      -e 's/@''REPLACE_GETTIMEOFDAY''@/0/g' \
	      -e 's/@''REPLACE_STRUCT_TIMEVAL''@/0/g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/sys_time.in.h; \
	} > sys/time.h-t && \
	mv sys/time.h-t sys/time.h
rm -f time.h-t time.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */' && \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_TIME_H''@|<time.h>|g' \
	      -e 's/@''GNULIB_MKTIME''@/0/g' \
	      -e 's/@''GNULIB_NANOSLEEP''@/0/g' \
	      -e 's/@''GNULIB_STRPTIME''@/0/g' \
	      -e 's/@''GNULIB_TIMEGM''@/0/g' \
	      -e 's/@''GNULIB_TIME_R''@/1/g' \
	      -e 's|@''HAVE_DECL_LOCALTIME_R''@|1|g' \
	      -e 's|@''HAVE_NANOSLEEP''@|1|g' \
	      -e 's|@''HAVE_STRPTIME''@|1|g' \
	      -e 's|@''HAVE_TIMEGM''@|1|g' \
	      -e 's|@''REPLACE_LOCALTIME_R''@|0|g' \
	      -e 's|@''REPLACE_MKTIME''@|GNULIB_PORTCHECK|g' \
	      -e 's|@''REPLACE_NANOSLEEP''@|GNULIB_PORTCHECK|g' \
	      -e 's|@''REPLACE_TIMEGM''@|GNULIB_PORTCHECK|g' \
	      -e 's|@''PTHREAD_H_DEFINES_STRUCT_TIMESPEC''@|0|g' \
	      -e 's|@''SYS_TIME_H_DEFINES_STRUCT_TIMESPEC''@|0|g' \
	      -e 's|@''TIME_H_DEFINES_STRUCT_TIMESPEC''@|1|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/time.in.h; \
	} > time.h-t && \
	mv time.h-t time.h
rm -f sys/times.h-t sys/times.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's/@''HAVE_SYS_TIMES_H''@/1/g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_SYS_TIMES_H''@|<sys/times.h>|g' \
	      -e 's/@''GNULIB_TIMES''@/1/g' \
	      -e 's|@''HAVE_STRUCT_TMS''@|1|g' \
	      -e 's|@''HAVE_TIMES''@|1|g' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/sys_times.in.h; \
	} > sys/times.h-t && \
	mv sys/times.h-t sys/times.h
rm -f unistd.h-t unistd.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''HAVE_UNISTD_H''@|1|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''NEXT_UNISTD_H''@|<unistd.h>|g' \
	      -e 's|@''WINDOWS_64_BIT_OFF_T''@|0|g' \
	      -e 's/@''GNULIB_CHDIR''@/1/g' \
	      -e 's/@''GNULIB_CHOWN''@/0/g' \
	      -e 's/@''GNULIB_CLOSE''@/1/g' \
	      -e 's/@''GNULIB_DUP''@/0/g' \
	      -e 's/@''GNULIB_DUP2''@/1/g' \
	      -e 's/@''GNULIB_DUP3''@/0/g' \
	      -e 's/@''GNULIB_ENVIRON''@/1/g' \
	      -e 's/@''GNULIB_EUIDACCESS''@/0/g' \
	      -e 's/@''GNULIB_FACCESSAT''@/0/g' \
	      -e 's/@''GNULIB_FCHDIR''@/0/g' \
	      -e 's/@''GNULIB_FCHOWNAT''@/0/g' \
	      -e 's/@''GNULIB_FDATASYNC''@/0/g' \
	      -e 's/@''GNULIB_FSYNC''@/0/g' \
	      -e 's/@''GNULIB_FTRUNCATE''@/0/g' \
	      -e 's/@''GNULIB_GETCWD''@/0/g' \
	      -e 's/@''GNULIB_GETDOMAINNAME''@/0/g' \
	      -e 's/@''GNULIB_GETDTABLESIZE''@/0/g' \
	      -e 's/@''GNULIB_GETGROUPS''@/0/g' \
	      -e 's/@''GNULIB_GETHOSTNAME''@/0/g' \
	      -e 's/@''GNULIB_GETLOGIN''@/1/g' \
	      -e 's/@''GNULIB_GETLOGIN_R''@/0/g' \
	      -e 's/@''GNULIB_GETPAGESIZE''@/0/g' \
	      -e 's/@''GNULIB_GETUSERSHELL''@/0/g' \
	      -e 's/@''GNULIB_GROUP_MEMBER''@/0/g' \
	      -e 's/@''GNULIB_ISATTY''@/0/g' \
	      -e 's/@''GNULIB_LCHOWN''@/0/g' \
	      -e 's/@''GNULIB_LINK''@/0/g' \
	      -e 's/@''GNULIB_LINKAT''@/0/g' \
	      -e 's/@''GNULIB_LSEEK''@/0/g' \
	      -e 's/@''GNULIB_PIPE''@/1/g' \
	      -e 's/@''GNULIB_PIPE2''@/1/g' \
	      -e 's/@''GNULIB_PREAD''@/0/g' \
	      -e 's/@''GNULIB_PWRITE''@/0/g' \
	      -e 's/@''GNULIB_READ''@/1/g' \
	      -e 's/@''GNULIB_READLINK''@/1/g' \
	      -e 's/@''GNULIB_READLINKAT''@/0/g' \
	      -e 's/@''GNULIB_RMDIR''@/1/g' \
	      -e 's/@''GNULIB_SETHOSTNAME''@/0/g' \
	      -e 's/@''GNULIB_SLEEP''@/0/g' \
	      -e 's/@''GNULIB_SYMLINK''@/0/g' \
	      -e 's/@''GNULIB_SYMLINKAT''@/0/g' \
	      -e 's/@''GNULIB_TTYNAME_R''@/0/g' \
	      -e 's/@''GNULIB_UNISTD_H_GETOPT''@/0/g' \
	      -e 's/@''GNULIB_UNISTD_H_NONBLOCKING''@/0/g' \
	      -e 's/@''GNULIB_UNISTD_H_SIGPIPE''@/0/g' \
	      -e 's/@''GNULIB_UNLINK''@/0/g' \
	      -e 's/@''GNULIB_UNLINKAT''@/0/g' \
	      -e 's/@''GNULIB_USLEEP''@/0/g' \
	      -e 's/@''GNULIB_WRITE''@/1/g' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/unistd.in.h | \
	  sed -e 's|@''HAVE_CHOWN''@|1|g' \
	      -e 's|@''HAVE_DUP2''@|1|g' \
	      -e 's|@''HAVE_DUP3''@|1|g' \
	      -e 's|@''HAVE_EUIDACCESS''@|1|g' \
	      -e 's|@''HAVE_FACCESSAT''@|1|g' \
	      -e 's|@''HAVE_FCHDIR''@|1|g' \
	      -e 's|@''HAVE_FCHOWNAT''@|1|g' \
	      -e 's|@''HAVE_FDATASYNC''@|1|g' \
	      -e 's|@''HAVE_FSYNC''@|1|g' \
	      -e 's|@''HAVE_FTRUNCATE''@|1|g' \
	      -e 's|@''HAVE_GETDTABLESIZE''@|1|g' \
	      -e 's|@''HAVE_GETGROUPS''@|1|g' \
	      -e 's|@''HAVE_GETHOSTNAME''@|1|g' \
	      -e 's|@''HAVE_GETLOGIN''@|1|g' \
	      -e 's|@''HAVE_GETPAGESIZE''@|1|g' \
	      -e 's|@''HAVE_GROUP_MEMBER''@|1|g' \
	      -e 's|@''HAVE_LCHOWN''@|1|g' \
	      -e 's|@''HAVE_LINK''@|1|g' \
	      -e 's|@''HAVE_LINKAT''@|1|g' \
	      -e 's|@''HAVE_PIPE''@|1|g' \
	      -e 's|@''HAVE_PIPE2''@|1|g' \
	      -e 's|@''HAVE_PREAD''@|1|g' \
	      -e 's|@''HAVE_PWRITE''@|1|g' \
	      -e 's|@''HAVE_READLINK''@|1|g' \
	      -e 's|@''HAVE_READLINKAT''@|1|g' \
	      -e 's|@''HAVE_SETHOSTNAME''@|1|g' \
	      -e 's|@''HAVE_SLEEP''@|1|g' \
	      -e 's|@''HAVE_SYMLINK''@|1|g' \
	      -e 's|@''HAVE_SYMLINKAT''@|1|g' \
	      -e 's|@''HAVE_UNLINKAT''@|1|g' \
	      -e 's|@''HAVE_USLEEP''@|1|g' \
	      -e 's|@''HAVE_DECL_ENVIRON''@|1|g' \
	      -e 's|@''HAVE_DECL_FCHDIR''@|1|g' \
	      -e 's|@''HAVE_DECL_FDATASYNC''@|1|g' \
	      -e 's|@''HAVE_DECL_GETDOMAINNAME''@|1|g' \
	      -e 's|@''HAVE_DECL_GETLOGIN_R''@|1|g' \
	      -e 's|@''HAVE_DECL_GETPAGESIZE''@|1|g' \
	      -e 's|@''HAVE_DECL_GETUSERSHELL''@|1|g' \
	      -e 's|@''HAVE_DECL_SETHOSTNAME''@|1|g' \
	      -e 's|@''HAVE_DECL_TTYNAME_R''@|1|g' \
	      -e 's|@''HAVE_OS_H''@|0|g' \
	      -e 's|@''HAVE_SYS_PARAM_H''@|0|g' \
	  | \
	  sed -e 's|@''REPLACE_CHOWN''@|0|g' \
	      -e 's|@''REPLACE_CLOSE''@|0|g' \
	      -e 's|@''REPLACE_DUP''@|0|g' \
	      -e 's|@''REPLACE_DUP2''@|0|g' \
	      -e 's|@''REPLACE_FCHOWNAT''@|0|g' \
	      -e 's|@''REPLACE_FTRUNCATE''@|0|g' \
	      -e 's|@''REPLACE_GETCWD''@|0|g' \
	      -e 's|@''REPLACE_GETDOMAINNAME''@|0|g' \
	      -e 's|@''REPLACE_GETLOGIN_R''@|0|g' \
	      -e 's|@''REPLACE_GETGROUPS''@|0|g' \
	      -e 's|@''REPLACE_GETPAGESIZE''@|0|g' \
	      -e 's|@''REPLACE_ISATTY''@|0|g' \
	      -e 's|@''REPLACE_LCHOWN''@|0|g' \
	      -e 's|@''REPLACE_LINK''@|0|g' \
	      -e 's|@''REPLACE_LINKAT''@|0|g' \
	      -e 's|@''REPLACE_LSEEK''@|0|g' \
	      -e 's|@''REPLACE_PREAD''@|0|g' \
	      -e 's|@''REPLACE_PWRITE''@|0|g' \
	      -e 's|@''REPLACE_READ''@|0|g' \
	      -e 's|@''REPLACE_READLINK''@|0|g' \
	      -e 's|@''REPLACE_RMDIR''@|0|g' \
	      -e 's|@''REPLACE_SLEEP''@|0|g' \
	      -e 's|@''REPLACE_SYMLINK''@|0|g' \
	      -e 's|@''REPLACE_TTYNAME_R''@|0|g' \
	      -e 's|@''REPLACE_UNLINK''@|0|g' \
	      -e 's|@''REPLACE_UNLINKAT''@|0|g' \
	      -e 's|@''REPLACE_USLEEP''@|0|g' \
	      -e 's|@''REPLACE_WRITE''@|0|g' \
	      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H''@|0|g' \
	      -e 's|@''UNISTD_H_HAVE_WINSOCK2_H_AND_USE_SOCKETS''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	} > unistd.h-t && \
	mv unistd.h-t unistd.h
rm -f wchar.h-t wchar.h && \
	{ echo '/* DO NOT EDIT! GENERATED AUTOMATICALLY! */'; \
	  sed -e 's|@''GUARD_PREFIX''@|GL|g' \
	      -e 's|@''INCLUDE_NEXT''@|include_next|g' \
	      -e 's|@''PRAGMA_SYSTEM_HEADER''@|#pragma GCC system_header|g' \
	      -e 's|@''PRAGMA_COLUMNS''@||g' \
	      -e 's|@''HAVE_FEATURES_H''@|1|g' \
	      -e 's|@''NEXT_WCHAR_H''@|<wchar.h>|g' \
	      -e 's|@''HAVE_WCHAR_H''@|1|g' \
	      -e 's/@''GNULIB_BTOWC''@/1/g' \
	      -e 's/@''GNULIB_WCTOB''@/0/g' \
	      -e 's/@''GNULIB_MBSINIT''@/1/g' \
	      -e 's/@''GNULIB_MBRTOWC''@/1/g' \
	      -e 's/@''GNULIB_MBRLEN''@/0/g' \
	      -e 's/@''GNULIB_MBSRTOWCS''@/0/g' \
	      -e 's/@''GNULIB_MBSNRTOWCS''@/0/g' \
	      -e 's/@''GNULIB_WCRTOMB''@/1/g' \
	      -e 's/@''GNULIB_WCSRTOMBS''@/0/g' \
	      -e 's/@''GNULIB_WCSNRTOMBS''@/0/g' \
	      -e 's/@''GNULIB_WCWIDTH''@/0/g' \
	      -e 's/@''GNULIB_WMEMCHR''@/0/g' \
	      -e 's/@''GNULIB_WMEMCMP''@/0/g' \
	      -e 's/@''GNULIB_WMEMCPY''@/0/g' \
	      -e 's/@''GNULIB_WMEMMOVE''@/0/g' \
	      -e 's/@''GNULIB_WMEMSET''@/0/g' \
	      -e 's/@''GNULIB_WCSLEN''@/0/g' \
	      -e 's/@''GNULIB_WCSNLEN''@/0/g' \
	      -e 's/@''GNULIB_WCSCPY''@/0/g' \
	      -e 's/@''GNULIB_WCPCPY''@/0/g' \
	      -e 's/@''GNULIB_WCSNCPY''@/0/g' \
	      -e 's/@''GNULIB_WCPNCPY''@/0/g' \
	      -e 's/@''GNULIB_WCSCAT''@/0/g' \
	      -e 's/@''GNULIB_WCSNCAT''@/0/g' \
	      -e 's/@''GNULIB_WCSCMP''@/0/g' \
	      -e 's/@''GNULIB_WCSNCMP''@/0/g' \
	      -e 's/@''GNULIB_WCSCASECMP''@/0/g' \
	      -e 's/@''GNULIB_WCSNCASECMP''@/0/g' \
	      -e 's/@''GNULIB_WCSCOLL''@/0/g' \
	      -e 's/@''GNULIB_WCSXFRM''@/0/g' \
	      -e 's/@''GNULIB_WCSDUP''@/0/g' \
	      -e 's/@''GNULIB_WCSCHR''@/0/g' \
	      -e 's/@''GNULIB_WCSRCHR''@/0/g' \
	      -e 's/@''GNULIB_WCSCSPN''@/0/g' \
	      -e 's/@''GNULIB_WCSSPN''@/0/g' \
	      -e 's/@''GNULIB_WCSPBRK''@/0/g' \
	      -e 's/@''GNULIB_WCSSTR''@/0/g' \
	      -e 's/@''GNULIB_WCSTOK''@/0/g' \
	      -e 's/@''GNULIB_WCSWIDTH''@/0/g' \
	      < /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/wchar.in.h | \
	  sed -e 's|@''HAVE_WINT_T''@|1|g' \
	      -e 's|@''HAVE_BTOWC''@|1|g' \
	      -e 's|@''HAVE_MBSINIT''@|1|g' \
	      -e 's|@''HAVE_MBRTOWC''@|1|g' \
	      -e 's|@''HAVE_MBRLEN''@|1|g' \
	      -e 's|@''HAVE_MBSRTOWCS''@|1|g' \
	      -e 's|@''HAVE_MBSNRTOWCS''@|1|g' \
	      -e 's|@''HAVE_WCRTOMB''@|1|g' \
	      -e 's|@''HAVE_WCSRTOMBS''@|1|g' \
	      -e 's|@''HAVE_WCSNRTOMBS''@|1|g' \
	      -e 's|@''HAVE_WMEMCHR''@|1|g' \
	      -e 's|@''HAVE_WMEMCMP''@|1|g' \
	      -e 's|@''HAVE_WMEMCPY''@|1|g' \
	      -e 's|@''HAVE_WMEMMOVE''@|1|g' \
	      -e 's|@''HAVE_WMEMSET''@|1|g' \
	      -e 's|@''HAVE_WCSLEN''@|1|g' \
	      -e 's|@''HAVE_WCSNLEN''@|1|g' \
	      -e 's|@''HAVE_WCSCPY''@|1|g' \
	      -e 's|@''HAVE_WCPCPY''@|1|g' \
	      -e 's|@''HAVE_WCSNCPY''@|1|g' \
	      -e 's|@''HAVE_WCPNCPY''@|1|g' \
	      -e 's|@''HAVE_WCSCAT''@|1|g' \
	      -e 's|@''HAVE_WCSNCAT''@|1|g' \
	      -e 's|@''HAVE_WCSCMP''@|1|g' \
	      -e 's|@''HAVE_WCSNCMP''@|1|g' \
	      -e 's|@''HAVE_WCSCASECMP''@|1|g' \
	      -e 's|@''HAVE_WCSNCASECMP''@|1|g' \
	      -e 's|@''HAVE_WCSCOLL''@|1|g' \
	      -e 's|@''HAVE_WCSXFRM''@|1|g' \
	      -e 's|@''HAVE_WCSDUP''@|1|g' \
	      -e 's|@''HAVE_WCSCHR''@|1|g' \
	      -e 's|@''HAVE_WCSRCHR''@|1|g' \
	      -e 's|@''HAVE_WCSCSPN''@|1|g' \
	      -e 's|@''HAVE_WCSSPN''@|1|g' \
	      -e 's|@''HAVE_WCSPBRK''@|1|g' \
	      -e 's|@''HAVE_WCSSTR''@|1|g' \
	      -e 's|@''HAVE_WCSTOK''@|1|g' \
	      -e 's|@''HAVE_WCSWIDTH''@|1|g' \
	      -e 's|@''HAVE_DECL_WCTOB''@|1|g' \
	      -e 's|@''HAVE_DECL_WCWIDTH''@|1|g' \
	  | \
	  sed -e 's|@''REPLACE_MBSTATE_T''@|0|g' \
	      -e 's|@''REPLACE_BTOWC''@|0|g' \
	      -e 's|@''REPLACE_WCTOB''@|0|g' \
	      -e 's|@''REPLACE_MBSINIT''@|0|g' \
	      -e 's|@''REPLACE_MBRTOWC''@|0|g' \
	      -e 's|@''REPLACE_MBRLEN''@|0|g' \
	      -e 's|@''REPLACE_MBSRTOWCS''@|0|g' \
	      -e 's|@''REPLACE_MBSNRTOWCS''@|0|g' \
	      -e 's|@''REPLACE_WCRTOMB''@|0|g' \
	      -e 's|@''REPLACE_WCSRTOMBS''@|0|g' \
	      -e 's|@''REPLACE_WCSNRTOMBS''@|0|g' \
	      -e 's|@''REPLACE_WCWIDTH''@|0|g' \
	      -e 's|@''REPLACE_WCSWIDTH''@|0|g' \
	      -e '/definitions of _GL_FUNCDECL_RPL/r c++defs.h' \
	      -e '/definition of _GL_ARG_NONNULL/r arg-nonnull.h' \
	      -e '/definition of _GL_WARN_ON_USE/r warn-on-use.h'; \
	} > wchar.h-t && \
	mv wchar.h-t wchar.h
make  all-recursive
make[3]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/build/lib'
make[4]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/build/lib'
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o binary-io.lo /srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/binary-io.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o c-ctype.lo /srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/c-ctype.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o c-strcasecmp.lo /srv/ssd/sgw/builds/=
world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/c-strcase=
cmp.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o c-strncasecmp.lo /srv/ssd/sgw/builds=
/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/c-strnca=
secmp.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o dirname-lgpl.lo /srv/ssd/sgw/builds/=
world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/dirname-l=
gpl.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o basename-lgpl.lo /srv/ssd/sgw/builds=
/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/basename=
-lgpl.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o stripslash.lo /srv/ssd/sgw/builds/wo=
rld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/stripslash.=
c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o fd-hook.lo /srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/fd-hook.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o full-read.lo /srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/full-read.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o full-write.lo /srv/ssd/sgw/builds/wo=
rld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/full-write.=
c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o localcharset.lo /srv/ssd/sgw/builds/=
world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/localchar=
set.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o malloca.lo /srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/malloca.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/binary-io.c  -fPIC -DPIC -o .libs/binary-io.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o math.lo /srv/ssd/sgw/builds/world/tm=
p/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/math.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o nproc.lo /srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/nproc.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o pipe2.lo /srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/pipe2.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o safe-read.lo /srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/safe-read.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/c-ctype.c  -fPIC -DPIC -o .libs/c-ctype.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/c-strncasecmp.c  -fPIC -DPIC -o .libs/c-strncasecmp.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/basename-lgpl.c  -fPIC -DPIC -o .libs/basename-lgpl.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/stripslash.c  -fPIC -DPIC -o .libs/stripslash.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/c-strcasecmp.c  -fPIC -DPIC -o .libs/c-strcasecmp.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/dirname-lgpl.c  -fPIC -DPIC -o .libs/dirname-lgpl.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/fd-hook.c  -fPIC -DPIC -o .libs/fd-hook.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/localcharset.c  -fPIC -DPIC -o .libs/localcharset.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/full-write.c  -fPIC -DPIC -o .libs/full-write.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/nproc.c  -fPIC -DPIC -o .libs/nproc.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/math.c  -fPIC -DPIC -o .libs/math.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/stripslash.c -o stripslash.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/safe-read.c  -fPIC -DPIC -o .libs/safe-read.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/c-strcasecmp.c -o c-strcasecmp.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/full-read.c  -fPIC -DPIC -o .libs/full-read.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/basename-lgpl.c -o basename-lgpl.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/malloca.c  -fPIC -DPIC -o .libs/malloca.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/fd-hook.c -o fd-hook.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/binary-io.c -o binary-io.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/c-strncasecmp.c -o c-strncasecmp.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/full-write.c -o full-write.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/math.c -o math.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/pipe2.c  -fPIC -DPIC -o .libs/pipe2.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/full-read.c -o full-read.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/safe-read.c -o safe-read.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/c-ctype.c -o c-ctype.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/nproc.c -o nproc.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o safe-write.lo /srv/ssd/sgw/builds/wo=
rld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/safe-write.=
c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/dirname-lgpl.c -o dirname-lgpl.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o sockets.lo /srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/sockets.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o stat-time.lo /srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/stat-time.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o strftime.lo /srv/ssd/sgw/builds/worl=
d/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/strftime.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o striconveh.lo /srv/ssd/sgw/builds/wo=
rld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/striconveh.=
c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o sys_socket.lo /srv/ssd/sgw/builds/wo=
rld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/sys_socket.=
c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o unistd.lo /srv/ssd/sgw/builds/world/=
tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/unistd.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/malloca.c -o malloca.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o wctype-h.lo /srv/ssd/sgw/builds/worl=
d/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/wctype-h.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o xsize.lo /srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/xsize.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/pipe2.c -o pipe2.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o asnprintf.lo /srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/asnprintf.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistd.c  -fPIC -DPIC -o .libs/unistd.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/strftime.c  -fPIC -DPIC -o .libs/strftime.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/striconveh.c  -fPIC -DPIC -o .libs/striconveh.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/sockets.c  -fPIC -DPIC -o .libs/sockets.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/stat-time.c  -fPIC -DPIC -o .libs/stat-time.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/sys_socket.c  -fPIC -DPIC -o .libs/sys_socket.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o isnand.lo /srv/ssd/sgw/builds/world/=
tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/isnand.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/safe-write.c  -fPIC -DPIC -o .libs/safe-write.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/localcharset.c -o localcharset.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o isnanf.lo /srv/ssd/sgw/builds/world/=
tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/isnanf.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o isnanl.lo /srv/ssd/sgw/builds/world/=
tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/isnanl.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistd.c -o unistd.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/sockets.c -o sockets.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/wctype-h.c  -fPIC -DPIC -o .libs/wctype-h.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o printf-args.lo /srv/ssd/sgw/builds/w=
orld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/printf-arg=
s.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/asnprintf.c  -fPIC -DPIC -o .libs/asnprintf.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/sys_socket.c -o sys_socket.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/xsize.c  -fPIC -DPIC -o .libs/xsize.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/stat-time.c -o stat-time.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o printf-parse.lo /srv/ssd/sgw/builds/=
world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/printf-pa=
rse.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/isnanf.c  -fPIC -DPIC -o .libs/isnanf.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/safe-write.c -o safe-write.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o regex.lo /srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/regex.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o vasnprintf.lo /srv/ssd/sgw/builds/wo=
rld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/vasnprintf.=
c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/isnand.c  -fPIC -DPIC -o .libs/isnand.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/isnanl.c  -fPIC -DPIC -o .libs/isnanl.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/asnprintf.c -o asnprintf.o >/dev/null 2>&1
rm -f t-charset.alias charset.alias && \
	/bin/sh /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/guile-2.0.9/lib/config.charset 'x86_64-pc-linux-gnu' > t-charset.alias =
&& \
	mv t-charset.alias charset.alias
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/wctype-h.c -o wctype-h.o >/dev/null 2>&1
rm -f t-ref-add.sed ref-add.sed && \
	sed -e '/^#/d' -e 's/@''PACKAGE''@/guile/g' /srv/ssd/sgw/builds/world/tmp/=
work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/ref-add.sin > t-ref=
-add.sed && \
	mv t-ref-add.sed ref-add.sed
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/printf-args.c  -fPIC -DPIC -o .libs/printf-args.o
rm -f t-ref-del.sed ref-del.sed && \
	sed -e '/^#/d' -e 's/@''PACKAGE''@/guile/g' /srv/ssd/sgw/builds/world/tmp/=
work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/ref-del.sin > t-ref=
-del.sed && \
	mv t-ref-del.sed ref-del.sed
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/isnanl.c -o isnanl.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/printf-parse.c  -fPIC -DPIC -o .libs/printf-parse.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/regex.c  -fPIC -DPIC -o .libs/regex.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o unistr/u8-mbtouc.lo /srv/ssd/sgw/bui=
lds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/unist=
r/u8-mbtouc.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o unistr/u8-mbtouc-aux.lo /srv/ssd/sgw=
/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib/u=
nistr/u8-mbtouc-aux.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/isnanf.c -o isnanf.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/xsize.c -o xsize.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/isnand.c -o isnand.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o unistr/u8-mbtouc-unsafe.lo /srv/ssd/=
sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/li=
b/unistr/u8-mbtouc-unsafe.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
-I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0=
/guile-2.0.9/lib -I..   -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
usr/include -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -O2 -pipe -c -o unistr/u8-mbtouc-unsafe-aux.lo /srv/=
ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.=
9/lib/unistr/u8-mbtouc-unsafe-aux.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/vasnprintf.c  -fPIC -DPIC -o .libs/vasnprintf.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistr/u8-mbtouc-aux.c  -fPIC -DPIC -o unistr/.libs/u=
8-mbtouc-aux.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistr/u8-mbtouc.c  -fPIC -DPIC -o unistr/.libs/u8-mb=
touc.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistr/u8-mbtouc-unsafe.c  -fPIC -DPIC -o unistr/.lib=
s/u8-mbtouc-unsafe.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistr/u8-mbtouc-unsafe-aux.c  -fPIC -DPIC -o unistr/=
.libs/u8-mbtouc-unsafe-aux.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistr/u8-mbtouc.c -o unistr/u8-mbtouc.o >/dev/null 2=
>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistr/u8-mbtouc-unsafe.c -o unistr/u8-mbtouc-unsafe.=
o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/printf-args.c -o printf-args.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistr/u8-mbtouc-aux.c -o unistr/u8-mbtouc-aux.o >/de=
v/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/unistr/u8-mbtouc-unsafe-aux.c -o unistr/u8-mbtouc-uns=
afe-aux.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/striconveh.c -o striconveh.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/printf-parse.c -o printf-parse.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/strftime.c -o strftime.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/vasnprintf.c -o vasnprintf.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I.. -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0=
.9-r0/guile-2.0.9/lib/regex.c -o regex.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dlink gcc -fvisibility=3Dhidd=
en -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pip=
e  -no-undefined -lm -lm           -lrt   -lm -lm   -L/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/lib -lunistring -R/srv/ssd/sgw/builds/wo=
rld/tmp/sysroots/x86_64-linux/usr/lib -lm  -lm  -L/srv/ssd/sgw/builds/world=
/tmp/sysroots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroots=
/x86_64-linux/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x=
86_64-linux/lib -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-li=
nux/usr/lib -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/=
lib -Wl,-O1 -o libgnu.la  binary-io.lo c-ctype.lo c-strcasecmp.lo c-strncas=
ecmp.lo dirname-lgpl.lo basename-lgpl.lo stripslash.lo fd-hook.lo full-read=
.lo full-write.lo localcharset.lo malloca.lo math.lo nproc.lo pipe2.lo safe=
-read.lo safe-write.lo sockets.lo stat-time.lo strftime.lo striconveh.lo sy=
s_socket.lo unistd.lo unistr/u8-mbtouc.lo unistr/u8-mbtouc-aux.lo unistr/u8=
-mbtouc-unsafe.lo unistr/u8-mbtouc-unsafe-aux.lo    wctype-h.lo xsize.lo as=
nprintf.lo isnand.lo isnanf.lo isnanl.lo printf-args.lo printf-parse.lo reg=
ex.lo vasnprintf.lo  -lcrypt -lm=20
x86_64-linux-libtool: link: ar cru .libs/libgnu.a .libs/binary-io.o .libs/c=
-ctype.o .libs/c-strcasecmp.o .libs/c-strncasecmp.o .libs/dirname-lgpl.o .l=
ibs/basename-lgpl.o .libs/stripslash.o .libs/fd-hook.o .libs/full-read.o .l=
ibs/full-write.o .libs/localcharset.o .libs/malloca.o .libs/math.o .libs/np=
roc.o .libs/pipe2.o .libs/safe-read.o .libs/safe-write.o .libs/sockets.o .l=
ibs/stat-time.o .libs/strftime.o .libs/striconveh.o .libs/sys_socket.o .lib=
s/unistd.o unistr/.libs/u8-mbtouc.o unistr/.libs/u8-mbtouc-aux.o unistr/.li=
bs/u8-mbtouc-unsafe.o unistr/.libs/u8-mbtouc-unsafe-aux.o .libs/wctype-h.o =
.libs/xsize.o .libs/asnprintf.o .libs/isnand.o .libs/isnanf.o .libs/isnanl.=
o .libs/printf-args.o .libs/printf-parse.o .libs/regex.o .libs/vasnprintf.o=
=20
x86_64-linux-libtool: link: ranlib .libs/libgnu.a
x86_64-linux-libtool: link: ( cd ".libs" && rm -f "libgnu.la" && ln -s "../=
libgnu.la" "libgnu.la" )
make[4]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/build/lib'
make[3]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/build/lib'
make[2]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/build/lib'
Making all in meta
make[2]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/build/meta'
guile=3D"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/`echo =
guile | /bin/sed -e 's,x,x,'`" ;	\
	cat /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/=
guile-2.0.9/meta/guile-config.in						\
	| /bin/sed -e "s,@pkgconfigdir@,/srv/ssd/sgw/builds/world/tmp/sysroots/x86=
_64-linux/usr/lib/pkgconfig,g"			\
		 -e "s,@""PKG_CONFIG@,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux=
/usr/bin/pkg-config,g"				\
		 -e "s,@installed_guile@,$guile,g"				\
	> guile-config.out
mv guile-config.out guile-config
chmod +x guile-config
make[2]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/build/meta'
Making all in libguile
make[2]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/build/libguile'
\
	if [ "no" =3D "yes" ]; then \
		gcc -DHAVE_CONFIG_H  -I.. \
		   -c -o gen-scmconfig.o /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/gen-scmconfig.c; \
	else \
		gcc -DHAVE_CONFIG_H   -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sg=
w/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib =
-I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libf=
fi-3.0.13/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-li=
nux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/i=
nclude -Wall -Wmissing-prototypes -Wdeclaration-after-statement -Wpointer-a=
rith -Wswitch-enum -fno-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o gen-scmc=
onfig.o /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-=
r0/guile-2.0.9/libguile/gen-scmconfig.c; \
	fi
/bin/grep '^VM_DEFINE' /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/vm-i-system.c > vm-i-system.i
/bin/grep '^VM_DEFINE' /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/vm-i-scheme.c > vm-i-scheme.i
/bin/grep '^VM_DEFINE' /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/vm-i-loader.c > vm-i-loader.i
mv libpath.tmp libpath.h
\
	rm -f gen-scmconfig; \
	if [ "no" =3D "yes" ]; then \
		gcc -o gen-scmconfig gen-scmconfig.o; \
	else \
		../x86_64-linux-libtool  --tag=3DCC   --mode=3Dlink gcc -Wall -Wmissing-p=
rototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fno-=
strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -O2 -pipe  -L/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-li=
nux/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux=
/usr/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/lib -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-O=
1 -o gen-scmconfig gen-scmconfig.o  -lcrypt -lm ; \
	fi
x86_64-linux-libtool: link: gcc -Wall -Wmissing-prototypes -Wdeclaration-af=
ter-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibili=
ty=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inclu=
de -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-O2 -pipe -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64=
-linux/usr/lib -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x=
86_64-linux/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/usr/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/lib -Wl,-O1 -o gen-scmconfig gen-scmconfig.o  -L/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sy=
sroots/x86_64-linux/lib -lcrypt -lm
(rm -f scmconfig.h.tmp; \
	cat /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/=
guile-2.0.9/libguile/scmconfig.h.top > scmconfig.h.tmp; \
	./gen-scmconfig >> scmconfig.h.tmp; \
	chmod 444 scmconfig.h.tmp; \
	rm -f scmconfig.h; \
	mv scmconfig.h.tmp scmconfig.h)
../libguile/guile-snarf -o alist.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/alist.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o arbiters.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/arbiters.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o array-handle.x /srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/array-handle.c -D=
HAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/w=
orld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/=
include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/in=
clude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o array-map.x /srv/ssd/sgw/builds/world/tmp/work/x=
86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/array-map.c -DHAVE_C=
ONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o arrays.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/arrays.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o async.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/async.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o backtrace.x /srv/ssd/sgw/builds/world/tmp/work/x=
86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/backtrace.c -DHAVE_C=
ONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o boolean.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/boolean.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o bitvectors.x /srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/bitvectors.c -DHAVE=
_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/incl=
ude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o bytevectors.x /srv/ssd/sgw/builds/world/tmp/work=
/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/bytevectors.c -DHA=
VE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/in=
clude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/incl=
ude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o chars.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/chars.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o control.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/control.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o continuations.x /srv/ssd/sgw/builds/world/tmp/wo=
rk/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/continuations.c =
-DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds=
/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib=
 -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.1=
3/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/=
include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o debug.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/debug.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o deprecated.x /srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/deprecated.c -DHAVE=
_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/incl=
ude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o deprecation.x /srv/ssd/sgw/builds/world/tmp/work=
/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/deprecation.c -DHA=
VE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/in=
clude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/incl=
ude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o dynl.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/dynl.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o dynwind.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/dynwind.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o eq.x /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/eq.c -DHAVE_CONFIG_H -DBUIL=
DING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-n=
ative/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw=
/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o error.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/error.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o eval.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/eval.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o evalext.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/evalext.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o expand.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/expand.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o extensions.x /srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/extensions.c -DHAVE=
_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/incl=
ude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o feature.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/feature.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o filesys.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/filesys.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o fluids.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/fluids.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o foreign.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/foreign.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o fports.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/fports.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o gc-malloc.x /srv/ssd/sgw/builds/world/tmp/work/x=
86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/gc-malloc.c -DHAVE_C=
ONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o gc.x /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/gc.c -DHAVE_CONFIG_H -DBUIL=
DING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-n=
ative/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw=
/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o gettext.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/gettext.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o generalized-arrays.x /srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/generalized=
-arrays.c -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/=
sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/li=
b -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/li=
bffi-3.0.13/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-=
linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe
../libguile/guile-snarf -o generalized-vectors.x /srv/ssd/sgw/builds/world/=
tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/generalize=
d-vectors.c -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/w=
orld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ss=
d/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/=
lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/=
libffi-3.0.13/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/u=
sr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-O2 -pipe
../libguile/guile-snarf -o goops.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/goops.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o gsubr.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/gsubr.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o guardians.x /srv/ssd/sgw/builds/world/tmp/work/x=
86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/guardians.c -DHAVE_C=
ONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o hash.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/hash.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o hashtab.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/hashtab.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o hooks.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/hooks.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o i18n.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/i18n.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o init.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/init.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o ioext.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/ioext.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o keywords.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/keywords.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o list.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/list.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o load.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/load.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o macros.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/macros.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o mallocs.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/mallocs.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o memoize.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/memoize.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o modules.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/modules.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o numbers.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/numbers.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o objprop.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/objprop.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o options.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/options.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o pairs.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o ports.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/ports.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o print.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/print.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o procprop.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/procprop.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o procs.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/procs.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o promises.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/promises.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o r6rs-ports.x /srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/r6rs-ports.c -DHAVE=
_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/incl=
ude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o random.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/random.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o rdelim.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/rdelim.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o read.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/read.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o root.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/root.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o rw.x /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/rw.c -DHAVE_CONFIG_H -DBUIL=
DING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-n=
ative/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw=
/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o scmsigs.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/scmsigs.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o script.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/script.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o simpos.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/simpos.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o smob.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/smob.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o sort.x /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/sort.c -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o srcprop.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srcprop.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o srfi-1.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-1.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o srfi-4.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-4.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o srfi-13.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-13.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o srfi-14.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-14.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o srfi-60.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-60.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o stackchk.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/stackchk.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o stacks.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/stacks.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o stime.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/stime.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o strings.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/strings.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o strorder.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/strorder.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o strports.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/strports.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o struct.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/struct.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o symbols.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/symbols.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o threads.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/threads.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o throw.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/throw.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o trees.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/trees.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o uniform.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/uniform.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o values.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/values.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o variable.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/variable.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o vectors.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/vectors.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o version.x /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/version.c -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o vports.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/vports.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o weaks.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/weaks.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o frames.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/frames.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o instructions.x /srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/instructions.c -D=
HAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/w=
orld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/=
include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/in=
clude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o objcodes.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/objcodes.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o programs.x /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/programs.c -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o vm.x /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/vm.c -DHAVE_CONFIG_H -DBUIL=
DING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-n=
ative/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw=
/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o posix.x /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/posix.c -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o net_db.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/net_db.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o socket.x /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/socket.c -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
../libguile/guile-snarf -o regex-posix.x /srv/ssd/sgw/builds/world/tmp/work=
/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/regex-posix.c -DHA=
VE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/in=
clude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/incl=
ude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
make  all-am
make[3]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/build/libguile'
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-alist.lo `test=
 -f 'alist.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`alist.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-arbiters.lo `t=
est -f 'arbiters.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`arbiters.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-array-handle.l=
o `test -f 'array-handle.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`array-handle.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-array-map.lo `=
test -f 'array-map.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`array-map.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-arrays.lo `tes=
t -f 'arrays.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`arrays.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-async.lo `test=
 -f 'async.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`async.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-backtrace.lo `=
test -f 'backtrace.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`backtrace.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-boolean.lo `te=
st -f 'boolean.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`boolean.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-bitvectors.lo =
`test -f 'bitvectors.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`bitvectors.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-bytevectors.lo=
 `test -f 'bytevectors.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`bytevectors.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-chars.lo `test=
 -f 'chars.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`chars.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-control.lo `te=
st -f 'control.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`control.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-continuations.=
lo `test -f 'continuations.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x=
86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`continuations.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-debug.lo `test=
 -f 'debug.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`debug.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-deprecated.lo =
`test -f 'deprecated.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`deprecated.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-deprecation.lo=
 `test -f 'deprecation.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`deprecation.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/array-handle.c  -fPIC -DPIC -o .libs/libguil=
e_2.0_la-array-handle.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/arbiters.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-arbiters.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/array-map.c  -fPIC -DPIC -o .libs/libguile_2=
.0_la-array-map.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/backtrace.c  -fPIC -DPIC -o .libs/libguile_2=
.0_la-backtrace.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/control.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-control.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/debug.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-debug.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/alist.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-alist.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/bytevectors.c  -fPIC -DPIC -o .libs/libguile=
_2.0_la-bytevectors.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/deprecated.c  -fPIC -DPIC -o .libs/libguile_=
2.0_la-deprecated.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/continuations.c  -fPIC -DPIC -o .libs/libgui=
le_2.0_la-continuations.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/bitvectors.c  -fPIC -DPIC -o .libs/libguile_=
2.0_la-bitvectors.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/arrays.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-arrays.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/async.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-async.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/boolean.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-boolean.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/chars.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-chars.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/deprecation.c  -fPIC -DPIC -o .libs/libguile=
_2.0_la-deprecation.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/arbiters.c -o libguile_2.0_la-arbiters.o >/d=
ev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/array-handle.c -o libguile_2.0_la-array-hand=
le.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/debug.c -o libguile_2.0_la-debug.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/control.c -o libguile_2.0_la-control.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/deprecation.c -o libguile_2.0_la-deprecation=
.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/boolean.c -o libguile_2.0_la-boolean.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/backtrace.c -o libguile_2.0_la-backtrace.o >=
/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/alist.c -o libguile_2.0_la-alist.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/async.c -o libguile_2.0_la-async.o >/dev/nul=
l 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-dynwind.lo `te=
st -f 'dynwind.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`dynwind.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-eq.lo `test -f=
 'eq.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/libguile/'`eq.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/continuations.c -o libguile_2.0_la-continuat=
ions.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/chars.c -o libguile_2.0_la-chars.o >/dev/nul=
l 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-error.lo `test=
 -f 'error.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`error.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/array-map.c -o libguile_2.0_la-array-map.o >=
/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/arrays.c -o libguile_2.0_la-arrays.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/eq.c  -fPIC -DPIC -o .libs/libguile_2.0_la-e=
q.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/dynwind.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-dynwind.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-eval.lo `test =
-f 'eval.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`eval.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-evalext.lo `te=
st -f 'evalext.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`evalext.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/evalext.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-evalext.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/error.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-error.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-expand.lo `tes=
t -f 'expand.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`expand.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/eval.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-eval.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/bitvectors.c -o libguile_2.0_la-bitvectors.o=
 >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/expand.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-expand.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/evalext.c -o libguile_2.0_la-evalext.o >/dev=
/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-extensions.lo =
`test -f 'extensions.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`extensions.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/eq.c -o libguile_2.0_la-eq.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-feature.lo `te=
st -f 'feature.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`feature.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-filesys.lo `te=
st -f 'filesys.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`filesys.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/dynwind.c -o libguile_2.0_la-dynwind.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/extensions.c  -fPIC -DPIC -o .libs/libguile_=
2.0_la-extensions.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-finalizers.lo =
`test -f 'finalizers.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`finalizers.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/filesys.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-filesys.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/error.c -o libguile_2.0_la-error.o >/dev/nul=
l 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-fluids.lo `tes=
t -f 'fluids.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`fluids.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/feature.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-feature.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-foreign.lo `te=
st -f 'foreign.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`foreign.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/finalizers.c  -fPIC -DPIC -o .libs/libguile_=
2.0_la-finalizers.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/extensions.c -o libguile_2.0_la-extensions.o=
 >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/fluids.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-fluids.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-fports.lo `tes=
t -f 'fports.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`fports.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/foreign.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-foreign.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-frames.lo `tes=
t -f 'frames.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`frames.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/feature.c -o libguile_2.0_la-feature.o >/dev=
/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-gc-malloc.lo `=
test -f 'gc-malloc.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`gc-malloc.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-gc.lo `test -f=
 'gc.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/libguile/'`gc.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/frames.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-frames.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/finalizers.c -o libguile_2.0_la-finalizers.o=
 >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-gdbint.lo `tes=
t -f 'gdbint.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`gdbint.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/deprecated.c -o libguile_2.0_la-deprecated.o=
 >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/fports.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-fports.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gc.c  -fPIC -DPIC -o .libs/libguile_2.0_la-g=
c.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gc-malloc.c  -fPIC -DPIC -o .libs/libguile_2=
.0_la-gc-malloc.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/eval.c -o libguile_2.0_la-eval.o >/dev/null =
2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/bytevectors.c -o libguile_2.0_la-bytevectors=
.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/frames.c -o libguile_2.0_la-frames.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/expand.c -o libguile_2.0_la-expand.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gc-malloc.c -o libguile_2.0_la-gc-malloc.o >=
/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gc.c -o libguile_2.0_la-gc.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/fluids.c -o libguile_2.0_la-fluids.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/foreign.c -o libguile_2.0_la-foreign.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/filesys.c -o libguile_2.0_la-filesys.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/fports.c -o libguile_2.0_la-fports.o >/dev/n=
ull 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-gettext.lo `te=
st -f 'gettext.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`gettext.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-generalized-ar=
rays.lo `test -f 'generalized-arrays.c' || echo '/srv/ssd/sgw/builds/world/=
tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`generali=
zed-arrays.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-generalized-ve=
ctors.lo `test -f 'generalized-vectors.c' || echo '/srv/ssd/sgw/builds/worl=
d/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`genera=
lized-vectors.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-goops.lo `test=
 -f 'goops.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`goops.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-gsubr.lo `test=
 -f 'gsubr.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`gsubr.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-guardians.lo `=
test -f 'guardians.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`guardians.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-hash.lo `test =
-f 'hash.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`hash.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gettext.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-gettext.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-hashtab.lo `te=
st -f 'hashtab.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`hashtab.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/goops.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-goops.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gsubr.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-gsubr.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/generalized-arrays.c  -fPIC -DPIC -o .libs/l=
ibguile_2.0_la-generalized-arrays.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/guardians.c  -fPIC -DPIC -o .libs/libguile_2=
.0_la-guardians.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gdbint.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-gdbint.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-hooks.lo `test=
 -f 'hooks.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`hooks.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/generalized-vectors.c  -fPIC -DPIC -o .libs/=
libguile_2.0_la-generalized-vectors.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/hooks.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-hooks.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/hash.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-hash.o
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/gettext.c: In function 'scm_gettext':
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/gettext.c:123:8: warning: variable 'c_category' set but not=
 used [-Wunused-but-set-variable]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/gettext.c: In function 'scm_ngettext':
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/gettext.c:186:8: warning: variable 'c_category' set but not=
 used [-Wunused-but-set-variable]
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-i18n.lo `test =
-f 'i18n.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`i18n.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/hashtab.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-hashtab.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gdbint.c -o libguile_2.0_la-gdbint.o >/dev/n=
ull 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-init.lo `test =
-f 'init.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`init.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gettext.c -o libguile_2.0_la-gettext.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/generalized-vectors.c -o libguile_2.0_la-gen=
eralized-vectors.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-inline.lo `tes=
t -f 'inline.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`inline.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-instructions.l=
o `test -f 'instructions.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`instructions.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/gsubr.c -o libguile_2.0_la-gsubr.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/i18n.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-i18n.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/guardians.c -o libguile_2.0_la-guardians.o >=
/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/inline.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-inline.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/init.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-init.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/generalized-arrays.c -o libguile_2.0_la-gene=
ralized-arrays.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/instructions.c  -fPIC -DPIC -o .libs/libguil=
e_2.0_la-instructions.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/hooks.c -o libguile_2.0_la-hooks.o >/dev/nul=
l 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-ioext.lo `test=
 -f 'ioext.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`ioext.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/hash.c -o libguile_2.0_la-hash.o >/dev/null =
2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/ioext.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-ioext.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-keywords.lo `t=
est -f 'keywords.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`keywords.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-list.lo `test =
-f 'list.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`list.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-load.lo `test =
-f 'load.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`load.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/inline.c -o libguile_2.0_la-inline.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/keywords.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-keywords.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/list.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-list.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-macros.lo `tes=
t -f 'macros.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`macros.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/init.c -o libguile_2.0_la-init.o >/dev/null =
2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/load.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-load.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-mallocs.lo `te=
st -f 'mallocs.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`mallocs.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/macros.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-macros.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-memoize.lo `te=
st -f 'memoize.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`memoize.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-modules.lo `te=
st -f 'modules.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`modules.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-null-threads.l=
o `test -f 'null-threads.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`null-threads.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-numbers.lo `te=
st -f 'numbers.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`numbers.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/keywords.c -o libguile_2.0_la-keywords.o >/d=
ev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/memoize.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-memoize.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-objcodes.lo `t=
est -f 'objcodes.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`objcodes.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/ioext.c -o libguile_2.0_la-ioext.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/modules.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-modules.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/hashtab.c -o libguile_2.0_la-hashtab.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/null-threads.c  -fPIC -DPIC -o .libs/libguil=
e_2.0_la-null-threads.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-objprop.lo `te=
st -f 'objprop.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`objprop.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/numbers.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-numbers.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/objcodes.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-objcodes.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/objprop.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-objprop.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/macros.c -o libguile_2.0_la-macros.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/i18n.c -o libguile_2.0_la-i18n.o >/dev/null =
2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/null-threads.c -o libguile_2.0_la-null-threa=
ds.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/list.c -o libguile_2.0_la-list.o >/dev/null =
2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-options.lo `te=
st -f 'options.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`options.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/objprop.c -o libguile_2.0_la-objprop.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/options.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-options.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-pairs.lo `test=
 -f 'pairs.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`pairs.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/objcodes.c -o libguile_2.0_la-objcodes.o >/d=
ev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/load.c -o libguile_2.0_la-load.o >/dev/null =
2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/pairs.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-pairs.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-poll.lo `test =
-f 'poll.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`poll.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-ports.lo `test=
 -f 'ports.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`ports.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/mallocs.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-mallocs.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/modules.c -o libguile_2.0_la-modules.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/poll.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-poll.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/ports.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-ports.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-print.lo `test=
 -f 'print.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`print.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/options.c -o libguile_2.0_la-options.o >/dev=
/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-procprop.lo `t=
est -f 'procprop.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`procprop.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/print.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-print.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/mallocs.c -o libguile_2.0_la-mallocs.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/poll.c -o libguile_2.0_la-poll.o >/dev/null =
2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/procprop.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-procprop.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-procs.lo `test=
 -f 'procs.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`procs.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/memoize.c -o libguile_2.0_la-memoize.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/goops.c -o libguile_2.0_la-goops.o >/dev/nul=
l 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-programs.lo `t=
est -f 'programs.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`programs.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/procs.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-procs.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-promises.lo `t=
est -f 'promises.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`promises.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-r6rs-ports.lo =
`test -f 'r6rs-ports.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`r6rs-ports.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/r6rs-ports.c  -fPIC -DPIC -o .libs/libguile_=
2.0_la-r6rs-ports.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-random.lo `tes=
t -f 'random.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`random.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/programs.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-programs.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/promises.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-promises.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/pairs.c -o libguile_2.0_la-pairs.o >/dev/nul=
l 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-rdelim.lo `tes=
t -f 'rdelim.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`rdelim.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-read.lo `test =
-f 'read.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`read.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/random.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-random.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-root.lo `test =
-f 'root.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`root.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/rdelim.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-rdelim.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/procprop.c -o libguile_2.0_la-procprop.o >/d=
ev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/read.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-read.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/procs.c -o libguile_2.0_la-procs.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/root.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-root.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/promises.c -o libguile_2.0_la-promises.o >/d=
ev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/rdelim.c -o libguile_2.0_la-rdelim.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/programs.c -o libguile_2.0_la-programs.o >/d=
ev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-rw.lo `test -f=
 'rw.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/libguile/'`rw.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-scmsigs.lo `te=
st -f 'scmsigs.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`scmsigs.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/root.c -o libguile_2.0_la-root.o >/dev/null =
2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-script.lo `tes=
t -f 'script.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`script.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-simpos.lo `tes=
t -f 'simpos.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`simpos.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/r6rs-ports.c -o libguile_2.0_la-r6rs-ports.o=
 >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/rw.c  -fPIC -DPIC -o .libs/libguile_2.0_la-r=
w.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-smob.lo `test =
-f 'smob.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`smob.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/scmsigs.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-scmsigs.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/script.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-script.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/random.c -o libguile_2.0_la-random.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/print.c -o libguile_2.0_la-print.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/simpos.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-simpos.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-sort.lo `test =
-f 'sort.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-=
native/2.0.9-r0/guile-2.0.9/libguile/'`sort.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/smob.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-smob.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/instructions.c -o libguile_2.0_la-instructio=
ns.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-srcprop.lo `te=
st -f 'srcprop.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`srcprop.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/sort.c  -fPIC -DPIC -o .libs/libguile_2.0_la=
-sort.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/simpos.c -o libguile_2.0_la-simpos.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/rw.c -o libguile_2.0_la-rw.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-srfi-1.lo `tes=
t -f 'srfi-1.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`srfi-1.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/script.c -o libguile_2.0_la-script.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srcprop.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-srcprop.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/ports.c -o libguile_2.0_la-ports.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/scmsigs.c -o libguile_2.0_la-scmsigs.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-1.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-srfi-1.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/smob.c -o libguile_2.0_la-smob.o >/dev/null =
2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/read.c -o libguile_2.0_la-read.o >/dev/null =
2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-srfi-4.lo `tes=
t -f 'srfi-4.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`srfi-4.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-srfi-13.lo `te=
st -f 'srfi-13.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`srfi-13.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-srfi-14.lo `te=
st -f 'srfi-14.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`srfi-14.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-srfi-60.lo `te=
st -f 'srfi-60.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`srfi-60.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-13.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-srfi-13.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-4.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-srfi-4.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srcprop.c -o libguile_2.0_la-srcprop.o >/dev=
/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-stackchk.lo `t=
est -f 'stackchk.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`stackchk.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-60.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-srfi-60.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-14.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-srfi-14.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/sort.c -o libguile_2.0_la-sort.o >/dev/null =
2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-stacks.lo `tes=
t -f 'stacks.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`stacks.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/stackchk.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-stackchk.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/stacks.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-stacks.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-stime.lo `test=
 -f 'stime.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`stime.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-strings.lo `te=
st -f 'strings.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`strings.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/stime.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-stime.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-1.c -o libguile_2.0_la-srfi-1.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-60.c -o libguile_2.0_la-srfi-60.o >/dev=
/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-strorder.lo `t=
est -f 'strorder.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`strorder.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/strings.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-strings.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/stackchk.c -o libguile_2.0_la-stackchk.o >/d=
ev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-strports.lo `t=
est -f 'strports.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`strports.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/strorder.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-strorder.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/strports.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-strports.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-struct.lo `tes=
t -f 'struct.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`struct.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-symbols.lo `te=
st -f 'symbols.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`symbols.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/struct.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-struct.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-threads.lo `te=
st -f 'threads.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`threads.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/stime.c -o libguile_2.0_la-stime.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/symbols.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-symbols.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/stacks.c -o libguile_2.0_la-stacks.o >/dev/n=
ull 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-throw.lo `test=
 -f 'throw.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`throw.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/throw.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-throw.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/threads.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-threads.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/strorder.c -o libguile_2.0_la-strorder.o >/d=
ev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-trees.lo `test=
 -f 'trees.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`trees.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/strports.c -o libguile_2.0_la-strports.o >/d=
ev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/trees.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-trees.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-uniform.lo `te=
st -f 'uniform.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`uniform.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-4.c -o libguile_2.0_la-srfi-4.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/symbols.c -o libguile_2.0_la-symbols.o >/dev=
/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-values.lo `tes=
t -f 'values.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`values.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-variable.lo `t=
est -f 'variable.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`variable.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/uniform.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-uniform.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/values.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-values.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/variable.c  -fPIC -DPIC -o .libs/libguile_2.=
0_la-variable.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/throw.c -o libguile_2.0_la-throw.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/trees.c -o libguile_2.0_la-trees.o >/dev/nul=
l 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/struct.c -o libguile_2.0_la-struct.o >/dev/n=
ull 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-vectors.lo `te=
st -f 'vectors.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`vectors.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-version.lo `te=
st -f 'version.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
guile-native/2.0.9-r0/guile-2.0.9/libguile/'`version.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/vectors.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-vectors.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/version.c  -fPIC -DPIC -o .libs/libguile_2.0=
_la-version.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/uniform.c -o libguile_2.0_la-uniform.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/values.c -o libguile_2.0_la-values.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/variable.c -o libguile_2.0_la-variable.o >/d=
ev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/strings.c -o libguile_2.0_la-strings.o >/dev=
/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-vm.lo `test -f=
 'vm.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/libguile/'`vm.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-vports.lo `tes=
t -f 'vports.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gu=
ile-native/2.0.9-r0/guile-2.0.9/libguile/'`vports.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/vm.c  -fPIC -DPIC -o .libs/libguile_2.0_la-v=
m.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-14.c -o libguile_2.0_la-srfi-14.o >/dev=
/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o libguile_2.0_la-weaks.lo `test=
 -f 'weaks.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guil=
e-native/2.0.9-r0/guile-2.0.9/libguile/'`weaks.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/vports.c  -fPIC -DPIC -o .libs/libguile_2.0_=
la-vports.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/weaks.c  -fPIC -DPIC -o .libs/libguile_2.0_l=
a-weaks.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/version.c -o libguile_2.0_la-version.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/threads.c -o libguile_2.0_la-threads.o >/dev=
/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o dynl.lo /srv/ssd/sgw/builds/wo=
rld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/dynl.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o posix.lo /srv/ssd/sgw/builds/w=
orld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/posix=
.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/posix.c  -fPIC -DPIC -o .libs/posix.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/dynl.c  -fPIC -DPIC -o .libs/dynl.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o net_db.lo /srv/ssd/sgw/builds/=
world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/net_=
db.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o socket.lo /srv/ssd/sgw/builds/=
world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/sock=
et.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/vports.c -o libguile_2.0_la-vports.o >/dev/n=
ull 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/vectors.c -o libguile_2.0_la-vectors.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/net_db.c  -fPIC -DPIC -o .libs/net_db.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/socket.c  -fPIC -DPIC -o .libs/socket.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H =
  -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -Wall -Wmissing=
-prototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fn=
o-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include -O2 -pipe -c -o regex-posix.lo /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile=
/regex-posix.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/weaks.c -o libguile_2.0_la-weaks.o >/dev/nul=
l 2>&1
gcc -DHAVE_CONFIG_H   -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/=
builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I=
../lib -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi=
-3.0.13/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -pth=
read -Wall -Wmissing-prototypes -Wdeclaration-after-statement -Wpointer-ari=
th -Wswitch-enum -fno-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o guile-guil=
e.o `test -f 'guile.c' || echo '/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/'`guile.c
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/srfi-13.c -o libguile_2.0_la-srfi-13.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/regex-posix.c  -fPIC -DPIC -o .libs/regex-po=
six.o
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/numbers.c -o libguile_2.0_la-numbers.o >/dev=
/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/dynl.c -o dynl.o >/dev/null 2>&1
\
	if [ "no" =3D "yes" ]; then \
		gcc -I.. -c -o c-tokenize.o /srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9/libguile/c-tokenize.c; \
	else \
		gcc -DHAVE_CONFIG_H   -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sg=
w/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib =
-I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libf=
fi-3.0.13/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-li=
nux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/i=
nclude -Wall -Wmissing-prototypes -Wdeclaration-after-statement -Wpointer-a=
rith -Wswitch-enum -fno-strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o c-tokeni=
ze.o /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/=
guile-2.0.9/libguile/c-tokenize.c; \
	fi
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/posix.c: In function 'scm_nice':
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/posix.c:1806:8: warning: ignoring return value of 'nice', d=
eclared with attribute warn_unused_result [-Wunused-result]
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/net_db.c -o net_db.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/regex-posix.c -o regex-posix.o >/dev/null 2>=
&1
\
	rm -f guile_filter_doc_snarfage; \
	if [ "no" =3D "yes" ]; then \
		gcc -o guile_filter_doc_snarfage c-tokenize.o; \
	else \
		../x86_64-linux-libtool  --tag=3DCC   --mode=3Dlink gcc -Wall -Wmissing-p=
rototypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fno-=
strict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -O2 -pipe  -L/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-li=
nux/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux=
/usr/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/lib -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/li=
b -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-O=
1 -o guile_filter_doc_snarfage c-tokenize.o  ../lib/libgnu.la -lcrypt -lm ;=
 \
	fi
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/socket.c -o socket.o >/dev/null 2>&1
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/posix.c -o posix.o >/dev/null 2>&1
x86_64-linux-libtool: link: gcc -Wall -Wmissing-prototypes -Wdeclaration-af=
ter-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibili=
ty=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inclu=
de -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-O2 -pipe -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64=
-linux/usr/lib -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x=
86_64-linux/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/usr/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/lib -Wl,-O1 -o guile_filter_doc_snarfage c-tokenize.o  -L/srv/ssd/s=
gw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/lib ../lib/.libs/libgnu.a -lrt //srv/ssd/sgw/b=
uilds/world/tmp/sysroots/x86_64-linux/usr/lib/libunistring.so -L=3Dsrv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -L=3Dsrv/ssd/sgw/builds/=
world/tmp/sysroots/x86_64-linux/lib -lcrypt -lm -Wl,-rpath -Wl,/srv/ssd/sgw=
/builds/world/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath -Wl,srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib
./guile-snarf-docs -o alist.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/alist.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o arbiters.doc /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/arbiters.c -- -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o array-handle.doc /srv/ssd/sgw/builds/world/tmp/work/x=
86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/array-handle.c -- -D=
HAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/w=
orld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/=
include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/in=
clude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o array-map.doc /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/array-map.c -- -DHAVE_C=
ONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o arrays.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/arrays.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o async.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/async.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o backtrace.doc /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/backtrace.c -- -DHAVE_C=
ONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o boolean.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/boolean.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o bitvectors.doc /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/bitvectors.c -- -DHAVE=
_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/incl=
ude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o bytevectors.doc /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/bytevectors.c -- -DHA=
VE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/in=
clude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/incl=
ude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o chars.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/chars.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o control.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/control.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o continuations.doc /srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/continuations.c -- =
-DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds=
/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib=
 -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.1=
3/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/=
include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o debug.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/debug.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o deprecated.doc /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/deprecated.c -- -DHAVE=
_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/incl=
ude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o deprecation.doc /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/deprecation.c -- -DHA=
VE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/in=
clude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/incl=
ude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o dynl.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/dynl.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o dynwind.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/dynwind.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o eq.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/eq.c -- -DHAVE_CONFIG_H -DBUIL=
DING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-n=
ative/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw=
/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o error.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/error.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o eval.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/eval.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o evalext.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/evalext.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o expand.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/expand.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o extensions.doc /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/extensions.c -- -DHAVE=
_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/incl=
ude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o feature.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/feature.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o filesys.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/filesys.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o fluids.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/fluids.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o foreign.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/foreign.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o fports.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/fports.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o gc-malloc.doc /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/gc-malloc.c -- -DHAVE_C=
ONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o gc.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/gc.c -- -DHAVE_CONFIG_H -DBUIL=
DING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-n=
ative/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw=
/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o gettext.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/gettext.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o generalized-arrays.doc /srv/ssd/sgw/builds/world/tmp/=
work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/generalized-ar=
rays.c -- -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/=
sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/li=
b -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/li=
bffi-3.0.13/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-=
linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O=
2 -pipe
./guile-snarf-docs -o generalized-vectors.doc /srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/generalized-v=
ectors.c -- -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/w=
orld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ss=
d/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/=
lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/=
libffi-3.0.13/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/u=
sr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-O2 -pipe
./guile-snarf-docs -o goops.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/goops.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o gsubr.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/gsubr.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o guardians.doc /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/guardians.c -- -DHAVE_C=
ONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/includ=
e  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o hash.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/hash.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o hashtab.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/hashtab.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o hooks.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/hooks.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o i18n.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/i18n.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o init.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/init.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o ioext.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/ioext.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o keywords.doc /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/keywords.c -- -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o list.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/list.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o load.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/load.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o macros.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/macros.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o mallocs.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/mallocs.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o memoize.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/memoize.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/memoize.c:515:***Mismatching FUNC_NAME.  Should be: `#defin=
e FUNC_NAME s_"@prompt"'
./guile-snarf-docs -o modules.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/modules.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o numbers.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/numbers.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o objprop.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/objprop.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o options.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/options.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o pairs.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o ports.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/ports.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:147:***Missing or erroneous `#define FUNC_NAME s_sc=
m_cdr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:150:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:155:***Missing or er=
roneous `#define FUNC_NAME s_scm_cddr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:158:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:163:***Missing or er=
roneous `#define FUNC_NAME s_scm_cadr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:166:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:171:***Missing or er=
roneous `#define FUNC_NAME s_scm_cdddr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:174:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:179:***Missing or er=
roneous `#define FUNC_NAME s_scm_cdadr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:182:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:187:***Missing or er=
roneous `#define FUNC_NAME s_scm_caddr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:190:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:195:***Missing or er=
roneous `#define FUNC_NAME s_scm_caadr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:198:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:203:***Missing or er=
roneous `#define FUNC_NAME s_scm_cddddr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:206:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:211:***Missing or er=
roneous `#define FUNC_NAME s_scm_cddadr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:214:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:219:***Missing or er=
roneous `#define FUNC_NAME s_scm_cdaddr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:222:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:227:***Missing or er=
roneous `#define FUNC_NAME s_scm_cdaadr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:230:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:235:***Missing or er=
roneous `#define FUNC_NAME s_scm_cadddr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:238:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:243:***Missing or er=
roneous `#define FUNC_NAME s_scm_cadadr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:246:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:251:***Missing or er=
roneous `#define FUNC_NAME s_scm_caaddr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:254:***/srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/pairs.c:259:***Missing or er=
roneous `#define FUNC_NAME s_scm_caaadr'
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile=
-2.0.9/libguile/pairs.c:262:***Missing or erroneous #undef for scm_car:=20
Missing or erroneous #undef for scm_cdar:=20
Missing or erroneous #undef for scm_caar:=20
Missing or erroneous #undef for scm_cddar:=20
Missing or erroneous #undef for scm_cdaar:=20
Missing or erroneous #undef for scm_cadar:=20
Missing or erroneous #undef for scm_caaar:=20
Missing or erroneous #undef for scm_cdddar:=20
Missing or erroneous #undef for scm_cddaar:=20
Missing or erroneous #undef for scm_cdadar:=20
Missing or erroneous #undef for scm_cdaaar:=20
Missing or erroneous #undef for scm_caddar:=20
Missing or erroneous #undef for scm_cadaar:=20
Missing or erroneous #undef for scm_caadar:=20
Missing or erroneous #undef for scm_caaaar:=20
./guile-snarf-docs -o print.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/print.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o procprop.doc /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/procprop.c -- -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o procs.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/procs.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o promises.doc /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/promises.c -- -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o r6rs-ports.doc /srv/ssd/sgw/builds/world/tmp/work/x86=
_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/r6rs-ports.c -- -DHAVE=
_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/incl=
ude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o random.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/random.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o rdelim.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/rdelim.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o read.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/read.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o root.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/root.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o rw.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/guile-native/2.0.9-r0/guile-2.0.9/libguile/rw.c -- -DHAVE_CONFIG_H -DBUIL=
DING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-n=
ative/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw=
/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o scmsigs.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/scmsigs.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o script.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/script.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o simpos.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/simpos.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o smob.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/smob.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o sort.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-li=
nux/guile-native/2.0.9-r0/guile-2.0.9/libguile/sort.c -- -DHAVE_CONFIG_H -D=
BUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/gui=
le-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isyste=
m/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o srcprop.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srcprop.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o srfi-1.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-1.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o srfi-4.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-4.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o srfi-13.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-13.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o srfi-14.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-14.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o srfi-60.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/srfi-60.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o stackchk.doc /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/stackchk.c -- -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o stacks.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/stacks.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o stime.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/stime.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o strings.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/strings.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o strorder.doc /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/strorder.c -- -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o strports.doc /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/strports.c -- -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o struct.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/struct.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o symbols.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/symbols.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o threads.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/threads.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o throw.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/throw.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o trees.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/trees.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o uniform.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/uniform.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o values.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/values.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o variable.doc /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/variable.c -- -DHAVE_CON=
FIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include =
 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o vectors.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/vectors.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o version.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64=
-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/version.c -- -DHAVE_CONFI=
G_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/=
sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -=
isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o vports.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/vports.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o weaks.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/weaks.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o posix.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-l=
inux/guile-native/2.0.9-r0/guile-2.0.9/libguile/posix.c -- -DHAVE_CONFIG_H =
-DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/g=
uile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -isys=
tem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/s=
sd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o net_db.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/net_db.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o socket.doc /srv/ssd/sgw/builds/world/tmp/work/x86_64-=
linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/socket.c -- -DHAVE_CONFIG_=
H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/include  -is=
ystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv=
/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/bu=
ilds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
./guile-snarf-docs -o regex-posix.doc /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libguile/regex-posix.c -- -DHA=
VE_CONFIG_H -DBUILDING_LIBGUILE=3D1 -I/srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/guile-native/2.0.9-r0/guile-2.0.9 -I.. -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/lib -I../lib -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi-3.0.13/in=
clude  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/incl=
ude -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -isystem/srv/=
ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe
x86_64-linux-libtool: compile:  gcc -DHAVE_CONFIG_H -DBUILDING_LIBGUILE=3D1=
 -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/gu=
ile-2.0.9 -I.. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-nati=
ve/2.0.9-r0/guile-2.0.9/lib -I../lib -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib/libffi-3.0.13/include -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-=
after-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibi=
lity=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -c /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native=
/2.0.9-r0/guile-2.0.9/libguile/vm.c -o libguile_2.0_la-vm.o >/dev/null 2>&1
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dlink gcc -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing-pro=
totypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fno-st=
rict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -O2 -pipe -L/srv/ssd/sgw/builds/world/tmp/sysroots=
/x86_64-linux/usr/lib -lgc  -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64=
-linux/usr/lib -lffi  -lm -lm           -lrt -lm -lm   -L/srv/ssd/sgw/build=
s/world/tmp/sysroots/x86_64-linux/usr/lib -lunistring -R/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/lib -lm  -lm -version-info 29:0:7 -exp=
ort-dynamic -no-undefined -Wl,-z -Wl,relro -Wl,--version-script=3D"/srv/ssd=
/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/l=
ibguile/libguile.map" -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux=
/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-rpa=
th-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rp=
ath-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-rpath=
,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o libguile-2.=
0.la -rpath /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib lib=
guile_2.0_la-alist.lo libguile_2.0_la-arbiters.lo libguile_2.0_la-array-han=
dle.lo libguile_2.0_la-array-map.lo libguile_2.0_la-arrays.lo libguile_2.0_=
la-async.lo libguile_2.0_la-backtrace.lo libguile_2.0_la-boolean.lo libguil=
e_2.0_la-bitvectors.lo libguile_2.0_la-bytevectors.lo libguile_2.0_la-chars=
.lo libguile_2.0_la-control.lo libguile_2.0_la-continuations.lo libguile_2.=
0_la-debug.lo libguile_2.0_la-deprecated.lo libguile_2.0_la-deprecation.lo =
libguile_2.0_la-dynwind.lo libguile_2.0_la-eq.lo libguile_2.0_la-error.lo l=
ibguile_2.0_la-eval.lo libguile_2.0_la-evalext.lo libguile_2.0_la-expand.lo=
 libguile_2.0_la-extensions.lo libguile_2.0_la-feature.lo libguile_2.0_la-f=
ilesys.lo libguile_2.0_la-finalizers.lo libguile_2.0_la-fluids.lo libguile_=
2.0_la-foreign.lo libguile_2.0_la-fports.lo libguile_2.0_la-frames.lo libgu=
ile_2.0_la-gc-malloc.lo libguile_2.0_la-gc.lo libguile_2.0_la-gdbint.lo lib=
guile_2.0_la-gettext.lo libguile_2.0_la-generalized-arrays.lo libguile_2.0_=
la-generalized-vectors.lo libguile_2.0_la-goops.lo libguile_2.0_la-gsubr.lo=
 libguile_2.0_la-guardians.lo libguile_2.0_la-hash.lo libguile_2.0_la-hasht=
ab.lo libguile_2.0_la-hooks.lo libguile_2.0_la-i18n.lo libguile_2.0_la-init=
.lo libguile_2.0_la-inline.lo libguile_2.0_la-instructions.lo libguile_2.0_=
la-ioext.lo libguile_2.0_la-keywords.lo libguile_2.0_la-list.lo libguile_2.=
0_la-load.lo libguile_2.0_la-macros.lo libguile_2.0_la-mallocs.lo libguile_=
2.0_la-memoize.lo libguile_2.0_la-modules.lo libguile_2.0_la-null-threads.l=
o libguile_2.0_la-numbers.lo libguile_2.0_la-objcodes.lo libguile_2.0_la-ob=
jprop.lo libguile_2.0_la-options.lo libguile_2.0_la-pairs.lo libguile_2.0_l=
a-poll.lo libguile_2.0_la-ports.lo libguile_2.0_la-print.lo libguile_2.0_la=
-procprop.lo libguile_2.0_la-procs.lo libguile_2.0_la-programs.lo libguile_=
2.0_la-promises.lo libguile_2.0_la-r6rs-ports.lo libguile_2.0_la-random.lo =
libguile_2.0_la-rdelim.lo libguile_2.0_la-read.lo libguile_2.0_la-root.lo l=
ibguile_2.0_la-rw.lo libguile_2.0_la-scmsigs.lo libguile_2.0_la-script.lo l=
ibguile_2.0_la-simpos.lo libguile_2.0_la-smob.lo libguile_2.0_la-sort.lo li=
bguile_2.0_la-srcprop.lo libguile_2.0_la-srfi-1.lo libguile_2.0_la-srfi-4.l=
o libguile_2.0_la-srfi-13.lo libguile_2.0_la-srfi-14.lo libguile_2.0_la-srf=
i-60.lo libguile_2.0_la-stackchk.lo libguile_2.0_la-stacks.lo libguile_2.0_=
la-stime.lo libguile_2.0_la-strings.lo libguile_2.0_la-strorder.lo libguile=
_2.0_la-strports.lo libguile_2.0_la-struct.lo libguile_2.0_la-symbols.lo li=
bguile_2.0_la-threads.lo libguile_2.0_la-throw.lo libguile_2.0_la-trees.lo =
libguile_2.0_la-uniform.lo libguile_2.0_la-values.lo libguile_2.0_la-variab=
le.lo libguile_2.0_la-vectors.lo libguile_2.0_la-version.lo libguile_2.0_la=
-vm.lo libguile_2.0_la-vports.lo libguile_2.0_la-weaks.lo dynl.lo posix.lo =
net_db.lo socket.lo regex-posix.lo ../lib/libgnu.la -L/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/lib -lgmp -R/srv/ssd/sgw/builds/world/tm=
p/sysroots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/lib -lltdl -ldl -R/srv/ssd/sgw/builds/world/tmp/sysroots/x86=
_64-linux/usr/lib -lcrypt -lm=20
x86_64-linux-libtool: link: gcc -shared  -fPIC -DPIC  .libs/libguile_2.0_la=
-alist.o .libs/libguile_2.0_la-arbiters.o .libs/libguile_2.0_la-array-handl=
e.o .libs/libguile_2.0_la-array-map.o .libs/libguile_2.0_la-arrays.o .libs/=
libguile_2.0_la-async.o .libs/libguile_2.0_la-backtrace.o .libs/libguile_2.=
0_la-boolean.o .libs/libguile_2.0_la-bitvectors.o .libs/libguile_2.0_la-byt=
evectors.o .libs/libguile_2.0_la-chars.o .libs/libguile_2.0_la-control.o .l=
ibs/libguile_2.0_la-continuations.o .libs/libguile_2.0_la-debug.o .libs/lib=
guile_2.0_la-deprecated.o .libs/libguile_2.0_la-deprecation.o .libs/libguil=
e_2.0_la-dynwind.o .libs/libguile_2.0_la-eq.o .libs/libguile_2.0_la-error.o=
 .libs/libguile_2.0_la-eval.o .libs/libguile_2.0_la-evalext.o .libs/libguil=
e_2.0_la-expand.o .libs/libguile_2.0_la-extensions.o .libs/libguile_2.0_la-=
feature.o .libs/libguile_2.0_la-filesys.o .libs/libguile_2.0_la-finalizers.=
o .libs/libguile_2.0_la-fluids.o .libs/libguile_2.0_la-foreign.o .libs/libg=
uile_2.0_la-fports.o .libs/libguile_2.0_la-frames.o .libs/libguile_2.0_la-g=
c-malloc.o .libs/libguile_2.0_la-gc.o .libs/libguile_2.0_la-gdbint.o .libs/=
libguile_2.0_la-gettext.o .libs/libguile_2.0_la-generalized-arrays.o .libs/=
libguile_2.0_la-generalized-vectors.o .libs/libguile_2.0_la-goops.o .libs/l=
ibguile_2.0_la-gsubr.o .libs/libguile_2.0_la-guardians.o .libs/libguile_2.0=
_la-hash.o .libs/libguile_2.0_la-hashtab.o .libs/libguile_2.0_la-hooks.o .l=
ibs/libguile_2.0_la-i18n.o .libs/libguile_2.0_la-init.o .libs/libguile_2.0_=
la-inline.o .libs/libguile_2.0_la-instructions.o .libs/libguile_2.0_la-ioex=
t.o .libs/libguile_2.0_la-keywords.o .libs/libguile_2.0_la-list.o .libs/lib=
guile_2.0_la-load.o .libs/libguile_2.0_la-macros.o .libs/libguile_2.0_la-ma=
llocs.o .libs/libguile_2.0_la-memoize.o .libs/libguile_2.0_la-modules.o .li=
bs/libguile_2.0_la-null-threads.o .libs/libguile_2.0_la-numbers.o .libs/lib=
guile_2.0_la-objcodes.o .libs/libguile_2.0_la-objprop.o .libs/libguile_2.0_=
la-options.o .libs/libguile_2.0_la-pairs.o .libs/libguile_2.0_la-poll.o .li=
bs/libguile_2.0_la-ports.o .libs/libguile_2.0_la-print.o .libs/libguile_2.0=
_la-procprop.o .libs/libguile_2.0_la-procs.o .libs/libguile_2.0_la-programs=
.o .libs/libguile_2.0_la-promises.o .libs/libguile_2.0_la-r6rs-ports.o .lib=
s/libguile_2.0_la-random.o .libs/libguile_2.0_la-rdelim.o .libs/libguile_2.=
0_la-read.o .libs/libguile_2.0_la-root.o .libs/libguile_2.0_la-rw.o .libs/l=
ibguile_2.0_la-scmsigs.o .libs/libguile_2.0_la-script.o .libs/libguile_2.0_=
la-simpos.o .libs/libguile_2.0_la-smob.o .libs/libguile_2.0_la-sort.o .libs=
/libguile_2.0_la-srcprop.o .libs/libguile_2.0_la-srfi-1.o .libs/libguile_2.=
0_la-srfi-4.o .libs/libguile_2.0_la-srfi-13.o .libs/libguile_2.0_la-srfi-14=
.o .libs/libguile_2.0_la-srfi-60.o .libs/libguile_2.0_la-stackchk.o .libs/l=
ibguile_2.0_la-stacks.o .libs/libguile_2.0_la-stime.o .libs/libguile_2.0_la=
-strings.o .libs/libguile_2.0_la-strorder.o .libs/libguile_2.0_la-strports.=
o .libs/libguile_2.0_la-struct.o .libs/libguile_2.0_la-symbols.o .libs/libg=
uile_2.0_la-threads.o .libs/libguile_2.0_la-throw.o .libs/libguile_2.0_la-t=
rees.o .libs/libguile_2.0_la-uniform.o .libs/libguile_2.0_la-values.o .libs=
/libguile_2.0_la-variable.o .libs/libguile_2.0_la-vectors.o .libs/libguile_=
2.0_la-version.o .libs/libguile_2.0_la-vm.o .libs/libguile_2.0_la-vports.o =
.libs/libguile_2.0_la-weaks.o .libs/dynl.o .libs/posix.o .libs/net_db.o .li=
bs/socket.o .libs/regex-posix.o  -Wl,--whole-archive ../lib/.libs/libgnu.a =
-Wl,--no-whole-archive  -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib -Wl,-rpath -Wl,srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linu=
x/usr/lib //srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libg=
c.so -L=3Dsrv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -L=3Ds=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -lpthread //srv/ssd/s=
gw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libffi.so -L/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/lib -lrt //srv/ssd/sgw/builds/world/=
tmp/sysroots/x86_64-linux/usr/lib/libunistring.so //srv/ssd/sgw/builds/worl=
d/tmp/sysroots/x86_64-linux/usr/lib/libgmp.so //srv/ssd/sgw/builds/world/tm=
p/sysroots/x86_64-linux/usr/lib/libltdl.so -L=3D/usr/lib -L=3D/lib -ldl -lc=
rypt -lm  -pthread -O2 -Wl,-z -Wl,relro -Wl,--version-script=3D/srv/ssd/sgw=
/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/guile-2.0.9/libgu=
ile/libguile.map -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots=
/x86_64-linux/usr/lib -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/lib -Wl,-O1   -pthread -Wl,-soname -Wl,libguile-2.0.so.22 -o=
 .libs/libguile-2.0.so.22.7.0
x86_64-linux-libtool: link: (cd ".libs" && rm -f "libguile-2.0.so.22" && ln=
 -s "libguile-2.0.so.22.7.0" "libguile-2.0.so.22")
x86_64-linux-libtool: link: (cd ".libs" && rm -f "libguile-2.0.so" && ln -s=
 "libguile-2.0.so.22.7.0" "libguile-2.0.so")
x86_64-linux-libtool: link: (cd .libs/libguile-2.0.lax/libgnu.a && ar x "/s=
rv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/build/l=
ibguile/../lib/.libs/libgnu.a")
x86_64-linux-libtool: link: ar cru .libs/libguile-2.0.a  libguile_2.0_la-al=
ist.o libguile_2.0_la-arbiters.o libguile_2.0_la-array-handle.o libguile_2.=
0_la-array-map.o libguile_2.0_la-arrays.o libguile_2.0_la-async.o libguile_=
2.0_la-backtrace.o libguile_2.0_la-boolean.o libguile_2.0_la-bitvectors.o l=
ibguile_2.0_la-bytevectors.o libguile_2.0_la-chars.o libguile_2.0_la-contro=
l.o libguile_2.0_la-continuations.o libguile_2.0_la-debug.o libguile_2.0_la=
-deprecated.o libguile_2.0_la-deprecation.o libguile_2.0_la-dynwind.o libgu=
ile_2.0_la-eq.o libguile_2.0_la-error.o libguile_2.0_la-eval.o libguile_2.0=
_la-evalext.o libguile_2.0_la-expand.o libguile_2.0_la-extensions.o libguil=
e_2.0_la-feature.o libguile_2.0_la-filesys.o libguile_2.0_la-finalizers.o l=
ibguile_2.0_la-fluids.o libguile_2.0_la-foreign.o libguile_2.0_la-fports.o =
libguile_2.0_la-frames.o libguile_2.0_la-gc-malloc.o libguile_2.0_la-gc.o l=
ibguile_2.0_la-gdbint.o libguile_2.0_la-gettext.o libguile_2.0_la-generaliz=
ed-arrays.o libguile_2.0_la-generalized-vectors.o libguile_2.0_la-goops.o l=
ibguile_2.0_la-gsubr.o libguile_2.0_la-guardians.o libguile_2.0_la-hash.o l=
ibguile_2.0_la-hashtab.o libguile_2.0_la-hooks.o libguile_2.0_la-i18n.o lib=
guile_2.0_la-init.o libguile_2.0_la-inline.o libguile_2.0_la-instructions.o=
 libguile_2.0_la-ioext.o libguile_2.0_la-keywords.o libguile_2.0_la-list.o =
libguile_2.0_la-load.o libguile_2.0_la-macros.o libguile_2.0_la-mallocs.o l=
ibguile_2.0_la-memoize.o libguile_2.0_la-modules.o libguile_2.0_la-null-thr=
eads.o libguile_2.0_la-numbers.o libguile_2.0_la-objcodes.o libguile_2.0_la=
-objprop.o libguile_2.0_la-options.o libguile_2.0_la-pairs.o libguile_2.0_l=
a-poll.o libguile_2.0_la-ports.o libguile_2.0_la-print.o libguile_2.0_la-pr=
ocprop.o libguile_2.0_la-procs.o libguile_2.0_la-programs.o libguile_2.0_la=
-promises.o libguile_2.0_la-r6rs-ports.o libguile_2.0_la-random.o libguile_=
2.0_la-rdelim.o libguile_2.0_la-read.o libguile_2.0_la-root.o libguile_2.0_=
la-rw.o libguile_2.0_la-scmsigs.o libguile_2.0_la-script.o libguile_2.0_la-=
simpos.o libguile_2.0_la-smob.o libguile_2.0_la-sort.o libguile_2.0_la-srcp=
rop.o libguile_2.0_la-srfi-1.o libguile_2.0_la-srfi-4.o libguile_2.0_la-srf=
i-13.o libguile_2.0_la-srfi-14.o libguile_2.0_la-srfi-60.o libguile_2.0_la-=
stackchk.o libguile_2.0_la-stacks.o libguile_2.0_la-stime.o libguile_2.0_la=
-strings.o libguile_2.0_la-strorder.o libguile_2.0_la-strports.o libguile_2=
.0_la-struct.o libguile_2.0_la-symbols.o libguile_2.0_la-threads.o libguile=
_2.0_la-throw.o libguile_2.0_la-trees.o libguile_2.0_la-uniform.o libguile_=
2.0_la-values.o libguile_2.0_la-variable.o libguile_2.0_la-vectors.o libgui=
le_2.0_la-version.o libguile_2.0_la-vm.o libguile_2.0_la-vports.o libguile_=
2.0_la-weaks.o dynl.o posix.o net_db.o socket.o regex-posix.o  .libs/libgui=
le-2.0.lax/libgnu.a/asnprintf.o .libs/libguile-2.0.lax/libgnu.a/basename-lg=
pl.o .libs/libguile-2.0.lax/libgnu.a/binary-io.o .libs/libguile-2.0.lax/lib=
gnu.a/c-ctype.o .libs/libguile-2.0.lax/libgnu.a/c-strcasecmp.o .libs/libgui=
le-2.0.lax/libgnu.a/c-strncasecmp.o .libs/libguile-2.0.lax/libgnu.a/dirname=
-lgpl.o .libs/libguile-2.0.lax/libgnu.a/fd-hook.o .libs/libguile-2.0.lax/li=
bgnu.a/full-read.o .libs/libguile-2.0.lax/libgnu.a/full-write.o .libs/libgu=
ile-2.0.lax/libgnu.a/isnand.o .libs/libguile-2.0.lax/libgnu.a/isnanf.o .lib=
s/libguile-2.0.lax/libgnu.a/isnanl.o .libs/libguile-2.0.lax/libgnu.a/localc=
harset.o .libs/libguile-2.0.lax/libgnu.a/malloca.o .libs/libguile-2.0.lax/l=
ibgnu.a/math.o .libs/libguile-2.0.lax/libgnu.a/nproc.o .libs/libguile-2.0.l=
ax/libgnu.a/pipe2.o .libs/libguile-2.0.lax/libgnu.a/printf-args.o .libs/lib=
guile-2.0.lax/libgnu.a/printf-parse.o .libs/libguile-2.0.lax/libgnu.a/regex=
.o .libs/libguile-2.0.lax/libgnu.a/safe-read.o .libs/libguile-2.0.lax/libgn=
u.a/safe-write.o .libs/libguile-2.0.lax/libgnu.a/sockets.o .libs/libguile-2=
.0.lax/libgnu.a/stat-time.o .libs/libguile-2.0.lax/libgnu.a/strftime.o .lib=
s/libguile-2.0.lax/libgnu.a/striconveh.o .libs/libguile-2.0.lax/libgnu.a/st=
ripslash.o .libs/libguile-2.0.lax/libgnu.a/sys_socket.o .libs/libguile-2.0.=
lax/libgnu.a/u8-mbtouc-aux.o .libs/libguile-2.0.lax/libgnu.a/u8-mbtouc-unsa=
fe-aux.o .libs/libguile-2.0.lax/libgnu.a/u8-mbtouc-unsafe.o .libs/libguile-=
2.0.lax/libgnu.a/u8-mbtouc.o .libs/libguile-2.0.lax/libgnu.a/unistd.o .libs=
/libguile-2.0.lax/libgnu.a/vasnprintf.o .libs/libguile-2.0.lax/libgnu.a/wct=
ype-h.o .libs/libguile-2.0.lax/libgnu.a/xsize.o=20
x86_64-linux-libtool: link: ranlib .libs/libguile-2.0.a
x86_64-linux-libtool: link: rm -fr .libs/libguile-2.0.lax
x86_64-linux-libtool: link: ( cd ".libs" && rm -f "libguile-2.0.la" && ln -=
s "../libguile-2.0.la" "libguile-2.0.la" )
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dlink gcc -I/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -pthread -Wall -Wmissing-pro=
totypes -Wdeclaration-after-statement -Wpointer-arith -Wswitch-enum -fno-st=
rict-aliasing -fvisibility=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -O2 -pipe -I/srv/ssd/sgw/builds/world/tmp/sysroots=
/x86_64-linux/usr/include -pthread -L/srv/ssd/sgw/builds/world/tmp/sysroots=
/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux=
/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/us=
r/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/l=
ib -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -=
Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -=
o guile guile-guile.o libguile-2.0.la -lcrypt -lm=20
x86_64-linux-libtool: link: gcc -I/srv/ssd/sgw/builds/world/tmp/sysroots/x8=
6_64-linux/usr/include -pthread -Wall -Wmissing-prototypes -Wdeclaration-af=
ter-statement -Wpointer-arith -Wswitch-enum -fno-strict-aliasing -fvisibili=
ty=3Dhidden -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inclu=
de -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include =
-O2 -pipe -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include=
 -pthread -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64=
-linux/usr/lib -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x=
86_64-linux/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/usr/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/lib -Wl,-O1 -o .libs/guile guile-guile.o  -L/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/lib ./.libs/libguile-2.0.so -L=3Dsrv/ssd/sgw/builds/world/t=
mp/sysroots/x86_64-linux/usr/lib -L=3Dsrv/ssd/sgw/builds/world/tmp/sysroots=
/x86_64-linux/lib -L=3D/usr/lib -L=3D/lib //srv/ssd/sgw/builds/world/tmp/sy=
sroots/x86_64-linux/usr/lib/libgc.so -lpthread //srv/ssd/sgw/builds/world/t=
mp/sysroots/x86_64-linux/usr/lib/libffi.so -lrt //srv/ssd/sgw/builds/world/=
tmp/sysroots/x86_64-linux/usr/lib/libunistring.so //srv/ssd/sgw/builds/worl=
d/tmp/sysroots/x86_64-linux/usr/lib/libgmp.so //srv/ssd/sgw/builds/world/tm=
p/sysroots/x86_64-linux/usr/lib/libltdl.so -ldl -lcrypt -lm -pthread -Wl,-r=
path -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib
cat alist.doc arbiters.doc array-handle.doc array-map.doc arrays.doc async.=
doc backtrace.doc boolean.doc bitvectors.doc bytevectors.doc chars.doc cont=
rol.doc continuations.doc debug.doc deprecated.doc deprecation.doc dynl.doc=
 dynwind.doc eq.doc error.doc eval.doc evalext.doc expand.doc extensions.do=
c feature.doc filesys.doc fluids.doc foreign.doc fports.doc gc-malloc.doc g=
c.doc gettext.doc generalized-arrays.doc generalized-vectors.doc goops.doc =
gsubr.doc guardians.doc hash.doc hashtab.doc hooks.doc i18n.doc init.doc io=
ext.doc keywords.doc list.doc load.doc macros.doc mallocs.doc memoize.doc m=
odules.doc numbers.doc objprop.doc options.doc pairs.doc ports.doc print.do=
c procprop.doc procs.doc promises.doc r6rs-ports.doc random.doc rdelim.doc =
read.doc root.doc rw.doc scmsigs.doc script.doc simpos.doc smob.doc sort.do=
c srcprop.doc srfi-1.doc srfi-4.doc srfi-13.doc srfi-14.doc srfi-60.doc sta=
ckchk.doc stacks.doc stime.doc strings.doc strorder.doc strports.doc struct=
.doc symbols.doc threads.doc throw.doc trees.doc uniform.doc values.doc var=
iable.doc vectors.doc version.doc vports.doc weaks.doc dynl.doc posix.doc n=
et_db.doc socket.doc regex-posix.doc | GUILE_INSTALL_LOCALE=3D1 GUILE_AUTO_=
COMPILE=3D0 ../meta/uninstalled-env guild snarf-check-and-output-texi      =
    > guile-procedures.texi || { rm guile-procedures.texi; false; }
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/build=
/libguile/.libs/lt-guile: error while loading shared libraries: libguile-2.=
0.so.22: cannot open shared object file: No such file or directory
make[3]: *** [guile-procedures.texi] Error 1
make[3]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/build/libguile'
make[2]: *** [all] Error 2
make[2]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/build/libguile'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/guile-native/2.0.9-r0/build'
make: *** [all] Error 2
ERROR: oe_runmake failed
WARNING: /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/guile-native/2.0.9=
-r0/temp/run.do_compile.28609:1 exit 1 from
  exit 1
ERROR: Function failed: do_compile (log file is located at /srv/ssd/sgw/bui=
lds/world/tmp/work/x86_64-linux/guile-native/2.0.9-r0/temp/log.do_compile.2=
8609)

--------------050101090900090203070907
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile.29621"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile.29621"

DEBUG: Executing shell function do_compile
NOTE: make -j 16
make  all-recursive
make[1]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/file-native/5.14-r0/build'
Making all in src
make[2]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/file-native/5.14-r0/build/src'
make  all-am
make[3]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/file-native/5.14-r0/build/src'
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o magic.lo /srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/file-native/5.14-r0/file-5.14/src/magic.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o apprentice.lo /srv/ssd/sgw/builds/world/tm=
p/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/apprentice.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o softmagic.lo /srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/softmagic.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o ascmagic.lo /srv/ssd/sgw/builds/world/tmp/=
work/x86_64-linux/file-native/5.14-r0/file-5.14/src/ascmagic.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o encoding.lo /srv/ssd/sgw/builds/world/tmp/=
work/x86_64-linux/file-native/5.14-r0/file-5.14/src/encoding.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o compress.lo /srv/ssd/sgw/builds/world/tmp/=
work/x86_64-linux/file-native/5.14-r0/file-5.14/src/compress.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o is_tar.lo /srv/ssd/sgw/builds/world/tmp/wo=
rk/x86_64-linux/file-native/5.14-r0/file-5.14/src/is_tar.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o readelf.lo /srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/file-native/5.14-r0/file-5.14/src/readelf.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o print.lo /srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/file-native/5.14-r0/file-5.14/src/print.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o fsmagic.lo /srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/file-native/5.14-r0/file-5.14/src/fsmagic.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o funcs.lo /srv/ssd/sgw/builds/world/tmp/wor=
k/x86_64-linux/file-native/5.14-r0/file-5.14/src/funcs.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o apptype.lo /srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/file-native/5.14-r0/file-5.14/src/apptype.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o cdf.lo /srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/file-native/5.14-r0/file-5.14/src/cdf.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o cdf_time.lo /srv/ssd/sgw/builds/world/tmp/=
work/x86_64-linux/file-native/5.14-r0/file-5.14/src/cdf_time.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o readcdf.lo /srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/file-native/5.14-r0/file-5.14/src/readcdf.c
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dcompile gcc -std=3Dgnu99 -DH=
AVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-nat=
ive/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sgw/builds/world/tmp/s=
ysroots/x86_64-linux/usr/share/misc/magic"' -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -fvisibility=3Dhidden -Wall -Wstri=
ct-prototypes -Wmissing-prototypes -Wpointer-arith        -Wmissing-declara=
tions -Wredundant-decls -Wnested-externs        -Wsign-compare -Wreturn-typ=
e -Wswitch -Wshadow        -Wcast-qual -Wwrite-strings -Wextra -Wunused-par=
ameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -O2 -pipe -c -o strlcpy.lo /srv/ssd/sgw/builds/world/tmp/w=
ork/x86_64-linux/file-native/5.14-r0/file-5.14/src/strlcpy.c
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/is_tar.c=
  -fPIC -DPIC -o .libs/is_tar.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/print.c =
 -fPIC -DPIC -o .libs/print.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/fsmagic.=
c  -fPIC -DPIC -o .libs/fsmagic.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/magic.c =
 -fPIC -DPIC -o .libs/magic.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/apprenti=
ce.c  -fPIC -DPIC -o .libs/apprentice.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/apptype.=
c  -fPIC -DPIC -o .libs/apptype.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/softmagi=
c.c  -fPIC -DPIC -o .libs/softmagic.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/funcs.c =
 -fPIC -DPIC -o .libs/funcs.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/readcdf.=
c  -fPIC -DPIC -o .libs/readcdf.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/strlcpy.=
c  -fPIC -DPIC -o .libs/strlcpy.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/cdf_time=
.c  -fPIC -DPIC -o .libs/cdf_time.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/cdf.c  -=
fPIC -DPIC -o .libs/cdf.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/readelf.=
c  -fPIC -DPIC -o .libs/readelf.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/ascmagic=
.c  -fPIC -DPIC -o .libs/ascmagic.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/compress=
.c  -fPIC -DPIC -o .libs/compress.o
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/encoding=
.c  -fPIC -DPIC -o .libs/encoding.o
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c: In function 'mprint':
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:395:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:399:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:416:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:421:8: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:438:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:442:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:453:3: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:463:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:489:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:502:7: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:511:3: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:520:7: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:528:3: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:537:7: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:551:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:555:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:571:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:575:4: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:591:3: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:605:5: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:614:5: warning: format not a string literal, argument ty=
pes not checked [-Wformat-nonliteral]
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c: In function 'mget':../x86_64-linux-libtool  --tag=3DCC =
  --mode=3Dcompile gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src -I..  -DMA=
GIC=3D'"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/share/misc/=
magic"' -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/inc=
lude -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-prototypes -=
Wpointer-arith        -Wmissing-declarations -Wredundant-decls -Wnested-ext=
erns        -Wsign-compare -Wreturn-type -Wswitch -Wshadow        -Wcast-qu=
al -Wwrite-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd=
/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o str=
lcat.lo /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0=
/file-5.14/src/strlcat.c

/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.=
14/src/softmagic.c:1721:8: warning: format not a string literal, argument t=
ypes not checked [-Wformat-nonliteral]
gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv/ssd/sgw/builds/world/tmp/work/x=
86_64-linux/file-native/5.14-r0/file-5.14/src -I..  -DMAGIC=3D'"/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/usr/share/misc/magic"' -isystem/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -fvisibility=
=3Dhidden -Wall -Wstrict-prototypes -Wmissing-prototypes -Wpointer-arith   =
     -Wmissing-declarations -Wredundant-decls -Wnested-externs        -Wsig=
n-compare -Wreturn-type -Wswitch -Wshadow        -Wcast-qual -Wwrite-string=
s -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds/world=
/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c -o file.o /srv/ssd/sgw/=
builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/file.c
x86_64-linux-libtool: compile:  gcc -std=3Dgnu99 -DHAVE_CONFIG_H -I. -I/srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/s=
rc -I.. -DMAGIC=3D\"/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr=
/share/misc/magic\" -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/usr/include -fvisibility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-=
prototypes -Wpointer-arith -Wmissing-declarations -Wredundant-decls -Wneste=
d-externs -Wsign-compare -Wreturn-type -Wswitch -Wshadow -Wcast-qual -Wwrit=
e-strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -c /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/file-native/5.14-r0/file-5.14/src/strlcat.=
c  -fPIC -DPIC -o .libs/strlcat.o
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dlink gcc -std=3Dgnu99 -fvisi=
bility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-prototypes -Wpointer-ar=
ith        -Wmissing-declarations -Wredundant-decls -Wnested-externs       =
 -Wsign-compare -Wreturn-type -Wswitch -Wshadow        -Wcast-qual -Wwrite-=
strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -no-undefined -versi=
on-info 1:0:0 -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib=
 -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link=
,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/srv/ssd/sg=
w/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o libmagic.la -rpath =
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib magic.lo appren=
tice.lo softmagic.lo ascmagic.lo encoding.lo compress.lo is_tar.lo readelf.=
lo print.lo fsmagic.lo funcs.lo apptype.lo cdf.lo cdf_time.lo readcdf.lo st=
rlcpy.lo strlcat.lo  -lz=20
x86_64-linux-libtool: link: gcc -std=3Dgnu99 -shared  -fPIC -DPIC  .libs/ma=
gic.o .libs/apprentice.o .libs/softmagic.o .libs/ascmagic.o .libs/encoding.=
o .libs/compress.o .libs/is_tar.o .libs/readelf.o .libs/print.o .libs/fsmag=
ic.o .libs/funcs.o .libs/apptype.o .libs/cdf.o .libs/cdf_time.o .libs/readc=
df.o .libs/strlcpy.o .libs/strlcat.o   -L/srv/ssd/sgw/builds/world/tmp/sysr=
oots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/lib -lz  -O2 -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/lib -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sy=
sroots/x86_64-linux/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/lib -Wl,-O1   -Wl,-soname -Wl,libmagic.so.1 -o .libs/libmag=
ic.so.1.0.0
x86_64-linux-libtool: link: (cd ".libs" && rm -f "libmagic.so.1" && ln -s "=
libmagic.so.1.0.0" "libmagic.so.1")
x86_64-linux-libtool: link: (cd ".libs" && rm -f "libmagic.so" && ln -s "li=
bmagic.so.1.0.0" "libmagic.so")
x86_64-linux-libtool: link: ( cd ".libs" && rm -f "libmagic.la" && ln -s ".=
./libmagic.la" "libmagic.la" )
../x86_64-linux-libtool  --tag=3DCC   --mode=3Dlink gcc -std=3Dgnu99 -fvisi=
bility=3Dhidden -Wall -Wstrict-prototypes -Wmissing-prototypes -Wpointer-ar=
ith        -Wmissing-declarations -Wredundant-decls -Wnested-externs       =
 -Wsign-compare -Wreturn-type -Wswitch -Wshadow        -Wcast-qual -Wwrite-=
strings -Wextra -Wunused-parameter -Wformat=3D2 -isystem/srv/ssd/sgw/builds=
/world/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe  -L/srv/ssd/sgw/buil=
ds/world/tmp/sysroots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/=
sysroots/x86_64-linux/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/usr/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sy=
sroots/x86_64-linux/lib -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x=
86_64-linux/usr/lib -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/lib -Wl,-O1 -o file file.o libmagic.la -lz=20
x86_64-linux-libtool: link: gcc -std=3Dgnu99 -fvisibility=3Dhidden -Wall -W=
strict-prototypes -Wmissing-prototypes -Wpointer-arith -Wmissing-declaratio=
ns -Wredundant-decls -Wnested-externs -Wsign-compare -Wreturn-type -Wswitch=
 -Wshadow -Wcast-qual -Wwrite-strings -Wextra -Wunused-parameter -Wformat=
=3D2 -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/includ=
e -O2 -pipe -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/lib -Wl,-rpath-link -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots=
/x86_64-linux/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86=
_64-linux/usr/lib -Wl,-rpath -Wl,/srv/ssd/sgw/builds/world/tmp/sysroots/x86=
_64-linux/lib -Wl,-O1 -o .libs/file file.o  -L/srv/ssd/sgw/builds/world/tmp=
/sysroots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86=
_64-linux/lib ./.libs/libmagic.so -lz -Wl,-rpath -Wl,/srv/ssd/sgw/builds/wo=
rld/tmp/sysroots/x86_64-linux/usr/lib
make[3]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/file-native/5.14-r0/build/src'
make[2]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/file-native/5.14-r0/build/src'
Making all in magic
make[2]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/file-native/5.14-r0/build/magic'
../src/file -C -m magic
/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r0/build/s=
rc/.libs/lt-file: symbol lookup error: /srv/ssd/sgw/builds/world/tmp/work/x=
86_64-linux/file-native/5.14-r0/build/src/.libs/lt-file: undefined symbol: =
magic_version
make[2]: *** [magic.mgc] Error 127
make[2]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/file-native/5.14-r0/build/magic'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/file-native/5.14-r0/build'
make: *** [all] Error 2
ERROR: oe_runmake failed
WARNING: /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/file-native/5.14-r=
0/temp/run.do_compile.29621:1 exit 1 from
  exit 1
ERROR: Function failed: do_compile (log file is located at /srv/ssd/sgw/bui=
lds/world/tmp/work/x86_64-linux/file-native/5.14-r0/temp/log.do_compile.296=
21)

--------------050101090900090203070907
Content-Type: text/plain; charset=UTF-8;
 name="log.do_compile.18136"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_compile.18136"

DEBUG: Executing shell function do_compile
NOTE: make -j 16
make[1]: Entering directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2'
gawk -f /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/share/build=
-1/make_exports.awk /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-uti=
l-native/1.5.2-r0/apr-util-1.5.2/include/apr_anylock.h /srv/ssd/sgw/builds/=
world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include=
/apr_base64.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-nati=
ve/1.5.2-r0/apr-util-1.5.2/include/apr_buckets.h /srv/ssd/sgw/builds/world/=
tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_c=
rypto.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5=
.2-r0/apr-util-1.5.2/include/apr_date.h /srv/ssd/sgw/builds/world/tmp/work/=
x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_dbd.h /srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-ut=
il-1.5.2/include/apr_dbm.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_hooks.h /srv/ssd/sgw/bu=
ilds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/in=
clude/apr_ldap_init.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-u=
til-native/1.5.2-r0/apr-util-1.5.2/include/apr_ldap_option.h /srv/ssd/sgw/b=
uilds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/i=
nclude/apr_ldap_rebind.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/ap=
r-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_ldap_url.h /srv/ssd/sgw/b=
uilds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/i=
nclude/apr_md4.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-n=
ative/1.5.2-r0/apr-util-1.5.2/include/apr_md5.h /srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_me=
mcache.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.=
5.2-r0/apr-util-1.5.2/include/apr_optional.h /srv/ssd/sgw/builds/world/tmp/=
work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_optio=
nal_hooks.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native=
/1.5.2-r0/apr-util-1.5.2/include/apr_queue.h /srv/ssd/sgw/builds/world/tmp/=
work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_resli=
st.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-=
r0/apr-util-1.5.2/include/apr_rmm.h /srv/ssd/sgw/builds/world/tmp/work/x86_=
64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_sdbm.h /srv/ss=
d/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-=
1.5.2/include/apr_sha1.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/ap=
r-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_strmatch.h /srv/ssd/sgw/b=
uilds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/i=
nclude/apr_thread_pool.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/ap=
r-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_uri.h /srv/ssd/sgw/builds=
/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/includ=
e/apr_uuid.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-nativ=
e/1.5.2-r0/apr-util-1.5.2/include/apr_xlate.h /srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_xml.=
h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/=
apr-util-1.5.2/include/apu_errno.h /srv/ssd/sgw/builds/world/tmp/work/x86_6=
4-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apu_version.h /srv/=
ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-uti=
l-1.5.2/include/private/apr_crypto_internal.h /srv/ssd/sgw/builds/world/tmp=
/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/private/=
apr_dbd_internal.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util=
-native/1.5.2-r0/apr-util-1.5.2/include/private/apr_dbd_odbc_v2.h /srv/ssd/=
sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.=
5.2/include/private/apr_dbm_private.h /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/private/apu_inte=
rnal.h > exports.c
gawk -f /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/share/build=
-1/make_var_export.awk /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-=
util-native/1.5.2-r0/apr-util-1.5.2/include/apr_anylock.h /srv/ssd/sgw/buil=
ds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/incl=
ude/apr_base64.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-n=
ative/1.5.2-r0/apr-util-1.5.2/include/apr_buckets.h /srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/ap=
r_crypto.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/=
1.5.2-r0/apr-util-1.5.2/include/apr_date.h /srv/ssd/sgw/builds/world/tmp/wo=
rk/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_dbd.h /=
srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr=
-util-1.5.2/include/apr_dbm.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-lin=
ux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_hooks.h /srv/ssd/sgw=
/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2=
/include/apr_ldap_init.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/ap=
r-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_ldap_option.h /srv/ssd/sg=
w/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.=
2/include/apr_ldap_rebind.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_ldap_url.h /srv/ssd/sg=
w/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.=
2/include/apr_md4.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-uti=
l-native/1.5.2-r0/apr-util-1.5.2/include/apr_md5.h /srv/ssd/sgw/builds/worl=
d/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr=
_memcache.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native=
/1.5.2-r0/apr-util-1.5.2/include/apr_optional.h /srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_op=
tional_hooks.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-nat=
ive/1.5.2-r0/apr-util-1.5.2/include/apr_queue.h /srv/ssd/sgw/builds/world/t=
mp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_re=
slist.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5=
.2-r0/apr-util-1.5.2/include/apr_rmm.h /srv/ssd/sgw/builds/world/tmp/work/x=
86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_sdbm.h /srv=
/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-ut=
il-1.5.2/include/apr_sha1.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_strmatch.h /srv/ssd/sg=
w/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.=
2/include/apr_thread_pool.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_uri.h /srv/ssd/sgw/bui=
lds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/inc=
lude/apr_uuid.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-na=
tive/1.5.2-r0/apr-util-1.5.2/include/apr_xlate.h /srv/ssd/sgw/builds/world/=
tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apr_x=
ml.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-=
r0/apr-util-1.5.2/include/apu_errno.h /srv/ssd/sgw/builds/world/tmp/work/x8=
6_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/apu_version.h /s=
rv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-=
util-1.5.2/include/private/apr_crypto_internal.h /srv/ssd/sgw/builds/world/=
tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/priva=
te/apr_dbd_internal.h /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-u=
til-native/1.5.2-r0/apr-util-1.5.2/include/private/apr_dbd_odbc_v2.h /srv/s=
sd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util=
-1.5.2/include/private/apr_dbm_private.h /srv/ssd/sgw/builds/world/tmp/work=
/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/private/apu_i=
nternal.h > export_vars.c
sed 's,^\(location=3D\).*$,\1installed,' < apu-1-config > apu-config.out
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o dbm/ap=
r_dbm_gdbm.lo -c dbm/apr_dbm_gdbm.c && touch dbm/apr_dbm_gdbm.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_brigade.lo -c buckets/apr_brigade.c && touch buckets/apr_brigade.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets.lo -c buckets/apr_buckets.c && touch buckets/apr_buckets.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_alloc.lo -c buckets/apr_buckets_alloc.c && touch buckets/apr_=
buckets_alloc.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_eos.lo -c buckets/apr_buckets_eos.c && touch buckets/apr_buck=
ets_eos.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_file.lo -c buckets/apr_buckets_file.c && touch buckets/apr_bu=
ckets_file.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_flush.lo -c buckets/apr_buckets_flush.c && touch buckets/apr_=
buckets_flush.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_heap.lo -c buckets/apr_buckets_heap.c && touch buckets/apr_bu=
ckets_heap.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_mmap.lo -c buckets/apr_buckets_mmap.c && touch buckets/apr_bu=
ckets_mmap.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_pipe.lo -c buckets/apr_buckets_pipe.c && touch buckets/apr_bu=
ckets_pipe.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_pool.lo -c buckets/apr_buckets_pool.c && touch buckets/apr_bu=
ckets_pool.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_refcount.lo -c buckets/apr_buckets_refcount.c && touch bucket=
s/apr_buckets_refcount.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_simple.lo -c buckets/apr_buckets_simple.c && touch buckets/ap=
r_buckets_simple.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o bucket=
s/apr_buckets_socket.lo -c buckets/apr_buckets_socket.c && touch buckets/ap=
r_buckets_socket.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o crypto=
/apr_crypto.lo -c crypto/apr_crypto.c && touch crypto/apr_crypto.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o crypto=
/apr_md4.lo -c crypto/apr_md4.c && touch crypto/apr_md4.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o crypto=
/apr_md5.lo -c crypto/apr_md5.c && touch crypto/apr_md5.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o crypto=
/apr_passwd.lo -c crypto/apr_passwd.c && touch crypto/apr_passwd.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o crypto=
/apr_sha1.lo -c crypto/apr_sha1.c && touch crypto/apr_sha1.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o crypto=
/crypt_blowfish.lo -c crypto/crypt_blowfish.c && touch crypto/crypt_blowfis=
h.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o crypto=
/getuuid.lo -c crypto/getuuid.c && touch crypto/getuuid.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o crypto=
/uuid.lo -c crypto/uuid.c && touch crypto/uuid.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o dbd/ap=
r_dbd.lo -c dbd/apr_dbd.c && touch dbd/apr_dbd.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o dbm/ap=
r_dbm.lo -c dbm/apr_dbm.c && touch dbm/apr_dbm.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o dbm/ap=
r_dbm_sdbm.lo -c dbm/apr_dbm_sdbm.c && touch dbm/apr_dbm_sdbm.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o dbm/sd=
bm/sdbm.lo -c dbm/sdbm/sdbm.c && touch dbm/sdbm/sdbm.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o dbm/sd=
bm/sdbm_hash.lo -c dbm/sdbm/sdbm_hash.c && touch dbm/sdbm/sdbm_hash.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o dbm/sd=
bm/sdbm_lock.lo -c dbm/sdbm/sdbm_lock.c && touch dbm/sdbm/sdbm_lock.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o dbm/sd=
bm/sdbm_pair.lo -c dbm/sdbm/sdbm_pair.c && touch dbm/sdbm/sdbm_pair.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o encodi=
ng/apr_base64.lo -c encoding/apr_base64.c && touch encoding/apr_base64.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o hooks/=
apr_hooks.lo -c hooks/apr_hooks.c && touch hooks/apr_hooks.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o ldap/a=
pr_ldap_stub.lo -c ldap/apr_ldap_stub.c && touch ldap/apr_ldap_stub.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o ldap/a=
pr_ldap_url.lo -c ldap/apr_ldap_url.c && touch ldap/apr_ldap_url.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o memcac=
he/apr_memcache.lo -c memcache/apr_memcache.c && touch memcache/apr_memcach=
e.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o misc/a=
pr_date.lo -c misc/apr_date.c && touch misc/apr_date.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o misc/a=
pr_queue.lo -c misc/apr_queue.c && touch misc/apr_queue.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o misc/a=
pr_reslist.lo -c misc/apr_reslist.c && touch misc/apr_reslist.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o misc/a=
pr_rmm.lo -c misc/apr_rmm.c && touch misc/apr_rmm.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o misc/a=
pr_thread_pool.lo -c misc/apr_thread_pool.c && touch misc/apr_thread_pool.l=
o
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o misc/a=
pu_dso.lo -c misc/apu_dso.c && touch misc/apu_dso.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o misc/a=
pu_version.lo -c misc/apu_version.c && touch misc/apu_version.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o strmat=
ch/apr_strmatch.lo -c strmatch/apr_strmatch.c && touch strmatch/apr_strmatc=
h.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o uri/ap=
r_uri.lo -c uri/apr_uri.c && touch uri/apr_uri.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o xlate/=
xlate.lo -c xlate/xlate.c && touch xlate/xlate.lo
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dcompile gcc -pthread  -isystem/srv/ssd/sgw/builds/w=
orld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINU=
X -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroot=
s/x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linu=
x/apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/wor=
ld/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/pr=
ivate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -=
I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -o xml/ap=
r_xml.lo -c xml/apr_xml.c && touch xml/apr_xml.lo
gcc  -E -DHAVE_CONFIG_H -DLINUX -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bui=
lds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/inc=
lude -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.=
2-r0/apr-util-1.5.2/include/private  -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/include  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/usr/include  exports.c | grep "ap_hack_" | sed -e 's/^.*[)]\(.*\);$=
/\1/' >> aprutil.exp
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dlink gcc  -pthread  -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe   -L/srv/ssd/sgw/builds/=
world/tmp/sysroots/x86_64-linux/usr/lib -L/srv/ssd/sgw/builds/world/tmp/sys=
roots/x86_64-linux/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/lib -Wl,-rpath-link,/srv/ssd/sgw/builds/world/tmp/sysro=
ots/x86_64-linux/lib -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_=
64-linux/usr/lib -Wl,-rpath,/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-l=
inux/lib -Wl,-O1 -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/=
lib -release 1 -module -rpath /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64=
-linux/usr/lib/apr-util-1 -o dbm/apr_dbm_gdbm.la dbm/apr_dbm_gdbm.lo -lgdbm
gcc  -E -DHAVE_CONFIG_H -DLINUX -D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ss=
d/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include -I/srv/ssd/sgw/bui=
lds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/inc=
lude -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.5.=
2-r0/apr-util-1.5.2/include/private  -I/srv/ssd/sgw/builds/world/tmp/sysroo=
ts/x86_64-linux/usr/include  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_6=
4-linux/usr/include  export_vars.c | sed -e 's/^\#[^!]*//' | sed -e '/^$/d'=
 >> aprutil.exp
x86_64-linux-libtool: link: warning: library `/srv/ssd/sgw/builds/world/tmp=
/sysroots/x86_64-linux/usr/lib/libgdbm.la' was moved.
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-li=
btool --silent --mode=3Dlink  gcc -pthread  -isystem/srv/ssd/sgw/builds/wor=
ld/tmp/sysroots/x86_64-linux/usr/include -O2 -pipe -DHAVE_CONFIG_H -DLINUX =
-D_REENTRANT -D_GNU_SOURCE  -isystem/srv/ssd/sgw/builds/world/tmp/sysroots/=
x86_64-linux/usr/include -I/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/=
apr-util-native/1.5.2-r0/apr-util-1.5.2/include -I/srv/ssd/sgw/builds/world=
/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/apr-util-1.5.2/include/priv=
ate  -I/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -I/=
srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/include  -version-in=
fo 5:2:5   -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -L=
/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/s=
rv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/srv/ssd/s=
gw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/srv/ssd/sgw/b=
uilds/world/tmp/sysroots/x86_64-linux/lib -Wl,-O1 -o libaprutil-1.la -rpath=
 /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib buckets/apr_br=
igade.lo buckets/apr_buckets.lo buckets/apr_buckets_alloc.lo buckets/apr_bu=
ckets_eos.lo buckets/apr_buckets_file.lo buckets/apr_buckets_flush.lo bucke=
ts/apr_buckets_heap.lo buckets/apr_buckets_mmap.lo buckets/apr_buckets_pipe=
.lo buckets/apr_buckets_pool.lo buckets/apr_buckets_refcount.lo buckets/apr=
_buckets_simple.lo buckets/apr_buckets_socket.lo crypto/apr_crypto.lo crypt=
o/apr_md4.lo crypto/apr_md5.lo crypto/apr_passwd.lo crypto/apr_sha1.lo cryp=
to/crypt_blowfish.lo crypto/getuuid.lo crypto/uuid.lo dbd/apr_dbd.lo dbm/ap=
r_dbm.lo dbm/apr_dbm_sdbm.lo dbm/sdbm/sdbm.lo dbm/sdbm/sdbm_hash.lo dbm/sdb=
m/sdbm_lock.lo dbm/sdbm/sdbm_pair.lo encoding/apr_base64.lo hooks/apr_hooks=
.lo ldap/apr_ldap_stub.lo ldap/apr_ldap_url.lo memcache/apr_memcache.lo mis=
c/apr_date.lo misc/apr_queue.lo misc/apr_reslist.lo misc/apr_rmm.lo misc/ap=
r_thread_pool.lo misc/apu_dso.lo misc/apu_version.lo strmatch/apr_strmatch.=
lo uri/apr_uri.lo xlate/xlate.lo xml/apr_xml.lo    -luuid -lrt -lcrypt  -lp=
thread -ldl -L/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib -=
lexpat -lapr-1 -luuid -lrt -lcrypt -lpthread -ldl
x86_64-linux-libtool: link: warning: library `/srv/ssd/sgw/builds/world/tmp=
/sysroots/x86_64-linux/usr/lib/libexpat.la' was moved.
x86_64-linux-libtool: link: warning: library `/srv/ssd/sgw/builds/world/tmp=
/sysroots/x86_64-linux/usr/lib/libapr-1.la' was moved.
/bin/grep: /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/srv/ssd/sgw/=
builds/world/tmp/sysroots/x86_64-linux/usr/lib/libuuid.la: No such file or =
directory
/bin/sed: can't read /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/sr=
v/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libuuid.la: No suc=
h file or directory
x86_64-linux-libtool: link: `/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-=
linux/srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/lib/libuuid.la=
' is not a valid libtool archive
make[1]: *** [libaprutil-1.la] Error 1
make[1]: Leaving directory `/srv/ssd/sgw/builds/world/tmp/work/x86_64-linux=
/apr-util-native/1.5.2-r0/apr-util-1.5.2'
make: *** [all-recursive] Error 1
ERROR: oe_runmake failed
WARNING: /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/apr-util-native/1.=
5.2-r0/temp/run.do_compile.18136:1 exit 1 from
  exit 1
ERROR: Function failed: do_compile (log file is located at /srv/ssd/sgw/bui=
lds/world/tmp/work/x86_64-linux/apr-util-native/1.5.2-r0/temp/log.do_compil=
e.18136)

--------------050101090900090203070907--
