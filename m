Return-Path: <hans.beckerus@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id A8B6E6BE35
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 19:28:25 +0000 (UTC)
Received: by mail-la0-f51.google.com with SMTP id es20so5229344lab.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 12:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rLshGP/k07TtQfBM5vNFpokFL1pEOOdoLw1C0piEvno=;
	b=J5vRG565hQ5svW1j7CwK91Z/jajJLtizF9yB49XFuAD6307ASYteEI/Y5kSP6qk70q
	83QTnzkZdmKZ6t5/vW6Y9NMUF31SNQUvCg21+c6TQ3BMOKiyd9m/i7wYe7lBZA0VvfGY
	MKZzgJjEWA8vhgQfwi0NMYHTIwyZe9nmKwxlWlZmFtin72xVMdIpTqTgKduz5wPW7eGT
	TAA1Nazk195+tFASdAC1JYPMPY9JbSMunG/nMb6TDyn6/sSTCAI/Is1O6licBVTscKS5
	zxGSW/5nmQR6fKhQLquO9mC1DKCBCzJNG0eb0S4vkzeY9fgKTgsUvIampa5eMBVY9xCI
	vb7g==
X-Received: by 10.112.181.100 with SMTP id dv4mr501556lbc.34.1378754906441;
	Mon, 09 Sep 2013 12:28:26 -0700 (PDT)
Received: from [192.168.0.10] (h135n8-rny-a12.ias.bredband.telia.com.
	[217.209.54.135])
	by mx.google.com with ESMTPSA id f17sm6715622lbo.12.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Sep 2013 12:28:25 -0700 (PDT)
Message-ID: <522E2157.1010602@gmail.com>
Date: Mon, 09 Sep 2013 21:28:23 +0200
From: Hans Beckerus <hans.beckerus@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <CAFyqS9q=_k6rH6zbUng6SOuqBrkj6O=C922+cpDHK33MYrP0-w@mail.gmail.com>
	<CAFyqS9pmYDs6DW0MtgTo9W89xGxxhiw2QXysyuy+iB4Pw+AUaQ@mail.gmail.com>
	<522DEBFE.6030401@linux.intel.com>
	<588E3B18-5BB6-4773-B853-890FCA6DFE3A@gmail.com>
In-Reply-To: <588E3B18-5BB6-4773-B853-890FCA6DFE3A@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool: fix resolve of variable lt_sysroot
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
X-List-Received-Date: Mon, 09 Sep 2013 19:28:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2013-09-09 6:23, Hans Beckérus wrote:
>
> 9 sep 2013 kl. 17:40 skrev Saul Wold <sgw@linux.intel.com>:
>
>> On 09/09/2013 03:18 AM, Hans Beckérus wrote:
>>> This patch updates libtool.m4 (and its output) to correct a problem
>>> with variable 'lt_sysroot' not being properly resolved if the option
>>> '--with[-libtool]-sysroot' is not provided when running the 'configure'
>>> script for a package.
>>>
>>> According to the help text ouput from 'configure':
>>>   --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>>>                         (or the compiler's sysrooot if not specified).
>>>
>>> Due to mixed up cases in a switch statement, when checking if the option
>>> was specified or not, wrong actions were taken resulting in an
>>> incorrect sysroot and failures to properly locate e.g. .la files.
>>>
>>> For current upstream status see:
>>> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>>>
>>> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>> ---
>>>   meta/recipes-devtools/libtool/
>>> libtool-2.4.2.inc    |   1 +
>>>   .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 266 +++++++++++++++++++++
>>>   2 files changed, 267 insertions(+)
>> The patch file seems to be corrupted, did not apply correctly.  Also why are you patching the configure file since we generate those from the configure.ac which will be correct when the .m4 file is patched and autoconf does it's thing.
>>
> Hi Saul! The patch probably does not work in oe-core due to it being on a Yocto baseline for which other patches might be applied. My bad. I thought it would be 1:1 :( Also you are correct that the configure scripts does not need patching but I based this on a similar patch in Yocto for which these files were also included. I did not give it a second thought since it does no harm, libtool comes with prepared configure scripts and if autoconf is executed or not would mean different results.
>
> Thanks.
> Hans
Nah! This really looks like a corrupt patch! But how this could go wrong 
is beyond me :(
Will give it another shoot.

>> Thanks
>>
>> Sau!
>>
>>>   create mode 100644
>>> meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>
>>> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>> b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>> index bb4ddf0..92e4949 100644
>>> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>> @@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>>>      file://respect-fstack-protector.patch \
>>>              file://norm-rpath.patch \
>>>              file://dont-depend-on-help2man.patch \
>>> +           file://fix-resolve-lt-sysroot.patch \
>>>             "
>>>
>>>   SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
>>> diff --git a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>> new file mode 100644
>>> index 0000000..8a4fde1
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>> @@ -0,0 +1,266 @@
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +This patch updates libtool.m4 (and its output) to correct a problem
>>> +with variable 'lt_sysroot' not being properly resolved if the option
>>> +'--with[-libtool]-sysroot' is not provided when running the 'configure'
>>> +script for a package.
>>> +
>>> +I have also reported the problem to libtool here
>>> +
>>> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>>> +
>>> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>> +---
>>> +diff -ur libtool-2.4.2.orig/configure libtool-2.4.2/configure
>>> +--- libtool-2.4.2.orig/configure 2013-09-05 10:37:50.982677000 +0200
>>> ++++ libtool-2.4.2/configure 2013-09-05 10:12:24.551681000 +0200
>>> +@@ -6814,7 +6814,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -6822,7 +6822,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/libltdl/configure libtool-2.4.2/libltdl/configure
>>> +--- libtool-2.4.2.orig/libltdl/configure 2013-09-05 10:37:24.738048000 +0200
>>> ++++ libtool-2.4.2/libltdl/configure 2013-09-05 10:38:44.540026000 +0200
>>> +@@ -6027,7 +6027,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -6035,7 +6035,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
>>> libtool-2.4.2/libltdl/m4/libtool.m4
>>> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4 2013-09-05
>>> 10:37:24.690013000 +0200
>>> ++++ libtool-2.4.2/libltdl/m4/libtool.m4 2013-09-05 12:05:51.560281000 +0200
>>> +@@ -1234,7 +1234,7 @@
>>> + dnl in case the user passed a directory name.
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -1242,7 +1242,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    AC_MSG_RESULT([${with_libtool_sysroot}])
>>> +diff -ur libtool-2.4.2.orig/tests/cdemo/configure
>>> libtool-2.4.2/tests/cdemo/configure
>>> +--- libtool-2.4.2.orig/tests/cdemo/configure 2013-09-05
>>> 10:37:24.793021000 +0200
>>> ++++ libtool-2.4.2/tests/cdemo/configure 2013-09-05 10:39:01.039463000 +0200
>>> +@@ -5907,7 +5907,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -5915,7 +5915,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/tests/demo/configure
>>> libtool-2.4.2/tests/demo/configure
>>> +--- libtool-2.4.2.orig/tests/demo/configure 2013-09-05 10:37:24.878048000 +0200
>>> ++++ libtool-2.4.2/tests/demo/configure 2013-09-05 10:39:15.357833000 +0200
>>> +@@ -5905,7 +5905,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -5913,7 +5913,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/tests/depdemo/configure
>>> libtool-2.4.2/tests/depdemo/configure
>>> +--- libtool-2.4.2.orig/tests/depdemo/configure 2013-09-05
>>> 10:37:25.003086000 +0200
>>> ++++ libtool-2.4.2/tests/depdemo/configure 2013-09-05 10:39:33.424217000 +0200
>>> +@@ -5902,7 +5902,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -5910,7 +5910,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/tests/f77demo/configure
>>> libtool-2.4.2/tests/f77demo/configure
>>> +--- libtool-2.4.2.orig/tests/f77demo/configure 2013-09-05
>>> 10:37:25.232029000 +0200
>>> ++++ libtool-2.4.2/tests/f77demo/configure 2013-09-05 12:02:54.749911000 +0200
>>> +@@ -6887,7 +6887,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -6895,7 +6895,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/tests/fcdemo/configure
>>> libtool-2.4.2/tests/fcdemo/configure
>>> +--- libtool-2.4.2.orig/tests/fcdemo/configure 2013-09-05
>>> 10:37:25.320032000 +0200
>>> ++++ libtool-2.4.2/tests/fcdemo/configure 2013-09-05 12:03:34.350859000 +0200
>>> +@@ -6986,7 +6986,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -6994,7 +6994,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/tests/mdemo/configure
>>> libtool-2.4.2/tests/mdemo/configure
>>> +--- libtool-2.4.2.orig/tests/mdemo/configure 2013-09-05
>>> 10:37:25.458028000 +0200
>>> ++++ libtool-2.4.2/tests/mdemo/configure 2013-09-05 12:04:04.233622000 +0200
>>> +@@ -5934,7 +5934,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -5942,7 +5942,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/tests/mdemo2/configure
>>> libtool-2.4.2/tests/mdemo2/configure
>>> +--- libtool-2.4.2.orig/tests/mdemo2/configure 2013-09-05
>>> 10:37:25.564096000 +0200
>>> ++++ libtool-2.4.2/tests/mdemo2/configure 2013-09-05 12:04:36.688447000 +0200
>>> +@@ -5907,7 +5907,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -5915,7 +5915,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/tests/pdemo/configure
>>> libtool-2.4.2/tests/pdemo/configure
>>> +--- libtool-2.4.2.orig/tests/pdemo/configure 2013-09-05
>>> 10:37:25.619085000 +0200
>>> ++++ libtool-2.4.2/tests/pdemo/configure 2013-09-05 12:04:50.578801000 +0200
>>> +@@ -5910,7 +5910,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -5918,7 +5918,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>> +diff -ur libtool-2.4.2.orig/tests/tagdemo/configure
>>> libtool-2.4.2/tests/tagdemo/configure
>>> +--- libtool-2.4.2.orig/tests/tagdemo/configure 2013-09-05
>>> 10:37:25.727040000 +0200
>>> ++++ libtool-2.4.2/tests/tagdemo/configure 2013-09-05 12:05:11.896353000 +0200
>>> +@@ -6926,7 +6926,7 @@
>>> +
>>> + lt_sysroot=
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" = yes; then
>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -6934,7 +6934,7 @@
>>> +  /*)
>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    { $as_echo "$as_me:${as_lineno-$LINENO}: result:
>>> ${with_libtool_sysroot}" >&5
>>>
>>> --
>>> 1.8.3.3
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>>


