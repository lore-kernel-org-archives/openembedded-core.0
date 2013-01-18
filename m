Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <amy.fong@windriver.com>) id 1TwEoy-0004h2-EK
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 17:29:40 +0100
Received: from yow-afong-lx2.ottawa.windriver.com (yow-afong-lx2.wrs.com
	[128.224.146.164])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0IGE9Z6006694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Fri, 18 Jan 2013 08:14:10 -0800 (PST)
Received: from afong by yow-afong-lx2.ottawa.windriver.com with local (Exim
	4.80) (envelope-from <amy.fong@windriver.com>)
	id 1TwEa0-0002vF-TH; Fri, 18 Jan 2013 11:14:08 -0500
Date: Fri, 18 Jan 2013 11:14:08 -0500
From: Amy Fong <amy.fong@windriver.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130118161408.GA11224@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] autofs has openldap dependency issues
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
X-List-Received-Date: Fri, 18 Jan 2013 16:29:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

commit 09947d772a36e4d2c2dc48356281bd3ce0a04b0c
Author: Amy Fong <amy.fong@windriver.com>
Date:   Fri Jan 18 11:10:35 2013 -0500

    autofs: fails to compile with openldap disabled
    
    As of 5.0.6, it appears that changes were introduced so that
    if you compile with openldap disabled and openldap headers are not
    available, then autofs fails to build.
    
    Since autofs no longer depends on openldap, remove the dependency
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>

diff --git a/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch b/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
new file mode 100644
index 0000000..b62f955
--- /dev/null
+++ b/recipes-daemons/autofs/autofs-5.0.7/fix_disable_ldap.patch
@@ -0,0 +1,40 @@
+autofs: fails to compile with openldap disabled
+
+As of 5.0.6, it appears that changes were introduced so that 
+if you compile with openldap disabled and openldap headers are not
+available, then autofs fails to build.
+
+Signed-off-by: Amy Fong <amy.fong@windriver.com>
+--
+ lookup_ldap.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+---
+ include/lookup_ldap.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+--- a/include/lookup_ldap.h
++++ b/include/lookup_ldap.h
+@@ -1,7 +1,9 @@
+ #ifndef LOOKUP_LDAP_H
+ #define LOOKUP_LDAP_H
+ 
++#ifdef WITH_LDAP
+ #include <ldap.h>
++#endif
+ 
+ #ifdef WITH_SASL
+ #include <openssl/ssl.h>
+@@ -109,10 +111,12 @@
+ 
+ #define LDAP_AUTH_USESIMPLE	0x0008
+ 
++#ifdef WITH_LDAP
+ /* lookup_ldap.c */
+ LDAP *init_ldap_connection(unsigned logopt, const char *uri, struct lookup_context *ctxt);
+ int unbind_ldap_connection(unsigned logopt, LDAP *ldap, struct lookup_context *ctxt);
+ int authtype_requires_creds(const char *authtype);
++#endif
+ 
+ #ifdef WITH_SASL
+ /* cyrus-sasl.c */
diff --git a/recipes-daemons/autofs/autofs_5.0.7.bb b/recipes-daemons/autofs/autofs_5.0.7.bb
index c1b0b46..a6683ff 100644
--- a/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -3,7 +3,9 @@ SECTION = "base"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-DEPENDS += "openldap libtirpc flex-native bison-native"
+PR = "r1"
+
+DEPENDS += "libtirpc flex-native bison-native"
 
 inherit autotools systemd
 
@@ -30,6 +32,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
            file://cross.patch \
            file://libtirpc.patch \
            file://libtirpc-name-clash-backout.patch \
+           file://fix_disable_ldap.patch \
           "
 
 SRC_URI[md5sum] = "bc46838dece83c02d800ff144ed9f431"


