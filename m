Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.8879.1614344479261747638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:01:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NOblSiJA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id 7so8517026wrz.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+FwVN9D5/czbUhiJ474t3exY83xWpUHDy7YOI9Z1dPY=;
        b=NOblSiJAiEe+xhM5QO3DXzzu+TrLaRb7xjn9d5VXrcNxVkTh4tl7kol0Xx3oMZQnxy
         ydpiW67veomn1nCURPlhuwOy6huSVAw2UYLuJdaK+8Q1TdqHeTgptYNK5gNrdGnMa+TJ
         1Y64lKBP2QKYcpjXHeVxRG+iIz3DJyIASzOI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+FwVN9D5/czbUhiJ474t3exY83xWpUHDy7YOI9Z1dPY=;
        b=jLF0hWjhqNc7tZGccdag2WznK+FPBaFI5CtLurSGIuxhN3ArQmHklCc1aGQXoG/JA0
         6ja1WzpNnLt55CsMJ4CMKe5R83gHal1JtmKba6BoD5rmZN7tT5prTkQvjCW0DVhz3m+S
         ugAyGdfJkR14G3YbYKxlNGKivafMNtwV2PvnCrNqUclahxZ3GC+6T4k9Tb2GlN0hEbJv
         c6B038c4Xvpl1u8WN6Ndy5glSUcKqoiUpHpfChgWqozfcUArxpgpc/e6T3J7FPlxjUx0
         3rpvWSmYs83M65rP0p5GilRk9EcbT46f31HIezAgiu5jcwlgCnwRohMzIse9Se+Hzkcx
         +k8Q==
X-Gm-Message-State: AOAM5301b0OlUYRSMz9QbYeZL8+klaFg0AvUMbmwomyFpjpyfnshhw/5
	21/Q7amrqjpc9IG3xKCp79FVhmNcj9nv5g==
X-Google-Smtp-Source: ABdhPJynbb4GEmBtIhIx4erfKqyIz7uFErb0DlBq/76kxH44hPZ4laJ+MOL0pnHJGNRXn7rsOI7IvQ==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr3231161wrt.63.1614344474913;
        Fri, 26 Feb 2021 05:01:14 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id q25sm11637829wmq.15.2021.02.26.05.01.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:01:14 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/13] image: Add directories to PSEUDO_IGNORE_PATHS
Date: Fri, 26 Feb 2021 13:01:03 +0000
Message-Id: <20210226130106.3925837-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
References: <20210226130106.3925837-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some paths used in image construction shouldn't be tracked under pseudo
so list these.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index cda866cc81e..e7d46f037db 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -180,6 +180,8 @@ IMAGE_LOCALES_ARCHIVE ?= '1'
 # aren't yet available.
 PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/intercept-scripts,${WORKDIR}/oe-rootfs-repo"
+
 PACKAGE_EXCLUDE ??= ""
 PACKAGE_EXCLUDE[type] = "list"
 
-- 
2.27.0

