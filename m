Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F664C43219
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 10:06:28 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.5809.1652954777537820610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 03:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=s6D2h4JD;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 24JA6EJ3884858
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 12:06:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1652954774;
	bh=9fL99t6vbwBkirIUh39Mw6WJVQTX21pT/cCk6141nvQ=; l=1289;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=s6D2h4JDmNdzbTcSTSEdUr3eWU508RihBN6ajpghXUncfow0bJ6y8hk7XZcaOtrrh
	 B+JvI7wpgcOtKPrwAc6WIn6dPharXfHorWnvp2bIMWmB66UZV+K3UOGkqA+1qqMD6I
	 TsIVXuJV6PHx+6kFrGgTZbPyOzbiqbi48uQ/hlKoTUPB6k4sUvqnvRwTGPVaETtnxi
	 ilyb2Z0HY4rUmMe2U23LtkFDD7y99gBqIOWzCQzX/wd7xwwEZ1aAVK+4bGBwi9ZD1d
	 DQw0vmDsDvMRr2M1wl6HrtVFRuKmJ4eNlrmmRam396d9+tZJjk7wkjCG6cjYcwBgh9
	 /79zOpDDfZZ8Q==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 24JA68wT791549
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 19 May 2022 12:06:10 +0200
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 10A11FA07C7; Thu, 19 May 2022 12:06:07 +0200
Received: from ensc-pc.intern.sigma-chemnitz.de
 (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 24JA66XC856494
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 19 May 2022 12:06:06 +0200
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.95)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nrd2k-004ImV-Jp;
	Thu, 19 May 2022 12:06:06 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 3/6] npm: take 'version' directly from 'package.json'
Date: Thu, 19 May 2022 12:05:53 +0200
Message-Id: 
 <37a1970bc8cacda99efefad7c6480cb694d9aec7.1652954597.git.enrico.scholz@sigma-chemnitz.de>
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
 https://lists.openembedded.org/g/openembedded-core/message/165875

We know the content of 'package.json' from earlier patches; there is
no need to parse the tarball name to extract the version.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/npm.bbclass | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index 014f793450..11c80a738e 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -125,11 +125,6 @@ python npm_do_configure() {
         sha512 = bb.utils.sha512_file(tarball)
         return "sha512-" + base64.b64encode(bytes.fromhex(sha512)).decode()
 
-    def _npm_version(tarball):
-        """Return the version of a specified tarball"""
-        regex = r"-(\d+\.\d+\.\d+(-.*)?(\+.*)?)\.tgz"
-        return re.search(regex, tarball).group(1)
-
     def _npmsw_dependency_dict(orig, deptree):
         """
         Return the sub dictionary in the 'orig' dictionary corresponding to the
@@ -190,7 +185,7 @@ python npm_do_configure() {
             _npm_cache_add(tarball)
             # Add its signature to the cached shrinkwrap
             dep = _npmsw_dependency_dict(cached_shrinkwrap, deptree)
-            dep["version"] = _npm_version(tarball)
+            dep["version"] = pkg['version']
             dep["integrity"] = _npm_integrity(tarball)
             if params.get("dev", False):
                 dep["dev"] = True
-- 
2.36.1


