Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C15C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:46:23 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.1937.1746805572130949362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=L1IRsgcs;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so2815264a91.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746805571; x=1747410371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m1U2TU/KAyzsWJZKXVUvneimww6AxMU95NwEPmrj1wU=;
        b=L1IRsgcs/diBOJ6xGjxRXTFPCG2XYmZ8NdOUbyNVuvwQg/WvqFqUga539EK81QZOWo
         vqYxptYdaM9MZsHHqHm3gxaO1/lgvp0jql5EYidnoGi/3xOhHcqPHHZA7TZDgEyES6iQ
         XsyeN9ZnWmO/TK6tliH7Q2riI5k/9SWp7IaVaA/9U5C/9qB9f+dcV2OjDGAGSFKGCSsq
         L6b9z9KGSfg09831jpUaD55NkYdLelNET6+e+J00fI8rAivIFeQG9sQZz7fC6aDTdbzX
         WYYC3KV2SAZ4nwkqJfIeWv1jTzOJ0Um4JkdBldfH/sdL1mGFa1JgtjakNNLSTWHzKxeN
         PjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746805571; x=1747410371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m1U2TU/KAyzsWJZKXVUvneimww6AxMU95NwEPmrj1wU=;
        b=brx7n5D74KcwcnvScj2MRFyBPKweeppQyPXMzVEWnllXcxR4lEyMvqztoFzcLrtYlp
         zOYP8XiCai+WJWnGaCW7kshqt6KfrgFplZ15aWlhTk0sBdU/P6MRJMviWpgCLJ4wa+fq
         zRtKA0Tjj3FK2JsQR8B3F+QZPu13zGabZ911TOH2TFxc95gatIGgmdzxMO5zs3kEHCZj
         E6UppQgiGQqwZBs4z1/FYtZu5Zh+dzTcM/pDnkjWFqnkRE7b8WPq9xCqYlhR7uNfvOsy
         37lgz1YVLLU24I/hSkG74Ymo7rNzr+3gTOu7WLcDBuRL39YT3pWaFjYx7+Puwj9DqEkh
         LHDg==
X-Gm-Message-State: AOJu0YxwbXWCPme4WICGaMdDS37pqguXmFl+WAcQ/xpJ3YtulPVGta6F
	H+t7Yld0/oq8BU5uXRcFnnbVHAG+F9PSy2cSAFy3EwzkS6vQsEfa9ICS69WvzI+HuCy1BtbsA1h
	j
X-Gm-Gg: ASbGnct4jZH7llK17Jvw5zRyqAiTYhYWhw6KzEzJLsEvzDwQ2DP9QBCJqCz4ay3ma4e
	A6zNJS8KeCEz5kieiYeIMA1ncA92vj2Xu3KmAf9f2/cdO5MK6Ks6Tu6cAKErf3x55LbKhtqbakl
	/RJb6RGTb69XeGoN/94OQCA+WkC5dSfAiBpXUrdNYyFgSGVe0iPaYLKEOxVAR3P+Blc5xahphZ4
	KcLG96ZytzYb7K6UQ6qXQHDRPX7DsFLj7YcnASeHcTpYQUkc1hSnJQW2TFMzVJCYCPhxCg0t2uh
	CNwzs3fCv0zGh0Wm3Iiy8cMl04zhe/8i
X-Google-Smtp-Source: AGHT+IEFza9xba9T4hTHf9cNa4pwtZwuOgxDWaFyP/YYUoVyp9DgLhmcPSOSTd22dIodqB05BtY2nA==
X-Received: by 2002:a17:90b:394a:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-30c3cc109a9mr5990556a91.3.1746805571347;
        Fri, 09 May 2025 08:46:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39dee9aasm1983093a91.25.2025.05.09.08.46.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:46:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] connman :fix CVE-2025-32743
Date: Fri,  9 May 2025 08:45:53 -0700
Message-ID: <9558ec2091964556b47b0909c5d243aee5bafb6f.1746805404.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746805404.git.steve@sakoman.com>
References: <cover.1746805404.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216232

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
 .../connman/connman/CVE-2025-32743.patch      | 48 +++++++++++++++++++
 .../connman/connman_1.42.bb                   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
new file mode 100644
index 0000000000..b31c59aa70
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
@@ -0,0 +1,48 @@
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
+ src/dnsproxy.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index 7ebffbc..1a5a4f3 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1669,8 +1669,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
+				gpointer request, gpointer name)
+ {
+	int sk = -1;
++	int err;
+	const char *lookup = (const char *)name;
+-	int err = ns_try_resolv_from_cache(req, request, lookup);
++
++	if (!lookup || strlen(lookup) == 0)
++		return -EINVAL;
++
++	err = ns_try_resolv_from_cache(req, request, lookup);
+
+	if (err > 0)
+		/* cache hit */
+--
+2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/recipes-connectivity/connman/connman_1.42.bb
index 91ab9895ac..3a1c9802bd 100644
--- a/meta/recipes-connectivity/connman/connman_1.42.bb
+++ b/meta/recipes-connectivity/connman/connman_1.42.bb
@@ -7,6 +7,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://no-version-scripts.patch \
            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
            file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
+           file://CVE-2025-32743.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.43.0


