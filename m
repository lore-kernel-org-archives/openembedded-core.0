Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SScev-0004sR-3u
	for openembedded-core@lists.openembedded.org;
	Fri, 11 May 2012 01:20:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4ANAcUC020860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2012 16:10:38 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 10 May 2012 16:10:37 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 May 2012 18:13:38 -0500
Message-ID: <8c6c132129d83dca4e5b88a642126901c32a78de.1336691544.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1336691544.git.mark.hatle@windriver.com>
References: <cover.1336691544.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] sstate.bbclass: Improve sstate_installpkg performance
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
X-List-Received-Date: Thu, 10 May 2012 23:20:33 -0000
Content-Type: text/plain

In a pathological case, lots of files to process, the sstate_installpkg
performance was very poor.  It interated over each file and ran 3
individual sed commands per file.  Changing this to keep iterating
but running only a single command took about 1/3 time time.

However, when looking at the corresponding sstate_hardcode_path
function, it was clear we could optimize this further.

Using the same encoding logic to specify only the minimumal sed
operation necessary, and using xargs to avoid the os.system call the
install step was able to be performed in 13% of the original time.

Example timing numbers for perl:

3m7s original code
1m20s single sed, but interating
0m26s using xargs and limited sed

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/sstate.bbclass |   28 +++++++++++++++++++++-------
 1 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a8c98e5..ad7d121 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -174,18 +174,29 @@ def sstate_installpkg(ss, d):
     bb.build.exec_func('sstate_unpack_package', d)
 
     # Fixup hardcoded paths
+    #
+    # Note: The logic below must match the reverse logic in
+    # sstate_hardcode_path(d)
+
     fixmefn =  sstateinst + "fixmepath"
     if os.path.isfile(fixmefn):
         staging = d.getVar('STAGING_DIR', True)
         staging_target = d.getVar('STAGING_DIR_TARGET', True)
         staging_host = d.getVar('STAGING_DIR_HOST', True)
-        fixmefd = open(fixmefn, "r")
-        fixmefiles = fixmefd.readlines()
-        fixmefd.close()
-        for file in fixmefiles:
-            os.system("sed -i -e s:FIXMESTAGINGDIRTARGET:%s:g %s" % (staging_target, sstateinst + file))
-            os.system("sed -i -e s:FIXMESTAGINGDIRHOST:%s:g %s" % (staging_host, sstateinst + file))
-            os.system("sed -i -e s:FIXMESTAGINGDIR:%s:g %s" % (staging, sstateinst + file))
+
+	if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
+		sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIR:%s:g'" % (staging)
+	elif bb.data.inherits_class('cross', d):
+		sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRTARGET:%s:g; s:FIXMESTAGINGDIR:%s:g'" % (staging_target, staging)
+	else:
+		sstate_sed_cmd = "sed -i -e 's:FIXMESTAGINGDIRHOST:%s:g'" % (staging_host)
+
+	# Add sstateinst to each filename in fixmepath, use xargs to efficiently call sed
+	sstate_hardcode_cmd = "sed -e 's:^:%s:g' %s | xargs %s" % (sstateinst, fixmefn, sstate_sed_cmd)
+
+	print "Replacing fixme paths in sstate package: %s" % (sstate_hardcode_cmd)
+	os.system(sstate_hardcode_cmd)
+
         # Need to remove this or we'd copy it into the target directory and may 
         # conflict with another writer
         os.remove(fixmefn)
@@ -300,6 +311,9 @@ python sstate_cleanall() {
 def sstate_hardcode_path(d):
 	# Need to remove hardcoded paths and fix these when we install the
 	# staging packages.
+	#
+	# Note: the logic in this function needs to match the reverse logic
+	# in sstate_installpkg(ss, d)
 
 	staging = d.getVar('STAGING_DIR', True)
 	staging_target = d.getVar('STAGING_DIR_TARGET', True)
-- 
1.7.3.4



