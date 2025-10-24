Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFBBCCD1A5
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 07:13:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.3885.1761289996290329637
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 00:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xyF494xG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9B8E91A1637
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 07:13:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 661CF60703;
	Fri, 24 Oct 2025 07:13:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2460102F244A;
	Fri, 24 Oct 2025 09:13:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761289993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j+C4SHkMuu/vaf4Ro1dnqoyiJGqqWXxH9TN5cYfNYxs=;
	b=xyF494xG6Kyj+hd5Jc784N4i87YvyQFhlg3hwZr0hWYBfEL//KJ9J3JX90jSL+e8hnhYB3
	Y7t2uYsFLv+axAMULyXHegJMUrUchhkdIeh4d7W7/TyUY8jvWjtzow49xyd+O/+so9N0u3
	1jxpAURmHIxdauRR3F5fCezAo43OlOCVFWb+WHeDqq7WPCJ3edqL12fiDHHOcYiCQjuPvg
	rbfw5QsjSMrwM9+Fc/doy16DMpqOgV5DLlE+9apd1xl8MKcOLVD4LJNoJCEiVAMzQnJKsj
	+yM81Yi/XhZQQ2SmUIMy2/f/PL8UstpzwiKofwtr0cImyNX3Po3YtM56ziSj1Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Oct 2025 09:13:10 +0200
Message-Id: <DDQD6ZQW6X13.2QOQXBOQK8M2S@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/3] selftest/bblayers: Refactor JSON schema
 validation
Cc: "Patches and discussions about the oe-core layer"
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <yoann.congal@smile.fr>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251023072513.280477-1-yoann.congal@smile.fr>
 <20251023072513.280477-2-yoann.congal@smile.fr>
 <DDQCC5ASH6VD.3LTKDQYDDCFKP@bootlin.com>
 <CAMSfU+4RASuj7X43ped+ZtiLVM_gKsehh9t2WSksNDuDbBp1SA@mail.gmail.com>
In-Reply-To: <CAMSfU+4RASuj7X43ped+ZtiLVM_gKsehh9t2WSksNDuDbBp1SA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 07:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225285

On Fri Oct 24, 2025 at 8:47 AM CEST, Yoann Congal via lists.openembedded.or=
g wrote:
> Le ven. 24 oct. 2025 =C3=A0 08:32, Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> a =C3=A9crit :
>
> Yes I did in v1.
>
>
>> 2025-10-23 14:30:16,772 - oe-selftest - INFO -
>> testtools.testresult.real._StringException: Traceback (most recent call
>> last):
>>   File
>> "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openembedde=
d-core/meta/lib/oeqa/selftest/cases/bblayers.py",
>> line 175, in test_bitbakelayers_setup
>>     self.validate_layersjson(jsonfile)
>>     ^^^^^^^^^^^^^^^^^^^^^^^^
>> AttributeError: 'BitbakeLayers' object has no attribute
>> 'validate_layersjson'
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2499
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2589
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/2737
>>
>> I had a quick look at the v2 and I believe we have the same issue.
>>
>
> I think I fixed that in v2 by keeping validate_layersjson() but changing =
it
> to use the refactored function. Can you test this?
>

Sure, I will test it in my next run!

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


