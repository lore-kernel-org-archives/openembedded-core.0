Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 60A4575454
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 02:05:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4B25vmI010364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 May 2018 19:05:57 -0700 (PDT)
Received: from [128.224.162.207] (128.224.162.207) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 10 May 2018 19:05:56 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180510091021.61535-1-zhixiong.chi@windriver.com>
	<CAJTo0LZrGXj72oO+=qhKBhHx2xQZPQexMS1gMVLJmDqFeJ8sjA@mail.gmail.com>
From: Zhixiong Chi <zhixiong.chi@windriver.com>
Message-ID: <1d9d5bb0-d0ca-492b-8505-b03bacf792af@windriver.com>
Date: Fri, 11 May 2018 10:06:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZrGXj72oO+=qhKBhHx2xQZPQexMS1gMVLJmDqFeJ8sjA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][v2] gettext: make gettext independant of host java components
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
X-List-Received-Date: Fri, 11 May 2018 02:05:57 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年05月11日 00:40, Burton, Ross wrote:
> I'm *really* uncomfortable patching gnulib in gettext, as we'll be
> carrying that patch for ever and no doubt having to copy/paste it for
> every other upstream that uses gnulib.
>
> Would it be possible to just pass JAVAC=/bin/false to configure instead?
It seems that even though we pass JAVAC=xxx to configure, it still is 
possible to be overrided
by the m4 file in gnulib-m4/javacomp.m4 while compiling.

Thanks.
>
> Ross
>
> On 10 May 2018 at 10:10, Zhixiong Chi <zhixiong.chi@windriver.com> wrote:
>> The checksums of gettext were changing based on whether or not java
>> and javac were installed. This patch makes gettext recipes independant
>> of Java components.
>>
>> Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> ---
>>   .../gettext-disable-javacomp-setting.patch         | 104 +++++++++++++++++++++
>>   meta/recipes-core/gettext/gettext_0.19.8.1.bb      |   1 +
>>   2 files changed, 105 insertions(+)
>>   create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/gettext-disable-javacomp-setting.patch
>>
>> diff --git a/meta/recipes-core/gettext/gettext-0.19.8.1/gettext-disable-javacomp-setting.patch b/meta/recipes-core/gettext/gettext-0.19.8.1/gettext-disable-javacomp-setting.patch
>> new file mode 100644
>> index 0000000000..44ef3976f4
>> --- /dev/null
>> +++ b/meta/recipes-core/gettext/gettext-0.19.8.1/gettext-disable-javacomp-setting.patch
>> @@ -0,0 +1,104 @@
>> +The checksums of gettext were changing based on whether or not
>> +java and javac were installed on the host.
>> +Since '--disable-java' and '--disable-native-java' are included
>> +in the EXTRA_OECONF, so it should not update and use the java env
>> +information, even though the java and javac exist on the host.
>> +This patch add reset operation for the env variable in m4 file to
>> +avoid the issue.
>> +
>> +Upstream-Status: Inappropriate [oe-core specific]
>> +
>> +Signed-ff-by: Zhixiong Chi <zhixiong.chi@windriver.com>
>> +
>> +Index: gettext-0.19.8.1/gettext-runtime/configure.ac
>> +===================================================================
>> +--- gettext-0.19.8.1.orig/gettext-runtime/configure.ac
>> ++++ gettext-0.19.8.1/gettext-runtime/configure.ac
>> +@@ -35,7 +35,7 @@ AC_PROG_YACC
>> +
>> + gt_JAVA_CHOICE
>> +
>> +-gt_JAVACOMP([1.3], [1.1])
>> ++gt_JAVACOMP([1.3], [1.1], [1])
>> + AC_CHECK_PROG([JAR], [jar], [jar])
>> + if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" != no; then
>> +   BUILDJAVA=yes
>> +Index: gettext-0.19.8.1/gettext-runtime/gnulib-m4/javacomp.m4
>> +===================================================================
>> +--- gettext-0.19.8.1.orig/gettext-runtime/gnulib-m4/javacomp.m4
>> ++++ gettext-0.19.8.1/gettext-runtime/gnulib-m4/javacomp.m4
>> +@@ -621,6 +621,17 @@ changequote([,])dnl
>> +     fi
>> +   fi
>> +   rm -f conftest*.java conftest*.class
>> ++  reset_env_variable=$3
>> ++  if test -n "$reset_env_variable"; then
>> ++    CONF_JAVAC=
>> ++    HAVE_JAVAC_ENVVAR=
>> ++    CLASSPATH=
>> ++    CLASSPATH_SEPARATOR=:
>> ++    HAVE_GCJ_C=
>> ++    HAVE_JAVAC=
>> ++    HAVE_JIKES=
>> ++    HAVE_JAVACOMP=
>> ++  fi
>> +   if test -n "$HAVE_JAVACOMP"; then
>> +     ac_result="$CONF_JAVAC"
>> +   else
>> +Index: gettext-0.19.8.1/gettext-tools/configure.ac
>> +===================================================================
>> +--- gettext-0.19.8.1.orig/gettext-tools/configure.ac
>> ++++ gettext-0.19.8.1/gettext-tools/configure.ac
>> +@@ -44,7 +44,7 @@ fi
>> + AC_SUBST([BUILDJAVAEXE])
>> +
>> + gt_JAVAEXEC
>> +-gt_JAVACOMP([1.3])
>> ++gt_JAVACOMP([1.3], [], [1])
>> + AC_CHECK_PROG([JAR], [jar], [jar])
>> + if test -n "$HAVE_JAVACOMP" && test -n "$JAR" && test "$JAVA_CHOICE" != no; then
>> +   BUILDJAVA=yes
>> +Index: gettext-0.19.8.1/gettext-tools/gnulib-m4/javacomp.m4
>> +===================================================================
>> +--- gettext-0.19.8.1.orig/gettext-tools/gnulib-m4/javacomp.m4
>> ++++ gettext-0.19.8.1/gettext-tools/gnulib-m4/javacomp.m4
>> +@@ -621,6 +621,17 @@ changequote([,])dnl
>> +     fi
>> +   fi
>> +   rm -f conftest*.java conftest*.class
>> ++  reset_env_variable=$3
>> ++  if test -n "$reset_env_variable"; then
>> ++    CONF_JAVAC=
>> ++    HAVE_JAVAC_ENVVAR=
>> ++    CLASSPATH=
>> ++    CLASSPATH_SEPARATOR=:
>> ++    HAVE_GCJ_C=
>> ++    HAVE_JAVAC=
>> ++    HAVE_JIKES=
>> ++    HAVE_JAVACOMP=
>> ++  fi
>> +   if test -n "$HAVE_JAVACOMP"; then
>> +     ac_result="$CONF_JAVAC"
>> +   else
>> +Index: gettext-0.19.8.1/gettext-tools/gnulib-m4/javaexec.m4
>> +===================================================================
>> +--- gettext-0.19.8.1.orig/gettext-tools/gnulib-m4/javaexec.m4
>> ++++ gettext-0.19.8.1/gettext-tools/gnulib-m4/javaexec.m4
>> +@@ -87,6 +87,17 @@ AC_DEFUN([gt_JAVAEXEC],
>> +       CLASSPATH="$save_CLASSPATH"
>> +     ])
>> +   fi
>> ++  if test -z "$4"; then
>> ++    HAVE_JAVAEXEC=
>> ++    CONF_JAVA=
>> ++    CLASSPATH=
>> ++    CLASSPATH_SEPARATOR=
>> ++    HAVE_JAVA_ENVVAR=
>> ++    HAVE_GIJ=
>> ++    HAVE_JAVA=
>> ++    HAVE_JRE=
>> ++    HAVE_JVIEW=
>> ++  fi
>> +   if test -n "$HAVE_JAVAEXEC"; then
>> +     ac_result="$CONF_JAVA"
>> +   else
>> diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> index 68f5cc329a..490e291f8f 100644
>> --- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> +++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
>> @@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
>>             file://add-with-bisonlocaledir.patch \
>>             file://cr-statement.c-timsort.h-fix-formatting-issues.patch \
>>             file://use-pkgconfig.patch \
>> +          file://gettext-disable-javacomp-setting.patch \
>>   "
>>
>>   SRC_URI[md5sum] = "97e034cf8ce5ba73a28ff6c3c0638092"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
---------------------
Thanks,
Zhixiong Chi
Tel: +86-10-8477-7036


