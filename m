Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3B3C433F5
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 10:06:28 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web08.5769.1652954775987690835
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 03:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=iF8FYysq;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA6AmT621379
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:06:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652954771;
	bh=oabpkaatAsg+o6yoxc3Os1uQmWXvlIwpVHqzUBOqdv0=; l=2574;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iF8FYysqmBW5vYtzcN/xnsczu2dII5fY9HMc6yaS+7Y1swQNdNnyZpBFd99dXwiTc
	 xI7x3XDPF7IBOBmz3lMFAYLrfTFYCEpCtOKNDry608MhKiRVdEnauWowlRhLOBbbeX
	 26KOF0gpUFtQ7vjyr7e793GLSF2nEAYdrKvBRI2p070W5AScmQrnq1GUgHft/4B1Dc
	 A7FOUi6+cJToxT+tN2reIoV9XiMmTqhOkBXqSVj0VC5/cYcjwm9pWprh0oQYxWRlND
	 kqTNViPRiQSOsF+YAxOVZTSnevuWI+0MbS8QX6p3IKjJNaSuztl1FjutbFd5Cqkqox
	 CffCBtKxJGeGA==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JA68rm791535
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 12:06:08 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 559B71EC74D; Thu, 19 May 2022 12:06:06 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA66ui596901
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 May 2022 12:06:06 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrd2k-004Ime-Mx;
	Thu, 19 May 2022 12:06:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 6/6] npm: use npm_registry to cache package
Date: Thu, 19 May 2022 12:05:56 +0200
Message-Id: 
 <26cd22d02a7c2544fbcb8646ca611d88ccb5286b.1652954597.git.enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
References: <cover.1652954597.git.enrico.scholz@sigma-chemnitz.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 10:06:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165876

With nodejs 16, the simple 'npm cache add' approach does not work
anymore because its fetcher implementation downloads also meta
information from the registry.

We have to generate these information and add them to the cache.
There is no direct support in 'npm' for task so we have to implement
it manually.

This implementation consists of a openembedded python module (in
oe-core) and a nodejs version specific helper (in oe-meta).

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/npm.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 1e41072116..f3c3e2f5b7 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -19,7 +19,7 @@
 
 inherit python3native
 
-DEPENDS:prepend = "nodejs-native "
+DEPENDS:prepend = "nodejs-native nodejs-oe-cache-native "
 RDEPENDS:${PN}:append:class-target = " nodejs"
 
 EXTRA_OENPM = ""
@@ -46,6 +46,7 @@ NPM_ARCH ?= "${@npm_target_arch_map(d.getVar("TARGET_ARCH"))}"
 NPM_PACKAGE = "${WORKDIR}/npm-package"
 NPM_CACHE = "${WORKDIR}/npm-cache"
 NPM_BUILD = "${WORKDIR}/npm-build"
+NPM_REGISTRY = "${WORKDIR}/npm-registry"
 
 def npm_global_configs(d):
     """Get the npm global configuration"""
@@ -111,16 +112,18 @@ python npm_do_configure() {
     from bb.fetch2.npm import npm_unpack
     from bb.fetch2.npmsw import foreach_dependencies
     from bb.progress import OutOfProgressHandler
+    from oe.npm_registry import NpmRegistry
 
     bb.utils.remove(d.getVar("NPM_CACHE"), recurse=True)
     bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=True)
 
     env = NpmEnvironment(d, configs=npm_global_configs(d))
+    registry = NpmRegistry(d.getVar('NPM_REGISTRY'), d.getVar('NPM_CACHE'))
 
-    def _npm_cache_add(tarball):
-        """Run 'npm cache add' for a specified tarball"""
-        cmd = "npm cache add %s" % shlex.quote(tarball)
-        env.run(cmd)
+    def _npm_cache_add(tarball, pkg):
+        """Add tarball to local registry and register it in the
+           cache"""
+        registry.add_pkg(tarball, pkg)
 
     def _npm_integrity(tarball):
         """Return the npm integrity of a specified tarball"""
@@ -184,7 +187,7 @@ python npm_do_configure() {
             # Add the dependency to the npm cache
             destdir = os.path.join(d.getVar("S"), destsuffix)
             (tarball, pkg) = npm_pack(env, destdir, tmpdir)
-            _npm_cache_add(tarball)
+            _npm_cache_add(tarball, pkg)
             # Add its signature to the cached shrinkwrap
             dep = _npmsw_dependency_dict(cached_shrinkwrap, deptree)
             dep["version"] = pkg['version']
-- 
2.36.1


