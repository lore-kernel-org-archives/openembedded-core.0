Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F98C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 09:00:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.4483.1658826045275197097
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 02:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VFSn+Fyz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id h9so19256107wrm.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=T8NmVnQyAAhEK1pkpuFDWg6XpgRvxcTZxhduGn/Vd1Q=;
        b=VFSn+FyzWSWNkaog6cxORy6PxNiLbJCAygPZmR10/VTDQ8LaHj1RjCz1LESiJWewjV
         icDdPL4m5UvHkqEdX0POhFtwSk9E0hQWDcOznOPMB8sTxbwHZrpTmiOFBCNVxhAR5REq
         d8vHGTYDjLe7DjOMWayqmVAl7ticmY8cWrSQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=T8NmVnQyAAhEK1pkpuFDWg6XpgRvxcTZxhduGn/Vd1Q=;
        b=MCVTY2c8vkuD8Cyl3c98O1kWYjkBdsVxGZ9bErdu9TLeli7KDHNTXGwmvOFzXJsoj8
         Dp/PPWpQXE5jlWgPjDPbQDFVArZbPa3jXSH8Z3sqaZnbsOzSJ2VsPiuPtaxGlWtCm12c
         gr9Vbo2TLvXpt+kT+Yyd9BlfC+AvPeF2PBYqBKsKI+bTkt/VxQsVFyU5EdXUnfWvZ3KC
         eTAPKJa04NSiT6PGuxL+irw3AVzXGj8f/kFiz4fNroZvtHz5rHc816W9dFu5lzjBncx8
         DTeC6kJrjlGpfNj6OvmT1j1I1FHqusHVzXxiQ2T0LPl8KX8RlRPwdbRy6jmolsef9sRP
         Auxg==
X-Gm-Message-State: AJIora+3MQChLKE54YjBtqW4/icJr9bh1P/2KHtiZS1t8J+ukGileD4b
	ZXDeRbrHa81wKtoo/FXz2Z4fBw==
X-Google-Smtp-Source: 
 AGRyM1uk1WlWvkF3NaDAYhIegzHoBiJPY88itcSS9jWUZ201Q3Adc5Qfsve9byyUk7OvrKwFZX33tQ==
X-Received: by 2002:adf:f90f:0:b0:21e:7e3d:6af6 with SMTP id
 b15-20020adff90f000000b0021e7e3d6af6mr8081158wrr.183.1658826043404;
        Tue, 26 Jul 2022 02:00:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:289a:8162:dbfe:813c?
 ([2001:8b0:aba:5f3c:289a:8162:dbfe:813c])
        by smtp.gmail.com with ESMTPSA id
 l35-20020a05600c1d2300b003a2fc754313sm18829614wms.10.2022.07.26.02.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 02:00:42 -0700 (PDT)
Message-ID: 
 <5024fd0989f7ca4e473ebd2404a380d825c2243f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC] rust: Rework and improve so SDK and
 target versions work
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2022 10:00:42 +0100
In-Reply-To: <3204.1658821874985939411@lists.openembedded.org>
References: <20220724164252.1976353-1-richard.purdie@linuxfoundation.org>
	 <3204.1658821874985939411@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 09:00:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168500

On Tue, 2022-07-26 at 00:51 -0700, Sundeep KOKKONDA wrote:
> I tried a few tests with new rust patches and found below issues.
> =C2=A0
> 1. I build the 'master-next' with 'bitbake core-image-minimal -cpopulate_=
sdk' for qemuarm64 machine. The build has no issues and sdk installed succe=
ssfully but, rustc in the installed sdk is showing below error.
> =C2=A0
> > $ source arm64_toolchain/environment-setup-cortexa57-oe-linux
> > $ which rustc
> > /ala-lpggp31/skokkonda/master-next/build/arm64_toolchain/sysroots/x86_6=
4-oesdk-linux/usr/bin/rustc
> > $ file /ala-lpggp31/skokkonda/master-next/build/arm64_toolchain/sysroot=
s/x86_64-oesdk-linux/usr/bin/rustc
> > /ala-lpggp31/skokkonda/master-next/build/arm64_toolchain/sysroots/x86_6=
4-oesdk-linux/usr/bin/rustc: ELF 64-bit LSB shared object, x86-64, version =
1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for =
GNU/Linux 3.2.0, BuildID[sha1]=3Da9e96a057bcea4b5b3ad3e0b5ddc96f30231d6d6, =
not stripped
> > $ rustc
> > rustc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found =
(required by /ala-lpggp31/skokkonda/master-next/build/arm64_toolchain/sysro=
ots/x86_64-oesdk-linux/usr/bin/../lib/../lib/libstdc++.so.6)
> > rustc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found =
(required by /ala-lpggp31/skokkonda/master-next/build/arm64_toolchain/sysro=
ots/x86_64-oesdk-linux/usr/bin/../lib/../lib/libstdc++.so.6)
> > rustc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found =
(required by /ala-lpggp31/skokkonda/master-next/build/arm64_toolchain/sysro=
ots/x86_64-oesdk-linux/usr/bin/../lib/../lib/libstdc++.so.6)
>=20
>=20

Just to be clear, if this worked previously the above is probably a
regression and I'm not sure that would be fixed in my series in master-
next.
=C2=A0
> 2. I tried to build the rust for x86_64 target but the below error is obs=
erved. (by adding IMAGE_INSTALL:append =3D " rust" in local.conf)
> =C2=A0
> > ERROR: Nothing RPROVIDES 'rust' (but /ala-lpggp31/skokkonda/master-next=
/openembedded-core/meta/recipes-core/images/core-image-minimal.bb RDEPENDS =
on or otherwise requires it)
> > rust was skipped: Rust recipe doesn't work for target builds at this ti=
me. Fixes welcome.
> > NOTE: Runtime target 'rust' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['rust']
> > ERROR: Required build target 'core-image-minimal' has n=20
>=20
> I'll keep you posted if I've any further updates.
>=20
> --
> Thanks,
> Sundeep K.
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168497):
https://lists.openembedded.org/g/openembedded-core/message/168497
> Mute This Topic: https://lists.openembedded.org/mt/92587651/1686473
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
[richard.purdie@linuxfoundation.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

> > o buildable providers.
> > Missing or unbuildable dependency chain was: ['core-image-minimal', 'ru=
st']
> > Summary: There were 2 ERROR messages, returning a non-zero exit code.


That code is removed in current master-next so that one should be
resolved.

> 3. Getting below error when MACHINE ?=3D "beaglebone-yocto" and added TOO=
LCHAIN_HOST_TASK:append =3D " packagegroup-rust-cross-canadian-${MACHINE}"
> =C2=A0
> > ERROR: rust-native-1.62.0-r0 do_rust_gen_targets: Error executing a pyt=
hon function in exec_func_python() autogenerated:
> > =C2=A0
> > The stack trace of python calls that resulted in this exception/failure=
 was:
> > File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> > =C2=A0 =C2=A0 =C2=A00001:
> > =C2=A0*** 0002:do_rust_gen_targets(d)
> > =C2=A0 =C2=A0 =C2=A00003:
> > File: '/ala-lpggp31/skokkonda/yocto/poky/meta/classes/rust-target-confi=
g.bbclass', lineno: 369, function: do_rust_gen_targets
> > =C2=A0 =C2=A0 =C2=A00365:=C2=A0 =C2=A0 rust_gen_target(d, 'BUILD', wd, =
d.getVar('BUILD_ARCH'))
> > =C2=A0 =C2=A0 =C2=A00366:=C2=A0 =C2=A0 if "HOST" in d.getVar("RUST_TARG=
ETGENS"):
> > =C2=A0 =C2=A0 =C2=A00367:=C2=A0 =C2=A0 =C2=A0 =C2=A0 rust_gen_target(d,=
 'HOST', wd, d.getVar('HOST_ARCH'))
> > =C2=A0 =C2=A0 =C2=A00368:=C2=A0 =C2=A0 if "TARGET" in d.getVar("RUST_TA=
RGETGENS"):
> > =C2=A0*** 0369:=C2=A0 =C2=A0 =C2=A0 =C2=A0 rust_gen_target(d, 'TARGET',=
 wd, d.getVar('TARGET_ARCH'))
> > =C2=A0 =C2=A0 =C2=A00370:}
> > =C2=A0 =C2=A0 =C2=A00371:
> > =C2=A0 =C2=A0 =C2=A00372:addtask rust_gen_targets after do_patch before=
 do_compile
> > =C2=A0 =C2=A0 =C2=A00373:do_rust_gen_targets[dirs] +=3D "${RUST_TARGETS=
_DIR}"
> > File: '/ala-lpggp31/skokkonda/yocto/poky/meta/classes/rust-target-confi=
g.bbclass', lineno: 319, function: rust_gen_target
> > =C2=A0 =C2=A0 =C2=A00315:=C2=A0 =C2=A0 # build tspec
> > =C2=A0 =C2=A0 =C2=A00316:=C2=A0 =C2=A0 tspec =3D {}
> > =C2=A0 =C2=A0 =C2=A00317:=C2=A0 =C2=A0 tspec['llvm-target'] =3D rustsys
> > =C2=A0 =C2=A0 =C2=A00318:=C2=A0 =C2=A0 tspec['data-layout'] =3D d.getVa=
rFlag('DATA_LAYOUT', arch_abi)
> > =C2=A0*** 0319:=C2=A0 =C2=A0 tspec['max-atomic-width'] =3D int(d.getVar=
Flag('MAX_ATOMIC_WIDTH', arch_abi))
> > =C2=A0 =C2=A0 =C2=A00320:=C2=A0 =C2=A0 tspec['target-pointer-width'] =
=3D d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
> > =C2=A0 =C2=A0 =C2=A00321:=C2=A0 =C2=A0 tspec['target-c-int-width'] =3D =
d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
> > =C2=A0 =C2=A0 =C2=A00322:=C2=A0 =C2=A0 tspec['target-endian'] =3D d.get=
VarFlag('TARGET_ENDIAN', arch_abi)
> > =C2=A0 =C2=A0 =C2=A00323:=C2=A0 =C2=A0 tspec['arch'] =3D arch_to_rust_t=
arget_arch(rust_arch)
> > Exception: TypeError: int() argument must be a string, a bytes-like obj=
ect or a number, not 'NoneType'
> > =C2=A0
> > ERROR: Logfile of failure stored in: /ala-lpggp31/skokkonda/yocto/build=
-bb/tmp/work/x86_64-linux/rust-native/1.62.0-r0/temp/log.do_rust_gen_target=
s.45760
> > ERROR: Task (virtual:native:/ala-lpggp31/skokkonda/yocto/poky/meta/reci=
pes-devtools/rust/rust_1.62.0.bb:do_rust_gen_targets) failed with exit code=
 '1'

This one was definitely fixed this morning with the native.bbclass tweak.

Cheers,

Richard


