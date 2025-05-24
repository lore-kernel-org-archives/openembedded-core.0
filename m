Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A642C5AE59
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:36:44 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.7015.1748093802523477416
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VUMAB6BG;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b07d607dc83so434371a12.1
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093802; x=1748698602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2IxJ8OxPlArHXkfe19u9LPHvR5Wqmbd+dYIYi0buIc=;
        b=VUMAB6BGC7iRQz6z0cPv0YQeyBjI67qt3EybNhQs9L9qKr17lK/JxBHr/oSrx/LerF
         jE0LHnTcHd30xe5j0cPBdaTeXM213qXOm6VkB3P1w7VCUu+J8muKMkXaqyIvVy1nHdQw
         M89XHd3wE01HsuVx69ZGei4GGiWWd7SsE2b/Ze18P34Nf1qVPCCYsamT6HsNezvDzdtb
         Aei70vi7ZR40y3ycuq6lOdm+LWwbgOhdLqVoO1Hl9NoQcp4WrwMqordCt9XYbjtr7Rfl
         6bepNaAHJUquAVaPhfiNJh3mUpEaGOWKWPV5XhLHj0k+dCi8Qs1bhQSFq2v9M7rGa+dj
         UbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093802; x=1748698602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2IxJ8OxPlArHXkfe19u9LPHvR5Wqmbd+dYIYi0buIc=;
        b=Wk/MZLRkzpcFGKYgxyVesf8lJeF+Ww218XKQFyxdq9EN8xFlD8oTaoFsCqVTN2v7qT
         ABIauJ+ZfH7c3+8X/kmljIkBzbBz5i+IU1unpVold46ieUm0cdVbQYm5i6MHhbjbxcLn
         VE3yAYgrMkq0p0xqTyFNEvgGxyMjVxLA8wC68lHGE40DMFrY5zE9V9AoduhTbKxrqOVO
         cZn9VMBzxgI4llzmSSaaBuQAwWvqKn8c3AtwXLCWnVFFt8W/xvkgKe8AUOIwoXHdUQkF
         TtAxgyjhfFsh5r+4wXCKSwc4PUoaL1ywilP0oDh1ALmn9GIZvKSLHWnMLalu78fAdWKD
         Ug2A==
X-Gm-Message-State: AOJu0Yx6b/vrPvczWswzuZJUmaAmdNH5OiUk3+Aoh4QWmPm4RdtTBko9
	tA+yRiv6xq25t0ImPZQ3FsRv+fpmi/yOKhoWNmY07aho1/kPnk6zq94rzGf+RILSXDzXe3xKBv2
	dTXJr
X-Gm-Gg: ASbGncujFHveAVNasDqiVnvZE68p6IidNUmT53Kg5IXtQpXaGad/V1ghawePkxlVR6s
	G4qHthG6tD9PBfQCtR4hU2eojAK3sfIGAm2Z9U1aynuGBnbF9uZLtf1ABwAeSeJluxJizyig0NB
	rRHKjlpkAhJZy0W+4di+mYrHxeB4/MKHJ8vv0u4ypxrlWBqWx44j/b5sndF1whNL9aHKbOR3l9m
	Wt1Q2UUEhB1JAKRQMr+3MwSyyKP47ku2PCmBW+sr67/1w+n1L1WdVraxXt5UbW82GxDWk/DBZ7E
	E5XPuFylHLlOlduG++L54b3pJ+lvUhMyrZshoqCzKUc=
X-Google-Smtp-Source: AGHT+IG5aMOaw/0l7yPa4Frvf+gZj5QJz2upTTWN1MMIjXMhjXgSXu22ibmYJB8uvctrsStyglH/Zw==
X-Received: by 2002:a17:902:dad2:b0:224:162:a3e0 with SMTP id d9443c01a7336-23414fe6bbfmr46886115ad.49.1748093801663;
        Sat, 24 May 2025 06:36:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/12] connman :fix CVE-2025-32366
Date: Sat, 24 May 2025 06:36:19 -0700
Message-ID: <1b9156124b4a07e0e3e0ab09e87d654eae6c7b4e.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217228

From: Praveen Kumar <praveen.kumar@windriver.com>

In ConnMan through 1.44, parse_rr in dnsproxy.c has a memcpy length
that depends on an RR RDLENGTH value, i.e., *rdlen=ntohs(rr->rdlen)
and memcpy(response+offset,*end,*rdlen) without a check for whether
the sum of *end and *rdlen exceeds max. Consequently, *rdlen may be
larger than the amount of remaining packet data in the current state
of parsing. Values of stack memory locations may be sent over the
network in a response.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-32366

Upstream-patch:
https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../connman/connman/CVE-2025-32366.patch      | 41 +++++++++++++++++++
 .../connman/connman_1.41.bb                   |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
new file mode 100644
index 0000000000..45c9ddaf6f
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2025-32366.patch
@@ -0,0 +1,41 @@
+From 8d3be0285f1d4667bfe85dba555c663eb3d704b4 Mon Sep 17 00:00:00 2001
+From: Yoonje Shin <ioerts@kookmin.ac.kr>
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
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=8d3be0285f1d4667bfe85dba555c663eb3d704b4]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/dnsproxy.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/dnsproxy.c b/src/dnsproxy.c
+index 334dd00..74aed50 100644
+--- a/src/dnsproxy.c
++++ b/src/dnsproxy.c
+@@ -950,6 +950,9 @@ static int parse_rr(unsigned char *buf, unsigned char *start,
+	if ((unsigned int) (offset + *rdlen) > *response_size)
+		return -ENOBUFS;
+
++	if ((*end + *rdlen) > max)
++		return -EINVAL;
++
+	memcpy(response + offset, *end, *rdlen);
+
+	*end += *rdlen;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/connman/connman_1.41.bb b/meta/recipes-connectivity/connman/connman_1.41.bb
index caf0610c3f..28331712fd 100644
--- a/meta/recipes-connectivity/connman/connman_1.41.bb
+++ b/meta/recipes-connectivity/connman/connman_1.41.bb
@@ -10,6 +10,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://CVE-2022-32292.patch \
            file://CVE-2023-28488.patch \
            file://CVE-2025-32743.patch \
+           file://CVE-2025-32366.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.43.0


