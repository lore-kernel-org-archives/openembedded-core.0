Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZRER-0007bA-TC
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:28:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPG0X026681
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:16 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:16 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:06 -0500
Message-ID: <0497b42827924fa6e5cffbd1a632d3191b2cac96.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 12/40] classes/package_rpm.bbclass: Change the way the PV is transformed
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
X-List-Received-Date: Wed, 22 Jun 2011 17:28:52 -0000
Content-Type: text/plain

There were some odd instances where the PKGV could not be loaded in the old
way.  Change to verify that PKGV exists before attempting to retrieve the
value from the key.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9a854f3..b4bd374 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -329,10 +329,11 @@ python write_specfile () {
 				ver = depends_dict[dep]
 				if dep and ver:
 					if '-' in ver:
-						subd = oe.packagedata.read_subpkgdata_dict(dep, d)
-						pv = subd['PKGV']
-						reppv = pv.replace('-', '+')
-						ver = ver.replace(pv, reppv)
+						subd = oe.packagedata.read_subpkgdata(dep, d)
+						if 'PKGV' in subd:
+							pv = subd['PKGV']
+							reppv = pv.replace('-', '+')
+							ver = ver.replace(pv, reppv)
 				newdeps_dict[dep] = ver
 			depends = bb.utils.join_deps(newdeps_dict)
 			bb.data.setVar(varname, depends.strip(), d)
-- 
1.7.3.4



