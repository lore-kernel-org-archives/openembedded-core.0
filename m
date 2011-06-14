Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWazE-00027t-BB
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:17:25 +0200
Received: by pwj9 with SMTP id 9so2982702pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=nEnrlrG4YtE2sGWAxHYiRHnxzuwHyxU/0KRWRF4oOHU=;
	b=lKyOcGvys0QZ13yfsVbXr+EJw8HFrYlofL8VMYK/b4T7c9e5WwbG9XTXf5mUeUrgIs
	hbGnwmOo+woghm4UtnDz6yL3/n7YrxxqA1M2f3nFZZiKGmE2A6KhYXWECMPuvMDNlan3
	D2/OBjVjQR0mCxP9SoT7R+n/7giZcAXtziLcY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uiV9bMR5F9jxm7Of1hiIDHM5hXjRLM4DJ/j95b83zNXhcyzwv7hrRDSXa4TvQroiwS
	V4ekKMNZ1taUrxPxKFZfaoYkOcb7oYzC2BeM6hQo5TupDqHpfv2jtYzPqJ5P6UKK2ocG
	abW+ZD37eZx4JDQEhicSuvuJUH32bTIf5UM5U=
Received: by 10.68.47.35 with SMTP id a3mr1713691pbn.210.1308086026676;
	Tue, 14 Jun 2011 14:13:46 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p5sm5862846pbk.36.2011.06.14.14.13.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 14:13:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jun 2011 14:13:22 -0700
Message-Id: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Tue, 14 Jun 2011 21:17:25 -0000

PACKAGE_ARCH is set to BASE_PACKAGE_ARCH so we do not
need to define it here since we already define BASE_PACKAGE_ARCH

angstrom sets FEED_ARCH like

FEED_ARCH ?= "${BASE_PACKAGE_ARCH}"

and 'all' doesnt go well for FEED_ARCH as it ends up with
parsing error for x86 machines.

This might be a latent bug in bitbake but allarch.bbclass
excavated it and we burry it in the same class.

This makes the behavior same as it was before allarch.bbclass
where we set PACKAGE_ARCH = all for common packages

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/allarch.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index e3ac392..b9ba28b 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -2,9 +2,10 @@
 # This class is used for architecture independent recipes/data files (usally scripts)
 #
 
+# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
+# before we reset it
+FEED_ARCH := ${BASE_PACKAGE_ARCH}
 BASE_PACKAGE_ARCH = "all"
-PACKAGE_ARCH = "all"
-
 # No need for virtual/libc or a cross compiler
 INHIBIT_DEFAULT_DEPS = "1"
 
-- 
1.7.4.1



