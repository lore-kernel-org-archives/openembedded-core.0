Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A89C7EE43
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:36:26 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.498.1686191780762543229
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 19:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ZiXEcgBP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-65242634690so27185b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 19:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686191780; x=1688783780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQQlS37z/+Woo2GrRS0+dW9KDKWmNZbe2HlG/+oim04=;
        b=ZiXEcgBPEsJnJtty5kSEBYoiBY6Lkjo2ZaJCcQanAnn3xOve4uUjEN7hMPuoO6I4Cr
         sFYIPbvLJ2myhtjLLWuBy0mA/ND1Eqq9gQf3NBiJygMV7zOvqvcfgBue/E5Zsd0ncWjc
         DrFoDkfwcmuPCvcDnZAPIg4UOy02qkKfVyg6mhYHPWKms8EP4yDIwB4+JSKqOs0v0K90
         /mJjTmWwDYyi6+IR2C7G3Ud+JmwPJN/eYQFRl+ucuEeNz5HXmY6rm+jzbJH1v7wXcG4n
         8so5dlWKCezIuxv3Av5XMr70WvdROff8Fm2vGu7Q7OuMc6YH3randWVOUXOgRYfJbSE2
         OL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686191780; x=1688783780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uQQlS37z/+Woo2GrRS0+dW9KDKWmNZbe2HlG/+oim04=;
        b=aBDv1lZP8HbDmoHW+EF5XUjLnu0+8z7fyuzoorLPHq8O3LST3VgPj93l36MgligOl9
         dzrORKzuP85xtGlBeHivGQpMSHwP0b5qGt6F+6ZV1ZBPjtuHOwofBUxMHckkG03QWmzU
         SuaBfJXgTvBVUgdvxFEPmwj2LoDnWkdyluLF7lO55pyNV4/eHmh1KA0ibC2ZMEFZGhNG
         wrTSguj4v/PkvYTmZTV4LdYdlq+zcmsiksMxBLq5SuV4+adXBXUc9UrfPG64FeG8s7Dr
         48BY1hwqVGeiYasHk0G1My+/CVQ835ziKHGZf3PRDgiw5+hJg54iu2bMo0dXHXyO0iBu
         hBCw==
X-Gm-Message-State: AC+VfDw+R9unV+pZA7Cnb8ElOOp/lRINlC3KO2eXfaIpXdu1i/m0IvzF
	G8VHc6YXATnaMxH8d5BbFXoFcs3Jf2btgLHgyhM=
X-Google-Smtp-Source: ACHHUZ61t7Y9k2D6K/xa32QtUOMbG4W/Fnlm4KKYkrWDCU5axLqwEfR+MmWbNgnJ0yWw2b6gUBciJQ==
X-Received: by 2002:a05:6a20:9191:b0:10b:71c:20c5 with SMTP id v17-20020a056a20919100b0010b071c20c5mr3998263pzd.51.1686191779691;
        Wed, 07 Jun 2023 19:36:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j8-20020a62b608000000b00649ac17779csm19478pff.160.2023.06.07.19.36.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:36:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] golang: Fix CVE-2023-24539
Date: Wed,  7 Jun 2023 16:35:57 -1000
Message-Id: <737333d41d245154eb4b26ec8db79a2f9823c873.1686191643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686191643.git.steve@sakoman.com>
References: <cover.1686191643.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182486

From: Ashish Sharma <asharma@mvista.com>

Improper sanitization of CSS values in html/template

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2023-24539.patch           | 60 +++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index f734fe1ac8..d0fbde9cae 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -61,6 +61,7 @@ SRC_URI += "\
     file://CVE-2023-24538-1.patch \
     file://CVE-2023-24538-2.patch \
     file://CVE-2023-24538-3.patch \
+    file://CVE-2023-24539.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch
new file mode 100644
index 0000000000..281b6486a8
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24539.patch
@@ -0,0 +1,60 @@
+From 8673ca81e5340b87709db2d9749c92a3bf925df1 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Thu, 13 Apr 2023 15:40:44 -0700
+Subject: [PATCH] html/template: disallow angle brackets in CSS values
+
+Angle brackets should not appear in CSS contexts, as they may affect
+token boundaries (such as closing a <style> tag, resulting in
+injection). Instead emit filterFailsafe, matching the behavior for other
+dangerous characters.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Fixes #59720
+Fixes CVE-2023-24539
+
+Change-Id: Iccc659c9a18415992b0c05c178792228e3a7bae4
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1826636
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/491615
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport from [https://github.com/golang/go/commit/8673ca81e5340b87709db2d9749c92a3bf925df1]
+CVE: CVE-2023-24539
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+---
+ src/html/template/css.go      | 2 +-
+ src/html/template/css_test.go | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/html/template/css.go b/src/html/template/css.go
+index 890a0c6b227fe..f650d8b3e843a 100644
+--- a/src/html/template/css.go
++++ b/src/html/template/css.go
+@@ -238,7 +238,7 @@ func cssValueFilter(args ...any) string {
+ 	// inside a string that might embed JavaScript source.
+ 	for i, c := range b {
+ 		switch c {
+-		case 0, '"', '\'', '(', ')', '/', ';', '@', '[', '\\', ']', '`', '{', '}':
++		case 0, '"', '\'', '(', ')', '/', ';', '@', '[', '\\', ']', '`', '{', '}', '<', '>':
+ 			return filterFailsafe
+ 		case '-':
+ 			// Disallow <!-- or -->.
+diff --git a/src/html/template/css_test.go b/src/html/template/css_test.go
+index a735638b0314f..2b76256a766e9 100644
+--- a/src/html/template/css_test.go
++++ b/src/html/template/css_test.go
+@@ -231,6 +231,8 @@ func TestCSSValueFilter(t *testing.T) {
+ 		{`-exp\000052 ession(alert(1337))`, "ZgotmplZ"},
+ 		{`-expre\0000073sion`, "-expre\x073sion"},
+ 		{`@import url evil.css`, "ZgotmplZ"},
++		{"<", "ZgotmplZ"},
++		{">", "ZgotmplZ"},
+ 	}
+ 	for _, test := range tests {
+ 		got := cssValueFilter(test.css)
-- 
2.34.1


