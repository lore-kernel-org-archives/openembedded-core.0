Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28210D1D897
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 08:15:14 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38647.1764836104658818298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 00:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=g68ABlcG;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775895d69cso2910725e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 00:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1764836103; x=1765440903; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0SKZD2KCMBWp3K5tS6NOT3W0quQm363kTEwUuQXaC9E=;
        b=g68ABlcGzJGltOoy1mSXcC9fi8PHlsaJao1E9v4Vp8lkTra3LQ/fTb8ydSvOqqoKsu
         w6Jnd6QbDA/MtIdHNQAKqcMDgbtDuxuYLry9DRmVs8JSYKtBlVJ7jqd5ojTz6AIiKtlL
         js5KTDCEfa2jlWBOcfUEUlrAS9g03xar/rwo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764836103; x=1765440903;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SKZD2KCMBWp3K5tS6NOT3W0quQm363kTEwUuQXaC9E=;
        b=mzXmmEOGUHm2+R/5nKxC86wt9EX1pnKTnEaDKsvasWDl1tQAyspLkFxqhddDFC+AjN
         Q6guqJMELC9njXArMbyQuYPbYgFpqlHjuGN/luaACWOvtmyvX1Rya7FQK2EEIb/GeBoE
         utVwkJb0dGXW7bXUYxifX6pGWEQBAkI5unKAra2S3EdUpe991cOp5EO44RjkVuYPnEP7
         cX33wo4rDSLhaZoCRRGsWf9bcdArg4WaCyPv3DnUCmNV7kH6EfaGgZUImYKpXyorlPe2
         i8p7HKmJXHNmNC47EQ3VeBRZ20uWi0qS008muI2JukxJEt1pI7nAUyutY09R2edRLq6T
         CiZw==
X-Forwarded-Encrypted: i=1; AJvYcCWFD0fqXB8gFfGqhv0SAvEF0wYsk+uf0kwfiMllcVbfE/FPLlZKsnNehe/XKx44fdpsvrSvd/Lfb/utsdbJJXM7Mw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBwjeMzg/q8GbqNf06XOBsBha3dnRM8aBfelXqAWxLxlmztx6i
	5hbFhxnqzU0Xy84RCiYoMwk1FzObn6Y3LPABFWHcRAnACGd5xUZS3TkyLBsTvKO+TA8=
X-Gm-Gg: ASbGncuFr0E5acKDLI4MXD/JEro7PdLHSgezpDVmk+FmN3e2M1HpC4AuXirrg0I+/ay
	BFvhD2c94YQ4q8ELeU8fjetiv2P/cfL9aiRLU9b9B15v/r03Jl4Ztu9deyU/44u6JaV/lj1gac9
	90eN0o/KJK3bkSmteDYBcPiRrvw8g2m26jMOQCzQeTDyuKNXRBZLB2KPMTjCxxifLWFMiwlQewI
	LYQSD4/4KSKCFjVhSctmD9J2MU/F6VC6JoNaUFkk4AjDTYV37j0s5gIo1Kmx2+r5Zx3IvoR6/m6
	b3IukeLCTyI+34swLpTws2bi13SLN07DmnQ6PB2U/Oebjhff51vUULUM/ekhVjW2bGUgLM1JvPy
	yHK6Kmeg55nbHUkp29uJqiyF3QecrNXWNRY18Ic/B8f6fDML5KFdhSnGkulBbe/4yKoUTHYyi1f
	T9dAZh5SBPHfOc5QC58mUMlNNf4xsjWSy4IQJPgCBSrPjXEFyYouv1NuyMngTcZAcZ87+e2tcnM
	RMqfl2ufX+D5b9dcrkoIs7N5drxrus5eaVgXnBtFQ3yXKZavgs=
X-Google-Smtp-Source: AGHT+IHIyJZeKiHeLyhPj6mdH9znxuGEVoFjZ6JJ2XEYjEJkw5D7GYfveSfkFCaDtQLl8WZGN5GH1g==
X-Received: by 2002:a05:600c:1e8f:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-4792f3861bdmr15848525e9.22.1764836102798;
        Thu, 04 Dec 2025 00:15:02 -0800 (PST)
Received: from ?IPV6:2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544? (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311fbaf4sm15256885e9.15.2025.12.04.00.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 00:15:02 -0800 (PST)
Message-ID: <8c74f5fc-119c-4758-bc6f-7ac97da4c65d@smile.fr>
Date: Thu, 4 Dec 2025 09:15:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 0/5] Kernel Rust out-of-tree module support
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20251119195540.2671856-1-yoann.congal@smile.fr>
 <DEMSA8KMSGGU.2SN8ACG42NG35@bootlin.com>
From: Yoann Congal <yoann.congal@smile.fr>
Content-Language: en-US, fr
Organization: Smile ECS
In-Reply-To: <DEMSA8KMSGGU.2SN8ACG42NG35@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 08:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227275



Le 01/12/2025 =C3=A0 10:48, Mathieu Dubois-Briand a =C3=A9crit=C2=A0:
> On Wed Nov 19, 2025 at 8:55 PM CET, Yoann Congal via lists.openembedded=
=2Eorg wrote:
>> As followup of Harish Sadineni's RFC series "Enable rust support for
>> linux kernel" [0] (and to increase its test coverage), this series add=

>> support for out-of-tree kernel module written in Rust as well as
>> associated test.
>>
>> [0]: https://lists.openembedded.org/g/openembedded-core/message/226560=

>>
>> Yoann Congal (5):
>>   kernel.bbclass: Export artifacts needed for out-of-tree Rust
>>     compilation
>>   module.bbclass: Prepare out-of-tree rust module compilation
>>   meta-skeleton: Add rust-out-of-tree-module recipe
>>   rust-out-of-tree-module: Add myself as maintainer
>>   runtime_test: Add rust-out-of-tree selftest
>>
>>  .../rust-out-of-tree-module_git.bb             | 18 +++++++++++++++++=
+
>>  meta/classes-recipe/kernel.bbclass             | 18 +++++++++++++++++=
+
>>  meta/classes-recipe/module.bbclass             |  8 ++++++++
>>  meta/conf/distro/include/maintainers.inc       |  1 +
>>  meta/lib/oeqa/selftest/cases/runtime_test.py   |  9 ++++++++-
>>  5 files changed, 53 insertions(+), 1 deletion(-)
>>  create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-modu=
le/rust-out-of-tree-module_git.bb
>=20
> Hi Yoann,
>=20
> I ran a few RFC series on the autobuilder, and I suspect this one of
> these two issues, during oe-selftests.
>=20
> First issues:
>=20
> 2025-11-29 08:23:13,186 - oe-selftest - INFO - 2: 6/31 214/648 (110.21s=
) (0 failed) (distrodata.Distrodata.test_maintainers)
> 2025-11-29 08:23:13,186 - oe-selftest - INFO - testtools.testresult.rea=
l._StringException: Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/op=
enembedded-core/meta/lib/oeqa/selftest/cases/distrodata.py", line 115, in=
 test_maintainers
>     self.fail("""
>   File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
>     raise self.failureException(msg)
> AssertionError:
> Unable to find recipes for the following entries in maintainers.inc:
> rust-out-of-tree-module
>=20
> I saw you added something, but for some reason the test is not happy.
>=20
> Second issues:
>=20
> ERROR: core-image-minimal-1.0-r0 do_rootfs: Could not invoke dnf. Comma=
nd '/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-179319=
/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/recipe-sysroot-nati=
ve/usr/bin/dnf -v --rpmverbosity=3Dinfo -y -c /srv/pokybuild/yocto-worker=
/oe-selftest-armhost/build/build-st-179319/tmp/work/qemuarm64-poky-linux/=
core-image-minimal/1.0/rootfs/etc/dnf/dnf.conf --setopt=3Dreposdir=3D/srv=
/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-179319/tmp/wor=
k/qemuarm64-poky-linux/core-image-minimal/1.0/rootfs/etc/yum.repos.d --in=
stallroot=3D/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-s=
t-179319/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/rootfs --se=
topt=3Dlogdir=3D/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/bui=
ld-st-179319/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/temp --=
repofrompath=3Doe-repo,/srv/pokybuild/yocto-worker/oe-selftest-armhost/bu=
ild/build-st-179319/tmp/work/qemuarm64-poky-linux/core-image-minimal/1.0/=
oe-rootfs-repo --nogpgcheck install kernel-module-rust-minimal kernel-mod=
ule-rust-out-of-tree packagegroup-core-boot run-postinsts ssh-pregen-host=
keys' returned 1:
> ...
> No match for argument: kernel-module-rust-out-of-tree
> Error: Unable to find a match: kernel-module-rust-out-of-tree
> kernel-module-rust-out-of-tree is neither a recipe nor a generated pack=
age.
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2915=

> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2777=

> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2672=


It appears that meta-skeleton:
* is not covered by maintainers.inc
* is not included by default during this selftest (I had it in my local
  config)

I will fix these in v2.

Thanks!

> Thanks,
> Mathieu
>=20

--=20
Yoann Congal
Smile ECS


