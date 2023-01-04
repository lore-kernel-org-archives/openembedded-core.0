Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DE2C61DB3
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.9382.1672830372763906166
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fNmINHt0;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id co23so32595798wrb.4
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bf2m5qWe34HoudvGm9Tn0IY88gS1A/o3CVYSYBLrc0s=;
        b=fNmINHt0keh1/Jcvuh3pUEknIiNDcekXW21fJn9N29in7xOu/xpWWQDvpoD2XmbdQO
         vJLbnPKZ4oo0Ga2pOAsLb/0a0vLmNBKqDsbcd8Set1JohvB2IQbElM6CGbGjUaVnb6xa
         6z8+wGUhZFE1z+FJ7UgJutlSMN3J0yvxepai8ansANbbUPXuyRGxUOT8Noi803HAYCEM
         HHO7qiBNUiAdujOqk9mxorZquO2oZLd80O3JC819egGmvjlnXSQZHUEhUrJDpLpB5ESP
         Iaj+a9im6iLOat2nU4Ii9Kr1NV+HGjVmzPHnZMaXvdN9o85MnN8p26GnYUOexbYm8oEz
         vqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bf2m5qWe34HoudvGm9Tn0IY88gS1A/o3CVYSYBLrc0s=;
        b=2Z31fIM+Hna1U/SyHQPtLOYLT7kHAlaWtKbO3CQxtclVhjPhuAE/B4SJbPpF6GdQ5w
         Tj5uQtmUDYkSX6pvxpQ88VTLRefxCNsviL9YPkWOYhKHu98ZKoyN4ZNuHUa0IopzSEB0
         EeyUHiY0ITVtRm0x9YvLLIZ45720OPBa4bQk+U/zYpu2b9IAP2wsszKhW+TtAp1o7Rgi
         lbBzrkXSJ1CnRoXpXU+SJ9RSEtLpzm0zlsI+GmoyBDbhiUUf7r/O/yNs8rdl+CPOsv9L
         9FwJl+hiF//YCbi0OuvydZNlzPvJw4Fuv8gCJ929OrzzMku6UyOAN+kgdcnl8DeDz5Ec
         8+3g==
X-Gm-Message-State: AFqh2kp64n4a8jD07cTx3TD86iQe0GUvNXB5NuQvTX/H4dXHA2eZjht4
	lynGA5WDzY14E4WzNGAQkN69UTaY5hA=
X-Google-Smtp-Source: AMrXdXtaP7SnB7xwI033eJ9LX5r8fqGiTk2uHGqdfMcWIk0DEIljbAkeJE9GZXHhtZ+4ZcY4E2+CNw==
X-Received: by 2002:adf:edd1:0:b0:27b:55a9:4bd5 with SMTP id v17-20020adfedd1000000b0027b55a94bd5mr24721979wro.1.1672830399738;
        Wed, 04 Jan 2023 03:06:39 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:39 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 62/77] bash: upgrade 5.2.9 -> 5.2.15
Date: Wed,  4 Jan 2023 12:05:33 +0100
Message-Id: <20230104110548.2537259-62-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175447

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/bash/{bash_5.2.9.bb => bash_5.2.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/bash/{bash_5.2.9.bb => bash_5.2.15.bb} (89%)

diff --git a/meta/recipes-extended/bash/bash_5.2.9.bb b/meta/recipes-extended/bash/bash_5.2.15.bb
similarity index 89%
rename from meta/recipes-extended/bash/bash_5.2.9.bb
rename to meta/recipes-extended/bash/bash_5.2.15.bb
index 39a5d3de86..f78f79fcc5 100644
--- a/meta/recipes-extended/bash/bash_5.2.9.bb
+++ b/meta/recipes-extended/bash/bash_5.2.15.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://use_aclocal.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "68d978264253bc933d692f1de195e2e5b463a3984dfb4e5504b076865f16b6dd"
+SRC_URI[tarball.sha256sum] = "13720965b5f4fc3a0d4b61dd37e7565c741da9a5be24edc2ae00182fc1b3588c"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.30.2


