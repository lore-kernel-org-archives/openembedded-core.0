Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8591360030
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 12:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCYdjA004602 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:34:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2FP1rufTS76n
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:34:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7JCYZup004598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Aug 2014 13:34:36 +0100
Message-ID: <1408451676.1669.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Aug 2014 13:34:36 +0100
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Subject: [PATCH] packagegroup: Make allarch inherit conditional
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
X-List-Received-Date: Tue, 19 Aug 2014 12:34:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Make the allarch inherit conditional on PACKAGE_ARCH being left as
all. The one downside to this approach is that recipes need to set
PACKAGE_ARCH *before* inheriting the class in order to avoid the inherit.

The advantage is that we could start to detect the use of the
allarch inherit in the sstatesig code for improved task checksums.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 6606bc6..a79d5b05 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -9,7 +9,8 @@ PACKAGES = "${PN}"
 # By default, packagegroup packages do not depend on a certain architecture.
 # Only if dependencies are modified by MACHINE_FEATURES, packages
 # need to be set to MACHINE_ARCH after inheriting packagegroup.bbclass
-inherit allarch
+PACKAGE_ARCH ??= "all"
+inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH', True) == 'all', 'allarch', '')}
 
 # This automatically adds -dbg and -dev flavours of all PACKAGES
 # to the list. Their dependencies (RRECOMMENDS) are handled as usual



