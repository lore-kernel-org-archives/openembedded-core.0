Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF2CC77B77
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 23:43:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.2746.1681515783646666372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Apr 2023 16:43:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lB7U0alE;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id v9so25380661pjk.0
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 16:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681515783; x=1684107783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAtJIKvZQ5kKXdJgtoJUjDnGFcJfeY7i1jcQgHilQvo=;
        b=lB7U0alEhsxCPA+/WW76VwgelP5w4h48SG/KWpzXgnSw5SOasQynlTU16BcMRHKPqw
         /AsXDczFQcfIRGOGfUOSapAt8o64xBhbKNXahGqEIIOlgrodUrkdXOwXh69rDURF3daj
         jriUIW5xTYf914n9/w15/fFr3nuk9DBwcoCamvkkSLU+YXQY4f74QtcI6L/I8I0Hpn5v
         o+ybLhvX5yGW4OQPcoLODYslFYlGFAGGSAgH9+8CXAxR+fd+2NylGKe/zBoWo/qtpe0p
         r5ATdTCL8eblc2a90nUmEZQ6H2aOi0Nv/ydNJaL6osIQ8fzPidPzS1lHq5/vJ2I6STvP
         xoVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681515783; x=1684107783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAtJIKvZQ5kKXdJgtoJUjDnGFcJfeY7i1jcQgHilQvo=;
        b=iv79rUrjzvVCLdVR3+jZ0+EOn4nozcFBG80orPpuUnw10iE2F0VdXvblXWwlKMRTV5
         WwS1jZgJStVM6nKgb7suhbJedR+hP4wAWgBV6Hz3F7XGMtWgC5PgBBNaRIAA2T13zENM
         JfNozZoKAn3+ICQY7GBiGZujzWIQjKpOqu0R/ajz8VIwMeEJWwZyWJcIPMMPF/Ual8nh
         qq/eIIfWA9nemV8tLW9VKM8YCyMKR7p9IhQiFcIfOnf9g8eFf+l/kAjijIfPR4rXRaqX
         Wh+fn4q+DjM54bevp2j9NQcXXXZaBwLWLNwwAu5COAZZ8et9mgwee0NhUHYB/kRgnqG/
         QkEA==
X-Gm-Message-State: AAQBX9ehq1nsJIyxsdPc2ryQeBrHQm4zMCvNpEwU5NofrAhpYtykVyQ8
	qd6a8Ptg5fPI8xIEXX31jtErBJ8KSfY=
X-Google-Smtp-Source: AKy350b+cEjCSRt65wzM+ZBsZ1+3hNO+g/zMecMYbwlusSTjUx3dc3hnQG8LkI+s/r4mAbFZp3gmCA==
X-Received: by 2002:a05:6a20:2927:b0:d9:27f7:8c4a with SMTP id t39-20020a056a20292700b000d927f78c4amr6745104pzf.0.1681515782614;
        Fri, 14 Apr 2023 16:43:02 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id x24-20020a62fb18000000b0062de9ef6915sm3476564pfm.216.2023.04.14.16.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 16:43:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/3] gawk: Add skipped.txt to emit test to ignore
Date: Fri, 14 Apr 2023 16:42:58 -0700
Message-Id: <20230414234258.157267-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230414234258.157267-1-raj.khem@gmail.com>
References: <20230414234258.157267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Apr 2023 23:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180008

This file can be processed by run-ptest during runtime and tests
mentioned in skipped.txt will not be run.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: New

 meta/recipes-extended/gawk/gawk/run-ptest | 5 +++++
 meta/recipes-extended/gawk/gawk_5.2.1.bb  | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-extended/gawk/gawk/run-ptest b/meta/recipes-extended/gawk/gawk/run-ptest
index 2675650600..f4ef3e7bd4 100644
--- a/meta/recipes-extended/gawk/gawk/run-ptest
+++ b/meta/recipes-extended/gawk/gawk/run-ptest
@@ -3,6 +3,11 @@
 cd test
 for i in `grep -E "^[a-z0-9_-]*:$" Maketests |awk -F: '{print $1}'`; do
   unset LANG
+  grep -q "^$i$" skipped.txt
+  if [ $? -eq 0 ]; then
+    echo "SKIP: $i"
+    continue
+  fi
   srcdir=`pwd` AWKPROG=gawk AWK=gawk CMP=cmp make -f Maketests $i >$i.tmp 2>&1
   if [ -e _$i ]; then
     cat _$i
diff --git a/meta/recipes-extended/gawk/gawk_5.2.1.bb b/meta/recipes-extended/gawk/gawk_5.2.1.bb
index c914326563..768c8eb364 100644
--- a/meta/recipes-extended/gawk/gawk_5.2.1.bb
+++ b/meta/recipes-extended/gawk/gawk_5.2.1.bb
@@ -59,6 +59,9 @@ do_install_ptest() {
 	# https://bugzilla.yoctoproject.org/show_bug.cgi?id=14371
 	rm -f ${D}${PTEST_PATH}/test/time.*
 	rm -f ${D}${PTEST_PATH}/test/timeout.*
+	for t in time timeout; do
+		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
+	done
 }
 
 do_install_ptest:append:libc-musl() {
@@ -71,6 +74,9 @@ do_install_ptest:append:libc-musl() {
 	# The below two need LANG=C inside the make rule for musl
 	rm -f ${D}${PTEST_PATH}/test/rebt8b1.*
 	rm -f ${D}${PTEST_PATH}/test/regx8bit.*
+	for t in clos1way6 backsmalls1 commas rebt8b1 regx8bit; do
+		echo $t >> ${D}${PTEST_PATH}/test/skipped.txt
+	done
 }
 
 RDEPENDS:${PN}-ptest += "make locale-base-en-us"
-- 
2.40.0


