Received: from esa2.mentor.iphmx.com (esa2.mentor.iphmx.com [68.232.141.98])
 by mx.groups.io with SMTP id smtpd.web09.6685.1615990033061312674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.141.98, mailfrom: awais_belal@mentor.com)
IronPort-SDR: MafzQAS7ldLKG1SUak8Gse3sMtYXDnuoo53jY7tVL4APOFyhAI5RTl6zjkQGCiPPtpcZQU3kYJ
 +yfTQ0NQ19c/59ZpBjAl4mfhTbGnRB45/ULpjiDFlQS5H0r9v6WyRaHJrGVME7ihX+lHabWOzr
 8HAIVGzikCwglxpa902tm3UR3ShApU3cfBmAa16eFN+hynz0+d9RHgmxX3i222paOI7oP3pmhJ
 MEoGX5on3xwHrhzHNrRwG329qlUpDzCNBZfzP7LJWQ0kjnPS/NEoTsVB+xhDZ9rtr9JDCEkdk6
 dI0=
X-IronPort-AV: E=Sophos;i="5.81,256,1610438400"; 
   d="scan'208";a="59183096"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 17 Mar 2021 06:07:12 -0800
IronPort-SDR: BNwK523mduolTgfMlqW6JbFn8pY79lgPniPu35JjjfgR84qYUT99sr1l2qtV/8zkAQASA2rNGp
 KVYvGzNY2GqAuN5pRf/MQETyZFuepgAI/HPPHvIlQAXzgtzaPMk0IqBRcwRn8sWMOSgHU0eCd8
 1rxSe+MNgz3Yh/z3N6ANXEJ5e6IVXKcQRW+RB08MbHCz9BsrEMmeH9iVMDi9lhA1mdGlB9rj2i
 kxQ4l1GMHaT8Ny8BXnHTHjyOFeWzpqVCBzn17xKvcVT8jFc1CqVZQiuvS6np2lfEEqnERTn8Jy
 V28=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libsdl2: disable shared memory for native builds
Date: Wed, 17 Mar 2021 19:06:44 +0500
Message-ID: <20210317140644.12587-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: awais_belal@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-05.mgc.mentorg.com (139.181.222.5) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Content-Type: text/plain

libsdl2 currently does not handle the failures that
occur due to shared memory in case of remote hosts
where it should ideally switch to socket based writing
when a failure is seen with shared memory.
Consider a scenario where a qemu build is done with
graphics support on a build machine and then accessed
remotely using ssh. If the remote host's X presents
MIT-SHM as an extension, launching qemu fails with

runqemu - ERROR - Failed to run qemu: X Error: BadValue
Request Major code 130 (MIT-SHM)
Request Minor code 3 ()

This is most often seen when the remote machine doing
ssh is a Ubuntu 20.04. The libsdl2 native are mainly
used for qemu at this time so it is a major usecase.
A report of such a failure was also presented at
https://lists.yoctoproject.org/g/poky/topic/78854857

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
index 872592fdae..54556abb27 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.14.bb
@@ -65,6 +65,7 @@ PACKAGECONFIG[wayland]    = "--enable-video-wayland,--disable-video-wayland,wayl
 PACKAGECONFIG[x11]        = "--enable-video-x11,--disable-video-x11,virtual/libx11 libxext libxrandr libxrender"
 
 EXTRA_AUTORECONF += "--include=acinclude --exclude=autoheader"
+CFLAGS_append_class-native = " -DNO_SHARED_MEMORY"
 
 do_configure_prepend() {
         # Remove old libtool macros.
-- 
2.17.1

