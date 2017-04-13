Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2F877E44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 14:42:37 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q125so12959173wmd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 07:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=BZorwYoufdIcI/0oQXDyuBCp6dzagKqNYCPQXKEhLWw=;
	b=XCymr117HpCgAixjkmWg95BJj2zeRQaZrgXGqME0MjtG+K5QCjrhyI/ekQc3hfPo6b
	VmS0FodBwjfk+rOQEq52QnseuJiZqh6LqI7j7eqAYxRBSSwXy/pgz1DZ7XVSEbv9ShDn
	Kr/3QJfQhGIIU5B44DUy6Hu2XTHApQ+ri2Cn1rbMzfsb5gQqAawZi+l5OXJ2PKuiNGDy
	bTsejIDKyVkdMRqMsYPbUVIuSbWHI2THLz6GYivdoSic5HVvxyzQPFKOc0PyvDn0+gX5
	HzKo5lgjmtwonvTYbIPlmRsN6YbBzug60FDMbqw9KVIzpmDs+26/D4BwazoOhZISvkXA
	fD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BZorwYoufdIcI/0oQXDyuBCp6dzagKqNYCPQXKEhLWw=;
	b=dmeV7leMV1eCFPxqA9bz4igVDEK66OuFbnVM6LdcktGjcJ2CtsceHhV13O927s5E3z
	pHvh/axPHG0GbXLm1QLSkt/sqOCIKFSpneIQ+fmRPH3gM7dFktiJQ5zCwz3m1OrmuvdN
	fx4ybzc/Waak+W/hy3HdtnGylqsqOHnjvt/EwVzJk57N5hqMafibpDNY60mX5DtiIFF6
	MkE3buAoOphoXE6C5bujKMA4utetzVMn6LWyHhgKvBAsj4inXDLKqmX1KHpUIlmNqVjC
	Tv8MMRneRhBsg8NIx05VOZCO0egAfOCkyK2pnsUOUXYYH9BFlbQskd1KoHq6wlGjTA4e
	dH3A==
X-Gm-Message-State: AN3rC/5U++UgOzTc3z7c17e0OoKHT5Gc5sTeKD2w9Wr9dl3HbHKItmzx
	qF4OZCWGX4W3cRAU
X-Received: by 10.28.203.132 with SMTP id b126mr26181766wmg.90.1492094558173; 
	Thu, 13 Apr 2017 07:42:38 -0700 (PDT)
Received: from devmjo0.home (host86-154-139-143.range86-154.btcentralplus.com.
	[86.154.139.143]) by smtp.gmail.com with ESMTPSA id
	y63sm2908307wme.31.2017.04.13.07.42.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 07:42:37 -0700 (PDT)
From: "Ian.Arkver" <ian.arkver.dev@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Apr 2017 15:42:36 +0100
Message-Id: <a96e2f342990f92ddc1a530ee748d6e8d078d654.1492094274.git.ian.arkver.dev@gmail.com>
X-Mailer: git-send-email 2.12.1
Subject: [PATCH] package_manager.py: Generate separate repo entries per arch
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
X-List-Received-Date: Thu, 13 Apr 2017 14:42:38 -0000

dnf requires a serparate repo for each architecture. This patch
writes one config file per PACKAGE_FEED_URIS entry with an entry
for each architecture, if any.

It also uses a space separated version of the repo id as the repo
name instead of just the id again.

Signed-off-by: Ian.Arkver <ian.arkver.dev@gmail.com>
---
 meta/lib/oe/package_manager.py | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 5a189cff97..60d6e52a58 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -550,12 +550,19 @@ class RpmPM(PackageManager):
         bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.repos.d"))
         remote_uris = self.construct_uris(feed_uris.split(), feed_base_paths.split())
         for uri in remote_uris:
-            repo_name = "oe-remote-repo" + "-".join(urlparse(uri).path.split("/"))
+            repo_base = "oe-remote-repo" + "-".join(urlparse(uri).path.split("/"))
             if feed_archs is not None:
-                repo_uris = [uri + "/" + arch for arch in feed_archs.split()]
+                for arch in feed_archs.split():
+                    repo_uri = uri + "/" + arch
+                    repo_id   = "oe-remote-repo"  + "-".join(urlparse(repo_uri).path.split("/"))
+                    repo_name = "OE Remote Repo:" + " ".join(urlparse(repo_uri).path.split("/"))
+                    open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'a').write(
+                             "[%s]\nname=%s\nbaseurl=%s\n\n" % (repo_id, repo_name, repo_uri))
             else:
-                repo_uris = [uri]
-            open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_name + ".repo"), 'w').write("[%s]\nname=%s\nbaseurl=%s\n" % (repo_name, repo_name, " ".join(repo_uris)))
+                repo_name = "OE Remote Repo:" + " ".join(urlparse(uri).path.split("/"))
+                repo_uri = uri
+                open(oe.path.join(self.target_rootfs, "etc", "yum.repos.d", repo_base + ".repo"), 'w').write(
+                             "[%s]\nname=%s\nbaseurl=%s\n" % (repo_base, repo_name, repo_uri))
 
     def _prepare_pkg_transaction(self):
         os.environ['D'] = self.target_rootfs
-- 
2.12.1


