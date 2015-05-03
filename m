Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E4D5D73C7D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 May 2015 10:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t43AbwSG019904 for <openembedded-core@lists.openembedded.org>;
	Sun, 3 May 2015 11:37:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BhwGReDElxjy
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 May 2015 11:37:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t43Abg3v019901
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 May 2015 11:37:53 +0100
Message-ID: <1430649462.18360.93.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 03 May 2015 11:37:42 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf/base.bbclass: Drop PRINC support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 May 2015 10:38:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

PRINC is no longer needed since we have the PR service instead
which people should be using. Drop the PRINC code.

This has been deprecated with a warning and then an error for quite some
time so we can remove it now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index c6494e3..d19d9e1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -394,22 +394,6 @@ python () {
         else:
             appendVar('EXTRA_OECONF', extraconf)
 
-    # If PRINC is set, try and increase the PR value by the amount specified
-    # The PR server is now the preferred way to handle PR changes based on
-    # the checksum of the recipe (including bbappend).  The PRINC is now
-    # obsolete.  Return a warning to the user.
-    princ = d.getVar('PRINC', True)
-    if princ and princ != "0":
-        bb.error("Use of PRINC %s was detected in the recipe %s (or one of its .bbappends)\nUse of PRINC is deprecated.  The PR server should be used to automatically increment the PR.  See: https://wiki.yoctoproject.org/wiki/PR_Service." % (princ, d.getVar("FILE", True)))
-        pr = d.getVar('PR', True)
-        pr_prefix = re.search("\D+",pr)
-        prval = re.search("\d+",pr)
-        if pr_prefix is None or prval is None:
-            bb.error("Unable to analyse format of PR variable: %s" % pr)
-        nval = int(prval.group(0)) + int(princ)
-        pr = pr_prefix.group(0) + str(nval) + pr[prval.end():]
-        d.setVar('PR', pr)
-
     pn = d.getVar('PN', True)
     license = d.getVar('LICENSE', True)
     if license == "INVALID":
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f544a71..8653a7f 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -182,7 +182,6 @@ ASSUME_PROVIDED = "\
 PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'}"
 PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '1.0'}"
 PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or 'r0'}"
-PRINC ?= "0"
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE\x7d_'][int(d.getVar('PE',1) or 0) > 0]}"
 P = "${PN}-${PV}"



