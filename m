Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SStaJ-0002uM-NF
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 19:24:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4BHEwL7016537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2012 10:14:59 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 11 May 2012 10:14:58 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 May 2012 12:17:54 -0500
Message-ID: <3a2207294f18cb4f06aa5a3afad52c7acbf2e510.1336756602.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1336756602.git.mark.hatle@windriver.com>
References: <cover.1336756602.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] sstate.bbclass: Optimize the generation and install path fixups
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
X-List-Received-Date: Fri, 11 May 2012 17:24:56 -0000
Content-Type: text/plain

The fixmepath file that is generated contains a list of all of the files
that need their paths fixed.  In the previous version the fixmepath was
generated to include all of the files that sed may have changed.  In the
new version, we first grep the files to see if they contain a path that
needs to be changed, only then do we perform the sed operation on those files.

This results in a modest performance increate in the creation of the sstate
file.  The following numbers include the do_package and do_populate_sysroot
tasks on the perl recipe.

Before the change:
real    4m23.018s
user    1m57.067s
sys     1m33.327s

After the change:
real    4m13.083s
user    1m54.062s
sys     1m26.064s

However, a more significnt performance gain is felt during the
extraction/install of sstate cache files, as the fixmepaths file now has a
significantly smaller list of files to modify.

Before the change:
real    0m39.798s
user    0m11.158s
sys     0m12.642s

After the change:
real    0m25.511s
user    0m8.408s
sys     0m5.077s

(All numbers above were recorded with a cold filesystem cache on a machine
with 12 GB of ram.)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/sstate.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ad7d121..3fc615d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -321,10 +321,13 @@ def sstate_hardcode_path(d):
 	sstate_builddir = d.getVar('SSTATE_BUILDDIR', True)
 
 	if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
+		sstate_grep_cmd = "grep -l -e '%s'" % (staging)
 		sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIR:g'" % (staging)
 	elif bb.data.inherits_class('cross', d):
+		sstate_grep_cmd = "grep -l -e '(%s|%s)'" % (staging_target, staging)
 		sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRTARGET:g; s:%s:FIXMESTAGINGDIR:g'" % (staging_target, staging)
 	else:
+		sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
 		sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging_host)
 	
 	sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD', True)
@@ -333,7 +336,9 @@ def sstate_hardcode_path(d):
 	# fixmepath file needs relative paths, drop sstate_builddir prefix
 	sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g' %sfixmepath" % (sstate_builddir, sstate_builddir)
 
-	sstate_hardcode_cmd = "%s | %s | xargs %s" % (sstate_scan_cmd, sstate_filelist_cmd, sstate_sed_cmd)
+	# Limit the fixpaths and sed operations based on the initial grep search
+	# This has the side effect of making sure the vfs cache is hot
+	sstate_hardcode_cmd = "%s | xargs %s | %s | xargs %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, sstate_sed_cmd)
 
 	print "Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd)
 	os.system(sstate_hardcode_cmd)
-- 
1.7.3.4



