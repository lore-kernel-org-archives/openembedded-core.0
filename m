Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rve8s-0001G8-ST for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 01:15:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1A0750e023993
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:07:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22290-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:07:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1A06uIC023987
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 00:06:56 GMT
Message-ID: <1328832425.10451.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Feb 2012 00:07:05 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] sstate.bbclass: Optimise sstate_hardcode_path
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
X-List-Received-Date: Fri, 10 Feb 2012 00:15:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The sstate_hardcode_path() function triggered large numbers of exec()
calls when processing packages with large numbers of file relocations
(e.g. perl). This patch optimises those calls into longer single commands
which make the code significantly more efficient.

This reduced the do_package time for perl by 2 minutes (from 4.75 minutes)
for me.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
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




