Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.16462.1609619124610044450
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jan 2021 12:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A/K7iQbo;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id p18so16214787pgm.11
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Jan 2021 12:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V+E9Yy2LMB1TsyaMwe7feAVK2lGmbZx4lIBcPxnM5JM=;
        b=A/K7iQboRay/G56C/C4btdJeJ05uylK9pjZHDZRQCWS8IDgCyTqtlxF/LoMtViPpoH
         Vt7Eb9MRb4b6YhVBdQVxxjuUu5CCy1Mlf9dmBtUScd5MwXPBKUdyxTvrWCTpEe8fSpqE
         jMmtbsxdrY7j2veH+sDYHRGbS0DhR79lfEtiWtfR/0M/IG4KToJbCPU5PALH3c3cyjq3
         KsgDFoHhvpo8CjyXVHszDBFLC40X8MlL4M/n+Jl/5TJzXIzqk0QSIjCHMHucZIuL2m+o
         4MXBOVpF7P2EV7bwTt6htw9bghQgb/rTjAHtpZyJXXfEueeSGBmt6xdAtqKtBEVdDxKA
         dq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V+E9Yy2LMB1TsyaMwe7feAVK2lGmbZx4lIBcPxnM5JM=;
        b=TMSXV1wvy/PxWM98ZB9jH/sXA7ohC878CSf3PY/GY+6vWHBNLRVH8e4QSsxzS8NIJh
         G+a3NsBSiWLpem5ohwbXrLv9WNYqEtQjG5ilWNjqfSROlkeTEiI5GvfWdkDQpR2MGe8m
         P07eeg6mMCm9dpGRbF71nJhClBEl0lsc7LG1bGgPcXb8DrRfWZ/FIhoyJe+tfxUZ7z6V
         mmyKplp1I5t4aUyhSWOp98T0Au8NvCoJr+svO1OO/J5jBW3pIPkGqIuau8IRQI7MvBsL
         EqN2qq4VB/4iqzt7pA4nqBSW2IeXqPWj4XO9Xyywm1z8Ujmi+0Oq+5IdpspgltI/Y3Q9
         yfMw==
X-Gm-Message-State: AOAM532SZWEJHQ/CmXwtub6AhmCDkh2HvVCFRZ1dRij1xv5333INGRU3
	pAQ9c+xCHlmvDfC1QztoFJxW4FSQsqe6Qw==
X-Google-Smtp-Source: ABdhPJwUOZXDtHnMoBH1XG7ScbZis0dC1WaEcyS4aSXcnNNtAYs7GooXadrVar8WCEuciNwYUhFUkg==
X-Received: by 2002:a63:a44:: with SMTP id z4mr28623643pgk.60.1609619123785;
        Sat, 02 Jan 2021 12:25:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::cd68])
        by smtp.gmail.com with ESMTPSA id k3sm31750773pgm.94.2021.01.02.12.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jan 2021 12:25:23 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] shadow: Remove lastlog pam plugin on musl system
Date: Sat,  2 Jan 2021 12:25:18 -0800
Message-Id: <20210102202521.3791499-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lastlog needs logwtmp which musl does not provide

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/shadow/shadow.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index f86e5e03c0..4ae7a78c52 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -71,6 +71,8 @@ PAM_PLUGINS = "libpam-runtime \
                pam-plugin-shells \
                pam-plugin-rootok"
 
+PAM_PLUGINS_remove_libc-musl = "pam-plugin-lastlog"
+
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
 PACKAGECONFIG_class-native ??= "${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr', '', d)}"
-- 
2.30.0

