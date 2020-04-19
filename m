Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.12618.1587278144173336813
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2020 23:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KXlOHefq;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id k11so7975638wrp.5
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2020 23:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnSyMcSyKyrOQC1m1v5j0ZRnx0+h10ZViEDLxoMy9e4=;
        b=KXlOHefqeCuP31gDVfkYRKez4/JMOnOpPDTmuSzrG7j1+34o80NAnMB74CIEp8+vbC
         Mq3JrkjqF1yaI4ipMgEdLT+vLL+qqJPCl2yFArpJ7IHGgoy9YiWLKn9sh2u7y6u7hnNh
         qlXziAlcdQ/hDmYsfcWRycE6eKUP9OZ3b9BRjpuOc9wfSsl9oE4agLW6Qw6AWWlunyoS
         fp/Qu7XLuTrmot7mWC/njG//d3IrBbdgilqwecq+vFvdxSujmQxGiaHIUDDPJhQr+G1M
         DI8aYW6QikNqYXVPr9z2DY3StK1jjElJGuiKMUNONoQGhJlAPuLRF/D7fSwTJ0suT55U
         xZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=gnSyMcSyKyrOQC1m1v5j0ZRnx0+h10ZViEDLxoMy9e4=;
        b=lBgeGwN7UzVYe8v8yWu62fY3rzFwZh6Qj+wgq3gekolwFUwkZQc6SK5KfljXmYVQ0T
         AXXe+KwC8epv6xQiKatxkSWVV9ZAM0jwPW5C+LoVzjlZbJXTI/qoJYSltX7ZlBwpRf2w
         6LpYCamLP8C/kdmfZ/iDfxRxAlTOTBQvduICARdQLi6it7U6d/PgjUgsorTM7MP1VeM3
         raeByObsJPs7AsyFnLvpolAUJmUIowEmp7yXilYd0odykf+d2udPnbKymPZPp9/D1guy
         dgjhzuXyjrfYBq4zQ1ZRTwOEuV2W624A2Y7hdR8s2ZQx+eo+i4zCjA1jHCOF9XZNJXmn
         iO4A==
X-Gm-Message-State: AGi0PuaA2n2+hYmHtS1aJ3+lITXusI/cxZfwj1kZGiT8dH4rPxpA+u0o
	Ltgi/c+U3IA6ZlJZRoUhV4/ji4Qar+E=
X-Google-Smtp-Source: APiQypJIsF/TBQPDHegFc2iRFZsWDppcU55R0u3R5DFu4aBXqgBtHxxHekIKugbhlPVAAm7HBU1O+Q==
X-Received: by 2002:adf:a11a:: with SMTP id o26mr12145822wro.284.1587278142042;
        Sat, 18 Apr 2020 23:35:42 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id n6sm13980266wmc.28.2020.04.18.23.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 23:35:40 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v7 00/10] Fix permissions and embed-rotofs
Date: Sun, 19 Apr 2020 08:35:28 +0200
Message-Id: <20200419063539.1467641-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Today wic behaves differently if we run it from bitbake of directly from the
commandline.

When it is run from bitbake, the permissions/usersnames are handled by the
pseudo database of the main image.

When it is run from the comandline ,it is run outside the main image database.

This results on permissions/usernames not working ok on some usecases on both
bitbake and wic.


This is an attempt to fix all the permission bugs that I am aware from wic.
Using the following usecases:


#exclude-path
part / --source rootfs --fstype=ext4 --exclude-path=home

#split_partition
part / --source rootfs --ondisk sda --fstype=ext4 --exclude-path=etc/
part /etc --source rootfs --rootfs-dir=tmp/work/qt5222-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/ --fstype=ext4

#multi_partition
part / --source rootfs --ondisk sda --fstype=ext4
part /export --source rootfs --rootfs=core-image-minimal-mtdutils --fstype=ext4


With the current master:
-------------------------
#exclude-path
From Bitbake: OK
wic cmdline: FAIL

#split_partition
From Bitbake: OK
wic cmdline: FAIL, permissions invalid on both partitions

#multi_partition
From Bitbake: FAIL second partition
wic cmdline: OK


After:  wic: Fix permissions when using exclude or include path
--------------------------------------------------------------------
#exclude-path
From Bitbake: OK
wic cmdline: OK

#split_partition
From Bitbake: OK
wic cmdline: FAIL, permissions invalid on second partition

#multi_partition
From Bitbake: FAIL second partition
wic cmdline: OK


After: wic: Fix multi images .wks with bitbake
----------------------------------------------
#exclude-path
From Bitbake: OK
wic cmdline: OK

#split_partition
From Bitbake: FAIL, permissions invalid on second partition
wic cmdline: FAIL, permissions invalid on second partition

#multi_partition
From Bitbake: OK
wic cmdline: OK



After: wic: Add --change-directory argument
--------------------------------------------

we can have a .wks like:
part / --source rootfs --ondisk sda --fstype=ext4 --exclude-path=etc/
part /etc --source rootfs --fstype=ext4 --change-directory=etc


Wich works fine from bitbake and from cmdline, and has the same functionality as
split_partition.


Changelog v6->v7 (Thanks Paul):
  - Use passwd instead of shadow for oetests
  - For pseudo folder inside workdir
  - Improve comments on tar
  - Use line number on tar name
  - Allow include-files of files in workdir

Changelog v5->v6:
  - Allow two arguments to include-path
  - Fix permission on include-path
  - exec_native with ASSUME_PROVIDED
  - More unittesting

Changelog v4->v5:
  - Add unittesting
  - wic: Avoid creating invalid pseudo directory

Ricardo Ribalda Delgado (10):
  wic: Fix permissions when using exclude or include path
  wic: Fix multi images .wks with bitbake
  wic: Add --change-directory argument
  wic: Continue if excluded_path does not exist
  wic: Avoid creating invalid pseudo directory
  oeqa: wic: Add tests for permissions and change-directory
  wic: misc: Do not find for executables in ALREADY_PROVIDED
  wic: root: Add an opt. destination on include-path
  wic: rootfs: Combine path_validation in one function
  oeqa: wic: Add more tests for include_path

 meta/classes/image_types_wic.bbclass     |   8 +-
 meta/lib/oeqa/selftest/cases/wic.py      | 153 ++++++++++++++++++++++-
 meta/recipes-core/meta/wic-tools.bb      |   2 +-
 scripts/lib/wic/help.py                  |  26 ++--
 scripts/lib/wic/ksparser.py              |   3 +-
 scripts/lib/wic/misc.py                  |  14 ++-
 scripts/lib/wic/partition.py             |  20 +--
 scripts/lib/wic/plugins/source/rootfs.py | 133 +++++++++++++++++---
 8 files changed, 318 insertions(+), 41 deletions(-)

-- 
2.25.1

