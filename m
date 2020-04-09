Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.12046.1586447576636929770
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 08:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SVcAdg6G;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id f20so253304wmh.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 08:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Erg++gvtvqj53/rYWCYg7GVGReAOPoMHCFJrPl/j9ws=;
        b=SVcAdg6GN93bfz+/F/JYTy8svC5pxe4sAg3XhQRC/tCQ/j0GlcGtHuNo09Zmmv6iqA
         fdcOcjxGjgyn66AyM5jI+Las9Jm1ucbTYCdstWw3z2FYuztBrCyNMG9EdPdzJ9oQauh+
         Gea9PuTaJMjp/xylAYszwy9U9OZUwCtF914MgKewheuQKdgD46uNwzwWUkFmQ9bdQIxD
         A1NI9sIgAX8svIjHqNvwYqQbhOmXjWhmZ+AFccYw2rh52ozgVH07cUDfmsirvzYtoD6N
         l9FlJykWSUy6ozshR3yfLSGd+cRltwafy7bNxceIdNLH8kkZyRavcte1LPd7S0LRms4Z
         sPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=Erg++gvtvqj53/rYWCYg7GVGReAOPoMHCFJrPl/j9ws=;
        b=VYb6zgbTAOGmjV/C9D4IZExtE/E4fm6o7bWuBURJN/H1Wf8C/Koi3vXzTdy4SgZu/E
         JQXyldZRj3X+dJPKECev1TvRnGHhle4/XUJXNIbv0LcqwUFuml42nz4KnhLLN2yN0y3S
         YI/fz8q8qvpPXNhVUFroBOYCTPQ8T71mgArlJNJGDnIr8UUTjOjTSPsmvpSzWv2rtvUl
         CsFKUjCpUHzQ/W3RJB5vXroOHHx/Id8oJ+cqH7NPQe6N7yqzAoqBteNiHjSkFQbE8A0C
         t7SdzQ316vdLRgwCm+hnF9/abwQkyFtbjBXBOXIRWp2YPRb41zkefyth+qhz3rX9oDBR
         xZtA==
X-Gm-Message-State: AGi0PuYEK9L3uuPTzs39891oWoP/rhd+d4I1jRuwsCwx4MkB8tcLGdyI
	c2nDnWuhu++1OgjZ1wu2nHdhoUORKJg=
X-Google-Smtp-Source: APiQypKp+Y08jUayPoIMlAj+FlHsBmY0EEU4nap+VmMWqMyJTUiq4//T0LpD7FrcgaWsQatDORYfIg==
X-Received: by 2002:a1c:51:: with SMTP id 78mr474594wma.157.1586447574434;
        Thu, 09 Apr 2020 08:52:54 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id t67sm4253635wmt.48.2020.04.09.08.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 08:52:53 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v5 0/6] wic: Fix permissions
Date: Thu,  9 Apr 2020 17:52:45 +0200
Message-Id: <20200409155251.982424-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi

Today wic behaves differently if we run it from bitbake of directly from the
commandline.

When it is run from bitbake, the permissions/usersnames are handled by the 
pseudo database of the main image.

When it is run from the comandline , it is run outside the main image database.

This results on permissions/usernames not working ok on some usecases on both
bitbake and wic.


This is an attempt to fix all the permission bugs that I am aware from wic.
Using the following usecases


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


After:  wic: Fix permissions when using exclude or include path
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
part /etc --source rootfs --fstype=ext4 --change-directory=/etc


Wich works fine from bitbake and from cmdline, and has the same functionality as
split_partition.


Changelog v4->v5:
  - Add unittesting
  - wic: Avoid creating invalid pseudo directory

Ricardo Ribalda Delgado (6):
  wic: Fix permissions when using exclude or include path
  wic: Fix multi images .wks with bitbake
  wic: Add --change-directory argument
  wic: Continue if excluded_path does not exist
  wic: Avoid creating invalid pseudo directory
  oeqa: wic: Add tests for permissions and change-directory

 meta/classes/image_types_wic.bbclass     |  8 ++-
 meta/lib/oeqa/selftest/cases/wic.py      | 91 ++++++++++++++++++++++++
 scripts/lib/wic/help.py                  |  6 ++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             | 20 +++---
 scripts/lib/wic/plugins/source/rootfs.py | 52 ++++++++++++--
 6 files changed, 162 insertions(+), 16 deletions(-)

-- 
2.25.1

