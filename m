Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7852CC7EE24
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 16:29:18 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.1433.1692376154651789595
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 09:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=C0QM+slC;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a44cccbd96so738911b6e.3
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 09:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692376153; x=1692980953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrH2ZibmVOSkQRNTKkguiCb+wGYtF0CKT9AbBq696vU=;
        b=C0QM+slCWfIzQLNKs00hsO72WlcictlQ1u6uF0hlVU/W/7nXZKJyMHMzTkC4iibo3M
         E2D2eC5GPLYF35VO4nENl+Xpb/CdGThBKuFU4YDo0ayeH+HixfGKSq3LFsdYhVs8vpOm
         wg6yek4EAjchFz9VsbP49qR8xw1NTUOCUrBdsA0dy3GvWCZS7axYV4Oa8+NXHOfa/dGd
         HB8jz6h4ByWqTLKYXTM5uBXxPFa0Rx6oVEZ06pKN8eN9B6+1zISv0+Hqav+6sZqTWa7y
         veGLFgk3TL7ZPcs6uqJd0+SKoj+kIJSUDptYH6O5jmYCwrY5VHQ10ZWFd16C0SaMgTG0
         YNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692376153; x=1692980953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrH2ZibmVOSkQRNTKkguiCb+wGYtF0CKT9AbBq696vU=;
        b=bEOLCSF5EYsemVqrtpFS6Ojp42rUC4YP2O/Y/UJLk4YYLp5noM7Hh79lDOcIPPc52d
         aWoRauvSL3LrBXw6Zn2j5aUqvxQu+NgcOO4nh0FSqjMcMOrwDldBKqsPMj6/Ir0Y229x
         +hFI9Kfmkh3I1QCxaq8Re2Bxdrxx4r9AbWureYvSurQqGIasb6CV1qQM2624ftv6MvwE
         aoTZmgt1UggWihlSELIiI2S0dCYASaUUa3neKmEmVYiSMseXFuUgYXYO6KggDz58ekgU
         DpvvTFyGdna/tRLpeDZDkQhRu4opN8ik3IZTN+0Vif9AlgegSzM6EagQj+xAEHXyZoc9
         59sw==
X-Gm-Message-State: AOJu0Yztch/UiorLBfwJI1WpE+pI1ZQ/B3zK/NSs8EKEU7T5OLotkBvA
	vAzS+PHe9/40ICw4epNeyA2tyA23nFk=
X-Google-Smtp-Source: AGHT+IHUH7A5z+2kz+jniIubxxzfxlKf67pKeQv2HpE30zQisNBO6+wMyJhrLYKAe6Eu+PqHCc7g4Q==
X-Received: by 2002:a54:4098:0:b0:3a7:7bd3:7a7d with SMTP id i24-20020a544098000000b003a77bd37a7dmr3547735oii.23.1692376153271;
        Fri, 18 Aug 2023 09:29:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::c239])
        by smtp.gmail.com with ESMTPSA id 7-20020aca0f07000000b003a78d196acasm1014481oip.32.2023.08.18.09.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 09:29:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3] sstatesig: Add ACL and XATTR data to outhash
Date: Fri, 18 Aug 2023 10:29:09 -0600
Message-Id: <20230818162909.1733262-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230817191202.1565879-1-JPEWhacker@gmail.com>
References: <20230817191202.1565879-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 16:29:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186379

Records the ACL and (some) extended attributes in the outhash

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
NOTE: This requires ACL and XATTR support from bitbake

V2: Filter ACLs to not duplicate the stat mode (since that also does
extra filtering)

V3: Fix missing .items() when iterating XATTRS

 meta/lib/oe/sstatesig.py | 42 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 633a0fd4502..fb39efa933e 100644
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
+                    for k, v in attrs.items():
+                        update_hash("%s: %s\n" % (k, v))
+
             # Process this directory and all its child files
             if include_root or root != ".":
                 process(root)
-- 
2.33.0


