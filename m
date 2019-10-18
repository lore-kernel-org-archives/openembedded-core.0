Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5487F6A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 20:26:37 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id a1so8955735ioc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2019 13:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=7H44wj1UhDnfcdoeDs3QOI8PfDt3PBat3je13tFzKns=;
	b=Kq7QHeiRAN1Xa3CqiVJeCtlYYEc9VZ2gw2XDJaXerDpCRwAdQS4sRm/GcLuE0GP3X0
	QprC0y1S5I5OIO03W+3QUyFwf7Ln4z2c+5BO8Jq46yCRrQlg7y9fPmnbfBVjPfa9bvx1
	5crkTjM0dAQTvvSD/s2Qjd88pLLJlYmNEGutSoKye0KeMQscF0ptvMrOkjx56pWHLUle
	nlpnbqQ1XnauUTgZw8xvJS/SC4TgewwhjeseKG3NoSYYEldNX34SqOcaglVGtxfDqbO9
	p5+JCh+kO1edjJJijDlFG5hT187XheuGVCrQtViRAkjqddLqGrZa2ynpxff4Cg3ossN9
	OqnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=7H44wj1UhDnfcdoeDs3QOI8PfDt3PBat3je13tFzKns=;
	b=GH/hpXoC7XoUcnupsZ7doXZYrh6BT0Q0LynXqcwWftKi1ZEPKorMnUXIoWC2qeW1nK
	IuuN4E0PVAnr1zmj4Cgu5mLapPiG/uDsq/F72UPufiI3pgbeX2lESMmPpE9OChD4ga7M
	Hy6uFwXu5alOORJP15CQOy/GyobfHIKJteNu5XD1KctmD3JleeHPxxYD/kX/IeQPl/zL
	FQ3LOafmGMIhrU94d1R6BlYHPbU+LBv65LaXNax5vm8hB5HPnukys7MwFnTSdARLZMsS
	WrDbNZL9rDvWMe6iw7+vM/hSRn2bTa1lV/4GMXUIX067MUdjCQq2oKzX0g/OBHjyXBd2
	lWBg==
X-Gm-Message-State: APjAAAUYBziiVax5scrqQ5E6y+DVc1Pdo0xVe8v1qTsRKEjDEPqzdAYQ
	6xaWutDVbgZuHQ6HJtgGt5iUooYaBYJ28EGD/1UpRiW/
X-Google-Smtp-Source: APXvYqyN3/W5MI9f+mkP066PtB3E7wkhsaXSEpZMI0OEPVS1GEJsR+U8ywXlbIncTAA4DaGYaL6LNu6ztM58QpSwsUY=
X-Received: by 2002:a6b:7414:: with SMTP id s20mr10617058iog.299.1571430398368;
	Fri, 18 Oct 2019 13:26:38 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 18 Oct 2019 22:26:27 +0200
Message-ID: <CALbNGRQ2AFU9P-oBLg=L0bYvjBO=SiAQZMCkYsVEvwDhJq04zg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: do_rootfs broken
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2019 20:26:37 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Updated oe-core from
commit 9973f89dafdf9d21f4021f59f1f4669f4ac13aff
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Fri Sep 27 14:42:51 2019 +0800

    systemd: fix NFS regression

To

Author: Khem Raj <raj.khem@gmail.com>
Date:   Sat Oct 12 17:51:17 2019 -0700

    glib-2.0: Fix build with clang compiler

and reverted meson 0.52.0 upgrade. All recipes build without issues
but do_rootfs fails with:

NOTE: > Executing update_pixbuf_cache intercept ...
NOTE: Exit code 1. Output:
+ '[' True = False -a qemuwrapper-cross '!=' nativesdk-qemuwrapper-cross ']'
+ qemu-arm -r 3.2.0 -E
LD_LIBRARY_PATH=/home/superandy/tmp/oe-core-glibc/work/raspberrypi3-mortsgna-linux-gnueabi/allgui-full-image/1.0-r0/rootfs/usr/lib:/home/superandy/tmp/oe-core-glibc/work/raspberrypi3-mortsgna-linux-gnueabi/allgui-full-image/1.0-r0/rootfs/lib
-L /home/superandy/tmp/oe-core-glibc/work/raspberrypi3-mortsgna-linux-gnueabi/allgui-full-image/1.0-r0/rootfs
/home/superandy/tmp/oe-core-glibc/work/raspberrypi3-mortsgna-linux-gnueabi/allgui-full-image/1.0-r0/rootfs/usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders

ERROR: The postinstall intercept hook 'update_pixbuf_cache' failed,
details in /home/superandy/tmp/oe-core-glibc/work/raspberrypi3-mortsgna-linux-gnueabi/allgui-full-image/1.0-r0/temp/log.do_rootfs
DEBUG: Python function do_rootfs finished

Tried already to revert
commit 3ecb6744402332f1ad143eb1eb6a94143e1700c8
Author: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Date:   Fri Oct 11 08:03:57 2019 +0200

    runqemu: Remove disabling of high resolution timer

but that did not change anything.

Any ideas / suggestions?

Andreas

