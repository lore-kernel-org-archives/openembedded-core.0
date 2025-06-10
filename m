Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAC8C71134
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 09:44:25 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.83223.1749548659240966040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 02:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SZg5QOax;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so63894505e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749548658; x=1750153458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFoxThPbjgmslgZC1bt9OowtTwiyV66P6scrPijHzd0=;
        b=SZg5QOaxCLv6DcVvpDi6lJz1DvJar03HbqO8a72v87IZNtgIunk76CM2p7M5u8ovsy
         lpNt6Sy2hY7SVqfKOlP82QZWFCnu1tSeBNqanmEx55MTimXHMWKUpTUzm2qdSpBQoqTA
         ArasbpU0zHc3RVlwtnj79IIg0MZC0GKLoo4DNHPdWWe6gZkyYwrAlsUZOUk3WtX8ua9Q
         bQhXRSqxnzLGCZD1n8Ik1NHko2sj9EyPgNLIpiEnXPieZ+CGYhWQ2nr8P8hBa8UtMayR
         ltoYspzHWSJrc9w8lhu+kyZZVxgFSI5ZOSNGO1EEut/p6HwgoEeQRpQncpg1SCxWydP4
         W2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548658; x=1750153458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFoxThPbjgmslgZC1bt9OowtTwiyV66P6scrPijHzd0=;
        b=aTmHIq6XtvqWVuqszooRn33aGSQHo3x3JO8VuJHQdds9hBcTWNNT3FJYOKEUIdTdZd
         ktVa0Ko3Eg9zPrEpPX/diGpAfMy65/AFG4wc/vYxhkANKgiGEmqSBiLLALOiVz5D2pIe
         pY8cB49JLkF9QzIcZf1uKcgs7IySLH5EtuiqVBOo6unKaZHE681YKfCqRZ0JyIZPe9wu
         TYOurXigwW4QXHJltvXkWbdeEJjJCh1lAL/P9MmNuHy6lSVFdfTLaHzSmKjIoRmBuVhV
         noZMw6jvmOJ9RCYlTCYfnvkporxhGzZNrP1ZepcgaLpeLx6mWvWnirrGfP1WaPYNOu2g
         Suig==
X-Gm-Message-State: AOJu0YyBy8o8JYf83C6WAryTVrz6byGRQaqRKa+DTxcxxiwVe4TYIFLp
	ZbdZTFuKdXhPXx8GDPjX5Z6ZMUkT7dOZeljLYU6v27rYZhkPYtYPQWf9Felx9w==
X-Gm-Gg: ASbGncsG/7yvsDlJ6Ev7VySjKmsQ5hjEvUTVcJNBNlpzmJQwPS0weulnpOHyqAIs1xE
	/l/X/w+DYfYeue2fG8nXkAJ2+9LIYxWcXD0BZzmLjqLCZQnDK988RQO3w6qGxQ5udx8Kv0j9oDg
	zg3CifIgt61ye9kwAiu+iYZGr5Wv5Iw+Ot8OyXu1T48vLahZXoevAD4U3n//uh4E+SRbE2WDx7H
	LZ0zAkXoW8WGvI02FodBC5kteKI4cdTgfkagiGlQ2c6R9wZFFPyVNAO4uQi2dRbyneihdxUBADV
	2K77QQYyAu6a3QclfFSE/EIQnuIE9ChyNHg6F3P4/4ksvGByA7HNaJHN5l/qYagshnn6Uqr9Lzw
	vmXhEDUJGISWmZHD+TfE02qM=
X-Google-Smtp-Source: AGHT+IE99XosjFLS8N0YEtuNnO8UA8xnkNAnd0MTsYSQC1vcrwv8NXA/W3gxe30pcYrEsn4rqMN9kA==
X-Received: by 2002:a05:6000:2389:b0:3a5:215a:39d7 with SMTP id ffacd0b85a97d-3a531ab525dmr11616771f8f.22.1749548657312;
        Tue, 10 Jun 2025 02:44:17 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521375bca3sm136569125e9.39.2025.06.10.02.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:44:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 3/9] bitbake.conf: set S to be in UNPACKDIR rather than WORKDIR
Date: Tue, 10 Jun 2025 11:43:54 +0200
Message-Id: <20250610094400.1653931-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250610094400.1653931-1-alex.kanavin@gmail.com>
References: <20250610094400.1653931-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 09:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218328

From: Alexander Kanavin <alex@linutronix.de>

This transitions most of the recipes to have their sources
in UNPACKDIR, which over time will allow more simple and logical
source code handling in various pieces of the Yocto project.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 780de10ba35..0fe5c14f836 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -411,7 +411,7 @@ UNPACKDIR ??= "${WORKDIR}/sources"
 BB_GIT_DEFAULT_DESTSUFFIX = "${BP}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
-S = "${WORKDIR}/${BP}"
+S = "${UNPACKDIR}/${BP}"
 B = "${S}"
 
 STAGING_DIR = "${TMPDIR}/sysroots"
-- 
2.39.5


