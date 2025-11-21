Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDE1CFA774
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 10:51:05 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8735.1763722263704267979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 02:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OWo7l9Z+;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso12641095e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 02:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763722262; x=1764327062; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cL6/yqmUgVPMV6CY5TCeYU2lGssFA0rQ1Nt9Mqts844=;
        b=OWo7l9Z+RHC+G5iPDqy+qgeTkJJB7cANW0WesXou1A376yaLr/m5FK7NBFPwiQL/tE
         TADTvlFFqcR5i+Fu5sU2UYO5D861N2D1rK5ipfLvcJkphJfxfQsb09w0vlgNL6N2Zo1T
         4NdW+UL3lKpcoLw5fMZNzkUnZy3tz8HMw8+ZZvdO8V552qti/pz7ORPxZyI87hCcGnj9
         vaXGpg5zZSgOAQFK2Fh7k+32T09dICsBmsg/42PVYNOB1D4cdQanLwEH60iLtxlFg4Xm
         IATpUwGQTQ8vSBguEDi15fe1j7SZhNkb7+Js89TMBCPGPYU7F4nFQRb4gxNAUfYb8jww
         ly+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722262; x=1764327062;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cL6/yqmUgVPMV6CY5TCeYU2lGssFA0rQ1Nt9Mqts844=;
        b=E5Cwohdt3HslHFIFXMSh5X0iDuvN28KKUItAaN6C24IHLlg6TjTWvCB+23IAvd2fOX
         36ajk1d9y6A9Wkgnrd4m/a0t+0STSMT2fnt1tEipMLMugJ4QL1YjMavqyzhjLMiB4hRn
         wq/Mg/5RllkRNOCoFUywbsR7rkF7Ujwr+zJq4ab8L9OnOd4wyH0UzmsptPaabH9P7wtu
         6JbxMAjTpSNc0vfja6LWzHuXGjYFW0XVWZvzlwk8J4VvgEhpMgQFZQ42Ir7rRn3j1oDn
         /2jXGOq7pEajVgSJuGrJoMvkuAAkA2jfYwa9OtNogHyqYXEbXI5IwCp5Lz2/vQ0kMhTA
         WWYw==
X-Forwarded-Encrypted: i=1; AJvYcCVzCpaqQHc66E7GHY+/lekt4T7k/KzP78xd0ykIfS7/JaGZcw6PBD0T9wbaxLP2rnC0oeOX8tzEYeK5hyExOEhZIw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx/ov86Tqk1zvXzbk7mWvOJn7ufyZ+9Dr8hLSDB26tTcWpZjImJ
	wL6h0fXoJLNoaMXfFrdXLFkONFPE1DwEHeBcQGKn33qWGyjwNXrhgzAO
X-Gm-Gg: ASbGnct4RjIzodKx0eGn6uD4cPHD3qvooLMyQAxvj4aQJAKUwBShx04BN/5IVpyA5Qo
	Xz+/kvS3KT0kRkXVCLm7OnxA3vuJWPWbPhsGNjsjUCJfIRQ7zlTwfxSLjuUZEdGKklflEhfpG09
	fvNo6drZCAn08LKvxR400318i7QHJkgtbVBZMfvmrsCsCKWR22RmBitiL8cJ8TlbZ92mqZgaAg5
	8Lt/6nsl9Mk5L7+g+Vl3UjVTRES8P3dXN+rc0b7APy+v8P18WiXdy4Lq5YkQPcSUv1YcztUKWby
	rD7fyRw/6p3lM1AOQ4KrnuX16i4iFkWlE/apvL0YKAGSmxO0e+xmdeZphKpM5A5aUSCTmn/dVK4
	InjH5u4lfMoyy0Unt4sY/GCc7gFxb/EgwXZ3z+EaDHxSzdu2OOQS88ifO27dGX2e39p6Ype1g3f
	twB57BNdexX/0zv4CiKMg=
X-Google-Smtp-Source: AGHT+IGFz3VwUT/i3ER3I/h5iyh6lWJbbTq+ZFsa6qtz/LgHCqEEB9o2JGTErNtEhgb7ppelfmFZQQ==
X-Received: by 2002:a05:600c:4509:b0:46e:206a:78cc with SMTP id 5b1f17b1804b1-477c01c14f9mr17053545e9.28.1763722261840;
        Fri, 21 Nov 2025 02:51:01 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a973390csm82549425e9.4.2025.11.21.02.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 02:51:01 -0800 (PST)
Message-ID: <8b45a24f-e24c-48d7-9674-65936d3bcc39@gmail.com>
Date: Fri, 21 Nov 2025 11:51:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] rust-common.bbclass: filter out incorrect
 compiler flags in wrapper
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20251120121947.3473848-1-skandigraun@gmail.com>
 <20251120121947.3473848-3-skandigraun@gmail.com>
 <DEE9DLQRPI5N.368W9VM5LPRIA@bootlin.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <DEE9DLQRPI5N.368W9VM5LPRIA@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 10:51:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226665

On 11/21/25 10:17, Mathieu Dubois-Briand wrote:
> On Thu Nov 20, 2025 at 1:19 PM CET, Gyorgy Sarvari via lists.openembedd=
ed.org wrote:
>> This patch is a workaround for https://bugzilla.yoctoproject.org/show_=
bug.cgi?id=3D15976
>>
>> cc-rs crate is used by a number of projects, including rust's bootstra=
p also
>> to invoke the systems c/c++ compiler.
>>
>> A few updates ago it has changed the way CFLAGS/CXXFLAGS are handled: =
it now
>> merges them with HOST_C*FLAGS and TARGET_C*FLAGS.
>>
>> This is a problem when a recipe is cross compiled, but it has a build =
dependency
>> which uses this crate to be built. In this case the C*FLAGS variable c=
ontains
>> target flags, while the HOST_C*FLAGS contains host-specific flags, and=
 when the
>> two are mixed, the output is not what one expects.
>>
>> This change tries to filter out the incorrect flags:
>> - If the wrapper is invoked as a c or c++ compiler wrapper,
>> - then determines if it compiles for host or for target
>> - Depending on the on above, it considers the TARGET_*FLAGS or HOST*FL=
AGS
>>   correct, and the C*FLAGS variable content incorrect.
>> - It subtracts the correct set from the incorrect set, and drops the
>>   remainder from the compiler flags. (Which might be often an empty li=
st, so
>>   the flags are frequently unchanged)
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
> Hi Gyorgy,
>
> Thanks for your patch.
>
> I suspect one of the commit of this series is responsible of this rust
> test failure:
>
> 2025-11-20 21:59:48,098 - oe-selftest - INFO - FAIL: rust.RustSelfTestS=
ystemEmulated.test_rust (subunit.RemotedTestCase)
> ...
>   File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openembe=
dded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_=
f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openembe=
dded-core/meta/lib/oeqa/selftest/cases/rust.py", line 131, in test_rust
>     retval =3D runCmd(cmd)
>   File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openembe=
dded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
>     raise AssertionError("Command '%s' returned non-zero exit status %d=
:\n%s" % (command, result.status, exc_output))
> AssertionError: Command 'export TARGET_VENDOR=3D"-poky"; export PATH=3D=
/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/work=
/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin/python3-n=
ative:/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tm=
p/work/x86-64-v3-poky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin:/sr=
v/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/work/x8=
6-64-v3-poky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin/x86_64-poky-=
linux:/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tm=
p/hosttools:$PATH; export RUST_TARGET_PATH=3D/srv/pokybuild/yocto-worker/=
qemux86-64-tc/build/build-st-1700604/tmp/work/x86-64-v3-poky-linux/rust/1=
=2E90.0/rust-targets; export RUSTFLAGS=3D'-C strip=3Ddebuginfo'; export T=
EST_DEVICE_ADDR=3D"192.168.7.6:12345"; cd /srv/pokybuild/yocto-worker/qem=
ux86-64-tc/build/build-st-1700604/tmp/work/x86-64-v3-poky-linux/rust/1.90=
=2E0/sources/rustc-1.90.0-src; python3 src/bootstrap/bootstrap.py test  -=
-exclude src/bootstrap  --exclude src/doc/rustc  --exclude src/doc/rustdo=
c  --exclude src/doc/unstable-book  --exclude src/etc/test-float-parse  -=
-exclude src/librustdoc  --exclude src/rustdoc-json-types  --exclude src/=
tools/coverage-dump  --exclude src/tools/jsondoclint  --exclude src/tools=
/lint-docs  --exclude src/tools/replace-version-placeholder  --exclude sr=
c/tools/rust-analyzer  --exclude src/tools/rustdoc-themes  --exclude src/=
tools/rust-installer  --exclude src/tools/test-float-parse  --exclude src=
/tools/suggest-tests  --exclude src/tools/tidy  --exclude tests/assembly-=
llvm/asm/aarch64-outline-atomics.rs  --exclude tests/codegen-llvm/issues/=
issue-122805.rs  --exclude tests/codegen-llvm/thread-local.rs  --exclude =
tests/mir-opt/  --exclude tests/run-make  --exclude tests/run-make-fullde=
ps  --exclude tests/rustdoc  --exclude tests/rustdoc-json  --exclude test=
s/rustdoc-js-std  --exclude tests/ui/abi/stack-probes-lto.rs  --exclude t=
ests/ui/abi/stack-probes.rs  --exclude tests/ui/codegen/mismatched-data-l=
ayouts.rs  --exclude tests/codegen-llvm/rust-abi-arch-specific-adjustment=
=2Ers  --exclude tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debu=
ginfo.rs  --exclude tests/ui/feature-gates/version_check.rs  --exclude te=
sts/ui-fulldeps/  --exclude tests/ui/process/nofile-limit.rs  --exclude t=
idyselftest --no-doc --no-fail-fast --bless --target x86_64-poky-linux-gn=
u' returned non-zero exit status 1:
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2691=

>
> Can you have a look at this error?

Yes, I did already:
https://lists.openembedded.org/g/openembedded-core/message/226640 - I
believe this should take care of this issue
(but I have to admit that currently I struggle executing the selftest on
my machine - both inside and outside of docker I get mysterious qemu
startup errors).

> Thanks,
> Mathieu
>


