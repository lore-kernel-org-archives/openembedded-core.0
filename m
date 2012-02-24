Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0yjw-0006R5-3B
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 18:15:28 +0100
Received: by eekd41 with SMTP id d41so1222159eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 09:07:05 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.39.6 as permitted sender) client-ip=10.14.39.6; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.39.6 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.39.6])
	by 10.14.39.6 with SMTP id c6mr1999868eeb.41.1330103225410 (num_hops =
	1); Fri, 24 Feb 2012 09:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6M9TGbSY62tUTVibaLOqyBDb2NNiMMTRQ+Tsues2AxA=;
	b=lCwNe2cGMtFtkITsgYAX0uc5ggFhkjUOYfLNj/sVoDtCTsR0l+puP4OsoSuYoVDimM
	T5QkiDmyt31iYaIVin5YR21pb8Zu509NqlAtw2L2PQg4xZ4sn1vKil7lTLJDFJUquENo
	Ke0jM6LDJhuqavJqqIaRtzUyRiTBK7rs/BoJ8=
Received: by 10.14.39.6 with SMTP id c6mr1494853eeb.41.1330103225330;
	Fri, 24 Feb 2012 09:07:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y14sm20068782eef.10.2012.02.24.09.06.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 09:06:59 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 18:06:50 +0100
Message-Id: <141f227e9201766a9657a41a92a5d5485adcd513.1330102968.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <cover.1330102968.git.Martin.Jansa@gmail.com>
References: <cover.1330102968.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/7] sstate.bbclass: improve performance of sstate package creation
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
X-List-Received-Date: Fri, 24 Feb 2012 17:15:28 -0000

* also fixes replacing paths for perl where cmd line was probably
  too long for os.system(cmd) (it had 560410 characters because a lot of
  files from sstate_scan_cmd).
* also print those 2 commands so we can find them in log.do_package

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass |   39 ++++++++++++++++-----------------------
 1 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ee9bf05..d20b62a 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -304,38 +304,31 @@ python sstate_cleanall() {
 def sstate_hardcode_path(d):
 	# Need to remove hardcoded paths and fix these when we install the
 	# staging packages.
-	sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD', True)
-	p = os.popen("%s" % sstate_scan_cmd)
-	file_list = p.read()
-
-	if file_list == "":
-		p.close()
-		return
 
 	staging = d.getVar('STAGING_DIR', True)
 	staging_target = d.getVar('STAGING_DIR_TARGET', True)
 	staging_host = d.getVar('STAGING_DIR_HOST', True)
 	sstate_builddir = d.getVar('SSTATE_BUILDDIR', True)
 
-	files = " ".join(file_list.split('\n'))
-
 	if bb.data.inherits_class('native', d) or bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_class('cross-canadian', d):
-		cmd = "sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging, files)
+		sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIR:g'" % (staging)
 	elif bb.data.inherits_class('cross', d):
-		cmd = "sed -i -e s:%s:FIXMESTAGINGDIRTARGET:g %s \
-			sed -i -e s:%s:FIXMESTAGINGDIR:g %s" % (staging_target, files, staging, files)
+		sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRTARGET:g; s:%s:FIXMESTAGINGDIR:g'" % (staging_target, staging)
 	else:
-		cmd = "sed -i -e s:%s:FIXMESTAGINGDIRHOST:g %s" % (staging_host, files)
-
-	if files:
-		os.system(cmd)
-		fix = open("%sfixmepath" % (sstate_builddir), "w")
-		fixme = []
-		for f in file_list.split('\n'):
-			fixme.append(f.replace(sstate_builddir, ""))
-		fix.write("\n".join(fixme))
-		fix.close()
-	p.close()
+		sstate_sed_cmd = "sed -i -e 's:%s:FIXMESTAGINGDIRHOST:g'" % (staging_host)
+	
+	sstate_scan_cmd = d.getVar('SSTATE_SCAN_CMD', True)
+	sstate_filelist_cmd = "tee %sfixmepath" % (sstate_builddir)
+
+	# fixmepath file needs relative paths, drop sstate_builddir prefix
+	sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g' %sfixmepath" % (sstate_builddir, sstate_builddir)
+
+	sstate_hardcode_cmd = "%s | %s | xargs %s" % (sstate_scan_cmd, sstate_filelist_cmd, sstate_sed_cmd)
+
+	print "Removing hardcoded paths from sstate package: '%s'" % (sstate_hardcode_cmd)
+	os.system(sstate_hardcode_cmd)
+	print "Replacing absolute paths in fixmepath file: '%s'" % (sstate_filelist_relative_cmd)
+	os.system(sstate_filelist_relative_cmd)
 
 def sstate_package(ss, d):
     import oe.path
-- 
1.7.8.4



