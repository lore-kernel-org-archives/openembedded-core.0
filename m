Return-Path: <sujith.h@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id DEFFA61FE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 09:27:41 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so4672745wiv.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Aug 2014 02:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=czRlOSW3QqNiZbTDojNBc3kVblUOU5es3Xsdv48aHxI=;
	b=GQNy0mbIpQkpTlyE4G/x4kYrcPprxH0+Hu8lOBHSR97cN3Qvf7F9cxaL2x+L0Sae5/
	h2vSM0gl78QpVdLpEhPLSa2HSNgPSLw2KQeqKg9gBwJeFa1AXxd8bGROTvyaLaXFDhd3
	h+VLdk/mAKpmdx4td6KOzJw99cFCcTu0k9ZZz/VzdnNg8EJJP6jx1uz/4uh9MnUh7rps
	6LoH3cslNlNUQ0UveIsfdZ6j6JGCp561x46laLaqAnp00DYN836hpfjUWcFjSctx1B8a
	OyK304cZuFDR4Az09+AMnZ2EQY0D20cnPUADE+rHMrpytAidy1cndAaVksHtst/lXOab
	j0Fw==
X-Received: by 10.180.186.3 with SMTP id fg3mr56094752wic.78.1407403662014;
	Thu, 07 Aug 2014 02:27:42 -0700 (PDT)
Received: from linux-z8xt.inp.mentorg.com ([139.181.35.34])
	by mx.google.com with ESMTPSA id
	bv16sm14909056wib.2.2014.08.07.02.27.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Aug 2014 02:27:41 -0700 (PDT)
From: Sujith H <sujith.h@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Aug 2014 14:54:17 +0530
Message-Id: <1407403457-25490-1-git-send-email-sujith.h@gmail.com>
X-Mailer: git-send-email 1.8.4
Cc: Sujith H <Sujith_Haridasan@mentor.com>
Subject: [PATCH] opkg-utils: allow disabling update-alternatives
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
X-List-Received-Date: Thu, 07 Aug 2014 09:27:45 -0000

From: Sujith H <Sujith_Haridasan@mentor.com>

This is needed to deal with the situation where we're using ipk packaging, so
opkg-utils must be built regardless of what update-alternatives provider we
prefer. The downside to the current implementation is the need to adjust
PACKAGECONFIG as well as PREFERRED_PROVIDER, but it is more explicit that way.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 693c216..9364740 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -19,11 +19,17 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 PYTHONRDEPS = "python python-shell python-io python-math python-crypt python-logging python-fcntl python-subprocess python-pickle python-compression python-textutils python-stringold"
 PYTHONRDEPS_class-native = ""
 
-PACKAGECONFIG = "python"
+PACKAGECONFIG = "python update-alternatives"
 PACKAGECONFIG[python] = ",,,${PYTHONRDEPS}"
+PACKAGECONFIG[update-alternatives] = ",,,"
+
+PROVIDES += "${@'virtual/update-alternatives' if 'update-alternatives' in PACKAGECONFIG.split() else ''}"
 
 do_install() {
 	oe_runmake PREFIX=${prefix} DESTDIR=${D} install
+        if ${@'true' if 'update-alternatives' not in PACKAGECONFIG.split() else 'false'}; then
+            rm -f "${D}${bindir}/update-alternatives"
+        fi
 }
 
 PACKAGES =+ "update-alternatives-opkg"
-- 
1.8.4


