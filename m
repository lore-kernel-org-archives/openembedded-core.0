Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB004C64ED6
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:14 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.3127.1675840911151617160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TEMtgsDM;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso758127wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPSplt8r2VJcGF6PDf+XSluMdJ+NFbLMJxFBEFS2BoA=;
        b=TEMtgsDMMycU4iEd7vi1rZeyKZej0DxLSSjcxxF43KL4nJXN5n0eZVLmqL9O/G/GOt
         gXGtcrPs+SHovPAjSqg8YVVvoRk3iNuILP9oCrWTr7sDxqujoluUafZZmn0oVOy4HOAu
         0o3DuyxTJuhINB3Uwpv37LMbmIWIUIDAy57a9CTlwJ1ycmjp4kbqik3UqeGIIontR30d
         n4Hbty3vvJNgKChvEzvMEZJO3DMOJ8A7RCw55oKvQ9Zuj5fVWuxEu/IUAydyxMFnaZuy
         wX10CvDg/p4JZOmqcWMulXvBK/A6XUq3m0812kr9uUAMH4FxN/CA8Bh5DLHE5QR9ABwC
         Eklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPSplt8r2VJcGF6PDf+XSluMdJ+NFbLMJxFBEFS2BoA=;
        b=YudXGARtDdL0SWSW9ZIlsFFYEbXtAXBBwQZoMJpVNREaC/re9axRN4kryMc2wnOqma
         3dwBOy7shEn1CuONMWHaTSFhhTiZ5+ztGymrV9CZvke+YxRzg15sCJEYEB66B2qj/82q
         K7AlQ8M/XafITC3HEmwxr/87+JH1YzeHDoehyUoYcNL4ukN89PPso45iw2bJBv4PXs/a
         Na01tU+RN91s4bq7De1Z3oRRuGl27j7EvtdGTcEt+rYFrF0bTh7SaYF4+uQXIKCaM4jf
         EnOUWVHGEuLZmEivgT/U7ldGFI77MOaWt0BhH4kvVCSErk49Sg6KmXDz6vFdYrvRcnHQ
         eLlw==
X-Gm-Message-State: AO0yUKUnRCmk3cCW2KuLC1NsH2nm4g3M9WocZNvTv9d4Kdy9RJV9+aIL
	XtXFAKSZxfi3sQkneKDa3cVErzsuOkE=
X-Google-Smtp-Source: AK7set/h6yR4s2SKnf1f97V0iWxZD0r0qgIvTm/cB6UprfIP5yOT7jcGQhXmD2lRYfdqryGAME/LsQ==
X-Received: by 2002:a05:600c:4a9a:b0:3dc:f24:f2de with SMTP id b26-20020a05600c4a9a00b003dc0f24f2demr5460141wmp.12.1675840927247;
        Tue, 07 Feb 2023 23:22:07 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 34/52] python3-pycryptodome: upgrade 3.16.0 -> 3.17
Date: Wed,  8 Feb 2023 08:21:25 +0100
Message-Id: <20230208072143.2930292-34-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176873

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.17.bb   | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.17.bb

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb
deleted file mode 100644
index 15ee31c66a..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.16.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "0e45d2d852a66ecfb904f090c3f87dc0dfb89a499570abad8590f10d9cffb350"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.17.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.17.bb
new file mode 100644
index 0000000000..05f654f225
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.17.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "bce2e2d8e82fcf972005652371a3e8731956a0c1fbb719cc897943b3695ad91b"
+
-- 
2.30.2


