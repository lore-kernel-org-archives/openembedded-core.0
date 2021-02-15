Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.738.1613432358453443854
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 15:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RBKGKnHm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id v14so11023220wro.7
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 15:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EMMR57ZsKIj7DM8CdAulvZp5UGAJYT1DmtwBnr+H2sM=;
        b=RBKGKnHmPrMomLpReDMAPH+mOotiooVT2Bp/uI8QxjNUPes2vqqmxynGwlzMZpkBAS
         pQKDjPs/AyCBhvDdSldwWJhLO2OWiO4UE376o2f6w1k8N6LoIZrh5cjYH3AzzANx58my
         X5d/p3tNUW0FzP6VhqcE8wdPuRByMHjjlkyoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EMMR57ZsKIj7DM8CdAulvZp5UGAJYT1DmtwBnr+H2sM=;
        b=FuonqN1nkeXqpkFGhYU5zoRlqZrHIB9CMwtc+mpWfbLy7SmOEPwjR6Txr7xuTmLb82
         pcnPzAQ9CrjdpDSiHGjwt2KmhGp3XuFrdBClgKJl4lnG7EQyeFK4onvTD9NORkAft+ik
         NAg6x/nvCx4VyJl1obLUSqYCpeyyJ/CSPpfXcpEAQ7XoCsVedTjV5vBOPNQwPS6VNpC8
         ivTfBBFzLQ+fjXHrcYPMRhaTCxWcbby9SYtHnK2Ei7IUnwNsDtwz4ymOoYfpR1Vr4Mhl
         eoZbG2J4e1A6+2EANY0AliBEwWk6wXK4+GAt2nAoOqdwnHZNjRSJw12VVj78NQ/4xbFn
         MORQ==
X-Gm-Message-State: AOAM53272/hEl6OXBTXHxEi87L62b3k6/LwCN/JmQCE617XFxa6VHk84
	yNCQzg6wi8Ddne27hiIKXLr4tbThxzXYUA==
X-Google-Smtp-Source: ABdhPJx5qIeH4WdjoGF8PMR8fmtQ7yBIm9zcVEqQSxt3XdTTzHy2Ov8cj7Ri728yomvS3marwiy92Q==
X-Received: by 2002:adf:b60e:: with SMTP id f14mr21087152wre.99.1613432356761;
        Mon, 15 Feb 2021 15:39:16 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id i1sm919125wmq.12.2021.02.15.15.39.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 15:39:16 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] watchdog: Fix determinism issue from sendmail host path
Date: Mon, 15 Feb 2021 23:39:13 +0000
Message-Id: <20210215233915.2007777-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build was injecting the path of the host's sendmail binary. Set
this deterministically to match OE's path for it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/watchdog/watchdog_5.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.16.bb b/meta/recipes-extended/watchdog/watchdog_5.16.bb
index 1988952603d..24a05dcda71 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.16.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.16.bb
@@ -28,6 +28,7 @@ CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += "-ltirpc"
 
 EXTRA_OECONF += " --disable-nfs "
+CACHED_CONFIGUREVARS += "ac_cv_path_PATH_SENDMAIL=${sbindir}/sendmail"
 
 INITSCRIPT_PACKAGES = "${PN} ${PN}-keepalive"
 
-- 
2.27.0

