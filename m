Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCDBC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 12:46:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.12688.1751028389939389566
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jun 2025 05:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=HYDxhJ5m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCI3vh007920
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IBagas+k4M3ftAGVuD2jlljbOzuHO0LnX6JnAEN3YZc=; b=HYDxhJ5m+PySKLMV
	nMa8YxulQHtzHQQq+2f/1d+dV/OkPm5kzjdCWMz9pWKzyDL2N5lS9Tt/Qhpd/gwY
	yaHXFGRQA+exQiO7y97q7MalMxJue9nVzVX7r22PM6QsOriiOgVpxy+PybjRLH/e
	ix5eMB4sNDBvgBlGeFwvBYhU2rbzM5q6f+CF66bFJeE2euD4BjAWSeyOcb1wUy+D
	Acz/zLhYfa66P3y6dTFeR3kNOepw85C5emwfbwU0eSAbn8CkclWtUoPXCCiBi4Jq
	OHbsntzIsSTLS6+ajSHcFkegI9rQJVZDPvjQFqwB4fPxbhItW686ndg+bv+VhdCF
	mtLAFg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqw7vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:46:28 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d446ce0548so82174485a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 05:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028388; x=1751633188;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IBagas+k4M3ftAGVuD2jlljbOzuHO0LnX6JnAEN3YZc=;
        b=o+emT4zrfMunCrr+7jFYfQAH1HcAna6Gtx47ZqzSpEvqkvGvYMgDIWYYcHbeB3Zbfy
         mHgWoEQ4eK34vApAn6aiO4Q+TK4FV0CLfXkwnb0ssTzxVL5PPjZDkPZHrapnNOdcJBNu
         LF/aGSXoWh2MfnOAJxeLZ5MCYz2qzG1Tcc3IuQe5fbCob8OqR8rKvDwpqLe8C5g0j7SP
         xjduC8KXbk95qdfemkpkjtb+iLeTBbsBw0fV75miFjHZbdVU+0tzHtHtV2/rPT+3YwEN
         CzvZdBGaSi544ZHsogRUMonBK96GMOwrUKcttzUzR0mDkSgKsr8BtikRod/VWmMsGM0x
         d1jg==
X-Forwarded-Encrypted: i=1; AJvYcCWZCN4+G4k7sRQWmqWflLJXePtr7S76fNO+rZZHNyZoagom3UCrwijg8e80rROd28rXNadSxETzlNDghlFL8kePsA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCYXzSfxhFTKALn+lAqjPytqUpcibXqnCYA1Wl0yp7VUic05wB
	zA6f9je3X1V51GbZ05XkADSUTT8luCe2s5PIsk1CjSqG0XPamChjKKx7kGJvO938k80twKiGHzg
	+5F36aKliv1gHSWz6PQdVHvqGYJBk5+60pH/5NfPUBN+s8o/NNMCaoYk8R31zw0kIvVCQKUVLaa
	4DDMpitac=
X-Gm-Gg: ASbGncvoWnhK7pqZeAX/IvLWfl2309CTZp3vKzxm18UlGoWfd8DsDmg2GxvPbMWheFx
	AURMkiyblA6M+itqlLAgM/JrJsdKZ04wvlkqcp/oh9vWPewB//cwI+yLjp1Aw1SiWONw3aqwueA
	BjDKrte2azdbzPYfcmnhp3nUU3tKkv9l3ffCnlddyeESSHlqaO7fy3HQINz4bcVFGsLInZvUmjA
	Cel2L5tmZCXPEyK4+yOc8Z3KAJC/yJrCktnTXMXvnae8d7u+FyiW3KrAhcdywKgmvG+LB2Gp5qj
	ePbelUPBKAumJdlFLMpRDTzxVkLBCDDfFUhh15E6mljvmsTXRSeFI93s38UcTY+H+6PcwrCU
X-Received: by 2002:a05:620a:44d4:b0:7d3:b095:5d76 with SMTP id af79cd13be357-7d4439350f6mr427015685a.11.1751028387899;
        Fri, 27 Jun 2025 05:46:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFic5QoP1w9C2V5fPHDL05t1Z7y2sfgaEFK9rs0gzolyUzaZ6x1ykXEpFwJlqHj5YBfKLZYyw==
X-Received: by 2002:a05:620a:44d4:b0:7d3:b095:5d76 with SMTP id af79cd13be357-7d4439350f6mr427011985a.11.1751028387358;
        Fri, 27 Jun 2025 05:46:27 -0700 (PDT)
Received: from [10.185.26.70] (37-33-181-83.bb.dnainternet.fi. [37.33.181.83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2b9bfcsm434755e87.132.2025.06.27.05.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 05:46:25 -0700 (PDT)
Message-ID: <cc63f599-23f2-439a-9eeb-245cf102ef23@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 15:46:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: upgrade 20250509 -> 20250613
To: Ross Burton <Ross.Burton@arm.com>
Cc: Vivek Puar <vpuar@qti.qualcomm.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250626194543.2363054-1-vpuar@qti.qualcomm.com>
 <CAO9ioeUxY7g+=_7qUDFDAfYgoe=_nEH7cv1HgH__V4ve-roGag@mail.gmail.com>
 <37DB3440-188D-474C-A944-86E9B3831BA2@arm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <37DB3440-188D-474C-A944-86E9B3831BA2@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-ORIG-GUID: wUDOqzyrAVqcu4jTwg0prpbrvICvvlID
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685e92a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=a09MB1VsJqAZHPW3esczKA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=qdPYmYudYv2D27PfZGYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: wUDOqzyrAVqcu4jTwg0prpbrvICvvlID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwNiBTYWx0ZWRfX4Fj0oxq1WhjC
 WhzLqnj3tpV/x4y3zRCGo+NY8zk1dWpzvzGMYTqSsomB8MeRNJWtAwjdRhwt1sRF4hpZZ9U9J80
 ZPQhiyoV7n2vtNKRtXTm+m2EkA1MSHh5lg5aaIU1DDH/N18dlEEZdvFsQK3N4A4e17MNLmyhruM
 bX7HyPRCMyPMq6BRukD+V7w4/p/siISkr5fzZRz7aqgJUqK45fnrLLI01UFNYCLAiqNpCWiCneF
 +/Xr3DIPz6cicKjICeisN576ou23gDgHJfZuJBVVXYnrwoAd95mahixYi2nujV5zsUUSsnOv22w
 LYwYKgJMaVOsIWXct7tTPi1kGYBgvJ7iFzFaRk5GZwBGPTPb+TNeFkGjlS5AJfUrV8cTKm6rqoQ
 9EO9FjksLYfQAjMuMAbfufxMChKu8eTxeXCO3ON75BvRYqK37UTQX6nB09AL0aU6H2TusMEK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270106
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 55RCI3vh007920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 12:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219407

On 27/06/2025 15:21, Ross Burton wrote:
> On 27 Jun 2025, at 02:34, Dmitry Baryshkov via lists.openembedded.org <=
dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
>>
>> I've noticed that this list is not complete anymore, May release got
>> LICENSE.intel, could you please account for that (in a separate
>> commit).
>=20
> The good news here is that I finally got annoyed enough with linux-firm=
ware that I=E2=80=99m working on automated packaging for it.  Right now t=
here=E2=80=99s a lot of grunt work to clean up licenses but they=E2=80=99=
re being merged as I do it, then we add SPDX statements.  I=E2=80=99ve a =
tool which then parses the WHENCE and generates packaging.
>=20
> The one catch is that it=E2=80=99s not as modular as it currently is, s=
o we=E2=80=99d likely want to explore a way to further subdivide large fi=
rmware collections.  That said, forcibly splitting the firmware per-drive=
r so that there=E2=80=99s never a need to install everything is likely a =
win anyway.

Yes, I saw your messages on gitlab. It would be really a nice thing to=20
get in!

--=20
With best wishes
Dmitry

