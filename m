Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B99BC433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.3576.1652871537727940583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jYQ7otnC;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id y7so1540909ejr.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ArB6qomQ3Z0+wnGc6pIfl6Q82wtBnUpurE2H46Ks7ug=;
        b=jYQ7otnCN/fjeYB4oZQ41JD9Q4JJ+sAMQdHVp52PqTMVfuxya7qVpnarNBbaEOVFiM
         mVpgWWGOVR/SNrlarS3Qahoqq+iJKPodZj8TIQXJtEcIEmKSeeR2Tjq117/pl1OstkLe
         u/nLefOZNd8TUCny5aiVFbMZ3uxx9BhwiZoZO34KshMQLdnIdUNaEvoyEoX6KsNgpIdh
         wKCM7cx6/2xT6Q8mEbxDb0h+eC1Uvipw2SOAhzWuHByc5J4H7eUKddIOdAa7OWUEhpZE
         NG3Hl1X/6D8+Pis5oSCGl/57ABwiDQ+PLlSpSn6t4GudmdNUa703wrgog2qDSewNRTbi
         QHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ArB6qomQ3Z0+wnGc6pIfl6Q82wtBnUpurE2H46Ks7ug=;
        b=FR5AHyKnqPoC0/xB2YBzdu00iBZlpBIbfku/azEDrXF0GPl+dGJm3/4+c50OcEMoFm
         my6h+SXhk85c/NJUqSUGh8dD3HMI61hkStiEnfTDpWOzzrHlw0d6Bw5blflw9cFVNwI6
         oHr3UfF4RjJzjEobnVJwCNXmD6FUzqgPVB1v3f0Uzafsc1V1p3cMW4zeMxabOi9plzyB
         7gTiwIItt1rDWgua+H0JD5dr/MKVn17c/Gnmwvc1XDpRr38dL0/WL8n5XI15LzbWGXOn
         H+6wRuVehEkYOSXLZEO7Pq6CqggMYpAn5JHPLnRpupDZsJNyYfR4lvrYrSUljPG7GT8f
         AwKQ==
X-Gm-Message-State: AOAM530eFelNAEvzZPZUB7bwFi3M44JfEG09FB4AmyTOesiAYjzl3hhk
	iJO11+7k21j/reTyhzHEQkRUKNrhFc4=
X-Google-Smtp-Source: 
 ABdhPJyjiwYC0F9NxM4VYtjAQKTNB1EiXgzpIemHHY6odTHvsmb5Bji6NCjrl9/tWOVkGgiXfkELsA==
X-Received: by 2002:a17:907:ea8:b0:6f4:78d1:806d with SMTP id
 ho40-20020a1709070ea800b006f478d1806dmr24005991ejc.448.1652871547432;
        Wed, 18 May 2022 03:59:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/49] gstreamer1.0-plugins-bad: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:14 +0200
Message-Id: <20220518105843.3299331-20-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165817

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...plugins-bad_1.20.1.bb => gstreamer1.0-plugins-bad_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.1.bb => gstreamer1.0-plugins-bad_1.20.2.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
index 7c4665ae80..bb33e3822e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848"
+SRC_URI[sha256sum] = "4adc4c05f41051f8136b80cda99b0d049a34e777832f9fea7c5a70347658745b"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.30.2


