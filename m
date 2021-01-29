Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.7908.1611915865629587128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 02:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b6+m4Rrb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f50.google.com with SMTP id l9so12229937ejx.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OJb15PV+2RwMHpbv+ZNiXmg85tL8UpKVPewtEVGCtY8=;
        b=b6+m4RrbxzoHGzDnLS//fnJxKvjfgvARcBUZq22lIJPBaDQAE7Q+I+kxT5XGFR57MZ
         qEmI1TVaUZyBuDMlKeAGwuurXCqAJdK66ZjiyoH/GQk62raEXU+gOmD7Sx/RClC1pTeS
         Rth44IPnIhMbXIPk3AW6EHl86/HeA9lU3ah5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJb15PV+2RwMHpbv+ZNiXmg85tL8UpKVPewtEVGCtY8=;
        b=Rr3mM4vu648DNApKwPgNalvN6sg0yREFOxdmTeZ9FESjtVSR0LeGap6nJK9Iq0tZoK
         +gIbDl3xdJEg/+a2Hr01MNQuaPEOOZwWgGCPq9juRS4rITfAlEsNMVTBZB8jFatZr0Fo
         BPnbnECaWFugLUoK+3EKFVlu9sBpnltE4L2lGVzHTCgBlcY8OVeRzIAEKrsaJ/9Yr5jv
         1u7TT9X+SfaVgsSbh/Lle0FajiUZoRDbkr9lPOnVTek3126+QpDtmfn4yhu4EwoxVt6+
         Y2XCUCIHX38nGVbLN541T13bpRgm0RSxVVpDzjzqLgZ5VOK5l7dZoXQ9f0wfM0WHtUN0
         eLuA==
X-Gm-Message-State: AOAM533DAAGHo0iEBt7cCeFk+PfWVk8AArm7F3EAHX7QZd+VFowetAti
	MW7Z+iKHPRvIVBd3YA7v1HF1+ocVwTHtJA==
X-Google-Smtp-Source: ABdhPJzfdbsi8CMnf94HyvE3GSmrD14AXEx3XrV0ZbV3nPpAyFtjnLuGXQ10xe2ATPIB+CgADWRtWw==
X-Received: by 2002:a17:906:dc94:: with SMTP id cs20mr1354776ejc.34.1611915864134;
        Fri, 29 Jan 2021 02:24:24 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id k22sm3554574eji.101.2021.01.29.02.24.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 02:24:23 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/13] gtk-doc: Disable dependencies in native case
Date: Fri, 29 Jan 2021 10:24:13 +0000
Message-Id: <20210129102419.1360572-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
References: <20210129102419.1360572-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure that dependencies like qemu-native aren't added in the native
case since we don't want docs generate for native recipes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/gtk-doc.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 7dd662bf868..ef99e63faf9 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -7,6 +7,7 @@
 #
 # It should be used in recipes to determine whether gtk-doc based documentation should be built,
 # so that qemu use can be avoided when necessary.
+GTKDOC_ENABLED_class-native = "False"
 GTKDOC_ENABLED ?= "${@bb.utils.contains('DISTRO_FEATURES', 'api-documentation', \
                       bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d), 'False', d)}"
 
-- 
2.27.0

