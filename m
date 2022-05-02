Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DDFC4332F
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:19 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.4274.1651532591740912927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iCrdIq8F;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 cx11-20020a17090afd8b00b001d9fe5965b3so688403pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=baXQ4HIxBg7mbP8c0D9hYtk0q7kznuF5jC/n/ag9sm8=;
        b=iCrdIq8FafGBhzSCBT/UVicPplv0WJCTJdclceUzoH2ShOKCdBk4269sD7qQhxK3KN
         KuTiwdCEXFwf5bqRr0v+F3OBTseZ9yImrfcLBN2yc6o+TY11n+7D9M9Dc1Bq65swAFkj
         X4iivlS9D3ltkyPHpRJT8L3ouHuDu5YVvxmEDV4dJa4+rtL8eqFBMicjANJ9vdCMPFLS
         XTcqr8o3qTbb0TQbbSQ3qJ+t0+Mdcl4Xcftl2DzBl4iu36oZycrdu9dyP3+Y82sJd61B
         Hnip8qSdI+RH3ctAATzvu92Gvu8SsfAOw+eanClW0CyHALS2h5Bs9WMbwXd5XYv79Pii
         72lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=baXQ4HIxBg7mbP8c0D9hYtk0q7kznuF5jC/n/ag9sm8=;
        b=umcAIlWRCcoE/BAzSgv73oibcBXiFb/TacZojRub5QBp7lHPdHqYHiW9VNSpWBI9ji
         rTBt6SvvtSbZY0tlQyEH9cZ3ikvTBe0g4aXo8TBf+7kPZtbIlC84+xUk0w8Ip9Kd+HSJ
         KLE4Ygh0LQAsGkJdyCVkjn9qRKeHD2HZJJirWiYGWpYpEYR/CyNWxkMIDp7uucy/4v+x
         rkm4t5YhDJkuQZ2L63nXI80KmHqlgwGwEP4o59/vgz7H9lPCBJrmGI7jeSLqGuyrzeFA
         +wHOaIKathxkqLpWbFW6zUi7F2lnrXQM1VxSNcSeCcaWHb9arDpYkrmDHSDKUhmsYeY0
         wAPQ==
X-Gm-Message-State: AOAM531TvPADvteMeMQbDVrkvMBoaOEQShI3bXR66K6xNcJaFKESyQJy
	ImTF+Bjkrk5bT4Z0hTzlLXU0CYz+q+UO8rFG7hY=
X-Google-Smtp-Source: 
 ABdhPJzDFOx2ZX8OH21xRxRPr7qxrP1g4EXslnk1DD5xtKOzwZZPh6i3SkT3bFD7eLCfViVL9sFeCw==
X-Received: by 2002:a17:90a:fac:b0:1ca:5eb8:f3b2 with SMTP id
 41-20020a17090a0fac00b001ca5eb8f3b2mr1571366pjz.37.1651532590589;
        Mon, 02 May 2022 16:03:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/9] busybox: Use base_bindir instead of hardcoding
 /bin path
Date: Mon,  2 May 2022 13:02:47 -1000
Message-Id: 
 <e40f202d5f3228934c0e4b49218767864580d003.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651531749.git.steve@sakoman.com>
References: <cover.1651531749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165181

From: Khem Raj <raj.khem@gmail.com>

This symlink is not valid when using usrmerge and ptest packaging would fail

Exception: FileExistsError: [Errno 17] File exists: '/usr/bin/busybox.suid' -> '/mnt/b/yoe/master/build/tmp/work/ppc64p9le-yoe-linux-musl/busybox/1.35.0-r0/package/usr/lib/busybox/ptest/bin/login'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 238fd30689054c7b44176dce7180fb6dac4e1b6f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index e0522be729..3553376582 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -348,7 +348,7 @@ do_install_ptest () {
         # These access the internet which is not guaranteed to work on machines running the tests
         rm -rf ${D}${PTEST_PATH}/testsuite/wget
 	sort ${B}/.config > ${D}${PTEST_PATH}/.config
-	ln -s /bin/busybox   ${D}${PTEST_PATH}/busybox
+	ln -s ${base_bindir}/busybox   ${D}${PTEST_PATH}/busybox
 }
 
 inherit update-alternatives
-- 
2.25.1


