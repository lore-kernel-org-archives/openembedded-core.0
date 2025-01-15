Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC6AC02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:38:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.22451.1736951881961058535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 06:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FU5kbZRw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so1596374a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 06:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1736951881; x=1737556681; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzBZT8IqZ7ZcMQWIUzTR1xIgzN3ev17EWsHlF2bKxWE=;
        b=FU5kbZRw7t/laLFzrf5WRReqKJEXZhNFq1G6KWQoEbV/pFTghXs17O9GyDuwgaRawq
         WWKp8f6fE9k4WykqGVaSUhXxFuGHEBgdCAt88X+Sre2ilsIyJPAGOBXfwqM343IdwrWc
         tQRRBHpRhMRiI8Dq1aGf/NQQ9rd9CXgtL/lgwjoKFd2rPpUA+juptygIOQ2u6ygAearh
         Lwryr+fRJcye3UYEAIWLyMXWcbS12VyF6B/+qvzIG/tbJmuJe2aN90CP/FPGWS5/NYIl
         oTRaaeElJ4CUEFUo07asi71cs7ESnB1yi+h30uYZ0+ZKcFu1XKEn5YsgCS+TdYg4X8ho
         AeRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736951881; x=1737556681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzBZT8IqZ7ZcMQWIUzTR1xIgzN3ev17EWsHlF2bKxWE=;
        b=QLawprQtY330YaEFYGgwrULiO7Kahj05Akw1AWPvAp+d8BhIH8cOM/5t9KbSiCHvE7
         PvjzdkV8FVyJqFtvSjm9ilWO1i75iZ4Xz0VjCYZrkjchBcjCA/wQ7JIOTNbjyD0d4wTf
         FxgOZYXouMvieTmMIp47/4zBZ042FxceCxTTuCr3CykPXmOjrLv2jQI0xPwaMl99Z2+W
         IiQt2fd94mgSzUD0p8qalGlPtrk3iI5qzYCp4i7DEf6monf4hqWXvbXiH5wRrE+u5ndO
         FTt5ZL60UgSJGcGVyLYLyewEMMLxSnZLImHoLOXsFcdc9deYlXYNbd4AtNoNC//aIzAX
         pA2A==
X-Gm-Message-State: AOJu0YwwbwibOusangU8e2h7nnw3vtpow1Dts+dFbXeZ4ujbvqcyVRt9
	LpKvs8jmRgtmi8y+ZzTIyQqj7tQI3AUZ/4+Qj0j+KFmrkCKLf3bAURR1y9OM9P3s9CBzrK8wvZL
	+zHA=
X-Gm-Gg: ASbGnctrRhCWjldQQU+GZvPh9zp2CEufdOepsS2IEBXwsHfOkaT3BM8MxQCESBZYbeR
	Jrme5WkHD/qAv6L8SgARgGQ7w1ZVOZGmV7Vu32QWLijdJz0XACJVQaf3YwoDGkUGTNAB3ZgQSXL
	tDn+REUl+4dcWw8khuVcZZgnoQBsSb0en8V663lrNJw2SPgPdnmhJeSwMGE7ddJbX2EUxKyt61D
	0fJCXdyB6DVMxQSFdhgBtr2x9h6gnAzJ9PO2eX2sNbAAA==
X-Google-Smtp-Source: AGHT+IEpuPwkzciqAnv4QX+oiOhJeeW99+ueliSeS7J1ThP7VvMzGavzAQMnL5cwSwMCDFATXow0FA==
X-Received: by 2002:a17:90b:3ccb:b0:2ee:5c9b:35c0 with SMTP id 98e67ed59e1d1-2f728e001damr4212788a91.9.1736951881024;
        Wed, 15 Jan 2025 06:38:01 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f244cccsm82333295ad.210.2025.01.15.06.38.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 06:38:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/11] go: Fix CVE-2024-34156
Date: Wed, 15 Jan 2025 06:37:40 -0800
Message-ID: <3aeeee86a53cee14bb1a6a485f8781459b6f2ffc.1736951751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1736951751.git.steve@sakoman.com>
References: <cover.1736951751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 14:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209907

From: Archana Polampalli <archana.polampalli@windriver.com>

Calling Decoder.Decode on a message which contains deeply nested structures can
cause a panic due to stack exhaustion. This is a follow-up to CVE-2022-30635.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2024-34156

Upstream-patch:
https://github.com/golang/go/commit/2092294f2b097c5828f4eace6c98a322c1510b01

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2024-34156.patch           | 150 ++++++++++++++++++
 2 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-34156.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 11bd2afde0..53ca869221 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -59,6 +59,7 @@ SRC_URI += "\
     file://CVE-2024-24789.patch \
     file://CVE-2024-24791.patch \
     file://CVE-2024-34155.patch \
+    file://CVE-2024-34156.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-34156.patch b/meta/recipes-devtools/go/go-1.21/CVE-2024-34156.patch
new file mode 100644
index 0000000000..d8a915d6e9
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-34156.patch
@@ -0,0 +1,150 @@
+From 2092294f2b097c5828f4eace6c98a322c1510b01 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Fri, 3 May 2024 09:21:39 -0400
+Subject: [PATCH] encoding/gob: cover missed cases when checking ignore depth
+
+This change makes sure that we are properly checking the ignored field
+recursion depth in decIgnoreOpFor consistently. This prevents stack
+exhaustion when attempting to decode a message that contains an
+extremely deeply nested struct which is ignored.
+
+Thanks to Md Sakib Anwar of The Ohio State University (anwar.40@osu.edu)
+for reporting this issue.
+
+Updates #69139
+Fixes #69144
+Fixes CVE-2024-34156
+
+Change-Id: Iacce06be95a5892b3064f1c40fcba2e2567862d6
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1440
+Reviewed-by: Russ Cox <rsc@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit f0a11f9b3aaa362cb1d05e095e3c8d421d4f087f)
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/1580
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/611182
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Michael Pratt <mpratt@google.com>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2024-34156
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/2092294f2b097c5828f4eace6c98a322c1510b01]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/encoding/gob/decode.go         | 19 +++++++++++--------
+ src/encoding/gob/decoder.go        |  2 ++
+ src/encoding/gob/gobencdec_test.go | 14 ++++++++++++++
+ 3 files changed, 27 insertions(+), 8 deletions(-)
+
+diff --git a/src/encoding/gob/decode.go b/src/encoding/gob/decode.go
+index 0e0ec75..92d64cb 100644
+--- a/src/encoding/gob/decode.go
++++ b/src/encoding/gob/decode.go
+@@ -874,8 +874,11 @@ func (dec *Decoder) decOpFor(wireId typeId, rt reflect.Type, name string, inProg
+ var maxIgnoreNestingDepth = 10000
+
+ // decIgnoreOpFor returns the decoding op for a field that has no destination.
+-func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp, depth int) *decOp {
+-	if depth > maxIgnoreNestingDepth {
++func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp) *decOp {
++	// Track how deep we've recursed trying to skip nested ignored fields.
++	dec.ignoreDepth++
++	defer func() { dec.ignoreDepth-- }()
++	if dec.ignoreDepth > maxIgnoreNestingDepth {
+		error_(errors.New("invalid nesting depth"))
+	}
+	// If this type is already in progress, it's a recursive type (e.g. map[string]*T).
+@@ -901,7 +904,7 @@ func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp,
+			errorf("bad data: undefined type %s", wireId.string())
+		case wire.ArrayT != nil:
+			elemId := wire.ArrayT.Elem
+-			elemOp := dec.decIgnoreOpFor(elemId, inProgress, depth+1)
++			elemOp := dec.decIgnoreOpFor(elemId, inProgress)
+			op = func(i *decInstr, state *decoderState, value reflect.Value) {
+				state.dec.ignoreArray(state, *elemOp, wire.ArrayT.Len)
+			}
+@@ -909,15 +912,15 @@ func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp,
+		case wire.MapT != nil:
+			keyId := dec.wireType[wireId].MapT.Key
+			elemId := dec.wireType[wireId].MapT.Elem
+-			keyOp := dec.decIgnoreOpFor(keyId, inProgress, depth+1)
+-			elemOp := dec.decIgnoreOpFor(elemId, inProgress, depth+1)
++			keyOp := dec.decIgnoreOpFor(keyId, inProgress)
++			elemOp := dec.decIgnoreOpFor(elemId, inProgress)
+			op = func(i *decInstr, state *decoderState, value reflect.Value) {
+				state.dec.ignoreMap(state, *keyOp, *elemOp)
+			}
+
+		case wire.SliceT != nil:
+			elemId := wire.SliceT.Elem
+-			elemOp := dec.decIgnoreOpFor(elemId, inProgress, depth+1)
++			elemOp := dec.decIgnoreOpFor(elemId, inProgress)
+			op = func(i *decInstr, state *decoderState, value reflect.Value) {
+				state.dec.ignoreSlice(state, *elemOp)
+			}
+@@ -1078,7 +1081,7 @@ func (dec *Decoder) compileSingle(remoteId typeId, ut *userTypeInfo) (engine *de
+ func (dec *Decoder) compileIgnoreSingle(remoteId typeId) *decEngine {
+	engine := new(decEngine)
+	engine.instr = make([]decInstr, 1) // one item
+-	op := dec.decIgnoreOpFor(remoteId, make(map[typeId]*decOp), 0)
++	op := dec.decIgnoreOpFor(remoteId, make(map[typeId]*decOp))
+	ovfl := overflow(dec.typeString(remoteId))
+	engine.instr[0] = decInstr{*op, 0, nil, ovfl}
+	engine.numInstr = 1
+@@ -1123,7 +1126,7 @@ func (dec *Decoder) compileDec(remoteId typeId, ut *userTypeInfo) (engine *decEn
+		localField, present := srt.FieldByName(wireField.Name)
+		// TODO(r): anonymous names
+		if !present || !isExported(wireField.Name) {
+-			op := dec.decIgnoreOpFor(wireField.Id, make(map[typeId]*decOp), 0)
++			op := dec.decIgnoreOpFor(wireField.Id, make(map[typeId]*decOp))
+			engine.instr[fieldnum] = decInstr{*op, fieldnum, nil, ovfl}
+			continue
+		}
+diff --git a/src/encoding/gob/decoder.go b/src/encoding/gob/decoder.go
+index b476aaa..8fab2fd 100644
+--- a/src/encoding/gob/decoder.go
++++ b/src/encoding/gob/decoder.go
+@@ -34,6 +34,8 @@ type Decoder struct {
+	freeList     *decoderState                           // list of free decoderStates; avoids reallocation
+	countBuf     []byte                                  // used for decoding integers while parsing messages
+	err          error
++       // ignoreDepth tracks the depth of recursively parsed ignored fields
++       ignoreDepth int
+ }
+
+ // NewDecoder returns a new decoder that reads from the io.Reader.
+diff --git a/src/encoding/gob/gobencdec_test.go b/src/encoding/gob/gobencdec_test.go
+index 1b52ecc..2b5f2a8 100644
+--- a/src/encoding/gob/gobencdec_test.go
++++ b/src/encoding/gob/gobencdec_test.go
+@@ -806,6 +806,8 @@ func TestIngoreDepthLimit(t *testing.T) {
+	defer func() { maxIgnoreNestingDepth = oldNestingDepth }()
+	b := new(bytes.Buffer)
+	enc := NewEncoder(b)
++
++	// Nested slice
+	typ := reflect.TypeOf(int(0))
+	nested := reflect.ArrayOf(1, typ)
+	for i := 0; i < 100; i++ {
+@@ -819,4 +821,16 @@ func TestIngoreDepthLimit(t *testing.T) {
+	if err := dec.Decode(&output); err == nil || err.Error() != expectedErr {
+		t.Errorf("Decode didn't fail with depth limit of 100: want %q, got %q", expectedErr, err)
+	}
++
++	// Nested struct
++	nested = reflect.StructOf([]reflect.StructField{{Name: "F", Type: typ}})
++	for i := 0; i < 100; i++ {
++		nested = reflect.StructOf([]reflect.StructField{{Name: "F", Type: nested}})
++	}
++	badStruct = reflect.New(reflect.StructOf([]reflect.StructField{{Name: "F", Type: nested}}))
++	enc.Encode(badStruct.Interface())
++	dec = NewDecoder(b)
++	if err := dec.Decode(&output); err == nil || err.Error() != expectedErr {
++		t.Errorf("Decode didn't fail with depth limit of 100: want %q, got %q", expectedErr, err)
++	}
+ }
+--
+2.40.0
-- 
2.43.0


