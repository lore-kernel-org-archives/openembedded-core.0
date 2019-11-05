Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5CA8A7F89C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:38:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47731g2424zHq
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:38:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572989895;
	bh=IICYYiZKK3KYF1TU1E2lYtvx+emG3/pdXYJOPJqOA6M=;
	h=From:To:Subject:Date:From;
	b=mJneFVLV7Ro1sPt2r5ilVwXukYbEvimxxzo58p0hHuT0VB82yH6FuvWvTQvzA/2l4
	TJ91d9dWNZW0/8HrtpE1qsCwI6rB3XiZJ14piU5RevnVR8JW6ZyvVHUici4jtnDX3S
	tLLBexP+IY4tNq/2fikDsfut9IMxI8uEmiVrNvqW6KBp/ONtPLB7qajEBqWC7k0WhH
	9pSaF2x3VEAV1QX6np0IYCjKbFhhECCf7Lfw3VRy4cjCfhKTZbkSTA67B+RMO3o38C
	yRG4lt7qsFPff9+HK8gMKu1nDY+Je3dOkwDGIt7ebbCGkd+BTk1nTDAusrGfXIEjFC
	+vbJ+M5FlDn4UmAEggV+f2rhYF4iK3ZS08QSQRyOh1OZvu5443ceHWRYqKVih0CyUy
	3Twd6jJbvlvQ0eblVGxJqehk28XR1TPFQ7meqikmTsvrJpUBnirvH1RqHxXC9eAGDV
	uPIWwcAjjBwmMOb5In1Ese+HmnpxHKoub8vHMb9bd7/tgrrPS1DoV/mRbgp5r9NG3H
	u+p1HsKFUrk0A5vOEAKV1ntMITuLEnUECqZN0z+wn9piilB39Y53CFmcjUgVNOhK+/
	DaULmiDv1jY/FKmsgfNMXDwZrv9wMFhVx1FUvlxJjbTBPnfeJ+cO7ohtLxbA+FbbEB
	sxqAxlC5/yt/UFqvrdi7OqMQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:38:11 +0200
Message-Id: <20191105213813.27546-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] procps: whitelist CVE-2018-1121
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
X-List-Received-Date: Tue, 05 Nov 2019 21:38:15 -0000

From: Ross Burton <ross.burton@intel.com>

This CVE is about race conditions in 'ps' which make it unsuitable for security
audits.  As these race conditions are unavoidable ps shouldn't be used for
security auditing, so this isn't a valid CVE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-extended/procps/procps_3.3.15.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.15.bb b/meta/recipes-extended/procps/procps_3.3.15.bb
index 9756db0e7b..f240e54fd8 100644
--- a/meta/recipes-extended/procps/procps_3.3.15.bb
+++ b/meta/recipes-extended/procps/procps_3.3.15.bb
@@ -4,9 +4,9 @@ the /proc filesystem. The package includes the programs ps, top, vmstat, w, kill
 HOMEPAGE = "https://gitlab.com/procps-ng/procps"
 SECTION = "base"
 LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                  file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
-                 "
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LIB;md5=4cf66a4984120007c9881cc871cf49db \
+                    "
 
 DEPENDS = "ncurses"
 
@@ -64,3 +64,6 @@ python __anonymous() {
         d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir'), prog))
 }
 
+# 'ps' isn't suitable for use as a security tool so whitelist this CVE.
+# https://bugzilla.redhat.com/show_bug.cgi?id=1575473#c3
+CVE_CHECK_WHITELIST += "CVE-2018-1121"
-- 
2.17.1


