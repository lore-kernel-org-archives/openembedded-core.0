Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD010C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:17:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.13775.1743175049834082639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=g000YBsh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SCr32N013798
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1spmELn6nWsiokTKZxG1EyCUpBDh21ZXfQKJXv5PLY=; b=g000YBshijEpUh7i
	hmyqWYFj5PNCWBErryUgN23ggn9yQqRKW3nxCBdvDZCzSu9Smhpr+jabJoteK/Xt
	9Rtf5pNzTobIcMVerbwXS/tjJPk1HXYZeBYBcaMGR/PQ0S0Q9saxrvrOQd3hJ0ss
	H75UF1kBUj3H7QawFdJUhQnUzrO0YGHC9UPvjzGF/uUJuZZ4Pi7jrgNeCK3emg3f
	VoWwLi+nL1dj4DB5RAiOvQgxT/U8yorlpT8xPPUTI03nErVTW8qID/KsQr7Dtytw
	YA2gKZw3gRebmYT6tMLjI2VaUejO4ev/xMjUSvkTMRffdqTJdhEn0mYk9CJ/32bJ
	tILPzQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mffcr2ca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:17:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0a3ff7e81so379853085a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 08:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175047; x=1743779847;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1spmELn6nWsiokTKZxG1EyCUpBDh21ZXfQKJXv5PLY=;
        b=DKkel6Usn4qYGVeehXD7ix83X1kBzUHesDkKNDwyXiKRhpZcpcFCJreRznUdVZLtyh
         PNJbhlkqOq3L6WnO7qBk1IkxV+dk2wmESUykBhjk3qK2nA75ARjL8TFss1OgK/sLYatx
         yW/s+b/2+YdlE3CMYQinG+/Rj5h4JiTn5iBaBPfecW54hodb6VMR82DRB8dZ89xAnRPN
         wJZwbtEozHn7NFF0xHc3rwWvzKh/0/CAgZb13rp23RC9m9NcG/0gSN/iB/55zk5wEl9D
         tJx77/f9l7GwqvAn7la7xJeibGDegSINob2bFkNt4yG9OS4PZy/3/I5otz0F9pR8Hisw
         mrHQ==
X-Gm-Message-State: AOJu0YxwC1KBDk1evEI2ZTvcFoOeDLVFyh/ToBhCMPglftkoZG3t2XGy
	bz0wLb176RTg5iTgiQ1CUFUbMKlMg/0Dn9HnT5KdY2DD2IC5/9kpNr7KOMlQQomcErN3kk8VwL3
	dzvDVrBQzlYPfFx0RxnUOUTqSBQTlPbtaGxeQLcE+0OYgbWlIPgQwE712EmG/nmu9q3g/lfgq2C
	Wkdoi6pKvueIo=
X-Gm-Gg: ASbGnctpTXetB0M4/lsB2TQvnKD+ppCsAYMCiDhLWitlln83DFVVRC/+8PZb5Osb1UP
	kJnnMIr+FZVeyE18s7AcApFi9DI+YIp2DQNhyV/e3lP/Dok01aiib+rYok6vGpBcoQOKn/cD5MG
	T68CzdbJ0UONxha+78FUZif8po4SLlAl/s7iIJ578NEdzPYo/HDD7eGtJDhYhwAVQvGQaWsQzpo
	3Vipge5CGdLHoEp3+O/GPxnI1Qrlyq06Nq2xCplfM49BoZfXN6UCCQ/UpW/GzPNT7SKgBYL8LZt
	Rsrp+l15czL6xdeQQ6MNcCWyo6oCUYMk+ia5bh3kJ+OYa40=
X-Received: by 2002:a05:620a:1a03:b0:7c5:6b15:1483 with SMTP id af79cd13be357-7c5ed9dda07mr942411185a.6.1743175047528;
        Fri, 28 Mar 2025 08:17:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3Xz49oc2xMZA8wx9+JXJz845b8klChN5HrXElX2h6E+fbSFJDzEXIFyF3FD6E4NHdvkkCjw==
X-Received: by 2002:a05:620a:1a03:b0:7c5:6b15:1483 with SMTP id af79cd13be357-7c5ed9dda07mr942407485a.6.1743175047041;
        Fri, 28 Mar 2025 08:17:27 -0700 (PDT)
Received: from smtpclient.apple ([82.163.40.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17dfc4dsm1493278a12.71.2025.03.28.08.17.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Mar 2025 08:17:26 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [OE-core] [PATCH 2/3] rust: Upgrade 1.84.1->1.85.0
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <20250328143005.880998-2-Yash.Shinde@windriver.com>
Date: Fri, 28 Mar 2025 16:17:16 +0100
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <BB6CE0C2-6EA2-44F9-8B16-8981A0B19BDD@oss.qualcomm.com>
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
 <20250328143005.880998-2-Yash.Shinde@windriver.com>
To: Yash.Shinde@windriver.com
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Authority-Analysis: v=2.4 cv=CdgI5Krl c=1 sm=1 tr=0 ts=67e6bd88 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IQEsc5u+BqvcbVO/417rXg==:17 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=q06_rEpfhTPEcMWHVy0A:9 a=CjuIK1q_8ugA:10 a=dI7qjkOEfi4A:10 a=IoWCM6iH3mJn3m4BftBB:22 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4Nu9Y2s2dbRib0cocy-30bUZSPaeyzbG
X-Proofpoint-ORIG-GUID: 4Nu9Y2s2dbRib0cocy-30bUZSPaeyzbG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=821 lowpriorityscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:17:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213851



> Op 28 mrt 2025, om 15:30 heeft Yash Shinde via lists.openembedded.org =
<Yash.Shinde=3Dwindriver.com@lists.openembedded.org> het volgende =
geschreven:
>=20
> From: Yash Shinde <Yash.Shinde@windriver.com>
>=20
> Rust stable version updated to 1.85.0
> https://blog.rust-lang.org/2025/02/20/Rust-1.85.0.html
>=20
> Some of the major updates:

> [...]
>=20
> - Explicitly set float ABI for all ARM 32 bits targets.
> Fix: =
https://github.com/rust-lang/rust/commit/a51fefcaab835b310e2e26005b50982d0=
049d905

In OE we allow selecting the ABI using tunefiles, so this hardcoding to =
hf will do the wrong thing for non-hf builds (which are rare, but =
still).

regards,

Koen


