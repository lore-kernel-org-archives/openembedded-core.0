Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568D9C36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 08:53:21 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.34810.1742806397683072734
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 01:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=pep0dMgL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O8O5w4003983
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 08:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0i0M/mJbk8Mfm+LZLVsOysuXUYsp4Cjp9HHRv0nEkI=; b=pep0dMgL2KxN5T0n
	AJeWiP5+e22TV21zBiWmuEsYAZYT1kJL1hEnexataFqhRsQRvWu67Gu2LbLdTPn+
	WLUvFkYjszODzhoP9VMZXHC5mJqdUQyoKfKw2qIrlGhM65oVE0iMGFuuaFNLgf/g
	qpqaqTzoK2dlVUBRAJSoNBEFIFc71wo4s/0VvyaX7J8GUKrIpxIw9O3cWsArk325
	XEpJz0HBODlQUIJiFJDj20Oxvo7BPVYzYxifdZbkmQ/POXRqttcSB6mxMqUYX2mw
	FKiQLCNriO3leJWpgFznfKlf6Pvo84K5ocWWUTiSs2Im5MdZoMLJI/6u//TPJSoF
	qu6sAA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hn9wbqqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 08:53:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e916df0d5dso68801296d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 01:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742806396; x=1743411196;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0i0M/mJbk8Mfm+LZLVsOysuXUYsp4Cjp9HHRv0nEkI=;
        b=s98VIR0MIvKeCUCcBt2GOH17Z5Zn33471puZvs/a++PY6M5Tbnt9uK7LwxQOFQrBZ1
         kecozek8Mmy6g7q+x5uynzzw73DB2emU6W3/NWhwUYTBwkwuxu+AnBnMgkL+FrEZKjn8
         ZogSySZAMDTZJ8KnMBFXOlo2tyyW20X1cD6V3CJ4OMQCH3sNhBYSwWhW/2opWJcihlFO
         JxU5tZH2nVwuMnsUt5T/gxeWAIs6vH4+WNt4t36n/Hpb2SDI/+tXkyyhwOUNFob4GakI
         XdhcLOFF1XWnogoAmHxNfb6JXMTWjmEKY8lJ1AM35WF1VzC1WCa67ZMMV7bVxxRJ0FiR
         98Og==
X-Forwarded-Encrypted: i=1; AJvYcCU00yBk6FsftfouMx9mnFI0U+Je2Xe3ax0lmK5BYFO3uCxAtMXd6LzQQbkGJg08kW/sOtx5Pnm6bX0v3eksfdopDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyd8e05fc42aIsN1aUZrcrGaqmPx0ULAvvg8b2DHwmFj3bgg5xS
	fqG/jcedEt6Zmv1KrJje2o4AhgbTxhiv5PTZQ6uCKsWvzORNNTVsv90SE2hXs80TC1dKSRbMi4q
	Iiw5EhXKcggKG09MK3wFlWaa2j8xFzravq4aCd+AePdj66u5nomwINx8SFBwhTZtRaas0lQJ81Y
	kWmlM=
X-Gm-Gg: ASbGnctp7TADN037w4O4kVdy9LYqQw1TPKavq24fe+vPNSSrJ8cp0lW05ClJi0WCkI6
	k2bUVyaSQ3VWSVU1azQzBvVpuwXfmeyZ+p88DL9iUsiePIwF2zkx2N64iojgYAoNHRXg+PQ14xv
	jeokl2QqLxKIV2g5xoOPOEKN/e12wAaGG3dg+4ADux1QEqhjD3EVXVJ8Xg0B5Ga8YCD/2MwSOJx
	B0/C2GT38hEhnopIxNeDp8EqTxd32TveSZzp0benozZX4kUwwb+aWBScoy3hparmYntp/wm6srb
	NZJhfEwjpq1UkLq34/MTKQw111zEyswXspqVd+LwFA==
X-Received: by 2002:a05:6214:c64:b0:6e8:9526:5788 with SMTP id 6a1803df08f44-6eb3f1b2565mr155246886d6.0.1742806395761;
        Mon, 24 Mar 2025 01:53:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6m0mqOcekFjzz8FKGAziTAVBb1X1X4Rb4KQ26FsPeWeC/u7tZMTMJn339B3z/Dm+vMyRqAg==
X-Received: by 2002:a05:6214:c64:b0:6e8:9526:5788 with SMTP id 6a1803df08f44-6eb3f1b2565mr155246686d6.0.1742806395246;
        Mon, 24 Mar 2025 01:53:15 -0700 (PDT)
Received: from smtpclient.apple ([82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef869fcbsm630023566b.5.2025.03.24.01.53.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Mar 2025 01:53:14 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [OE-core] [PATCH v2 01/11] systemd: enable efi support if in
 MACHINE_FEATURES too
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <d0f4460cc8338769479b0efdfbf4ed68b491fae1.camel@linuxfoundation.org>
Date: Mon, 24 Mar 2025 09:53:04 +0100
Cc: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AAC3DF15-5EE9-4D03-95FB-78516FAE7C29@oss.qualcomm.com>
References: <20250321132517.670372-1-mikko.rapeli@linaro.org>
 <20250321132517.670372-2-mikko.rapeli@linaro.org>
 <d0f4460cc8338769479b0efdfbf4ed68b491fae1.camel@linuxfoundation.org>
To: richard.purdie@linuxfoundation.org
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Proofpoint-GUID: zsyWuAXqd4Mya07geKEmEawrwCyMvXnO
X-Proofpoint-ORIG-GUID: zsyWuAXqd4Mya07geKEmEawrwCyMvXnO
X-Authority-Analysis: v=2.4 cv=CPoqXQrD c=1 sm=1 tr=0 ts=67e11d7c cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=KKAkSRfTAAAA:8 a=KDT8z03SYorrPU5RSlsA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 08:53:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213517



> Op 23 mrt 2025, om 11:53 heeft Richard Purdie via =
lists.openembedded.org =
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> het =
volgende geschreven:
>=20
> On Fri, 2025-03-21 at 15:25 +0200, Mikko Rapeli via =
lists.openembedded.org wrote:
>> For example genericarm64 enables "efi" in MACHINE_FEATURES
>> and in u-boot. Boot without "efi" in systemd works with
>> EFI protocols but for example efivars is not mounted at
>> all so various checks fail in userspace. Fix these by
>> enabling "efi" support if it's in MACHINE_FEATURES.
>> Fixes efivars mount to /sys/firmware/efi/efivars etc.
>>=20
>> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>> ---
>>  meta/recipes-core/systemd/systemd_257.3.bb | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd_257.3.bb =
b/meta/recipes-core/systemd/systemd_257.3.bb
>> index 64fb8fe69a..9bc4532021 100644
>> --- a/meta/recipes-core/systemd/systemd_257.3.bb
>> +++ b/meta/recipes-core/systemd/systemd_257.3.bb
>> @@ -69,6 +69,7 @@ PAM_PLUGINS =3D " \
>> =20
>>  PACKAGECONFIG ??=3D " \
>>      ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi =
ldconfig pam pni-names selinux smack polkit seccomp', d)} \
>> +    ${@bb.utils.filter('MACHINE_FEATURES', 'efi', d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', =
'coredump elfutils', '', d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', =
d)} \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', =
d)} \
>=20
> This makes the systemd recipe machine specific which isn't currently =
the case.

And it also side steps DISTRO configs that don't enable 'efi' in =
DISTRO_FEATURES, which breaks the belief that DISTROs get the final say =
on policy.

regards,

Koen=

