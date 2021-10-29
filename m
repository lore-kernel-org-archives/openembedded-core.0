Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C3BC43217
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 17:10:27 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.8595.1635527426202824095
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EE3QvuVj;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id n18so7266788plc.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Oct 2021 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u/HnhJDtgDSKsO4exPvReQu/m1U8Vx7bvTbu8f+fJzE=;
        b=EE3QvuVjbr+YK7cfYVdst7peMUr0Or4/1UsVxWQMjPXcb5ncZ1qUzMIgSB5q/SNP4m
         /ZvgIfHGU4oIe08QabwLAX7nVq0Rt5ZXaD8ggQA9S9csmmWWF5oxNL6lVGEDK0S94Xax
         uN5Artn4fuAO1yQSS2w/FEzH4FaaSKAxIHs5PEW10s9nsUKJk4GAu2EGd0mTuxlIBhos
         GAdnRqsiR7rnmblQGi94We8fSBFRSKkEI/SWtJSbT0yyxziTpYey7J3pR8i/zGxvkj/K
         v34eQXr7SE7U+3TZ8QDMkRyYwXq8CoyDd94ePltVoukRhOpWgOMgTilvVbA7yle0KdS7
         UT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u/HnhJDtgDSKsO4exPvReQu/m1U8Vx7bvTbu8f+fJzE=;
        b=AriNvzl6hzw3okTxp8cFIXsIjNKhfYJIpuOB91MTCnjC01MHqPlzqVpodpjM5Y1EyW
         K8AuxyzXt4vOWnModw3u4F8o4mD+gKDqbEqcwJeBGJkM3T9iVlIhhEV/PJOyEaaGR4jY
         3s7yU6a05bb1yIcbx2ETXQ4B639H9jttRb5qG5eVokHPYjcV+xb/vVzjlIDotbp1JzU7
         WvRuLo7eeCacyu1Lqt/KyEW5rA0IbtQHZq3CSiXZi4pWoNQFredorOF/KSaWHKOno7Nr
         3v8QrF8TDzox3Q5KfuoNrvWqB3La7xD9BlLHC54lA6GDzRE3o8xduwqadoYRsTK54Rp8
         z6kQ==
X-Gm-Message-State: AOAM531bzgbJXUV2sQHd9bfVz78aUZ/IRlqlCZAPP/e9i18tMDbArGdh
	b2o+5fpSk+iHN9FDLcCNOdyr2m2TvP0=
X-Google-Smtp-Source: 
 ABdhPJxKhp3iVQ0EPa/YL87EmdQ6Iff+2qkaq30/UE7sJReyiC7hKj4pPPQcJDWqDyn5E2YAZDWIsA==
X-Received: by 2002:a17:90b:1c92:: with SMTP id
 oo18mr21093840pjb.56.1635527425457;
        Fri, 29 Oct 2021 10:10:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 z7sm5887805pgo.11.2021.10.29.10.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 10:10:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] site/common-musl: Enable qsort_r in glib
Date: Fri, 29 Oct 2021 10:10:21 -0700
Message-Id: <20211029171022.1279107-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211029171022.1279107-1-raj.khem@gmail.com>
References: <20211029171022.1279107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Oct 2021 17:10:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157632

musl now has qsort_r

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased on master-next

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


