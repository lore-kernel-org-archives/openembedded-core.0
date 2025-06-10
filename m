Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA49C71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 19:34:39 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.96406.1749584074447592785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 12:34:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2LmzNv7/;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2363616a1a6so12837385ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 12:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749584074; x=1750188874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=539nrUonCwx3alMydrSQT4WUFGl8iOKDIxAK+LmYMRE=;
        b=2LmzNv7/lyp6fvwuupyTlD7z6ipiW5Nbu6VB1mtdmHWzW/aStrIz/ylUYMh9TmGYR+
         +/ey265QhB+hiJLBIOqej/Et2C5bvnixLxqKEDXUVNNEcZp1NpcHiLmRTIXwUxNzNZOP
         vC2YJTLzhD4YGFHax4haePlKmcIrcAovm9qJUTh69luZKPOmNxdVM4wLwMszGQkTOnaX
         a4qs71X4x/ZxYt9y0fZji26xzDaGiz/zdDsQpug3+Q0QcUmNa7GXJ6tXZBGpsSniRtHX
         55JCUOrFVKiaZcpwaCtvvrEM+w08k3wc6msAJed3xR0hw19HtrWS9AOE9pL0CVbsMMs7
         eDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749584074; x=1750188874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=539nrUonCwx3alMydrSQT4WUFGl8iOKDIxAK+LmYMRE=;
        b=H4nybT2SmBwcqN4SJ2rcoKWgH6T8eWH68K+wsd+GvVHRNmsYQ2iYSNZZ402EYpmSj1
         FkcfyUT0ZZdFeFw9eBV6g/+87Jr36jJlwGcPfTsWsYnWTXZIxaLKCfxqaGiIpi/gnDw/
         wm9MbFjmS0QKVx8AuG36AmiwQ1SQEkYkl8z08ajcgKHhqDV001YpkTYmIV7vQvj0gxjU
         qaZhfyqjVGo6LSOq0H2kkEq14pROjmtX0m7/ltdz05u9ggAtnUpdeg4OBNDg75spmN/2
         9uRXc1N9RkACxh38wt3i/Seg/TjoviBNSVJoNp0fCJjbf21Qj7Z1/3bliws27VmLHnYY
         sDew==
X-Gm-Message-State: AOJu0Yy4jWS+u+zAGfn/eWq5xZGr1dwUerHB9XdmwnwL2NhhDNgsV81w
	AB6kYJTmBwMeZReg+LZab8nYRQ38gCAMpDUjic3dbdA7uHi+fsaSjfNmi8ZPvVnUbtqhzeL6Ytp
	+Y0/a
X-Gm-Gg: ASbGncthHx80qWr5tSsR19AXXx0uAD7XNONvXkk+QOkCGjmzte0y6zUMNrmbeH2abX+
	Fo/rzwCe//8WUnVV6xBjbGwya+7V1WV7Olk2PTeHDa6G+m4D6p1aLeGoyPmSkSu7wRACfMguZao
	rb6qNipGJXUjfgfVEQ1vzDXNSrwI9Gtkx2SkTi0Nzn2JQnEhPuCvJ4bh6mZhySf8ycA231wLq4w
	KX85ttUh/XW7O6RaAsGd7nuX8Kjgp4a4kpRwdUGKUkl6pKnOZrnwECeHWyhqL/T+d2Y2LUnNn44
	pLomWv+akeyPvRvxmUn1eYJpFP1kNT+5lJ7f6ko9maDCuBF5l7QbCA==
X-Google-Smtp-Source: AGHT+IFIlYi1veXohJINgf1XjZ1xRWYgI2ANr0Zz/S5kbOx6pdj7Kg0Uw3ePtsjiV9RD+emn/GJWIA==
X-Received: by 2002:a17:902:f78b:b0:234:b131:15a with SMTP id d9443c01a7336-23641a8aad8mr7464155ad.4.1749584073742;
        Tue, 10 Jun 2025 12:34:33 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7bc4:2c75:fa51:ff16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b10c7a88sm73897a91.33.2025.06.10.12.34.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 12:34:33 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/16] libsoup: fix CVE-2025-32050
Date: Tue, 10 Jun 2025 12:34:00 -0700
Message-ID: <563a34faae35e4587fe2740c26c4bc149555a5de.1749583904.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749583904.git.steve@sakoman.com>
References: <cover.1749583904.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 19:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218410

From: Changqing Li <changqing.li@windriver.com>

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/424

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsoup-3.4.4/CVE-2025-32050.patch        | 29 +++++++++++++++++++
 meta/recipes-support/libsoup/libsoup_3.4.4.bb |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch

diff --git a/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch
new file mode 100644
index 0000000000..e5a4d747a1
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-3.4.4/CVE-2025-32050.patch
@@ -0,0 +1,29 @@
+From 30c86c9a284cf6f366ac87df0bca3e18a5de8671 Mon Sep 17 00:00:00 2001
+From: Patrick Griffis <pgriffis@igalia.com>
+Date: Mon, 28 Oct 2024 12:29:48 -0500
+Subject: [PATCH] Fix using int instead of size_t for strcspn return
+
+CVE: CVE-2025-32050
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/9bb0a55de55c6940ced811a64fbca82fe93a9323]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-headers.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
+index 5fb32c2..52ef2ec 100644
+--- a/libsoup/soup-headers.c
++++ b/libsoup/soup-headers.c
+@@ -906,7 +906,7 @@ append_param_quoted (GString    *string,
+ 		     const char *name,
+ 		     const char *value)
+ {
+-	int len;
++	gsize len;
+ 
+ 	g_string_append (string, name);
+ 	g_string_append (string, "=\"");
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup_3.4.4.bb b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
index 9af7de192f..23d44d1572 100644
--- a/meta/recipes-support/libsoup/libsoup_3.4.4.bb
+++ b/meta/recipes-support/libsoup/libsoup_3.4.4.bb
@@ -40,6 +40,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-32052.patch \
            file://CVE-2025-32051-1.patch \
            file://CVE-2025-32051-2.patch \
+           file://CVE-2025-32050.patch \
 "
 SRC_URI[sha256sum] = "291c67725f36ed90ea43efff25064b69c5a2d1981488477c05c481a3b4b0c5aa"
 
-- 
2.43.0


