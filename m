Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1701C433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:17 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.22090.1655667069809646601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QO0+V5QG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso5592880pjn.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=00utckH7LeyYPh9fj4Rlgq2rpH1HI3cAY/0xoGC0wh0=;
        b=QO0+V5QGoTGRfSyv3SGOj0UwIy0O8/1CZ+L3FIAQrnYJOGVGOJo/tbBFnwBSWi8Kof
         52oiAYFftmOU49+vGoZI274qRFw/JkiqwXt38FnHN6pZvGFsx63tXJMwaIsPOyVHJhrW
         dczouXEKRzHQ+mFIHqNlyyZafLrLL5UykBwDBL2gVBxIBSmjVIziD+abn5vqCz3J6dE9
         1foC3yeFq77Qp16NIw8R5T/n5hsNZM/8Xxz2Ggp01lKbEaXiQusYC5HNTlNfm83FP7m2
         8tDnG3XKQMeogMjXbancsrKFYnv+EDcFBeULozAe6/dkregGo1ySgniQZH1O/o0Fakbo
         B1tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=00utckH7LeyYPh9fj4Rlgq2rpH1HI3cAY/0xoGC0wh0=;
        b=Z7SkAZ3glXEqsu/2oKmA/akXnAumcoWwcGLrlANTlNT7gzKv8NrJKDkJ3LyBHy0QNz
         iidQ01ReOdlO8TYi6aIJ2LJmtl9zOXnc0dqEzqX17ebmFhm76LMXZHM6a6kLfD1ktsZB
         xOtjmfUQYFEPHIb4+fFvV/JLLiHVuLK1Qax5qwkIrwb8AFMA/6lKA73uZ5uj5gIpdhVc
         jCS55AZCUA5CA98lJoIxGcuIj51t+YJe0scC46kTLiICxx+fCbbhQ9ONLH7B3NNHswTj
         m6s6RGdQvApTfRUsV344Sfy5/k86HrOHwPMV8w4zFn5E1m2WYeoGDuzR5wPsYPkFdW5w
         zOZg==
X-Gm-Message-State: AJIora8hiNYzzb7akVTNUb5zIMqVasefMgW8bxtXr2Knleon2ho7Gd2Q
	D8uhTxGG+MOtuGwRmca/X/ZLTCS+ePVP2JFD
X-Google-Smtp-Source: 
 AGRyM1s4GCdRc3jppuffeWruLg9tat2g+56mxpOqbGo2EpneLHi7Inz5W5sfVMvO/FdnelOpYSon2g==
X-Received: by 2002:a17:902:728d:b0:168:d0cf:2246 with SMTP id
 d13-20020a170902728d00b00168d0cf2246mr20252490pll.74.1655667068804;
        Sun, 19 Jun 2022 12:31:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/15] selftest/multiconfig: Test that
 multiconfigs in separate layers works
Date: Sun, 19 Jun 2022 09:30:38 -1000
Message-Id: 
 <e15044370169cb2b0cac99056d60ce648807912a.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167049

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We should test that mutliconfigs from a layer work, not just build/conf.
This adds such a test.

[YOCTO #13566]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2306261fb85d5d03145989c3af9c6897111644ae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta-selftest/conf/multiconfig/muslmc.conf  |  2 ++
 meta/lib/oeqa/selftest/cases/multiconfig.py | 13 +++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-selftest/conf/multiconfig/muslmc.conf

diff --git a/meta-selftest/conf/multiconfig/muslmc.conf b/meta-selftest/conf/multiconfig/muslmc.conf
new file mode 100644
index 0000000000..043cd1ccc3
--- /dev/null
+++ b/meta-selftest/conf/multiconfig/muslmc.conf
@@ -0,0 +1,2 @@
+TCLIBC = "musl"
+TMPDIR = "${TOPDIR}/tmp-mc-musl"
diff --git a/meta/lib/oeqa/selftest/cases/multiconfig.py b/meta/lib/oeqa/selftest/cases/multiconfig.py
index baae9b456f..83cbd1345d 100644
--- a/meta/lib/oeqa/selftest/cases/multiconfig.py
+++ b/meta/lib/oeqa/selftest/cases/multiconfig.py
@@ -70,3 +70,16 @@ TMPDIR = "${TOPDIR}/tmp-mc-tiny"
 
         result = bitbake('mc:test:multiconfig-test-parse -c showvar')
         self.assertIn('MCTESTVAR=test2', result.output.splitlines())
+
+    def test_multiconfig_inlayer(self):
+        """
+        Test that a multiconfig from meta-selftest works.
+        """
+
+        config = """
+BBMULTICONFIG = "muslmc"
+"""
+        self.write_config(config)
+
+        # Build a core-image-minimal, only dry run needed to check config is present
+        bitbake('mc:muslmc:bash -n')
-- 
2.25.1


