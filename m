Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SfeUD-0006Qs-2m
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 23:55:21 +0200
Received: by dalh21 with SMTP id h21so4421285dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 14:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=RYGTjbkA48d8k8HkF83HPh+dny4fy1Sratfvtel6Lq0=;
	b=cmMi/bRjXJPJuJ33A7+ZZylN95wa2tNDSh2vJMmqVsEE99j0X9RrcVUjN25He2OLf/
	7TLtuqnqYtG35IVDa0z0Jv/0BWe2VWkRkpHq1SSQO4yT5J3ZxKp5mzp9YP+k17hiRTZP
	okZzovEgTpTRzVqylw2kOY2nh+xQJhI6tdlSmPMP8bMR1JWKM+/1ZrcAKzDuA2Fl4G/0
	rcMyIBiwnJQbS1LqVXQQCcLsNhM//2x45Y7nHOhnz8WmrdCgAZfLZByxcuXRgBRm4H41
	FCCetuA7nL7Jcez34uN//bmii3E3ivXcPhlQV2Zf6mC7JxfiyGfG3Yc4uKXLswA+Lgsm
	jvpA==
Received: by 10.68.240.99 with SMTP id vz3mr24802141pbc.60.1339796681248;
	Fri, 15 Jun 2012 14:44:41 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id os9sm14480729pbb.62.2012.06.15.14.44.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jun 2012 14:44:40 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2012 14:44:24 -0700
Message-Id: <88fd8e08d1933a78856c17245210d2ef7e4ae926.1339796664.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
X-Gm-Message-State: ALoCoQmOCzv9YhjKv7wPU+F9k+LRCFJ2xxCJbP2SPvtXgnfZxb2ICHcG9vlrnMQm9yVDhSgBFOig
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] cml1.bbclass: Only delay exit if the command fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 21:55:21 -0000

Rather than pause for 5 seconds, test the return code of the command and
require user input before exiting on failure. This avoids pausing after
successful command execution as well as possibly not waiting long enough
if the user happens to be doing something else for 5 seconds.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/cml1.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index bd25311..52d520a 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -15,7 +15,7 @@ HOSTLDFLAGS = "${BUILD_LDFLAGS}"
 HOST_LOADLIBES = "-lncurses"
 
 python do_menuconfig() {
-        oe_terminal("${SHELL} -c \"make menuconfig; echo 'Pausing for 5 seconds'; sleep 5\"", '${PN} Configuration', d)
+        oe_terminal("${SHELL} -c \"make menuconfig; if [ $? -ne 0 ]; then echo 'Command failed.'; echo -n 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
 }
 do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
 do_menuconfig[nostamp] = "1"
-- 
1.7.5.4



