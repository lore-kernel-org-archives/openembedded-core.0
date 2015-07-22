Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0908D738ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 07:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6M7C6n8030749 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:12:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KYpuRO6k1rwf
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:12:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6M7BoF0030746
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:12:02 +0100
Message-ID: <1437549110.821.77.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jul 2015 08:11:50 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] rpm4: Drop native RDEPENDS
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
X-List-Received-Date: Wed, 22 Jul 2015 07:12:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Native recipes should *never* depend on target recipes since this would
cause them to rebuild every time the target changes. Before the recent
datastore changes, this happened to work. Now, this makes rpm-native
unbuildable since base-files-native doesn't exist and the code remaps
the variable.

Dropping these dependencies here is the correct way to resolve this issue
and fix an autobuilder selftest failure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/rpm/rpm_4.11.2.bb b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
index df9aafb..210c943 100644
--- a/meta/recipes-devtools/rpm/rpm_4.11.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.11.2.bb
@@ -122,7 +122,7 @@ FILES_${PN} +=  "${libdir}/rpm \
                  ${libdir}/rpm-plugins/exec.so \
                 "
 RDEPENDS_${PN} = "base-files run-postinsts"
-RDEPENDS_${PN}_class-native = "base-files run-postinsts"
+RDEPENDS_${PN}_class-native = ""
 
 FILES_${PN}-dbg += "${libdir}/rpm/.debug/* \
                     ${libdir}/rpm-plugins/.debug/* \



