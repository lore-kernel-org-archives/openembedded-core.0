Return-Path: <fabien.mahot@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A50C7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 08:44:52 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.54254.1686559490173679639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 01:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20221208.gappssmtp.com header.s=20221208 header.b=hJJ0PCF8;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: fabien.mahot@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-30ae141785bso3777929f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 01:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1686559488; x=1689151488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x1UjZAk1RL9twauvPneDy2S53FUELcimlZ3hav4y96I=;
        b=hJJ0PCF81jNhK1PVLDOuCcE1FjaNbfkDD/U30sMZdLBhKO/zBIZO6HZJE/dbHEdjQw
         IgkMfQUm274Cf1l/dhXXRiGjeC+HboRohuBUS8aHAGGC1b0CgFbV+7V8s1gjLn4s03nZ
         iCL/DTW06pLIskhpWDPFgLNavZEAGR1Is20CcKjWZNQHS/G229qEendiVtTgYTSp3ljq
         piRpP7FDBPTw6e4TDj9WDD1WLgddgH3imd2by3MrLS0JtsN7SyqiZZb5wQqNOSH0zOHv
         UlyCEhPWLMlana6NTTaofENIk8bVooDQRIvFyS1Y0AwNK9WYKvaO+chg6Di/V/8ZmyLr
         N+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686559488; x=1689151488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1UjZAk1RL9twauvPneDy2S53FUELcimlZ3hav4y96I=;
        b=LjfGIpp3VSDA29mnhMvP6Xt2OmBkobg0+akfos9CcOkSeEQ28WeGoUnytig+joOKdS
         Fgqe6X0/U+iiBlel1uoT9oe9+DiJNq2Ii67BrPeQ0pCz0NLahuCFHYAJoYV4H8o6DDhG
         mQ+6QQJ/bFr6pO+ODAZ88EsNv0lKsuFWnH6VR+HqT2CgWQXo2Pi6rwH9Y0xi1aYnnarz
         Of8DG6XLy0BnDVmnY79fGLv15ORpZ+jXoDIpQQrtlLqL7gWYZ3cfN2CBQWmCnr4X8kOu
         mrU2rJqDJyGbRaJK3X9I4xOTnaojMo5L1Ful+s1okgIEpwnsTxR62cza2U8ZcEBRJis7
         pBIg==
X-Gm-Message-State: AC+VfDx1NPRTyBbjxkt4wDoDmFDVLQcu+4HU4iNDa/CzR9RRFG17RBPi
	4EyqkSDc3D20Kdqon6lzb6y7ikOAK4BuFYXI+B0=
X-Google-Smtp-Source: ACHHUZ5DJdtorxnFE6Mg9S62ZQUWJWfcc/lzeArEK198VwF3snCITSyt+khgk7bCMwcfwE9FQp9zFw==
X-Received: by 2002:a5d:614b:0:b0:30d:f75c:4a68 with SMTP id y11-20020a5d614b000000b0030df75c4a68mr3935041wrt.34.1686559488150;
        Mon, 12 Jun 2023 01:44:48 -0700 (PDT)
Received: from P-NAN-AMETHYSTE.nantes.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id e4-20020adfdbc4000000b0030ada01ca78sm11745344wrj.10.2023.06.12.01.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 01:44:47 -0700 (PDT)
From: Fabien Mahot <fabien.mahot@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Fabien Mahot <fabien.mahot@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] oeqa/selftest/bbtests: add unexisting prefile/postfile tests
Date: Mon, 12 Jun 2023 10:44:23 +0200
Message-Id: <20230612084423.13122-1-fabien.mahot@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 08:44:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182656

Fixes [YOCTO #10725]

Signed-off-by: Fabien Mahot <fabien.mahot@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 1dd2839c8d..7ca1c306bb 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -188,6 +188,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertTrue(find, "No version returned for searched recipe. bitbake output: %s" % result.output)
 
     def test_prefile(self):
+        # Test when the prefile does not exist
+        result = runCmd('bitbake -r conf/prefile.conf', ignore_status=True)
+        self.assertEqual(1, result.status, "bitbake with unexisting prefile didn't run as expected:: %s" % result.output)
+        # Test when the prefile exists
         preconf = os.path.join(self.builddir, 'conf/prefile.conf')
         self.track_for_cleanup(preconf)
         ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
@@ -198,6 +202,10 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.assertIn('localconf', result.output)
 
     def test_postfile(self):
+        # Test when the postfile does not exist
+        result = runCmd('bitbake -R conf/postfile.conf', ignore_status=True)
+        self.assertEqual(1, result.status, "bitbake with unexisting postfile didn't run as expected: %s" % result.output)
+        # Test when the postfile exists
         postconf = os.path.join(self.builddir, 'conf/postfile.conf')
         self.track_for_cleanup(postconf)
         ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
-- 
2.34.1


