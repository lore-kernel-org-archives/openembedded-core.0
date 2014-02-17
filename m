Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6196EFD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 10:42:58 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ld10so15114876pab.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 02:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=I8T+zcw3FHCQPIWhRSgYgjMxqOvK2QeMQsasb8YAv+g=;
	b=BqDg5qytSdOP2vIe8QzK27RiJsYqca80jO7cjdaxAcavdykcz4uXQcGYTbUeC85xYG
	eK87zEAF5WOdE4VyvOg5ebAsP588txt8EKNHprLWzFvEOXky3sUsNp2485EczKBfAkc4
	to35peFnnc9CiB1wBMOdLLnG289foLvxh9ndJZYy0o2lst+mH29Lp5USeEVpdiF+vM3Y
	+GUBixF8WjvMRlE70bdYweZMevZMdObsdLO27dgMHVxCKilA0Deg4UFTK3p4uI7CIrBI
	+V2x8TeRBvsG7kxZerfLgOlaT5m1pFbzjMXXNfwUnJ6AtogSriau9lI7piBBquMsMTrw
	oG/Q==
X-Received: by 10.68.93.161 with SMTP id cv1mr26000229pbb.122.1392633779224;
	Mon, 17 Feb 2014 02:42:59 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ac7sm114477550pad.12.2014.02.17.02.42.56 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Feb 2014 02:42:58 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Feb 2014 21:46:28 +1100
Message-Id: <1392633988-14208-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.5.4
Subject: [PATCH] lib/oe/image.py: fix working directory
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
X-List-Received-Date: Mon, 17 Feb 2014 10:42:58 -0000

The working directory needs to be changed before the image creation
commands instead of afterwards.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/lib/oe/image.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index c15296f..31193f2 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -176,8 +176,8 @@ class Image(object):
             bb.data.update_data(localdata)
             localdata.setVar('type', type)
 
-            cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
             cmds.append(localdata.expand("\tcd ${DEPLOY_DIR_IMAGE}"))
+            cmds.append("\t" + localdata.getVar("IMAGE_CMD", True))
 
             if type in cimages:
                 for ctype in cimages[type]:
-- 
1.8.5.4


