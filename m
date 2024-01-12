Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF4FC4706C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 15:34:24 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.10050.1705073660265194114
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jan 2024 07:34:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=aikFXh91;
 spf=pass (domain: snapchat.com, ip: 209.85.218.41, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a28ee72913aso1293472866b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 07:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1705073658; x=1705678458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pi9oYzwS0apcLxCokk2SwVE4wF90ZYt5SlNVz0PSvkc=;
        b=aikFXh91cJrPvjshCXJbTVl/Kt2ujlBs5fPkvnpsc9P3JdWY09n1UO01GKf8SUSiNZ
         rWE+/S8wvj+10PCkwPjtQXBiTmxRkfc+4rUzXqAMeK8eBj7WjGXDYEaUNBHJ/Sug8D2R
         998qezz/uGSCgWsleSXa60yNYub4dj32WeqwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705073658; x=1705678458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pi9oYzwS0apcLxCokk2SwVE4wF90ZYt5SlNVz0PSvkc=;
        b=USDOn8xIN6MLPLgcEEBpyjqJPRhO3OEfGK97RyAuLTLdahOSQyFLyd26ITVzQxpJiA
         KghqVGFKV1AAMv0QgruJJkE8ZW8IYsOF25SRrS9Dk/LaRVzpDCfWjjeCax4TPgoqceBl
         AUubZQ3f+LJPy3xFkS1AHhzWwk5cC4JcT2O/7IryXivIR1ASjXiamQtIVq13ByGdhhaE
         DeDd7P+4RLBwJJUmQCgjrPVrwJPtd3NJijboW21hpx7CmifTAx+5lAMCTExRXdZq4PJg
         syM51TSgZiqQtLG3S6ZO/22me0lnTYdMFCV+jO2WZQyaCP3pIuO7QQihZe/dfBjcy8BZ
         sIEw==
X-Gm-Message-State: AOJu0YyHkpGyBwhdJLkaqonDFhJE428YaGoozfZAq7tlRetKMWfqOP9W
	F1T2MrzvGnfBIzVtH8sd1DEIERYYPnSMS6xJLhD+rd/r1O1SAh7q
X-Google-Smtp-Source: AGHT+IGKyygFn8r/KUfRXz7C3E0fl9sx8lN3kKJPORspWzHf3GT5FGViUL2CRSfL7NgM9hV/pLyABw==
X-Received: by 2002:a17:906:4e9a:b0:a2c:d83c:b619 with SMTP id v26-20020a1709064e9a00b00a2cd83cb619mr893558eju.50.1705073657787;
        Fri, 12 Jan 2024 07:34:17 -0800 (PST)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id d6-20020a170906c20600b00a28c8ab1342sm1913509ejz.96.2024.01.12.07.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 07:34:17 -0800 (PST)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>,
	Dominik Schnitzer <dominik@snap.com>
Subject: [PATCH] siteinfo.bbclass: add support for darwin19 and darwin21
Date: Fri, 12 Jan 2024 16:33:52 +0100
Message-Id: <20240112153352.2567717-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 15:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193596

From: Etienne Cordonnier <ecordonnier@snap.com>

Ported from the meta-darwin layer which supports darwin19 (honister version)
and darwin21 (kirkstone version).

Signed-off-by: Dominik Schnitzer <dominik@snap.com>
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/classes-recipe/siteinfo.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/siteinfo.bbclass b/meta/classes-recipe/siteinfo.bbclass
index 05253ae90d..68aefb8eda 100644
--- a/meta/classes-recipe/siteinfo.bbclass
+++ b/meta/classes-recipe/siteinfo.bbclass
@@ -73,6 +73,8 @@ def siteinfo_data_for_machine(arch, os, d):
     osinfo = {
         "darwin": "common-darwin",
         "darwin9": "common-darwin",
+        "darwin19": "common-darwin",
+        "darwin21": "common-darwin",
         "linux": "common-linux common-glibc",
         "linux-gnu": "common-linux common-glibc",
         "linux-gnu_ilp32": "common-linux common-glibc",
@@ -130,6 +132,8 @@ def siteinfo_data_for_machine(arch, os, d):
         "x86_64-cygwin": "bit-64",
         "x86_64-darwin": "bit-64",
         "x86_64-darwin9": "bit-64",
+        "x86_64-darwin19": "bit-64",
+        "x86_64-darwin21": "bit-64",
         "x86_64-linux": "bit-64",
         "x86_64-linux-musl": "x86_64-linux bit-64",
         "x86_64-linux-muslx32": "bit-32 ix86-common x32-linux",
-- 
2.36.1.vfs.0.0


