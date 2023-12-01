Return-Path: <quic_vkraleti@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5EEC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 07:02:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.17345.1701414123729785491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 23:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=XV42UtsW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vkraleti@quicinc.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B15efcY011244;
	Fri, 1 Dec 2023 07:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=B+sA2/+29x6qGR5+1hS6J1Y5E197Y2RQOZzzpy+eUzE=;
 b=XV42UtsWt4VnXpId5osNdTibo6xpfjSjrq792qukyswk6hpyRlF3uYF4cFgMMLY1ZH49
 8rq+6ZHt4WHOikK9jqbbr4Wg5peDtKS73DYOn0QV2GLcG6i99XWg/Nw/4CKeM428gMms
 gao8KCbhWlaHy09qnxGH9Il70rHLeBluzXmDAMD+cIZuAURA51c+DuYcsNk3V63QOnA0
 yy/L0u5ZA2pN7vbfMGZC94UUcJd8JvxoSSAR+9scK7gPJFfBLTIp5nTx0pb6XDBqGaAe
 aG6srv5dTYyv1aqfhbXImZkl8DTu6FIcJDD3sM4z6sN+Lco/sCIZfoPzjijhZj5WM4Cf 9w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uq9hyg4er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 07:01:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B171vYK003711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Dec 2023 07:01:57 GMT
Received: from [10.214.226.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 23:01:55 -0800
Message-ID: <e4a002d5-eb1e-4a27-9146-cd61d43c80e5@quicinc.com>
Date: Fri, 1 Dec 2023 12:31:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] systemd-boot: Extend recipe to compile native
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Dmitry Baryshkov
	<dbaryshkov@gmail.com>,
        Ross Burton <ross.burton@arm.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <20231127145643.986904-1-quic_vkraleti@quicinc.com>
 <56AF193C-6DA6-435A-8C6B-06EF0F5B15F3@arm.com>
 <CALT56yNtJMP8rv+7MGOCL-bPn2XnDVLDVa2SBhVmTiFZUGDp5g@mail.gmail.com>
 <DB5PR02MB10213D5B2D471CCC65EFAA4ABEFBDA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Viswanath Kraleti <quic_vkraleti@quicinc.com>
Organization: Qualcomm
In-Reply-To: <DB5PR02MB10213D5B2D471CCC65EFAA4ABEFBDA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f7NzNAJtgUkP7XjBMCtj2p7puXMRs1-E
X-Proofpoint-ORIG-GUID: f7NzNAJtgUkP7XjBMCtj2p7puXMRs1-E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_04,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=799 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 07:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191558



On 11/28/2023 4:38 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Dmitry Baryshkov
>> Sent: den 27 november 2023 22:05
>> To: Ross Burton <ross.burton@arm.com>
>> Cc: quic_vkraleti@quicinc.com; OE Core mailing list <openembedded-
>> core@lists.openembedded.org>
>> Subject: Re: [OE-core] [PATCH] systemd-boot: Extend recipe to compile
>> native
>>
>> On Mon, 27 Nov 2023 at 18:49, Ross Burton <ross.burton@arm.com> wrote:
>>>
>>> On 27 Nov 2023, at 14:56, Viswanath Kraleti via lists.openembedded.org
>> <quic_vkraleti=quicinc.com@lists.openembedded.org> wrote:
>>>>
>>>> systemd has ukify, a native tool, which will combine the kernel/initrd/stub
>>>> components to build the UKI (unified kernel images). systemd-boot recipe
>>>> isn't providing this tool.
>>>>
>>>> In order to use ukify, one need systemd-boot native recipe that can be
>>>> added as a dependency to get the tool under recipe-sysroot-native.
>>>
>>> Feels like it might be neater to just have a new recipe that builds that
>> one binary, instead of a mess of overrides in an other wise simple recipe.
>>
>> This was one of the concerns during patch development. I suggested
>> patching the existing .bb on the premises of having the same version
>> for native and target recipes.
>>
>> --
>> With best wishes
>> Dmitry
> 
> That should be taken care of by requiring the systemd.inc file.
> 
> //Peter
> 
Submitted 
https://lists.openembedded.org/g/openembedded-core/message/191557 to add 
a native recipe.

