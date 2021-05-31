Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.47508.1622484974113114436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 11:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GhzBBxGL;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id g18so9552273pfr.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UCSZpi34ZzWPvcTasBa3u78SxzrIKmvKaNeEWndgWsE=;
        b=GhzBBxGLs4vwYYddJ2nn1WWXoRdLSjTAHzDFvC3/fhLfVIjkydO1zc72N6Mg71YJzm
         Y6/Ys6yNe2nk51VUjYrX26uxmJZ7zJBPPeyvjcHgsYm3OnbnBtHogjmFZ0Huno3MqR1a
         WHhse103qyv2sjLx2ejrLzxxIlA/M2+WjDDSACvITKX4WbUeZmurJWhP4veFNZbehDhR
         jKMoPXwy+64ASFjF/u9IxChnv7ia4jfWq5LXcnAXCSiTKP5MV9nvskHpzYPMTVEijMkp
         Sa24qcDbEj77SCvsiWA/6TKj2Dwm1mKX5kTku1jxCEUPgwskBU+OrsUTRNqwwJ7WlPD/
         xW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UCSZpi34ZzWPvcTasBa3u78SxzrIKmvKaNeEWndgWsE=;
        b=aC4TAf2IwWS6ZLaCaUIZiAClbbin3wiNx6Cnl8Rx0wFzNSW1fgFsQycEGEJyl/48j1
         5+l5x/BMQ+wQ+xZCWx/0aLBwHqIIUQSQwBv2M5pRPF6jfqOHpjl3bBG4a8fFYzWObqe5
         o+cjhAxI+e1PIjx3weq/IJGADFWwAcFdnbYXiX+4DZKwtZs22L0cO2NFAIb3VKFFpQ2p
         EyYyLhfqxWPb+QwEjJ66Wm63ocgykhMSkk7IFMQt7G4QbPfvM2bHxcbx519I/6skgcx7
         plC/fOMX2eLcgG3+g6nWHWqDrP6s+K5JbZT5RX5mzB7BhSbUQtyVSsTu+ejj3JgkkZXi
         onvg==
X-Gm-Message-State: AOAM53032vIA9szw9WVlSYPwySEv8ZGO90wMRLTijHkYXXMtG5fcmPB2
	6Lmu098WIKl//C82f1J0mEFuoskpVqw16A==
X-Google-Smtp-Source: ABdhPJw00d/ceSZ2w3lLYfRmRmf4lpV2w8XdkJO5UDQaopJAcZslZq3InqirkvjlvlNFwhAHSq/u+A==
X-Received: by 2002:a05:6a00:1705:b029:2e7:60df:7413 with SMTP id h5-20020a056a001705b02902e760df7413mr17746045pfc.48.1622484973484;
        Mon, 31 May 2021 11:16:13 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from kona.dnls.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id 4sm103876pji.14.2021.05.31.11.16.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 11:16:13 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [v2][PATCH 3/3] kernel-features: add ima kfrag selection
Date: Mon, 31 May 2021 18:16:09 +0000
Message-Id: <20210531181609.963494-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210531181609.963494-1-akuster808@gmail.com>
References: <20210531181609.963494-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel-features.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel-features.bbclass b/meta/classes/kernel-features.bbclass
index 5735edbd7d..2531b42d59 100644
--- a/meta/classes/kernel-features.bbclass
+++ b/meta/classes/kernel-features.bbclass
@@ -11,3 +11,7 @@ KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "apparmor", "
 KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "smack", " features/smack/smack.scc", "" ,d)}"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "dm-verity", " features/device-mapper/dm-verity.scc", "" ,d)}"
 KERNEL_FEATURES_append = " ${@bb.utils.contains_any("MACHINE_FEATURES", "tpm tpm2", " features/tpm/tpm.scc","", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ima", " features/ima/ima.scc", "" ,d)}"
+
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "modsign", " features/ima/modsign.scc", "", d)}"
+
-- 
2.25.1

