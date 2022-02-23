Return-Path: <andrew@aj.id.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DC6BC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 00:41:23 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web12.1594.1645576882379731738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 16:41:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aj.id.au header.s=fm2 header.b=iSgxfXx3;
 spf=pass (domain: aj.id.au, ip: 66.111.4.28, mailfrom: andrew@aj.id.au)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 75FFD5C00DD;
	Tue, 22 Feb 2022 19:41:21 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Tue, 22 Feb 2022 19:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; bh=aR7PEGw21VdOR90fC1CVg7LL19JdPMteHaf5ZO
	EWNOA=; b=iSgxfXx3qFrW82c/s2uQxD0LTbiZ62R250SYGeVJxpxIFOwcYqzfLX
	LslQwWFZjDb9ssIcUY3sN/apSyjnPdWDd2PGrckAzRO1l7+vFpTJrUd8IWdwyUwP
	jH/3nAcxvdSth6IlK3JDAdCvTvLOPO6BPEIfDKQr2o7v3lXDQppxQmWw6udB+ai2
	zXfXl0ymPrgWeEBXB4w22p0lQfwcdiN0Y8FBArjpKgzfc1Boa11wqN9R/FxqZWPq
	9xhaVwO8XIHEQLZKFZa2uC98VY2kxRgtOIBG43umweYuuKrbAbHbiN3soZ7NIzPJ
	7ZwZ5hGum+xetLzoRkDxvZ4kMfqHZavA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aR7PEGw21VdOR90fC
	1CVg7LL19JdPMteHaf5ZOEWNOA=; b=I2IwpElheISHuHaqLGEBhjwKk6lS/oX3b
	+5ZGjTY3y6xwzKzgMEy7uqG0siFewJEEhVAB5QxaPZyEdwVcy6iDU4a4IJo0LLzO
	kMNlSXzDdPK/0uq7tOxZc4ff3kBE7XLcEtTn5ZK6KeoV+qCmlf7j/0B7JfbWb9j1
	z8iWoA/UU5fjtoICzKV+h9hBPQ9vLfIQflj263rm7j0CS1pUGuFqqq6tokjdaB9F
	zyjdkJlxDWi9wSOJqgUB8siDMW0THvajbZ1p8WuBHDxYkkHh8pFfILRBwrvTLDa6
	H/ZcRWbYFL7dpO5exXGrWOcvL3hnk2O1GCoxrjvQPzImUKoCkxM2g==
X-ME-Sender: <xms:sYIVYgjBgTvbbRsqLFoEtD3j3nYR4wJpoqqKbLZ0yvnhuILll04i1g>
    <xme:sYIVYpB8AhUr5JtwALO3Re1DLsB1S0EbjlXbb0f9tJoUiG-MQI9UWXl9CFOMmQocj
    8DYRoSSUXDdXXYG4Q>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvvddrkeelgddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:sYIVYoHBGNpwc7rT2vSmBnBvsRkm4iuVHd2In9E43IeQpADW5fEGOQ>
    <xmx:sYIVYhS2M6AlBIlaSqHp6GeWtNRYkZqLZayJBTPHY22CJxwHBiInsw>
    <xmx:sYIVYtxCThrneqlH5qD2hbgmfutwNCyr9z9KfnjDOQTgGATXCAjREw>
    <xmx:sYIVYmuxQyG-kXEB0WChFqIGAG-Q61q7fOl_ngbUQCT1jHn6J2WD_w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 543BA1920081; Tue, 22 Feb 2022 19:41:21 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <b10821ad-cd51-4a15-9960-9fb42b7e22bd@www.fastmail.com>
In-Reply-To: 
 <0ee2484cba7068b4b43330ff2d371ccf14bc94b4.camel@linuxfoundation.org>
References: <20220222035234.463162-1-andrew@aj.id.au>
 <20220222035234.463162-2-andrew@aj.id.au>
 <0ee2484cba7068b4b43330ff2d371ccf14bc94b4.camel@linuxfoundation.org>
Date: Wed, 23 Feb 2022 11:11:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC PATCH 1/8] rust: Migrate
 arch_to_rust_target_arch() to
 rust-common class
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 00:41:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162237



On Tue, 22 Feb 2022, at 20:35, Richard Purdie wrote:
> On Tue, 2022-02-22 at 14:22 +1030, Andrew Jeffery wrote:
>> This will allow us to use it elsewhere for architecture name
>> translation. This move is motivated by powerpc64le support.
>> 
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  meta/classes/rust-common.bbclass           | 16 ++++++++++++++++
>>  meta/recipes-devtools/rust/rust-common.inc | 16 ----------------
>>  2 files changed, 16 insertions(+), 16 deletions(-)
>> 
>> diff --git a/meta/classes/rust-common.bbclass b/meta/classes/rust-common.bbclass
>> index 98d65970e8c0..2f2a31867ad0 100644
>> --- a/meta/classes/rust-common.bbclass
>> +++ b/meta/classes/rust-common.bbclass
>> @@ -1,5 +1,21 @@
>>  inherit python3native
>>  
>> +# Convert a normal arch (HOST_ARCH, TARGET_ARCH, BUILD_ARCH, etc) to something
>> +# rust's internals won't choke on.
>> +def arch_to_rust_target_arch(arch):
>> +    if arch == "i586" or arch == "i686":
>> +        return "x86"
>> +    elif arch == "mipsel":
>> +        return "mips"
>> +    elif arch == "mip64sel":
>> +        return "mips64"
>> +    elif arch == "armv7":
>> +        return "arm"
>> +    elif arch == "powerpc64le":
>> +        return "powerpc64"
>> +    else:
>> +        return arch
>> +
>>  # Common variables used by all Rust builds
>>  export rustlibdir = "${libdir}/rust"
>>  FILES:${PN} += "${rustlibdir}/*.so"
>
>
> If we're moving this, it may be a good candidate to move to a new
> meta/lib/oe/rust.py python function library for rust. I appreciate that is
> slightly move involved and will likely need the imports in base.bbclass to be
> tweaked but is probably the better long term fix.

I'll take a look.

Andrew

