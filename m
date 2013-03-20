Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UI7Ah-0006wR-6R
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 01:46:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2K0TaKx025737
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 17:29:36 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 19 Mar 2013 17:29:32 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 08:29:22 +0800
Message-ID: <eec6aa898aec7e2941673a1a99e86a163a3e24f6.1363676392.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363676392.git.hongxu.jia@windriver.com>
References: <cover.1363676392.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] package_rpm.bbclass: fix build multilib image failed when PR Server enabled
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
X-List-Received-Date: Wed, 20 Mar 2013 00:46:29 -0000
Content-Type: text/plain

1, In bitbake.conf
   PKGR ?= "${PR}${EXTENDPRAUTO}"
   EXTENDPKGV ?= "${EXTENDPKGEVER}${PKGV}-${PKGR}"
   RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"

2, When PR Server is enabled, EXTENDPRAUTO is not none which means PKGR and PR
don't have the same value.

3, When multilib is enabled, RDEPENDS_${PN}-dev is not expanded correctly
which uses PR rather than PKGR in the versioned dependency string.

4, Make sure PKGR rather than PR in version string when do_package_rpm.

[YOCTO #4050]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/package_rpm.bbclass |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b6d76e7..34cf904 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -610,7 +610,14 @@ python write_specfile () {
                             pv = subd['PV']
                             pkgv = subd['PKGV']
                             reppv = pkgv.replace('-', '+')
-                            verlist.append(ver.replace(pv, reppv).replace(pkgv, reppv))
+                            ver = ver.replace(pv, reppv).replace(pkgv, reppv)
+                        if 'PKGR' in subd:
+                            # Make sure PKGR rather than PR in ver
+                            pr = '-' + subd['PR']
+                            pkgr = '-' + subd['PKGR']
+                            if pkgr not in ver:
+                                ver = ver.replace(pr, pkgr)
+                        verlist.append(ver)
                     else:
                         verlist.append(ver)
                 newdeps_dict[dep] = verlist
-- 
1.7.10.4



