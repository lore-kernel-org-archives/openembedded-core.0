Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBACDC44503
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 10:41:30 +0000 (UTC)
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8883.1768992081315914016
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 02:41:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=f/Xh8hkH;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=LUdp0p3i;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfout.stl.internal (Postfix) with ESMTP id 6AFDB1D0013D;
	Wed, 21 Jan 2026 05:41:20 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Wed, 21 Jan 2026 05:41:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1768992080; x=1769078480; bh=Tb
	03YMAwDZAdV8BiIC6t3LQoi9zOTvcjYsrL8Bq5osA=; b=f/Xh8hkH3SEKggN12E
	QwVzThVz3tFiq1wr1Ll1VkISr8vmH8d76H6+mWONMbx7lfl5GQxB+d4xZccCbAaf
	rMqLkKPdlQibMZn0YSS4796gG7n4kwg8LYsrTwTNwKhkR8p9bizzdkuQoEi5o24S
	cUXxjQ7SyJZoHeRIkDfitAed7T4JRhAKBx+jJwvFO3K+gspm1MxGquKLmLE8Z6QZ
	MtbkLeucggR/ApFenX/W024i2N9AU9yt3C7JRPV79a5FnBz1ucRGRt05miymhweG
	gpkzTw0Rdku/GeiGaAiJt/jXpU644DWT2K2d3XvjlO2T8Ti10YIGSC13ROxh1I9N
	aqRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1768992080; x=1769078480; bh=Tb03YMAwDZAdV8BiIC6t3LQoi9zO
	TvcjYsrL8Bq5osA=; b=LUdp0p3iZMEHOeJUBwEW/i/XKpgTj2pZy/a3bxUNvcS4
	KJbXFGBVeDoJbeqrdKMkY6TIqz9Z9PzVIg3hH7LM8oaOxdbuQ+RfWZNuu8+yAdX4
	qfNbLckIQi090ZHL+b99QCYthF1+cqRBG60WsFmlYiu44KlHbQyBq3EWbsf4AYI5
	LXhq73ZaVNqagbEpB9pbTuFW6usERtvNadeQR1TUnH+eomQac3WNOXHFZmG2XxqA
	iXDD1CpYlbKH9I2dVvmVlJ+A3v2Tpjj52TV2UN8zV2jvOcJUo3qmFAUwhFkAviKt
	RxxwcvBa6QkataFZuJCacE0Anlx9CFZfSLOtr1WrZg==
X-ME-Sender: <xms:T61waWX5MbKk7KJso7oy9_OfLJi6SbrroOr6b_X3bOvwT4E5NUCvWQ>
    <xme:T61waYmNBx0xiyFwHSkktZPcUZeICJQ7QJ1coECRBF0PJ1Htn_c9WcScHl6CAo9nF
    le6v6AiNaTw4RhK0S7V8s1bYHPIJOpfA5UmreGAkWjHdO980qVP2v0>
X-ME-Received: <xmr:T61waYBP9aHDT4LnN8rk9ce3_YQynQQjQDLqAEmiX24fQB-ZBrbWGpDNZRY8Nj0fy-_xWbakmJB-UpZtG7jGa-Dx8eyJ-xI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeftdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefhfffugggtgffkvfevofesthejredtre
    dtjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepgeekvddvteelvdehgeffhfevveeuvdfhjedugf
    euveevfefhgeektdektdfftdehnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhn
    uhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepvddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslh
    hishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepphgruhhlsehp
    sggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:T61waYciusz0sxJvuB548xt_fRdACUexpELA0eY4QrwHtsMKgOvz0w>
    <xmx:T61waTJ7gDaWC2NQCnRSooCG-8L_rW--wkJna4AnC4BolzbVroZcMQ>
    <xmx:T61wabdLEy_6O457CqCgBbqogaykBp8XGFvHjxkxZn6kkRWwOMROKQ>
    <xmx:T61waa1ZhrtToOT8dp7el5DABhHesESGLj3TX8j9AeGWaO1MCZ7AQQ>
    <xmx:UK1waX5EviKuMORxQv8NpYZyukQESRuTm2dtR-Kf4SImCIOgicb_ZL_N>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 05:41:19 -0500 (EST)
From: Paul Barker <paul@pbarker.dev>
Date: Wed, 21 Jan 2026 10:41:11 +0000
Subject: [PATCH] coreutils: Backport fix for lseek_copy loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-fix-coreutils-v1-1-30a1769b5733@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAEatcGkC/x2MQQqAIBAAvyJ7TlCjwr4SHUrXWggNrQjEvycdB
 2YmQ8JImGBkGSI+lCj4CrJhYPbFb8jJVgYlVC+kEtzRy02IeF90JI521a4dHHZaQ23OiFX4f9N
 cygcfaB0FXwAAAA==
X-Change-ID: 20260120-fix-coreutils-edb9f37fe599
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6321; i=paul@pbarker.dev;
 h=from:subject:message-id; bh=WycFkOyP04Ut4pWeZanSiyEBR4Llg3UsgS13wrcX4ps=;
 b=owGbwMvMwCW2OjnkzdxdX/IYT6slMWQWrPXbHNEVyFL6z9fNdn7qIaHb/pXTtwlvKd/mIx0gb
 qF3VnpdRykLgxgXg6yYIsvmnq/3n/Y68maE3FKAmcPKBDKEgYtTACby5iDDf8/Vn4vOLhfZLfKU
 31RS0GXlzVmRuesLThrm/ZuXu/zrfB9GhkPObpxmGx3usEj+SvnvJnDypdkhvQvsv2Iff13P9uq
 eEBcA
X-Developer-Key: i=paul@pbarker.dev; a=openpgp;
 fpr=98B2AAC100AC3F82BB5D546774975C81B7E66BAC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 10:41:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229804

We've seen intermittent failures on the autobuilder related to creating
hddimg images after updating to coreutils 9.9. The error message seen
is:

  install: cannot lseek '.../core-image-minimal/1.0/sources/core-image-minimal-1.0/hddimg/rootfs.img': Invalid argument

This corresponds to an invalid argument passed to lseek() in the
create_hole() function in src/copy-file-data.c in coreutils. This in
turn is being given bad arguments due to incorrect handling of loop
variables in lseek_copy().

The upstream bug report [1] refers to an infinite loop, which isn't
quite what we're seeing, but the cause is likely the same. So, we're
applying the upstream fixes.

[1]: https://github.com/coreutils/coreutils/issues/159

[YOCTO #16120]

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
I've tested this several times on the autobuilder via oe-selftest-debian
& oe-selftest-fedora and not hit the lseek error :)
---
 .../coreutils/0001-fix-lseek-copy-loop.patch       | 35 +++++++++++++
 .../coreutils/0002-fix-lseek-copy-loop.patch       | 58 ++++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.9.bb       |  2 +
 3 files changed, 95 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-loop.patch b/meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-loop.patch
new file mode 100644
index 000000000000..75286dc43cb9
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-loop.patch
@@ -0,0 +1,35 @@
+From bd528f923482223649aa84be7d131e69356149da Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Sun, 4 Jan 2026 12:45:46 +0000
+Subject: [PATCH] copy: fix possible infinite loop with SEEK_HOLE
+
+Commit v9.8-95-g4c0cf3864 intended to initialize
+ext_start to src_pos, as was described at:
+https://lists.gnu.org/r/coreutils/2025-11/msg00035.html
+However ipos was inadvertently used, which is only
+valid the first time through the loop.
+
+* src/copy-file-data.c (lseek_copy): Use scan_inference->hole_start
+only with the initial offset passed to lseek_copy().
+* NEWS: Mention the bug fix.
+Reported at https://github.com/coreutils/coreutils/issues/159
+
+Upstream-Status: Backport (commit bd528f923482223649aa84be7d131e69356149da)
+  - Removed changes to NEWS as they don't apply.
+
+Signed-off-by: Paul Barker <paul@pbarker.dev>
+---
+
+diff --git a/src/copy-file-data.c b/src/copy-file-data.c
+index 927a6e0480..56b669fe72 100644
+--- a/src/copy-file-data.c
++++ b/src/copy-file-data.c
+@@ -338,7 +338,7 @@ lseek_copy (int src_fd, int dest_fd, char **abuf, idx_t buf_size,
+   for (off_t ext_start = scan_inference->ext_start;
+        0 <= ext_start && ext_start < max_ipos; )
+     {
+-      off_t ext_end = (ext_start == ipos
++      off_t ext_end = (ext_start == src_pos
+                        ? scan_inference->hole_start
+                        : lseek (src_fd, ext_start, SEEK_HOLE));
+       if (0 <= ext_end)
diff --git a/meta/recipes-core/coreutils/coreutils/0002-fix-lseek-copy-loop.patch b/meta/recipes-core/coreutils/coreutils/0002-fix-lseek-copy-loop.patch
new file mode 100644
index 000000000000..412c4835387a
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0002-fix-lseek-copy-loop.patch
@@ -0,0 +1,58 @@
+From 33bc44e1ba3aa4c70f3cd16aa9c41331543986dd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Mon, 5 Jan 2026 14:46:33 +0000
+Subject: [PATCH] copy: protect against infinite loop due to pathological race
+
+Consider:
+
+1. In infer_scantype():
+    - SEEK_DATA returns 0
+      - hole punched at 0
+    - SEEK_HOLE returns 0 (now a hole)
+    - Cache scan_inference->hole_start = 0
+2. In lseek_copy():
+      - data written at 0
+    - ext_start = 0, use cached hole_start = 0
+    - ext_len = 0
+    - now loop doesn't progress
+
+* src/copy-file-data.c (lseek_copy): Apply a more defensive check
+to ensure we only use the cached offsets in SCAN_INFERENCE once.
+This protects against an infinite loop where an extent (at SRC_POS)
+flip flops between data and hole extent while infer_scantype()
+and lseek_copy() are inspecting it.  I.e. ensure we use SEEK_HOLE
+to progress the copy.
+
+Upstream-Status: Backport (commit 33bc44e1ba3aa4c70f3cd16aa9c41331543986dd)
+Signed-off-by: Paul Barker <paul@pbarker.dev>
+---
+ src/copy-file-data.c | 13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/src/copy-file-data.c b/src/copy-file-data.c
+index 56b669fe72..9bc4311af4 100644
+--- a/src/copy-file-data.c
++++ b/src/copy-file-data.c
+@@ -335,12 +335,19 @@ lseek_copy (int src_fd, int dest_fd, char **abuf, idx_t buf_size,
+ 
+   debug->sparse_detection = COPY_DEBUG_EXTERNAL;
+ 
++  bool used_scan_inference = false;
++
+   for (off_t ext_start = scan_inference->ext_start;
+        0 <= ext_start && ext_start < max_ipos; )
+     {
+-      off_t ext_end = (ext_start == src_pos
+-                       ? scan_inference->hole_start
+-                       : lseek (src_fd, ext_start, SEEK_HOLE));
++      off_t ext_end;
++      if (ext_start == src_pos && ! used_scan_inference)
++        {
++          ext_end = scan_inference->hole_start;
++          used_scan_inference = true;
++        }
++      else
++        ext_end = lseek (src_fd, ext_start, SEEK_HOLE);
+       if (0 <= ext_end)
+         ext_end = MIN (ext_end, max_ipos);
+       else
diff --git a/meta/recipes-core/coreutils/coreutils_9.9.bb b/meta/recipes-core/coreutils/coreutils_9.9.bb
index cded545efb2c..7deadded062a 100644
--- a/meta/recipes-core/coreutils/coreutils_9.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.9.bb
@@ -15,6 +15,8 @@ inherit autotools gettext texinfo
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
+           file://0001-fix-lseek-copy-loop.patch \
+           file://0002-fix-lseek-copy-loop.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "19bcb6ca867183c57d77155eae946c5eced88183143b45ca51ad7d26c628ca75"

---
base-commit: c6e2bfc538258086053a569c2143ad8bc9a840bd
change-id: 20260120-fix-coreutils-edb9f37fe599

Best regards,
-- 
Paul Barker


