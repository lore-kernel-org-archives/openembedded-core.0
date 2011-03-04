Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PvdJP-0002uD-BN
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 23:17:27 +0100
Received: by bwz10 with SMTP id 10so2334349bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 14:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=JcW9SH3tG6ev8n+Xb5AIlyL/4NoHK2HKcOSp5VWRSXQ=;
	b=Ve8G/pzokXBmLAUs+KE8NI/rAM2gIj3HPY15FX1hj5JHdnREM7W0DcDE2iQPeflvhU
	/hhk3E+1Q/1oko6P3Uhtf8uoajMk2thu5SYQqnYZOQfYE+dGgt/ge9PxHrpwUoa6HNtL
	XUC8VNPwZfzHx3eRKzZRH7JV877F6cAMPHlQg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ho29/5/J2kr31l/kBVt/8R76iHpoKiQgpFl3EvPYGcmsZK3WZiaOvKAtmCfkH0q3NL
	aPNumbdPN4zXRPJZh+Q5wUG2FCtmppoJmMfUExGpMIHkUDAuD0nDFU6d4MEtY9JQ0+42
	jowTEjwblIFTUd4Bo4kbMa0KYXLOge+XdMvUs=
Received: by 10.204.81.27 with SMTP id v27mr1005087bkk.115.1299276957183;
	Fri, 04 Mar 2011 14:15:57 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 12sm1885406bki.19.2011.03.04.14.15.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 14:15:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2011 23:15:52 +0100
Message-Id: <1299276952-24941-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] distutils-base: Only RDEPEND python-core on target packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Mar 2011 22:17:27 -0000

* fixes ie setuptools, without this patch it RDEPENDs on python-core-native, which is not RPROVIDED by anything
* imported from OE 8377b8ec57f35b9e5b81a74c77f68fd6e02949c8

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/distutils-base.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
index 2e151de..e84b0fc 100644
--- a/meta/classes/distutils-base.bbclass
+++ b/meta/classes/distutils-base.bbclass
@@ -1,5 +1,5 @@
 DEPENDS  += "${@["python-native python", ""][(bb.data.getVar('PACKAGES', d, 1) == '')]}"
-RDEPENDS += "python-core"
+RDEPENDS_${PN} += "${@['', 'python-core']['${PN}' == '${BPN}']}"
 
 inherit distutils-common-base
 
-- 
1.7.4.1



