Return-Path: <cam@myfastmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA21C63714
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:15 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web12.33425.1650909744235117947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 11:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@myfastmail.com
 header.s=fm1 header.b=Yn8X+aaO;
 spf=pass (domain: myfastmail.com, ip: 64.147.123.21,
 mailfrom: cam@myfastmail.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 6BA4E320206B;
	Mon, 25 Apr 2022 14:02:20 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
  by compute4.internal (MEProxy); Mon, 25 Apr 2022 14:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=myfastmail.com;
	 h=cc:cc:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1650909739; x=1650996139; bh=z0
	HCEkV+qODfDRYZ3Shgfv6bTEDqbR6mODqCCcqC4T0=; b=Yn8X+aaOmXW4sGYBGH
	wvD645eWV89iL32VuUpKpoQDvM+2II9/3vVFYES1/osDHO5T2WDrZF9Xl+9ZlCYw
	nbfhc87RzP7fC7n8n/fFQP7esV95ain72MXj5xomQ7DqXr/jLf9A95qQgQjH0H92
	reIV+zIC2Q9Ke8CiCmn6UR7k6QOtt8GMFBUaSxL6oq/ItJ6n0jAGdWfKWiyjLjm6
	Ty9/w1yc9QDsjhJaLnPyM2DME1aeO0hTl5GA/dQvoWnm9gpUiT9PZ62yxM6rQ8EQ
	oRbfEtvfR4GCrl/kJIOLjcZmu/qDQt2Ob96k3/qgqyzEmHFgm+ZWv9lJ748oFk3g
	QsjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650909739; x=
	1650996139; bh=z0HCEkV+qODfDRYZ3Shgfv6bTEDqbR6mODqCCcqC4T0=; b=K
	TD6k3Aihg1t2JTHVBE6OtfIFK3FwZKnMH3LY7gQbrkz74Qcy0T01EMN9YIwxrPy5
	Z2J0sPjkkq/agvrtYTnWqexTvzbwL7GhCoYFP6qpGeHiG7WxJN+17GsOO1VLsEP3
	wHOIVbhFcqlWLHAWMBHnJKy7SeH27UTIXbc0/z+BtNXPdRgk84CURn0vE/yqsWnt
	7lTH1l8IazGasrCtvDkNg07j0jBx9KcHzeGevLoX/QRybYwzS7vVhWzYtYj7Ob4h
	72gF1fYoAUgD/coIzLwXQyUQAegZ+SLJNNLRtjFKTtcKAgb0tPQ5TqqErfTQ0lWL
	Y/WJ4v5Znx6RX7e9bHnWA==
X-ME-Sender: <xms:K-JmYlFo951Enx3TE4fI9BmjRjIuZJounp0uhkNcN1OyOPrHYRzxdA>
    <xme:K-JmYqVMsjq9G-2F1tY03wD8UwEdT_oWtIULS0XJ0fIRB_1weOOi4_xEm0Du3rR4z
    cjHj5VBeYnmFg>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedruddugdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdevrdcutehnugihucforghrthhinhdfuceotggrmhes
    mhihfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrghtthgvrhhnpeevhedugeetlefgtd
    egieeuiefftdffhffhvdevgeefieffgfekhffffeekfefftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegtrghmsehmhihfrghsthhmrghilh
    drtghomh
X-ME-Proxy: <xmx:K-JmYnI4Q-TpkRhPBT1FM0o9ywLJySf7TgJaYdlDGeio2CWL9PP4Eg>
    <xmx:K-JmYrHgUL-acnnm32Gzo9ufqP8HwEtravXy4pD0BYPrt5IqE-8fSg>
    <xmx:K-JmYrV1vvxceS7qm41c3T1DKjl8-Q8LBLBrtajfnvnHS8dPfrPXtg>
    <xmx:K-JmYiCPM03t0Z2k668HeVaw4tG2FCfvf-r_Razcoi430jBg-5tYZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 919622180078; Mon, 25 Apr 2022 14:02:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-569-g7622ad95cc-fm-20220421.002-g7622ad95
Mime-Version: 1.0
Message-Id: <fcecdd1b-567d-4a1f-b622-828362f2fd35@www.fastmail.com>
In-Reply-To: <20220425104456.1a8e3531@seebsdell>
References: <20220425144924.1033647-1-cam@myfastmail.com>
 <20220425104456.1a8e3531@seebsdell>
Date: Mon, 25 Apr 2022 14:01:58 -0400
From: "C. Andy Martin" <cam@myfastmail.com>
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH] do not abort on hard link path mismatch
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164839

On Mon, Apr 25, 2022, at 11:44 AM, Seebs wrote:
> On Mon, 25 Apr 2022 10:49:24 -0400
> "C. Andy Martin" <cam@myfastmail.com> wrote:
>
>> -					msg->result = RESULT_ABORT;
>> -					goto op_exit;
>> +					if (msg->nlink == 1) {
>> +						msg->result =
>> RESULT_ABORT;
>> +						goto op_exit;
>> +					}
>
> I'm distrustful of this because I feel like, in the case where we have
> apparently-stale information in the database, we really should be coming
> back with "we don't have valid database information", not yielding
> what's probably incorrect/old data.
>
> I'm also concerned a bit because nlink is never 1 for a directory...
>
> -s

I agree this is not the ideal solution. However, I was basing this compromise on this commit:

commit 691a2304c8c29a3b7d5977908ef82aaf188f5ba0
Author: Seebs <seebs@seebs.net>
Date:   Fri Apr 13 14:37:34 2018 -0500

    Less chatty debugging
    
    Stop producing the path mismatch messages for things with multiple
    links. We could probably make this smarter, but for now this is
    sufficient to reduce the spam.
    
    pseudo_debug(0, ...) now produces a message, as a special case.
    
    Signed-off-by: Seebs <seebs@seebs.net>

The issue is w/out the change, my builds occasionally abort due to races
-Andy

