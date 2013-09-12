Return-Path: <hans.beckerus@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8CCD76A441
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 23:07:04 +0000 (UTC)
Received: by mail-la0-f49.google.com with SMTP id ev20so399862lab.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 16:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=FjYP8ulFtvH5uz3gLCVdKT1ex88feD3ohZDnksFAD3I=;
	b=iUdhkQPqkYRkLT5ry8jKwL8Kk01jUg498Yr7TIxd0H3/5Z/A0veU4crRkjkdrO0GWv
	+ov1kHv1ebLu/Ga7rZpqmpuYOF7KoVQEKnR+LYwu3h0rnmeGufR4V4VrKsAfY1yNb5jB
	hizVGF4ZNdrdRmWviDXxE8jjDactORsgWG7rJEzNkOA6MlZGzmvF/hhS0ifV/kTnEbhD
	wsT5CqcYTnBzMJyRFvjlhm4PoztmJE+NSM83m6ze5wA8YoLxKDRG/X6Y1QKpXpOp3QvR
	SZjN7eMXZnCJqrnGauIhVSxFnp38f9X2ltSoc0rouuWi/xs3muLpzduS1PjzBVcx7JXj
	xRVA==
X-Received: by 10.152.88.74 with SMTP id be10mr8274667lab.4.1379027225399;
	Thu, 12 Sep 2013 16:07:05 -0700 (PDT)
Received: from [192.168.0.10] (h135n8-rny-a12.ias.bredband.telia.com.
	[217.209.54.135])
	by mx.google.com with ESMTPSA id zc3sm4892981lbb.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 12 Sep 2013 16:07:04 -0700 (PDT)
Message-ID: <52324915.6030708@gmail.com>
Date: Fri, 13 Sep 2013 01:07:01 +0200
From: Hans Beckerus <hans.beckerus@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Thu, 12 Sep 2013 23:07:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 2013-09-12 11:09, Hans Beckerus wrote:
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
>>>>>>> --with-libtool-sysroot=DIR Search for dependent libraries within 
>>>>>>> DIR
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
>>>>> which covers a few different ARM based images and SDK installs. I 
>>>>> have
>>>>> not done a build of all possible packages in my Yocto branch.
>>>>>
>>>>>> I just completed a world build locally and have failures in 
>>>>>> file-native
>>>>>> guile-native, and gtk+3, not sure if we need to invalidate 
>>>>>> sstate, I am
>>>>>> starting a clean build.
>>>>>>
>>>>> I have no issues with neither of those packages, at least not in
>>>>> stand-alone builds.
>>>>> Can you specify a little more exactly what goes wrong during the 
>>>>> build
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
> On poky 1.4 it works like a charm, on current oe-core it does not. 
> Also, doing a clean sstate or building "file-native" separately
> makes no difference.  What I discovered is that the sysroot is 
> completely wrong. It has been resolved to "/" which means the wrong
> set of libraries are picked up. If I patched the generated 
> x86_64-linux-libtool and replaced lt_sysroot with the actual sysroot 
> in use
> compilation went fine! The libtool patch *is* good. No question about 
> that. It is an obvious bug that has been corrected. To me this looks like
> some kind of  a double-fault! I need to dig deeper.
>
>
I now got a somewhat better picture of what is going on. I know what is 
failing, and why. But currently I have no solution ready. Actually there 
are some nasty traps to get caught in here :(. The problem is actually 
as simple as it is obvious. For all those native packages that do work 
(this is a unique problem for native packages using libtool), they all 
seem to share a common thing in their recipes:

EXTRA_OECONF += " --with-libtool-sysroot=${STAGING_DIR_NATIVE}"

Great! This is the way to do it. But, what if someone forgets to do 
this? Well the answer is; it will most likely *not* compile!
Since libtool now has been fixed to correctly pick up the sysroot from 
the compiler (using --print-sysroot) if --with-libtool-sysroot is not 
specified it will try to execute ${CC} --print-sysroot. Bummer! ${CC} is 
most likely simply set to 'gcc' for native packages. That is, the local 
host compiler is used.
The sysroot for that is of course "/". And it should be. Otherwise it 
will bring in the wrong set of header files and libraries. But, there is 
another problem here. We should not let libtool use "/"! Because even if 
we use the local host compiler for native packages, we still use the 
oe-core upstream version of libtool, and that does not like using "/" as 
sysroot.  If it does everything becomes a mess. And that is exactly what 
seems to happen now after the patch. Before the patch libtool rendered 
the SDK for libtool enabled packages more or less useless. But, it also 
saved us in the native case. Because if --with-libtool-sysroot was set, 
the path was used directly, but if it was not set, lt_sysroot was also 
kept unset. And here is the spooky part again. Having lt_sysroot set to 
nothing seems to work just as well as setting it, provided it points to 
a valid location!? This magic however did not work for the SDK which 
requires the sysroot to be resolved correctly when not specified. So one 
conclusion could be that, for native packages, enforcement of 
--with-libtool-sysroot is a possible way forward.  Would this be safe? I 
think so, but I might have overlooked something.  I can also see in 
config.log that "configure" is fed with a lot of arguments, even if 
EXTRA_OECONF is not specified. How is this handled? How can I try to 
force this in for all native packages. I looked into native.bbclass but 
it was not obvious to me how anything in there actually ends up in 
arguments to "configure". Any hints? There are still a lot of gaps in my 
analysis ;) If anyone feels like they can fill in the gaps, please do.

Thanks.
Hans


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
>>>>>>>     meta/recipes-devtools/libtool/libtool-2.4.2.inc |  1 +
>>>>>>>     .../libtool/libtool/fix-resolve-lt-sysroot.patch | 35
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
>>>>>>>
>>>>>>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch 
>>>>>>>
>>>>>>> new file mode 100644
>>>>>>> index 0000000..5a6335b
>>>>>>> --- /dev/null
>>>>>>> +++
>>>>>>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch 
>>>>>>>
>>>>>>> @@ -0,0 +1,35 @@
>>>>>>> +
>>>>>>> +Upstream-Status: Pending
>>>>>>> +
>>>>>>> +This patch updates libtool.m4 (and its output) to resolve a 
>>>>>>> problem
>>>>>>> +with variable 'lt_sysroot' not being properly updated if the 
>>>>>>> option
>>>>>>> +'--with[-libtool]-sysroot' is not provided when running the
>>>>>>> 'configure'
>>>>>>> +script for a package.
>>>>>>> +
>>>>>>> +I have also reported the problem to libtool here
>>>>>>> +
>>>>>>> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.html 
>>>>>>>
>>>>>>> +
>>>>>>> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>>>>>> +---
>>>>>>> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
>>>>>>> libtool-2.4.2/libltdl/m4/libtool.m4
>>>>>>> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4 2013-09-05
>>>>>>> 10:37:24.690013000 +0200
>>>>>>> ++++ libtool-2.4.2/libltdl/m4/libtool.m4 2013-09-05
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


