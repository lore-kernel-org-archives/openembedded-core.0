Return-Path: <fabien.mahot@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745CDEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 15:48:46 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.16262.1686757725381555732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 08:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=v16NbfmT;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: fabien.mahot@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f8c5d0b19dso9285705e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686757723; x=1689349723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4WIKtoEOGG57vueWWZk2G5T7hfxpO+uUIMwabLf+3O4=;
        b=v16NbfmTuYQJuHAY9EW8t1owU+d4ibhx27EmhRkM+6dsGwtT8tET9vZerzn1bKumWK
         38h8Q/I/NdG045rM1NIqIji0zgVxr4MrCT0kVyORQwvw2JKUUr/IsIvueGGybufrjHLh
         BnEB8ksbu23rkUrZcyv8Tqp0T0e4QZEWic2dmh/FJi7C+rhzZUkhhLpNAzxmvTp/Q3qY
         v8AKTFBS/mbmIxHjxtk+d6H05MffZi5FKYPtkeX8Zv6n3bYQu5z+5YBjB0hWjDgwNcbJ
         jtRZyV8hYQF767IBwXuW6rhxkdsLTEWYx0Z961EOszqwxnCJ8G7rBoQKPrdzp5CYXwcQ
         SY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686757723; x=1689349723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WIKtoEOGG57vueWWZk2G5T7hfxpO+uUIMwabLf+3O4=;
        b=SJvLSCA/vJcc92BoUwqYfeyWzPqXLYF46ClQ9G/7YHXK2ShbBvSd6aZC8eNrQeCBnW
         e3H24m9ZSmiVuFRNhqO9L+LNUIQJq+k9ETcQ9Q1D1r5ZK9aOOfJCpqViDHXyNxrG7Wu9
         mDGor9qyMMmQ4tdacgbmNMWzvpVQYW+BzeWr7IXVhLS8qZWQnzD1kpc3Yh1pQMOr3LLz
         Nu3T9ejS/GvIgs5oQtyf4HQ+zAJD3mbg1eokg+RGQ9lBQ4+/uSUp0sxf9xxZ/pi0rMEc
         QLR2nAkio/je6/iHHWNQqZurnvLWnmXzyhdj/vkQVelDuMVvak0HD+emKNNMgtaef8DH
         PFWA==
X-Gm-Message-State: AC+VfDxmbtr2lOEJkeWlEmvB17eNRcRk6OrFZFmFyPa3KYnTrdkco7Ot
	M2uwfk6sVP6I1G3yeQTOfBy1XeLv9DtCCvMNEiG++w==
X-Google-Smtp-Source: ACHHUZ6JXJUT32ZPrgZnLnYOnCXaODkYll5ZpHOOUSJt0BTfSy5wUn8C2yiiVhIz5izF8MWxjWWDzQ==
X-Received: by 2002:a1c:4c13:0:b0:3f8:d710:6c1a with SMTP id z19-20020a1c4c13000000b003f8d7106c1amr3157513wmf.31.1686757723314;
        Wed, 14 Jun 2023 08:48:43 -0700 (PDT)
Received: from P-NAN-AMETHYSTE.nantes.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id z15-20020a7bc7cf000000b003f6129d2e30sm17942740wmk.1.2023.06.14.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 08:48:42 -0700 (PDT)
From: Fabien Mahot <fabien.mahot@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Fabien Mahot <fabien.mahot@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2] oeqa/selftest/bbtests: add non-existent prefile/postfile tests
Date: Wed, 14 Jun 2023 17:47:49 +0200
Message-Id: <20230614154749.62021-1-fabien.mahot@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 15:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182821

Fixes [YOCTO #10725]

Signed-off-by: Fabien Mahot <fabien.mahot@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
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


