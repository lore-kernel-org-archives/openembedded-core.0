Return-Path: <ricardo.salveti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B21D73EA9
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 23:46:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29808.1769730395790913234
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 15:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Co4Cmqu8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=B/y5dbnG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: ricardo.salveti@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TJqvek072168
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:46:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N6WRZMppMYNlC+Rtknuj3ovjq/bDpFtk+ritcjuzEhs=; b=Co4Cmqu8Tm57j9dD
	O65rVrkBbENdZKHEctOK6U2w8gw9whYQlFQIsuDl1QMmnZgE+9KmXfSvuZvpPBGh
	zpvuPEunIpXJhBTDb9QJNCdYGYSRHdD0QP/3yzowZ7BYJi/3wOCCSQcfRZqJLgCU
	0hQbgWWGvmaWGiM9TMbqiJZBSAxeQSVDe+bGe90sxnvAcYOriafzvhGYxi7sjbmE
	6wbwFxhgDGPo7rV078NS85hRhVKDqFHVkbw+fTdAFiVOuLxfn9orsYrreucmUxPR
	trvquiRXxzGwp709zpFStDR/NUMWQ2iF8VV+ZpAO9VhKYrPgCaENyHS32dtWVFCL
	2Bq/Mw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0e3k8gsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:46:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so2829201a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 15:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769730394; cv=none;
        d=google.com; s=arc-20240605;
        b=g5lJ+E+5lZ7mc6a2gxUzAZ08tVD3OhANtycmgWBNyxVuY2nC468y/5TBtPj7Ij5ar0
         teVSG2ATw+nhVIW0QV66b3+/ycDy28QOd5Qpb8lORMw45cv4p5qd3wk1a9jIajq9au8y
         ponMl+iqrA8SYikO49euK+3O4ZeWaG8Q5Em7rt9tTxePbriKNS/BVzaZ+HtAvaLDjaQo
         RCMh8CPNEGLxhJqYxTJ6NxJng5Ei8/qa50vM7rYgVUN7ozFqYLKPnd43pphzqMD9gKpD
         ZJj+4gLkzQOCDK83YVN1BQfVb3juoeqjDdZkxVHXMtNo24nROtF0sPBs6qgHcHo7kIrs
         CpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N6WRZMppMYNlC+Rtknuj3ovjq/bDpFtk+ritcjuzEhs=;
        fh=2wxl3+QWFsbbjt2W+0Mm8U++InprfpJIYMs86gRH5L0=;
        b=A2OD8xtxBCbaYm6NnNdtJgjOWMl8aFqAKLRLM12Q07RObkWRhaNLcJQnlpc6HoSuvR
         yXxMT/GwZjRPMQql8sTGCdNoJyOCkBngkgvEr8522g1md/GbpuAZQoksOBzFioPsIa3c
         sZQ/xzM7ceSFqkOtBEiO/aVXYEr76yYzTFFVTqJfUKBL0XTO4lowFo85AVAn6sMy4NbQ
         lL9HUX8nOOBxM/sfQycFxpnVewVUBMqbywQf5bXmbBASUxFlFPP6kBtLF+Uut3af+wgB
         o552WVZMa8wwFZfba6CkqMYxkU+67F4K8r8rpSgay6Bipe34SSLM5xIDpS+dDBr73bhJ
         //4A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769730394; x=1770335194; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6WRZMppMYNlC+Rtknuj3ovjq/bDpFtk+ritcjuzEhs=;
        b=B/y5dbnG/HDe5JQcKWjEzSfeRpajlBH6ULgsM6NSDoIDakWIoYxjoSsWw8eSRq1Kwm
         OiTwp13icT0VOCjWbq4O0qvngWjMw/E14Wo4MBRdPb7HVw8OJopDXGDOxox6bhAtww4j
         JZoRR2VqF40ZFmTfeRc+7zIp+zeEZKKGsGukCZzLXOzZ6LBUBpI1CYMl+J4ujfyyss3Q
         avvR4c+WmIRGDBtPhIWij+N2xEWihFANnEHvJLSjETQHPLLEM+Af2PWD/4IGu6TC4lq6
         s5Hf65AN5A+UYYRQrztEOkm96GVG5hqyW12X1oYSN4gkZkLgJDe1hIPikNgJ7xJl/4TW
         UWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769730394; x=1770335194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6WRZMppMYNlC+Rtknuj3ovjq/bDpFtk+ritcjuzEhs=;
        b=dbOcq2jL9Rgi0gREv8oCZKRA26fh5qrXxR6/jWBtuoUNLqSq0PYa7jSG0JtRgXlhJj
         9MdbAioDlNR0TyWs7mVZFCsspU/f02IKhBwQQiKq4Qn5YzQ3811TLajLbSdqrR9HXxqU
         2IZiEX5IOGni0MoybxeKoiZW6fg9aNzNYmCH7uPrlsmvE7WzVvK3WCYeKeG6a6CO00YI
         DiXQsoV9W2ZYtc4gS8WTNvh4eQtqOD7aOXKgUzAjpK+2gdlwzrUhtHTZ7lVxj9T+PTL1
         E+uUTnF8e7FK9QBsiLwbMXvtk2DGzxHlwjm4It0zXzqkV2eyoMdRZBUJ5uZmsfSmn2TM
         azQw==
X-Forwarded-Encrypted: i=1; AJvYcCUjGGqWKKuiuj8rlShKexJ50+W36jahDUWDNPjDcSueVDfjDcpboYY3hhMMIo8oNdquzT9YJnZIQW2UH1H19Mp6HA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAzn+Ide8713xfHvEPw+06mjvozLmIi7Infdvzfy/cDRG+8cUJ
	mtWkgKY0mu2ycJhDXhX+TiWSs2g3TpH1W+nMy0AuTGAyttk3Qfe0nEIHglEiEGi9jgrhTLsJsVq
	uCcOy73n4zQB8kuBwix+g/DK7jkbR+yib+TjxvUcNK7Yh4n3b+MZqlZqsY9n7NXdkKWn2PqW7Ft
	fBgz4Q3bZT2+yMXwtnu2DT2Kdkwaxd/pn+Ez43OQ6pBvSb0W9obgpUuYWLyA==
X-Gm-Gg: AZuq6aLdR2nOC0I/qVqyL/RWMP654OonfyI+aApQkVErVUDmx+HpOhLZvmlE0u6sOCD
	99i1fBRd4Wz6HpxyJdKYGQDYgwxUzTxPJlj4z0MVng+jULAz/euFuxMj3zj4d0xl6a/ZOx9zl9q
	tCRgM/ZxXKuVd5gxMThHQLFr3JSRi4V5mDSBrPYWqaxj2LkxRCncvfq+wW7Py/gIOJBaA=
X-Received: by 2002:a17:90b:2e8e:b0:353:883:aff6 with SMTP id 98e67ed59e1d1-3543b38ac86mr997014a91.20.1769730393584;
        Thu, 29 Jan 2026 15:46:33 -0800 (PST)
X-Received: by 2002:a17:90b:2e8e:b0:353:883:aff6 with SMTP id
 98e67ed59e1d1-3543b38ac86mr996994a91.20.1769730393110; Thu, 29 Jan 2026
 15:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20260122194959.13457-2-rs@ti.com> <8684a6b5-809b-41e4-a3b0-c99b424a1b2a@windriver.com>
 <0387b4a0-1457-4de6-9571-022b997199e4@cybernetics.com> <DFYTFOYS891P.2A5CKLOKP5KGI@ti.com>
 <117668c8-bc3b-46ea-9d2e-b205e3f2f827@windriver.com> <CAMKF1srfwp+o0FC5r+Y+NfmWV3hFCJr7ifO5rH1C0+Gos-HejQ@mail.gmail.com>
 <DFZIJWAQTT0R.2QPUKVEBUL8K7@ti.com> <CAMKF1spQbv-WCy9XEBxiK-Hzn1v=XZnGW8jWdOkk2axsx7r13A@mail.gmail.com>
In-Reply-To: <CAMKF1spQbv-WCy9XEBxiK-Hzn1v=XZnGW8jWdOkk2axsx7r13A@mail.gmail.com>
From: "Ricardo de Araujo (Salveti)" <ricardo.salveti@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 20:45:56 -0300
X-Gm-Features: AZwV_Qi6dT5ZIxIUNEcCWQ4Lrov17dilMrxGsOvhq334pw2Sg2amojoWgfq0Bwo
Message-ID: <CAA_5you6j=mVutd7JkF7Pxpsn+rhmg+NazFc0=pFXz8=LFW3Ww@mail.gmail.com>
Subject: Re: [oe-core][PATCH] bitbake.conf: remove DEBUG_PREFIX_MAP from TARGET_LDFLAGS
To: raj.khem@gmail.com
Cc: Randolph Sapp <rs@ti.com>, changqing.li@windriver.com,
        openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VI3QXtPX c=1 sm=1 tr=0 ts=697bf15a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=sozttTNsAAAA:8 a=HUtcFt96i1aVFhcnGiwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: unfpEdOTzspOnQWXUSm9ll0nWjxqkruX
X-Proofpoint-ORIG-GUID: unfpEdOTzspOnQWXUSm9ll0nWjxqkruX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE3NSBTYWx0ZWRfX576ViP6gaZ52
 4j5Ns4h/sswTDK3ED6OQEz8xmtgbTfy7yYmLQ3MBWU5JJneh/6CHDnpNslQeUEWSfzpAArXPVOz
 nVhRUg7mPS2DhgOHS7smHqAGGNaJygskzlFGlkXf12y/u69+bEZ7ve1iAufkq0pSW4gmAJhe5Lz
 HgJX3RzfhXDL0FqPEj5YsOdc7H/NY8NTUMo1BT8zYVfJoVOlwOoDxChkCSyX7LHhXzH8jbllB+i
 x997qm1/YRLcByYNujUq1nRjO+CMayrN3yhpw4+o5kxUW/oHjz9QpnuKP/oiPQt4myGC8Vz5xuD
 qgW/5oTgVKkHt8EnJoRkjrmg9W7lc9Cm988eJJwbkHitfKHWgRSH2kAVdTRA2Dsmtl0ou878BGV
 5lRwtqU4K/eW/Do6NcAVy/OgSs0MUFGhZGcdIFSi1Eap7gk5qhBIbK94G1a76E1M3wVbv8W49AW
 2QGqX4f/ro1ORwFYbxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290175
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 23:46:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230171

On Tue, Jan 27, 2026 at 1:50=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> On Tue, Jan 27, 2026 at 8:31=E2=80=AFAM Randolph Sapp <rs@ti.com> wrote:
>>
>> On Tue Jan 27, 2026 at 12:12 AM CST, Khem Raj via lists.openembedded.org=
 wrote:
>> > I am seeing some additional diagnostics see
>> >
>> > https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5119153/raw_=
inline
>> >
>> > I wonder if this is related.
>>
>> Man, the mail clients are having fun with this thread.
>>
>> Yeah, I'm able to reproduce that issue locally now. Not sure why it's th=
is
>> package subset that's acting up, but it is directly related to the LDFLA=
GS
>> change unfortunately.
>
> I think this is exposing the underlying issue in packages perhaps because=
 they are
> not respecting CFLAGS and when it's gone from LDFLAGS the mapping related
> flags go missing. I have a local patch to fix memstat e.g in master-next,=
 all failures
> perhaps need to be looked into one by one and passed cflags from OE env w=
hich
> might have been missed thus far.

Just noticed a similar failure with lxc (meta-virtualization), but
while the prefix-map options are provided via CFLAGS, it only works
when provided via LDFLAGS, probably due LTO (enabled by default by
lxc).

Patch available at
https://lists.yoctoproject.org/g/meta-virtualization/message/9553

I guess recipes forcing LTO will probably have similar issues.

Thanks,

Ricardo

