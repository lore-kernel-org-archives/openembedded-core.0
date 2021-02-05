Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.1355.1612552958483607344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 11:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yq+c5E3Y;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id df22so10179064edb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 11:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rRnP0oec9hVT9SAxOZo8+Y/Ck5wHKSAunhpCLAndJu8=;
        b=Yq+c5E3YS1fAcF91ZnyYqBI3OVmUK3ZNajNOqqsAPJcktkGUjG4p36NtBYBYQgSdoZ
         B/YLg09EJbSNwBcDVGFLOepVOr0EV9OOzpEerVo7dSXSQ7YqVGeCKWYLUpjjPfNGWCXm
         pFV/0n+vwXKIlIOnjl6qQRSslBATRQjFalh56y3Wu4HBXcysLAQo7ttSaRJtamXqu8es
         0e/BTUQb8u3hzTuf1neJTRQ2mVVQFE8L3mINxl+KVq0iVDtaKFaBJOT07iNMSnceBRp1
         KZjDT35NSLUOSb/RIwj8l8TouElmBgXpzW4whHD4AZIEg2c3pEw8g2565vwBUKwXCeAQ
         Wk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rRnP0oec9hVT9SAxOZo8+Y/Ck5wHKSAunhpCLAndJu8=;
        b=FAT3Bg8XZ+Pe24lZjanTb9d8xGMLGCYzbeM+4AVI70dyYGPCtBlxUQKml5sh5OzdMT
         /ZU2xxobgNUnXf0GEtgtqMNSVuMge0AqY0BFRnZSUwlgixlgFkOIw5PIxoCEkxz/ylm5
         PBM+Hf0UhSMeS50VGZ133eAJHBGZUMk8sBp4yt/Z7sd89znZg6wGyxH8qTfkclhSoydD
         vXTgBv/dzneJm80q6y8AVWOhuE7I28Nj/uF+Y2sOhS014jFB4yc7LQ0377ySfxln5CXI
         pZ2o1JmyNLyVCFNMEHxd22rl72WvpJQ6IEBQITHd6eJEMsq6Ii6tFjsL9jH3x+hY95ds
         xGCw==
X-Gm-Message-State: AOAM530POyo3ylmpPHZ2QT1x1arN+nAKSJRT/wDzlV3R13JkEzjw6sSY
	L+a3xNZJs0krlf8hjOHLPGJQhmOzLK46Zw==
X-Google-Smtp-Source: ABdhPJyBS53v1uqpjzMjv6SBFj+G7Ib+4HU6zfkIMuUSqW25IhH6JXApNpRss0mPnPoH5LQ82TsV1w==
X-Received: by 2002:a50:f296:: with SMTP id f22mr5167370edm.159.1612552956747;
        Fri, 05 Feb 2021 11:22:36 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hb24sm2814011ejb.16.2021.02.05.11.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 11:22:35 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] image_types.bbclass: tar: use posix format instead of gnu
Date: Fri,  5 Feb 2021 20:22:34 +0100
Message-Id: <20210205192234.656624-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* gnu isn't compatible with  --xattrs used e.g. here:
https://github.com/advancedtelematic/meta-updater/blob/d3a832f66e8802cb45536ff278d5c77f946d341d/classes/image_types_ostree.bbclass#L16
causing do_image_tar failing with:

| tar: --xattrs can be used only on POSIX archives
| Try 'tar --help' or 'tar --usage' for more information.

* https://www.gnu.org/software/tar/manual/html_chapter/tar_8.html
  says about posix format:

  This is the most flexible and feature-rich format.
  It does not impose any restrictions on file sizes or file name lengths.
  This format is quite recent, so not all tar implementations are able to handle it properly.
  However, this format is designed in such a way that any tar implementation able to read `ustar'
  archives will be able to read most `posix' archives as well, with the only exception that any
  additional information (such as long file names etc.) will in such case be extracted as plain
  text files along with the files it refers to.

  This archive format will be the default format for future versions of GNU tar.

  and:

  The default format for GNU tar is defined at compilation time.
  You may check it by running tar --help, and examining the last lines of its output.
  Usually, GNU tar is configured to create archives in `gnu' format, however, future version will switch to `posix'.

* I've compared tar on centos7 and ubuntu-18.04:

bash-4.2$ cat /etc/centos-release
CentOS Linux release 7.9.2009 (Core)

bash-4.2$ tar --version
tar (GNU tar) 1.26
...

bash-4.2$ tar --help | tail -n 5
*This* tar defaults to:
--format=gnu -f- -b20 --quoting-style=escape --rmt-command=/etc/rmt
--rsh-command=/usr/bin/ssh
...

bitbake@e0ee76f81c2f:/$ grep VERSION /etc/os-release
VERSION="18.04.5 LTS (Bionic Beaver)"
VERSION_ID="18.04"
VERSION_CODENAME=bionic

bitbake@e0ee76f81c2f:/$ tar --version
tar (GNU tar) 1.29
...

bitbake@e0ee76f81c2f:/$ tar --help | tail -n 5
...
*This* tar defaults to:
--format=gnu -f- -b20 --quoting-style=escape --rmt-command=/usr/lib/tar/rmt
--rsh-command=/usr/bin/rsh

Both support posix format (as pax POSIX 1003.1-2001). But centos7 version is
already too old anyway, because it doesn't support --sort=name used since:
https://git.openembedded.org/openembedded-core/commit/?id=4fa68626bbcfd9795577e1426c27d00f4d9d1c17
and
https://git.openembedded.org/openembedded-core/commit/?id=f19e43dec63a86c200e04ba14393583588550380
says that 1.28 is the minium version now and
https://git.openembedded.org/openembedded-core/commit/?id=7a66434cf11b7f051699b774e4fccd6738351368
recommends to use install-buildtools for hosts with tar < 1.28

On the other side latest tumbleweed from:
https://hub.docker.com/r/opensuse/tumbleweed
with tar-1.33 alredy defaults to posix format:

b99dbb3d86dd:/ # head -n 3 /etc/os-release
NAME="openSUSE Tumbleweed"
ID="opensuse-tumbleweed"

b99dbb3d86dd:/ # tar --version
tar (GNU tar) 1.33
...

b99dbb3d86dd:/ # tar --help | tail -n 3
*This* tar defaults to:
--format=posix -f- -b20 --quoting-style=escape --rmt-command=/usr/bin/rmt
--rsh-command=/usr/bin/ssh

I've packaged some sample rootfs directory with both tars and the result is
identical (with --format=gnu as well as --format=posix).

with ubuntu:
tar --sort=name --format=gnu --numeric-owner -cf rootfs.ubuntu.gnu.tar -C rootfs .
tar --xattrs --xattrs-include=* --sort=name --format=posix --numeric-owner -cf rootfs.ubuntu.posix.tar -C rootfs .
tumbleweed:
tar --sort=name --format=gnu --numeric-owner -cf rootfs.tumbleweed.gnu.tar -C rootfs .
tar --xattrs --xattrs-include=* --sort=name --format=posix --numeric-owner -cf rootfs.tumbleweed.posix.tar -C rootfs .
centos7 (without --sort=name):
tar --format=gnu --numeric-owner -cf rootfs.centos7.gnu.tar -C rootfs .
tar --xattrs --xattrs-include=* --format=posix --numeric-owner -cf rootfs.centos7.posix.tar -C rootfs .

size is identical:
-rw-r--r-- 1 mjansa mjansa 2487480320 Feb  5 09:19 rootfs.ubuntu.gnu.tar
-rw-r--r-- 1 mjansa mjansa 2487480320 Feb  5 10:17 rootfs.centos7.gnu.tar
-rw-r--r-- 1 mjansa mjansa 2487480320 Feb  5 10:26 rootfs.tumbleweed.gnu.tar
-rw-r--r-- 1 mjansa mjansa 2579875840 Feb  5 10:15 rootfs.ubuntu.posix.tar
-rw-r--r-- 1 mjansa mjansa 2579875840 Feb  5 10:16 rootfs.centos7.posix.tar
-rw-r--r-- 1 mjansa mjansa 2579875840 Feb  5 10:26 rootfs.tumbleweed.posix.tar

but md5s aren't:
5e3880283379dd773ac054e20562fdea  rootfs.centos7.gnu.tar
abeaf992c780aa780a27be01365d26f5  rootfs.centos7.posix.tar
0c6ee59d87ab56583293262de110bca4  rootfs.tumbleweed.gnu.tar
1555bc7276eaba924bf82a13a010fd6d  rootfs.tumbleweed.posix.tar
553d802bba351e273191bd5b2a621b66  rootfs.ubuntu.gnu.tar
b6d7b43b30174686f6625ba3c7aefdc6  rootfs.ubuntu.posix.tar

diffoscope shows some differences when using gnu format:

$ diffoscope rootfs.tumbleweed.gnu.tar rootfs.ubuntu.gnu.tar
...
-00239890: 3030 3000 3030 3737 3637 0020 4b00 0000  000.007767. K...
+00239890: 3030 3000 3031 3135 3737 0020 4b00 0000  000.011577. K...
...
-00239900: 0075 7374 6172 2020 0000 0000 0000 0000  .ustar  ........
+00239900: 0075 7374 6172 2020 0072 6f6f 7400 0000  .ustar  .root...
...
-00239920: 0000 0000 0000 0000 0000 0000 0000 0000  ................
+00239920: 0000 0000 0000 0000 0072 6f6f 7400 0000  .........root...

with posix format there are also some differences shown by diffoscope:

$ diffoscope rootfs.tumbleweed.posix.tar rootfs.ubuntu.posix.tar
 016a4c00: 2e2f 7573 722f 6269 6e2f 5061 7848 6561  ./usr/bin/PaxHea
-016a4c10: 6465 7273 2f63 6861 7474 722e 6532 6673  ders/chattr.e2fs
-016a4c20: 7072 6f67 7300 0000 0000 0000 0000 0000  progs...........
+016a4c10: 6465 7273 2e32 322f 6368 6174 7472 2e65  ders.22/chattr.e
+016a4c20: 3266 7370 726f 6773 0000 0000 0000 0000  2fsprogs........
...
 03937000: 2e2f 7573 722f 6269 6e2f 5061 7848 6561  ./usr/bin/PaxHea
-03937010: 6465 7273 2f63 6f6e 7461 696e 6572 642d  ders/containerd-
-03937020: 6374 7200 0000 0000 0000 0000 0000 0000  ctr.............
+03937010: 6465 7273 2e32 322f 636f 6e74 6169 6e65  ders.22/containe
+03937020: 7264 2d63 7472 0000 0000 0000 0000 0000  rd-ctr..........

so cannot really say which format is better for reproducible tar
archives from different distros, but posix at least supports xattrs
and it's the format for future.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 76949d1051..8028691405 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -110,7 +110,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=gnu --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=posix --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.27.0

