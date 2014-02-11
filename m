Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id D74A36E8C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 15:00:12 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id e16so6036890lan.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 07:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=xmPyI0gYpv7K0l6MQSG8C0oSkZ4YAZzQpF59enJS6d4=;
	b=XyRjHy9v1gBbB1OBkAzFvpCOdtv79eQi4fbark19+oNv/2sCI+i5dnYF01Xpt+vdKU
	PfAWMJMbt3eksRAP/EDp09B0t3KXkOjCJLcJP+qySvj68TwYaWTWYq80lRW569PR/vnh
	KBqBSxxVvDJGLqG/FxsaLovuf9FOuFI7/IUysyf46GlZnknC431VsloL/q2gcD6tpeds
	Bmy+ZRU8Y9vv7JCUNR4aWwoW3GN4opYPELlZnjuvoHivbaEyPyMGWE/L7ng23VsaeOA8
	5Vqin+jKM1ZyYNiAaBLUgyCJ6yOJy6LQ6ukehMUZY94+xG7rs+ViV/JHqF8uaA9DWik9
	O2Ag==
X-Received: by 10.112.137.137 with SMTP id qi9mr2078635lbb.36.1392130812856;
	Tue, 11 Feb 2014 07:00:12 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id
	th3sm19901331lbb.11.2014.02.11.07.00.11 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Feb 2014 07:00:11 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id F3A7B1C5E7E; Tue, 11 Feb 2014 16:00:06 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Feb 2014 16:00:05 +0100
Message-Id: <1392130805-20371-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] license.bbclass: Dont create a manifest when using BUILD_IMAGES_FROM_FEEDS
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
X-List-Received-Date: Tue, 11 Feb 2014 15:00:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Wihtout this patch, FEEDS functionality is broken, and creating
a manifest from recipe metadata may be faulty when using FEEDS.

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/classes/license.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c668783..a0b877d 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -26,6 +26,11 @@ python write_package_manifest() {
 }
 
 license_create_manifest() {
+        # Test if BUILD_IMAGES_FROM_FEEDS is defined in env
+        if [ -n "${BUILD_IMAGES_FROM_FEEDS}" ]; then
+          exit 0
+        fi
+
 	INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
 	LICENSE_MANIFEST="${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest"
 	# remove existing license.manifest file
-- 
1.8.3.2


