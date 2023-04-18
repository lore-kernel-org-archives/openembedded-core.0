Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D334DC77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 10:07:12 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web10.4874.1681812425679420312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 03:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm3 header.b=lX13VHMC;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.20, mailfrom: pavel@zhukoff.net)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id B8F13320098F;
	Tue, 18 Apr 2023 06:07:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 18 Apr 2023 06:07:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1681812424; x=1681898824; bh=xLC2h2yN9e
	7YagafWi+uP+d7TciyW9j5kBfvo+vrzms=; b=lX13VHMCxvirIKjXrPtYMTY/j9
	FVvTyFwCJe7EZCtPNKXA/Q38mbKNE/eDxgNe9gMwWai914tKOz+zhwe9LTmw6CwZ
	y34lJrfqbH3g/pqaLX9PuFoyGY/iFFxZE7jIoLF262m6LDFJP3whhDLkRsAEjIia
	/9p+PROHL2oExU9PrLbRh1tgkvvW1IEK+ZxaQZbFh+HArnt4et3iaGU5Ee7ytC8F
	CcgrcPyA7NgRDe2rzizXBgKtlTj0x+ozCaO78ulYTu+cpj4nWZeOpFIO/5O6j60k
	9bcu7Nw93Qv/ZDXa/HSGqdsiIffq5qsKVn/Ky9nNA9ACrp1AQd+4d7dxOaxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681812424; x=1681898824; bh=xLC2h2yN9e7Ya
	gafWi+uP+d7TciyW9j5kBfvo+vrzms=; b=GxR1cHzre1A021pO7SBMVocMFLdxo
	w3s879UNev5RXRFkQAujc/AHOBjvQXmdNhCT5A6b+b2K9p62fSYqZzgcmhg5EvWr
	q/6V22k+YCSVtFBdehjVbl2jyFXxjFGjo540O+R6spaeQ106lC5EfFZ3k4p0DJPh
	p46aWVrb4byt8m+A3TbHeIXPNshIyGJD3JrO7uoZQvjM4GffgygnZCglHyY8ofdh
	dFfrQJwyolm3CeTFLu8M02jQHSEnqYS9gZCG2jMhbobVaE6D4cJCrHDxtWVMEN34
	6bT9v4miqFFL5usvDVEfq7cFricbLaToWYX3xOWIo0YgNwm7E2NRfLU/g==
X-ME-Sender: <xms:yGs-ZEFEABh4fgzgoKB9RgBk7jfsQKjvi9qx-8Me1Ped0qT-E47KZQ>
    <xme:yGs-ZNWRUQcrkgQR3gPxlNK6w_uwMpG0OyMEeYp3ZggDTKIJ0bpA6E6X1vjo2uImq
    WMRqXnwDBIjnc67TvY>
X-ME-Received: <xmr:yGs-ZOLNfIQInNFtY42i9RWeXgaH288i3hKKSK0u8Xd4U1UXVqjCwqiYjTZhJrmB-LJP9LQgkJPQCZeMrsJ3LaoKIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelkedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeevfeejkeejudegledtkeejhfettdefje
    euffehieekvddugfdtffffledvvdefhfenucevlhhushhtvghrufhiiigvpedtnecurfgr
    rhgrmhepmhgrihhlfhhrohhmpehprghvvghlseiihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:yGs-ZGEhWJezlX_04BZz3Bz5iLmLbzYDUzj0Y_KsGvBcVPlB2hlTlg>
    <xmx:yGs-ZKUgM75ndKqX917y-gG_SiqW6AxKTHm0k2-C93h-WWE462AbkA>
    <xmx:yGs-ZJPAG5p6XYfcRScF-2K2G_QA1toJR1Yx2Sete1yBg0WSzJf_VQ>
    <xmx:yGs-ZDcF7d9Z2zwSuMBVxrHh8g8big5E-zZMq9kfRKHuR0U0o-Fvhw>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Apr 2023 06:07:03 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel@zhukoff.net>
Subject: [PATCH] scripts/rpm2cpio.sh: Use bzip2 instead of bunzip2
Date: Tue, 18 Apr 2023 12:07:11 +0200
Message-Id: <20230418100710.3842904-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 10:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180183

bzip2 is in HOSTTOOLS already and used in few other places already.
This fixes bin_package class for RPM packages without adding bunzip2 to
HOSTTOOLS.

Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
---
 scripts/rpm2cpio.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/rpm2cpio.sh b/scripts/rpm2cpio.sh
index 7cd771bbe7..2034373fe4 100755
--- a/scripts/rpm2cpio.sh
+++ b/scripts/rpm2cpio.sh
@@ -47,7 +47,7 @@ calcsize $(($offset + (8 - ($sigsize % 8)) % 8))
 hdrsize=$rsize
 
 case "$(_dd $offset bs=3 count=1)" in
-	"$(printf '\102\132')"*) _dd $offset | bunzip2 ;; # '\x42\x5a'
+	"$(printf '\102\132')"*) _dd $offset | bzip2 -d ;; # '\x42\x5a'
 	"$(printf '\037\213')"*) _dd $offset | gunzip  ;; # '\x1f\x8b'
 	"$(printf '\375\067')"*) _dd $offset | xzcat   ;; # '\xfd\x37'
 	"$(printf '\135\000')"*) _dd $offset | unlzma  ;; # '\x5d\x00'
-- 
2.39.2


