Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82911CF6BF4
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 07:36:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1068.1767771390836349317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 23:36:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=2alXVTKy;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id BB0721A26C5
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 07:36:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 892FA606F8;
	Wed,  7 Jan 2026 07:36:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F358103C868C;
	Wed,  7 Jan 2026 08:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767771388; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MSovEb3JvltjAseE0XmxKQ6InobQ8HI05dan1yHCx4o=;
	b=2alXVTKyQILCKa96cPVj5k19vu2lCnUhWoc5dxGRiO8PKQSdYGVVAlspUcWX5mzD/DfYJ3
	h4VmarrEbevqZzTnJle3Xsi0tq6lQLX1Mk3jS8AfsgypZ5nvUrZ0/VxR6UYHNsP9wr3Bms
	41+8fWgDiBW3XjQ9fpIeJVz4mgDEEirOAakEd5pqu2AqSxw0TNBxJcUX+dnrUCntJCKvN4
	j5gCemv4rwCQHJjIO2jeehv8r8brKS9XSOHqOkcropBtsFmmBMLGYZ8yDMwRQyog6gtilP
	GUB0ylQhbWnqy1/INH6nD4sodm/0t3UtiaJ9A2MmM43c5xeF+0/2EpuHUeoZpg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 08:36:24 +0100
Message-Id: <DFI6NN0QIZ3A.L7PFVIMU3NYH@bootlin.com>
Subject: Re: [OE-core] [PATCH] Fix create_merged_usr_symlinks in
 populate_sdk_base.bbclass and image.bbclass
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <yw.byun@lge.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260105025050.153889-1-yw.byun@lge.com>
In-Reply-To: <20260105025050.153889-1-yw.byun@lge.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 07:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228946

On Mon Jan 5, 2026 at 3:50 AM CET, Yangwoo Byun via lists.openembedded.org =
wrote:
> Modifying FILESYSTEM_PERMS_TABLES does not change the UID and GID of
> /usr/bin.
> To change the UID and GID of /usr/bin in FILESYSTEM_PERMS_TABLES to
> something other than root:root, we need to modify
> the create_merged_usr_symlinks function.
> The ":append" method allows us to apply changes inserted in the middle
> by applying the create_merged_usr_symlinks function at the end of
> the execution order.
>
> Signed-off-by: Yangwoo Byun <yw.byun@lge.com>
> ---

Hi Yangwoo,

Thanks for your patch.

It looks like some image tests are broken by this patch. We get the
following error on the autobuilder:

RESULTS - parselogs.ParseLogsTest.test_parselogs: FAILED (9.86s)
RESULTS - systemd.SystemdBasicTests.test_systemd_failed: FAILED (3.69s)
...
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded=
-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded=
-core/meta/lib/oeqa/runtime/cases/parselogs.py", line 185, in test_parselog=
s
    self.assertEqual(errcount, 0, msg=3Dself.msg)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: 6 !=3D 0 : Log: /srv/pokybuild/yocto-worker/qemuarm64-alt/b=
uild/build/tmp/work/qemuarm64-poky-linux/core-image-full-cmdline/1.0/target=
_logs/dmesg_output.log
-----------------------
Central error: [    4.807586] systemd[1]: proc-fs-nfsd.mount: Failed with r=
esult 'exit-code'.
***********************
[    4.728367] EXT4-fs (vda): re-mounted 584f5c6c-2ed1-4b79-88be-411c0a8219=
1d.
[    4.750313] systemd[1]: Mounted POSIX Message Queue File System.
[    4.757693] systemd[1]: Mounted Kernel Debug File System.
[    4.760539] systemd[1]: Mounted Kernel Trace File System.
[    4.762862] systemd[1]: Mounted Temporary Directory /tmp.
[    4.774041] systemd[1]: modprobe@configfs.service: Deactivated successfu=
lly.
[    4.788111] systemd[1]: Finished Load Kernel Module configfs.
[    4.796349] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    4.800731] systemd[1]: Finished Load Kernel Module fuse.
[    4.806094] systemd[1]: proc-fs-nfsd.mount: Mount process exited, code=
=3Dexited, status=3D32/n/a
[    4.807586] systemd[1]: proc-fs-nfsd.mount: Failed with result 'exit-cod=
e'.
[    4.809202] systemd-journald[129]: Collecting audit messages is disabled=
.
[    4.811318] systemd[1]: Failed to mount NFSD configuration filesystem.
[    4.813837] systemd[1]: Dependency failed for NFS Mount Daemon.
[    4.815101] systemd[1]: Dependency failed for NFS server and services.
[    4.818094] systemd[1]: nfs-server.service: Job nfs-server.service/start=
 failed with result 'dependency'.
[    4.819597] systemd[1]: nfs-mountd.service: Job nfs-mountd.service/start=
 failed with result 'dependency'.
[    4.825984] systemd[1]: Finished Generate network units from Kernel comm=
and line.
[    4.834216] systemd[1]: Finished Remount Root and Kernel File Systems.
[    4.838363] systemd[1]: Finished Apply Kernel Variables.
[    4.842779] systemd[1]: Finished Load udev Rules from Credentials.
...
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded=
-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded=
-core/meta/lib/oeqa/runtime/cases/systemd.py", line 100, in test_systemd_fa=
iled
    output +=3D self.systemctl('status --full --failed')
              ~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded=
-core/meta/lib/oeqa/runtime/cases/systemd.py", line 26, in systemctl
    self.assertEqual(status, expected, message)
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^
AssertionError: 3 !=3D 0 : SYSTEMD_BUS_TIMEOUT=3D240s systemctl status --fu=
ll --failed
=C3=97 proc-fs-nfsd.mount - NFSD configuration filesystem
     Loaded: loaded (/usr/lib/systemd/system/proc-fs-nfsd.mount; static)
     Active: failed (Result: exit-code) since Tue 2026-01-06 10:14:07 UTC; =
1min 19s ago
 Invocation: acc2ccd9d93947c9a38972cb1cf129f8
      Where: /proc/fs/nfsd
       What: nfsd
   Mem peak: 1M
        CPU: 91ms

https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2958
https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2947

This can be reproduced adding `IMAGE_CLASSES +=3D "testimage"` to your
configuration with qemux86 or qemuarm64 MACHINE and poky-altcfg DISTRO.
Then just `bitbake core-image-full-cmdline && bitbake
core-image-full-cmdline:do_testimage` should be enough.

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


