Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3C39060D04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 10:46:45 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIAkelH030320 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 10:46:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Pl7qWw1RLjYF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 10:46:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIAkc38030316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 10:46:39 GMT
Message-ID: <1387363593.6402.25.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Dec 2013 10:46:33 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] native: Use deltask to remove tasks which have no purpose
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
X-List-Received-Date: Wed, 18 Dec 2013 10:46:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

core-image-sato has 47703 inter task dependencies before this patch
and 29883 afterwards which is a significant worthwhile task graph
simplification.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---

Note: This patch depends on new bitbake functionality so we'll have to
bump the bitbake version requirement before we can do this.

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index b2d85ef..5a318d2 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -151,11 +151,12 @@ python native_virtclass_handler () {
 addhandler native_virtclass_handler
 native_virtclass_handler[eventmask] = "bb.event.RecipePreFinalise"
 
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
+deltask package
+deltask packagedata
+deltask package_write_ipk
+deltask package_write_deb
+deltask package_write_rpm
+deltask package_write
 
 do_packagedata[stamp-extra-info] = ""
 do_populate_sysroot[stamp-extra-info] = ""



