Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92274C369C2
	for <webhook@archiver.kernel.org>; Sun, 20 Apr 2025 09:01:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5713.1745139703189032676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 02:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BieraEQf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so27377035e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 02:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745139701; x=1745744501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QtM+P1r29JMSSFHnXXRNb5VthT/6h9EGYP787VimlYg=;
        b=BieraEQf6Orc5dRhLbjWJ96o9YQyBWUfq4fuZR6Fb545qOqEBfeEd5O5d6cdBk0lc0
         7z01qk/HLQttf5ubq1Cjp4hdfoakt7C7aKQO2aglPViwjEg8mYdlancyK5h7qXUgpG9J
         ZJp3rLFZAhXOjMVkysFyQKKwcR+YLWw9bx1pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745139701; x=1745744501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtM+P1r29JMSSFHnXXRNb5VthT/6h9EGYP787VimlYg=;
        b=TzGk9H4CF5ih9hN+W/95oYdrgGYg/nAGe1oSbYe0s2yPqjUhSirX1vvXSpVDY3qMA3
         T/Qhe3goYWIUJ6aW20nsEFzlQE4kUpWOApMQWrDH6cxB4GgD+ElyfGdnPMMs9yghD0y4
         1fQYDdRdcx2g3x3nw0C/ZsnXoW9LNxBgpa/02LxUxYe+OQiP2RGrDjbsw401JSggsLwK
         bvaeDyXcCDR0SgE4L0S3Fqehgy/3SrCTsqLQ6BPh4Erd2VB7Cyym/KhBr6MekubBDmfr
         xvBtzh8cdvboWlrYX3GKfdAlSZgvN2h9vQx5uqY6Q1qeJtd4VnEJpt2Um3Yk321XSgMw
         o8hw==
X-Gm-Message-State: AOJu0Yx7cnEHlr2CaOPtMt25IeGfIqIJ8sI8RdXfVqjZqd0ovm4oFUu2
	zn9y8xoSyzBSop85lS4tlljUIW8x6B4wfoq+8ZvR3KObSgCAKv9j3lZLLHiLQ4J7kJ2tmVXlSgK
	i
X-Gm-Gg: ASbGncuNiQQ+W/i58nZeRaNsgn4OUR6hLUWFz29AN71ZUV13dZtBDHyxyKu7pbyuNPD
	c1ignwt0pWFHEgcyPUKjothvn5HGShHJOmo764TuofNq5frm6AnPmjEHzeiOB4JodFQqT7xsn0i
	T0VM78yHUb26Q2LujiLMKAfFGuvwtHd1yeBjCgQUMNnzqMOEtOEYFqw8KwJWsAXvYP5fh5P1CXA
	Er+tMHSOSnteo81IfS3ujDXF8tFJ2As5CdzFM5zkFS7NpYcg85fYs8rACUjXBf0won8a/nOHUem
	e9p2HsKnWyhu6v/MLy89CNVnJ6ysj4w99KBnJlTsytYZHhI4DzKY/BblGeNfbH8srRzUFw==
X-Google-Smtp-Source: AGHT+IEmQQCxbrbDnwRvQAM+mpE91roHdQPBCaDXNGxcbizSAtGuysdksL0tqpz1J+l6hFZbzxl0cA==
X-Received: by 2002:a05:600c:1d03:b0:43d:fa:1f9a with SMTP id 5b1f17b1804b1-4406ac6562fmr80047145e9.30.1745139701029;
        Sun, 20 Apr 2025 02:01:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7d83:c080:c463:70fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5cf2easm91019815e9.31.2025.04.20.02.01.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 02:01:40 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/fetch: Fix whitespace
Date: Sun, 20 Apr 2025 10:01:38 +0100
Message-ID: <20250420090138.2705317-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Apr 2025 09:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215152

Update the test whitespace to avoid bitbake warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/fetch.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/fetch.py b/meta/lib/oeqa/selftest/cases/fetch.py
index 44099176fc5..1beef5cfedb 100644
--- a/meta/lib/oeqa/selftest/cases/fetch.py
+++ b/meta/lib/oeqa/selftest/cases/fetch.py
@@ -74,8 +74,8 @@ class Dependencies(OESelftestTestCase):
             tinfoil.prepare(config_only=False, quiet=2)
 
             r = """
-            LICENSE="CLOSED"
-            SRC_URI="http://example.com/tarball.zip"
+            LICENSE = "CLOSED"
+            SRC_URI = "http://example.com/tarball.zip"
             """
             f = self.write_recipe(textwrap.dedent(r), tempdir)
             d = tinfoil.parse_recipe_file(f)
@@ -84,8 +84,8 @@ class Dependencies(OESelftestTestCase):
 
             # Verify that the downloadfilename overrides the URI
             r = """
-            LICENSE="CLOSED"
-            SRC_URI="https://example.com/tarball;downloadfilename=something.zip"
+            LICENSE = "CLOSED"
+            SRC_URI = "https://example.com/tarball;downloadfilename=something.zip"
             """
             f = self.write_recipe(textwrap.dedent(r), tempdir)
             d = tinfoil.parse_recipe_file(f)
@@ -93,8 +93,8 @@ class Dependencies(OESelftestTestCase):
             self.assertIn("unzip-native", d.getVarFlag("do_unpack", "depends") or "")
 
             r = """
-            LICENSE="CLOSED"
-            SRC_URI="ftp://example.com/tarball.lz"
+            LICENSE = "CLOSED"
+            SRC_URI = "ftp://example.com/tarball.lz"
             """
             f = self.write_recipe(textwrap.dedent(r), tempdir)
             d = tinfoil.parse_recipe_file(f)
@@ -102,8 +102,8 @@ class Dependencies(OESelftestTestCase):
             self.assertIn("lzip-native", d.getVarFlag("do_unpack", "depends"))
 
             r = """
-            LICENSE="CLOSED"
-            SRC_URI="git://example.com/repo;branch=master;rev=ffffffffffffffffffffffffffffffffffffffff"
+            LICENSE = "CLOSED"
+            SRC_URI = "git://example.com/repo;branch=master;rev=ffffffffffffffffffffffffffffffffffffffff"
             """
             f = self.write_recipe(textwrap.dedent(r), tempdir)
             d = tinfoil.parse_recipe_file(f)

