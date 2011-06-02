Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QS2xI-0006YD-SF
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Jun 2011 10:08:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jun 2011 01:05:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,308,1304319600"; 
   d="scan'208";a="5775228"
Received: from unknown (HELO swold-MOBL.nomadix.com) ([10.255.12.203])
	by azsmga001.ch.intel.com with ESMTP; 02 Jun 2011 01:05:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2011 01:05:05 -0700
Message-Id: <2c4a643ac3ddcbadcbc0bd16b297f092acdf2d12.1307001679.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307001679.git.sgw@linux.intel.com>
References: <cover.1307001679.git.sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [CONSOLIDATED PULL 06/12] shadow: remove selinux entry from pam.d/login
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
X-List-Received-Date: Thu, 02 Jun 2011 08:08:37 -0000

From: Koen Kooi <koen@dominion.thruhere.net>

SElinux has been disabled in the recipe, leading to messages like this:

[  167.643218] login[312]: PAM unable to dlopen(/lib/security/pam_selinux.so): /lib/security/pam_selinux.so: cannot open shared object file: No such file or directory
[  167.670837] login[312]: PAM adding faulty module: /lib/security/pam_selinux.so

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-extended/shadow/files/pam.d/login |    7 -------
 meta/recipes-extended/shadow/shadow.inc        |    2 ++
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/shadow/files/pam.d/login b/meta/recipes-extended/shadow/files/pam.d/login
index e41eb04..e4dacc2 100644
--- a/meta/recipes-extended/shadow/files/pam.d/login
+++ b/meta/recipes-extended/shadow/files/pam.d/login
@@ -26,13 +26,6 @@ auth       [success=ok ignore=ignore user_unknown=ignore default=die]  pam_secur
 # (Replaces the `NOLOGINS_FILE' option from login.defs)
 auth       requisite  pam_nologin.so
 
-# SELinux needs to be the first session rule. This ensures that any 
-# lingering context has been cleared. Without out this it is possible 
-# that a module could execute code in the wrong domain.
-# When the module is present, "required" would be sufficient (When SELinux
-# is disabled, this returns success.)
-session [success=ok ignore=ignore module_unknown=ignore default=bad] pam_selinux.so close
-
 # This module parses environment configuration file(s)
 # and also allows you to use an extended config
 # file /etc/security/pam_env.conf.
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 42f92a7..35bd6a8 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -6,6 +6,8 @@ LICENSE = "BSD | Artistic"
 LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
                     file://src/passwd.c;firstline=8;endline=30;md5=2899a045e90511d0e043b85a7db7e2fe"
 
+PR = "r1"
+
 PAM_PLUGINS = "  libpam-runtime \
                  pam-plugin-faildelay \
                  pam-plugin-securetty \
-- 
1.7.3.4



