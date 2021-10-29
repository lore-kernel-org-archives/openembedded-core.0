Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E06C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 17:06:57 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.8452.1635527216660971334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DUp40eqz;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id 187so9788470pfc.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=So/MHqaRTkLA0nPQ61DVXnBR3JJWrgAcqhMSltPCy5k=;
        b=DUp40eqzjn+a8dmIrmitcLfmeNmO7giWFWJzx6ycjk1OjMTuO/x8jVKO3aiYBzAsfI
         kxpbjwTIphXyaeXUQ/Jlih8wAtU9wedmezQBk4uj2Skl+tIqc0UA+kfsCndRnyYGt2AR
         PneSE9NhjuoEAS22wp922EMukozigLNozhMYjvTtIe6WJ+2dATowyS6joqn1Uchoz7yQ
         QDK5esntJD4Cz/qLruHBTJpXNZufGYIqGXVz/fkNJ/XMqY2TE+Os7CUS41R2nr6PSGoV
         NK9+RdXLtyku1y6/BZYi1oaKKVdc8IdtVanPwtRc1DkwB9rSdqx6xZY5SdjQJclM3DWz
         ksug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=So/MHqaRTkLA0nPQ61DVXnBR3JJWrgAcqhMSltPCy5k=;
        b=aeaf+zznfKeX3Pv0bpynzjYS4sQoulsqVNuGIKYc0OJpYzNBxYgM2LkxeER7lqiryv
         0X95TL/sVJeRMSXNPO3Ysibk6+SnUmilEVeMZLM7SOXRwci+UW3UqhWug1gGnkI6TopO
         aZ6dvsegPj8Jk8u5N7lSwFCQJL4jiaTlAKpDT+Q84blKWgwTZy+AxbOWTROM4JDzmI5H
         TjZRJsrsrZXFMMBJ6FgAcyaXxB7Ble9j+afHzQtreyJ5RcRf17ABz19XckEU/J9lq92h
         4GScGOKQLA+xzgl45Qmt98QEll1yrftIHPlbab/tZzWP4Wo9J5h7FjudVn+cqwKQU0Z8
         OWJQ==
X-Gm-Message-State: AOAM531qMyZ2TVZe4OEodd0Yx7awWjnvwcXvreNXlAmefyOcYXtDHDwJ
	i2ZAC3uubthcx2MJjUFueAZ7WaRaPlE=
X-Google-Smtp-Source: 
 ABdhPJy7n27zzfCQje+e+z0n3sSRtredGH3DgCS7p8ZJKt9nC0TRNJcyff9sJm9wW2rgstOpWSd20w==
X-Received: by 2002:a63:a009:: with SMTP id r9mr9154885pge.172.1635527215846;
        Fri, 29 Oct 2021 10:06:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 j12sm7341797pfu.33.2021.10.29.10.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 10:06:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] site/common-musl: Enable qsort_r in glib
Date: Fri, 29 Oct 2021 10:06:50 -0700
Message-Id: <20211029170650.1278607-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029170650.1278607-1-raj.khem@gmail.com>
References: <20211029170650.1278607-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 17:06:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157630

musl now has qsort_r

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common-musl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/site/common-musl b/meta/site/common-musl
index 44a7a1aea9..d990c4e072 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -23,7 +23,7 @@ ac_cv_func_snprintf_c99=${ac_cv_func_snprintf_c99=yes}
 ac_cv_func_vsnprintf_c99=${ac_cv_func_vsnprintf_c99=yes}
 glib_cv_compliant_posix_memalign=${glib_cv_compliant_posix_memalign=1}
 glib_cv_long_long_format=${glib_cv_long_long_format=ll}
-glib_cv_have_qsort_r=${glib_cv_have_qsort_r=no}
+glib_cv_have_qsort_r=${glib_cv_have_qsort_r=yes}
 
 #dbus-glib
 ac_cv_have_abstract_sockets=${ac_cv_have_abstract_sockets=yes}
-- 
2.33.1


