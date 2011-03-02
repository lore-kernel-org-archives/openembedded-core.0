Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Pub33-0005YU-Vr
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Mar 2011 02:40:18 +0100
Received: by mail-iy0-f175.google.com with SMTP id 26so4794247iyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2011 17:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=LpdLhA6Z77t14Z0y5OMQ9ztvZOX8Mf9TQTICJtVS2XA=;
	b=ap/ndWqZO9BZAZ7wSDi7GQpGBSooFhjwQ9eRX+ziusoM5TQH/5QbkBJyH6EZe4v/yw
	/xny0OBwWV2D+xjYOrhjzCsBA0RaUhW+qvUKjBsjNZGem9NrIsFOoqMZ7XZR7CzyQgaN
	zckU/WpuSzmL37/x7Z3/H2GOwP+Ep+zoZ3HJ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tRIWu50B1sNJbrslOednvOckw4PwHI9PqqGmyvUTUX+q5G5A1OLcLvyFrONUcYlUDS
	LeH5XYC/3dlUR/erQvx0tcN5iXsykOgmTOI1c4U5uEng6ZrZNTFrEqoFfiN5ZcdUbkt3
	RnuoBev9D0OmW36gcYq1IKNeZXIqxl92SPNPo=
Received: by 10.42.219.65 with SMTP id ht1mr7477159icb.393.1299029933304;
	Tue, 01 Mar 2011 17:38:53 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d21sm6206023ibg.9.2011.03.01.17.38.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Mar 2011 17:38:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2011 17:38:31 -0800
Message-Id: <1299029911-3973-7-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
References: <1299029911-3973-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 6/6] sanity.bbclass: Check for mmap_min_addr can be safely removed
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
X-List-Received-Date: Wed, 02 Mar 2011 01:40:18 -0000

* QEMU is already patch to take care of it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/sanity.bbclass |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 13940f8..2af6f4b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -166,17 +166,6 @@ def check_sanity(e):
     if "." in data.getVar('PATH', e.data, True).split(":"):
         messages = messages + "PATH contains '.' which will break the build, please remove this"
 
-    if data.getVar('TARGET_ARCH', e.data, True) == "arm":
-        # This path is no longer user-readable in modern (very recent) Linux
-        try:
-            if os.path.exists("/proc/sys/vm/mmap_min_addr"):
-                f = file("/proc/sys/vm/mmap_min_addr", "r")
-                if (f.read().strip() != "0"):
-                        messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
-                f.close()
-        except:
-            pass
-
     for util in required_utilities.split():
         if not check_app_exists( util, e.data ):
             missing = missing + "%s," % util
-- 
1.7.4.1



