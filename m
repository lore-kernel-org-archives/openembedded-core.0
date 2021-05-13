Received: from avasout07.plus.net (avasout07.plus.net [84.93.230.235])
 by mx.groups.io with SMTP id smtpd.web09.14100.1620915919228299509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 07:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=GGuDeudb;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.235, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id hCH0lUVXS6wwFhCH2lBmve; Thu, 13 May 2021 15:25:17 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=TPXet2ta c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=5FLXtPjwQuUA:10 a=-An2I_7KAAAA:8 a=Y6kJQ5-wFXwNJTfOm9MA:9
 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=Yj/z2w4E3OnxYCzKEXlyG03hlMt71Z+M0vx1PchcgC0=; b=GG
	uDeudb9eGqUGOHuQhhFZNjjy4g4+Zhj5xM2ekjGMhCBtUlKBmQ1YfeHzfBma96UcjIkErXEElvKwm
	8YSDZq1WmUcKw95Di9q9B2wmjVRUAMGuoIGALBFmpXz5PsaZfODp4SJmnYIbUu5sKYPoWbTWFxAKT
	d7bd39oaX8YAB/M7VVTQDMZnRCb+14ZRtKHqGzCspftcLhFDqoz9RCI17merjZB6Z36u1Fr5IeRJj
	/ZGRJw3QVvV+sj3X3qgQMdNiseCfK7CxS10stKyolKsYKEHVEuBbu44CCVEZJN9zBymkvwW5pWhim
	QNdRn8bum1975ThHXVfg6ImJG4bZDiXw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1lhCGz-0008OZ-E9; Thu, 13 May 2021 15:25:09 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] npm.bbclass: Allow nodedir to be overridden by NPM_NODEDIR
Date: Thu, 13 May 2021 15:25:03 +0100
Message-Id: <20210513142503.1210759-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHAMwe2j50wJ1/sCiaN8ZYUTZDOkO1VP0pVtpJQPyjFChuwCKTgTABqLUqSFjIep/bX/5CJL2fU1UQPpz8pZ9lqSfL2HdK4gWUSg65LovfFV+cCzAw6r
 Nqpev0awJ0K4ndppR2MugNyJ4GsJMPo0AvK1h9LDSZZ9AfUbXTszu96jacT0M/6O9qIjpmWm1JUVRw==
Content-Transfer-Encoding: 8bit

Node modules may need to be built against multiple Node
versions. Setting nodedir in the NPM configuration stops older ways of
doing this, such as setting npm_config_target and npm_config_disturl,
from working.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/classes/npm.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 55a6985fb0..8f8712a024 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -247,8 +247,10 @@ python npm_do_compile() {
         # Add node-gyp configuration
         configs.append(("arch", d.getVar("NPM_ARCH")))
         configs.append(("release", "true"))
-        sysroot = d.getVar("RECIPE_SYSROOT_NATIVE")
-        nodedir = os.path.join(sysroot, d.getVar("prefix_native").strip("/"))
+        nodedir = d.getVar("NPM_NODEDIR")
+        if not nodedir:
+            sysroot = d.getVar("RECIPE_SYSROOT_NATIVE")
+            nodedir = os.path.join(sysroot, d.getVar("prefix_native").strip("/"))
         configs.append(("nodedir", nodedir))
         configs.append(("python", d.getVar("PYTHON")))
 
-- 
2.30.2

