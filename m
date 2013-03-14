Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UFw5h-0005jR-1x for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 01:32:17 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2E0OAHv015263 for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 00:24:11 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jindxxtlx-0f
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 00:24:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2E0NwWp015259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 00:24:04 GMT
Message-ID: <1363220110.6295.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Mar 2013 00:15:10 +0000
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] package_rpm: Ensure package dependencies have correct version numbers
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
X-List-Received-Date: Thu, 14 Mar 2013 00:32:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If a recipe has versioned dependencies on another package within
the same recipe, there are potentially races where the version
remapping may not happen correctly.

This issue triggered with neard in multilib builds since it
uses a "-" character in its PV which is illegal in an rpm version
field. The remapping to "+" was not occuring.

It only triggers in the multilib case since in this case, expansion
of the datastore happens at slightly different points.

The correct fix is to search for PV, not PKGV but substitute the
PV value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 3ac379d..8aa868d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -607,8 +607,9 @@ python write_specfile () {
                     if '-' in ver:
                         subd = oe.packagedata.read_subpkgdata_dict(dep, d)
                         if 'PKGV' in subd:
-                            pv = subd['PKGV']
-                            reppv = pv.replace('-', '+')
+                            pv = subd['PV']
+                            pkgv = subd['PKGV']
+                            reppv = pkgv.replace('-', '+')
                             verlist.append(ver.replace(pv, reppv))
                     else:
                         verlist.append(ver)




