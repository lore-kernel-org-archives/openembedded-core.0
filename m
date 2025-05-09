Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D079C3ABCE
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 16:17:34 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.2670.1746807446922827499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 09:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e38jlfjF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7394945d37eso2139787b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 09:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746807446; x=1747412246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYPj4sELtSNWEv1K9mazK6fUdo3lVb169EizBwCDxzs=;
        b=e38jlfjF6MxWz0y7NYw2NV6cIFp2AoDhPhXDb5aiYPedN6UZhBxO0KrlQtKiQQ7vHU
         i47YPAnB/FohZ7S/3PzKp08/8r3TBlO2FPlQ7qPjA7i750vV08RnHUo1AYnS9uxbL5U7
         AuLFURVmOsw92QHI2iLPV9I5BwMI2CwOkdTgl+sC+a8YEPKOlgrPBBLTKNjZg+sNFxJJ
         azATg6o9UiKD+hl3/sPt+M8kONHC9kzeBydfPeSWUWHdKfdORQ4YvDClJWAQ58cQ8LSu
         6P4h63hMMF1JZKlQIw8B0JocHb/vbo88nTc0UW6hz02ZwW1Hx5NaGLBa4Gwtxc0H0wN8
         +1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807446; x=1747412246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYPj4sELtSNWEv1K9mazK6fUdo3lVb169EizBwCDxzs=;
        b=ip6Z49F5bQJ/+tKtSDACnlp0ehGhOO1XpFbIvdmkjDpfbvYJzaIIS/sZVxMLUYIsnD
         kN3iOWQPWKYfU4gwB/J6LR7HqZ9FSBKkvSfamRqzKvM0zER2BAQXYme3llvYNLsyPjqO
         zD+cq1Do6aMyXgw5fPSc6lR9XOCX1wxgN4PIazWoSXpZgsaU+sJFQUo1inabDPzWK1Ml
         3hP1NKWkTnbsjRPFGJZf1OmAq3mh7nWeWniAkrOlnJj2kpJn/AvbMze/UWm4/xFc7idU
         E5lZQzP6UPykD7SSIiFTAHnLbMip48DZbB4MmU78LC1whI2/jZ7QwcVTvOXt6TXQQq5+
         MCsA==
X-Gm-Message-State: AOJu0YyJlLGZG0xe0R1gmbLl0maI329bx/M0aF1sEYrx2Iw8zsPYMXMG
	ZpOFr6KcpjhA2Fw942MWkPA4lPRgrl2MyFIRVTKcOl2a/yUphGOdf89LtpWUFbTjy5dl6qSe7JR
	O
X-Gm-Gg: ASbGncuR1gXbUsTAhc/4rFw3VqUGQRywFUwyLtNunCfdmeMxbUiZyM+TAld6eFz1MU2
	oFK3YYebz5jkU09RYRGPVrYD0tS8epoqb7qIPv0S8bEb2n4CgSaCoIQu5KYodJloPeq6iggf8EY
	A/OWcuUOS6bjRM0WqXJPWHYjZeMOphakv0Z80t/WvDsBXXsFoovTBbjUbMII3nKFhF5gYPOkEiv
	uNkYgDbvpgE9uI8vePZRnchu4Od/fA9gMmU814utR8BrTmGOQQfxvbhd9IOmY9jj9KZcsjUX+xs
	sygqX6rfe16AaaADyyrOzs7DIWTCZ00U
X-Google-Smtp-Source: AGHT+IEDI5qopn0c6KhSOqouFaZJntW8vAgf/Ym8ZScf3guUZEmEGncnwLrzJ4GPRWg97bc6Gk9j4w==
X-Received: by 2002:a05:6a21:3a88:b0:1f5:9069:e563 with SMTP id adf61e73a8af0-215abb397e9mr5485195637.21.1746807446080;
        Fri, 09 May 2025 09:17:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742377050fesm1919134b3a.24.2025.05.09.09.17.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:17:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/6] connman :fix CVE-2025-32743
Date: Fri,  9 May 2025 09:16:41 -0700
Message-ID: <ece0fb01bf28fa114f0a6e479491b4b6f565c80c.1746806788.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746806788.git.steve@sakoman.com>
References: <cover.1746806788.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 16:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216239

From: Praveen Kumar <praveen.kumar@windriver.com>

In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
can be NULL or an empty string when the TC (Truncated) bit is set in
a DNS response. This allows attackers to cause a denial of service
(application crash) or possibly execute arbitrary code, because those
lookup values lead to incorrect length calculations and incorrect
memcpy operations.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32743

Upstream-patch:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2025-32743.patch      | 43 +++++++++++++++++++
 .../connman/connman_1.41.bb                   |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
new file mode 100644
index 0000000000..8656b37bd3
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
@@ -0,0 +1,43 @@
+From d90b911f6760959bdf1393c39fe8d1118315490f Mon Sep 17 00:00:00 2001
+From: Praveen Kumar <praveen.kumar@windriver.com>
+Date: Thu, 24 Apr 2025 11:39:29 +0000
+Subject: [PATCH] dnsproxy: Fix NULL/empty lookup causing potential crash
+
+In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
+can be NULL or an empty string when the TC (Truncated) bit is set in
+a DNS response. This allows attackers to cause a denial of service
+(application crash) or possibly execute arbitrary code, because those
+lookup values lead to incorrect length calculations and incorrect
+memcpy operations.
+
+This patch includes a check to make sure loookup value is valid before
+using it. This helps avoid unexpected value when the input is empty or
+incorrect.
+
+Fixes: CVE-2025-32743
+
+CVE: CVE-2025-32743
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/dnsproxy.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index cf1d36c..334dd00 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1615,6 +1615,9 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
+	char *dot, *lookup = (char *) name;
+	struct cache_entry *entry;
+
++	if (!lookup || strlen(lookup) == 0)
++		return -EINVAL;
++
+	entry = cache_check(request, &type, req->protocol);
+	if (entry) {
+		int ttl_left = 0;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
index 27b28be41c..caf0610c3f 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -9,6 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://CVE-2022-32293_p2.patch \
            file://CVE-2022-32292.patch \
            file://CVE-2023-28488.patch \
+           file://CVE-2025-32743.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.43.0


