Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04CEFC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.2952.1742372192059047432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSz3tbYv;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224019ad9edso13908335ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372191; x=1742976991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=DSz3tbYvVmKA1Yn3LXCIYSzpuLOe17stwXbBs1PaBAHcjFgkmToyNoDF7AbK2kQhv/
         75iVEpFn8jM+3T8ntlPUzb51WuDJDGa5KcF1uZrjlfUCjQjDrInUk1xLIc1l54oYHUlx
         +wnbNFwSenwG0wPdYGS+VrbNbtvao1h0C4jg3tulsiuyemW99XpvfTqJITVql/6MU14R
         3ZreKr42dxJCnanR5WOJ8AbDUShra/i/+sFUfTIySCurXa/4mu/mY6k0C0keuGmSeIcr
         xEQBRaFeJsgy7b5ItFx8V+4umjGp7hBBjwi2MwzdfV1wcGdtGtoLQHYusVGS7R4paIMw
         vr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372191; x=1742976991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=UvrJQBHj60tydglyjDgbPCRAIWhqsIfAPUUKAUtCdgTNY1r4tagh4Iv7oEw3JBT72W
         VdAMRNFkBu5lN9DUuUnU6QqXqA/ISvMBpQsaH65229HspWNZrCt5Mdc+k5OlSwsCAeDj
         hpVIBePjAOgtY07A8Gcxthne12POCCaM5qvebpJTZGY8Twtsm1LnyI6BroSDJh2yPANg
         Mn7p57uKQJOpJY07Lz9EPU997PUmtWZnSiMvCnv00cx02EJC/au4ayyJYwhMAqXPi5sQ
         t00Ef7PRBOOl3hTlMj4PezK05DxW57IydEL0Q4LOxbID1mVWRMevGIGge92DzdcZceJa
         5+pw==
X-Gm-Message-State: AOJu0YxLnnI0S2ClcVkVEEK3ItL5oO/1BGO6WQQK7BptbBMJ2z06BVrD
	34OCLv/UOXDHPyUZAnpdoXVpfrad/PEyjfZJsxyFzWG3AOe/JDfjvUn3yl29
X-Gm-Gg: ASbGncsU6E7bDXjF5GWBfnoWuUTChArqdLqPvSmcqVKOyiCLs3UI6L5fNPZj0Fl3XF9
	89heFyUy6QAj3MSCGPVxCB8GBWn84UHtHDhjxDNXHnXAfpGyBBo9m3cX+7b5fpKtU4boEmjtAFu
	GAIt/iJHIgt7z1udYyOLcFAxMYH6JrSMOb0E9YsGg9gWhR6ezys9IQRxzCgHVLOrM/pQdbhqOyg
	mc9ZTbNWkFewReU7viYDkydqCU+R+9PADNNarauUXXtgNTVrvcLpR88srI5FQdAO6Pmgx84ve1o
	oeCUmNlTWW6F0i0gc8grhT5QBY8lctMo2sQG
X-Google-Smtp-Source: AGHT+IG6May+C2mTCg0IdUGosVYiGgjfWW3djVpBuUMAA00/x2HkedBfbzzD78/xUdX+e9Y11ScSmQ==
X-Received: by 2002:a05:6a21:3993:b0:1f5:a98d:3d8a with SMTP id adf61e73a8af0-1fbed40be09mr3490742637.40.1742372191235;
        Wed, 19 Mar 2025 01:16:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 16/25] unzip: Fix build with GCC-15
Date: Wed, 19 Mar 2025 01:15:49 -0700
Message-ID: <20250319081610.3536475-21-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213287

Add a patch to remove redundant declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/unzip/unzip/gcc15.patch | 17 +++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch

diff --git a/meta/recipes-extended/unzip/unzip/gcc15.patch b/meta/recipes-extended/unzip/unzip/gcc15.patch
new file mode 100644
index 00000000000..42a2f81681e
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/gcc15.patch
@@ -0,0 +1,17 @@
+Do not redefine gmtime(), localtime()
+
+They are already provided by system time.h header
+
+Upstream-Status: Inactive-Upstream [need a new release]
+
+Sign-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/unix/unxcfg.h
++++ b/unix/unxcfg.h
+@@ -117,7 +117,6 @@ typedef struct stat z_stat;
+ #  endif
+ #else
+ #  include <time.h>
+-   struct tm *gmtime(), *localtime();
+ #endif
+ 
+ #if (defined(BSD4_4) || (defined(SYSV) && defined(MODERN)))
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index c13e7a008ea..0a88b4c092b 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://gcc15.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 

