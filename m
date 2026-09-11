Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9566AC88E5D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:50 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50889.1789164948276316481
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=r50Rj4hu;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so1967755e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164946; x=1789769746; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eFLECs/3moIUfc9zTK2fFrm2FaORc9hKoi+l4Vblqto=;
        b=r50Rj4huBLyTe/0pELdN3+0hNPzFSOmIYqc2EtMp8tH96RAcQ04dLn09QNquv5TH18
         p3DRoGuTX4q5JlOftKqM1kJQyPmuk/tTAUheSEAJUmzf1CM3F4NMppdqt+4xTxZUCo0a
         hj7bxOHoQ/t1t9nLU4GbKwjIi8fYRUCRsAh60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164946; x=1789769746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFLECs/3moIUfc9zTK2fFrm2FaORc9hKoi+l4Vblqto=;
        b=bf+QSAnjo5EfbGuJKultxj0Ah3L/cLVFb0eWM0FNCoAWSES2DF4UE4gWH14gyLEtdB
         P6Alb8yc15LbU/95okhm9WbvyZ2fvTgSkeXaKCC/5mmqr+GwerN1OxpBeiuF6MhrXVil
         uHpJVTFDShsDJFMz+H5Y9kZ4EK7nEL0VdFjauH2Vmk5mX0n1jLd7wG1FbaBYoImBAJ9s
         /OnCB6ir3C2Jxj7wLEbyC+TTGKRgdtlCaG+RwEKqJ9bOlH5WQOg69CnKtUExWRvgVaHz
         pUBcPttv6iZUfr8K/2W+eRpNpDLTKPJrcATvTgswT6ggQm8Q4tZzmptYglAWiaOVwgsr
         h99A==
X-Gm-Message-State: AFuF++nFCTiK/3AuozS492QEkjeYk25HxQZ4npBkMubDmpkvkxl566CS
	N2Hvx4JZgFYtZ5EsvsKS5LLk/cWwECWvfblO2cbEvW+tS7bXG8CkoJYaxFJbJe933b4EkBpBGkE
	tWVx01l4=
X-Gm-Gg: AYBFou2w01dZ/aZzERltKNX2DaR/MyP51JgAI7p5rSF24cxRsDjy5UnOlM5XUgkj3FD
	Zza1sUV3z+qydyXE4CtG52/E+w5tdcFKJeJzrZlYIFnvc7L9xXUQFGpojo4Gevnv3jvWOtf0IBG
	a9r5OhSY9Epr0NG2QfwsA7j9ut6Za498sPHFYAajwgiGeqFPpFzN0Uhu8VhccMnB6GaHzCMkdxg
	11E0K2wVDpmg4vBn6ZNKsQw77gLZOh37ojcRMxqdBJmZrQnTi6r/4MPvr099etO4oHbOuabA/Ik
	GeDpYQOUj5mBk7o603tKsL/TYqZVlTclI4S+zF+4cAue8EusIo10NMdLCoGTQYdVNnph6cJC4xt
	PQhY9ARpgIBryD863cw5gQI6CmAvbz00KkM6zex5I85/KoMbG2cZTBjpHTM/cjw3AcNn7xKyvcQ
	pJsql1/8NxtaHPJzpoCV9y4/rHexkcjC5vd3JnFucIvBNEVRpewHULTYfM/yuDrwtk7Yj7KdBUk
	LWOorM5+9nfTkd+1UU4PX7Qr6Gu85zIm5/pQj5Lky0LMA+8hx7FLZK+/Hn8f+wEKEYoU5W4Fmo=
X-Received: by 2002:a05:600c:540e:b0:49e:6692:27fd with SMTP id 5b1f17b1804b1-49e66922810mr91999455e9.2.1789164946419;
        Fri, 11 Sep 2026 15:15:46 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:46 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/13] go: Fix CVE-2026-39823
Date: Sat, 12 Sep 2026 00:15:00 +0200
Message-ID: <007e664db5bb393393415accf802b3cb57298dcb.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245676

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/golang/go/commit/f0384f7c664892ed3ee8c0fec68638d9b3b01811
[2] https://pkg.go.dev/vuln/GO-2026-4982

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-39823.patch                | 100 ++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-39823.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index ee2f5ca2777..a2c0efa3781 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -63,6 +63,7 @@ SRC_URI += "\
     file://CVE-2026-32288.patch \
     file://CVE-2026-27145.patch \
     file://CVE-2026-33814.patch \
+    file://CVE-2026-39823.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-39823.patch b/meta/recipes-devtools/go/go/CVE-2026-39823.patch
new file mode 100644
index 00000000000..00e25bb35c6
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-39823.patch
@@ -0,0 +1,100 @@
+From 4915efb53a017a136a233a7676e80858d5b6e560 Mon Sep 17 00:00:00 2001
+From: Neal Patel <nealpatel@google.com>
+Date: Wed, 22 Apr 2026 18:41:25 -0400
+Subject: [PATCH] [release-branch.go1.25] html/template: fix escaping of URLs
+ in meta content attributes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The WHATWG "shared declarative refresh steps" algorithm (§4.2.5.3)
+skips ASCII whitespace between "url" and "=" when parsing the URL
+portion of a meta content attribute.
+
+Thank you to Samy Ghannad for reporting this issue.
+
+Updates #78913
+Fixes #79031
+Fixes CVE-2026-39823
+
+Change-Id: I7fc3bb9394b95e07b9b10fbc95725a3de6791774
+Reviewed-on: https://go-review.googlesource.com/c/go/+/769920
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+TryBot-Bypass: Roland Shoemaker <roland@golang.org>
+(cherry picked from commit f2ec1254ff32fa39f3ce4faf72bbe44eeeeebad9)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/772101
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2026-39823
+Upstream-Status: Backport [https://github.com/golang/go/commit/f0384f7c664892ed3ee8c0fec68638d9b3b01811]
+
+(cherry picked from commit f0384f7c664892ed3ee8c0fec68638d9b3b01811)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/html/template/escape_test.go | 20 ++++++++++++++++++++
+ src/html/template/transition.go  | 12 +++++++-----
+ 2 files changed, 27 insertions(+), 5 deletions(-)
+
+diff --git a/src/html/template/escape_test.go b/src/html/template/escape_test.go
+index ce064407384..c9e566a9076 100644
+--- a/src/html/template/escape_test.go
++++ b/src/html/template/escape_test.go
+@@ -759,6 +759,26 @@ func TestEscape(t *testing.T) {
+ 			`<meta http-equiv="refresh" content="{{"asd: 123"}}">`,
+ 			`<meta http-equiv="refresh" content="asd: 123">`,
+ 		},
++		{
++			"meta content url with whitespace before equals",
++			`<meta http-equiv="refresh" content="0;url ={{"javascript:alert(1)"}}">`,
++			`<meta http-equiv="refresh" content="0;url =#ZgotmplZ">`,
++		},
++		{
++			"meta content url with tab before equals",
++			"<meta http-equiv=\"refresh\" content=\"0;url\t={{\"javascript:alert(1)\"}}\">",
++			"<meta http-equiv=\"refresh\" content=\"0;url\t=#ZgotmplZ\">",
++		},
++		{
++			"meta content url with space after equals",
++			`<meta http-equiv="refresh" content="0;url= {{"javascript:alert(1)"}}">`,
++			`<meta http-equiv="refresh" content="0;url= #ZgotmplZ">`,
++		},
++		{
++			"meta content url with whitespace both sides of equals",
++			"<meta http-equiv=\"refresh\" content=\"0;url \t= {{\"javascript:alert(1)\"}}\">",
++			"<meta http-equiv=\"refresh\" content=\"0;url \t= #ZgotmplZ\">",
++		},
+ 	}
+ 
+ 	for _, test := range tests {
+diff --git a/src/html/template/transition.go b/src/html/template/transition.go
+index 5aa3c35440b..ac05d56b418 100644
+--- a/src/html/template/transition.go
++++ b/src/html/template/transition.go
+@@ -626,10 +626,12 @@ func tError(c context, s []byte) (context, int) {
+ 
+ // tMetaContent is the context transition function for the meta content attribute state.
+ func tMetaContent(c context, s []byte) (context, int) {
+-	for i := 0; i < len(s); i++ {
+-		if i+3 <= len(s)-1 && bytes.Equal(bytes.ToLower(s[i:i+4]), []byte("url=")) {
+-			c.state = stateMetaContentURL
+-			return c, i + 4
++	for i := range len(s) {
++		if i+3 <= len(s)-1 && bytes.EqualFold(s[i:i+3], []byte("url")) {
++			if j := eatWhiteSpace(s, i+3); j < len(s) && s[j] == '=' {
++				c.state = stateMetaContentURL
++				return c, j + 1
++			}
+ 		}
+ 	}
+ 	return c, len(s)
+@@ -637,7 +639,7 @@ func tMetaContent(c context, s []byte) (context, int) {
+ 
+ // tMetaContentURL is the context transition function for the "url=" part of a meta content attribute state.
+ func tMetaContentURL(c context, s []byte) (context, int) {
+-	for i := 0; i < len(s); i++ {
++	for i := range len(s) {
+ 		if s[i] == ';' {
+ 			c.state = stateMetaContent
+ 			return c, i + 1
+-- 
+2.35.6

