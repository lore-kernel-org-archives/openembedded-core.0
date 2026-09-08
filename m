Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59994C79F9E
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 04:43:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.148.1788842575945756077
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 21:42:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0kh3/qxr;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 968A71A1A48
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Sep 2026 04:42:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A0E4603C4;
	Tue,  8 Sep 2026 04:42:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 257A011C7AF2B;
	Tue,  8 Sep 2026 06:42:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788842568; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JXaV8nHmrQSFXOBwpurrT5bHQmx45xsaLpZab7ToWeU=;
	b=0kh3/qxrrTwgyZOg3wK0fPSwtCQMJ+LIfzhNlpeWv/txbvCtrFVs/EKb6RvuxmbKz6oAIo
	KXrLK279GloCbYfhPIm37zVkYuUtYaXF1U8uaLBCtmG6ZkXKVEsiEkr2ybnWxfFlKm1ZNG
	J3e+3oksrJ42jb7gJ4IzZIck776wh2deelz83K+zA/mzRSOFs1RYoTHAZ18te71030q0rx
	SAapdBN5ZIjaksLJMytQlEvb7x/wDpZcFQkHasj2gkYZpHsvU+DYIa5NZGCyeQXIYh4yhb
	knxFZDLdFw95hxi4jijnxc4bD1ixfcLTxkwoC/AjrR2UJDM1HSr8NNvQ8mE9hA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Sep 2026 06:42:46 +0200
Message-Id: <DL9NRM24QNZE.33T8JAD1GBY1W@bootlin.com>
Subject: Re: [OE-core] [PATCH v9 4/5] dnf: Upgrade to 5.4.4.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260907135607.4132821-1-adam.duskett@amarulasolutions.com>
 <20260907135607.4132821-4-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260907135607.4132821-4-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Sep 2026 04:43:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245319

On Mon Sep 7, 2026 at 3:56 PM CEST, Adam Duskett via lists.openembedded.org=
 wrote:
> Completely rewritten in C++, there are several changes needed
> to facilitate moving from DNF4 to DNF5. Below are some significant
> items to note:
>
>     - Added a negative lookahead filter for the following warning if
>       RPM_SIGN_PACKAGES !=3D '1': "Warning: skipped OpenPGP checks"
>       This warning is hard-coded and piped to stderr if gpg checks
>       are disabled. However, most users do not sign their RPM packages
>       and use dnf to simply construct the rootfs.
>
>     - The "-v/--verbose" cli option is removed. As such, remove the argum=
ent
>     everywhere it was called.[1]
>
>     - the rpmverbosity cli option is replaced with --setopt=3Drpmverbosit=
y
>
>     - Change gpgcheck to pkg_gpgcheck as this is what the documentation
>     recommends.[2]
>
>     - --nogpgcheck is now --no-gpgchecks
>
>     - --setopt=3Dprotect_running_kernel=3DFalse has to be set or else eve=
ry dnf
>     transaction complains that /boot/vmlinuz-${kernel_version} does not
>     exist in /var/log/dnf5.log. There is an open issue on github[3] to en=
able
>     the currently not-yet implemented `autocheck_running_kernel option`, =
but
>     it has been open for quite some time and the protect_running_kernel
>     option supresses the message.
>
>     - Move --skip-broken to after the install argument as the global
>       --skip-broken argument is removed.
>
>     - /var/cache/dnf is replaced with /var/cache/libdnf5
>
>     - Add `features +=3D 'PACKAGECONFIG:append:pn-rpm =3D " sequoia"\n'`
>           `features +=3D 'PACKAGECONFIG:append:pn-librepo =3D " sequoia"\=
n'`
>       to test_testimage_dnf as librepo currently does not work
>       with gpgme.
>
>     - Change `if e_output.startswith("Error in POSTIN scriptlet in rpm pa=
ckage"):`
>       to `if "%post(" in e_output and "scriptlet failed" in e_output.
>
> While DNF5 has many config options, unfortunately, the majority
> of them depends on sdbus-c++, which is not included in OE-core.
> However, the package is included in meta-openembedded, so it's
> best to include the PACKAGECONFIG options in the recipe and
> leave them off by default.
>
> 1: https://github.com/rpm-software-management/dnf5/issues/464
> 2: https://dnf5.readthedocs.io/en/latest/dnf5.conf.5.html
> 3: https://github.com/rpm-software-management/dnf5/issues/1255
>
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---

Hi Adam,

This has been failing on my side:

ERROR: dnf-native-5.4.4.0-r0 do_compile: Execution of '/srv/pokybuild/yocto=
-worker/genericx86-64/build/build/tmp/work/x86_64-linux/dnf-native/5.4.4.0/=
temp/run.do_compile.2140500' failed with exit code 1
...
| /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-lin=
ux/dnf-native/5.4.4.0/sources/dnf-5.4.4.0/libdnf5-cli/session.cpp:257:36: e=
rror: =E2=80=98parse=E2=80=99 is not a member of =E2=80=98std::chrono=E2=80=
=99
|   257 |                 ss >> std::chrono::parse("%F", tp);
|       |
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4618

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


