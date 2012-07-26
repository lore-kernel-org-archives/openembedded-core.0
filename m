Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SuEk7-0005Dg-RQ
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 05:28:04 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6Q3GVsr012291
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2012 20:16:32 -0700 (PDT)
Received: from [128.224.162.163] (128.224.162.163) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 25 Jul 2012 20:16:31 -0700
Message-ID: <5010B68F.5000508@windriver.com>
Date: Thu, 26 Jul 2012 11:16:31 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1343203669-23792-1-git-send-email-rongqing.li@windriver.com>
	<50106BF6.4020108@linux.intel.com>
	<50106CD9.5030004@linux.intel.com>
In-Reply-To: <50106CD9.5030004@linux.intel.com>
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q6Q3GVsr012291
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] slang 2.2.4: fix the pcre existence checking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 03:28:04 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 2012=E5=B9=B407=E6=9C=8826=E6=97=A5 06:02, Saul Wold wrote:
> On 07/25/2012 02:58 PM, Saul Wold wrote:
>> On 07/25/2012 01:07 AM, rongqing.li@windriver.com wrote:
>>> From: Roy.Li <rongqing.li@windriver.com>
>>>
>>> [YOCTO #2820]
>>>
>>> when check if there is pcre, the configure file always check
>>> the host dir. now we make it work by adding correct prefix for
>>> cross-compile environment.
>>>
>>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>> ---
>>>   .../slang/slang/fix-check-pcre.patch               |  108
>>> ++++++++++++++++++++
>>>   meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
>>>   2 files changed, 110 insertions(+), 1 deletions(-)
>>>   create mode 100644
>>> meta/recipes-extended/slang/slang/fix-check-pcre.patch
>>>
>>> diff --git a/meta/recipes-extended/slang/slang/fix-check-pcre.patch
>>> b/meta/recipes-extended/slang/slang/fix-check-pcre.patch
>>> new file mode 100644
>>> index 0000000..0c1553a
>>> --- /dev/null
>>> +++ b/meta/recipes-extended/slang/slang/fix-check-pcre.patch
>>> @@ -0,0 +1,108 @@
>>> +fix the pcre existence checking
>>> +
>>> +when check if there is pcre, the configure file always check
>>> +the host dir. now we make it work by adding correct prefix for
>>> +cross-compile environment.
>>> +
>>> +When enable pcre-module, we see a QA warning because rpaths
>>> +hardcoded into the build, rpaths are not needed, so lets turn
>>> +this off.
>>> +
>>> +Upstream-Status: Inappropriate
>>> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>>> +---
>>> + configure |   60
>>> ++++++------------------------------------------------------
>>> + 1 files changed, 6 insertions(+), 54 deletions(-)
>>> +
>>> +diff --git a/configure b/configure
>>
>> Patching configure here will not work since this is an autotools based
>> recipe configure is generated from configure.ac, you need to look into
>> how to modify configure.ac.
>>
> ^^^^ Ignore this comment! ^^^^^ (I was confused and looked at libpcre,
> not slang)!
>
>> Also are you that the xincdir and xlibdir are not able to be set to a
>> sysroot dir earlier on in the configure process?
>>

Yes.


>> Why remove all that host code?
>>

the host code is trying to defect which parameter should be used for=20
link -rpath
based on host type, in fact, it can not defect our build image type.

use rpath will produce a QA warning in some condition.

This part fix is same as the patch:

meta/recipes-extended/slang/slang/rpathfix.patch


-Roy

>> This might be an appropriate patch to upstream for better
>> cross-compiling support, please fix the patch correctly.
>>
> The above comments are still valid
>
>> Thanks
>>      Sau!
>>
>>
>>> +index f1586c3..d22814f 100755
>>> +--- a/configure
>>> ++++ b/configure
>>> +@@ -6991,6 +6991,7 @@ $as_echo_n "checking for the pcre library and
>>> header files ... " >&6; }
>>> +      /usr/include/pcre,/usr/lib \
>>> +      /usr/pcre/include,/usr/pcre/lib \
>>> +      /usr/include,/usr/lib \
>>> ++     /usr/include,/usr/lib64 \
>>> +      /opt/include/pcre,/opt/lib \
>>> +      /opt/pcre/include,/opt/pcre/lib \
>>> +      /opt/include,/opt/lib"
>>> +@@ -7021,14 +7022,14 @@ $as_echo_n "checking for the pcre library an=
d
>>> header files ... " >&6; }
>>> +         xincdir=3D`echo $include_and_lib | tr ',' ' ' | awk '{print
>>> $1}'`
>>> +     xlibdir=3D`echo $include_and_lib | tr ',' ' ' | awk '{print $2}=
'`
>>> +     found=3D0
>>> +-    if test -r $xincdir/$xincfile
>>> ++    if test -r $PKG_CONFIG_SYSROOT_DIR/$xincdir/$xincfile
>>> +     then
>>> +       for E in $exts
>>> +       do
>>> +-        if test -r "$xlibdir/$xlibfile.$E"
>>> ++        if test -r "$PKG_CONFIG_SYSROOT_DIR/$xlibdir/$xlibfile.$E"
>>> +         then
>>> +-          jd_pcre_include_dir=3D"$xincdir"
>>> +-          jd_pcre_library_dir=3D"$xlibdir"
>>> ++          jd_pcre_include_dir=3D"$PKG_CONFIG_SYSROOT_DIR/$xincdir"
>>> ++          jd_pcre_library_dir=3D"$PKG_CONFIG_SYSROOT_DIR/$xlibdir"
>>> +           jd_with_pcre_library=3D"yes"
>>> +           found=3D1
>>> +           break
>>> +@@ -7054,56 +7055,7 @@ $as_echo "yes: $jd_pcre_library_dir and
>>> $jd_pcre_include_dir" >&6; }
>>> +     then
>>> +       PCRE_LIB=3D""
>>> +     else
>>> +-
>>> +-if test "X$jd_pcre_library_dir" !=3D "X"
>>> +-then
>>> +-  if test "X$RPATH" =3D "X"
>>> +-  then
>>> +-
>>> +-case "$host_os" in
>>> +-  *linux*|*solaris* )
>>> +-    if test "X$GCC" =3D Xyes
>>> +-    then
>>> +-      if test "X$ac_R_nospace" =3D "Xno"
>>> +-      then
>>> +-        RPATH=3D"-Wl,-R,"
>>> +-      else
>>> +-        RPATH=3D"-Wl,-R"
>>> +-      fi
>>> +-    else
>>> +-      if test "X$ac_R_nospace" =3D "Xno"
>>> +-      then
>>> +-        RPATH=3D"-R "
>>> +-      else
>>> +-    RPATH=3D"-R"
>>> +-      fi
>>> +-    fi
>>> +-  ;;
>>> +-  *osf*|*openbsd*)
>>> +-    if test "X$GCC" =3D Xyes
>>> +-    then
>>> +-      RPATH=3D"-Wl,-rpath,"
>>> +-    else
>>> +-      RPATH=3D"-rpath "
>>> +-    fi
>>> +-  ;;
>>> +-  *netbsd*)
>>> +-    if test "X$GCC" =3D Xyes
>>> +-    then
>>> +-      RPATH=3D"-Wl,-R"
>>> +-    fi
>>> +-  ;;
>>> +-esac
>>> +-
>>> +-    if test "X$RPATH" !=3D "X"
>>> +-    then
>>> +-      RPATH=3D"$RPATH$jd_pcre_library_dir"
>>> +-    fi
>>> +-  else
>>> +-    RPATH=3D"$RPATH:$jd_pcre_library_dir"
>>> +-  fi
>>> +-fi
>>> +-
>>> ++      RPATH=3D""
>>> +     fi
>>> +
>>> +     PCRE_INC=3D-I$jd_pcre_include_dir
>>> +--
>>> +1.7.4.1
>>> +
>>> diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb
>>> b/meta/recipes-extended/slang/slang_2.2.4.bb
>>> index 72dd99f..7082611 100644
>>> --- a/meta/recipes-extended/slang/slang_2.2.4.bb
>>> +++ b/meta/recipes-extended/slang/slang_2.2.4.bb
>>> @@ -10,7 +10,7 @@ to recode S-Lang procedures in C if you need to."
>>>   HOMEPAGE =3D "http://www.jedsoft.org/slang/"
>>>   SECTION =3D "libs"
>>>   DEPENDS =3D "pcre"
>>> -PR =3D "r9"
>>> +PR =3D "r10"
>>>
>>>   LICENSE =3D "GPLv2"
>>>   LIC_FILES_CHKSUM =3D
>>> "file://COPYING;md5=3Da52a18a472d4f7e45479b06563717c02"
>>> @@ -18,6 +18,7 @@ LIC_FILES_CHKSUM =3D
>>> "file://COPYING;md5=3Da52a18a472d4f7e45479b06563717c02"
>>>
>>>   SRC_URI =3D
>>> "ftp://space.mit.edu/pub/davis/slang/v2.2/slang-${PV}.tar.bz2 \
>>>              file://rpathfix.patch \
>>> +           file://fix-check-pcre.patch \
>>>             "
>>>   SRC_URI_append_arm =3D "
>>> file://change-char-type-to-signed-char-in-macros.patch"
>>>
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>
>
>

--=20
Best Reagrds,
Roy | RongQing Li




