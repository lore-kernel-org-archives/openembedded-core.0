Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C0E126F472
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 17:39:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s22HcrJX023868 for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Mar 2014 17:39:33 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SuFhB75DHZxj
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Mar 2014 17:39:33 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s22HdTd4023935
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 2 Mar 2014 17:39:30 GMT
Message-ID: <1393781961.22581.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 02 Mar 2014 17:39:21 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH RFC] bitbake.conf/base.bbclass: Drop PRINC support
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
X-List-Received-Date: Sun, 02 Mar 2014 17:39:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

PRINC is no longer needed since we have the PR service instead
which people should be using. Drop the PRINC code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3e9051c..3cbf2cb 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -455,18 +455,6 @@ python () {
         else:
             appendVar('EXTRA_OECONF', extraconf)
 
-    # If PRINC is set, try and increase the PR value by the amount specified
-    princ = d.getVar('PRINC', True)
-    if princ and princ != "0":
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
index 4879aa2..a4a7107 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -188,7 +188,6 @@ ASSUME_PROVIDED = "\
 PN = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[0] or 'defaultpkgname'}"
 PV = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[1] or '1.0'}"
 PR = "${@bb.parse.BBHandler.vars_from_file(d.getVar('FILE'),d)[2] or 'r0'}"
-PRINC ?= "0"
 PF = "${PN}-${EXTENDPE}${PV}-${PR}"
 EXTENDPE = "${@['','${PE\x7d_'][int(d.getVar('PE',1) or 0) > 0]}"
 P = "${PN}-${PV}"



