Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 93B656D39D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 23:18:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA7NItJR031583 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2013 23:18:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8lqkECk8R95l
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 23:18:55 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA7NIo0V031579
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Nov 2013 23:18:51 GMT
Message-ID: <1383866326.6271.286.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 07 Nov 2013 23:18:46 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Thu, 07 Nov 2013 23:19:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

An empty distro value leads to OVERRIDES and FILESOVERRIDES containing
"::" entries which causes odd issues such as files being included when
they shouldn't be. We could put in anonymous python to guard against
empty entries but its messy and setting a default value for DISTRO to
something harmless is much easier.

This patch adds a weak default and ensures the sanity test doesn't
complain about it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index b8e5b02..83378b0 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -599,7 +599,7 @@ def check_sanity_everybuild(status, d):
     # Check that the DISTRO is valid, if set
     # need to take into account DISTRO renaming DISTRO
     distro = d.getVar('DISTRO', True)
-    if distro:
+    if distro and distro != "nodistro":
         if not ( check_conf_exists("conf/distro/${DISTRO}.conf", d) or check_conf_exists("conf/distro/include/${DISTRO}.inc", d) ):
             status.addresult("DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % d.getVar("DISTRO", True))
 
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d7b7a4b..ea313ad 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -656,6 +656,10 @@ AUTO_LIBNAME_PKGS = "${PACKAGES}"
 ### Config file processing
 ###
 
+# An empty distro leads to :: entries in OVERRIDES and FILEOVERRIDES which 
+# is a bad idea. Setting a dummy value is better than a ton of anonymous python.
+DISTRO ??= "nodistro"
+
 # Overrides are processed left to right, so the ones that are named later take precedence.
 # You generally want them to go from least to most specific.
 # 



