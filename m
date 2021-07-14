Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web09.6787.1626270174225845147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 06:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dD7PzP2V;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id j27-20020a4a751b0000b029025fb3e97502so595552ooc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 06:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7JqDcUQ5Waw7w0+cZlHJS51rIKh3mVTONZWAP0gwm0=;
        b=dD7PzP2V55yVcg6zDeqJ23UBV9vzt5juog5UnqjoEW+OsyDGHcvfWhAMt2f7al0efC
         0fX5QAyVeGAUUtpRQ6SbBr67McEZ8sYQo8Q/7jWeMldJTtT3s1EB0CEDi2QEIpqCNFKr
         LLQgoIlr2MHqoSeCX3CvNjT1SjtwQWeaR9E8KLxYGSmGQ/BpUNFrOC+lYWg59++j/vVT
         de/FcMdEIa6L1bfo+OJ6/n6mLfoUQh6qZ6IA0Cpm4rcGAvzmVdldheapBjTYnrN/XKH5
         4yVtztTWbKry9TAZQrYl4H7XdSrft+581s0NNX9oEJ3KgPCVcY72Rp3KQ4DURmBzDLPx
         ZB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b7JqDcUQ5Waw7w0+cZlHJS51rIKh3mVTONZWAP0gwm0=;
        b=lAovvYyGJICO8D46dSAu9xThrg7eRPEMcUREE1q7tsY54jA3yIxwzAqPcyZ5JMWCbb
         4Oao6yUwT18k7YCLu6aLIhrGeVo0ezKHAiE8xUgeLKawUIIQkG8oiuenztP1qpvs5kLM
         jIyKj9PqfcYaiYtrNbLAy1sSz93OOAav7GcT4gDjNS1rBd9S6D2j5B8Pca8UHTomuwjM
         P6JoJhr1w4NXyTr9RTW0mSlPZ2goXvBMD4AvdYgqybCEHuCdQvdPdtobNKO8f9HyfPzt
         qH5dOHQ3HBIGy4gPgqUj/PEBnDBQ30UQCLTFmuAnAoR/0Oel9fzpPWxqHq5k2N3FIUP0
         5X1g==
X-Gm-Message-State: AOAM530jqBlOeKSBHOn1ILtrI/TVWQY3KlzOx0T6KVUDFupOCTfPKwEe
	SpkhkG/9rPOfmBT+xjm0gmT7BApe8QA=
X-Google-Smtp-Source: ABdhPJxVYNEitkEOz+wBcSiydLLGSou/fMjUnezpAI0fBgvZx/+FNqhKVpXi29Ckk891u7QadXd+wA==
X-Received: by 2002:a4a:8802:: with SMTP id d2mr8016976ooi.28.1626270173430;
        Wed, 14 Jul 2021 06:42:53 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id e10sm490042otr.47.2021.07.14.06.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 06:42:53 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] bitbake.conf: Add lz4c, pzstd and zstd
Date: Wed, 14 Jul 2021 08:42:48 -0500
Message-Id: <20210714134248.21366-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds the command line compression tools which are needed by bitbake

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/bitbake.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f451ba6a47..3801db7d42 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -484,12 +484,12 @@ HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
-    head hostname iconv id install ld ldd ln ls make md5sum mkdir mkfifo mknod \
+    head hostname iconv id install ld ldd ln ls lz4c make md5sum mkdir mkfifo mknod \
     mktemp mv nm objcopy objdump od patch perl pr printf pwd \
-    python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
+    python3 pzstd ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh \
     sha1sum sha224sum sha256sum sha384sum sha512sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
-    uniq wc wget which xargs \
+    uniq wc wget which xargs zstd \
 "
 
 # Tools needed to run testimage runtime image testing
-- 
2.32.0

