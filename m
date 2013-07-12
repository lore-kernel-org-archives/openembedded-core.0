Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39D296AF67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 05:42:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6C5g9Ae025704
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 22:42:09 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Jul 2013 22:42:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2013 13:42:04 +0800
Message-ID: <3393c80c31d82ac23afcddd39b1b24a9b5c1e696.1373607104.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1373607104.git.jackie.huang@windriver.com>
References: <cover.1373607104.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] kbd: Limit the kbdrate application to x86, mips and sparc
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
X-List-Received-Date: Fri, 12 Jul 2013 05:42:07 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The code relies on hardware specific memory locations to access
and modify the keyboard repeat rate.  It also requires read/write
access to /dev/port which doesn't exist on every architecture's
root fs. The defect was raised for Qemu PowerPC but it also fails on
ARM.  The keyboard emulation in qemuppc is for an ADB (Apple Desktop
Bus) device and not compatible with an Intel driver.  There's also no
indication in the documentation that the code should work on anything
other than Intel architecture but it also works on MIPS.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/kbd/kbd_1.15.2.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index 79ea468..25ca8be 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -28,3 +28,11 @@ inherit update-alternatives
 
 ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt"
 ALTERNATIVE_PRIORITY = "100"
+
+do_install_append() {
+        # Limit the kbdrate application to x86, mips and sparc.
+        if [ ${TARGET_ARCH} != "i586" -a ${TARGET_ARCH} != "x86_64" -a ${TARGET_ARCH} != "mips" \
+             -a ${TARGET_ARCH} != "mips64" -a ${TARGET_ARCH} != "sparc" ]; then
+                rm ${D}/${bindir}/kbdrate
+        fi
+}
-- 
1.7.4.1


