Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE667700D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Sep 2015 15:25:47 +0000 (UTC)
Received: by qgez77 with SMTP id z77so48558972qge.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Sep 2015 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=/2L8h82Euk4kz5VBUjRF3YEsoUkGfHsL39SGFedECeM=;
	b=g0PQkx0z7lGf39Jv4AQDSH/92iC9Sgk4NRazxlpTQeHnt/yBzhQrh+UEg+qCFKL9OA
	yoOi9I3U9ewvWjgUtpn8hYahUeY2ApM1/oW1vhYydRHSYn6vVQiZSWv0QJqz5VB0YoiD
	fdxXXDZomFBtZMKeYwj2/Rizr0W3jULKMsAd4Gm+OzuGNiv+27vrPxYArHDbwQ7HtuaG
	hPTwZMg41gGp33L1qBnf8ck5hgaor0fNW+ciKidPiy2R/1aOJHTig1TAYfIsy8wtoURV
	wfhGdmSbqKvDhQm54p5cpft5ZRbEka28pvvheEP57vDulcVpJURZnL6TTZFoN3J2iRsH
	Y57A==
X-Received: by 10.140.81.135 with SMTP id f7mr20401969qgd.33.1441553147360;
	Sun, 06 Sep 2015 08:25:47 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	i196sm5098459qhc.22.2015.09.06.08.25.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Sep 2015 08:25:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Sep 2015 15:25:39 +0000
Message-Id: <a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441552859.git.raj.khem@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] rootfs: Do not uninstall update-rc.d
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
X-List-Received-Date: Sun, 06 Sep 2015 15:25:48 -0000

update-rc.d is now needed by systemd to interact with sysv
scripts, so if we have a mixed system, then we can not uninstall
update-rc.d as it is going to break systemd functionality

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oe/rootfs.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index c29843b..4ef16c4 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -238,8 +238,7 @@ class Rootfs(object):
                     pkgs_installed = installed_pkgs.read().splitlines()
                     for pkg_installed in pkgs_installed[:]:
                         pkg = pkg_installed.split()[0]
-                        if pkg in ["update-rc.d",
-                                "base-passwd",
+                        if pkg in ["base-passwd",
                                 "shadow",
                                 "update-alternatives",
                                 self.d.getVar("ROOTFS_BOOTSTRAP_INSTALL", True)
-- 
2.5.1


