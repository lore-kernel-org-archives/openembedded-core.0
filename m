Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA17AF99C8E
	for <webhook@archiver.kernel.org>; Sat, 18 Apr 2026 18:34:18 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71730.1776537254944594702
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Apr 2026 11:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Eh+Ayn/P;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: adam.blank.g@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38cc8708d76so14234031fa.3
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 11:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776537253; x=1777142053; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QvS6PqKpMtfVr1eGrjiezzHNaNN+C40FBt5zupfCmIo=;
        b=Eh+Ayn/Po1aYyilBhO8L2mTJK3zmn83Gac4JBwsId2qASxCfeo6MsqmjazytY8W6ws
         LosWbYvnXUnLxiRfhIj0XIxW/HM9JFuotyYZGcK1mQPim96btrhukHFOFYtUC5RVxy+M
         ApKkHGSAhu9N48JtrCkltfoyNmoF0DhojnyLZV3GqaxNHTUYsr7h22S3yWlV7WjwnXk/
         PleNr/Zv3wL8z1XVIKJyIdDFqRXanvjoCKVq5odwWeE3OoIBOY9LktmJ/M0PeG3hlV38
         ZL1RA0yXaqhxes0UYIvFevKyFTmio5TJYQ9No5Vo/8kSe0Fon3zGR42owIEM+LG61/yg
         U8aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776537253; x=1777142053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QvS6PqKpMtfVr1eGrjiezzHNaNN+C40FBt5zupfCmIo=;
        b=okMyOQagxdVboq6/FVg3moOhXlp6jxqgIdza3APxydDSz2g8zkQ+Pj6r2JmlpFbU4q
         KXMwtqwsaWywKM0KOSFcA8aab24Y9yWMo5vBJBnsAiHgsQrXD1Uoq560myKPk7n8ls6m
         B6hle8YgwpZD3bRJLUEIIGQh8dGLlUkUexResWrhxv/MEjVP7I3x6CAZ5dNAtcs5sZCs
         4FCnOlywAj4Cp0iNWxcMS6cnpo5bcdAdOKgNyjF8IItxDtPauIT2X4xsdM1sFxe2Krhp
         /dSkpc4wun4IquXmZqA4uRsUXtZBg81vXWbTY7U8sE6mrF+/sFqM3CAZ8uFrxuej727O
         JrAQ==
X-Gm-Message-State: AOJu0YzpD6/edwF59XJ4JA7InAYECRsEf/xetQPY5EKYlNG3QqAAZcL2
	HPSDuIfHFyHihzlD1LgREaIODjR3xvVEtTebSi/v1G4gMpe0pE0AynHfayKWeQ==
X-Gm-Gg: AeBDieu7Me6DuXfZ2mVTdx0Q2gPn/KngOZQ0kRGmEN6WCDuIYj0m5GNsxIFn0UJ8JYm
	qV8p7/WeLV1eUeIk1cbhLsVd7+Z4Syj50rhxcnYK4zushzxPVNEXhzi3r9ROPBlXtdd3zRqcHYg
	slYgE1dKmjxnAx2nT6P2sRaJjFzzufwkIgti9Eu1+AYf0qoys1XGy502YC3vQwPoDvA8JzA9KbS
	L8af8JoDfya87z562m39cuB6yBQkcQb4qdmmVPc/Kmz3RF5KN5pG3BRU6/6uQj5JyJ9vqEVUklJ
	dfvNG+JkgK/31wUbYTkiB/StgSvCQzHiQxj1OpgqZhqqM4n8pW4Izk8RxF7uZyn6p16F8ibDE4f
	NZ2Ne0OCKKuP8paaRBzesVHkO9t5+S8kRQv4n03ZJ7OM8ycy0YVi6RAi1lgDOvGuPyWJvD6rbIb
	Vb4LtUyr4Mn5+FlKg82VFHZTyo2Ge7+xdgJJKg5CEVsDTN8sx4Bt0=
X-Received: by 2002:a05:651c:420d:b0:38e:da87:ce3 with SMTP id 38308e7fff4ca-38eda871158mr9344031fa.23.1776537252916;
        Sat, 18 Apr 2026 11:34:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:8f12:8be3:442f:59fd])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0bfdsm12965981fa.26.2026.04.18.11.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 11:34:11 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Apr 2026 20:34:07 +0200
Subject: [PATCH 7/7] bitbake.conf: remove 'extend_recipe_sysroot' from
 BB_HASHEXCLUDE_COMMON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260418-extend_recipe_sysroot-v1-7-8aeb383ba743@gmail.com>
References: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
In-Reply-To: <20260418-extend_recipe_sysroot-v1-0-8aeb383ba743@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776537242; l=1273;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=Ryd5t+VoBuwyTYRzmh3UVh9cojlK7Ml6JJX/zTA7vlQ=;
 b=NExnz3nkPWhHYey2K4jcMI+kddJ99KL297InzEwYZ2s7U01g7P+LdjDp8L/oBTXwErYbEYJxO
 YhycLkasy82BvR6GFFl3dVQwzxjHSr4+dcVcL9CqNncxujWYWMq4bta
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Apr 2026 18:34:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235521

'extend_recipe_sysroot' can and should be handled just like any other
function. Fine grained use of 'vardepsexclude' is capable of achieving
the same effect as ingoring 'extend_recipe_sysroot' on the base hash
level, but with a better visibility, and is a more uniform approach.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9fcd16615d..87c6a700d2 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -961,7 +961,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
     WARN_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
-    BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
+    BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"

-- 
2.43.0


