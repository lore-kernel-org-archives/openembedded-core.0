Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.12289.1620737504263116121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 05:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K4i0aVun;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id o127so11056921wmo.4
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fXDuvRLOUoP/5cg2QsYQi3qK4zKplhG9Bf1J8wG6e0c=;
        b=K4i0aVunWh8J+3P4OCEkXyNtednxnRC5T82UaIWzebcNoUef1Z9uIvUtT4SefaweGu
         rBZyH2/GfCKlEniNA6U3EZo5qwDzl/ytZAsArKuUA8pL+RLfhrDnpcD3ER7+jBls2hs9
         ibHWhkJheqUFFGyUcsypAEDPEvkZt9lrymvIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fXDuvRLOUoP/5cg2QsYQi3qK4zKplhG9Bf1J8wG6e0c=;
        b=iEOlWwAAgO2mVEQQfJjwtS+cMB9VkJBWATl6Wfv3EOE9M7rXu+zBjeIvl9sOUwzy1B
         VCdj4jU1ViiM7luxQjK0VMRw9h4jLhySH4K31IswC8zKnKkHCHoITNKU0YRRYcjd5+Ew
         A/4GSvAzXxrGMCwKgFAUhGPsEssOdL+HcSKPgU6UvND2cFa0Poz7eyvVXRlJ53HDolgL
         wYvSCZTvrrusvklUhb6Z/thx5z23Vkpx435XlrFLtL+ZGi7LSJxTkRpe0ww3Y4AsLU0y
         clSHTQ7XFj50i5r7UpEfkWsoRU3/hrzsvZhJ3ewx13CLuZM3NfSkgTu3hdFYGGWApTd6
         iohQ==
X-Gm-Message-State: AOAM531wZihfECFrrovq0sRZwHEfy67f2xpcBwqtb0tLVwYGnVvzINVH
	nkKRyezQlSHfFqnScY0tdkRgInLZuCBaiA==
X-Google-Smtp-Source: ABdhPJzVuOgC7/8GY3mRppHxzVKGXLRAZ+aDT7Mn5ISGRYNkJtZxMQVeqZ2RrxhXMbXjeWwoaUzRxw==
X-Received: by 2002:a05:600c:4f0f:: with SMTP id l15mr5270881wmq.143.1620737502806;
        Tue, 11 May 2021 05:51:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29c0:3873:464b:b647])
        by smtp.gmail.com with ESMTPSA id y14sm27119099wrs.64.2021.05.11.05.51.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:51:42 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] xinetd: Exclude CVE-2013-4342 from cve-check
Date: Tue, 11 May 2021 13:51:36 +0100
Message-Id: <20210511125138.2232637-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
References: <20210511125138.2232637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We use the SUSE mirror of xinetd. The CVE fix was added to the main repo
after the latest release but is included in the version from the SUSE repo.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 2787b270fac..69d5b2f83b7 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -19,6 +19,9 @@ SRCREV = "6a4af7786630ce48747d9687e2f18f45ea6684c4"
 
 S = "${WORKDIR}/git"
 
+# https://github.com/xinetd-org/xinetd/pull/10 is merged into this git tree revision
+CVE_CHECK_WHITELIST += "CVE-2013-4342"
+
 inherit autotools update-rc.d systemd pkgconfig
 
 SYSTEMD_SERVICE_${PN} = "xinetd.service"
-- 
2.30.2

