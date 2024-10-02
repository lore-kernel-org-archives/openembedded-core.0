Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3347CEB2E2
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 13:13:14 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.6937.1727874794134879211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Oct 2024 06:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s0DcPZtw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71b8d10e9b3so4015242b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 06:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727874793; x=1728479593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoDfa1UsCIAXmoGRSIl66puZjtmUc12FIRmEHUhWgu8=;
        b=s0DcPZtwY8fjRfNHLUljJiEn1M1fVs3HuiJcrtjtS/HXsM6Tvr4cF3X/LMJXarw2W7
         NQiWHkuAweyZSoziL13ckH3x7MmB7r+v+9u9bFFHF4XBnlMmBX3oZYe1756FavBvEBE8
         NH1y2NyVhG1CbeoWXEAT4QLYmPmZ4ziPS9hQCN2z6ZHw3BEm07YJfnKxb1339MVHsy0f
         pQjfZcmihmS2Zruuo/yv1ZZpQX3Dl4sInkXqFPdVgZeCaho/hZwDZ2syNJAYWS3bo1Jk
         8/YVwlC6LjVppUOaRyB2i5UwXmvLclxhyGC14uKNlPtdsNK5oqvSbzQsFZvgHOBT2Oai
         4RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874793; x=1728479593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZoDfa1UsCIAXmoGRSIl66puZjtmUc12FIRmEHUhWgu8=;
        b=fBKc/5qQmFVXLOAPRovUPdLWQTTNHD85jp2Wsmq/I1Sho0oc2N1OwFg+cYd2gybhtZ
         aKG4y8XldUnteEWJxysZHyhNmNphQkhWG3iENebstuJUPllZo8hSw0DCzV/p5bfanUdw
         aW8nJ7FIAdDML1P6FM2gNhNzWSeyWu0Qoa9+YD+LEsAwRqhU03jcnrFExw/66gYYfpai
         KKSRiu5MXL8Y/ACB3pgnQUz7zaq+WWMCd80HCX4PSTFyt/+GnWgnru2biuBk82FapfIY
         drWbk/Ssk8tNl1iwzG7hDFODR0jV36qcSa0udK+e7kWGaByJz+W78bTPz3sHpDs8fZdz
         2Rjw==
X-Gm-Message-State: AOJu0Yx/UZ7IcO/p5712AJBuzjPjUflM114rhMVz9iUaIgXzQGmAUytd
	cN5T55qq5vyVkoy0Vs79VvM0lMacMJ90IltgdSAJncMAkXU88osaI7XIRXrrH9P9AArglVJNIwz
	Xsh0=
X-Google-Smtp-Source: AGHT+IF41Io9NFGTxziRUM6D+xt5z8i13zoLi4A94uX2P1/r0mKlwNtPfy2VxJiu2CAeX/82/0hcdw==
X-Received: by 2002:a05:6a00:2eaa:b0:717:8b4e:98b6 with SMTP id d2e1a72fcca58-71dc5d549c0mr4927792b3a.21.1727874793263;
        Wed, 02 Oct 2024 06:13:13 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2649c775sm9773436b3a.29.2024.10.02.06.13.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:13:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/16] procps: patch CVE-2023-4016
Date: Wed,  2 Oct 2024 06:12:46 -0700
Message-Id: <94521a1e49e8fd9193211f486995d2e504f99d3f.1727874367.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727874367.git.steve@sakoman.com>
References: <cover.1727874367.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Oct 2024 13:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205190

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Previous patch[1] for CVE-2023-4016 is insufficent.
Backport more from upstream master.

There is one change needed to apply this patch:
* change file location from local/xalloc.h to include/xalloc.h

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-extended/procps/procps/CVE-2023-4016.patch?h=kirkstone&id=71d0683d625c09d4db5e0473a0b15a266aa787f4

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../procps/procps/CVE-2023-4016-2.patch       | 60 +++++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.17.bb |  3 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016-2.patch

diff --git a/meta/recipes-extended/procps/procps/CVE-2023-4016-2.patch b/meta/recipes-extended/procps/procps/CVE-2023-4016-2.patch
new file mode 100644
index 0000000000..7269068045
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/CVE-2023-4016-2.patch
@@ -0,0 +1,60 @@
+From 93bb86a37a0cf7b9c71e374f3c9aac7dbfe2953a Mon Sep 17 00:00:00 2001
+From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+Date: Fri, 27 Sep 2024 14:22:32 +0800
+Subject: [PATCH] procps: patch CVE-2023-4016
+
+ps/parser: parse_list(): int overflow for large arg, free() of uninit. ptr
+
+* ps/parser.c:parse_list(): Regression (2c933ecb): node->u is uninitialized at
+  free(node->u) when reached before node->u=xcalloc().
+* ps/parser.c:parse_list(): When "arg" is very long, CVE-2023-4016 is triggered.
+  2c933ecb handles the multiplication issue, but there is still the possibility
+  of int overflow when incrementing "items".
+
+CVE: CVE-2023-4016
+
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/f5f843e257daeceaac2504b8957e84f4bf87a8f2]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ include/xalloc.h | 2 +-
+ ps/parser.c      | 3 ++-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/include/xalloc.h b/include/xalloc.h
+index 8b4d368f..a8046892 100644
+--- a/include/xalloc.h
++++ b/include/xalloc.h
+@@ -42,7 +42,7 @@ void *xcalloc(const size_t nelems, const size_t size)
+ {
+ 	void *ret = calloc(nelems, size);
+ 	if (!ret && size && nelems)
+-		xerrx(XALLOC_EXIT_CODE, "cannot allocate %zu bytes", size);
++		xerrx(XALLOC_EXIT_CODE, "cannot allocate %zu bytes", nelems*size);
+ 	return ret;
+ }
+ 
+diff --git a/ps/parser.c b/ps/parser.c
+index 5c92fce4..a94b49ff 100644
+--- a/ps/parser.c
++++ b/ps/parser.c
+@@ -185,6 +185,7 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+   /*** prepare to operate ***/
+   node = malloc(sizeof(selection_node));
+   node->n = 0;
++  node->u = NULL;
+   buf = strdup(arg);
+   /*** sanity check and count items ***/
+   need_item = 1; /* true */
+@@ -198,7 +199,7 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+       need_item=1;
+       break;
+     default:
+-      if(need_item) items++;
++      if(need_item && items<INT_MAX) items++;
+       need_item=0;
+     }
+   } while (*++walk);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
index 897f28f187..bbec5a543c 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://0001-w.c-correct-musl-builds.patch \
            file://0002-proc-escape.c-add-missing-include.patch \
            file://CVE-2023-4016.patch \
+           file://CVE-2023-4016-2.patch \
            "
 SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
 
@@ -101,4 +102,4 @@ ALTERNATIVE_LINK_NAME[ps] = "${base_bindir}/ps"
 
 ALTERNATIVE:${PN}-sysctl = "sysctl"
 ALTERNATIVE_TARGET[sysctl] = "${base_sbindir}/sysctl"
-ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
\ No newline at end of file
+ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
-- 
2.34.1


