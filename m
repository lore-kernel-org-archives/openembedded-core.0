Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D58FCD1284
	for <webhook@archiver.kernel.org>; Sat,  6 Apr 2024 17:56:20 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.40022.1712426179564793557
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Apr 2024 10:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X9ITAkTP;
 spf=pass (domain: mvista.com, ip: 209.85.214.175, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e0d8403257so28856005ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 10:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1712426178; x=1713030978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tD3HU1h3llgLILuxs4LUaWro67DtD7K1EeVWDGvWS0=;
        b=X9ITAkTPcpcEK/qHWizRXg74ET3N+p79Y293dDdkcmtXrarsofqvzjtP7ITBMnaWJM
         bNjF9AoZElnWfLS+D3q0NnIsF2khsZ5yNFQmj3dmKjnogemcqXIRHHlLq0vvLCcru69V
         YBrI+Up8mQOxLqjO31/Wl6ltr83XdVfL6vKFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712426178; x=1713030978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tD3HU1h3llgLILuxs4LUaWro67DtD7K1EeVWDGvWS0=;
        b=Npl/5wFaSFcvdfyTw0qldTtHWrRFlm8K4OuR80Lm9HKLU+zL0Mf0ynLIsbqmUVLRNC
         8vBn7qC9tA9NczK5kP2Fl+2mJsqyapNAKoiiAPxp0XsWUdbZDPv6oIju+vSz6+agjZbh
         c0mKAgVmFiac5eF0noKwN7FNqht3/Wnp3CjtbWCjqohK0ihXW95Fhs4awUAi8DoTQRPQ
         o66Z7B6H9XwuU0YcbkCTkhrmzUuyI7rjWAnGrEFO/BG2d4UULDHsamZSn+t7dkKp52Ml
         VTtGVryR4vLM00Zk4DGM7Vo9ZdHXajeEBhBqxMeSa3mE2WSQcfa+ybOD0fpUG8T0D+A6
         HJRQ==
X-Gm-Message-State: AOJu0YwuF0M+OFFRZLi62Gwf094TF/O7z6xLS0zheM1ou58QhIQ3DNJk
	tKIihnHtr+gGnoJ1dzIDjsIEzJnnyU9YBuPu8NL4WDDO5ZbyhYdGAfjeiEEvUBN5LelogoxQWcF
	Y
X-Google-Smtp-Source: AGHT+IH0TujcJA0dcTXa7/o/Q9QVPgNN3/zg/lN2GWMheLTNkUSfFUP5JqyAoGrgDTp2PlSa2PHbnw==
X-Received: by 2002:a17:902:b788:b0:1e2:a7bf:5172 with SMTP id e8-20020a170902b78800b001e2a7bf5172mr4562771pls.52.1712426178478;
        Sat, 06 Apr 2024 10:56:18 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.80.10])
        by smtp.gmail.com with ESMTPSA id e2-20020a17090301c200b001e0e8e90fadsm3679838plh.6.2024.04.06.10.56.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Apr 2024 10:56:18 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Sat, 06 Apr 2024 23:24:01 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: Backport fix for CVE-2024-24784
Date: Sat,  6 Apr 2024 23:23:57 +0530
Message-Id: <20240406175357.30190-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 Apr 2024 17:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197996

Upstream-Status: Backport [https://github.com/golang/go/commit/5330cd225ba54c7dc78c1b46dcdf61a4671a632c]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2024-24784.patch           | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2024-24784.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 92b5688d21..90f2bd8255 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -94,6 +94,7 @@ SRC_URI += "\
     file://CVE-2023-45289.patch \
     file://CVE-2023-45290.patch \
     file://CVE-2024-24785.patch \
+    file://CVE-2024-24784.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2024-24784.patch b/meta/recipes-devtools/go/go-1.14/CVE-2024-24784.patch
new file mode 100644
index 0000000000..e9d9d972b9
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2024-24784.patch
@@ -0,0 +1,205 @@
+From 5330cd225ba54c7dc78c1b46dcdf61a4671a632c Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Wed, 10 Jan 2024 11:02:14 -0800
+Subject: [PATCH] [release-branch.go1.22] net/mail: properly handle special
+ characters in phrase and obs-phrase
+
+Fixes a couple of misalignments with RFC 5322 which introduce
+significant diffs between (mostly) conformant parsers.
+
+This change reverts the changes made in CL50911, which allowed certain
+special RFC 5322 characters to appear unquoted in the "phrase" syntax.
+It is unclear why this change was made in the first place, and created
+a divergence from comformant parsers. In particular this resulted in
+treating comments in display names incorrectly.
+
+Additionally properly handle trailing malformed comments in the group
+syntax.
+
+For #65083
+Fixed #65849
+
+Change-Id: I00dddc044c6ae3381154e43236632604c390f672
+Reviewed-on: https://go-review.googlesource.com/c/go/+/555596
+Reviewed-by: Damien Neil <dneil@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/566215
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/5330cd225ba54c7dc78c1b46dcdf61a4671a632c]
+CVE: CVE-2024-24784
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ src/net/mail/message.go      | 30 +++++++++++++++------------
+ src/net/mail/message_test.go | 40 ++++++++++++++++++++++++++----------
+ 2 files changed, 46 insertions(+), 24 deletions(-)
+
+diff --git a/src/net/mail/message.go b/src/net/mail/message.go
+index af516fc30f470..fc2a9e46f811b 100644
+--- a/src/net/mail/message.go
++++ b/src/net/mail/message.go
+@@ -280,7 +280,7 @@ func (a *Address) String() string {
+ 	// Add quotes if needed
+ 	quoteLocal := false
+ 	for i, r := range local {
+-		if isAtext(r, false, false) {
++		if isAtext(r, false) {
+ 			continue
+ 		}
+ 		if r == '.' {
+@@ -444,7 +444,7 @@ func (p *addrParser) parseAddress(handleGroup bool) ([]*Address, error) {
+ 	if !p.consume('<') {
+ 		atext := true
+ 		for _, r := range displayName {
+-			if !isAtext(r, true, false) {
++			if !isAtext(r, true) {
+ 				atext = false
+ 				break
+ 			}
+@@ -479,7 +479,9 @@ func (p *addrParser) consumeGroupList() ([]*Address, error) {
+ 	// handle empty group.
+ 	p.skipSpace()
+ 	if p.consume(';') {
+-		p.skipCFWS()
++		if !p.skipCFWS() {
++			return nil, errors.New("mail: misformatted parenthetical comment")
++		}
+ 		return group, nil
+ 	}
+ 
+@@ -496,7 +498,9 @@ func (p *addrParser) consumeGroupList() ([]*Address, error) {
+ 			return nil, errors.New("mail: misformatted parenthetical comment")
+ 		}
+ 		if p.consume(';') {
+-			p.skipCFWS()
++			if !p.skipCFWS() {
++				return nil, errors.New("mail: misformatted parenthetical comment")
++			}
+ 			break
+ 		}
+ 		if !p.consume(',') {
+@@ -566,6 +570,12 @@ func (p *addrParser) consumePhrase() (phrase string, err error) {
+ 	var words []string
+ 	var isPrevEncoded bool
+ 	for {
++		// obs-phrase allows CFWS after one word
++		if len(words) > 0 {
++			if !p.skipCFWS() {
++				return "", errors.New("mail: misformatted parenthetical comment")
++			}
++		}
+ 		// word = atom / quoted-string
+ 		var word string
+ 		p.skipSpace()
+@@ -661,7 +671,6 @@ Loop:
+ // If dot is true, consumeAtom parses an RFC 5322 dot-atom instead.
+ // If permissive is true, consumeAtom will not fail on:
+ // - leading/trailing/double dots in the atom (see golang.org/issue/4938)
+-// - special characters (RFC 5322 3.2.3) except '<', '>', ':' and '"' (see golang.org/issue/21018)
+ func (p *addrParser) consumeAtom(dot bool, permissive bool) (atom string, err error) {
+ 	i := 0
+ 
+@@ -672,7 +681,7 @@ Loop:
+ 		case size == 1 && r == utf8.RuneError:
+ 			return "", fmt.Errorf("mail: invalid utf-8 in address: %q", p.s)
+ 
+-		case size == 0 || !isAtext(r, dot, permissive):
++		case size == 0 || !isAtext(r, dot):
+ 			break Loop
+ 
+ 		default:
+@@ -850,18 +859,13 @@ func (e charsetError) Error() string {
+ 
+ // isAtext reports whether r is an RFC 5322 atext character.
+ // If dot is true, period is included.
+-// If permissive is true, RFC 5322 3.2.3 specials is included,
+-// except '<', '>', ':' and '"'.
+-func isAtext(r rune, dot, permissive bool) bool {
++func isAtext(r rune, dot bool) bool {
+ 	switch r {
+ 	case '.':
+ 		return dot
+ 
+ 	// RFC 5322 3.2.3. specials
+-	case '(', ')', '[', ']', ';', '@', '\\', ',':
+-		return permissive
+-
+-	case '<', '>', '"', ':':
++	case '(', ')', '<', '>', '[', ']', ':', ';', '@', '\\', ',', '"': // RFC 5322 3.2.3. specials
+ 		return false
+ 	}
+ 	return isVchar(r)
+diff --git a/src/net/mail/message_test.go b/src/net/mail/message_test.go
+index 1e1bb4092f659..1f2f62afbf406 100644
+--- a/src/net/mail/message_test.go
++++ b/src/net/mail/message_test.go
+@@ -385,8 +385,11 @@ func TestAddressParsingError(t *testing.T) {
+ 		13: {"group not closed: null@example.com", "expected comma"},
+ 		14: {"group: first@example.com, second@example.com;", "group with multiple addresses"},
+ 		15: {"john.doe", "missing '@' or angle-addr"},
+-		16: {"john.doe@", "no angle-addr"},
++		16: {"john.doe@", "missing '@' or angle-addr"},
+ 		17: {"John Doe@foo.bar", "no angle-addr"},
++		18: {" group: null@example.com; (asd", "misformatted parenthetical comment"},
++		19: {" group: ; (asd", "misformatted parenthetical comment"},
++		20: {`(John) Doe <jdoe@machine.example>`, "missing word in phrase:"},
+ 	}
+ 
+ 	for i, tc := range mustErrTestCases {
+@@ -436,24 +439,19 @@ func TestAddressParsing(t *testing.T) {
+ 				Address: "john.q.public@example.com",
+ 			}},
+ 		},
+-		{
+-			`"John (middle) Doe" <jdoe@machine.example>`,
+-			[]*Address{{
+-				Name:    "John (middle) Doe",
+-				Address: "jdoe@machine.example",
+-			}},
+-		},
++		// Comment in display name
+ 		{
+ 			`John (middle) Doe <jdoe@machine.example>`,
+ 			[]*Address{{
+-				Name:    "John (middle) Doe",
++				Name:    "John Doe",
+ 				Address: "jdoe@machine.example",
+ 			}},
+ 		},
++		// Display name is quoted string, so comment is not a comment
+ 		{
+-			`John !@M@! Doe <jdoe@machine.example>`,
++			`"John (middle) Doe" <jdoe@machine.example>`,
+ 			[]*Address{{
+-				Name:    "John !@M@! Doe",
++				Name:    "John (middle) Doe",
+ 				Address: "jdoe@machine.example",
+ 			}},
+ 		},
+@@ -788,6 +786,26 @@ func TestAddressParsing(t *testing.T) {
+ 				},
+ 			},
+ 		},
++		// Comment in group display name
++		{
++			`group (comment:): a@example.com, b@example.com;`,
++			[]*Address{
++				{
++					Address: "a@example.com",
++				},
++				{
++					Address: "b@example.com",
++				},
++			},
++		},
++		{
++			`x(:"):"@a.example;("@b.example;`,
++			[]*Address{
++				{
++					Address: `@a.example;(@b.example`,
++				},
++			},
++		},
+ 	}
+ 	for _, test := range tests {
+ 		if len(test.exp) == 1 {
-- 
2.24.4


