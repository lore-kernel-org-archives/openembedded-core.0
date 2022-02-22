Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537E6C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.1840.1645557463890364749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UuzNV11T;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id ay3so7669998plb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O4M3Qa81q8z0kK/AtZPDLcKAwQmhkBMXMmkq3NthEPA=;
        b=UuzNV11TaALryrFJJR4YglsUyAZmgAlE/Kw1DEmPQUZ1RuGjokBJGT0uT5n9PWe92S
         toUxY0JImi3utg4mElFu9UW4ecUq8BJRjlLQ2jrDFlQoCU1tee8+L0NrYLndpz07tnn+
         w6s/TnG/QYv9Crin81HWib+e8GfEeeyaljeTTqeIHQSPQ1gXyaJ1zJ26yYcik4+5lCas
         mQLgAXJ4BE1iGuP4hxte6JDWILpmO0th067V7biiuHeYyDk2XR6R6kx4ZnC6XFOuubSj
         VbRpTToKSdsJGFRC8QQmGRDUOt8ZzWLxjXR8RIRqZ+Nqa6s7zwHX8su6mOVhKCQd+WbP
         xuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O4M3Qa81q8z0kK/AtZPDLcKAwQmhkBMXMmkq3NthEPA=;
        b=fxPX/3qSwm5taeYuVtt6aH1EHB+0EBixPEXJKKutXQJeG84GvAEpVZeBf44/A4UFDG
         RsGd/bQB7+Lr77BJkDhUGnrit0zE6wH0E55SujnAt+udZmaD/sAavvlduZ0cxRUQgXVi
         qaKg0hzV03w0wfzEierDpRr0X5BTJePTJGoNJxpI36nGskfSi1nyM5my9wyaDNlVZqpY
         mgH+0i/QIdyT7pVGB6HYvvw6He6+z+/KV5GB4N7pezrxYQoxnLTJ9cIIomsVWFevv9aZ
         7sn44llb4fqA3h6V8t8K/V5Rc/V//+ifMetjFPVZzXWMWCZEN0nOKaQjEldXrISHqWLd
         hr6g==
X-Gm-Message-State: AOAM533PaFkzRv5HoqCdh4WJAPSmgrAO/UzstWVCihM3bt6O0jLcZFOO
	9DGov9WWnxfsHZ2rXBs+V0dbWHoRUE/csw==
X-Google-Smtp-Source: 
 ABdhPJxGv5T8KYjcc9m/iC/d7d+9bElOfEaILXbd+tKpV68cEDVocaLwCVOiH6Pt5qj6oDW3+NG0Ag==
X-Received: by 2002:a17:90b:618:b0:1bc:2e76:6385 with SMTP id
 gb24-20020a17090b061800b001bc2e766385mr5609967pjb.1.1645557462925;
        Tue, 22 Feb 2022 11:17:42 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:42 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 24/32] python3-magic: set PIP_INSTALL_PACKAGE
Date: Tue, 22 Feb 2022 11:16:50 -0800
Message-Id: 
 <a3a008dd2d1dcd851d205392a70b83f547724729.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162215

The wheel built by bdist_wheel has the name "python_magic-*.whl" so set
PIP_INSTALL_PACKAGE accordingly.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-magic_0.4.25.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.25.bb b/meta/recipes-devtools/python/python3-magic_0.4.25.bb
index efc8b6daaaf..bd46b294ae9 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.25.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.25.bb
@@ -8,6 +8,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=61495c152d794e6be5799a9edca149e3"
 
 PYPI_PACKAGE = "python-magic"
+PIP_INSTALL_PACKAGE = "python_magic"
 
 inherit pypi setuptools3
 
-- 
2.30.2


