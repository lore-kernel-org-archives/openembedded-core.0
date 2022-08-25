Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D89C04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 12:03:09 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.23026.1661428981652075420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 05:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Nbktp4hc;
 spf=pass (domain: mvista.com, ip: 209.85.216.49,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f49.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso4690976pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 05:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=CXpIhDpvVJKc+Wi42N+ePrYjTQR2ZxYzmlUxeLPvteo=;
        b=Nbktp4hch33zenVS4CvjfcegPPqus5Hj4L54+LL/dipymw6q92rsi8LUb1yL8F4lUA
         C99IFevOWf+KgV4kQGM1PwojpN303IxGvYipT+FUrb7Alp2aCR33qBjJMH8rqWZxNA+P
         wIWaQi3rltACjeEU9MqVdDis+34GNhO8AR2aE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=CXpIhDpvVJKc+Wi42N+ePrYjTQR2ZxYzmlUxeLPvteo=;
        b=fSN2kllJrqa82CEAaqplK36H90WYSQTg27p1IOjhX1AkwEmiTh9CoBtYh8kMehdfgE
         Q4XcN7ph5+m3PQssO8Svd+TlXOxujzxdaE4EA3vQn2COvVaIpfe4CUBHzUL34qe06U6Z
         xPAYIHTWI4P657CIRdsdu5ddeV4gcSYxWVCKRbuDB3DPhi5NC3ByWGgq+yHyhONfElkg
         PeStIsUy/J79MjCTE0HaQ/ff6cBYzC0CEEVtzPU5mn2DJ2FclrkZ5MiU8/ZuWOtCC63U
         rSyHASIQA/uMs3fLH3Klh2fYBBjkH3EaIIUJRJgLnAbs5akUlKcSlKZNXzBzv3ag4qwd
         OGBw==
X-Gm-Message-State: ACgBeo2bQniBHCNyX0L3RnWeYxx8gJeqgbmnbST7Urnb85fbiIYcmSJN
	21UbfyjO2TWa8vHMrPqO5QsfpdMtWo3SJw==
X-Google-Smtp-Source: 
 AA6agR7pU9I1c54+KJbHOD2G/Qvoc8IBmR4wyy4+1ZhNC9caqGnOiAlXXW8IHTHeYjYx60C56sJPIA==
X-Received: by 2002:a17:902:f650:b0:172:8ee1:7f40 with SMTP id
 m16-20020a170902f65000b001728ee17f40mr3537092plg.101.1661428980160;
        Thu, 25 Aug 2022 05:03:00 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.211])
        by smtp.gmail.com with ESMTPSA id
 y11-20020a17090a1f4b00b001fa8af47032sm3330800pjy.23.2022.08.25.05.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 05:02:59 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Thu, 25 Aug 2022 17:32:53 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: Fix security issue in go
Date: Thu, 25 Aug 2022 17:32:51 +0530
Message-Id: <20220825120251.91113-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 12:03:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169854

Source: https://github.com/golang/go
MR: 120622, 120625
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/commit/76f8b7304d1f7c25834e2a0cc9e88c55276c47df && https://github.com/golang/go/commit/2678d0c957193dceef336c969a9da74dd716a827
ChangeID: aabb29a6dd6a89842f451c95af228aaf66e58bb5
Description:
Fixed CVE:
	1. CVE-2022-30632
	2. CVE-2022-30633

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2022-30632.patch           |  71 ++++++++++
 .../go/go-1.14/CVE-2022-30633.patch           | 131 ++++++++++++++++++
 3 files changed, 204 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30632.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30633.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 6089fd501d..84babc38cb 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -27,6 +27,8 @@ SRC_URI += "\
     file://CVE-2021-31525.patch \
     file://CVE-2022-30629.patch \
     file://CVE-2022-30631.patch \
+    file://CVE-2022-30632.patch \
+    file://CVE-2022-30633.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-30632.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-30632.patch
new file mode 100644
index 0000000000..c54ef56a0e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-30632.patch
@@ -0,0 +1,71 @@
+From 35d1dfe9746029aea9027b405c75555d41ffd2f8 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 25 Aug 2022 13:12:40 +0530
+Subject: [PATCH] CVE-2022-30632
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/76f8b7304d1f7c25834e2a0cc9e88c55276c47df]
+CVE: CVE-2022-30632
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/path/filepath/match.go      | 16 +++++++++++++++-
+ src/path/filepath/match_test.go | 10 ++++++++++
+ 2 files changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/src/path/filepath/match.go b/src/path/filepath/match.go
+index 46badb5..ba68daa 100644
+--- a/src/path/filepath/match.go
++++ b/src/path/filepath/match.go
+@@ -232,6 +232,20 @@ func getEsc(chunk string) (r rune, nchunk string, err error) {
+ // The only possible returned error is ErrBadPattern, when pattern
+ // is malformed.
+ func Glob(pattern string) (matches []string, err error) {
++	return globWithLimit(pattern, 0)
++}
++
++func globWithLimit(pattern string, depth int) (matches []string, err error) {
++	// This limit is used prevent stack exhaustion issues. See CVE-2022-30632.
++	const pathSeparatorsLimit = 10000
++	if depth == pathSeparatorsLimit {
++		return nil, ErrBadPattern
++	}
++
++	// Check pattern is well-formed.
++	if _, err := Match(pattern, ""); err != nil {
++		return nil, err
++	}
+ 	if !hasMeta(pattern) {
+ 		if _, err = os.Lstat(pattern); err != nil {
+ 			return nil, nil
+@@ -257,7 +271,7 @@ func Glob(pattern string) (matches []string, err error) {
+ 	}
+ 
+ 	var m []string
+-	m, err = Glob(dir)
++	m, err = globWithLimit(dir, depth+1)
+ 	if err != nil {
+ 		return
+ 	}
+diff --git a/src/path/filepath/match_test.go b/src/path/filepath/match_test.go
+index b865762..c37c812 100644
+--- a/src/path/filepath/match_test.go
++++ b/src/path/filepath/match_test.go
+@@ -154,6 +154,16 @@ func TestGlob(t *testing.T) {
+ 	}
+ }
+ 
++func TestCVE202230632(t *testing.T) {
++	// Prior to CVE-2022-30632, this would cause a stack exhaustion given a
++	// large number of separators (more than 4,000,000). There is now a limit
++	// of 10,000.
++	_, err := Glob("/*" + strings.Repeat("/", 10001))
++	if err != ErrBadPattern {
++		t.Fatalf("Glob returned err=%v, want ErrBadPattern", err)
++	}
++}
++
+ func TestGlobError(t *testing.T) {
+ 	_, err := Glob("[]")
+ 	if err == nil {
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-30633.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-30633.patch
new file mode 100644
index 0000000000..c16cb5f50c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-30633.patch
@@ -0,0 +1,131 @@
+From ab6e2ffdcab0501bcc2de4b196c1c18ae2301d4b Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Thu, 25 Aug 2022 13:29:55 +0530
+Subject: [PATCH] CVE-2022-30633
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2678d0c957193dceef336c969a9da74dd716a827]
+CVE: CVE-2022-30633
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/encoding/xml/read.go      | 27 +++++++++++++++++++--------
+ src/encoding/xml/read_test.go | 14 ++++++++++++++
+ 2 files changed, 33 insertions(+), 8 deletions(-)
+
+diff --git a/src/encoding/xml/read.go b/src/encoding/xml/read.go
+index 10a60ee..4ffed80 100644
+--- a/src/encoding/xml/read.go
++++ b/src/encoding/xml/read.go
+@@ -148,7 +148,7 @@ func (d *Decoder) DecodeElement(v interface{}, start *StartElement) error {
+ 	if val.Kind() != reflect.Ptr {
+ 		return errors.New("non-pointer passed to Unmarshal")
+ 	}
+-	return d.unmarshal(val.Elem(), start)
++	return d.unmarshal(val.Elem(), start, 0)
+ }
+ 
+ // An UnmarshalError represents an error in the unmarshaling process.
+@@ -304,8 +304,15 @@ var (
+ 	textUnmarshalerType = reflect.TypeOf((*encoding.TextUnmarshaler)(nil)).Elem()
+ )
+ 
++const maxUnmarshalDepth = 10000
++
++var errExeceededMaxUnmarshalDepth = errors.New("exceeded max depth")
++
+ // Unmarshal a single XML element into val.
+-func (d *Decoder) unmarshal(val reflect.Value, start *StartElement) error {
++func (d *Decoder) unmarshal(val reflect.Value, start *StartElement, depth int) error {
++	if depth >= maxUnmarshalDepth {
++		return errExeceededMaxUnmarshalDepth
++	}
+ 	// Find start element if we need it.
+ 	if start == nil {
+ 		for {
+@@ -398,7 +405,7 @@ func (d *Decoder) unmarshal(val reflect.Value, start *StartElement) error {
+ 		v.Set(reflect.Append(val, reflect.Zero(v.Type().Elem())))
+ 
+ 		// Recur to read element into slice.
+-		if err := d.unmarshal(v.Index(n), start); err != nil {
++		if err := d.unmarshal(v.Index(n), start, depth+1); err != nil {
+ 			v.SetLen(n)
+ 			return err
+ 		}
+@@ -521,13 +528,15 @@ Loop:
+ 		case StartElement:
+ 			consumed := false
+ 			if sv.IsValid() {
+-				consumed, err = d.unmarshalPath(tinfo, sv, nil, &t)
++				// unmarshalPath can call unmarshal, so we need to pass the depth through so that
++				// we can continue to enforce the maximum recusion limit.
++				consumed, err = d.unmarshalPath(tinfo, sv, nil, &t, depth)
+ 				if err != nil {
+ 					return err
+ 				}
+ 				if !consumed && saveAny.IsValid() {
+ 					consumed = true
+-					if err := d.unmarshal(saveAny, &t); err != nil {
++					if err := d.unmarshal(saveAny, &t, depth+1); err != nil {
+ 						return err
+ 					}
+ 				}
+@@ -672,7 +681,7 @@ func copyValue(dst reflect.Value, src []byte) (err error) {
+ // The consumed result tells whether XML elements have been consumed
+ // from the Decoder until start's matching end element, or if it's
+ // still untouched because start is uninteresting for sv's fields.
+-func (d *Decoder) unmarshalPath(tinfo *typeInfo, sv reflect.Value, parents []string, start *StartElement) (consumed bool, err error) {
++func (d *Decoder) unmarshalPath(tinfo *typeInfo, sv reflect.Value, parents []string, start *StartElement, depth int) (consumed bool, err error) {
+ 	recurse := false
+ Loop:
+ 	for i := range tinfo.fields {
+@@ -687,7 +696,7 @@ Loop:
+ 		}
+ 		if len(finfo.parents) == len(parents) && finfo.name == start.Name.Local {
+ 			// It's a perfect match, unmarshal the field.
+-			return true, d.unmarshal(finfo.value(sv), start)
++			return true, d.unmarshal(finfo.value(sv), start, depth+1)
+ 		}
+ 		if len(finfo.parents) > len(parents) && finfo.parents[len(parents)] == start.Name.Local {
+ 			// It's a prefix for the field. Break and recurse
+@@ -716,7 +725,9 @@ Loop:
+ 		}
+ 		switch t := tok.(type) {
+ 		case StartElement:
+-			consumed2, err := d.unmarshalPath(tinfo, sv, parents, &t)
++			// the recursion depth of unmarshalPath is limited to the path length specified
++			// by the struct field tag, so we don't increment the depth here.
++			consumed2, err := d.unmarshalPath(tinfo, sv, parents, &t, depth)
+ 			if err != nil {
+ 				return true, err
+ 			}
+diff --git a/src/encoding/xml/read_test.go b/src/encoding/xml/read_test.go
+index 8c2e70f..6a20b1a 100644
+--- a/src/encoding/xml/read_test.go
++++ b/src/encoding/xml/read_test.go
+@@ -5,6 +5,7 @@
+ package xml
+ 
+ import (
++	"errors"
+ 	"io"
+ 	"reflect"
+ 	"strings"
+@@ -1079,3 +1080,16 @@ func TestUnmarshalWhitespaceAttrs(t *testing.T) {
+ 		t.Fatalf("whitespace attrs: Unmarshal:\nhave: %#+v\nwant: %#+v", v, want)
+ 	}
+ }
++
++func TestCVE202228131(t *testing.T) {
++	type nested struct {
++		Parent *nested `xml:",any"`
++	}
++	var n nested
++	err := Unmarshal(bytes.Repeat([]byte("<a>"), maxUnmarshalDepth+1), &n)
++	if err == nil {
++		t.Fatal("Unmarshal did not fail")
++	} else if !errors.Is(err, errExeceededMaxUnmarshalDepth) {
++		t.Fatalf("Unmarshal unexpected error: got %q, want %q", err, errExeceededMaxUnmarshalDepth)
++	}
++}
+-- 
+2.25.1
+
-- 
2.25.1


