Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5387B6098F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 14:58:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HF42DU000333 for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 16:04:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id srNlMAIU5Ez7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 16:04:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5HF3vGo000329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 16:03:59 +0100
Message-ID: <1371481069.20823.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jun 2013 15:57:49 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] python: Add nativesdk wrapper to handle terminfo
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
X-List-Received-Date: Mon, 17 Jun 2013 14:58:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently if you build nativesdk-python, install it and try and run it,
you see it search in the default nativesdk path for terminfo files
when the readline module is used.

If terminfo files cannot be found, or if the ones found are incorrect,
the system may emit control characters which confuse commandline
processing.

This patch sets the TERMINFO_DIRS variable to ensure the correct locations
are searched for terminfo files, starting with the nativesdk terminfo files
and falling back to the host systtem's.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index 5150e52..59d189d 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -115,6 +115,10 @@ do_install() {
 	oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
 }
 
+do_install_append_class-nativesdk () {
+	create_wrapper ${D}${bindir}/python2.7 TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
+}
+
 SSTATE_SCAN_FILES += "Makefile"
 PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
 



