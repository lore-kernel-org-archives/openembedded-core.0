Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 735706EC83
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 09:44:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2S9iGMs024702
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Mar 2014 02:44:18 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 28 Mar 2014 02:44:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Mar 2014 17:43:53 +0800
Message-ID: <f282ca8748c5972477200cc3cacdad38a0943a95.1395996410.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1395996410.git.hongxu.jia@windriver.com>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/5] syslinux.bbclass: Enable additional kernel parameters for syslinux
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
X-List-Received-Date: Fri, 28 Mar 2014 09:44:17 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

Add additional parameter 'SYSLINUX_KERNEL_ARGS' in order to allow
for specific kernel parameters to be set when using syslinux.

The extra kernel parameters are added to btype[1] and then written out
as part of the APPEND field.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/syslinux.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index 62d4b7a..8964d3f 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -15,6 +15,7 @@
 # ${SYSLINUX_DEFAULT_CONSOLE} - set to "console=ttyX" to change kernel boot default console
 # ${SYSLINUX_SERIAL} - Set an alternate serial port or turn off serial with empty string
 # ${SYSLINUX_SERIAL_TTY} - Set alternate console=tty... kernel boot argument
+# ${SYSLINUX_KERNEL_ARGS} - Add additional kernel arguments
 
 do_bootimg[depends] += "syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
@@ -162,6 +163,10 @@ python build_syslinux_cfg () {
         for btype in btypes:
             cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], label))
 
+            exargs = d.getVar('SYSLINUX_KERNEL_ARGS', True)
+            if exargs:
+                btype[1] += " " + exargs
+
             append = localdata.getVar('APPEND', True)
             initrd = localdata.getVar('INITRD', True)
 
-- 
1.8.1.2


