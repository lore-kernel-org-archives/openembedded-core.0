Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE82D5AE7B
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:02:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3007.1765620121548701272
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LbzDC8js;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-299d40b0845so29334815ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620121; x=1766224921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zi8AX0obZedfX/IUsvOsHttUN4wDgmzAgedMbUjBU7M=;
        b=LbzDC8js9782EzcMYQhP4fR71NTEKmKEJUQCymJVhuKalMPoHopEQkRzDrQhScLM0T
         lZ/aDkjkygDgFe+oc5fiROBfw6Ro+tqXIgaGpIKA/6DVY0wBK9lw9RztMswD2Ubx2Djw
         c2TvSsr1QKBFRQ/HfBWq5W0K8mIM84jqQjtRU0DIBGd90Iw6oYSnAYXa+tpUjCSelOxK
         De2DguceKnmxoiwmyaNqznbHjbXrXUpxm3XzylE0luwn/iRRjtV6hptfPNhQxnLcrSgF
         z87zKkc0+DrAjU1AY4iDKV1v17KXdXm5kMHukjxQGFeJEEHqX9amIZrbihRQQZd7gduY
         PW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620121; x=1766224921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zi8AX0obZedfX/IUsvOsHttUN4wDgmzAgedMbUjBU7M=;
        b=r+6Mv9/jq3/6wf4NY4U2b0dsCx3n9pmuu7sTlxhugfCYwjey8/kl7JVZ/3sM/3yyFT
         9aAtF5ZfVDQ9pOMc9LBM2u7BVFDCDBQrsZC3XoRoMHj6U+Y1qO/molWxsu11SQUL3urv
         Fa/vt8iP2vr0Ci/GVMdocodDOuTFQlbLE3A3AzKXD+S3k19oNmj55pxa+Au3IfhK72Km
         mLBm1QZrhdl/g2jLh5slBVQiyXi2Pa2t9AOiIioYod27f9hu0IAAJxPA8oRw7qt8DWTd
         LqdqrDbBL0fUZ7lW/EEg5lSjxuu5qx9AF0yK8yfvBGWayTxshlpNozafK6kXAYHu+/TQ
         PvhQ==
X-Gm-Message-State: AOJu0YztloHimyos2QCP/1339YhK6Dk1fUC8GetBwxyq1mcCcZmP1GbI
	WsemG7vofLvfoKxKb9ljJGLzbEu2eCp+Q0xmFpfl+cLRVIfw0IrkpiXNhruxBmzd
X-Gm-Gg: AY/fxX6HUi9Bsjs0d9cfqAXtaWljG1c6Ba4pO9Qowxh1hBvxHBV43ePiQvbxDkHbxwl
	i2Y7RG1eK6fI+RH7bNUt5hVaH5hcjPyexY94XKd4CrMfZMxF2jIm+imdPJ1kltzEVeYvEZ1ciir
	WvsKa6CxPjmpTudmZQrbeJU5uNPFB4HzdsH8d9fPBXo7DtZUqcE8eb5lIpcu+4jrOUplrORPg73
	70/9kWo3gY9Ah+kmr+jOybDUdULtn/ZwoqG63V+ldxJ9vN83Cjh73Z+5gwQlU4zRtMDAeEk2MIE
	wXEpR9geBx2fWVN8+wPOcGNS8VGOMJPzuEwUHbTU2tS/g5QXs4JPQi20IBznus4DK+n/1ApoD9L
	FzahU8FG2jgcqPzHEyeTD+kNXESLkmzAVcZtBnRfJfnLlYsp6I+E7tMc6UQhyggcoGN+Wtya/cJ
	glTnbSCanTd6qSDOoraCy5Dr4w
X-Google-Smtp-Source: AGHT+IFpTzQKD7naPEOz/Yz0D16oK9VfAUJlVr/CmFcj0ENjLeydU2V27Dw469Jrt1fgsciOtLp7qQ==
X-Received: by 2002:a17:903:3b8b:b0:24c:c8e7:60b5 with SMTP id d9443c01a7336-29f23b31e58mr53287475ad.16.1765620120796;
        Sat, 13 Dec 2025 02:02:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:02:00 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 51/67] ccache: 4.12.1 -> 4.12.2
Date: Sat, 13 Dec 2025 15:29:15 +0530
Message-ID: <20251213095931.2571498-51-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:02:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227669

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c422df7d511fe76e7662968ab52eb26a72d55fea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.1.bb b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.2.bb
index 2d0b83e244..28f36e5ed7 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
+SRC_URI[sha256sum] = "2a087efb66b62d4c66d4eb276748bbfa797ff3bde20adf44c53e5a8b9f3679af"
 
 inherit cmake github-releases
 

