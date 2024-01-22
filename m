Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752BCC47DD3
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 05:18:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.66755.1705900699700775137
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 21:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HEx1+Ed1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1751788fa9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M5BVa2008013
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=+AZOHwONivTRDoRer2g7Am32AFcoFoiQ++p1XLX8TD0=; b=
	HEx1+Ed1jLZhA0BeN6EAg5hIvr75cuwloOIodzlZJ4MIYoaJf32XBujrZU3RH1oU
	Cat+lkNMZOgJ9hm+Nqq0Q0GtZ1aTq/o4RJxR21ST8/87IhDIegTIpleQhmR0ctM9
	u1ZoDCFnE+Hu7vF1OQ0/hKQQ3G/vhN3sVfRfxZHEG1tBWllnKh7LAYgHkmFQEfk4
	XJ8T/PJAw6+LSQgJTaHSthUSDcsBfqk8k7mnBnYFh/IDxGWnRL9RLQFqtCGw2uKS
	ROKRg7Fc4mbb3dHNJ1/EKMRVlaZjUu2sNvtENvaRkCOnwiqvyA81tFPcTxAqQ14K
	igHLgvvS42mjNSyWdSvUOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyhk8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:18:18 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 40M5IITx016440;
	Mon, 22 Jan 2024 05:18:18 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyhk8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 05:18:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWCnoxktc8vgvmw5hz4utcCk3/IRIsUvsusujDF+nTTtigmeNbKgCqyBMl7WS+sBesnZ3XtHOBNMH9PhkH82LyxoCJIAhGafewF8aZduS3EGfiZRkoYd3TtrRMEjxnj1CuvpMshTtgRepmqmOolIRZLxrQzm/4KRMH2++Bj58KsFfetpkPrkESiBp9br3ilpVCBvC3ZqaR5ak8/9mZta6lvRv5MDCIkffbNLSqE0hxe5gclXMEMhAZjsNsR4B7jjVy5vaF53nswkXuFqp1G2oHMh4tNLjmBfDTMpo6QS5xIPy7UG85b1JCyNFyrgHJJgoaUEz19NEnIGSMA+7YIBhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AZOHwONivTRDoRer2g7Am32AFcoFoiQ++p1XLX8TD0=;
 b=IhvKaQMgB4EPotIwivBWYno2HisOxERY3MdULVz+Rhs7rU1vsCHGl41TOIivxoP9C/hqTVeKTExzqXsYjbZJI6yhq9BDyhHsGvX4VajBEIiSVYFvWVDj/RxwPuZ22wcUF0JhEbbUwA4gTkO9bzMq72uUsX7jBw+EbbLL/ASoGleEs3r296jbnoiWIYbAocZ06OsAIGVCl8RChwmfk9VWgAfaD9bWwSoVjMJLe785zchJHXJ0FyEGtk/o968PzRCpUy4BabvJDZKk7WFgif30wogFe2sjgb/s4tAd9sjAo/SyHuBw8zXUEM7t4rG+bDBImXQXxCqmOqVqUXF1Fiw2vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by DS0PR11MB7442.namprd11.prod.outlook.com (2603:10b6:8:14d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 05:18:15 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ea58:82e8:1c55:a217]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ea58:82e8:1c55:a217%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 05:18:15 +0000
Message-ID: <2841fb1e-17f3-79c8-762d-dfbd35723f24@windriver.com>
Date: Mon, 22 Jan 2024 13:18:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [OE-core] [PATCH 2/3] gnupg: Make the version consistent
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>,
        "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240119113354.3000697-1-mingli.yu@windriver.com>
 <20240119113354.3000697-2-mingli.yu@windriver.com>
 <72AFBC4A-9C2A-4181-8A8D-548855D2C870@arm.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <72AFBC4A-9C2A-4181-8A8D-548855D2C870@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|DS0PR11MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 67ccc8f0-cfb7-4fae-2263-08dc1b098954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qoUY3EXQPVng0pd6OZi7Ask+3jA78/ZKFUmX6HHQMvS4NHhvzjUCdm6bERYf3ouBOP0J99//9bMDT165Fnt/6q7jaK/eYaXfgAwoajN8+1EYTVRtI89lby2hj+WNR1rWd/RqMr3Oofdtr8QfH1nM9cFkxunlDzNHhZsA8JdB9cCyH2o2jFUFHEuwe09X1FxOUvdpjGRFl9RM/xb2fyE41S+ABcVbCB0P27xMLrzeMDokySL3cHE/0KNWRz/JfyRj2KQ/c9kd5i6AbtfVBKNI/Y3pyKytwpgwp2jzvxfGPLGG/zrTDe1ikjQXBIJBXsPSRrM86Gg2fZ62S8U94TAgReKs0C5b78EGgaaZvI0oczFDRoEHqhy0u3I91ALGQK4dk2RiSYk63bXYpp0gU2qRIzHLOwCjbbiZ9hdDj1eUW89hyes13/RqMaO6OIj43fSCspZqSMktEuGkcE0ns9lLretuoiencutn8C1XQ/HKAKRUDQmIyLjS2mWu+YY87zzmSvmneuzPOTMF4UsqnkmmLdqurksb6IToi5fgkPup5f4wNJFBCiX9GSdcfiL3JDC7Z+unb5aGICVzKYcx4whaAxIPxceD7l9mqnadTssIQvbnhwa08mgr7ZdT/+zXIaRnKIfd+PZ99ixm16MdVP5JqD9B6M4nvZ5cRsWygDzOBqOs0oyVDCB2A4ANUJkpUu2c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39850400004)(230922051799003)(230173577357003)(230273577357003)(1800799012)(186009)(64100799003)(451199024)(86362001)(66946007)(8676002)(8936002)(316002)(110136005)(4326008)(66556008)(66476007)(36756003)(31686004)(5660300002)(2906002)(6486002)(53546011)(41300700001)(6506007)(4744005)(38100700002)(31696002)(83380400001)(26005)(2616005)(6512007)(6666004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UTIrckFiWlU1aG9VTlBpeVB3eXFPZmhyUzd4UmZNb3ZZK3Roc1cvTWVhQXRv?=
 =?utf-8?B?b0krVXNqMzJhWHhWNXh5aWQvdktCRWpxbUN2blRpUnc3MFVrSmNiSmUwNUdq?=
 =?utf-8?B?NnJ5aEc0WUhHN0FWNDdYRmFJazhHVWJlZkxtRjdFeitjZ0E0VzZqSWc5ejJk?=
 =?utf-8?B?MDNrM2hCei8yaEgxcm5iQ0txdU1ybkFjUkZwU0tpNkFGeFFvd2FFejBZRGEv?=
 =?utf-8?B?TW5pN3lRN2dEYUlnSVhabVVxODBpZXV6aFM1bS9rb21LdElIbEdVMDBPTnVS?=
 =?utf-8?B?RzF4M0l0eWVFTEc0UllwbUsycWVoUC9XMEFmSVZ1NENjUlZac3pNQmRjMVNO?=
 =?utf-8?B?K1k1N1N1NEplL0tISkx0MUdZZURkL2lPVW04eUhJM255RWVFMzFVeUJHb3dz?=
 =?utf-8?B?RVprd0hweVJVOEh0cVFuVGlRZklXOUVqNHpGR2k2TUpDdlVQcjFFYTdJVFFu?=
 =?utf-8?B?emU2QzRQYVZLbWliTHRsd2xEKzNyUENHNWVhQWRuRm9jWjYzeHBVVDQrZkhI?=
 =?utf-8?B?WUlCU1BaQ2F5OTVuVm01QmJPSnhDei8yYjExMktZdGxMajM4d0VSMVpsTmRj?=
 =?utf-8?B?c0NPOVpra3dUa2p1a3dZNTFIS0FaTGVOWnRKc3ZCeXRtRjRhdGQrcm1TSXln?=
 =?utf-8?B?S3FOZFVwVFIxVmZzdDVSQ3d2WjJXbmMwNVZRcG9scHhmTUV2WmF6cXZ4c3M3?=
 =?utf-8?B?bzJXaTlpREsvUlpYZlBiU3hpYjVFWE4wdk1HMUtLUEE3VEZPbS9oRi9hd2VT?=
 =?utf-8?B?VUNNT3RXdVVtUmxCWFdzRUYzWWhyM0lpMGZ3NW8zTEJJc01iZGJraWpTcHYw?=
 =?utf-8?B?c2tLM0w5U0Z0WGh3Z2VBRXRiWE5XQlJRUVN3enZhK283R2paWSs4UDVjWk1S?=
 =?utf-8?B?bnNZNXBzMkJUL1dqZXdUbStJaWlwbjRuL09IYWVYSlU3cHFQWWdzb3l1L0po?=
 =?utf-8?B?cEcxVUY1RW8vU0NOVmZIUDRadkZHY2l2NjRWbi9tZ2dDMjlRbjduTGI5Z1Rl?=
 =?utf-8?B?alVxTWErUGdqUnBlNkFMemZaY3g1WmlseThWaFBBVGJmaUpMeUxTTHM5aWtH?=
 =?utf-8?B?RGN5R2NHQnI0SnNwZVpJemF0UFlsRE9OajBVWmVLdGJxZEF3WE9neXU3MTVI?=
 =?utf-8?B?TDVHSXpVM0wwdkdNNFNOSm5GWXFCdCsySTdhVVFxeU9WdldPajJwNGYyVitU?=
 =?utf-8?B?SW1vajlRSlVpdXZhTDZ1SGRudU43K25kS1VyUk52Zk1pM2ZOZ0Fsc3M1cStv?=
 =?utf-8?B?dCtaSXFjbjRYQXpxSXpadTNqb05ReVUxS1Q2eEhMTFRlUU5Ibk5wdjliU2lH?=
 =?utf-8?B?NTF4cDhvZkZLTXlsZEJSNXlGZS9pbWlHUzlWT1pLWVQraS9Mek0zUG1JcnVj?=
 =?utf-8?B?MHlMUFlYTlcrK0xQZ24vRzhhY01TWnFVRDZUWVRTVU9yY2FsRUM1VzhqdFB1?=
 =?utf-8?B?UGVjQ0NDS25uaDNUNS8yMm8ydlV6L0s2VkUrS2tqNEQ0QVlPVGhqR3Q5ZUNr?=
 =?utf-8?B?UTQwa0lMSEdtd0gwckI5amdRSlN5OXA4WGlaT0ZXUnpKMHNzaUpEcnc3Qldr?=
 =?utf-8?B?UmFWbTB1cXRKY29FeERpN0Jhamt5ZXRqUzNKYXcvMzF0a3h1MEF4dGNpODM3?=
 =?utf-8?B?bWZ5Wk9XaEUyditrZ1o2UkdIK0lqR3RFSFNZZzBMRU1uVFhUbUovYjFqNU9h?=
 =?utf-8?B?eDhhdWxsYTlHZEsrRW0zSkdDSFRXaE9ERFB2R2VkcTdmcnBYZ1V1dHJkQXlS?=
 =?utf-8?B?RVUvYXk5a1poYktnNUtiOGlTMjhVMmNBZGRNUTZWYUIzbFB3bVc2N2k0MUdJ?=
 =?utf-8?B?aWpyM0F5UGVGalh0QWl1VytmekV2cUV6cndCOElTSG9SVnZRTERhSFJHQjN1?=
 =?utf-8?B?aWlQbkhuZk90OUdGRUlDZmNQaE9PNmNyYmRsNWd1Z1QwL1c2RXo5MzFTb1RP?=
 =?utf-8?B?UWhUTmRjTFQ2Z1dlczhURjZKbnV4OUhoL1AwYTZNd1Y1T3htaVhqZTFKOFhJ?=
 =?utf-8?B?bEx5SG9seE12VXlmSkh2RzExZCtQV3dsd01hcU45SEVTTUpBZzcxVHRSY3RP?=
 =?utf-8?B?Ulo5NTJsRW9rWTFZNGliYTZOR3VTSHZDcmRXYnJ0RklVWG5ERnJVc1hVUmJt?=
 =?utf-8?B?Y1pwdVBvbTR6V0RHS1V4V2E0Z0NjeXhKMnZnR3doSEpTZ1RSUzdTaU5sWXdk?=
 =?utf-8?B?QVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67ccc8f0-cfb7-4fae-2263-08dc1b098954
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 05:18:15.4900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxFCuxU4VORbS2L1qW5ZxqkKO2iEpePjil/NeZxVWIj/LlNnYlha3ho8zSNmBtNtgzJl/RSw1lJ7/qSThiPmPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7442
X-Proofpoint-GUID: 2qQb2DL9YB6DaWsgOWgcZ3RNVQ2A0_65
X-Proofpoint-ORIG-GUID: eEG0E94Idck5blf5xwoneDGD-8yMYYVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401220035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194113

Thanks Richard and Ross's comments!

I will try to send the patch to the upstream.

Thanks,

On 1/20/24 01:41, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
>> On 19 Jan 2024, at 11:33, Yu, Mingli via lists.openembedded.org <mingli.yu=eng.windriver.com@lists.openembedded.org> wrote:
>>             file://0004-autogen.sh-fix-find-version-for-beta-checking.patch \
>>             file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
>>             file://fix-ldap.patch \
>> +           file://0001-autogen.sh-Remove-the-unknown-suffix.patch \
> 
> 0004-autogen.sh-fix-find-version-for-beta-checking.patch already does something similar, so the patches should be merged instead of having a series of incremental fixes.
> 
> Also, as RP said, engaging with upstream here would be good.
> 
> Ross

