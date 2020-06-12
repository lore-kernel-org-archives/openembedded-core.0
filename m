Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.25376.1591983226035578194
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:33:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id k22so7723675qtm.6
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=TQBKx3rof1sEGYe0wAmy8nLZYXlWHS3050+IS9TY1eM=;
        b=bD68CczQNV6/Rz5gBAPt+N59pkxL0ZfTQVhU7eFq/nMANjRUPunrOiLJriMMgDlgiB
         eStsmtnvGFBljyC+un+bQIrgrrlzr2JM3WNUF+er3YvBsJA8F+oa10+u/S/78py0KXLx
         Sgm794HFmtDt3lhauroQvfwEy4c/N/uag1dBAjaIjCMBRHcmeV0WEYdwNMApN0bOP/GY
         zhQF5r3uU9ArBCIj9gpf/StyOsOvwvfg9ZzEIj7g38IZw7aRO+gjksRlyAuUmSF36dpH
         mfjvsVMOcJOy9kRGaOogAE0Rw1hu7YeaFxqbGAhCOMUxMfx6fx2JbhLfCIzI1ZNbD1bl
         XGOQ==
X-Gm-Message-State: AOAM5330CuimBLm4lmRrjx2MA67H8F97jG7ZJcCQVmdsckpaV1cSZJyy
	ovxfKkdWWgW9wvZ4JXPLv23/Bl1QUSY=
X-Google-Smtp-Source: ABdhPJzhFe+Pq6sOqYvD0RXfXPRNeiTvEMsTCOtG46fSvArTwVwMDIt4zRozT69nQ9Ec705hUAmBVA==
X-Received: by 2002:ac8:2dea:: with SMTP id q39mr4277025qta.2.1591983224736;
        Fri, 12 Jun 2020 10:33:44 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id u10sm5427811qth.32.2020.06.12.10.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:33:44 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell-backport PATCH 6/9] glide: Avoid use of 'go mod' support
Date: Fri, 12 Jun 2020 14:33:15 -0300
Message-Id: <20200612173318.103232-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612173318.103232-1-otavio@ossystems.com.br>
References: <20200612173318.103232-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

Glide utility must not use 'go mod' support, so we explicitly disable
it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b5a4369ba606677285b0a89a78c040b38f57767f)
---

 meta/recipes-devtools/glide/glide_0.13.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/glide/glide_0.13.3.bb b/meta/recipes-devtools/glide/glide_0.13.3.bb
index ebad0ec60a..31295edf90 100644
--- a/meta/recipes-devtools/glide/glide_0.13.3.bb
+++ b/meta/recipes-devtools/glide/glide_0.13.3.bb
@@ -9,6 +9,10 @@ SRCREV = "8ed5b9292379d86c39592a7e6a58eb9c903877cf"
 
 inherit go
 
+# New Go versions has Go modules support enabled by default and cause the Glide
+# tool build to fail.
+export GO111MODULE = "off"
+
 RDEPENDS_${PN}-dev += "bash"
 RDEPENDS_${PN}-ptest += "bash"
 
-- 
2.27.0

