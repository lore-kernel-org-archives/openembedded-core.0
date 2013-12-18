Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A022160D27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:12:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIHCVSq012403 for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:12:32 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qruq2K6LuM72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:12:31 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBIHCRjL012391
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 17:12:29 GMT
Message-ID: <1387386743.6402.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Dec 2013 17:12:23 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] ptest: Fix dependency/ordering issue
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
X-List-Received-Date: Wed, 18 Dec 2013 17:12:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've seen occasional issues on the autobuilder where files appear during
do_populate_sysroot and this is due to the ptest installation happening
in parallel. This fixes the order to be deterministic.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 0ffef95..ec10f80 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -53,7 +53,7 @@ do_install_ptest_base[cleandirs] = "${D}${PTEST_PATH}"
 
 addtask configure_ptest_base after do_configure before do_compile
 addtask compile_ptest_base   after do_compile   before do_install
-addtask install_ptest_base   after do_install   before do_package
+addtask install_ptest_base   after do_install   before do_package do_populate_sysroot
 
 python () {
     if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):



