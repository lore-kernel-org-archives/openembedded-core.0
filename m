Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF8E788B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 21:07:01 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id m22-v6so6615049pls.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bQ0eVRhrZyX0pn+p4rlIkv6k5YSDhv6ZXSjMq3pXwOA=;
	b=gveut8tml13BhgRKLJ4P3xNyW8Ni+Yehic4Rz/8tFBonO7QwrMHwfzN50qRwSAGt9w
	ESPHqyldTKkPbMgnnwFPPmw5I2ydrN+xPhkmSubJuldofiuyWB01qcquPdjFvdWJ1QQ6
	r+L+irCc1g6mT176YzY/P0oXoeR5r2cpwVWlPEY+PHF0QueAbcJ4JWLmE8V/xq+L6r6y
	1R5zQHktyFzdjOy27XVgbw7XSY2+mFj9p3tn24mSqTC2WZG1CIpzRSPB97SiRsKRdsNY
	uX8fBfIHg9U1gGjKCStJpVVEiS10f5D+M3yL0rd0vwJyvUyaEW0s4h6NuOZyyzqpNRhw
	dQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bQ0eVRhrZyX0pn+p4rlIkv6k5YSDhv6ZXSjMq3pXwOA=;
	b=NcFw7XxJtcfryi+6EBoSLJc4pWAR8LDJnYE9bvDWvGkA9IuuohrpFLh7cdVFsg2FvT
	33cp/dYL3DYbpMzysn/RfvhVkb11MORcLJX4MWUxrPrOBiUqeI7T5149MPqU7UKPfv5J
	rEQXfC4AQ9h29GDiG9XyL8Z0VGpE1UgEV6fHZiLNDPHVC8toQmey6xBqZTgEemhteVy3
	uULtHWvVm2eEh//mf3x7LELJm/6bfKvxYNdldB0Twnp4n2zVCU4zeJcmQH0DsV9/Fyio
	iU8hcRJQ3RU07+4nBbAZvO2Tg+nQieTBiS7kpWirv0ymaMcYLoxpIQsnbLd1Uz8NB5bW
	dUzQ==
X-Gm-Message-State: AElRT7FJ/tNwtibOhyTJphquFmzqOWeYYqb2CJCJKi+/LuZ/eIJ9gfRH
	cj5chN6CYTs2QWpbBUrHqsclig==
X-Google-Smtp-Source: AG47ELuXG5F8o3TE9WEzywfLMkr/LClFm8d3YLaAJyVBkVKmyKrcG+Nm9TWlbDkuL/h9QlYOZFaI9w==
X-Received: by 2002:a17:902:20ca:: with SMTP id
	v10-v6mr3639763plg.9.1521234422302; 
	Fri, 16 Mar 2018 14:07:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	l64sm14241908pga.33.2018.03.16.14.07.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 14:07:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 14:06:53 -0700
Message-Id: <20180316210653.12330-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [PATCH V2] gcc: Do not use --with-linker-hash-style if LINKER_HASH_STYLE is empty
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2018 21:07:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We allow to set LINKER_HASH_STYLE to be empty so this would fail
since --with-linker-hash-style needs an argument and cant be empty

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Use inline if statement instead of old syntax

 meta/recipes-devtools/gcc/gcc-7.3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index d56d2c5e06..0f9c32cad8 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -100,7 +100,7 @@ EXTRA_OECONF_BASE = "\
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
+    ${@'—with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \
     --enable-linker-build-id \
     --with-ppl=no \
     --with-cloog=no \
-- 
2.16.2


