Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.494.1621543756857548027
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 13:49:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KKHzf+Sl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id z19-20020a7bc7d30000b029017521c1fb75so6206900wmk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 13:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=onmTjYdtFKmHIact7DojJgLD0cbs19rZVyczTjOGaFE=;
        b=KKHzf+SlDdrMzMLm+hgU2lxmFo9MMi9n0moKpTcYwPOWzq3sXO9zcWS7ZtaP+G/ivv
         hGtqfZAGE+V9mUjKpf/738oAZhd7reYsyEUwkG1CrIXGRROdjlIMq7qx83qq9Dk0m2ll
         i46q2kMcRotUfDj8+QnaVJK6gOSosOmccbHDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=onmTjYdtFKmHIact7DojJgLD0cbs19rZVyczTjOGaFE=;
        b=Ro3YuOs9/POlNMUfCP9H8anodKSv5Qg+/2V7cfDpCgW1jDueqC+QZjBlMBOcz4FuV9
         2mAQ+757sHDHFwYGsqYL+k8PV8uT02iT0xdykcA/CzzL+pnnzwdhEBScYH++Be5LSZhY
         ojEL+SCj+jo4iWey+yq4AjyP6+L8rGuxQ1+3t0NrUvke/zQazp9mpO2NgsxpzEj4n5lY
         O4aMgz7M42XiOu8svHdvz3bHpAHsDDFgF+GVSL5guRePewmZYxAU9WbHSn5FH4P04j6n
         bwGSNUr98DmXquqF2qh6mGRFb0dqSqDizyluPGF43M1MvA9a0IFH6ZrxP18IdvbO6zzQ
         sA1Q==
X-Gm-Message-State: AOAM533yaHZ5vX75H+9CyzVUg1WNBtK4rhGSmOnUBABwPwZAwCBdQSyI
	oWag7g6y5cbJe/ntcNw3lN6vKrs7Cbx5vg==
X-Google-Smtp-Source: ABdhPJw/TQbiMa4Eg5lDxa/drqALEhbXxLWNBP7XuU/ioxq8Pc9jarzrjLnitZE4dDxydQjbtsesuw==
X-Received: by 2002:a1c:c309:: with SMTP id t9mr5705758wmf.161.1621543755249;
        Thu, 20 May 2021 13:49:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c394:d896:3913:6568])
        by smtp.gmail.com with ESMTPSA id n189sm3768061wme.9.2021.05.20.13.49.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 13:49:14 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott] [PATCH 21/28] ghostscript: Exclude CVE-2013-6629 from cve-check
Date: Thu, 20 May 2021 21:48:55 +0100
Message-Id: <20210520204902.2527687-21-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
References: <20210520204902.2527687-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CVE is in the jpeg sources included with ghostscript. We use our own
external jpeg library so this doesn't affect us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
index cbf60c8c855..35826c25498 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
@@ -19,6 +19,10 @@ DEPENDS_class-native = "libpng-native"
 UPSTREAM_CHECK_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
+# As of ghostscript 9.54.0 the jpeg issue in the CVE is present in the gs jpeg sources
+# however we use an external jpeg which doesn't have the issue.
+CVE_CHECK_WHITELIST += "CVE-2013-6629"
+
 def gs_verdir(v):
     return "".join(v.split("."))
 
-- 
2.30.2

