Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 69C4A6F598
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 18:10:45 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id k14so3629295wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 10:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=F28Rgp5RTUP70Y1/MiJx8MtCVhxcfmcwJs+5rCmQhrI=;
	b=rZ89TPCpiPogH0rOvI0CLlzBcRE4z16EtNj8MCnVexS2F+2M0D9EUeNZBohVlVmr8R
	7c13MdNWNc7z/St0ZKkSWx49zVj+YghROzdQmB+1y/+MkfVelnEC9VGz/ZF8AZZ3Sp91
	C2aUJ1iUdrWl/F1y5paIFkvx+plKWSzoXQlh4DTkwJul8sIEUEtNJdl8V+Wh66yytWAw
	cOGDdgcbh0e/5imXKH/9l/E3QYBt/eiQN6ntGOV08NBT1XxsjcZnVwwa31ZSp/glZ+b/
	jbDVU8B/DoMSPtspYTJPgixMxCLgcUjSx45xZUEdvTk00IWYiU0DFyOJYY+Itp5dbVHo
	lEXQ==
X-Received: by 10.194.2.168 with SMTP id 8mr12459634wjv.8.1394129445741;
	Thu, 06 Mar 2014 10:10:45 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id ju6sm20437106wjc.1.2014.03.06.10.10.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 06 Mar 2014 10:10:45 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 11:10:43 -0700
Message-Id: <1394129443-1427-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] kernel-yocto: fix diffconfig/kernel_configme breakage
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
X-List-Received-Date: Thu, 06 Mar 2014 18:10:47 -0000

The bbclass did the following:

    do_diffconfig[depends] += "virtual/kernel:do_kernel_configme"

This clearly introduces a cross-kernel task dependency if the recipe
inheriting this class isn't the preferred provider of virtual/kernel, which is
obviously wrong, but further, will break the build if a kernel-yocto based
kernel is parsed and not skipped, but virtual/kernel refers to
a non-kernel-yocto recipe, which would not have the do_kernel_configme task.

Work around this by adding the in-recipe task dep programmatically with
bb.build.addtask when do_diffconfig exists.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index fb8e04e..ef9b9d1 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -263,6 +263,8 @@ do_kernel_configme() {
 	echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
 }
 
+addtask kernel_configme after do_patch
+
 python do_kernel_configcheck() {
     import re, string, sys
 
@@ -407,4 +409,8 @@ OE_TERMINAL_EXPORTS += "GUILT_BASE KBUILD_OUTPUT"
 GUILT_BASE = "meta"
 KBUILD_OUTPUT = "${B}"
 
-do_diffconfig[depends] += "virtual/kernel:do_kernel_configme"
+python () {
+    # If diffconfig is available, ensure it runs after kernel_configme
+    if 'do_diffconfig' in d:
+        bb.build.addtask('do_diffconfig', None, 'do_kernel_configme', d)
+}
-- 
1.8.3.4


