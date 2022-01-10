Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874F1C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 12:56:21 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by mx.groups.io with SMTP id smtpd.web09.31214.1641819380877741155
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 04:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=gxwFgUy4;
 spf=pass (domain: gherzan.com, ip: 64.147.123.25,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 06DDE32008FA;
	Mon, 10 Jan 2022 07:56:19 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Mon, 10 Jan 2022 07:56:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm3; bh=+hEe7s324ACL8dcAGQLTfDUfWpeTa29
	JstNS7laJWSo=; b=gxwFgUy4zZMRn49/yGEbK5bHpFqiSVGWuKtHY5TwB+3tGCI
	aymqSjU8nDzgB3Mg35j/CSySVLn4DECfY5eiiHex6pVC6bjTOL5f95Cpd0a0Se/n
	RDQmBBWRs3qQOHS3hsOPXPfElPEemE2zduydpm3N8g+mgsdEI9IeCBG79XdWo7Qr
	2Gj0mtZ9dKXKYL2YynWdiJh+oKsPVqVRh6UxfDBgVq6mCgQzUclioUpz9Cj/CnBe
	u+q2V6QzlXYhwerFOAX6jFAgHeXMy8YujXORkVCUr9PwPjIITH73Og2PewUHqQ3M
	rVEdk4PYs7uw8MlIgiZ/lcIuoAUtX0zS2D3CujA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+hEe7s
	324ACL8dcAGQLTfDUfWpeTa29JstNS7laJWSo=; b=EWlZ/2Q3nvz/BoYZlcYKHk
	c08vPt2TGrDNWagCNbKZfZU74rvIi7xzHtmYzaXOWldpvs4cL9S5OxZ/v/7Yxx5s
	D28zFKQh3yUvTvS7Vf8UCfXX6hgnPkgJJrM3GW+uaQiId4vf3WVSkiZxk2gX9yDj
	82DjDncHTOkgoUzvkzViDSgURKbHwEqRf+4RkvQSgu3CH1SJAFRCi7TNPYFDOkc3
	eY9kr8BhCsSG3Xn1utxmekArSh5ZNFQ6UM0YzKmxMncfkJnQhMe/t2EPzkE9x22Z
	eT/gENY0HgCGFUUmmygiRMKoP+IkKomU5RgaZacKfN3tIZVUtBMl46/L/Vj6L4HA
	==
X-ME-Sender: <xms:8yzcYZfWSCc9CpJ2RmQNyRZ6yGLy5wHFQm5KYoH-J_IY-dd661pq1Q>
    <xme:8yzcYXMk-TfapdUAPqOD7nzLjYSaOOVip2v_FmaKTCdDwekVAr-9eiUHHuUANPpa3
    JGK6P9KDPGPglmPxHk>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgvdduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehnughrvghiucfihhgvrhiirghnfdcuoegrnhgurhgv
    ihesghhhvghriigrnhdrtghomheqnecuggftrfgrthhtvghrnhepfeetgeduleehtdeive
    duledugeetgeeggfeltdekleehtddvveefleeuteevheegnecuffhomhgrihhnpehpvghr
    lhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:8yzcYSgvOPf8cEFmi93zecSETx304yO2E-OOrL1QwVlx57cwyPuTiQ>
    <xmx:8yzcYS9wDSuwh94qHXwKLKHelRbDGp4id5hq3oeZxbVGx7I3Kv8mfg>
    <xmx:8yzcYVvCGtHpeBv9w52C_XvPnLDYTZ50nmKRAHcxMayMcuue8Icoeg>
    <xmx:8yzcYa5SJBa7gxS3CkaY-MJJQQWsATPlvGGOZZKOzDqrngE9GlVsxQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3B5963C0146; Mon, 10 Jan 2022 07:56:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4527-g032417b6d6-fm-20220109.002-g032417b6
Mime-Version: 1.0
Message-Id: <647ddff7-c27c-4023-aa70-a423876f4e20@www.fastmail.com>
In-Reply-To: <b44541ed-2bb1-485d-99d3-e6ab1fe61664@www.fastmail.com>
References: <20220106201234.159792-1-saul.wold@windriver.com>
 <b44541ed-2bb1-485d-99d3-e6ab1fe61664@www.fastmail.com>
Date: Mon, 10 Jan 2022 12:55:59 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded <openembedded-core@lists.openembedded.org>
Cc: bero@lindev.ch
Subject: Re: [OE-core] [PATCH v2] perl: Enable threading
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 12:56:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160347

On Mon, 10 Jan 2022, at 12:39, Andrei Gherzan wrote:
> Hi,
>
> On Thu, 6 Jan 2022, at 20:12, Saul Wold wrote:
>> From: Saul Wold <Saul.Wold@windriver.com>
>>
>> When the tranisiton to perl-cross occured, the threading define
>> seems to have been missed.  The perl tests for threading where
>> simply skipped, so there was no direct failures.  This was verified
>> by running perl ptest before and after the change to see PASS vs SKIP
>> results of threaded related tests.
>>
>> NOTE: Perl officially discourges the use of threads, so this
>> functionality maybe depercated in the future [0][1]
>>
>> v2: adds the usethreads to native and nativesdk. This was tested by
>> builing postresql and rrdtool which use perl and automake.
>>
>> [0] https://perldoc.perl.org/5.34.0-RC2/threads#WARNING
>> [1] https://perldoc.perl.org/perlpolicy#discouraged
>>
>> Signed-off-by: Saul Wold <saul.wold@windriver.com>
>> ---
>>  meta/recipes-devtools/perl/perl_5.34.0.bb | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb 
>> b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> index a6ae80f07e1..e4bcfe3ce69 100644
>> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> @@ -53,6 +53,7 @@ do_configure:class-target() {
>>      ./configure --prefix=${prefix} --libdir=${libdir} \
>>      --target=${TARGET_SYS} \
>>      -Duseshrplib \
>> +    -Dusethreads \
>>      -Dsoname=libperl.so.5 \
>>      -Dvendorprefix=${prefix} \
>>      -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
>> @@ -80,6 +81,7 @@ do_configure:class-nativesdk() {
>>      ./configure --prefix=${prefix} \
>>      --target=${TARGET_SYS} \
>>      -Duseshrplib \
>> +    -Dusethreads \
>>      -Dsoname=libperl.so.5 \
>>      -Dvendorprefix=${prefix} \
>>      -Darchlibexp=${STAGING_LIBDIR}/perl5/${PV}/${TARGET_ARCH}-linux \
>> @@ -94,6 +96,7 @@ do_configure:class-native() {
>>      ./configure --prefix=${prefix} \
>>      -Dbin=${bindir}/perl-native \
>>      -Duseshrplib \
>> +    -Dusethreads \
>>      -Dsoname=libperl.so.5 \
>>      -Dvendorprefix=${prefix} \
>>      -Ui_xlocale \
>
> This patch seems to break perl-native with musl:

It seems like it is persistent and it can be workaround-ed with a cleansstate. the way to reproduce (if anyone is interested) is to:
0. I've only tested it with musl so it might be musl specific
1. cleansstate perl-native
2. build without this patch - reverted
3. build with this patch

Andrei

