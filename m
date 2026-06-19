Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B24CDB46B
	for <webhook@archiver.kernel.org>; Fri, 19 Jun 2026 18:33:12 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48970.1781893984621981240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2026 11:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=pC9LlC2K;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=gIMZJQic;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0F4C67A016F
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 14:33:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 19 Jun 2026 14:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781893983;
	 x=1781980383; bh=nI60VbvxXwuB+Ce3v7KWNaeSRCZ/H324uiX/rKrVSjg=; b=
	pC9LlC2KKMJfb13FHhOPRyjF6C7PjZ+kLyDlD33Ri8auD7ZwaKTK08PfVCXZvEMu
	4iXpOQe7AFr9mzWOJmdQjQfmirkw8eF6vMA+d75gaTs1wgZ2MGOra/p/rhEt0R4x
	324Cw5duw1LkDkvpnXZ1F+b/G55y60vKqAKwAJfmZ8Dofn+kXNzO73khVPakxYAR
	n+E4GiDnTgxZJX/dULInBZRSE4AUCsmyhyQZR1NIv6jU1TJHz8XKlDwiO04DYc59
	Lqi+4W03wrz1gf+IxTxrd9oL1m0nlaG1MBE5iibMS043S4i4lm3IU1FP1blKwNSV
	Tz9pSrh0kFzs8JqnHvLvBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1781893983; x=1781980383; bh=n
	I60VbvxXwuB+Ce3v7KWNaeSRCZ/H324uiX/rKrVSjg=; b=gIMZJQicXhQMLSWaI
	vI9JCVbVYukQPveB2CS6nazuK5tgKBp8fYpbPgiaprqgEgIoVthRQ7COUJnEMOMN
	zEyS1ROgNtBGe8y6ZgudPWpzxuA0F4cw9HxRJML7hKvR0EIn/wc3CJ9xIt9+Wkt6
	QS1q6qtD1PQTIQTWCBVbFPaMafeqUMNNRs6KPa26pJsscv7y2MdHTwTzge0t6dEa
	7GagvIYozQmrkWhygqTHVbK8U6wuMAxhRUejEcAy+uKUfBK9VAYJgWnfqO6k1Q6P
	qU7oTxwuIjLkPIlK6Mn8fDT/Eo+aY9aDNeBfwa88WYqVyiPOWmjMP6Kcrvk/PxL9
	9Q+vQ==
X-ME-Sender: <xms:X4s1aqqIapk_BXGe4M2yxmFLDwAyICD9H35TkS658Ak3pRrLGO0tfw>
    <xme:X4s1avkAfRjJGqONOer6dahfHTU59mi_Zq9uvZ5mOfySm7EZGTwqn_gdSpV4BWxLz
    k3XK-A8d7YKyxbDw6eNXLJZI_JjOsb0C5v0XlSy3HF1hKXn4Kw1iIDA>
X-ME-Received: <xmr:X4s1ak2LxwvUzpepa30HZdi32z7HCJGT4h9fjSjWj2RFVX3LQt-5QUdL1a8uuSoYj2OP_75VkKj2abPEcSj-B6EDy2GwOLA>
X-ME-Proxy-Cause: dmFkZTEoRZIfnal4GD17rFFQ1G6ZRr+aB9E9IT6aDaEqIgKwnyq32alY4baFB31MZxdVrD
    Jh39LagJR/BfMuG8wQykPrOVCeDCl9iRP2mZjZWCSe50Gt3nc8I9x9gjsSdlqQDoQDQEAd
    q3dY1Y6B76583CZqmUdSqCRxtFkRpa+Uv4a5lg9pPRI/JDl7a+mel0gSoy/4MghhKFPrZO
    1G8HeEk4H5TXBaO2QI/QjbWd4K6UeexQmPbG8tXRGBSsSG5vAaXa5hYL8Zwr8Izjqx+ozz
    jaPqhfL4NlNonPWDMcgM7rkrDo2cfhqh58oaFBnxxWU2RYRMNOHfNql6bhJVQJZIW1Mppz
    s+syjULhBCP00jOePekv0iBybie5UKKDE0oTaAm9EVBbE5RQ/yvB+Yqem6d7ymqXY8UNEg
    uNZ63wHKHOMP1mw4gmL7rSk0moXYIrtfxlyCrF0lNq7xx86SZANLo8opNFa9lmbIFNC3Xq
    XhrUtSfyh1lz1X79NDEhnEXvcwrENv5UhcqZXuFAYWlysns6q8i+IhxikvLz/weXtx9qh9
    XqPXZljEGV6ZfZX6AzI7ZNPM9NtpbG1VdDfi0TbwarMkAbKh56DnM3EvOBhU1iUco8KN/x
    e6JITJf7hsFSB2QnF/978S/EamZk6ejnGaRUCHk1RalzbjhKi2Mp8aQyMV2Q
X-ME-Proxy: <xmx:X4s1avD-juTwthPX94iyPiloZvG3sWPt4XyJjut8KdSxYaQiDyxU6Q>
    <xmx:X4s1apwhU5BIsF4S1lg16jWcUPOQaiiWyqnf1WaW9KEma8ae5FhQhA>
    <xmx:X4s1allkEikJcS086snwOevoxB8iTT3EPdwYxvZJ7jh03tJQW145NA>
    <xmx:X4s1amG5B8KLwgdqpXAvhKagZWpJ2hEFua9d0zfqQVtstEFkzHtiJQ>
    <xmx:X4s1aoZzZbdFgpJkupflY8IvowhoYM6gm1kvxnwy1PVwGaNgBoVreDs7>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 19 Jun 2026 14:33:03 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Fri, 19 Jun 2026 19:32:21 +0100
Subject: [PATCH 3/5] lsof: upgrade 4.99.6 -> 4.99.7
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-auh-v1-3-62299dbd8231@pbarker.dev>
References: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
In-Reply-To: <20260619-auh-v1-0-62299dbd8231@pbarker.dev>
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=cw/Uoszoiqpe+TSN3z+OEMRZlVsJICYqrSCH8tAbF2Y=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWSZdsfcqvF0vBO/kekX17p/UW+tY6c+LL4pv6V9xTKlq
 KvnVHd/7ihlYRDjYpAVU2TZ3PP1/tNeR96MkFsKMHNYmUCGMHBxCsBEitUZGf6Wh7Q1TXpp9uuV
 ettLmf6iQ8t1wpNtGe2TJROv6ZbkKjH8U66MUPmius1UxGpt2faZLzWWZy1RUG9wYKv9uddi1Ws
 OZgA=
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2026 18:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239187

- lsof_free_result(): handle result == NULL by @neek78 (#349)
- [linux] Fix missing parenthesis in lstat error message format by
  @cuiweixie (#350)
- Fix use-after-free in lsof_select_process_regex by @cuiweixie (#351)
- Fix truncated fd numbers in -F field output by @kurok (#352)
- Add -J/-j options for JSON and JSON Lines output format. -J outputs a
  JSON envelope with process and file information; -j outputs JSON Lines
  format where each line is a JSON object representing a file descriptor
  by @kurok (#353)
- Document non-UTF-8 encoding behavior in JSON output by @kurok (#355)
- Follow autoconf conventions for --enable/--disable help output by
  @kurok (#356)
- Skip building liblsof when --disable-liblsof is given by @kurok (#357)
- [linux] Display connection state for UDP sockets with -T option by
  @kurok (#358)
- Add more information to the tutorial about debugging busy mounts by
  @jakobcornell (#360)
- Fix case sensitivity in INSTALL commands by @AngelofVerdant (#361)
- [netbsd] Fix support for NetBSD 10/11 by @jiegec (#363)

For more details, see:
  https://github.com/lsof-org/lsof/releases/tag/4.99.7

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 meta/recipes-extended/lsof/files/remove-host-information.patch | 4 ++--
 meta/recipes-extended/lsof/{lsof_4.99.6.bb => lsof_4.99.7.bb}  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/lsof/files/remove-host-information.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
index 1f2b4afa6951..e93197e261e5 100644
--- a/meta/recipes-extended/lsof/files/remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,4 +1,4 @@
-From 4f05492ac07a7bbaf06dd8265b9cba329e1b53e9 Mon Sep 17 00:00:00 2001
+From 0873414e87d04561e531418a3a3c0f1574f31773 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 30 Aug 2017 15:05:16 +0800
 Subject: [PATCH] lsof: remove host information from version.h
@@ -42,7 +42,7 @@ index aac0b80..2e635a5 100644
  
  #endif
 diff --git a/lib/dialects/linux/Makefile b/lib/dialects/linux/Makefile
-index f8adaa6..7a79ca7 100644
+index 53bfc97..8512e36 100644
 --- a/lib/dialects/linux/Makefile
 +++ b/lib/dialects/linux/Makefile
 @@ -83,64 +83,17 @@ ${LIB}: FRC
diff --git a/meta/recipes-extended/lsof/lsof_4.99.6.bb b/meta/recipes-extended/lsof/lsof_4.99.7.bb
similarity index 93%
rename from meta/recipes-extended/lsof/lsof_4.99.6.bb
rename to meta/recipes-extended/lsof/lsof_4.99.7.bb
index 853924fd2178..1aad09275c99 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.6.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
 SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https;tag=${PV} \
            file://remove-host-information.patch"
-SRCREV = "b173315c8f94bf61d52094857ea3fe7d0f5aaff9"
+SRCREV = "646395f8e893edb5572405b2311a079f55f269f2"
 
 inherit update-alternatives autotools pkgconfig manpages
 PACKAGECONFIG[manpages] = ""

-- 
2.43.0


