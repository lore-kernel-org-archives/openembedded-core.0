Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E8C3477112
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 17:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17H9DBa000370 for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Feb 2016 17:09:13 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id obL23yKF9mET
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Feb 2016 17:09:13 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u17H98Ow000367
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Feb 2016 17:09:09 GMT
Message-ID: <1454864948.27087.318.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 07 Feb 2016 17:09:08 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] package_deb: Ensure allarch deb packages aren't target specific
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
X-List-Received-Date: Sun, 07 Feb 2016 17:09:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The use of TUNE_FEATURES was making do_package_write_deb of allarch
packages target specific.

To avoid this, only use the end value of DPKG_ARCH for its checksum,
not intermediate values or variables.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 25218d0..b3cf07a 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -7,6 +7,7 @@ inherit package
 IMAGE_PKGTYPE ?= "deb"
 
 DPKG_ARCH ?= "${@debian_arch_map(d.getVar('TARGET_ARCH', True), d.getVar('TUNE_FEATURES', True))}"
+DPKG_ARCH[vardepvalue] = "${DPKG_ARCH}"
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
 



