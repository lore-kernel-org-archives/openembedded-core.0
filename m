Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C3CC38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:35 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.8309.1662560471939568119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=szMJhshz;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso10024957pjd.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=/GIO0QsPNYUHwpfZC5pkeVs6z/T/+qWGrRrnPF2MJC8=;
        b=szMJhshzHirMNpc3FzbwvM7B5qlAA4f7L/tmd8zxZEV/sit+EfiLcVmyusVH8AE3lO
         IgTQ+DYqedgk4KqJpTDglk8HFnmMOiVNQrbOmb/v0KfKhiC7om7e8pA0yvsLQHfyrv00
         7b5IAKrB9LSl0DkcWZ5jwvKk9qoOCsiHjrJj36v8RiMmkaFNNVk7VywCnb2rH6eHHIB7
         z1rCVMY4U3GzrtBOlAgJfTl1JhBjD4LrEBoAePUA+yyH5gbE/yGEUOcSekB/jHXw5spb
         yPscZYjU1lKX5799vcQE/xtb+6P073MfTUiTuxrYkcH31QKc2t4y9cowbuiTskd33cvD
         49CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/GIO0QsPNYUHwpfZC5pkeVs6z/T/+qWGrRrnPF2MJC8=;
        b=WYjuqEruOQJjZVQJqXCT6+XqnzJppey0QC1cwjdPswzDeGfbgNvaI9f7xaIF0GBwYZ
         jRnJqOhu7essz56f8zDM1eUnFC0ZEKZF2dIL5kYtjMeTz1UdT6FfTdPffIqBVea1jN6r
         RZ4adel139o2wT4KsQCUyfSIzrjKcTflvtn68wntwrmC9CfUHM+6prwUIMg75o5YJT+6
         Aq9RjHmE5575VJNMNCixzZV+/mnAcvJOe6Pd5zbXIGBGNidroHcrp5LKqsCSXNUc5rZB
         LMWBHtyBrz9rtK1REBldZT2r0x4VWyzc/uicCpiMQOBEoFaoMqdHzKzxAaSTKGEgWCKK
         gi0w==
X-Gm-Message-State: ACgBeo1NG7JHutAllapL90a90OPfceMP+qdEidEpyiWZLjwOG/mHl6U9
	qqsaflxu0/KUtT7Cyzv4rwwTtmtUYS71twZg
X-Google-Smtp-Source: 
 AA6agR7Xy6HIttLnuvyhbMZadMaCU7b+EKLg+67qE0Tl96QhII0YrgkxgmCSS3HEQZ9hhEcMrAcqLg==
X-Received: by 2002:a17:902:f68d:b0:172:a34c:ff96 with SMTP id
 l13-20020a170902f68d00b00172a34cff96mr4282664plg.26.1662560491576;
        Wed, 07 Sep 2022 07:21:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 24/24] npm: use npm_registry to cache package
Date: Wed,  7 Sep 2022 04:20:25 -1000
Message-Id: 
 <bfce90b1260d07f01a8dc2998c9e63ca36d4ebbe.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170419

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

With nodejs 16, the simple 'npm cache add' approach does not work
anymore because its fetcher implementation downloads also meta
information from the registry.

We have to generate these information and add them to the cache.
There is no direct support in 'npm' for task so we have to implement
it manually.

This implementation consists of a openembedded python module (in
oe-core) and a nodejs version specific helper (in oe-meta).

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 019b9c341d539939098962c228c1fd5c99331312)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/npm.bbclass | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 11c80a738e..8379c7b988 100644
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
@@ -109,16 +110,18 @@ python npm_do_configure() {
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
@@ -182,7 +185,7 @@ python npm_do_configure() {
             # Add the dependency to the npm cache
             destdir = os.path.join(d.getVar("S"), destsuffix)
             (tarball, pkg) = npm_pack(env, destdir, tmpdir)
-            _npm_cache_add(tarball)
+            _npm_cache_add(tarball, pkg)
             # Add its signature to the cached shrinkwrap
             dep = _npmsw_dependency_dict(cached_shrinkwrap, deptree)
             dep["version"] = pkg['version']
-- 
2.25.1


