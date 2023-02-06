Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A889C05027
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 19:14:06 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.63173.1675710839301089510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Feb 2023 11:13:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ni.com header.s=pps11062020 header.b=3CbLzbWb;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=14017bbb0b=alex.stewart@ni.com)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 316IHb29008933;
	Mon, 6 Feb 2023 13:13:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=/861SoOAFXj0L9qjyckBtEXTWujYmMMYr3u19ZtwAgs=;
 b=3CbLzbWb9ZFXEX5c71rQVHpFFhEGL8tbpd9sKEZAWztrjPNuq7x5kLA2mU5P4+Jkm5fJ
 8wh/j7T0wPw7IvhtrAb+YyM/kLLccA9z1NhsuIvia+P/DpajggH2Br81TPYRLWWGsGlq
 cVhFkRUw9MLeDKlvoryoguWE+xYaP83ZYAbsBCYFfGoZ4bJBNJHtgUM+bsme6z+ZhjTx
 gR+Kk6QOA7VKZdpFZA3aZn+17ndATy9KoGpK0Dqc0XQUtLB7cBmOYMKJETxOOaDmyGlg
 hxvHsOmUyWeggnwyTG7Kkk/NJojRXHdIoU+W76yPsA3BChZQLnm16BkXla0iW4t8JRo2 jA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3nhn76cvdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Feb 2023 13:13:56 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T1d3fJXv34RsojpI740svA74ogcUeoEeZa3tQmtwWJave5h7ybTrlNJrByH3cRvTrUdxpKLVwVD/yAibnVxNrllz5bkt8OwIeVMI+X/d1+RIhtb8gEkizAcrDJ9u/D9TrMAs871vXk77U/bR2uju2PFqG9rqNCaNKoDEDjWq/VbIHYEitsZ8c2AmkJJ5ZPlVAippgWaHtVOhZZJMcm78xp/WPzq9DZtmF4mg9byZvfYnW8uT6I1fgCKCF8Av3gPohIwfr5mRa2xFU4EgjOij4tA6QEe3V4VGd/WEik7V+HYmNi5pfasEePQlM+oKoXniWbfLyJ9tny9wNmCwzTiGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/861SoOAFXj0L9qjyckBtEXTWujYmMMYr3u19ZtwAgs=;
 b=L9a22z0vSoqy5SuY+dG7TmysRbgCKgU3QkUrVJjDZOYJuVEEsSeTSAPNytg0p6jLiNNIzIOb/jJeRu1Bnj398l2nQ9786qN7jlnPOs0WUZyop6wjWjcUHpz/yCPNGMQSMne4O0YJ+1+WSJl6fI+3SL+mEOW008EJO+qYri6jA8ODkQZBfmuh3n8BHUnr1b4ccOZQCl/i8mE/z5APRSprGYtIXZqpmSDiIg4mTdQ7i9ASojVrNx30Lv0MN+0S+6GiD91jMn1ngnzTIZHxchsE2Ub/E9LOYzV0BAfgUCHo3AVWnm1Sv9W4fmAu2l2zWyQ7Gawx2NlpiqlaMLqo61U2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/861SoOAFXj0L9qjyckBtEXTWujYmMMYr3u19ZtwAgs=;
 b=ALaDsS2kNIPWzz1xp10cpBmil+lIp6opkbIFrAZg7x3LR/X91RBJyLrtXg3z1jTbXjoE6mkaLfa0L3UA7FlO5nrJjKwyJQTOqlxQR7A8K/UBY/r7E8ajPOxJ7AE4zuGr2cPul5npQJk3t5ExypRUGO7UrkvU72xxLewyUpQrtPA=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SN6PR04MB4494.namprd04.prod.outlook.com (2603:10b6:805:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Mon, 6 Feb
 2023 19:13:46 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::a2a:9230:796a:b163%5]) with mapi id 15.20.6064.031; Mon, 6 Feb 2023
 19:13:46 +0000
Message-ID: <af2d6db6-63a3-2fac-cba0-2c99abfb5b06@ni.com>
Date: Mon, 6 Feb 2023 13:13:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        Joshua Watt <JPEWhacker@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <6eab52f4-8666-294b-3931-8a111b60627b@ni.com>
 <a23ee023a5ead9c3d66a69b101a8facca3b3fdbf.camel@linuxfoundation.org>
 <80111487-04f1-0c45-4a8d-bfc927b2a812@ni.com>
 <37c8978068ff257016d559e27e513a23a695947a.camel@linuxfoundation.org>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <37c8978068ff257016d559e27e513a23a695947a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SN7P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::8) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|SN6PR04MB4494:EE_
X-MS-Office365-Filtering-Correlation-Id: 25224a19-7e2b-4d3a-9fa5-08db0876450f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hgxvGDQ+Rj784dTxICLiKdBxytM0HdrfmzA5a+6szn8BZ8wPDvrHDKooEDKShJsC9a7Pro1aUuHxbOfiRs9JNzR+1feaVGJArzHI8uIehUw4AT9S+9Mrab3V/xsYzXWZEBC5NZn2+lb2ckCAdyxcsncZE6zgB84grFtjuoGKeJCL/Pc9d9KWC3f3Ywhhb/v2s/oUjOch2v7v9QuTyH0K9DrPUWKfWf8X3AaEj28vRI1AHiTZXXGmcik93MUtt+OpGM/H3UmF5uG8lyBBTN1JhjKuHMxw0CZGEgpM+Mgdhi4Y7crQNQmzaPlv7fdKvdIannPkm/7FVs/UJGppreEOkIn13p9lUi26Z0FF1bHHh6C+9HfOZs76M08J+J+FYd1UuBoeN94mURo3eydLjNwCtMyTq7NDcOw6rdxLFI1AkvbA+/c20yyrO901B3gqKI263ebdSn25v/fViBFJ9pmj783Rg6cQ0blqBraVKWslm7gHpOY/2RlTGJFA93foCBxwcasQInvvzHk49NJaCmS/n/K9RtXrMqAdQaCZipGlvmmPdLs4IP5apSPPYeTeym04eIem1q6KHMvbaSjnmk0b1SKS7Ie6zMx4UesgG6O7ry+ODyrBG8bnX+ovEbVjhrE06GpG1DcSO/AqSPwcDtgZHemSegrQavgFsx3TFL5FIsCVUrNi5Wx/nFBYzc6HJP2Htr3qdU9Et+IvDnnNNRyC0mjKULnXssa/D+Xzi/oQLBU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(366004)(346002)(376002)(396003)(451199018)(6506007)(41300700001)(53546011)(26005)(6666004)(6512007)(31686004)(2616005)(186003)(478600001)(36756003)(6486002)(31696002)(8676002)(86362001)(66556008)(66946007)(66476007)(36916002)(38100700002)(4326008)(5660300002)(2906002)(8936002)(44832011)(110136005)(316002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UGdha1U4amFOQnQvOUV3VllES1BsVjAvSGJoTFkvemtSZ1NVY213MU5QZzJs?=
 =?utf-8?B?b3cxRkN3eGR2bjNnOEpJeWVFd2ZmRDdqNDNvb1dpNmdyUCttZC9kbXVkZEZp?=
 =?utf-8?B?V0ZTUHp1R1NZdnFSUmFUZGI0dVlHQnN3Zk5hOHFpY0w1TElYWjJxN1o0d1BN?=
 =?utf-8?B?RjJyUEFiMGVTNXgvTFpJV3RYUkoveXEvY1pBT2xNZEdXYjA3QkYwR3pKQkMx?=
 =?utf-8?B?WWVKbHU3Q1ZjRXFNRzVsbzZURG0vMGFRSGxPVW54OExpWjhQTmY3NmRoRXFS?=
 =?utf-8?B?V3cvaGE2VCtUQUVXcXpuUVNSbnNpbFFwNDFzNHI1YmxBWVAvbkp5R056OTF1?=
 =?utf-8?B?eXZOSlBHOGFvZ29qNGlZZm1vZWx5OXNSWTFmMDUvZ2Y4NlovN2tSbnUxREVz?=
 =?utf-8?B?R3R6WHd4K0EyVTRJZTEzemZ3K0gvNTVGU2doaytQdG9uZnl5U1NSeFNGdTZR?=
 =?utf-8?B?UTA3d1hDN1VhTC9mWjRWcFRFNnJ4bDgzaUYxQjdGVnRXWHhkdUpKcG9PRVRi?=
 =?utf-8?B?QVZqc1V5eHgzZmoyaHZjbi8zd3h2L0g1bFpwb0RDZU1ZT1cwb1JWV3JLalBC?=
 =?utf-8?B?MlVLclV2WlJBNm1YYjdIMHpLNW5qaTBVTWhNL3pFNktuRm1oNlFMeE51QytV?=
 =?utf-8?B?N0UrOTY2SXUwNjVLNVdSczlxellnczBYdXY4eEkzeml4dGtMakwxcVZ0QnM4?=
 =?utf-8?B?UWdRa2pRODNRK2lBTndTNXQyN0ZjMlZlZlY2MWU4Q21yOTRVZ3UvRGI4ZFlB?=
 =?utf-8?B?aUc3bWwyYVZXNHF1VmRhQzFpdEtSalpCcUVFM2Q5QW56dHJScFFIT3U5bG9G?=
 =?utf-8?B?MXBvWnkza2h5UkNnUDN3T3RtWFRnWWlpQUkwd3BQQnRlcHYyWExZdzZtZGpi?=
 =?utf-8?B?T1NmSlBJM3VKOXFLL01leWNnRGNxRjhCSi9QOCtKTk5jemRDZERwKzRhZVlO?=
 =?utf-8?B?TXlhODF1bXJlWUNtbG1JazhCWGxvczVMK0NtNzl1NmgyS3FyeU54NUlCTUMy?=
 =?utf-8?B?STZYNG4yMnRjSk1WZTRHWVh0cHBjY2hxdUwzUUZoVzBNNmFIbFRra3NjYnhQ?=
 =?utf-8?B?TmtVVm5OV0hESzFWVUxOU21Vem9iSlJMRnVGU2ltaTFOSTJmSVVDbFkyc1pN?=
 =?utf-8?B?MlViTHFreGtsTHFNVXlHYmRiOTdOVmdkSmUvY0JYdTlZYU83RGRnMnZFS1l2?=
 =?utf-8?B?WWtrN1hQV2pwWjRVb29XOHBLK29pR016bStEaUkvYkd5elFtSWZ3R1RtcEVl?=
 =?utf-8?B?dmplMDI1RjlBYTU5UmJzWEVMNVlva3AvMDgvZm9tT3VlOVovOXV1eXFpVFRh?=
 =?utf-8?B?ZHU0M0ZEZEx2eTM0ZmVzT1BrK2FqS1VYRUd0NTZEV2pMSE45U2xPNU1uaVQr?=
 =?utf-8?B?QUxsNEdkN3VoQ2w0UzdIYlNoM0YvNWdBL3F0VGdTckZHTXNPQTY2bTMrVjRF?=
 =?utf-8?B?SERweDlxRXE1dzNGbytBQk55bm5YZHN5NThZbzVTU1hLVnI3SkpJeWw1blhW?=
 =?utf-8?B?Qlk4WnRvY29QaWRmNzBWZ3ZUSnQ4UGpTMTk4b05mQWxsRTZVTTRIbm5XbE1t?=
 =?utf-8?B?YU0yU2hBZ3BnT29qUXZtcVc2aTF5MHlFalJPV3B0bmJoSVppZWp0VVNMNTMv?=
 =?utf-8?B?L3pPOEt4RWFmL1FUb2EwUXk3ai9Fa1IvQVNTZ3IvM25WWE5EVUdlTDFwK09H?=
 =?utf-8?B?VlZtMzVuNWp4ODdYdjIxeThWbnk2V28vcklMSmROdVoyTkdhSTR5Umt3a0Fs?=
 =?utf-8?B?U2lNMVJ4NXJBYVdZNktwTEk0Yk44U1VDb2RUQ0xJd2ZKUTZRb1QxR2FuQWkw?=
 =?utf-8?B?MHJMMTYzRDNiVE9BMlBPWFhySlJ6NElTTklIdU81L1c1Z1ZPS3g1dXUyVkJG?=
 =?utf-8?B?b3BFVzhuZUVQS3dWUWc4cHVYZ3ZGM2t4eHJXUkw1dXdnNG83NlkrNVFtMmhH?=
 =?utf-8?B?b1AzWFRjSlllb2dueTFERGtJbzRneXc1YXYyYlJPNTBsU0hDTGtVWWhzWHRy?=
 =?utf-8?B?NE0wNzQwZTRNUUgrWGRRakQ1cWdUcGQ5ajV0Ny8xY2lWaU9BRTBjUXpJUXVJ?=
 =?utf-8?B?WXRFRXluVVFyUUFBRFVTUXN4cEJBajdPK2hRSWRqamtYSklrNnQvYTlTWnRr?=
 =?utf-8?B?M1FLY2d6dU1hQ3R5d2Z2RS9KSk1MaUxwNlR0czBuUHo2Zlh6OVR6WXlhQ2RZ?=
 =?utf-8?B?OGc9PQ==?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25224a19-7e2b-4d3a-9fa5-08db0876450f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 19:13:46.2278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5X3FN4QRhzC0RmaErbTOMexxjPXMJ1qkRuIK5w4nk4YnCNEztRvjd8EfvY0/G7uTbsk0Xl9AiM3Ud+plZxdX5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4494
X-Proofpoint-ORIG-GUID: ANRIXBBNCsC4vMr4Y8zx9wSIQWl0zmKH
X-Proofpoint-GUID: ANRIXBBNCsC4vMr4Y8zx9wSIQWl0zmKH
Subject: Re: Re: Re: [OE-core] SPDX 3 and OE-core CycloneDX support
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 adultscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302060167
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-00010702.pphosted.com id 316IHb29008933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Feb 2023 19:14:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176793



On 2/5/23 08:11, Richard Purdie wrote:
> On Sat, 2023-02-04 at 15:47 -0600, Alex Stewart wrote:
>> On 2/3/23 17:06, Richard Purdie wrote:
>>> On Fri, 2023-02-03 at 12:26 -0600, Alex Stewart wrote:
>>>> Hey Josh,
>>>>
>>>> I have been roadmapping SBOM generation for NI's yocto distro and ha=
ve a
>>>> few open questions about the future of SPDX and the create-spdx bbcl=
ass.
>>>> Since your name seems to be attached to both of those, I figure you
>>>> might have the best insight here.
>>>>
>>>> Also posting to the OE-core ML so that this discussion can help othe=
r
>>>> members.
>>>>
>>>>
>>>> 1. SPDX 3 timeline. I hear that SPDX 3 is going to be a complete rew=
rite
>>>> of the spec, with more support for modern SBOM discussion topics lik=
e
>>>> VEX and more comprehensive vulnerability tracking. And it also seems=
 to
>>>> me that the timeline for its release is very behind schedule [1], bu=
t
>>>> still in active development. Can you give a SWAG for how close that =
new
>>>> spec is to completion? Are we months away or years?
>>>>
>>>> 2. If/when SPDX 3 support is released, is it to be assumed that the =
SPDX
>>>> facilities in OE core are going to be upgraded to handle it?
>>> Assuming someone does the work, which is likely, yes. We did namespac=
e
>>> the class in master to prepare for that.
>>>
>>>> 3. The rest of my org is interested in CycloneDX as our common SBOM
>>>> format. Have there been any discussions about supporting CDX SBOMs i=
n
>>>> OE-core? Any blockers there; or is it something that my org could au=
thor
>>>> and upstream if we decide to go that route?
>>> At this point OpenEmbedded/Yocto Project has decided to go the SPDX
>>> route for various reasons.
>> Are those reasons documented somewhere?
>>
>> Something about CDX rubs me the wrong way (besides it being named like
>> an off-brand printer company), but I can't put my finger on what. So i=
f
>> there are technical reasons that it is less desirable for the OE
>> usecase, I'd like to know about them.
> I think I share that same feeling but it is hard to put a finger on
> why.
>
> I'm not sure anything was documented but there was a discussion by the
> TSC when we made the decision. Some rough random thoughts:
>
> * SPDX did go the extra step of becoming an ISO standard
>
> * We (as a community) have much better contacts with the=C2=A0SPDX
>    community. It is a fellow Linux Foundation project.
>
> * We already were using SPDX license identifiers so this is a natural
>    progression/alignment.
>
> * Looking at the CDX repositories and mailing lists, the discussions
>    and contributions do look to be from a much smaller ecosystem
>
> * SPDX are interested in engaging with us, which as Joshua mentions,
>    does have benefits. If we run into challenges, we can=C2=A0likely=C2=
=A0seek
>    help. We're actively involved with 3.0 which means we can hopefully
>    ensure it works well for us.
>
> Both specifications do encode roughly the same information so the
> project alignment with SPDX and the "social" aspects likely tipped the
> balance.

That's good context. Thanks.

>> My understanding is that CDX has better support for embedding
>> vulnerability (+VEX) and attestation elements into its DOM, which is
>> something that our Aero-Def customers will be interested in. I suppose=
 I
>> can build workflows to add that information after converting the OE-SP=
DX
>> document to CDX, but I'd like to integrate the whole thing into an OE
>> build, if possible.
> I think CDX added VEX information in the last year or so and SPDX plans
> to do so in their 3.0. I have had the feeling it is due soon.
>
>>> I'm not sure I want to see two formats being
>>> added directly to the core, the better solution would likely be to
>>> translate the SPDX output into CycloneDX if/as needed.
>> I'm concerned about the lossiness of that conversion. Based on the
>> CDX-SPDX mapping document in the cdx2spdx tool repo [1], they seem
>> roughly compatible. But I haven't been able to find a clean tool which
>> converts the other direction, nor a mapping document for the SPDX->CDX
>> pathway.
> You could take that different ways but it could mean people aren't
> finding a need to convert SPDX to CDX, meaning SPDX is working for
> them.

 From what I've seen, I think the SBOM ecosystem is too immature to say=20
whether one is preferred over the other. It seems like most folks are=20
just working with whatever falls out of their static dep analysis=20
tooling, or gets handed to them by their security auditor.

I haven't yet seen evidence that any of our customers have an SBOM=20
*pipeline* such that they would need to pick a common spec; but I=20
suspect that is coming.

> I don't really want to have two partially implemented SBoM mechanisms
> in YP/OE so I'd probably suggest any CDX code was a separate layer at
> this point. If there is actual missing capability, I'd be asking SPDX
> to resolve it :)

Understood. I'll assume that we'll have to maintain our own layer, if we=20
go that route.

> Cheers,
>
> Richard
>
> (copying Kate Stewart to the discussion)
>

--=20
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


