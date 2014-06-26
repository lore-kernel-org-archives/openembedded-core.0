Return-Path: <tom.rini@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id DBC8561F16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 12:27:37 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id c9so2982842qcz.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jun 2014 05:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=eA1a4P310t70k3XEnPMcdMfzs5vAreu/XlEuiKPBJyE=;
	b=U8xqCSRgZ0DjR5xjiEsgA1w4l0pgDkaS3NTS6+juQne2DYdZ0/Mps5297QOLu47CR5
	gqt5dlADbY6ljSM1u/olgWLIw+z80B4dcqlVR6+adkDfyhRVQk4S3k6pIdl1DVkJMQko
	95T8cFGk3UzC7GSD3Frb9v15cZj+12zvPVKR8pJl+9SgmL6hW64oNtorvIW0PZ83Ruod
	rk3r7ge6eOBjjlLSpjFu7I5Trwtf6jXs+P7ydtsUQld3buNbdJ9omBxQqUI3lVq5k7Fv
	L9oCk/p3+Y5utX6B9cjl7+ei/gVbHg+zRw/OrAC9asqCkpydvOpuQE6tsMHEOwT984S/
	9+aw==
X-Received: by 10.224.98.145 with SMTP id q17mr21734236qan.97.1403785658073;
	Thu, 26 Jun 2014 05:27:38 -0700 (PDT)
Received: from oliver.localdomain (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id n12sm4152596qga.9.2014.06.26.05.27.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jun 2014 05:27:37 -0700 (PDT)
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jun 2014 08:27:32 -0400
Message-Id: <1403785652-17065-1-git-send-email-tom.rini@gmail.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] image.bbclass: Ensure IMAGE_FSTYPES is fully evaluated before live/live logic
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
X-List-Received-Date: Thu, 26 Jun 2014 12:27:38 -0000

Incase we have overrides applied to IMAGE_FSTYPES we need to make sure
that we evaluate it fully before performing the live and vmdk logic
checks.

Signed-off-by: Tom Rini <tom.rini@gmail.com>
---
 meta/classes/image.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 79de5a2..ccfa1b1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -78,10 +78,11 @@ do_rootfs[vardeps] += "BAD_RECOMMENDATIONS NO_RECOMMENDATIONS"
 
 do_build[depends] += "virtual/kernel:do_deploy"
 
+EVALED_IMAGE_FSTYPES := "${IMAGE_FSTYPES}"
 def build_live(d):
-    if base_contains("IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
-        d.setVar('NOISO', base_contains('IMAGE_FSTYPES', "iso", "0", "1", d))
-        d.setVar('NOHDD', base_contains('IMAGE_FSTYPES', "hddimg", "0", "1", d))
+    if base_contains("EVALED_IMAGE_FSTYPES", "live", "live", "0", d) == "0": # live is not set but hob might set iso or hddimg
+        d.setVar('NOISO', base_contains('EVALED_IMAGE_FSTYPES', "iso", "0", "1", d))
+        d.setVar('NOHDD', base_contains('EVALED_IMAGE_FSTYPES', "hddimg", "0", "1", d))
         if d.getVar('NOISO', True) == "0" or d.getVar('NOHDD', True) == "0":
             return "image-live"
         return ""
@@ -90,7 +91,7 @@ def build_live(d):
 IMAGE_TYPE_live = "${@build_live(d)}"
 
 inherit ${IMAGE_TYPE_live}
-IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
+IMAGE_TYPE_vmdk = '${@base_contains("EVALED_IMAGE_FSTYPES", "vmdk", "image-vmdk", "", d)}'
 inherit ${IMAGE_TYPE_vmdk}
 
 python () {
-- 
1.9.3


