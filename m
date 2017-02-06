Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7F23771979
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 15:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqM1E019011; Mon, 6 Feb 2017 15:52:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K8-MrAlQ611J; Mon,  6 Feb 2017 15:52:22 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v16FqG0J018999
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 6 Feb 2017 15:52:17 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1calaS-00026Y-AP; Mon, 06 Feb 2017 15:52:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 15:52:11 +0000
Message-Id: <1486396334-8039-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1486396334-8039-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/6] perl-native: Remove .packinfo file
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
X-List-Received-Date: Mon, 06 Feb 2017 15:52:24 -0000

This is large and needs fixups to relocate it in each case. We can drop it, save
the work and the ~150MB disk space its various copies take up. Its not needed
for anything that I can see.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/perl-native_5.24.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.0.bb b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
index af2ad7b..4216257 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.0.bb
@@ -106,6 +106,10 @@ do_install () {
 	for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
 		sed -i -e 's|${bindir}/perl|/usr/bin/env nativeperl|' $f
 	done
+
+	# The packlist is large with hardcoded paths meaning it needs relocating
+	# so just remove it.
+	rm ${D}${libdir}/perl/${PV}/.packlist
 }
 
 SYSROOT_PREPROCESS_FUNCS += "perl_sysroot_create_wrapper"
-- 
2.7.4


