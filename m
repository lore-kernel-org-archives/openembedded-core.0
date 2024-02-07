Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8239C4829A
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 06:02:49 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.14531.1707285764276300428
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 22:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DTfpAo01;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5986d902ae6so131226eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 22:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707285763; x=1707890563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sBmIL0nEB/AR75bxuTBts3zGSqbLEHqK7/OVl8aotXM=;
        b=DTfpAo01cJQ5ye8CNFiXtBJKkPCcOnwXFlG64wZr2WWuxDMu6FOPnJwv1+k8hnIp5H
         8oTiIYNjhCsuZHEDDuv1ikYMwam98wBslKtmdiPLAss9kpNVyRe9AgVh7IHegQ36MGkq
         DYLIee89ylgkJc+wttunpIKqpuh1U8XICygqJL3YE7LkXiSKmVYXcA7sHZXdRS9RDSAk
         m1YqfjXI16rDBQUG3AyccZw2eX6NxgdzOpycSokVwKPd26kuCNRwoZfJplZYudBD7SER
         FsdRPyBdAmwLPDRKHm/PwsBnrCd/wL8a9YytXQWpU5IqobwM5g/QreI9Fst/+DctWMCG
         3EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707285763; x=1707890563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sBmIL0nEB/AR75bxuTBts3zGSqbLEHqK7/OVl8aotXM=;
        b=BzSAdNIhYHHiO0wOO5gadjzLkVSOrxeDQT59jMmNLlnhGOeO+g+QGSsfM9QECGsLiU
         uHC4LPJlwZsSVDbxEaidM23xR/I3J3Logxkao9rKzxfJsOe+8E2WYXx/jlW193p+Di71
         7aLZBqAL/ipZ+XOGHIe18AKD1BGJFi04MFUFOyXkiW6ohNSGdnNq/XZxXz/ZDV9Y1yJU
         x9WnlOY353epNlK/hyz4vVd7EVzaOYNi7Me6TD36+KKqXh0y5tPojrp+Akt2ZHkf5CEg
         Q031PL8xeGNPwcfyZz3eFwuC6t4pPxoPAZ5LHi+El2fdT8oN2e+cv3rayvmSJqPaXrnP
         Zfrg==
X-Gm-Message-State: AOJu0YzUD0FJSkHKQRdqGwSQX8q99eJLq6Fdy8TUFzvgk0UuGngRV+O3
	OX2Rr+Oq6PBFP/bProVcsNGUHtl6sMxiTsRu9uSJJE+5+PSmRDnPSut+RdBe5iI=
X-Google-Smtp-Source: AGHT+IETIXQ/pk+885VtxVB9p/QH+E5G8EYWe440kDqNIGVNknuWbN/JPDIoKb0g+9bJf3IbjisLBg==
X-Received: by 2002:a05:6358:224d:b0:178:9393:176b with SMTP id i13-20020a056358224d00b001789393176bmr1879050rwc.16.1707285762926;
        Tue, 06 Feb 2024 22:02:42 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c29d])
        by smtp.gmail.com with ESMTPSA id fb37-20020a056a002da500b006d0d90edd2csm559599pfb.42.2024.02.06.22.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 22:02:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] expat: Upgrade to 2.6.0
Date: Tue,  6 Feb 2024 22:02:39 -0800
Message-ID: <20240207060239.2202928-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240207060239.2202928-1-raj.khem@gmail.com>
References: <20240207060239.2202928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 06:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195038

Package and run benchmark as part of ptest
This is a major release with following changes [1]

[1] https://github.com/libexpat/libexpat/blob/R_2_6_0/expat/Changes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/expat/expat/run-ptest                    | 2 +-
 meta/recipes-core/expat/{expat_2.5.0.bb => expat_2.6.0.bb} | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-core/expat/{expat_2.5.0.bb => expat_2.6.0.bb} (82%)

diff --git a/meta/recipes-core/expat/expat/run-ptest b/meta/recipes-core/expat/expat/run-ptest
index dbf602ca800..ff7986db3cf 100644
--- a/meta/recipes-core/expat/expat/run-ptest
+++ b/meta/recipes-core/expat/expat/run-ptest
@@ -5,5 +5,5 @@ TIME=$(which time)
 echo "runtests"
 ${TIME} -f 'Execution time: %e s' bash -c "./runtests -v"
 echo "runtestspp"
-${TIME} -f 'Execution time: %e s' bash -c "./runtestspp -v"
+${TIME} -f 'Execution time: %e s' bash -c "./runtests_cxx -v"
 echo
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.6.0.bb
similarity index 82%
rename from meta/recipes-core/expat/expat_2.5.0.bb
rename to meta/recipes-core/expat/expat_2.6.0.bb
index aa8d439d5fb..1f9f7b269a4 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.6.0.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "6f0e6e01f7b30025fa05c85fdad1e5d0ec7fd35d9f61b22f34998de11969ff67"
+SRC_URI[sha256sum] = "ff60e6a6b6ce570ae012dc7b73169c7fdf4b6bf08c12ed0ec6f55736b78d85ba"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
@@ -24,7 +24,8 @@ RDEPENDS:${PN}-ptest += "bash"
 inherit cmake lib_package ptest github-releases
 
 do_install_ptest:class-target() {
-	install -m 755 ${B}/tests/* ${D}${PTEST_PATH}
+	install -m 755 ${B}/tests/runtests* ${D}${PTEST_PATH}
+	install -m 755 ${B}/tests/benchmark/benchmark ${D}${PTEST_PATH}
 }
 
 BBCLASSEXTEND += "native nativesdk"
-- 
2.43.0


