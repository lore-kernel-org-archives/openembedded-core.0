Return-Path: <seebs@seebs.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16DFC63707
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.31398.1650901501365674605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=FEXBNc94;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 2A0BA2E891F;
	Mon, 25 Apr 2022 10:44:59 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1650901499; bh=yJi9R3Ka61llZxm3EyNRRKnbguhZ56p1TVViu1n6K8s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FEXBNc940/TwVSHrxH+zD0Y4vkq08n54Fr41B7e9hrSLKngcttzFiBoc0mZJhmX1I
	 zXBl0WKNAnlhxbRh2F2owuTTS8qr8/o1aVzUaw6JIHiMsA2jrLlDkqRlscE4qW+r6l
	 ImX5f9zhQge7Ny61CpjsQyDiFxuZGFydj35vHPS1BTJSFeerARjDhaK0M515u8iAMT
	 2GKDoLY/DK3hIgENnye0FnYgazOgApQ+qMwjV5pk02b7dXpubbXljDIKNH5Fgg/TZL
	 /l0rQpsh22E3l5OKjb1cBthDgcytI5BeFJW0ybGFn+uOzzW8CxizTnaghHtHFCMOpS
	 5YDPLkzEsGE8Q==
Date: Mon, 25 Apr 2022 10:44:56 -0500
From: Seebs <seebs@seebs.net>
To: "C. Andy Martin" <cam@myfastmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] do not abort on hard link path
 mismatch
Message-ID: <20220425104456.1a8e3531@seebsdell>
In-Reply-To: <20220425144924.1033647-1-cam@myfastmail.com>
References: <20220425144924.1033647-1-cam@myfastmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164832

On Mon, 25 Apr 2022 10:49:24 -0400
"C. Andy Martin" <cam@myfastmail.com> wrote:

> -					msg->result = RESULT_ABORT;
> -					goto op_exit;
> +					if (msg->nlink == 1) {
> +						msg->result =
> RESULT_ABORT;
> +						goto op_exit;
> +					}

I'm distrustful of this because I feel like, in the case where we have
apparently-stale information in the database, we really should be coming
back with "we don't have valid database information", not yielding
what's probably incorrect/old data.

I'm also concerned a bit because nlink is never 1 for a directory...

-s

