Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4562A615C4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 22:41:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85MsgaA031842; Thu, 5 Sep 2013 23:54:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kc7fX8CYzsWO; Thu,  5 Sep 2013 23:54:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r85MsbUH031837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 5 Sep 2013 23:54:38 +0100
Message-ID: <1378420880.32427.85.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 05 Sep 2013 23:41:20 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Thomas Fitzsimmons <fitzsim@cisco.com>
Subject: [PATCH] useradd: Handle users from a package being used in others
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
X-List-Received-Date: Thu, 05 Sep 2013 22:41:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From: Thomas Fitzsimmons <fitzsim@cisco.com>

If there is a package A (TUNE_PKGARCH) which is depended upon by B which
is MACHINE_ARCH and you build B for machine X, then Y, the user isn't
present in the sysroot for machine Y since the useradd code is never
triggered.

The change ensures the code does get triggered and the user is present.

[YOCTO 4739]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index eabfc5d..a850e9d 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -101,7 +101,7 @@ useradd_sysroot () {
 }
 
 useradd_sysroot_sstate () {
-	if [ "${BB_CURRENTTASK}" = "package_setscene" ]
+	if [ "${BB_CURRENTTASK}" = "package_setscene" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
 		useradd_sysroot
 	fi
@@ -123,6 +123,7 @@ USERADDSETSCENEDEPS_virtclass-cross = ""
 USERADDSETSCENEDEPS_class-native = ""
 USERADDSETSCENEDEPS_class-nativesdk = ""
 do_package_setscene[depends] += "${USERADDSETSCENEDEPS}"
+do_populate_sysroot_setscene[depends] += "${USERADDSETSCENEDEPS}"
 
 # Recipe parse-time sanity checks
 def update_useradd_after_parse(d):



