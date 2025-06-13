Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C3DC61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:45:28 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.3306.1749793520660051412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:45:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=B/J+KpuY;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso2100797b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749793520; x=1750398320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4ouwa8+oEJUxXY81zbpLkcX35SL6ophWkJu+StT08Y=;
        b=B/J+KpuYwP2iVs4hrNT+xiAKiM6a5d91hykwlI4BYcA0KG4n3Q0DoCa94hDcrmNrmy
         L5f/LWPvIwc/b6Lv0jB3lwUYoVqEiYdems/Y52e86f9T9xGbvAv+iNa1Ja/AVvKdIX7O
         F1o2xkJakMcswggnl8mSt1kYtoXzijEuPVADQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793520; x=1750398320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4ouwa8+oEJUxXY81zbpLkcX35SL6ophWkJu+StT08Y=;
        b=pH+xg9LkZ8ttGs85LCBOrIYLAWYo0hxaT2eYR+zkcZVM8tSZxoZPtNSLm5e9420X12
         FB+1lF+6waJAKKt8Tuz0w63Dnmm78z/T7k7JKEEHdxJuYMP2iXjiHs750iSsFbuBCCFG
         tLyB8nb2wXfHI6ufsxrOpXDJassFp+O9FoExKtfNo1p7RinzRGYMFgkhwx9bp0DdeAc+
         ACFtIz9fTLUFNWeRqvUP4Q4IA7bBGe9QkERfn4jrHsdas3r0snwlb2jf8x2xAB7okECg
         76G1B32qiDIHNpdKtxF8cTLzteu/erzoLpz2j35oqi/0I+Cqqugmyo+V8jNe/lSKJHMF
         47uA==
X-Gm-Message-State: AOJu0YxxoD7pvKoLtgezRWpfMo9h6FbDsRshTign+e2TMEjYlmAMyYOT
	yAVnmZxfnUdD4Ka/sNQTfjuNfVx/EtedgmzUyehardUI8zmA5Tr3+CsRrISxhSsodb+w0mMMlks
	rKXDE
X-Gm-Gg: ASbGncvrjW26MHHrrYrUujPd0tlT+0NZdR/L42UZPAMeiYbAlGkJQ717BDVThpHQtpI
	kIgSOKSKcvd6zb3WpL3pTuCV5uYOs0OH1NOb6wVv0oq44HvFz/rpcluIjcSClJrLYN/afF2rWr0
	RDPIJHqpehwhUqzQJA5JU/4jFoSO863GooYsM+D5psbg5GvnbN4OADgPTBbug5tpu2TWfco8rUZ
	guKtI3olh6TShlX03mRzxQ5N0ciIPKKA3ypH8rfvkLvMptSKGeuXHJwYdiir9EalxQEEa2gtvSg
	aDKZafzIaPjRNi5al/O0at1QUx1PawKXe3OwGRgrhLyfiMsXeEg6V++GRp1h8CKv+EOkjfDE
X-Google-Smtp-Source: AGHT+IF1RReuuSJ7ecXW1FVAaSN/w6tu0B5qFs+697U3qEM0J5bfmt/HA7niR01Ktcn0tdknHPTEpg==
X-Received: by 2002:a05:6a20:2448:b0:21f:52ed:23cc with SMTP id adf61e73a8af0-21faef32ba8mr1781341637.15.1749793519574;
        Thu, 12 Jun 2025 22:45:19 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm764910b3a.109.2025.06.12.22.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:45:19 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 4/9] libsoup: Fix CVE-2025-32050
Date: Fri, 13 Jun 2025 11:14:49 +0530
Message-Id: <20250613054454.112590-4-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613054454.112590-1-vanusuri@mvista.com>
References: <20250613054454.112590-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:45:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218579

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup/CVE-2025-32050.patch      | 28 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.0.7.bb |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch

diff --git a/meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch b/meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch
new file mode 100644
index 0000000000..474eb465a6
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup/CVE-2025-32050.patch
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
diff --git a/meta/recipes-support/libsoup/libsoup_3.0.7.bb b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
index 74110b21c3..27aab1468f 100644
--- a/meta/recipes-support/libsoup/libsoup_3.0.7.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.0.7.bb
@@ -32,6 +32,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32914.patch \
            file://CVE-2025-2784-1.patch \
            file://CVE-2025-2784-2.patch \
+           file://CVE-2025-32050.patch \
           "
 SRC_URI[sha256sum] = "ebdf90cf3599c11acbb6818a9d9e3fc9d2c68e56eb829b93962972683e1bf7c8"
 
-- 
2.25.1


