Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id C2794615C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 16:05:17 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo10so8654455obc.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=oz5PsOh9BTuWE3YMwaX0hy4an7ARR6F5hFu1bKR9BTA=;
	b=nP3HAi+ycQL3vEXlggb1oiXuxy87K4Cg5q5JyZbH2s/36G8t+O79Px97iAalFD9+l6
	OEb1hS41WC6zSBBQK3XdDPOZFV0feDLCxdKzDXOphBdCMgDBfT2ip89prLnbxrNAlyoB
	RkNo5duhkHNkBE+gP+2PjYspe4mRj+W5tmFTqEbmqMaKop+Qf/37pCDErDmHOuFKTnN9
	AqYQJn7jyQ8Q2IHnxI7hZ5OyVWBVuGcliKeIE/eEyI/u6TPhlqAI46FTrq7s2cAqHj70
	rnlMKAhXDbPBO0d0wnqRadoMSLVl3jBbwr2bh1zQQTrQdLJCDKuE5oZScEyIdUS3dlsY
	ouMQ==
MIME-Version: 1.0
X-Received: by 10.182.99.231 with SMTP id et7mr2228022obb.10.1378915519033;
	Wed, 11 Sep 2013 09:05:19 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Wed, 11 Sep 2013 09:05:18 -0700 (PDT)
In-Reply-To: <CAFyqS9qRvPafVSt90BQe6F3Vaz8f0P2E2R4PLKh5Zz8JH8T6Vw@mail.gmail.com>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<522F9030.3020804@linux.intel.com>
	<CAFyqS9qRvPafVSt90BQe6F3Vaz8f0P2E2R4PLKh5Zz8JH8T6Vw@mail.gmail.com>
Date: Wed, 11 Sep 2013 18:05:18 +0200
Message-ID: <CAFyqS9rvPFr2F8+Tb1P0BLn84jJ0Q+cSCM-9pt8gOATquo4Gig@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Sep 2013 16:05:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2013 at 10:15 AM, Hans Beck=E9rus <hans.beckerus@gmail.com>=
 wrote:
> On Tue, Sep 10, 2013 at 11:33 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 09/10/2013 07:56 AM, hans.beckerus@gmail.com wrote:
>>>
>>> From: Hans Beckerus <hans.beckerus at gmail.com>
>>>
>>> This patch updates libtool.m4 (and its output) to resolve a problem
>>> with variable 'lt_sysroot' not being properly updated if the option
>>> '--with[-libtool]-sysroot' is not provided when running the 'configure'
>>> script for a package.
>>>
>>> According to the help text ouput from 'configure':
>>> --with-libtool-sysroot=3DDIR Search for dependent libraries within DIR
>>>                         (or the compiler's sysrooot if not specified).
>>>
>>> Due to swapped cases in a switch statement, when checking if the option
>>> was specified or not, wrong actions were taken resulting in an
>>> incorrect sysroot and failures to properly locate e.g. .la files.
>>>
>> What kind of testing have you done with this?  Have you tried a full wor=
ld
>> build?  This kind of change scares me a little as what issues we might h=
ave
>> patched around or behavior built into software.
>>
> In the area of testing, it has been verified in my local environment,
> which covers a few different ARM based images and SDK installs. I have
> not done a build of all possible packages in my Yocto branch.
>
>> I just completed a world build locally and have failures in file-native
>> guile-native, and gtk+3, not sure if we need to invalidate sstate, I am
>> starting a clean build.
>>
> I have no issues with neither of those packages, at least not in
> stand-alone builds.
> Can you specify a little more exactly what goes wrong during the build st=
age?
>
Actually, someone else here hit a couple of packages that had  SDK
build failures after applying the patch.
In this case it was gettext-native and gnutls-native. After doing a
'cleanall' of those packages rebuild went fine.
So, yes, sstate should probably be invalidated after a change like
this since some packages does not seem to be rebuilt properly
otherwise. Are they missing a DEPEND to libtool maybe?

> Thanks,
> Hans
>
>> I have not dug too deeply into this yet.
>>
>> Sau!
>>
>>
>>
>>
>>> For current upstream status see:
>>> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>>>
>>> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>> ---
>>>   meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
>>>   .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 35
>>> ++++++++++++++++++++++
>>>   2 files changed, 36 insertions(+)
>>>   create mode 100644
>>> meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>
>>> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>> b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>> index bb4ddf0..92e4949 100644
>>> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>> @@ -20,6 +20,7 @@ SRC_URI =3D "${GNU_MIRROR}/libtool/libtool-${PV}.tar.=
gz \
>>>            file://respect-fstack-protector.patch \
>>>              file://norm-rpath.patch \
>>>              file://dont-depend-on-help2man.patch \
>>> +           file://fix-resolve-lt-sysroot.patch \
>>>             "
>>>
>>>   SRC_URI[md5sum] =3D "d2f3b7d4627e69e13514a40e72a24d50"
>>> diff --git
>>> a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>> new file mode 100644
>>> index 0000000..5a6335b
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patc=
h
>>> @@ -0,0 +1,35 @@
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +This patch updates libtool.m4 (and its output) to resolve a problem
>>> +with variable 'lt_sysroot' not being properly updated if the option
>>> +'--with[-libtool]-sysroot' is not provided when running the 'configure=
'
>>> +script for a package.
>>> +
>>> +I have also reported the problem to libtool here
>>> +
>>> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>>> +
>>> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>> +---
>>> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
>>> libtool-2.4.2/libltdl/m4/libtool.m4
>>> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4   2013-09-05
>>> 10:37:24.690013000 +0200
>>> ++++ libtool-2.4.2/libltdl/m4/libtool.m4        2013-09-05
>>> 12:05:51.560281000 +0200
>>> +@@ -1234,7 +1234,7 @@
>>> + dnl in case the user passed a directory name.
>>> + lt_sysroot=3D
>>> + case ${with_libtool_sysroot} in #(
>>> +- yes)
>>> ++ no)
>>> +    if test "$GCC" =3D yes; then
>>> +      lt_sysroot=3D`$CC --print-sysroot 2>/dev/null`
>>> +    fi
>>> +@@ -1242,7 +1242,7 @@
>>> +  /*)
>>> +    lt_sysroot=3D`echo "$with_libtool_sysroot" | sed -e "$sed_quote_su=
bst"`
>>> +    ;; #(
>>> +- no|'')
>>> ++ yes|'')
>>> +    ;; #(
>>> +  *)
>>> +    AC_MSG_RESULT([${with_libtool_sysroot}])
>>>
>>

