Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5C4C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 20:35:56 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.17320.1747327003777222754
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 09:36:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=nfKpecaM;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.128.52, mailfrom: dario.binacchi@amarulasolutions.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso13167965e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 09:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747327002; x=1747931802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R54rXjySdWHz/NYK5Aj2Rqe320oyZ3CoVxs0lCT5LCo=;
        b=nfKpecaMxGBpI+4vxWy6L7mfoi5MDy7r0aZHta3NpcxsrFwd0Dt6kJ9PWPdEhfRxwk
         /eqN5yXokdGqwskHjP0SwR6xwUU/61zTPAWZaHDOZ5TdQmZaarWCvwCKTJGzXQhYDbCs
         AtKGvtouQnyiN06uIF8VRfy5DuuwqkbFjle/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747327002; x=1747931802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R54rXjySdWHz/NYK5Aj2Rqe320oyZ3CoVxs0lCT5LCo=;
        b=Q0oPDV51dojVZrV9QHVK2PYuik+UkSwUB1eMAFAV08fZlS8SN/kk+FvL51nAfrrs+y
         CViUJEPnFlwuv7uc0Rqk7GvKIopechDNqOvBM0ncQevImRY4PmeIHnPfNyB3j3vsNvk9
         sv0SWJ1YeFzbxx+A2n7EYn8LP5+hP38aqPUDhGu09TsULlvm4jV0uJwQT+EmCMTwCVTL
         LmOkO8R9b8fUwvjPyX1zEGyWQYNbuSkLplf85OCGKX4U+lMYvXZJtDPbzEo9J3cQu4+3
         hGkbL88jo2Dw4jUxlVT+9Sh+PbW1eVoaIO8OHETkMlKTY8rVG35oYMzcf19mI4+x9OxS
         QVrA==
X-Gm-Message-State: AOJu0YySHhpjjWk6kY7BLVNBZX9wj16RSNyWXjO+U0BMjmvjFvgSfT+R
	wVOCs2mJvZnLJxdy6DjDhmjX7yh1I3mPdSiIT0YzF1toR99oCe/HZhdosp9jZFNxcp6uLboFSvB
	itzRK1Ho=
X-Gm-Gg: ASbGncs2rkWNk26F/CrRFxVMAwofLgVu2bzXpqtdSs0uf0ma8GfxRZ4U7uSyBIlFuqU
	ZrRtIMotWIYl1K90vXNM5TQdlEyqtHhHamtAdPDf29yDcQWrjeSymYtFLLyR/TNYtDUUnkvWxMq
	5uKSN3+VCEeweElYB8uwDsf0hy1lylt56FlY1cjNfUWYniLF90kI4L4kaHlzI90vbtQ7ilXSagK
	284BSCLU+lZ4W1FLiRJVRL35g47a6K6cS/LmZneKRy/mQQrRCHvpiWy9dvwx5yCgFtUO0TPTskg
	/tWVpcjCIFPxwLdH+j+hf2Xl7TrJeSjZwx5WOT7FHPKU/2YTILx3mrhAtIw9Zi2X45+8Kp7g1IR
	L9v5f7ZGhgWP9P6RyPQdNHMM4i0OoTQpXEf2xSGqlPJK3Qi82MYALvg==
X-Google-Smtp-Source: AGHT+IHwjk1aPkd5t6QDXAwzRUVjuHCYGDVsc5IvMiz1SMzUuaKMlX/lV5OaMtneUDPF4FEx070uUQ==
X-Received: by 2002:a05:600c:34cf:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-442fd664aa5mr1972865e9.23.1747327001769;
        Thu, 15 May 2025 09:36:41 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdc73sm2631335e9.2.2025.05.15.09.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 09:36:41 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [meta-oe][PATCH 1/1] connman: patch CVE-2025-32366 and CVE-2025-32743
Date: Thu, 15 May 2025 18:35:28 +0200
Message-ID: <20250515163528.931598-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 20:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216705

Cherry-pick patch mentioning these CVEs.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../connman/connman/CVE-2025-32366.patch      | 42 +++++++++++++++++
 .../connman/connman/CVE-2025-32743.patch      | 47 +++++++++++++++++++
 .../connman/connman_1.44.bb                   |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
new file mode 100644
index 000000000000..f7cda6c07c53
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
@@ -0,0 +1,42 @@
+From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=EC=8B=A0=EC=9C=A4=EC=A0=9C=28=ED=95=99=EB=B6=80=EC=83=9D-?=
+ =?UTF-8?q?=EC=86=8C=ED=94=84=ED=8A=B8=EC=9B=A8=EC=96=B4=EC=A0=84=EA=B3=B5?=
+ =?UTF-8?q?=29?= <ioerts@kookmin.ac.kr>
+Date: Mon, 12 May 2025 10:48:18 +0200
+Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
+
+In Connman parse_rr in dnsproxy.c has a memcpy length
+that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
+and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
+than the amount of remaining packet data in the current state of
+parsing. As a result, values of stack memory locations may be sent
+over the network in a response.
+
+This patch adds a check to ensure that (*end + *rdlen) does not exceed
+the valid range. If the condition is violated, the function returns
+-EINVAL.
+
+CVE: CVE-2025-32366
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4]
+---
+ src/dnsproxy.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index 7ee26d9ff886..1dd2f7f5d47e 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -998,6 +998,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
+ 	if ((offset + *rdlen) > *response_size)
+ 		return -ENOBUFS;
+ 
++	if ((*end + *rdlen) > max)
++		return -EINVAL;
++
+ 	memcpy(response + offset, *end, *rdlen);
+ 
+ 	*end += *rdlen;
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
new file mode 100644
index 000000000000..87ad240e4273
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
@@ -0,0 +1,47 @@
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
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f]
+---
+ src/dnsproxy.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index f28a5d7551a4..7ee26d9ff886 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -1685,8 +1685,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
+ 				gpointer request, gpointer name)
+ {
+ 	int sk = -1;
++	int err;
+ 	const char *lookup = (const char *)name;
+-	int err = ns_try_resolv_from_cache(req, request, lookup);
++
++	if (!lookup || strlen(lookup) == 0)
++		return -EINVAL;
++
++	err = ns_try_resolv_from_cache(req, request, lookup);
+ 
+ 	if (err > 0)
+ 		/* cache hit */
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 00e69182d789..cdb1065628b8 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -21,6 +21,8 @@ DEPENDS  = "dbus glib-2.0"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
+           file://CVE-2025-32366.patch \
+           file://CVE-2025-32743.patch \
            "
 
 SRC_URI[sha256sum] = "2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff"
-- 
2.43.0


