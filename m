Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51595C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 08:51:01 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.34783.1742806256138244764
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 01:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SsMuD3fP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O8NjDI026040
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 08:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McAXNnL4CzaOXHQTkFwaSdH7vAiaxkCjbXh75wbzwjk=; b=SsMuD3fPJhDLT2lT
	tkQ5vo0r70VIjJhYVcSFyneboBJ4zw1a/R/oC/YGz8wpKxkKeSewNmDIea0TSDme
	8lNR3Re4HTeS3EvTBKGqQxiyC8pUPu2jklVdVATbtA2A1j9sVVI5mDF0181nIGTB
	EcwpeOknh4zVVp7+txHiYUvPwviWbUa2/r4wklITQ+H+JwCBmg+F+ZXOOWSkBI19
	MZULdCVQCnqc4cJEsROpVbp+EUrX58E7PPDROFH7yEE3f3y3O0MwN7DRjJC9dJLM
	zwbMCh4GNvKSfuKJlLH4jHPb1wljLVKQzpBQdEAuj6sBOeXmw2jdnob95F4SqD4t
	nPTnJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hjwhkx2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 08:50:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8f9450b19so80314556d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 01:50:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742806254; x=1743411054;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McAXNnL4CzaOXHQTkFwaSdH7vAiaxkCjbXh75wbzwjk=;
        b=cW/SBbQKzu2GEycNK8eP2bXaKEBr8G6xiyHVFjByAu+YFCuJwHz6HtuVkDuRAJc1Gw
         6kmpVQKUDQteIbe5wUEKpbmTmWNRGX3uKD45qjOxFFaZgHKKRbnO741gnx8tCi/NoLPb
         8PhshxQFBqYxJClB8nLmUJrM1fTRYdAZ43ibsmCe7Jt8qR5rp8XAM0IAe/RAD9PH2IhV
         FGaHmnGJWWZoJuA1PZxdBh4KsZf4H11K80RAzOTQ+Ucqg1gtw3CPpDv1II/bBDyCGOpU
         hzrdjshlD2Z/WqSdgpNVl3gqHHWqdJPV+GbqS+5W76pB14g47gCO1Fg58wnwwiY2R8++
         U/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCW5jRwboxt7iepLF9dO9kEVXx/aAjDtJ1RDqzVWNY2ronl+La8xo7Gw6J7+DCuSBZGvzefO8uvpde6QC1aQk9F3AQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywale0U98sjp7aH4zBGko8nL+fqvQuClZWA3JYFSHlC1Jl77p2q
	DKcAyUhrNNwp0qzKc2OqYj3CLudAVUVhPMBg1DcLhGAcvB/2+RA3HltHAykzAxnh2CXZhA9Tz/a
	DonMKxXEJzYtYOL8IOl+R3StYu6fTBue2b00ftulRMfDdx/jeP968+LLCkp/VSa1Ci1iteYFc7d
	Kk+/I=
X-Gm-Gg: ASbGncupH+PF1MHBcxmuRo8UcJ4isquKGfeGZZYx5mw6C3EqwuK6ImjaDUfhF4MClSC
	hR6PVSNhsbNxubNEDoXU9b4W1vM8+/BQ/lozt5VANCR+VLuaWCbxkpR9ozfgvwjHpzO9UgzCwqN
	EPu2DyITRX94/aPL5WoDmusG1gFCnoMr75C2sOgtleIcLYfeFztvfxFb9jNr0Nc2+kOSxGwP6Ch
	a7IB4HTWsFOcu4K6tuoQhlajeCeuu2U5kEIk4TSFKijQe1wg5q1s618p4poXTZdqwY5lSN8Jlxz
	dPE7OQodAR8Az++Q7AZv5cgPQRxo6JiNqskM1a1mlg==
X-Received: by 2002:ad4:5d43:0:b0:6e8:f120:80ce with SMTP id 6a1803df08f44-6eb34a4ae02mr271951076d6.22.1742806253748;
        Mon, 24 Mar 2025 01:50:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl8ABqWiCO49ACyGrTJZodePOPbDtr35QG5kx+Z71SMIkLr9qqcK3Nkbw9n4vrKXDhJaR7KA==
X-Received: by 2002:ad4:5d43:0:b0:6e8:f120:80ce with SMTP id 6a1803df08f44-6eb34a4ae02mr271950786d6.22.1742806253237;
        Mon, 24 Mar 2025 01:50:53 -0700 (PDT)
Received: from smtpclient.apple ([82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbd4672sm628946866b.127.2025.03.24.01.50.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:50:52 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [OE-core] [PATCH v2 01/11] systemd: enable efi support if in
 MACHINE_FEATURES too
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <Z-EJ7EqalYachfbb@nuoska>
Date: Mon, 24 Mar 2025 09:50:42 +0100
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C27BE692-BD0E-4928-B510-02EA5FF51991@oss.qualcomm.com>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
 <20250321132517.670372-2-mikko.rapeli@linaro.org>
 <d0f4460cc8338769479b0efdfbf4ed68b491fae1.camel@linuxfoundation.org>
 <Z-EJ7EqalYachfbb@nuoska>
To: mikko.rapeli@linaro.org
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Authority-Analysis: v=2.4 cv=H+jbw/Yi c=1 sm=1 tr=0 ts=67e11cef cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=KKAkSRfTAAAA:8 a=KkT_Y-rPAuEINyv7UYsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8fzRujtNlkRrTgwka_lpwVwnPCwG2RVk
X-Proofpoint-ORIG-GUID: 8fzRujtNlkRrTgwka_lpwVwnPCwG2RVk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 08:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213516



> Op 24 mrt 2025, om 08:29 heeft Mikko Rapeli via lists.openembedded.org =
<mikko.rapeli=3Dlinaro.org@lists.openembedded.org> het volgende =
geschreven:
>=20
> Hi,
>=20
> On Sun, Mar 23, 2025 at 10:53:59AM +0000, Richard Purdie wrote:
>> On Fri, 2025-03-21 at 15:25 +0200, Mikko Rapeli via =
lists.openembedded.org wrote:
>>> For example genericarm64 enables "efi" in MACHINE_FEATURES
>>> and in u-boot. Boot without "efi" in systemd works with
>>> EFI protocols but for example efivars is not mounted at
>>> all so various checks fail in userspace. Fix these by
>>> enabling "efi" support if it's in MACHINE_FEATURES.
>>> Fixes efivars mount to /sys/firmware/efi/efivars etc.
>>>=20
>>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>>> ---
>>>  meta/recipes-core/systemd/systemd_257.3.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/meta/recipes-core/systemd/systemd_257.3.bb =
b/meta/recipes-core/systemd/systemd_257.3.bb
>>> index 64fb8fe69a..9bc4532021 100644
>>> --- a/meta/recipes-core/systemd/systemd_257.3.bb
>>> +++ b/meta/recipes-core/systemd/systemd_257.3.bb
>>> @@ -69,6 +69,7 @@ PAM_PLUGINS =3D " \
>>> =20
>>>  PACKAGECONFIG ??=3D " \
>>>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi =
ldconfig pam pni-names selinux smack polkit seccomp', d)} \
>>> +    ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d)} \
>>>      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', =
'coredump elfutils', '', d)} \
>>>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', =
d)} \
>>>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', =
d)} \
>>=20
>> This makes the systemd recipe machine specific which isn't currently =
the case.
>=20
> Can we enable "efi" in DISTRO_FEATURES by default?
>=20
> That would solve the issue without checking MACHINE_FEATURES in =
systemd recipe.

If your DISTRO doesn't enable it you can either pick a more suitable =
DISTRO or send patches to fix your DISTRO. Changing OE-core wide =
defaults is the wrong thing to do.

regards,

Koen=

