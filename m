Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBBEEB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 13:14:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.11555.1688130875894806342
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 06:14:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IWwxJBY6;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso16933675e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 06:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688130874; x=1690722874;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcg0iDRf9Gxi7etUegyKpnNlpo+/wMQJfHugNnPNAfg=;
        b=IWwxJBY6O4NsnM5i+kwmpGA7P6RCJFoy08KQDMnwSdyMg0KNFmGt1Y0CjdW01TjRAF
         8WwghXUZ/9sEFRdAR0QFK1z6GlFLT7ZGofFOU6rWvqNvkmGvbOxjuMME33433Don9NDu
         1Tj8f7HDrb58oeElsdYorZkLFD3Khm05FCXAdssuvzO1UHz/HqdyOJdBj+jZ4lIGHXP9
         7vAu43/NryPCJ0Byl8AddvvnRHcjw2ZDUKsQ4IJvZ1D3up5DqMA4Yd3+g9nr5iyuWzLv
         ZIk5s8J3tk2EAevX1U8MHoNFupzSUYi2mAvWWDlJ/MAjY1pPglASj2mbVH0WmYG3rBk9
         vExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688130874; x=1690722874;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zcg0iDRf9Gxi7etUegyKpnNlpo+/wMQJfHugNnPNAfg=;
        b=fDSC/7rQiAx8REWOJa5i2gWsJg3M7tMtvwE7Rq5jHqsCG+ZSjG+DqG6RXA1ru8FaWZ
         fkUuZ65IOv5+m4UUklkLMrRdqtKyEBo77fBIWv/FMYk6hRnvhebF7S7qF7DbuYelmDFS
         azFFs0PHHq7LufBxjpwxyDuMLTrEj+jSVcVawBg2lbCtuHDcp2Nfh4bA9xgafp6sYN0G
         up+Me7LlgU2EeF/hvRrSYYYlsZHUHCa8CTRpX54CTp5h4yGLBekSzzPpz/Xuy7/weNSU
         qZfxKGzqQpED2PDItyrA/oozWq+EH1WxL3dTBhgbELRLOxbpvNcs6DlqMVGlO1MGlmVp
         onNw==
X-Gm-Message-State: AC+VfDxMvK08+4auozw7fiKfS4Vi4AEiLYMirQMt6UXmKItsXacpZu46
	24qeeHMzl/Brh67QcXAaskxs2kmXQ6FvIppb
X-Google-Smtp-Source: ACHHUZ6YZHD42PL6rDy3LZKcFJXrhyaa0bLN3bXvJVccA5HyFxRGC5a9Etok6Ztq8YnSjaA7Sd5azw==
X-Received: by 2002:a05:600c:22c9:b0:3f7:a20a:561d with SMTP id 9-20020a05600c22c900b003f7a20a561dmr2930743wmg.8.1688130874287;
        Fri, 30 Jun 2023 06:14:34 -0700 (PDT)
Received: from t460s-2.int.vlab3.dyndns.org (213-225-15-104.nat.highway.a1.net. [213.225.15.104])
        by smtp.gmail.com with ESMTPSA id f12-20020a7bc8cc000000b003fbbe41fd78sm3646342wml.10.2023.06.30.06.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 06:14:33 -0700 (PDT)
From: Robert Berger <oecore.mailinglist@gmail.com>
X-Google-Original-From: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
To: openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Subject: [meta-oe][PATCH v2] uninative-tarball.xz - reproducibility fix
Date: Fri, 30 Jun 2023 15:14:30 +0200
Message-Id: <20230630131430.5051-1-Robert.Berger@ReliableEmbeddedSystems.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 13:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183694

added --clamp-mtime --mtime to the tar command

see:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15148

Signed-off-by: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
---
 meta/classes-recipe/populate_sdk_base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_base.bbclass b/meta/classes-recipe/populate_sdk_base.bbclass
index b23ea26d40..24db703534 100644
--- a/meta/classes-recipe/populate_sdk_base.bbclass
+++ b/meta/classes-recipe/populate_sdk_base.bbclass
@@ -285,7 +285,7 @@ python check_sdk_sysroots() {
     dir_walk(SCAN_ROOT)
 }
 
-SDKTAROPTS = "--owner=root --group=root"
+SDKTAROPTS = "--owner=root --group=root --clamp-mtime --mtime=@${SOURCE_DATE_EPOCH}"
 
 fakeroot archive_sdk() {
 	# Package it up
-- 
2.17.1


