Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1415B6A60F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 05:44:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r565iG09009450
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Jun 2013 22:44:16 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 5 Jun 2013 22:44:16 -0700
Message-ID: <51B021B4.4040406@windriver.com>
Date: Thu, 6 Jun 2013 13:44:20 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1370412765.git.rongqing.li@windriver.com>
	<d4b82e1f0f05214985908f11d844899b31adf9fa.1370412765.git.rongqing.li@windriver.com>
	<51AF69B5.2000503@linux.intel.com>
In-Reply-To: <51AF69B5.2000503@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] socat: enable termios
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
X-List-Received-Date: Thu, 06 Jun 2013 05:44:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/06/2013 12:39 AM, Saul Wold wrote:
> On 06/05/2013 12:30 AM, rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>
>> fix two cross-compile issue to enable termios
>>
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>   .../socat/files/fix-xxx_SHIFT-autoheader.patch     |   40 +++++++++
>>   .../socat/files/fix_termios.patch                  |   85
>> ++++++++++++++++++++
>>   meta/recipes-connectivity/socat/socat_1.7.2.1.bb   |    8 +-
>>   3 files changed, 129 insertions(+), 4 deletions(-)
>>   create mode 100644
>> meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch
>>   create mode 100644
>> meta/recipes-connectivity/socat/files/fix_termios.patch
>>
>> diff --git
>> a/meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch
>> b/meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch
>> new file mode 100644
>> index 0000000..6f7b30b
>> --- /dev/null
>> +++
>> b/meta/recipes-connectivity/socat/files/fix-xxx_SHIFT-autoheader.patch
>> @@ -0,0 +1,40 @@
>> +Subject: [PATCH] fix autoheader for *_SHIFT values.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
> I am wondering if this could be submitted upstream?
>
>

OK, I send the upstream.


>> +autoheader would not generate C `#define' statements if
>> +the first param of AC_DEFINE_UNQUOTED is a shell variable.
>> +This will cause build failures while enable termios, so
>> +expand these AC_DEFINE_UNQUOTED from the macro.
>> +
>> +Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
>> +---
>> + configure.in |    5 +++--
>> + 1 file changed, 3 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/configure.in b/configure.in
>> +index c54e4c4..13bae64 100644
>> +--- a/configure.in
>> ++++ b/configure.in
>> +@@ -1335,8 +1335,6 @@ AC_CACHE_CHECK(shift offset of $1, $2,
>> +  [$2=-1]
>> + )
>> +  LIBS="$LIBS1"])
>> +-SHIFT_NAME="$1"_SHIFT
>> +-AC_DEFINE_UNQUOTED($SHIFT_NAME, ${$2}, [foo])
>> + if test "$2" = -1; then
>> + AC_MSG_WARN(please determine $1_SHIFT manually)
>> + fi
>> +@@ -1346,6 +1344,9 @@ AC_SHIFT_OFFSET(CRDLY,  sc_cv_sys_crdly_shift)
>> + AC_SHIFT_OFFSET(TABDLY, sc_cv_sys_tabdly_shift)
>> + AC_SHIFT_OFFSET(CSIZE,  sc_cv_sys_csize_shift)
>> +
>> ++AC_DEFINE_UNQUOTED(CRDLY_SHIFT, ${sc_cv_sys_crdly_shift}, [shift for
>> CRDLY, carriage return delay])
>> ++AC_DEFINE_UNQUOTED(TABDLY_SHIFT, ${sc_cv_sys_tabdly_shift}, [shift
>> for TABDLY, horizontal tab delay])
>> ++AC_DEFINE_UNQUOTED(CSIZE_SHIFT, ${sc_cv_sys_csize_shift}, [shift for
>> CSIZE, character size])
>> +
>> + dnl find what physical type (basic C type) is equivalent to the
>> given type.
>> + dnl arg1: include file(s)
>> +--
>> +1.7.9.5
>> +
>> diff --git a/meta/recipes-connectivity/socat/files/fix_termios.patch
>> b/meta/recipes-connectivity/socat/files/fix_termios.patch
>> new file mode 100644
>> index 0000000..c16949c
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/socat/files/fix_termios.patch
>> @@ -0,0 +1,85 @@
>> +Make sure ISPEED_OFFSET and OSPEED_OFFSET gets defined.
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +
>> +AC_TRY_RUN() can not work on a cross-compile environment, so
>> +define them directly.
>> +
> No Signed-off-by: tag
>
Fix it in Version 2.

> Can't this be handled differently by setting these on the EXTRA_OECONF?

Thanks. I will fix it.

>
>> +Index: socat-1.7.2.0/configure.in
>> +===================================================================
>> +--- socat-1.7.2.0.orig/configure.in
>> ++++ socat-1.7.2.0/configure.in
>> +@@ -893,39 +893,43 @@
>> + [sc_cv_termios_ispeed=no])])
>> + if test $sc_cv_termios_ispeed = yes; then
>> +    AC_DEFINE(HAVE_TERMIOS_ISPEED, [1], [have ispeed])
>> ++   if test "x$ac_cv_ispeed_offset" != "x"; then
>> ++     AC_DEFINE_UNQUOTED(ISPEED_OFFSET, $ac_cv_ispeed_offset, [have
>> ispeed offset])
>> ++     AC_DEFINE(OSPEED_OFFSET, (ISPEED_OFFSET+1) , [have ospeed offset])
>> ++   fi
>> + fi
>> + AC_MSG_RESULT($sc_cv_termios_ispeed)
>> +
>> +-if test $sc_cv_termios_ispeed = yes; then
>> +-AC_MSG_CHECKING(for offset of c_ispeed in struct termios)
>> +-LIBS1="$LIBS"; LIBS=""    # avoid libwrap allow_severity undefined
>> +-AC_CACHE_VAL(ac_cv_ispeed_offset,
>> +- [conftestspeedoff="conftestspeedoff.out"
>> +- AC_TRY_RUN([
>> +-  #include <errno.h>
>> +-  #include <stdio.h>
>> +-  #include <termios.h>
>> +-  #include <string.h>
>> +-  main(){
>> +-    struct termios t;
>> +-    FILE *f;
>> +-    if ((f=fopen("$conftestspeedoff","w"))==NULL){
>> +-       fprintf(stderr,"\\"$conftestspeedoff\\":
>> %s\n",strerror(errno)); exit(-1);
>> +-    }
>> +-    fprintf(f, "%d", ((char*)&t.c_ispeed-(char*)&t)/sizeof(speed_t));
>> +-    exit(0);
>> +- }
>> +- ],
>> +- [ac_cv_ispeed_offset=`cat $conftestspeedoff`],
>> +- [ac_cv_ispeed_offset=-1],
>> +- [ac_cv_ispeed_offset=-1]    #!
>> +-)])
>> +-LIBS="$LIBS1"
>> +-AC_MSG_RESULT($ac_cv_ispeed_offset)
>> +- if test $ac_cv_ispeed_offset -ge 0; then
>> +-   AC_DEFINE_UNQUOTED(ISPEED_OFFSET, $ac_cv_ispeed_offset, [have
>> ispeed])
>> +- fi
>> +-fi
>> ++# if test $sc_cv_termios_ispeed = yes; then
>> ++# AC_MSG_CHECKING(for offset of c_ispeed in struct termios)
>> ++# LIBS1="$LIBS"; LIBS=""    # avoid libwrap allow_severity undefined
>> ++# AC_CACHE_VAL(ac_cv_ispeed_offset,
>> ++#  [conftestspeedoff="conftestspeedoff.out"
>> ++#  AC_TRY_RUN([
>> ++#   #include <errno.h>
>> ++#   #include <stdio.h>
>> ++#   #include <termios.h>
>> ++#   #include <string.h>
>> ++#   main(){
>> ++#     struct termios t;
>> ++#     FILE *f;
>> ++#     if ((f=fopen("$conftestspeedoff","w"))==NULL){
>> ++#        fprintf(stderr,"\\"$conftestspeedoff\\":
>> %s\n",strerror(errno)); exit(-1);
>> ++#     }
>> ++#     fprintf(f, "%d", ((char*)&t.c_ispeed-(char*)&t)/sizeof(speed_t));
>> ++#     exit(0);
>> ++#  }
>> ++#  ],
>> ++#  [ac_cv_ispeed_offset=`cat $conftestspeedoff`],
>> ++#  [ac_cv_ispeed_offset=-1],
>> ++#  [ac_cv_ispeed_offset=-1]    #!
>> ++# )])
>> ++# LIBS="$LIBS1"
>> ++# AC_MSG_RESULT($ac_cv_ispeed_offset)
>> ++#  if test $ac_cv_ispeed_offset -ge 0; then
>> ++#    AC_DEFINE_UNQUOTED(ISPEED_OFFSET, $ac_cv_ispeed_offset, [have
>> ispeed])
>> ++#  fi
>> ++# fi
>> +
>> + # there is another issue with termios: OSR requires "#define _SVID3
>> ..."
>> + # for reasonable termios support. We check this situation using IMAXBEL
>> diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
>> b/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
>> index 950e1e5..a3b5f7a 100644
>> --- a/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
>> +++ b/meta/recipes-connectivity/socat/socat_1.7.2.1.bb
>> @@ -11,15 +11,15 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>
>> file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
>>
>>
>>
>> -PR = "r0"
>> +PR = "r1"
> No PR Bump required anymore
>
Fix it on version 2

Thanks.

-Roy

>
> Sau!
>
>>   SRC_URI =
>> "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2;name=src
>> \
>> -           file://compile.patch"
>> +           file://compile.patch \
>> +           file://fix_termios.patch \
>> +           file://fix-xxx_SHIFT-autoheader.patch"
>>
>>   SRC_URI[src.md5sum] = "7ddfea7e9e85f868670f94d3ea08358b"
>>   SRC_URI[src.sha256sum] =
>> "faea2ed6c63bb97a59237fd43b7c35ad248317297e8bfeb2e6f2ec1e6bc58277"
>>
>> -EXTRA_OECONF = " --disable-termios "
>> -
>>   inherit autotools
>>
>>   do_install_prepend () {
>>
>
>

-- 
Best Reagrds,
Roy | RongQing Li

