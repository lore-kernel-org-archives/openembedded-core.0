Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.87399.1597843485919315117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 06:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HY0bwRE3;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id s23so17686392qtq.12
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 06:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I+9LPVY25oTXAX5sQp8/8qMynTN2C3Ug411SXE6u0SY=;
        b=HY0bwRE3v9oanTndoVtNmJXYk6G7KMf0aWvBQwVLzfktAswkLfKOEWTl4mH4nxVub5
         SggjnWMlK5lmZw3lAqQAxR6K27e/RVY7oucCPRWYJzGicLrpTCzwfI8ig4LjtT1JF8kP
         OYDb+daNJaemb6byN+hTZ2zuqQPd3u2poXb0908iHgiOeUPUabum1SvS/4KT1sTo2n9V
         18IjT3bsPhmx/mWbUa9q/61DSt0ZVq76iWtSvT4nWY0rK50ugMEp7q7v3BLnSJbbQxKx
         cuqEtQt0R3KXJ4KZAr+sW5wT6kWPZF+asYNonCzcZTzv9nmrAhWqYLuAPzHOok3R7kOE
         i2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I+9LPVY25oTXAX5sQp8/8qMynTN2C3Ug411SXE6u0SY=;
        b=qSkhB3zXi3DlbQ5S03pmmgeBeub/C53F7e1leDiM1gkTQROS/mkNhcp878o20d4pJo
         LozDrzUmtZHfd6seIr04Cx8seU7AdP6v6fz7Z4nZxwOk6LRyY9MQtXuIqJSthEBQhm3M
         StUx7V+UYCrJ/y6Lv5CkVNfLiCrv82IL76jizJ757RehxXQOpWXwgBXHq0J43LEgrV77
         BQByUGxSyJkpRVcpQw6SBlzyIljuCHrXgBA9ooEhZsdcAQsuVBTkFXHpjPGAXxRhd5dv
         94+1fYDo8FfB1EkwmjL8j19GaV/UL/v9wtA9j6Vrko/eHmQ7+F/jEVpATPhLgyHXXK+n
         ToAA==
X-Gm-Message-State: AOAM533kToUwJWngZQs0Qsz9UUeuksCcWt5Ws0RHZlJ9YA2A4njDtwde
	aoqOV9SuP/X7jRAKCsYnZjA=
X-Google-Smtp-Source: ABdhPJyJ1wDGt1liTA6zh8Dw4G/PQncwzrCtYqsK5phmCkiVXJDOIuDRWELYJLxddo15SQ1nfky4/g==
X-Received: by 2002:ac8:7118:: with SMTP id z24mr21975704qto.294.1597843484972;
        Wed, 19 Aug 2020 06:24:44 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t93sm26873088qtd.97.2020.08.19.06.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 06:24:44 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: updates to libc-headers and reference kernel
Date: Wed, 19 Aug 2020 09:24:38 -0400
Message-Id: <cover.1597843173.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

These have been soaking for quite some time in my branches, and you've
seen the stream of other patches to fix issues with the various oe-core
packages and test cases that I've run into.

The libc-headers didn't trigger as many issues as it has in the past, but
I still don't expect it will be problem free .. but I have built musl and
glibc against the major oe-core images/tests. So hopefully nothing has
snuck in between my last run and this send.

I'll be running more tests myself, but still wanted to get this out as a
RFC/RTC and get some more eyes on it. If anyone sees any issues. let me
know and I'll triage/fix as appropriate.

I've also included the 5.8 kernel recipes, since they'll be joining
master as a reference kernel. I haven't made these the default for
anything yet (but have local patches for that) .. but again, wanted to
see if their existence triggers someone's corner case that I'm not
aware of. That being said, I've built and booted all qemu targets for
this, and have run the kernel-dev tests for sanity.

Cheers,

Bruce

The following changes since commit 21c13f75b56546b55e8e9e895bd7c2f8e98defe4:

  runqemu: Check gtk or sdl option is passed together with gl or gl-es options. (2020-08-19 10:57:44 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  libc-headers: update to v5.8
  linux-yocto: introduce 5.8 reference kernel
  kernel-yocto/5.8: add gmp-native dependency
  linux-yocto/5.8: update to v5.8.1

 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../linux-libc-headers/linux-libc-headers.inc | 16 +++++-
 ...linux-stddef.h-in-swab.h-uapi-header.patch | 10 ++--
 ...aders_5.4.bb => linux-libc-headers_5.8.bb} |  6 +-
 .../linux/linux-yocto-rt_5.8.bb               | 44 +++++++++++++++
 .../linux/linux-yocto-tiny_5.8.bb             | 32 +++++++++++
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 55 +++++++++++++++++++
 7 files changed, 154 insertions(+), 11 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.4.bb => linux-libc-headers_5.8.bb} (71%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
 create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.8.bb

-- 
2.19.1

