Return-Path: <otavio.salvador@gmail.com>
Received: from mail-gh0-f175.google.com (mail-gh0-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8D38C6968A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 15:04:56 +0000 (UTC)
Received: by mail-gh0-f175.google.com with SMTP id z19so2186556ghb.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 08:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=UL+3d6OGSxdZMJDISpXphpvYMxxdECMfzg7p+ZGfSqU=;
	b=bgrCciiv8KpmCS83At3LH/sOpb1sNhfwJ9K5rhj1VsQQsCbKgE8AIICjXA7zcY7cOB
	EW9hG3p0+L2Iwsc49Qir3PFzEvV8BEyBIyLhDMJJ1YhqnnKA1dOF/LIVxJ/v9zjFXDqy
	r/MMf2oHDltga8jZtkEWsWFJGenJ3oovHEF4+V3rMpcmHTvKvXrNf5CfftOSdoLlDAam
	981GPGut7O3wOJ45Mra9wACygXaPJ/4yQTdD7ycLmGP8unLDv8x1/3F+GBqzZiCZSOD1
	bQbCPyK7waEozdKT1HtzCk8oLR6pU4RNT98M3SqMyqg6vXdvuVA58Bqmd0nA+vibeqwl
	AGQA==
X-Received: by 10.236.129.98 with SMTP id g62mr16260258yhi.63.1369753497336;
	Tue, 28 May 2013 08:04:57 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([177.194.194.146])
	by mx.google.com with ESMTPSA id
	f30sm38555282yhi.21.2013.05.28.08.04.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 May 2013 08:04:56 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2013 12:04:35 -0300
Message-Id: <1369753475-22573-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] base.bbclass: Add COMPATIBLE_DISTRO_FEATURES support
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
X-List-Received-Date: Tue, 28 May 2013 15:04:56 -0000

This add support to list compatible distro feature for a recipe; this
is important for example when you have two different recipes which
should be choosen depending on the distro features set.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/base.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b1642a2..1c0b0d9 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -522,6 +522,16 @@ python () {
             else:
                 raise bb.parse.SkipPackage("incompatible with machine %s (not in COMPATIBLE_MACHINE)" % d.getVar('MACHINE', True))
 
+        need_distro_features = d.getVar('COMPATIBLE_DISTRO_FEATURES', True)
+        if need_distro_features:
+            need_distro_features = need_distro_features.split()
+            distro_features = (d.getVar('DISTRO_FEATURES', True) or "").split()
+            for f in need_distro_features:
+                if f in distro_features:
+                    bb.note("here")
+                    break
+            else:
+                raise bb.parse.SkipPackage("incompatible with distro features %s (not in DISTRO_FEATURES)" % need_distro_features)
 
         bad_licenses = (d.getVar('INCOMPATIBLE_LICENSE', True) or "").split()
 
-- 
1.8.1


