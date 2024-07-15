Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C025CC3DA62
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:15:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.39145.1721052910387268424
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IkqZMwh8;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36798e62aeeso2798647f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 07:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721052908; x=1721657708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gSBLp7VN22y80e2mPRJVwQknmbERTBUNCXzQHsuhsmw=;
        b=IkqZMwh8TKG3Rpm1YTafCwklOlEYKpauAFAPnwXl4AIXCx/k3wbZGHHu+PkEmXDUa2
         S6ATZliGBrheXPMSxw1j9sZr3lN+KToOIPuwxj9XqMWXtMcKCn8hS6h38ak4GfrNoftH
         VmeSvutsng1/2CwKze3OC720nXeWCmRI1xy0URgl8tNgBEyom/+yf9OxUTkPLL2D0/v/
         lTv78/gcKABoUDakJ+961Pgp0/gJf+73u93m8IC594sR6RuoKZgZBKxh1g8ECevdyCI9
         fbc84Vl6VIZYrM9PdMlcu5rBwo0/tva9fA/sX5e03gwZHPt7Rp5onPAoquia3J9ph3y4
         G6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052908; x=1721657708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gSBLp7VN22y80e2mPRJVwQknmbERTBUNCXzQHsuhsmw=;
        b=XsuuvypDGaU/Ar8K2UtIWMWo2PK53Qy2zl1Xu7wQXEVeFEu4JK6c6gAq4PPZKTdbqy
         WlGs564xXvDlVQejeS9qmNmnCtRuTMrM14KLM9QH+Q/ryYoU70Fci2IGpHMMCd9BBJN6
         jQqLFkx0Z/JS/qK4KyhSzTDVH1RPn3XEBnI9nrMTLljiNV0CtNhSspwjq+65hUpgWElw
         WfjcDz3QgnIx0pOTF1yTgp1OFLWap67yDQKPq+ea/EQ0QpVllg/JAO0nXZngmLCG1HZN
         VvynFW2aOdyO2pDVtDOIiSgbLVZvzsznWSkv3ZpYs/arSFzAsejBQPvqz4LYCWeC9YKJ
         Br6A==
X-Gm-Message-State: AOJu0YwD2YWhSbbwRT0eu/CalnI5r5fTqiFcodhE73KjfwacN/g3Sd3i
	EVG0Pv3aQCwzMTPiRaU/QwU1ytvGRThhqOyOhtSvplmX8ZnK0AbGVqUQPg==
X-Google-Smtp-Source: AGHT+IE3AhztBqIdRKfxi3+KQYOvARfhRaIrb3DZzgGxzWR1uRmxngRMDFkgU8JfhDH+JIbd2VawwQ==
X-Received: by 2002:a05:6000:1888:b0:367:8fee:443b with SMTP id ffacd0b85a97d-367cea96744mr16920969f8f.41.1721052908116;
        Mon, 15 Jul 2024 07:15:08 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbddsm6499074f8f.64.2024.07.15.07.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:15:07 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 2/6] kernel-fitimage: fix external dtb check
Date: Mon, 15 Jul 2024 16:10:39 +0200
Message-ID: <20240715141448.2158477-3-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
References: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201928

From: Adrian Freihofer <adrian.freihofer@siemens.com>

If EXTERNAL_KERNEL_DEVICETREE and dtb_image_sect are empty variables
dtb_path ends up as "/" which is available on most Unix systems but
probably not the dtb_path which is needed here. Checking for a file
makes more sense and also solves the issue with the "/".

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-recipe/kernel-fitimage.bbclass
index ce52297aec3..67c98adb232 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -429,7 +429,7 @@ fitimage_emit_section_config() {
 	fi
 
 	dtb_path="${EXTERNAL_KERNEL_DEVICETREE}/${dtb_image_sect}"
-	if [ -e "$dtb_path" ]; then
+	if [ -f "$dtb_path" ] || [ -L "$dtb_path" ]; then
 		compat=$(fdtget -t s "$dtb_path" / compatible | sed 's/ /", "/g')
 		if [ -n "$compat" ]; then
 			compatible_line="compatible = \"$compat\";"
-- 
2.45.2


