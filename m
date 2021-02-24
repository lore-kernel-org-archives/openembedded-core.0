Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.6178.1614170559059791172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 04:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Daqwi43f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id 7so1768588wrz.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 04:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DvYD/LYScuVRlx9Ane7Mvd0rROGFusdtxPFM/zJyHu8=;
        b=Daqwi43fb+8yE8AKsgIBCbWISlr4nyg3HrqTLIm4thGJevvtAIJPG8LkscPLRNVMf7
         NNwZKgKMoWlIUv5c+BPRTpePO535JWF+Vj4vdH53V4S2A4RcvyQNo8siC7g+ZbcQWrjb
         TO0u4sMZpL2muRxzVOG/ZB0daNMNOZVR+/DYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DvYD/LYScuVRlx9Ane7Mvd0rROGFusdtxPFM/zJyHu8=;
        b=S9w+YrduDjv5rwAWJx8vBV70Wbaj5dejSVr02AU+IwsRmRRXjDZG+QxMVV+Ns+71Bd
         hJ8/tz0FWTJ3wh0TVrMGDflfW4YF5ZdA0OCj0XdNoISCnO02eh7wX/f8noDbwk67tbQM
         yDtCU1pcwp0druPEjpnUWxy/XyIfOHr40C+448rdK7q0xy96chWNN7ewsrRGMxEwpWRl
         b8caRb5DwT/RvZwAJ/QKOnKs/ApbMyADASQee0iz3v93zUHROr9PfOoi336csuZOeS+E
         nfHXFblyNTIjvxYbriVFCe54d+3XmSneVP/SYtYJjcwXmBPbaAz67HRLwoZqGOsUprMi
         3VLw==
X-Gm-Message-State: AOAM5316kXdCaG7/0CsOQoRUWgFzQbizZMoxhRlHp2FicyhB7aLLamCe
	0C6Ko16AYT0iwKpsh2OrN2Nj8etlwx8QVA==
X-Google-Smtp-Source: ABdhPJxPQFSLc4DB9VSsUWALpabYVTPAeGN8ThlxPDMumqGK7+cGxsbs9oVsvmzM2iQqKCr5Z9I/FA==
X-Received: by 2002:a5d:6c66:: with SMTP id r6mr8246570wrz.407.1614170557187;
        Wed, 24 Feb 2021 04:42:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4476:47d0:b128:f21a])
        by smtp.gmail.com with ESMTPSA id z2sm2794883wml.30.2021.02.24.04.42.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 04:42:36 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] diffoscope: Ensure rpm is configured correctly
Date: Wed, 24 Feb 2021 12:42:36 +0000
Message-Id: <20210224124236.3828484-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

diffoscope was failing as rpm wasn't configured correctly. Fix this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/diffoscope/diffoscope_167.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/diffoscope/diffoscope_167.bb b/meta/recipes-support/diffoscope/diffoscope_167.bb
index af9682e0a82..74cd8090719 100644
--- a/meta/recipes-support/diffoscope/diffoscope_167.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_167.bb
@@ -15,7 +15,10 @@ RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c python3-magi
 COMPATIBLE_HOST_libc-musl = 'null'
 
 do_install_append_class-native() {
-	create_wrapper ${D}${bindir}/diffoscope MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc
+	create_wrapper ${D}${bindir}/diffoscope \
+		MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
+		RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
+		RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE}
 }
 
 BBCLASSEXTEND = "native"
-- 
2.27.0

