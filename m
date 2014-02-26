Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7196EEF5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 11:35:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1QBZtov019727 for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 11:35:55 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5wNoRM1RRTnM
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 11:35:54 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1QBZoQp019724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 11:35:51 GMT
Message-ID: <1393414543.31769.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Feb 2014 11:35:43 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] security-flags: Deal with powerpc build issues
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
X-List-Received-Date: Wed, 26 Feb 2014 11:36:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



Building powerpc machines with the standard security flags generated numerous
build failures. Use a reduced set of flags for now to avoid linker issues
and other compile failures.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e7d4933a..b5489d8 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -2,6 +2,14 @@ SECURITY_CFLAGS ?= "-fstack-protector-all -pie -fpie -D_FORTIFY_SOURCE=2"
 SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-all -D_FORTIFY_SOURCE=2"
 SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
 
+# powerpc does not get on with pie for reasons not looked into as yet
+SECURITY_CFLAGS_powerpc = "-fstack-protector-all -D_FORTIFY_SOURCE=2"
+# Deal with ppc specific linker failures when using the cflags
+SECURITY_CFLAGS_pn-dbus_powerpc = ""
+SECURITY_CFLAGS_pn-dbus-ptest_powerpc = ""
+SECURITY_CFLAGS_pn-libmatchbox_powerpc = ""
+SECURITY_CFLAGS_pn-webkit-gtk = ""
+
 SECURITY_CFLAGS_pn-aspell = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-beecrypt = "${SECURITY_NO_PIE_CFLAGS}"
 # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned



