Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2ACC77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 22:28:28 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.35.1685485702775091472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 15:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JZvusfXi;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f6042d610fso52230255e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 15:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685485701; x=1688077701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1i9z/PGc1Z1SXlUgJq8JK3J3Dhxd9BXF4iy1AuCHOO0=;
        b=JZvusfXiD/7g97s47o601hWYF6vvc0dPl3ly5ahuqVinCVB8iqPMsYWfqO4kpxOoUY
         lLOFBjhn/KeT34kqQDJmgpjDoS+1suhwcUT1WkyAW1gaCJlBnrJbg2yNXIWwiHhPY60x
         KKz+narrTFZsefYlpI2C14o2utH9zqXRPdBg640z2wq+qNxmysu7bNpbWybrF/NFHlvV
         oqqnTPuGXnKzECdHqOp+QvO0yx0v/tASUsXKR91uVcn0RQ6B4WiW3OApRPUolEGZjWdl
         UhOYDlO9Ef/IBw0wJIp+FErLfho0+zfp3zUVpFZFVUCBE7gfNHFPX8uC2nLOLjeVVSci
         mGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685485701; x=1688077701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1i9z/PGc1Z1SXlUgJq8JK3J3Dhxd9BXF4iy1AuCHOO0=;
        b=A1f4IqeZyM9dwo/7t2Sc0ZNUL5/QnYqPLLjqlWOeTV/Hs2GHB0YeDAZQNN3nO4BxCj
         mRCeudNuYcJb8X6d9tYgJTUc5pQCHn5HkNa8vXzRCPUhqn9nX7ulHEiM1Z+lOT3/rnSr
         eJ6tnyq55iBC7dMgV+1zh4psrtrCNwVAAT+sHrQnt8bbV7PTSoc1MLE7jg0pbK6e3B1W
         E/b8BuPr9rOHeubDHblOEkoeX8bgs5Gilfr168T6FFQv71yH31C6OY8/2uUokU9W1pwj
         UlPpaSuZtAdUWOHJdqSrbRc5uKHtivP4ipsRdTTntMWL7iBsWgzMLNLvbHNu7P2p/T9c
         1Sow==
X-Gm-Message-State: AC+VfDzwD9i4BuVu7IRXYU1YPZjKbhshGvti4OVwIevIWb86qxdoCam/
	CrX+7u7mXrNUUFoWBGM9qIgUp9TK/Yg3Arbm
X-Google-Smtp-Source: ACHHUZ7Pz2n0FU1v3J1iEqC5J1C9eBi15L+/IrD5JXFARbfj3Gt1CN4Kq+syyPeDos31M4bvZbkZPA==
X-Received: by 2002:a1c:cc07:0:b0:3f1:93c2:4df7 with SMTP id h7-20020a1ccc07000000b003f193c24df7mr2550153wmb.5.1685485700780;
        Tue, 30 May 2023 15:28:20 -0700 (PDT)
Received: from localhost.localdomain (2a02-842a-002e-7001-af81-84f4-744a-71c9.rev.sfr.net. [2a02:842a:2e:7001:af81:84f4:744a:71c9])
        by smtp.gmail.com with ESMTPSA id f16-20020a7bcc10000000b003f60fb2addbsm22515276wmh.44.2023.05.30.15.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 15:28:20 -0700 (PDT)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-core@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	e.aubineau@technologyandstrategy.com,
	j.guignard@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [master][PATCH 5/6] classes: npm: Add support for the new format of the shrinkwrap file
Date: Wed, 31 May 2023 00:27:51 +0200
Message-Id: <20230530222752.42503-5-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
References: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 22:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181965

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

1 - Adapt do_configure to the new format of the shrinkwrap

2 - Remove useless function _npmsw_dependency_dict because the dictionnary
    is already given by npmsw:foreach_dependencies

3 - Rename arguments of callback functions

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 meta/classes-recipe/npm.bbclass | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/meta/classes-recipe/npm.bbclass b/meta/classes-recipe/npm.bbclass
index 92e59fefce..c1944ca14e 100644
--- a/meta/classes-recipe/npm.bbclass
+++ b/meta/classes-recipe/npm.bbclass
@@ -130,22 +130,6 @@ python npm_do_configure() {
         sha512 = bb.utils.sha512_file(tarball)
         return "sha512-" + base64.b64encode(bytes.fromhex(sha512)).decode()
 
-    def _npmsw_dependency_dict(orig, deptree):
-        """
-        Return the sub dictionary in the 'orig' dictionary corresponding to the
-        'deptree' dependency tree. This function follows the shrinkwrap file
-        format.
-        """
-        ptr = orig
-        for dep in deptree:
-            if "dependencies" not in ptr:
-                ptr["dependencies"] = {}
-            ptr = ptr["dependencies"]
-            if dep not in ptr:
-                ptr[dep] = {}
-            ptr = ptr[dep]
-        return ptr
-
     # Manage the manifest file and shrinkwrap files
     orig_manifest_file = d.expand("${S}/package.json")
     orig_shrinkwrap_file = d.expand("${S}/npm-shrinkwrap.json")
@@ -177,24 +161,25 @@ python npm_do_configure() {
     progress_total = 1 # also count the main package
     progress_done = 0
 
-    def _count_dependency(name, params, deptree):
+    def _count_dependency(name, params, destsuffix):
         nonlocal progress_total
         progress_total += 1
 
-    def _cache_dependency(name, params, deptree):
-        destsubdirs = [os.path.join("node_modules", dep) for dep in deptree]
-        destsuffix = os.path.join(*destsubdirs)
+    def _cache_dependency(name, params, destsuffix):
         with tempfile.TemporaryDirectory() as tmpdir:
             # Add the dependency to the npm cache
             destdir = os.path.join(d.getVar("S"), destsuffix)
             (tarball, pkg) = npm_pack(env, destdir, tmpdir)
             _npm_cache_add(tarball, pkg)
             # Add its signature to the cached shrinkwrap
-            dep = _npmsw_dependency_dict(cached_shrinkwrap, deptree)
+            dep = params
             dep["version"] = pkg['version']
             dep["integrity"] = _npm_integrity(tarball)
             if params.get("dev", False):
                 dep["dev"] = True
+            if "dependencies" not in cached_shrinkwrap:
+                cached_shrinkwrap["dependencies"] = {}
+            cached_shrinkwrap["dependencies"][name] = dep
             # Display progress
             nonlocal progress_done
             progress_done += 1
-- 
2.25.1


