Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 09DC26F6FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 10:07:44 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id hr17so5477011lab.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 03:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u0WVjiSO+gYE3oL+g1KW2fbFhFCOgMgx7WAtgpR6qoE=;
	b=QHM24EOBJpY3zk6fxOY5MAvUZDLymjOO+QV8tNyciqK7LR6QU1YAgxa8B/TYot7iXS
	3bHo6CtkYw+6cHhur6UDEuA2oOgYi9AU4np/1cpzsgXIzKF1MUDtOu+iQD3MHg+qyhWP
	d5TDW28ezqZNsLy56qdQh3o+t1Ofm36HqR/z1h4bxlSFSBLkO4rV5ihNZbtHBTLt6Vi+
	CH4PxOfv4ZKojomrfKG/vze8AYPjIT8k2dXPfo4fOVBbQ8dF/qVi4wYqqMBDKZ4acidk
	rD+O0KJi4jzNDz1tsnQZpaXmTJiYAvaWv4dXg5rJEPnmESUxF2stDwvCLWjo8HizsO2e
	6XjQ==
X-Received: by 10.112.158.230 with SMTP id wx6mr9823lbb.62.1394532464296;
	Tue, 11 Mar 2014 03:07:44 -0700 (PDT)
Received: from neopili.qtec.com (x1-6-30-46-9a-6d-3c-54.cpe.webspeed.dk.
	[80.167.66.223])
	by mx.google.com with ESMTPSA id v5sm34397489laj.0.2014.03.11.03.07.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Mar 2014 03:07:43 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Mar 2014 11:07:35 +0100
Message-Id: <1394532455-17512-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] package_deb: Map TARGET_ARCH x86_64 to DPKG_ARCH amd64
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
X-List-Received-Date: Tue, 11 Mar 2014 10:07:45 -0000

Without this patch packages are generated as x86_64. Which cannot be
installed by default.

root@qt5022:~# dpkg -i alsa-utils_1.0.27.2-r0_x86-64.deb
dpkg: error processing alsa-utils_1.0.27.2-r0_x86-64.deb (--install):
 package architecture (x86-64) does not match system (amd64)
Errors were encountered while processing:
 alsa-utils_1.0.27.2-r0_x86-64.deb

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/classes/package_deb.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 6a8e080..b391e5c 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -430,6 +430,8 @@ python () {
     darch = d.getVar('DPKG_ARCH', True)
     if darch in ["x86", "i486", "i586", "i686", "pentium"]:
          d.setVar('DPKG_ARCH', 'i386')
+    elif darch == "x86_64":
+         d.setVar('DPKG_ARCH', 'amd64')
     elif darch == "arm":
          d.setVar('DPKG_ARCH', 'armel')
 }
-- 
1.9.0


