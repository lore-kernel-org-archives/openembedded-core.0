Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2343C3600C
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:34:03 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.44227.1742834040695911339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kuFRI5nX;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223fd89d036so90365685ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834040; x=1743438840; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLw4/mSEaRnBDbnb4/BTwIcX10bTp9W+G36eFvh2LOM=;
        b=kuFRI5nXlD97pwiEZDQnFSeQ/o+9Dq3v8JhEi1PSc7vZEMv6aku53HRwfCCH60c7qX
         YlrwShuMaWyzgE12oJb3g0j2sjtZNK6Nfjvi6RVWBmvobq0Y6+J94BwhV9MILhUYiCVW
         2HXHBjhsDrAD1YP3Qz9x27lU39RG0JUjZ5ty8ycKKWWHpkcAQ13s898Y9FaPP1p5fx30
         bBEiIJSM6aojv1laxTW5B+NwIxciEUDzOE/lgDO5yUXnSPt/6sNHxU1Q0E5TudAVVJDg
         HHcEzhtHmHGSl7AvO+Vm0BtyH0nOeU87qHCymD8Vch7Zc8hdqUWgb1fzF+S1O8g5X3Po
         4gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834040; x=1743438840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLw4/mSEaRnBDbnb4/BTwIcX10bTp9W+G36eFvh2LOM=;
        b=X/Jknc4Gypr8QdJWhp7Apwhpz8L8Un+3SXiJ8hQbCeLKY8klZMgz51L7IYAnbORCEc
         nFbQr0xj5M4glh9J1XcdE5tCUWffgGCd5PmauPB7ojsNBydgqjQ8a8t50lsBBTB7K761
         VywxHnUQTNsU/o9ImDLasJuSUjU7J/vSAs66DlXhlLOlj0C884sf3VUJpZ2krf92KP2b
         m/xOLA6DoZbWMINu1GbZydhMxFEk2x1xzkfl52ReIEoDvTSVu640+RVKslA/KBtT7RvQ
         fgeYsOdjfl+PjAwcPcTrFKhTwYjfQyDQdzltsMTvIfH8zYVMjbsnvT0td5g7KZ3QH7H+
         RvFQ==
X-Gm-Message-State: AOJu0YwIVoq8cVQQUiUPYWa0jIZFTe1cBfjc6GnzQIHVVxxDPosxZ6Nl
	eY+A/Q0AapSmU/KGEZwvB2iw5cXKP+w8j1T7VEHuJBsxdatBmPuzfac8TC/m
X-Gm-Gg: ASbGncum39oTpWcAhkWJYUfFcKkeUeCFlvfpXaA8/QeKzF45W4JhwJM91JKQKDZM5aL
	OqDEwGVdiZXg8GLZW2wleCtwmgLXNASmjR+tskJMUUEsLvW7KYq4PDLpPl43aGpvTEThNptgkQQ
	atSwm7J4KJqDBfncX4yx73RZoamH3gDw9ouOWAjrfzCOz99zSFbgtWNdQeqN5vNEbuFd6yevTsF
	XuZ1tdsgAshW9v0MCd8/JT3DxpKA+EVTll4RXsxG39XjZ0BIdLrwBfO1HIqnzZQtTbl4x+3ubTR
	qRl7qLGS4cazV1d80+xC7cxnerF4xnZtZ5OumjYags6A/A4=
X-Google-Smtp-Source: AGHT+IEsFjnQTidyqP0X1SXfyMJKS8xkc6N6zniIvnS5CF6Udzbv1/b8qsskEm0ZM2meoBlSLqtDMQ==
X-Received: by 2002:a05:6a21:3993:b0:1f5:8622:5ecd with SMTP id adf61e73a8af0-1fe4331e51dmr26636611637.32.1742834039995;
        Mon, 24 Mar 2025 09:33:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:38 -0700
Subject: [PATCH 17/21] xinetd: Pin to C17 std
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-17-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213549

GCC 15 is coming with C23 as default and code is not ready for C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index 897747379bbb8b689b75b7005cdee0d9d2aa185a..d30f08dd7241bf2383f5162fdbe25c525f96db25 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -30,7 +30,7 @@ INITSCRIPT_PARAMS = "defaults"
 PACKAGECONFIG ??= "tcp-wrappers"
 PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
 
-CFLAGS += "-D_GNU_SOURCE"
+CFLAGS += "-D_GNU_SOURCE -std=gnu17"
 
 CONFFILES:${PN} = "${sysconfdir}/xinetd.conf"
 

-- 
2.49.0


