Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2373C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.4646.1642588912968389627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f8FAdIe/;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso1675166wmf.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r5FsQnCcrfbsdMmxjr9hISMXW9KNi6q2JSzduzYnqQM=;
        b=f8FAdIe/BQABPEayqrzlgXtNAuJq6OWhnzVDnyVtL/CjUCnkHXfNL6yIyxQYMYlMNu
         ZYdrrYaeThBK+6gKYob5VqRsz+zkFCnB5ySAn3xlX4lZIGY1NB0rOftDJEjbOnbJ2r8j
         tgpMOR1DdE2+T99fwsepQMDW1pz7L3uymInW1eHKBPJmnKrHtbZsaGREfyI5/ndKBD19
         8IemVfEEPcgZg8FHeXrBtkYcipv7b+K166kaDO4GBsjP20QuIrLHD584zlMPO2+cNArc
         8iXuWF0YJqDa9aB7ksnY4c1W0rSyfXjm301el2fNONbD2efwmhVjPpOHPrLV1CQpgF4z
         fWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r5FsQnCcrfbsdMmxjr9hISMXW9KNi6q2JSzduzYnqQM=;
        b=19go2Le0s6a8V6mbwW5Htk9FzFUG5BRzaSEdsePvbtaf81Kgm0qk1izWV9SIG1lGfI
         XiVa8BCthR5dQ5PTXxPLUIkYfDo+Z574PQCLDWi0GgVI1ceK+QYwcPEc3aGbF8NSJagX
         AFt3qTjUatwKS+bEhZpOm1qv5ul+HXemXXY/lo0XVumfSQb6wDPMeND4IBfTSQatL/5B
         cKikrXV948RO9tjgvBfPvk6lM6MFt+bB7ozcOUNFZLMGMgHzmXK/gjPmI8AY4wjDzWSC
         pw8pRf8RTdmtjmSE7dvHv8S+P6oPQtApz/+xISc8s8h9x685kjoc6D4bTb3hIcY+cby3
         YIgA==
X-Gm-Message-State: AOAM532RGTGuFJDZjyoEIeESC61/gOE+tlP7APD6bgk0C2CF6GKTB3pV
	XnaiqxjdSKj9bepmo38Zty2trlv5KXY=
X-Google-Smtp-Source: 
 ABdhPJyN0AmbCmPXpBDjZusJBj9uWaQK6cRdozQfI1tjE7R/00gUh4RwXWyvGI36fGoAQxAssGMiHg==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr29011458wrl.586.1642588911603;
        Wed, 19 Jan 2022 02:41:51 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 35/39] diffoscope: upgrade 199 -> 200
Date: Wed, 19 Jan 2022 11:41:13 +0100
Message-Id: <20220119104117.2120127-35-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160727

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../diffoscope/{diffoscope_199.bb => diffoscope_200.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_199.bb => diffoscope_200.bb} (92%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_199.bb b/meta/recipes-support/diffoscope/diffoscope_200.bb
similarity index 92%
rename from meta/recipes-support/diffoscope/diffoscope_199.bb
rename to meta/recipes-support/diffoscope/diffoscope_200.bb
index 3645ff1e6e..4239b34d9d 100644
--- a/meta/recipes-support/diffoscope/diffoscope_199.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_200.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "7b07b8ff34e5fe0e57acc8b02bcb9303ae254c40f357fb7ed805e9f9f7c7686f"
+SRC_URI[sha256sum] = "2fadac87b41cd5238fad7a624bab47ff5cd4c1f70c523e4e9cf6706c9d1a5e53"
 
 RDEPENDS:${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magic python3-rpm"
 
-- 
2.20.1


