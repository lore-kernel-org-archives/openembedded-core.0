Return-Path: <stefan@herbrechtsmeier.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B4CC433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Dec 2021 19:32:18 +0000 (UTC)
Received: from dd43212.kasserver.com (dd43212.kasserver.com [85.13.165.135])
 by mx.groups.io with SMTP id smtpd.web10.10116.1640460737163266035
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Dec 2021 11:32:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: herbrechtsmeier.net,
 ip: 85.13.165.135, mailfrom: stefan@herbrechtsmeier.net)
Received: from [192.168.178.45] (i5E86B5ED.versanet.de [94.134.181.237])
	by dd43212.kasserver.com (Postfix) with ESMTPSA id A213D43C49CC;
	Sat, 25 Dec 2021 20:32:14 +0100 (CET)
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Konrad Weihmann <kweihmann@outlook.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Message-ID: <12b2ffb4-5758-e80f-9515-a8d4ac078c9d@herbrechtsmeier.net>
Date: Sat, 25 Dec 2021 20:32:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: 
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Dec 2021 19:32:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160005

Hi Konrad,

Am 24.12.21 um 11:36 schrieb Konrad Weihmann:
> I had a look at the failures and most of them are fairly easy to fix - 
> all but the go recipes like influxdb.

The go class doesn't work without network by default if the project 
doesn't provide a vendor folder.

> I'm not sure how to deal with that, so there aren't that many options here.

This is a common problem for all language specific package managers 
(python / pip, Node.js / npm, Rust / Carge, go) and we need a common 
solution.

> Either
> - inject all the needed with a fixed revision, but that would prevent 
> devtool from catching updates to them properly

This is possible if we extend recipetool to add the dependencies to the 
recipe. Rust and npm are using this option and I have a WIP to improve 
the npm solution. But in any case we loose a lot of advantages of OE.

> - create recipes for all of them and pray that there won't be a circular 
> dependency in any of them

The circular dependency is only the least problem and could be fixed by 
splitting the dependency and code into separate recipes. The main 
problem is the huge increase of recipe count and parse time. Furthermore 
we need the possibility to test recipe updates of dependencies. Python 
is using this option.

> - allow go to work with network (the least favorable option IMO)

This is how the current go and especially go-mod class work.

> in the case of influxdb for instance we are talking about
> 
> github.com/peterh/liner
> golang.org/x/crypto
> github.com/influxdata/influxql
> github.com/influxdata/flux
> github.com/BurntSushi/toml
> github.com/influxdata/usage-client
> golang.org/x/text
> go.uber.org/zap
> github.com/klauspost/pgzip
> github.com/prometheus/client_golang
> github.com/jsternberg/zap-logfmt
> github.com/mattn/go-isatty
> collectd.org
> github.com/bmizerany/pat
> github.com/dgrijalva/jwt-go/v4
> github.com/gogo/protobuf
> github.com/golang/snappy
> github.com/tinylib/msgp
> github.com/opentracing/opentracing-go
> golang.org/x/sync
> github.com/apache/arrow/go/arrow
> github.com/pkg/errors
> google.golang.org/grpc
> github.com/kraj/xxhash
> github.com/influxdata/roaring
> github.com/xlab/treeprint
> golang.org/x/time
> golang.org/x/sys
> github.com/jwilder/encoding
> github.com/dgryski/go-bitstream
> 
> where especially the golang.org/x modules are known to have circular 
> dependencies like x/a relies on x/b, while x/b requires x/c and x/c 
> needs x/a for building.

Isn't the circular dependencies problem mainly a problem of the native 
packages? In many cases the dependency only exists at compile time of 
the main project and not at compile time of the dependency itself. In 
case of a native package all dependency sysroots need to be finished 
before the recipe sysroot itself.

Regards
   Stefan

