Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EEF6CCFA18
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 19:42:00 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12537.1762630910500797866
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Nov 2025 11:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F6A5HQ90;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B6EC4E415CF
	for <openembedded-core@lists.openembedded.org>; Sat,  8 Nov 2025 19:41:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9EE460710;
	Sat,  8 Nov 2025 19:41:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FB3E11851498;
	Sat,  8 Nov 2025 20:41:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762630907; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=y7dFKc4l1IEvInlc02ee0ytTjzv0tfsMXDohYzKtuuE=;
	b=F6A5HQ908yYK11k8J06Wc0Vr00m5e5mMAtJIrY4Hu5vmQ9RgOgvyZcHZBp5qchJwlB3hpm
	d8VdIckGd7xiecBMAEg+P0GiAEVBSICbaCYMDJF9X0tfH+0Nog47rCO8nQmPAyJFTFFpNq
	lL3W0TvBkJXa6KuHTW1Zr2fnBNQ2o8FLUvZUCkMSn5TV7UZ+0avyYNSdipn2v+tY3CQYhg
	+YZ95rfWFYOq8q+83ZWBggVzfOFLt2GG1ZUYud74s9DESG8R7csTw3yohDs1YWB5GC5lnH
	ZBnQKbmfFCnop2CEM7JchM/gp7qEx2nBUY9vW4z+6Ulrqu5Nzq7RiEHbibs0nw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 08 Nov 2025 20:41:42 +0100
Message-Id: <DE3KIA2656K1.2UE9T6FAQSG2Q@bootlin.com>
Subject: Re: [PATCH v4] libxml2: upgrade 2.14.6 -> 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Hongxu Jia" <hongxu.jia@windriver.com>,
 <openembedded-core@lists.openembedded.org>, <skandigraun@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251105023236.310076-1-hongxu.jia@windriver.com>
 <DE2A8WAMFQ8I.33H1IHF8RV2DJ@bootlin.com>
 <8a42aa34-7ba5-400e-92d3-3765eeaccedf@windriver.com>
In-Reply-To: <8a42aa34-7ba5-400e-92d3-3765eeaccedf@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Nov 2025 19:42:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226085

On Fri Nov 7, 2025 at 9:27 AM CET, Hongxu Jia wrote:
> On 11/7/25 15:26, Mathieu Dubois-Briand wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> On Wed Nov 5, 2025 at 3:32 AM CET, Hongxu Jia wrote:
>>> Due to upstream [Remove LZMA support][1], drop option --without-lzma
>>>
>>> Due to upstream [disable python bindings by default][2] and are
>>> planned to be removed in the 2.16 release[3][4]. If we still enable
>>> python bindings by --with-python=3Dyes, due to upstream [doc: Build doc=
s
>>> with Doxygen and xsltproc][5], build python binding requires doxygen
>>> otherwise build will fail, and we do not provide doxygen in oe-core,
>>> so remove python package directly.
>>>
>>> Refresh install-tests.patch and run-ptest to not install python test
>>> cases
>>>
>>> Drop CVE-2025-6021.patch which is obsolete
>>>
>>> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067d=
df123eb7358690c214b0b
>>> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/fa931566d2f541d3162=
c7b98c8a12e6b2a6ae542
>>> [3] https://download.gnome.org/sources/libxml2/2.15/libxml2-2.15.0.news
>>> [4] https://gitlab.gnome.org/GNOME/libxml2/-/issues/891
>>> [5] https://gitlab.gnome.org/GNOME/libxml2/-/commit/bbe5827c94cc9b0e393=
ff3e6eef6dec2376317e2
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>> Hi Hongxu,
>>
>> Thanks for the new version.
>>
>> It's not clear to me how, but it looks like this update is breaking rust
>> build:
>>
>> ERROR: rust-1.90.0-r0 do_test_compile: Execution of '/srv/pokybuild/yoct=
o-worker/qemuarm64-tc/build/build-st-3876356/tmp/work/cortexa57-poky-linux/=
rust/1.90.0/temp/run.do_test_compile.3947248' failed with exit code 1
>> ...
>>
>> alues("optimized-c"))' --check-cfg 'cfg(__aarch64_swp8_rel, values("opti=
mized-c"))' --check-cfg 'cfg(__aarch64_swp8_acq_rel, values("optimized-c"))=
' --check-cfg 'cfg(target_feature, values("vis3"))' --check-cfg 'cfg(featur=
e, values("checked"))' --check-cfg 'cfg(assert_no_panic)' --check-cfg 'cfg(=
thumb)' --check-cfg 'cfg(thumb_1)' --check-cfg 'cfg(f16_enabled)' --check-c=
fg 'cfg(f128_enabled)' --check-cfg 'cfg(intrinsics_enabled)' --check-cfg 'c=
fg(arch_enabled)' --check-cfg 'cfg(optimizations_enabled)' --check-cfg 'cfg=
(feature, values("unstable-public-internals"))' --check-cfg 'cfg(optimizati=
ons_enabled)' --check-cfg 'cfg(x86_no_sse)' --check-cfg 'cfg(kernel_user_he=
lpers)' --check-cfg 'cfg(feature, values("mem-unaligned"))'`
>> | error: rustc interrupted by SIGSEGV, printing backtrace
>> |
>> | /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/wo=
rk/cortexa57-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src/build/x86_64-u=
nknown-linux-gnu/stage1/lib/librustc_driver-d18035d17505fd2b.so(+0xd2ab55) =
[0x7f3ae2d2ab55]
>> | /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/sy=
sroots-uninative/x86_64-linux/lib/libc.so.6(+0x3bba0) [0x7f3ae1e4aba0]
>> | /srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-3876356/tmp/wo=
rk/cortexa57-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src/build/x86_64-u=
nknown-linux-gnu/stage1/lib/librustc_driver-d18035d17505fd2b.so(+0x8527820)=
 [0x7f3aea527820]
>> |
>> | note: we would appreciate a report at https://github.com/rust-lang/rus=
t
>> | help: you can increase rustc's stack size by setting RUST_MIN_STACK=3D=
16777216
>> | rustc exited with signal: 11 (SIGSEGV)
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/2610
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/672
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/2613
>>
>> Can you have a look at these?
>
> Seems no direct relationship with libxml2, but I will still have a look=
=20
> and try to reproduce the rust build failure
>
> //Hongxu

I tried to pick again your patches, and I'm not seeing the same issue
this time. Some tests are still pending, but I'm highly confident they
will succeed.

In addition, the same error also appeared while testing other patches,
completely unrelated with your. So it's more likely that we have some
bad intermittent issue with rust.

Thanks for your time,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


