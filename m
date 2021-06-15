Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web12.6433.1623744768677826009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 01:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SQBhHM8B;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id nb6so891229ejc.10
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 01:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rVr9/y32D8iFWKoiMMQ/tuo/+8xEkY61Z+4Za+1Got0=;
        b=SQBhHM8By3UV3NOAmSyrfPbSyVUPv2+kKzhxpmDNgoTCHc5yzBvRt+uNP+60iK7eIp
         rrcnPDWzlaAhaACrs+AzAOowR70sZaAPRZipMVki8qFWU9OuqwrOkMUzp6DFBKRnjN+j
         /nLGoe+fg9Z5Sl0MpJIwn9gKu7zm0g99lRhY5XIDvFyi1Qiv6p9pw50zLK/SXKWSgA4J
         mdXmk2J3SWkLfnxhs/0TaMe12Sqx21DjyilaWdMwO+pa5i2nldtvDrYFRiMSBPcrFbQJ
         KeMVn2qqBkP4D4MCaAMh9OgwwSzCNZa0uedWjXIdXoAPm4xs3/qJq/xomAaKV8FgZs4x
         ndzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rVr9/y32D8iFWKoiMMQ/tuo/+8xEkY61Z+4Za+1Got0=;
        b=VTv+j+jCqlaM6+z9SJmrxmvfxRA7MSIUyny+J+er9KWnLVY0rL58+Y4gPcjMBFra2t
         3g1akCeywFvzxawIZInuzKNeKZwv6PYLaPM7WFXzcByPwIINRTvdyNe413nqJ/qPQV+T
         0dXoDROdzMSNb49KMSCTAl1Lo1TZxvXBmPwvvS7kCUiB6bnMscSUhl9LQh15Zd6WzBSA
         r1HuAWriQq1b85Z6urgvoaJIWQLapLQplfIJdJLbxdJ5QtQnpX7e5njBW68og+TylP0W
         xyB1yHtWfwDONetyEJc7NtSrkrjjeEYQtqEI4KC0wqBqtXOw4nyS2jOQWw+pTFF485dw
         MdGQ==
X-Gm-Message-State: AOAM532oPtGrsDzugw06kLBVftzqAdnpdZ9ZVP3ALF++z3ID6LYGf1ow
	x4zMfQvxs0ZuZPjk6efHfC1YSegOD+3m6A==
X-Google-Smtp-Source: ABdhPJy8pXtrHIv6eEZ4MTgAOpLBg52PKhnE/7unsREUhWNdbAVWk26C0IJachFCwIXhDfOucfO4kw==
X-Received: by 2002:a17:906:2e81:: with SMTP id o1mr2639065eji.446.1623744767055;
        Tue, 15 Jun 2021 01:12:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id d2sm9118602ejo.13.2021.06.15.01.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 01:12:46 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/31] cross-canadian: correct the location of pkg-config files
Date: Tue, 15 Jun 2021 10:12:12 +0200
Message-Id: <20210615081240.1734087-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615081240.1734087-1-alex.kanavin@gmail.com>
References: <20210615081240.1734087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

layout_libdir has not been defined for many years.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/cross-canadian.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index 1e54035084..39b5bb93f4 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -155,7 +155,7 @@ libexecdir = "${exec_prefix}/libexec/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}
 
 FILES_${PN} = "${prefix}"
 
-export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${layout_libdir}/pkgconfig"
+export PKG_CONFIG_DIR = "${STAGING_DIR_HOST}${exec_prefix}/lib/pkgconfig"
 export PKG_CONFIG_SYSROOT_DIR = "${STAGING_DIR_HOST}"
 
 do_populate_sysroot[stamp-extra-info] = ""
-- 
2.31.1

