Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3DDC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 11:31:31 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.11126.1743679888348569192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 04:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SRCw0wog;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: joaomarcos.costa@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5736A43225;
	Thu,  3 Apr 2025 11:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743679886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPiYRU4tpiqdq1Jvd16pS1km5B6sfEAb7JOogxCoWjs=;
	b=SRCw0wogr/3eOQwU/rkDzZAtHZLlszkw0mBnrk8tN+FF+VpQO+80IhC45yPvZTtg92h0nC
	3+fHx5G/J4/lfovBH921ZHE5qsQhiUmLNS+68pBL9Js9JxJJuqolO3mcNaG1AYqNjAzQ4P
	7iTimkNIo8UOnjTg665kNhQXYlzaRhB3LzqOmJLIqXluEwzGOQW8zfts7ZkPgTHHQp0Ulx
	7RHODlkoS1n6LEiRP8t8lvvNotLuLImOgdz8A57ASZWBUfEC8HuLJyB9SghxXxMibEnokt
	N7ut2/emyhsR+N40Jjv4oFQGypJiEXvan+VZPpn+U2evRvyxiGZIgP2MNNB2aw==
Message-ID: <a4816fa9-091a-4fd8-962e-3cb803699395@bootlin.com>
Date: Thu, 3 Apr 2025 13:31:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap] multilib_header class: issue with custom
 multilib setup
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, Khem Raj <raj.khem@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <5746f47c-7e5d-46f5-b089-c613b7275d2b@bootlin.com>
 <6c36d9830745cb739f1dcb968d74a43395117fa1.camel@linuxfoundation.org>
 <21e0daef-2b05-4c33-afb8-3a45ebd97fbf@bootlin.com>
 <a299f47c16bcac1624099c99d29e84bc13e01d69.camel@linuxfoundation.org>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <a299f47c16bcac1624099c99d29e84bc13e01d69.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhohgjtgfgsehtkeertddtvdejnecuhfhrohhmpeflohgrohcuofgrrhgtohhsucevohhsthgruceojhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkeegfeevtdetkeevjedtffffheekveffleeuueehledvfeffgffhvedvgfeifeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemtggstgejmeguugdtfeemsgefieelmehflegtvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemtggstgejmeguugdtfeemsgefieelmehflegtvgdphhgvlhhopeglkffrggeimedvrgdtudemtggsudegmeehheeimeejrgdttdemtggstgejmeguugdtfeemsgefieelmehflegtvggnpdhmrghilhhfrhhomhepjhhorghomhgrrhgtohhsrdgtohhsthgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigf
 hhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghrrhhothessghoohhtlhhinhdrtghomhdprhgtphhtthhopehrrghjrdhkhhgvmhesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: joaomarcos.costa@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 11:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214320



On 4/3/25 13:19, Richard Purdie via lists.openembedded.org wrote:
> On Thu, 2025-04-03 at 13:06 +0200, Joao Marcos Costa wrote:
>>
>> Thanks for your reply.
>>
>> Even with the cfi suffix set correctly, the actual file raising the
>> conflict is the generated template, no the header with the suffix:
>>
>> file /usr/include/gnu/lib-names-lp64d.h conflicts between attempted
>> installs of libcfi-libc6-dev-2.37-r0.riscv64cfi and
>> libc6-dev-2.37-r0.riscv64
>>
>> In my previous mail, I should have pasted this one instead. My bad.
> 
> I tried to explain how it should work but I can't do much beyond that.
> The two generated template files should be identical.
> 
> Can you share the contents of the two header files so we can see what
> the conflict is?
> 
> Cheers,
> 
> Richard

Most certainly. Here's the standard (i.e., non-cfi) version of it:

/* This file is automatically generated.  */
#ifndef __GNU_LIB_NAMES_H
# error "Never use <gnu/lib-names-lp64d.h> directly; include 
<gnu/lib-names.h> instead."
#endif

#define LD_LINUX_RISCV64_LP64D_SO       "ld-linux-riscv64-lp64d.so.1"
#define LD_SO                           "ld-linux-riscv64-lp64d.so.1"
#define LIBANL_SO                       "libanl.so.1"
#define LIBBROKENLOCALE_SO              "libBrokenLocale.so.1"
#define LIBCRYPT_SO                     "libcrypt.so.1"
#define LIBC_MALLOC_DEBUG_SO            "libc_malloc_debug.so.0"
#define LIBC_SO                         "libc.so.6"
#define LIBDL_SO                        "libdl.so.2"
#define LIBGCC_S_SO                     "libgcc_s.so.1"
#define LIBMVEC_SO                      "libmvec.so.1"
#define LIBM_SO                         "libm.so.6"
#define LIBNSL_SO                       "libnsl.so.1"
#define LIBNSS_COMPAT_SO                "libnss_compat.so.2"
#define LIBNSS_DB_SO                    "libnss_db.so.2"
#define LIBNSS_DNS_SO                   "libnss_dns.so.2"
#define LIBNSS_FILES_SO                 "libnss_files.so.2"
#define LIBNSS_HESIOD_SO                "libnss_hesiod.so.2"
#define LIBNSS_LDAP_SO                  "libnss_ldap.so.2"
#define LIBPTHREAD_SO                   "libpthread.so.0"
#define LIBRESOLV_SO                    "libresolv.so.2"
#define LIBRT_SO                        "librt.so.1"
#define LIBTHREAD_DB_SO                 "libthread_db.so.1"
#define LIBUTIL_SO                      "libutil.so.1"

And the diff between this header and the CFI one is:

$ diff (...)image/usr/include/gnu/lib-names-lp64d.h 
(...)libcfi-glibc/2.37/image/usr/include/gnu/lib-names-lp64d.h
6,7c6,7
< #define LD_LINUX_RISCV64_LP64D_SO       "ld-linux-riscv64-lp64d.so.1"
< #define LD_SO                           "ld-linux-riscv64-lp64d.so.1"
---
 > #define LD_LINUX_RISCV64_LP64D_CFI_SO   "ld-linux-riscv64-lp64d-cfi.so.1"
 > #define LD_SO                           "ld-linux-riscv64-lp64d-cfi.so.1"


-- 
Best regards,
João Marcos Costa

