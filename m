Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B15EC5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.9354.1672830355694061789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ckbh014J;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id j17so27211404wrr.7
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQsD5qr5E1u12cLB2Wd1BX/Yy0NSY0B/qRQY2IIguAc=;
        b=Ckbh014JGXGfLAdBf/Aofd4W+oqfQSk5/PljuOU5M9YW9LsDGcbOBiAeW6bBL3IMra
         1GVo0Tuuj8/4B1tpnJ+AbBYWe42oARnjzapn+oBKoG0zjb4YP038lzEkEN92REVXTTWm
         lfoSL5Lse+mso6aRb+wgmVHZNQLjBQ/3zonNXQCT72mHNHqDAyDKuU7py5OXSIce3HMt
         Yqp+L510OTzrwnvkFo/XjF20GV+XUD+mN7n4S4XTaZuqMW+1amFOvfE7cVBdlb/3aSMb
         2hELf85QtGrf2WuKobdo8CdDOk9PjCVuio4wqZ6/zFUjcJwbKlL8XayHSVpKD3g6+iDD
         Pqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQsD5qr5E1u12cLB2Wd1BX/Yy0NSY0B/qRQY2IIguAc=;
        b=ZfW1GATUqzHbIt8eC1pymVW9JzbsrM+7m8OWZM+/862L5kMn8OEMo3pcCERTf5WhCn
         mSHW4s1NfihQEa+P7oa54Eb84Y/yMwupUNQ7rxkCwwEt4RojICqyWVZuQVw7U7m6mLf7
         i6eHQmg+6m9CTu6a5982mfy9BUkmtT7dtTqWl9HuOwZTIxDtS+sSdN7DLfMEGS7bvNiQ
         +beBNepTN4sQA4FQXSb1u0TGj+reQM0JPBiHKXR/K0M8qrRQwPqmZshCb1o2RIuGwwIl
         WUkWeF0WJgBPWgp7hp9AShakU0/9lgupHKgFXe1OyrPFjQemo/t1uLQtWfLEjm/UQRo0
         lEDg==
X-Gm-Message-State: AFqh2krCqvFfXJjYWRR/UZxM+LDVH98rxB5MO5cBVkCQCXQrY/OB23tv
	5HarS0m8+GA4A5Iuq3z+vx7CdXHWoS0=
X-Google-Smtp-Source: AMrXdXth7Dmq0Bpwgrml2wF3+jdFXJtAAMva7Cr1j5Xan+R0/s2lGNfEvsyTc2PHpgUSvuv+/eaiaA==
X-Received: by 2002:adf:ec43:0:b0:280:cc12:2827 with SMTP id w3-20020adfec43000000b00280cc122827mr20236186wrn.21.1672830391444;
        Wed, 04 Jan 2023 03:06:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 51/77] libsolv: upgrade 0.7.22 -> 0.7.23
Date: Wed,  4 Jan 2023 12:05:22 +0100
Message-Id: <20230104110548.2537259-51-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175436

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libsolv/{libsolv_0.7.22.bb => libsolv_0.7.23.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.22.bb => libsolv_0.7.23.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.22.bb b/meta/recipes-extended/libsolv/libsolv_0.7.23.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.22.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.23.bb
index c27bf9c67e..1256905720 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.22.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.23.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "ea114b257b78bda6ee3e4238118ed93bc57c5984"
+SRCREV = "6deaca7cf61ec2b32c4a3b494a751c8d15efbe8b"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.30.2


