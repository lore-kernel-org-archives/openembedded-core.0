Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38DE0C433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:39:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.499.1637080768745275469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=hLCsweN6;
 spf=pass (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=695405095e=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1AGDKQQC018660
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:39:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=/g/Z2dsR2Nn75UcPAtHapphhZZA1ZA7Fn0OGY90Z5U8=;
 b=hLCsweN6snIpZnt48uOF0l7WqHVRnbGUbUv0zUKzq4l5ZpUgOMskndc4ZsLgtTNOuVuk
 IhEAOqm9+LJYJYnw8Mc+Zn8zUJWJRmGvbEG4cmwkKSBUSnCIfxvIVZDWWOb8+SnBmtRC
 vO9wlzOVhxo94DCQk1ALSWTJXHIoniimJynserUDfPh43cJ78h8khmXw5mq2sQB9HP0d
 CCZ05yY8uGa9zrq0F2W5IppmEaACjD80SAKp6NCjQojsyuloAkutntblnVC9ajkCPTCs
 cHXeT+4yPQqCOKxvp3OHFacY25GJNFaLQ04kCaOU7CEeu4FOm6yG5JAvQmgvUcjfinWT cg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cbg669gve-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 16:39:27 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1AGGZrkT002672
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:39:26 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3cbg669gvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Nov 2021 16:39:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hwoyc1Kt2nHk3kDijrLXD8kYzdtU753MWYaxZmt/CLo0AHKnGyZNd4VBweSk7l/F2uk01404yvv9aLtPzj6SjApfWkBg5wws86/9yaWofEgyPlz3yOrCRPoTnr2b6Yn2uzCI/EbK6YyeYpRnY8PzUyLYYgcuOSpyKjpA2io8hJUUVlegyv1Qhb+bDaxGLZTjMayIHEgCYP2BeP2ZORt4FsX2PNPt1L0QbTAcM0XRT405e4pTFYC2XpygwLwXZ+2cmQOmPYpe9J5gkHGVfI6+wzBJKGDBM+1dmME2R0a8XT6wmPwgUImnCRsOtGMzioCISV01Epe/HRdTQeLSUsntsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g/Z2dsR2Nn75UcPAtHapphhZZA1ZA7Fn0OGY90Z5U8=;
 b=QhvfGcC3lN504zIYvYK7i2Vs3vx3c/1bOMeglMKMGNNMfXavK8NtwqwfYJNfV8CQ7n4ZLdFkNTxmAoFaJXS/RCXjLITQetve8TDdu8BN9MbpVsrPrm7MS2A1auvcbdUC0nVHI+hs63DKhiVBtIEsH+xLm2Amq8bZPN/QqHLSzMk8L3m2lPcBBs+nbM/fCj/wRx011OnV9iq3S90lcjSbIODNlxeYGTm5vfAga996rzOFpZfeECfSg3D2htozMuv9HFk3ShBnx/nSzBkiE9q3gl8TKqNiq0jEsXy2uy5z9QhVKaB5kWczThJ+BfnMJkSNOj1MAwagW8wpkHE0Xkkrdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by MWHPR11MB1743.namprd11.prod.outlook.com (2603:10b6:300:114::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 16:39:25 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::61b9:f111:c64:3c74%7]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 16:39:24 +0000
Subject: Re: [OE-core] [PATCH 0/3] SPDX: Add annotations to relationship
To: Paul Eggleton <bluelightning@bluelightning.org>,
        Joshua Watt <jpewhacker@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Jose Quaresma <quaresma.jose@gmail.com>,
        openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <sakoman@gmail.com>,
        Andres Beltran <abeltran@linux.microsoft.com>
References: <20211027013050.137364-1-saul.wold@windriver.com>
 <89232e41-ac8b-def5-94b9-22d08b7e01d3@gmail.com>
 <9c6aa6d7-ddb5-0bab-8639-063e71379101@windriver.com>
 <3381838.aeNJFYEL58@linc>
From: Saul Wold <Saul.Wold@windriver.com>
Message-ID: <17832a06-2f82-a438-3990-178a97352ee4@windriver.com>
Date: Tue, 16 Nov 2021 08:39:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3381838.aeNJFYEL58@linc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-ClientProxiedBy: SJ0PR03CA0132.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::17) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
Received: from [IPv6:2601:642:c400:ecf0::956f] (2601:642:c400:ecf0::956f) by
 SJ0PR03CA0132.namprd03.prod.outlook.com (2603:10b6:a03:33c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Tue, 16 Nov 2021 16:39:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f81588ee-f570-4514-021a-08d9a91fa5b8
X-MS-TrafficTypeDiagnostic: MWHPR11MB1743:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB174310416182EA2910132DA8EE999@MWHPR11MB1743.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ilhC7mtllo8OgTJWffyTVcPQA0vNMFDXhIjkytXxLNhxyW5VjDCKWf+k2O6E6s0WKfic4c6Qmo06lDClhktwEBxC29BK8eYSzce29GsSn5sboEBvUwasOlZ36Vb1XpGEa3nciRcEWbi8NOGaHC5LYnfZ5aDCBg3kmDwskC9gWOicXfR8RsUBMrCcJ2bVjKvUp3t60+9FspdIZcguKLtiPo3vBi1FaB8QejJu9ZVJMRSqxvawRgwG3JAa+USFSikHTPzOrr7V3BYWk3+bxuIc0uHGNPTwY1Epu7yh3OPiA4s6j7r5OukMngxxL7c2jC6fC0tABB+hX4BALMwKi3+lI5LqKUs3fkVXv7UWt4Kb5KvzIDBVPm43RwtK8nKdAk68KAmHUT2k/KFIYGs21C/dOZVEmnrvISFMrzKiTX2wlXW1TQeukjjY9oNRWLfj9BEUqJFl7w3qM8vcc9qgsgUDH1zIKOWzwS0KTErImSA9oxxlV/CHL0hAidvrFaaLqRV6Kf8lO1Rfu0RBph8C1oJfnUZpNIFYfibuVcFONK2jaKXkF3Kr3i+EMbaKWNm/DfThDmAJn6chdNrseD5g6o6oAL59qUMwR1EhxdzBIsPlBVylg3PJILBjfnEFNo8eR97YyTqcLFcfcFEB1x6ra4DY/y0jVHhb5dWZEMkbl6XCPsvnA6OfBNKu3RMWnWA8a6DGHAaeE9vg763ZAQW2RFza2zdnbKsCWp8+n9HEwjP7VVcBamhGRoGDX++cUQvvofVW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(66476007)(38100700002)(66946007)(52116002)(31696002)(508600001)(6486002)(53546011)(83380400001)(86362001)(8936002)(54906003)(110136005)(36756003)(2616005)(316002)(186003)(2906002)(4326008)(5660300002)(31686004)(8676002)(4001150100001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXZJd3c0eDZFb3VsSFR5WVhOSGVKMml0UjA2OUdHUGZvQ2NWWVZkd1FqTGY0?=
 =?utf-8?B?RENwTUZFZGEvVG82QW1KNjFnUnlHSWhwbnFEeFViYWtqTEZhQ0ttcFdDS1Ru?=
 =?utf-8?B?YmJDMnk4QmxHd0hBb25TdDBSNTU0V2JxdzU0Q1FSQ21XRnJvNnRPSEdaTHZo?=
 =?utf-8?B?d2dFKzkramNvK1JtQzUvZnpXT3gzN1EvRi9kS0QxWnJqR2xSeGxqQ3dROXRP?=
 =?utf-8?B?MDFHN3ZSamdKdTdtb2U1VHBIUWwxSEFjTjdMOUc5V0xic1ViZzZLbGxibE9U?=
 =?utf-8?B?enRjakU0ZE5PNVpqN0p1aVZCMWxQdDFlMG9zSlZtN3oyYnRBZU1kY0NQOHRW?=
 =?utf-8?B?d0pFQ1JyNXREUXlacGlhc3UwY1R6QThRNlArZ2R5ZWJRRnFSNlJJa0I1ZFIz?=
 =?utf-8?B?KzJQTkpmNnY0SFo4SnRqNVNpeCtlU2VyMGVJZnh6Y0R3ZXBrUmw2VWVldEI0?=
 =?utf-8?B?MlpYa09YR3lRYXJlaXFtN0dHODdRWUVua0IvSWRCTkYvb0l5cmoxWlVpdDhr?=
 =?utf-8?B?VnpIa0NyVGgra1dEOGR3UUdaOHlRTm12YjNubENNcFBrOFgvWDUyK1FBUXpO?=
 =?utf-8?B?NWRMV3Nkbk52bUo0b1k2OW92SGwycGY2ZE5NRkNpNW9aN1VpcGRjT044bmhn?=
 =?utf-8?B?Y2Q2Q3hqTlJwNjd3dVNLemVoQVVIOWlrQ2pxWmZMOUFlT1Zjb2xVTURpZXZ5?=
 =?utf-8?B?NllvUFpIREIvV0RabUloVkRWMTBSV3BaVmlCQVMwU2F1eFIya24wZEtZck50?=
 =?utf-8?B?SUVQRG1QM2xrRmdsK3MyV3RJdEkxc0kyQi85K2FyQms0SkZ5cnF6UENwVDdZ?=
 =?utf-8?B?NzY1bTQ2blladFIzWmpaa1F3WjhlQ1l6LzRzZVp5SHFKRmNQV2I3V1Z3QlhO?=
 =?utf-8?B?VVNxR1lRdnU5L0xtVEtieVRFb1l2cGoxRXJ1ZXpBV1VleGV4VW1GSWVTMlp5?=
 =?utf-8?B?TlBqWU5mYnJvZWtDYWNicC9YenpTUU81UWFETlJQZGdWTzFwQzgvN0tocDZp?=
 =?utf-8?B?aUZPTFNxMndsV1FMbllrNnFqeHY5cXpvbm1XVHlvblVGV1ZLZHJUYmdEZ042?=
 =?utf-8?B?S2cvVDZnbHd4ZFN1WHEzbE5OYXNWbWQ4cmErMWNFM041emVJcXBLcTh5emtj?=
 =?utf-8?B?OERYZy9wZ2hVeUxmRTEyQlFyN2tRZnphTUY5ODByMlpYR1BBcVJHUmRSMzNz?=
 =?utf-8?B?cDFHTWJzcVBEWlVLTmdnd2duZ3N4bEd6RFB4YXorWkgzN2hFZjMzSUV3UFhQ?=
 =?utf-8?B?MkdkbUxna2dlRGU2aTNaM1lwd2V6bm1YcHRvTlltbzVDbzkxY011ZU83Zi82?=
 =?utf-8?B?WG5Hb3JzNFFKSlJ4b3VCbGxiS0d1eDFvZjlOVnpjTk41MTcyaVhqRGFyOWlx?=
 =?utf-8?B?WFRIQisxWVJic25ZaWNwWnNDWFFXQkVjSEZFblFPWGptVTBLVWNWWDVrNlJE?=
 =?utf-8?B?clBzZVdIU2VsSTI4cEFBMmlZWmpUUW1za3AzWUFHeXdqLzJnM0lDU00zSEow?=
 =?utf-8?B?V1FnakVERXZvZi9nZkI4Y0VSaFNkZ0xsbWg4dU1JNmJIYnNFRGJ5YkVpMHB5?=
 =?utf-8?B?dno3Mm9tUG1CLzhSZDh1dFFEWE9pMitGS2ordWpRR2swVE5kQjE1TWVsamtq?=
 =?utf-8?B?bUtWMkMzVlBidkppSVVGKy91QlVEbXdPSlErd05TMk1CY3VnZXNWMWljYjMy?=
 =?utf-8?B?OXVQU1NuMnZRUlBKS0s0Vk0zcGF0YUk1VU41QTc0VDAvUWlteGkzTG94RTB5?=
 =?utf-8?B?aWdqREVOeVZabGxKTFgvdkhzZXNDd3BjYmtOVm8zUHg4dXJ4ZEJueVNibjN6?=
 =?utf-8?B?WDNuRXhvZU1mTGJ1d28yQ3czakUwSkloNGc0Y0haaFZ2b0FDbnpmWGZybHZG?=
 =?utf-8?B?L3hJcE40a2dBKzRBVU9xM2pac3pEM0dTZElmNTR1K2kwNXUvMkIrWDlsN2hC?=
 =?utf-8?B?OHRIakpxV0t0M3ZuTi9FL1dobmRsalRFc09xUTFwR3FoSXphaHh3RVBGeEE3?=
 =?utf-8?B?elpucEJXR0YyMlNyQlY4NU9OUHU4elJWOGtzRGZUWjZlVHExR0l1Zkw4L1da?=
 =?utf-8?B?Z1FRZDFXWW93eXBId2hQTkEvZzdnNkVSR1NmVWRvRkdaODhYMDMySXdDRng2?=
 =?utf-8?B?a3kzekorMzBmMFRVSGhTVlBQSnQ1dW5IREFaTW9wbzE2aEo4Y1VPam9XMXA5?=
 =?utf-8?Q?6v3G76PDMGxFCf8bwN8KIVO+il/Y3AqZ2j/ohRaYZTMM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f81588ee-f570-4514-021a-08d9a91fa5b8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 16:39:24.4840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 KKbHuBhSVu/1A1g3MyYKCDE5KYWPCyDq3lmmIUWeRaGCjAIzCGTxbfWWNJtZPn0HMRntxr3u70LbpbSFw4rRXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1743
X-Proofpoint-ORIG-GUID: 27yEhYCoqr067PiEi6Dq5Ppa_DiSpTAW
X-Proofpoint-GUID: qGetjB8rL_C-FzS4AFXwCpRHDBfD7rCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_03,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160081
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 1AGDKQQC018660
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:39:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158366



On 11/15/21 2:44 PM, Paul Eggleton wrote:
> On Tuesday, 9 November 2021 08:01:38 NZDT Saul Wold wrote:
>> On 11/4/21 2:20 PM, Joshua Watt wrote:
>>> On 11/4/21 3:50 PM, Richard Purdie wrote:
>>>> On Thu, 2021-11-04 at 15:45 -0500, Joshua Watt wrote:
>>>>> On 11/4/21 3:43 PM, Richard Purdie wrote:
>>>>>> On Thu, 2021-11-04 at 20:00 +0000, Jose Quaresma wrote:
>>>>>>> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no d=
ia
>>>>>>> quinta,
>>>>>>>
>>>>>>> 28/10/2021 =C3=A0(s) 21:58:
>>>>>>>> On Thu, 2021-10-28 at 08:47 -1000, Steve Sakoman wrote:
>>>>>>>>> On Tue, Oct 26, 2021 at 10:41 PM Jose Quaresma
>>>>>>>>> <quaresma.jose@gmail.com>
>>>>>>>>
>>>>>>>> wrote:
>>>>>>>>>> Hi all,
>>>>>>>>>>
>>>>>>>>>> There are any plans or is it possible to backport the SBOM/SPD=
X
>>>>>>>>>> to the
>>>>>>>>
>>>>>>>> dunfell branch?
>>>>>>>>
>>>>>>>>> I'm going to yield to Saul as to whether he thinks this is
>>>>>>>>> desirable/possible or not.
>>>>>>>>
>>>>>>>> The packagedata changes are pretty invasive unfortunately and
>>>>>>>> likely not
>>>>>>>> something you're going to want in dunfell sadly.
>>>>>>>
>>>>>>> Thanks for the clarification.
>>>>>>
>>>>>> I have been thinking a bit more about this. I did wonder if we
>>>>>> should consider a
>>>>>> mixin layer of some kind for it that could work with dunfell?
>>>>>>
>>>>>> We could host it, it is just a question of writing the mixin layer=
 and
>>>>>> maintaining it.
>>>>>
>>>>> I don't think it's going to be possible with a pure mixin layer, si=
nce
>>>>> it relies on the extended package data?
>>>>
>>>> I suspect that could perhaps be patched in through a layer though? Y=
ou
>>>> might
>>>> choose to drop the compression piece or do it differently for the
>>>> backport?
>>>
>>> I'm not sure if a layer could hook in well enough to get the data
>>> needed...  maybe worth an experiment though
>>
>> Yeah, I am not sure an mixin could track the changes for package.bbcla=
ss
>>
>>> With a backport, I would probably either use GZip compression or no
>>> compression. The zstd compression was designed as a drop in replaceme=
nt
>>> for Gzip if we wanted to go that route.
>>
>> I will say that we did something similar with Hardknott for WRLinux, b=
ut
>> did not propose it upstream as Hardknott was knot going to be supporte=
d
>> longer term.
>>
>> Having the spdx class standalone with the correctly backported changes
>> seems to be working
>=20
> FYI Andres and I have done this backport to dunfell - should I post it?=
 That
> said, I did just take the hit on some of the invasive parts (e.g. LICEN=
SE
> value changes). I think given regulatory requirements this is important=
 for
> lots of folks, so we probably need to do something here. Happy to be pa=
rt of
> it.
>=20
Hi Paul, Andres:

We talked about this during the Tech Call this morning and the consensus=20
was that this work should be done in a mix-in style layer so that it=20
could be used by multiple releases.

The LICENSE value changes could be handled by a single file with=20
LICENSE_<package> style overrides in the mix-in layer, or by a set of=20
bbappends in the mix-in layer.

Did you include the compression changes or convert that back to basic XZ=20
compression?

We realize that this make for more work, but it's the problem of=20
backporting a feature to the release vs having the feature in a separate=20
mix-in.

Hope this is clear.

Sau!

> Cheers
> Paul
>=20
>=20
>=20
>=20

--=20
Sau!

