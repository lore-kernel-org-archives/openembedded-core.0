Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9A88EB64D9
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:44 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.3858.1688092182337221771
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=IAzeJovb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-666ecf9a0ceso872664b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092181; x=1690684181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n0u3MXXt3+TUNy6Y4ZxjxlO44L4VlxYCp7nzbnGfMKI=;
        b=IAzeJovbbPX3Dhb60E8tyl/kkHpbn4s6KGEVXTyZtsuEF2PcWZMHlK9LkEBaYKaoAu
         hkbsVe/CwRUpgASoh49gXEwAnG6k2WQ4ySgBJQKm52Ueoik82p0SunifTE7KqINzleh8
         W6ScB9elcDEqDDOKVgP90c2nkcU2gLy8OXMu4XhL5SlRHziMZnXvi2GdBt3ib+7dChty
         6wPJ5F3JAID59rRpoRQ9lypipkGaWsFrKs9OG4ion5sWd7UriEs7vdnVWo0ByZG7Bbt4
         nTNtuYu2PwjnNE8QzKCsjMgpucLQpvnuYhYCouZcIPTzkbt3yAqoUcmnn5jgPS/fsYtr
         p7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092181; x=1690684181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0u3MXXt3+TUNy6Y4ZxjxlO44L4VlxYCp7nzbnGfMKI=;
        b=QtOPfymCRbbI2nhbh9jMYMeE+qIUUo6OVpfgOePfYW6nBFfd55/wgYRTlTIuWja9s4
         35tOjj+dnICpvTZjS9uhKylrbYgrUANnNRjSyX6lcJxC7v5694KLvq1w4rZYH6Upc9IN
         lgcMIiCe4Jq+0VE62UVg/+fwPC/7BssWeFzrQUiIspYdYZ6L2qgb4pu1DkZ4W0BCY+wd
         4da+SPuGTRt9HVikNLVli5cmhlZBVg1iAX5P898vkJrnJlm8SCdKROeuXdkfcJ5btX7K
         D+XPcrMI0aJnTWNxET8grXVLiFzvbjjC1k2qL2qL48Fq044T4xKxfmGxTAxHKybAIC5p
         9VBg==
X-Gm-Message-State: ABy/qLbYLkJ0tMt3sS23IPJNZmRzpmuVIM4R47JXw9aBcNljP7A/I6vp
	SkoeVVJwyCzLlb++fn9u5otyY1ebcyKmNOqBVOLZHQ==
X-Google-Smtp-Source: APBJJlFOygGGE/Ui9jP0TocE1epQk1KFm0R9txn7XzJGZDm8iniWe5eeDoRqskTPuEGoRQFe8/31SA==
X-Received: by 2002:a05:6a00:14cc:b0:666:8403:9f4 with SMTP id w12-20020a056a0014cc00b00666840309f4mr2100143pfu.16.1688092181328;
        Thu, 29 Jun 2023 19:29:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/30] oeqa/selftest/bbtests: add non-existent prefile/postfile tests
Date: Thu, 29 Jun 2023 16:28:54 -1000
Message-Id: <47966f06f0c221b00d773f8e9db20190a80d668a.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688092011.git.steve@sakoman.com>
References: <cover.1688092011.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183658

From: Fabien Mahot <fabien.mahot@smile.fr>

Fixes [YOCTO #10725]

Signed-off-by: Fabien Mahot <fabien.mahot@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b0c33655fad5b2e7d96a45b6210527dfb766797b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 1dd2839c8d..31aa5680f0 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -188,6 +188,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertTrue(find, "No version returned for searched recipe. bitbake output: %s" % result.output)
 
     def test_prefile(self):
+        # Test when the prefile does not exist
+        result = runCmd('bitbake -r conf/prefile.conf', ignore_status=True)
+        self.assertEqual(1, result.status, "bitbake didn't error and should have when a specified prefile didn't exist: %s" % result.output)
+        # Test when the prefile exists
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
         ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
@@ -198,6 +202,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertIn('localconf', result.output)
 
     def test_postfile(self):
+        # Test when the postfile does not exist
+        result = runCmd('bitbake -R conf/postfile.conf', ignore_status=True)
+        self.assertEqual(1, result.status, "bitbake didn't error and should have when a specified postfile didn't exist: %s" % result.output)
+        # Test when the postfile exists
         postconf = os.path.join(self.builddir, 'conf/postfile.conf')
         self.track_for_cleanup(postconf)
         ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
-- 
2.34.1


