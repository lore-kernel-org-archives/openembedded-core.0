Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tanvj-0000QM-C1 for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 14:31:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAKDHt6u005739
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 13:17:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05073-02 for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 13:17:50 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qAKDHjSI005733
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2012 13:17:47 GMT
Message-ID: <1353417464.23758.6.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Nov 2012 13:17:44 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] build-appliance-image: Simplify fetch/unpack execution
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
X-List-Received-Date: Tue, 20 Nov 2012 13:31:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This provides a slightly neater way of ensuring fetch/unpack get
executed (image.bbclass marks them as noexec) since I found the
current approach harder to understand at first glance.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/images/build-appliance-image.bb b/meta/recipes-core/images/build-appliance-image.bb
index 59ccb98..bf1e585 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -68,11 +68,11 @@ fakeroot do_populate_poky_src () {
 
 IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
 
-python do_get_poky_src () {
-    bb.build.exec_func('base_do_fetch', d)
-    bb.build.exec_func('base_do_unpack', d)
+python () {
+	# Ensure we run these usually noexec tasks
+	d.delVarFlag("do_fetch", "noexec")
+	d.delVarFlag("do_unpack", "noexec")
 }
-addtask do_get_poky_src before do_rootfs
 
 create_bundle_files () {
 	cd ${WORKDIR}




