Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F073C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:35:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.206173.1724056549334716527
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8961296bbf=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47J5xBQE019802
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:35:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6sj2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:35:48 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47J8Zlco023478;
	Mon, 19 Aug 2024 08:35:47 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6sj2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 08:35:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnyP3EDkrC9b5vCWvqNjPQvk4dT1o2jB6fnoA4xzKu5scefnlM1VBlt1jloggo5bMPjjIHGzgu1gFK5UdNnVzv7jHwV94foiRIyABWEG9CRErQEo0mrd7YUEqgw5tArHZOjUXHZvHuf8RIZ0cq0BjpHeE+5paCuLjApjQclEYWvL0yqz+UhKy+z0q/hSKgbAn0Ewet0fi2POiP/V2syky8Fk4SUsvon74MvvuZyLVcXGRH+B2oHOqc8d7no9sjW06RGdHEvGDKGbsQGqhy7Rr6O4pO4sInwFavf8SOk2cki4chwNDYMB8b4P7OdVR/Y+ZqodwWMtaAoz1m5PV4p05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xY/CgMQuXzhiaFuq+fwr/VLnzDm7Zsx3SpFdyk+51tE=;
 b=X8NH8uYSlHVjbS2h3zVFdcMc81bRc69zC+6sjHse/PwPsllTkXcKFzr6TUGUyamcpuk7isRI8ENNZd1dqsdWJIzhDlvqVrL3QrFWIVqqc+We2SPrL5HJnnvw6SbAutNQxu7KXIEShvnuWgnFBiJ2jfdDCz6/G4wo8H79EBA7NA1qiBGIH3QIFK6Wlv+Bi1TGSXCmvktZ1C7e1mXDv5JUMh++hKv/vy9nPSjE8+8Nrkmc8A0i2+GrnIkNH430ZHvJfpH54uf10ZtTmRv1wjOtqCzitAqy0IWgw6jkQZI/qcJHd6aQmjjwPUgU9oMH+pdC1aXotFIfxsyyfwXMX44phg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 08:35:43 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 08:35:42 +0000
Message-ID: <12c36764-97a2-4cd2-830b-e2ba5bebef29@windriver.com>
Date: Mon, 19 Aug 2024 16:35:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] util-linux: Add 'no-libmount-mountfd'
 PACKAGECONFIG option
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
References: <20240816140422.1665537-1-niko.mauno@vaisala.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20240816140422.1665537-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0044.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::13)
 To PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: f59d9bd0-b567-48db-9bb8-08dcc029e989
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZkV0MTdKZGYydjlkSjg5R2k3SnA0ajJ0WXNsaGFkQUVDUGtOQU5GbXhTOHpH?=
 =?utf-8?B?dXZqUzNjNkhPRXVCTlVnYzhHRzNabHd0Z0lRd3dmT0pJMnZwWHZVMmNIcUo2?=
 =?utf-8?B?ZEFnQWVZOTlud09EQ0J3ZE9Ja1JOaXBWZ0p4UkhIenFIaGR4cDN2YW1ZdEFQ?=
 =?utf-8?B?SXFyUFV6VC9NenNMQnhWQlJ0TFRiaGNLbjhwZFhNZWljL2JIcU10M0x5UFdK?=
 =?utf-8?B?MnlUcWYrTWRCdHVVTnQvMHZVbS80WnBxZEtjMi9ybTkybThxbmZuRUpBYUFl?=
 =?utf-8?B?TVprOGowRjFqNXZGQmIzbWE1WnEvbG02SXhNSXdMc09CTjdHdDZHK25ySHoz?=
 =?utf-8?B?akVNQnhXUnpOaFRjVi9kdFRidjdkNkJVYjVqL0N0cVdIY1ZKMlBlQXlCMDZ0?=
 =?utf-8?B?dHRjeFFGVFo2YWMyc3cyUnJmRWE1UjltNDlMbUw4eUwrTVVUdUNEQTRYVkVT?=
 =?utf-8?B?d1oyNUwzRk92RUE0WjREaWpYSW1LTEtJb0ViNi8xemNqZFJuTHdpdWJNOCtt?=
 =?utf-8?B?UnlFcjVHcE9GRDNTNlBhY25DR2daSEliYy9sa1lFYThtb2toMU45MWZBcWht?=
 =?utf-8?B?RWtJRkhHOFhlcHhBYy9zRnZsVHpHZW9NaWdkaXlXVlk2Q0RUUUpZYkkzQkky?=
 =?utf-8?B?VnhVMWdBbzRLeGZ0MUNjenVsTzFobkRMK2w0dzdteU1pTW9sR0hSU1o5NG4r?=
 =?utf-8?B?QktLTVA1bW5tQUVsK0hZMGdjRWFucWlxVXkvVzlXckY0a0poTXVBQkVRc0w3?=
 =?utf-8?B?YkZPUjR6WW5XMDU2ejZkU1I4MXpQdjFmVDRaL3YzdTNWaGg1UmpSbTkxYkQv?=
 =?utf-8?B?eWxZNUlYejBBMUY3cEhBYlI0SlBDNmpwU3lPWStoVXh1cVZEdUxvZ1NqYnV4?=
 =?utf-8?B?YVptTHJJNGxMaGVzSml4WldodDVFZ1M3ZEszUC84aHoyb3ppektXYnFQQTIz?=
 =?utf-8?B?bHJqMm9EUGNRZmg1UnlCUU1BQlY0WGg1VWQ3QjRtM05ybmdIemNldEV2QVpU?=
 =?utf-8?B?UTM5OXdIakN1Y2ZxVnY1MDFtd0M0c1R1Vi9HRWpNUndKeXFFNzhldWVlYlRV?=
 =?utf-8?B?aklmS1pXcWJTKzdoaEx5bFFzaE9ZRjIyK0M3UmU0NGVKbjdCS05tVjRBM2ly?=
 =?utf-8?B?ejc3UGg3aGxVMmRlQ0cxOEFWVHlhSWFCMlBBYUlyem9FNXRGaG5PamJmdys4?=
 =?utf-8?B?K0lCNmlDMWlCK09ZUzVZSTZ6S1lvdkpYd2FtMmc1dGRaSmM1Y0VRNmhncm9a?=
 =?utf-8?B?bjloaHArL0NCMVVDd1JCREpVMnQ3L1UrRlNWUkJ5OEk1S04rUndBN3V2Y3Nl?=
 =?utf-8?B?TTVsNURHMnlreHRYdGJ0TnRST0N2dTA1bno0a3Zva1U2VmRFb0lTLzNxOHRa?=
 =?utf-8?B?blNtbTVOdUdtSmtZR2thb3VKc29HZjBHNTArVlpqRGNHQm1vMjNOanovZzB4?=
 =?utf-8?B?T3c3emNFTFJCbTl0VlN2UEZqZC92NFAwdnJjNTV1Y0h2YWhuamU3SXFobzBM?=
 =?utf-8?B?eEsvNFFEeUFoYjE0RHlOeXRHOWJOUjJ6V3B5MEdySkQyc1k3dWpnZVRIem9i?=
 =?utf-8?B?b2VsM1RqajNCRmZDLzRUTkVPS051dkIrVG05aExzWUlQaitzVndjcVpQT1dn?=
 =?utf-8?B?UkJsNUoxemNLM0QzaytTN0VmS293Q0trbm14ZHBsTTlJRnlZVDFkMkVvYmVZ?=
 =?utf-8?B?ZmJwalA3elpieUxJZkJKeTdlVmEwR2RuRGRycFQybUZ5VlBZZHdMdWFKbXFN?=
 =?utf-8?Q?W7vZPP413N7wY2qaGg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aTJ2VDdkck5oWUZGVHZGK05wczVLRk9MT3BMelRsUlNjRVdaWnJ4cWhjeHoy?=
 =?utf-8?B?bThVSUh0d2RMR3JEOUhFVVo1YUllVHBXTFV0OVQwaUw3dlRtTUZRcWUrR2t0?=
 =?utf-8?B?MWhiZHd3N3JRWXozQlNKWXlLRExON3V6ZkhGZ3NOOFJFSng2S1JSMmpDdmhw?=
 =?utf-8?B?dUdpR3A2VmltbWFjWnhIVDcvc3pWOVFwWUR2YUJ3ZC8zNEh2UkZBWG1vaXFL?=
 =?utf-8?B?RUdrOGpsUWhoM1N6ODRyU29MbVpQbHpNK1hNZGlBMjEzazhwNXZ6bXdYQ2E2?=
 =?utf-8?B?VnkrM1F1OXE4UmtzTjRxWmlncVZxOWVIbDdWZHp6L0VHWmJBMW44M0xJUU45?=
 =?utf-8?B?MUM1cHVMcWUyYkVjR2pBYS96b3dBVGRUTTY0TTFoc0JZVzJJY3l1a1BRMURH?=
 =?utf-8?B?VTFwMWsyUHdKcm9qUDE0ZmpUdlp5akVMbDZ3aVZVTmFUcW8rOHhXb1Z6ckMw?=
 =?utf-8?B?bGhubVdrOU5aL1VVK1ltT1JVcEhQS1MyZXZEZVVHY3MrdU5EdzlPQ1hSVVYx?=
 =?utf-8?B?SHc4ZEZLY1ZqV1VOM0ptMnozS3l2S2JtVno4WHNuWGV6OTcrQ3FLeVVuM1ov?=
 =?utf-8?B?b1dtbDVTVVhrTW1IZGtiQnBKSXAwajhCVXlkK0JRWXphYy9sRG4rclNjaTNV?=
 =?utf-8?B?NUZWTkdycEdhZmI2OVV3ZEVFa0N0N2k0ejBXbmd5RG5OSGlkeUFFY3hObHRQ?=
 =?utf-8?B?Nko1eUFieEdQZWRYNUFsUHVocm82MGxlZ1U0c2tmWkV6WUlFRVQrNGgrWk5p?=
 =?utf-8?B?YXpiU0VRVVo1d1J3d0tVWUNDM1FqM0s0ZzlldkZhamxiMGJmTlNqdlkxekNz?=
 =?utf-8?B?T010VjduUHVHSTQxVFVXV1d4Z2o5aXpXREh5Q0ZkZVQvODNRS2FDK3k3TDZK?=
 =?utf-8?B?UTFNc2ZVZ2VVNlV4VExjYnJsZU9TMUNud2l4UGFGVW5QbThRdHBDWm9ZZkF1?=
 =?utf-8?B?bEZER2laUEFSV0dXTTV2Um9RVE5qb3l3NzlMa09XQnN0WGNBZEZVNGdISDlh?=
 =?utf-8?B?S1c4a2k1N0JMZzFtQ29DcEg3cUtBWDJYek14Mm1DMzUvWERZeVJaRjlTc09k?=
 =?utf-8?B?STRVdklCcjBwWnZnekhCZ1BMdWtqemdmVEV0cWRPUU9qVUFaSDlKNy9wUS83?=
 =?utf-8?B?YnVlZnI2Nm5EZzlDR3lmT25FMVpvQUVmOHk5aE51SVowbDZYRHhGcDh6Q3VD?=
 =?utf-8?B?SlFyRDR2K0hCbTN0U3FUZHlXUTltSG5nRktoWi96Nkh6dno5YzVzUTVCWWZU?=
 =?utf-8?B?TDZrZEhleUJRV2F4aDdtZHMxSzU0Um50cUZrSTkzSUhPcVc0ckQwcjgzLyt6?=
 =?utf-8?B?b1VUa1V3aFoxc1UvRjlDQUNJU1Z1UUwyKzUvTENyUUJ0R1lXeDROUndiU2ZZ?=
 =?utf-8?B?dzhBbklNTEpQRDVFTnhRc25nakpLbUp2WEsvRjJwcUFBM3ZtTUxkbWdRVzl4?=
 =?utf-8?B?QlpwRDczbkFKSFNLZ1ppdFk3dlRBblNUemoyc05MV2I4aDhteVd2dGlVb2lk?=
 =?utf-8?B?YUJoQnN3OXZOcGxJSklwSXEwS0dhSnpSa3BIZHpiMkRReTdqeUVsbUFhdFRv?=
 =?utf-8?B?WGhBVmlNb0s0WDEvbFFseTArNHdlRWxlTVFhMFM3S2tDUXdhT1BVK0Vtb1lC?=
 =?utf-8?B?VGNPQTd4Um83V1ZQa1NtOUN1Y3RLdUxOcHcxV09Hb1paMk5nTnNlaERxcWVO?=
 =?utf-8?B?TWt1TGNoVjVHTUN1QzlzdjR1cmRUdnBjUEVPTjJ1UzlISkZlNUVZQjBiZXpF?=
 =?utf-8?B?QXVLNk53a2MvTG5NZ0dvdzd6MU5SNzJIQWFTY0RiWS8xYTliUDI3VzM2dlpl?=
 =?utf-8?B?SHRjOUpiV2hDWFllUFZaZWRBanFYRFR3NEZQTUlvV3dpVFVtRDF2REZvQUNS?=
 =?utf-8?B?VzR5NGtpRlk2Qks1ZTkwWjNuNkQ2bTZpTUw3RmVDdGlHb2hKNnFrODdwd3pT?=
 =?utf-8?B?eGdETkEyTHlvZ1dpaDhiSHloR0lZZGIvNUdLSTJqTXpHN0h3Zm1jckh4RDBa?=
 =?utf-8?B?TDg3eEw3V1ZZbS9wc2lsK3p2R0EraGxPbG9sRldZbGZUYVd1dWxZbjIvQml0?=
 =?utf-8?B?Ny9EQkxLRytML1lydTZaSGFOT2MvbjhkUG5XemNwWk80SDZscWtKbjhVVDNT?=
 =?utf-8?Q?gNUNwEEYc/AeAMrJL1VloXBnR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59d9bd0-b567-48db-9bb8-08dcc029e989
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 08:35:42.6976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwIn0cyqCkp0Ov+ba5GSOevKKqi7l4MNE1qUeXE3V0weZlTfO01DHaPYoLi9LSr5HnmXNaTo31i3o4RmqUeRCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
X-Proofpoint-ORIG-GUID: UlKA0dVrKeQ48kbUvxtCurD3UdBecYid
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c303e4 cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=e5mUnYsNAAAA:8 a=eWRtdWc1AAAA:8 a=t7CeM3EgAAAA:8 a=bvU0vdkTIzPTqngkz7IA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Vxmtnl_E_bksehYqCbjh:22 a=fQEa9puXOWAy-YWvlEz7:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: j1E3duLQDhlTuSmT_2B16-zci4wAHxyq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_05,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408190062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203489

I'm a little concerned about this patch because PACKAGECONFIG like this 
is likely to sit there forever.
The master branch's kernel version is at least 6.6. So this patch does 
not have any effect for master branch, right? If this PACKAGECONFIG is 
added, when should we remove it?
Also, if the automatic detection codes determine util-linux could build 
with mountfd support, but it fails at runtime, then it sounds like 
something to fix for the auto detection codes in 
configure.ac/meson.build. So if we really want to improve something, 
maybe we should work with the util-linux community to add more checks 
about mountfd. Maybe start by filing an issue for util-linux?

Regards,
Qi


On 8/16/24 22:04, Niko Mauno via lists.openembedded.org wrote:
> The 2.39 version of util-linux took new file descriptors based mount
> kernel API into use. In relation to this change, the upstream release
> notes in
> https://github.com/util-linux/util-linux/blob/v2.39/Documentation/releases/v2.39-ReleaseNotes#L14-L21
> mention that
>
>    This change is very aggressive to libmount code, but hopefully, it does not introduce regressions in traditional mount(8) behavior.
>
> While testing with a board using a 6.1 version kernel, an initramfs
> rootfs based boot flow contains the error
>
>    [FAILED] Failed to start Remount Root and Kernel File Systems.
>    See 'systemctl status systemd-remount-fs.service' for details.
>
> on closer inspection:
>
>    demoboard ~ # systemctl status -l systemd-remount-fs.service
>    x systemd-remount-fs.service - Remount Root and Kernel File Systems
>         Loaded: loaded (/usr/lib/systemd/system/systemd-remount-fs.service; enabled-runtime; preset: disabled)
>         Active: failed (Result: exit-code) since Wed 2024-08-14 14:53:48 UTC; 1min 22s ago
>           Docs: man:systemd-remount-fs.service(8)
>                 https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>        Process: 76 ExecStart=/usr/lib/systemd/systemd-remount-fs (code=exited, status=1/FAILURE)
>       Main PID: 76 (code=exited, status=1/FAILURE)
>
>    Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bin/mount for / exited with exit status 32.
>    Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: /: mount point not mounted or bad option.
>    Aug 14 14:53:48 demoboard systemd-remount-fs[81]:        dmesg(1) may have more information after failed mount system call.
>    Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Main process exited, code=exited, status=1/FAILURE
>    Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Failed with result 'exit-code'.
>    Aug 14 14:53:48 demoboard systemd[1]: Failed to start Remount Root and Kernel File Systems.
>
> also consequentially, 'systemctl status' reported:
>
>    State: degraded
>
> When issuing 'strace -ff mount -o remount /' the failure occurs at
>
>    mount_setattr(3, "", AT_EMPTY_PATH, {attr_set=MOUNT_ATTR_RDONLY|MOUNT_ATTR_NOATIME|MOUNT_ATTR_NODIRATIME, attr_clr=MOUNT_ATTR_NOSUID|MOUNT_ATTR_NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATTR_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_ATTR_NOSYMFOLLOW|0x40, propagation=0 /* MS_??? */, userns_fd=0}, 32) = -1 EINVAL (Invalid argument)
>
> however the failure didn't occur when using qemuarm64 with 6.6 version
> kernel to boot a corresponding initramfs image, in that case the exact
> same call under strace returned 0.
>
> Taking the above findings into consideration, add a new PACKAGECONFIG
> option which allows to conveniently opt-out from prematurely using a
> feature which can cause issues with a bit older kernels.
>
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>   meta/recipes-core/util-linux/util-linux_2.40.1.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.40.1.bb b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> index a1aab94055..3ecc55f61e 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.40.1.bb
> @@ -107,6 +107,7 @@ PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
>   PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
>   PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
>   PACKAGECONFIG[lastlog2] = "--enable-liblastlog2,--disable-liblastlog2,sqlite3"
> +PACKAGECONFIG[no-libmount-mountfd] = "--disable-libmount-mountfd-support"
>   
>   EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203466): https://lists.openembedded.org/g/openembedded-core/message/203466
> Mute This Topic: https://lists.openembedded.org/mt/107932364/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


