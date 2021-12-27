Return-Path: <stefan@herbrechtsmeier.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F982C4332F
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 15:47:40 +0000 (UTC)
Received: from dd43212.kasserver.com (dd43212.kasserver.com [85.13.165.135])
 by mx.groups.io with SMTP id smtpd.web09.27479.1640620051489385925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Dec 2021 07:47:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: herbrechtsmeier.net,
 ip: 85.13.165.135, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.45] (unknown [94.134.94.51])
	by dd43212.kasserver.com (Postfix) with ESMTPSA id 6EE8243C072F;
	Mon, 27 Dec 2021 16:47:28 +0100 (CET)
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Eero Aaltonen <eero.aaltonen@vaisala.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
 <CANNYZj-XR2XzOwnfPTN74mG1QiWcbE96+-iAb-VL7fYta9YA_w@mail.gmail.com>
 <5f6b7b04-7570-5662-e00d-6a8212b1bcee@herbrechtsmeier.net>
 <aa9599c301afd46cfceb0122b01b2dab758fcbcc.camel@vaisala.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <765ad03b-576b-8f82-b3d7-747295ad78f3@herbrechtsmeier.net>
Date: Mon, 27 Dec 2021 16:47:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <aa9599c301afd46cfceb0122b01b2dab758fcbcc.camel@vaisala.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Dec 2021 15:47:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160032

Am 27.12.21 um 15:54 schrieb Eero Aaltonen:
> On Mon, 2021-12-27 at 14:38 +0100, Stefan Herbrechtsmeier via
> lists.openembedded.org wrote:
>> Hi Alex,
>>
>> Am 25.12.21 um 20:41 schrieb Alexander Kanavin:
>>> On Sat, 25 Dec 2021 at 20:32, Stefan Herbrechtsmeier
>>> <stefan@herbrechtsmeier.net <mailto:stefan@herbrechtsmeier.net>>
>>> wrote:
>>>
>>>       > I'm not sure how to deal with that, so there aren't that
>>> many options here.
>>>
>>>      This is a common problem for all language specific package
>>> managers
>>>      (python / pip, Node.js / npm, Rust / Carge, go) and we need a
>>> common solution.
>>>
>>>
>>> I tend to think that the best (and the hardest) option is to
>>> improve these tools so that they're usable inside do_fetch (e.g.
>>> fulfil the caching/reproducibility criteria for a bitbake fetcher),
>>> and the needed changes are acceptable to upstreams.
>>
>> The real problem is the different philosophy between OE and the
>> package manager. The package manager doesn't care about duplicate
>> versions, maintenance versions, version updates of indirect
>> dependencies, license compliance, CVE checks or dead code (examples,
>> documentations, test,
>> ...) and if they care every package manager have its own solution.
> 
> The Java OSS ecosystem has had fairly well defined build time and
> runtime dependency metadata commonly available for many years now. The
> more widely used build tools are capable of using this metadata to
> calculate a solution Set(lib, version) that satisfies the version
> requirements of the dependency graph - or report that no solution is
> available. Cryptographic hashes are however by default provided by the
> artifact server(s).
> 
> For Python distribution packages, the 2020 pip resolver is advertised
> to be better at calculating solutions to required package
> dependencies. Cryptographic hashes are specified for pip, use is
> optional. The PyPA Core metadata includes some potentially useful
> fields, such as the license and what the project requires.
> 
> The language specific package managers could potentially be used to
> export dependency metadata, and also potentially to check "with (foo
> i.j.k) and (bar x.y.z), is there a set of compatible package versions
> available for baz and it's dependencies?"

This is possible and already done in recipetool.

I see two possible solution to support language specific package managers:

a) Use the package manager manifest direct (go.sum, npm-shrinkwrap.json, 
...) to fetch the dependencies.

b) Create recipes from the package manager manifest.

Either we give away the control over the dependencies and use the 
language specific way of manage dependencies or we have to extract the 
information as suggestion.

Everything between means that we lose the benefits from the language 
specific package manager and OE together.

Regard
   Stefan

