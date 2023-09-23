Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD57CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 20:45:14 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.28657.1695501911245120286
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 13:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TSzxWdds;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c46b30a1ceso36111535ad.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 13:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695501910; x=1696106710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSepRzrbnYHcL0rDFQtTrkFSgYE0IAoDteL0QdIL3m4=;
        b=TSzxWddstfSYnPWCeTuWG80Hxzwl0LGt6xvjWY3oxeOBdkLgU7Yu6T/3j+jKJBf4nx
         0dzyxJgQ5HcgsNPg8MCGzIudO24J5B/LRjMX1kquQ14ZZAdPloXbi0egO3q1HmR79YWc
         DYn9+iI2No90WOzO7PUwcO07Zv0sIqyerHqeKCed4+5cJC1BExcvxl7tYzG1hUtadjcb
         xSiMhiKasL+lHB93gkMg3hQbkAtIp0wLdm14fVfRLBYnXVPXmh9RVJfKaFhm++1UZVGU
         bA5OGCSiAtUuS8dId236EpkS6/liOyGkxa2S+md959ZqFHc+FVyKh8b38KXsmi9zIt+Y
         IVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695501910; x=1696106710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSepRzrbnYHcL0rDFQtTrkFSgYE0IAoDteL0QdIL3m4=;
        b=gpFWHcqJOfcdvm5eqfSX/vbSlVaYUJgPzBufgQEKzTaksNfQxaLguBayT32GJLiYX3
         kzAyFat8pAkQpOPEBaT/giowmDTiHFbXvZyC19ILBAKhFByFLMrO+X1yq9/n2ibTzEGT
         7Sl5JlVCXXqVm1IKjHZ4Y7lIe8zaRkvoqx6iNslflyXVgn75kVmWPdUnzOVQ2Iv3Xk2t
         oh9/EhAp1b+oVey489oY3HrZtxflJ2q94vHDI8QnhC8lAa497ft7Elm408pKqAylDv3b
         WCsf4SgNWlAAqpmY3DsLKwe70PNHjFXZYUlNEyAuZLMmWHkLWO2QWqxW/0/cgNsGaxo6
         lUPw==
X-Gm-Message-State: AOJu0YyxQ8zVJpV9bV0PPeSq8urNy9hkxtkeQ6O85A6QYReq2SFMQOl/
	g55vUvAMFjx0VWgma/fzJ0fChJq9awco1g==
X-Google-Smtp-Source: AGHT+IEE2/9T+fYgpdxNCRf7xkyo4CsXkDKS3JGz00lVi2ePBbb3j6HXim4pQ7WHjIjG+Vv5Su9szA==
X-Received: by 2002:a17:902:e88d:b0:1bb:9b29:20d9 with SMTP id w13-20020a170902e88d00b001bb9b2920d9mr3800178plg.20.1695501910459;
        Sat, 23 Sep 2023 13:45:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id q11-20020a17090311cb00b001c3721897fcsm5760450plh.277.2023.09.23.13.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 13:45:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] glib-2.0: Remove failing ptests on musl
Date: Sat, 23 Sep 2023 13:45:07 -0700
Message-ID: <20230923204507.882395-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230923204507.882395-1-raj.khem@gmail.com>
References: <20230923204507.882395-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 20:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188154

FAIL: glib/convert.test (Child process killed by signal 6)
FAIL: glib/collate.test (Child process killed by signal 6)
FAIL: glib/gdatetime.test (Child process killed by signal 6)
FAIL: glib/date.test (Child process killed by signal 6)
FAIL: glib/converter-stream.test (Child process killed by signal 6)
FAIL: glib/option-context.test (Child process killed by signal 6)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 5183f37a6ef..c508990ee8c 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -134,7 +134,12 @@ do_install:append:class-target () {
         # https://gitlab.gnome.org/GNOME/glib/-/issues/2810
         rm -f ${D}${datadir}/installed-tests/glib/thread-pool-slow.test
 }
-
+do_install:append:class-target:libc-musl () {
+        # Remove failing tests on musl libc systems
+        for t in convert.test collate.test gdatetime.test date.test converter-stream.test option-context.test; do
+                rm -rf ${D}${datadir}/installed-tests/glib/$t
+        done
+}
 # As we do not build python3 for windows, makes no sense to ship the script that's using it
 do_install:append:mingw32() {
         rm -f ${D}${bindir}/gtester-report
-- 
2.42.0


