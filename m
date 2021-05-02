Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.23229.1619978073533542242
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 10:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PeWnSWyM;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id l2so3235534wrm.9
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 10:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CcnIEKg/wCdP+cELOQr29xtM5f58xkveOqpURfkCPfI=;
        b=PeWnSWyM4YAO++oTEMORVmIN2r1xUrbO2L6NyM+4ldxKZlhAFqKntLXB37VyK8/gCr
         ZvZZbLhVM2t8WiOMkd8GwomOGnvGizHXNy575zFrF2yBT6Bq8yzRJbZ+xXgLGEXnaWWP
         x8AKphlGPFn6zXHnPyBlu3ks6LFvkEzmM1CVBwp4XqXsEAqKGrMfnRYf2ePpvW4UE+YR
         mLdq8Mwu7mrSNszGsGbJG39njFKCJoZgbzvTFmndlXblQag4MjFjPKTYXi5X2AVaS7tG
         GdQaU8ECbAo1oT4r7qwkVpJ9tdl0Qs7zmFJpBIBMriR1+trg9KnXEgEB4pJ1ILl1yLIE
         X+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CcnIEKg/wCdP+cELOQr29xtM5f58xkveOqpURfkCPfI=;
        b=A9NTKU6SjlyCGeRpdROY8qBcwqg3FM8wypUj80ixgr6uck1/NxaUY43701WDBgeiot
         fWK2cFYQVCXbwq3IiqZKDGO537+GfpcIUoutcPD4cpDClUjucbtC1pzhxIguhRE4GFte
         mzh4BVlpPSt0dNQsaniHrh8qYnsV+caGZHRUiLybiLp8IOLtBvKiEp+cfZlsJP90dT9J
         wkqw8Ws1+Mjss2cZUybVgnFmef3G1YzDUF3OWJdFUBm991zIG4icxoiyBiMvCgjd1xlR
         Wyk4WBw0uAugpGP0HZsJtdQf2mmua22nxuCdgNYneeRQAIwt+WQuDc43ucvmE3/L4dmU
         3uQA==
X-Gm-Message-State: AOAM531QOq5E+CCaayj9T0w0imNRvqL6MX3878fuYhSovllguVAMPs6U
	uWNdwQbkqATOGUePIu/bTyTL48Oj1J+35Q==
X-Google-Smtp-Source: ABdhPJzoX9U3A4C1ypW1sMag+yf0tatwBMSLGoh09hxLQ4Qd7524Q55wq4hp357SzjUrWk1qIuR5+A==
X-Received: by 2002:adf:f5c6:: with SMTP id k6mr21044013wrp.338.1619978071783;
        Sun, 02 May 2021 10:54:31 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id e38sm17315166wmp.21.2021.05.02.10.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 10:54:31 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 1/3] ptest-runner: libgcc must be installed for pthread_cancel to work
Date: Sun,  2 May 2021 18:54:39 +0100
Message-Id: <20210502175441.368688-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found on runqemu core-image-minimal with gstreamer ptest-runner

STOP: ptest-runner
libgcc_s.so.1 must be installed for pthread_cancel to work
Aborted

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
index 57a3ae005b..fe6ef2a43f 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
@@ -26,3 +26,5 @@ do_compile () {
 do_install () {
 	install -D -m 0755 ${S}/ptest-runner ${D}${bindir}/ptest-runner
 }
+
+RDEPENDS_${PN} += "libgcc"
-- 
2.31.1

