Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0b4f-0003xO-9J
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 16:59:17 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so619839eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.32.67 as permitted sender) client-ip=10.213.32.67; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.32.67 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.32.67])
	by 10.213.32.67 with SMTP id b3mr604461ebd.75.1330012258146 (num_hops =
	1); Thu, 23 Feb 2012 07:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZnUhzNbVZNm9gQhMeZzZfzAzj91JYKwbaoYsxPYEIZQ=;
	b=SUp4sCg8eTZhNNqxfbYMZm0oyclNEROj0tJcZwRQ4zuPLBo+hXs/lHmyjE+N5SWBke
	zT7SrmwxgiiIzWDV6tpLU2gkgNZDJQrVxQExnZ1wRWj1ocq/nLmQNfw2wSTf0AhDHmSw
	LlxzzxD9QqrQAoyTHu7nG67S1TCgl4fXdXdQg=
Received: by 10.213.32.67 with SMTP id b3mr475744ebd.75.1330012258061;
	Thu, 23 Feb 2012 07:50:58 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a58sm6643082eeb.8.2012.02.23.07.50.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:50:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:50:27 +0100
Message-Id: <c79b78bd5e3d4869682f7d3a0d09af61e3dc4da4.1330012029.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <3a155936ed32d2296f38a499c41490f215b6fb4d.1330012029.git.Martin.Jansa@gmail.com>
References: <3a155936ed32d2296f38a499c41490f215b6fb4d.1330012029.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330012029.git.Martin.Jansa@gmail.com>
References: <cover.1330012029.git.Martin.Jansa@gmail.com>
Subject: [PATCH 11/11] sstate.bbclass: improve performance of sstate package creation
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
X-List-Received-Date: Thu, 23 Feb 2012 15:59:17 -0000

* also fixes replacing paths for perl where cmd line was probably
  too long for os.system(cmd) (it had 560410 characters because a lot of
  files from sstate_scan_cmd).
* also print those 2 commands so we can find them in log.do_package

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sstate.bbclass |   39 ++++++++++++++++-----------------------
 1 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index ee9bf05..6883843 100644
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
+	sstate_filelist_relative_cmd = "sed -i -e 's:^%s::g %sfixmepath'" % (sstate_builddir, sstate_builddir)
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



