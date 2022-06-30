Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E862C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:23:32 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.27163.1656606209884475326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ILJRwT61;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id v126so14800328pgv.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 09:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OI0w7KPV8py56QSfjrY+OCGWl6ezNXZRe8dGFEJHSdA=;
        b=ILJRwT61XIwBtJJjWmK2DbZcq0jQqIudFhKFoaEWl9ExSzAcKBPbEzH2PKiOYdguxm
         5XO/BRRSOA4M/anIWuOEdEgM79li5KSxZOT2mK+vgSDgFvWJqdog0m3dQSPGg4yP8i7F
         fPt4rwznj9nC7mncvuuXBexCCvDDXpsMFVQbiPBcdQp3y9friYW/bEXd7iKqmifkDDKC
         H3RfvsOSZbkRbwcN/z2478oDXf0GBMBxMz1opjDtDM1CikG/0D0+jQS9CnEPNHYEVFxW
         tI/caP+yXmeJ4oYErgJtvRrBBGnEQF3w+9gLrf1CjE1USNNmIoGxlLTzVRrvdFBgyegB
         YmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OI0w7KPV8py56QSfjrY+OCGWl6ezNXZRe8dGFEJHSdA=;
        b=f2wnuLwg8b/z+1AchXAaCTpBUIYGBEtdQCTnDmwmulCepCleLzJ+nRuhBH+IDLTpYH
         bLpjkZhf6Gb/YvFs7ejy/YbvgB9TU0apbNUtai868rjBnTVofnwsL9b4lK6d5nQN9pvZ
         u7wnq20gTcMT5dxFNjw7gOmXYo6d9tLHyyHY8CIHQeNgfEtiYjW6sw5KSaJGkkllkH/O
         291J2ea6uDuX7COI37TorKSGpz0O2/CftDNox4RH2jKoZJQps7pJ5Uly8KMSY2y4q1Bc
         nZ+wl2gP4UHt9dSwFxSBZLe4eGvE8Xk8CxfVra/RPQMETYf5J8vEENy1Kng1pUGKWQAO
         IsTw==
X-Gm-Message-State: AJIora+JrSPI0bL2kNL6dcsk605w4gorxNICvCSzFMHbN3yfWfs6Z23K
	ra+OTdOXnROfg5vMCCTOa4xXHCq9hRuBTLRg
X-Google-Smtp-Source: 
 AGRyM1vCCJdOBHiZ1YIeBhfojpI1lFQwzQNv3U9c+fX51sl1IXKx7/4cjz89p3IafNrATxR5CAQ8Iw==
X-Received: by 2002:a63:1809:0:b0:408:417a:6fa5 with SMTP id
 y9-20020a631809000000b00408417a6fa5mr8444341pgl.228.1656606208661;
        Thu, 30 Jun 2022 09:23:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 t129-20020a625f87000000b005259578e8fcsm10517611pfb.181.2022.06.30.09.23.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 09:23:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] golang: CVE-2021-31525 net/http: panic in
 ReadRequest and ReadResponse when reading a very large header
Date: Thu, 30 Jun 2022 06:23:02 -1000
Message-Id: 
 <2850ef58f2a39a5ab19b1062d1b50160fec4daa8.1656605800.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656605800.git.steve@sakoman.com>
References: <cover.1656605800.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 16:23:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167418

From: Hitendra Prajapati <hprajapati@mvista.com>

Source: https://github.com/argoheyard/lang-net
MR: 114874
Type: Security Fix
Disposition: Backport from https://github.com/argoheyard/lang-net/commit/701957006ef151feb43f86aa99c8a1f474f69282
ChangeID: bd3c4f9f44dd1c45e810172087004778522d28eb
Description:
       CVE-2021-31525 golang: net/http: panic in ReadRequest and ReadResponse when reading a very large header.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


