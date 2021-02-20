Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.10775.1613848168734834402
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 11:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kyF0H39y;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id cx11so3571603pjb.4
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Feb 2021 11:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lc0TrWHzW/Z64hGMwBHwT+ZCAitcJmvAzKOBIH/OF4k=;
        b=kyF0H39yyzEfY3yVdOoCytpjG1OsKC03yDhmagX7rS49L/QKvHvwWFPWgKkTpY4gjx
         XRMYYhPV+ur9a85CvX5IqhrjrS4aS2GIAlGADezwYqbeJI9mrkdDHQNAwgK0uIhpxDoM
         5GmvJr+fUkC1wmbLTuH4sTyjR8WNPaBqhR6aEh7Qz7HiMErpiE3d/w3B/0W31T+UBHhX
         O60kOpfiPwz3x0doUbcoIN7fTaCr4/T0US2ewcAL7WBGEMowiLLIFMMk5eH6iu+FfxL1
         fSfMrFx3Iow7r3xl1d1iwnKtE9SFAHRzlOUDG+x6ocKNV1lKTBnBmELGJ1W4mTF90Mrc
         YSFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lc0TrWHzW/Z64hGMwBHwT+ZCAitcJmvAzKOBIH/OF4k=;
        b=W/Uz8elKQxw+DVYiik/cytAENSdPdctH7vgnsK7A26F2KOCUAt5e9Jk3l2s9EMf0Vg
         3Ti/xmreuyT6SBteeDYgtWW8Jl/EAyMCztlfYEozMTizwqVi+ZzS+dYFy4/GqPRk7ys4
         sKwUbwAzqZSufJgz2MqdFNI2kfzLHsjeRYQXTw/i1QRTSs9io52xmXkp+/rG8VQwWye/
         Qe4DYfSG+O+Z6RnCI7YNr2rX3O6LCmMv1vjCNQmjmk6NY4uenkbGs78LnTV3txFRMLLr
         O9CD9lslDB4vGypLuaAfhiapS4EaZdGTYFqZLxPEBchQTZf1L8Kz/4NhuS4/DUhi+5PI
         O0iw==
X-Gm-Message-State: AOAM530ma8g7t/VeFDM+P2DHQuy5FS6LcnrF8Zqsi/H8aAbA0DTb1gCo
	i0vcH7v+hiZmKYsuC3alvChmYBILI1H6mw==
X-Google-Smtp-Source: ABdhPJw1b8fsYDOoMGAbqxxLltBa6hsoVeluRmmQQJ1Xk7/SYijLcgIXrBa5sNENYG/T1jA1QXvUcQ==
X-Received: by 2002:a17:90a:4589:: with SMTP id v9mr14662777pjg.113.1613848168094;
        Sat, 20 Feb 2021 11:09:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::54b4])
        by smtp.gmail.com with ESMTPSA id x190sm13632307pfx.60.2021.02.20.11.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 11:09:27 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/4] linuxloader: Deal with little-endian ppc64 ldso name
Date: Sat, 20 Feb 2021 11:09:22 -0800
Message-Id: <20210220190924.3153040-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220190924.3153040-1-raj.khem@gmail.com>
References: <20210220190924.3153040-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On ppc64le 'le' should be appended to ldso name

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/linuxloader.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index b161c51a50..30925ac87d 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -9,8 +9,8 @@ def get_musl_loader_arch(d):
         ldso_arch = "mips${ABIEXTENSION}${MIPSPKGSFX_BYTE}${MIPSPKGSFX_R6}${MIPSPKGSFX_ENDIAN}${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}"
     elif targetarch == "powerpc":
         ldso_arch = "powerpc${@['', '-sf'][d.getVar('TARGET_FPU') == 'soft']}"
-    elif targetarch == "powerpc64":
-        ldso_arch = "powerpc64"
+    elif targetarch.startswith("powerpc64"):
+        ldso_arch = "powerpc64${@bb.utils.contains('TUNE_FEATURES', 'bigendian', '', 'le', d)}"
     elif targetarch == "x86_64":
         ldso_arch = "x86_64"
     elif re.search("i.86", targetarch):
-- 
2.30.1

