Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.61420.1600092755111197588
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Jx6fYuIR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d6so12742318pfn.9
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=hZvfo/flBOaGQjLnNC0H7vR9JE91AloNo6/ENuXK/fc=;
        b=Jx6fYuIRuy7I2LZk5O7/33k8bh5A/JDIlgeP/jmtTBaQAI6VlWKYudJEUYW6rcby9K
         X9DmhxDpBUrbC1FtUFAh/nSWoJkmXXbG8IIZycVUBd4oyWZlQ0J8+z532F/p7Wt8GUnH
         uGxV4jbKtZutE4dt1KOKLVCY45CcAFE8t2bbJIXDwEJihAZzFu2R22fuyjxWIOF8lzfw
         qiDr2xNv6wc3TFb5UuGXEB6uMtaMaeCgm8PpBLOqWjnfTrf6ZpqnET3F2q4KSS+P+dW1
         u0B5Zd5L1sgShn4FhOpXGVFVvJfw6mhF93W1byNbMIt+bDc63T3Gm+bwACSrcNXV4U/t
         AtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=hZvfo/flBOaGQjLnNC0H7vR9JE91AloNo6/ENuXK/fc=;
        b=bqwUvxh/Nui/gzFNb7ZwJe8adQE+K0V7V0EOH2K71+JqayoNG4RKiadWMMMgPzUvlI
         ebXwgG0FBDJHSgXP+z9vC+PE5Z44HVgP+Nqz9YuGodtaZlpcrK0eKAUDWloCBHeObgd3
         9B+8/3nmeaw8kUACWNlavChwr8/wzMEPDWV2QaslwloCZMnSObA/pUnPJfe9NPT2FYQ1
         uhBzQfpmwox5WGdG3iVc3DyA18heU8MOkfnBfFGvd3mZHsqy8jCiAw2iYI6zt1U8riP2
         9kGXvCfB6J8miVdajxzWkDA239YIMtsrjDK3hX/u5Y2cuC1+bjOybzvIHjymoUKYct/O
         q0Hw==
X-Gm-Message-State: AOAM532fEMu0VTCFvFrRWKbxVmn+kBJeYNR8i1DNAughXvea6wZYGO0A
	nEipBZXBJD3j+IjTOpP2bCnbEvlKSzEDAQULnkE=
X-Google-Smtp-Source: ABdhPJyLfbM8BRwf2tUy6IThOAFZStBj51OmDZu798IIwkIkq6edMNIxDBQxpB4fQ2qAJxoljJ4+tQ==
X-Received: by 2002:a05:6a00:2b1:: with SMTP id q17mr13370217pfs.74.1600092754209;
        Mon, 14 Sep 2020 07:12:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/24] selftest/signing: Ensure build path relocation is safe
Date: Mon, 14 Sep 2020 04:11:31 -1000
Message-Id: <afad476cd368e06cfff61eb43da27b54779b839f.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Similarly to 04ee0e8b95cd8ed890374e0007f976684206b630, ensure only full
build paths are replaced in the environment to avoid breaking buildtools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fcd0a9683af1a9155eabbd9056e3b46d4a931b2e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/signing.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 202d54994b..a28c7eb19a 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -44,7 +44,9 @@ class Signing(OESelftestTestCase):
         origenv = os.environ.copy()
 
         for e in os.environ:
-            if builddir in os.environ[e]:
+            if builddir + "/" in os.environ[e]:
+                os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
+            if os.environ[e].endswith(builddir):
                 os.environ[e] = os.environ[e].replace(builddir, newbuilddir)
 
         os.chdir(newbuilddir)
-- 
2.17.1

