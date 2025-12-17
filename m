Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB1ECD65C41
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:41:36 +0000 (UTC)
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13653.1765975283959425783
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=jgp41mR0;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.57, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E255F5609B3;
	Wed, 17 Dec 2025 12:41:22 +0000 (UTC)
Received: from de-fra-smtpout1.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.102.46.124])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id DFC75561757;
	Wed, 17 Dec 2025 12:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765975282;
	b=nCXoLproIs2NqVzro64G6XXzHFypOXDj5/kWhqsDsRYDq/dUnoDveOW737184806Fz/NDq
	PUwWK5AqcLeC4MZBfv6CVSx7DzvMlAFBMsM04Ay2pklMvzHuMohkaimoDWSLa3bZnFIs8v
	4qG8X0igGrm85B2NynIsMWwDgw7lgmOuQiDp8pPgyhCZvQ1mLl3n1v/zYCVq+JfCz8XTLJ
	qZoxz76+qDzwn3JREIBg3Fo4uUDyGJA2lLd6IU9VWePiLPBTY2GxKuvxhVvBs8ifqBSOik
	D5vQy3FqVaLDdMqU0VCV4/SgzKQoF2ICBe+1lKwJVVDr23kLFm5bKSbUR48rOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765975282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=glTx1eF6NpTt2ZoDSpZVBThUS9kRO+7MI5GzU6pI7wk=;
	b=ZWCdOxstKPQZj5BaCaSlL3ifmRBrHkHl1E5/Yg+UP02yyo9tPGDVHX2cPEE/IFvl4OM8gi
	/hl9G3F4PJi9zYbuhlwwmf5dw34BT+s5+qnt7izpT0Lul+f3aDkHxY4bPN6MJ892UpZ/GD
	xXhtip5HVK9pnAy95rexgNc9l94fgERofWWZPepayZROuNFtEZn0Gv/GKZkUT+RxQxCbwz
	IqfOq2JzM07s0HGRqWFp1+46bd4Vka3lLu0zpBttgGc5McIn4pTDrcAtkizjGnwg0Hzruh
	7jqGwHnzLQ0ghn0gEVrNkN4dmtvZgi8CZv4vRChzfjRKHAk7C3KbdzcKnnWPNw==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-7xjp9;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Print-Hook: 76afee4d049cc2af_1765975282769_897326680
X-MC-Loop-Signature: 1765975282769:1488529609
X-MC-Ingress-Time: 1765975282769
Received: from de-fra-smtpout1.hostinger.io (de-fra-smtpout1.hostinger.io
 [148.222.55.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.102.46.124 (trex/7.1.3);
	Wed, 17 Dec 2025 12:41:22 +0000
Received: from [IPV6:2001:861:4450:d360:c8b0:3805:199c:4536] (unknown [IPv6:2001:861:4450:d360:c8b0:3805:199c:4536])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWYM36VzHz464C;
	Wed, 17 Dec 2025 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765975280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glTx1eF6NpTt2ZoDSpZVBThUS9kRO+7MI5GzU6pI7wk=;
	b=jgp41mR02DIqNwax5gJfUwp5B/NACTWmteD7nx9Wd6DSD7j5gwDaoH6xsKO53/85SMtqrL
	HKJQD+cIP3g8UInKu7j8ZNdxtAsxtcp7bC2b3LIC2vKSG5HbUg1koafJ0Ddj5ESQxN4rTF
	9ETwUvtYxJXnci9cWFggYhpZS6BXphIPu5W4Qfnc9sIU2oQrcsOdkh0ORle6TDv6/4SJ0K
	EnWIS4CQAz6gom1R2d59RK+JrjhaJ+SYLtRHC8u3kfFETAy1n63tCEfNMJIUhKNR5tqADe
	8vCY1Bx/03dTUTrqKxzhEr7CLR2Jy6rX9rPGEFUFQnipp+ylDO9l9+QthsrHvA==
Message-ID: <41d6d403-a531-457b-bf10-dd6591e3faa3@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, auh@yoctoproject.org,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [AUH] alsa-lib: upgrading to 1.2.15 FAILED
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <0101019b262ede8c-49d9befe-c250-4b00-a166-8ac8b9a5461e-000000@us-west-2.amazonses.com>
 <2a314131-0dc4-4a21-9963-03063761b8f1@rootcommit.com>
 <CANNYZj-TZkRiX01Pu6i713YfT+UwdVrk+m0FVVB2TobqtkWp5Q@mail.gmail.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <CANNYZj-TZkRiX01Pu6i713YfT+UwdVrk+m0FVVB2TobqtkWp5Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Wed, 17 Dec 2025 12:41:19 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ALriHGRn c=1 sm=1 tr=0 ts=6942a4f0 a=xXtMw5WTSIFZDwkkqTPSdw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=o810oVQkx80zDpOGg58A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-CM-Envelope: MS4xfKkgZCJI4MJB2SeN0aXkwk9D9qDNykWk0w4VNkP5iRZl4TzTFSDMB1qkUZaDJP/VnUYf5+AOmdVk1doGobGZvsl1Mj+nnP6UX+/A+1G8f4yiVTtuNQOp YBIox3mS73VwD4kMnvIqmAtK8j/5IgcDx2/A3DVC7Vrfq/jSnDBfEQ+8ukpu5hB+/0FEUqNiLFHX2+WXGn4JjQScIPgNJDh4cIVfA5jUmfiYyTufQ2aUrcWO +IxLM+IMEx/c3h7xkT1rKoGXI3TCI62G6sDJUG/cynYN5dz+tbDfhmaWunvsBMfjLvOxYekCBlRQT/PJceIisYHgRmkTkCYNDRWzsh3HZDu+4Rg8ntz2H0+3 hEMEcoULOdzv54//C9XEx8dQgCvYE1K5QbdUsY6VP73G1AxMk2VWHNjKRHnkR6wmoTczMqXfxEB82q2+J6bgkxsR/F5CYzn/PD8+wjNl/eAwbSbnqyU=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228036

Hi Alex,

On 12/17/25 13:25, Alexander Kanavin wrote:
> On Wed, 17 Dec 2025 at 13:22, Michael Opdenacker via
> lists.openembedded.org
> <michael.opdenacker=3Drootcommit.com@lists.openembedded.org> wrote:
>
>> I probably won't have time to investigate this, but there turned out t=
o
>> be no issue here.
>> I upgraded the recipe with devtool (as AUH does too, I guess), and the
>> changes built fine.
>>
>> So apparently a false positive here (meaning "failed" instead of
>> "succeeded=C2=A8).
> Did you build specifically with musl, on qemuarm?
No, glibc and systemd (poky-altcfg) on qemux86-64.

Indeed, that's a different platform :)
I guess I should try qemu with musl then too.
Cheers
Michael.

--=20
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


