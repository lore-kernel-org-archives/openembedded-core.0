Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF68C83F03
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 08:47:46 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.8190.1751618858571166347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 01:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=BbnvYaJ4;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748e81d37a7so528542b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 01:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1751618858; x=1752223658; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IQIM4g+Y+GSIGMmvSh3I1djOXeSvdeB1rCjzgB6kC3k=;
        b=BbnvYaJ4DSKFj5LdhTGkFbSKyIby5oqCjpOKG3yupXweckxzh5gubLruRQQQgSx1Gi
         ovVtDP0wWUQDeX0DhL42VfskPmEPWoozdsfQPUu4U6Sz4+mvlFWK0UOW41EYiLdy5inC
         pmf8tLIvQ7fScXGJDdC8z4rmODkeF+BOJQRcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618858; x=1752223658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IQIM4g+Y+GSIGMmvSh3I1djOXeSvdeB1rCjzgB6kC3k=;
        b=EsKsgjpbcHWccY7KzxvkFZ1Yx5ymnvrUF1Mha44uBo2SKcxW48bQgfuR1GrrDZ2XXH
         IUlxnBT/DQjGg+rK5EH2HN2VDthVkh6qWmTA5bi1vy+iT1JwyThVdS5CturYS9TJrAbS
         8yBPrmQSTMeccYW//HVkq5GbZ6wODwcE0dQH/qw5i1FMOPZ3lHU4AkLfQF6XxJxUZ3tI
         FD2yi2yPliYbIiCxEz3QqsK02LQfBdB2wydD50Pq2ecyKsrbJI6MRG/v2xapfliVAtfW
         dJj1AoeTJoSrGEIXdvdCGruQWaiJAcfrAXbgkbOgVKZajBSEq4hgRARHpdX8xrXTZn4M
         dBTA==
X-Gm-Message-State: AOJu0YySx2ELBAHrVuR3il7oDYWqehh2MzphbJDTf3jLH+KCOFMC9gv6
	q6dqCM7EAyJuJc8oFS150lq8/Yl+jNexlK62MiEQzQsGeVSqwLShKAWFlh3vkZi8FVhxtR1a0Z9
	FWHO4
X-Gm-Gg: ASbGncsxZJ9cYpoIQQVfNQ1krMhZidxdbes505r7+Kr/0Pf8XiSqDeumH8z9qgRyv4m
	j+AJ+Q7N38vSYWsQscVxYUFG+1yDQ+Uay8hf5DbXU12VBwr8kKEF22wJYqjA5Z6O7Ha7K/+nlPA
	UcF8LbIMkiyenTwAxA30o8ctCnPtTwsI2C2Y6tF8Z1PVXRzHYnDJSvUAzIpu0Vb1A8I0xnxPZY4
	EJH7Xjk9si2YvSyNl2k1+4tEy7CiElOrk0wf2run3jFWOtYUDZtS+sPvdxOoCz1fqu6CuQE7KGq
	p0UwMVfAbN2kz3dF61LIhDiFJmMTuS1Nx52Knd9pFjzbP1eNGxF/ZB5pCOZ0mO7xAPyMzCnkupk
	=
X-Google-Smtp-Source: AGHT+IEfPdfgpNiN3h7/tyAxTB8NfCj/qywtH8zVoszkXgkjPYKcJ8i4XD6+Ce5hDuzsWSAuZw7nOA==
X-Received: by 2002:a05:6a20:a127:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-225be6e3f30mr3370454637.7.1751618857687;
        Fri, 04 Jul 2025 01:47:37 -0700 (PDT)
Received: from MVIN00016.mvista.com ([43.249.234.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee60c55csm1584341a12.43.2025.07.04.01.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 01:47:37 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] libxml2: fix CVE-2025-6021
Date: Fri,  4 Jul 2025 14:16:21 +0530
Message-ID: <20250704084621.593762-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219903

Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libxml/libxml2/CVE-2025-6021.patch        | 56 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
new file mode 100644
index 0000000000..9ec58e33c2
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-6021.patch
@@ -0,0 +1,56 @@
+From acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 27 May 2025 12:53:17 +0200
+Subject: [PATCH] tree: Fix integer overflow in xmlBuildQName
+
+This issue affects memory safety.
+
+Fixes #926.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/acbbeef9f5dcdcc901c5f3fa14d583ef8cfd22f0]
+CVE: CVE-2025-6021
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tree.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/tree.c b/tree.c
+index 6e04dfb..cdf863c 100644
+--- a/tree.c
++++ b/tree.c
+@@ -50,6 +50,10 @@
+ #include "buf.h"
+ #include "save.h"
+ 
++#ifndef SIZE_MAX
++#define SIZE_MAX ((size_t) -1)
++#endif
++
+ int __xmlRegisterCallbacks = 0;
+ 
+ /************************************************************************
+@@ -222,16 +226,18 @@ xmlGetParameterEntityFromDtd(const xmlDtd *dtd, const xmlChar *name) {
+ xmlChar *
+ xmlBuildQName(const xmlChar *ncname, const xmlChar *prefix,
+ 	      xmlChar *memory, int len) {
+-    int lenn, lenp;
++    size_t lenn, lenp;
+     xmlChar *ret;
+ 
+-    if (ncname == NULL) return(NULL);
++    if ((ncname == NULL) || (len < 0)) return(NULL);
+     if (prefix == NULL) return((xmlChar *) ncname);
+ 
+     lenn = strlen((char *) ncname);
+     lenp = strlen((char *) prefix);
++    if (lenn >= SIZE_MAX - lenp - 1)
++        return(NULL);
+ 
+-    if ((memory == NULL) || (len < lenn + lenp + 2)) {
++    if ((memory == NULL) || ((size_t) len < lenn + lenp + 2)) {
+ 	ret = (xmlChar *) xmlMallocAtomic(lenn + lenp + 2);
+ 	if (ret == NULL) {
+ 	    xmlTreeErrMemory("building QName");
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index bd6dd88dee..45424e59ff 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -39,6 +39,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2025-24928.patch \
            file://CVE-2025-32414.patch \
            file://CVE-2025-32415.patch \
+           file://CVE-2025-6021.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.49.0


