Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98759ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 21:32:50 +0000 (UTC)
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by mx.groups.io with SMTP id smtpd.web10.1723.1667251964868425747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 14:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=D5GbRu9y;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.210.184, mailfrom: peter@berginkonsult.se)
Received: from mailrelay3.pub.mailoutpod2-cph3.one.com (mailrelay3.pub.mailoutpod2-cph3.one.com [104.37.34.8])
	by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
	id 8d3c07e6-5963-11ed-be8b-d0431ea8bb03;
	Mon, 31 Oct 2022 21:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=Uv/M13SBqp8lNgGdqvmBTwcgtDmoANLZOVDBsG22fSk=;
	b=D5GbRu9yohXkTlBoW61wAeVtYp1w8SgyyJMqqLv90QohI3wXUI5j+Qgujcm9CeVQiI8rjsDuKDrc3
	 TT1vwbpoai2BZn97deanFhb+c+obSiL+eKlMm48JGyq9hkmtHKhawRTS+UtBY9ypSVg8fo4KCp+LLt
	 pZLur3O5lpJmE6yb08wD6Ci4RZZcSAPUOPrde/0oFFcV1Ufl5IAKWeJI+4XTz1wKYpXG15N4cAG2EU
	 zdP7f7N/Lm4Rl1CAKY4v6M8raOxUTHbL5lBciNhuDD6M9TdDbdfNTrV+oxJgEwUsDyWlUqCyr5vnT3
	 wuJiwHXlK+c7P/ONqDoOtDt/Vj8jqlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=Uv/M13SBqp8lNgGdqvmBTwcgtDmoANLZOVDBsG22fSk=;
	b=0kF543woaDTBKd7rqrYspl36bGYFbRi2tN/epJ888HivO0LVkGowP8jEelmZCJDIAJ8zH7La+NubA
	 2gIXEcQCA==
X-HalOne-ID: 8c6bc67e-5963-11ed-b689-7b202c25bcfe
Received: from [192.168.100.34] (ua-213-113-159-147.bbcust.telenor.se [213.113.159.147])
	by mailrelay3 (Halon) with ESMTPSA
	id 8c6bc67e-5963-11ed-b689-7b202c25bcfe;
	Mon, 31 Oct 2022 21:32:42 +0000 (UTC)
Message-ID: <e95e1314-a709-1f5a-548b-e27b4e5d3362@berginkonsult.se>
Date: Mon, 31 Oct 2022 22:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [OE-core] [PATCH] systemd: change syntax for SRC_URI append
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221031210902.169924-1-peter@berginkonsult.se>
 <CANNYZj81UaR6CojRriPNwGbq76mk+0Y+j8khBy2ZTrUqm4R1jA@mail.gmail.com>
Content-Language: en-US
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <CANNYZj81UaR6CojRriPNwGbq76mk+0Y+j8khBy2ZTrUqm4R1jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 21:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172339

Hi Alex,

On 2022-10-31 22:24, Alexander Kanavin wrote:
> On Mon, 31 Oct 2022 at 22:09, Peter Bergin <peter@berginkonsult.se> wrote:
>> In order to be able to override the git repo used in a bbappend
>> file the additions of files to SRC_URI needs to be done with :append
>> instead of +=, otherwise those will not be added.
>>
>> My use case for this change is to try to build latest
>> systemd that is located in another repo than the one used
>> by the recipe (systemd.git instead of systemd-stable.git).
>> With this change this is possible to do by having SRC_URI, SRCREV
>> and SRCBRANCH in a bbappend.
> Sorry but overriding these three things in a bbappend is a horrible
> idea, and should not be done. Copy and tweak the whole recipe please.

Sure, I can do that. My aim for override those in a bbappend is just for 
development purposes and nothing I plan to use in production or push in 
public. My way of working when I realized this was to build latest 
master of systemd that had a bunch of patches that I would like to test. 
To do that I needed to change git repo to systemd.git. When tested I 
plan to backport relevant patches that I need to add to current systemd 
version in oe-core to my local layer until next systemd release. Then I 
thought this could simplify things for more people. But I'm fine if this 
is not accepted for upstream and I can work around that.

Best regards,
/Peter



