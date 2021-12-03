Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F15C433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:22:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.15317.1638555721638349485
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SuAW1962;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so5684224pjj.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KUvcxIFtP8tBswF2ovTT5pkwiyTI8wrFJlrWTpUhAHY=;
        b=SuAW1962U7YX2J6olcIE+QWJBEeZZ7hmjqEMsviN5M38xVl18l8lntSzGLTGi8ln3E
         OX+EmSblOSmjY1jf9a8gupDvTkht0X5MjtSV1dHJFxj1un8cdBFmn3VR9BaP76ic4QAg
         3OHy7t85mPVJCdz8a0r2p2GdSW2GdSU/5zN0tNU0VpXBF2rM00TViImRFTZS2D7kXKc8
         DjpokYBUCxs4MlH3IDhVa6QQM+KnDFuecC9FQq7zo7VBkXqk/BPg7jUkZ6Uk0E3XurCM
         JSK5n/IIYYq0XWLMkoA5i8ADK2SDrTLtobTt9qRs8MvO6m/dZVqPD/bgzJr8R0/sRY8k
         /PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KUvcxIFtP8tBswF2ovTT5pkwiyTI8wrFJlrWTpUhAHY=;
        b=Zi5n3xH14t8JgkO6H807EZYqH9cAVXqUKl3fcVi96160XnVWEv4DjKjR9d0sG9Ek2C
         yKt+Cu0aklY02qTLrs4DbFCrmQZfCoUX9OJajkBpuwcxQa/+aNfCMsTSHLSsmEEsCdN9
         4tDX0io0F8D1y/w6T3Py+j1ocxc5YYFDEywWjXMhGJ750SlcjaMRz/0Bu7tbotYHCdO6
         BZ+jtNBmHrF1qmVRx4+r+S89F1/uG3iXrTRsBLdrsl23GoV0i+NlJFeNI5J2q3RXLONF
         QfvSf9Pmi1k3Jp2aTBo4UFoCBdin6+CcjZIeCd7Deeken6oi8hYGCQAYy2qQwOZYkfM2
         f7XA==
X-Gm-Message-State: AOAM532JXWK8LI8tXxfnTkqikFOP/HJhgOK8EKHVLN1l9BzH6wZjGHBE
	tHO9KNV1ZjrXfBi2xMxbZsYGTWRoCdDxEtrGmbU=
X-Google-Smtp-Source: 
 ABdhPJy7pfgPfPsV7rDlM0fftsBye75w8yA/YuGzHJ8wcr5w4VlQ8p3WM+LETHvnXJEi5zIk2sUe4w==
X-Received: by 2002:a17:90b:1650:: with SMTP id
 il16mr16229060pjb.83.1638555720701;
        Fri, 03 Dec 2021 10:22:00 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:22:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/18] buildhistory: Fix srcrevs output
Date: Fri,  3 Dec 2021 08:19:01 -1000
Message-Id: 
 <7f959f53675c1d943a76e466b63f32aaec34c9c8.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:22:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159141

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The code was assuming that the a recipe with only one srcrev wouldn't "name"
it. This isn't the case as the glibc or bzip2 recipes show, you can have
a single srcrev which is named.

We can pull the data from the fetcher and in fact we already have it, we just
need to handle the "default" case and make that code the default for all srcrev
regardless of length.

[YOCTO #14017]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 45ae567932ba52b758eb41754453e9828d9533a1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/buildhistory.bbclass | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 44a66df962..2746996cbb 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -953,23 +953,19 @@ def write_latest_srcrev(d, pkghistdir):
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
2.25.1


