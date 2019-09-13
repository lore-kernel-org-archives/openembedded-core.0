Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id AC0C67E28B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 23:20:23 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d10so16045433pgo.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 16:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bpj5lez+xyXshX0vyuMARElf4X6GdTNFX0RGxgzf26g=;
	b=U6Fn1t0VJ1O0KZdcKwlu646ZbHM+p08sdIEucoBoFUN/ZSFpFBGRvtADt5Ln/5aYsv
	RvyjRdLM6foTzs8jgjJk5gMcs6h8XD4itKWuVGVWMLF3o9DUoBzJZOCShUonfZR8E6IF
	Ivf6kES1Eo0G8mi56BwgJXnxMh3z1fBhtoc0fGWa4s2tGWzjtgIbuax/P89Arhrjk8eD
	ldSDVI7yE0Kg4uAgxDm7lzJJNe6qIvoJSaAodMocc69wDDzQhUvAI+h8S8eQbBcJKMCr
	ukNVqabKumJAj6D7rmRFlHCD7nYGvWVAjZQq6ZA/yPQdbTtezB1rRHSGTnAYAblWqjpG
	UB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bpj5lez+xyXshX0vyuMARElf4X6GdTNFX0RGxgzf26g=;
	b=fRentDcEXkzyEAQ0STnGHyPb17qXw+kDyAh6VBg5qs8IzeXbPWfbdebaKQlAH6vzDw
	MJ6XDt+u5pQ5wr8d4J92pnTG3nvv/TECm+fMg97PwS8NVicHyh085JyXLIxSMyfeECYo
	H6mAUtSKXyizPAmUAADilsO+8CK01pfv9Z6Oy5ctJjRNHhu+U8DrUbGZhdzFJcGFFiKq
	AJGQ5dJWq08fmZn0G3HS9aLaoOK6tuz5HcU2IGBlw5ldiEIxDr61R6KpS7T9TKa14et+
	KSNcO6i1NqpIPjid2SiRj1J7LU53MVDMP8DRDkMJN5F6GGfly9kYTFh07kwhQseICxEc
	D9mA==
X-Gm-Message-State: APjAAAWu+L/50Z2Mqu+/QRLNz6iHTNuQ3AL1mmL02qL65Sldd+tZrbYl
	XWqKCIX+GktEi9T60DIXg8DvX3BNFic=
X-Google-Smtp-Source: APXvYqxdBoqMZ+1vjM4HvybEh4niNzzeyb+7MpIrlknpql+0siNFypstSKM+4oI92IOVpRJ3snhRsQ==
X-Received: by 2002:a63:ec48:: with SMTP id r8mr43732574pgj.387.1568416824587; 
	Fri, 13 Sep 2019 16:20:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:b812:1f2e:5b35:90e5])
	by smtp.gmail.com with ESMTPSA id
	u9sm30395839pfn.29.2019.09.13.16.20.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Sep 2019 16:20:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Sep 2019 16:20:22 -0700
Message-Id: <1568416822-28039-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [Warrior][PATCH] Curl: Security fix for CVE-2019-5482
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Sep 2019 23:20:23 -0000

From: Armin Kuster <akuster@mvista.com>

Source: curl.org
MR: 99905
Type: Security Fix
Disposition: Backport from https://github.com/curl/curl/commit/facb0e4662415b5f28163e853dc6742ac5fafb3d
ChangeID: e0c807da8937f687a4b2e28eaa6b4b5a51845bc5
Description:

Fixes CVE-2019-5482
- Affected versions: libcurl >= 7.19.4 to and including 7.65.3
- Not affected versions: libcurl < 7.19.4

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-support/curl/curl/CVE-2019-5482.patch | 65 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.64.1.bb           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2019-5482.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2019-5482.patch b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
new file mode 100644
index 0000000..30122d1
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2019-5482.patch
@@ -0,0 +1,65 @@
+From facb0e4662415b5f28163e853dc6742ac5fafb3d Mon Sep 17 00:00:00 2001
+From: Thomas Vegas <>
+Date: Sat, 31 Aug 2019 17:30:51 +0200
+Subject: [PATCH] tftp: Alloc maximum blksize, and use default unless OACK is
+ received
+
+Fixes potential buffer overflow from 'recvfrom()', should the server
+return an OACK without blksize.
+
+Bug: https://curl.haxx.se/docs/CVE-2019-5482.html
+CVE-2019-5482
+
+Upstream-Status: Backport
+CVE: CVE-2019-5482
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ lib/tftp.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+Index: curl-7.64.1/lib/tftp.c
+===================================================================
+--- curl-7.64.1.orig/lib/tftp.c
++++ curl-7.64.1/lib/tftp.c
+@@ -973,6 +973,7 @@ static CURLcode tftp_connect(struct conn
+ {
+   tftp_state_data_t *state;
+   int blksize;
++  int need_blksize;
+ 
+   blksize = TFTP_BLKSIZE_DEFAULT;
+ 
+@@ -987,15 +988,20 @@ static CURLcode tftp_connect(struct conn
+       return CURLE_TFTP_ILLEGAL;
+   }
+ 
++  need_blksize = blksize;
++  /* default size is the fallback when no OACK is received */
++  if(need_blksize < TFTP_BLKSIZE_DEFAULT)
++    need_blksize = TFTP_BLKSIZE_DEFAULT;
++
+   if(!state->rpacket.data) {
+-    state->rpacket.data = calloc(1, blksize + 2 + 2);
++    state->rpacket.data = calloc(1, need_blksize + 2 + 2);
+ 
+     if(!state->rpacket.data)
+       return CURLE_OUT_OF_MEMORY;
+   }
+ 
+   if(!state->spacket.data) {
+-    state->spacket.data = calloc(1, blksize + 2 + 2);
++    state->spacket.data = calloc(1, need_blksize + 2 + 2);
+ 
+     if(!state->spacket.data)
+       return CURLE_OUT_OF_MEMORY;
+@@ -1009,7 +1015,7 @@ static CURLcode tftp_connect(struct conn
+   state->sockfd = state->conn->sock[FIRSTSOCKET];
+   state->state = TFTP_STATE_START;
+   state->error = TFTP_ERR_NONE;
+-  state->blksize = blksize;
++  state->blksize = TFTP_BLKSIZE_DEFAULT; /* Unless updated by OACK response */
+   state->requested_blksize = blksize;
+ 
+   ((struct sockaddr *)&state->local_addr)->sa_family =
diff --git a/meta/recipes-support/curl/curl_7.64.1.bb b/meta/recipes-support/curl/curl_7.64.1.bb
index 00c8c5a..64e0336 100644
--- a/meta/recipes-support/curl/curl_7.64.1.bb
+++ b/meta/recipes-support/curl/curl_7.64.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
            file://CVE-2019-5435.patch \
            file://CVE-2019-5436.patch \
+           file://CVE-2019-5382.patch \
 "
 
 SRC_URI[md5sum] = "790c101927845208a9d7e8c429ddd1b2"
-- 
2.7.4


