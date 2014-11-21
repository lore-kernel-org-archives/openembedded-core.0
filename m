Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3EE572146
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 09:17:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAL9HNHI011167
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 01:17:23 -0800 (PST)
Received: from localhost.localdomain (128.224.153.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 01:17:22 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 17:17:13 +0800
Message-ID: <1416561434-17862-5-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
In-Reply-To: <1416561434-17862-1-git-send-email-jian.liu@windriver.com>
References: <1416561434-17862-1-git-send-email-jian.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 4/5] libpam: avoid overwritting editable files during package updating
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
X-List-Received-Date: Fri, 21 Nov 2014 09:17:22 -0000
Content-Type: text/plain

Use CONFFILES to mark editable files as such,
  /etc/pam.d/common-session 
  /etc/pam.d/common-auth
  /etc/pam.d/common-password
  /etc/pam.d/common-session-noninteractive
  /etc/pam.d/common-account

If there is no %config micro before the file name in the spec file,
this file will be overwritten after updating package. 
This will make our settings lost.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 3b6d514..b3b39da 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -163,3 +163,9 @@ python do_pam_sanity () {
 addtask pam_sanity before do_configure
 
 BBCLASSEXTEND = "nativesdk native"
+
+CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-session"
+CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-auth"
+CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-password"
+CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-session-noninteractive"
+CONFFILES_${PN}-runtime += "${sysconfdir}/pam.d/common-account"
-- 
1.8.5.2.233.g932f7e4


