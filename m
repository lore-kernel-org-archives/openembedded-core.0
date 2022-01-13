Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48607C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 17:35:59 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.184.1642095358479099868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 09:35:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I3uPkCLm;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id i65so505375pfc.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 09:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wE9F8b4G+robbJG+EL5HAlcx/dGA1N+p2VQppndZZ90=;
        b=I3uPkCLm9M/PAMA7TxADXyrNuZiWCPA7mWgct0eRrDOwJ4Rm0oCt5Tp7b5NaKddKO8
         n/s0aAnWRlaROZm2cqL/kGs6I20fb5GcMQNjHmPFqJ1TG4xA72dw97/+F081ByC9bYfM
         NGfWLq+SK7PVt/wVQMqTdJz1gsPduIem66GJgO9WfbPuQB4RPsRBn2BjXD8bLuS0FD3c
         /6DJnyGVjp12UrNQx8niYvHJJ40YR6PHDLpGPOUO02Zg2jOosAwjSHxSWsvSZ1MwvejB
         y7AFwkQNb6oDOiRluqAoaNMexiKoZBFiucKoGGJY2EBWu8uFmnn+wINmZI9g+lQpAy1I
         VMug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wE9F8b4G+robbJG+EL5HAlcx/dGA1N+p2VQppndZZ90=;
        b=O45CZwMtEPqgC7Hn3IiXHzKgf5onrqG16TawPXjJ6rRQexcCpIEPGNPWOVEBOaJ2Gw
         0xvEyEb7JEg0z5gUX8WEl2eJfbXLZkc/Jvyf8RROj0KU4GC1yMUYosez5RBvGcqHBrJ+
         PaqS7NfGXL5di+EwpzAyN1TqIkKfywEYYwPEDj6ZHzNacnSShJBd0pJqsNCFMPmailhm
         brj6wCFmggrEOXijlvvhmKsQ2cwoeorz4UHf0hiu2EsQAFmLE50+5l71jMbi9BT4ltOm
         I/QNSNc+Z3DcjVW/+ceqZnWwthZqMUwjY5h+5/G+9F0m+GXfaFXdVUJ1VQ+qkfpdO0qg
         99LQ==
X-Gm-Message-State: AOAM533R8ljHZI4Y+W3prmI5ecMqWoqwQQiWtM3+ngqWAOxIC8tbZwkn
	b49pQNeFQl0iFTTGiOJtCnVmjI8z+yplvw==
X-Google-Smtp-Source: 
 ABdhPJwpCySdz6DoYShReXqeadvw0jLGnrD+l9mwJuo+wn7gqwIgXpPPOjyi1BPJzh51YbiuBCzAZQ==
X-Received: by 2002:a05:6a00:a20:b0:4bb:95f6:93b3 with SMTP id
 p32-20020a056a000a2000b004bb95f693b3mr5183557pfh.77.1642095357669;
        Thu, 13 Jan 2022 09:35:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 j18sm2733666pgi.78.2022.01.13.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 09:35:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] valgrind: Enable network for ptest builds
Date: Thu, 13 Jan 2022 09:35:55 -0800
Message-Id: <20220113173555.1925441-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 17:35:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160526

do_compile_ptest_base uses xmllint which accesses internet for
validating DTD

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.18.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
index 7837034f92e..5ebcae467fa 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.18.1.bb
@@ -98,6 +98,11 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 # which fixes build path issue in DWARF.
 SELECTED_OPTIMIZATION = "${DEBUG_FLAGS}"
 
+# This is needed because xmllint needs access to network to
+# validate DTD 4.3 onwards it uses --dtdvalid http://www.oasis-open.org/docbook/xml/4.3/docbookx.dtd 
+# to xmllint, allow it to access internet
+do_compile_ptest_base[network] = "1"
+
 do_configure:prepend () {
     rm -rf ${S}/config.h
     sed -i -e 's:$(abs_top_builddir):$(pkglibdir)/ptest:g' ${S}/none/tests/Makefile.am
-- 
2.34.1


