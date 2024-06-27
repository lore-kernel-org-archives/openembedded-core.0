Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7C6C3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 06:16:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1811.1719468966250513306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 23:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=69087085fa=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R5JKQC010039
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 23:16:05 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fve0d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 23:16:05 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45R6FXCX023789
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 23:16:05 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fve0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 23:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYfJYqyynxl1FlvSQDlLfaT8Za6ZW60mLzAxaHjqxReW81eqO7Wv0JXE65cuTP3PcZwBOj6DFZ6AKQ24HM7oTYYsB5Ljh1/tOfVJhVDRk3BKIG6otKoJKzoG3PfnrZbx63RxH0vDNg/PzCQI6FAgD1G6F4NLBTr2EHE/4QL5I3YKfOnOXOtcglOXvqKBKtHCpCSvrX1zLzj6GECEP3rcE3NjAdKuBm/2UJzkzoGKYdoY4vYhdKrt4hbk7RMFCOc3ui2hOQ870HQd2AZbX6s9W6cpyjKWBQIrYid07gtw8sJLnQaJZ970+jBEKtpQmHVsT+JLKCqHhk/AvwdfU76hyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V848CmXauklkUMQ1eJaoAQ1myCMkZ+a5EuB093XWVYQ=;
 b=nk6FcrSXmsFVjn9isyqrnhVzy9oBaHLXNYuGVkBRdAueP4Fw8zWlbYscMFQpxD8kjKcngP1ffiA4wYJLpXDl/Q62sHh33ie9mREfkDlk+crd6cbxRjUh6rWYA6S0Fb0xsuUqIc5GxjwxaxahtOE0BSMYY+AzrCnjeIECGA2c9yS7kJciptUVJJ4X4wH5SvGQjnejA41OxyEbdXmSH8dhAFJbW4dKSUK1u2Njhe3oRX8//MMnxjRyqgda21gNs0Idnk8rakoeqs0Rqmjkxoxa8N0qULmSXElIJDVcng0NnjF53LWxLbHP6FxNh7cuPAS5OLZIcF+AdyoNLVcDcIVkKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CY8PR11MB7058.namprd11.prod.outlook.com (2603:10b6:930:52::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 06:16:02 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:16:02 +0000
Message-ID: <55d756d2-990e-492b-a299-a1c13186ff6f@windriver.com>
Date: Thu, 27 Jun 2024 14:15:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] acl: Fix nfs ptest failure
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org, Ross.Burton@arm.com,
        =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
References: <20240626055637.2195328-1-mingli.yu@windriver.com>
 <20240626230938fc033ae6@mail.local>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <20240626230938fc033ae6@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0171.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::6) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CY8PR11MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 3256fe54-7407-410c-f1f2-08dc96709e44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?emhwRlhnL3ZTb25uV1N0alZjQ0wwcjJHTWNsQ3FaZWkvaEoyWmdBRElZb3lG?=
 =?utf-8?B?bWdBQy96RWpYcWJPU09xZVBuWkVnRUE3V2cvTUtVemhWSmZVT3ljTGRJcVpu?=
 =?utf-8?B?bnlpV0xsZjdvS1d0djl4Y25NYThjVlFNaXgyZHc4eTE3R3MvVGdyQlkzTWxz?=
 =?utf-8?B?SCtEbXJ0QnlWUnNyN1NYOENiUzJXQU84YnhvVkFMcXVUSENlb0s1Wkc0TjAz?=
 =?utf-8?B?c0wyUUV0VHMyMURJTDhTSytQVjVsRWIwRDkyOTJaeFJCS3h0RFVkRUQvcW0v?=
 =?utf-8?B?UTRaaVREVzVVeEZuRzA3aWFOaHdRZ2JmS0lWSldkakJNU0ZDb1hvZzNmUWdu?=
 =?utf-8?B?Mm04eGhOT1Jib3BXc2ExNktKc0FDV2lESDZERGJQZGRhcmtwdXc2TnJESXlw?=
 =?utf-8?B?TlRsTmErMlVyblRCOHNvMVRoTjNvYnEwVHQxTmFmNmhBNFhKajZJQlZON3Nn?=
 =?utf-8?B?SkRWTWFJTVVxMHN5SWpBVmNUMHViVWNhM09wanIyTzVIbVdoZVNRQU9wOHR5?=
 =?utf-8?B?MXRvSTh3MnR3UmI0aFZYK2RVWXovV1hzNkluN3JtOWlpVG5kMjJ3cFJ3czg5?=
 =?utf-8?B?WFNGTTFaYUpFdkc3S0YzVnJmZ0lJNndpR0RjUzdCdC9aTXlqM0ZzK3d0TDhP?=
 =?utf-8?B?MlptNWlkcUkxZkFDQ3JUeVVqcUtSd0k0eThMMHBweHpXRXZieStTZGdEMThj?=
 =?utf-8?B?Wm9CdjR2Ymx4MFZNQnB3OUVxdmhmTHRaNGhOcjlDbm9naitUT3JXVnVkSjhF?=
 =?utf-8?B?dHNuU1IxVUkzOUx2NWRlUTZuSUw4OVB2bTQyeVVxaXBLcHFMZ3F4WDl4MjRN?=
 =?utf-8?B?Z1R2bzZOR3Q1YVJIQUhsamY4QWloTXJybWNxZTNxRmI5a2VMampZVm1sL0pS?=
 =?utf-8?B?ejNCMjQ1cURVY2IvaTgwZVl6d2M1Q0lQUStkZkVJSHpFTVR5SWU4REVoN3Bz?=
 =?utf-8?B?bW9uSlNGMERzVHloSEh3d2FaTDNjMkVkaC82eHpCc1V4cVVScStwcldZU0Ir?=
 =?utf-8?B?bjZmcEw5ZWdFNkdid0YySXFCWE9mVFhia3lXZjZRZWthdkt3UnhidFZnNjJu?=
 =?utf-8?B?TDg3OWJOK0xlZ1IwVVdkWld5Nm91OXc2bmhZVE5pSVJ6dTR4d1dqZXZyeWFC?=
 =?utf-8?B?bkVzeCsvU1NZenA3OFpjY1V1UWFUTnhQWjdINGFDc29pNmZTNzRncEVSVGwy?=
 =?utf-8?B?S29HeVlKYjBIRE5penhrUHA4eTJINkQxRlZteFU1WkJZbjJQVURMbVh6QzRN?=
 =?utf-8?B?ZUhGelh0SnNsdXZaWkZVSjFjQXMyTGFuRllRMzdMdTd3NUxlNUJoSE9URlB4?=
 =?utf-8?B?MUZoZnQ4bFY2cnVTanhKd3RVeDZvUll2bDdFdGw5NzNpek5iNG8rS0lRSlhy?=
 =?utf-8?B?V1VCMjFiVVJPeUs4NVZDeUZaeGU1Y1AyY01oNVIzM2g3Q0oxNDI2Skp2dktD?=
 =?utf-8?B?NFplQUs4RmtuYmlRK2YzekNJVi9OL2o1bi90WXVZdnkwVjVsWHVxb1BRQVN3?=
 =?utf-8?B?Tkg2ZXBFeTNZNVpuRVRmWXhPMnh3SllsNGF0SXEweVJ3RVVqRU5oQXRESmJG?=
 =?utf-8?B?QVJRY2gwTEMrR0lrUnhKeThSQmI4WER0UlhYd3pKNlV3YzVQdTNwYUd4Y0dn?=
 =?utf-8?B?eG0reGFuRi9zenllcXNjeDZTRE92OXR1ejJodVZHNU9jbXVvNTQ2TjBoRWpZ?=
 =?utf-8?B?WGQ5OWNNSkx0UTZOSm5EckhoR3pmSmZWZGUzR1FiOWNBL2NCcDk2L1diamxJ?=
 =?utf-8?Q?4BNqo9uaiHUjtYkCik=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SGNiekJ4dmlHYzd2a3E2amVjQ05DeWRncDUyM2x0Y1RPaHF3bTh6SDZIU3Zu?=
 =?utf-8?B?SEFhYXEwTlNQSkszMGN4S2kxcVY5THpiZCtMY0xyVFQ2K0liZWpMUUVZZmRO?=
 =?utf-8?B?Q2MwZlJYSERZTk1ITHNzZ3d3Ymk0UTNoa2k1ZWpmUXd5UVZSSjRnY3owOUM5?=
 =?utf-8?B?ZVNoUUNiZXVSeHNMNW1UbDIwdzJYMDhBQzkweHg2YUdPbnpnZVlNQkcwU010?=
 =?utf-8?B?TFFvczNtSHczajVTN2lmdkwrcGNNcSs0bXAxeDdzcS9qQVZtcGY2Tks4ZkFE?=
 =?utf-8?B?K25WMVNPK0JDazdoSXMwN010dG5UdWkzM0dLdzVHWEwyRkhUNEszTDljSUdQ?=
 =?utf-8?B?VW96U3l2QzlTR09yQnBOcW1wUWUxT2V6cFRiRFArQzdudUYvWE94TzY1UVRQ?=
 =?utf-8?B?V2xyTDJZd3VtcjNkU3p3Y043Rk5oc1hiVWFHUUtja05PYll1cTVYajN4N1VC?=
 =?utf-8?B?UHhNTTJRODBWVzVXZXFNNkRzQllZTDlsSDNCenF1eGh3WlpRK3RVZUZWYWN2?=
 =?utf-8?B?cENOaGxXVzBjTHczMW0ybG5JS05XYTJzUmI0ZjhkQXE4YTZobHo1bnhCcThJ?=
 =?utf-8?B?UU90NlcrOS9JQWZ1M0dYOTducUpTVDVXVnl3dmJEbDMrbW9mZzAvRi9xaDR1?=
 =?utf-8?B?Y0lhajhVZEJOWm83ZVhwd00zSUUxeGZRTlBiNWVlQ1hNbFZ4Sk9RZzBOUlJS?=
 =?utf-8?B?Q3RxTHYzTGwzaU9iblNWWFR1QTJpSVM1SnRwWXhOYlpBdU5JYWVzcWtpUXV4?=
 =?utf-8?B?NVBzak01emovdHJZcC82YjVsZkl0Q1FBbTBUaHJtb25oNC9sd3Q0TytvQWdi?=
 =?utf-8?B?SmdLeUZ4T3gzV2ZhUmZiV01sRG55WlpGSVlmMFJxenRBZkUwcENiRlc5eTJh?=
 =?utf-8?B?M2VRekZ6bmZ1MUJhSExUckxNU1diQ1RjTkdHM0FQaHBIMUVtZWNBbVkzYTR2?=
 =?utf-8?B?eTdQeW1CbUhzc3ViNXFGcjIrWExxNll6VDBtcVoyYk5wNmxPQmlILzI5Tzc0?=
 =?utf-8?B?bmlWRUhJZGRUSmgvU085MTFLUlRHbDZtd2N6SGNhWERxZFdiZHNiWXJrK0xa?=
 =?utf-8?B?OFRYVEhHaE1ZcFlmMUFqTndneUdKRVpMZi96cUV1UGRWSkJidDRYVk1mWmtO?=
 =?utf-8?B?clhQRVB4ZnZaL3Fub3N0dVVYd0tFQ1dmYTFCYk1ZeGwxMERvMTVzU3hSdHFY?=
 =?utf-8?B?UiswUkg0Tkpaeis3V3Z6NGRwRE9ZR1BpLzR2WVgwL3djZm1oYlFYSlRVN01W?=
 =?utf-8?B?dnZtMHM2VTAxZXozWDdsTVpFYXlCb29OWFdkMHNMZkdTRC9lV3M3N0RxQXZw?=
 =?utf-8?B?SUhtVU56MlNVTWZSamRVbDV0NzZBL0JUc2NDeWJBR21WNTY0QTRGQVVjc1RJ?=
 =?utf-8?B?ZlhLV2t6SEFSRWhHWUMxbFNaUk10UEpCdmVxWHc3ckVVbUNFc2lRT2hwN0lw?=
 =?utf-8?B?R0dtdnBwZnh0eVFvOXArU0hKYUJHVEMyalpOelB2TTY3THlGY09XQUZKS0ND?=
 =?utf-8?B?S0JPckg3SGg2WnJNV0JpMmlWWlgzb1MzWFZUN3dTMnBOM0YrRVduc0NhQW5r?=
 =?utf-8?B?T2MvWW15aXJWS3VtdENJYjY1ZWo1ZHRjNG14eW0rU213U2VHbzhLZ0dqWk9T?=
 =?utf-8?B?VXNnUmpYNk1qelF2VHhNazZPWlJQenVmQWJVM09raG9tdUY2TXhNb0NJcDhq?=
 =?utf-8?B?RjY1TW5FN01OSTlNQUtHTDlJaVhabWlOT254cXRORldkR04wOWNlVW9UVFpi?=
 =?utf-8?B?eG1jejB3dTFVek92WnZGZWV3ZUpRbHc0TDF3dktVMTU2VUJEZ21adnBFaHZY?=
 =?utf-8?B?S0xhbVJXSjFHK0J1RG5ZUHVyL3h2OXpoM0ZVdVVyTjJhcStQS2d6bWczL21I?=
 =?utf-8?B?SkRzNkowQzkyKzhxVCtxUVpuWXdvYlhGZEZyWmhlcm5uMXFWZkltcDQ2TS9Y?=
 =?utf-8?B?NnIvcFZDN0NrQ3BZZm9CRDd4b3I0b3hTbXFVODRXTXhUenNiN0JmS0dqSFZC?=
 =?utf-8?B?N0l0YUVRMi9DczF5K3FkNTdleVowenQxckt4TUFjS3ltNVJiSGZqdGk5SFpz?=
 =?utf-8?B?YnRNTlkvWnhFK1RNc2ptNXdqWmhaTjZETHhMMFlWZlFnc1YzNGRlS3NUZ2pY?=
 =?utf-8?Q?RffWiKlGm09RVNWZCgUglrnUO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3256fe54-7407-410c-f1f2-08dc96709e44
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:16:01.9191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmigjn61u/JmQrOJ32BWw8f5fOQiyY6/Hj/nL4MHM1zOUz1dmCNI1kochMhAW8wB3URyfJDKPX6mxJMtxQqslQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7058
X-Proofpoint-GUID: qni95Tpq2rCAQm4YeqqjgLTkPwLI_eib
X-Proofpoint-ORIG-GUID: iJgFwM0LTppgMyq-ZDFmZZbGtEE88pfH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406270045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45R5JKQC010039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201182



On 6/27/24 07:09, Alexandre Belloni wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> Hello, this fails on the autobuilders:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6574/=
steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6751/=
steps/12/logs/stdio

Noticed the patch already in master-next, will send a follow-up patch to=20
fix the issue monitored by autobuilder.

Thanks,

>=20
> On 26/06/2024 13:56:37+0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> * The date such as "Jun 13" should take 2 columns, so the expected che=
ck
>> item "test/sub2" should the column 9.
>>   # ls test/sub2 -dl
>>   drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>>
>>    Corret the check item to fix the below failure in the test/nfsacl.t=
est.
>>    [11] $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}' -=
- failed
>>    drwxr-xr-x 07:23                      !=3D drwxr-xr-x test/sub2
>>    -rw-r--r-- 07:23                      !=3D -rw-r--r-- test/sub2/bla=
h
>>
>> * Use the abosulte path otherwise we won't find the expected file blah.
>>
>> * The calls to getgrnam_r would always fail because the size of the
>> buffer was smaller than the minimum (170000) specified in the test
>> implementations of getgrnam_r and getpwnam_r.  Use test_get*_match dir=
ectly
>> because getpwnam and getgrnam should never fail on ERANGE.
>>
>> This commit fixes the following failure in the test/nfs/nfs-dir.test t=
est:
>>
>> [16] $ su bin -- failed
>> su: user bin does not exist           !=3D ~
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   ...s-nfs-dir.test-Use-the-abosulte-path.patch | 46 +++++++++++++
>>   ...s-nfsacl.test-Correct-the-check-item.patch | 51 ++++++++++++++
>>   ...0001-tests-fix-getpwnam-and-getgrnam.patch | 67 +++++++++++++++++=
++
>>   meta/recipes-support/attr/acl/run-ptest       |  2 +
>>   meta/recipes-support/attr/acl_2.3.2.bb        |  3 +
>>   5 files changed, 169 insertions(+)
>>   create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfs-d=
ir.test-Use-the-abosulte-path.patch
>>   create mode 100644 meta/recipes-support/attr/acl/0001-test-nfs-nfsac=
l.test-Correct-the-check-item.patch
>>   create mode 100644 meta/recipes-support/attr/acl/0001-tests-fix-getp=
wnam-and-getgrnam.patch
>>
>> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-=
Use-the-abosulte-path.patch b/meta/recipes-support/attr/acl/0001-test-nfs=
-nfs-dir.test-Use-the-abosulte-path.patch
>> new file mode 100644
>> index 0000000000..c48ee9f820
>> --- /dev/null
>> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfs-dir.test-Use-the=
-abosulte-path.patch
>> @@ -0,0 +1,46 @@
>> +From e87562e4e03450e380bd1ce8e11c561e8f9653d2 Mon Sep 17 00:00:00 200=
1
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Mon, 17 Jun 2024 11:22:21 +0800
>> +Subject: [PATCH] test/nfs/nfs-dir.test: Use the abosulte path
>> +
>> +Use the abosulte path otherwise we won't find the expected file blah.
>> +
>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl=
-devel/2024-06/msg00001.html]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + test/nfs/nfs-dir.test | 8 ++++----
>> + 1 file changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/test/nfs/nfs-dir.test b/test/nfs/nfs-dir.test
>> +index 33e5f5f..7216a6e 100644
>> +--- a/test/nfs/nfs-dir.test
>> ++++ b/test/nfs/nfs-dir.test
>> +@@ -14,7 +14,7 @@ EXPORT_PATH =3D> the path that is mounted at the wo=
rking directory.
>> +     Make sure the file can be accessed before.
>> +
>> +     $ su bin
>> +-    $ cat test/blah
>> ++    $ cat %{EXPORT_PATH}/test/blah
>> +     > blah
>> +
>> +     Set up a situation that triggers the bug.
>> +@@ -36,12 +36,12 @@ EXPORT_PATH =3D> the path that is mounted at the =
working directory.
>> +     fail with "Stale NFS file handle" or "Input/output error".
>> +
>> +     $ su bin
>> +-    $ cat test/blah
>> ++    $ cat %{EXPORT_PATH}/test/blah
>> +     > blah
>> +     $ sleep 3
>> +-    $ cat test/blah
>> ++    $ cat %{EXPORT_PATH}/test/blah
>> +     > blah
>> +-    $ cat test/blah
>> ++    $ cat %{EXPORT_PATH}/test/blah
>> +     > blah
>> +
>> +     Clean up.
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-C=
orrect-the-check-item.patch b/meta/recipes-support/attr/acl/0001-test-nfs=
-nfsacl.test-Correct-the-check-item.patch
>> new file mode 100644
>> index 0000000000..f990ca4a31
>> --- /dev/null
>> +++ b/meta/recipes-support/attr/acl/0001-test-nfs-nfsacl.test-Correct-=
the-check-item.patch
>> @@ -0,0 +1,51 @@
>> +From dfc6328f02821f9c6703f764ec6f53cf81daaab6 Mon Sep 17 00:00:00 200=
1
>> +From: Mingli Yu <mingli.yu@windriver.com>
>> +Date: Mon, 17 Jun 2024 11:00:43 +0800
>> +Subject: [PATCH] test/nfs/nfsacl.test: Correct the check item
>> +
>> +The date such as "Jun 13" should take 2 columns, so the expected chec=
k
>> +item "test/sub2" should the column 9.
>> + # ls test/sub2 -dl
>> +drwxr-xr-x 2 root root 4096 Jun 13 06:01 test/sub2
>> +
>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl=
-devel/2024-06/msg00002.html]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + test/nfs/nfsacl.test | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/test/nfs/nfsacl.test b/test/nfs/nfsacl.test
>> +index 4f37322..dfcc323 100644
>> +--- a/test/nfs/nfsacl.test
>> ++++ b/test/nfs/nfsacl.test
>> +@@ -8,7 +8,7 @@ The test should be run on an NFS export mount with AC=
L support.
>> +     $ echo blah > test/sub/blah
>> +
>> +     $ cp -rp test/sub test/sub2
>> +-    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
>> ++    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
>> +     > drwxr-xr-x test/sub2
>> +     > -rw-r--r-- test/sub2/blah
>> +
>> +@@ -23,7 +23,7 @@ The test should be run on an NFS export mount with =
ACL support.
>> +     >
>> +
>> +     $ cp -rp test/sub test/sub2
>> +-    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
>> ++    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
>> +     > drwxrwxr-x+ test/sub2
>> +     > -rw-r--r-- test/sub2/blah
>> +
>> +@@ -31,7 +31,7 @@ The test should be run on an NFS export mount with =
ACL support.
>> +
>> +     $ setfacl -m u:daemon:rw test/sub/blah
>> +     $ cp -rp test/sub test/sub2
>> +-    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$8}'
>> ++    $ find test/sub2 | sort | xargs ls -dl | awk '{print $1,$9}'
>> +     > drwxrwxr-x+ test/sub2
>> +     > -rw-rw-r--+ test/sub2/blah
>> +
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and=
-getgrnam.patch b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-a=
nd-getgrnam.patch
>> new file mode 100644
>> index 0000000000..2fea254fec
>> --- /dev/null
>> +++ b/meta/recipes-support/attr/acl/0001-tests-fix-getpwnam-and-getgrn=
am.patch
>> @@ -0,0 +1,67 @@
>> +From 6398d3fe7a766b4e3cd15bb77fd0f15f7dba52b2 Mon Sep 17 00:00:00 200=
1
>> +From: =3D?UTF-8?q?Luk=3DC3=3DA1=3DC5=3DA1=3D20Zaoral?=3D <lzaoral@red=
hat.com>
>> +Date: Wed, 19 Jun 2024 11:11:30 +0800
>> +Subject: [PATCH] tests: fix getpwnam and getgrnam
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The calls to these functions would always fail because the size of th=
e buffer
>> +was smaller than the minimum (170000) specified in the test implement=
ations
>> +of getgrnam_r and getpwnam_r.  Use test_get*_match directly because g=
etpwnam
>> +and getgrnam should never fail on ERANGE.
>> +
>> +This commit fixes the following failure in the test/root/restore.test=
 test:
>> +
>> +[21] $ chown bin passwd -- failed
>> +chown: invalid user: =E2=80=98bin=E2=80=99        !=3D ~
>> +
>> +Fixes: 3737f000d3f17cd283f51eeacac21a71a3472053 ("use thread-safe get=
pwnam_r
>> +and getgrnam_r")
>> +
>> +Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/acl=
-devel/2024-06/msg00000.html]
>> +
>> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> +---
>> + test/test_group.c  | 2 +-
>> + test/test_passwd.c | 4 ++--
>> + 2 files changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/test/test_group.c b/test/test_group.c
>> +index 96dd612..42d6b07 100644
>> +--- a/test/test_group.c
>> ++++ b/test/test_group.c
>> +@@ -136,7 +136,7 @@ struct group *getgrnam(const char *name)
>> +     static struct group grp;
>> +     struct group *result;
>> +
>> +-    (void) getgrnam_r(name, &grp, buf, sizeof(buf), &result);
>> ++    (void) test_getgr_match(&grp, buf, sizeof buf, &result, match_na=
me, name);
>> +     return result;
>> + }
>> +
>> +diff --git a/test/test_passwd.c b/test/test_passwd.c
>> +index 9428bf8..97f2673 100644
>> +--- a/test/test_passwd.c
>> ++++ b/test/test_passwd.c
>> +@@ -119,7 +119,7 @@ int getpwnam_r(const char *name, struct passwd *p=
wd, char *buf, size_t buflen,
>> +             *result =3D NULL;
>> +             return ERANGE;
>> +     }
>> +-    last_buflen =3D- 1;
>> ++    last_buflen =3D -1;
>> +
>> +     return test_getpw_match(pwd, buf, buflen, result, match_name, na=
me);
>> + }
>> +@@ -131,7 +131,7 @@ struct passwd *getpwnam(const char *name)
>> +     static struct passwd pwd;
>> +     struct passwd *result;
>> +
>> +-    (void) getpwnam_r(name, &pwd, buf, sizeof(buf), &result);
>> ++    (void) test_getpw_match(&pwd, buf, sizeof(buf), &result, match_n=
ame, name);
>> +     return result;
>> + }
>> +
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-support/attr/acl/run-ptest b/meta/recipes-su=
pport/attr/acl/run-ptest
>> index 3af75c84fe..bc7947c3ad 100644
>> --- a/meta/recipes-support/attr/acl/run-ptest
>> +++ b/meta/recipes-support/attr/acl/run-ptest
>> @@ -6,8 +6,10 @@
>>
>>   mkdir -p /tmp/acl-ptest/test
>>   cp test/test.* /tmp/acl-ptest/test
>> +export EXPORT_PATH=3D"/tmp/acl-ptest/test"
>>
>>   set +e
>> +rm -rf test-suite.log
>>   make test-suite.log
>>   exitcode=3D$?
>>   if [ $exitcode -ne 0 -a -e test-suite.log ]; then
>> diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-sup=
port/attr/acl_2.3.2.bb
>> index 6178473873..ee86ce2cae 100644
>> --- a/meta/recipes-support/attr/acl_2.3.2.bb
>> +++ b/meta/recipes-support/attr/acl_2.3.2.bb
>> @@ -19,6 +19,9 @@ SRC_URI =3D "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz=
 \
>>              file://run-ptest \
>>              file://0001-tests-do-not-hardcode-the-build-path-into-a-h=
elper-l.patch \
>>              file://0001-test-patch-out-failing-bits.patch \
>> +           file://0001-test-nfs-nfsacl.test-Correct-the-check-item.pa=
tch \
>> +           file://0001-test-nfs-nfs-dir.test-Use-the-abosulte-path.pa=
tch \
>> +           file://0001-tests-fix-getpwnam-and-getgrnam.patch \
>>              "
>>
>>   SRC_URI[sha256sum] =3D "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73d=
e5205bac0bf6058a2f7c"
>> --
>> 2.34.1
>>
>=20
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#201151): https://lists.openembedded.org/g/openembe=
dded-core/message/201151
>> Mute This Topic: https://lists.openembedded.org/mt/106885245/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alexandre.belloni@bootlin.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20
>=20
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

