Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlyd-0001XF-LP
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213862"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:50 -0800
Message-Id: <980638ee3c8b6da60e1ae7ee24271ea16b973d02.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/20] sstate.bbclass: Optimise sstate_hardcode_path
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Feb 2012 08:37:08 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The sstate_hardcode_path() function triggered large numbers of exec()
calls when processing packages with large numbers of file relocations
(e.g. perl). This patch optimises those calls into longer single commands
which make the code significantly more efficient.

This reduced the do_package time for perl by 2 minutes (from 4.75 minutes)
for me.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass |   27 ++++++++++++++++-----------
 1 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 4bd3712..d4f95c1 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -317,19 +317,24 @@ def sstate_hardcode_path(d):
 	staging_host = d.getVar('STAGING_DIR_HOST', True)
 	sstate_builddir = d.getVar('SSTATE_BUILDDIR', True)
 
-	for i in file_list.split('\n'):
-		if not i:
-			continue           
-		if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
-			cmd = "sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging, i)
-		elif bb.data.inherits_class('cross', d):
-			cmd = "sed -i -e s:%s:FIXMESTAGINGDIRTARGET:g %s \
-				sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging_target, i, staging, i)
-		else:
-			cmd = "sed -i -e s:%s:FIXMESTAGINGDIRHOST:g %s" % (staging_host, i)
+	files = " ".join(file_list.split('\n'))
 
+	if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
+		cmd = "sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging, files)
+	elif bb.data.inherits_class('cross', d):
+		cmd = "sed -i -e s:%s:FIXMESTAGINGDIRTARGET:g %s \
+			sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging_target, files, staging, files)
+	else:
+		cmd = "sed -i -e s:%s:FIXMESTAGINGDIRHOST:g %s" % (staging_host, files)
+
+	if files:
 		os.system(cmd)
-		os.system("echo %s | sed -e 's:%s::' >> %sfixmepath" % (i, sstate_builddir, sstate_builddir))
+		fix = open("%sfixmepath" % (sstate_builddir), "w")
+		fixme = []
+		for f in file_list.split('\n'):
+			fixme.append(f.replace(sstate_builddir, ""))
+		fix.write("\n".join(fixme))
+		fix.close()
 	p.close()
 
 def sstate_package(ss, d):
-- 
1.7.6.5



