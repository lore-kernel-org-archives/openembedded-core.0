Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA2EC52D72
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 16:09:25 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.96310.1722614954694625794
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 09:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PdZ6nArW;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a728f74c23dso1072212266b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 09:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722614953; x=1723219753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYhnZlXL/nmccQ5IGYcPWUghIMPOgbW22uiletJKH18=;
        b=PdZ6nArWIcv29VSz222AJMg5NWyvp8gpXCWRqo0rHwNuaqc4wE4eFlXRmwZZwcLfg9
         27irj+JMlxodJAz1yXS2fZXWivmoKJzeFly+3cGzAoIE73B7S5TQ511saTYA4xcEczLO
         ae6DkYdmyqC08Wua8vRs+M2qxnkoMkE5ufmYdFPfcnxwNznGimaU8EHDRkQRq9bk7ph2
         f4F1g7c+1bbOKiSsUNbhdvWv3rVQecFnca+9O6ZQGHoF28VwXZxJ3KqPx0iugPDUReKy
         JqCpzZLySs9iu35aR1MbDURPkVpu9qeYlSANRrKOnJruvAD5qwK6J5cUxNBG8JZrljeO
         dHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722614953; x=1723219753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYhnZlXL/nmccQ5IGYcPWUghIMPOgbW22uiletJKH18=;
        b=bq3jC5qFPje63ZBYMgQtQqh2PkelzgpMfHuCBxMvmYYitqujSBtqgLCTA0RDD5vzhe
         ocCDfgiDeVniHf5XlVjW5tTzeSb0n9ebaglvuZY+XbDwaO2Kw57TF3EyGZGzaKdgHoSp
         OxhBldU+VvyXTOeeSJdJWegjd/d2ya0jlfWVGBdqqlToBD5khCGOAXp0YlIlE8r+xAXR
         CcQZ7SCz1KSSk04LhJ0L6nfTC5ZdIFuFYs8OXDZxPzLLNmGX3nRuJmKbuFBadGhad6r6
         6jvINwRtkv6eV79lmlJMWt5vnfu7Mgwaq+7BlJatwFlQ/JlLDiRdO4FpgVIvGs3RbRns
         IH5A==
X-Gm-Message-State: AOJu0YxHcGbcrwNBOIH7b6freJNWsTlWwypFrQSpjyJDLaEAWdmipRvC
	4qgzdPFiSa+ZwwNa+N09JnRCfORqS7SFIUjrG7zECuRfk9TFgXLWbB3qFHyy
X-Google-Smtp-Source: AGHT+IHbxw32VxKS4aN7U+2aBQL30rIv89zT9tj5PyPB07aiqevHI0qPd34nwAubdsYpP6uvVZ4HYA==
X-Received: by 2002:a17:907:e87:b0:a7a:a7b8:ada3 with SMTP id a640c23a62f3a-a7dc4d8f7f4mr332598966b.3.1722614952890;
        Fri, 02 Aug 2024 09:09:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e84340sm114289866b.185.2024.08.02.09.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 09:09:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] python3-jinja2: fix upstream version check
Date: Fri,  2 Aug 2024 18:09:01 +0200
Message-Id: <20240802160903.2800657-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240802160903.2800657-1-alex.kanavin@gmail.com>
References: <20240802160903.2800657-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 16:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202923

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-jinja2_3.1.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
index 9ea6a0cf4ec..f2de1983ced 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
@@ -13,6 +13,7 @@ CVE_PRODUCT = "jinja2 jinja"
 CLEANBROKEN = "1"
 
 inherit pypi python_flit_core ptest
+UPSTREAM_CHECK_PYPI_PACKAGE = "Jinja2"
 
 SRC_URI += " \
 	file://run-ptest \
-- 
2.39.2


