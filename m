Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8030C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 11:04:25 +0000 (UTC)
Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
 by mx.groups.io with SMTP id smtpd.web11.8508.1743159860419030399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 04:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=Dg96cZUB;
 spf=pass (domain: rootcommit.com, ip: 23.83.223.161, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C483B822C3;
	Fri, 28 Mar 2025 11:04:19 +0000 (UTC)
Received: from nl-srv-smtpout6.hostinger.io (100-119-63-97.trex-nlb.outbound.svc.cluster.local [100.119.63.97])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id C47088277B;
	Fri, 28 Mar 2025 11:04:18 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1743159859; a=rsa-sha256;
	cv=none;
	b=4/olbQhx7jX2Y/c/92dXJTdk2Cv17bVFOIOu3ZXVqp1VF1sPq/DTI9d6OhkyKld37KMESw
	7OYMBF78v0WVNI2LkZE3mDgh4i8HBK7rURNXikzdASZGQ5ZHugkXGa60H2A1sZJFZMlw+e
	MMYgQwepNd+Z0Aq4TFZWt8dBr5gf5m5N4lncQWLLgSPw3In2pw10h5s85ldawMT6kE9UkX
	vg8qLeS7kmK7HpK0XPBVd7EDx93FG/SINH2UunLaqAOc2OvQVNrNoQYz3s3qFPX7aJnHer
	DOkXx+w+FbAh5BHeJVcDHMY/ENjnxQ+MLZGVGDMgXVdU77yMtk3m/J0IJgFfbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1743159859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=j99g89cJzTwVlU8tVzx+K2uFpEH2WTDdEzNxcMpX5bs=;
	b=qR+dDM5svE/613jRMrxi660+lHlB6fltvyFOFug3mkvY/iyjImpW6ZsgqifMD9F6QO+wMQ
	bXpowLFJQU+hOFLeX96Jz583BfCFxvoMIwxd6b/ywATjaGsDff21owmfJiGLGPoLqSWNH8
	IrTVePz8OnpPReveua7DnBF62IGpz2gCcgKwaJnNf6Aw7aDdXFm73K4UP+AbZSut2pjPzz
	UI4bcxh2kHfbfS24EiGPE6HMhOWWP59dNRKnoKrEdSWo5XOlFk4kzes2CDjHVkcmaKjR5w
	nusZvMrLWjRb7ppJy4+/OBkwKOVYmDR9IJ8aCvNq6baiMual7B+dDZLjbDfx3g==
ARC-Authentication-Results: i=1;
	rspamd-5d87d7fb74-jkdst;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Shoe-Abortive: 6b34133f1f2de696_1743159859665_1865465881
X-MC-Loop-Signature: 1743159859665:3152176050
X-MC-Ingress-Time: 1743159859664
Received: from nl-srv-smtpout6.hostinger.io (nl-srv-smtpout6.hostinger.io
 [45.87.82.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.119.63.97 (trex/7.0.2);
	Fri, 28 Mar 2025 11:04:19 +0000
Received: from [IPV6:2001:861:4448:6b00:1c21:b59f:eb3:4d3c] (unknown [IPv6:2001:861:4448:6b00:1c21:b59f:eb3:4d3c])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZPHhw3Kxtz1HVJY;
	Fri, 28 Mar 2025 11:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1743159856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j99g89cJzTwVlU8tVzx+K2uFpEH2WTDdEzNxcMpX5bs=;
	b=Dg96cZUBuzn7d3ZfL1NoYrcDuD8nO3Ij3ORBzbqXWXOronmQAbZxv/0OarE61MvvyU4JQy
	AWHOA4h61nbCJqaKUbdQgVh1UqEnIcZD4tB43EfqjqNMM6BnkaDI9+CNbWea2lIVayCU66
	WxBQpjN2BjLyOjY2RaQ4f2VCgkmA/EAAA/KWbrK7mmZo4g+s2+VAYKG96WW4C3BcAowTBP
	KA7ACJRAkYf2PngoHksBIYoGdRRB5ldAoS0Pz2TLqAgjPxhb5fAU77VAxu9m2OqIggmJe+
	6GzSoTI92BrACWELitMJMTrNk8EJaiLhwvjSFY2CW5NFeu17opyE07SldZ3sJg==
Message-ID: <d9e478c6-a612-4c11-bd20-aaf340dceab3@rootcommit.com>
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
 <ce6a8888-172a-4e24-bb26-1ab47b955b72@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <ce6a8888-172a-4e24-bb26-1ab47b955b72@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Fri, 28 Mar 2025 11:04:16 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LJs0Q4W9 c=1 sm=1 tr=0 ts=67e68230 a=KRWFg0r/nrmG7veXkxU81Q==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=L2IpWlmwAAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=Jf2GfUkN9xoawMZNe5kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mKdVOVKpnDYA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=yxSZtuE-OvTTNxukw10G:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-CM-Envelope: MS4xfIPdzRVYmzIAiYOAKZT+psQnPShjdJqlsj7US7J7ldIwdVzrh1fXmDbvo8QjeRfdW/9HXlylskONYAg17H2+Zup9bjdBjhDlCqjL9kTk+S7lrOnxsTN4 F/ewpz/E3nRp+9XXgGTOO6cP6muYiWMILPJTTlqvspxJOiYHDOLmVU/C/WE05jUoQtVPpV3uWDJG3urdPhgfY86bn8fcNP2qk6jOUyr1WV/E5IjaJ7w6gOLR 8aL7OT92IN3hWTfA/IiHD567lRg695IuA27DiAKbzv38B7p3Li+78AUF3JJqCzINGR4lrcmTTnG4J+O1w9T9GqscjpDS8iQ04NYREflrP5QVJOrhKd2fy5oy mXv6oQNsH7Qv+RwYMheYmS7pudQxYnSjGRaEy3WnVcq0Qrh/RrihHqFLdBuyoZuIKYaqtU59fr/3UK7GbAXdaLfmLTsx/pCwi6eUJv8N1TdhWkt3qY0=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 11:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213831

Hi Ross

On 3/10/25 11:24, Michael Opdenacker wrote:
> Hi Ross
>
> Thanks for having a look at my patch and finding out why the=20
> documentation is broken.
>
> On 3/3/25 19:09, Ross Burton wrote:
>> On 27 Feb 2025, at 10:34, Michael Opdenacker via=20
>> lists.openembedded.org=20
>> <michael.opdenacker=3Drootcommit.com@lists.openembedded.org> wrote:
>>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>>
>>> License-Update: GFDL 1.2 -> 1.3, copyright years update
>>>
>>> Remove the do_install additional code fixing absolute paths
>>> in doc files. Such files are no longer created on 1.5.0.
>> I asked myself why these files are no longer created, and luckily the=20
>> autobuilder had already done the build and comparison for me:
>>
>> https://git.yoctoproject.org/poky-buildhistory/diff/packages/cortexa15=
t2hf-neon-poky-linux-gnueabi/flac/flac-doc/latest?h=3Dpoky/master-next/qe=
muarm-alt&id=3D6c8904bceaa1987edffc16823c12b43e86384dea=20
>>
>>
>> -PKGSIZE =3D 5362415
>> +PKGSIZE =3D 87538
>>
>> The files are no longer created because none of the documentation is=20
>> installed anymore.
>>
>> This turns out to be a bug in the configure.ac script:
>>
>> https://lists.xiph.org/pipermail/flac-dev/2025-February/006698.html
>>
>> So I suggest we apply that fix and continue installing the=20
>> documentation.
>
>
> Good catch, I'll take care of it.


Done at last. There was an issue in the fix but I eventually managed to=20
fix it.

Now that the patch has been submitted upstream, I can now fill the=20
"Upstream-Status" property :)

>
>>
>> Also, whilst we=E2=80=99re here=E2=80=A6
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ac_cv_prog_NASM=3D"=E2=80=9D \
>> The nasm code was removed in 1.4.2, so you can delete this line.

Done too.
New patch coming soon.
Thanks
Michael.

--=20
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


