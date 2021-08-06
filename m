Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web09.2718.1628283874332203824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 14:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cybernetics.com header.s=mail header.b=o6Nkios8;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==852474de9cf==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1628283872-0fb3b001bf9d160001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id Muo5yAl9IUWNcFDR; Fri, 06 Aug 2021 17:04:32 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=lUc/xPyV1m3h13AmGz34qMezc2o4+seIQfC8fS10Ot4=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:To:From:Subject; b=o6Nkios8BXVCDMJe/y
	/ZHziLdtzKGLG2YlrKDIuvELDepGt3hgfRldaSA8bsUnCldM+t+P4s9cQffErxQHq9sUHBiTKxpfG
	MZ2AxbAGgcCXneOhwPPqgAZ/bQN+Cb3raWXFVytgA3ioKxCjiLs6SbYQKiAu3wAGOfF6mQBlXK/g=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 11055428; Fri, 06 Aug 2021 17:04:32 -0400
Subject: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
From: "Tony Battersby" <tonyb@cybernetics.com>
X-ASG-Orig-Subj: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
 <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
 <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com>
 <040fe5d8cd3914e7c19fc70ae6d18894b07f8073.camel@linuxfoundation.org>
 <6bb55159-9b49-3229-a15c-eee730560fb7@cybernetics.com>
Message-ID: <5e21ec72-667f-6e48-eefc-843312544fe4@cybernetics.com>
Date: Fri, 6 Aug 2021 17:04:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6bb55159-9b49-3229-a15c-eee730560fb7@cybernetics.com>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1628283872
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 8408
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/6/21 12:44 PM, Tony Battersby wrote:
> On 8/6/21 1:33 AM, Richard Purdie wrote:
>> On Thu, 2021-08-05 at 17:54 -0400, Tony Battersby wrote:
>>> On 8/5/21 6:21 AM, Richard Purdie wrote:
>>>> On Wed, 2021-08-04 at 20:13 -0400, Randy MacLeod wrote:
>>>>> On 2021-07-27 9:34 a.m., Tony Battersby wrote:
>>>>>> Currently, enabling Link Time Optimization via:
>>>>>>
>>>>>> require conf/distro/include/lto.inc
>>>>>> DISTRO_FEATURES_append =3D " lto"
>>>>>>
>>>>>> makes the build non-reproducible (as in
>>>>>> https://reproducible-builds.org/).=C2=A0 This patch set fixes some=
 of the
>>>>>> problems, but is not yet a complete solution.
>>>>>>
>>>>>> This patch set addresses the following bugs:
>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481
>>>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14490
>>>>>>
>>>>>> openembedded-core patches
>>>>>> 1/4: lto.inc: disable LTO for grub
>>>>>> 2/4: gcc: Backport patch to make LTO builds more reproducible
>>>>>> 3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
>>>>>>
>>>>>> openembedded-devel patches
>>>>>> 4/4: net-snmp: fix QA Issue after LDFLAGS change
>>>>>>
>>>>>> Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already in
>>>>>> TARGET_CFLAGS).=C2=A0 This could possibly be done differently, suc=
h as by
>>>>>> removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIONS,
>>>>>> TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.=C2=A0 =
Let me know
>>>>>> if there is a better/preferred way to do it.
>>>>>>
>>>>>> The TARGET_LDFLAGS change broke net-snmp from meta-networking, so =
I have
>>>>>> included a patch to fix that.=C2=A0 Other packages might have been=
 broken as
>>>>>> well, although I haven't found any others.
>>>>>>
>>>>>> With all these patches, there are still many shared libraries in /=
lib
>>>>>> and /usr/lib that are still not reproducible with LTO enabled beca=
use
>>>>>> x86_64-poky-linux-libtool filters out the -f*-prefix-map flags add=
ed by
>>>>>> patch 3 when linking shared libraries.=C2=A0 /usr/lib/libbz2.so.1.=
0.6 from
>>>>>> the libbz2 package from the bzip2 recipe is a good example.=C2=A0 =
I do not
>>>>>> have a patch for that problem.=C2=A0 I will leave that to someone =
else.
>>>>>>
>>>>>> So this is what we need to achieve reproducible LTO builds:
>>>>>> *) This patch set
>>>>>> *) A fix for libtool
>>>>>> *) Add LTO to reproducible builds testing if appropriate (e.g.
>>>>>> meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder)
>>>>>> *) Fixes for individual packages, if needed
>>>>>> *) Once everything works, update the documentation again (I previo=
usly
>>>>>> requested a documentation change for this bug, which will eventual=
ly
>>>>>> show up at
>>>>>> http://docs.yoctoproject.org/test-manual/reproducible-builds.html)=
.
>>>>> This is certainly a few steps in the right direction with a good ou=
tline
>>>>> of what's next.
>>>>>
>>>>> I suspect that Richard has been busy with other things like overrid=
es
>>>>> and the update to glibc-2.34.
>>>>>
>>>>> Do you have any suggestions or questions about what we should do
>>>>> with this patch series Richard?
>>>> Thanks for the reminder, I've been meaning to queue/test this which =
I will
>>>> do. The gcc version has been bumped but I ported the patch forward t=
o it
>>>> and the patches are in master-next for testing. It is great to see t=
his
>>>> support moving forward.
>>>>
>>>> Much as it pains me to admit having any libtool knowledge, I may be =
able to
>>>> help with that bit. There is an untested patch below which may addre=
ss that
>>>> issue, or at least give a good hint on how to do it if it doesn't wo=
rk. I
>>>> don't have an environment to test easily right now.
>>>>
>>>> Cheers,
>>>>
>>>> Richard
>>> I tested your libtool patch in master-next with the bzip2 recipe.=C2=A0=
 It
>>> works as intended; libbz2.so.1.0.6 and all the other output files are
>>> now reproducible with LTO enabled.=C2=A0 I also verified that libtool=
 is
>>> passing the -f*-prefix-map flags to the link command in log.do_compil=
e
>>> as intended.
>>>
>>> I also verified that core-image-minimal builds successfully with the
>>> libtool patch.
>> Thanks for testing that, sounds like it helps that issue. I'll queue t=
hat patch.
>>
>> Unfortunately even with the ruby fix I queued, we still see reproducib=
lity
>> issues with the LDFLAGS change in curl-dev, gettext-ptest, ruby and ru=
by-dbg=C2=A0
>> packages:
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/515=
/steps/12/logs/stdio
>>
>> We'll need to resolve those before I can merge the flags change.
>>
>> Diffoscope output:
>>
>> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210805-8=
jfd55ki/packages/diff-html/
>>
>> Basically LDFLAGS get encoded into a couple of scripts and the ruby bi=
nary.
>>
>> Cheers,
>>
>> Richard
>>
> It looks like the ruby problem is being caused by MJIT_DLDFLAGS in
> build/tmp/work/core2-64-poky-linux/ruby/3.0.2-r0/build/mjit_config.h.=C2=
=A0
> There is already a patch
> poky/meta/recipes-devtools/ruby/ruby/0001-template-Makefile.in-do-not-w=
rite-host-cross-cc-item.patch
> that removes some of these items for the sake of reproducibiltiy.=C2=A0=
 But I
> do not know ruby, so I do not know the implications of doing the same
> thing for MJIT_DLDFLAGS.
>
> Tony Battersby
>
>
>
Richard,

I noticed that you already fixed the problems in curl and gettext in
master-next.=C2=A0 Here is a patch for ruby if you haven't fixed that alr=
eady.

Tony Battersby

From 9cfb9777ff6ef95a27ed6a03719c807365d0f116 Mon Sep 17 00:00:00 2001
From: Tony Battersby <tonyb@cybernetics.com>
Date: Fri, 6 Aug 2021 16:47:14 -0400
Subject: [PATCH] ruby: Fix reproducibility issue with LDFLAGS

If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no
longer reproducible.  Fix this.

Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
---
 ...-Makefile.in-filter-out-f-prefix-map.patch | 42 +++++++++++++++++++
 meta/recipes-devtools/ruby/ruby_3.0.2.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/0002-template-Makefil=
e.in-filter-out-f-prefix-map.patch

diff --git a/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-fi=
lter-out-f-prefix-map.patch b/meta/recipes-devtools/ruby/ruby/0002-templa=
te-Makefile.in-filter-out-f-prefix-map.patch
new file mode 100644
index 0000000000..9387506c26
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/0002-template-Makefile.in-filter-ou=
t-f-prefix-map.patch
@@ -0,0 +1,42 @@
+Subject: [PATCH] template/Makefile.in: filter out -f*prefix-map
+
+If we add DEBUG_PREFIX_MAP into LDFLAGS, ruby and ruby-dbg are no longer
+reproducible.  Fix this.
+
+Upstream-Status: Inapproppriate [oe-core specific]
+Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
+---
+--- a/tool/mjit_archflag.sh
++++ b/tool/mjit_archflag.sh
+@@ -7,6 +7,20 @@ quote() {
+     echo
+ }
+=20
++quote_filtered() {
++    printf "#${indent}define $1"
++    while shift && [ "$#" -gt 0 ]; do
++	case "$1" in
++	    -ffile-prefix-map=3D*|-fdebug-prefix-map=3D*|-fmacro-prefix-map=3D=
*)
++		;;
++	    *)
++		printf ' "%s"'$sep "$1"
++		;;
++	esac
++    done
++    echo
++}
++
+ archs=3D""
+ arch_flag=3D""
+=20
+--- a/template/Makefile.in
++++ b/template/Makefile.in
+@@ -666,7 +666,7 @@ mjit_config.h:
+ 	quote "MJIT_OPTFLAGS   " $(MJIT_OPTFLAGS); \
+ 	quote "MJIT_DEBUGFLAGS " $(MJIT_DEBUGFLAGS); \
+ 	quote "MJIT_LDSHARED   " ; \
+-	quote "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
++	quote_filtered "MJIT_DLDFLAGS    MJIT_ARCHFLAG" $(MJIT_DLDFLAGS); \
+ 	quote "MJIT_LIBS       " $(LIBRUBYARG_SHARED); \
+ 	quote 'PRELOADENV       "@PRELOADENV@"'; \
+ 	indent=3D$${archs:+'  '}; \
diff --git a/meta/recipes-devtools/ruby/ruby_3.0.2.bb b/meta/recipes-devt=
ools/ruby/ruby_3.0.2.bb
index 0b9c342def..38e594a59e 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.2.bb
@@ -6,6 +6,7 @@ SRC_URI +=3D " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-i=
tem.patch \
+           file://0002-template-Makefile.in-filter-out-f-prefix-map.patc=
h \
            "
=20
 SRC_URI[sha256sum] =3D "5085dee0ad9f06996a8acec7ebea4a8735e6fac22f22e2d9=
8c3f2bc3bef7e6f1"
--=20
2.25.1

