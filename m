Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.6448.1586429397028130946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 03:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sUZ3UX4U;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id s8so11361976wrt.7
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 03:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0DdQWUy3oovcq/9RJcmCwEBjmjwqUUXYiyxTInUkDnY=;
        b=sUZ3UX4Uwp5UEhT+aqUnAsrV6thx+IAZnudVbB2gX/dlszlwSIqRY8sw6Z6/CI8HKB
         DbQKHTfEZNPftLHGQ7n5aUbmDuwdzPLQDoZp4PQk1g/Rt/HwtzkAOGPtwD4i0VSqjMeZ
         Oi6d2Tu9tS4u+kx/OSrL+owYAaWYHqYb+9HAecIaNUCZfehGWsaDXACiFcbr60Rkj94l
         le5PNBcpcz1LI6E44v9/KUVlMSkA4gq9y8l83stZr1Zw4aFCiVFwyXqaaRaL1nsiMeQN
         eBPaN1dUtdDgsh/6RED2Qeho/wRhhF6mXGcNhUQHHFezeaqJ9DoRltLOC0Cz6CgI9YBW
         IxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=0DdQWUy3oovcq/9RJcmCwEBjmjwqUUXYiyxTInUkDnY=;
        b=kSpxLPXdVG5pBFwzVbmS93CwelRfM7M+TJV4St3p7yiExp7+EQ9t13F8CkZlmXaokd
         u/TMMlPWjtBRVw54dm2k462lS1rUHSrcXEzsqHLJvEm4eDii+PZCfJbjglPkK5umqHrd
         T3t8NZTNq0fHPYLkssEJCniv0SxRhHeXw4L0XuSAGp7NWfGughTOcqPVnAsHr0+mycoJ
         Sdkc5O2DsuoMGfDw7Ogc+ZgAMampnlMVJQbqRURx3Yaw46D2bR9kZtTEDRBCm5OlCV+A
         IClPNdShU8iF3IghynTEvILzmGu5mGZiaUTSJHv1eeZBC8/o1bju6Cdb/ZYb3Vh4ajPi
         BFOw==
X-Gm-Message-State: AGi0PuY2nh/YPMnL5NyKKxcACFdP290O8Oy/VzH276klHsfriag5nqB1
	QCuq3BBZQLOJqI87Mu+rbW6D6lzD924=
X-Google-Smtp-Source: APiQypJEgNG7x6m/wLuH82/pcxi+LibwLtVVvqDmQiMmRIsdnJIIVI9Gh22qwiC6CFj9v3Wg4jkdfQ==
X-Received: by 2002:a5d:69ca:: with SMTP id s10mr13610151wrw.260.1586429395045;
        Thu, 09 Apr 2020 03:49:55 -0700 (PDT)
Return-Path: <ricardo.ribalda@gmail.com>
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id l5sm4985737wrm.66.2020.04.09.03.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 03:49:53 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Barker <pbarker@konsulko.com>
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH v4 0/4] wic: Fix permissions
Date: Thu,  9 Apr 2020 12:49:47 +0200
Message-Id: <20200409104951.948242-1-ricardo@ribalda.com>
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


Ricardo Ribalda Delgado (4):
  wic: Fix permissions when using exclude or include path
  wic: Fix multi images .wks with bitbake
  wic: Add --change-directory argument
  wic: Continue if excluded_path does not exist

 meta/classes/image_types_wic.bbclass     |  8 +++-
 scripts/lib/wic/help.py                  |  6 +++
 scripts/lib/wic/ksparser.py              |  1 +
 scripts/lib/wic/partition.py             | 15 ++++---
 scripts/lib/wic/plugins/source/rootfs.py | 52 ++++++++++++++++++++++--
 5 files changed, 68 insertions(+), 14 deletions(-)

-- 
2.25.1

