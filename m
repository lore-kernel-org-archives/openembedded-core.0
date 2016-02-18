Return-Path: <Fupan.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3F6612E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 02:10:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1I2AK8j012664
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 18:10:20 -0800 (PST)
Received: from ala-lpd-susbld2.wrs.com (147.11.105.122) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Feb 2016 18:10:19 -0800
From: <fupan.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2016 18:10:19 -0800
Message-ID: <1455761419-21043-1-git-send-email-fupan.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] oe-core: Fix base-files wrong softlink of /var/run and /var/lock
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
X-List-Received-Date: Thu, 18 Feb 2016 02:10:22 -0000
Content-Type: text/plain

From: fli <fupan.li@windriver.com>

OE-CORE's fs-perms.txt force /var/run to link /run and
/var/lock to /run/lock, so in order to match with it,
make base-files /var/run and /var/lock link the absolute
path too.

Signed-off-by: fli <fupan.li@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index f643c8b..82c97da 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -103,8 +103,8 @@ do_install () {
 		ln -sf volatile/$d ${D}${localstatedir}/$d
 	done
 
-	ln -snf ../run ${D}${localstatedir}/run
-	ln -snf ../run/lock ${D}${localstatedir}/lock
+	ln -snf /run ${D}${localstatedir}/run
+	ln -snf /run/lock ${D}${localstatedir}/lock
 
 	${BASEFILESISSUEINSTALL}
 
-- 
1.9.1


