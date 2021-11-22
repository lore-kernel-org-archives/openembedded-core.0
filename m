Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75C5C433FE
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:37:50 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.8058.1637595469594444788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PMIcqS7d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id b12so33474787wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CQNCl0S3ETfsWrDkVCmorkyEQPLgtjHOaH7JFc0MYNA=;
        b=PMIcqS7dcyMPD1KxohqaY1jHdI2+C/ez2fcfZpVjXVgo3P0TWZiUlp+AO9aZUlWM/M
         FNIbrVnQacjrZIwBmImg36Hng++yNVyZTwDEjgnA42k77bhn46xWS1pIrK0Cvt8TnOeP
         n8xqYry53FvydDgz0ER0GgJCl/p3zuthAVBLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQNCl0S3ETfsWrDkVCmorkyEQPLgtjHOaH7JFc0MYNA=;
        b=LJF3OiJmyCXqk2I0wlNhAdpZ3v6z03TeRJ8hRm7r1ffjQ8yxLErXF98Rg5Y7qP1xG7
         8oaC+dbdYNEBna6v91tL3pfsZl4cwuOEJ4YfXtIZoGZnKyop42V4PwgZAaQFGSWVS/kk
         nC6e83hZIJ6j4LSc6aSNaRdn+JAOEbMB9TaeyqOEX6EqyuZyb+6J+Vv4/J914AdH47MR
         UekQq8wfrvvpG7YzC8E/JYEYjG0CPkRlm25qlSNPOnGzxfxdzfianD8ev8rVtG0yeXLw
         mfEBAt3WY3w1Df1Z+FnPQP6K6D40Nfw4MEc/0mUc2eWj6EvDiUuJAtYsYAhscntCQFUw
         VGsQ==
X-Gm-Message-State: AOAM531lQv/10p13iw1OIl/iFRC4+WQ8tLeOOeq8GaYOrUaRfce41Q/4
	y75tnrx+vrWXq8qBrTkuwv6YzDIQuZ4R6Q==
X-Google-Smtp-Source: 
 ABdhPJyOSJz670tDDTyQcK3ZxANr84ygbhUvQd08jaOt9i2jdKV8rmLqbd1ZJCFrKrb9wKiEmgC1Yg==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr38198094wru.239.1637595467632;
        Mon, 22 Nov 2021 07:37:47 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e31:269d:c208:4e1f])
        by smtp.gmail.com with ESMTPSA id
 k8sm9040596wrn.91.2021.11.22.07.37.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 07:37:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] buildhistory: Fix srcrevs output
Date: Mon, 22 Nov 2021 15:37:45 +0000
Message-Id: <20211122153745.4183422-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211122153745.4183422-1-richard.purdie@linuxfoundation.org>
References: <20211122153745.4183422-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 15:37:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158580

The code was assuming that the a recipe with only one srcrev wouldn't "name"
it. This isn't the case as the glibc or bzip2 recipes show, you can have
a single srcrev which is named.

We can pull the data from the fetcher and in fact we already have it, we just
need to handle the "default" case and make that code the default for all srcrev
regardless of length.

[YOCTO #14017]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/buildhistory.bbclass | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e62b45ab7d2..a230a0c2a2e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -969,23 +969,19 @@ def write_latest_srcrev(d, pkghistdir):
                         value = value.replace('"', '').strip()
                         old_tag_srcrevs[key] = value
         with open(srcrevfile, 'w') as f:
-            orig_srcrev = d.getVar('SRCREV', False) or 'INVALID'
-            if orig_srcrev != 'INVALID':
-                f.write('# SRCREV = "%s"\n' % orig_srcrev)
-            if len(srcrevs) > 1:
-                for name, srcrev in sorted(srcrevs.items()):
-                    orig_srcrev = d.getVar('SRCREV_%s' % name, False)
-                    if orig_srcrev:
-                        f.write('# SRCREV_%s = "%s"\n' % (name, orig_srcrev))
-                    f.write('SRCREV_%s = "%s"\n' % (name, srcrev))
-            else:
-                f.write('SRCREV = "%s"\n' % next(iter(srcrevs.values())))
-            if len(tag_srcrevs) > 0:
-                for name, srcrev in sorted(tag_srcrevs.items()):
-                    f.write('# tag_%s = "%s"\n' % (name, srcrev))
-                    if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
-                        pkg = d.getVar('PN')
-                        bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name], srcrev))
+            for name, srcrev in sorted(srcrevs.items()):
+                suffix = "_" + name
+                if name == "default":
+                    suffix = ""
+                orig_srcrev = d.getVar('SRCREV%s' % suffix, False)
+                if orig_srcrev:
+                    f.write('# SRCREV%s = "%s"\n' % (suffix, orig_srcrev))
+                f.write('SRCREV%s = "%s"\n' % (suffix, srcrev))
+            for name, srcrev in sorted(tag_srcrevs.items()):
+                f.write('# tag_%s = "%s"\n' % (name, srcrev))
+                if name in old_tag_srcrevs and old_tag_srcrevs[name] != srcrev:
+                    pkg = d.getVar('PN')
+                    bb.warn("Revision for tag %s in package %s was changed since last build (from %s to %s)" % (name, pkg, old_tag_srcrevs[name], srcrev))
 
     else:
         if os.path.exists(srcrevfile):
-- 
2.32.0


