Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B0FECAAD4
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 12:10:25 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.35949.1661515811514357815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 05:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Z1veBbzh;
 spf=pass (domain: mvista.com, ip: 209.85.215.178,
 mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id c24so1215235pgg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 05:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pnu3tN1ku232KkID/5a1FHprL8aqspL9PfurYtgwkSg=;
        b=Z1veBbzhFra6X2RETrcPInJ3Y35/vdkGjnOyrlvKuepG99tkT/ydtt8+SFJKY3YAsG
         EthciEML3/Kw786LvhsmfsWItikt7gntkprYcXSGTj4Tkzs+nPnsWEDvoeby9mtfFRnw
         cFSdXiGW/1DptZQP5lGxObrJZxyjhnHMSSy94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pnu3tN1ku232KkID/5a1FHprL8aqspL9PfurYtgwkSg=;
        b=bFlT9ugiyQKwstqhZFVn2kw3IUvlJkvTIheNfTt2vxEoKVNQ2KjTTGXphj08yrcLLT
         eB1BBSK9y0Sld2bipBkngw9gDcQDUK1rOZPbLY7oX1BzXkBOvfbsHpwmwwXuMp+db07X
         +fXwKcm1oWtg5I7Rz2FaH+ARjZFoOXVOgGjp1GQGYl+iVvg6xcywT51sVbbb7RLOr5T1
         SJkHtai8R1epzQWyUcZ8/rpwQCX/iY793nsM7Ud1RU2KmQx1GF6wt3tc27o3d0Uj2Bin
         qv0g4cN2PyF4VkvSjYmqILy+gknb9QgfxYlmNTtcBLZKsX0HEugUvhyNOuyAzuCbam1S
         RTQw==
X-Gm-Message-State: ACgBeo3EsQmN7qf2uPD2pw5iNBfyTmUGgvOzRyJ7t+sAmuRDg1uDJchz
	aU4uLhwgaTNLDSqv5tLqnvFbQhOytHOkkw==
X-Google-Smtp-Source: 
 AA6agR75W5+wijrd9r215mY8fa/TN2c7R3Xxc/7SfqfBG5s+NUZ50MSOnXdIhztRUPBF76Qr6+bDWg==
X-Received: by 2002:a65:46c4:0:b0:41d:e36b:1e59 with SMTP id
 n4-20020a6546c4000000b0041de36b1e59mr2977970pgr.494.1661515810502;
        Fri, 26 Aug 2022 05:10:10 -0700 (PDT)
Received: from MVIN00024 ([27.121.101.111])
        by smtp.gmail.com with ESMTPSA id
 u1-20020a17090341c100b001726b585d4bsm1442803ple.202.2022.08.26.05.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 05:10:09 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation);
 Fri, 26 Aug 2022 17:40:03 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] golang: Fix several security issue in go
Date: Fri, 26 Aug 2022 17:40:02 +0530
Message-Id: <20220826121002.57089-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 12:10:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169914

Source: https://github.com/golang/go
MR: 120628, 120631
Type: Security Fix
Disposition: Backport from https://github.com/golang/go/commit/ed2f33e1a7e0d18f61bd56f7ee067331d612c27e && https://github.com/golang/go/commit/ed2f33e1a7e0d18f61bd56f7ee067331d612c27e
ChangeID: fbd8d61bdc2e9cb0cdbe9879e02aed218ee93dbe
Description:
Fixed CVE:
	1. CVE-2022-30635
	2. CVE-2022-32148

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2022-30635.patch           | 120 ++++++++++++++++++
 .../go/go-1.14/CVE-2022-32148.patch           |  49 +++++++
 3 files changed, 171 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-30635.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-32148.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 84babc38cb..7c32246012 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -29,6 +29,8 @@ SRC_URI += "\
     file://CVE-2022-30631.patch \
     file://CVE-2022-30632.patch \
     file://CVE-2022-30633.patch \
+    file://CVE-2022-30635.patch \
+    file://CVE-2022-32148.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-30635.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-30635.patch
new file mode 100644
index 0000000000..73959f70fa
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-30635.patch
@@ -0,0 +1,120 @@
+From fdd4316737ed5681689a1f40802ffa0805e5b11c Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 26 Aug 2022 12:17:05 +0530
+Subject: [PATCH] CVE-2022-30635
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/cd54600b866db0ad068ab8df06c7f5f6cb55c9b3]
+CVE-2022-30635
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/encoding/gob/decode.go         | 19 ++++++++++++-------
+ src/encoding/gob/gobencdec_test.go | 24 ++++++++++++++++++++++++
+ 2 files changed, 36 insertions(+), 7 deletions(-)
+
+diff --git a/src/encoding/gob/decode.go b/src/encoding/gob/decode.go
+index d2f6c74..0e0ec75 100644
+--- a/src/encoding/gob/decode.go
++++ b/src/encoding/gob/decode.go
+@@ -871,8 +871,13 @@ func (dec *Decoder) decOpFor(wireId typeId, rt reflect.Type, name string, inProg
+ 	return &op
+ }
+ 
++var maxIgnoreNestingDepth = 10000
++
+ // decIgnoreOpFor returns the decoding op for a field that has no destination.
+-func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp) *decOp {
++func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp, depth int) *decOp {
++	if depth > maxIgnoreNestingDepth {
++		error_(errors.New("invalid nesting depth"))
++	}
+ 	// If this type is already in progress, it's a recursive type (e.g. map[string]*T).
+ 	// Return the pointer to the op we're already building.
+ 	if opPtr := inProgress[wireId]; opPtr != nil {
+@@ -896,7 +901,7 @@ func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp)
+ 			errorf("bad data: undefined type %s", wireId.string())
+ 		case wire.ArrayT != nil:
+ 			elemId := wire.ArrayT.Elem
+-			elemOp := dec.decIgnoreOpFor(elemId, inProgress)
++			elemOp := dec.decIgnoreOpFor(elemId, inProgress, depth+1)
+ 			op = func(i *decInstr, state *decoderState, value reflect.Value) {
+ 				state.dec.ignoreArray(state, *elemOp, wire.ArrayT.Len)
+ 			}
+@@ -904,15 +909,15 @@ func (dec *Decoder) decIgnoreOpFor(wireId typeId, inProgress map[typeId]*decOp)
+ 		case wire.MapT != nil:
+ 			keyId := dec.wireType[wireId].MapT.Key
+ 			elemId := dec.wireType[wireId].MapT.Elem
+-			keyOp := dec.decIgnoreOpFor(keyId, inProgress)
+-			elemOp := dec.decIgnoreOpFor(elemId, inProgress)
++			keyOp := dec.decIgnoreOpFor(keyId, inProgress, depth+1)
++			elemOp := dec.decIgnoreOpFor(elemId, inProgress, depth+1)
+ 			op = func(i *decInstr, state *decoderState, value reflect.Value) {
+ 				state.dec.ignoreMap(state, *keyOp, *elemOp)
+ 			}
+ 
+ 		case wire.SliceT != nil:
+ 			elemId := wire.SliceT.Elem
+-			elemOp := dec.decIgnoreOpFor(elemId, inProgress)
++			elemOp := dec.decIgnoreOpFor(elemId, inProgress, depth+1)
+ 			op = func(i *decInstr, state *decoderState, value reflect.Value) {
+ 				state.dec.ignoreSlice(state, *elemOp)
+ 			}
+@@ -1073,7 +1078,7 @@ func (dec *Decoder) compileSingle(remoteId typeId, ut *userTypeInfo) (engine *de
+ func (dec *Decoder) compileIgnoreSingle(remoteId typeId) *decEngine {
+ 	engine := new(decEngine)
+ 	engine.instr = make([]decInstr, 1) // one item
+-	op := dec.decIgnoreOpFor(remoteId, make(map[typeId]*decOp))
++	op := dec.decIgnoreOpFor(remoteId, make(map[typeId]*decOp), 0)
+ 	ovfl := overflow(dec.typeString(remoteId))
+ 	engine.instr[0] = decInstr{*op, 0, nil, ovfl}
+ 	engine.numInstr = 1
+@@ -1118,7 +1123,7 @@ func (dec *Decoder) compileDec(remoteId typeId, ut *userTypeInfo) (engine *decEn
+ 		localField, present := srt.FieldByName(wireField.Name)
+ 		// TODO(r): anonymous names
+ 		if !present || !isExported(wireField.Name) {
+-			op := dec.decIgnoreOpFor(wireField.Id, make(map[typeId]*decOp))
++			op := dec.decIgnoreOpFor(wireField.Id, make(map[typeId]*decOp), 0)
+ 			engine.instr[fieldnum] = decInstr{*op, fieldnum, nil, ovfl}
+ 			continue
+ 		}
+diff --git a/src/encoding/gob/gobencdec_test.go b/src/encoding/gob/gobencdec_test.go
+index 6d2c8db..1b52ecc 100644
+--- a/src/encoding/gob/gobencdec_test.go
++++ b/src/encoding/gob/gobencdec_test.go
+@@ -12,6 +12,7 @@ import (
+ 	"fmt"
+ 	"io"
+ 	"net"
++	"reflect"
+ 	"strings"
+ 	"testing"
+ 	"time"
+@@ -796,3 +797,26 @@ func TestNetIP(t *testing.T) {
+ 		t.Errorf("decoded to %v, want 1.2.3.4", ip.String())
+ 	}
+ }
++
++func TestIngoreDepthLimit(t *testing.T) {
++	// We don't test the actual depth limit because it requires building an
++	// extremely large message, which takes quite a while.
++	oldNestingDepth := maxIgnoreNestingDepth
++	maxIgnoreNestingDepth = 100
++	defer func() { maxIgnoreNestingDepth = oldNestingDepth }()
++	b := new(bytes.Buffer)
++	enc := NewEncoder(b)
++	typ := reflect.TypeOf(int(0))
++	nested := reflect.ArrayOf(1, typ)
++	for i := 0; i < 100; i++ {
++		nested = reflect.ArrayOf(1, nested)
++	}
++	badStruct := reflect.New(reflect.StructOf([]reflect.StructField{{Name: "F", Type: nested}}))
++	enc.Encode(badStruct.Interface())
++	dec := NewDecoder(b)
++	var output struct{ Hello int }
++	expectedErr := "invalid nesting depth"
++	if err := dec.Decode(&output); err == nil || err.Error() != expectedErr {
++		t.Errorf("Decode didn't fail with depth limit of 100: want %q, got %q", expectedErr, err)
++	}
++}
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-32148.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-32148.patch
new file mode 100644
index 0000000000..aab98e99fd
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-32148.patch
@@ -0,0 +1,49 @@
+From 0fe3adec199e8cd2c101933f75d8cd617de70350 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Fri, 26 Aug 2022 12:48:13 +0530
+Subject: [PATCH] CVE-2022-32148
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/ed2f33e1a7e0d18f61bd56f7ee067331d612c27e]
+CVE: CVE-2022-32148
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/net/http/header.go      | 6 ++++++
+ src/net/http/header_test.go | 5 +++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/src/net/http/header.go b/src/net/http/header.go
+index b9b5391..221f613 100644
+--- a/src/net/http/header.go
++++ b/src/net/http/header.go
+@@ -100,6 +100,12 @@ func (h Header) Clone() Header {
+ 	sv := make([]string, nv) // shared backing array for headers' values
+ 	h2 := make(Header, len(h))
+ 	for k, vv := range h {
++		if vv == nil {
++			// Preserve nil values. ReverseProxy distinguishes
++			// between nil and zero-length header values.
++			h2[k] = nil
++			continue
++		}
+ 		n := copy(sv, vv)
+ 		h2[k] = sv[:n:n]
+ 		sv = sv[n:]
+diff --git a/src/net/http/header_test.go b/src/net/http/header_test.go
+index 4789362..80c0035 100644
+--- a/src/net/http/header_test.go
++++ b/src/net/http/header_test.go
+@@ -235,6 +235,11 @@ func TestCloneOrMakeHeader(t *testing.T) {
+ 			in:   Header{"foo": {"bar"}},
+ 			want: Header{"foo": {"bar"}},
+ 		},
++		{
++			name: "nil value",
++			in:   Header{"foo": nil},
++			want: Header{"foo": nil},
++		},
+ 	}
+ 
+ 	for _, tt := range tests {
+-- 
+2.25.1
+
-- 
2.25.1


