Received: from mail-ee0-f48.google.com ([74.125.83.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URNZF-0000cG-R8
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 16:06:21 +0200
Received: by mail-ee0-f48.google.com with SMTP id b15so1899552eek.21
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 06:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=mFi+Kf5sA9QxRByLEicrWP5c3njkkgDpQYzR5/f0StE=;
	b=B3MiCQuj2RKphTmSpmef+fGs/mN32GWj9MfIBZxCOMz+OVZt0vwhmfkWo7QYxpGCaf
	BHPUEfbxH+fAo0GhXvO+HKc/JhpzCVH92lCNxRqH5v9DhXJHpYuaLlHJa9gqOZrynGFZ
	Q7m5YUA0jk5ZfrGPq+/5jx/xd9q5IeqCJAfdCzhbQnY4v2IW/oCU3X6pB2bSHNiCikVy
	SrAK85pyCv+1FChvbXgOpBeaDF+anIOHkSYPzeiq/bOUyjpc//+C6Nlot2hV9QPY36Vc
	SEAJcMIXdX3FsbkGdRVNOsn6H5cEQau4s3sUBqXcsACAqIUuSMMwUZw/hvuu4WKuOLBM
	mPPw==
X-Received: by 10.15.43.73 with SMTP id w49mr51332250eev.12.1365947318473;
	Sun, 14 Apr 2013 06:48:38 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174]) by mx.google.com with ESMTPS id
	cb50sm21570517eeb.14.2013.04.14.06.48.36
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 14 Apr 2013 06:48:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Apr 2013 15:48:26 +0200
Message-Id: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
X-Gm-Message-State: ALoCoQkAeAobXExQqzPyfU2sZ47TYZX3fTn5rNNfLnIQcUak/2BTdoResUtXVNNyfOKDxynhLmsS
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 14:06:27 -0000

When using busybox mount the filesystem won't get remounted as 'rw' and bootup will fail.

This fixes the regression seen after switching from 'danny' to 'dylan'.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/systemd/systemd_199.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 2de9c14..0d07f85 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -188,7 +188,7 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "dbus"
+RDEPENDS_${PN} += "dbus util-linux-mount"
 
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       util-linux-agetty \
-- 
1.8.1.4



