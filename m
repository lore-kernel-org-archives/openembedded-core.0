Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF142C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:52 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.53267.1638136792509230514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=O8l04wVI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id b11so10467147pld.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XCdlWsvs7WLRxrx8xBtw2gz3g6Szxn7z9Sm4tvIUvrw=;
        b=O8l04wVIY9FCqWr7Y+152V80a19x0+c/zJoAeH0EnBBYtp6HxA8Vz82qmUP11s9Tea
         NecDkqX/U64zDoIuVeGe7udFNMwF2AAN9j4nvzTJ7Pa4+gxmRIAO0oKfr6/M3BARs542
         Kd/l5W3otO4wE+ThuqGRjZyzspqUXnBbJsw8WMSwP9UZ+8z1zRQ/QCkh/TXAn2Yr4h90
         OVE99tevCtgnlH0jws2ce33lm/uSGL/7lqRymItyPPPNAoIWN/lmqsF0Gvdq78WIl9pf
         F6lryww5FOPgWKp+Bpoh/8ndmoFr6webAM/DTOCdakwl+1T4vInG3U7O/wBCHCRWl6+V
         4HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XCdlWsvs7WLRxrx8xBtw2gz3g6Szxn7z9Sm4tvIUvrw=;
        b=s5eOgngLgWu2WG83cBCDshm4rmmv2tJbJY46jhwpnSoEmKqOfdQJKqsrAgo9HIT5Rc
         biC4AYrvqsYm6i+DVWMtCL+kk1TH6/g6WMp5YGUAL0Sb0bJeguO3y/QVpNZZ9u+uPOfb
         eEZn83DfhyG0uIwSgB03GBrsmPvU3MJ3k/cmCP8OpbQp+BfDzEcxAZo1xdFU/ip9UbY7
         02zHlP9R8p1SqoX002mQOKvv4lFIt98xvZ31AwObAqK6q/q3isEMbUctQDVlnvSx2eMI
         MHp4IIyvKBWUHt8mira/yn/eLaAWX301KdRJhv/W/YAZ+M35vu2zUZfZer7+9ZgcR3b2
         S2mw==
X-Gm-Message-State: AOAM530Ta+YBJv3Ns1lN13lUACJgRb6G/UmCTFvVCpX7uQHu/VMwLjJV
	OjziYGGjRvelgOb+kKo+doTzRccVGyogf/5agYM=
X-Google-Smtp-Source: 
 ABdhPJx+YLItUBaO8W/sz+tsKCZ6j1+pqMGpU5zrrKn76FPY6upkkergw9wcG96ZG+aTHaDjvZuQhQ==
X-Received: by 2002:a17:903:2283:b0:141:f858:f9af with SMTP id
 b3-20020a170903228300b00141f858f9afmr54841652plh.80.1638136791477;
        Sun, 28 Nov 2021 13:59:51 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 37/42] oeqa: fix warnings for append operators
 combined with +=
Date: Sun, 28 Nov 2021 11:57:49 -1000
Message-Id: 
 <28a2ddf41c8f659d2267bd4c529bc779e9c9ebf3.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158919

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f2504115f08b173d919d9abe507a0ba440b0d4df)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/runtime/cases/ksample.py        | 2 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ksample.py b/meta/lib/oeqa/runtime/cases/ksample.py
index a9a1620ebd..9883aa9aa8 100644
--- a/meta/lib/oeqa/runtime/cases/ksample.py
+++ b/meta/lib/oeqa/runtime/cases/ksample.py
@@ -10,7 +10,7 @@ from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.data import skipIfNotFeature
 
 # need some kernel fragments
-# echo "KERNEL_FEATURES_append += \" features\/kernel\-sample\/kernel\-sample.scc\"" >> local.conf
+# echo "KERNEL_FEATURES_append = \" features\/kernel\-sample\/kernel\-sample.scc\"" >> local.conf
 class KSample(OERuntimeTestCase):
     def cmd_and_check(self, cmd='', match_string=''):
         status, output = self.target.run(cmd)
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 2b9c4998f7..535d80cb86 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -240,7 +240,7 @@ USERADD_GID_TABLES += "files/static-group"
     def test_no_busybox_base_utils(self):
         config = """
 # Enable x11
-DISTRO_FEATURES_append += "x11"
+DISTRO_FEATURES_append = " x11"
 
 # Switch to systemd
 DISTRO_FEATURES += "systemd"
-- 
2.25.1


