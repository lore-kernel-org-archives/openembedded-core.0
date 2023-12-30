Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30156C47073
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 15:50:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.186585.1703951401435501536
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Dec 2023 07:50:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aO0pVdk3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d76923ec4so13562255e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 07:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703951399; x=1704556199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNlp5WJGdN9VvL0YiF7JDl3IQ1f0HLsXyByVmNq0V1o=;
        b=aO0pVdk3iDnZEuk6yXML69s1bysFa65aWYbe4rYQUnDpdJ/54TuZoqkFb3wRrstyIc
         LEXpqXoivGmhQwNOJM1z8EMM3KMtVm7i9ia4AeLnpl+qz6K0zxlh4QczWOVUneBAuchh
         TqQYe/PkzSG+WN175M9ZvjzSR5guyLBqy5thuLH1xmbmfTxvE9CacXaMGl3wM6SB0UC+
         pOI2vWMou9WLU74BV4qBumAPywKgPirLKGzgfqoLfjOq3/16Lg3iURY1XXv1ochLilH6
         Fcis3J0evFgEB3JN3suCe60rnbGvcm9yO32glVsK1Yr/w8XO2yuatuvYLeOepmcZB2lq
         xrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703951399; x=1704556199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNlp5WJGdN9VvL0YiF7JDl3IQ1f0HLsXyByVmNq0V1o=;
        b=oy0XxJoqpe2+1egcucKs7bGtU8Q/MPM6ZxgtM0Vm1Mi7MNdGU6EzJjcl0XaACe8JX5
         wBJ4RUvfYlQIgpYR9jfQK707V3kRKN3DlsvQk49yPGFa+cunTuT6bLDRNbeMxpdTJE7U
         zwo3NiyjtjIp5Ihmou0E+MijQ33JTzJPy/SBO9qL2inP4CddeaVl1tk3uPi0kcRmmIuA
         I6n0mw9Pcy0zt4NkUDk6BugHR0j30N20O79Yaa0V8hwovJm8FlZ3yIiOGF0VUyaWfro+
         q9upXT8tEoNN/hpj43GCoRNVxoF9MoqinYJprD6ZNiP37if0adOHYIyUNj+02ExBm8Xi
         LakA==
X-Gm-Message-State: AOJu0YxxR7Xh/5xrMjE6hY3lmUlAAiEbLxxtZMF7vGgeyEZWkSqeCwRF
	VcRibTh8xJBc4cTcZ/pMZmJwLtTnbQQ=
X-Google-Smtp-Source: AGHT+IFLi8k2Hu2xhUsI/4GDdJJ9so8C0fj3GoQ18qRX3NhGShA15zB4TG6o9HmTmfSZhBDsIFk8sA==
X-Received: by 2002:a05:600c:3d87:b0:40d:83d9:a12 with SMTP id bi7-20020a05600c3d8700b0040d83d90a12mr441142wmb.4.1703951398770;
        Sat, 30 Dec 2023 07:49:58 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id w5-20020a5d5445000000b0033660f75d08sm21777428wrv.116.2023.12.30.07.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 07:49:58 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 2/4] cargo: Create CARGO_HOME and CARGO_VENDORING_DIRECTORY
Date: Sat, 30 Dec 2023 15:49:51 +0000
Message-Id: <20231230154953.8135-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231230154953.8135-1-alex.kiernan@gmail.com>
References: <20231230154953.8135-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Dec 2023 15:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193075

Remove assumption that CARGO_VENDORING_DIRECTORY is ${CARGO_HOME}/bitbake
and create both directories as part of cargo configure.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes-recipe/cargo_common.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index 0fb443edbdde..e932ada862bd 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -45,7 +45,7 @@ CARGO_LOCK_PATH ??= "${@ os.path.join(os.path.dirname(d.getVar('CARGO_MANIFEST_P
 
 CARGO_RUST_TARGET_CCLD ??= "${RUST_TARGET_CCLD}"
 cargo_common_do_configure () {
-	mkdir -p ${CARGO_HOME}/bitbake
+	mkdir -p "${CARGO_VENDORING_DIRECTORY}" "${CARGO_HOME}"
 
 	cat <<- EOF > ${CARGO_HOME}/config
 	# EXTRA_OECARGO_PATHS
-- 
2.39.0


