Return-Path: <mohammad.rafi.shaik@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15ADF531F6
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 06:52:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13076.1776149538098724651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 23:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=Pt/dEOtN;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=Ma7JrnkA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: mohammad.rafi.shaik@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6D9fc3505294
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ap6eyIdtx+uggNXcajYAB98hOs2LBTway/0f1MIzmyg=; b=Pt/dEOtNx+z+XaL1
	HfK5AiXilH9IW7oeXGtpJc03XDbeUy4FK47laeTmYkILx//VYpy42CMVajuIpYHH
	/zvDTAvfLT9z61yMltd/HThLun7wADBZhu+iyhky98lZOaFazXBDI3ZvcXK1HsOd
	XJpqwe1sTUcG14Y5dmHz/yHA0r8jrsJcB4jOeGIZHCAl8VSZa63baUmiZhgDCvDX
	bayJjyN4s3Cu8Eh0weybunlBPnW3wd1sl9Ad/d0lO2bWqCmH4ryG1IReSDn4tASI
	HzvnwvNxpkqnv7eTDaUlayQm5SeS+hFGJLqbEMnSB/xUOK5GSfyxnCoBOzO9yvJI
	LRzZ7A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870he00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:52:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so81305695ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776149537; x=1776754337; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ap6eyIdtx+uggNXcajYAB98hOs2LBTway/0f1MIzmyg=;
        b=Ma7JrnkA51+fROFvxzhtDn9QrPrz0batD+bWNGiGA7Hr0lQKdXcRfd8Ini2zNTuZO9
         SRX6fSgsgNuHuznZazhXBrKFq4k5rGyC2X9Th9txjCz5vVQfqJuVJaREwWVhp8SBnlpM
         LZ/lawowG0V5GjKD0fyLHgHqmAZU38iLKMta2+49jqPUPSgHxUN0Lta9wwGe6aQPUOdg
         lsCRIZo0nQfUCZSm7plB+vAneACCEy4yeNvYndXzJ+q1Gsf2GIIq00mbxqmXP2Lkhzh/
         xGrk/8xFu8UG0tZQJlthvaO5OiIwwo2YTrz2pGap2Y9RYtYT5bY7n/H7484t4td+Dqp2
         XNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776149537; x=1776754337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ap6eyIdtx+uggNXcajYAB98hOs2LBTway/0f1MIzmyg=;
        b=j8SkAS8B/pICM6JPPNVi2deZM4KlDn6WP1sUrjKFigz7cltQ8eXqXqjUF8CqwLD1kI
         wokF25E91ENuhqegv/l1fRxEP9hnIDVoKa8i/DEGgWkSDE44NfO320V0Rzq3NtclzUJ0
         VT5+d9c+CFHUvfbJX7nVvnnGXZfFQ2JrxGbsO4BkQK4DzofuftjUUJjYM29MAJFDyBd5
         QfbPxHmDEkyLBdLiDNRvenCOKdV6v1byqrm+RxtI0ZLG18FNiv7Yzz0eXYFaGcLnz/EL
         QHRs9GhXJDqWwdS5wsem57X/JJirb/wFa+R0+b0yyEPFyJodITHcrpNKFj4Sd+iohNTw
         T+zQ==
X-Gm-Message-State: AOJu0YzSjJL2nSZFzKI6ME2zurbDjIKAPE7oOfmggZdQOtunOrRiKOPD
	ziZ1FzJTgrHQMai/AOI2yFo3r99Aomhm4bD9z9IX30dspibqrBrgLfCwdS0MgZmUBSMO4xWUcT4
	hW0RBNRE6JVEgml8tyFvoo29iPzDjGUsnkolAh3j7wk2bbVkWU13z/JtV7dLjv7a3CheIPvwPy2
	jTXW//4so=
X-Gm-Gg: AeBDieu3vhtoPJVHeseDy5YXkbNV/ang/2AitiVkIa7QwOS4uxawQw12zVRS2MTdoKj
	q3aAMXq34T+o9SWr8bouEJiPghFrznOFKxWWNJo0w3NHsoJLAPsjq7BOsIw1akyZn46sxQRgw9s
	24tYkan6K5WEv2SJfG+e5T/Wx+sRPVO3Oss4AI5cJ8XmcpZNczID7yuRUhG/11qUdTzGgVK2OpY
	e5+B1zSxt1QsMmA3MsbcJhXIMTHQwyDeVFKU8oilalYQ2x4eN2PITUPTHbQIrwHO1itVEJwnZ0D
	5P2Md5mSmDlb4FhCsCLxIe0hfLKQINOXVgv1o4HT3ftYsKjCDaE8gSEUM074NubXmLCN87KFUvx
	dA5L10rMd1Nxb7/a/r9bBxHUOF1JIgmcYuA6a8hjUXMdWzOMthkBR0zM8odiV
X-Received: by 2002:a17:902:ab85:b0:2b2:58a2:c8a with SMTP id d9443c01a7336-2b2d57e6223mr124468045ad.0.1776149536792;
        Mon, 13 Apr 2026 23:52:16 -0700 (PDT)
X-Received: by 2002:a17:902:ab85:b0:2b2:58a2:c8a with SMTP id d9443c01a7336-2b2d57e6223mr124467835ad.0.1776149536268;
        Mon, 13 Apr 2026 23:52:16 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4df9bb8sm137363555ad.30.2026.04.13.23.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 23:52:15 -0700 (PDT)
Message-ID: <21ed9c18-5409-4a0c-b5d6-71549f91419a@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:22:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v1] pulseaudio: split pactl into a dedicated
 client subpackage
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "sbojja@qti.qualcomm.com" <sbojja@qti.qualcomm.com>,
        Tejas Kanfade <tkanfade@qti.qualcomm.com>
References: <20260402162109.3523797-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <65900E7F-3917-4D0E-81D7-D5EC15FC4930@arm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <65900E7F-3917-4D0E-81D7-D5EC15FC4930@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA2MiBTYWx0ZWRfX02U4AC6BFsBD
 7AMJuUoFAN9hmaXumo/cRRpGOTbXZBzMsrsMjGmips70ERn3tZYkZNPbFmNxVCGh5Jn5jJCbKpZ
 d3jSam3jhMTqP6mxUhiKDcKDxuUTKu/ug6SY5uA9EOdA0Womc7XsxAT1a1PciQc15lQw7QRrYnD
 GhGRJwyDGI58QZ/nNz1cB2AOireQjU3vqLJR5xBl0FehSGLui+xqh4JLdHZyyvQAZSxAtl7UqyA
 fKhW6LhYyH37lWtQcq20fo+aSnTSANrlTSc2rxiUOg7V3EanwDJCsLfopQRDSVx9Y7PjRFYezap
 C9a2sFpfaj5GciEH3Yovvb2jxbv6K2+/Crv5DTkCcbLw0e5vVVEpgYzg7D3s14U9rC6MS7nqvoh
 KC4HTVtxAU3ix37u7qA4llk/v4+WSVdANjwvnRR/S1HPEWvtLx3pWw78ZWVk8x2rYIz2vKjdsHz
 5fIqfZDdxGVfEMFUApQ==
X-Proofpoint-ORIG-GUID: -NbM9AdhoMip-UK9bq0zSIcECNcyi04j
X-Proofpoint-GUID: -NbM9AdhoMip-UK9bq0zSIcECNcyi04j
X-Authority-Analysis: v=2.4 cv=btZ8wkai c=1 sm=1 tr=0 ts=69dde421 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=Q4-j1AaZAAAA:8 a=pFwcfby3X2Kz_iqNUigA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=0lgtpPvCYYIA:10 a=324X-CrmTo6CU4MGRt3R:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 63E6D9fc3505294
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235143



On 4/9/2026 9:48 PM, Ross Burton wrote:
> On 2 Apr 2026, at 17:21, Mohammad Rafi Shaik via lists.openembedded.org=
 <mohammad.rafi.shaik=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>> +# pactl is a client tool; it requires libpulse and a PulseAudio-compa=
tible server
>> +RDEPENDS:${PN}-pactl =3D "libpulse"
>=20
> Why is this needed, surely the automatic library dependencies create th=
is for you?
>=20

Thanks for the Review,

The explicit RDEPENDS on libpulse was added initially to make the=20
client-only nature of pactl explicit and to document its dependency on=20
the PulseAudio client library after moving it out of the server package.

However, you=E2=80=99re right that this dependency is already handled=20
automatically via shlib dependency generation, so the explicit RDEPENDS=20
is not required.

We will drop it in the next revision.

Thanks & Regards,
Rafi.

> Ross
>=20


