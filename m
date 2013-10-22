Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B45E96CF24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 03:12:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9M3C4Ex004290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 20:12:04 -0700 (PDT)
Received: from mliu3-desktop.corp.ad.wrs.com (128.224.162.145) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Mon, 21 Oct 2013 20:12:04 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2013 11:11:59 +0800
Message-ID: <1382411521-8350-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH V5 1/3] base-files: remove invalid entries from /etc/shells
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
X-List-Received-Date: Tue, 22 Oct 2013 03:12:02 -0000
Content-Type: text/plain

It's more reasonable and secure to keep /etc/shells a minimal file, and
then entries for valid shells be added dynamically to the system, only if
the packages that provide them are supported.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-core/base-files/base-files/shells    | 6 ------
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files/shells b/meta/recipes-core/base-files/base-files/shells
index ce39b3d..3f63987 100644
--- a/meta/recipes-core/base-files/base-files/shells
+++ b/meta/recipes-core/base-files/base-files/shells
@@ -1,8 +1,2 @@
 # /etc/shells: valid login shells
 /bin/sh
-/bin/ash
-/bin/bash
-/bin/dash
-/bin/ksh
-/usr/bin/ksh
-/usr/bin/screen
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 054fefa..be3921a 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -143,5 +143,5 @@ FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]}"
+CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]} ${sysconfdir}/shells"
 
-- 
1.8.4.1


