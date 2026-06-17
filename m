Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865E3CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 16:00:15 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19261.1781712012962724692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 09:00:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xeC+NQ4c;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ACCF34E42F35;
	Wed, 17 Jun 2026 16:00:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8153C601AA;
	Wed, 17 Jun 2026 16:00:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E77F6106C8548;
	Wed, 17 Jun 2026 18:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781712009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m5ry4xL2ZeG8zk09prHTRDza1Fz13j/jq2gJCy+cFdI=;
	b=xeC+NQ4cvhIsjNPbS8ia7WD226JRl1G+S3Wt+rqoqNPMksXLucJZ1I3S1QnGOLvNscYZTP
	oIcrJNof8hpBsvknH50hbqxmof2VwCTpM/0heKiytfN4XBP8fh88k6WdL/q+QacS+534TV
	QxGJ3hd50uOvc+pnTtNLIrEHMtHe6XuJT3ZGHSXsJBMfrlUZ8bw6H36VNjJHLczyHE/dLy
	CsG/EFGZFeDxHrTBN8gT0q+OywObBdlQjvA4jSi2pbJXsebv5i/dVZJcGD5gb2aNBVtiYq
	JJKJQKw13JQuUun+4z9HRZUpE5yoZyx2xalMKTpGluzopMyBGSssbv+ygARywQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Jun 2026 18:00:03 +0200
Message-Id: <DJBG6YVT3DHX.PTRABOQVTRAL@bootlin.com>
Subject: Re: [oe-core][PATCHv2] xuser-account: convert to
 standard-user-account
Cc: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
 <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <rs@ti.com>, <raj.khem@gmail.com>, <richard.purdie@linuxfoundation.org>,
 <alex@linutronix.de>, <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260616182553.3046153-1-rs@ti.com>
 <DJBG5QOT7KD0.2G8XWYKZK99JY@bootlin.com>
In-Reply-To: <DJBG5QOT7KD0.2G8XWYKZK99JY@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 16:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239035

On Wed Jun 17, 2026 at 5:58 PM CEST, Mathieu Dubois-Briand wrote:
> On Tue Jun 16, 2026 at 8:25 PM CEST, rs wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Change this single xuser account template into a generic
>> standard-user-account that uses distro level variables for
>> configuration.
>>
>> This allows for seamless configuration of multiple out-of-box scripts
>> and tests across layers without having to implicitly hope that the
>> username or groups haven't been changed by a bbappend or recipe
>> override.
>>
>> This also adds a class and a variable to allow recipes to assert that
>> the user is in requested groups.
>>
>> This was proposed specifically to remove some issues highlighted in:
>> https://lists.openembedded.org/g/openembedded-core/message/230665
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>
> Hi Randolph,
>
> Thanks, it looks better now.
>
> Yet we have some test failures:
>
> AssertionError: ssh exited with status '255' for command '['ssh', '-l', '=
root', '-o', 'ServerAliveCountMax=3D2', '-o', 'ServerAliveInterval=3D30', '=
-o', 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno', =
'-o', 'LogLevel=3DERROR', '192.168.7.2', 'export PATH=3D/usr/sbin:/sbin:/us=
r/bin:/bin; export XDG_RUNTIME_DIR=3D/run/user/`id -u weston`; export WAYLA=
ND_DISPLAY=3Dwayland-1; wayland-info']': this is likely an SSH failure
> id: unknown user weston
> failed to create display: No such file or directory
> ...
> RESULTS - weston.WestonTest.test_wayland_info: FAILED (0.47s)
> RESULTS - weston.WestonTest.test_weston_can_initialize_new_wayland_compos=
itor: FAILED (0.27s)
> RESULTS - weston.WestonTest.test_weston_running: FAILED (0.73s)
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3950
>
> Also we have a failing selftest:
>
> 2026-06-17 11:32:17,460 - oe-selftest - INFO - incompatible_lic.NoGPL3InI=
magesTests.test_core_image_full_cmdline_weston (subunit.RemotedTestCase)
> 2026-06-17 11:32:17,465 - oe-selftest - INFO -  ... FAIL
> ...
> ERROR: weston-init-1.0-r0 do_package_write_rpm: File /srv/pokybuild/yocto=
-worker/oe-selftest-fedora/build/build-st-953747/tmp/work/qemux86_64-poky-l=
inux/weston-init/1.0/recipe-sysroot/etc/passwd doesn't exist in sysroot!
> ...
> File: '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openem=
bedded-core/meta/classes-global/package_rpm.bbclass', lineno: 202, function=
: get_attr
>      0198:            def get_attr(path):
>      0199:                stat_f =3D os.stat(rootpath + "/" + path, follo=
w_symlinks=3DFalse)
>      0200:                mode =3D stat.S_IMODE(stat_f.st_mode)
>      0201:                try:
>  *** 0202:                    owner =3D pwd.getpwuid(stat_f.st_uid).pw_na=
me
>      0203:                except Exception as e:
>      0204:                    filename =3D d.getVar('RECIPE_SYSROOT') + '=
/etc/passwd'
>      0205:                    if os.path.exists(filename):
>      0206:                        bb.error("Content of /etc/passwd in sys=
root:\n{}".format(
> Exception: KeyError: 'getpwuid(): uid not found: 1000'
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4139
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4061
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3911
>
> Can you have a look at the issue?
>
> Thanks,
> Mathieu

Sorry, we also have a dependency issue in the reproducibility test:

2026-06-17 12:32:19,348 - oe-selftest - INFO -       ERROR: Nothing PROVIDE=
S 'standard-user-account' (but /srv/pokybuild/yocto-worker/reproducible/bui=
ld/layers/openembedded-core/meta/recipes-graphics/wayland/weston-init.bb DE=
PENDS on or otherwise requires it)
2026-06-17 12:32:19,348 - oe-selftest - INFO -       standard-user-account =
was skipped: Recipe standard-user-account, package standard-user-account: s=
ystem groupname "disk" does not have a static ID defined. Add disk to one o=
f these files: /srv/pokybuild/yocto-worker/reproducible/build/build-st/meta=
-selftest/files/static-group
2026-06-17 12:32:19,348 - oe-selftest - INFO -       ERROR: Nothing RPROVID=
ES 'weston-init' (but /srv/pokybuild/yocto-worker/reproducible/build/layers=
/openembedded-core/meta/recipes-graphics/packagegroups/packagegroup-core-we=
ston.bb, /srv/pokybuild/yocto-worker/reproducible/build/layers/openembedded=
-core/meta/recipes-graphics/wayland/weston-init.bb, /srv/pokybuild/yocto-wo=
rker/reproducible/build/layers/openembedded-core/meta/recipes-graphics/wayl=
and/weston_15.0.1.bb RDEPENDS on or otherwise requires it)
2026-06-17 12:32:19,348 - oe-selftest - INFO -       No eligible RPROVIDERs=
 exist for 'weston-init'
2026-06-17 12:32:19,348 - oe-selftest - INFO -       NOTE: Runtime target '=
weston-init' is unbuildable, removing...
2026-06-17 12:32:19,348 - oe-selftest - INFO -       Missing or unbuildable=
 dependency chain was: ['weston-init']
2026-06-17 12:32:19,349 - oe-selftest - INFO -       NOTE: Runtime target '=
packagegroup-core-weston' is unbuildable, removing...
2026-06-17 12:32:19,349 - oe-selftest - INFO -       Missing or unbuildable=
 dependency chain was: ['packagegroup-core-weston', 'weston-init']
2026-06-17 12:32:19,349 - oe-selftest - INFO -       NOTE: Runtime target '=
core-image-weston' is unbuildable, removing...
2026-06-17 12:32:19,349 - oe-selftest - INFO -       Missing or unbuildable=
 dependency chain was: ['core-image-weston', 'packagegroup-core-weston', 'w=
eston-init']
2026-06-17 12:32:19,349 - oe-selftest - INFO -       NOTE: Runtime target '=
weston-xwayland' is unbuildable, removing...
2026-06-17 12:32:19,349 - oe-selftest - INFO -       Missing or unbuildable=
 dependency chain was: ['weston-xwayland', 'weston-init']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4185

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


