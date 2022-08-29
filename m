Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AD6ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:02:59 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.3687.1661806975431584256
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kg+kUp7Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 202so8798595pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=2D5pxGJ5YKNG5xHL2Dey6Z0CpS71HKP3tWcZm35uC74=;
        b=kg+kUp7ZvO3UWB01dPhLhxstgoi1VTs7VpvYBSwV8IEDcUkJIM6jtZQSiyb9rIOzjv
         4huZtuCbI3TH6/nw5kMZRrnz6VVb5Vn5cWN5ACQ1aum7G8EBxO9NRbZgdlfasNIUoO87
         ypd0fXFOsf061RSoHTaJR96LzdVFqsSY6T07AcA08SgO3uhcIytrCRxUetUDvtoCB8sB
         gbYU0S+x4AUCRAWPhhoLblWNmyxQZ/x0cLccJm8pVTWUGEpU2X051xrHjUd0tsYdiCKf
         8BbLifUTdhy8rpaTG3QNk5AaPRIn4yJQcO3EO3DWVvaneAtI+Q+z4kxAmf4Ksa+PNXyy
         LKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=2D5pxGJ5YKNG5xHL2Dey6Z0CpS71HKP3tWcZm35uC74=;
        b=P755OKcx+MSk7s2v9r6AbSyYsJBImHf5ikuEYCdjDc307ly2hr2zMa87U/o5GUUQJ0
         yRE9oGvAGZV/CG1dctK+eKhx6NwWZtT+S/gOTzrPJ3xFOlfwUMm9MJnEKZOJX/pcJ2p2
         ew5xVyTkiaFemeKyfEI2zsiVRRV3lWf6AntfPCeXZ7ANxMV5HaQGOCcaZQKA56RJYMUA
         aQZ6ieEHUf+Zv1TXN/CLypNZG7HTTHXX2lAuMOycbAOK1Ns3cr7FYk0rZOkfBMQJp1b5
         gjX7I+43DbM6ra8Z7r7eq4bpcFiSC9+XGFzkyNI5czpvzgg3mFTu3zZqHYd0KLdOtevV
         s/Zg==
X-Gm-Message-State: ACgBeo2JGF2ax0WjVHvjoJj0KFd7P+No+TvS+33UuRmKdxYhhpJafOin
	GPYkzLpyOfLnBgscYWH2y3l0aQ7ElqOO7jrf
X-Google-Smtp-Source: 
 AA6agR6EO/MD9Mfhbor6xt+jeDVsjpOSH1gaT4IrXHpVm1HJ8ta5FwS2fSYuix/iPi+PpY13l40PLg==
X-Received: by 2002:a62:b519:0:b0:537:9723:5cf2 with SMTP id
 y25-20020a62b519000000b0053797235cf2mr18356098pfe.15.1661806974031;
        Mon, 29 Aug 2022 14:02:54 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.02.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:02:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] golang: fix CVE-2022-30635 and
 CVE-2022-32148
Date: Mon, 29 Aug 2022 11:02:23 -1000
Message-Id: 
 <2c4fb77f417464d9cd40f0ebd8cc52e6e6ca689e.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170029

From: Hitendra Prajapati <hprajapati@mvista.com>

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


