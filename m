Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E10AC433EF
	for <webhook@archiver.kernel.org>; Fri, 24 Jun 2022 11:30:17 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.6495.1656070212269484360
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 04:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jeLdNIVD;
 spf=pass (domain: mvista.com, ip: 209.85.210.169,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id k127so2300943pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jun 2022 04:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4QqNGNEzzh7Y5sQtWG7gqxZqGYbSo1s3QfRvEV70e24=;
        b=jeLdNIVDXU5z+JTFuOy0xHsqS7TsaeFSH1WMUrXLJWO9gQXZPG1arj80+Mm+U0VxFx
         ZnE3GiMQz3IxM15cZAC66+j2/sskPcccxLhofhhaI+WRxffdapVlENsP2l94sd8n30vm
         WDYppg9moXUZgPIdkKjJMJvnFGf4S0mMz6/ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4QqNGNEzzh7Y5sQtWG7gqxZqGYbSo1s3QfRvEV70e24=;
        b=b1n8xRXGAW6SbKkbpsLL3W+svV/g8bq2i1O1GCEh+q5wit8IoqPX++LuRPQF2/e2ZV
         a2945qfQvSbL8S6HDRlJjHI+2Oc7Gd8F48yVAE1/sVCquUnkFCe20ncnjESVgOzRRo5N
         mhup6t0uOaTmCdMVowYor9cT+LFw3j9xcwMssiSVnAD3dm+akavFGTnCwyfGR3uvb+Bs
         C/dQNbOomkKxPy/5L3RlZgYJ5VPD0XYx5pP86Z1sLxyAIJNW2vx8kpk3mUOr/C2oW/wv
         99Bv509m7MdFX1T+BjJBdFTQb8GLMPGM0HsRaPLg7vM9GkMvUm9ZUSmP1xDlQwc9XyQd
         6wAQ==
X-Gm-Message-State: AJIora9mDrnuoE5MkKDvB6tZfZIKUpqdirKKjo8PVR0pDWRXOtd0ZTZp
	p1JFR6csLCbQuPAbwUfzZjwBuoHQ4HSDRg==
X-Google-Smtp-Source: 
 AGRyM1vT1xWkL9PRuKvGIFTgB5F69whMRSbaeEYhjXsmwusiN2QA1u1yPK6spbFqTFZP3npjq5o1dg==
X-Received: by 2002:a63:35c9:0:b0:40c:8d6f:2961 with SMTP id
 c192-20020a6335c9000000b0040c8d6f2961mr11594299pga.506.1656070210150;
        Fri, 24 Jun 2022 04:30:10 -0700 (PDT)
Received: from MVIN00024 ([27.121.101.75])
        by smtp.gmail.com with ESMTPSA id
 jb20-20020a170903259400b0016a11b9aeb2sm1547541plb.187.2022.06.24.04.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 04:30:09 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 24 Jun 2022 17:00:04 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: CVE-2022-24675 encoding/pem: fix stack
 overflow in  Decode
Date: Fri, 24 Jun 2022 17:00:02 +0530
Message-Id: <20220624113002.21981-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jun 2022 11:30:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167287

Source: https://go-review.googlesource.com/c/go
MR: 117551
Type: Security Fix
Disposition: Backport from https://go-review.googlesource.com/c/go/+/399816/
ChangeID: 347f22f93e8eaecb3d39f8d6c0fe5a70c5cf7b7c
Description:
        CVE-2022-24675 golang: encoding/pem: fix stack overflow in Decode.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-24675.patch           | 271 ++++++++++++++++++
 2 files changed, 272 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 4827c6adfa..773d252bd1 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -23,6 +23,7 @@ SRC_URI += "\
     file://CVE-2022-23806.patch \
     file://CVE-2022-23772.patch \
     file://CVE-2021-44717.patch \
+    file://CVE-2022-24675.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch
new file mode 100644
index 0000000000..4bc012be21
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch
@@ -0,0 +1,271 @@
+From 1eb931d60a24501a9668e5cb4647593e19115507 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 17 Jun 2022 12:22:53 +0530
+Subject: [PATCH] CVE-2022-24675
+
+Upstream-Status: Backport [https://go-review.googlesource.com/c/go/+/399816/]
+CVE: CVE-2022-24675
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/encoding/pem/pem.go      | 174 +++++++++++++++--------------------
+ src/encoding/pem/pem_test.go |  28 +++++-
+ 2 files changed, 101 insertions(+), 101 deletions(-)
+
+diff --git a/src/encoding/pem/pem.go b/src/encoding/pem/pem.go
+index a7272da..1bee1c1 100644
+--- a/src/encoding/pem/pem.go
++++ b/src/encoding/pem/pem.go
+@@ -87,123 +87,97 @@ func Decode(data []byte) (p *Block, rest []byte) {
+ 	// pemStart begins with a newline. However, at the very beginning of
+ 	// the byte array, we'll accept the start string without it.
+ 	rest = data
+-	if bytes.HasPrefix(data, pemStart[1:]) {
+-		rest = rest[len(pemStart)-1 : len(data)]
+-	} else if i := bytes.Index(data, pemStart); i >= 0 {
+-		rest = rest[i+len(pemStart) : len(data)]
+-	} else {
+-		return nil, data
+-	}
+-
+-	typeLine, rest := getLine(rest)
+-	if !bytes.HasSuffix(typeLine, pemEndOfLine) {
+-		return decodeError(data, rest)
+-	}
+-	typeLine = typeLine[0 : len(typeLine)-len(pemEndOfLine)]
+-
+-	p = &Block{
+-		Headers: make(map[string]string),
+-		Type:    string(typeLine),
+-	}
+-
+ 	for {
+-		// This loop terminates because getLine's second result is
+-		// always smaller than its argument.
+-		if len(rest) == 0 {
++		if bytes.HasPrefix(rest, pemStart[1:]) {
++			rest = rest[len(pemStart)-1:]
++		} else if i := bytes.Index(rest, pemStart); i >= 0 {
++			rest = rest[i+len(pemStart) : len(rest)]
++		} else {
+ 			return nil, data
+ 		}
+-		line, next := getLine(rest)
+ 
+-		i := bytes.IndexByte(line, ':')
+-		if i == -1 {
+-			break
++		var typeLine []byte
++		typeLine, rest = getLine(rest)
++		if !bytes.HasSuffix(typeLine, pemEndOfLine) {
++			continue
+ 		}
++		typeLine = typeLine[0 : len(typeLine)-len(pemEndOfLine)]
+ 
+-		// TODO(agl): need to cope with values that spread across lines.
+-		key, val := line[:i], line[i+1:]
+-		key = bytes.TrimSpace(key)
+-		val = bytes.TrimSpace(val)
+-		p.Headers[string(key)] = string(val)
+-		rest = next
+-	}
++		p = &Block{
++			Headers: make(map[string]string),
++			Type:    string(typeLine),
++		}
+ 
+-	var endIndex, endTrailerIndex int
++		for {
++			// This loop terminates because getLine's second result is
++			// always smaller than its argument.
++			if len(rest) == 0 {
++				return nil, data
++			}
++			line, next := getLine(rest)
+ 
+-	// If there were no headers, the END line might occur
+-	// immediately, without a leading newline.
+-	if len(p.Headers) == 0 && bytes.HasPrefix(rest, pemEnd[1:]) {
+-		endIndex = 0
+-		endTrailerIndex = len(pemEnd) - 1
+-	} else {
+-		endIndex = bytes.Index(rest, pemEnd)
+-		endTrailerIndex = endIndex + len(pemEnd)
+-	}
++			i := bytes.IndexByte(line, ':')
++			if i == -1 {
++				break
++			}
+ 
+-	if endIndex < 0 {
+-		return decodeError(data, rest)
+-	}
++			// TODO(agl): need to cope with values that spread across lines.
++			key, val := line[:i], line[i+1:]
++			key = bytes.TrimSpace(key)
++			val = bytes.TrimSpace(val)
++			p.Headers[string(key)] = string(val)
++			rest = next
++		}
+ 
+-	// After the "-----" of the ending line, there should be the same type
+-	// and then a final five dashes.
+-	endTrailer := rest[endTrailerIndex:]
+-	endTrailerLen := len(typeLine) + len(pemEndOfLine)
+-	if len(endTrailer) < endTrailerLen {
+-		return decodeError(data, rest)
+-	}
++		var endIndex, endTrailerIndex int
+ 
+-	restOfEndLine := endTrailer[endTrailerLen:]
+-	endTrailer = endTrailer[:endTrailerLen]
+-	if !bytes.HasPrefix(endTrailer, typeLine) ||
+-		!bytes.HasSuffix(endTrailer, pemEndOfLine) {
+-		return decodeError(data, rest)
+-	}
++		// If there were no headers, the END line might occur
++		// immediately, without a leading newline.
++		if len(p.Headers) == 0 && bytes.HasPrefix(rest, pemEnd[1:]) {
++			endIndex = 0
++			endTrailerIndex = len(pemEnd) - 1
++		} else {
++			endIndex = bytes.Index(rest, pemEnd)
++			endTrailerIndex = endIndex + len(pemEnd)
++		}
+ 
+-	// The line must end with only whitespace.
+-	if s, _ := getLine(restOfEndLine); len(s) != 0 {
+-		return decodeError(data, rest)
+-	}
++		if endIndex < 0 {
++			continue
++		}
+ 
+-	base64Data := removeSpacesAndTabs(rest[:endIndex])
+-	p.Bytes = make([]byte, base64.StdEncoding.DecodedLen(len(base64Data)))
+-	n, err := base64.StdEncoding.Decode(p.Bytes, base64Data)
+-	if err != nil {
+-		return decodeError(data, rest)
+-	}
+-	p.Bytes = p.Bytes[:n]
++		// After the "-----" of the ending line, there should be the same type
++		// and then a final five dashes.
++		endTrailer := rest[endTrailerIndex:]
++		endTrailerLen := len(typeLine) + len(pemEndOfLine)
++		if len(endTrailer) < endTrailerLen {
++			continue
++		}
++
++		restOfEndLine := endTrailer[endTrailerLen:]
++		endTrailer = endTrailer[:endTrailerLen]
++		if !bytes.HasPrefix(endTrailer, typeLine) ||
++			!bytes.HasSuffix(endTrailer, pemEndOfLine) {
++			continue
++		}
+ 
+-	// the -1 is because we might have only matched pemEnd without the
+-	// leading newline if the PEM block was empty.
+-	_, rest = getLine(rest[endIndex+len(pemEnd)-1:])
++		// The line must end with only whitespace.
++		if s, _ := getLine(restOfEndLine); len(s) != 0 {
++			continue
++		}
+ 
+-	return
+-}
++		base64Data := removeSpacesAndTabs(rest[:endIndex])
++		p.Bytes = make([]byte, base64.StdEncoding.DecodedLen(len(base64Data)))
++		n, err := base64.StdEncoding.Decode(p.Bytes, base64Data)
++		if err != nil {
++			continue
++		}
++		p.Bytes = p.Bytes[:n]
+ 
+-func decodeError(data, rest []byte) (*Block, []byte) {
+-	// If we get here then we have rejected a likely looking, but
+-	// ultimately invalid PEM block. We need to start over from a new
+-	// position. We have consumed the preamble line and will have consumed
+-	// any lines which could be header lines. However, a valid preamble
+-	// line is not a valid header line, therefore we cannot have consumed
+-	// the preamble line for the any subsequent block. Thus, we will always
+-	// find any valid block, no matter what bytes precede it.
+-	//
+-	// For example, if the input is
+-	//
+-	//    -----BEGIN MALFORMED BLOCK-----
+-	//    junk that may look like header lines
+-	//   or data lines, but no END line
+-	//
+-	//    -----BEGIN ACTUAL BLOCK-----
+-	//    realdata
+-	//    -----END ACTUAL BLOCK-----
+-	//
+-	// we've failed to parse using the first BEGIN line
+-	// and now will try again, using the second BEGIN line.
+-	p, rest := Decode(rest)
+-	if p == nil {
+-		rest = data
++		// the -1 is because we might have only matched pemEnd without the
++		// leading newline if the PEM block was empty.
++		_, rest = getLine(rest[endIndex+len(pemEnd)-1:])
++		return p, rest
+ 	}
+-	return p, rest
+ }
+ 
+ const pemLineLength = 64
+diff --git a/src/encoding/pem/pem_test.go b/src/encoding/pem/pem_test.go
+index 8515b46..4485581 100644
+--- a/src/encoding/pem/pem_test.go
++++ b/src/encoding/pem/pem_test.go
+@@ -107,6 +107,12 @@ const pemMissingEndingSpace = `
+ dGVzdA==
+ -----ENDBAR-----`
+ 
++const pemMissingEndLine = `
++-----BEGIN FOO-----
++Header: 1`
++
++var pemRepeatingBegin = strings.Repeat("-----BEGIN \n", 10)
++
+ var badPEMTests = []struct {
+ 	name  string
+ 	input string
+@@ -131,14 +137,34 @@ var badPEMTests = []struct {
+ 		"missing ending space",
+ 		pemMissingEndingSpace,
+ 	},
++	{
++		"repeating begin",
++		pemRepeatingBegin,
++	},
++	{
++		"missing end line",
++		pemMissingEndLine,
++	},
+ }
+ 
+ func TestBadDecode(t *testing.T) {
+ 	for _, test := range badPEMTests {
+-		result, _ := Decode([]byte(test.input))
++		result, rest := Decode([]byte(test.input))
+ 		if result != nil {
+ 			t.Errorf("unexpected success while parsing %q", test.name)
+ 		}
++		if string(rest) != test.input {
++			t.Errorf("unexpected rest: %q; want = %q", rest, test.input)
++		}
++	}
++}
++
++func TestCVE202224675(t *testing.T) {
++	// Prior to CVE-2022-24675, this input would cause a stack overflow.
++	input := []byte(strings.Repeat("-----BEGIN \n", 10000000))
++	result, rest := Decode(input)
++	if result != nil || !reflect.DeepEqual(rest, input) {
++		t.Errorf("Encode of %#v decoded as %#v", input, rest)
+ 	}
+ }
+ 
+-- 
+2.25.1
+
-- 
2.25.1


