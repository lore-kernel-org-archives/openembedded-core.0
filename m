Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A64E6CD1299
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 13:11:18 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.166618.1712754669818273202
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 06:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JYT5mSlE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed11782727so3382961b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 06:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712754669; x=1713359469; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjvKPorppMI48KmCvz7YfwotXn+RLcJyM7FuVVzVcPg=;
        b=JYT5mSlEVDUM95I84RrOBSjkBdG1Sj9BeJbiNIConPtsnFnvFX+/ShnNCP/vzZn+9D
         4hzneiEc6Te6HISgy59sjSpbFgPO9rtOF2KznrHbQVAAGvMV0CkP2M554nv/9nShuysP
         0anF7OiYSg2WraxuQlL7Q/MFiZjsKlb1iZRDf/YvqOAfaxFOHuxk6PmPahFsQj6LxZfp
         mH/OvUbPOpVqYQw4Uw/jPU2hCmN0sZzsjUAUrqrJdbSWUq80hrakZyWwoQMgmYgMvwXC
         kA/dd8U75fao3nJW12h+UNg8K99P/Tg8tsgGxynG9cPnDbr7OSnf5L1yKkGRfLkRekqU
         djgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754669; x=1713359469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjvKPorppMI48KmCvz7YfwotXn+RLcJyM7FuVVzVcPg=;
        b=dxcmu+K5iIlCITH5XBQyQyPg83XLJH3qFEKvwfKzFk/GqmEKN8COoV+D9Ae1mgE2uc
         8LaVE9EJKp/s7C9zK5GKUcIcsqdEcqKr4vzLpisLe2iBaZntt6nsJjEsGS/5AHlkTKH+
         d2Wr5StUVxCef1xZF5h99odY7Vfc/3lE1nEJDU2bPJCUZ872LzQRWWTgOXElDM57P4XS
         c9noYmhq9w/z84Y3c36l7TB9+zYzCbRIplvUFMu5ROArOvRyhmO8fuTI9n15M4bj6T1M
         OUqahLwBQ37kqzdfdAtEhbm2uWyAnBw2WouQKlfjnzHtfdBHYLYNrpgHRArUjkBecQu2
         pzYA==
X-Gm-Message-State: AOJu0YycpN9DvI4BJA3Xet1dhRXrk5uCUW222PUHyAmFuHFXPgbnLgf9
	DN74otJsPNF8ZmOHMF3fu1Lav+EnDSaZbD8u85roxsrRRaPI95XqEqd0nE9+FtgWJMfUHSsPGG7
	/02Y=
X-Google-Smtp-Source: AGHT+IHWLhPF7cPXt3E7Y4qxIwv8CD/J8KB0juESu9YruJDBzw6k9a2ng0CFpQZbNsAC9sLjYypzOw==
X-Received: by 2002:a05:6a00:1989:b0:6eb:2b:43b4 with SMTP id d9-20020a056a00198900b006eb002b43b4mr2611108pfl.27.1712754668399;
        Wed, 10 Apr 2024 06:11:08 -0700 (PDT)
Received: from xps13.. ([199.58.97.236])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b006ed0199bd57sm10054887pfd.177.2024.04.10.06.11.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:11:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/5] go: Backport fix for CVE-2024-24784
Date: Wed, 10 Apr 2024 06:10:55 -0700
Message-Id: <b58dae3401bcf6747a36e87106285d4bc944d25d.1712754495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712754495.git.steve@sakoman.com>
References: <cover.1712754495.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 13:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198095

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [https://github.com/golang/go/commit/5330cd225ba54c7dc78c1b46dcdf61a4671a632c]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2024-24784.patch           | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2024-24784.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 69b65f3eb2..9c7ceda891 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -91,6 +91,7 @@ SRC_URI += "\
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
2.34.1


