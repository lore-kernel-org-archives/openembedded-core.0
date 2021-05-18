Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.7283.1621338632083148320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 May 2021 04:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A+DHWAwZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id x8so9870563wrq.9
        for <openembedded-core@lists.openembedded.org>; Tue, 18 May 2021 04:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ejj0Oi41LBnlKV0qVRbVANFdkVP8HUUODN9wvu7ige4=;
        b=A+DHWAwZPSE41FsSNQLWhnP0jMzm9Ubzb4EjidTeNaUyokprcXpjVgMGDpTlrRZQaY
         hvDNKY/BN/EV72EmWSucovESag8BXJjdMnHjIQ7LAo8fgPKyEBbzwEq2kZ8TQrlXvjL8
         8JmHEl4rqmuytNoVmOEyKQMCVRreflImCkz5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ejj0Oi41LBnlKV0qVRbVANFdkVP8HUUODN9wvu7ige4=;
        b=qmAVqS+sxrErGPW86YFYNFt+kJObBWZz749yBUyTc3QGz70hvIkt4aujYkQMsbnZqP
         FKArecZQfDadWFq3OIFxUQNyy6KksJmfJCwG6LEJKEQNTHg6ZhIl5AW28DD16b3NrBep
         ZED3V7BlHu8BfYdxnlOm+TVXxaLN/WUuHJLpyeaoH8L6n3BFvjBNq4EANbJjvojGmn5l
         9E2vPzQ50X/j96Egvy028r38ddjxOLmiGrg/9Z7hjRVs49VN0tBLBqP3XwMz32xO8Yvk
         VzsSyRO5fRjFtyrpn/FyckoTDa6BtrCPr9LqbaqAcb3xp2POFvGcyC0ouY5PmYU0W2iM
         Laqw==
X-Gm-Message-State: AOAM531IX3jbp5sDYkpaPlgyzcSAOdR0YEs0icXVFllLICc1FWaYtACf
	E+tXy7cYP44ckkoeAzQ4J759bAkEEYDFJg==
X-Google-Smtp-Source: ABdhPJwi0HgY2dnilTwKSYwraagX4+gIEfH44WI82ArQnaOIdTGVh8RRmObo4xQHdjb+NYjSDjHIgA==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr6493863wrw.131.1621338630397;
        Tue, 18 May 2021 04:50:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c468:ba30:74bf:a356])
        by smtp.gmail.com with ESMTPSA id n16sm2285614wmq.14.2021.05.18.04.50.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 04:50:30 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "cml1.bbclass: Return sorted list of cfg files"
Date: Tue, 18 May 2021 12:50:29 +0100
Message-Id: <20210518115029.2460636-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit dee41e92f0efac7e453597bed4b4c02f867e3aa9.

This patch breaks cases where some config files make changes to earlier ones,
ordering is important. The reproducibility issue in busybox was elsewhere.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 1c3d70b48d8..d319d66ab22 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -6,7 +6,7 @@ def find_cfgs(d):
         if s.endswith('.cfg'):
             sources_list.append(s)
 
-    return sorted(sources_list)
+    return sources_list
 
 cml1_do_configure() {
 	set -e
-- 
2.30.2

