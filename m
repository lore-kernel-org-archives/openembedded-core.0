Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC19C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 19:00:57 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web11.13407.1644001254606908227
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 11:00:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=QknQKCjw;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de
 (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 214J0pOs114834
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 4 Feb 2022 20:00:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1644001251;
	bh=ku5XyeugdGUXbquYOi7p+exfhXg+PZnQeGgkPnz1ykk=; l=796;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=QknQKCjw6Oatfh7p3EyKLO0Mm+apQhlX6wyqjOTtW1DBE8jqtbpNzG9AZMXSmqd5D
	 IlHWp2hBdh40oGZsJ4cE7pVBQmKDO+rGAKu3vWal86xrw0dRYv2BJt52QptBkjPSzH
	 Qt/B4o68JRafKUsx3eA9Yg8jMX4ptYxZrZ4rY8CY=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 214J0n3N153754
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Fri, 4 Feb 2022 20:00:49 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 23CCE1D6F96; Fri, 4 Feb 2022 20:00:48 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 214J0mpj115952
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 4 Feb 2022 20:00:48 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nG3p9-005hfn-Oj; Fri, 04 Feb 2022 20:00:47 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] gcc: enable zstd compression of LTO bytecode
References: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
	<daba354376a2183ff81594c226a5a4bae1cbe96e.camel@linuxfoundation.org>
Date: Fri, 04 Feb 2022 20:00:47 +0100
In-Reply-To: 
 <daba354376a2183ff81594c226a5a4bae1cbe96e.camel@linuxfoundation.org>
	(Richard Purdie's message of "Thu, 03 Feb 2022 21:59:16 +0000")
Message-ID: <ly5ypujw2o.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 19:00:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161379

Richard Purdie <richard.purdie@linuxfoundation.org> writes:

>>   | lto1: internal compiler error: original not compressed with zstd
>>
>>  DEPENDS =+ "mpfr gmp libmpc zlib flex-native"
>> -NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native"
>> +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native flex-native zstd-native"
>>  
>>  LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
>>  
>
> Should we be passing some flag to gcc explicitly to configure this
> deterministicly?

Both '--with-zstd' and '--without-zstd' make it deterministic (require
zstd.h and abort when non-existing resp. ignore it when existing).

Perhaps '--without-zstd' should be added in the hardknott and honister
branches to prevent pollution by host environment.



Enrico

