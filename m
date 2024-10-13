Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40AC9CF2592
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 04:20:44 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.25639.1728793240339768052
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Oct 2024 21:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FfcyZOwf;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20cceb8d8b4so3159705ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Oct 2024 21:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1728793239; x=1729398039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GjJP4MzREOn1pkuj2OmKgia2RlptTedGs3bZyOeX70k=;
        b=FfcyZOwfJf/xCrl3khzczN/csPDE/GHfsBtDRE54aT/cBpaIwJjai7tauM9gleE1XJ
         xnWtBPZPSUYwC0SyUfcKq263XgB9Zah3r0CLkZcDty+ay8GVwGe7WjdbrSCxznfWbMgG
         mMqUEUb/PR5jibZDQmgmV1bauECfkzhWUhXaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728793239; x=1729398039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjJP4MzREOn1pkuj2OmKgia2RlptTedGs3bZyOeX70k=;
        b=Dqqm+hFtxUYGq/gwOw+uVg2VJuxNVuzeNG3Zat1AIcK9UZy3uilTo/UPwKnu9sHXHa
         Cprjr50MH/H1MsQ80wGXdOkE9k8hZtpKTCyvewufWKqpibyUY+Bnp7vfmNngpmbOpNSC
         wRQHp5Av450vLiX5EmECwxqdhtM0r95fcw1KJHeSIhbhXTqT8UyIM/TC3FUVgzWQuTE4
         KSB/ZLvK4R2DF/tgA6fzYY+eqnX+LBkUf/DPZ+0zO8/Beb4IbxzIJAxBjSf4l63S7Pz7
         2xIz06V3NBFQK+YaWSqRMc91ovW1vJo6s1OMJFPg+5+geYKsW2hnJjZ3h5FGrkGKnEtz
         gwMg==
X-Gm-Message-State: AOJu0YyurYRwKz69bt0JD8eTFkUA2RqMcdEy0/TaVrlS4VJ5UihyRhL7
	bTVjkQhbNqhXoZaba+jFFj9rZUySR4EGypcEJJwY79DQVVzkTSyc0SjTf4atG4WB8O/M9yLcmil
	KuEE=
X-Google-Smtp-Source: AGHT+IHFK5DqeMjgrdMdtIqNUd23IVHQxV8lB7g9iefcP9pMo5+lvM23CAQ528JCr5wA1RLfWe1W1Q==
X-Received: by 2002:a17:903:2ca:b0:20c:a04a:1e22 with SMTP id d9443c01a7336-20ca04a1fc1mr126415845ad.5.1728793239080;
        Sat, 12 Oct 2024 21:20:39 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.80.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad32d0sm44520265ad.46.2024.10.12.21.20.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Oct 2024 21:20:38 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Sun, 13 Oct 2024 09:48:22 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libarchive: Fix CVE-2024-48957 & CVE-2024-48958
Date: Sun, 13 Oct 2024 09:48:14 +0530
Message-Id: <20241013041814.13792-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 04:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205714

Backport fix:

* CVE-2024-48957 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b
* CVE-2024-48958 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../libarchive/CVE-2024-48957.patch           | 33 +++++++++++++++++
 .../libarchive/CVE-2024-48958.patch           | 37 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  2 +
 3 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
new file mode 100644
index 0000000000..fa3c8534d9
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
@@ -0,0 +1,33 @@
+From 3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:53:19 +0900
+Subject: [PATCH] fix: OOB in rar audio filter (#2149)
+
+This patch ensures that `src` won't move ahead of `dst`, so `src` will
+not OOB. Similar situation like in a1cb648.
+
+CVE: CVE-2024-48957
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ libarchive/archive_read_support_format_rar.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 619ee81e2..4fc6626ca 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3722,6 +3722,13 @@ execute_filter_audio(struct rar_filter *filter, struct rar_virtual_machine *vm)
+     memset(&state, 0, sizeof(state));
+     for (j = i; j < length; j += numchannels)
+     {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
++
+       int8_t delta = (int8_t)*src++;
+       uint8_t predbyte, byte;
+       int prederror;
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
new file mode 100644
index 0000000000..7ab2a96ca8
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
@@ -0,0 +1,37 @@
+From a1cb648d52f5b6d3f31184d9b6a7cbca628459b7 Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:50:22 +0900
+Subject: [PATCH] fix: OOB in rar delta filter (#2148)
+
+Ensure that `src` won't move ahead of `dst`, so `src` will not OOB.
+Since `dst` won't move in this function, and we are only increasing `src`
+position, this check should be enough. It should be safe to early return
+because this function does not allocate resources.
+
+CVE: CVE-2024-48958
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ libarchive/archive_read_support_format_rar.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 79669a8f4..619ee81e2 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3612,7 +3612,15 @@ execute_filter_delta(struct rar_filter *filter, struct rar_virtual_machine *vm)
+   {
+     uint8_t lastbyte = 0;
+     for (idx = i; idx < length; idx += numchannels)
++    {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
+       lastbyte = dst[idx] = lastbyte - *src++;
++    }
+   }
+ 
+   filter->filteredblockaddress = length;
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index a7a3e47412..e1eca79004 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -31,6 +31,8 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-pax-writer-fix-multiple-security-vulnerabilities.patch \
            file://CVE-2024-26256.patch \
+           file://CVE-2024-48957.patch \
+           file://CVE-2024-48958.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.35.7


