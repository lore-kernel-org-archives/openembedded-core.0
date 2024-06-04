Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2419C25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 08:35:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16680.1717490117648466683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 01:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6885cf17ae=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4546g3AC009185
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Jun 2024 08:35:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7tp81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:35:16 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4548ZGG0006757
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Jun 2024 08:35:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7tp7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 08:35:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+4Q0RQszUAYnJH4hAPLMuQqLZZ2TaTMmEoUvEuzFAafTUwg5MsSMJS6/OoS0pb2+lVe749wWGoQGNNPkla47R/1EUbAgPQ/bAnEKkC/JhtnO2KNJUryfWY2KfLG4f6IbD8RUNZBBHQCbvjeeN/AF0yyUTz/H6YHOd0adBeBAXXhwlc7a1QqZYQzUrOaGjo5UeyIQf0ZCbUUqvdBTxrYzUGR2vC6xciBpl8vuCAle34jouRp1R6mbk1EwDi7GK7rgK6DAl/vtY7E6k4z8UUELKjwywQ1kdTPvvKzTiaWGRZfbN0WWfJwaNdc7/ahkiWFx/GOpgHxIgziL5Zb0OSAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DAlWarbp3c860fxYNNGVSagLO3OJULxaPk7+FjUMa34=;
 b=JVmAKTmmRV4aXz5wtx1II4wBXscxUMhIXCOoZg3069Rc26lAeWSdYddJjax/SHExErpXDs8dPLkJZjTx9n4CqDleM6NsvMptcw45lH4nFaXG8grSSFQwSArVVrljhxCaGIjT5cAxHAT3fsRu1/bCXumOdWVJx2clQ1Ih0z4J50sPTFIxquen9+aEEBdYvbvJvvT2uUhoY0mFhsViNIygvlHnjL8oGj3Mlr7hmsQ4VkPLNAxoNT5JwubSWt8cZzBEDu9q1wwsZIhfMxTav7LMFTxJrXtTUEirpxnV5LF1L2Lh1niz3RHQutfM0ZkqSOqfwqh6QVyBUszuvcHvPqjp0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH7PR11MB6700.namprd11.prod.outlook.com (2603:10b6:510:1ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Tue, 4 Jun
 2024 08:35:12 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7633.018; Tue, 4 Jun 2024
 08:35:12 +0000
Content-Type: multipart/alternative;
 boundary="------------hS20NV5LBE2dd7edtCzvcTge"
Message-ID: <66bdf738-2a6b-4072-98ed-795ba47494f0@windriver.com>
Date: Tue, 4 Jun 2024 16:35:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] man-pages: upgrade 6.06 -> 6.8
To: openembedded-core@lists.openembedded.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240527013705.2781009-1-changqing.li@windriver.com>
 <20240527013705.2781009-4-changqing.li@windriver.com>
 <2024060209512044239c59@mail.local>
 <17D5585831D86063.21428@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17D5585831D86063.21428@lists.openembedded.org>
X-ClientProxiedBy: SG2P153CA0008.APCP153.PROD.OUTLOOK.COM (2603:1096::18) To
 DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH7PR11MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: b926ec63-7cea-4937-bb43-08dc84713fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ejZYcE1iWEdwZVU0ZUJBZk9GL3BZRVl5TnpIMitwTVpHeHN2WmxrL0RMVXVJ?=
 =?utf-8?B?ekwzZ25vOXIyc0FQSlBrWSt5dUJCTFA1Rnhmd2NEV2EzN0RuWHpIWlB6MHZL?=
 =?utf-8?B?SDNieFBiVDhvUTZjK0xXMzVHdFhGVDBDUzFFU05yTDROcll0TUdGL0JZK1J4?=
 =?utf-8?B?bEVhVVYzVzh6SmFsN3l0YmdxZ1FUcWRqd3FhTDdXRmhPcHR2NHdpUlJWUlNK?=
 =?utf-8?B?NWZ3TkdxUkowMVhHall5VDZmMG40UFB6R0xsNmtlM3QvZjU0WVorUjI5SDhD?=
 =?utf-8?B?TE5nTmgyeXAyV0M0OE5PczVaUFY5YWFwY3dBZ0ZUTGFhQUtaNCtCMXdXKzY2?=
 =?utf-8?B?dmttblFQaGRPTytYdHM2eXpFajBpQm9jTXRGNHhCLzFhUnpZeXdlcW1Zc3hw?=
 =?utf-8?B?bnJGU09zdHFFSTdBcFFJaTd0c2tUbHRIZGx1TkFSdGd0UFp6eGx1M1J1OC8r?=
 =?utf-8?B?WUlUZXNTeGJtNVB0dVRHcWUrY08wb0pCajE0Zk52MUt4ZGZYRWRBM0trMnpj?=
 =?utf-8?B?alQ5OUpmaHJkMWRGOTB3dUtnZ1RwTWFkOVJFbUFzT0tpblJLcW5pV3lsUjdM?=
 =?utf-8?B?K2pWQXhGVERqU3ZaN05XMGpBWEV4L3dNQS93aVEwRW5TSXV6Wm1TaWV0V01J?=
 =?utf-8?B?YnZUWjZGcXM0Tm81R1RIeXFMZkRTN0N5cXgwSm1lSlJGZ0JMZTcvZmx4Y2N6?=
 =?utf-8?B?ekFzZG1mQU5VTGwyTFh0bC90eGZrcE5sb3ZPTW5ja0NHaFdJTno0Yjlwd0Z3?=
 =?utf-8?B?ZmYvb1BRSkxiNmdtZGxiaG9QMFNSc2krYnMwL2k2WlpaWXlUTWFDVDlYd3Y3?=
 =?utf-8?B?Z2gyVVN3ZUpQb014RkVFRnRtY1JlTmhFTGtzRmpWTU9UUDdmK24rc01lN3B6?=
 =?utf-8?B?dmVkUXJkQ1ZsZXhjZ1FHV1dBTWorY0dYaDc5TXpnWUcyWlJWMzB6eEN6TVpp?=
 =?utf-8?B?TEtXVzRCQzlUZExHd0lZVmNHTzd4RVFNbjZYYkZyaVM0Zm5KM1dGU203UVNx?=
 =?utf-8?B?VnJacEt4TXowYkoyd0xZTWJlblIwU210a0tmZVN5TVVCWTYzd2syZ2srTDJZ?=
 =?utf-8?B?TEpzU3l3c3lrOG82akExZzlWMXZaWVlxSmplTm1na1dzeGMyMEN3U28xTVdM?=
 =?utf-8?B?cXp0aW9vNkFQaFpYMFMxNFJacWg0QUR2RllPN0J1aGpMdkdGbG5tNWFWKzB3?=
 =?utf-8?B?SjB5cy9WRWg0eHkwdDNMSHJrRlhVVDliZHd0Nmdla1gxM1N1VCtJUy9RWkhR?=
 =?utf-8?B?aWt4cGJOYUU2VFZGWW5kcVpyVHJtcVhqUFVSV2VUbHhEb3ArN3NhQURmQ1h6?=
 =?utf-8?B?aFg4RW4rU29WbU5JTDU4aGtaYmgxTEV0VjU3WlFrTnFkY1ZXQXFmeEJJQXRv?=
 =?utf-8?B?K1FiUVpuTjdSMFQyUzZ1c0RtcXhzQ24reEVZRGtFdExCUW5FcXFmOHp0WFZt?=
 =?utf-8?B?c3dVVEtaMThPbkszbloveFV5dzB5Y054ZXhBQzFEMi85ekdSaXdEZ3kxcS9u?=
 =?utf-8?B?U0wrU04yYkkyL2l1cEZPZDlJZ09xQk1XOE1malpLQmpyd200eFNkZlc3M0dk?=
 =?utf-8?B?cnZZRVYrbTZFU21sNkgzYnFBMlFYN3VYVmdDSFdKUGZjNHhUUGlmVDNaWkRh?=
 =?utf-8?Q?OyVbxXm9vxLbnAEAPs8AcCOaFh0LxN2eJytl3vpgFMkQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?R2VVWVE5dGJWWU93alJqVVNLUnNmWVo0Z0kzMklyYzlOK0plSUZsOUJ4cXpD?=
 =?utf-8?B?R0tVMmZxeTN5TUhNc21SQnQwM1VsTmNhbXVCc0gyTGp2ZVZuV21MS2JwQ2pJ?=
 =?utf-8?B?Nm5EcTRoSE9QZUJET1VJWHJobi9JcXoyajJ5VGg2NHhMN3lsbVl3MUNRREZL?=
 =?utf-8?B?bEZXL2hKYU5yb0ZoeVh5cG5uNG0xVkZIQ0RTN2RzTWViRVFSQ1dtVUdQMFg2?=
 =?utf-8?B?bVdQWHZOWGRKejJnSDhkcHdVSGdqTzA4eGhwWDZyUHFVQWp6ZHIxSWlJR2Ny?=
 =?utf-8?B?MVdqQUNPNEdrcXhlYVZUV0JKT2lKK3Vpd1Nmc1JOZGZVLzhhTHcyM3I4ajNz?=
 =?utf-8?B?ZkpURjNZLzYyWHZDaG1hZ2dUMWt5VkV4VStnajRVdDIyb1IvbzdHaWhtZDBj?=
 =?utf-8?B?WFJwZHdtSUxRazhSaGRnVHRWdU5PbnNpOGc0Yit2c0ZiTU9mNnJUV09RTFds?=
 =?utf-8?B?bktBMHBsR3FTUThiSDd0ckxFOWN6QjRtdzNBS0IvdnArKzBqTjdGbUFkUnhK?=
 =?utf-8?B?VUpNSEE3SnZjMjNTWTgvbmM4d3R4eTQvaHpzQkFiTE9ybk5uU28rUWJmMVBm?=
 =?utf-8?B?ZlR6RUJoZW9iS0ZBUkE1WHRJTkc2QUEvaEVmMmZLMTVsUHRsamF6TnVIZVE4?=
 =?utf-8?B?bDlINzBXMW5pdUVmZTN6ZlR4aWRTRTRoMVdCMldOVUsydGFKWXA1S2gxVnRC?=
 =?utf-8?B?cSthUkpTRmlBRjNCUDBNbGtBWlFaRjZhT1FYOTJBSkhhYm42UHQ5WFRZT1Az?=
 =?utf-8?B?S01aMmVlSG96WWsvREJWVkx6b3Y4a3VXZ2JpREZLcEc2MnpHOVJPY2p2Ky83?=
 =?utf-8?B?Ym8zN1p6N3IwQXVpbUdZd1ZFZVh2Zm43K2tHVjRLNkJ6empTZUpQVU5kMkNo?=
 =?utf-8?B?UUpveURHUEJTUUs5TlJuN3pKMDhldlFYMXM5dHh3MXlqbm52MWQ5cHBIdlRa?=
 =?utf-8?B?dG1LSXFkc2IrdllETm0zNWhrSkNuY1BPZTMwRERHM1E3YjlMMU82azVSbzd6?=
 =?utf-8?B?T0xaOXVyMURlZXBtZnRuSTVwWW5jc3pCNW5NSi9xZmRkM0VPNE9OMEt3Q1BT?=
 =?utf-8?B?bDBNc0pHT2JTSWk3RXp4dkRNdS9KZHlMQU5TdXN1Nkh1aUdMK1hTcWJuYnRI?=
 =?utf-8?B?Q24rb0JXS1ZXL0ptWWl4V3Voc0g1a2FXcWkrSFU0amxDblJaSlRBTkt1dDJG?=
 =?utf-8?B?cFdXQXF2MklJbUdsaE1FSEZKUGd0R3RRdjNJYkVvbXhpeXpINW1SdkRnajVq?=
 =?utf-8?B?c0paZTJ1SGZvOFpwc21sKzR0TVRJS2xTa2E3ZDRtaExiZ3grSXRGbTBQUDRT?=
 =?utf-8?B?YmtkY01Wajh5WDlTWXdMNVFJODZOSXRURktKdnI1QUZxUUhoWDJOMnpFQXZK?=
 =?utf-8?B?ck1PZjBjRGJiT2h6Z0xMalBmdEhuY29VZTVRdVE5UzVtZHdKeUFJMkNocW15?=
 =?utf-8?B?K2NlKzlpZ0pkWkU3eFR2TWpyWkx4ZjB0Wm1JVGJzc2lJeVBFUEpnNTdrMldB?=
 =?utf-8?B?aDk1ZFNUTkNTM2dYOWxRTG9LVVpUNlpiQ1dIanBnc3BhcWs4YmNCQTRMeUNM?=
 =?utf-8?B?Z3NhN0VlNmpQSWNxR2pLV21PcFRyMWMzQUt6Q3Fqb25IRis2MjRzRzA0MFE5?=
 =?utf-8?B?RklLUEZhL09VYUpIU05wSzRqYU9IVFpPTU1Ha0VMbm9QRDlhTzFOSDgyVG9p?=
 =?utf-8?B?K0tpRkpzaHNxTDF6dEdaSzMxNDdPZktZWWRRa2lRVXZ3YWxyRkxhSlB4Zkxa?=
 =?utf-8?B?YzU1bUN3NlpRNmVzYjUzRnJJeGZ5M1N0UllyNk9RdnMrTXl6UkhUbnMvZ3RH?=
 =?utf-8?B?N1JuaDlqT3NJRGNtZlBoZFJkd0VwUDRzd0RndXUwVVFHang4Q050b1liSGpS?=
 =?utf-8?B?bU1CRzdwRnk3S3JVZWoybXZiaE1MOFNubnF2ak1kWndsMWx6dFdmcEJSZzRL?=
 =?utf-8?B?b2huVW5CMDhmSzZjd0dUWUh2OWVCSTF2WDZCOXJscDcreTBUNWJLbWRVM2dw?=
 =?utf-8?B?bkxhdThtdm53Q3pUaGhrVU00eUczNmpUZDg1YmpUVWpjcndVK1dWU09BV2J6?=
 =?utf-8?B?SXFWc2hpbk1TV2JKVWJ4SElNdkNnM1gwWkZwTlY4YWZCVU5zY1pmckREQ242?=
 =?utf-8?B?TkVteFl0SUs3bVJMdHltRXFpS2M5eXNaUXgxd3NSc2o5eC9kR2w5b0J3RHMr?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b926ec63-7cea-4937-bb43-08dc84713fd5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 08:35:12.0313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aUbF4aXvso+HMFem0jmxbqW3DQSoZPp+K24tXIUt5WygMw0Ln8HafbBfn/UNMkAcCWiH1TjvLm0xOgrSGlGI4V7KwjdHtBfO13WejtQUhIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6700
X-Proofpoint-GUID: 1bv76mLCYpi31Haos7ogJNECiiUOFqj2
X-Proofpoint-ORIG-GUID: 470ccdtEYpcWnPDx5DZATlukPwM6uX1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_03,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406040069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 08:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200313

--------------hS20NV5LBE2dd7edtCzvcTge
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4546g3AC009185


On 6/3/24 08:52, Changqing Li wrote:
>
>
> On 6/2/24 17:51, Alexandre Belloni via lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_=
0Sae7m8nFzKjddLq9mWjQwfOHCdBr5w1Q$>=20
> wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
>>
>> On 27/05/2024 09:37:05+0800, Changqing Li wrote:
>>> diff --git a/meta/recipes-extended/man-pages/man-pages_6.06.bb  <http=
s://urldefense.com/v3/__http://man-pages_6.06.bb__;!!AjveYdw8EvQ!YpM6rnmm=
Gg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKj=
ddLq9mWjQwfOHAM4T2W4w$>  b/meta/recipes-extended/man-pages/man-pages_6.8.=
bb  <https://urldefense.com/v3/__http://man-pages_6.8.bb__;!!AjveYdw8EvQ!=
YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae=
7m8nFzKjddLq9mWjQwfOHBMG5wnsw$>
>>> similarity index 84%
>>> rename from meta/recipes-extended/man-pages/man-pages_6.06.bb  <https=
://urldefense.com/v3/__http://man-pages_6.06.bb__;!!AjveYdw8EvQ!YpM6rnmmG=
g65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjd=
dLq9mWjQwfOHAM4T2W4w$>
>>> rename to meta/recipes-extended/man-pages/man-pages_6.8.bb  <https://=
urldefense.com/v3/__http://man-pages_6.8.bb__;!!AjveYdw8EvQ!YpM6rnmmGg65J=
Y6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9=
mWjQwfOHBMG5wnsw$>
>>> index 0f091bbd7d..fd19fa3b97 100644
>>> --- a/meta/recipes-extended/man-pages/man-pages_6.06.bb  <https://url=
defense.com/v3/__http://man-pages_6.06.bb__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6=
sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mW=
jQwfOHAM4T2W4w$>
>>> +++ b/meta/recipes-extended/man-pages/man-pages_6.8.bb  <https://urld=
efense.com/v3/__http://man-pages_6.8.bb__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6sf=
Vj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mWjQ=
wfOHBMG5wnsw$>
>>> @@ -17,18 +17,12 @@ LIC_FILES_CHKSUM =3D"file://README;md5=3D72cff06b=
7954222c24d38bc2c41b234e \=20
>>> file://LICENSES/Linux-man-pages-copyleft-var.txt;md5=3Dd33708712c5918=
521f47f23b0c4e0d20=20
>>> \ file://LICENSES/MIT.txt;md5=3D7dda4e90ded66ab88b86f76169f28663 \ "
>>> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
>>> -file://0001-man.ml-do-not-use-dev-stdin.patch  \
>>> -file://0001-GNUmakefile-use-env-from-PATH.patch  \
>>> -           "
>>> +SRC_URI =3D "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
>>>
>>> -SRC_URI[sha256sum] =3D "006906e7be81a71c2d347809597bcb91485fa7fa488a=
cdaa79e681ddfa894568"
>>> +SRC_URI[sha256sum] =3D "f4d5b9756b4ee52e34ca9d895095c92312ced6292395=
b811e11069ab007e6f06"
>>>
>>>   inherit manpages
>>>
>>> -# can be dropped when ubuntu 18.04 is not in use anymore
>>> -DEPENDS +=3D "coreutils-native"
>>> -
>> But we still have an ARM ubuntu 18.04 worker, will it still work?
>
> No,=C2=A0 ubuntu18.04 still needs patch=20
> 0001-GNUmakefile-use-env-from-PATH.patch. Should we keep this patch=20
> for not supported=C2=A0 host distro?
>
> I can send a V2=C2=A0 and add this patch back if we still need this.
>
> Regards
>
> Changqing
>
Hi,

Just find that 0001-GNUmakefile-use-env-from-PATH.patch is not needed=20
anymore, upstream have fix this issue. and V2 is send to update the=20
commit message.

>> --
>> Alexandre Belloni, co-owner and COO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200227):https://lists.openembedded.org/g/openembedd=
ed-core/message/200227
> Mute This Topic:https://lists.openembedded.org/mt/106323762/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------hS20NV5LBE2dd7edtCzvcTge
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/3/24 08:52, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17D5585831D86063.21428@lists.openembedded.org">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 6/2/24 17:51, Alexandre Belloni
        via <a href="https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mWjQwfOHCdBr5w1Q$" moz-do-not-send="true">lists.openembedded.org</a> wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:2024060209512044239c59@mail.local">
        <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 27/05/2024 09:37:05+0800, Changqing Li wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">diff --git a/meta/recipes-extended/man-pages/<a href="https://urldefense.com/v3/__http://man-pages_6.06.bb__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mWjQwfOHAM4T2W4w$" moz-do-not-send="true">man-pages_6.06.bb</a> b/meta/recipes-extended/man-pages/<a href="https://urldefense.com/v3/__http://man-pages_6.8.bb__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mWjQwfOHBMG5wnsw$" moz-do-not-send="true">man-pages_6.8.bb</a>
similarity index 84%
rename from meta/recipes-extended/man-pages/<a href="https://urldefense.com/v3/__http://man-pages_6.06.bb__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mWjQwfOHAM4T2W4w$" moz-do-not-send="true">man-pages_6.06.bb</a>
rename to meta/recipes-extended/man-pages/<a href="https://urldefense.com/v3/__http://man-pages_6.8.bb__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mWjQwfOHBMG5wnsw$" moz-do-not-send="true">man-pages_6.8.bb</a>
index 0f091bbd7d..fd19fa3b97 100644
--- a/meta/recipes-extended/man-pages/<a href="https://urldefense.com/v3/__http://man-pages_6.06.bb__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mWjQwfOHAM4T2W4w$" moz-do-not-send="true">man-pages_6.06.bb</a>
+++ b/meta/recipes-extended/man-pages/<a href="https://urldefense.com/v3/__http://man-pages_6.8.bb__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mWjQwfOHBMG5wnsw$" moz-do-not-send="true">man-pages_6.8.bb</a>
@@ -17,18 +17,12 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README;md5=72cff06b7954222c24d38bc2c41b234e\file://LICENSES/Linux-man-pages-copyleft-var.txt;md5=d33708712c5918521f47f23b0c4e0d20\file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663\" moz-do-not-send="true">&quot;file://README;md5=72cff06b7954222c24d38bc2c41b234e \
                     file://LICENSES/Linux-man-pages-copyleft-var.txt;md5=d33708712c5918521f47f23b0c4e0d20 \
                     file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663 \
                     &quot;</a>
-SRC_URI = &quot;${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz \
-           <a class="moz-txt-link-freetext" href="file://0001-man.ml-do-not-use-dev-stdin.patch" moz-do-not-send="true">file://0001-man.ml-do-not-use-dev-stdin.patch</a> \
-           <a class="moz-txt-link-freetext" href="file://0001-GNUmakefile-use-env-from-PATH.patch" moz-do-not-send="true">file://0001-GNUmakefile-use-env-from-PATH.patch</a> \
-           &quot;
+SRC_URI = &quot;${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz&quot;

-SRC_URI[sha256sum] = &quot;006906e7be81a71c2d347809597bcb91485fa7fa488acdaa79e681ddfa894568&quot;
+SRC_URI[sha256sum] = &quot;f4d5b9756b4ee52e34ca9d895095c92312ced6292395b811e11069ab007e6f06&quot;

 inherit manpages

-# can be dropped when ubuntu 18.04 is not in use anymore
-DEPENDS += &quot;coreutils-native&quot;
-
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">But we still have an ARM ubuntu 18.04 worker, will it still work?</pre>
      </blockquote>
      <p>No,&nbsp; ubuntu18.04 still needs patch&nbsp; <span style="white-space: pre-wrap">0001-GNUmakefile-use-env-from-PATH.patch</span>.&nbsp;
        Should we keep this patch for not supported&nbsp; host distro?</p>
      <p>I can send a V2&nbsp; and add this patch back if we still need this.</p>
      <p>Regards</p>
      <p>Changqing<br>
      </p>
    </blockquote>
    <p>Hi,&nbsp;</p>
    <p>Just find that <span style="white-space: pre-wrap">0001-GNUmakefile-use-env-from-PATH.patch is not needed anymore, upstream have fix this issue.  and V2 is send to update the commit message.</span></p>
    <blockquote type="cite" cite="mid:17D5585831D86063.21428@lists.openembedded.org">
      <p> </p>
      <blockquote type="cite" cite="mid:2024060209512044239c59@mail.local">
        <pre class="moz-quote-pre" wrap="">--
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://urldefense.com/v3/__https://bootlin.com__;!!AjveYdw8EvQ!YpM6rnmmGg65JY6sfVj_MxBUznl6qzyT3RdMMxR3XIrTOHzwo2745-xRd0GCTlYjdgB5_0Sae7m8nFzKjddLq9mWjQwfOHApGKe7Rg$" moz-do-not-send="true">https://bootlin.com</a>
</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
      </blockquote>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#200227): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/200227">https://lists.openembedded.org/g/openembedded-core/message/200227</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106323762/3616873">https://lists.openembedded.org/mt/106323762/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------hS20NV5LBE2dd7edtCzvcTge--

