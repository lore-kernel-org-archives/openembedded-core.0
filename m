Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF64C71136
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 05:59:20 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.5835.1692338352344812162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 22:59:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=dIfhD6bj;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-688769faa09so460452b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 22:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692338351; x=1692943151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MKAQDNdp+qwel/FXN8FU4Ptc4PbdUrK+tMSO3LhhKqM=;
        b=dIfhD6bjn22Jsj/JsJS3jR7yL+CYPGKnt68qPNEc6irtJ+uMpq3f6oBhFAsINMXRDt
         ERw6EnNM8FQDhOCcgxyLGmWU+QdDvtGAtf+Fo8DDYvUnAIdp7VpDRIHg6emBC9iSg69O
         NfvsGW5kXoQMjhuY6QOB64OEiNlB5vE2XS+QOy2A9pl7dXWwGU+/AAvJWytvac+Ytggt
         bNXLuUFCnU1xrOlVo5QOsc6NlXD7WRHFq7gdkabydNyyT7W8sUMt1n1S7JF01fCSXQNM
         mD+0bmDwpTBGPcrra7JwoYH0zRhpK+rabTggvUrs0/KOQnAar5ACnns6gcrI9lzFZq1j
         tdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692338351; x=1692943151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MKAQDNdp+qwel/FXN8FU4Ptc4PbdUrK+tMSO3LhhKqM=;
        b=e5cKJlNq6hWm0acDdnjYmJ8hvqE8eh+TRfDKEu8WlcJuI8IJ2yDkbeUzv8VUUAj/uH
         ng0rMJJK2+MXjXeBcsagPGr/15WE2zDAtStUYYV+dVIsmoZUbI/tpbNjkVqUnT+I+brX
         GXhGPoMT1nLl5L/9WPJ6FYrVk/qDCtigp4IUUA/N7XeAGKaEteLwKW8c36DswjZJ+aDk
         Hg7n/l4z9rY7TmyqIZGTbm0isseD5Hm9Tq0aus62uFOL+8WkVI3cUXdk0/M+VohqyhA8
         cNZbenRWJY8f+jlerpWI5EXT1T4ZINvHxUaYYpE2QT44FmD29fvhhrcRzZCjTxeBQFY/
         l2rQ==
X-Gm-Message-State: AOJu0YwqkDnRNkXFE7eLwHjlYCR6km9LpCdEPDAlnEMRr7psCozhrtV3
	f0rHuqV/FoHepG3KxVjcH863pmtsMU8=
X-Google-Smtp-Source: AGHT+IH2Aabki0rHKWDNihr9CD4my+f6T9vijuSEZYOw0Oj8MSTBkUKpnxQRfpQeSqThm45POb/D7g==
X-Received: by 2002:a05:6a00:2d15:b0:687:1604:39eb with SMTP id fa21-20020a056a002d1500b00687160439ebmr1841940pfb.25.1692338351226;
        Thu, 17 Aug 2023 22:59:11 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f26:55e1:e064:fe6e:d79f:fc2e])
        by smtp.gmail.com with ESMTPSA id x9-20020aa793a9000000b0068895adfdffsm744649pff.143.2023.08.17.22.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 22:59:10 -0700 (PDT)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][kirkstone][PATCH] acl/attr: ptest fixes and improvements
Date: Fri, 18 Aug 2023 11:28:51 +0530
Message-Id: <20230818055851.2052795-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 05:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186348

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a missing perl module dependency for the ptest packages and also
improve the run-ptest script so that the error log is saved allowing
easier debugging if this fails in future.

(From OE-Core rev: fbb9c596b8e6a8a1260dd7aefddf138d20bf64df)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2c948fa0250b765bc5f2fbe63c82258601cc77ff)
Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 meta/recipes-support/attr/acl/run-ptest  | 6 ++++++
 meta/recipes-support/attr/acl_2.3.1.bb   | 1 +
 meta/recipes-support/attr/attr.inc       | 1 +
 meta/recipes-support/attr/attr/run-ptest | 7 +++++++
 4 files changed, 15 insertions(+)

diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-support/attr/acl/run-ptest
index 4312823365..3af75c84fe 100644
--- a/meta/recipes-support/attr/acl/run-ptest
+++ b/meta/recipes-support/attr/acl/run-ptest
@@ -7,4 +7,10 @@
 mkdir -p /tmp/acl-ptest/test
 cp test/test.* /tmp/acl-ptest/test
 
+set +e
 make test-suite.log
+exitcode=$?
+if [ $exitcode -ne 0 -a -e test-suite.log ]; then
+    cat test-suite.log
+fi
+exit $exitcode
diff --git a/meta/recipes-support/attr/acl_2.3.1.bb b/meta/recipes-support/attr/acl_2.3.1.bb
index aca04a9aac..c2c9ba9069 100644
--- a/meta/recipes-support/attr/acl_2.3.1.bb
+++ b/meta/recipes-support/attr/acl_2.3.1.bb
@@ -62,6 +62,7 @@ RDEPENDS:${PN}-ptest = "acl \
                         bash \
                         coreutils \
                         perl \
+                        perl-module-constant \
                         perl-module-filehandle \
                         perl-module-getopt-std \
                         perl-module-posix \
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index a4e38f2b19..56028edb12 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -50,6 +50,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN}-ptest = "attr \
                         coreutils \
+                        perl-module-constant \
                         perl-module-filehandle \
                         perl-module-getopt-std \
                         perl-module-posix \
diff --git a/meta/recipes-support/attr/attr/run-ptest b/meta/recipes-support/attr/attr/run-ptest
index f64244f239..3e7a3a17a0 100644
--- a/meta/recipes-support/attr/attr/run-ptest
+++ b/meta/recipes-support/attr/attr/run-ptest
@@ -1,3 +1,10 @@
 #!/bin/sh
 
+set +e
 make test-suite.log
+exitcode=$?
+if [ $exitcode -ne 0 -a -e test-suite.log ]; then
+    cat test-suite.log
+fi
+exit $exitcode
+
-- 
2.25.1


