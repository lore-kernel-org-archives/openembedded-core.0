Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C69FCEDD97
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 14:20:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13548.1763475613978171383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Nov 2025 06:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cfXj0c5S;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jKQkZ7hz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AICAo232802300
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 14:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=prdLikKvwwsakyE+2NWwPOsN
	5HceEwFNoEf2K11cOSo=; b=cfXj0c5SY3zMlnk2qsS+vTS/jVzOodCKALAcMrmp
	tKVChi3QuStFvULHJ42SABoOloc0mwwu2aKRxzZp1x04CmXyUo/YdAQdIuGOBbqP
	rCm+tf7aWmfamIqLKTqLBck/YuEcOYSuaF65U8CcRwy/0Vy22phxOIMxpg9GPw17
	ZJ7nzZpqFR/5hs5jOBplCFFiP6JohW2yaJXdLP8G3RAOrDCr17Ik0YULEbw/zL5N
	d6YbV5im1ZzEZ8svZgWYuDPxSCNPekedAseWqRMmP/7vqnDSv4j3mLa7xFyaSDqx
	0vpdFVN51YFST3gHHPrbXLFQ1jUu9lQwLmRl5A5fRMXbMA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk20ap2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 14:20:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34188ba5990so17076934a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 06:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763475611; x=1764080411; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=prdLikKvwwsakyE+2NWwPOsN5HceEwFNoEf2K11cOSo=;
        b=jKQkZ7hzIs9fUYN0xD8vUA511O4XAoy8NH0+1UrCV4MW4j80mgMterp5gSTlTPzMZc
         T5LjyxewRycsSYt6AtA7i6KEP31qtZlUDGO4GO5Ab3re6zP3W6LMYQw8lXmAp+gtGRjK
         ez4cDcRGBryaat9z7uO5kJ8ydgWfW0jWxAI4ySB4rEsNBs1vd/2vx5zzy3dMasOug0Hm
         /CuQEGiXrdFZ39MSwXTLSEnreAqAIcHqPy9FXF0x/pWm+izrV/otUqEO2lOGSxK1TVi4
         gULGQMQRAz/XcsBptB+qj40mo/7kub5MUqgxwFdBuHckv4vL5davottl9egB4XTHhmHF
         78uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475611; x=1764080411;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prdLikKvwwsakyE+2NWwPOsN5HceEwFNoEf2K11cOSo=;
        b=ox8+wnocLCNKkqoE4mghyVmONwJUMzLWuPVws7AQZofvYcBnnN/5EAQXrrTvPAIGRK
         /O/psWCghXUw5+wLm0wrKe3ikqsmsSnHwLNQ0orSQLyDEqm/c1tsUxmAO8uMXc7xhygB
         R1q/zPI9gR7lzqD3Ss4BhncKybLHANCVaT5pvtQinPPc4orV7Agl6PW0vUYWZpiAqnet
         mzxhLhGDsuS8VfPLI0HjAB66IZjrZDDQYOVOdkgXsRU3zew8GaWifXsIeo+Ll7tr0P4a
         a4Mn/72QBiFMfpK4iqUHFjHHtsmXizvhKVZMOSTPpesch1eSlLXrnl9JB7Gb1f29HBZ5
         CbbQ==
X-Gm-Message-State: AOJu0YypLKU2rv0MlYL/KpjMfMk538bSyIUDCvtQfdw8dtwfZoWPrH3e
	80ibb89Obgs1Zp698NjCfKflGtfKTFpKuCOpkZGBlb5laIJoy4Fe5Hr1rbVxmDULyj57RPzxEQ4
	7N+npaRlznbVyHORODl/QIdbu5/k0wWNyQboWAMwMtTVz6J/hNYJ7j5cFyBlaGlZXOVqYJ3objZ
	i8X3WQvcOyb3GdBkLVxFi4E/Mi9t7GDhQHs4Us7DDqFYy2zbXdh2XdEM7wkw==
X-Gm-Gg: ASbGncuw6JKBGQD4bJzZOSiHS0HOLLKwYkbNUYz5Y1VqLi4sPwPvJVCz4yvdpjl4X0g
	be4cvLuvL0R2WN1ZcVlx8zpACnT4CoJ0QeV04Ffcji3UM1yFIg2+EURF2zuKP3Cty0w5MI90iNf
	MbtROMvqn/lba1FBbM+rb7zsGOs9jvYnm3m/UYVh4n4Sa9T6wud/Z6ovJO/eRTYrwqVstdaw==
X-Received: by 2002:a17:90b:54c3:b0:340:bde5:c9e8 with SMTP id 98e67ed59e1d1-343fa52be24mr16593532a91.22.1763475610622;
        Tue, 18 Nov 2025 06:20:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo2uIR1FC/BU21htrrv+5iwLwO0HMBgSoqEpcCdX2q/XkQ/BxJoRTM0VbjaYWSzHZivyFQTki3VGiAEnx9guQ=
X-Received: by 2002:a17:90b:54c3:b0:340:bde5:c9e8 with SMTP id
 98e67ed59e1d1-343fa52be24mr16593505a91.22.1763475610124; Tue, 18 Nov 2025
 06:20:10 -0800 (PST)
MIME-Version: 1.0
References: <20251030115415.2566247-1-dmitry.baryshkov@oss.qualcomm.com>
 <4mtzjkjozhpfksscbfjlq3jpuoftbtrerxxphplqb6q25hw7j2@coifj3stwtyu> <CANNYZj-XiX5zQVq0UjHVAZCuAOAuO3Efzh2gCQ5eoJC+5c5mvg@mail.gmail.com>
In-Reply-To: <CANNYZj-XiX5zQVq0UjHVAZCuAOAuO3Efzh2gCQ5eoJC+5c5mvg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:19:59 +0200
X-Gm-Features: AWmQ_bn27Int7WgSrQonpb8dBkARO4Qc3I4j_jQUkm7cmiVhN7Xhxxmi3-MPe_c
Message-ID: <CAO9ioeU4sOsaiwbe5n5c0kKQafTUf214dLgF3K4+6ibgu8fGOQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 1/2] libconfig: import recipe from meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691c809d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
 a=4NG4L2PfjNlh75LtBqgA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: HkQOyUmj_Ns6TWlcelIJN2svB79i_21Z
X-Proofpoint-ORIG-GUID: HkQOyUmj_Ns6TWlcelIJN2svB79i_21Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExNCBTYWx0ZWRfX8dZTjoYEMmiA
 PRImfrrPXAG1zktpWebtB+KNrZMsxvwBosgRkdH2ntxNwfVJweH18wdS9XUxgnLR75sJwyobEhg
 xZ6yx0AghesR1sm5n/cNy1yMri2tqmhHVpIWQXJT0vLwZ5C6RjCYlM+u9xcQrUTC0AvKEFWwbfM
 TVqXQ6o9kDDEJdLtilvLv2JNmDaVcaIfeq81csnkKS7A0Rx1+BfGEeDiAHFmv4Pw5sg6PSwUl9h
 QkeKK/thIeqFHHpQll9LefxJVxmUwEPR/jHLWlssuiWSXbTD5iCTNE6KnghYGFO6KBXfSBeubN8
 rvJtYbI1QtLPfQzqPsze9Gbyo0UMItlG462Tn2HIU39IxGCLJf/k6UlfDvxPzc15OawumlBoQ2s
 u6loBknPAXlH8POc6H5VlaxEJZK3BQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Nov 2025 14:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226528

On Tue, 18 Nov 2025 at 14:32, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Tue, 18 Nov 2025 at 13:21, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> > I see that these patches were a part of master-next and then were
> > silently dropped. Could you please comment, why? Were there any
> > remaining issues with them?
>
> We're deep into feature freeze, we're late, and struggling to get the
> release out. At this point new features like this really don't belong
> in master-next, but the patches are still in Mathieu's staging branch.

Alexander, thanks for the explanation. I was surprised by the lack of
any emails regarding them

>
> If you want them to land in master sooner, help with resolving the
> remaining release blockers would be appreciated. See the weekly status
> report later today, and join the tech call in 3.5 hours.

Sure :-)


-- 
With best wishes
Dmitry

