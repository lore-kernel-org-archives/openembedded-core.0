Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0BCC433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:15 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.3416.1647298154522388247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S7eHQq8E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id b19so3972387wrh.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wmBdGGUdV7G6PCkRVWmUh0MvD5asJrtookJpCPuACyY=;
        b=S7eHQq8EYaXkMee4XFH0GwwigkOPPSYkrmI+QNfwYklo5/CgGdA0P+xdsBlt/GZaRP
         Md3sI5yLO1CXHfIKYBif6TTC/pdc6Vvqh895TTBF9y6cLb4xpascv4gDMspao6xFz00I
         abRF3acIbodB8WFaXYHzyw6x7Qq8tXntLztLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wmBdGGUdV7G6PCkRVWmUh0MvD5asJrtookJpCPuACyY=;
        b=yGDwp+cTxdj+rD4UQ1Gu3vKk5Kwrbe0vxyUP/QT6ljAFk10VeWElacatCNyBCZq/FJ
         oCJoBQ/7Xi57ew27YlBC2jCWCnrMC/6md9DDNzB6DwTu5dNQNTy9StA1Yxs3LrDvfF5W
         HDkHlzu88i2cUOmq58zKHuKJmWzKP7qbrAtYFEpVdNvPvyB6e8XGAEkGWDNMsvv7WORV
         5mnn3HRTZykQgzTA5UFvc1sQ4D3xj0QVTutDlYhzQoPVZUGkiFAbfwYpb/PdJU4pS8KX
         Z2FFbXwFyA/3mT7SzJb7qw9nB6xIIU5bRqnEV1cP0yUlUfvJsvxxselkpDK5L/rylqsq
         UCsQ==
X-Gm-Message-State: AOAM533yxfLpEgiB4Hun1453ZrJqrm+tg+WXWP6/P5DKHZOSwURggS+9
	iYDyYlKtL39Ia4pX7pY1cQx8HWqHwQC6mOn4
X-Google-Smtp-Source: 
 ABdhPJwvlxFYb8pzQgvMJqXOMCOAMpFWXTFULxs36X3hk1q37acPLPkhYYu5yg/owb3V1pVk7CgrPQ==
X-Received: by 2002:a05:6000:c6:b0:1f1:e5ee:e464 with SMTP id
 q6-20020a05600000c600b001f1e5eee464mr17870351wrx.130.1647298152784;
        Mon, 14 Mar 2022 15:49:12 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 33/33] python3-cryptography-vectors: Fix reproducibility
Date: Mon, 14 Mar 2022 22:48:37 +0000
Message-Id: <20220314224837.834776-33-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163199

We regenerate the pycache files and the checksums in the manifest are incorrect.
Remove them to avoid this and ensure reproducibility.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/python3-cryptography-vectors_36.0.1.bb            | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
index b9e6b811c37..da6718fb90c 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_36.0.1.bb
@@ -19,6 +19,11 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
+do_install:append () {
+	# Remove the sha256 checksum lines for pycache files
+	sed ${D}${PYTHON_SITEPACKAGES_DIR}/cryptography_vectors-${PV}.dist-info/RECORD -e '/__pycache__/d' -i
+}
+
 BBCLASSEXTEND = "native nativesdk"
 
 UPSTREAM_CHECK_REGEX = ""
-- 
2.32.0


