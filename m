Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308C2C44501
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38589.1782742832231942311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Hsb56sdd;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493a7bd27c2so12668435e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742830; x=1783347630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkWxKLyJCbzXuQF05IBCsnC/IzzoRC0F/RHguMfg4VE=;
        b=Hsb56sddEZTpEcA49DBwi/yvrKo+0tMI06ZKcWWVOUiYZnvd1c+55w9rpr+oMZq5tb
         jNqBZnYlmTrsAjPbEjXtqUpDeSSde8D/uPtj2LcLKEaWqtw/akqocEgz7K80aAIPg4D9
         Qi0WxQIRr8DzEnZxuq46z9sMCseDvoqExcuOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742830; x=1783347630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PkWxKLyJCbzXuQF05IBCsnC/IzzoRC0F/RHguMfg4VE=;
        b=AZE8Yuhw8n0/rBZVKG268V2s822ioCgyHuf0Dg+LBK1OP5PV75R45GRr/+Hb5YVOdH
         Xuex1shNJ0fGTRJvav9LuPKHjYAxSvSLMnHcgvhrdKf8DSCYonR38c0mvDG8zPLAxj+M
         RNxDZrClhrqXHKyfDG6q6dVTIHe6+K+KyJ4LwacBowD2VMBPy5JFpsaFgO5NYlJvaVDt
         EMWO3mjRP7LO8RcAyeLJMvWoj+ENUq9A84XiEHaiLMaAlYPjIIp+E31MZpoLnJxGIkHg
         6qMR+qEefmwpkOzXYA6VETG5C048xFtunERz3O8PoO3T5MLX0TsOkz961r+lfYCXo5X0
         Tbyg==
X-Gm-Message-State: AOJu0Yz187v1em0XxDWIVbSRBRAMvcwcyLK3pvKFtG/QMbHGiGqjBagS
	FNcr2aoa6o88XdUczijjeMKQzruDROvFd9WK2K3AwFx7AxMuTGsRjbBaF5zz545O2JMPOeL2jez
	Xuq/ejEE=
X-Gm-Gg: AfdE7ckCKRopEwk6n9gcTcR9J4wO81y6QFA3gvlj0duhrvCwhrhbS7i2/S29dtLjp+l
	CDd8IdhX+mKrnPpBCEXJ9pR6BILCIah06eckcpxYoqjWwUDF9vVwTBShwoxDNDar47/IsMZ9yv6
	JptupbcfFgVJJqNyYr+xtoZzsB0zG5w5QYI0Svl0nP8zpuV3rmNcAwDe4awtk2Dn3qofQ1W/40L
	dIkAEORFYsAz4wXUU6HGvcUqdlJHzMNsRGkn4EA/7PX/+lkE7Rm+BHm8DOW6UY+W9h0Fg/mPxUU
	XpoBLRm9oG43VbgUryeeTqPumw3SHlp8B8CDCwXoEzUUctUd9gaFmw4i/4PtvV5SpADXMMAKcuG
	ZQAbWbac/RhnebO6vSCjNpHXOipojersxBYitiFluSJXWQ7Cs0R0TPXb1yuoirZ2gyCHvrSB4iP
	cylhUGI0ST8HWk1QKj3dEqD0eNUZyCn6Eqm5zqlbJpFpsT0kMv3V4T2tf+IdSeHJmxi8Iwu3YeS
	KLhRRg3gbK5s/EFNQC8LEI0Y+tNTbnP8g==
X-Received: by 2002:a05:600c:528c:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-493b71d2755mr14861635e9.19.1782742830427;
        Mon, 29 Jun 2026 07:20:30 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/19] go: patch CVE-2026-27145
Date: Mon, 29 Jun 2026 16:19:52 +0200
Message-ID: <209a1b3a48b8e3996e1b53f2d7efe335855b7375.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239795

From: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/783621

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |  1 +
 .../go/go/CVE-2026-27145.patch                | 96 +++++++++++++++++++
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-27145.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index c825ebd25a3..99c5f8b63b6 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -61,6 +61,7 @@ SRC_URI += "\
     file://CVE-2025-58183.patch \
     file://CVE-2026-25679.patch \
     file://CVE-2026-32288.patch \
+    file://CVE-2026-27145.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-27145.patch b/meta/recipes-devtools/go/go/CVE-2026-27145.patch
new file mode 100644
index 00000000000..f231aab458b
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-27145.patch
@@ -0,0 +1,96 @@
+From 612753600a0184c8b792425dea62e530170ca811 Mon Sep 17 00:00:00 2001
+From: Ian Alexander <jitsu@google.com>
+Date: Wed, 27 May 2026 04:22:31 -0400
+Subject: [PATCH] crypto/x509: split candidate hostname only once
+
+(*x509.Certificate).VerifyHostname previously called matchHostnames in a
+loop over all DNS Subject Alternative Name (SAN) entries. This caused
+strings.Split(host, ".") to execute repeatedly on the same input
+hostname.
+
+With a large DNS SAN list, verification costs scaled quadratically based
+on the number of SAN entries multiplied by the hostname's label count.
+Because x509.Verify validates hostnames before building the certificate
+chain, this overhead occurred even for untrusted certificates.
+
+Thanks to Jakub Ciolek <jakub@ciolek.dev> for reporting this issue.
+
+Fixes #79694
+Fixes CVE-2026-27145
+
+Change-Id: I2788b8ee22ffd28e45bcc7b0d860549084906a74
+Reviewed-on: https://go-review.googlesource.com/c/go/+/783621
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: David Chase <drchase@google.com>
+Reviewed-by: Neal Patel <neal@golang.org>
+
+CVE: CVE-2026-27145
+Upstream-Status: Backport [https://github.com/golang/go/commit/d01955d5d50ccb5f46c215f88c1781742b3f117d]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/crypto/x509/verify.go | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/src/crypto/x509/verify.go b/src/crypto/x509/verify.go
+index 1de06bc95b..4c423a5fca 100644
+--- a/src/crypto/x509/verify.go
++++ b/src/crypto/x509/verify.go
+@@ -102,7 +102,7 @@ func (h HostnameError) Error() string {
+ 	c := h.Certificate
+ 	maxNamesIncluded := 100
+ 
+-	if !c.hasSANExtension() && matchHostnames(c.Subject.CommonName, h.Host) {
++	if !c.hasSANExtension() && matchHostnames(c.Subject.CommonName, splitHostname(h.Host)) {
+ 		return "x509: certificate relies on legacy Common Name field, use SANs instead"
+ 	}
+ 
+@@ -1081,16 +1081,14 @@ func matchExactly(hostA, hostB string) bool {
+ 	return toLowerCaseASCII(hostA) == toLowerCaseASCII(hostB)
+ }
+ 
+-func matchHostnames(pattern, host string) bool {
++func matchHostnames(pattern string, hostParts []string) bool {
+ 	pattern = toLowerCaseASCII(pattern)
+-	host = toLowerCaseASCII(strings.TrimSuffix(host, "."))
+ 
+-	if len(pattern) == 0 || len(host) == 0 {
++	if len(pattern) == 0 || len(hostParts) == 0 {
+ 		return false
+ 	}
+ 
+ 	patternParts := strings.Split(pattern, ".")
+-	hostParts := strings.Split(host, ".")
+ 
+ 	if len(patternParts) != len(hostParts) {
+ 		return false
+@@ -1168,6 +1166,7 @@ func (c *Certificate) VerifyHostname(h string) error {
+ 
+ 	candidateName := toLowerCaseASCII(h) // Save allocations inside the loop.
+ 	validCandidateName := validHostnameInput(candidateName)
++	hostParts := splitHostname(candidateName)
+ 
+ 	for _, match := range c.DNSNames {
+ 		// Ideally, we'd only match valid hostnames according to RFC 6125 like
+@@ -1176,7 +1175,7 @@ func (c *Certificate) VerifyHostname(h string) error {
+ 		// always allow perfect matches, and only apply wildcard and trailing
+ 		// dot processing to valid hostnames.
+ 		if validCandidateName && validHostnamePattern(match) {
+-			if matchHostnames(match, candidateName) {
++			if matchHostnames(match, hostParts) {
+ 				return nil
+ 			}
+ 		} else {
+@@ -1189,6 +1188,10 @@ func (c *Certificate) VerifyHostname(h string) error {
+ 	return HostnameError{c, h}
+ }
+ 
++func splitHostname(host string) []string {
++	return strings.Split(toLowerCaseASCII(strings.TrimSuffix(host, ".")), ".")
++}
++
+ func checkChainForKeyUsage(chain []*Certificate, keyUsages []ExtKeyUsage) bool {
+ 	usages := make([]ExtKeyUsage, len(keyUsages))
+ 	copy(usages, keyUsages)
+-- 
+2.43.0
+

