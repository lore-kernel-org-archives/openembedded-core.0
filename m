Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20EFCFD2F6
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 10:20:35 +0000 (UTC)
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15621.1764238831687936124
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 02:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=bVEEyqpF;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.57, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 83AAD22180C;
	Thu, 27 Nov 2025 10:20:30 +0000 (UTC)
Received: from de-fra-smtpout4.hostinger.io (100-127-171-113.trex-nlb.outbound.svc.cluster.local [100.127.171.113])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 9244C2212DA;
	Thu, 27 Nov 2025 10:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1764238830;
	b=0hXLSkGow3YRWg8z8HOuU5a4H7q/ud62bgn6ThTtiAkgtoyJRscOXHqQ/rkjnfWg1OdMNK
	6E3+szPOp7a6fTfoPUBpiwTTLg5313C75WXberDWe9fKFd2CB8YdfBdvDzN/R49rimWnwU
	RG6074gTkhVhog1MqiXN0b0PWvtmzawZRE/7P5piw/RF1lGlP79rDmeqIm5L9HUhrBfLed
	geTRzY6/XLTcGeuec+GfiwMfpfvID/5F+kfjXvDqGvrA9N1IyllbTLgpH2ZjwZ0YnG14ux
	+KoBcWLCw0GvXUnSOhTxTF4MJpBeIAcT0P72ulkjx5AiyBMroWA47wLgn2xBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1764238830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=X1u0Q5oEHmADmhLjS/PGWePK/6XT3gTjXON/3NM0m0s=;
	b=1ms3mp7ktM/6WuDCJGkOwD2P2uWcU0LscdRVE+8g3Z1yh6bj/8WqiVjiIlYpzrRNOXpEQi
	LllaJrleP+waJisvmvxguwkq/p1xoCd97/6JXoWzPXoh7qPFqJi9JFtAbHSZX6Aqo8uQxO
	Z7SDowD96fsnwhLSxMu42GC18Uxug7d68xoviq8VnxJ0sZVhUJJa3ITlmDl6lGBrkdkpjm
	NOsXrUnuvjojLPYJEiWC7/l/+qUd0OStpHOqvQAHYe2eIjzW6pp5/bI/hEMpHAeniKCJ1i
	JInDi2aBlglTXcuG5YqzFe1Fx0Sb9jAWD3L9iriEY9dt6zJ2ul5s36ssttTtcA==
ARC-Authentication-Results: i=1;
	rspamd-7bff5db4cb-p87tx;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Slimy-Madly: 16139c3b2373e901_1764238830277_404136276
X-MC-Loop-Signature: 1764238830277:4251885241
X-MC-Ingress-Time: 1764238830277
Received: from de-fra-smtpout4.hostinger.io (de-fra-smtpout4.hostinger.io
 [148.222.55.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.171.113 (trex/7.1.3);
	Thu, 27 Nov 2025 10:20:30 +0000
Received: from [10.96.0.18] (unknown [159.26.112.39])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dHC9l4PVPz442t;
	Thu, 27 Nov 2025 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1764238827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X1u0Q5oEHmADmhLjS/PGWePK/6XT3gTjXON/3NM0m0s=;
	b=bVEEyqpF1bbg0Hb8H9m4epkSCHBI/9J4851T7SiBH/H735M7iy/XTZine0/qTQ6IvTIWR0
	7c/MvxWeznJwaLtuUfE0eLkyJ7oSloOBU7ZCb+roqK+9NQjs2d71gJs90bSTVqnyVKnved
	VtR0grxd31fdGWcqw6oEpKGDYCvV3P9qgBW9Xzj0xSmGE0TIewkMVBCt+ZyLowCR5wUmb/
	gdZ5ORo9xNmeEs1jX+jIHn9314vCfyvWQuhMTjec4G/tLbbJKoR+t3UDOghUP4mhj3c5Oh
	2X7HuMIbbYT85lxRUbZagW7ScPZaYdL0idYZmveia6UlPDTuNy6o7Wu7trPLEg==
Message-ID: <3a1b9adc-9ac6-44b7-824f-10f5e08f6d37@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Khem Raj <raj.khem@gmail.com>
Content-Language: en-US, fr
To: OE-core <openembedded-core@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: linux-yocto.inc: remove riscv-isa-clear.scc from
 KERNEL_FEATURES_RISCV?
Organization: Root Commit
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 27 Nov 2025 10:20:27 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=692825eb a=zdcZvI57mX5MBDhgQArLjg==:117 a=zdcZvI57mX5MBDhgQArLjg==:17 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=oKoAt8QGdRe_3LAYNJIA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfKKPa2SBE2nbWsWJT6vw7qECjJCqbPBt4su4DabCnMH/nH76LZ/X+uM8MhrMec8s7b0Zh6PyZcOlIR10leMrPJC1UdwnVMLTtn7bEd4Kka6sfu30gY0s 2F4x6q9p11H9cyEfJvgZl5lyOPt8gjVxjZGpK3TMR3aBMifFtn3RxMPRjWFF/E/d8OXNdZqh+TWfLGpSuATfLgo3bRB4/8fqueRflr0xqY6c/XhMjDhCyK1O 0E42bGw1xZsRriQw0/aH7DpRYJqS6pQEw2wd6qKgcLQfUKLvWaw1qW9Bw6/9M4kcf5VJuhuWFlN4HFsLry7Dvw==
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 10:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226828

Greetings,

I'm getting the same issue trying a master build on several RISC-V boards:

ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Feature 
'arch/riscv/tunes/riscv-isa-clear.scc' not found, this will cause 
configuration failures.
ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Check the SRC_URI 
for meta-data repositories or directories that may be missing
ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Set 
KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue

OK, I can set
KERNEL_DANGLING_FEATURES_WARN_ONLY = "1"
but is this a clean solution?

Where are all the arch/riscv/tunes/riscv-isa-*.scc files supposed to be?
I didn't manage to find them anywhere...

Thanks in advance
Cheers
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


