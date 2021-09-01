Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web12.830.1630524824744015673
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 12:33:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YLkhYxmF;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: grembeter@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id m2so594168wmm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Sep 2021 12:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0HnOxzLtP/B8IptFCrAS/0EsvWQYQClWsEoe2X998Y=;
        b=YLkhYxmFakvGRptoIxywXwzsVprMtiKzKOdd9PGF912ICa0ulT39qqa/vyohA61rFK
         79M+qRWU/OTLplrrEXdxgiHwHQhV2JuymQVjNuS4vlRZqglEnpEz52MIVNCmSrQgBl04
         fpVrK0DbRyzLVmldTVFEgNkGj19mgj069xLoxd4c+f8hetGThHsMnZxFdJBup5Vk/CH3
         58H+rs/88ePiX2eMO0PtV0P5WYxUS05Ash0Qb8rQD4qRUbzLCixlv+9h7lce2Z3LtQ8w
         RrOnF5bOSqMXaFequdhRiadlTC4TElY3TpnVRbncvzCZyyNGso+/9SfttISj5xloCqTj
         cPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g0HnOxzLtP/B8IptFCrAS/0EsvWQYQClWsEoe2X998Y=;
        b=NlWgh176X7KxOzwOzJNuSKrusGL4mNn0xR6y62EZbUNLZiHU1I28YnVRfG+YrpyM4d
         O3eGzz9V+RcexkZlUsJLj+AlOjg5taajr4uxtDrspaFlNLnMgER840Sl5ntgcCXrJubi
         bowehqeZdYAnR1gfM4lUX0K6HF6DFOww9493RKpVRkYTEFseDXZXyArrpubc6A7iuF3G
         57B2lfLr0it4kSw0nfHttVfJWjie76RyWYMBNunSBGFxe2+4krKD8coSQFqAJG8a6Y8w
         3FuFUowKnHHuERaVdq+fVh06ucGmrEJjz4xqIXlSuw8YDqR1rXKBURx4pOUyjqHcu6ye
         Z67A==
X-Gm-Message-State: AOAM530pBUibDMrc4ohLXeNW2Y2RFLufyOjP3r2ktNG2Dvz1bn1eL4IC
	wFelySlW+joEDl7Fhsa7dbFFp+QwhNA=
X-Google-Smtp-Source: ABdhPJwPJoSvJ6xNsZ7LG9GQH1Xj3lziWi6zGE7oliyFU9/1L25rajjKjtMlhuNJVAIeEsHN/dODUw==
X-Received: by 2002:a1c:1f8e:: with SMTP id f136mr1000115wmf.132.1630524822659;
        Wed, 01 Sep 2021 12:33:42 -0700 (PDT)
Return-Path: <grembeter@gmail.com>
Received: from think.fritz.box (pool1-19.cgn.as8758.net. [212.25.6.19])
        by smtp.gmail.com with ESMTPSA id l7sm368726wmj.9.2021.09.01.12.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 12:33:42 -0700 (PDT)
From: "gr embeter" <grembeter@gmail.com>
X-Google-Original-From: grygorii tertychnyi <grembeter@outlook.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	grygorii tertychnyi <grembeter@outlook.com>
Subject: [dunfell][PATCH] Revert "sdk: fix relocate symlink failed"
Date: Wed,  1 Sep 2021 21:33:29 +0200
Message-Id: <20210901193329.2911525-1-grembeter@outlook.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit a155c4d4ca841ef492213a5f0b9121703c62e2b4.

Otherwise, SDK installing fails with:

Extracting SDK...........................................................done
Setting it up...sed: -e expression #1, char 0: no previous regular expression
sed: -e expression #1, char 0: no previous regular expression
... tonns of lines ...
sed: -e expression #1, char 0: no previous regular expression
done
SDK has been successfully set up and is ready to be used.

Original commit message mentions commit bc4ee54535 ("sdk: Decouple
default install path from built in path"), that is not part of
dunfell. Hence, revert this fix.

Signed-off-by: grygorii tertychnyi <grembeter@outlook.com>
---
 meta/files/toolchain-shar-relocate.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
index ba873373e29e..54337412966c 100644
--- a/meta/files/toolchain-shar-relocate.sh
+++ b/meta/files/toolchain-shar-relocate.sh
@@ -72,7 +72,7 @@ fi
 
 # change all symlinks pointing to @SDKPATH@
 for l in $($SUDO_EXEC find $native_sysroot -type l); do
-	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUILD_PATH:$target_sdk_dir:") $l
+	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
 	if [ $? -ne 0 ]; then
 		echo "Failed to setup symlinks. Relocate script failed. Abort!"
 		exit 1
-- 
2.30.2

