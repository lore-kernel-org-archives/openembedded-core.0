Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8281BC636CC
	for <webhook@archiver.kernel.org>; Sat,  4 Feb 2023 21:48:03 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.16732.1675547276184677683
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Feb 2023 13:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=ozs7R9xw;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=139987d744=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 314L0P0X010181;
	Sat, 4 Feb 2023 15:47:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=/JsQ2zY17V7kznFMNNPVFErtHaNw2WcLPVj0/PkJAh4=;
 b=ozs7R9xwkzgYwdgXct0a4XSLxGmY7LIQIHWMKv9d3JvemfV1TYTx8+F9/mkJZlkJil9a
 VaRwBuXXm6UZeGxb8IBtgsa2OPqhdfngFDztZtkmXWeUJhkvM9FPAE7bhRx8jSsKr2O6
 g5tOXBr4FxsTn1b1z2CfnakLiOmF0mzDC/iUVuJPmYZuz10vXFSUlKogPi4vgZVi1IfA
 DgsAVCm1TCC6bXNJBBj/UKSpQ++bLQotdnp0ZaERM9FXjtab/qfiqyp2xFZTPtoPQhqd
 wSi3LVPZ1R5Cg35zTrfmTw2UqHU2nzyzsPlz0fnx8gOj4JnS/ppGtv+cKtYMA+2mjnCy pQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3nhp2brpjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 04 Feb 2023 15:47:54 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvCxrYiCqAaACtkiTGp7WyWw0HZmzvCgP8OGlZYUaaBxdCM/AnnmqPpVEm3obb4kOHJhOHxljsO3pC01jNKTVQ71D4P1nPKmeUCdnI+/N5vhZdnaVQWAFv+Y2G14wXqR2zstQoRDV9E5ld+p8IlM+YbhwUdhzoUegTYhpf8dhk+/Al1OkqKhle64mxvpfqWZwWuVtlnWG355gwnwxKw0Lq6iUrFurijdCwyinfImv6j6NARoJeFayCnisG6f4p0MTJyDxNHOkFKvNiY9IVCuETGZQbHP/sGzCh4lwdKammhf+KFDLPkfSR0sxcj8CeMT4uExF/ufu+5qnaqSgZM5Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JsQ2zY17V7kznFMNNPVFErtHaNw2WcLPVj0/PkJAh4=;
 b=LYdd4qUd8oVbW1IdXjcrYZdS/Rv0IhnCMbC+8YrH7c0sZfo/RGoB6XDsJx/wcKcj6jVZbgXuSLlZU7LxBdE9o6ONLgKe3X0Pn+jIjQFL3v9JdSzd1+SVpYgdvSdPUDeA5XaYy/TNtVqiBmglSwZleAFK+DHJHjSVVPr6Kt5pSwQbvrqKqkeRCnPnGA6wffakCcyMilbRByohZNnCpLAeS3L5EELbOGApZiSsYjUvOa6HGEpe93lq72lptVJVAFPlQBQKKd29AlZczhUJ9TyyjzXeHL1jtT4xaf9RiU95ef3ctS6aipXpWsZ5+Z88ooejmFFUFhZdphRW2gfLXV9Nhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JsQ2zY17V7kznFMNNPVFErtHaNw2WcLPVj0/PkJAh4=;
 b=Ua2MUbGJJYF7DDYt2/v+SxlYNktTlrcQP+f7Zoz7mCQrf2CNwQUNJVuEi5ILExaAqvjAotWJbNzSee+izVwHKsUaqwd08rWJ7JUFkgiqP2rCc03sJquYaF8avJ8J7Nob6MUNlAd3T7t08o0IBQ85f8n5rfYN0NuUqlXWlfqYmxo=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BN8PR04MB6292.namprd04.prod.outlook.com (2603:10b6:408:78::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Sat, 4 Feb
 2023 21:47:51 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163%5]) with mapi id 15.20.6064.031; Sat, 4 Feb 2023
 21:47:51 +0000
Message-ID: <80111487-04f1-0c45-4a8d-bfc927b2a812@ni.com>
Date: Sat, 4 Feb 2023 15:47:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Joshua Watt <JPEWhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com>
 <a23ee023a5ead9c3d66a69b101a8facca3b3fdbf.camel@linuxfoundation.org>
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <a23ee023a5ead9c3d66a69b101a8facca3b3fdbf.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:806:20::25) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BN8PR04MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b696d0-0dba-40dc-5d34-08db06f976f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ymLtWCt/pzXuwT0ihH05YgBitbDHKlSSbp4Abrdt74WHe7NB/nsO9o+CmERetwt+6ACVihcgaou5t00hsD8mq7eGRLTvbcF5QTq2K2xRaYx5dWp9HCiww9GvOFtMgKTQSc4sKCSaDEGRqFWYOc8aGjlc+kfDjH+SY4ABuKO5VsvTjOqDAmbDtLSl/sFIyNF48YeRNkrSkenLEUeEn/SHUPkTwM34iLUzC/5hrKdkPrk5yLkJyn6ApPyjZoPYxTGAT5/XnfrBTv5g8Y3Fhs546j3t25R50RLI7CIHnpW8B/uCFhjSJTilvt8UdJfZl/xsp4pyd2bbb/aWym99ZTBqwADMTqgtXT4gcPVtTpxu8i0s430rMBKwV2IOO5L90RFUrUor9DLnHiMS49mR3fe56RVNokmQhi0qp5y0NZBJnZ0Wu86DC+ZrDZTR5xuPyNDiIklSeaGy8W1vdM/IHz+Uo7+W+cr9KVikB4S3Sp5sVt96EIv6ZauO2LXriMGyKOTMv/SeGVX/da2+ZEeb5nb/UUU1So584eGrnx7vubpgu34JGljsvHDlh58RczpS2EfTCWziDNrcqzlo7YJz5OAKrrvvcn86KH6ojaApKv21yv3qLAac3YvbKUBbWE76Ru8ViNM1mFnL5c2eZSqJ67XmcglsL6sFCJcUU5Ke6IDA/uSVxv6S62CicnNoSS6uWY3vSXkA/+EibHt/HxYwzIOnYqwn5UzqkAvBdi+tuSU//3A3A9gua0OEKIXx7lr9FmESXcRoW8+iz5XDa9B4GWQpUQFL/sMlTWIcq/TS3bDloXs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(39850400004)(346002)(366004)(136003)(396003)(451199018)(44832011)(2906002)(5930299012)(5660300002)(31686004)(38100700002)(6506007)(26005)(53546011)(966005)(83380400001)(478600001)(6486002)(8936002)(36916002)(186003)(36756003)(41300700001)(6512007)(66556008)(66946007)(8676002)(66476007)(316002)(31696002)(86362001)(4326008)(110136005)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlMyYzduRXlqTjlrL2oyVjg5aHI1SjlGMXNNTXVZWWRVK0xTNzUrMmViRkd6?=
 =?utf-8?B?VUFpRmVNbFV4NHVVbnF1RE0yMUFDWkFsT0wxbllKeXJUMjBqMm9vWGNLa1Zk?=
 =?utf-8?B?WmNWNVQzTWMzY1o3L2d4bnZNcjJ1cXRJaEthQkcyRGRBemZJZlBUdDFYaWlO?=
 =?utf-8?B?K3R0Q1UzVy9lNitPanlRZ1M5elk0RDgvd1hTb2JyOTl4WTBnU1l4eFN0NzEy?=
 =?utf-8?B?UkRHQ1pReitTZDVXeXE5bkl4Z3oyUTNQM2wzd1cyclhiTStnYXh1bFJBT2w3?=
 =?utf-8?B?NXZoQ2lsZ3ViOFJzSGN6UjJ0OGhiUVpFOTVJdEhRRlBqWWRsekhvTlVOaDRu?=
 =?utf-8?B?dXZMS3pzUjFqUFhGMVdsazNXdlVlS0hKN0JJeFEzV2pOSktXOVN0YTRlY040?=
 =?utf-8?B?OG9PMjFoeTZYMDk3Rm1Bc3dGQ25OL1V2eWJaQWpBM2d3cmREME5ERzl5ZXNY?=
 =?utf-8?B?ekFoaVBkVndkd2hYckx3djc1TnJpZG15N0V5akZyK081dDdCaElTd1IvKzBq?=
 =?utf-8?B?Nkk3cFlEZVlRdjVCWHAyYkpVQTJuWlVpTnpXMnlJLzVGdi95Zm4yUTlHeFhD?=
 =?utf-8?B?QUYySEdva2V5OU5aUFJ5SWZZNjdBbDRoMEU2NWZlVVU2Lys0TTl2K3J1RDkx?=
 =?utf-8?B?a1UvRUgxZ3p0b0J0bm9hemFJSDIvV0xJeC85dzh5eHI3VWZWeHB5aVk3ZHJI?=
 =?utf-8?B?L2pxeDNjVEZGaDNGaDhDV0ZHVG5lRld0bEFJZ3NQcFpCOGhSWDQxUHU2REdZ?=
 =?utf-8?B?QlRoTGFyZEQ4UmV3Nkc4TkwxUjF0ZFAvOC9kWk9MMUtuZ1ZkVUo5Sm9TSjlh?=
 =?utf-8?B?REJieEJOdWMvajN2V0Fxc25DK2dnNThDREVoQWlZbFBBR1RmTndWZ0RMTFk1?=
 =?utf-8?B?enZEM0JmS09NbmZxdkk2dEcyRkRUbS9Pckl6UUJyeE9ucnNqNVpJUTB1TC9Q?=
 =?utf-8?B?Q3hma3hUUnZtU0JNVVlnTjluSzFBaHgwZTkrdnR5WWk2WkluKzJSd0g3eDZy?=
 =?utf-8?B?Vm0wN000eDlpdkZ2bElzd2ZDS0FvVlZXdUk5QWhsVFZBWGhJdXhBM1IrU0No?=
 =?utf-8?B?eUhpVkp3bTlNbHFNYUlaZ2MxcWE2ekIxQmpiS3Urak5GeW53MUFnbUdGTnAv?=
 =?utf-8?B?SStXcGgwank5RndxdHhwSk5Sbzc2b09sSEJ4UGt6SmlpMWF6RE91R1hwbGgy?=
 =?utf-8?B?cHJiZ1c5R1JpNlZGMmVNRElNVm5CRjBLbFVmQVZGMG1Qb1NPWGs5VS8yc1lz?=
 =?utf-8?B?VzNGV2IycmdDRTAxM28zcXFHZ0w0WEYxejQxSmtVbmZ6NFArUjVrN0VMK1ZQ?=
 =?utf-8?B?UVMyR0NjUmdLZXVwMVdRaTZJdkp3U25HYTV5TStZMi8rbnl2KzU5TzREN2lo?=
 =?utf-8?B?dGJjT0ZuVHhMUzNGeEt5WUx1UDBTRkNQNXRlbUpnTzQxb0RSRURzZ25zNDYv?=
 =?utf-8?B?aHFaeGpDSVZXT0R1VmRDMTgwYVEwLzdmZFhhVDZyZ3ZLVEFKRmUwR0pvZlRl?=
 =?utf-8?B?Z2ZGaW4xWms1QTlHNThLVG4xRkFWcEg4YTZXVS9Lb1FsSWFVQ3RCNmE0c0hr?=
 =?utf-8?B?bXYrZmx6L1g5RXg4VVpqbktCczFtTmxkdk41cGVWenAxRXJsSUFPMFhtdUw0?=
 =?utf-8?B?V3Jsc2FGM0kxeEw3Ky8wNGVtanJZWEFER2hROTBiam9CclEwNG1VeHF5L3pQ?=
 =?utf-8?B?ZlNla3hMT3JaenZyYWNjTUY5R25FTUFVTWo5czVJWFYvNFNWUk05V2liUVBS?=
 =?utf-8?B?MGY1akpSQlE2QU1wbmVXV2pyWWQ2SjBSTk5sSVBYRnUzOGkxRzBMRnhWVDRt?=
 =?utf-8?B?S1BMOCtJemdPY3M2ZXo0aVY3R2ovdHpISmN4R0hYd2hyOUI4RWV0YjhjRHQ1?=
 =?utf-8?B?bUFBNTdXVStHdjluUndSejQ5YXFlaW53TGNwY0ZxN1RrNVBaMS9qTmFMa0dl?=
 =?utf-8?B?Wnpkbk11dllaU294ZzhrRnV5eVo5NU9KYS9ndXhBeEowMkdXRjROUkpoa2dD?=
 =?utf-8?B?ZnpYeUtodm1QN2laWDNQd3hIcHRYYVdvTVI4RDZoRGQwN2dCRGhRODBkOHcz?=
 =?utf-8?B?cHFxZDJDemxJbm9BY0JSYVFna2lOcUF0amVZV1BWbEJEUUYzSU80eTF6ZlZI?=
 =?utf-8?Q?VmxXBWVM8O8HmFXRPDBg+jOYs?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b696d0-0dba-40dc-5d34-08db06f976f0
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2023 21:47:51.6238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RM14v9GdwE6+hQIWeHY+fZPZgNkI4/pzKf42gXIsIMKYdlo+u3EtwrscivUBzGBs3THBFGfHVktnxjTxhJIPnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR04MB6292
X-Proofpoint-GUID: kotf9CO0zrOWbaMhiwuGhxEZGgIOoIRN
X-Proofpoint-ORIG-GUID: kotf9CO0zrOWbaMhiwuGhxEZGgIOoIRN
Subject: Re: Re: [OE-core] SPDX 3 and OE-core CycloneDX support
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-04_11,2023-02-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302040196
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Feb 2023 21:48:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176767

On 2/3/23 17:06, Richard Purdie wrote:
> On Fri, 2023-02-03 at 12:26 -0600, Alex Stewart wrote:
>> Hey Josh,
>>
>> I have been roadmapping SBOM generation for NI's yocto distro and have a
>> few open questions about the future of SPDX and the create-spdx bbclass.
>> Since your name seems to be attached to both of those, I figure you
>> might have the best insight here.
>>
>> Also posting to the OE-core ML so that this discussion can help other
>> members.
>>
>>
>> 1. SPDX 3 timeline. I hear that SPDX 3 is going to be a complete rewrite
>> of the spec, with more support for modern SBOM discussion topics like
>> VEX and more comprehensive vulnerability tracking. And it also seems to
>> me that the timeline for its release is very behind schedule [1], but
>> still in active development. Can you give a SWAG for how close that new
>> spec is to completion? Are we months away or years?
>>
>> 2. If/when SPDX 3 support is released, is it to be assumed that the SPDX
>> facilities in OE core are going to be upgraded to handle it?
> Assuming someone does the work, which is likely, yes. We did namespace
> the class in master to prepare for that.
>
>> 3. The rest of my org is interested in CycloneDX as our common SBOM
>> format. Have there been any discussions about supporting CDX SBOMs in
>> OE-core? Any blockers there; or is it something that my org could author
>> and upstream if we decide to go that route?
> At this point OpenEmbedded/Yocto Project has decided to go the SPDX
> route for various reasons.

Are those reasons documented somewhere?

Something about CDX rubs me the wrong way (besides it being named like 
an off-brand printer company), but I can't put my finger on what. So if 
there are technical reasons that it is less desirable for the OE 
usecase, I'd like to know about them.

My understanding is that CDX has better support for embedding 
vulnerability (+VEX) and attestation elements into its DOM, which is 
something that our Aero-Def customers will be interested in. I suppose I 
can build workflows to add that information after converting the OE-SPDX 
document to CDX, but I'd like to integrate the whole thing into an OE 
build, if possible.

> I'm not sure I want to see two formats being
> added directly to the core, the better solution would likely be to
> translate the SPDX output into CycloneDX if/as needed.

I'm concerned about the lossiness of that conversion. Based on the 
CDX-SPDX mapping document in the cdx2spdx tool repo [1], they seem 
roughly compatible. But I haven't been able to find a clean tool which 
converts the other direction, nor a mapping document for the SPDX->CDX 
pathway.

Is anyone watching this thread doing SPDX to CDX conversions as a part 
of their pipelines today? If so, what tools are you using and are there 
any hazards to that approach?

[1] 
https://docs.google.com/spreadsheets/d/1PIiSYLJHlt8djG5OoOYniy_I-J31UMhBKQ62UUBHKVA/edit?usp=sharing


I appreciate the feedback, everyone.

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


