Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Ming.Liu@windriver.com>) id 1Tl96r-0003RJ-LB
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 03:10:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBJ1tUtK026409
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 17:55:30 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 18 Dec 2012 17:55:29 -0800
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 09:55:26 +0800
Message-ID: <1355882126-26376-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.11
MIME-Version: 1.0
Subject: [PATCH V3] initscripts/urandom: create directory before staging into it
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
X-List-Received-Date: Wed, 19 Dec 2012 02:10:37 -0000
Content-Type: text/plain

/etc/init.d/urandom fails to start/stop because it tries to save
random-seed into /var/lib/urandom folder which does not exist in the
file system.

Fixed by creating /var/lib/urandom at do_install time.

[YOCTO #3518]
[ CQID: WIND00384168 ]

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index d25838b..39be9a8 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Initscripts provide the basic system startup initialization scrip
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r137"
+PR = "r138"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
@@ -133,4 +133,6 @@ do_install () {
 	fi
 
 	install -m 0755		${WORKDIR}/device_table.txt		${D}${sysconfdir}/device_table
+	# Holds state information pertaining to urandom
+	install -d ${D}/var/lib/urandom
 }
-- 
1.7.11



