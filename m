Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 12F8F60EE1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 11:18:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8DBVv1I021087 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:32:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NHohC6TDlGfS
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:32:19 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8DBWCRn021107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:32:14 +0100
Message-ID: <1379071094.3484.245.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 12:18:14 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] linux-libc-headers: Add big warning about antisocial behaviour
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
X-List-Received-Date: Fri, 13 Sep 2013 11:18:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I'm getting concerned with the number of people forking this recipe
and not understanding what they're doing. I'm therefore proposing
adding in a suitable warning to people thinking of copying it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index 96fe2ff..79b7dc4 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -2,6 +2,28 @@ DESCRIPTION = "Sanitized set of kernel headers for the C library's use."
 SECTION = "devel"
 LICENSE = "GPLv2"
 
+#########################################################################
+####                        PLEASE READ 
+#########################################################################
+#
+# You're probably looking here thinking you need to create some new copy
+# of linux-libc-headers since you have your own custom kernel. To put 
+# this simply, you DO NOT.
+#
+# Why? These headers are used to build the libc. If you customise the 
+# headers you are customising the libc and the libc becomes machine
+# specific. Most people do not add custom libc extensions to the kernel
+# and have a machine specific libc.
+#
+# But you have some kernel headers you need for some driver? That is fine
+# but get them from STAGING_KERNEL_DIR where the kernel installs itself.
+# This will make the package using them machine specific but this is much
+# better than having a maching specific C library. This does mean your 
+# recipe needs a DEPENDS += "virtual/kernel" but again, that is fine and
+# makes total sense.
+#
+# -- RP
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
 python __anonymous () {



