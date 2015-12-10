Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 580626FF78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBAMmoxL022575 for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:48:50 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vhzo2woMT3yq
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:48:50 +0000 (GMT)
Received: from [192.168.3.30] ([192.168.3.30]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBAMmaWH022571
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 22:48:47 GMT
Message-ID: <1449787715.29412.46.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Dec 2015 22:48:35 +0000
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] populate_sdk_ext/sign_rpm/sign_package_feed: Add missing getVar parameter
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
X-List-Received-Date: Thu, 10 Dec 2015 22:48:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We should always pass a parameter to getVar, add missing default value.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 249ec36..18ff7a6 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -144,7 +144,7 @@ python copy_buildsystem () {
         f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
 
         # Some classes are not suitable for SDK, remove them from INHERIT
-        f.write('INHERIT_remove = "%s"\n' % d.getVar('SDK_INHERIT_BLACKLIST'))
+        f.write('INHERIT_remove = "%s"\n' % d.getVar('SDK_INHERIT_BLACKLIST', False))
 
         # Bypass the default connectivity check if any
         f.write('CONNECTIVITY_CHECK_URIS = ""\n\n')
diff --git a/meta/classes/sign_package_feed.bbclass b/meta/classes/sign_package_feed.bbclass
index 4263810..d89bc0b 100644
--- a/meta/classes/sign_package_feed.bbclass
+++ b/meta/classes/sign_package_feed.bbclass
@@ -24,7 +24,7 @@ python () {
 
     # Set expected location of the public key
     d.setVar('PACKAGE_FEED_GPG_PUBKEY',
-             os.path.join(d.getVar('STAGING_ETCDIR_NATIVE'),
+             os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
                                    'PACKAGE-FEED-GPG-PUBKEY'))
 }
 
diff --git a/meta/classes/sign_rpm.bbclass b/meta/classes/sign_rpm.bbclass
index f0c3dc9..bc916a7 100644
--- a/meta/classes/sign_rpm.bbclass
+++ b/meta/classes/sign_rpm.bbclass
@@ -23,7 +23,7 @@ python () {
             raise_sanity_error("You need to define %s in the config" % var, d)
 
     # Set the expected location of the public key
-    d.setVar('RPM_GPG_PUBKEY', os.path.join(d.getVar('STAGING_ETCDIR_NATIVE'),
+    d.setVar('RPM_GPG_PUBKEY', os.path.join(d.getVar('STAGING_ETCDIR_NATIVE', False),
                                             'RPM-GPG-PUBKEY'))
 }
 



