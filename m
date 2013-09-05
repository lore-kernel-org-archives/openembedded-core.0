Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 42B38615C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 23:49:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r85Nn8ZH016903
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Sep 2013 16:49:08 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Sep 2013 16:49:07 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Sep 2013 18:48:42 -0500
Message-ID: <1378424922-24009-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Cc: yue.tao@windriver.com
Subject: [PATCH] package_rpm.bbclass: Fix no_recommendations and package_exclude
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
X-List-Received-Date: Thu, 05 Sep 2013 23:49:07 -0000
Content-Type: text/plain

When the code was refactored to address review comments, the wrong version
was sent to the community.  Replace the $1 with ${target_rootfs}

Fix identified by: Yue Tao <yue.tao@windriver.com>

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index cc77c5e..8ab42c4 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -360,10 +360,10 @@ EOF
 		package_write_smart_config ${target_rootfs}
 		# Do the following configurations here, to avoid them being saved for field upgrade
 		if [ "x${NO_RECOMMENDATIONS}" = "x1" ]; then
-			smart --data-dir=$1/var/lib/smart config --set ignore-all-recommends=1
+			smart --data-dir=${target_rootfs}/var/lib/smart config --set ignore-all-recommends=1
 		fi
 		for i in ${PACKAGE_EXCLUDE}; do
-			smart --data-dir=$1/var/lib/smart flag --set exclude-packages $i
+			smart --data-dir=${target_rootfs}/var/lib/smart flag --set exclude-packages $i
 		done
 
 		# Optional debugging
-- 
1.8.1.2.545.g2f19ada


