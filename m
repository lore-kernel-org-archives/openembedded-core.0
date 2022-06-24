Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC41C433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 12:13:07 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.6868.1656072781128627652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 05:13:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=P15iy9Cc;
 spf=pass (domain: mvista.com, ip: 209.85.210.180,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id p14so2411746pfh.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GEBt7avksHEVVgYwgktbeO+Yhj+bqFqwt+QP+mySKWs=;
        b=P15iy9Cc7xH+bRhPUMDHCwXVMzehUScpVsk9jqI7mzivIToId2WcLTY1D6C3j8b3w2
         VYFok/jwalRQjU/aSm85wG7E/51Wjj60mUa0M+6xFBkrjXIUeEhhJTOpPEruFvtUQhTJ
         KCL3dWJMO0Vc3uaRfKLz5b5xndIjpSNkhkrvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GEBt7avksHEVVgYwgktbeO+Yhj+bqFqwt+QP+mySKWs=;
        b=mK4Rh2HBgtEKPdxrAbkOp+P1XGttotPO2fPddDn281g/uJ2NWaWhqjO1JrCOQ20r9N
         eZIm1HNp9IHt2l/sP5CEigmAX/sCK6fnKnm8ysFD63XZx7WzG+E1AHawBgwKHh1fRRih
         FgGZsQPYN7bFXmM+uWcKbE9Pw0samkHbbPk3CpEfjNsAVWMUXz0Fpzrw54nJmJaO8uk0
         w/6qCyHCPB3bIaPDNcASBFkp+w7EKH2KvLLuoygwb/fx6Bx497iR0N3lmDtRMvUyrH30
         8HgSwwT71ktJw089nPdD6X3gF4PQPt0YMlV4LqTw8w7rQCJU90Xe89XCIjkvSIqSJZVm
         Xf4w==
X-Gm-Message-State: AJIora9sFIa+LtlWr+oy0kShgT/QGzcsvAM0L4FYPXIdlelKizDcCqME
	xnrEyd19oOQlMwgg+wIoouM8lbE8UmOcDA==
X-Google-Smtp-Source: 
 AGRyM1v8F5xeB0eLYYjxXQLg+34AHXYIPpUsgJC89m5/MsThVMVLYAaBwVOxMIF+cZCdvP85RCqHBg==
X-Received: by 2002:a05:6a00:21c8:b0:4fd:f89f:ec0e with SMTP id
 t8-20020a056a0021c800b004fdf89fec0emr45326097pfj.83.1656072780410;
        Fri, 24 Jun 2022 05:13:00 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.225])
        by smtp.gmail.com with ESMTPSA id
 z11-20020a1709027e8b00b00163f3e91ea0sm1623306pla.238.2022.06.24.05.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 05:13:00 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 24 Jun 2022 17:42:54 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: CVE-2021-31525 net/http: panic in
 ReadRequest and  ReadResponse when reading a very large header
Date: Fri, 24 Jun 2022 17:42:53 +0530
Message-Id: <20220624121253.23465-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 12:13:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167288

Source: https://github.com/argoheyard/lang-net
MR: 114874
Type: Security Fix
Disposition: Backport from https://github.com/argoheyard/lang-net/commit/701957006ef151feb43f86aa99c8a1f474f69282
ChangeID: bd3c4f9f44dd1c45e810172087004778522d28eb
Description:
       CVE-2021-31525 golang: net/http: panic in ReadRequest and ReadResponse when reading a very large header.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2021-31525.patch           | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-31525.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 773d252bd1..b160222f76 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -24,6 +24,7 @@ SRC_URI += "\
     file://CVE-2022-23772.patch \
     file://CVE-2021-44717.patch \
     file://CVE-2022-24675.patch \
+    file://CVE-2021-31525.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-31525.patch b/meta/recipes-devtools/go/go-1.14/CVE-2021-31525.patch
new file mode 100644
index 0000000000..afe4b0d2b8
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-31525.patch
@@ -0,0 +1,38 @@
+From efb465ada003d23353a91ef930be408eb575dba6 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 16 Jun 2022 17:40:12 +0530
+Subject: [PATCH] CVE-2021-31525
+
+Upstream-Status: Backport [https://github.com/argoheyard/lang-net/commit/701957006ef151feb43f86aa99c8a1f474f69282]
+CVE: CVE-2021-31525
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+
+---
+ src/vendor/golang.org/x/net/http/httpguts/httplex.go | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/vendor/golang.org/x/net/http/httpguts/httplex.go b/src/vendor/golang.org/x/net/http/httpguts/httplex.go
+index e7de24e..c79aa73 100644
+--- a/src/vendor/golang.org/x/net/http/httpguts/httplex.go
++++ b/src/vendor/golang.org/x/net/http/httpguts/httplex.go
+@@ -137,11 +137,13 @@ func trimOWS(x string) string {
+ // contains token amongst its comma-separated tokens, ASCII
+ // case-insensitively.
+ func headerValueContainsToken(v string, token string) bool {
+-	v = trimOWS(v)
+-	if comma := strings.IndexByte(v, ','); comma != -1 {
+-		return tokenEqual(trimOWS(v[:comma]), token) || headerValueContainsToken(v[comma+1:], token)
++	for comma := strings.IndexByte(v, ','); comma != -1; comma = strings.IndexByte(v, ',') {
++		if tokenEqual(trimOWS(v[:comma]), token) {
++			return true
++		}
++		v = v[comma+1:]
+ 	}
+-	return tokenEqual(v, token)
++	return tokenEqual(trimOWS(v), token)
+ }
+ 
+ // lowerASCII returns the ASCII lowercase version of b.
+-- 
+2.25.1
+
-- 
2.25.1


