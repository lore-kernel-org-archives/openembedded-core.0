Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.8719.1614344480350634005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R8UK6/Fd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id d11so8496998wrj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6Ye9WIh6JPg5z6JEfbZPd7nRaUzTHdc6aOxpAzON79g=;
        b=R8UK6/FdaEzK8VSbYtdWqk8StMSMK4CWUBEDQGMgVDvWpMa09RUjhqF2dVse8tdTyN
         NmHn81UwVtQQ9wihS5RDIpST6FYX4L6dFnjO7f9fYS3BlhpPlP83QrTrQrKcaZr8mGo0
         O477nVLcnVxNYuRC9S+ZcufutJrlHq2PD4KfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Ye9WIh6JPg5z6JEfbZPd7nRaUzTHdc6aOxpAzON79g=;
        b=ThkR9N8YHh/oQ2Y2uJ9d6+dARHWyUVg1OMz98ZuckJJME0gPWJUyjzGNDVlHz3r2/+
         Yf5GqgzCkyzOMUpnNf6RHIsZKToYvq/viq+khHI9WCl/I9ymt2owajxQhLgQK/3hLW08
         oSd7i1aVmesllG1a+RTmWOeffvv+0zwf+LwoedKjucHXVRv8nswSY/Td69MZHcUW2sjl
         SjLxSSYdFPcq2ZH7hjfhMqB66ptUq03ceP74S8PJj//+XaQSDBBkwTS1ctbz2ejPq6T2
         3PZLcXsA7az2GI+KKzEsN/yx0UJTyZr0UvoR3OAoxri99L0/Phdvh+pooQWVvXJ/bInm
         M9+Q==
X-Gm-Message-State: AOAM530dSeLtRLvdd0r2/NysmcqTkaKUTF4kc+mFRo7Zm/G8PKT+PFm8
	BM6Z/NXHC2hgwjGBeY4NLddCETOEgdUpUQ==
X-Google-Smtp-Source: ABdhPJz7e/4OGhhF4yK9edOX+kO/DNqMGMUihAgPc5nX0AWX0iYlbsuV2BBx7BEOAS74VU+5jH80RQ==
X-Received: by 2002:a5d:67cd:: with SMTP id n13mr3097619wrw.96.1614344475711;
        Fri, 26 Feb 2021 05:01:15 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:15 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/13] bitbake.conf/image: Move image specific PSEUDO_IGNORE_PATHS to image class
Date: Fri, 26 Feb 2021 13:01:05 +0000
Message-Id: <20210226130106.3925837-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This path is image specific so we can move to the image class
definition of PSEUDO_IGNORE_PATHS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index e7d46f037db..85f4d6258a1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -180,7 +180,7 @@ IMAGE_LOCALES_ARCHIVE ?= '1'
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
-PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept-scripts,${WORKDIR}/oe-rootfs-repo"
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept-scripts,${WORKDIR}/oe-rootfs-repo,${WORKDIR}/sstate-build-image_complete"
 
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
-- 
2.27.0

