Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684E0C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 09:08:11 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.6783.1653037680915981238
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 02:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KrR+aHau;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id p4so11844544lfg.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 02:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EZZjSsKw80ci15q1ga9at3xzIaO8P/gIvkknOInVb3k=;
        b=KrR+aHauW65qwV0O8DN42Fr9tKwDfPCRLwUZREMctuw4pIarRUn4yV5dfq4ztkSrAY
         gavQrTWFTKvb8lyq1hsTf6jHfx7khtjerkD2xurg7YcaurjI44EO2ZZNEuEuidHdKLcb
         RQdUguEDFPFpRc9BTzwJfHlTPJh3/lmQlXquYhfvAqjDRukLOFgrFOR+etU3BGqAxn73
         XfvTIcQzB8bCWVerpCimpZuQi0diV2gBomiMnYtMq64glfTSl6DOQ5iXvEKJD0/zHc0s
         q0lQSphuCdnZ8ErXv76y3WC1uRdoY9R/VUj8dQV97P4mGZ37uuN7QhqSyXlv7LBirvzz
         3o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EZZjSsKw80ci15q1ga9at3xzIaO8P/gIvkknOInVb3k=;
        b=Nidz9Fr7BcC1ygmiM7IDKXb34AARHQCZYhhIkp7QTlqO/ndBSffEbF1LIiZPShoqno
         f5vClPZ/Q7mTEEvv6kJeP6QKnVQPHOzs2ak2NanhTN74OGFqdu/H2F4OunjV7siHTy/R
         rtGLYcSdlXwXyvUWjl5gkhMfxnJ/7uAo1+t0R9LgS+9evDKLZcndsAKq+6E66WghaHu7
         j5m2U1Jat9D18/0P175q3lZYwLWOyE33vlaVjHVrG3EMAnpEhBpsCaF7nwswrBtnw/Cw
         yXNX96akmarDVj8YakyUzQ5bLwf6+twZUa5sPecC+UX24wasF/tyF1U6p8+Z1e2qP9PW
         SeSQ==
X-Gm-Message-State: AOAM531LKtzxrYS1C/CQxpfFCCTC8eKDNZBJLzus/YZ/XVFfTrBlCWld
	KGSj/kudPa2OzW5idyMNbHN3BC7FkKz3pPdLRS0=
X-Google-Smtp-Source: 
 ABdhPJzkNa9IG9R94IBeqpaxXbx0fn+ZjgEoEvTeLRLUfQ46xceo52VHKUmny0UMNNH0UAkqXmLFBlPd66MJrwF7bmI=
X-Received: by 2002:a05:6512:20c9:b0:477:cc4f:b816 with SMTP id
 u9-20020a05651220c900b00477cc4fb816mr3828300lfr.521.1653037678991; Fri, 20
 May 2022 02:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220513055923.170822-1-sundeep.kokkonda@gmail.com>
 <8c7e147c519b05f1983605f5c9ce522fcd12a2a4.camel@linuxfoundation.org>
 <3d452ba4-529a-26d4-443c-dbfcb84d85b2@gmail.com>
In-Reply-To: <3d452ba4-529a-26d4-443c-dbfcb84d85b2@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 May 2022 11:07:47 +0200
Message-ID: 
 <CANNYZj9JYNxPRHSDDtpom0fYc-3+ohSSBREBDQfATh2JKZYQJA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V4] meta: rust - Bug fix for target definitions
 returning 'NoneType' for arm
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Randy MacLeod <rwmacleod@gmail.com>,
 umesh kalappa0 <umesh.kalappa0@gmail.com>,
	pgowda <pgowda.cve@gmail.com>, shivams@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 09:08:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165922

Hello Sundeep,

this looks like something that requires a bit of time to set up,
reproduce and understand, and unfortunately I do not have the time
this week or the next. If you need my assistance you have to wait.

Alex

On Thu, 19 May 2022 at 13:12, Sundeep KOKKONDA
<sundeep.kokkonda@gmail.com> wrote:
>
> Hello,
> On 14-05-2022 12:46, richard.purdie@linuxfoundation.org wrote:
>
> On Thu, 2022-05-12 at 22:59 -0700, Sundeep KOKKONDA wrote:
>
> [Yocto bug #14742]
> The build shows below error while building for arm machines.
> Exception: TypeError: int() argument must be a string, a bytes-like objec=
t or a number, not 'NoneType'
> Detailed error info :
>
> Steps to reproduce:
> 1. Set MACHINE ?=3D "qemuarm" in local.conf & add 'TOOLCHAIN_HOST_TASK:ap=
pend =3D " packagegroup-rust-cross-canadian-${MACHINE}"'
> 2. bitbake core-image-minimal -cpopulate_sdk
>
> Complete Error:
> ERROR: rust-cross-canadian-arm-1.59.0-r0 do_rust_gen_targets: Error execu=
ting a python function in exec_func_python() autogenerated:
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:do_rust_gen_targets(d)
>      0003:
> File: '/ala-lpggp31/skokkonda/yocto/poky/meta/recipes-devtools/rust/rust-=
cross-canadian-common.inc', lineno: 31, function: do_rust_gen_targets
>      0027:
>      0028:LLVM_TARGET[x86_64] =3D "${RUST_HOST_SYS}"
>      0029:python do_rust_gen_targets () {
>      0030:    wd =3D d.getVar('WORKDIR') + '/targets/'
>  *** 0031:    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEAT=
URES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
>      0032:    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOS=
T_ARCH'))
>      0033:    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BU=
ILD_ARCH'))
>      0034:}
>      0035:
> File: '/ala-lpggp31/skokkonda/yocto/poky/meta/recipes-devtools/rust/rust-=
common.inc', lineno: 330, function: rust_gen_target
>      0326:    # build tspec
>      0327:    tspec =3D {}
>      0328:    tspec['llvm-target'] =3D d.getVarFlag('LLVM_TARGET', arch_a=
bi)
>      0329:    tspec['data-layout'] =3D d.getVarFlag('DATA_LAYOUT', arch_a=
bi)
>  *** 0330:    tspec['max-atomic-width'] =3D int(d.getVarFlag('MAX_ATOMIC_=
WIDTH', arch_abi))
>      0331:    tspec['target-pointer-width'] =3D d.getVarFlag('TARGET_POIN=
TER_WIDTH', arch_abi)
>      0332:    tspec['target-c-int-width'] =3D d.getVarFlag('TARGET_C_INT_=
WIDTH', arch_abi)
>      0333:    tspec['target-endian'] =3D d.getVarFlag('TARGET_ENDIAN', ar=
ch_abi)
>      0334:    tspec['arch'] =3D arch_to_rust_target_arch(rust_arch)
> Exception: TypeError: int() argument must be a string, a bytes-like objec=
t or a number, not 'NoneType'
>
> Below are the local variables from rust_gen_target function for arm and a=
arch64 targets. Refer below, the tspec varibles for 'arm' generated with No=
neType.
> (a) Locals at rust_gen_target for arm::
> tspec['data-layout'] =3D  None, Type of tspec['data-layout'] =3D  <class =
'NoneType'>
> tspec['data-layout'] =3D  None, Type of tspec['data-layout'] =3D  <class =
'NoneType'>
> DEBUG: Python function do_rust_gen_targets finished
> (b) Locals at rust_gen_target  for aarch64::
> tspec['data-layout'] =3D  aarch64-unknown-linux-gnu, Type of tspec['data-=
layout'] =3D  <class 'str'>
> tspec['max-atomic-width'] =3D  128, Type of tspec['max-atomic-width'] =3D=
  <class 'int'>
>
> Reason for changing arm-eabi to arm: The earlier changes introduced this =
bug, so reverting the change 'arm-eabi' to 'arm' fixed the issue.
>
> The 'rust_gen_targets' Task added with its dependent variable list.
>
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-common.inc | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-de=
vtools/rust/rust-common.inc
> index 310aecef22..984fe9099e 100644
> --- a/meta/recipes-devtools/rust/rust-common.inc
> +++ b/meta/recipes-devtools/rust/rust-common.inc
> @@ -119,13 +119,13 @@ def llvm_features(d):
>
>
>  ## arm-unknown-linux-gnueabihf
> -DATA_LAYOUT[arm-eabi] =3D "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S=
64"
> -LLVM_TARGET[arm-eabi] =3D "${RUST_TARGET_SYS}"
> -TARGET_ENDIAN[arm-eabi] =3D "little"
> -TARGET_POINTER_WIDTH[arm-eabi] =3D "32"
> -TARGET_C_INT_WIDTH[arm-eabi] =3D "32"
> -MAX_ATOMIC_WIDTH[arm-eabi] =3D "64"
> -FEATURES[arm-eabi] =3D "+v6,+vfp2"
> +DATA_LAYOUT[arm] =3D "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> +LLVM_TARGET[arm] =3D "${RUST_TARGET_SYS}"
> +TARGET_ENDIAN[arm] =3D "little"
> +TARGET_POINTER_WIDTH[arm] =3D "32"
> +TARGET_C_INT_WIDTH[arm] =3D "32"
> +MAX_ATOMIC_WIDTH[arm] =3D "64"
> +FEATURES[arm] =3D "+v6,+vfp2"
>
>  ## armv7-unknown-linux-gnueabihf
>  DATA_LAYOUT[armv7-eabi] =3D "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32=
-S64"
> @@ -360,6 +360,8 @@ def rust_gen_target(d, thing, wd, features, cpu, arch=
, abi=3D""):
>      with open(wd + sys + '.json', 'w') as f:
>          json.dump(tspec, f, indent=3D4)
>
> +do_rust_gen_targets[vardeps] +=3D "DATA_LAYOUT LLVM_TARGET TARGET_ENDIAN=
 TARGET_POINTER_WIDTH TARGET_C_INT_WIDTH MAX_ATOMIC_WIDTH FEATURES"
> +
>  python do_rust_gen_targets () {
>      wd =3D d.getVar('WORKDIR') + '/targets/'
>      build_arch =3D d.getVar('BUILD_ARCH')
>
> We need to split this into two. One patch to fix the determinism issue,
> the other to fix the arm bug.
>
> The "good" news is that this patch now fails consistently on the
> autobuilder, for example:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3522
>
> sstatetests.SStateTests.test_sstate_allarch_samesigs is failing which
> you can rerun with:
>
> oe-selftest -r sstatetests.SStateTests.test_sstate_allarch_samesigs
>
> Now it fails reliably, we need to work out why the arm change breaks
> that.
>
> If you split the patches into two we can likely merge the
> reproducibility one, then onwards with the arm issue.
>
> In case it isn't clear, the failing signatures are for adwaita-icon-
> theme which depends on librsvg-native which depends on rust-native.
> What this means is that the signature of rust-native is changing when
> MACHINE is changed in that test. This shouldn't happen. We already knew
> that from our other discussion but now we can prove it. It would be
> nice if a test showed us the native hash was changing and that is the
> other issue we discussed but one step at a time!
>
> To be clear, rust-native (and it's signature) should be independent of
> MACHINE so we need to fix that. This means that currently rust-native
> varies and rebuilds when you change MACHINE (after the dependency fix
> in this patch).
>
> Hello Richard,
>
> I analyzed the test failure and it is because of the newly added dependen=
cy on variable LLVM_TARGET. In think the patch split will not help here. We=
 need to understand the reason for the introduced change in first place fro=
m 'arm' to 'arm-eabi' & why the rust_gen_target is not added dependency on =
these variables.
>
> Hello Alex,
>
> We need a few inputs from you regarding a 'arm' bug which is in discussio=
n in this patch.
>
> The changes in file meta/recipes-devtools/rust/rust-common.inc with commi=
t ID 'd6b563710e6cc0857843433d85023d47f9f2037d' are causing the build error=
 with 'arm' architecture (the  tspec variables returning 'NoneType') when  =
'TOOLCHAIN_HOST_TASK:append =3D " packagegroup-rust-cross-canadian-${MACHIN=
E}" added in local.conf (See the detailed build error at beginning of this =
email).
>
> And to fix that error the changes for 'arm' architecture are reverted (#a=
rm-unknown-linux-gnueabihf variables reverted to 'arm' from 'arm-eabi') and=
 the build error is solved. But, because no Task is depending on these vari=
ables, bitbake is unable to detect these changes while rebuilding (In other=
 words, the Sstate-cache sigdata is not changed). So, the rust_gen_target t=
ask dependency to these variables are added and then the Sstate sigdata is =
updated with rebuild. However, the dependency (on variable LLVM_TARGET) is =
causing the failure in oe-selftest test_sstate_allarch_samesigs testcase.
>
> Can you let us know is it the right thing to add these variable dependenc=
ies for rust_gen_target task? And, to fix the 'arm NoneType' error is it th=
e correct fix to revert the 'arm-eabi' to 'arm'?
>
> Let me know if anything is not clear.
>
> Below is the dependency list taken from bitbake-diffsigs from the test_ss=
tate_allarch_samesigs test sigdata for x86_64 & qemuarm machines. The chang=
e in sigdata caused by differed values for variable TUNE_FEATURES{callconve=
ntion-hard}.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ...
> List of dependencies for variable LLVM_TARGET[aarch64] is ['RUST_TARGET_S=
YS']
> List of dependencies for variable LLVM_TARGET[arm] is ['RUST_TARGET_SYS']
> ...
> List of dependencies for variable RUST_TARGET_SYS is ['rust_base_triple']
> ...
> List of dependencies for variable rust_base_triple is ['determine_libc', =
'target_is_armv7']
> ...
> List of dependencies for variable determine_libc is ['BUILD_SYS', 'HOST_S=
YS', 'RUST_LIBC', 'RUST_LIBC:class-native']    # The determine_libc is usin=
g the TUNE_FEATURES
> List of dependencies for variable target_is_armv7 is []
> ...
> TUNE_FEATURES{callconvention-hard} =3D Unset    #in x86_64
> TUNE_FEATURES{callconvention-hard} =3D Set    #in qemuarm
> ...
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> Thanks,
> Sundeep K.
>
>
>
> Cheers,
>
> Richard
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165881): https://lists.openembedded.org/g/openembedde=
d-core/message/165881
> Mute This Topic: https://lists.openembedded.org/mt/91074788/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

