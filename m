Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD3BCA0EFA
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 20:44:04 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.177.1755809035455329719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 13:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pztllmEc;
 spf=pass (domain: konsulko.com, ip: 209.85.208.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-61a94bd82a5so2584113a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 13:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1755809033; x=1756413833; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=heS4r7rOjExXOBNtLB1xTUhpIbWsZSoiwqn51HZR6EU=;
        b=pztllmEc/h8A6Ak6Ssjvb8ovMX0fRiQ5I+BXsb0RorSjP/xJsWNneiWk7zy2cOmAnt
         bd3hW6C+K8NB1kZeWX5efoZcfPeWP4odmW/2nOS+tRge3fAyZYrB6NpITAKXJjCZWpiz
         dkbQ4XvHsKc3zkyRBr6KcOLz6Hpp06PBqjv6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755809033; x=1756413833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=heS4r7rOjExXOBNtLB1xTUhpIbWsZSoiwqn51HZR6EU=;
        b=sqTBNJ+UgWYJcfTOaPXsMRhf+HfUOXKhUnN7tv17qy92d/OyK1QmJaC9oxjySUiTTm
         rpfXxyjGB6dH7U8nmAWi3zBHYZw9ucM0vHAzjgutyx9aHm/d3Og7SCkXbezmNBBhTKmY
         4+OdEUyg9/FtIPriIIU60JLDBx2N3zQv+PuxepsIkH0ht1PHt/Dg5OYeI7eanyq0D9QF
         1gF3c0EqfJeHTQn7MeTJUmfh2tee04wRdZNPlxly1w5k/Bm0eG2l+u7rFNgoHKIaVOrJ
         mdV+LwsKT9A6Ha1hLQc/5lFp5jHk4pQf5Cyv1D6N7eD6YdPfOccjSmDhqsLNEIBaCwGj
         TBGw==
X-Gm-Message-State: AOJu0Ywm31Ap81dJ5qS5MuGmw31AzwvyC0gk6YQQzLgpiSb4IdNZGTew
	h8Or3n2doIKlIQ12Obvvy1JO+rrqVec4KdAfZQ0z3qtqiErLcwLnQ063dvqKEimc1jOKuNxW1I5
	qP190
X-Gm-Gg: ASbGncu5szA9fdt3PpMwDvFlPZ9Btd869ui3QKCgQZfhaGLvdCTd8deK+0dcTZpQVN6
	FQkOV8bkvX2B4jGcok0ltpAj1seJrGcq9jq2sYhAwdrKR3EhXNnlzywwUlKqGrpNwZnfmzb4lT4
	fp50mDNDoGYQOWlwN0F01v8JW1j69QY6h1dJ1/QXarVcGAGd+iBVS+xe5ZQ9xYE2V5pT+W2RT9x
	GP16fmrpGsT7RhgJ1jkbNe/3rjBXAUA8OkAwrspcYUBK9qLGVzqhLZkHWV0qFSdYSCSwBwiDT8t
	l4WhSg6T4pGoAqK7poVX0jcQvHQAK0Z6JDmKA/vwsWkPdt+LFS0E3OfNRiyT0kRYXe13/FBjAxu
	xof7z6xEb5TBd5erFQIkvh4o/NXTkFVAC65Q6kPJGb1p/oIk=
X-Google-Smtp-Source: AGHT+IE+MzmoHd2/T6uPij7z4rfrgRwGm2tz8zdflvR6TFgjDAYbkxiLrTxI+aWpFDAw8e3loZOV5w==
X-Received: by 2002:a17:907:6d06:b0:af9:2bb9:ea36 with SMTP id a640c23a62f3a-afe28feb8eemr39790566b.7.1755809033424;
        Thu, 21 Aug 2025 13:43:53 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4cc3e3sm448893966b.99.2025.08.21.13.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 13:43:52 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] connman: Upgrade 1.44 -> 1.45
Date: Thu, 21 Aug 2025 23:43:50 +0300
Message-Id: <20250821204350.272899-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 20:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222282

Upgrade to release 1.45:

- Add missing newlines on error messages
- timezone: Replace Localtime file copy with symbolic link
- Fix CVE-2025-32366 vulnerability
- Fix CVE-2025-32743 vulnerability
- vpn: Fix extracting of PrefixLength D-Bus value
- vpn: Fix mem leak of gid_list in task setup
- dchpv6: Set err to 0 when client creation succeeds

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../connman/connman/CVE-2025-32366.patch      | 41 ----------------
 .../connman/connman/CVE-2025-32743.patch      | 48 -------------------
 .../{connman_1.44.bb => connman_1.45.bb}      |  4 +-
 3 files changed, 1 insertion(+), 92 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
 delete mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
 rename meta/recipes-connectivity/connman/{connman_1.44.bb => connman_1.45.bb} (98%)

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
deleted file mode 100644
index 62f07e707a..0000000000
--- a/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
-From: Yoonje Shin <ioerts@kookmin.ac.kr>
-Date: Mon, 12 May 2025 10:48:18 +0200
-Subject: [PATCH] dnsproxy: Address CVE-2025-32366 vulnerability
-
-In Connman parse_rr in dnsproxy.c has a memcpy length
-that depends on an RR RDLENGTH value (i.e., *rdlen=ntohs(rr->rdlen)
-and memcpy(response+offset,*end,*rdlen)). Here, rdlen may be larger
-than the amount of remaining packet data in the current state of
-parsing. As a result, values of stack memory locations may be sent
-over the network in a response.
-
-This patch adds a check to ensure that (*end + *rdlen) does not exceed
-the valid range. If the condition is violated, the function returns
--EINVAL.
-
-CVE: CVE-2025-32366
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4]
-
-Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
----
- src/dnsproxy.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/dnsproxy.c b/src/dnsproxy.c
-index 7ee26d9..1dd2f7f 100644
---- a/src/dnsproxy.c
-+++ b/src/dnsproxy.c
-@@ -998,6 +998,9 @@ static int parse_rr(const unsigned char *buf, const unsigned char *start,
-	if ((offset + *rdlen) > *response_size)
-		return -ENOBUFS;
-
-+	if ((*end + *rdlen) > max)
-+		return -EINVAL;
-+
-	memcpy(response + offset, *end, *rdlen);
-
-	*end += *rdlen;
---
-2.40.0
diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
deleted file mode 100644
index c114589679..0000000000
--- a/meta/recipes-connectivity/connman/connman/CVE-2025-32743.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From d90b911f6760959bdf1393c39fe8d1118315490f Mon Sep 17 00:00:00 2001
-From: Praveen Kumar <praveen.kumar@windriver.com>
-Date: Thu, 24 Apr 2025 11:39:29 +0000
-Subject: [PATCH] dnsproxy: Fix NULL/empty lookup causing potential crash
-
-In ConnMan through 1.44, the lookup string in ns_resolv in dnsproxy.c
-can be NULL or an empty string when the TC (Truncated) bit is set in
-a DNS response. This allows attackers to cause a denial of service
-(application crash) or possibly execute arbitrary code, because those
-lookup values lead to incorrect length calculations and incorrect
-memcpy operations.
-
-This patch includes a check to make sure loookup value is valid before
-using it. This helps avoid unexpected value when the input is empty or
-incorrect.
-
-Fixes: CVE-2025-32743
-
-CVE: CVE-2025-32743
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d90b911f6760959bdf1393c39fe8d1118315490f]
-
-Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
----
- src/dnsproxy.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/src/dnsproxy.c b/src/dnsproxy.c
-index f28a5d7..7ee26d9 100644
---- a/src/dnsproxy.c
-+++ b/src/dnsproxy.c
-@@ -1685,8 +1685,13 @@ static int ns_resolv(struct server_data *server, struct request_data *req,
-				gpointer request, gpointer name)
- {
-	int sk = -1;
-+	int err;
-	const char *lookup = (const char *)name;
--	int err = ns_try_resolv_from_cache(req, request, lookup);
-+
-+	if (!lookup || strlen(lookup) == 0)
-+		return -EINVAL;
-+
-+	err = ns_try_resolv_from_cache(req, request, lookup);
-
-	if (err > 0)
-		/* cache hit */
---
-2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.45.bb
similarity index 98%
rename from meta/recipes-connectivity/connman/connman_1.44.bb
rename to meta/recipes-connectivity/connman/connman_1.45.bb
index 1b0fbe438c..cfc6114712 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.45.bb
@@ -21,11 +21,9 @@ DEPENDS  = "dbus glib-2.0"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
-           file://CVE-2025-32743.patch \
-           file://CVE-2025-32366.patch \
            "
 
-SRC_URI[sha256sum] = "2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff"
+SRC_URI[sha256sum] = "77128cce80865455c4f106b5901a575e2dfdb35a7d2e2e2996f16e85cba10913"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"
-- 
2.39.5


