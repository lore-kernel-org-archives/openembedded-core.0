Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCIHq-0008Lc-F3 for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 00:53:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8DMeZk3003671
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 23:40:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03468-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 23:40:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8DMeRGS003655
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 23:40:28 +0100
Message-ID: <1347576029.11710.115.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Sep 2012 23:40:29 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] opkg: Fix package dependency issue for preinsts
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
X-List-Received-Date: Thu, 13 Sep 2012 22:53:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

When processing dependencies, we need to look for both the SW_INSTALL and
SW_UNKNOWN states. If we don't do this, dependencies can be missed
and preinst scripts can run before dependencies are all installed.

This leads to package installation errors for packages like dbus-1
and associated user permission errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/opkg/opkg/fix_installorder.patch b/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
index 9dd10b2..6a7e6db 100644
--- a/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
+++ b/meta/recipes-devtools/opkg/opkg/fix_installorder.patch
@@ -147,7 +147,7 @@ Index: trunk/libopkg/pkg_depends.c
 +							       dependence_to_satisfy, 0);
 +               /* Being that I can't test constraing in pkg_hash, I will test it here */
 +	       if (satisfying_pkg != NULL && satisfying_pkg != pkg) {
-+                  if (pkg_constraint_satisfied(satisfying_pkg, dependence_to_satisfy) && satisfying_pkg->state_want == SW_INSTALL)
++                  if (pkg_constraint_satisfied(satisfying_pkg, dependence_to_satisfy) && (satisfying_pkg->state_want == SW_INSTALL || satisfying_pkg->state_want == SW_UNKNOWN))
 +	              pkg_vec_insert(satisfiers, satisfying_pkg);
 +               }
 +
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index a0667ac..4146b7e 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -14,4 +14,4 @@ S = "${WORKDIR}/trunk"
 SRCREV = "633"
 PV = "0.1.8+svnr${SRCPV}"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
--
cgit 0.9.0.1




