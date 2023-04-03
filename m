Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9E4C76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 16:27:16 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.76020.1680539227402707350
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 09:27:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RBeqWlnc;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso14313928pjf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 09:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680539226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/ttKAmXu9ttUx84vlsPNAYFuGQ69AVOFesjYW02XxQ=;
        b=RBeqWlnc1ynviigDbChUOTTrjhpsLWSVr8THkinrrHUEoi5LAAHfJyidKOYltdM2Ws
         F1EhLRMfKPEp5uiqwT62XqCKplmYhuGc1Ip/pAOLVX5KE31Bgt8EblQP9xXUOtF3BE5s
         ty1p92nLmtxZO0hAnl5ZUCzrIHnfhLuPl25OIcM2+r1GXqDXJdn1VFntIVIeNGFAogl2
         qP8cYfF+xdhzFErocOzWmia8dZe9W37o/94GAjRNaGpMg9I8DknBKI88Ov9qEXDkJV5X
         8swfTmEypzp6mHrG8zaqGe9NW7BPEvEpF+ND17E9DaB+80i73GpE7mZnohPHOocKR24o
         xiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680539226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o/ttKAmXu9ttUx84vlsPNAYFuGQ69AVOFesjYW02XxQ=;
        b=rE3Sm+N0UM1vbovuPxVTLJyX04ibOrqjMnPmecouujAaIMqdwuXUnzt5Kw8EHvfjqS
         RIDy66o8yD5LVaOoREab+NHuvY3er3jwWlEKxEUQG/q2ht/jUB+rhBNofaWfC7EeFCWa
         uyO+nv4pNm5UCjVyB8rU7JfwLYVvC8VTk5vaCcR1jhYZKZ7r1YQpJhlkvAqUskv8WI4h
         9rXPrvp2BFTR/Dt2gdh6hwhAkD7oPlSDctaSBUGv8/4RyMqiSzsNBQQ1WIlRna9/D3qU
         hbd84gug85NlIR/sf7u7NzQHEreXERMuH6gs1aEA6JTPKLYRl3h2QHhm+UFzb8cQ+IRD
         Ij8Q==
X-Gm-Message-State: AAQBX9f0GRBOUEYxdahSIJH57dYLFHGB2VSGc9UAZM2R3oGpb4PhV+oP
	F3d/QrJ7ZRC6RE2FfGtmTyKMrHJxT2o=
X-Google-Smtp-Source: AKy350b36Z6wJQzji9VoC2GDU+N6UsGMgNPuhJHyG1/bx2tszu9wokVx9pBnWaFXEHjaQa6x5AStSw==
X-Received: by 2002:a05:6a20:2d9e:b0:db:e054:826a with SMTP id bf30-20020a056a202d9e00b000dbe054826amr19517250pzb.5.1680539226388;
        Mon, 03 Apr 2023 09:27:06 -0700 (PDT)
Received: from L-10146.. ([2401:4900:1c2d:7ffa:2ced:a026:9258:b967])
        by smtp.gmail.com with ESMTPSA id y8-20020aa78548000000b006288ca3cadfsm7151272pfn.35.2023.04.03.09.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 09:27:06 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Anuj Chougule <Anuj.Chougule@kpit.com>
Subject: [meta][dunfell][PATCH] json-c: Add ptest
Date: Mon,  3 Apr 2023 21:56:50 +0530
Message-Id: <20230403162650.695076-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 16:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179644

From: Anuj Chougule <Anuj.Chougule@kpit.com>

Re-used implicit test suite and converted it into ptest.

Signed-off-by: pawan <badganchipv@gmail.com>
---
 meta/recipes-devtools/json-c/json-c/run-ptest | 14 +++++++++++++
 meta/recipes-devtools/json-c/json-c_0.15.bb   | 21 ++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/run-ptest

diff --git a/meta/recipes-devtools/json-c/json-c/run-ptest b/meta/recipes-devtools/json-c/json-c/run-ptest
new file mode 100644
index 0000000000..570aac4588
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/run-ptest
@@ -0,0 +1,14 @@
+#!/bin/sh
+
+set -eux
+cd tests
+for t in test1 test2 test4
+do
+    echo "Running $t.test..."
+    if "./$t.test"
+    then
+        echo "PASS:$t"
+    else
+        echo "FAIL:$t"
+    fi
+done
diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes-devtools/json-c/json-c_0.15.bb
index a4673a2f0e..4070078089 100644
--- a/meta/recipes-devtools/json-c/json-c_0.15.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
@@ -4,8 +4,9 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
-
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+           file://run-ptest \
+           "
 SRC_URI[sha256sum] = "b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
@@ -13,6 +14,20 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
-inherit cmake
+inherit cmake ptest
 
 BBCLASSEXTEND = "native nativesdk"
+
+RDEPENDS_${PN}-ptest += "bash"
+
+do_compile_ptest() {
+        oe_runmake -C tests test1 test2 test4
+}
+
+do_install_ptest() {
+    mkdir "${D}${PTEST_PATH}/tests"
+    for t in test1 test2 test4; do
+        cp "${S}/tests/$t"* "${D}${PTEST_PATH}/tests/"
+    done
+    cp "${S}/tests/test-defs.sh" "${D}${PTEST_PATH}/tests/"
+}
-- 
2.38.1


