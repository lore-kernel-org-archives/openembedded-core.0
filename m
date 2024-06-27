Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B41C2BD09
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 07:03:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2292.1719471804186062198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jun 2024 00:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69087085fa=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R5W3LY032119
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:03:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywnk5vpgv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:03:23 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45R73Mbi028820;
	Thu, 27 Jun 2024 07:03:22 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywnk5vpgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 07:03:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grUrulGtPPdG/aEF5eZA+nkvUyX6jztWqedoe6lpGtu0cPW4DhHGQliLlD3Sn1OcfIHBVjW9mI0VpJjVop3i53563yPxOYTEjuXngiR5Dk8QYbNuUPsm27HNICjH159NnAwo76NRh4mIPIy2Cjo7Fs2l+i0MAdtpaaDc1J9gFj0fD7zBlxw9/4eg+THbljcPoqzfZQdMk/PKEm1Lf9zR3nP7OVmHdAcc8keyLaI0Uys40NCTJZJonAKaCrOvpbche3Nidso5p9ASHMdtDb9kRPoCTlpPGTqyWclokN1w/h8CVAOBmiqoolIHrROFZCeI7PvrGLd4BaDlQOf53Ar/iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsgOqT1m38MWFKSnRv1H1nadicEfxiy1ChBwTQAEgh8=;
 b=ZsJzhK4hwzW+SITUAn2bTu5IXawhOdhigTv+G5hnPWWIID+CbeCI/3aAs4p5WySR+NtGQZjQn52OZeGli68CYs2WGDTDi1S6PieMdyZsxO6RHTlulU9CTrwipZmVjZWo85RkVIa8DeK8QqGfxyYkTFdLDruMo92BL8B4+9HytWE1fgvTblfUHo0QqCP7T9FuXhgBYDEo5vge+g9SIMZa+H232xVT2cjiF0qffQcOw1fCS7wIPtaBZn6lAHWREzCe8BlAK8jjHqona0kTQuiRRze0SD4FHYRfZXNQZvxQkFZAvfuVUqepjIbnbA8B3SXySts8BNdJ8qIUMxiW3fD0/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 07:03:20 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 07:03:20 +0000
Message-ID: <af281dac-1203-4ca9-83e4-099485a70592@windriver.com>
Date: Thu, 27 Jun 2024 15:03:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] acl: Fix nfs ptest failure
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>,
        openembedded-core@lists.openembedded.org, Ross.Burton@arm.com,
        =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
References: <20240626055637.2195328-1-mingli.yu@windriver.com>
 <20240626230938fc033ae6@mail.local>
 <55d756d2-990e-492b-a299-a1c13186ff6f@windriver.com>
 <2024062706570694afe704@mail.local>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <2024062706570694afe704@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::7) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d71ad9-f7e7-4088-89e1-08dc96773a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bjBLRUEzM25yaWhmMnlLK1U1UWNTcHY5bTBGQTBtOWZtclErc0RlSFNIbnBS?=
 =?utf-8?B?azNqdllGOWgrdDFveTc3aHVnQUJ2ckdIWTFYOS9JVm1pZ0sxZ2xDK3hkMXgx?=
 =?utf-8?B?NmNhSkFuYkM5d1R4SFJKVkNLYUhLRldlejdmNW40TVdzYWZZTFBLOGhKenFF?=
 =?utf-8?B?YU0xeUFMS09JTTQzMUtyVDRMQUFncGQyaThKNFJQYjlBbGQrd1BhVklUQk9W?=
 =?utf-8?B?MWdGdmZCY3BkbWRrQVpCSk5IR3VZcEY5dUhmQmpMQ25ZWjk4T1hPUFJvakZQ?=
 =?utf-8?B?bTdYc24zYnpUMGpqclBrT1JDTmZXMDNlRnE0UmlleVR0MUJEWlQ3K0cvdVo4?=
 =?utf-8?B?d2s0WUQ2UUErNXJsVXlDNzhzTzNHb25aMDhzYVNEUU5LbE41QlN1SVM4YXNG?=
 =?utf-8?B?N0ZraHJJRVIrQThtWGpEUmt3bytpemN1d3V4U0cwcU1zbitZaDZiYW0zcWVi?=
 =?utf-8?B?YVBDb3N3eDBZZVBmd0NVWGdmRXhuRTlISFF5UWlsNG5Rc0lJT0xhcTVyYmhY?=
 =?utf-8?B?UWpidnA0bTFZRXk3UEtkQVNsSzhwVlozakROWjE5M3NtQVJjU2tuUVNwVVZN?=
 =?utf-8?B?NjhoYVVTOFBWWnkvTWxLUVJoVXcwSDBNNzgvMW1RMDQ1RGlleWlENjB1MXZ3?=
 =?utf-8?B?TCtmZTFLYk1mTktyUm0vK09Nb3dkREo0VEpZQWpiYUh3akdQcyt1YW0zcWMr?=
 =?utf-8?B?ZTA5Q3JrZzFTdjVURDJZK0RwenpGMmpnOHVZTVA0ZWNPZkdVOXFxN0xjT1ZN?=
 =?utf-8?B?UjlEZU5vRW5OYmtxcVNIVGpLTzZGaDFNdm84eXgzamJmdm55cUZVRTh5VWda?=
 =?utf-8?B?TFBqVkwxTlpGbHhDQzlkdytvSHZ1dEpqa0xwd0lnbkc0elJxanZXb2pQeE8v?=
 =?utf-8?B?VXk3aGtmMVJEeVhMekR5VDVndEFNbTlZMHY4MkYwYVFibE1aUXMza3VZTXBO?=
 =?utf-8?B?d0cxZTNJWkdxY05nNjZDL1REMm5EcXhDeWM5bWxBblRHWkI4bTBRYkx5dFpr?=
 =?utf-8?B?ZzgvTmxtd2IzNnNBOGRJM0xoNXdWQ290aDREUmRBQ3NNQU51OFNoWDRNYzBT?=
 =?utf-8?B?eFJRa0M2QmxmTzQ0WitIL3NqQmRSRXdydnNXblVXaUhkNTNlRnRQL2ZQRzlD?=
 =?utf-8?B?TjdIL1RJUFpwdk0zVkVCRDh3YWgxMlVOdXhmV1lSZFRaS0dLNkpMSlpqSWhG?=
 =?utf-8?B?Z1MrWDZwcHdCMUhqRUJDYXZod042YWZSQnRrL2VLN29UcG5PaDhocmU1a2hv?=
 =?utf-8?B?c25kUnVlTGVCZEdNaUtiaUJCWEVHY0YwZXRzY0grZDNaUGQzOFMvSnEveUNM?=
 =?utf-8?B?Y253WFFYcEJjT0tTZjg4c2tIdlBJMVdBcTZEMWZGRnE0SkluY1EvV3NTUEtN?=
 =?utf-8?B?cUVQT1lIU1gvOWxVYUhwZU9KR1dlaGpFbnpIM3ZOL2ovZ3IyZVphK2RwaGVG?=
 =?utf-8?B?Mk5zbmlkdWJVdU95L3Zqa040TmtUNyttKzlYaWZKNm8vS1lBREpScUsyaWxJ?=
 =?utf-8?B?NW40a1dWb3gvQjNjQXZxZTNsNDZLMjZQNnVvT0k4V3FWdWVNVmhXZXdXMTZW?=
 =?utf-8?B?OWZDMlZ6YU5WS08wcFczbXVwdEJ2MHZkSzAyUVlmbUZnWHZXWGdHK0dYVlgv?=
 =?utf-8?B?R2FYR1oyOTMxNjVYOEFBeEV3cUJOMi9rMkZXS21TdUYxNkg2aUVVWE45SEQv?=
 =?utf-8?B?YjVnNEU4aFRpeUlYUWNUakViMC9uaWJ4ejRHM1VRRVZBVlo2a0poYkFtc09S?=
 =?utf-8?Q?ZkByOOP8dxzoXtIRMo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b0pma1FnR2EwVzZ2NXBkckhmNmxqZUU4MFQwaklIMXFSZ05jRXMwRjd4MVhH?=
 =?utf-8?B?RkNjQ1l6aTVCbnJPMGlUbWZ0TWwvMUFPcWU2YmREaTg3dkxkSnBjMDI1NlVV?=
 =?utf-8?B?alk1N1AvZ2s2V2JJdjZMb1dzL0RxSmY0N09UQXRwTXE5UmJSWVdrYk16UzVp?=
 =?utf-8?B?TVZCUmFod1BWMjloeDB0VHhHQUVaNTdLdjBnaDNxMG5MYnJGMUxkeERiNndz?=
 =?utf-8?B?bG9XNmhENmlST1hxY1BnSEh1aXk5aDcrbDFqQzlyZzhTeXFqRWI3cmlBTkND?=
 =?utf-8?B?QXhiY2NiaWJxa0tHZ1BzR1Q4dWozRlJsK2RiRUFEcUFyd0liYldrUVNsaTUy?=
 =?utf-8?B?OUh6a08zZWFmcXlyR3FoQlFVd1pkNzNSUktjdU9uKzNqUCtVRFJPeXRmRVk0?=
 =?utf-8?B?T1lTb0g4azlRZUsybk9KaVM2b2VjbDNuMTFhMERJQVhGaERIcXI1SjIwb1p5?=
 =?utf-8?B?WExsb3lyTHpST1Fydlppc0d1bEhyS0U4VG90MXBmd1RPYWtHL3gyWDBYVVM2?=
 =?utf-8?B?bXJMTGlIYUtYWHQ3d3luTm5YTlRrL01tdm1DbExUR0UvOVdQbXNESGd3dDY5?=
 =?utf-8?B?enlZQ3N3TXg5bVRGajZySG0zZ0IwZ2xKYkJkSVFYSkRBbGxkUW9nOHM2V0hD?=
 =?utf-8?B?K1pyL0c1OWtWTmtXRzNBTUFTbTNQd3QvK0ZBbUllUEVpWVJ2QkxrdWpxZlUy?=
 =?utf-8?B?d2YzYjF5OHUrdlBnbzg3TjJlbkFuWDF0N0FTakdNTmk2a2R6b0FaSEdlT2tD?=
 =?utf-8?B?L0pPaHdoOEw4cWtuODdpblR6ZG54YXZxMXk4eG95UGhaTThvdWEwaWFLaUpF?=
 =?utf-8?B?a0Q3QUFOb0xxZDMybXl1YVozNGprM2xldDBkZnJUb085YXlpWmtmdW01ZEZO?=
 =?utf-8?B?V2xacE9VRWhFaWpXcWkxT1FjK01kTDJuN2FQY0dWKzVtT1NnVGFLR3JRSm11?=
 =?utf-8?B?MUU1UDhkY20rZ0x2YkRKZFJVWEJDRHVZNlIxTEV5NkhjbGREV3dFQVNKWUw2?=
 =?utf-8?B?bitlL0xZWnIzS3dWck1pTVJUbTRwcGJsbGtmQnM0T3lrQmNCamVlWUprSzU4?=
 =?utf-8?B?R1pMZFU5eE5iUzlYSkVoZlRNdVBBUEhXUTBGbFNSWFpBRXpydWFxWjQyWnFM?=
 =?utf-8?B?SzFBeE1ZejBhN0dLWHZWRmdXUm1rNnlzSDFCR2x6Q0VYK1FwcS9JVVJoT08v?=
 =?utf-8?B?OVZMMFlzYjBPei9KVndmWkYvZlVqTG1qMU8wMmVJRHZxNzNyVWxDK2NheFl3?=
 =?utf-8?B?bWZrajJia1RVc292clBuL0xkZWt6MnllY2RDemJNNDNLOEpZZ2ZoeVF4UGN4?=
 =?utf-8?B?UzExTXhObW9WMzBYanY5ZXRUUUc1MHlXNVVjWlpVT1lVbS8vSWZTRjVZOS9R?=
 =?utf-8?B?OUhGZUlnTnQycTVwcFlvc2xmRTFWMDYzZXJ1b1dFUHhEZVgwTDB5QmlIUXBR?=
 =?utf-8?B?ck5HVEl3Qy9GU1ltekluNTlyNTJNM0I2b3pTS3dja1ZsQUtBRmNCZ0grTFVS?=
 =?utf-8?B?azd3dHJNR0V6ZTBoUFR4TnQ5elZ1VjlKVTFqOVZ1Z2Z3MDd1MlJDZjk5N2p1?=
 =?utf-8?B?TWtHYTlpN3FXOXUwcmhBeDlhd1R2elkwNWxjOUppSFE2QmkvRGpaRjByNHl3?=
 =?utf-8?B?QnZJSXZpeW5LYlhyRVRqelFKeGNpTmZtaEdUOC82REs1QU1EM3h4YlNMbm01?=
 =?utf-8?B?SDI1ME5GeUxDYzBHRnRFeUtrWXVaM3RmL1FnUkU5M3hybDRISzZJU1VhU0xE?=
 =?utf-8?B?eGxGQ3NYU0pxeGtSZTBtTDRYdG8rWGhmL0F2QVIvQWdhM0VYTDZaREdqcmVk?=
 =?utf-8?B?SzNKRlU1Szl0dVR4cFRVc2t5djhMdDVFc3dJNXBpWkEyR05DU0lteXYwTENn?=
 =?utf-8?B?QnhRZkFCRnBzcm45V29QdHhIWXhDVUp1ekFlbnhUMnZwZ0ovVUxBU0pLNS8v?=
 =?utf-8?B?OUI2UDgvblNPbkg0dFk0bmsxVHlNS0tHTnRzVjlsaUl2cyt2UVc3YTJ6RURy?=
 =?utf-8?B?K1RxQVA1VU9iZ0EyOG1jaVF1eWxCaEhFWmZxTEg3d1hOVWIxUHlZOVJxZ3du?=
 =?utf-8?B?aklpb0lmbnU2K2lkWXFOSjdpaWc1RWNKVzlNeE1lRyszclJZSFhqVlNFeENS?=
 =?utf-8?Q?JPUQNq1vTkyLmwrv/ulTevK/v?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d71ad9-f7e7-4088-89e1-08dc96773a1b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 07:03:20.0804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NlFUzXYZB9xUjrjw0u/xZHCyAFrMGsC/Vtt0dvylatjPQwiXAM1jSuAI++e0jULjH2gj1M1CbNMSxHvFZjZZWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
X-Proofpoint-ORIG-GUID: 8gpGEpNOAfyNXyaTCxUIK5FmWqbCI_-S
X-Proofpoint-GUID: YcLDMBUuyjZvFROMiqwEBtr5dUtQSeLT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406270052
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45R5W3LY032119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 07:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201187



On 6/27/24 14:57, Alexandre Belloni wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On 27/06/2024 14:15:56+0800, Yu, Mingli wrote:
>>
>>
>> On 6/27/24 07:09, Alexandre Belloni wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> Hello, this fails on the autobuilders:
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/657=
4/steps/12/logs/stdio
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/675=
1/steps/12/logs/stdio
>>
>> Noticed the patch already in master-next, will send a follow-up patch =
to fix
>> the issue monitored by autobuilder.
>=20
> No, master-next can be rebased, please base your patches on top of
> master unless instructed to do differently.

Got it! v3 is sent.

Thanks,

>=20
>>
>> Thanks,
>>
>>>
>>> On 26/06/2024 13:56:37+0800, Yu, Mingli wrote:
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>> * The date such as "Jun 13" should take 2 columns, so the expected c=
heck
>>>> item "test/sub2" should the column 9.
>>>>    # ls test/sub2 -dl
>>>>    drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>>>>
>>>>     Corret the check item to fix the below failure in the test/nfsac=
l.test.
>>>>     [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}=
' -- failed
>>>>     drwxr-xr-x 07:23                      !=3D drwxr-xr-x test/sub2
>>>>     -rw-r--r-- 07:23                      !=3D -rw-r--r-- test/sub2/=
blah
>>>>
>>>> * Use the abosulte path otherwise we won't find the expected file bl=
ah.
>>>>
>>>> * The calls to getgrnam_r would always fail because the size of the
>>>> buffer was smaller than the minimum (170000) specified in the test
>>>> implementations of getgrnam_r and getpwnam_r.  Use test_get*_match d=
irectly
>>>> because getpwnam and getgrnam should never fail on ERANGE.
>>>>
>>>> This commit fixes the following failure in the test/nfs/nfs-dir.test=
 test:
>>>>
>>>> [16] $ su bin -- failed
>>>> su: user bin does not exist           !=3D ~
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>    ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
>>>>    ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
>>>>    ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 ++++++++++++++=
+++++
>>>>    meta/recipes-support/attr/acl/run-ptest       |  2 +
>>>>    meta/recipes-support/attr/acl_2.3.2.bb        |  3 +
>>>>    5 files changed, 169 insertions(+)
>>>>    create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nf=
s-dir.test-Use-the-abosulte-path.patch
>>>>    create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nf=
sacl.test-Correct-the-check-item.patch
>>>>    create mode 100644 meta/recipes-support/attr/acl/0001-tests-fix-g=
etpwnam-and-getgrnam.patch
>>>>
>>>> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.tes=
t-Use-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-n=
fs-nfs-dir.test-Use-the-abosulte-path.patch
>>>> new file mode 100644
>>>> index 0000000000..c48ee9f820
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-t=
he-abosulte-path.patch
>>>> @@ -0,0 +1,46 @@
>>>> +From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 2=
001
>>>> +From: Mingli Yu <mingli.yu@windriver.com>
>>>> +Date: Mon, 17 Jun 2024 11:22:21 +0800
>>>> +Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
>>>> +
>>>> +Use the abosulte path otherwise we won't find the expected file bla=
h.
>>>> +
>>>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/a=
cl-devel/2024-06/msg00001.html]
>>>> +
>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> +---
>>>> + test/nfs/nfs-dir.test | 8 ++++----
>>>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>>>> +
>>>> +diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
>>>> +index 33e5f5f..7216a6e 100644
>>>> +--- a/test/nfs/nfs-dir.test
>>>> ++++ b/test/nfs/nfs-dir.test
>>>> +@@ -14,7 +14,7 @@ EXPORT_PATH =3D> the path that is mounted at the =
working directory.
>>>> +     Make sure the file can be accessed before.
>>>> +
>>>> +     $ su bin
>>>> +-    $ cat test/blah
>>>> ++    $ cat %{EXPORT_PATH}/test/blah
>>>> +     > blah
>>>> +
>>>> +     Set up a situation that triggers the bug.
>>>> +@@ -36,12 +36,12 @@ EXPORT_PATH =3D> the path that is mounted at th=
e working directory.
>>>> +     fail with "Stale NFS file handle" or "Input/output error".
>>>> +
>>>> +     $ su bin
>>>> +-    $ cat test/blah
>>>> ++    $ cat %{EXPORT_PATH}/test/blah
>>>> +     > blah
>>>> +     $ sleep 3
>>>> +-    $ cat test/blah
>>>> ++    $ cat %{EXPORT_PATH}/test/blah
>>>> +     > blah
>>>> +-    $ cat test/blah
>>>> ++    $ cat %{EXPORT_PATH}/test/blah
>>>> +     > blah
>>>> +
>>>> +     Clean up.
>>>> +--
>>>> +2.34.1
>>>> +
>>>> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test=
-Correct-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-n=
fs-nfsacl.test-Correct-the-check-item.patch
>>>> new file mode 100644
>>>> index 0000000000..f990ca4a31
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correc=
t-the-check-item.patch
>>>> @@ -0,0 +1,51 @@
>>>> +From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 2=
001
>>>> +From: Mingli Yu <mingli.yu@windriver.com>
>>>> +Date: Mon, 17 Jun 2024 11:00:43 +0800
>>>> +Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
>>>> +
>>>> +The date such as "Jun 13" should take 2 columns, so the expected ch=
eck
>>>> +item "test/sub2" should the column 9.
>>>> + # ls test/sub2 -dl
>>>> +drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>>>> +
>>>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/a=
cl-devel/2024-06/msg00002.html]
>>>> +
>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> +---
>>>> + test/nfs/nfsacl.test | 6 +++---
>>>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>>>> +
>>>> +diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
>>>> +index 4f37322..dfcc323 100644
>>>> +--- a/test/nfs/nfsacl.test
>>>> ++++ b/test/nfs/nfsacl.test
>>>> +@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with =
ACL support.
>>>> +     $ echo blah > test/sub/blah
>>>> +
>>>> +     $ cp -rp test/sub test/sub2
>>>> +-    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
>>>> ++    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
>>>> +     > drwxr-xr-x test/sub2
>>>> +     > -rw-r--r-- test/sub2/blah
>>>> +
>>>> +@@ -23,7 +23,7 @@ The test should be run on an NFS export mount wit=
h ACL support.
>>>> +     >
>>>> +
>>>> +     $ cp -rp test/sub test/sub2
>>>> +-    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
>>>> ++    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
>>>> +     > drwxrwxr-x+ test/sub2
>>>> +     > -rw-r--r-- test/sub2/blah
>>>> +
>>>> +@@ -31,7 +31,7 @@ The test should be run on an NFS export mount wit=
h ACL support.
>>>> +
>>>> +     $ setfacl -m u:daemon:rw test/sub/blah
>>>> +     $ cp -rp test/sub test/sub2
>>>> +-    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
>>>> ++    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
>>>> +     > drwxrwxr-x+ test/sub2
>>>> +     > -rw-rw-r--+ test/sub2/blah
>>>> +
>>>> +--
>>>> +2.34.1
>>>> +
>>>> diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-a=
nd-getgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam=
-and-getgrnam.patch
>>>> new file mode 100644
>>>> index 0000000000..2fea254fec
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getg=
rnam.patch
>>>> @@ -0,0 +1,67 @@
>>>> +From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 2=
001
>>>> +From: =3D?UTF-8?q?Luk=3DC3=3DA1=3DC5=3DA1=3D20Zaoral?=3D <lzaoral@r=
edhat.com>
>>>> +Date: Wed, 19 Jun 2024 11:11:30 +0800
>>>> +Subject: [PATCH] tests: fix getpwnam and getgrnam
>>>> +MIME-Version: 1.0
>>>> +Content-Type: text/plain; charset=3DUTF-8
>>>> +Content-Transfer-Encoding: 8bit
>>>> +
>>>> +The calls to these functions would always fail because the size of =
the buffer
>>>> +was smaller than the minimum (170000) specified in the test impleme=
ntations
>>>> +of getgrnam_r and getpwnam_r.  Use test_get*_match directly because=
 getpwnam
>>>> +and getgrnam should never fail on ERANGE.
>>>> +
>>>> +This commit fixes the following failure in the test/root/restore.te=
st test:
>>>> +
>>>> +[21] $ chown bin passwd -- failed
>>>> +chown: invalid user: =E2=80=98bin=E2=80=99        !=3D ~
>>>> +
>>>> +Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe g=
etpwnam_r
>>>> +and getgrnam_r")
>>>> +
>>>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/a=
cl-devel/2024-06/msg00000.html]
>>>> +
>>>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> +---
>>>> + test/test_group.c  | 2 +-
>>>> + test/test_passwd.c | 4 ++--
>>>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>>>> +
>>>> +diff --git a/test/test_group.c b/test/test_group.c
>>>> +index 96dd612..42d6b07 100644
>>>> +--- a/test/test_group.c
>>>> ++++ b/test/test_group.c
>>>> +@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
>>>> +     static struct group grp;
>>>> +     struct group *result;
>>>> +
>>>> +-    (void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
>>>> ++    (void) test_getgr_match(&grp, buf, sizeof buf, &result, match_=
name, name);
>>>> +     return result;
>>>> + }
>>>> +
>>>> +diff --git a/test/test_passwd.c b/test/test_passwd.c
>>>> +index 9428bf8..97f2673 100644
>>>> +--- a/test/test_passwd.c
>>>> ++++ b/test/test_passwd.c
>>>> +@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd =
*pwd, char *buf, size_t buflen,
>>>> +             *result =3D NULL;
>>>> +             return ERANGE;
>>>> +     }
>>>> +-    last_buflen =3D- 1;
>>>> ++    last_buflen =3D -1;
>>>> +
>>>> +     return test_getpw_match(pwd, buf, buflen, result, match_name, =
name);
>>>> + }
>>>> +@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
>>>> +     static struct passwd pwd;
>>>> +     struct passwd *result;
>>>> +
>>>> +-    (void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
>>>> ++    (void) test_getpw_match(&pwd, buf, sizeof(buf), &result, match=
_name, name);
>>>> +     return result;
>>>> + }
>>>> +
>>>> +--
>>>> +2.34.1
>>>> +
>>>> diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-=
support/attr/acl/run-ptest
>>>> index 3af75c84fe..bc7947c3ad 100644
>>>> --- a/meta/recipes-support/attr/acl/run-ptest
>>>> +++ b/meta/recipes-support/attr/acl/run-ptest
>>>> @@ -6,8 +6,10 @@
>>>>
>>>>    mkdir -p /tmp/acl-ptest/test
>>>>    cp test/test.* /tmp/acl-ptest/test
>>>> +export EXPORT_PATH=3D"/tmp/acl-ptest/test"
>>>>
>>>>    set +e
>>>> +rm -rf test-suite.log
>>>>    make test-suite.log
>>>>    exitcode=3D$?
>>>>    if [ $exitcode -ne 0 -a -e test-suite.log ]; then
>>>> diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-s=
upport/attr/acl_2.3.2.bb
>>>> index 6178473873..ee86ce2cae 100644
>>>> --- a/meta/recipes-support/attr/acl_2.3.2.bb
>>>> +++ b/meta/recipes-support/attr/acl_2.3.2.bb
>>>> @@ -19,6 +19,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.=
gz \
>>>>               file://run-ptest \
>>>>               file://0001-tests-do-not-hardcode-the-build-path-into-=
a-helper-l.patch \
>>>>               file://0001-test-patch-out-failing-bits.patch \
>>>> +           file://0001-test-nfs-nfsacl.test-Correct-the-check-item.=
patch \
>>>> +           file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.=
patch \
>>>> +           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
>>>>               "
>>>>
>>>>    SRC_URI[sha256sum] =3D "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a=
73de5205bac0bf6058a2f7c"
>>>> --
>>>> 2.34.1
>>>>
>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#201151): https://lists.openembedded.org/g/openem=
bedded-core/message/201151
>>>> Mute This Topic: https://lists.openembedded.org/mt/106885245/3617179
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [alexandre.belloni@bootlin.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>
>>>
>>> --
>>> Alexandre Belloni, co-owner and COO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

