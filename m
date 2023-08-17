Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF12C3DA6F
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 18:54:37 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.1959.1692298475925122460
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 11:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gzId6kWb;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1ba5cda3530so10332fac.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 11:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692298474; x=1692903274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rXyHKlxlkQP1Jn98Dsq2EPV7bWeMMMcB2j1RYcZQj6c=;
        b=gzId6kWbLQZuWrR0a9NKdrf2BakVpqyGZO58Ti9H4ZXVdOWi2xNVGgpLSW64v44LoP
         6/z5RtOKGmhvQYKmCa8Wuw0PcpCz/QO/9VaJWTYfyI9ylpcScQh4R0X6WsroEO4y+EoO
         vGkslTHtDUOE8rEZqUssjZ7DvlYLfghLZHcjDscEg1s1v0c1bu8baHiK+4BZx9Ld1UPp
         ljcCl7uFcoDtAwnxZhHQtUedZVJl4z+M3nTwm3MbkSe+ygylz2gWSw738qDTWEBFyug/
         FI7Gigc0GU0n9crok61iAzn4qpaoCXprBiXaQoZVgcztfwN9xDcwUyZhgASCH9Eyjrzv
         qPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298474; x=1692903274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXyHKlxlkQP1Jn98Dsq2EPV7bWeMMMcB2j1RYcZQj6c=;
        b=B++5Y6psAk5XVnpeeV2/VyGuxjI3jVB5OeQiqdRTd0FB3YIflu8VIue43me2AjTTVo
         YfYAuhh5sA2z0WSrBoJJVpQ8UaGe1mNcbVFs0XqK5ay6GQRiTh1zV4sRal/xfynvuFfk
         LJ4aHFo/FrNPJklrpDYuYF/S+UX3ZfDNYiK+UBGSGHUWhOMGqq4tBBpVTsg9ZYxQ7Q73
         VWB/T1VrTfFHiQxRKb/srBlXVEqYAumE/OKvhuQcKcyE9Tj9EUmCTy8Hr8dYbbBAZiWl
         cCZpaHeK8HrlCnKZfNj/R87QJjhoeL+WxW+bm5+qER8J2HNBUaHvfUcKwKhr7ISceREE
         1LNA==
X-Gm-Message-State: AOJu0YywsBVj4luWa3pp8pzRHNqOqKXez/w9cT0KpuB2/qHvs7IVWFiB
	LZlO8mCattiZDK6DKJMLbtgZMxdk2ak=
X-Google-Smtp-Source: AGHT+IEBMFewHAIuDAJzTT4LMbGkyLomfHkHyMKwLW10XRU7E6GimjDUo/iJbnCVSA+uf2mG/BMifw==
X-Received: by 2002:a05:6870:c10c:b0:1bb:8867:f7ed with SMTP id f12-20020a056870c10c00b001bb8867f7edmr348935oad.33.1692298474653;
        Thu, 17 Aug 2023 11:54:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::6897])
        by smtp.gmail.com with ESMTPSA id dz16-20020a056871b61000b001c03b08b821sm172399oac.36.2023.08.17.11.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 11:54:34 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: p.lobacz@welotec.com,
	Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][RFC] sstatesig: Add ACL and XATTR data to outhash
Date: Thu, 17 Aug 2023 12:54:31 -0600
Message-Id: <20230817185431.1562460-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 18:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186333

Records the ACL and (some) extended attributes in the outhash

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
NOTE: This requires ACL and XATTR support from bitbake


 meta/lib/oe/sstatesig.py | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 633a0fd4502..a2b4e742b3b 100644
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
@@ -640,6 +642,38 @@ def OEOuthashBasic(path, sigfile, task, d):
 
                 update_hash("\n")
 
+                def add_acl(path, typ, name):
+                    acl = bb.acl.ACL.from_path(path, typ)
+                    entries = list(acl.entries())
+                    if entries:
+                        update_hash(name)
+                        update_hash(":\n")
+                        entries.sort(key=lambda x: (x.tag, x.qualifier, x.mode))
+                        for e in entries:
+                            update_hash(str(e))
+                            update_hash("\n")
+
+                def filter_xattr(k):
+                    if k == "system.posix_acl_access":
+                        return False
+                    if k == "system.posix_acl_default":
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


