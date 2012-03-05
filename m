Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tworaz666@gmail.com>) id 1S4gZu-0007xw-GD
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 23:40:26 +0100
Received: by eekc1 with SMTP id c1so1393832eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2012 14:31:51 -0800 (PST)
Received-SPF: pass (google.com: domain of tworaz666@gmail.com designates
	10.213.113.203 as permitted sender) client-ip=10.213.113.203; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of tworaz666@gmail.com
	designates 10.213.113.203 as permitted sender)
	smtp.mail=tworaz666@gmail.com;
	dkim=pass header.i=tworaz666@gmail.com
Received: from mr.google.com ([10.213.113.203])
	by 10.213.113.203 with SMTP id b11mr2754240ebq.164.1330986711714
	(num_hops = 1); Mon, 05 Mar 2012 14:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RzAVBCASO4dGOmCM2Sg4u1tbViKZOX8UT6XfQ4jkalw=;
	b=lr9m/ajFhLayd6JANqZgYUEkyBK/Wmanq8H6bCBxrqbx2Q6BePIV4my3AIR7aZweQB
	E10nseBXmfNRhRzsV+yJaVNtS4pum55Vd4cDj7S+j/+bHVMyO7c5QcMmGKb1pHCMNLwM
	u3WTeGOVsqWhUhY5FYhcOi9QIY68sVKjs0qRnxIaKOB2IlcMsf1Z3x3NAs9MrH3bslce
	elrx4zuYNtolq92txJER/oS0JkBK7ODMunwOSnDRU4In9ckOJLTU8ra6cLkbBqYOXEnS
	xy/WlQo6rQGRUh0RI8x6LT/1hqF+b/naIW1Uk1bfAWBy647FJC1ho+w9asXmC6hcdS+I
	RqeQ==
Received: by 10.213.113.203 with SMTP id b11mr2087104ebq.164.1330986711639;
	Mon, 05 Mar 2012 14:31:51 -0800 (PST)
Received: from localhost.localdomain (89-77-50-243.dynamic.chello.pl.
	[89.77.50.243])
	by mx.google.com with ESMTPS id u9sm66436268eem.11.2012.03.05.14.31.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 14:31:51 -0800 (PST)
From: Peter Tworek <tworaz666@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2012 23:31:34 +0100
Message-Id: <1330986694-28199-1-git-send-email-tworaz666@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] psplash: Add mising commands module import.
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
X-List-Received-Date: Mon, 05 Mar 2012 22:40:26 -0000

Python commands module is used in the recipe, but never imported.
This leads to build errors like:

NameError: global name 'commands' is not defined

ERROR: The stack trace of python calls that resulted in this exception/failure was:
ERROR:   File "do_compile", line 24, in <module>
ERROR:
ERROR:   File "do_compile", line 11, in do_compile
ERROR:
ERROR: The code that was being executed was:
ERROR:      0020:        bb.build.exec_func("oe_runmake", d)
ERROR:      0021:        shutil.copyfile("psplash", outputfile)
ERROR:      0022:
ERROR:      0023:
ERROR:  *** 0024:do_compile(d)
ERROR:      0025:
ERROR: (file: 'do_compile', lineno: 24, function: <module>)
ERROR:      0007:    localfiles = d.getVar('SPLASH_LOCALPATHS', True).split()
ERROR:      0008:    outputfiles = d.getVar('SPLASH_INSTALL', True).split()
ERROR:      0009:    for localfile, outputfile in zip(localfiles, outputfiles):
ERROR:      0010:        if localfile.endswith(".png"):
ERROR:  *** 0011:            outp = commands.getstatusoutput('./make-image-header.sh %s POKY' % localfile)
ERROR:      0012:            print(outp[1])
ERROR:      0013:            fbase = os.path.splitext(os.path.basename(localfile))[0]
ERROR:      0014:            shutil.copyfile("%s-img.h" % fbase, destfile)
ERROR:      0015:        else:

Signed-off-by: Peter Tworek <tworaz666@gmail.com>
---
 meta/recipes-core/psplash/psplash_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 42ea615..bd405f9 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -68,7 +68,7 @@ S = "${WORKDIR}/git"
 inherit autotools pkgconfig update-rc.d
 
 python do_compile () {
-    import shutil
+    import shutil, commands
 
     # Build a separate executable for each splash image
     destfile = "%s/psplash-poky-img.h" % d.getVar('S', True)
-- 
1.7.3.4



