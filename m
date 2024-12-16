Return-Path: <jsbronder@cold-front.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A37E77183
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 19:51:41 +0000 (UTC)
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by mx.groups.io with SMTP id smtpd.web11.65778.1734378699439710498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 11:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cold-front.org header.s=fm3 header.b=FSKAgcC6;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=dtukr31n;
 spf=pass (domain: cold-front.org, ip: 103.168.172.147, mailfrom: jsbronder@cold-front.org)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id AEE481383F6C;
	Mon, 16 Dec 2024 14:51:38 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 16 Dec 2024 14:51:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cold-front.org;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1734378698; x=1734465098; bh=XZjLfNO/V0
	dqDd2JptyqexyoN7uNWYE5/VH60t+D0k0=; b=FSKAgcC6CitAbf1kz0UFdqdNWO
	2DXo6TF0fqFPzm540fKcDh69SS3gisjlmySadT76TMlRAYBXLwSH59Kq1+Kz03Ym
	numo+KFwEfOKH0ojoXDSTHZrgHNmUxyTvtSShGbrwds92KJDiyoaDSbDrcGJ5QBx
	QxU5stl0IZwy7GMN49ie+qh1zj4Fplu1PVyFnXcOFsYmDnWV87/fZL0V1zwH/BZO
	Tx1/tt0ksXy/KS8x+sB5aWBdhOisSN/9mUAy2b5L7FDOMdoAcADUDWIrw8d0DeMw
	wMbhy6ICxc1OmvT9J2VWLYqH6Q0E3+e2zsK+TSq4RfibfNwLGPYF1UCsMtfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734378698; x=1734465098; bh=XZjLfNO/V0dqDd2JptyqexyoN7uNWYE5/VH
	60t+D0k0=; b=dtukr31nIw0obLtrjbtqU4H9h0n/gKhxORP+wo/pqctxIQvkvNy
	5Ny6aJLtacixjBeju/m+CBm72Rgz2R+afTPexSBfb+liD/NjVyCDKuhB+SOLuv1Z
	ZjyAkk7VYZxWNtZwUBxHt4+sjGYvygMy+PigZhR2Xi6Dpz7B5Dkq7CKJVDPj3maT
	XlQ7Itq4F6D7adFFqdIRGQ/GQjHfIKjUYC9UeST7HMagUHBUwS4H7ejBw0XWruGU
	4DO1LXCrdCsQhhw9gQkNaT7rTXCNkXDuSJKp173QVV5EH/pZVQq9L3pGThnF/T/r
	X86884hb6/rYYMph/sGmo7DJg9JwagKzhpw==
X-ME-Sender: <xms:yoRgZ4iwMiAVmx5mGvPaYZef9-cZPEif0R9zcqLQRLzHX6cLEJpbxQ>
    <xme:yoRgZxB2hTWpUfQWaI5lbP0lITvQnCzzCXCMe4iPCMJRr-KRTMYMchbGP0ybASXKX
    tLOlAlxFQFSvc8qcQ>
X-ME-Received: <xmr:yoRgZwH9BWA2tB9f_Xz76KZUD3NY3P4s9WDKimYCwDyL0V2hCnhCIxMWmapgXsVyKmc3pFpWhAl9f7OM5BsKyRI9KQ5rgDmm2LVahLdLlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleefgddufeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefluhhsthhinhcuuehrohhnuggvrhcu
    oehjshgsrhhonhguvghrsegtohhlugdqfhhrohhnthdrohhrgheqnecuggftrfgrthhtvg
    hrnhepieduveefieefffdvheffffektdfgvdetffelheeftdfhvefghffhfefhleegieek
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehjshgsrhhonhguvghrsegtohhlugdqfhhrohhn
    thdrohhrghdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphhouhhtpdhrtghpth
    htohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggv
    ugguvggurdhorhhgpdhrtghpthhtohepjhhssghrohhnuggvrhestgholhguqdhfrhhonh
    htrdhorhhg
X-ME-Proxy: <xmx:yoRgZ5QLq6OrALFE2G1RC9Mp15fcCmSCs-EPdyJh1zqjt-9LzscsEw>
    <xmx:yoRgZ1yq7pzdJNgKFHr24-piW-I9UNdCFrRQkoW-6BksMGseBLO8Vg>
    <xmx:yoRgZ37NY5T9iisHy8KL3kUw0Q7a550GdGK_hY2r2ygLmosjgIYOBg>
    <xmx:yoRgZyxE4_-FMOQSav_P1Mz0qytEIhKepIl8k5nacRnpbI49es8EwQ>
    <xmx:yoRgZw8nqvbCn0Lu7-S_sV32tHUGD7Qus_k-cLnNCL06Sv15BY97ERMv>
Feedback-ID: iea0042cb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Dec 2024 14:51:38 -0500 (EST)
From: Justin Bronder <jsbronder@cold-front.org>
To: openembedded-core@lists.openembedded.org
Cc: Justin Bronder <jsbronder@cold-front.org>
Subject: [PATCH] scripts: wrap lz4c and convert to lz4
Date: Mon, 16 Dec 2024 14:51:32 -0500
Message-ID: <20241216195132.3565436-1-jsbronder@cold-front.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 19:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208791

Commit fe167e082cbde1c6d186ecdda531abef610ac2ac switched to requiring
lz4 instead of lz4c which allows us to support distros dropping lz4c.
However, it wasn't only OE that was still using the legacy lz4c, there's
a number of upstreams as well.  For instance, it's only in the 6.13
kernel that CONFIG_KERNEL_LZ4 makes the switch from lz4c to lz4.

So, while this all gets ironed out, simply intercept calls to lz4c and
convert them to use lz4.  This was picked instead of adding lz4c to
HOSTTOOLS_NONFATAL due to concerns about builds becoming
non-deterministic and failing late:
https://lore.kernel.org/openembedded-core/9c3143ebb7f9e17cfbd318ef0e17994aae7264be.camel@linuxfoundation.org/

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
---
 scripts/lz4c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100755 scripts/lz4c

diff --git a/scripts/lz4c b/scripts/lz4c
new file mode 100755
index 0000000000..466fc349e0
--- /dev/null
+++ b/scripts/lz4c
@@ -0,0 +1,26 @@
+#!/usr/bin/env bash
+
+# Wrapper to intercept legacy lz4c arguments and convert to lz4.
+args=()
+while [ $# -ne 0 ]; do
+    case ${1} in
+        -c0)
+            args+=(-0)
+            ;;
+        -c1)
+            args+=(-9)
+            ;;
+        -c2|-hc)
+            args+=(-12)
+            ;;
+        -y)
+            args+=(--force)
+            ;;
+        *)
+            args+=("${1}")
+            ;;
+    esac
+    shift
+done
+
+exec lz4 "${args[@]}"
-- 
2.47.0


