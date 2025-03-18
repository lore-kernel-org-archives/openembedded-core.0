Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F6BC36005
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:39:06 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.2941.1742323138753342560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NGiRIs5k;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff65d88103so7380865a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323138; x=1742927938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=NGiRIs5kup1+ZLQlFGpimKy/MI7EE5D1l33WHEWANe8xc3+kNSFrOMwjTPwZ893oTt
         wdL2pq2M4GKsRibqPebz1IpJ8jxYVjIHxSlord9kh55QwmNX1Nu7WVwQ81g3iCVqi6+C
         kt3kLlzXV3ssQ8EO+15QrE7sGybVAYfYyPIeZ+h2oomBXSXi98mMEkpfehp1khjr6kYc
         r+6eWrVA4KidpmOc6oyrNSx9bHz+OCudz1XNIZ971WyweAPsXYyg1nFsSNEjWIxyfVwy
         8OplzFnCAXqt6Cb7lZ1yr4yHDP5Nh0HRQ2t7WEouZ4Q5A1SY5zRzTG9GZmKnvouUTk0U
         Rq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323138; x=1742927938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=o2ggx4GHTTUFTRVGvEJ8jEmf69SpL81kgGZAp0xf5ddNqnK5+axJhVtJ0BOgMvUqu/
         ia/ug24py/08RegyM+Vph7obukqc+qletDn4LUK8Sfj83sSgnjamrArJxbBT1MTskf/p
         JY3HSYYCoPj196G9k1rfDXJCUUujeUCIY8+KKjAGy01yYppqBoo2ovfuP0UxdIemFT9p
         3FfN8860+95KtD4PMgjyiokFI64IuoCxOf5u/Ci7pgR8BERHLfJcBdKYs06xjCGEwZrT
         qKpHZdQB8qgKRzFdRNNIC+A+zjDg6vcy8zs5tH//8BTYl/lSvujvxZTUL7lO0G4zD1da
         MtXg==
X-Gm-Message-State: AOJu0YxQGzbAAAxN5AG7jrw42u+M2bd/MLXkWmzYXyXIaHmlNgPIPv20
	Nwwlw/NiZGq/y82dsOqFuoclVmqqG8o2bwdjO9m5slStu6gxy/3vNGz/Opjp
X-Gm-Gg: ASbGncsI8Ao688XeICa6kSSLEX6jG8H7T9vKvr2ay0fFS7IzeW0XmXlRG6Y6jMcl5fb
	hVkPqinnnO8AmtJDd8AKwIMTfkM8Cf7wgEiwDeOzf1UYDqExhoz+XAyt8kwQ8aB8dvqEVF6Ud85
	S9GL9A7rzcMO7WJ2d0ACYKQx8IwW2RnmnBNs21A1Gf1NZ3l7Iq9OSvFsm79a2ovA6jY9TgTHiBq
	g9nN/aZwlTyzYkQZK37+J+VvCwKawIA48s/2SetZRSy/lq2TxM7JDGRYGhXuv4FJHvCX5ztTcZO
	/S+o9GCVbhMjsQUi85qoMJCMpG5fR74nz8zV
X-Google-Smtp-Source: AGHT+IGzbMGds40+aRRQd6GH4Iv9n2m2JI2y15fP95mPHLWvMc9ksxHv7mqfkzV7gyTRFE8hSQuK9g==
X-Received: by 2002:a17:90b:28cf:b0:2f7:e201:a8cc with SMTP id 98e67ed59e1d1-301a5b1e532mr5505744a91.18.1742323137941;
        Tue, 18 Mar 2025 11:38:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 16/25] unzip: Fix build with GCC-15
Date: Tue, 18 Mar 2025 11:38:31 -0700
Message-ID: <20250318183842.2256284-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213242

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
 

