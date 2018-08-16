Return-Path: <ssshukla26@gmail.com>
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
	[209.85.222.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC4C7925B
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 07:12:33 +0000 (UTC)
Received: by mail-ua1-f47.google.com with SMTP id w7-v6so3060806uan.9
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 00:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=N1K1e7b4ArDi4SZ7KBG9uu9RUS+1RsqYoUDQbqDJbQk=;
	b=uAeFI9CDrsGQtS2YSXZJRSqTH+LT6f3KjB5l5ql9cnxmRmWkdqj+mpPDhu/K8/sba9
	DOT4k7Gb21uLzcAj0uyqrHHhF6ddRH7oONeS/0L4o4Oe6y24gz5sO7KIj6G0MDOPvIO6
	k3p95X2GFzBIafQ1IXZ+N2azrfSQb1oJo3xyuZeXQXuSQJj8QdYWgQ1aW0gmcloLd0hP
	LIt74VoTtyPW2Cb5SrzXUc1jGcaYH+9H8TftCudRQ0JH7PS06JbFtRHoKov2/X/17Jpi
	qfSwYaRnzmLYezamCywrwhw5OOKhqrHgnXZN2iawUEkSQJBDssbTy4F8PJkjjlLEnCam
	XPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=N1K1e7b4ArDi4SZ7KBG9uu9RUS+1RsqYoUDQbqDJbQk=;
	b=p2osh/VQF9c1U7vjUKD/VxJpuaoS0fEWz7NYnMbJ0Qhse2gQIrCoyZtCA41xw3Zd+s
	AyhI2DM15ytyJxe82UnPO+IgvqUiMaaxzGzyvLHcHVXSSyOAt4jJ8n3M32q0gyuA5Zcw
	AXHFlJ6gy3f2AsLuUaf/6F2msjMU1jP/KN86u9t89D5dOYC604hVmuCNBESmqWee1RFE
	3bKx4p9yA3G7nwiTUn6mlLsodTYoVfihwBLvGC2v4rdhVMkI8KQFemqUEe2pQr50Lr5D
	VJE6TQ3trWFmsHDdpcoDcewqfBdbdrpQXqbogitV82AQ+AbrKRZ4RFTGFAysSO/G5K5P
	lGcg==
X-Gm-Message-State: AOUpUlFYi3vM5zXR7f6KVpJkf1raUe1mqenpC/Z7Tj3PoWe8TiEBnkdp
	4tvms7Np+6VocNEsfZw7ZZ18ziThikIaQmy/wF+qrDcq
X-Google-Smtp-Source: AA+uWPxuBsOndWdTJ//iMEWqRYKtt2XSmr2FjE57tHK+SEAjcUk75ah4tgIxU1/Vl2McXQf5KjlNpZ5KtyjXztZiwBo=
X-Received: by 2002:ab0:7253:: with SMTP id
	d19-v6mr18742899uap.99.1534403553977; 
	Thu, 16 Aug 2018 00:12:33 -0700 (PDT)
MIME-Version: 1.0
From: Sunny Shukla <ssshukla26@gmail.com>
Date: Thu, 16 Aug 2018 12:42:22 +0530
Message-ID: <CAH4qu14LEam1dM0L6kKrKyhd0DPsSs=eHX7YTyoi60uEE_CDFw@mail.gmail.com>
To: Openembedded-core@lists.openembedded.org
Subject: Libs compiled using Yocto has incorrect version appended to their names
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
X-List-Received-Date: Thu, 16 Aug 2018 07:12:33 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

We are using Rocko build for our am335x starter kit. While building
core-image-minimal (rootfs) we are facing a strange problem, some of
the libs we have included are getting build but the version appended
to libs names are not proper, as shown in the examples below.

1) Building eventlog

BB file: "./sources/meta-openembedded/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb"

Lib formed after compiling (under rootfs folder)

sudo find . -name "*evt*"
./usr/lib/libevtlog.so.0.0.0
./usr/lib/libevtlog.so.0

ls -l ./usr/lib/libevtlog.so*
lrwxrwxrwx 1 root root 18 Aug 6 15:36 ./usr/lib/libevtlog.so.0 ->
libevtlog.so.0.0.0
-rwxr-xr-x 1 root root 13840 Aug 6 15:36 ./usr/lib/libevtlog.so.0.0.0

Here the version number appended after libevtlog.so under "./usr/lib/"
is 0.0.0 instead of 0.2.13 which is the version number of the package
as described by BB file eventlog_0.2.13.bb.

2) Building libffi

BB file: "./sources/oe-core/meta/recipes-support/libffi/libffi_3.2.1.bb"

Lib formed after compiling (under rootfs folder)

sudo find . -name "*libffi*"
./usr/lib/libffi.so.6.0.4
./usr/lib/libffi.so.6

ls -l ./usr/lib/libffi.so*
lrwxrwxrwx 1 root root 15 Jul 23 12:18 ./usr/lib/libffi.so.6 -> libffi.so.6.0.4
-rwxr-xr-x 1 root root 26220 Jul 23 12:18 ./usr/lib/libffi.so.6.0.4

Here the version number appended after libffi.so under "./usr/lib/" is
6.0.4 instead of 3.2.1 which is the version number of the package as
described by BB file libffi_3.2.1.bb.

3) Building libgcrypt

BB file: "./sources/oe-core/meta/recipes-support/libgcrypt/libgcrypt_1.8.0.bb"

Lib formed after compiling under rootfs

sudo find . -name "*gcrypt*"
./usr/lib/libgcrypt.so.20
./usr/lib/libgcrypt.so.20.2.0

ls -l ./usr/lib/libgcrypt.so*
lrwxrwxrwx 1 root root 19 Aug 6 20:24 ./usr/lib/libgcrypt.so.20 ->
libgcrypt.so.20.2.0
-rwxr-xr-x 1 root root 803960 Aug 6 20:24 ./usr/lib/libgcrypt.so.20.2.0

Here the version number appended after libgcrypt.so under "./usr/lib/"
is 20.2.0 instead of 1.8.0 which is the version number of the package
as described by BB file libgcrypt_1.8.0.bb.

4) Building opkg

BB file: "./sources/oe-core/meta/recipes-devtools/opkg/opkg_0.3.5.bb"

Lib formed after compiling under rootfs

sudo find . -name "*opkg*"
./usr/bin/opkg-check-config
./usr/bin/opkg
./usr/share/opkg
./usr/lib/libopkg.so.1
./usr/lib/libopkg.so.1.0.0
./usr/lib/opkg
./var/lib/opkg
./var/cache/opkg
./lib/systemd/system/opkg-configure.service
./etc/opkg
./etc/opkg/opkg.conf

ls -l ./usr/lib/libopkg.so*
lrwxrwxrwx 1 root root 16 Aug 9 14:46 ./usr/lib/libopkg.so.1 -> libopkg.so.1.0.0
-rwxr-xr-x 1 root root 143316 Aug 9 14:46 ./usr/lib/libopkg.so.1.0.0

Here the version number appended after libopkg.so under "./usr/lib/"
is 1.0.0 instead of 0.3.5 which is the version number of the package
as described by BB file opkg_0.3.5.bb.

5) Building libarchive

BB file: "./sources/oe-core/meta/recipes-extended/libarchive/libarchive_3.3.2.bb"

Lib formed after compiling under rootfs

sudo find . -name "*libarchive*"
./usr/lib/libarchive.so.13
./usr/lib/libarchive.so.13.3.2

ls -l ./usr/lib/libarchive.so*
lrwxrwxrwx 1 root root 20 Aug 3 15:09 ./usr/lib/libarchive.so.13 ->
libarchive.so.13.3.2
-rwxr-xr-x 1 root root 568860 Aug 3 15:09 ./usr/lib/libarchive.so.13.3.2

Here the version number appended after libarchive.so under
"./usr/lib/" is 3.3.2 which is same as that of 3.3.2 version number of
the package as described by BB file libarchive_3.3.2.bb.

In all of the above examples from number 1 to 4, the name of shared
object files has a version number not matching the version number of
BB files. We have tried to use LEAD_SONAME and DEBIANNAME_${PN}
variables in related BB files but still, we didn't get the desired
versions appended to the libs created.

For example, we want the following output (similar to that of example 5)

For Building eventlog

BB file: "./sources/meta-openembedded/meta-oe/recipes-support/eventlog/eventlog_0.2.13.bb"

Lib formed after compiling under rootfs should be as follows

sudo find . -name "*evt*"
./usr/lib/libevtlog.so.0.2.13
./usr/lib/libevtlog.so.0

ls -l ./usr/lib/libevtlog.so*
lrwxrwxrwx 1 root root 18 Aug 6 15:36 ./usr/lib/libevtlog.so.0 ->
libevtlog.so.0.2.13
-rwxr-xr-x 1 root root 13840 Aug 6 15:36 ./usr/lib/libevtlog.so.0.2.13

As described above, one can notice that what we need is that the
version appended after libevtlog.so (libevtlog.so.0.2.13) in
"./usr/lib/" is same as that of the version of the BB file
eventlog_0.2.13.bb. We are unable to achieve this. Let us know what
are we missing for the same.

Regards,
Sunny.

