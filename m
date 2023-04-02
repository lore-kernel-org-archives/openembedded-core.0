Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 352A6C76196
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:43:09 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.48720.1680453779083242715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=pRpNnc0l;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id l7so25048241pjg.5
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453778; x=1683045778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrB5nKSTh22Z4FVIMnL+SnRgDunBL7oWIB7bSxpJaL0=;
        b=pRpNnc0lbftnP6UTvebHPA8SAvnCeQFU8lJgWE140q1E7EZqfZ0vHQDHpdkS88+X9N
         9dkn5LY+8wt9G4B9G4r3dr/AdBnkQd3sa/Ym52z6skbw0foE4oOqNa/04rJifDK+uctV
         m10FNefd5forDerZ7vAP0So24VgBpzzVAKI0GfF/rv7sgvjjXM12dBuWRS5CU8ZAgJY+
         SMSu/cEPsk9QHIs3B9vHYhreIO74CWRCRr5T1u//Q4zKE22DQp63JbdMEnnYN3JwJa+Q
         5s0xVMadj5LyoFR6XoGTkTdRS3CfrQm5kk/zMzTlZhaDzRo5dOiVEXm9lbt4d3PFBbZq
         l2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453778; x=1683045778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrB5nKSTh22Z4FVIMnL+SnRgDunBL7oWIB7bSxpJaL0=;
        b=ksuRzWVD1QpYFf9oety9hokObp5xWN2qfZTOS1Erqgmt3ZH/+M6suTp4R3XKGueBQ+
         T3PQxo5lMZb3U8nK/0Bqqo5NcJRco3IUE4HBO6a7S87gfUsbDim0q4rPcZOPPI4nIAvR
         u5rIj77j6qf5xRRVwKqENCkGd4IYsCjurkyWFlPVGrwW1zXJhKlRFMOua7+k2jIzsJhC
         YCMByg1536o2vPHQyqczmL+Ww4srVFoVsjNdbB9jLc/Q/9Mm//yBen0vUW2L4xb/IjcT
         TA0+BHlWhImB+qwQBP++RO2K1fVLyXb6yWF+/eQNDnTppNRsZTIe+FRmposMCOOblnWn
         6kLw==
X-Gm-Message-State: AAQBX9dBhX/L+YrU6jdGUT2wpAbAfAQHWOJ5bHsTD75H36onsewwpeGa
	K5dzkTN/BJNKIl8dUQNaVpKF9CKkSFHe8FsZ8sE=
X-Google-Smtp-Source: AKy350YSpwuS7Kd/MXU/ffuhxI9HM/7AAVVmUf+7D2Pz/Vx4sVJG7ihv6MpzztER2doUhM7CvpLopw==
X-Received: by 2002:a17:902:fa0e:b0:19e:e39b:6d98 with SMTP id la14-20020a170902fa0e00b0019ee39b6d98mr30090171plb.35.1680453778192;
        Sun, 02 Apr 2023 09:42:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/21] gcc-shared-source: do not use ${S}/.. in deploy_source_date_epoch
Date: Sun,  2 Apr 2023 06:42:13 -1000
Message-Id: <728018bbfe1de53661881a05e0359083ad544f97.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179599

From: Peter Marko <peter.marko@siemens.com>

This function is referencing '${S}/..'.
It uses ${S} only as good known directory path to start
traversing from, and it does not need it to exist or be populated.
If ${S} does not exist yet, the function will fail because
it cannot evaluate path .. from non-existing directory.

Reproducer (verified in master and kirkstone):
  bitbake gcc -c deploy_source_date_epoch
  bitbake gcc -c cleansstate
  rm -rf build/tmp
  bitbake gcc -c deploy_source_date_epoch

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 42661a59cda164b2d236ffc35b4d8cf43312b677)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-shared-source.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc b/meta/recipes-devtools/gcc/gcc-shared-source.inc
index cd2e341099..03f520b093 100644
--- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
@@ -16,6 +16,6 @@ do_deploy_source_date_epoch () {
 	sde_file=${SDE_FILE}
 	sde_file=${sde_file#${WORKDIR}/}
 	mkdir -p ${SDE_DEPLOYDIR} $(dirname ${SDE_FILE})
-	cp -p ${S}/../$sde_file ${SDE_DEPLOYDIR}
-	cp -p ${S}/../$sde_file ${SDE_FILE}
+	cp -p $(dirname ${S})/$sde_file ${SDE_DEPLOYDIR}
+	cp -p $(dirname ${S})/$sde_file ${SDE_FILE}
 }
-- 
2.34.1


