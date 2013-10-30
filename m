Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id ACAD96C782
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:05:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9UD5aMB015709 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:05:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cyXFvalhszf8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:05:36 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r9UD5WAM015690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 13:05:34 GMT
Message-ID: <1383138327.25877.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Oct 2013 13:05:27 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] rpm: Fix FILES_${PN}
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
X-List-Received-Date: Wed, 30 Oct 2013 13:05:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

In a recent commit, the FILES expression for rpm accidentally moved a
large portion of rpm-build into rpm:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=2e557556e03f4e86795cf331ccf06acd4c373045

Since rpm-build requires perl, this caused a number of build failures
when the rpm-build package was attempted to be used since it references
/usr/bin/perl. This commit restores the previous contents of the rpm
package.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 9699639..5498541 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -224,7 +224,6 @@ FILES_${PN} =  "${bindir}/rpm \
 		${libdir}/rpm/bin/rpmrepo \
 		${libdir}/rpm/bin/rpmspecdump \
 		${libdir}/rpm/bin/wget \
-		${libdir}/rpm \
 		${localstatedir}/cache \
 		${localstatedir}/cache/rpm \
 		${localstatedir}/cache/wdj \



