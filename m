Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB2CC77B71
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 16:02:36 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.162538.1680796952152204316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 09:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FSUYtDse;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id h31so24028149pgl.6
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796951; x=1683388951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzOWUjymoYwBMvV1hYYCCzNX1ONc56VVcUQNegh0erw=;
        b=FSUYtDseY3MPpkEg40K8XV9c14GLJT6SSuQso7bug9CdQbw1HQwLOxfK5vwsXcETwd
         6cusRuQRs7H68jYboMIbTQJLKAjzdCMHGDWf2LxivkEM1N9uP+xAJ6HoF4pDdl6KAO2h
         4YhdYPaW5tMREOhM9aMq6hnJ2TntLeLcl11UnyAhgq0lsQmZUopasOcjhTW2htRzFdCZ
         9kmQQkV3bUPQT3zPziKs5DF0J5ed30n8vZ8NKMYxWtF5X0KaSrpX7TR6evPQ6AdGWVRZ
         99cBnZVNBKglC+z53Ro92voD0jb1Sgn6B1urHcUJXklTWChrFN9DP+mAY69OhKD/96my
         f3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796951; x=1683388951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzOWUjymoYwBMvV1hYYCCzNX1ONc56VVcUQNegh0erw=;
        b=s2y2tQ5J4n8dUVME1KTnEF/WBV+tk1p61qTRgmFvfvPB6iiN8d6JWSls9I087L0GPR
         V3n1ydKHdY1E9vTjiqo4eYympvEqUKt9DiA5ZiTsS9ho3oQKHJZJWHBRfSqQmACPp/Jb
         n33yH9hHR7J+WYjKQoAgJjqTAc5imA6cw2t0oNXeqpdtHxmtZgceO/ySPWHJGsMoa41B
         oun57cIDKOQDNhQFICj4+9x1ftEZ5shxFY0evp0E3UKQSKmWaMoZRLtIREQlrISJ2gax
         SiiQDrqSBjQmgt+Qblf8POg+qDXVWvzWN4MI1G+iT5Vd2quSNY9B24wO7eqkXmboa7Sb
         q4zQ==
X-Gm-Message-State: AAQBX9dfOT75NuVkMKDJX75iVkafOXUjI3KLVhLCOGbKmnlKXl/XC5Kl
	YKV9Tr4TkNJWYM6MddNU5dNYyqw3HK/peW6ph4A=
X-Google-Smtp-Source: AKy350aOYYrA9/b1Wo7y3nadLUsjMDuBxXOcZ7yXeolaQTOyuWJmx1itC5eg6PpEq87HNR0se1kULQ==
X-Received: by 2002:aa7:988a:0:b0:628:642:c533 with SMTP id r10-20020aa7988a000000b006280642c533mr9131100pfl.31.1680796951076;
        Thu, 06 Apr 2023 09:02:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id b13-20020aa7870d000000b0062e26487e7esm1532588pfo.155.2023.04.06.09.02.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 09:02:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/26] oeqa/selftest: OESelftestTestContext: convert relative to full path when newbuilddir is provided
Date: Thu,  6 Apr 2023 06:01:34 -1000
Message-Id: <41f169ea23078cc8f4a6b6fc6b59230f05cb758b.1680796770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680796770.git.steve@sakoman.com>
References: <cover.1680796770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 16:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179785

From: Jose Quaresma <quaresma.jose@gmail.com>

Relative paths in BBLAYERS only works when the new build dir are on the same
ascending directory node:
 .
 ├── build
 ├── build-st

It works because they share the same ascending relative directory node.

So use the full path when the argument newbuilddir is provided
to make the oe-selftest work everywere regardless of the location chosen.

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2e022c1977bc1006c00a87e08a2dca5b69db4801)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/context.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 0d26a07438..0e3244a1c5 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -91,6 +91,16 @@ class OESelftestTestContext(OETestContext):
         # Tried to used bitbake-layers add/remove but it requires recipe parsing and hence is too slow
         subprocess.check_output("sed %s/conf/bblayers.conf -i -e 's#%s#%s#g'" % (newbuilddir, selftestdir, newselftestdir), cwd=newbuilddir, shell=True)
 
+        # Relative paths in BBLAYERS only works when the new build dir share the same ascending node
+        if self.newbuilddir:
+            bblayers = subprocess.check_output("bitbake-getvar --value BBLAYERS | tail -1", cwd=builddir, shell=True, text=True)
+            if '..' in bblayers:
+                bblayers_abspath = [os.path.abspath(path) for path in bblayers.split()]
+                with open("%s/conf/bblayers.conf" % newbuilddir, "a") as f:
+                    newbblayers = "# new bblayers to be used by selftest in the new build dir '%s'\n" % newbuilddir
+                    newbblayers += 'BBLAYERS = "%s"\n' % ' '.join(bblayers_abspath)
+                    f.write(newbblayers)
+
         for e in os.environ:
             if builddir + "/" in os.environ[e]:
                 os.environ[e] = os.environ[e].replace(builddir + "/", newbuilddir + "/")
-- 
2.34.1


