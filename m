Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.4522.1604880146321318744
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 16:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f0jZndk1;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id f18so837932pgi.8
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 16:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S/3bG4DAijzJHHlxg/CBU3rmjmt/rGN1qemauurASMU=;
        b=f0jZndk157T+eUJRwuvqHgXMW6J4sc5LRQd+aV2QFApBHnlO8IgdNAJ96UtuVo3QYY
         aQHGU+7a8yiIiA6iwy89l76j/F/rLrV3VzxirsZM7vs2Oj4KOi+iRifamhVjfqqjF8FH
         DmJnvl+R3Q+EaOuOm8aYtVJ9SDeAdtmNamyjRDoJYkMEQ0INrrzCt3XolTB0K5qCZD69
         sIc0BAov1JXzyeK5ua18glcqv0GKBgkxepuBh5m/XL2yc3d1xzYwCEG35LR4psxB3Tm3
         dyhdKWRXT7Q7QVUxMbCcpFpYWzIW2AI9kePulspXP9F4zqVOhY/OckUwfVsn4O8BPtXX
         mbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S/3bG4DAijzJHHlxg/CBU3rmjmt/rGN1qemauurASMU=;
        b=hmxa/bfDB03z7OJWV598EnfvemXglrKXo+1ui8y0rbpX4hUq/USHGU9EVVEn5Nrlec
         kxGW1/ylEbza57hQwCWS+0W2DGpxeJmXOLIA1R5VJgL8qDm6+Ge1UjDi2ryGnR051lLA
         2o2cIyjAhrhjlAXQcVYdrMK0rPzFIWz1ESopj+/ExjoW9kVEHPSHoqiGZV5lH1m+Z7bv
         6bMh3B+opWUjD1UVNHdyuLkGYB/zWhji+qSzCg4icCUbY+vQpFhHZcYA6nWAzX4AvHJm
         zMYmQ1j0R14iHbGlzIL6x51aIOESeVb7cKyqtlkDtgYEPS6qhPf+EwykipI/Acr/+kho
         kiRQ==
X-Gm-Message-State: AOAM532w0hWd6xpRqv4HtP3GI8O9ICeSkAmH+/+rEyuPzxy6lft+KYaR
	uFKQZXL2S20AMWDu/i+Ynyi3saA8zzPhoQ==
X-Google-Smtp-Source: ABdhPJw5XFKQNlB6UWBKKs//8nPqztEq68IQjAePBbupb4cXj68gP0oxFLbIHcL2cGti03Pdsjm91w==
X-Received: by 2002:a17:90a:de94:: with SMTP id n20mr10160449pjv.217.1604880145632;
        Sun, 08 Nov 2020 16:02:25 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id c2sm8825227pfb.196.2020.11.08.16.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 16:02:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v5 05/11] libaio: Disable LTO
Date: Sun,  8 Nov 2020 16:02:11 -0800
Message-Id: <20201109000217.3008448-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201109000217.3008448-1-raj.khem@gmail.com>
References: <20201109000217.3008448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Libaio uses ASMs to implement symbol versioning which does not work with LTO

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index eb36b892ca..9c4e0ef507 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -8,6 +8,7 @@ LTO_pn-glibc = ""
 LTO_pn-gcc-runtime = ""
 LTO_pn-libgcc-initial = ""
 LTO_pn-libgcc = ""
+LTO_pn-libaio = ""
 LTO_pn-libpam = ""
 LTO_pn-elfutils = ""
 LTO_pn-perl = ""
-- 
2.29.2

