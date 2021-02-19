Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.12004.1613756035521173115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 09:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iAjU3TWq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id n10so8364426wmq.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 09:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DscOE5K8ZNSbtg+WjxWyDV6pybJPQeiSX6lkxoQQVyw=;
        b=iAjU3TWqY8+ZWtaiulDzPwgKoWalBsjSLpRWp+2jVKoueqdHPV8rZnqFdEX5K0tw2G
         +Ld1EXFBh1PgvG6+5k7YNR3iZzZxDWqm4GPfraHtA84FMHji1OabVJqXNAjPgcLiBzH+
         5pSzMR009onO6s3ZBcJTdm3DzniMAjhuRIoEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DscOE5K8ZNSbtg+WjxWyDV6pybJPQeiSX6lkxoQQVyw=;
        b=NqFW8YvRrdniBFoIMP52IqsGLP9ppW9H65+puGexkhRgsBEcVfyMImPXW8wJyLd26l
         4Kn9VLd1JoUqHKGc6Td4D1K0KjnqfwsbIfHhs2pGx6+wo7neovL3Y8KGMJRKpSvsvXE1
         nME/Kqba9VLaxuTlV/aXHNFbLU6RhqYgM4KG8JP3laoKldl5TuOx7UKMNL5puBkPautM
         ki4jittr5NjT4o8DSF//2koE9g6BtVExVrf+4uyGHI0BRDPTCteq5tcneO3WuTNYmaeT
         rdyTv4cMHsBHmUN00wHboy5r9vkGjlA8VXM07orTOFYyMpwMpRk1YRYbwoi+W+V65hQL
         ch6g==
X-Gm-Message-State: AOAM530sTzWX6mMOWMcX5bvZfAWa8FhO2khUluKt+zlRwHuM6SGqQpDH
	Q3039gyD1uMn8NVL5qAot30cRagAoDPvPg==
X-Google-Smtp-Source: ABdhPJzPKIPRrEuQ5mqrzxIihRbk/ZlM7DNqB2Vrqmbj8KHpxge4yJ9/r7WG6VQkV192QtescHYLnw==
X-Received: by 2002:a1c:6285:: with SMTP id w127mr9354721wmb.73.1613756033949;
        Fri, 19 Feb 2021 09:33:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:569e:86b4:55e2:a2e9])
        by smtp.gmail.com with ESMTPSA id h13sm14218924wrv.20.2021.02.19.09.33.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 09:33:53 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 v2] licenses: Update INCOMPATIBLE_LICENSE for 'or-later' handling
Date: Fri, 19 Feb 2021 17:33:52 +0000
Message-Id: <20210219173352.2151521-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210219173352.2151521-1-richard.purdie@linuxfoundation.org>
References: <20210219173352.2151521-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Where a user adds "GPLv3" to INCOMPATIBLE_LICENSE they almost certainly
mean both GPLv3-only and GPLv3-or-later. Update the code to handle this
correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 358c716a801..bcea0b3cb53 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -281,6 +281,12 @@ def expand_wildcard_licenses(d, wildcard_licenses):
     wildcards from SPDXLICENSEMAP flags and AVAILABLE_LICENSES.
     """
     import fnmatch
+
+    # Assume if we're passed "GPLv3" or "*GPLv3" it means -or-later as well
+    for lic in wildcard_licenses[:]:
+        if not lic.endswith(("-or-later", "-only", "*")):
+            wildcard_licenses.append(lic + "+")
+
     licenses = wildcard_licenses[:]
     spdxmapkeys = d.getVarFlags('SPDXLICENSEMAP').keys()
     for wld_lic in wildcard_licenses:
-- 
2.27.0

