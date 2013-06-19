Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA836AD1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 03:21:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5J3LYeN023874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 20:21:34 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 20:21:33 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 23:21:29 -0400
Message-ID: <d8c2c9099028827bd66f96bb4dcef1a0d539a83e.1371608997.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1371608997.git.wenzong.fan@windriver.com>
References: <cover.1371608997.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libpam: Fix for CVE-2010-4708
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
X-List-Received-Date: Wed, 19 Jun 2013 03:21:32 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Change default for user_readenv to 0 and document the
new default for user_readenv.

This fix from:
http://pam.cvs.sourceforge.net/viewvc/pam/Linux-PAM/modules/pam_env
/pam_env.c?r1=1.22&r2=1.23&view=patch
http://pam.cvs.sourceforge.net/viewvc/pam/Linux-PAM/modules/pam_env
/pam_env.8.xml?r1=1.7&r2=1.8&view=patch

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../pam/libpam/libpam-fix-for-CVE-2010-4708.patch  |   41 ++++++++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch

diff --git a/meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch b/meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch
new file mode 100644
index 0000000..5d2b69a
--- /dev/null
+++ b/meta/recipes-extended/pam/libpam/libpam-fix-for-CVE-2010-4708.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Backport
+
+Fix for CVE-2010-4708
+
+Change default for user_readenv to 0 and document the 
+new default for user_readenv.
+
+This fix is got from:
+http://pam.cvs.sourceforge.net/viewvc/pam/Linux-PAM/modules/pam_env
+/pam_env.c?r1=1.22&r2=1.23&view=patch
+http://pam.cvs.sourceforge.net/viewvc/pam/Linux-PAM/modules/pam_env
+/pam_env.8.xml?r1=1.7&r2=1.8&view=patch
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+
+---
+--- a/modules/pam_env/pam_env.c	2012-09-05 13:57:47.000000000 +0800
++++ b/modules/pam_env/pam_env.c	2012-09-05 13:58:05.000000000 +0800
+@@ -10,7 +10,7 @@
+ #define DEFAULT_READ_ENVFILE    1
+ 
+ #define DEFAULT_USER_ENVFILE    ".pam_environment"
+-#define DEFAULT_USER_READ_ENVFILE 1
++#define DEFAULT_USER_READ_ENVFILE 0
+ 
+ #include "config.h"
+ 
+--- a/modules/pam_env/pam_env.8.xml	2012-09-05 13:58:24.000000000 +0800
++++ b/modules/pam_env/pam_env.8.xml	2012-09-05 13:59:36.000000000 +0800
+@@ -147,7 +147,10 @@
+         <listitem>
+           <para>
+             Turns on or off the reading of the user specific environment
+-            file. 0 is off, 1 is on. By default this option is on.
++            file. 0 is off, 1 is on. By default this option is off as user
++            supplied environment variables in the PAM environment could affect
++            behavior of subsequent modules in the stack without the consent
++            of the system administrator.
+           </para>
+         </listitem>
+       </varlistentry>
diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index 73a8f88..94101d4 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://fixsepbuild.patch \
            file://reflect-the-enforce_for_root-semantics-change-in-pam.patch \
            file://add-checks-for-crypt-returning-NULL.patch \
+           file://libpam-fix-for-CVE-2010-4708.patch \
           "
 SRC_URI[md5sum] = "7b73e58b7ce79ffa321d408de06db2c4"
 SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1149fc2"
-- 
1.7.9.5


