Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.25448.1591983229676256109
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 205so9760870qkg.3
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=h6ri5p1p7Z96oIXcjL8kcGiOwAjPNcAm5wJdGPhKmhg=;
        b=saUxcuVRX2dSlYR9q2ZEofWdRniH7M3vv4TE5Qy1aCkVhfFSz3I5qR0WIVZqN/SOfi
         RhNA3GM9l/gLesqL66DEhgMQgersEyBvAJpuw2N83RsdCSOVui5R1tdj3Jp6qXx13/md
         1U16VkAOxCy8qcgaipsCjiOAMnDV3Vg53TFPAaHqHx5pgCcjvkiuRjJ1fHT1dl0D39po
         yNvSxFfSHpjdbL2+XHcs787qf72Ur5AwPrYvX1eHcsStSQ9tHd3VDMaeW63Gdia3Xrvz
         lXUNUxqctUq/pjZC8xcOosm37W4Zh0xe+EwpqTNHnCehwMbQ3uEm/mSFQ8ZBJNT2/AR3
         eDkA==
X-Gm-Message-State: AOAM533OEvBoPLLI0m2qhz8FApHF4E48nNPaWnS23NWRGoZ4312flpyq
	4N3mfX6uFc5i0Xdf3MyxoCXap5ZhkQg=
X-Google-Smtp-Source: ABdhPJzkKQZfCfN7KksmFmvs1dgp+Ij/hiicvmAq1+Ic39pH6hZR8yG4MRd/Uwej3QobQGKcDfisJw==
X-Received: by 2002:a37:845:: with SMTP id 66mr4097495qki.67.1591983228571;
        Fri, 12 Jun 2020 10:33:48 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id w10sm5481672qtc.15.2020.06.12.10.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:33:47 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio.salvador@gmail.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell-backport PATCH 7/9] go-dep: Avoid use of 'go mod' support
Date: Fri, 12 Jun 2020 14:33:16 -0300
Message-Id: <20200612173318.103232-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612173318.103232-1-otavio@ossystems.com.br>
References: <20200612173318.103232-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: Otavio Salvador <otavio.salvador@gmail.com>

dep utility must not use 'go mod' support, so we explicitly disable it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b34000ae3dd6e0a1d7fc332efb35c5da84cf2275)
---

 meta/recipes-devtools/go/go-dep_0.5.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/go/go-dep_0.5.4.bb b/meta/recipes-devtools/go/go-dep_0.5.4.bb
index 615cb289e5..496224a5cf 100644
--- a/meta/recipes-devtools/go/go-dep_0.5.4.bb
+++ b/meta/recipes-devtools/go/go-dep_0.5.4.bb
@@ -13,6 +13,10 @@ SRCREV = "1f7c19e5f52f49ffb9f956f64c010be14683468b"
 
 inherit go
 
+# New Go versions has Go modules support enabled by default and cause the Glide
+# tool build to fail.
+export GO111MODULE = "off"
+
 GO_INSTALL = "${GO_IMPORT}/cmd/dep"
 
 RDEPENDS_${PN}-dev += "bash"
-- 
2.27.0

