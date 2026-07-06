Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9188C44507
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156291.1783358233909420451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aIcfXD18;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493ba701891so26094095e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358232; x=1783963032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VN3InZQJ2A+ickIToGWV4UV3m8mVkzig9MjqEyRjR04=;
        b=aIcfXD18avSTo/3P07AWeK6+3OHhv26q+Fd3r/eN4fSgCy48XwxCJja+3jadsjyA4b
         ijJvR9NGo806Nm7FLaVK4Cd0GOjZrm/lLvvkU4WFWf6c+ERXOuVbyxjMUPVBFjzZ4N2Z
         sXVTJXC/E6jRKzv4qvgrw5Olfh9mooLF4JgEX4HjciNQJVl/1X+OluN/5sDJYXRjtQkp
         HavO2zAAy+xdYQCOtzXBaMhm/m6cQeUdxj8RGWfbjfIz/khEIkgKkujEYim7bOXeiSaN
         B7zTIDr9RW5mjI+8W/mzxHsXQOy2omucqDHaOVfFewMIAcOc5Ik7TLiKzRHF31Sqe7PJ
         nkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358232; x=1783963032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VN3InZQJ2A+ickIToGWV4UV3m8mVkzig9MjqEyRjR04=;
        b=jEvSpV/8cIbH9/1oF3F5NqGQljIXr80zVTtNV/+KbsIOlS67QGoC8J++iZ2r53k+nf
         PzqawLigxNLE44XDxdbtFDuPmRPjAwmAym/ckrcWXT8Fj6L9F6bRB58tUW3uaBzu6eLE
         CZcLMKY9lrS3sZehiKW7iin5KvQ/OqDHwTx51TBBqaaccuIF2EctrFFjtQIQDF7bulBX
         tDAvjujj1S5QApYdagaS/sa5wHzqhWa+7lVdIUbSXOLDv88SzyDdpdCjg6AqAreh0vVf
         3ijEZSz1HkgQ5N6YRocF+tuFyYfCe1yz12lbp17g9Gvr15tLV7XmPh+Kn4rZBd5nnKBr
         KcAA==
X-Gm-Message-State: AOJu0YxA7nXM9MCah8Njlrpoif0B17slfq59xDndbsoeBGahg8h1nrca
	atXk6pl3my2tAPLKQ7Fk1IMDtMSXsMd6+HCjadtt+82pmthRZrba5EuIMJBAdQ==
X-Gm-Gg: AfdE7cmNNWiE0NmMXK+pZzEGLR/v1olvk1vwXjlvbURgH1cR726+JpeDHhuSxQigCzR
	hc7iw/DzuyR9UBxxYhKo5yjNznQ25e18jTdZtcSPMAsmX+wzS6eW3bpNu0jS2dKxxm50Dr7IpZH
	icYDHSEV0pV4q3XlacgKNMuGJNItk6tkHzerUv2qWrzCF62yK1IX7njwvR9++KxIJ/n+pYUfZsl
	ScbgmXrY29ZkZoWKdTLEhMVgU1+ZK5q44XU6iUzThzXMMIOe7YbMZ2AXOTv4egk913DuOi3y0Qz
	jDetKVKUeLMYcV7VvWP24ANXsC+HtxRYO5GZSm1gSI5j4VhO+qqsCFrVDtdsfkVGswagC1T/PCm
	oWJzcdLPgNJ9AgorKk3CQf3PByet0h9q6KMTllQhw9yAordSVA94oTTmYU/H5jX7kaLa57LeSQ4
	OTJqjMmk1+Ij0qVCqR/sPbBZjib9uwb53OiGf45c+Up4vRUjetNxafdUOQsiY=
X-Received: by 2002:a05:600c:6692:b0:493:ca3a:d738 with SMTP id 5b1f17b1804b1-493df055a84mr19114295e9.7.1783358231922;
        Mon, 06 Jul 2026 10:17:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/45] expat: upgrade 2.8.1 -> 2.8.2
Date: Mon,  6 Jul 2026 19:16:23 +0200
Message-ID: <20260706171701.70536-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240295

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/expat/{expat_2.8.1.bb => expat_2.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.8.1.bb => expat_2.8.2.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.8.1.bb b/meta/recipes-core/expat/expat_2.8.2.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.8.1.bb
rename to meta/recipes-core/expat/expat_2.8.2.bb
index fa48d42bf8..0b9dbe161b 100644
--- a/meta/recipes-core/expat/expat_2.8.1.bb
+++ b/meta/recipes-core/expat/expat_2.8.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "f5833dd2e1cd7739ec9182804a1a29c4f0cc7c2f26b633d3a2188b7766a88ecb"
+SRC_URI[sha256sum] = "69e7f52417d85b1c2b7fe855e176eec55d0b2d7d92d691372d833a1c7df7923b"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.47.3


