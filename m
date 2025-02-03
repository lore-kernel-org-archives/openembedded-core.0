Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF22C0219A
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:11 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.92671.1738600922471313762
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vn/tCW1J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so2421805f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600920; x=1739205720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjCdCebzDw2u1Ma3RbrE04oyBcA7T1uA9o7WSH3eSSc=;
        b=Vn/tCW1JFQkPmCtUu4UKbDUsXLayL18lZ61k4q6htidTd0SDc/O6UJODWM3pdrIcBR
         CVxGZ2H25+YuKWOzMoj4kqhgeA6Is7nUK/i5crVkRjKsVS3cBS9bQkbBhod1z1pXnO6M
         eQYhgzjUUWOWhlMDkjwizB/sBLWAOft5ebk28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600920; x=1739205720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yjCdCebzDw2u1Ma3RbrE04oyBcA7T1uA9o7WSH3eSSc=;
        b=Da1hnM6JD4LCocN0mGr2JwrywmqigfOidxjoOCF1j1iOwpE2QkZJuWRc26ByEVNExe
         /oFF09ZnB6QcKvPztTvlj3eSOAnDS6BUbPVYfJXK5RQnesSzpWAeMpnwlY6No+o3h5J0
         lwTqm5eKNvBNZ4qpCQ7quFGkJ2LwCUoIwK+ocbc2W2dswVtWbzAZx7FjGdq11tx/w5Xv
         MNKn8DjfYy6VdsOQPGtheSdOgL4jFX7RQQH6/+7YcZ8suJVed2CYDrO4Pe6M2s7bnoG3
         fZ7mZIk50UTCh32t51SM/R8NPksKAcz3RyFCbuQCNObsOIa5C71AhW+nL1BOLpHWt1a/
         8FgA==
X-Gm-Message-State: AOJu0Yw00CkWJxV2HZbDvGOHqB3wBXN5mU7p9AX/uCpyuo7lNWC/R2Qd
	HXt5R9bir54YDTuKXjMx8WTkDrxh6fa/ZBM6Zm6MmD/YqOZVvWGuxrK5yofowXquGNr1MwNdJEY
	f
X-Gm-Gg: ASbGncvKtvB4zUZOHWWGq2s6UKf+KMDjy6/u9SpFfFP20jbqLqtabKWB3jWQhZEi+sR
	r90dtdhPe91QFDMiTcx3eWwiCuAzGLad3n4xbQY+W5VvEy7antQq8cBm0ob2ovh5IYkKwlZtuFs
	5jVhEyBRnzxFCDa4NMq2Lf466V2e0DgxxDwnKl09ex7Ali1rBQ2Lky+DOPpfkMQxccXApKuB2rc
	r9+RfhC0Tg7rOn4qQtFhnf0JtHxQ9GvlFPFxfAET6/n8YWz1RR1EtDQy1JitsvVeDDoxzHbBICv
	hIRKkHFLA5cm1xk95k8lnTPehabzfPSDDBScc64p8h9d
X-Google-Smtp-Source: AGHT+IGL6hF81NoNcb61vsb8Rly+Ak/DIjsQMXFTv/wAArvG+3LSxR3DNEY3ayoCgCSiFnUTxgEJMg==
X-Received: by 2002:a05:6000:1842:b0:38b:e26d:ea0b with SMTP id ffacd0b85a97d-38c5195f9bcmr20238648f8f.25.1738600920471;
        Mon, 03 Feb 2025 08:42:00 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:59 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 28/46] python3-certifi: upgrade 2024.12.14 -> 2025.1.31
Date: Mon,  3 Feb 2025 16:41:12 +0000
Message-ID: <20250203164130.3403325-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210701

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...thon3-certifi_2024.12.14.bb => python3-certifi_2025.1.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2024.12.14.bb => python3-certifi_2025.1.31.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb b/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
rename to meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
index 714e231efed..69b39ba100d 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.12.14.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2025.1.31.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "b650d30f370c2b724812bee08008be0c4163b163ddaec3f2546c1caf65f191db"
+SRC_URI[sha256sum] = "3d5da6925056f6f18f119200434a4780a94263f10d1c21d032a6f6b2baa20651"
 
 inherit pypi setuptools3
 

