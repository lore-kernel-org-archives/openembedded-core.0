Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37562CCA489
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:45:25 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.51642.1658306701623392478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SiCgk6uT;
 spf=pass (domain: gmail.com, ip: 209.85.218.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id j22so31836183ejs.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N6l2AnJXnVkL0kvLy0lsK79ApFkzswksOF+xUywZLEE=;
        b=SiCgk6uT7VqyPXs1C6GpZdqIvzDYT6BsJK3syVTzEap20YivNQOY5yUlpJcGRAWcG2
         QMtipzu2Nmhw8IPUbTSLjMmAqLjmNXsz6XmPML5W1XzBin6DJkU5hXzsvrcDzS3kuuFJ
         riByGnirVs2UFayWFJOkmnjStTkZtjsIKZWB11dqhf2nqhB2wbaOE7gYrbEbZ+4tLmK+
         FUb2Ez9vWqUKEB04BlkIi81px0vApsZK9Uz4Jwgyf8T5m4DUcq1Gr5wdVV0SBENB4A/3
         p4VuNGXis4XfYchPJBw+8qKGQrzF6coXL0fQ7oxG240HSBGomV1dfzR+tHGacQ3M1Y6d
         ir5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N6l2AnJXnVkL0kvLy0lsK79ApFkzswksOF+xUywZLEE=;
        b=NX8U7wPcvBsrlp7GWKZ0fcFuWTZRko/WneA+s69Dpauo4eDDypPz+e1iQ5j+MYQHe8
         Mj9PMuCiY91ZauwC8MN2NfnKspjxxSQorVDKLver8wLgyt1fpqUc5mN1xFuRLHgrnA+J
         MHRvp5QjpDxWscz5ktCjNCTrjteSEPfY9Opye4JsfjRQ0885LTb5LDtyOSNy+HmvWaII
         kpoTarHBDi0elTKsn0sVwanpGGitzWqWcGMXcKjCGWPSTfmpxAKvC7/gSHlMVSkRK4bW
         3YAhYj8wWfQ2iRBftu39l1d7SIyU+VYSTKhVIkW990O36m0KTj0cEFvIWFVNyGXyDoFJ
         PmwQ==
X-Gm-Message-State: AJIora+UhbV7hOoGukO6xjuf/xebfk/dIQs9rVk/+1ioJ9pWRu262vDj
	8v4AM5whLMoyFFwuLfgeBhgkRkbwZng=
X-Google-Smtp-Source: 
 AGRyM1vLp2hwb5eLdl1LAjzvSghSAeci8qKUxyiQR4a2LPO53na/an4kUwjvHxls7421kJGBEzxc5Q==
X-Received: by 2002:a17:906:6a0f:b0:72b:64ce:289d with SMTP id
 qw15-20020a1709066a0f00b0072b64ce289dmr33113471ejc.663.1658306716215;
        Wed, 20 Jul 2022 01:45:16 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 s9-20020a170906a18900b00722e5b234basm7781784ejy.179.2022.07.20.01.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 01:45:15 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 27/51] hdparm: upgrade 9.63 -> 9.64
Date: Wed, 20 Jul 2022 10:44:18 +0200
Message-Id: <20220720084442.2940187-27-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220720084442.2940187-1-alex@linutronix.de>
References: <20220720084442.2940187-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:45:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168321

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/hdparm/{hdparm_9.63.bb => hdparm_9.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.63.bb => hdparm_9.64.bb} (94%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.63.bb b/meta/recipes-extended/hdparm/hdparm_9.64.bb
similarity index 94%
rename from meta/recipes-extended/hdparm/hdparm_9.63.bb
rename to meta/recipes-extended/hdparm/hdparm_9.64.bb
index 7900a310a3..558dd53f8f 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.63.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.64.bb
@@ -26,7 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/${BP}.tar.gz \
            file://wiper.sh-fix-stat-path.patch \
           "
 
-SRC_URI[sha256sum] = "70785deaebba5877a89c123568b41dee990da55fc51420f13f609a1072899691"
+SRC_URI[sha256sum] = "315b956951c3fea027287de204381534217c0bd0f37b4935877fe2db0cab859a"
 
 EXTRA_OEMAKE = 'STRIP="echo" LDFLAGS="${LDFLAGS}"'
 
-- 
2.30.2


