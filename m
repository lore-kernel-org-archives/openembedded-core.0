Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 996207F387
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3CE5F18149
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:47 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id YXDJbDoSjGhU
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:43 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 1F72F18443
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:42 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C363F1E07D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7EF21E07C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id ABB1E2CE5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x9GGUf8e018441
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:30:41 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x9GGUfLK018440
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Oct 2019 18:30:41 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2019 18:30:29 +0200
Message-Id: <bda2220e91ba781820d23111ec6899abb6123ced.1571243326.git.pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1571243326.git.pkj@axis.com>
References: <cover.1571243326.git.pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [warrior][PATCH 5/8] tzdata: Correct the packaging of /etc/localtime and /etc/timezone
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
X-List-Received-Date: Wed, 16 Oct 2019 16:30:47 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

During restructuring of the packaging in 2af4d6eb (tzdata: Install
everything by default), these two files remained in the tzdata
package, which is supposed to be empty. Move them to tzdata-core where
they belong.

Also simplify the definition of CONFFILES_tzdata-core. As its value
only takes effect for files that actually exist, there is no need to
complicate its definition by checking if a file is created before
adding it to the list of configuration files.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/timezone/tzdata.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 82fe369baa..1e2d9bd1b9 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -147,6 +147,8 @@ FILES_tzdata-misc += "${datadir}/zoneinfo/Cuba           \
 RPROVIDES_tzdata-misc = "tzdata-misc"
 
 FILES_tzdata-core += " \
+                ${sysconfdir}/localtime                  \
+                ${sysconfdir}/timezone                   \
                 ${datadir}/zoneinfo/Pacific/Honolulu     \
                 ${datadir}/zoneinfo/America/Anchorage    \
                 ${datadir}/zoneinfo/America/Los_Angeles  \
@@ -202,8 +204,7 @@ FILES_tzdata-core += " \
                 ${datadir}/zoneinfo/iso3166.tab          \
                 ${datadir}/zoneinfo/Etc/*"
 
-CONFFILES_tzdata-core += "${@ "${sysconfdir}/timezone" if bb.utils.to_boolean(d.getVar('INSTALL_TIMEZONE_FILE')) else "" }"
-CONFFILES_tzdata-core += "${sysconfdir}/localtime"
+CONFFILES_tzdata-core = "${sysconfdir}/localtime ${sysconfdir}/timezone"
 
 ALLOW_EMPTY_${PN} = "1"
 RDEPENDS_${PN} = "${TZ_PACKAGES}"
-- 
2.21.0


