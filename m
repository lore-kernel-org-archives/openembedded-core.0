Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.11162.1586871382263875869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 06:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kdaMxmyq;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id f8so9371071lfe.12
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=N2Gu+RtrG7YGkOY4HlNiXa2EgSU88cm8+zM11PBI+hY=;
        b=kdaMxmyqt7tSaJq2a1uOE49UDZQht28WXdXtNPr8AGtaM7tgr6o9pea8VvHGUP4qvj
         kwFxR5hJjlhrwbSZnlB03+506itCQj6uHQr7rnQpLwZFn9K5/RXNy7aif4XAR8NENCfn
         HuM0QsWY2hD8nb9RMC/CdJOHGXmRamrhN3Fb7xvrzFyhORn92zKOfNXsBcaS0cidUf+V
         W4+N2n1jjusvfQtJ7sA1K/7o8I4WZ1IpEwl/r8YjCgP0VmmOR8lb9Qhaff9cAhlMKQ/g
         WhFrCgC6XKeNpY+4fd1n8bGD49Z7+S+oX0iFI0CVjrnpxI5S5V9sLAYgeH9CNRd7R/S7
         y25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=N2Gu+RtrG7YGkOY4HlNiXa2EgSU88cm8+zM11PBI+hY=;
        b=H6X1vceYfCBN9M2TTsX16HRbqXnUV8Hw/CUU80HfXmL9k1W+Ae5gzcUTl7yGyvzCpO
         cYB7x0Z3AxMrKAnDShFV78U9VQdaVVwAnj3U29m1oSvloWIfzxZV6b9PGrBuflK6cq9R
         E/+/QZ20P1m4uwB8oedhpH5u1aX2OmwEAu/Uss6hiZGGCGzCKO00vy+7DdPg2vI4ZGvg
         nbAG9zV+d0oCT4JrmMAt/w8S8udQs2FCPQlQh1zLsdlbGX+qx3hivXQN9tAQ+4nIbeC1
         dnadj6aWi6D7tUKrkRp9EANiP7pntywBb8KZnQ6XcEsCNhrbVDj9em+ATyALtn7tZ1pa
         813w==
X-Gm-Message-State: AGi0PuYsX5oAWQxoft6az6sYtQHbmkmHa/f+xfk6oW+6/WX4wB0J31ym
	x9teDROebwnzw/SbeQrWpBlceoVec/k=
X-Google-Smtp-Source: APiQypLEWapn6OeT96HvyPa46CYZc1Jzwc3j0wjDlxo1TNJbugqQkIyoXmTWoecPt4pLtti2MEl86g==
X-Received: by 2002:a19:a401:: with SMTP id q1mr7274575lfc.34.1586871379748;
        Tue, 14 Apr 2020 06:36:19 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id o6sm9218344lji.15.2020.04.14.06.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 06:36:18 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v6 00/10] Fix permissions and embed-rotofs
Date: Tue, 14 Apr 2020 15:36:04 +0200
Message-Id: <20200414133614.1830058-1-ricardo@ribalda.com>
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
 meta/lib/oeqa/selftest/cases/wic.py      | 155 ++++++++++++++++++++++-
 meta/recipes-core/meta/wic-tools.bb      |   2 +-
 scripts/lib/wic/help.py                  |  26 ++--
 scripts/lib/wic/ksparser.py              |   3 +-
 scripts/lib/wic/misc.py                  |  14 +-
 scripts/lib/wic/partition.py             |  20 +--
 scripts/lib/wic/plugins/source/rootfs.py | 126 +++++++++++++++---
 8 files changed, 313 insertions(+), 41 deletions(-)

-- 
2.25.1

