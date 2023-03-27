Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9742CC76195
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 08:58:48 +0000 (UTC)
Received: from mailrelay4-2.pub.mailoutpod2-cph3.one.com (mailrelay4-2.pub.mailoutpod2-cph3.one.com [46.30.211.185])
 by mx.groups.io with SMTP id smtpd.web10.30141.1679907521619553126
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 01:58:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa2 header.b=Jqsn0ksh;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.211.185, mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=dlJPPlpEqba4DLyfa4tiFbf5u1Mmzb2r+HHw0jDF6OA=;
	b=Jqsn0kshd6nJmiaDcQUfUwFQgUZRbXY4h2hREluohwdKXefeTl1FI8fmYtphz+o2rH9/l4iT3hK/u
	 EpBLYnqslSxQ2xYXCERlVHMcoXN+6COKDDYfY4NCgdZJX8i7pdNe/2jnZcdnImGHt3Caq10Sua799V
	 nysPPS2/akb1mzcPJ4tYsWFm1Z3oAeS57hw6Q3viP/cwc+INM4jhDNfGvXOB8YmRxS/TFFwusE2JtK
	 I1fL8921wqB3ce2u1uh4bsyhb5V4w+dfD+PK8VsnYPldfA5wrrl1ZTfNOwqp6SSw0AGr+Cc6Bp40Cd
	 lkQoDt79CpoDdgTWbCS5UbL+CaQdRpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=dlJPPlpEqba4DLyfa4tiFbf5u1Mmzb2r+HHw0jDF6OA=;
	b=Q0d/a4ZHl1dt/mpnhVTBG0LeI03OJNJZGwq520gUh5PECxPqGU6ejXPoxujHak8VUjWoajxysMjAD
	 mZJlfs6BQ==
X-HalOne-ID: 8f02e548-cc7d-11ed-9e43-87783a957ad9
Received: from [192.168.100.228] (c-799071d5.44006-0-69747578.bbcust.telenor.se [213.113.144.121])
	by mailrelay4 (Halon) with ESMTPSA
	id 8f02e548-cc7d-11ed-9e43-87783a957ad9;
	Mon, 27 Mar 2023 08:58:36 +0000 (UTC)
Message-ID: <89ef864d-c816-b4e1-2425-85a46d001d18@berginkonsult.se>
Date: Mon, 27 Mar 2023 10:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCHV2 3/5] rust-example: provide a recipe for
 zvariant
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <cover.1679842454.git.frederic.martinsons@gmail.com>
 <2e5fd3f0a5145af70fb1caee38d5cbf0a7c42877.1679842454.git.frederic.martinsons@gmail.com>
From: Peter Bergin <peter@berginkonsult.se>
In-Reply-To: <2e5fd3f0a5145af70fb1caee38d5cbf0a7c42877.1679842454.git.frederic.martinsons@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 08:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179150


On 2023-03-26 16:56, Frederic Martinsons wrote:
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>
> This recipe is for showing a "real world" example of
> a crate that depends on some git repositories.
>
> Usually, this kind of crate is built within a global
> workspace (here it is the zbus project) and so
> doesn't need a Cargo.lock on its own.
>
> For the sake of the demonstration, I had to add
> a patch for providing a Cargo.lock and modifying
> zvariant_derive to get it from crates.io instead
> of pulling locally with a relative path.
>
> The use case where the crate had some git repository
> in dependency is very common for "private" crate that
> are not aimed to be published on crates.io.
> When the project grow bigger, it is common to have
> a bin and multiple lib developped in parallel, and these
> libs are surely on a git repostitory.
>
> Hence the need of this support in oe-core.
>
> Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
> ---
>   .../rust-example/zvariant-crates.inc          |  140 ++
>   .../0001-Tweak-zvariant-cargo-config.patch    | 1249 +++++++++++++++++
>   .../rust-example/zvariant_3.12.0.bb           |   20 +
>   3 files changed, 1409 insertions(+)
>   create mode 100644 meta/recipes-extended/rust-example/zvariant-crates.inc
>   create mode 100644 meta/recipes-extended/rust-example/zvariant/0001-Tweak-zvariant-cargo-config.patch
>   create mode 100644 meta/recipes-extended/rust-example/zvariant_3.12.0.bb

Why not use meta-skeleton for the examples? I know and have seen before 
that for some reason the rust-example is placed in oe-core/meta, but 
think rust-example should have its home in meta-skeleton as it is the 
place for example recipes. Just a suggestion to move this now before 
filling up more example recipes among the core recipes.

/Peter



