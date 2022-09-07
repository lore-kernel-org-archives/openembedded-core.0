Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F24C54EE9
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:21:35 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.8219.1662560486374444602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GA7csQJL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id s206so13739593pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=tk+Bhq6O5XWtHWn07voD88OoQkYwPLO76jFl3H0DtCc=;
        b=GA7csQJLiuljODzcM3utazIFD8QtKSKl/LmK6u1v4lPP6k8UjkA7x4+hEXq2S6CfqU
         Qve5MkrDTy0cUO4rlqujOvxz1XTILEeHUZx3tpRF9pU+EAD5kpwu09pkNHgnsbxV3mjO
         qj9+EdP3VkKHRDSzuuwg1suNJRQP1N4BOmPicL8f5WqP1yyHt5W/FoMlOoSuMHf1us9F
         VkCutujC13rWEtPgoihpbRvcwPPIhMptrcEtIMQua9jtnCxFMS972+o+JL4Y9XN44KUf
         9Utrzx148XIdr0jp9XaDpeCNl0Ux6EBMasuAaqWu5ij8/uv1VFPm8JljjeHEy41xsa8H
         HX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=tk+Bhq6O5XWtHWn07voD88OoQkYwPLO76jFl3H0DtCc=;
        b=LwlRdCyBzwN7gUdhRgdV78OYBfsy4atW0oCuUe6OFqRHgodUSXnhNTt88igbjY+LrB
         FBbb0R5d32L8w04HUQnjJ+m4t9JUDb6Vdv+mx9e7vvwOmkrBNnY1wCNGzNVwmINoRx5j
         oYEA4UCOkO3tKNR9w41laM8z0Bl/BO1KCtLoA5+jTweesuxXNDzT8jyqB5E/x8y8tZiz
         rLf6mETyK+bd1sj0sDX6aOhUQ/gLJXFh536GT3Nz1ZHTHi7GLnKQ+4YaTfnOlT3SOkMr
         OpJCEaUE21lpIl8gBFUDUbta7i0pS/yV03DQElIIA4ulTi+hkPfivkIYI1D06CkZL8cR
         MFyg==
X-Gm-Message-State: ACgBeo0JU4IDyFFLQudXnDESY/r00oYDVueELieWeSsD7TkbqRmAbAex
	ASvHYMJD+lEE86jobJbqigAW9AUxfB03Q5Lb
X-Google-Smtp-Source: 
 AA6agR4HnqCq7aNyXroGRiX+6cgGvjaPVAWqJ+rAFgCIpCNBPcE1MmxW+h3qISA7XgakK22UVyU6NA==
X-Received: by 2002:a05:6a00:2393:b0:53a:c7a3:16f3 with SMTP id
 f19-20020a056a00239300b0053ac7a316f3mr4006082pfc.17.1662560485420;
        Wed, 07 Sep 2022 07:21:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.21.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:21:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/24] npm: return content of 'package.json' in
 'npm_pack'
Date: Wed,  7 Sep 2022 04:20:22 -1000
Message-Id: 
 <2f5c53745b4420dac9198ec013c6653b3e339a6b.1662559557.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/170416

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

We have to read 'package.json' to calculate the name of the tarball.
This content is interesting for later patches.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d67367e389c492ae90f9021066d6a4d5ebcf68e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


