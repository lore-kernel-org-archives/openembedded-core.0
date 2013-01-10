Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TtE4r-0006bc-9f
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 10:05:34 +0100
Received: by mail-ee0-f51.google.com with SMTP id d4so131873eek.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 00:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KnDVUGCw+ZGkHdKgGLeJmiEYYCmpZ4+FW9uWH6VuXNQ=;
	b=ZINZJozxHioI9UfMfwRJNcW5asIonBLYrI5w+60vzRA5/CP6DhgWqjdVlDf5c8ns3U
	oJn7cFH3GEaRD4gmOvvQ/7v2Y3g/FJxW+XZnu1uWS322bj+ahU0EJ9mW92Md07l0CFSv
	5fGZWQoXmMMO0oxIT8SRLIi5rJkchDY4Y+JA/JQG4uhjz6UyBKfarvONd9h6Mx3PrCsi
	aGdX+dfhdYBILhfPVe7Fu2eMwWOq8FzoUjqi4r2gVY/qGk0lpcs9se200F1MSjR8v1ju
	SUMyE/oCch+X7oy92w3Tf2f7aaAQkMdrNiqKH2qSKtaSTHq8eccmfsC8/MWCauQqRymC
	kqlA==
X-Received: by 10.14.213.134 with SMTP id a6mr190890552eep.45.1357807820465;
	Thu, 10 Jan 2013 00:50:20 -0800 (PST)
Received: from dhcp-10-54-86-82.cisco.com (64-103-25-233.cisco.com.
	[64.103.25.233])
	by mx.google.com with ESMTPS id 44sm1908196eek.0.2013.01.10.00.50.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 00:50:19 -0800 (PST)
From: Martin Ertsaas <martiert@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2013 09:50:06 +0100
Message-Id: <1357807806-31720-5-git-send-email-martiert@gmail.com>
X-Mailer: git-send-email 1.7.10.2 (Apple Git-33)
In-Reply-To: <1357807806-31720-1-git-send-email-martiert@gmail.com>
References: <1357807806-31720-1-git-send-email-martiert@gmail.com>
Subject: [PATCH 5/5] sstate: Do not add the --no-run-if-empty arguement to xargs when on Darwin, as it is not supported.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2013 09:05:39 -0000

---
 meta/classes/sstate.bbclass |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 68fd996..e92fbae 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -368,7 +368,7 @@ python sstate_cleanall() {
 }
 
 def sstate_hardcode_path(d):
-    import subprocess
+    import subprocess, platform
 
     # Need to remove hardcoded paths and fix these when we install the
     # staging packages.
@@ -390,7 +390,7 @@ def sstate_hardcode_path(d):
     else:
         sstate_grep_cmd = "grep -l -e '%s'" % (staging_host)
         sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging_host)
-    
+
     fixmefn =  sstate_builddir + "fixmepath"
 
     sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD', True)
@@ -399,9 +399,13 @@ def sstate_hardcode_path(d):
     # fixmepath file needs relative paths, drop sstate_builddir prefix
     sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g' %s" % (sstate_builddir, fixmefn)
 
+    xargs_no_empty_run_cmd = '--no-run-if-empty'
+    if platform.system() == 'Darwin':
+        xargs_no_empty_run_cmd = ''
+
     # Limit the fixpaths and sed operations based on the initial grep search
     # This has the side effect of making sure the vfs cache is hot
-    sstate_hardcode_cmd = "%s | xargs %s | %s | xargs --no-run-if-empty %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, sstate_sed_cmd)
+    sstate_hardcode_cmd = "%s | xargs %s | %s | xargs %s %s" % (sstate_scan_cmd, sstate_grep_cmd, sstate_filelist_cmd, xargs_no_empty_run_cmd, sstate_sed_cmd)
 
     print "Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd)
     subprocess.call(sstate_hardcode_cmd, shell=True)
-- 
1.7.10.2 (Apple Git-33)



