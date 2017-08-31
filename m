Return-Path: <clopez@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 91ADF77EAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 12:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=JgvsYvb+w2z1pgddTMqKU6VBahkGlsrunMy255/1FT0=; 
	b=k2OAadjqzDqOEc4J6Gvx5Hh872sSuzHUMNVe/gBLk76SguX5rvBiebKrQWsS3x4pDnt/H/uP0rNci6h/dCRFVzGPXABr3vN+YJuIOmJjuW8SkKQRE5hQSGKQWR4Cuebqc89fBojGF/9KJppgZDvx3wmiGvSDOSzpetaQmtifvPu3J0GZGUYB0pANvP605KBKf8amR2Vd7a2eXgpGRiVzsGwJDZz9hYzdDjDhXqvf0sTItwkzfZfpA5d8N6k4PylNe4N52YyRJWLLqMhYPLKm7owEltUlXeWaX9ycVzsb4gUQoNkkMDBmfhNbTYAGx6bKlmIIzHYsoDpm9bYedPtj3w==;
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1dnOVY-0006mO-Dx for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 14:23:40 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Aug 2017 14:23:35 +0200
Message-Id: <20170831122335.6864-1-clopez@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] initramfs-live-boot: disable systemd-update-done.service on live images
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
X-List-Received-Date: Thu, 31 Aug 2017 12:23:40 -0000

When systemd is used, it will invoke a service on first boot that triggers
a rebuild of ldconfig caches (rebuild dynamic linker cache).

This is fine on the first boot of a system that has been installed, but it
makes no sense on a live system. The worst part is that rebuilding this
caches is slow and it causes the live system to take longer to boot.
(I measured this in 30 seconds longer on a standard PC system booting
core-image-sato live from an USB memory).

Disable this by touching /etc/.updated and /var/.updated on the live initramfs.

For more details see https://bugzilla.redhat.com/show_bug.cgi?id=1201725 and
https://www.freedesktop.org/software/systemd/man/systemd-update-done.service.html

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 441b41c9d6..46cab6cc77 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -84,6 +84,10 @@ boot_live_root() {
     # device node creation events were handled, to avoid unexpected behavior
     killall -9 "${_UDEV_DAEMON##*/}" 2>/dev/null
 
+    # Don't run systemd-update-done on systemd-based live systems
+    # because it triggers a slow rebuild of ldconfig caches.
+    touch ${ROOT_MOUNT}/etc/.updated ${ROOT_MOUNT}/var/.updated
+
     # Allow for identification of the real root even after boot
     mkdir -p  ${ROOT_MOUNT}/media/realroot
     mount -n --move "/run/media/${ROOT_DISK}" ${ROOT_MOUNT}/media/realroot
-- 
2.11.0


