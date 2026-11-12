Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11195.1794483745306356126
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 03:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=otsTAX9/;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 09C4D4E41588;
	Thu, 12 Nov 2026 11:42:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B84AD5FF85;
	Thu, 12 Nov 2026 11:42:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A8AF11BC0505;
	Thu, 12 Nov 2026 12:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794483742; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=skiHwc2SgPxiUEJ+ZF4Tot/ZjJLViEnHJonaEZASc3Y=;
	b=otsTAX9/tg0JhDu53iUOW5kOp5EY1rhYJoiw3sbqzMaCZMucCkOR2tVUF9Fk6f2BWGVYQn
	hcB818IFySG94W6QL9cqzJq1O0befn5S0zgzJh1GDRUH3WlrBCLJsFgt+nbZHor8y0qATX
	fkJmufSg8GdOCnPnXY7cwFeUGZM86fGCQBI098eYuWamhScJ47fEJQmuKR6ztHPUDcFvez
	7YW4oQ0Ag4o+gn/ko223YbbZZPCnsdayJUqBRJv+3agIgCfgHbsgn9xpHBRt60QGQlBDUA
	v6fvyCUSFRXkyMHO2aCqXc/ec0IthRmuO9mfCFIDsyC6+8zI53moU3ZId0zpqQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 12:42:20 +0100
Message-Id: <DMT7E9PPDIER.2WUJHFY3VAJ6O@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v9 5/9] classes-recipe/deploy: Add do_deploy to
 SPDX_DEPLOY_TASKS
Cc: "Bruce Ashfield" <bruce.ashfield@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261104153535.3184146-1-JPEWhacker@gmail.com>
 <20261109194759.550935-1-JPEWhacker@gmail.com>
 <20261109194759.550935-6-JPEWhacker@gmail.com>
In-Reply-To: <20261109194759.550935-6-JPEWhacker@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 11:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250087

On Mon Nov 9, 2026 at 8:45 PM CET, Joshua Watt via openembedded-core wrote:
> Any recipe that inherits this class will automatically generate deploy
> SPDX data for the do_deploy task
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---

Hi Bruce, Joshua,

I just note this is breaking meta-virt builds:

ERROR: xen-tools-4.21.1+stable-r0 do_deploy: No deployed artifacts found in=
 /srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky-=
linux/xen-tools/4.21.1+stable/deploy-xen-tools
...
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/meta-virt/=
build/build/tmp/work/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/temp/log.=
do_deploy.2548044
NOTE: recipe xen-tools-4.21.1+stable-r0: task do_deploy: Failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/89/builds/4815

Here is the full content of the said log file:

DEBUG: Executing python function sstate_task_prefunc
DEBUG: Python function sstate_task_prefunc finished
DEBUG: Executing shell function do_deploy
NOTE: make STDVGA_ROM=3D/srv/pokybuild/yocto-worker/meta-virt/build/build/t=
mp/work/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/recipe-sysroot/usr/sha=
re/firmware/vgabios-0.8a.bin CIRRUSVGA_ROM=3D/srv/pokybuild/yocto-worker/me=
ta-virt/build/build/tmp/work/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/r=
ecipe-sysroot/usr/share/firmware/vgabios-0.8a.cirrus.bin SEABIOS_ROM=3D/srv=
/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky-linux=
/xen-tools/4.21.1+stable/recipe-sysroot/usr/share/firmware/bios.bin ETHERBO=
OT_ROMS=3D/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/x86-64=
-v3-poky-linux/xen-tools/4.21.1+stable/recipe-sysroot/usr/share/firmware/rt=
l8139.rom WGET=3D/bin/false GIT=3D/bin/false XEN_BUILD_DATE=3D2026-09-10 XE=
N_BUILD_TIME=3D10:36:15 XEN_CONFIG_EXPERT=3Dy debug=3Dn -C /srv/pokybuild/y=
octo-worker/meta-virt/build/build/tmp/work/x86-64-v3-poky-linux/xen-tools/4=
.21.1+stable/sources/xen-tools-4.21.1+stable/xen xenversion --no-print-dire=
ctory
Makefile:57: "You must use e.g. 'make menuconfig' to enable/disable debug n=
ow."
DEBUG: Shell function do_deploy finished
DEBUG: Executing python function create_deploy_spdx
ERROR: No deployed artifacts found in /srv/pokybuild/yocto-worker/meta-virt=
/build/build/tmp/work/x86-64-v3-poky-linux/xen-tools/4.21.1+stable/deploy-x=
en-tools
DEBUG: Python function create_deploy_spdx finished

So this will not block merge in oe-core, but will probably need a fix in
meta-virt.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

