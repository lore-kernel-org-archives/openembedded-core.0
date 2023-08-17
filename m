Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A0FC531DC
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 19:12:07 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.2450.1692299527137659523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 12:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=eDF9Q99F;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a81154c570so71037b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692299525; x=1692904325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxLHip6gvBacQAH0YPP44qSO7BL5JohHav7jeA5pz+o=;
        b=eDF9Q99FMaZHCU1X5EZjIEb/j/cEY+lEtm2dYqpfVrjnEu5mUYiqplHM9fkKzETeiU
         yKIl1FzZDeQH+McW9+vPhdOEz30SHMFAinpDO0XQcUOKTu894EdYQZirLWg8X7d3xUc8
         Ujs9wpCMXYI7uLTx8H9HPVGVvTRj4I8ms1BkFiDYL0h3LjARetVyM2cwBS7gmECklUul
         2ewWVtk430GPKzvseiXLn07xX6c0qAv1QmHDsakMoYB48evuDT6SSF/1TZZ3NwJ00Q7Q
         9fxbhbKCzxUVAQNM4N9AY1BQ7wp+vHi/XdIpf3GWuyR/gJ3YkgVOtRYb4jH2XMMElJsT
         Xs0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692299525; x=1692904325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxLHip6gvBacQAH0YPP44qSO7BL5JohHav7jeA5pz+o=;
        b=dWofZsyMtqo7V73dguYS9thAt0WeImKItpAS+dgl6+gVIvJ6i+nRqYPmvqb/OQll+0
         lZ+pvXWfZcbBlvX71JKKh4Z5j1WVh+Khe0wMIsTplrR7rtDxUakhCCR4kh0vPzP1ICeJ
         nGIOTVtvKEyOCHfRW7jMb099vD+pBD93bX0h8aqrOaY7TCLIDDsj7ZcMmCZ+GAm1iGRX
         9eO14z353CRVUdeZEu0dWA6zyIdW0eIgAomTPwmxFWiLxEu12dkz5Q1w0F+skqCVMfGL
         KfdfEqlzRT22Q7WDsDrETpkn5KDm1gbp63es2IM/tBmKIjDVH+rwmWDrUoEITHYDv5Fw
         SXuA==
X-Gm-Message-State: AOJu0Yzm1Fs+LTuLxZyjahdNkS8hiayO3HzWyfzcv7dCfJcPBN/ogr9m
	k5jGe9yLeTtFqSmoSQd0b2gs1IZNwVM=
X-Google-Smtp-Source: AGHT+IGXYI30KjAC7vx1g5yQK2Q23PNbldICP2T96eW7kGb9sDM439Pd3f3lr98d2xQdIHELyk6qhQ==
X-Received: by 2002:aca:1c01:0:b0:3a7:4e0c:faa2 with SMTP id c1-20020aca1c01000000b003a74e0cfaa2mr420343oic.27.1692299525647;
        Thu, 17 Aug 2023 12:12:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::6897])
        by smtp.gmail.com with ESMTPSA id u8-20020a056808150800b003a05ba0ccb2sm146704oiw.39.2023.08.17.12.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 12:12:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: p.lobacz@welotec.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC v2] sstatesig: Add ACL and XATTR data to outhash
Date: Thu, 17 Aug 2023 13:12:02 -0600
Message-Id: <20230817191202.1565879-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230817185431.1562460-1-JPEWhacker@gmail.com>
References: <20230817185431.1562460-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 19:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186339

Records the ACL and (some) extended attributes in the outhash

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
NOTE: This requires ACL and XATTR support from bitbake

V2: Filter ACLs to not duplicate the stat mode (since that also does
extra filtering)


 meta/lib/oe/sstatesig.py | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 633a0fd4502..1a11c8414ef 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -478,6 +478,8 @@ def OEOuthashBasic(path, sigfile, task, d):
     import grp
     import re
     import fnmatch
+    import bb.xattr
+    import bb.acl
 
     def update_hash(s):
         s = s.encode('utf-8')
@@ -640,6 +642,46 @@ def OEOuthashBasic(path, sigfile, task, d):
 
                 update_hash("\n")
 
+                def filter_acl(entry):
+                    # Skip owner user, owner group, and other tags. These are
+                    # covered by the stat permissions above
+                    if entry.tag in (bb.acl.ACL_USER_OBJ, bb.acl.ACL_GROUP_OBJ, bb.acl.ACL_OTHER):
+                        return False
+                    return True
+
+                def add_acl(path, typ, name):
+                    acl = bb.acl.ACL.from_path(path, typ)
+                    entries = [e for e in acl.entries() if filter_acl(e)]
+                    if entries:
+                        update_hash(name)
+                        update_hash(":\n")
+                        entries.sort(key=lambda x: (x.tag, x.qualifier, x.mode))
+                        for e in entries:
+                            update_hash(str(e))
+                            update_hash("\n")
+
+                def filter_xattr(name):
+                    # ACLs are handled above
+                    if name == "system.posix_acl_access":
+                        return False
+                    if name == "system.posix_acl_default":
+                        return False
+                    return True
+
+                # libacl always follows symlinks, so skip them
+                if not stat.S_ISLNK(s.st_mode):
+                    add_acl(path, bb.acl.ACL_TYPE_ACCESS, "ACL")
+                    if stat.S_ISDIR(s.st_mode):
+                        add_acl(path, bb.acl.ACL_TYPE_DEFAULT, "Default ACL")
+
+                attrs = bb.xattr.get_all_xattr(path, follow=False)
+                # Ignore ACLs; those are covered above
+                attrs = {k: v for k, v in attrs.items() if filter_xattr(k)}
+                if attrs:
+                    update_hash("XATTR:\n")
+                    for k, v in attrs:
+                        update_hash("%s: %s\n" % (k, v))
+
             # Process this directory and all its child files
             if include_root or root != ".":
                 process(root)
-- 
2.33.0


