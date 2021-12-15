Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA1CC4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 01:44:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.2678.1639608041637541165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hy4Fvfci;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id i22so10938948wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Dec 2021 14:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HqTe8abMOo74X8okdy3WXbAnnWJ3JBvPIRVkGxbsXcQ=;
        b=hy4Fvfci87c43YW+kVbOpgmoybncSB9PbMHCen9syhqIaJ8tBMjBndq42LJiARuTe3
         KK6SnX3Culk3B7CA9WzL2ijNUw8Q3jCaeC0vPrLut3yI7M0uQ12+sCDLPkIHbDTThdgD
         llIHjsaVcwgfI2FH4uPgUmdbwIJqm9RtEgwCZAHO+v4lMxLFBwk1xkTUBVgRZe9IJrnn
         o8hhxH8g5NXa4t0XQVPEh7CRIckOS3s2JVMiB810tVBGwq8j6SHdGLdI9e2PGZFXmSo+
         IqMS2AU/sxqmKFoqqU38kIQlsF9DQ4+w2GhpB4Vbzo30o/FaRINMQtreswjIyaqZ7v2Q
         qTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HqTe8abMOo74X8okdy3WXbAnnWJ3JBvPIRVkGxbsXcQ=;
        b=7I+x4PjhOAZMUdU2vv60eTHZXHKSA6JFTShGPytrTCEYM1zxTNX+YPhMsxi3byGc2j
         0i14Ck/rWmEdVXD98oZkUw+j0w942ycfy88GUTgbX4P2BZ/+38QHZilSm7s/twJ8qLQ7
         EP70m81IoJwHFKYnrTaH/IwRD2XfBskObJ8vM2Gwk0yGOoB7+w7mcdapo6qfdPPdprI+
         TTM+FIMEYl5CNKeWRIMLXPzQhoItLjhRreKXP9UjPxrtxVogKdxQrCHYPUIf5hGL9IaS
         WofzyYrDpiOrFoKyLk5v9X+5LG8JN0G0yT80YGAN4MkhSQXaARxmdA0mKO5fRrMB7HeJ
         kLEw==
X-Gm-Message-State: AOAM5325Nzt0uAchDkDMZVv7znaIM/I4o3X+RcMZbobJo4T/KnVfASpk
	qACGfzBX80PfQKgpvz6r/WT06H/jHTwIvw==
X-Google-Smtp-Source: 
 ABdhPJytfkTn1mxXhVhA6jm2SY369N895YEuagbUwgWhpqVw0I45cP5fGnguFY05f2ZL9tTbgBLwzw==
X-Received: by 2002:adf:a10f:: with SMTP id o15mr6504716wro.592.1639608040299;
        Wed, 15 Dec 2021 14:40:40 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 u2sm3587269wrs.17.2021.12.15.14.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 14:40:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/26] serf: mark upstream as defunct
Date: Wed, 15 Dec 2021 23:40:10 +0100
Message-Id: <20211215224034.1814148-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211215224034.1814148-1-alex@linutronix.de>
References: <20211215224034.1814148-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 01:44:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159744

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch    | 2 +-
 ...op.creating.directories.without.sandbox-install.prefix.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
index e6172ef5aa..91ccc8a474 100644
--- a/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
+++ b/meta/recipes-support/serf/serf/0001-buckets-ssl_buckets.c-do-not-use-ERR_GET_FUNC.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] buckets/ssl_buckets.c: do not use ERR_GET_FUNC
 Upstream removed it in
 https://github.com/openssl/openssl/pull/16004
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [lastrelease: 2015, lastcommit: 2019]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  buckets/ssl_buckets.c | 3 +--
diff --git a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
index 91640d6044..4105868a7e 100644
--- a/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
+++ b/meta/recipes-support/serf/serf/SConstruct.stop.creating.directories.without.sandbox-install.prefix.patch
@@ -31,7 +31,7 @@ ERROR: scons install execution failed.
   and the installed paths (including the paths inside libserf*.pc)
   look correct
 
-Upstream-Status: Pending
+Upstream-Status: Inactive-Upstream [lastrelease: 2015, lastcommit: 2019]
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
-- 
2.20.1


