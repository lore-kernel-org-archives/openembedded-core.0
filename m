Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SV7W4-0004Fy-Ni
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 22:41:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4HKVep4004707
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 13:31:40 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 May 2012 13:31:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2012 15:34:20 -0500
Message-ID: <9e0928b2bbffb04eb4888be4d937e3b432160269.1337286797.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337286797.git.mark.hatle@windriver.com>
References: <cover.1337286797.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] sstate.bbclass: Make sure we don't have an empty fixmepath file
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
X-List-Received-Date: Thu, 17 May 2012 20:41:45 -0000
Content-Type: text/plain

Jason Wessel noticed that a package without any fixmepath entries would
generate a sed warning about no input files.  This patch resolves that
by ensuring that an empty fixmepath file never gets written into the
sstate archive.  Also we avoid a second message by only doing xargs if
we got input.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/sstate.bbclass |   17 ++++++++++++-----
 1 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 3fc615d..ace4c1f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -330,20 +330,27 @@ def sstate_hardcode_path(d):
 		sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
 		sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging_host)
 	
+	fixmefn =  sstate_builddir + "fixmepath"
+
 	sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD', True)
-	sstate_filelist_cmd = "tee %sfixmepath" % (sstate_builddir)
+	sstate_filelist_cmd = "tee %s" % (fixmefn)
 
 	# fixmepath file needs relative paths, drop sstate_builddir prefix
-	sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g' %sfixmepath" % (sstate_builddir, sstate_builddir)
+	sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g' %s" % (sstate_builddir, fixmefn)
 
 	# Limit the fixpaths and sed operations based on the initial grep search
 	# This has the side effect of making sure the vfs cache is hot
-	sstate_hardcode_cmd = "%s | xargs %s | %s | xargs %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, sstate_sed_cmd)
+	sstate_hardcode_cmd = "%s | xargs %s | %s | xargs --no-run-if-empty %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, sstate_sed_cmd)
 
 	print "Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd)
 	os.system(sstate_hardcode_cmd)
-	print "Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd)
-	os.system(sstate_filelist_relative_cmd)
+
+        # If the fixmefn is empty, remove it..
+	if os.stat(fixmefn).st_size == 0:
+		os.remove(fixmefn)
+	else:
+		print "Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd)
+		os.system(sstate_filelist_relative_cmd)
 
 def sstate_package(ss, d):
     import oe.path
-- 
1.7.3.4



