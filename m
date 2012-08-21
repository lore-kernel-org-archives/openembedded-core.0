Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T3t5I-0003Xr-Mt
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:21:48 +0200
Received: by pbcwy7 with SMTP id wy7so269375pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Mc7Y851uCS0zEiuSOd06cfkfVuMTvGkkt8ipxyBEgQQ=;
	b=QI7ohmtgO0PKXoGFRlYjs35dPTq9PHLaClf8/NcEF4AEhDLffPcPO1lZZvaZkdrJlL
	PhcDchEzWkyeGeSruyR4SBOjtrT3XIWMwcJ5s9lcMRk4CwfK+Biz9P1lpO+y/QdhnEV3
	LT4qFfCwJfV7JbrVv6lEziWLq+AVdTr35/iy6+Yvh2i9qs9/hJ/WGQvFIiUAeqRpNWDx
	2XXS42ce/tG5MueLmaSWvEJzC78zLz5d+JRf7sKi3wt+BTjlt3KICpixPkHdoXNwB+RA
	pWuLliWhAzQLSGphJFimJodSd/+jCHE1na0n0Owehc0DB97vmWmvYnbzlXyJ/Ajcoak8
	U1qQ==
Received: by 10.68.241.65 with SMTP id wg1mr46589682pbc.25.1345572583831;
	Tue, 21 Aug 2012 11:09:43 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id qb2sm617508pbb.15.2012.08.21.11.09.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 11:09:42 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2012 11:10:00 -0700
Message-Id: <1345572600-21149-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] task-base: pull in the bluez asound module when appropriate
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
X-List-Received-Date: Tue, 21 Aug 2012 18:21:48 -0000

From: Christopher Larson <chris_larson@mentor.com>

If the machine and distro both want alsa, then have task-base-bluetooth pull
in the libasound-module-bluez package.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/tasks/task-base.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index 2325dbf..d5dd140 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Merge machine and distro options to create a basic machine task/p
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r74"
+PR = "r75"
 
 inherit task
 
@@ -205,8 +205,9 @@ RRECOMMENDS_task-base-pcmcia = "\
 
 # Provide bluez-utils-compat utils for the time being, the binaries in that package will vanish soon from upstream releases, so beware! 
 
-RDEPENDS_task-base-bluetooth = "\ 
+RDEPENDS_task-base-bluetooth = "\
     bluez4 \
+    ${@base_contains('COMBINED_FEATURES', 'alsa', 'libasound-module-bluez', '',d)} \
     "
 
 RRECOMMENDS_task-base-bluetooth = "\
-- 
1.7.9.5



