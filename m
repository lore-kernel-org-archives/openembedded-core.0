Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web10.287.1628200490823937335
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 14:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cybernetics.com header.s=mail header.b=jxEFGI6w;
 spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==851e7547032==tonyb@cybernetics.com)
X-ASG-Debug-ID: 1628200488-0fb3b001bf95800001-7zcVdP
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id ZViCSQnakjqjfykp; Thu, 05 Aug 2021 17:54:48 -0400 (EDT)
X-Barracuda-Envelope-From: tonyb@cybernetics.com
X-Barracuda-RBL-Trusted-Forwarder: 10.10.4.126
X-ASG-Whitelist: Client
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cybernetics.com; s=mail;
	bh=p6BsAHR81005wUTkCTOD2fybW66TzeoPzfAqSsY3BIU=;
	h=Content-Language:Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:To:Subject; b=jxEFGI6wxYEPXGelZ2
	SWbYWtEV+J8uzjpcFtmVgkBecJAlmQlCA9nsxzoaeDA1dHlPz8tijGHVpcN/MpxWFuvq4Wo9eqqsr
	FSrbzPyVfMMnKSNOH4UWBntLtuLrpTSMRN25zZzjG5B7khICMMwXxSLsx/LzYMksvRxCJdjEcAPE=
Received: from [10.157.2.224] (HELO [192.168.200.1])
  by cybernetics.com (CommuniGate Pro SMTP 6.2.14)
  with ESMTPS id 11053117; Thu, 05 Aug 2021 17:54:47 -0400
Subject: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
X-Barracuda-RBL-Trusted-Forwarder: 10.157.2.224
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
X-ASG-Orig-Subj: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
 <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
From: "Tony Battersby" <tonyb@cybernetics.com>
Message-ID: <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com>
Date: Thu, 5 Aug 2021 17:54:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1628200488
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 6400
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/5/21 6:21 AM, Richard Purdie wrote:
> On Wed, 2021-08-04 at 20:13 -0400, Randy MacLeod wrote:
>> On 2021-07-27 9:34 a.m., Tony Battersby wrote:
>>> Currently, enabling Link Time Optimization via:
>>>
>>> require conf/distro/include/lto.inc
>>> DISTRO_FEATURES_append =3D " lto"
>>>
>>> makes the build non-reproducible (as in
>>> https://reproducible-builds.org/).=C2=A0 This patch set fixes some of=
 the
>>> problems, but is not yet a complete solution.
>>>
>>> This patch set addresses the following bugs:
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14481
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14490
>>>
>>> openembedded-core patches
>>> 1/4: lto.inc: disable LTO for grub
>>> 2/4: gcc: Backport patch to make LTO builds more reproducible
>>> 3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
>>>
>>> openembedded-devel patches
>>> 4/4: net-snmp: fix QA Issue after LDFLAGS change
>>>
>>> Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already in
>>> TARGET_CFLAGS).=C2=A0 This could possibly be done differently, such a=
s by
>>> removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIONS,
>>> TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.=C2=A0 Let=
 me know
>>> if there is a better/preferred way to do it.
>>>
>>> The TARGET_LDFLAGS change broke net-snmp from meta-networking, so I h=
ave
>>> included a patch to fix that.=C2=A0 Other packages might have been br=
oken as
>>> well, although I haven't found any others.
>>>
>>> With all these patches, there are still many shared libraries in /lib
>>> and /usr/lib that are still not reproducible with LTO enabled because
>>> x86_64-poky-linux-libtool filters out the -f*-prefix-map flags added =
by
>>> patch 3 when linking shared libraries.=C2=A0 /usr/lib/libbz2.so.1.0.6=
 from
>>> the libbz2 package from the bzip2 recipe is a good example.=C2=A0 I d=
o not
>>> have a patch for that problem.=C2=A0 I will leave that to someone els=
e.
>>>
>>> So this is what we need to achieve reproducible LTO builds:
>>> *) This patch set
>>> *) A fix for libtool
>>> *) Add LTO to reproducible builds testing if appropriate (e.g.
>>> meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder)
>>> *) Fixes for individual packages, if needed
>>> *) Once everything works, update the documentation again (I previousl=
y
>>> requested a documentation change for this bug, which will eventually
>>> show up at
>>> http://docs.yoctoproject.org/test-manual/reproducible-builds.html).
>> This is certainly a few steps in the right direction with a good outli=
ne
>> of what's next.
>>
>> I suspect that Richard has been busy with other things like overrides
>> and the update to glibc-2.34.
>>
>> Do you have any suggestions or questions about what we should do
>> with this patch series Richard?
> Thanks for the reminder, I've been meaning to queue/test this which I w=
ill
> do. The gcc version has been bumped but I ported the patch forward to i=
t
> and the patches are in master-next for testing. It is great to see this
> support moving forward.
>
> Much as it pains me to admit having any libtool knowledge, I may be abl=
e to
> help with that bit. There is an untested patch below which may address =
that
> issue, or at least give a good hint on how to do it if it doesn't work.=
 I
> don't have an environment to test easily right now.
>
> Cheers,
>
> Richard

I tested your libtool patch in master-next with the bzip2 recipe.=C2=A0 I=
t
works as intended; libbz2.so.1.0.6 and all the other output files are
now reproducible with LTO enabled.=C2=A0 I also verified that libtool is
passing the -f*-prefix-map flags to the link command in log.do_compile
as intended.

I also verified that core-image-minimal builds successfully with the
libtool patch.

Tony Battersby


>
> >From 7681b0a1461f22034e1f70328a060db34474c60f Mon Sep 17 00:00:00 2001
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date: Thu, 5 Aug 2021 11:18:20 +0100
> Subject: libtool: Fix lto option passing?
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/libtool/libtool-2.4.6.inc        |  1 +
>  meta/recipes-devtools/libtool/libtool/lto-prefix.patch | 16 ++++++++++=
++++++
>  2 files changed, 17 insertions(+)
>  create mode 100644 meta/recipes-devtools/libtool/libtool/lto-prefix.pa=
tch
>
> diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/rec=
ipes-devtools/libtool/libtool-2.4.6.inc
> index c1cbceb51f..6748d7468e 100644
> --- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> +++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
> @@ -23,6 +23,7 @@ SRC_URI =3D "${GNU_MIRROR}/libtool/libtool-${PV}.tar.=
gz \
>             file://0001-libtool-Check-for-static-libs-for-internal-comp=
iler-.patch \
>             file://0001-Makefile.am-make-sure-autoheader-run-before-aut=
oconf.patch \
>             file://0001-Makefile.am-make-sure-autoheader-run-before-aut=
omake.patch \
> +           file://lto-prefix.patch \
>            "
> =20
>  SRC_URI[md5sum] =3D "addf44b646ddb4e3919805aa88fa7c5e"
> diff --git a/meta/recipes-devtools/libtool/libtool/lto-prefix.patch b/m=
eta/recipes-
> devtools/libtool/libtool/lto-prefix.patch
> new file mode 100644
> index 0000000000..f788b3fc27
> --- /dev/null
> +++ b/meta/recipes-devtools/libtool/libtool/lto-prefix.patch
> @@ -0,0 +1,16 @@
> +Index: libtool-2.4.6/build-aux/ltmain.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libtool-2.4.6.orig/build-aux/ltmain.in
> ++++ libtool-2.4.6/build-aux/ltmain.in
> +@@ -5424,9 +5424,10 @@ func_mode_link ()
> +       # --sysroot=3D*          for sysroot support
> +       # -O*, -g*, -flto*, -fwhopr*, -fuse-linker-plugin GCC link-time=
 optimization
> +       # -stdlib=3D*            select c++ std lib with clang
> ++      # -f*-prefix-map*      needed for lto linking
> +       -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=3D*|-xtarget=3D*|+DA*|+DD*|=
-q*|-m*| \
> +       -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=3D*|=
--sysroot=3D*| \
> +-      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|=
-stdlib=3D*)
> ++      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|=
-stdlib=3D*|-f*-prefix-map*)
> +         func_quote_for_eval "$arg"
> + 	arg=3D$func_quote_for_eval_result
> +         func_append compile_command " $arg"
>
>
>

