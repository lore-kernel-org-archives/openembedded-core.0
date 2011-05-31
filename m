Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRTo1-0002Eu-1M
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 20:36:41 +0200
Received: by wwi18 with SMTP id 18so2747040wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 11:33:30 -0700 (PDT)
Received: by 10.216.235.158 with SMTP id u30mr6014151weq.104.1306866810811;
	Tue, 31 May 2011 11:33:30 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w58sm204127weq.1.2011.05.31.11.33.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 11:33:30 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 20:33:24 +0200
Message-Id: <1306866804-12443-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] shadow: remove selinux entry from pam.d/login
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
X-List-Received-Date: Tue, 31 May 2011 18:36:41 -0000

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
1.6.6.1



