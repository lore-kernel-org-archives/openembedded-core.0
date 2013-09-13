Return-Path: <hans.beckerus@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7E560ED9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 08:06:11 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id wo20so800653obc.41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 01:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=YcLOkGHmEZEuLVpcGvg2MBH2tcSHlgN/h3mB4yKJk+o=;
	b=i1acQX8tGqChIQfY+6yq0JB0ZN0H8P1ygYv4KeadenZEre/YPl2iCey4zzxeFcvlqO
	v2WJyPqPCnZqN1kuEthRy2yIJGLuE9g+DdFcSWDIkpSKQJV0L/m9jshfYCw1Dx7ojstm
	30w8/oCcN/i93zSeSYoKEO4Oj++hYUPMdj1Cz0HRgkCxAidD6wHzaPc3HFL5H4nNvmD8
	pnSo235iZG+po0sIMTT/Gwnna1UDxSNIjMNcUk7vWRyWFnE4CKGjH3qrhrTXugCBLvyu
	sOtBfuoPVaD/QJoK4+a2OuXbOO2Ji2G4GwWoumEnOosdwoqyG2J4AFMa36YYAjQzSwd9
	i2DQ==
MIME-Version: 1.0
X-Received: by 10.182.130.131 with SMTP id oe3mr11019199obb.34.1379059572727; 
	Fri, 13 Sep 2013 01:06:12 -0700 (PDT)
Received: by 10.182.44.8 with HTTP; Fri, 13 Sep 2013 01:06:12 -0700 (PDT)
In-Reply-To: <52324915.6030708@gmail.com>
References: <1378825041-20190-1-git-send-email-hans.beckerus@gmail.com>
	<522F9030.3020804@linux.intel.com>
	<CAFyqS9qRvPafVSt90BQe6F3Vaz8f0P2E2R4PLKh5Zz8JH8T6Vw@mail.gmail.com>
	<CAFyqS9rvPFr2F8+Tb1P0BLn84jJ0Q+cSCM-9pt8gOATquo4Gig@mail.gmail.com>
	<5231F548.6010801@linux.intel.com>
	<CAFyqS9r3WOEjfrPe5s=n1H9SzFsnJ4FAdo=AGprWUkufUe6QRQ@mail.gmail.com>
	<52322D8B.7080406@gmail.com> <52324915.6030708@gmail.com>
Date: Fri, 13 Sep 2013 10:06:12 +0200
Message-ID: <CAFyqS9omO7majs22+o-DPii9wpw15rrhxkgQAUD35GRWjRFqLw@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Sep 2013 08:06:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 1:07 AM, Hans Beckerus <hans.beckerus@gmail.com> wr=
ote:
> On 2013-09-12 11:09, Hans Beckerus wrote:
>>
>> On 2013-09-12 8:02, Hans Beck=E9rus wrote:
>>>
>>> On Thu, Sep 12, 2013 at 7:09 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>
>>>> On 09/11/2013 09:05 AM, Hans Beck=E9rus wrote:
>>>>>
>>>>> On Wed, Sep 11, 2013 at 10:15 AM, Hans Beck=E9rus
>>>>> <hans.beckerus@gmail.com>
>>>>> wrote:
>>>>>>
>>>>>> On Tue, Sep 10, 2013 at 11:33 PM, Saul Wold <sgw@linux.intel.com>
>>>>>> wrote:
>>>>>>>
>>>>>>> On 09/10/2013 07:56 AM, hans.beckerus@gmail.com wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> From: Hans Beckerus <hans.beckerus at gmail.com>
>>>>>>>>
>>>>>>>> This patch updates libtool.m4 (and its output) to resolve a proble=
m
>>>>>>>> with variable 'lt_sysroot' not being properly updated if the optio=
n
>>>>>>>> '--with[-libtool]-sysroot' is not provided when running the
>>>>>>>> 'configure'
>>>>>>>> script for a package.
>>>>>>>>
>>>>>>>> According to the help text ouput from 'configure':
>>>>>>>> --with-libtool-sysroot=3DDIR Search for dependent libraries within=
 DIR
>>>>>>>>                           (or the compiler's sysrooot if not
>>>>>>>> specified).
>>>>>>>>
>>>>>>>> Due to swapped cases in a switch statement, when checking if the
>>>>>>>> option
>>>>>>>> was specified or not, wrong actions were taken resulting in an
>>>>>>>> incorrect sysroot and failures to properly locate e.g. .la files.
>>>>>>>>
>>>>>>> What kind of testing have you done with this?  Have you tried a ful=
l
>>>>>>> world
>>>>>>> build?  This kind of change scares me a little as what issues we
>>>>>>> might
>>>>>>> have
>>>>>>> patched around or behavior built into software.
>>>>>>>
>>>>>> In the area of testing, it has been verified in my local environment=
,
>>>>>> which covers a few different ARM based images and SDK installs. I ha=
ve
>>>>>> not done a build of all possible packages in my Yocto branch.
>>>>>>
>>>>>>> I just completed a world build locally and have failures in
>>>>>>> file-native
>>>>>>> guile-native, and gtk+3, not sure if we need to invalidate sstate, =
I
>>>>>>> am
>>>>>>> starting a clean build.
>>>>>>>
>>>>>> I have no issues with neither of those packages, at least not in
>>>>>> stand-alone builds.
>>>>>> Can you specify a little more exactly what goes wrong during the bui=
ld
>>>>>> stage?
>>>>>>
>>>>> Actually, someone else here hit a couple of packages that had  SDK
>>>>> build failures after applying the patch.
>>>>> In this case it was gettext-native and gnutls-native. After doing a
>>>>> 'cleanall' of those packages rebuild went fine.
>>>>> So, yes, sstate should probably be invalidated after a change like
>>>>> this since some packages does not seem to be rebuilt properly
>>>>> otherwise. Are they missing a DEPEND to libtool maybe?
>>>>>
>>>> No, these are from a clean build space with no sstate either, I wanted
>>>> to
>>>> verify that.
>>>>
>>>> Also, anything that inherits autotools automagically gets a libtool
>>>> dependency added, so we should not be adding that kind of dependency i=
n
>>>> recipes.
>>>>
>>>> I have attached the 3 failures I saw for a completely clean build, not=
e
>>>> these are native tools: file-native, guile-native and apr-util-native.
>>>>
>>> Again, I have no issues what so ever to build these packages one by
>>> one after a clean sstate.
>>> On the other hand, I am on a poky 1.4 baseline. I need to bring in the
>>> latest oe-core and build world from there.
>>
>> I have now tried a world build on oe-core master/latest and I can confir=
m
>> that also I get build errors on a clean build root.
>> I only went as far as stopping at file-native. I think I need to debug
>> this problem package by package. Something is definitely spooky here.
>> On poky 1.4 it works like a charm, on current oe-core it does not. Also,
>> doing a clean sstate or building "file-native" separately
>> makes no difference.  What I discovered is that the sysroot is completel=
y
>> wrong. It has been resolved to "/" which means the wrong
>> set of libraries are picked up. If I patched the generated
>> x86_64-linux-libtool and replaced lt_sysroot with the actual sysroot in =
use
>> compilation went fine! The libtool patch *is* good. No question about
>> that. It is an obvious bug that has been corrected. To me this looks lik=
e
>> some kind of  a double-fault! I need to dig deeper.
>>
>>
> I now got a somewhat better picture of what is going on. I know what is
> failing, and why. But currently I have no solution ready. Actually there =
are
> some nasty traps to get caught in here :(. The problem is actually as sim=
ple
> as it is obvious. For all those native packages that do work (this is a
> unique problem for native packages using libtool), they all seem to share=
 a
> common thing in their recipes:
>
> EXTRA_OECONF +=3D " --with-libtool-sysroot=3D${STAGING_DIR_NATIVE}"
>
> Great! This is the way to do it. But, what if someone forgets to do this?
> Well the answer is; it will most likely *not* compile!
> Since libtool now has been fixed to correctly pick up the sysroot from th=
e
> compiler (using --print-sysroot) if --with-libtool-sysroot is not specifi=
ed
> it will try to execute ${CC} --print-sysroot. Bummer! ${CC} is most likel=
y
> simply set to 'gcc' for native packages. That is, the local host compiler=
 is
> used.
> The sysroot for that is of course "/". And it should be. Otherwise it wil=
l
> bring in the wrong set of header files and libraries. But, there is anoth=
er
> problem here. We should not let libtool use "/"! Because even if we use t=
he
> local host compiler for native packages, we still use the oe-core upstrea=
m
> version of libtool, and that does not like using "/" as sysroot.  If it d=
oes
> everything becomes a mess. And that is exactly what seems to happen now
> after the patch. Before the patch libtool rendered the SDK for libtool
> enabled packages more or less useless. But, it also saved us in the nativ=
e
> case. Because if --with-libtool-sysroot was set, the path was used direct=
ly,
> but if it was not set, lt_sysroot was also kept unset. And here is the
> spooky part again. Having lt_sysroot set to nothing seems to work just as
> well as setting it, provided it points to a valid location!? This magic
> however did not work for the SDK which requires the sysroot to be resolve=
d
> correctly when not specified. So one conclusion could be that, for native
> packages, enforcement of --with-libtool-sysroot is a possible way forward=
.
> Would this be safe? I think so, but I might have overlooked something.  I
> can also see in config.log that "configure" is fed with a lot of argument=
s,
> even if EXTRA_OECONF is not specified. How is this handled? How can I try=
 to
> force this in for all native packages. I looked into native.bbclass but i=
t
> was not obvious to me how anything in there actually ends up in arguments=
 to
> "configure". Any hints? There are still a lot of gaps in my analysis ;) I=
f
> anyone feels like they can fill in the gaps, please do.
>
>
Now this is getting interesting. When I said before I could reproduce
the problem in a world build I did not know that it would actually
succeed later. On a different build server!! The previous analysis
made is mostly true. But there is something more. Why did it succeed
on one of my servers but not the other one? The way to find out was to
compare what lt_sysroot is resolved to in both cases. And there it
was. On the machine for which it works, lt_sysroot is now picked up
from $CC --print-sysroot (due to the patch), but the result is not
"/", it is unset! Which is the same behavior that can be observed
without the libtool patch. So this is getting even worse now. It is
gcc and host dependent. If gcc has been built with a sysroot of "/" is
does not work since that will be picked up by libtool, and is of
course wrong in our case. But if lt_sysroot is kept unset, libtool
seems to be able to resolve a working default using some other
(unknown) mechanism. That is why we have not seen this problem before,
even though libtool actually did the wrong thing before the patch. So
this leaves me with at least this question; is it actually correct
that gcc has "/" as a compiled in sysroot on some machines?

I then saw two possible solutions:

a) update the patch in libtool and if gcc reports a single "/", skip
it and leave lt_sysroot unset.
b) consistency is the key. Let all native packages force setting of a
proper lt_sysroot  using --with-libtool-sysroot.

This is also when I found this in autotools.bbclass

def append_libtool_sysroot(d):
    # Only supply libtool sysroot option for non-native packages
    if not bb.data.inherits_class('native', d):
        return '--with-libtool-sysroot=3D${STAGING_DIR_HOST}'
    return ""

I can somewhat understand the rationale behind this. If building for
target you wish to point libtool to a proper sysroot, and leaving it
unset for native seems like a good idea. But I do not think that
really is the case. Even for native builds you wish to point it to the
sysroot for the libtool actually being used. Not to what the compiler
is pointing to, which is now the effect after applying the libtool
patch. But which is actually what you want when building from an
placement independent SDK toolchain for which $CC is updated with a
proper --sysroot argument to gcc automatically when the environment
script is sourced.

So my propasal now is to update autotools.bbclass and for native
packages set -with-libtool-sysroot=3D${STAGING_DIR_NATIVE}. This should
cover all the corner cases and work in all different combinations.
Again, consistency is the key. But I still need to try it. Problem now
is that I need to wait until I have access to the machine for which it
currently does not work to verify it properly.

Please advise. Does anyone object strongly to this idea?



> Thanks.
> Hans
>
>
>>
>>> Hans
>>>
>>>> Sau!
>>>>
>>>>
>>>>>> Thanks,
>>>>>> Hans
>>>>>>
>>>>>>> I have not dug too deeply into this yet.
>>>>>>>
>>>>>>> Sau!
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> For current upstream status see:
>>>>>>>> http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.htm=
l
>>>>>>>>
>>>>>>>> Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>>>>>>> ---
>>>>>>>>     meta/recipes-devtools/libtool/libtool-2.4.2.inc |  1 +
>>>>>>>>     .../libtool/libtool/fix-resolve-lt-sysroot.patch | 35
>>>>>>>> ++++++++++++++++++++++
>>>>>>>>     2 files changed, 36 insertions(+)
>>>>>>>>     create mode 100644
>>>>>>>> meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.patch
>>>>>>>>
>>>>>>>> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>>>>>> b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>>>>>> index bb4ddf0..92e4949 100644
>>>>>>>> --- a/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>>>>>> +++ b/meta/recipes-devtools/libtool/libtool-2.4.2.inc
>>>>>>>> @@ -20,6 +20,7 @@ SRC_URI =3D
>>>>>>>> "${GNU_MIRROR}/libtool/libtool-${PV}.tar.gz
>>>>>>>> \
>>>>>>>>              file://respect-fstack-protector.patch \
>>>>>>>>                file://norm-rpath.patch \
>>>>>>>>                file://dont-depend-on-help2man.patch \
>>>>>>>> +           file://fix-resolve-lt-sysroot.patch \
>>>>>>>>               "
>>>>>>>>
>>>>>>>>     SRC_URI[md5sum] =3D "d2f3b7d4627e69e13514a40e72a24d50"
>>>>>>>> diff --git
>>>>>>>> a/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.pat=
ch
>>>>>>>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.pat=
ch
>>>>>>>> new file mode 100644
>>>>>>>> index 0000000..5a6335b
>>>>>>>> --- /dev/null
>>>>>>>> +++
>>>>>>>> b/meta/recipes-devtools/libtool/libtool/fix-resolve-lt-sysroot.pat=
ch
>>>>>>>> @@ -0,0 +1,35 @@
>>>>>>>> +
>>>>>>>> +Upstream-Status: Pending
>>>>>>>> +
>>>>>>>> +This patch updates libtool.m4 (and its output) to resolve a probl=
em
>>>>>>>> +with variable 'lt_sysroot' not being properly updated if the opti=
on
>>>>>>>> +'--with[-libtool]-sysroot' is not provided when running the
>>>>>>>> 'configure'
>>>>>>>> +script for a package.
>>>>>>>> +
>>>>>>>> +I have also reported the problem to libtool here
>>>>>>>> +
>>>>>>>> +http://lists.gnu.org/archive/html/bug-libtool/2013-09/msg00005.ht=
ml
>>>>>>>> +
>>>>>>>> +Signed-off-by: Hans Beckerus <hans.beckerus at gmail.com>
>>>>>>>> +---
>>>>>>>> +diff -ur libtool-2.4.2.orig/libltdl/m4/libtool.m4
>>>>>>>> libtool-2.4.2/libltdl/m4/libtool.m4
>>>>>>>> +--- libtool-2.4.2.orig/libltdl/m4/libtool.m4 2013-09-05
>>>>>>>> 10:37:24.690013000 +0200
>>>>>>>> ++++ libtool-2.4.2/libltdl/m4/libtool.m4 2013-09-05
>>>>>>>> 12:05:51.560281000 +0200
>>>>>>>> +@@ -1234,7 +1234,7 @@
>>>>>>>> + dnl in case the user passed a directory name.
>>>>>>>> + lt_sysroot=3D
>>>>>>>> + case ${with_libtool_sysroot} in #(
>>>>>>>> +- yes)
>>>>>>>> ++ no)
>>>>>>>> +    if test "$GCC" =3D yes; then
>>>>>>>> +      lt_sysroot=3D`$CC --print-sysroot 2>/dev/null`
>>>>>>>> +    fi
>>>>>>>> +@@ -1242,7 +1242,7 @@
>>>>>>>> +  /*)
>>>>>>>> +    lt_sysroot=3D`echo "$with_libtool_sysroot" | sed -e
>>>>>>>> "$sed_quote_subst"`
>>>>>>>> +    ;; #(
>>>>>>>> +- no|'')
>>>>>>>> ++ yes|'')
>>>>>>>> +    ;; #(
>>>>>>>> +  *)
>>>>>>>> +    AC_MSG_RESULT([${with_libtool_sysroot}])
>>>>>>>>
>>>>>
>>
>

