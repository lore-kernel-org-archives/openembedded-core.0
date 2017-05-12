Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C5C2F77B50
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 08:16:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v4C8GO7g028686
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 12 May 2017 09:16:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1d95kO-0001Zj-Gg; Fri, 12 May 2017 09:16:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 May 2017 09:16:21 +0100
Message-Id: <1494576982-6006-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494576982-6006-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1494576982-6006-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Fri, 12 May 2017 09:16:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 3/4] populate_sdk_ext: Avoid build failures where sstate was used
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
X-List-Received-Date: Fri, 12 May 2017 08:16:29 -0000

If sstate was used to populate the build and one of the universal-4.8
or universal-4.9 mirror urls was used, the sstate checks during eSDK
construction could fail as it would zero out the SSTATE_MIRRORs
variable.

Use the same mirrors variable setting as the eSDK would end up using
to perform the checks to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 4dfb94c..69bc1d9 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -111,7 +111,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
         with open(sdkbasepath + '/conf/local.conf', 'a') as f:
             # Force the use of sstate from the build system
             f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % d.getVar('SSTATE_DIR'))
-            f.write('SSTATE_MIRRORS_forcevariable = ""\n')
+            f.write('SSTATE_MIRRORS_forcevariable = "file://universal/(.*) file://universal-4.9/\\1 file://universal-4.9/(.*) file://universal-4.8/\\1"\n')
             # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
             f.write('TMPDIR_forcevariable = "${TOPDIR}/tmp"\n')
             f.write('TCLIBCAPPEND_forcevariable = ""\n')
-- 
2.7.4


