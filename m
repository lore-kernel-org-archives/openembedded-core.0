Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E12C433EF
	for <webhook@archiver.kernel.org>; Thu,  6 Jan 2022 13:57:16 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by mx.groups.io with SMTP id smtpd.web12.8657.1641477435383062998
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jan 2022 05:57:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm3 header.b=JR1pG7g8;
 spf=pass (domain: gherzan.com, ip: 64.147.123.21,
 mailfrom: andrei@gherzan.com)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 6815B3200E60;
	Thu,  6 Jan 2022 08:57:14 -0500 (EST)
Received: from imap41 ([10.202.2.91])
  by compute4.internal (MEProxy); Thu, 06 Jan 2022 08:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	mime-version:message-id:in-reply-to:references:date:from:to:cc
	:subject:content-type; s=fm3; bh=uiR5GIqgfvez6Iw4Qm4SGLlj6geDQFL
	c/O1s7c4TccI=; b=JR1pG7g8B0NzfMD8QyI/p3MhHVsnv02JTwsKbPrrJAAtGyB
	N8TliUaf4piBf7Sc1lyrJBCIngE/1WpfiBXp9znXWCawTVAGsDRtwEH3v0HYIV/5
	V8L4K7F81HvBsnf1yihi1IHtS6sqb/grxx/tlGD/WVJSsEOD6nvAHrK7wPxhNajT
	QWZGnfOcsI4eWzU5TWrhCQLTp2DZboWs1yX+zTLVTe67BKt8GPLepcH2Ei35MRKQ
	e/5PoaCoih4WwNL6pd1H/5jfhN0Zrix5WR2ekBKK3QRKWUSd2BlE0c+PFm/tlLzt
	tPw0ABb1EWob9hrk1LG++UV6b0HCQ7DVhFe19AQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=uiR5GI
	qgfvez6Iw4Qm4SGLlj6geDQFLc/O1s7c4TccI=; b=JawU+pEbbiWiXJzhT6SsaK
	QMKLvz9FyN9gYEUjvdb9keucAVC826+fgMQi00KgWrKlfDENo/P5dWXJYELuDBuE
	cIDOGAECRyhW87/EspUmyYY5gppNrOg5ui1gb4sU4GGV3OHFM3eHBCQMuNzK+VH2
	2H3BTmsNi+wjrfTKF3bTeyQO9T5qLtbfXzMH7tGgznBXn5pPbCWXL/26wHBY+xGy
	Arc3Ke3rIsKuZc//lnqGUaVZnUH1IpASJGh0rKBsJcd7WIgWU4aIu2EiekJbF48T
	IcPrkf7q3Guwg/+QogWEL/PJ6q6Ah4/erMUo1SnATG3TX4bG1XLRDPhD2gp01Xcw
	==
X-ME-Sender: <xms:OfXWYb1ts1GMLu0EftoISnDL4suzFcVlDxBNXfsILobNkTQJy6IhHw>
    <xme:OfXWYaGjL1YkB6DthRdEi4MppD6nK03yyhjy1KFZATyNUmsl18vgC9zsHEv3MXIAr
    1tKXMb8hP-kEPfHlmA>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvuddrudefledgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvihcuifhhvghriigrnhdfuceorghnughrvghisehghhgvrhiirghnrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpefgheegtedtgfdtieefheekkefffedtvdfggedtvdeffeelgedv
    geeufeeutddvfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrnhgurhgvihesghhhvghriigrnhdrtghomh
X-ME-Proxy: <xmx:OfXWYb6pF-19onoYXHWRRXvBReTebbbdTAskn68phchUM1ZoJm2jNg>
    <xmx:OfXWYQ1mn7knSUVkoSesseCIdP98sOZz59fDy1bLsB89wIS4HZh8Ug>
    <xmx:OfXWYeHlzdRfsXMJQl3xH8XzE0Io_8cUESPilLqDcMksPoJwjtCfoQ>
    <xmx:OfXWYQNGJtyDRRuzHzk86ZEDKnI-AmthJe9Zc20Xvz3JR8qFXR5uLw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5493C3C0821; Thu,  6 Jan 2022 08:57:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4526-gbc24f4957e-fm-20220105.001-gbc24f495
Mime-Version: 1.0
Message-Id: <75e55dfd-3505-483b-8aaf-81249056d03e@www.fastmail.com>
In-Reply-To: 
 <CAMKF1soJgvom8__9L3C3qXwWUh2owFQTCb=ZTQXZXuLfi2PjaQ@mail.gmail.com>
References: <20211223122551.537927-1-andrei@gherzan.com>
 <CAMKF1soJgvom8__9L3C3qXwWUh2owFQTCb=ZTQXZXuLfi2PjaQ@mail.gmail.com>
Date: Thu, 06 Jan 2022 13:56:53 +0000
From: "Andrei Gherzan" <andrei@gherzan.com>
To: "Khem Raj" <raj.khem@gmail.com>
Cc: openembedded <openembedded-core@lists.openembedded.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bernhard.rosenkraenzer.ext@huawei.com>,
 "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [OE-core] [PATCH] gcc: Fix compile of gcc plugins
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jan 2022 13:57:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160230

On Fri, 24 Dec 2021, at 05:50, Khem Raj wrote:
> On Thu, Dec 23, 2021 at 4:26 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>>
>> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>>
>> Without this, compiling gcc plugins will fail with an error similar to:
>> [...]
>> fatal error: ./config/i386/linux64.h: No such file or directory
>> [...]
>>
>> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> ---
>>  meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 +
>>  .../0001-Fix-install-path-of-linux64.h.patch  | 33 +++++++++++++++++++
>>  2 files changed, 34 insertions(+)
>>  create mode 100644 meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
>> index e352c958de..f07a5be507 100644
>> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
>> @@ -59,6 +59,7 @@ SRC_URI = "\
>>             file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
>>             file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
>>             file://0006-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
>> +           file://0001-Fix-install-path-of-linux64.h.patch \
>>             file://0001-CVE-2021-35465.patch \
>>             file://0002-CVE-2021-35465.patch \
>>             file://0003-CVE-2021-35465.patch \
>> diff --git a/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch b/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
>> new file mode 100644
>> index 0000000000..55f78eaa0b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc/0001-Fix-install-path-of-linux64.h.patch
>> @@ -0,0 +1,33 @@
>> +From 58211c7ceb0510b2a11a7f1da3c7fa968c658749 Mon Sep 17 00:00:00 2001
>> +From: Andrei Gherzan <andrei.gherzan@huawei.com>
>> +Date: Wed, 22 Dec 2021 12:49:25 +0100
>> +Subject: [PATCH] Fix install path of linux64.h
>> +
>> +We add linux64.h to tm includes[1] as a relative path to B. This patch
>> +adapts the install path of linux64.h to match the include in tm.h.
>> +
>> +[1] 0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch
>> +
>> +Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
>> +
>> +Upstream-Status: Inappropriate [configuration]
>> +---
>> + gcc/Makefile.in | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/gcc/Makefile.in b/gcc/Makefile.in
>> +index 9b17d120a..d175ec4e3 100644
>> +--- a/gcc/Makefile.in
>> ++++ b/gcc/Makefile.in
>> +@@ -3693,6 +3693,8 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
>> +         "$(srcdir)"/config/* | "$(srcdir)"/common/config/* \
>> +         | "$(srcdir)"/c-family/* | "$(srcdir)"/*.def ) \
>> +           base=`echo "$$path" | sed -e "s|$$srcdirstrip/||"`;; \
>> ++        ./* ) \
>> ++          base=`dirname $$path`;;\
>
> this needs better explaining, and I have a hunch that it could be a
> broad brush too,

The initial fix was to "case it" on the specific header file but I reckon this will be useful for other ./* header that might be added in the future.

I'm going to explain it more in git log and also make it specific to the header.

Andrei

