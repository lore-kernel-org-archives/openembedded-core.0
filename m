Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8B46865F94
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 13:50:06 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s46Do1PX011157 for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 14:50:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dJnCPGnBarts
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 14:50:01 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s46Dnugn011135
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 May 2014 14:49:57 +0100
Message-ID: <1399384190.12731.152.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 06 May 2014 14:49:50 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libiconv: Fix B != S with uclibc builds
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
X-List-Received-Date: Tue, 06 May 2014 13:50:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this, uclibc builds fail with libtool version mismatches. The issue
is that we need to remove the files in ${S}, not ${B} which is now
the default after the B != S change.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
index a670e2c..d5f47b4 100644
--- a/meta/recipes-support/libiconv/libiconv_1.14.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
 LEAD_SONAME = "libiconv.so"
 
 do_configure_prepend () {
-	rm -f m4/libtool.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4 m4/lt~obsolete.m4 libcharset/m4/libtool.m4 libcharset/m4/ltoptions.m4 libcharset/m4/ltsugar.m4 libcharset/m4/ltversion.m4 libcharset/m4/lt~obsolete.m4
+	rm -f ${S}/m4/libtool.m4 ${S}/m4/ltoptions.m4 ${S}/m4/ltsugar.m4 ${S}/m4/ltversion.m4 ${S}/m4/lt~obsolete.m4 ${S}/libcharset/m4/libtool.m4 ${S}/libcharset/m4/ltoptions.m4 ${S}/libcharset/m4/ltsugar.m4 ${S}/libcharset/m4/ltversion.m4 ${S}/libcharset/m4/lt~obsolete.m4
 }
 
 do_configure_append () {



