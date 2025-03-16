Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D98C28B30
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 17:39:03 +0000 (UTC)
Received: from cockroach.ash.relay.mailchannels.net (cockroach.ash.relay.mailchannels.net [23.83.222.37])
 by mx.groups.io with SMTP id smtpd.web11.33614.1742146741470396560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 10:39:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=EdWPLeiC;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.37, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4B461163C8B;
	Sun, 16 Mar 2025 17:39:00 +0000 (UTC)
Received: from fr-int-smtpout6.hostinger.io (100-117-227-70.trex-nlb.outbound.svc.cluster.local [100.117.227.70])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 4FB2F1639C3;
	Sun, 16 Mar 2025 17:38:59 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1742146739; a=rsa-sha256;
	cv=none;
	b=FxmJb1a0dYpqfy9NECO2gLi0xUu9DNnRt5yuesTDplzFz4b1fiUL/43nOpAFXKhtjgTaPT
	qclYi4fQqG1hWmHVfnBvg6SPtDHmxVHb2BvnzuN59aeEuN+C2BRx+8sJqGqDVrfDEoIvOz
	19uwoU+fFx8tpfaUTitLnydBBwyXTSccfKztHgR0b+kuXR7Wq7+qbhxYkZICeChR9t89zQ
	Ec77zxuZUO/pu8QA3i4gPWw4Y0bx3euLDxBt2eg90WGjiieyK+wkMhKk9rQkh5OhPwWfCn
	QzTJF88XI43Xg1Nmskn8Ko7U7psINd47jDSniaZI+YoG8Gz6vY51SuruIDw/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1742146739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=uiygytNg1msNxgzEGP+y7Vran1lWFBrXl0ORntiPQrY=;
	b=icYpT2oNHwKHxWaeSAElaF3x5eihbNfIa6e8z84yf8KWui7gBLwsrOEtZl124xB/28mCHI
	0kFlvQ0inoaXpwtThGI4/Op8+X1gFnKSGPj4CzaqjfjR5ZmM4wYoTWpXikX9QFKTJX9DtV
	dGlT0Yq+4M07OeWu70aIChfhFCXe5Sq4bH9mb9hWfYfmVhAOTlaznf7yG0uzEsyIRYO2Rn
	giJ80i+V62V0Ph21RWWs59bZIq5VzXOpi+R5JjBEGkiXlQUYWSRxQDETrDgrEgoZqEOrPo
	65BKWyhnPbeiC6VsyTf/yFw10iyqNz91XL+U0m+FkajeQeZgIUDMLaxp2jA0Tg==
ARC-Authentication-Results: i=1;
	rspamd-5bd7b8dc7d-9559d;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Shoe-Invention: 69b1269b4749c2a1_1742146740128_198717090
X-MC-Loop-Signature: 1742146740128:3921124553
X-MC-Ingress-Time: 1742146740128
Received: from fr-int-smtpout6.hostinger.io (fr-int-smtpout6.hostinger.io
 [89.116.146.60])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.227.70 (trex/7.0.2);
	Sun, 16 Mar 2025 17:39:00 +0000
Received: from [IPV6:2001:861:4448:6b00:d8b:d839:ca77:7f35] (unknown [IPv6:2001:861:4448:6b00:d8b:d839:ca77:7f35])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZG51q6rFczFwZQm;
	Sun, 16 Mar 2025 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1742146737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uiygytNg1msNxgzEGP+y7Vran1lWFBrXl0ORntiPQrY=;
	b=EdWPLeiCBZ5mORR6shu90La7snDPK5YuBeoIFuzSgUAjtp7Oh3WAsWA159+sUi0lcljxsV
	uvxCYjST3Hm8wVm9a/mmt5qB1OiabjipIlN/825RiIodHZKJgHYTnwF92LldSQDjY+UWQP
	6PE1rh/lyCIajM1ndIkzPFGJ+7dELlSLZVL+J3Rg/kaWwB4E1dI1KgZlRXHhCHMv+sc4vQ
	nMFyJLqtpHuIIopu1qDK/rhaJ735+2dRrP4/a2WwH4A5usvodTj5/GLoggbHt0t2O04zrk
	nF9tANQCq0XAhDFZaYuZSm6REqaZVDv/OFuUCsji7WWlm1ZL2OPUFiNocf/CFw==
Message-ID: <843f119c-a217-48d2-8182-dd718af00c98@rootcommit.com>
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
 <182B6A0A5335D3D3.31525@lists.openembedded.org>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <182B6A0A5335D3D3.31525@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Sun, 16 Mar 2025 17:38:55 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=e81USrp/ c=1 sm=1 tr=0 ts=67d70cb1 a=aab5Yx/FXJvbV0o74zr4eA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=L2IpWlmwAAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=84qgE9kpd_Dv4H5cekoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=mKdVOVKpnDYA:10 a=nq_9OBEE9ooA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=yxSZtuE-OvTTNxukw10G:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-CM-Envelope: MS4xfKyv2/A43QhZ6bNpqXSkzx1++vcu8EMXIrviKc0fOEP35dRkcS/z7GQAFx4OSW4sZYLaNBlQcC0/YQfth+aQiykKsfXq6znuHN2/ef67/mweO/wFBXgh R+BzAFAlB/95E0VNpEdo6T7HEDYTNvUc/lZ9BkuTJU34dFqSJ5zSS6Q5W4AYbNSsQTvNu0/dIrkeofVfEmq/dpQcCb7lFVe24qJsiqNo4TcqacQLnSB/jnkZ gTtDNBtz8sFZTQQdm5K10Tv26+BeA5ycAnM5YOlRo6NRW8YL6AAyBNpKRhd+BlWmjuyuW+HmHfCQkg16+18a7p0BQ5RXG334fFPB64tG/rcO5l6A1/AQcIYN +jBc+o2qtLxfS+Uunmb7ioXfGotnobXziEL8k36E6I9jmYd9JiWvMtnMo6EMHQto3MveaWtV2PNL7pVreeTvULViAwuGrQN4+AFW6clCRQTM35JF580=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 17:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213051

Greetings,

On 3/10/25 11:24, Michael Opdenacker via lists.openembedded.org wrote:
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
>
>>
>> Also, whilst we=E2=80=99re here=E2=80=A6
>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ac_cv_prog_NASM=3D"=E2=80=9D \
>> The nasm code was removed in 1.4.2, so you can delete this line.
>
> Great, will do it too.


I have a patch for upstream, but even though the documentation gets=20
generated, there are still issues in it:
https://lists.xiph.org/pipermail/flac-dev/2025-March/006705.html

Shall I submit a new version of the recipe for 1.5.0 to allow people to=20
test and use it, even if there are remaining issues in the docs?
Cheers
Michael.

--=20
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


