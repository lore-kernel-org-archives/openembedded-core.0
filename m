Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854ECC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 21:40:59 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web12.734.1643924455887990986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 13:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigma-chemnitz.de header.s=v2012061000 header.b=OwjZZiC1;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67,
 mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-3.intern.sigma-chemnitz.de
 (mail-mta-3.intern.sigma-chemnitz.de [192.168.12.71])
	by mail-out-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTPS id
 213LeoK8109863
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 3 Feb 2022 22:40:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1643924450;
	bh=vudRaLW/kUhUq284m1XEDsh1ViCClLFOlshHWEZhiv4=; l=1376;
	h=From:To:Cc:Subject:References:Date:In-Reply-To;
	b=OwjZZiC179N1QS23RdT4uU0dNNmWxEAzOUWmfmm4lqyiuq1lyCDp/P5y8MAk1+cp2
	 1khuAp+g0WY3h3zj3eOUUPk1s5hKQDZxeqiC8nKdTLjYy1WLV0FSoXgD85RWpGzfBn
	 7Cq7jRd8sDsJZbb2RD/XWPHOLl40tpEUeOqxqWSg=
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local
 [192.168.16.32])
	by mail-mta-3.intern.sigma-chemnitz.de (8.16.1/8.16.1) with ESMTP id
 213Lehtu330731
	for <openembedded-core@lists.openembedded.org> from
 enrico.scholz@sigma-chemnitz.de; Thu, 3 Feb 2022 22:40:44 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ( [192.168.12.73]) by
 reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 5FDDFB55F19; Thu, 3 Feb 2022 22:40:42 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
 (ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id
 213LegqP107519
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 3 Feb 2022 22:40:42 +0100
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
 4.94.2)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1nFjqM-00CHT7-2y; Thu, 03 Feb 2022 22:40:42 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] gcc: enable zstd compression of LTO bytecode
References: <20220203172619.1299363-1-enrico.scholz@sigma-chemnitz.de>
	<CAMKF1sqp=KjKrgVb-FCLr29UTmxaGQ4_w=qrOU+6wvdR5NA_oQ@mail.gmail.com>
Date: Thu, 03 Feb 2022 22:40:42 +0100
In-Reply-To: 
 <CAMKF1sqp=KjKrgVb-FCLr29UTmxaGQ4_w=qrOU+6wvdR5NA_oQ@mail.gmail.com>
	(Khem Raj's message of "Thu, 3 Feb 2022 11:23:41 -0800")
Message-ID: <lyczk37hnp.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 21:40:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161320

Khem Raj <raj.khem@gmail.com> writes:

>> gcc-10+ supports zstd compression of LTO bytecode.  Install the
>> corresponding package to enable this feature in a deterministic way.
>>
>> NOTE: previously built LTO object files (without this compression)
>> must be regenerated; gcc will fail else with
>>
>>   | lto1: internal compiler error: original not compressed with zstd
>>
>> in this case.
>>
>> NOTE: it seems to be possible that zstd support is enabled non
>> deterministically (perhaps by host system pollution).
>>
>> I had the problem that the SDK gcc was built with zstd while the
>> cross gcc was built without it.  Libraries (built by cross gcc and
>> uncompressed hence) could not be used with the SDK gcc.
>
> this means regenerating entire shared state isnt it ?

yes (at least when lto.inc is used (which is *not* by default)).  When a
bad sstate really matters for 'master', perhaps there can be wait for a
change in glibc or so before applying this patch.

Or do you think that adding a DISTRO_FEATURE like 'lto-zstd' would make
sense?  When this flag is missing, '--without-zstd' must be added to
EXTRA_OECONF.  Also some early [vardeps] must be set (where?) to avoid
the sstate problem.

Globally enabling 'zstd' appears easier because drawbacks (costs for
compression + decompression) should be negligible for zstd.



Enrico

