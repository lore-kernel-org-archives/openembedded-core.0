Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SkA1K-0000BJ-Tp
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 10:24:10 +0200
Received: by werg55 with SMTP id g55so1259163wer.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 01:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=3gfPAMojWrAvC+it1aWI3Xo2oZicVlgJd1lGfWCLPio=;
	b=SFd1uYsjkXAgMFmG/EhXnz+0jmd0bXFyUjZ3Wmk2DUnEkNva5K1wZsPZw51QMpyK5I
	mSGFf3zIt7ZnxN6aSd+ccMgEJCFnxoSC6vLMQb+/Lvo3BtVraFQtW6f9vAmpIqAnahgH
	XzUDP76yB4r0fVVlXICVM3pNpAs4cwvlEwd5AlnZ0M6GLYvt3HX3FkyB4VYpwPAJ0mWd
	GVzI71cq6tIMXeA2sjxFHG0+0tns/AX7gEUPQDfWfeaXmKu1ViqHqOG0p53k0yeaPdoA
	nheZJ4RMYUDt3hMedihBea3HcnpW2jWhfI8TBXzLJcko8ebSZSnHcLV9con7qh0LjH3T
	QuLw==
Received: by 10.216.216.154 with SMTP id g26mr555343wep.120.1340871196662;
	Thu, 28 Jun 2012 01:13:16 -0700 (PDT)
Received: from localhost.localdomain ([79.117.121.110])
	by mx.google.com with ESMTPS id db7sm15334723wib.6.2012.06.28.01.13.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 01:13:15 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 11:13:06 +0300
Message-Id: <1340871186-20545-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkGb979+L+edC5Md01XlAQj9CkZ1xY0KinAWPF58sYG9kr8rjS/JU37c9vU/UmzUWiNN5e/
Subject: [PATCH] package.bbclass: Create symlinks for packages with different packaged name
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
X-List-Received-Date: Thu, 28 Jun 2012 08:24:11 -0000

While generating license.manifest package information is searched in:
filename=`ls ${TMPDIR}/pkgdata/*/runtime/${pkg}| head -1`
This is ok as long as package name is the same as the package name
after packaging.
For example dbus is packaged as dbus-1. So, searching
ls ${TMPDIR}/pkgdata/*/runtime/dbus-1 will fail because there is no file
with this package name.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/package.bbclass |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 10c2f0a..460b351 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1120,6 +1120,11 @@ python emit_pkgdata() {
 		sf.write('%s_%s: %s\n' % ('PKGSIZE', pkg, get_directory_size(pkgdest + "/%s" % pkg)))
 		sf.close()
 
+		# Symlinks needed while generating manifest
+		pkgval = d.getVar('PKG_%s' % (pkg), True)
+		if pkgval != pkg:
+			subdata_sym = pkgdatadir + "/runtime/%s" % pkgval
+			os.symlink(pkg,subdata_sym)
 
 		allow_empty = d.getVar('ALLOW_EMPTY_%s' % pkg, True)
 		if not allow_empty:
-- 
1.7.9.5



