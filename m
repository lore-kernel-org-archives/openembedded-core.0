Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id D459076E3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 04:35:44 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so42346071pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 21:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8rL6JIav9SfB7/03Go8BbrY8nhmOet0bk77QKRCjVsc=;
	b=YCzWSi+sChPJ12xwpb+BACNVzh/PZpBqSmW2vlLEBaje09K7pls5yPx3eL1URdRtpr
	PwJiNnVp2+pgZcBvBWZEBI2DRspEDFfEdXM+GPQdkH7KWpPsTUTawwRdNMWQSh7/DoC+
	Vch94v7gQLj+lM9ZQNnfag10+93Z6G4SsxHBvsNWS/kUlZiytYZGpyyWnOuT1JteCKf2
	aZGgIi9J1VIn/0Ols8r1ky7IQpB0AVnusYxmX+INsrQyQo7YAep83+ZVSO6YgEMr1C7D
	JgvYlKc6hblC97lqaji/5f6yhsOzmBq6Ggvrgb2LuwUFvVvk+biG7YIwjXCfufb2yxUP
	Cy4w==
X-Received: by 10.68.219.133 with SMTP id po5mr8167353pbc.135.1445402144462;
	Tue, 20 Oct 2015 21:35:44 -0700 (PDT)
Received: from haswell.localdomain ([2601:646:8601:4580:baca:3aff:fe80:aa8f])
	by smtp.gmail.com with ESMTPSA id
	pw7sm6581104pbc.4.2015.10.20.21.35.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 21:35:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 21:45:03 -0700
Message-Id: <1445402703-30713-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [jethro/master][PATCH 2/2] busybox: Schedule mdev after mountall
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
X-List-Received-Date: Wed, 21 Oct 2015 04:35:45 -0000

mdev does automounting of block media, which expects
/run/ to be mounted, so let mounting happen before running mdev service
and mountall is done with at 03 so trigger mdev at 04

This helps in mounting the devices which are plugged on boot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/busybox/busybox.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 4d4709a..cfdea30 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -33,9 +33,9 @@ INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hw
 INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
 INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
 INITSCRIPT_NAME_${PN}-mdev = "mdev"
-INITSCRIPT_PARAMS_${PN}-mdev = "start 03 S ."
+INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
 INITSCRIPT_NAME_${PN}-syslog = "syslog"
-INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd" 
+INITSCRIPT_NAME_${PN}-udhcpd = "busybox-udhcpd"
 
 SYSTEMD_PACKAGES = "${PN}-syslog"
 SYSTEMD_SERVICE_${PN}-syslog = "busybox-syslog.service"
-- 
2.6.1


