Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E364C4321E
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 10:06:28 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web12.5794.1652954775950427984
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 03:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=R+00HQn9;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA6Atw621378
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:06:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652954771;
	bh=JGPM6hoyOtYMAuhEg+rktOd6b6XhEKy8/h3GZgAM4Gk=; l=1768;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R+00HQn9Tf16Az5nvyu7Z724Gpi4iMChqfHUwIzohVBRWk457WEdSKsSWHoI58e9z
	 Okoq+fJ3XX7ILHs3KlEAuzD3mneLigXkvUZqofG/kG81eVoOuReq55GpWlZh/2KaCP
	 tiDjCArzSIe+YzkD4gCSJ6YikYWx940K6yCseNGL2Ku+XBB3W5kJZXtoWO885Tai6e
	 QpV3wrhDfthOs+Ge3GC4y8pT9RmrtwaaXUHKDWWq8dU+VOy44zrEqn6mExAvuI/kVa
	 CPeEkJMOCJjmZhZ5xlkHDXvBJiZg1g/fn2LhWDWUYFeYaWmokblOrN3PTUU1nhfOAP
	 182jX51I5vnEQ==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JA687C2313863
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 12:06:08 +0200
Received: from mail-msa-2.intern.sigma-chemnitz.de ( [192.168.12.72]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 4E59FBF212B; Thu, 19 May 2022 12:06:06 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA66OX596899
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 May 2022 12:06:06 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrd2k-004ImS-Is;
	Thu, 19 May 2022 12:06:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 2/6] npm: return content of 'package.json' in 'npm_pack'
Date: Thu, 19 May 2022 12:05:52 +0200
Message-Id: 
 <fce5f441a9f2b57eebf4774565b67c8a0169635e.1652954597.git.enrico.scholz@sigma-chemnitz.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165873

We have to read 'package.json' to calculate the name of the tarball.
This content is interesting for later patches.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/npm.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 91f8f36b0d..014f793450 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -86,7 +86,7 @@ def npm_pack(env, srcdir, workdir):
                     '.'],
                    check = True, cwd = srcdir)
 
-    return tarball
+    return (tarball, j)
 
 python npm_do_configure() {
     """
@@ -186,7 +186,7 @@ python npm_do_configure() {
         with tempfile.TemporaryDirectory() as tmpdir:
             # Add the dependency to the npm cache
             destdir = os.path.join(d.getVar("S"), destsuffix)
-            tarball = npm_pack(env, destdir, tmpdir)
+            (tarball, pkg) = npm_pack(env, destdir, tmpdir)
             _npm_cache_add(tarball)
             # Add its signature to the cached shrinkwrap
             dep = _npmsw_dependency_dict(cached_shrinkwrap, deptree)
@@ -207,7 +207,7 @@ python npm_do_configure() {
 
     # Configure the main package
     with tempfile.TemporaryDirectory() as tmpdir:
-        tarball = npm_pack(env, d.getVar("S"), tmpdir)
+        (tarball, _) = npm_pack(env, d.getVar("S"), tmpdir)
         npm_unpack(tarball, d.getVar("NPM_PACKAGE"), d)
 
     # Configure the cached manifest file and cached shrinkwrap file
@@ -280,7 +280,7 @@ python npm_do_compile() {
         args.append(("build-from-source", "true"))
 
         # Pack and install the main package
-        tarball = npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
+        (tarball, _) = npm_pack(env, d.getVar("NPM_PACKAGE"), tmpdir)
         cmd = "npm install %s %s" % (shlex.quote(tarball), d.getVar("EXTRA_OENPM"))
         env.run(cmd, args=args)
 }
-- 
2.36.1


