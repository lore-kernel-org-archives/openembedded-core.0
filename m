Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5277F61864
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 21:50:24 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Sep 2013 14:50:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,893,1371106800"; d="scan'208";a="294226620"
Received: from unknown (HELO [10.255.14.99]) ([10.255.14.99])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Sep 2013 14:50:16 -0700
Message-ID: <52323717.1090502@linux.intel.com>
Date: Thu, 12 Sep 2013 14:50:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Hans Beckerus <hans.beckerus@gmail.com>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<522F9030.3020804@linux.intel.com>
	<CAFyqS9qRvPafVSt90BQe6F3Vaz8f0P2E2R4PLKh5Zz8JH8T6Vw@mail.gmail.com>
	<CAFyqS9rvPFr2F8+Tb1P0BLn84jJ0Q+cSCM-9pt8gOATquo4Gig@mail.gmail.com>
	<5231F548.6010801@linux.intel.com>
	<CAFyqS9r3WOEjfrPe5s=n1H9SzFsnJ4FAdo=AGprWUkufUe6QRQ@mail.gmail.com>
	<52322D8B.7080406@gmail.com>
In-Reply-To: <52322D8B.7080406@gmail.com>
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
X-List-Received-Date: Thu, 12 Sep 2013 21:50:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 09/12/2013 02:09 PM, Hans Beckerus wrote:
> On 2013-09-12 8:02, Hans Beckérus wrote:
>> On Thu, Sep 12, 2013 at 7:09 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>> On 09/11/2013 09:05 AM, Hans Beckérus wrote:
>>>> On Wed, Sep 11, 2013 at 10:15 AM, Hans Beckérus
>>>> <hans.beckerus@gmail.com>
>>>> wrote:
>>>>> On Tue, Sep 10, 2013 at 11:33 PM, Saul Wold <sgw@linux.intel.com>
>>>>> wrote:
>>>>>> On 09/10/2013 07:56 AM, hans.beckerus@gmail.com wrote:
>>>>>>>
>>>>>>> From: Hans Beckerus <hans.beckerus at gmail.com>
>>>>>>>
>>>>>>> This patch updates libtool.m4 (and its output) to resolve a problem
>>>>>>> with variable 'lt_sysroot' not being properly updated if the option
>>>>>>> '--with[-libtool]-sysroot' is not provided when running the
>>>>>>> 'configure'
>>>>>>> script for a package.
>>>>>>>
>>>>>>> According to the help text ouput from 'configure':
>>>>>>> --with-libtool-sysroot=DIR Search for dependent libraries within DIR
>>>>>>>                           (or the compiler's sysrooot if not
>>>>>>> specified).
>>>>>>>
>>>>>>> Due to swapped cases in a switch statement, when checking if the
>>>>>>> option
>>>>>>> was specified or not, wrong actions were taken resulting in an
>>>>>>> incorrect sysroot and failures to properly locate e.g. .la files.
>>>>>>>
>>>>>> What kind of testing have you done with this?  Have you tried a full
>>>>>> world
>>>>>> build?  This kind of change scares me a little as what issues we
>>>>>> might
>>>>>> have
>>>>>> patched around or behavior built into software.
>>>>>>
>>>>> In the area of testing, it has been verified in my local environment,
>>>>> which covers a few different ARM based images and SDK installs. I have
>>>>> not done a build of all possible packages in my Yocto branch.
>>>>>
>>>>>> I just completed a world build locally and have failures in
>>>>>> file-native
>>>>>> guile-native, and gtk+3, not sure if we need to invalidate sstate,
>>>>>> I am
>>>>>> starting a clean build.
>>>>>>
>>>>> I have no issues with neither of those packages, at least not in
>>>>> stand-alone builds.
>>>>> Can you specify a little more exactly what goes wrong during the build
>>>>> stage?
>>>>>
>>>> Actually, someone else here hit a couple of packages that had  SDK
>>>> build failures after applying the patch.
>>>> In this case it was gettext-native and gnutls-native. After doing a
>>>> 'cleanall' of those packages rebuild went fine.
>>>> So, yes, sstate should probably be invalidated after a change like
>>>> this since some packages does not seem to be rebuilt properly
>>>> otherwise. Are they missing a DEPEND to libtool maybe?
>>>>
>>> No, these are from a clean build space with no sstate either, I
>>> wanted to
>>> verify that.
>>>
>>> Also, anything that inherits autotools automagically gets a libtool
>>> dependency added, so we should not be adding that kind of dependency in
>>> recipes.
>>>
>>> I have attached the 3 failures I saw for a completely clean build, note
>>> these are native tools: file-native, guile-native and apr-util-native.
>>>
>> Again, I have no issues what so ever to build these packages one by
>> one after a clean sstate.
>> On the other hand, I am on a poky 1.4 baseline. I need to bring in the
>> latest oe-core and build world from there.
> I have now tried a world build on oe-core master/latest and I can
> confirm that also I get build errors on a clean build root.
> I only went as far as stopping at file-native. I think I need to debug
> this problem package by package. Something is definitely spooky here.

Spooky is the right word for it, I was not sure what was going on and do 
not have the time to spend on it right now, that's why I kicked it back 
your way.

> On poky 1.4 it works like a charm, on current oe-core it does not. Also,
> doing a clean sstate or building "file-native" separately
> makes no difference.  What I discovered is that the sysroot is
> completely wrong. It has been resolved to "/" which means the wrong
> set of libraries are picked up. If I patched the generated
> x86_64-linux-libtool and replaced lt_sysroot with the actual sysroot in use
> compilation went fine! The libtool patch *is* good. No question about
Right, I understand that, it's just the behavior has now changed and 
other things may have relied on the broken behavior.

> that. It is an obvious bug that has been corrected. To me this looks like
> some kind of  a double-fault! I need to dig deeper.
>
I was kind of wondering if somehow some of those upstreams worked around 
the problem in libtool and now that you fixed it, there is strange breakage.

Thanks for confirming the issue and digging into it, these fixes might 
have to go upstream also.

Sau!


> Thanks.
> Hans
>
>> Hans
>>
>>> Sau!
>>>
>>>
>>>>> Thanks,
>>>>> Hans
>>>>>
>>>>>> I have not dug too deeply into this yet.
>>>>>>
>>>>>> Sau!
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>> For current upstream status see:
>>>>>>> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>>>>>>>
>>>>>>> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>>>>>> ---
>>>>>>>     meta/recipes-devtools/libtool/libtool-2.4.2.inc    |  1 +
>>>>>>>     .../libtool/libtool/fix-resolve-lt-sysroot.patch   | 35
>>>>>>> ++++++++++++++++++++++
>>>>>>>     2 files changed, 36 insertions(+)
>>>>>>>     create mode 100644
>>>>>>> meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>>>>>
>>>>>>> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>>>>> b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>>>>> index bb4ddf0..92e4949 100644
>>>>>>> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>>>>> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>>>>> @@ -20,6 +20,7 @@ SRC_URI =
>>>>>>> "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz
>>>>>>> \
>>>>>>>              file://respect-fstack-protector.patch \
>>>>>>>                file://norm-rpath.patch \
>>>>>>>                file://dont-depend-on-help2man.patch \
>>>>>>> +           file://fix-resolve-lt-sysroot.patch \
>>>>>>>               "
>>>>>>>
>>>>>>>     SRC_URI[md5sum] = "d2f3b7d4627e69e13514a40e72a24d50"
>>>>>>> diff --git
>>>>>>> a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>>>>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>>>>> new file mode 100644
>>>>>>> index 0000000..5a6335b
>>>>>>> --- /dev/null
>>>>>>> +++
>>>>>>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>>>>> @@ -0,0 +1,35 @@
>>>>>>> +
>>>>>>> +Upstream-Status: Pending
>>>>>>> +
>>>>>>> +This patch updates libtool.m4 (and its output) to resolve a problem
>>>>>>> +with variable 'lt_sysroot' not being properly updated if the option
>>>>>>> +'--with[-libtool]-sysroot' is not provided when running the
>>>>>>> 'configure'
>>>>>>> +script for a package.
>>>>>>> +
>>>>>>> +I have also reported the problem to libtool here
>>>>>>> +
>>>>>>> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html
>>>>>>> +
>>>>>>> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>>>>>> +---
>>>>>>> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
>>>>>>> libtool-2.4.2/libltdl/m4/libtool.m4
>>>>>>> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4   2013-09-05
>>>>>>> 10:37:24.690013000 +0200
>>>>>>> ++++ libtool-2.4.2/libltdl/m4/libtool.m4        2013-09-05
>>>>>>> 12:05:51.560281000 +0200
>>>>>>> +@@ -1234,7 +1234,7 @@
>>>>>>> + dnl in case the user passed a directory name.
>>>>>>> + lt_sysroot=
>>>>>>> + case ${with_libtool_sysroot} in #(
>>>>>>> +- yes)
>>>>>>> ++ no)
>>>>>>> +    if test "$GCC" = yes; then
>>>>>>> +      lt_sysroot=`$CC --print-sysroot 2>/dev/null`
>>>>>>> +    fi
>>>>>>> +@@ -1242,7 +1242,7 @@
>>>>>>> +  /*)
>>>>>>> +    lt_sysroot=`echo "$with_libtool_sysroot" | sed -e
>>>>>>> "$sed_quote_subst"`
>>>>>>> +    ;; #(
>>>>>>> +- no|'')
>>>>>>> ++ yes|'')
>>>>>>> +    ;; #(
>>>>>>> +  *)
>>>>>>> +    AC_MSG_RESULT([${with_libtool_sysroot}])
>>>>>>>
>>>>
>
>
>

