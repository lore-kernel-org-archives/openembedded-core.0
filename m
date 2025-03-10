Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1F5C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 10:24:36 +0000 (UTC)
Received: from cornsilk.maple.relay.mailchannels.net (cornsilk.maple.relay.mailchannels.net [23.83.214.40])
 by mx.groups.io with SMTP id smtpd.web10.34478.1741602273104557384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 03:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=LM8gKQyj;
 spf=pass (domain: rootcommit.com, ip: 23.83.214.40, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 00E171A3EEC;
	Mon, 10 Mar 2025 10:24:32 +0000 (UTC)
Received: from fr-int-smtpout1.hostinger.io (trex-1.trex.outbound.svc.cluster.local [100.115.211.97])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 0F23B1A216C;
	Mon, 10 Mar 2025 10:24:30 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1741602271; a=rsa-sha256;
	cv=none;
	b=f4t3Z0oNxXg0RQQkKZSS3DikI3nm6+EUFsQSB/CLGtLyuwYepyqRJPOrbINKTQh/ejkHa0
	EIEwq1FZVirL6vuGQa2HrbaIgntYV9CFyPqUn3bW3DwSNYqMaY/hk/lYESUpdFj4FLdFHo
	MaGFBwkNX768vHzMlOtPB3oaOo2C0Zv6tBnqATFRXglJfdbF/iEbSjvcFX1wsq58q04moS
	w4eiiR1wJg72AtVBXyM0aBY93diVTkgLEhWPjbA78CvSAfjR/CmPKPYPmH+dheb2pOu/MQ
	29bl4xK13/j9QXvTss4jzQYy8UeXdgXlSSq0V0VeSHp5VUPkPz5IkDzVVuMVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1741602271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=mQFhgSxpZBvD27EMkm+EfcK1grmStlIoCAcXw47+INE=;
	b=UzDpCJg7cY8hxsMhko08Ax/Udc0gSwh1qZo6H41b1rHWitM2F9DG3uCHj5r0hNgBwQ4/jb
	dA4nuL7ZwRJjdkVgDTRh3VmG9c4q0cazmedTCkV4XoHPCTXjZHp6HvjT2u+Eop5j0d9ocO
	LM6dR4u9DO8c9ZzHuuve94vZX4JcnhgkmR+kHYJr8xomWWAhi5SKXqAadi48KhNrozYPTl
	WnC/Nx/djlC6vmqVdeOZiQ7RZ11alFOzJ5FcuxTRvRci+1b77zid2duDKt9fbCwfFNYuX/
	RZ0YHQlp92Ba6VkxGQi3sRdW0LO3O/2yibwSM/D+uXrlcH6XniW7kdzTw1IIig==
ARC-Authentication-Results: i=1;
	rspamd-59568bb4b4-q52xb;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Scare-Scare: 444668ae4a90f4af_1741602271895_403412269
X-MC-Loop-Signature: 1741602271895:4226881159
X-MC-Ingress-Time: 1741602271895
Received: from fr-int-smtpout1.hostinger.io (fr-int-smtpout1.hostinger.io
 [89.116.146.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.115.211.97 (trex/7.0.2);
	Mon, 10 Mar 2025 10:24:31 +0000
Received: from [IPV6:2001:861:4448:6b00:3a75:5227:7eed:3138] (unknown [IPv6:2001:861:4448:6b00:3a75:5227:7eed:3138])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZBCgJ4vhDzKfMXj;
	Mon, 10 Mar 2025 10:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1741602269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQFhgSxpZBvD27EMkm+EfcK1grmStlIoCAcXw47+INE=;
	b=LM8gKQyjfxtU58y60XDNYbPc06mYvgDLI5VhSPciSyoe4otCZht6H46UgrWWWKz1RzvuQs
	ZAytaoeMA48jxmCfaQslsNJStRMhsoUOsMHTV5zTPL6cbdHZ3Elsp10HPS85BZd2fa0fpc
	3eGuAWw15/qNfgUfX8jDsrjGg7l/qC0qgofNGHfzcNOLuVCW4UiI5GOtYShYXqKqxTgwyK
	o8sUmJwXMePJuHmYW9RRmYiWswkg3y+5+cwHsci2bfp258nrgJ6PF3BR2UGX9O+njYQbsY
	ZAiAZfGimueKaixG0skJWJEZg8LJ67vK0NSEi082fiSVUzhJQCwiylJOKh4xEQ==
Message-ID: <ce6a8888-172a-4e24-bb26-1ab47b955b72@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Peter Marko <peter.marko@siemens.com>
Subject: Re: [OE-core] [PATCH] flac: upgrade 1.4.3 -> 1.5.0
To: Ross Burton <Ross.Burton@arm.com>
References: <20250227103351.1990659-1-michael.opdenacker@rootcommit.com>
 <11B25FEA-816E-4B3D-A7F4-EA47A5359446@arm.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <11B25FEA-816E-4B3D-A7F4-EA47A5359446@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Mon, 10 Mar 2025 10:24:28 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=e81USrp/ c=1 sm=1 tr=0 ts=67cebddd a=tHddl7t1qHHUIbBKyuZYGA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=L2IpWlmwAAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=G32k1Ubgdz7SvyH9BOcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mKdVOVKpnDYA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=yxSZtuE-OvTTNxukw10G:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-CM-Envelope: MS4xfMxppjQbTPvtIr3AU1dYCpebEVzvV11B6K18PAi0VtC6u6M11/82q/g/WmhFBYH44u+B6tUjuqukFnDahczE2SVmZBQGlSaxLEmbYZf2Ik/o6a5syABa 3PMYHSVm4RZBK8wJiUkXEg9erXYR2HYdYFQFbDfTSJf6LRSH16ZJNfmy4Qj5fvnhA4ofC8YleLZl3i0iuKRfaJh2EflNskoXrrAjXDfuvkuu3jFB0AgHrqD+ itkKqmt2iycA81W+mkFbC248W2E390qr2/LLzhweeKlI3W7XIjjcTt2tDT2C9BgdLKGB7qmcEhyu31Rcu2VXep6oiBoBfR+gi/4UezAM7lGw9ly3TTPhTOTz wLxPv205iT3QacsBkKuwh9B6UZTQWMLtoz1on7VFezUHDH8HubRZOZJoBdkIiE0AjKFPpMjuEPjrkwJf+7fiCm4q9evhCvNe8ROc4Fo8w7f0wdy67Lg=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 10:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212508

Hi Ross

Thanks for having a look at my patch and finding out why the=20
documentation is broken.

On 3/3/25 19:09, Ross Burton wrote:
> On 27 Feb 2025, at 10:34, Michael Opdenacker via lists.openembedded.org=
 <michael.opdenacker=3Drootcommit.com@lists.openembedded.org> wrote:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>
>> License-Update: GFDL 1.2 -> 1.3, copyright years update
>>
>> Remove the do_install additional code fixing absolute paths
>> in doc files. Such files are no longer created on 1.5.0.
> I asked myself why these files are no longer created, and luckily the a=
utobuilder had already done the build and comparison for me:
>
> https://git.yoctoproject.org/poky-buildhistory/diff/packages/cortexa15t=
2hf-neon-poky-linux-gnueabi/flac/flac-doc/latest?h=3Dpoky/master-next/qem=
uarm-alt&id=3D6c8904bceaa1987edffc16823c12b43e86384dea
>
> -PKGSIZE =3D 5362415
> +PKGSIZE =3D 87538
>
> The files are no longer created because none of the documentation is in=
stalled anymore.
>
> This turns out to be a bug in the configure.ac script:
>
> https://lists.xiph.org/pipermail/flac-dev/2025-February/006698.html
>
> So I suggest we apply that fix and continue installing the documentatio=
n.


Good catch, I'll take care of it.

>
> Also, whilst we=E2=80=99re here=E2=80=A6
>
>>                 ac_cv_prog_NASM=3D"=E2=80=9D \
> The nasm code was removed in 1.4.2, so you can delete this line.

Great, will do it too.
More soon...
Thanks again!
Michael.

--=20
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


