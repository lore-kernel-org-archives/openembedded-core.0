Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B34C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:45:18 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.3365.1749793515344910238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Pncsolir;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747c2cc3419so1474140b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749793514; x=1750398314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45aii2Y3JRwxcJuBJnnQpbJJrp2O7ThE3dTZrkQbOD8=;
        b=Pncsolir0GgJavHi/WZ9CbPqdNVJyARHVFpVjCLKZVqyKh0mARUc/ZK0aSfHVKa33O
         IgbpvI4MkB1P3Mm5ftA/zyQ0M8+WsKCWm3q76cJXAEqXJ1mwMwTnUH4C/7DtVviyZg1B
         e0Bt4ciqvxF9TYBOaBPX699FAB2DEVgRCvmSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793514; x=1750398314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45aii2Y3JRwxcJuBJnnQpbJJrp2O7ThE3dTZrkQbOD8=;
        b=BTG14ovYGXtR2n9zMK7T1qVcjXmXM1n1mksrCjPyCddQL8Hp3Zbev1zd7fDpXTWg67
         GUpJnRJnOfBvcEueA3f6HiKWcwMSArA72p00uj8imkKjbShlf4ESjukZDtMAnyMRV9l3
         yh/o5L8zk2Q2URom1ETYXMMukRm40NfsBY4LpuWIx21hZVpKEIIFNh0LQc928l3aD3hF
         yGa9rozJkJl9r8btsQM8IWnCIr335+Qxz0hJER3jZSxmoZ3UrgQ6dNB8sELyvc9GUrmZ
         2EUn0icZpxJpdVnxbrpzV0AOntRELJcJ4XY2qktIf6aB0pTFzKLbN0g6BTF1Z9oNV/TW
         jQfw==
X-Gm-Message-State: AOJu0YwBKrFUJ509j9C4yv3lym0OlocoYaZoR34WEN9O7fiF0czKKZH3
	sDYVrQvzLPRsU27cHlylFCFUT+NTlfeSuqB6l9eph4sLqrkEq+JkZHcVYKN6jJvEH8GkIXFGc0i
	eHY2c
X-Gm-Gg: ASbGnctTbeB4r4rHDIPI6UHymhLlRbFXEkTUEHw+/G4OyZL1nJM55Jk41RMIDmY0Yaf
	/AzRCaLDhICwUfoYB/U9XItDHkHRkftsBvQzWMxnygM1oQbvT3nhUiamITSAZfPKoxhsGDpPB8W
	d4GaVGFrCL2UE0aZW406WG0JjafdIl3/wSgk2z2LPgyYNijaR1AbN+W3qplmqTbfwAAS3OGRwdw
	HhBBzbJC/BR1JcpRqCZ/cXt/rGoGFata0J9+OqSEoE3eiVZ6dhgdDRJqU9PzjXGYuT5MlspoIFR
	JYNt8hvItdH4E9Y3PR1vxVBQu1BliAGwxIzHUl/P3C/HwP0GE6x9hjgdE01a70yCdiOso+HEU2J
	YrncCwpg=
X-Google-Smtp-Source: AGHT+IFsfOBwfnJ72ZoKnylGQ+ADCeEso50ka52p6SADQQe11DrX4WjERnev6NgQ4pzxkGOI3IWEzQ==
X-Received: by 2002:aa7:888b:0:b0:736:8c0f:7758 with SMTP id d2e1a72fcca58-7488f63d26bmr2575841b3a.10.1749793514337;
        Thu, 12 Jun 2025 22:45:14 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm764910b3a.109.2025.06.12.22.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:45:13 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/9] libsoup-2.4: Fix CVE-2025-32050
Date: Fri, 13 Jun 2025 11:14:48 +0530
Message-Id: <20250613054454.112590-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613054454.112590-1-vanusuri@mvista.com>
References: <20250613054454.112590-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218578

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32050.patch  | 28 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
new file mode 100644
index 0000000000..474eb465a6
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32050.patch
@@ -0,0 +1,28 @@
+From 9bb0a55de55c6940ced811a64fbca82fe93a9323 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 28 Oct 2024 12:29:48 -0500
+Subject: [PATCH] Fix using int instead of size_t for strcspn return
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
+CVE: CVE-2025-32050
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/soup-headers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 613e1905..a5f7a7f6 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -907,7 +907,7 @@ append_param_quoted (GString    *string,
+ 		     const char *name,
+ 		     const char *value)
+ {
+-	int len;
++	gsize len;
+ 
+ 	g_string_append (string, name);
+ 	g_string_append (string, "=\"");
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index 5e8a141dc5..6b227b0503 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -34,6 +34,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-2784-1.patch \
            file://CVE-2025-2784-2.patch \
+           file://CVE-2025-32050.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.25.1


