Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94879C001DE
	for <webhook@archiver.kernel.org>; Sat,  8 Jul 2023 15:56:17 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.339.1688831777154311496
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Jul 2023 08:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LMmg+K99;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-668711086f4so1972244b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 08:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688831776; x=1691423776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huVsUK7vqal4auyaNIRRiLjJBgffI4fLBfXY1acwRuQ=;
        b=LMmg+K99vhe/o4dLkmqsR5QDNswW65Kj6rHzbmBnIskkf6zcQ5+9Idp1IRM2o+nPdu
         blTniNt3gSshCr4sHg73ATlsxuat+c9PUBNotjrSTSOa6jWYkOBhUwXGiffZbQCrXg91
         Y/2VfBO0z4U/MbF1OoaUvqyea1u3VmUddFS3C9X92yNoymmmTUHNjI7A5nc2ko9/QXYr
         4xshD8wiTot5VmTNUC0NqTTui2LM6QlT09xHlg5Zr6K3qj+Ftmsl9G1J2xzVV0QebN+Z
         qzsxqOku4ApIs2IzICJNSVLQUtfVwd17A2Uc0n5EtxZGSoU9nMX18OKjk4+9VKnVRss6
         YyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688831776; x=1691423776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huVsUK7vqal4auyaNIRRiLjJBgffI4fLBfXY1acwRuQ=;
        b=AgjlEQtiw9LHSKgAoxgF95DG62s9b9BR6mFn6pxHvE7I6+ekHza6bH537Y+Wkpwchi
         GGc/cVvZ1pIpY0sOLKT/0yA46k/ZIZKXadOXYpQQT4O7pA3KYgN+gu8tQqTG4vDI/WYf
         gMKgfGY7C6y+GdUfFG2YjKyGRY5/DmVFKKkg/YQz+y3bCIixy/KkEmyr6CYz7uMfbdxk
         K/GRdv/1g2Y1bDq9P4JPxzkXgWl4zhL8PJoEaEU0QanpfHY6HkT/DjXWw5D5J0BHgsta
         mm/Z4tABj68rC1SujYPRY6Ff0WJ1FylUX/KyyUC6LpIQ+nRdTTM28ub50fsZ1ZG3/SKd
         N4iA==
X-Gm-Message-State: ABy/qLYxZ2kppICcy/NPW4b9Wzo3eYg40zU1IE4+fxbzliXy5p+snYEv
	o8m+K+qIwtJjxBFYL7K+5eooy8B6WFXNOtOS4Wc=
X-Google-Smtp-Source: APBJJlERBNWU/oHFp4tcTSIh4xFlL8ZOcSZFlszeRc5++Feo7Garbsde1SGWdU1v1X3IB1qxFnvpAw==
X-Received: by 2002:a17:90a:8c01:b0:25c:18ad:6b82 with SMTP id a1-20020a17090a8c0100b0025c18ad6b82mr12428448pjo.21.1688831776310;
        Sat, 08 Jul 2023 08:56:16 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u14-20020a17090a410e00b00263f6687690sm3257801pjf.18.2023.07.08.08.56.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 08:56:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/17] oeqa/selftest/cases/devtool.py: skip all tests require folder a git repo
Date: Sat,  8 Jul 2023 05:55:43 -1000
Message-Id: <5f3128e3a85e3a5d67d5dc1f2585fe6c236e443c.1688831566.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688831566.git.steve@sakoman.com>
References: <cover.1688831566.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Jul 2023 15:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184029

From: Thomas Roos <throos@amazon.de>

Devtool selftests require poky dir a git repo, when downloading poky as a tar,
this is not the case. Those tests will now skipped.

[YOCTO #12389]

Signed-off-by: Thomas Roos <throos@amazon.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 95a5bc130dc51ea9de95c64dbf0e9c7892415d50)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5febdde28e..9efe342a0d 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -8,6 +8,7 @@ import shutil
 import tempfile
 import glob
 import fnmatch
+import unittest
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
@@ -38,6 +39,13 @@ def setUpModule():
             canonical_layerpath = os.path.realpath(canonical_layerpath) + '/'
             edited_layers.append(layerpath)
             oldmetapath = os.path.realpath(layerpath)
+
+            # when downloading poky from tar.gz some tests will be skipped (BUG 12389)
+            try:
+                runCmd('git rev-parse --is-inside-work-tree', cwd=canonical_layerpath)
+            except:
+                raise unittest.SkipTest("devtool tests require folder to be a git repo")
+
             result = runCmd('git rev-parse --show-toplevel', cwd=canonical_layerpath)
             oldreporoot = result.output.rstrip()
             newmetapath = os.path.join(corecopydir, os.path.relpath(oldmetapath, oldreporoot))
-- 
2.34.1


