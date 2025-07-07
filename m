Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEE2C8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 20:17:18 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.2993.1751909451155222062
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 10:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=jYYOkUXl;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.50, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ae360b6249fso616600066b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1751909449; x=1752514249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxQIivG6J19KneVHpbhl+VZWpG0Rr4zn04pcHwlqEbM=;
        b=jYYOkUXl+FlwNylqiZJnX/jGVcDfE3N4yfPNOSRrbKUXNJy+6KbX7mVA2R5wf7DMYf
         XcCWgvoer9MCHSmkV4DM/uIa3A8qOVFmc/sZtLaR0k4hk4k4c50PZ7XNhKYS1UdiGcyY
         f4/o/ZwXFsgHUIzmc4bcMD+5ToZAgg6VkWRYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751909449; x=1752514249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxQIivG6J19KneVHpbhl+VZWpG0Rr4zn04pcHwlqEbM=;
        b=kSlTG4lekFFvplSBKYg3V8mP6nTANmtO9x1DOzl0cqhNIltr0xTIB/e4oUPL+YkKwg
         Y9vCI1IFjQvsR2j+s+1qstpUBzhbDGDcJ0QlYQWZJgcxo1SDRFwIFe6eQhfE6P/V+Iv3
         2sx6SBYkoPj1Zue1IKeGVewAPQRIc46/LEeYzdlBixQx8v2EFxDAysFNe9AteKQbnoO2
         9jtAmwMjGjUiX6LdBT0OmCWq0QRQa7BkVBKrjg8qhI6bY2ahJnKgZbsgO8VdwpJzQzem
         BzWI3/VelA0OlShHyj+xZKDjr3UQgBoyie4j5BilJquCfQE6k9Izk2MTw0qsa9YL3mgp
         JOVA==
X-Gm-Message-State: AOJu0YzPBUKSLP3LelsQQ6YYn11Dt/UooDdT9VnTJWwwP+p34YkUT4N3
	+isCjwxoMRy/i8tCzs61ULk5hHOjczJawJruHwgLzs0/L9cAmWVBcS5RXqYFDIrC9tmZ0KE+mA6
	9gUui
X-Gm-Gg: ASbGncuGAgLsyhH3/XAMYcXduhN+c3bc9P7G24Bj6ynnxUa9ne7vTCPK60IV4CIG7uy
	Ygbza7Aw3r3ycM6zXTbbPNrcoIOFTJH7SgbvjJi5n8n8V9Wa/QvNsSPdIb6RKrKJQzugSsBgTDo
	x6xJy8CzasztZN75XCSTfNRoDf09EnmZdF8CjBTK4LL242DGLG/uFLk0Z4Q16EtHdM0qOru1xCE
	wxOuS29zp/f7gwJbZRZZFBw/eOmhCOKVaWBos/Q6rbqz5BRjqPkLFasJ0Yqk50z5E40jHCSTi54
	VB4QRVUMORPzTrHKKWfsU6m7j+AkbkETSciSdQGxFk7uYhT2Ws1qSInLdHYGq/MJxUVL2eAgHfo
	JXlGlcmIpNwGiJs3ACV91N8JC3ZE=
X-Google-Smtp-Source: AGHT+IHqwop2Txxk0yf42PHqsPKQGFyBhiuegCcty4DV3Sgmw6N5IT9dLYZRq0Brz2uZL3Smd7S/Ew==
X-Received: by 2002:a05:6000:41c5:b0:3a5:1222:ac64 with SMTP id ffacd0b85a97d-3b49aa74044mr7207393f8f.38.1751908954758;
        Mon, 07 Jul 2025 10:22:34 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b470caa1a2sm10644852f8f.42.2025.07.07.10.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 10:22:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 1/1] mmc-utils: upgrade to 1.0
Date: Mon,  7 Jul 2025 19:22:27 +0200
Message-ID: <20250707172227.369205-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 20:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219996

This is the first tagged version of the package.

Change log since last version bump:

  d8a8358a7207 mmc-utils: Pass key_mac buffer to rpmb_get_key()
  a23ad7875b89 mmc-utils: Start to use the generic print_usage function
  e769d44ecb77 mmc-utils: Introduce a generic print_usage function
  6586fa5535dc mmc-utils: Simplify and streamline print_help function
  ec75d4b3b671 mmc-utils: Remove unused adv_help member from struct Command

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes v1 -> v2:
 - Add tag=v${PV} to SRC_URI
 - Drop UPSTREAM_CHECK_COMMITS

 meta/recipes-devtools/mmc/mmc-utils_git.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index f3944aebf035..5b6a5f377732 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,12 +5,11 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "c515ea2e1cebfbf9d81aa6a5c1bf67a79d2a7e58"
+SRCREV = "d8a8358a7207bd81d0c38dca2cf27a48bf411341"
 
-PV = "0.1+git"
+PV = "1.0"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git;branch=${SRCBRANCH};protocol=https"
-UPSTREAM_CHECK_COMMITS = "1"
+SRC_URI = "git://git.kernel.org/pub/scm/utils/mmc/mmc-utils.git;branch=${SRCBRANCH};protocol=https;tag=v${PV}"
 
 DEPENDS = "python3-sphinx-native"
 EXTRA_OEMAKE = "C="
-- 
2.43.0


