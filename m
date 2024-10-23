Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC836CF5384
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:31 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.7927.1729686925666696112
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MTYFIDxS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cdbe608b3so55654045ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686925; x=1730291725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jmfO01sQ37XPR4MqTtO0es4SW7MlofwvrHATvWZNVbo=;
        b=MTYFIDxStJhwYEfTJJbniRSaiXiJi4gxpVpL0NNi+ztWb3siQbyvxkF/MPPK6oZOZd
         0XN16s/dlcxRtiycFy7u95MY4bOnHc+LDr3gb0Pi3E3r0hb1bwZWtadgTbQVVd/aBn7a
         vZeLoZx9KKNG3Ws3frfR5y2tqxyGSDtZRoq1ia5Sgv9ErNhmIiAzVDfmdLNvCnzUvqdq
         Sv+MbPxYpwiN+8gtU/+pktmIyk1XJW1Lf8hidPa+2q3xL6TWuZBDz/Dc6Q1Og1B4ekRy
         8DRGs+C1d1i7vO/vhP/dVUWJvDHJ1wl9O6lMHEiWYS+OR/GVtduK2fxyZ5DuIOjCEXgS
         KAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686925; x=1730291725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmfO01sQ37XPR4MqTtO0es4SW7MlofwvrHATvWZNVbo=;
        b=VsABrvTlZUCWor29sNxPI4J70r36GUCMdBZPXeYWwxmG/Pei5mCLJ0skGd49PkFcxo
         Ibo+Y3rlWZ7tdxXJSwhzH3G9vBn9rx3ivgx1JF1HV8ICAbDT4GGeqn7po1Kp64VwSEBV
         h0Wo+qsu/SgWe0dw27RPq7GDss3vwhGKGjd7YadFa+lLvzkUUnXUDIwqXlNQtrpy1D7T
         q5/X4pVO1foccj6+euQIMeV42A2serV7Iv3KvGUjhgvCuyjqNG87noEKI64i6r5nKWP/
         obQRfycLdMFHrIad9m+mzro57JwW4h87pnsNrLrQyi93ePIaIO91DsntG8BG8tCY3gQT
         pjDQ==
X-Gm-Message-State: AOJu0YxcPXUXiZ5OaS7wzUCG7F6HGnIUa1I5zeqFdoadFDmcHTXSmtiB
	LzCUezO8eSRHp0+Ljyv6YunnCHPOcq17WZwdJA97JGtbAWXIq90GmUjE0SwYstIpBJZ49HX6OFf
	H
X-Google-Smtp-Source: AGHT+IEbT+rnXCCgueOBfpA7VwjmYbfMEVazdM9LTBdv7aq5e4+kxcmystO7+eN/oUavRlJ6pdaMCg==
X-Received: by 2002:a17:903:22c3:b0:20d:f00:bd26 with SMTP id d9443c01a7336-20fa9e68136mr31647075ad.36.1729686924906;
        Wed, 23 Oct 2024 05:35:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 26/27] bitbake.conf: Mark VOLATILE_TMP_DIR as obsolete
Date: Wed, 23 Oct 2024 05:34:34 -0700
Message-Id: <a2b419d123b76594879da740eb665397929f70e0.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206237

From: Niko Mauno <niko.mauno@vaisala.com>

This variable was removed in
https://git.yoctoproject.org/poky/commit/?id=2f46b6f27dfa3a9d5ad177900fcecfe64c3536f1
("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead")
so ensure that distributions become aware that it no longer has any
effect.

(From OE-Core rev: ec032dd13a19e4d4a332f06ace87f1f02143c3b2)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 59ac1873e0..1f31b4fcb3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -107,6 +107,7 @@ BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] = "is a deprecated variable and support
 BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] = "LICENSE_FLAGS_ACCEPTED"
 BB_RENAMED_VARIABLES[TCLIBCAPPEND] = "is no longer used, modify TMPDIR directly if required"
 BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] = "is obsolete and no longer supported"
+BB_RENAMED_VARIABLES[VOLATILE_TMP_DIR] = "is obsolete and no longer supported"
 
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-only] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-or-later] = "INCOMPATIBLE_LICENSE_EXCEPTIONS"
-- 
2.34.1


