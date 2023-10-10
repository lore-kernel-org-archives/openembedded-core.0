Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D85CD80DF
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 13:50:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.92074.1696945813645864774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 06:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=udbQ367U;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-405505b07dfso39996695e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 06:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696945812; x=1697550612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoIpFjI3VTmRyhOBexSFY3WYA/wAHbNpUMJfX/VeAjQ=;
        b=udbQ367UTcvnGXD7wS2vt3PmHnQ1L6L+VPNmgv0I8IEL5KZBHYJ7+yqv9TiR3v9f0S
         ym4NisrHdLmmQCBC8O7TMr93vM9coFPZwmh9KX0NJITHKBnrISGU2htrqYfV2wBk2R/c
         miO9756QuzSnXLemEvLDpYGKHWBmCAuZ5NAppRhQIqZRw/iZ23o1xN+QqtoT536lDBps
         QXUYcCNfatBSIPAY8lYKyxaMkk+ZFFbwz2xKOn8xUdFtZ3HeeZcQJXQI0+hLRz5So16O
         qR9H39qUbfnYqhEFApjGhhzRc7ZZDWmUG7xbk639JZpK2bCgEq/PQ0UvmB626XCm7iIQ
         sX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696945812; x=1697550612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoIpFjI3VTmRyhOBexSFY3WYA/wAHbNpUMJfX/VeAjQ=;
        b=Lar8uqm/YYO4uhLQs/JgUc57Klsws/tSMlWAPGnk9AF6PQceMGktzcpnWDz8Qo+Jep
         DCXYQN9582rG6HJaBbHjaUnQEkFYvqwcSnvG9d8WnOKgkiitcPQ3/DLzso74IOL+PHMZ
         NgUjusppiazLMzbIg/Iax6MZE/yGSdQOTdJ+g7kMvC71Yc3IixjVW17zG2B1E9aVoUie
         9i1ou0hn0tNvoC6dM8fMXYsxrsaFfMAoS/XjUy4SEj1jfmORgaDiQFz6Dacfh0IGbRQT
         I2Sxz+Db3S3+BrQ1vNA3mGuLg4FGV7MZ3C+FAuU/PWLwd+lg8vJRv8WVQcUun4N921LL
         Lysg==
X-Gm-Message-State: AOJu0YyF5CENC95iGPntxSlWHcMmDZlS9UqtT8/DCwdSN40LCgoTZuWu
	NuLkZ5VjjFNzpxyk+SsjN06jX0xPfMXcf4Y3tVg=
X-Google-Smtp-Source: AGHT+IGgpRr+txN2kK7aTkrVRckjo5IyRU/65R9aDlfQTCIMw+ZKLJrQgf+GS65oR4O+WcXasasyuA==
X-Received: by 2002:a5d:5442:0:b0:324:84bc:d5ab with SMTP id w2-20020a5d5442000000b0032484bcd5abmr12470001wrv.1.1696945811618;
        Tue, 10 Oct 2023 06:50:11 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id c14-20020adfed8e000000b00317b0155502sm12716070wro.8.2023.10.10.06.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 06:50:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3 3/4] insane: Detect build-system test harnesses
Date: Tue, 10 Oct 2023 15:49:30 +0200
Message-Id: <20231010134931.3994720-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231010134931.3994720-1-yoann.congal@smile.fr>
References: <20231010134931.3994720-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 13:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188895

From: Jérémy Rosen <jeremy.rosen@smile.fr>

most build-systems have a way to implement a "make check" or equivalent
command that will run tests in the source directory.

This heuristic will detect the keywords in the build-system configuration
that activates tests.

Note that in the case of autotools, we use Makefile.in as our source
instead of Makefile.am to easily follow includes. Filenaming conventions
for autotools files are not reliable enough to do naive matching.

Signed-off-by: Jérémy Rosen <jeremy.rosen@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/insane.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 99b8faccf5..3fa9da8aff 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1379,6 +1379,18 @@ python do_qa_patch() {
     elif match_line_in_files(srcdir, "**/*.py", r'\s*(?:import\s*pytest|from\s*pytest)'):
         oe.qa.handle_error("unimplemented-ptest", "%s: pytest-based tests detected" % d.getVar('PN'), d)
 
+    # Detect meson-based tests
+    elif os.path.exists(os.path.join(srcdir, "meson.build")) and match_line_in_files(srcdir, "**/meson.build", r'\s*test\s*\('):
+        oe.qa.handle_error("unimplemented-ptest", "%s: meson-based tests detected" % d.getVar('PN'), d)
+
+    # Detect cmake-based tests
+    elif os.path.exists(os.path.join(srcdir, "CMakeLists.txt")) and match_line_in_files(srcdir, "**/CMakeLists.txt", r'\s*(?:add_test|enable_testing)\s*\('):
+        oe.qa.handle_error("unimplemented-ptest", "%s: cmake-based tests detected" % d.getVar('PN'), d)
+
+    # Detect autotools-based·tests
+    elif os.path.exists(os.path.join(srcdir, "Makefile.in")) and (match_line_in_files(srcdir, "**/Makefile.in", r'\s*TESTS\s*\+?=') or match_line_in_files(srcdir,"**/*.at",r'.*AT_INIT')):
+        oe.qa.handle_error("unimplemented-ptest", "%s: autotools-based tests detected" % d.getVar('PN'), d)
+
     oe.qa.exit_if_errors(d)
 }
 
-- 
2.30.2


