Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 291486BCB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 08:15:04 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id xn12so8116491obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 01:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wzVEAi/Ab/2olH9IRq0+XltRz3xLJ4DeOxWJEzIxNYI=;
	b=oJ8ZvVBHMk5HtS3SjVdWFPHjo73PnhgFccNudWNTGRpkvmooWwLnkmVJ/BWp7fGwzd
	NNPXLnhKsb94X9kuK6LkdhJaNht09DxW1G/pPankSU5EgaZ0NMDjqbiaz7/pPIFQyxuf
	m6F8UFLnEszpZgFx4VSqNGyM45evZU0kk4qpogMQlbTQ8tFDK0eccfZ4Xb1e+Lerv+WU
	Td90Bbjjtrs9QVK1XzW33ZFRzvdbVm5akT7MRe4MFY+dVrPar4LzYL/llkdy2/1H0AXW
	uZaP8jzVHcj1ZWkKL7vz2BOe6fLbrgMNr5XDH6tFM9zHaF94IFz3+GPw7aeThVv1t6iN
	1BpQ==
MIME-Version: 1.0
X-Received: by 10.182.176.105 with SMTP id ch9mr315491obc.40.1378887305271;
	Wed, 11 Sep 2013 01:15:05 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Wed, 11 Sep 2013 01:15:05 -0700 (PDT)
In-Reply-To: <522F9030.3020804@linux.intel.com>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<522F9030.3020804@linux.intel.com>
Date: Wed, 11 Sep 2013 10:15:05 +0200
Message-ID: <CAFyqS9qRvPafVSt90BQe6F3Vaz8f0P2E2R4PLKh5Zz8JH8T6Vw@mail.gmail.com>
From: =?ISO-8859-1?Q?Hans_Beck=E9rus?= <hans.beckerus@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Wed, 11 Sep 2013 08:15:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Sep 10, 2013 at 11:33 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 09/10/2013 07:56 AM, hans.beckerus@gmail.com wrote:
>>
>> From: Hans Beckerus <hans.beckerus at gmail.com>
>>
>> This patch updates libtool.m4 (and its output) to resolve a problem
>> with variable 'lt_sysroot' not being properly updated if the option
>> '--with[-libtool]-sysroot' is not provided when running the 'configure'
>> script for a package.
>>
>> According to the help text ouput from 'configure':
>> --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>>                         (or the compiler's sysrooot if not specified).
>>
>> Due to swapped cases in a switch statement, when checking if the option
>> was specified or not, wrong actions were taken resulting in an
>> incorrect sysroot and failures to properly locate e.g. .la files.
>>
> What kind of testing have you done with this?  Have you tried a full world
> build?  This kind of change scares me a little as what issues we might have
> patched around or behavior built into software.
>
In the area of testing, it has been verified in my local environment,
which covers a few different ARM based images and SDK installs. I have
not done a build of all possible packages in my Yocto branch.

> I just completed a world build locally and have failures in file-native
> guile-native, and gtk+3, not sure if we need to invalidate sstate, I am
> starting a clean build.
>
I have no issues with neither of those packages, at least not in
stand-alone builds.
Can you specify a little more exactly what goes wrong during the build stage?

Thanks,
Hans

> I have not dug too deeply into this yet.
>
> Sau!
>
>
>
>
>> For current upstream status see:
>> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>>
>> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>> ---
>>   meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
>>   .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 35
>> ++++++++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>   create mode 100644
>> meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>
>> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>> b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>> index bb4ddf0..92e4949 100644
>> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>> @@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz \
>>            file://respect-fstack-protector.patch \
>>              file://norm-rpath.patch \
>>              file://dont-depend-on-help2man.patch \
>> +           file://fix-resolve-lt-sysroot.patch \
>>             "
>>
>>   SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
>> diff --git
>> a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>> new file mode 100644
>> index 0000000..5a6335b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>> @@ -0,0 +1,35 @@
>> +
>> +Upstream-Status: Pending
>> +
>> +This patch updates libtool.m4 (and its output) to resolve a problem
>> +with variable 'lt_sysroot' not being properly updated if the option
>> +'--with[-libtool]-sysroot' is not provided when running the 'configure'
>> +script for a package.
>> +
>> +I have also reported the problem to libtool here
>> +
>> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>> +
>> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>> +---
>> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
>> libtool-2.4.2/libltdl/m4/libtool.m4
>> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4   2013-09-05
>> 10:37:24.690013000 +0200
>> ++++ libtool-2.4.2/libltdl/m4/libtool.m4        2013-09-05
>> 12:05:51.560281000 +0200
>> +@@ -1234,7 +1234,7 @@
>> + dnl in case the user passed a directory name.
>> + lt_sysroot=
>> + case ${with_libtool_sysroot} in #(
>> +- yes)
>> ++ no)
>> +    if test "$GCC" = yes; then
>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>> +    fi
>> +@@ -1242,7 +1242,7 @@
>> +  /*)
>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e "$sed_quote_subst"`
>> +    ;; #(
>> +- no|'')
>> ++ yes|'')
>> +    ;; #(
>> +  *)
>> +    AC_MSG_RESULT([${with_libtool_sysroot}])
>>
>

