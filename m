Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA657C25B7C
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 12:14:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.14255.1716552879810624796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 05:14:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SUrtqf27;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1f3310a21d8so19959405ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716552879; x=1717157679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOiQp1PGE/5hCXs+J4IwXp2IbxpcdWerOCReSzrqNaM=;
        b=SUrtqf27sRiAvGn2ynwJbHt088QMjmhCnsepCgb+meAG7KDksnfbNMdBrEmPC846zj
         dmbuZ9ieO8aNhBzh2oQuDOJvNBr/KyCKAdmY9uyPGBH+7LLZGbW6OPS9qyk4s/or+pga
         YqIl6OcD9DGSYBHlfHPTBmaX+vAeOppBX2Mi43pPGc1+fRmxPr2Q3GayLytX1frt2mm/
         l1o4T9yBrmHcAP6NIYSTEL9BfPcMuHGrW0+2YdKRpL7SC+LRm3xWWT4zojmJlo/lZbhx
         2VoFwVXJXS8oIF3SRYNEJ/Nrq/OrPyiovVeRamJJjrCNW301NpHZNr1DqQzk84tGzEmU
         0P+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716552879; x=1717157679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KOiQp1PGE/5hCXs+J4IwXp2IbxpcdWerOCReSzrqNaM=;
        b=RmU12FYGScdD5Coo/nX5Ms1BXlcXCdJBmQd1s+e2OBQvIYiuWUOpPeLb8yBmCFkQ+V
         UkLsVWHWVrzmCgEklYY4qzkGIAmWgXhV0pzwiZR9GVw8MCmW8DL501RfrZNxGBg8JDmu
         HA0svAMp/vNrYMywz/948BRxLSlK7Fz01L5JcTqgAI8HB/Pomtls5JcpsDBwSudEN2TO
         HnfgLDW20k0+mapOFOBydXYtvLlbUl/53itIyxbF0OphM45IHk1npeZC95h306XmdPSP
         z83vgHYq7ihL5LJspXk/wN4dvRj/iDm9yv2QRIgDj1eXYrCKv3sVL5H0gBaoFbdgRTxP
         UJDA==
X-Gm-Message-State: AOJu0YwccRU1SpCH6nCvYZM4lbxzA8/RxBFAhVNQ76kM2XcJCi/r0N57
	BTKN0V463qxvl/U+LsMjO5qkJnEea7IfTFo8+HfTnPVd+zfck+1bv1Z8KQ1LXY+zDyo7KLBqPHU
	Z
X-Google-Smtp-Source: AGHT+IEjqee+zM+1JwUSTsT9CneB5X3DHS7PiVzcXEShJWWRaOzCLoaNnB9ZOa1jiVzFYeKqZk0FtA==
X-Received: by 2002:a17:902:d4c8:b0:1f3:4bd3:4443 with SMTP id d9443c01a7336-1f4483f046amr23281385ad.0.1716552878997;
        Fri, 24 May 2024 05:14:38 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a5388sm12592845ad.220.2024.05.24.05.14.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 05:14:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/8] go: Always pass interpreter to linker
Date: Fri, 24 May 2024 05:14:20 -0700
Message-Id: <69128ca66991b13358f2552fcd5a7cfa6dda4952.1716552687.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716552687.git.steve@sakoman.com>
References: <cover.1716552687.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 12:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199846

From: Joerg Vehlow <joerg.vehlow@aox.de>

When gos internal linker is used, it uses hardcoded paths to the
interpreter (dynamic linker). For x86_64 this hardcoded path is
/lib64/ld-linux-x86-64.so.2, but yocto's default dynamic linker path
is /lib64/ld-linux-x86-64.so.2.
Most of the time, the internal linker is not used and binutils linker
sets the correct path, but sometimes the internal linker is used and
the resulting binary will not work on x86_64.

To ensure the path is always correct, pass  it to the linker.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b54215074d7f3dbba07f096f16b9c0acf51527c)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/go.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index d944722309..55f9d8f230 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -1,4 +1,5 @@
 inherit goarch
+inherit linuxloader
 
 GO_PARALLEL_BUILD ?= "${@oe.utils.parallel_make_argument(d, '-p %d')}"
 
@@ -44,7 +45,7 @@ GO_LINKMODE ?= ""
 GO_LINKMODE:class-nativesdk = "--linkmode=external"
 GO_LINKMODE:class-native = "--linkmode=external"
 GO_EXTRA_LDFLAGS ?= ""
-GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
+GO_LDFLAGS ?= '-ldflags="${GO_RPATH} ${GO_LINKMODE} -I ${@get_linuxloader(d)} ${GO_EXTRA_LDFLAGS} -extldflags '${GO_EXTLDFLAGS}'"'
 export GOBUILDFLAGS ?= "-v ${GO_LDFLAGS} -trimpath"
 export GOPATH_OMIT_IN_ACTIONID ?= "1"
 export GOPTESTBUILDFLAGS ?= "${GOBUILDFLAGS} -c"
-- 
2.34.1


