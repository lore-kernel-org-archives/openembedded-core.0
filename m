Return-Path: <net147@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id B140B61FEC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2013 10:49:11 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un15so710385pbc.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2013 03:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TsdX6HNkr9gNiWredbCU80eyCN765LyIGV0nvPF+BOs=;
	b=05H2UXEAEiyL0WShyYPvMqBibrnAahW/gxEYHKKBJpANIwE9ln05E88uTAXxrr8kDK
	gVRMIaP7bM5bwO2GA8Ex3y/w0hdDB4MC5A3KiyQ8xwfUrvE0uXRjdxQ/Bxid365ryqOe
	eIIxupdETu2KHXEfwPYuJH9RZJasV8O4VYLsSHm6m6/PAu0Nq4iwjnvBF5uDt8PNX5rq
	fEL0rwrhKoiNtBX0WIX//xUts0kYHXdf2uZ6/Y99N3LVECnKAQKOGI+4/rnyy5iIwmZf
	v2a0oAHU7WRTjX7rquHOZBp6pT/WF2XOE0MTmlx28zG2OENir4WGyzjPNVTaQIx6Xe7D
	XCTA==
X-Received: by 10.68.190.197 with SMTP id gs5mr1800534pbc.90.1380710953634;
	Wed, 02 Oct 2013 03:49:13 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id xe9sm2725532pab.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 02 Oct 2013 03:49:12 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2013 20:47:11 +1000
Message-Id: <1380710831-10855-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] boot-directdisk: avoid loop in MBR disk signature generation
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
X-List-Received-Date: Wed, 02 Oct 2013 10:49:11 -0000

Instead of looping until the generated signature is non-zero, just
return 'ffffffff' if it's zero. This avoids an infinite loop if the
generated signature is always zero.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 0f64b44..5535728 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -148,11 +148,12 @@ python do_bootdirectdisk() {
 def generate_disk_signature():
     import uuid
 
-    while True:
-        signature = str(uuid.uuid4())[:8]
+    signature = str(uuid.uuid4())[:8]
 
-        if signature != '00000000':
-            return signature
+    if signature != '00000000':
+        return signature
+    else:
+        return 'ffffffff'
 
 def validate_disk_signature(d):
     import re
-- 
1.8.4


