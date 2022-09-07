Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE40C38145
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:25 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.8356.1662560445113510708
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WYyVPyrb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id fv3so8598287pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=z1T3JNdMO4gz0n5/kHOtKJCw54dQ/OtyMzg5deH//F0=;
        b=WYyVPyrb3cTvTTkpC/kC68PiIj+qixc6fiLCv6ignAyH8hc+wV+jh6fRGZok77SoCk
         a1XsFyt4BdhFASbtbzeSzVLSQPvft025NP1QwsPxaxh+TPq6iuRODcwaZkCN/CMr8zwE
         q6Ysa2d1GL51LTxmhPytLCv7bVqgU3WfQgn1RmRFnkesKkh/FWamaqkJtGFxFyRinLmp
         rKU4TN//+210AMmgNCt8+p6vMMkGKyEPCqtcavciOgkwXLfEyPSpPLsY/ntb99Fufp7D
         F1X1ei+E7V/yLFPizW2uI8WF6RcVYQYJSQH6GNTO6Miu07/i3DKNd7osN1CYNAET3P2m
         QEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=z1T3JNdMO4gz0n5/kHOtKJCw54dQ/OtyMzg5deH//F0=;
        b=aQy/hjdHQNZK35qwY/0thdyBzvPOxV8t4phHC0xX6+ypHq8RD8JQMt7OOS8o3M9ggY
         MbBUJVUAsRr47+5IW2x+gs0OeAg+dcTytYa5yP0pzZZJJfp9aGgR8rudDsGRW7G6n0Zz
         K0lKJwhjVpUCaP4M9DlBnWQ6BlQFPja8tpV6JQ7KNtJ8W3KfCyeLb6Bh05sU5qc10f8E
         Zi40o7PWy8TN5GQsaJYNQHBEYUrJX27zCjN8bi3XR/YuB58v2o0PMbwlQveMLjNyWsrF
         XnyQopRVO457SoXl0YGxlOH3TLcM8KA0hSO8wBG+eAVt3yb3d54owk7IYN3aGe3Iz9lW
         U9yA==
X-Gm-Message-State: ACgBeo34sPRRF48FA6pw9ZjxL0BMkXDNuSZVEJDx6/soBHAi41knjS+c
	MmhfMOroRoRet9u1kUMqn3BNpXtoSsmBrgeA
X-Google-Smtp-Source: 
 AA6agR4aPVBg473RGH9fvPNr99fFjT1CqenPwF0c86K8D3cryjwt47NsfOZ006sL/oqY0xs4sQ1Qsg==
X-Received: by 2002:a17:902:720c:b0:172:a1ff:8c21 with SMTP id
 ba12-20020a170902720c00b00172a1ff8c21mr4181730plb.159.1662560481680;
        Wed, 07 Sep 2022 07:21:21 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 20/24] npm: replace 'npm pack' call by 'tar czf'
Date: Wed,  7 Sep 2022 04:20:21 -1000
Message-Id: 
 <8a83fbca45a74c30265168767a716e1a272df89b.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:21:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170415

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

'npm pack' is a maintainer tool which tries to execute 'prepare'
and similar scripts.  This fails usually in OE because it requires
completely installed 'node_modules'.

Earlier nodejs versions supported an undocumented 'ignore-scripts'
option.  This has been removed in nodejs 16.

We could patch 'package.json' and remove the unwanted scripts.  But
this might complicate local workflows (applying patches) and installed
packages will contain the modified 'package.json'.

Instead of, package it manually by 'tar czf'.  As a sideeffect,
'do_configure' is running much faster now.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 68b480d64ffb6750699cc8fa00d2ac0bc6a2e58a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/npm.bbclass | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
index ba50fcac20..91f8f36b0d 100644
--- a/meta/classes/npm.bbclass
+++ b/meta/classes/npm.bbclass
@@ -57,13 +57,36 @@ def npm_global_configs(d):
     configs.append(("cache", d.getVar("NPM_CACHE")))
     return configs
 
+## 'npm pack' runs 'prepare' and 'prepack' scripts. Support for
+## 'ignore-scripts' which prevents this behavior has been removed
+## from nodejs 16.  Use simple 'tar' instead of.
 def npm_pack(env, srcdir, workdir):
-    """Run 'npm pack' on a specified directory"""
-    import shlex
-    cmd = "npm pack %s" % shlex.quote(srcdir)
-    args = [("ignore-scripts", "true")]
-    tarball = env.run(cmd, args=args, workdir=workdir).strip("\n")
-    return os.path.join(workdir, tarball)
+    """Emulate 'npm pack' on a specified directory"""
+    import subprocess
+    import os
+    import json
+
+    src = os.path.join(srcdir, 'package.json')
+    with open(src) as f:
+        j = json.load(f)
+
+    # base does not really matter and is for documentation purposes
+    # only.  But the 'version' part must exist because other parts of
+    # the bbclass rely on it.
+    base = j['name'].split('/')[-1]
+    tarball = os.path.join(workdir, "%s-%s.tgz" % (base, j['version']));
+
+    # TODO: real 'npm pack' does not include directories while 'tar'
+    # does.  But this does not seem to matter...
+    subprocess.run(['tar', 'czf', tarball,
+                    '--exclude', './node-modules',
+                    '--exclude-vcs',
+                    '--transform', 's,^\./,package/,',
+                    '--mtime', '1985-10-26T08:15:00.000Z',
+                    '.'],
+                   check = True, cwd = srcdir)
+
+    return tarball
 
 python npm_do_configure() {
     """
-- 
2.25.1


