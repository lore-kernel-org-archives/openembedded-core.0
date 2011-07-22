Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qk6K5-0007xl-6A
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 05:22:45 +0200
Received: by iyj12 with SMTP id 12so1580902iyj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 20:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=fv42sVz5NMOFJh91oKcewDQ2zzkdY8BcQIFUJpt/39o=;
	b=n9iTB4bFjGkoZB3z9slH3RfGLLxsbJ3vkrGWcsx2IxUbv0VeUlH9/0OksV6LfB7EMd
	KpUc70oqsjxppy7VpO8m5WARGAz6VonPBsmrDgk7zpoDtofRWq3pqyPvfSVwcRwoAzH+
	LlmOvIhGW7x9SUvKfyU/zR/0ylcEIR21NJ0RM=
Received: by 10.231.112.193 with SMTP id x1mr895387ibp.59.1311304716326;
	Thu, 21 Jul 2011 20:18:36 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d3sm1322350iba.23.2011.07.21.20.18.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jul 2011 20:18:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jul 2011 20:18:29 -0700
Message-Id: <1311304709-6156-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] tclibc-uclibc: Fix TARGET_OS for powerpc
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
X-List-Received-Date: Fri, 22 Jul 2011 03:22:45 -0000

1a9ae8ea8c0540d41b8ff4d95c0420d6df754634 removed -uclibc
hence it got all wrong for powerpc. uclibc TARGET_OS
for classic ppc is linux-uclibc and for ppc w/ SPE its
linux-uclibcspe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/tclibc-uclibc.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/distro/include/tclibc-uclibc.inc
index 2ccda5b..7c06654 100644
--- a/meta/conf/distro/include/tclibc-uclibc.inc
+++ b/meta/conf/distro/include/tclibc-uclibc.inc
@@ -5,7 +5,7 @@
 TARGET_OS = "linux-uclibc"
 TARGET_OS_arm = "linux-uclibceabi"
 TARGET_OS_armeb = "linux-uclibceabi"
-TARGET_OS_powerpc = "linux${@['','-gnuspe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
+TARGET_OS_powerpc = "linux-uclibc${@['','spe'][bb.data.getVar('TARGET_FPU',d,1) in ['ppc-efd', 'ppc-efs']]}"
 
 # Add uclibc overrides to the overrides.
 OVERRIDES =. "libc-uclibc:"
-- 
1.7.4.1



