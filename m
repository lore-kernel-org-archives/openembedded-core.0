Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.15921.1613303787170176429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Feb 2021 03:56:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MNmxNy/U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id l12so5277233wry.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Feb 2021 03:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DoAd7RbkubcDxhqihQr4xG2es7dpco6A4850pOHQGnA=;
        b=MNmxNy/UdvMDaAFo0awUroNtwJ0MiwohMhKWD64D1IrlQyHxFDSTbbVB6KXHVBsvpt
         r/IH1ukrmPGMih6p7pyZR9qXdBhI+9prNZVxikBNfvCU11/6WW2kwSNxyrovoNi14C51
         zNX750CWoLOGcqTYrb+fCSJbiAlMf0TdxmpJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DoAd7RbkubcDxhqihQr4xG2es7dpco6A4850pOHQGnA=;
        b=heCsgZzaKGAolxFeWwMKhOhOiHTSc0/3fn8RNhKII333T5xa+L2bcvL191ODdhvcXs
         /OX3m5LA4ufslvTwYfepAKVgNTukXgMf3YZakJK3o33ipkyLCZXc7LZcCe04SlkGvZ1/
         eOK5JGM8FcO1UkibI0SKDhEQ92CrqV2oKMKV7WH2tOwG7Ts0i9vyfPhl1+oNzsPm3SZ8
         TnSZnQUh51W1DUCG1lCHMKsJcDv5+B2Po2Nfcl7XrGHP9XwO2uuM4Kdm9qH3WVmcbaj3
         yXPuHx7o4k1dNx9WrqZvr0YZGtvLE4Fe+EbOXW7nveupSDoAqdJH0ECsIB2wq6GxDyC5
         gqiA==
X-Gm-Message-State: AOAM532lXwb1IK4FnyUC5woRmdCU1glCmdzx66nzCXOwbxSEN6n7bOFZ
	K8AutZQfYjQXWUmKanBV5SEa/SOlOJf9fQ==
X-Google-Smtp-Source: ABdhPJypaLJJDXKwNiTFC5eEJXv2FWfh430dSE8VQ+5rUBb/WMHl2bikaTMCsSTTWuT6VnQ9ohqroA==
X-Received: by 2002:a05:6000:242:: with SMTP id m2mr13281124wrz.422.1613303785638;
        Sun, 14 Feb 2021 03:56:25 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6c46:cb67:3902:3f00])
        by smtp.gmail.com with ESMTPSA id k11sm18713394wrv.51.2021.02.14.03.56.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Feb 2021 03:56:25 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] bitbake.conf: Set as default task umask of 022
Date: Sun, 14 Feb 2021 11:56:24 +0000
Message-Id: <20210214115625.1961614-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than trying to set the umask of every task to the correct
value for determinism, set one value globally. This uses a new
bitbake variable so bump the minimum version to match.

This fixes strange determinism issues in at least quilt-ptest,
valgrind-ptest and kernel-devsrc.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 3 +++
 meta/conf/sanity.conf  | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 790859e8ae1..9b833c02a36 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -869,6 +869,9 @@ SHELL[unexport] = "1"
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH').replace("_", "-")}"
 
+# Set a default umask to use for tasks for determinism
+BB_DEFAULT_UMASK = "022"
+
 # Complete output from bitbake
 BB_CONSOLELOG ?= "${LOG_DIR}/cooker/${MACHINE}/${DATETIME}.log"
 
diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 9582edd3aff..ef7cee6b6bf 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "1.49.1"
+BB_MIN_VERSION = "1.49.2"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.27.0

