Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CC4CD98F2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 15:58:45 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18861.1781711917812999887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 08:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ONI++63r;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 70C7BC2BB3E;
	Wed, 17 Jun 2026 15:58:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4CDF4601AA;
	Wed, 17 Jun 2026 15:58:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DABD106C8276;
	Wed, 17 Jun 2026 17:58:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781711914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6GcqWk31V8baBioVlx4zZRxMthPi33vscX6VnHrc+Zo=;
	b=ONI++63ryz2LcZ1yUlspGJKONn30FDqhfJ/x+Q6cCg/rxqcQudQsVigkqFJlsLlIRAOJUJ
	hatEyLfKFlOdvXIvyOHudBazvXs3ISEgXu7IsZxlU0lfHS22tkFn9t3fJTL3ae5pnaMFL9
	ge/LImlV1QbEAojhsKQEH6iv3hFdL7VBi1J4Ce2ydS66H20Rig5gTV8yXWxx03RF2kU2+x
	85ZgpOhWEeefaY1Jvh7iin2yPeVhAgd0XtW7AH78wNS/Xgr0MOhVfp7/YR9U+WPMxYCIgx
	EfaRsHozNhmrYHH1qKm31a4fqTme3O3l7UiZ9xXvFxYGTiyd7di6uMKgkitfNA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 17:58:27 +0200
Message-Id: <DJBG5QOT7KD0.2G8XWYKZK99JY@bootlin.com>
To: <rs@ti.com>, <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
 <alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
Subject: Re: [oe-core][PATCHv2] xuser-account: convert to
 standard-user-account
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260616182553.3046153-1-rs@ti.com>
In-Reply-To: <20260616182553.3046153-1-rs@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 15:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239034

On Tue Jun 16, 2026 at 8:25 PM CEST, rs wrote:
> From: Randolph Sapp <rs@ti.com>
>
> Change this single xuser account template into a generic
> standard-user-account that uses distro level variables for
> configuration.
>
> This allows for seamless configuration of multiple out-of-box scripts
> and tests across layers without having to implicitly hope that the
> username or groups haven't been changed by a bbappend or recipe
> override.
>
> This also adds a class and a variable to allow recipes to assert that
> the user is in requested groups.
>
> This was proposed specifically to remove some issues highlighted in:
> https://lists.openembedded.org/g/openembedded-core/message/230665
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Hi Randolph,

Thanks, it looks better now.

Yet we have some test failures:

AssertionError: ssh exited with status '255' for command '['ssh', '-l', 'ro=
ot', '-o', 'ServerAliveCountMax=3D2', '-o', 'ServerAliveInterval=3D30', '-o=
', 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno', '-=
o', 'LogLevel=3DERROR', '192.168.7.2', 'export PATH=3D/usr/sbin:/sbin:/usr/=
bin:/bin; export XDG_RUNTIME_DIR=3D/run/user/`id -u weston`; export WAYLAND=
_DISPLAY=3Dwayland-1; wayland-info']': this is likely an SSH failure
id: unknown user weston
failed to create display: No such file or directory
...
RESULTS - weston.WestonTest.test_wayland_info: FAILED (0.47s)
RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_composit=
or: FAILED (0.27s)
RESULTS - weston.WestonTest.test_weston_running: FAILED (0.73s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3950

Also we have a failing selftest:

2026-06-17 11:32:17,460 - oe-selftest - INFO - incompatible_lic.NoGPL3InIma=
gesTests.test_core_image_full_cmdline_weston (subunit.RemotedTestCase)
2026-06-17 11:32:17,465 - oe-selftest - INFO -  ... FAIL
...
ERROR: weston-init-1.0-r0 do_package_write_rpm: File /srv/pokybuild/yocto-w=
orker/oe-selftest-fedora/build/build-st-953747/tmp/work/qemux86_64-poky-lin=
ux/weston-init/1.0/recipe-sysroot/etc/passwd doesn't exist in sysroot!
...
File: '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembe=
dded-core/meta/classes-global/package_rpm.bbclass', lineno: 202, function: =
get_attr
     0198:            def get_attr(path):
     0199:                stat_f =3D os.stat(rootpath + "/" + path, follow_=
symlinks=3DFalse)
     0200:                mode =3D stat.S_IMODE(stat_f.st_mode)
     0201:                try:
 *** 0202:                    owner =3D pwd.getpwuid(stat_f.st_uid).pw_name
     0203:                except Exception as e:
     0204:                    filename =3D d.getVar('RECIPE_SYSROOT') + '/e=
tc/passwd'
     0205:                    if os.path.exists(filename):
     0206:                        bb.error("Content of /etc/passwd in sysro=
ot:\n{}".format(
Exception: KeyError: 'getpwuid(): uid not found: 1000'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4139
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4061
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3911

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


