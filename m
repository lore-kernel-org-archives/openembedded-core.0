Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web09.659.1626990675603635849
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jul 2021 14:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=QbkChpax;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1297; q=dns/txt; s=iport;
  t=1626990675; x=1628200275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BA7xFVi9vy/b3V+jxgtDBZfPn8FN6W6BqLo0PIYE2PU=;
  b=QbkChpaxxEKQ7LYfdY5CGNb/HkAdQ4PVFj23mumJOB0jIYG7tPPh6VlH
   FsFkETmDvYUP3AmAYt+gCMFtdCjkhU56ECZwOvTKFzY3eQQglMtnz/Tbf
   t4G5EUae7T40KF2Kz4SxXiY92GP4CoHiQNBhEIMJrsqzQR7DRr+KWOWzA
   A=;
X-IPAS-Result: =?us-ascii?q?A0BEGQA55/lg/5tdJa1agmICgil3VzoxlGQBAQUBgT4Gi?=
 =?us-ascii?q?meGToopgXwLAQEBDQEBLRQEAQGEVwKCdwIlNAkOAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBQEBAQIBBgR7E4VoDUMBEAGFcQYyAUYQHgIxLCsZgnEBgmElAakMgiyBA?=
 =?us-ascii?q?YRohTeBOgGIe4RwJxx9gRCBFYNjhRGFLgSCKT80WTWCWJFVjmKdD4MwniQaK?=
 =?us-ascii?q?6Zjhwavc4QdAgQGBQIWgWA7gVkzGggbFYMkCUcZDpF3ixchMgI2AgYLAQEDC?=
 =?us-ascii?q?YQ5hyABAQ?=
IronPort-HdrOrdr: A9a23:Y+y+sqxZUiVjVpCUOcoCKrPwK71zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+EZyTNB/L/HCM7SKadH/OW6
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.84,262,1620691200"; 
   d="scan'208";a="737295680"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by alln-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 22 Jul 2021 21:51:14 +0000
Received: from sjc-ads-259.cisco.com (sjc-ads-259.cisco.com [171.71.190.191])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 16MLpD0b001480
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 22 Jul 2021 21:51:14 GMT
Received: by sjc-ads-259.cisco.com (Postfix, from userid 488756)
	id 29D8CCC128E; Thu, 22 Jul 2021 14:51:13 -0700 (PDT)
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/2] qemu.inc: Add seccomp PACKAGECONFIG option
Date: Thu, 22 Jul 2021 14:50:47 -0700
Message-Id: <20210722215047.1735683-3-fib@cisco.com>
X-Mailer: git-send-email 2.26.2.Cisco
In-Reply-To: <20210722215047.1735683-1-fib@cisco.com>
References: <20210722215047.1735683-1-fib@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.71.190.191, sjc-ads-259.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
Content-Transfer-Encoding: 8bit

From: Nathan Rossi <nathan@nathanrossi.com>

Add the seccomp PACKAGECONFIG option to allow building seccomp features
in QEMU. The libseccomp library is available in additional layers (e.g.
meta-security).

Additionally this serves as a way to disable seccomp by default to avoid
the configure of QEMU automatically finding it (via pkg-config) on the
build host when building qemu-system-native and auto enabling the
feature.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 8f927bdf54..e25c2524aa 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -210,6 +210,7 @@ PACKAGECONFIG[glusterfs] = "--enable-glusterfs,--disable-glusterfs"
 PACKAGECONFIG[xkbcommon] = "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
 PACKAGECONFIG[libudev] = "--enable-libudev,--disable-libudev,eudev"
 PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-libxml2,libxml2"
+PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 
 INSANE_SKIP_${PN} = "arch"
 
-- 
2.26.2.Cisco

