Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.5882.1609856701880326748
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 06:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fvDt5Ruc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id x18so16448516pln.6
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 06:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4eHskIyo3b5haq4swgkLOlRTNr26kXlrjClY4bNSUIc=;
        b=fvDt5Rucv1SbmCuP5hbHX5qtioBahByecZaOQnj4mXRCucbPoE3s3hiT2LYGprQN8K
         nz5DV+m7wH2yichF3HJIKC5wtnb0x/yZDeymHHlIDYnUVbiGynOBUD/cHPdIH+6JQ40G
         huQlfOX1CSwVsQ5jxKmYS2b6zjaXa9dYwcVLjsEvvQ6xguQFvqUSJCHTNl536SfP2W/W
         nBuLkmiyq+PXic5iTeV5qsbX0c1cYJEF59qJ3gVGRYRTjQMAZzp7+mF/GA8kxqrX9IeB
         9k5aw/Npx9RtIlMXOIV2VUcjbeDMtOv4+Xloz7B+agC7uGukmxk1s+AcicbLtPNqHAli
         CRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4eHskIyo3b5haq4swgkLOlRTNr26kXlrjClY4bNSUIc=;
        b=ba8kLxWny+uKXkI4pcw18hXfNose3pWwHc6Ns0ftCeLQR9cwULiO1d0suIl3fFcc4+
         ubBw0BE5bs0o0FrTBrQVaEYMovxzppFQ/kREa00l0Miqcku8U+dIrojTyZrj4matyyt4
         o7KY6QP4T6jj26xa4LQ6BrERTdo1fR+q5/zNN/T5lNASKHDj9TTHFvRi9tpQmpP1q1cr
         eElQfCWflHljXIIHHWd1WQKnoxQFazcXhRyTNHM31OHeRAUWt9X5cHrZ/0B2Ar7dtVOU
         zANEgOAikzDTcAdL26vQ6w4Sh2PNB54x2JcYHY5sLUfc4rhkgIS0aomI0uwYAM6MM2ke
         lLgQ==
X-Gm-Message-State: AOAM530kPbEqQJFOV8KD4x52tfRjVelE8umNVpB6rWcPI6IFGK4lgOI2
	ey78SeXIiGCeyLoMT6as6CW4Mc7y/wKtzLjQKRc=
X-Google-Smtp-Source: ABdhPJzDNM/1buRaNcq8hJa/PeyyfzJ9ESR2Aym0zKagvoCe37rzdibG5fHLex1QavRVVPEsBOLOOw==
X-Received: by 2002:a17:90b:68b:: with SMTP id m11mr4311290pjz.208.1609856701072;
        Tue, 05 Jan 2021 06:25:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i130sm57552465pfe.94.2021.01.05.06.24.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 06:25:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/30] grub-efi-cfg: exclude OVERRIDES from build_efi_cfg vardeps
Date: Tue,  5 Jan 2021 04:23:35 -1000
Message-Id: <938dc131956bbc508c813c0a4fa0ff4791dc6cc6.1609856435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609856435.git.steve@sakoman.com>
References: <cover.1609856435.git.steve@sakoman.com>

From: Christopher Larson <chris_larson@mentor.com>

This function is primarily *appending* configuration entries to the
overrides, it only gets it to ensure it's set at all, so doesn't belong
in the vardeps. Having a dependency on OVERRIDES means you cannot use a
bbclass like distrooverrides without changing the signatures of recipes
using this class.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8fad5db8c3275a0dc9fdb37761f2e9381e1413da)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/grub-efi-cfg.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/grub-efi-cfg.bbclass b/meta/classes/grub-efi-cfg.bbclass
index 3a2cdd698b..ea21b3de3d 100644
--- a/meta/classes/grub-efi-cfg.bbclass
+++ b/meta/classes/grub-efi-cfg.bbclass
@@ -120,3 +120,4 @@ python build_efi_cfg() {
 
     cfgfile.close()
 }
+build_efi_cfg[vardepsexclude] += "OVERRIDES"
-- 
2.17.1

