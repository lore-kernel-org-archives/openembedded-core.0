Return-Path: <edwin@etorok.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22734ECAAD5
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 18:15:44 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.51696.1661624138389568977
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 11:15:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@etorok.net header.s=gm1 header.b=jI0C0gxc;
 spf=pass (domain: etorok.net, ip: 217.70.178.232, mailfrom: edwin@etorok.net)
Received: (Authenticated sender: edwin@etorok.net)
	by mail.gandi.net (Postfix) with ESMTPSA id F24FA200002
	for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Aug 2022 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etorok.net; s=gm1;
	t=1661624136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kl3imrzlJvlRKK1kENO9OM5iOwUzggOIdQxvi/JQzSo=;
	b=jI0C0gxcg/zIsBfVmQeegQk/xAsF6A2hS9GZlGtXbChfowdZkhCktkvg74CmE+a1AS4T44
	5uLsWUIJnJ3YZDb/EjiDWH2HvDpoUeJzfMUvm236gkDl8BY84m4d1uO9qow7pNpgZoaf+x
	wk2RfndAzqN5vPlPexFT6Etm1rY5Je0K/eBkX1B9Z6I4TkqjabpWu3WuLTViBWeihA4B80
	FhdP+TtxWo8u3YFCFNmBSere6sRz0HF4nYThoMh/Qu6oo3xr1UYW2aQzJYvhn/EXAHONgB
	TFTt3NCzxqkoYHi621claJYFzzb9OU9MhxNi7LanuYeVOIq+2ERgkOF6sGD24Q==
Message-ID: <2ed08c8656181cf2b4495978e28e70c5274fb7e7.camel@etorok.net>
Subject: [PATCH] xz: do not OOM with 3x builds, lower memlimit
From: Edwin =?ISO-8859-1?Q?T=F6r=F6k?= <edwin@etorok.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Aug 2022 19:15:34 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Aug 2022 18:15:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169939

By default a build such as [1] might run 3 'xz' in parallel:
```
Currently=C2=A0 3 running tasks (11878 of 11883)=C2=A0 99%
|######################################################################
#### |
0: demo-coreip-xfce4-1.0-r0 do_image_ext4 - 3m17s (pid 2088739)
1: demo-coreip-xfce4-1.0-r0 do_image_tar - 3m16s (pid 2088743)
2: demo-coreip-xfce4-1.0-r0 do_image_wic - 3m16s (pid 2088745)
```

However the default memory usage limit of `xz` is 50% each, so this
will
attempt to use 150% memory, and it gets OOM killed by systemd-oomd on
Fedora 36.
```
Aug 27 18:38:57 fedora systemd-oomd[3150]: Killed
/user.slice/user-1000.slice/user@1000.service/app.slice/app-
org.gnome.Terminal.slice/vte-spawn-2d92eb7b-b005-41b4-a786-
fc8c0d360ce3.scope due to memory used (66890584064) / total
(67332812800) and swap used (7744446464) / total (8589930496) being
more than 90.00%
```

Even with systemd-oomd turned off it'd eventually start swapping
heavily
on a system with 64GiB of physical memory and 8GiB of swap.

Reduce memory limit on xz so that we can run 3 in parallel without
driving the host close to or OOM. 25% seems to work on this particular
build and allows it to complete successfully.

[1] https://github.com/sifive/freedom-u-sdk/tree/2022.06.00

Signed-off-by: Edwin T=C3=B6r=C3=B6k <edwin@etorok.net>
---
=C2=A0meta/conf/bitbake.conf | 3 ++-
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2a3cf6f8aa..48ba52c12c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -857,7 +857,8 @@ BB_NUMBER_THREADS ?=3D "${@oe.utils.cpu_count()}"
=C2=A0PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"
=C2=A0
=C2=A0# Default parallelism and resource usage for xz
-XZ_MEMLIMIT ?=3D "50%"
+# A build might run 3 'xz' in parallel, so don't exhaust memory
+XZ_MEMLIMIT ?=3D "25%"
=C2=A0XZ_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
=C2=A0XZ_THREADS[vardepvalue] =3D "1"
=C2=A0XZ_DEFAULTS ?=3D "--memlimit=3D${XZ_MEMLIMIT} --threads=3D${XZ_THREAD=
S}"


