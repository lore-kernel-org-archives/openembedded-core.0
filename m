Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398A6C433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 08:38:22 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.4266.1658824693795812876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 01:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gF1zr/La;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id a11so8269277wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=UUa1WGXz4NiHKK5HxQnRHzWMTv97Dq46OEtB9IJlP9c=;
        b=gF1zr/LaQsb6rWQjL5x0kpdwWyQiagHIgUWAVei1eixl5kmAJZNjvNPDlmexsw+EQM
         pPGSAhWXdf3VdG08IhauwFvqHw7bKKcHdIzjRCGCr/lsTKCj18oU3IlTnslPzThI7/iG
         Q7OUWY7bhbVfmVQDQC1nuuHi/5C1tfNIl3aFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=UUa1WGXz4NiHKK5HxQnRHzWMTv97Dq46OEtB9IJlP9c=;
        b=C5Bl3jLtaniDcgGby7wXMncDNScI88bRyT3ABKLYtS7GCrHGY/lJ/32DGUcAjyK3O7
         y38xOqzmKAsE6sG+WjoeVyO7pmFubo8E4P+XjOV19pzggQTxUa1CuLrSdB9WlWrD4AsM
         u+f6TWqBunVREHjcOGFvAdSUv22yP3UC7aAh5bLkMK8CXH2sevWUTv4qJ+CQFoQA8YC3
         0UbzHr/VJ200jA1qHnhTUESSkHoUY2MZeN0B/l0kmNYkXofYMhk7t57WAmBgrwx0t7FH
         ndmDsEpRXrO/OgvmLSWxOEUd3w9yZKhbrvUvrec6LhVEKR/BEScJXAiq25ELVk+UTtis
         6i/Q==
X-Gm-Message-State: AJIora/OkXuM/CaRi3OIqgSeDKEp5kUnrSujHxKcjs3Sbt24bKKL5+1Q
	i3SXlgJD300VHvpC35aDtAILyA==
X-Google-Smtp-Source: 
 AGRyM1uSzmN5KhMMglI/DFGLFKJ+mMIBNOohfB57iidip+cnP6CO0bcdsa/PJ6olGy8pZKZ5q5rppg==
X-Received: by 2002:a05:600c:4e52:b0:3a3:33b1:7b63 with SMTP id
 e18-20020a05600c4e5200b003a333b17b63mr17565979wmq.51.1658824692077;
        Tue, 26 Jul 2022 01:38:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:289a:8162:dbfe:813c?
 ([2001:8b0:aba:5f3c:289a:8162:dbfe:813c])
        by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c4fc500b003a03185231bsm19330999wmq.31.2022.07.26.01.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 01:38:11 -0700 (PDT)
Message-ID: 
 <9e9f4897ba4e1aef41f1fdae716b268e3ef31a79.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC] rust: Rework and improve so SDK and
 target versions work
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2022 09:38:10 +0100
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
 <openembedded-core@lists.openembedded.org>; Tue, 26 Jul 2022 08:38:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168498

On Tue, 2022-07-26 at 00:51 -0700, Sundeep KOKKONDA wrote:
> Hello Richard,
> =C2=A0
> I tried a few tests with new rust patches and found below issues.
> =C2=A0
> 1. I build the 'master-next' with 'bitbake core-image-minimal -
> cpopulate_sdk' for qemuarm64 machine. The build has no issues and sdk
> installed successfully but, rustc in the installed sdk is showing
> below error.
> =C2=A0
> > $ source arm64_toolchain/environment-setup-cortexa57-oe-linux
> > $ which rustc
> > /ala-lpggp31/skokkonda/master-
> > next/build/arm64_toolchain/sysroots/x86_64-oesdk-
> > linux/usr/bin/rustc
> > $ file /ala-lpggp31/skokkonda/master-
> > next/build/arm64_toolchain/sysroots/x86_64-oesdk-
> > linux/usr/bin/rustc
> > /ala-lpggp31/skokkonda/master-
> > next/build/arm64_toolchain/sysroots/x86_64-oesdk-
> > linux/usr/bin/rustc: ELF 64-bit LSB shared object, x86-64, version
> > 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-
> > 64.so.2, for GNU/Linux 3.2.0,
> > BuildID[sha1]=3Da9e96a057bcea4b5b3ad3e0b5ddc96f30231d6d6, not
> > stripped
> > $ rustc
> > rustc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not
> > found (required by /ala-lpggp31/skokkonda/master-
> > next/build/arm64_toolchain/sysroots/x86_64-oesdk-
> > linux/usr/bin/../lib/../lib/libstdc++.so.6)
> > rustc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not
> > found (required by /ala-lpggp31/skokkonda/master-
> > next/build/arm64_toolchain/sysroots/x86_64-oesdk-
> > linux/usr/bin/../lib/../lib/libstdc++.so.6)
> > rustc: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not
> > found (required by /ala-lpggp31/skokkonda/master-
> > next/build/arm64_toolchain/sysroots/x86_64-oesdk-
> > linux/usr/bin/../lib/../lib/libstdc++.so.6)
> =C2=A0
> 2. I tried to build the rust for x86_64 target but the below error is
> observed. (by adding IMAGE_INSTALL:append =3D " rust" in local.conf)
> =C2=A0
> > ERROR: Nothing RPROVIDES 'rust' (but /ala-lpggp31/skokkonda/master-
> > next/openembedded-core/meta/recipes-core/images/core-image-
> > minimal.bb RDEPENDS on or otherwise requires it)
> > rust was skipped: Rust recipe doesn't work for target builds at
> > this time. Fixes welcome.
> > NOTE: Runtime target 'rust' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['rust']
> > ERROR: Required build target 'core-image-minimal' has no buildable
> > providers.
> > Missing or unbuildable dependency chain was: ['core-image-minimal',
> > 'rust']
> > Summary: There were 2 ERROR messages, returning a non-zero exit
> > code.
> =C2=A0
> 3. Getting below error when MACHINE ?=3D "beaglebone-yocto" and added
> TOOLCHAIN_HOST_TASK:append =3D " packagegroup-rust-cross-canadian-
> ${MACHINE}"
> =C2=A0
> > ERROR: rust-native-1.62.0-r0 do_rust_gen_targets: Error executing a
> > python function in exec_func_python() autogenerated:
> > =C2=A0
> > The stack trace of python calls that resulted in this
> > exception/failure was:
> > File: 'exec_func_python() autogenerated', lineno: 2, function:
> > <module>
> > =C2=A0 =C2=A0 =C2=A00001:
> > =C2=A0*** 0002:do_rust_gen_targets(d)
> > =C2=A0 =C2=A0 =C2=A00003:
> > File: '/ala-lpggp31/skokkonda/yocto/poky/meta/classes/rust-target-
> > config.bbclass', lineno: 369, function: do_rust_gen_targets
> > =C2=A0 =C2=A0 =C2=A00365:=C2=A0 =C2=A0 rust_gen_target(d, 'BUILD', wd,
> > d.getVar('BUILD_ARCH'))
> > =C2=A0 =C2=A0 =C2=A00366:=C2=A0 =C2=A0 if "HOST" in d.getVar("RUST_TARG=
ETGENS"):
> > =C2=A0 =C2=A0 =C2=A00367:=C2=A0 =C2=A0 =C2=A0 =C2=A0 rust_gen_target(d,=
 'HOST', wd,
> > d.getVar('HOST_ARCH'))
> > =C2=A0 =C2=A0 =C2=A00368:=C2=A0 =C2=A0 if "TARGET" in d.getVar("RUST_TA=
RGETGENS"):
> > =C2=A0*** 0369:=C2=A0 =C2=A0 =C2=A0 =C2=A0 rust_gen_target(d, 'TARGET',=
 wd,
> > d.getVar('TARGET_ARCH'))
> > =C2=A0 =C2=A0 =C2=A00370:}
> > =C2=A0 =C2=A0 =C2=A00371:
> > =C2=A0 =C2=A0 =C2=A00372:addtask rust_gen_targets after do_patch before=
 do_compile
> > =C2=A0 =C2=A0 =C2=A00373:do_rust_gen_targets[dirs] +=3D "${RUST_TARGETS=
_DIR}"
> > File: '/ala-lpggp31/skokkonda/yocto/poky/meta/classes/rust-target-
> > config.bbclass', lineno: 319, function: rust_gen_target
> > =C2=A0 =C2=A0 =C2=A00315:=C2=A0 =C2=A0 # build tspec
> > =C2=A0 =C2=A0 =C2=A00316:=C2=A0 =C2=A0 tspec =3D {}
> > =C2=A0 =C2=A0 =C2=A00317:=C2=A0 =C2=A0 tspec['llvm-target'] =3D rustsys
> > =C2=A0 =C2=A0 =C2=A00318:=C2=A0 =C2=A0 tspec['data-layout'] =3D d.getVa=
rFlag('DATA_LAYOUT',
> > arch_abi)
> > =C2=A0*** 0319:=C2=A0 =C2=A0 tspec['max-atomic-width'] =3D
> > int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
> > =C2=A0 =C2=A0 =C2=A00320:=C2=A0 =C2=A0 tspec['target-pointer-width'] =
=3D
> > d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
> > =C2=A0 =C2=A0 =C2=A00321:=C2=A0 =C2=A0 tspec['target-c-int-width'] =3D
> > d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
> > =C2=A0 =C2=A0 =C2=A00322:=C2=A0 =C2=A0 tspec['target-endian'] =3D
> > d.getVarFlag('TARGET_ENDIAN', arch_abi)
> > =C2=A0 =C2=A0 =C2=A00323:=C2=A0 =C2=A0 tspec['arch'] =3D arch_to_rust_t=
arget_arch(rust_arch)
> > Exception: TypeError: int() argument must be a string, a bytes-like
> > object or a number, not 'NoneType'
> > =C2=A0
> > ERROR: Logfile of failure stored in: /ala-
> > lpggp31/skokkonda/yocto/build-bb/tmp/work/x86_64-linux/rust-
> > native/1.62.0-r0/temp/log.do_rust_gen_targets.45760
> > ERROR: Task (virtual:native:/ala-
> > lpggp31/skokkonda/yocto/poky/meta/recipes-
> > devtools/rust/rust_1.62.0.bb:do_rust_gen_targets) failed with exit
> > code '1'
> > =C2=A0
>=20
> I'll keep you posted if I've any further updates.

I've also found afew issues with the patch on the autobuilder in
testing. I've updated master-next for poky and oe-core with a new
version of the patch which should fix some of the issues above.

I also improved how to add rust to the SDK, you can now set

TOOLCHAIN_LANGS +=3D 'rust'

with the patches in -next which is a bit simpler.

Thanks for testing!

Cheers,

Richard

