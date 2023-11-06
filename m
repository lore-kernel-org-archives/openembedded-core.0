Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55770C4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 12:48:10 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.53431.1699274882670916287
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 04:48:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=V5crpuvC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40790b0a224so33600335e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 04:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699274881; x=1699879681; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xcnwsL1P8gfVFo9AtnbuLIY7gtyyj6oo/f9Po6qI7/E=;
        b=V5crpuvCRTf0APAMeSOmfW6JfOoMoip0HoFtqGbzfnJhbbrwx8XUAslTI9+4rzYjHw
         UH+FDGgAoFnpPmPiaC2uaYti+ycYjh/+Yu+rvx6e2jUQLIkJZbGbeIan2KuH2q9PmKgo
         kJPFoHOXvw55w0erZD27PrbXVWfc6CnHGTWNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699274881; x=1699879681;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcnwsL1P8gfVFo9AtnbuLIY7gtyyj6oo/f9Po6qI7/E=;
        b=XkpinPFKrMc9VQNiwotPDkxM4+m/AqmJ9ZHY2v8o9FU8LoqtRQ2UCYh/ZX8lDOfZVb
         vh5tnjJsETUIAQVZaaqGoZ7XQgF76EIyWJWNorAhHNy5cdCLr4XrIgvbKLpqgAUsOz5+
         UEJxJ9rBFonjsqeUJeuz5jCRfjEN/5Qe7ka7EpvERJZoSxvvSTJNn8O2EL4YbFmn/Q2Z
         lhwYTtaxjkGeT+vbpi1GpdStSx/R3KXG/Emh8och71G/+CEcgKJPIErEqlOE5QVVIY63
         OR22Z23B5pHLKLcRlYVsoVJuYcMliQpgNgALTZTqeBgg+HHTuI0veL3fUkYq+gsd+8vc
         0YZA==
X-Gm-Message-State: AOJu0Yxh7l8emQHqXT8br2tokZcLXw6Y2/HbKcLk+kuKJZ6h1uijiVkN
	MUUScFuUlnlUrwna/veEKMFvYg==
X-Google-Smtp-Source: AGHT+IG41nt1d2OvzpAl4FUwUQES0bwFX57LdIeAIZSmCBJ4U/PecO/TB8SREcUE6JwoA+PR5rYJWA==
X-Received: by 2002:a05:600c:1d0e:b0:402:8896:bb7b with SMTP id l14-20020a05600c1d0e00b004028896bb7bmr22499110wms.6.1699274881029;
        Mon, 06 Nov 2023 04:48:01 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id bg19-20020a05600c3c9300b0040531f5c51asm12428713wmb.5.2023.11.06.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 04:48:00 -0800 (PST)
Message-ID: <984be73de92e191166e9dddf95aa9861f346ddcd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] selftest/sstatetests: add tests for
 'bitbake -S printdiff'
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Mon, 06 Nov 2023 12:47:59 +0000
In-Reply-To: <20231026103320.2751277-1-alex@linutronix.de>
References: <20231026103320.2751277-1-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 12:48:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190209

On Thu, 2023-10-26 at 12:33 +0200, Alexander Kanavin wrote:
> > 'bitbake -S printdiff' is a useful diagnostic facility for finding out
> > why sstate is not being reused, but until now it had no tests that woul=
d
> > ensure it works. This commit adds three basic scenarios:
> >=20
> > 1. make a change in a really basic, common recipe that is at the very r=
oot
> > of dependency trees (quilt-native), and ensure that change is correctly=
 discovered when
> > building an image.
> >=20
> > 2. make a change in gcc-source recipe, which is somewhat special
> > (operates in work-shared), and ensure that gcc-runtime builds track
> > that down as well.
> >=20
> > 3. make a change in base_do_configure() definition from base.bbclass,
> > which is not recipe-specific, but affects many basic recipes, and ensur=
e that
> > is correctly reported as well.
> >=20
> > The test itself actually runs twice:
> > - first against a fully populated build directory, where
> > the printdiff code is guaranteed to find the correct previous
> > stamp that can be compared with in a predictable manner.
> >=20
> > - then in an empty build directory where the printdiff code
> > goes to look in the sstate cache, and so the existence of the
> > previous signature can be tested, but not the difference with it
> > (what the exact difference would be is unpredictable as the
> > sstate cache is indeed shared between many builds).
> >=20
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>

There have been autobulilder failures from the do_configure base change
and we've not been quite sure why.=C2=A0The summary below took quite a bit
of digging but seems quite simple when written up like this!

If you dig into a failure like:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/2379/ste=
ps/15/logs/stdio

you see messages like:

The differences between the current build and any cached tasks start at the=
 following tasks:
/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-devtool=
s/quilt/quilt-native_0.67.bb:do_collect_spdx_deps
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/=
recipes-devtools/gnu-config/gnu-config_git.bb:do_configure
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/=
recipes-core/zlib/zlib_1.3.bb:do_collect_spdx_deps
virtual:native:/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/=
recipes-core/update-rc.d/update-rc.d_0.8.bb:do_collect_spdx_deps
/home/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/recipes-extende=
d/timezone/tzcode-native.bb:do_prepare_recipe_sysroot

which seems odd. Taking the first one, if quilt-native has built, you'd
expect those to be present.

I went onto the arm builder and tried a "bitbake quilt-native -S printdiff =
-DDD":

DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/4d/8d/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:4d8da10af56c40d61adb5febb96f583a399ceb276d0dc13e61971f1eb0b7d81d_cre=
ate_runtime_spdx.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/85/79/sstate:quilt-native::0.67:r0::11:85794fd6d83b61cb273e4d1=
4f6e3581d7fa4ec743b455f1d21786cff032c262c_patch.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/b8/fb/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:b8fbbfbafeb7cdf333f1766d6b3c94822a21d42145e17377bede29e44a86a14d_pre=
pare_recipe_sysroot.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/fe/ae/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:feae04b2abf592e3df83d0dcac1f74399e342ba99c718975d34b8a27e07eeca5_con=
figure.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/f5/98/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:f598fad5807fabde02cd16e5f7f26b486d0b5f87dec6ff3c3d5378ba68780ff1_ins=
tall.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/e2/a4/sstate:quilt-native::0.67:r0::11:e2a41fd44aa7736bd318ec9=
c4a6b91e4b80563ba213035afe3df3cb96fdf7aaf_fetch.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/da/07/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:da07e6362c0b01fc2798456aa1319e2343a556e33d0857f90a129701eaa722b2_dep=
loy_source_date_epoch.tar.zst.siginfo
DEBUG: SState: Looked for but didn't find file /srv/autobuilder/autobuilder=
.yocto.io/pub/sstate/universal/72/12/sstate:quilt-native:aarch64-linux:0.67=
:r0:aarch64:11:7212eff5f191def566b82db976b37e1efcb0a8ccd964eff5b5682b651b7c=
b7fa_collect_spdx_deps.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/73/96/sstate:quilt-native::0.67:r0::11:7396e70fb1865087409e454=
eb8bacae3bcb4add6218b3cd707d2e96880b72936_populate_lic.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/9f/8e/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:9f8e9e5303322240b173483312d885144dfdf2228698868857a281b510ec3214_rec=
ipe_qa.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/fd/c4/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:fdc40ea4bffb4485bdbb3c38a13b4e5d8d94d1c2cdb66c8659fe5f758a3530a3_pop=
ulate_sysroot.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/ac/69/sstate:quilt-native::0.67:r0::11:ac69437e7d349349b5f1b2d=
f79203d3ade24e59dc32f16cdf03e6dc92dd3fad6_unpack.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/94/9b/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:949b4472b14403843ae5219789e371979cbc9a53c7fa250033f55157186d902e_com=
pile.tar.zst.siginfo
DEBUG: SState: Found valid sstate file /srv/autobuilder/autobuilder.yocto.i=
o/pub/sstate/universal/1b/da/sstate:quilt-native:aarch64-linux:0.67:r0:aarc=
h64:11:1bdafcc9e6b4209bfbdf4b83f8b44e0cc3cc26cdeebe7d713a9f7fcba4b02d48_cre=
ate_spdx.tar.zst.siginfo

and the sstate for quilt-native_0.67.bb:do_collect_spdx_deps is indeed miss=
ing, there is only x86:

$ ls /srv/autobuilder/autobuilder.yocto.io/pub/sstate/*/72/12/sstate\:quilt=
-native\:*collect_spdx_deps.tar.zst.siginfo=20
/srv/autobuilder/autobuilder.yocto.io/pub/sstate/universal/72/12/sstate:qui=
lt-native:x86_64-linux:0.67:r0:x86_64:11:7212eff5f191def566b82db976b37e1efc=
b0a8ccd964eff5b5682b651b7cb7fa_collect_spdx_deps.tar.zst.siginfo

The normal build works since it doesn't care about the siginfo files,
just the actual sstate it needs and as a covered task, it just skips
over this.

This highlights two issues:

a) Why is the single sstate siginfo file gone? The most likely
explanation is that it wasn't accessed recently and was deleted by the
cleanup/ageing code. This makes sense since the code in question never
downloads it, only checks it exists and uses that as a marker. Our
usage "accesses" are in a different codepath to the parsing check.

b) This means -S printdiff doesn't quite do what you'd expect since it
doesn't skip "covered" tasks in the same way a normal build would.

To reproduce the test failure you should be able to just delete that
siginfo file from your local sstate.

Cheers,

Richard






