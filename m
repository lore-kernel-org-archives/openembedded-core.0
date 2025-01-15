Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B93C02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:24 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.22458.1736951895642650276
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nuchaN4O;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2166f1e589cso148389655ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951895; x=1737556695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khwjSC1h7Emhwagsqvz8+/HogO+Hw7H1K+pEY/ropuc=;
        b=nuchaN4OQgelv1joY6WBuzDeTUg9yJcCTf4dMxdarDvk2ViN5+9gzg+p8Y3Hg+Thfk
         3E95NHa/SVb7K724bk24GU+ysgWUQ81fQNLxcb4URjDdmBOoeOm8df9GBJsBADBJo4wC
         mvNyWth7ycKjA/mEMmPVDYGCLFtkWKzDSZNhjwbwzqj3EbbogVkwg5lmo/jql+oYTSas
         wFjy/nIRVcUSLgdxNlGsXS8OFbGoomZln2MsrO7wXNHuxL3XEWWh+LzUPgp5Cx33EdnG
         RVYYF3arWimf5uXUfiuJo0StKKXEj4j/My+6kUp/jCBrlkHanPFVV8eD7e0vA7cDLerb
         u/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951895; x=1737556695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khwjSC1h7Emhwagsqvz8+/HogO+Hw7H1K+pEY/ropuc=;
        b=TqCBSQJbV2QHG7q6OlAdr2fHFFK14wGlgyr5FEPNIJgWVDvRGrrchamC1GOw7PWHXf
         DalhCiTOmmQlMwp4cHJ3aK9M+EAns9rYvui7U4dVo73veOnCHPy6aswY+bMy4Jf64wCo
         kYN4yCWiSMfPZD1+BI+o/f8497qoY3HOz23faYPp0HG2W5ZTrxnbS2wiA5SQ3eIwl/hA
         DTfpuzQhXMS2RAHf+Kg3Ob7H1bFD6QgliuGv1UyJ2LGTldjSMmdy133Z8hLwoAVjeDdi
         ZgciVcPzC933ym7VdJuJtHfZ++dE9CaIaNXNAiCmD+BY8G9KlYhXnmR9RAARivEkR+GM
         KgsQ==
X-Gm-Message-State: AOJu0YzpuZ8tXiIkRaH8eXAQZ+aLydNBLPwXCw6Vomym+VLgCxiToPiP
	2VzzpTx99uW2MsN1lMdvfRy6rLLVigVL9AKvEhZ2cqIFiDPI0EFKEuX4K0IT5iCfFdbdiUBRy6p
	FrLA=
X-Gm-Gg: ASbGncsAX32gyipmUfOV8n4Bu62Gik0uS+hm9t0b2NlMr1VcjJGuN7zigy6hDPJlQha
	DeAV8BfMxkul5cMsaGWdqE2T97QlmwhPiOkMfDX/o4mHuQNwtBRBKTy7C4weNLgxYbyptEJRAE8
	zrGYs1GC+ShuTZOGt9IT3+ZaEWnFl0IV+J+iNMiOvy818KVcezZlGs9jR63Rlglf0VJ6tOyBP+s
	lPZIjLJ2jt/+msu31zFlJ2G3i2+aMd38blRsB26QbVzRg==
X-Google-Smtp-Source: AGHT+IEguehtknObJbo+gWDCJnNPHc7wsNYxGPqkuULzKgD5SYbagnpQFTHe+WJJp6rXTmCh8NaDbQ==
X-Received: by 2002:a17:903:41c3:b0:216:3732:ade3 with SMTP id d9443c01a7336-21a83fc3c07mr452257285ad.35.1736951894913;
        Wed, 15 Jan 2025 06:38:14 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/11] ofono: fix CVE-2024-7547
Date: Wed, 15 Jan 2025 06:37:49 -0800
Message-ID: <8c32d91b64ae296d7832ddeb42983f4f3c237946.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209916

From: Yogita Urade <yogita.urade@windriver.com>

oFono SMS Decoder Stack-based Buffer Overflow Privilege Escalation
Vulnerability. This vulnerability allows local attackers to execute
arbitrary code on affected installations of oFono. An attacker must
first obtain the ability to execute code on the target modem in
order to exploit this vulnerability.

The specific flaw exists within the parsing of SMS PDUs. The issue
results from the lack of proper validation of the length of user-
supplied data prior to copying it to a stack-based buffer. An
attacker can leverage this vulnerability to execute code in the
context of the service account. Was ZDI-CAN-23460.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-7547

Upstream patch:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=305df050d02aea8532f7625d6642685aa530f9b0

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ofono/ofono/CVE-2024-7547.patch           | 29 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch
new file mode 100644
index 0000000000..b6b08127a8
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7547.patch
@@ -0,0 +1,29 @@
+From 305df050d02aea8532f7625d6642685aa530f9b0 Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Tue, 3 Dec 2024 21:43:51 +0200
+Subject: [PATCH] Fix CVE-2024-7547
+
+CVE: CVE-2024-7547
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=305df050d02aea8532f7625d6642685aa530f9b0]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/smsutil.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index e073a06..f8ff428 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1475,6 +1475,9 @@ static gboolean decode_command(const unsigned char *pdu, int len,
+	if ((len - offset) < out->command.cdl)
+		return FALSE;
+
++	if (out->command.cdl > sizeof(out->command.cd))
++		return FALSE;
++
+	memcpy(out->command.cd, pdu + offset, out->command.cdl);
+
+	return TRUE;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 0c1e0ea6f8..8205ea683d 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -23,6 +23,7 @@ SRC_URI = "\
     file://CVE-2024-7544.patch \
     file://CVE-2024-7545.patch \
     file://CVE-2024-7546.patch \
+    file://CVE-2024-7547.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.43.0


