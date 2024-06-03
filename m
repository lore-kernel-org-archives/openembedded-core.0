Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BC6C25B76
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 15:25:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.86518.1717428324109623115
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 08:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=688417d902=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453AU1p4031155
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 15:25:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7svfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 15:25:23 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 453FLsvU020755
	for <openembedded-core@lists.openembedded.org>; Mon, 3 Jun 2024 15:25:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2043.outbound.protection.outlook.com [104.47.55.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7svff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 15:25:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHVJxSfz/VTL7ZWLPoxYPM1lqWmPl98NCLEyRq8NZu2xd5lDHa+iSSyrVu6mVQgYveSei2BNCQll9czYdgAVu1CtbckcvWQt3mmvh6loOGJWJ9yp6LrbR+IZ92XpkqZ3LtWxnZ1aIv9xqRXpJHILR1sJSkT6Pvsn4qU4R5CFzRBQZbDcJ5jGIptQZUnTOfAKoPRPpKoxxd9c+82aXry4djj0+SSXBmplHj0ptOG0KCLaaAgg5DMkNZWTxAstEWsN8RrfQH7OD2klXmIn3KD4CnFMOj1n6MrpOVuDjQwO+Q6nrKdavPkqSZxuyXfHHLbbNyeGY3gS8Gwf9YYcv0Subg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JaNB/7G6HGYOh24QrDxFdcptx9WPKr2A2UAIEHTRS6k=;
 b=HtrIgYffeSnucvcDVrkJ0vCG1orD1puwb95r6Xr6LDUH6CIONUeMZ1uLT+dimoEaXXVtd6yll+nmwPE6w6BQab7XII4MNZLNExI6vNrkLUtssceTI5z5LzJTV3a0QzYJq7oOPeufdph1PHHs+eaHmGLWkLUbcdkcxGwXN5O5VpNElImBGasHk+BDgvyRaLPAGuPKMynzGm7yUrQSQRM5w/XIqrE26vnVn59tgNfjiFrLLwprXg8wvyZcpe4A4RDnI9HN+hC0QsoPuk4sxBHi3FLxP6mJpcTHr8BRzSeJLiYZ4UkMoLPDeGWWN2By1YMeFdpzLS7QBYRF3DV3rw6suQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by CH3PR11MB8776.namprd11.prod.outlook.com (2603:10b6:610:1c1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Mon, 3 Jun
 2024 15:25:17 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%5]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 15:25:17 +0000
Message-ID: <1f43ccdb-e9b9-4e0c-a818-8ac6115e4488@windriver.com>
Date: Mon, 3 Jun 2024 20:55:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: rustdoc reproducibility - disable PGO
To: openembedded-core@lists.openembedded.org,
        Alexander Kanavin <alex.kanavin@gmail.com>
References: <20240603144545.163535-1-sundeep.kokkonda@windriver.com>
 <CANNYZj-CgmCG3+iCoUWV=Se8gENS7TCxOS6eLGb7RCm8nzejEw@mail.gmail.com>
 <14893660-1952-4e6e-89f3-70883d2b465f@windriver.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <14893660-1952-4e6e-89f3-70883d2b465f@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|CH3PR11MB8776:EE_
X-MS-Office365-Filtering-Correlation-Id: 870dee03-8e0a-44b9-a00f-08dc83e15f69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3l5Qzc2c29nUndCVmQwUVhIajNuMGVXR3N6WVV4YkdRTlFpa1cvQ1JpOUZE?=
 =?utf-8?B?ekNneG1mY1lJUzBNQWptSWpiVDhWMXJIb0hmbU5XQng0WkZRT3FRM01McGdv?=
 =?utf-8?B?V3ptdmNMcmFRZ2pWQjNORm9HUFRGUkJtbXNhQjRYQXNtcTFYdFdyMWplVEUv?=
 =?utf-8?B?R1NvZklvb1BlckV1aW03U3l2UVpDRGJGV3FnODdpNWR5RXp0cmZ6SXZ0QjVn?=
 =?utf-8?B?NUdzNHk2bi9Kdi9aS21ydGIwSEJrM21VZU1mQUwyb1dzSXFqbk9JT3Exa1pU?=
 =?utf-8?B?NHpib2E0S0hhOWNLZ2ljWlB1dkFHbnBvS3dNdEMvcm43WVp4SVJSbGlrWjU4?=
 =?utf-8?B?bVdDWHBIVE1pYmoxckg3NDQvSmgrN1ZPN1lScHBPZVBuTloyYW5DWFllT2Vv?=
 =?utf-8?B?Vm1Sbi9rZndmekNxd3FYdHVTbkJYU1AwWUFnbDZoTHVMTnVCMjQvQ3Q5dTBY?=
 =?utf-8?B?RkpTQk9ycVJndXZLTkNISzlzeWh1cEZPM3dhZitZbmlRMWxVQTRKODBaZlo4?=
 =?utf-8?B?TWwyVXpmYnR4S1BoaCtDaDRLTzJHeG5KUzdiMlhvYjQ0Z0crK0pTWkx3MTlX?=
 =?utf-8?B?aDAxVnNNWXR6cEh5VjVpZ2xqM3pTelgvWGZRc0lnS2hwbzhXUW1sY2xYZ3lY?=
 =?utf-8?B?Y05abnkzdHRTU2RKUkNucGtaZEt4c01pUTJFenB3dUNxcHhoYTB3T3E1eTNU?=
 =?utf-8?B?OWRDYVB2MFF5TnhWd2dqV3hWdmtjMVpYNEZEWmNEU09wbXZpakRETkxQT0d0?=
 =?utf-8?B?cThKdjJpUkE1Ukh4aVI4ZkxDL0RRZnQyeUFvM2pQM2dlOW4zbnJ6b21lUElo?=
 =?utf-8?B?TG92VU1WcHpHT2sycE5uRzNXNkJ1bXlpQUM4ZVRiZ29SOTVjeVpoaU9DYkxL?=
 =?utf-8?B?TEF5WU9YMFJ1dU5nK3JKbTNBS0ZPMjJNd3lydDJYbytGa3BvZldmTzd2Vk9i?=
 =?utf-8?B?THEvMnRBOHRQaG91NXdkNmZ5ZStRSXNRS2E0OWRDUmpvOEdTTThXR2Y0MFdt?=
 =?utf-8?B?TjdkWEtTZnR1RlZQQ01pRVdCdXFQSUcrTVFHQXlyMVdLQUg2YnFEWEpibHlG?=
 =?utf-8?B?cVMvM1h3N1VudXlXYzN5QzBSNmZyL1NCdmJPYTVlVGxWMjFNWHkyamprVi93?=
 =?utf-8?B?VlB0VWs5Nk1rU21ENmhmUjFWMEh0SEx6TGFjNGNYVlhwSElleHlON05uUFlX?=
 =?utf-8?B?WGpSVkUrNWJUSlBuMEFLcGs2eVlxNjFkdFZnWnB2aVNUTTFVeXpUZ3c0ODcw?=
 =?utf-8?B?c1lROHFZem9LcFpWdXlBd3BsWExyUytKb0hjRFRXTCtvS2tLMk93bW1HQnlv?=
 =?utf-8?B?V0IrdGZGL0tXWWlwUU0vTUNFZGExdXJMN00rWllyTnJKUnVsZjgrSGkyMlhl?=
 =?utf-8?B?UHpRR1d1V2oyUTQ3Z2VCVm1OL2gxQVRLY2hwbEdkNityVWtIRC84UkZ6Qm05?=
 =?utf-8?B?Y3JKckpYUmFwemJQOWpENWowNVY2VnJlT2wwcFVJdTZDMWMxTnpzcU5JSlNS?=
 =?utf-8?B?c0lDUHZYcUR4Tit6L1hWT09TdWY2NE0weU91NkdTMGR3bVZiV2d1TUp3ZXZa?=
 =?utf-8?B?MjZJZ0RheXBHY0ZnZTEwRmJCcWpaV2JnbkxTeHhKWFNzdDB3OGFRVXJZaTcr?=
 =?utf-8?B?SlF4akw3MndXVEdWN0c1RTlaa096L29WajJUaXR2UmdweDJoaHdDVFBSUVJU?=
 =?utf-8?B?SDdncG5ReEx4QjcxMXlvNVREdnQzMDlxb1VmcGROYkZGUW9ReDN4cmE1RzE2?=
 =?utf-8?Q?6qV/gxlz1gjATsfaCo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b1BiV0FGWDBWbCtobVV1bW5Ydmg2TkRNaWI0djhVQTM2dTU1SjhvdkNrWDFj?=
 =?utf-8?B?T0JSbk9oWmNlVGFyVDFBNzRhdXVIZ0RuYnZtSEpORjBub3JieDk3dTN3S3FY?=
 =?utf-8?B?R0FrbXRReFRyQ1pTYVVBSXVqMHF6a2sxOHdwNkNmTmdrajdPQjNzOUFXSDFJ?=
 =?utf-8?B?SHRhUjF4VUpkOWdGdmUzbTRTUHdOcFo5d1dPdTl0V3N1OU80KzFFSktpQzNJ?=
 =?utf-8?B?Q2I4UEgrZ1ZjdzVoN1BRZ1pqTkhTTnFRNURSbDROcjFMRG85VzdNOG1hWmtV?=
 =?utf-8?B?V3BvRDhBZ2xrMytpUWZ0aDN1QVZkNkkrcnhjM011dTEyQTl4SnhRUUxiQW5D?=
 =?utf-8?B?MFo3NkFkNDhGSkxRM3cvOHBuT0FQbC9EVnRTTzZvaWdnK3Q3Y0dkUFVJQy8y?=
 =?utf-8?B?dEZJclNPeFBhckpYNGZNM3QyL0plSFhpUE9NN1lxekFDKzdPTGg5ZG9Femxk?=
 =?utf-8?B?R1Z4Y0h0SWxOMER1cmF2TUVra2JLYUJNQnY1aWF5ME9BNDV1dk1xUVIyd3NJ?=
 =?utf-8?B?aTBkMXluOUsrNjJpL0VZUDZjQkt3MUZFS0ZqdzZaaUZDNTRMV0dJeUlEWG1l?=
 =?utf-8?B?cEJoSHdBRmNMYUpqVFR3Q1V0V0svNmVMWnJyN2FPVkZwMk1mRnViOEVha3VF?=
 =?utf-8?B?VUc1ZkhRWlptWXIwSW5JUm5FZVRoNXg5Q2hQbDZ0YmlzUGptSnhGUHEySlk4?=
 =?utf-8?B?dzMycSt3N1A2Zk55WW9Kc3ZzWm01a3JCdWNDYUowQXVPTmVpK2dBNWxLa2RH?=
 =?utf-8?B?bys0OTNDZXhJV2g0MXk1MFdTeURzQU1vOEErN3N2NUpjZW1DVW5mK2lVYUtX?=
 =?utf-8?B?K21ZU0tUaXE1SGN6U1dJRzNjOVpTOEdPNkVMSUR0Z2xpZlRNMk56UUhvUXVt?=
 =?utf-8?B?Nng1b0FieEdIRHhOUndrZXk2azdwQmk2a3V2c0JEbzhKRGx0K2xJWXZEYzBJ?=
 =?utf-8?B?dWM5ZjJCUUI5dmZaMGNCRjdaWno0R3FyZ2N3RFBCalVjc0lHSVJMZHlQK25Q?=
 =?utf-8?B?U2FGWkRaa3BHd29obUJMdWZyVGE3L0xISlBiSTJJeEtteE5UUk1MVnhMbndP?=
 =?utf-8?B?cVBzQTNrU0hzYVVicWYrcWhMQVhpYXF6ZnNVZGNLc3piMnluekV6NDhGdWds?=
 =?utf-8?B?d3VQVFpIV0hObzZIT2hLTDAzU3JSQkhoeXlFdE9pNUZMSExQeVZZbTNnK3dV?=
 =?utf-8?B?M2x6aGFleVVON0xOeFFRa09GdDVBU3l1bkZVQUg4dHVPM2ZnQXZsMGQxQW12?=
 =?utf-8?B?eU1RdXA2dnEyMDlTZlJUTGtMRGR3WmQ1YnpibTlERzk0V1lBUjhEVzQ1M2th?=
 =?utf-8?B?dFgvdS82bUJBTG1WWHliMFpkUEorQ00wcC9KbkhRZGhHNTJ2ZVpSQm83c0FU?=
 =?utf-8?B?bnVqelJsUE5yMUxrM1dtZ2FITzVuN3lQU0F6d0JJRHFuY1JIQnlBMFNIR3RD?=
 =?utf-8?B?YklCeTZlN1lkdzVsb0dYSmxYd2lkWkkvZFlEOWtUb0pCZDA4RFYwa3JnVVVU?=
 =?utf-8?B?RFg1T3hFcW9jQkhDRHFEcFBSelRQRWxpb3dGR2VmR2ZBOVBxcy8xZUJBWEdY?=
 =?utf-8?B?ZGl1ZlFEMWFWL0pLaXpSUnh1TUx4SjVGWW5aWmg1UTBOd2FqR0VPUVBpbUxQ?=
 =?utf-8?B?ei8ycFhzaUpGRkgyRVlCYU5VbCtsbkE3b01qWFk4SHVkaXNWa1VtWGVlWGlz?=
 =?utf-8?B?ZjlrNUlYcit6clFoSXFyK2hrODJ2MUNjT0JXemZOWFdGMkZna1VZOVhZSnpM?=
 =?utf-8?B?NG9BaTZLRUFRcFd3NDF0eVV3S1RaMmNncURPVHhuNFlMUEJKTHloUGlvREVq?=
 =?utf-8?B?K2wyampaWEdMRUxFNFprQkx3dlhRZmxMNm5MMkRKYlpxeWp3cDZCNjEzQzBz?=
 =?utf-8?B?TUp5TURJVEcxYjBldW9WbFFTZTdzcExVNlZDeHI4UTd3bEh6NUlBS3dwdlEz?=
 =?utf-8?B?VUNFSU9sZTJ2TE1GVmpNaUQ2emFhU2ZYbWpsbWIvOGNaTU9ldFYrRUZ0cVVZ?=
 =?utf-8?B?a0MyejgvVTFGbWthTEZWcXJGMWp4cUMwaGdmdHZjZURmMmdhWkgvbFI5Rzk0?=
 =?utf-8?B?dXFtd1FnNXRpSWZ2dk1DZTJMc3JzSFpEWTM4T3VxYWVoUSsrMFhWdTRmWlZH?=
 =?utf-8?B?dmU4ZEpTQzlIV0RsajBtVW03dnRWVkxEZnk5dnVPdVVKYjhuWFdoYStVUFVw?=
 =?utf-8?Q?ow27ZqYBc3nk1rtYwtqfPHg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870dee03-8e0a-44b9-a00f-08dc83e15f69
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 15:25:17.2174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5fz9d4STWSiYgJZ1tuSuI16k1bB9sLH1RyHi8uyqBVoQHnlPACeXTyw/5eeN27wa/4DPYizzFqScRccKS1hc592NGCIbHgX/rKgFXQtm3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8776
X-Proofpoint-GUID: pYIE94MiGn7sjxi_6AETrQzFL-PsBIX-
X-Proofpoint-ORIG-GUID: m7OfxqGklebo6BUz_p9alJTm-YDL9_St
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_11,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406030126
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 453AU1p4031155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jun 2024 15:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200265


On 03-Jun-24 20:37, Sundeep KOKKONDA via lists.openembedded.org wrote:
>
> On 03-Jun-24 20:20, Alexander Kanavin wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> Wait, did you test this patch locally? What was the outcome?
> rust-rustdoc_1.75.0-r0_amd64.deb is generated and the binaries are=20
> identical.
Also, as I mentioned in commit message it is a test patch to see the=20
issue is fixed or not on autobuilder.
>>
>> Alex
>>
>> On Mon, 3 Jun 2024 at 16:46, Sundeep KOKKONDA via
>> lists.openembedded.org
>> <sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
>>> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>>>
>>> The rustdoc binaries are differed on their .llvm.<hash> suffixes=20
>>> between the builds.
>>> This is a test patch to verify the PGO effect on rustdoc binaries.=20
>>> The issue discussion is here:
>>> https://internals.rust-lang.org/t/rustdoc-binary-is-not-reproducible/=
20027=20
>>>
>>>
>>> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>>> ---
>>> =C2=A0 meta/lib/oeqa/selftest/cases/reproducible.py | 2 --
>>> =C2=A0 meta/recipes-devtools/rust/rust_1.75.0.bb=C2=A0=C2=A0=C2=A0 | =
4 ++++
>>> =C2=A0 2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py=20
>>> b/meta/lib/oeqa/selftest/cases/reproducible.py
>>> index 97a9c3da90..80e830136f 100644
>>> --- a/meta/lib/oeqa/selftest/cases/reproducible.py
>>> +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
>>> @@ -16,8 +16,6 @@ import os
>>> =C2=A0 import datetime
>>>
>>> =C2=A0 exclude_packages =3D [
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'rust-rustdoc',
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'rust-dbg'
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>>>
>>> =C2=A0 def is_excluded(package):
>>> diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb=20
>>> b/meta/recipes-devtools/rust/rust_1.75.0.bb
>>> index c66c14cc5a..4caa5892e6 100644
>>> --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
>>> +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
>>> @@ -153,6 +153,10 @@ python do_configure() {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rustc =3D d.getVar('RUSTC_BOOTSTRAP')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config.set("build", "rustc", e(rustc))
>>>
>>> +=C2=A0=C2=A0=C2=A0 # Support for the profiler runtime to generate e.=
g. coverage=20
>>> report,
>>> +=C2=A0=C2=A0=C2=A0 # PGO etc.
>>> +=C2=A0=C2=A0=C2=A0 config.set("build", "profiler", e(False))
>>> +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cargo =3D d.getVar('CARGO_BOOTSTRAP')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 config.set("build", "cargo", e(cargo))
>>>
>>> --=20
>>> 2.43.0
>>>
>>>
>>>
>>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200262): https://lists.openembedded.org/g/openembed=
ded-core/message/200262
> Mute This Topic: https://lists.openembedded.org/mt/106463035/7677583
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sundeep.kokkonda@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

