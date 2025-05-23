Return-Path: <koen.kooi@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AD8C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 09:39:48 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.44339.1747993184928379784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 02:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=UTv7V3i+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N6UrH4015696
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/yDG3kkyDPr7iEtuHK03++FccIV/M/48KGd8HDHjmAc=; b=UTv7V3i+JkjPGwWe
	fU7U2YJzjjHjKufJ2Q57FeK6AJmSSztkBOU31c1DaSe99G1hifQC81FeX8mGjkNv
	EGP1VwjNOS2z/N7r1BbLJ/ldKh2+sRtW+R6NwY7Pb9wAugUoGo5bF9968IY4/y5y
	ipZFTxmi5jdrtQJRpdU4i5wjWl9h2WTcAnSkeTXm5LaNF9ShhPPb4j3F9jVU/AIt
	Shu3qaYdKRrqdYNgoTF4f/gKfUpIYzcrNJgJadh2xiCmq8hdQ4PnFj+rAtTNY5Fm
	NEy4FfKRHiJ7oPID5Q59u3f+P4Js42D4Du6BUOlTjqQnxB3P0QbYfVEuYqMRh9Jg
	7rvS8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tqw0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:39:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990721so2133573885a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 02:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993183; x=1748597983;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/yDG3kkyDPr7iEtuHK03++FccIV/M/48KGd8HDHjmAc=;
        b=HzP7mZcvp+6AbGSUGEVL7HL2puIcAmstKuMqpBiZuxLBtkXJbtcYjjsET9vumdkGol
         DSPNyBP35Ix1hs4bXXTWjxFiQmWf0nPeF5Iutdes0dl3a63iY9QlDsyNwgxmeAIdDhvF
         P83H3Bu0HaSo6bHfXNN9+OSbk+FIcxdLo09ccsbucuKRCgwPQdKrixD3EW1uCAYnwB6t
         3hTlGFCHxqkuHk9MLpw/5JBPLtxSBW53LTbJ/cT4/fISz7Vs3oxHD03xib/+Cyy2+b2I
         OsazO2B8VX66fC7v42totcPfcRQ0N28FJC/R1pIvh5oUScdURjdrOt2kfRyWqfrUfFM1
         WWNg==
X-Gm-Message-State: AOJu0YyumFV7MoWTNBdiFeiNllXj/tg6N4vB/fYWQ87Abm7ZCUtEE7pw
	inHjNliR7cvk6HdHOp24Yk/oxd2luy8XeKw/FHIZ1IB8kc91jzOgUIkz47jyOdfsAK8h98k54iY
	GL1OHUrFNd7DznUKE7ElbVfZAd5nwFK2Ch4Ge7JHB5DIU4rOKLjoF+yBNuuoDiAfGMS1LVVC7CD
	p9OgHnNLM=
X-Gm-Gg: ASbGncsTVMsP5NYF59dCkm1npqIr5RVCpuCb81snm5aOOBdi04sn9Pqz1DtrLXT6qlt
	v2q6nker2vjh37zmd0cYWYiiZmb1PifPvKYmXhZ9sJB4re407cWjpcGbUpfs1SJjcP3TxlK0mo2
	GxZfjC8ctI1O3Ave54g0A/mAKfkvbq8hSa/ImKScoeZuxgzYOMVWyJTW91VITV6B0NDHyWsmDoK
	6fa/hbFKzYyJ8HB7+ylZx7TMCq+AASx/GNIJFIvLh85NO6oZGbbkkZIrDbFOgQAd3egOoch3b37
	lgHyXV4w/K+jleLZUwpGJeKUmOEtUeODX7li+wWnkPErqLt2dkAIX9GDQT19ig==
X-Received: by 2002:a05:620a:c53:b0:7c5:a423:f5b0 with SMTP id af79cd13be357-7cd47ef07f0mr3784796385a.7.1747993182867;
        Fri, 23 May 2025 02:39:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvP8eDAhT+RiQkfe/1xCMCxAQ4M1gsdsy5OTJFOgKg7UeFMiY+InNxnjCulVlLT/V9lrm8cw==
X-Received: by 2002:a05:620a:c53:b0:7c5:a423:f5b0 with SMTP id af79cd13be357-7cd47ef07f0mr3784794385a.7.1747993182542;
        Fri, 23 May 2025 02:39:42 -0700 (PDT)
Received: from smtpclient.apple (082-163-040-105.jonaz.nl. [82.163.40.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d49afb8sm1198600566b.152.2025.05.23.02.39.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 May 2025 02:39:42 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [oe-core][PATCH] mesa: make asahi dependent on opencl
From: Koen Kooi <koen.kooi@oss.qualcomm.com>
In-Reply-To: <20250523085103.654849-1-f_l_k@t-online.de>
Date: Fri, 23 May 2025 11:39:30 +0200
Cc: openembedded-core@lists.openembedded.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <85BA3D73-961B-4C26-B3EE-8E0B82567F47@oss.qualcomm.com>
References: <20250523085103.654849-1-f_l_k@t-online.de>
To: Markus Volk <f_l_k@t-online.de>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=6830425f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IQEsc5u+BqvcbVO/417rXg==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=xBkBvs3ehd3EuEHthyAA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OcM28tacDnB5e4upbTVw3puuCCE32xQu
X-Proofpoint-GUID: OcM28tacDnB5e4upbTVw3puuCCE32xQu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA4NCBTYWx0ZWRfX5GpYtxDZ6NGD
 OvRLB/kMPdh3BcMJ6kE397NxO7u47zUVPrzBaVTJafSA+jJejnZYXFFIYQ7Lq+FLpPR5ICzNOyS
 1YpsjbgTl2mU8WlG2GzfM2C9kZ5lzUBogB8pigmJtCquxyBlk0Q7IiZmfIQF4FTaIUkkEJ1MBi7
 52v5UaV+lcDkZiMK0G+uN05H5puzlPXCY244G4Q4HcQ3PkbOM/qTCREtU9UzH5r7N3wQXdllt7x
 M2th+i8/NsDpDuhY1Xp3S9YX+VSIvP/Tv754oZVIQj05aK+u0Y+O2sO7iU5/8pl/eAUyRNTOOCM
 7vPpsgN3Bci49TDZzrxs9EzvmmirRBReFtf/ULVUSkZbZVqKlsCiFIaKmWCsUeUjlRQKP07kWQl
 r0WJJ4HDqSHCu8uiThLDb3O7cln2H+vtRq/vNI81FMwuMTsUlUDx9vZNpQ4B0D3HiV6rxAfl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 09:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217182



> Op 23 mei 2025, om 10:51 heeft Markus Volk <f_l_k@t-online.de> het =
volgende geschreven:
>=20
> [...]
> # radeonsi requires LLVM
> -GALLIUMDRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', =
'asahi libclc', ',asahi', '', d)}"
> +GALLIUMDRIVERS_ASAHI =3D "${@bb.utils.contains('PACKAGECONFIG', =
'asahi libclc opencl', ',asahi', '', d)}"
> GALLIUMDRIVERS_IRIS =3D "${@bb.utils.contains('PACKAGECONFIG', 'intel =
libclc', ',iris', '', d)}"
> GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG', =
'amd', ',radeonsi', '', d)}"
> GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"

Very pedantic nit-pick: the comment for these 4 lines only talks about =
radeon-si, I think we should either remove that comment or properly =
mention asahi, iris and radeonsi and their dependencies.

regards,

Koen=

