Return-Path: <stefan@herbrechtsmeier.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28046C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 13:14:01 +0000 (UTC)
Received: from dd43212.kasserver.com (dd43212.kasserver.com [85.13.165.135])
 by mx.groups.io with SMTP id smtpd.web08.26204.1640610838327145619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 05:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: herbrechtsmeier.net,
 ip: 85.13.165.135, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.45] (unknown [94.134.94.51])
	by dd43212.kasserver.com (Postfix) with ESMTPSA id 5F9FC43C062A;
	Mon, 27 Dec 2021 14:13:55 +0100 (CET)
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
 <AM9PR09MB4642D66F272E78BBD4251AE8A8409@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <c9af2d9c-e5f9-8282-f5e9-2dd228187153@herbrechtsmeier.net>
Date: Mon, 27 Dec 2021 14:13:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <AM9PR09MB4642D66F272E78BBD4251AE8A8409@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 13:14:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160020

Am 25.12.21 um 21:58 schrieb Konrad Weihmann:
> 
> 
> On 25.12.21 20:32, Stefan Herbrechtsmeier wrote:
>>
>> Isn't the circular dependencies problem mainly a problem of the native 
>> packages? In many cases the dependency only exists at compile time of 
>> the main project and not at compile time of the dependency itself. In 
>> case of a native package all dependency sysroots need to be finished 
>> before the recipe sysroot itself.
> 
> Unfortunately it is not - it's happens that the go.mod already creates 
> this circular dependency.
> 
> The classic example is that golang.org/x/tools depends on parts of 
> golang.org/x/text (and guess what) golang.org/x/text depends solely on 
> golang.org/x/tools :facepalm:

Does this circular dependency exists in the executables (main) only?

> For go itself this isn't a big issue, as the compiler just pulls all the 
> needed code into the compile workspace and build a binary out of it, 
> which can be reused later on.
> 
> But for bitbake it's a big issue, as either you pull in
> 
> golang.org/x/text + golang.org/x/tools sources into the 
> golang.org/x/text workspace, stripping you off the possibility to 
> properly watch the revision of golang.org/x/tools (in terms of devtools 
> and co) - or you simply end up with a circular dependency.
> 
> I scratched my head on this one for weeks, till I found a way to 
> actually use the latest greatest of each go module each coming as a 
> recipe of its own, while avoiding above mentioned situations -- and it's 
> kind of a huge break to how things are done right now.
> 
> I'm pretty sure the same will happen in rust sooner or later.
> 
> And I personally don't see how to break it as I don't know any way go 
> distinguishes between compile and runtime dependency - afaik they all 
> need to be present at compile time

Is it possible to create a recipe for the source and a recipe for the 
binaries which depends on the source recipe? In this case the DEPENDS is 
always the source package and the RDEPENDS the binary package. A 
BBCLASSEXTEND could be used to create the source recipe automatically.




