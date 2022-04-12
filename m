Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A453C54EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:43 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.10407.1649768608076510524
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pNKxFQHT;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id g18so11364302wrb.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 06:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ysl3pj4H9SCBUbvfRvdSaXvoCHHhkz/8B5iwG1a/JdQ=;
        b=pNKxFQHTRpqUt2tF5Z2HFt0OrdokSfcysfV+0c5syppZZ/20jH7b4g7sTBfrclPC9f
         NpqVYawy3PEcRYhqG4j/pTWxVHmMxDZxpVl7LdwAVPcN00Sj7S+kZ5qC9EEnOuswt3Dn
         l3A4QovC+ZD53eiGr7/IIucG9rbdm5sAd069YSLndt1l9GugEQ3H0fvH8sPrN0aVey/k
         auUGR6OjYv8Ff71hh+lZiSPLVBAcVEEvMPI1VZHO2XEUTHQ6inRXV5Qfv885gTrOYCOx
         IuO2tZhX+6PxAojy3fPuNL/WAu2iquIUwLN8u74/ZCfvXCCVWXDHloS31owpRyNzCuRJ
         YIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ysl3pj4H9SCBUbvfRvdSaXvoCHHhkz/8B5iwG1a/JdQ=;
        b=UjXh5/trn1W11QWDmx/q+EegkJ1ZvVBMKBXFFpkV6toOXELZ+0cV4zcL1ODnlnTBCC
         mexT+J+t99FDqjNnWyS/RAx1Nb9lnWn9rrsI5UEcO2tULkl0BRwVk6BOS45JOupNDzkQ
         LDzFuyzNQj2YCe74bJmQPGCHLPQuYi0qY1cJw6fojMLdOwZHRmYKMk1RVGls+5EEvW3h
         nO+5Aaz96KDKxQu4FI4QEnn9wG2ezYdDqH3cgvaoPnjZUVY8bExkW8NPONbKHvRtA4jH
         HjykfQ4CPrkhFWQLPIkyxc4AWjk7oc1V0id+HgBneIF8CqniSEDu8erSYliP+ihARpjN
         0MWA==
X-Gm-Message-State: AOAM532DLA5ERE/T9GpnMK2DhZXXwUNNxcDmPVxYz6xc9ylMCsEWWEGg
	00qk1HD0AEgOYPQYEQ941HDxxHNVq+8=
X-Google-Smtp-Source: 
 ABdhPJxBmHPl/jTtAHSp8o2x+KUZbs+51mmluImAaUiA5iz761V1LqMsdlTFrIazh1OEc/9OU1nMiA==
X-Received: by 2002:adf:b652:0:b0:207:a82d:4e89 with SMTP id
 i18-20020adfb652000000b00207a82d4e89mr6755846wre.320.1649768606388;
        Tue, 12 Apr 2022 06:03:26 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c35c400b0038cbd8c41e9sm2372953wmq.12.2022.04.12.06.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 06:03:25 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
X-Google-Original-From: Alex Kiernan <alexk@zuma.ai>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH 2/8] wpa-supplicant: Avoid changing directory in
 do_install
Date: Tue, 12 Apr 2022 14:03:09 +0100
Message-Id: <20220412130315.25917-2-alexk@zuma.ai>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412130315.25917-1-alexk@zuma.ai>
References: <20220412130315.25917-1-alexk@zuma.ai>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164266

Changing directory leads to anyone coming later needing to be explicit
in their directory usage as the working directory is no longer ${B}.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
index da8f0843dc1e..6c378d532d39 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.10.bb
@@ -73,8 +73,7 @@ do_install () {
 	install -d ${D}${sysconfdir}/network/if-post-down.d/
 	install -d ${D}${sysconfdir}/network/if-down.d/
 	install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
-	cd ${D}${sysconfdir}/network/ && \
-	ln -sf ../if-pre-up.d/wpa-supplicant if-post-down.d/wpa-supplicant
+	ln -sf ../if-pre-up.d/wpa-supplicant ${D}${sysconfdir}/network/if-post-down.d/wpa-supplicant
 
 	install -d ${D}/${sysconfdir}/dbus-1/system.d
 	install -m 644 ${S}/wpa_supplicant/dbus/dbus-wpa_supplicant.conf ${D}/${sysconfdir}/dbus-1/system.d
-- 
2.35.1


