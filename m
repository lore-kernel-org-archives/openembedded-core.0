Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715EEC83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 14:17:15 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.49942.1752761829005217074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 07:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=cU/ap6xu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCTk3g000567
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 14:17:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNyxTSyFasLJtWGQsYustzhC97pV8mHh/JflSE+pBz8=; b=cU/ap6xu7TxOIqGo
	jpemV7NNRDa3ncxyQs+y4tCbyY+UsaDbXXxfBtdsz7lX3vZjW0yhSwF2LREy/heg
	8TY9JEt3+BgYOgsJBXDknByJaNkaVS7vmbme7+GBx3gLEzu7VPP7Q3vyClR6JhQP
	l1Jkk03QELxkDdcFqzH/bb/94KuPHLBtsT7axIlqWK0jyiTu8RHI1PzqR0Z2vv2F
	8UbSQ45zwKIsPBRbztMycIHcwP26VBD/BBrpexpIuBAKDtivaf/shl2z7KJUDItg
	vlJriBgFhQFrdCNECuxSgZCoU0lwvtBnOSbuqI8yKKoqpGN5Mt4Uzfy5yFA41iDZ
	qrAHnQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dru0b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 14:17:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2872e57so138132385a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 07:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752761823; x=1753366623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNyxTSyFasLJtWGQsYustzhC97pV8mHh/JflSE+pBz8=;
        b=MaPUiNeAUjX2Spv/7EODPjpukzQOrUeUN7nWBZtU55dAxtxO4L1DhJqrhc1inG04tc
         IqRv0RDhO+umN2mby6eF2mSu5va6P/M+tQHve8dk6L6JPYD8EVh6njeQbTqSxkIy2j4F
         79HggZn+VaMPb2F6l8EWguqqIHaznivLbvGpuz9I/88aJWFe3TUTpD+eq1IQZ10GdMBW
         AboLOTOgCcYiD398tBQV197OAywvurfADnT+fgMoqgYD0lnTkL3QrXR8qTHLn6x5jELi
         aAwoFey5jxcnZCrzOAwwja3Obn8VTbCHfNR0GYeDCt3TR+9pHAzTLISm8gT4C2/9D8ba
         mR6g==
X-Forwarded-Encrypted: i=1; AJvYcCUnwfzHC1RYkxTaeLRjyhIZdhBpbqJGs1gnRcu1KlCA0EEWWfR072lsPSbfhQpJWseeJGXymE+Vt3XIPyjjEXRa4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYleetGOtOdoChfq/RgCdP0Sixo/kqHNWX4Gqc4lVJ4IrCrrW7
	19XYVhFXzGH9sqT3Z6XBY0amXDOeVwyQ/XdVpHD7+Z9FeuOPusctXzJqMFlkHNIPr6jVbOco52L
	194FPR8gS8Zqu4a6ET9hP9TM4I2gpMq91DAvxXglVcaFjoVejHwdo7iHxrImGEGx/eZ298agWLO
	MliSjg/67ylAqDxh8=
X-Gm-Gg: ASbGncupoMky6OsAveX12Wn61GaY24DyO5IVCvbfEWAKP3G/UF5mNw7tPCjkkBkUwgP
	hpG50MtqWQm1RDYFduQeUkLluNJTmfmRgLTcF8H9L4uK3h1ObVPZeuh03YoSZTyp3hy68ekQLMp
	C1MpqHvTUhQwPTQBKQIlpi2KLtLBym7zlsIteQZGc/Yrh61SWk2w7fpiI5u4XOwFvyyQ43zeIRf
	+jWpoHKymlPU0oPnTEez9FeeeOE+a4iYI8ouIcXX+2G/3XycxbLQeJs2r53S+sU0ZByDJU1PJMA
	v6cC4wwhf1WkEzDDyuIYl5GC53VN3lHJ3Ss2E5xkkpBWiZisFfAWkJTchGzCoC3aYuJjAzqxYN5
	vGCiB6kexCEMWHo8=
X-Received: by 2002:a05:620a:278a:b0:7d4:5a4a:ceaa with SMTP id af79cd13be357-7e3435eb345mr833050385a.27.1752761823225;
        Thu, 17 Jul 2025 07:17:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFboFLVuXM3GQDUCEhAL2/hmIo/iWnmB8QKdc8txW4b9+qXn+AKuNxpc/eC2kmP1iNB6jkucg==
X-Received: by 2002:a05:620a:278a:b0:7d4:5a4a:ceaa with SMTP id af79cd13be357-7e3435eb345mr833043585a.27.1752761822486;
        Thu, 17 Jul 2025 07:17:02 -0700 (PDT)
Received: from [10.143.245.182] (87-95-12-98.bb.dnainternet.fi. [87.95.12.98])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c9d2f96sm3045004e87.120.2025.07.17.07.17.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 07:17:01 -0700 (PDT)
Message-ID: <6fa096c2-856d-4ef2-93d0-da4c5022a354@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 17:17:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] spirv-llvm-translator: drop tag from the
 SRC_URI
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20250716144749.1880959-1-dmitry.baryshkov@oss.qualcomm.com>
 <CAMKF1sqkK1o3e=ehvMhkBGTFVuvPMQF0LusEYYDURfdgxLitmw@mail.gmail.com>
 <CA+chaQeEQ2EKt8RdZrDiae54NE0Tidq1_md2zHQJATpX7=5X6Q@mail.gmail.com>
 <27vjhf4ojfpwvsbdxkboo5hgoaaj7ongeax5icelqv7trobh5c@vfj4cn4mm5h2>
 <1a2f4fc1cc4dc0b911968695c4ccb60764f8bf6d.camel@linuxfoundation.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1a2f4fc1cc4dc0b911968695c4ccb60764f8bf6d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Proofpoint-ORIG-GUID: DtNjBFgcHt5dB0OlFszxrXLDDl3-F40P
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=687905e1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=G1XBu1ow44TIBf0dtryxDQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Q4-j1AaZAAAA:8 a=YJPSJMZwKlDGXGVEPBsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: DtNjBFgcHt5dB0OlFszxrXLDDl3-F40P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDEyNSBTYWx0ZWRfXzOYOK0t005DC
 Vw7E9mmVSgPIIt0ei18lEBrLmfk3n2ofjPQ58ZQFSXLnMGPXqu9tR/AShONAcNdZbxiFV/ZBXaN
 xmNn/CBEkoImptJK1Lb0GUyT7gnAp1RCu73IGkyDw9J/PbU6TzK3VdMHXPvj762TQY6Hqgwvaws
 XgPC3KK7rhfRcMIa3QBI3UIU9dtoXO46NlLl+9LAbDSU+n4bzLtRcW7rgug+OVPc/+4gzqlj+Sb
 FIqjb41J+HUecmzHrAlGIBcZc3CQA7RfoGSFLQ5YK5bUW/bmfK+U69RTC2eACuuGh6L7CGCzoo0
 oiIiRsV4vRhBX/X1APCJaLATscf0a9dgeV7mFk91DQxg5oKBl9z2wFq04eWlIEvXBQ2UllxNHL9
 EG3dfdGtD7ujEbzjBZ3Qn5voUrles+YinRvUaV5dpLZVBWWoitFksaLUkgtM09SyB8Pup/ll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170125
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 56HCTk3g000567
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 14:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220547

On 17/07/2025 16:17, Richard Purdie wrote:
> On Thu, 2025-07-17 at 16:00 +0300, Dmitry Baryshkov via lists.openembed=
ded.org wrote:
>> On Wed, Jul 16, 2025 at 05:14:34PM +0200, Martin Jansa wrote:
>>> On Wed, Jul 16, 2025 at 4:56=E2=80=AFPM Khem Raj via lists.openembedd=
ed.org
>>> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>>>>
>>>>
>>>>
>>>> On Wed, Jul 16, 2025 at 7:47=E2=80=AFAM Dmitry Baryshkov via lists.o=
penembedded.org <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.o=
rg> wrote:
>>>>>
>>>>> It seems under some circumstances the tag in SRC_URI can prevent th=
e
>>>>> recipe from being unpacked correctly. Drop it in order to let bitba=
ke
>>>>> handle the recipe correctly.
>>>>
>>>>
>>>> I think we should look more into underlying problem. I have seen pro=
jects create release tags that do not belong to any branches and can crea=
te fetching issues using nobranch=3D1 helped in such cases
>>>
>>> I think this happens when the git repo tarball already has the
>>> revision from SRCREV but not the tag yet.
>>
>> Most likely. I don't follow exact timeline of the repo, so it well mig=
ht
>> be possible that the tag was pushed way later than the commit.
>>
>>> Adding tag param to SRC_URI only when upgrading the version helps in
>>> some cases, but not when the tarball was already created with the
>>> right SRCREV.
>>>
>>> The only work around which worked for us in webOS builds is enforcing
>>> to use annotated tags and using SRCREV of that annotated tag (not the
>>> SHA of the code it points to), then either both (SHA and tag) exist i=
n
>>> the tarball or neither and the repo is updated before the tag check.
>>
>> This might work, but not all repos apear to be using annotated tags.
>> Maybe we should extend bitbake to check for the tags in Fetch code too=
?
>>
>> Khem, Richard, can we please pick this patch?
>=20
> I'm not keen to start dropping tags without understanding what the
> issue is. The fetcher should notice things need updating and pull in
> the right pieces. If that isn't working, that is the issue we need to
> fix.

If the analysys is correct, the SRCREV is present in the fetched=20
sources, but the tag that is used in SRC_URI doesn't. So do_fetch=20
doesn't perform any additional fetching, but the do_unpack fails as it=20
can not find the tag.

>=20
> Cheers,
>=20
> Richard


--=20
With best wishes
Dmitry

