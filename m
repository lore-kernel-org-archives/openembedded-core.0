Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.10629.1612880205200826269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 06:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Uvcyptc0;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: robert.rosengren@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1612880205;
  x=1644416205;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DYXWRCL/jvbNdkfXE7zpMnyG7k3IU6UMRDuCXuWc0u0=;
  b=Uvcyptc0GiuSNkgytSrS2rYSlwS8Dqj+/LgA1VcdvTne690PxssGoZFO
   v9Jzj+fD+doVvDRiu0QeKRd7bZ690uGfPpIkbdpBchwZFvIhZlpsMNOv1
   fbu+1UIqG89VLXbTBvte5vXJAZSvRTESTpxn6e2wLb20ayGTY6GbguamK
   Fu2R4CvJciPPXVO79wm6IUPvJN0dJQLwYt1LH8Y3G/HH3J7uDi2wUEVXJ
   u7GmTUpZqzQ4TmXkNZ5Crohno5yXschyBuReopZ1BTMc+AHITWaUMy8qT
   nlL+UQFI3TD8wYjRbvNHg/K+VPp2NGiI4D7vJzN0xHsN/5bAOorKwPjvp
   g==;
From: robert.rosengren@axis.com
To: <openembedded-core@lists.openembedded.org>
CC: Robert Rosengren <robert.rosengren@axis.com>
Subject: [PATCH] mpg123: Add support for FPU-less targets
Date: Tue, 9 Feb 2021 15:16:16 +0100
Message-ID: <20210209141616.24276-1-robert.rosengren@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Return-Path: robertr@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Robert Rosengren <robert.rosengren@axis.com>

Support added to configure mpg123 for FPU-less targets. Building for
fixed-point arithmetic increases performance on such devices.

Signed-off-by: Robert Rosengren <robert.rosengren@axis.com>
---
 meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
index c9bbcd30ff..35cad6ffc4 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.26.4.bb
@@ -40,6 +40,7 @@ EXTRA_OECONF = " \
     --with-audio='${AUDIOMODS}' \
     ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
+    ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-cpu=generic_nofpu', '', d)} \
 "
 # Fails to build with thumb-1 (qemuarm)
 #| {standard input}: Assembler messages:
-- 
2.20.1

