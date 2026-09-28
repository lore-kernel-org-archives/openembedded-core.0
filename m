Return-Path: <patrick.vogelaar.dev@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D642CC9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 10:54:57 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54716.1790592887527716472
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 03:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=GlobMncO;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: patrick.vogelaar.dev@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4htdVW4LzHz8vNR;
	Mon, 28 Sep 2026 12:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790592883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FD9SQo4MkvLhNFbqCJaQ56KTgFHl5C0o1Wdz5CpRWC4=;
	b=GlobMncOqQb8uHw4GW9PtkLnkeY5xysUAhG22rTlFkWWcsMyKtlvP7KmXs6KIL54vJl8Yb
	2SrpB4C/PW/bFjwqZEDJvMk3QAnvvnK/v5uIbQpP12otiutGvZwCH6Xt+6k3dyl1GtMJpL
	trmrvVIRPYgakuvliLZsUjj/3QwqtnI5VS0PrHxw/Dy1ADPbGZzisM/8nN19rL+tWmHHxO
	NQurJjpezvCJNEdV32HV28ubRRBNMDwSVZbCxtXhWor9M0s+Zfwo2Bz/iSoT7TS7KVIDJ5
	W4VJFiIKO/jC5oS6DB59zM9uJ9lp+zQHzyvq4E97BihcNhM3cGlSA4XA7mJ/9Q==
Date: Mon, 28 Sep 2026 12:54:42 +0200 (CEST)
From: patrick.vogelaar.dev@mailbox.org
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: "patrick.vogelaar" <patrick.vogelaar@belden.com>
Message-ID: <910530019.414273.1790592882868@app.mailbox.org>
Subject: [scarthgap] strategy for curl CVEs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-MBO-RS-META: k1fimy68peeuqzm1wo4g7ce17p5sqwyh
X-MBO-RS-ID: e6c98d1e9b608ab7969
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 10:54:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246749

Hello

Currently I am trying to fix some CVEs related to curl and figured out that the code base has evolved quite a bit. Which makes makes backporting patches a lot harder especially if used function in the patch are not even there in the 8.7.1 codebase. This in combination with a changed test framework (the last patches for CVE fixes were already without tests) makes it hard to backport and at the same time ensure that the CVE is really fixed. 

Now my question would be if it still makes sense to try to backport some CVEs or if there will be a irregular major/minor upgrade anytime soon?

An example for such a CVE would be CVE-2026-11856 [1] and the upstream patch [2]. Here the structs like Curl_creds or Curl_peer and the corresponding functions do not even exist.

[1] https://curl.se/docs/CVE-2026-11856.html
[2] https://github.com/curl/curl/commit/5c6b4880357ab3e72967c1c45c

Patrick

