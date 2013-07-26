Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFDCC6A960
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 09:51:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6Q9p7xi016252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 02:51:07 -0700 (PDT)
Received: from pek-lpgbuild1.wrs.com (128.224.153.21) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 02:51:07 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 17:51:02 +0800
Message-ID: <1374832262-18765-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH] libpam: deny all services for the OTHER entries
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
X-List-Received-Date: Fri, 26 Jul 2013 09:51:07 -0000
Content-Type: text/plain

To be secure, change behavior of the OTHER entries to warn and deny
access to everything by stating pam_deny.so on all services.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-extended/pam/libpam/pam.d/other |   15 ++++++---------
 1 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/pam/libpam/pam.d/other b/meta/recipes-extended/pam/libpam/pam.d/other
index 6e40cd0..ec970ec 100644
--- a/meta/recipes-extended/pam/libpam/pam.d/other
+++ b/meta/recipes-extended/pam/libpam/pam.d/other
@@ -6,22 +6,19 @@
 #pam_open_session, the session module out of /etc/pam.d/other is
 #used.  
 
-#If you really want nothing to happen then use pam_permit.so or
-#pam_deny.so as appropriate.
-
 # We use pam_warn.so to generate syslog notes that the 'other'
 #fallback rules are being used (as a hint to suggest you should setup
-#specific PAM rules for the service and aid to debugging). We then 
-#fall back to the system default in /etc/pam.d/common-*
+#specific PAM rules for the service and aid to debugging). Then to be
+#secure, deny access to all services by default. 
 
 auth       required     pam_warn.so
-auth       include      common-auth
+auth       required     pam_deny.so
 
 account    required     pam_warn.so
-account    include      common-account
+account    required     pam_deny.so
 
 password   required     pam_warn.so
-password   include      common-password
+password   required     pam_deny.so
 
 session    required     pam_warn.so
-session    include      common-session
+session    required     pam_deny.so
-- 
1.7.1


