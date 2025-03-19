Return-Path: <jarsoper@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0354C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 20:50:19 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.5510.1742417414168675046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 13:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jLicCW16;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: jarsoper@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-399744f74e9so26168f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 13:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742417412; x=1743022212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w5UhnjtlDohKfTCpByy//aqTC6oiT1VsE9rl3tG6qJc=;
        b=jLicCW16hEicu4/JfAf/iBomzppOY2HY3Tglttr0HfGHd5lA84ulbyWrfy/4FRGuxs
         VE847WAtpB7ka6lQ4JT5GS5OW++a8ocFM/FfuTTqq8sGsmQ2MmK1BFp1Q3am+s9IssJ/
         aleSWR04aQ+w3eKBQ+AbTtYaOlltYpKY1siVOdFM7+f86ar8Zz85FT45it5tPogLGYQp
         AiA3oLuvPyiA6GaMvMzqOams7uPcIjMmmGdXQQHPE+2bhqgQ8T4+mKzdsuctuJc1b+37
         ZwzJXZ8uE7Al3J80GrkNslBWE8uqHU46HeKuvJRv0mtUyCufBSs8h+1aBttfLzdjLKUF
         aMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742417412; x=1743022212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5UhnjtlDohKfTCpByy//aqTC6oiT1VsE9rl3tG6qJc=;
        b=RqKmWHsvGYsW/tcf3D4kDeBLFXYA+L+DBQpWjutZcALCI7Hbie0ysg3QOU3CUgBqTu
         53tuQE9UOlvMHMnGSxxb+Xlc/9zY4wZVTX96pXuicf+xMVuHIKo3VNm6kuIAs7smAMb/
         TEmQxe7K1scQgGIVQq3/UOc5kcSfOXlRWFoHCbXopsNsAbHFATx1nWNhHQ/2DtIbLrQV
         8nbJ28YjqLRwNOWPryH6zdHp+8EUdixbMwYENxC9biInK7HYo9oAOaP0ak/fpGouCzO4
         AWQb6O0UVMd63pFAMugZhvN/dwZz40Jxrmdzq3jUcUd2Pm0Z9IiMOO2WMgbfw5cAKyOp
         a+Fw==
X-Gm-Message-State: AOJu0YzQPFKvz6VeKUgdfTUh+VmoUq6YewKpsbooxNVpwmtiVW3c2fdN
	bq6h8xx7AYnc2usaL6xLU497VKGJSIFgf3+x5F8qlNky+BE6l+WeKHkRrN3THj66uA==
X-Gm-Gg: ASbGncsxKbC+Opxnv34t6dC/aXImaRoLL5Wis5CRN1YRevImFHyAWx6m4b5OXROzMXS
	p4EPNoVpzx1yEHzVLbdz66US2mDQgmBir99Gl496nt1DKkLzo6o8hzn6VlDML5X5M4CMVWMWWuv
	pHcTgYdNw66gfQf1r4wZpoY3gPMlf+hGIJj3EZ4qRM9hliHVx81vAh5Fz98ex5sGhBCDAEV7ARQ
	NUMhJNPZZcJRaIiMx6gfFHw8oVZoktoB3vjJpQuZsnIpGv3nD8GYLayXINklUjRmN1tdJWcUuxz
	DHWd3V3TKsHmIxUbbw6+znii9Fam3HAJIFBeG3pbBKzjcPzdWZBdNQJgFQCQWzy3/gCtvhKOoz3
	Gc/vAgap607HvskCr1B6pT5ZW8sA=
X-Google-Smtp-Source: AGHT+IFsWq2cAwrV8B7GONDKSnvS4lp8s+z3kfelZkGMffimJU8kBrGLxVwPC2Z+ogkRDN6XfpdlHw==
X-Received: by 2002:adf:a40c:0:b0:391:47a7:299c with SMTP id ffacd0b85a97d-39973af64b7mr3788221f8f.40.1742417412079;
        Wed, 19 Mar 2025 13:50:12 -0700 (PDT)
Received: from fedora.. (2a02-8428-db71-3701-4910-aa42-71a4-9a4f.rev.sfr.net. [2a02:8428:db71:3701:4910:aa42:71a4:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cbbc88f2sm21926213f8f.101.2025.03.19.13.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 13:50:11 -0700 (PDT)
From: jarsoper@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Jean-Pierre Geslin <jarsoper@gmail.com>
Subject: [PATCH] cargo: pass PACKAGECONFIG_CONFARGS to cargo build
Date: Wed, 19 Mar 2025 21:50:03 +0100
Message-ID: <20250319205003.1890507-1-jarsoper@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 20:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213353

From: Jean-Pierre Geslin <jarsoper@gmail.com>

In order to allow rust packages to define PACKAGECONFIG options, append
the contents of PACKAGECONFIG_CONFARGS to the build command.
This patch was already submitted by Bartosz Golaszewski on older
version but was never merged. It will be really usefull for Rust recipes.

Signed-off-by: Jean-Pierre Geslin <jarsoper@gmail.com>
---
 meta/classes-recipe/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 76a39668c7..5dea260ba7 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -48,7 +48,7 @@ oe_cargo_build () {
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
 	bbnote "cargo = $(which ${CARGO})"
 	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
-	"${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
+	"${CARGO}" build ${CARGO_BUILD_FLAGS} "${PACKAGECONFIG_CONFARGS}" "$@"
 }
 
 do_compile[progress] = "outof:\s+(\d+)/(\d+)"

