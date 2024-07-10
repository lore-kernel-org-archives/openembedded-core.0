Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C1CC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 20:23:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5002.1720642988905589669
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 13:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7921f350e3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A59jUj020114
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 13:23:08 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4075eg3x5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 13:23:08 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46AKN7AP004394;
	Wed, 10 Jul 2024 13:23:07 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4075eg3x5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 13:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cc7BfXn2soUm7P5N8GgMziDq0LZBvfvxJMzqWY0g0ddm/jvSN7TDTEtn0EPmP+XqEX6UWxaFIUwsyRsQNohL6ZOvfXNDRUhC2+99qsy+yK8hVcPMgZcOmzGCamEpzsmeQZMf7STU2vjU2a/plaXiraHX9iRXdZWOjdywJn+EITP06GCDaVWR6XM54TqYdd5g4fNATCqteTcUPp09giRcCv2uBmccGsWezBdb3KdTHTjay55n3KpFg7VSxJou+ojoEUvh6zu8yZLZVoFBUkArS5AxExlabYNk56xjPIWTWsLRfpR8M9kjJwrD71j1beYkUZAZK1vw3OUhR77qYj3HuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/by1zNcI7Q+juKGsP1gWfOaNz19iLLZ7hYy4PKYslJo=;
 b=aSeHosppohcCGf5wyY9SzQz0SzZdx2D3DV05uPcYK1wv+EV3cQffGPxHUqtOhMQPIQJ65DseXsZtvcrK5lKffOo2gnN6QrKWm0CkT4S6btZiTfcLsEP4OCkZSj5g2IDTMPTz5JdVjU+TFCItG/WigtYsJ5V9TDRUmQu9BsMESY4VgXrCoFrqug4ScP1vHbYy0j4e3WNwc2Juld9KkOVglSgVnlgSHRjSJoPkox3YofLi3R//NDec1osjh/MJJlB3Pd3DO4y8AE/l2WVpMVhywI156XcCgsfaHo9Uay9ZQNhhu2ZB6I3RP+XjasPIRFDnXdJ6pZYE/cO1RLuwByqyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 20:23:03 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 20:23:03 +0000
Content-Type: multipart/alternative;
 boundary="------------2mW9XExG0AvETokz90JwzoQ4"
Message-ID: <a0c6bb34-71fc-4a8c-a203-53584263055b@windriver.com>
Date: Wed, 10 Jul 2024 16:23:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] llvm: Fix CVE-2024-0151
To: Steve Sakoman <steve@sakoman.com>
Cc: Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, Ross Burton <ross.burton@arm.com>,
        openembedded-core@lists.openembedded.org, Deepthi.Hemraj@windriver.com
References: <20240701123752.237702-1-Deepthi.Hemraj@windriver.com>
 <140fdc26-b2c7-41fc-a561-a96f04f7b77c@windriver.com>
 <CAOSpxdaDVmdomJM+u3fbxM-_U8Q9nHUzNor6JvUC8z+yaGOVOg@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAOSpxdaDVmdomJM+u3fbxM-_U8Q9nHUzNor6JvUC8z+yaGOVOg@mail.gmail.com>
X-ClientProxiedBy: YQBPR01CA0017.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::25)
 To CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DM4PR11MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: e70ff119-5582-4ed8-d4c0-08dca11e19db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d09rVzJlaDB5aGpNWm5QREkwaG44UHJYZSt3Y2tiSk52RGp5M0hHU1ZlVG8x?=
 =?utf-8?B?TTZyTEtSKzlTclM4U0xrRW0rWkpPTGhqZmVrV2NWWko1Z0k4Y0xQaDk1VEho?=
 =?utf-8?B?ejllWGk0NTJSaU5wNFBlVzh4SllhcFlIR3dRSFdiMldPS0l4YUtVOHBNT2FY?=
 =?utf-8?B?VDFaWWlLdXE3ZUpmWWNCbVFIMkhsNVM2RHZSenRxcVltSmUreG1abndsYTlo?=
 =?utf-8?B?OXo1RkZ1cE1ZaG1GR1dsSTIxV3JITlJzckY0Z0g4Qng0RFVBWTRRODQwQTA1?=
 =?utf-8?B?OUdta0JNTmE4TXFnQ2ZsK094WWQwdmRYbm9FcGRsUnRkZDFsOE5NQlBlVU56?=
 =?utf-8?B?L2M2eEJOSDlITVh2amxlaFNCSWlFNWhLNko5dkpSODRMcXJzOThaNG1lN1dR?=
 =?utf-8?B?MzI4d09MMHYxTzBLWVVsNy82MkpPNHE3a3RjQy9tZFlTbGsxOHN1TklwKy9S?=
 =?utf-8?B?MDRXOGJ5THdQTUJkTmE5dTlUZjRlMzcvUEZsWDlVVlBxN2pKMHJMOXZSTDNV?=
 =?utf-8?B?VDcrbVhYM0IrRUFWbVd2M0VpVWhHb3EwZ2xhT3Y2bEFsaytCMWVxcTgxSVVT?=
 =?utf-8?B?K283eVAzYWN0ZzI5RjhLZ1RJOWw1S1NoaFQxRllXKzhNMkxVR2cxZkFzelc3?=
 =?utf-8?B?ZXZQYnBpejFVL0dGdHN3N3ltNmFwdGVEOG1vS1FwNGhqeWp3RGdQZVVlVzVC?=
 =?utf-8?B?ck5KdXdSam80L0pZc2VuQ2J2VnJwVlB5VC9rclJabHdRaDBBRjBVcGtBSlN2?=
 =?utf-8?B?YkVYUEFLdEIzRnFsTnFVNTNJWXk5bWtLV0w2V2djK3FZclZkRkZKaEoxdDc1?=
 =?utf-8?B?SUVSUDRMUFh5bm11ZDIrOG1kSkFHeVQwNjVGRzdhMElESDM5emw3MEhxTGZR?=
 =?utf-8?B?RmtJT0ZYQnZRSEh5cnpqczhHUVMyY1dqVlMzZWxVc0prcHBGSjZnOEdnYUJ3?=
 =?utf-8?B?MGFaT2YvOVVxcG5RcHlYUGFYQ0k0T2k4ZUsrN2JCenRweEhvQVZDTkxFTDF3?=
 =?utf-8?B?ZnF6WFRLZ1FCRUo1YnVlN1BJRWdGUXZHWkd1Ny9nc1JpaVZRaEJISmFpTWhl?=
 =?utf-8?B?amdTUWc4a21WM1dOelBySGREcWRIV0ZQUEhDeWdjSjVjMlB4WXhPUWlvMEhY?=
 =?utf-8?B?V0h1U2Z1aHJUUzBONFEwcFUrenF0QzhhK0FlZmJ2WDRZLzYzaUhkT3dIM0NN?=
 =?utf-8?B?ZzhRUlFqcWNKNXlaVFdoaXRIMWl2UlZIMlMwTUQwa2wzOFZTaUZ5YzByN1Av?=
 =?utf-8?B?bFlYOGFWS1RFcmZyRlA1NS9TaVBCbjRMcFpUV3VUVzNVSmlsTXZWMEFqdTFO?=
 =?utf-8?B?TUxJbFB0bHJyR0hsazVEYzRrRjQ3aDBXbjBKQktRYjFYVGVJOVVmOWtSTDJJ?=
 =?utf-8?B?NENraWg3eExFdlphbVFaQ3diRkljeFF6YmZ5czRhbnIxcnpZdTVaTWtBclNP?=
 =?utf-8?B?bGNiR3RNQWRYS1pDRDdadlBpSjdBQ2pWdDEvNUlWY0t2aWxaVDlyZFJ2SkI1?=
 =?utf-8?B?QkM5dFVJM0xocXV3L1JSeWx3Y216TnNIT0N4N3Joc243Tno4OUN4MTBKa1NZ?=
 =?utf-8?B?bkt3QmdXVE01UytJRXZDNkxNbHhVR2tUY0RDTUh2RzRBRDJjcENqQjUwenNp?=
 =?utf-8?B?a2R5VVVzRlZKSi8vQUwwVUppZDI0QmJQSlplVXIySGsxZ2owRDhERmV0STZD?=
 =?utf-8?B?SWVVMldrdTY5dEVzM2F1MFd5Z0UveEVyMWlkZ29HQnNodFVXZzgrREJQYWRP?=
 =?utf-8?Q?XTif2PJNcKRUDXmQXoiuyt9qVjEsESJR/BT/mBQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUxOelhiUmFKUnJpeER2N1BrcWdJVWpua2NHSU5VeXFxZlFUdk5EMFAxSWtK?=
 =?utf-8?B?SU10VCtWQUo0MlQxSEFlK010c2pZUGV1VzREekszRFZudjlrUE43M2NucE1L?=
 =?utf-8?B?Y2VDSTFKV1VHTFBxNDBCdDlDblArRFVRaE9MUUx3NktyOS8xTklTVjJKeHdR?=
 =?utf-8?B?R0UwTjRHVnlRMWwyUWJXNklHcTNQZjFOZlpJNitZbUYwdHF0RDZacjlHbm9s?=
 =?utf-8?B?OU9TQVRlSHNtbUdseWE5bmEydHJUeVVPSC9iZzd2Q2lnOEw4V0JzY0J3NFBX?=
 =?utf-8?B?a1ZoK25GQ3AyZG1VdXArU2Y5dENNV2lwV0xtMmlWMXFLVk81RCtrV1ZkUllJ?=
 =?utf-8?B?TjhjQjFJSERjZlE4SFlXQ3hDbHIweGhiMktsSlkzaUhreC9veDErcmxrYSt0?=
 =?utf-8?B?dlNiaGg2ZHZ0cWRHWWNqaTdjUTVaSWYwdEdqSnprRVpNOVhFaVRkS1BINDRv?=
 =?utf-8?B?d3ZKWE5Yamg1TVNrZnY4dUVpMzY3cmVpVHZOekZsa2U5eWJ6YVlBUmFrcWI5?=
 =?utf-8?B?QWh6RlBCd2xXZktkVTFpK2ZrZWRrOWw2cDBlaVhXZE4xbWlGSnl0NVRDc0J6?=
 =?utf-8?B?ZlpWL2dTaUdzdkUvTTUxVmJGdnU3VkdDVE54SkpQd1NRWTdmTllZVGpkT3VR?=
 =?utf-8?B?dHFiYlNuOVhGeWxmS01kNjcvUG5td1podStzQVBnNy8wbmlnc1lIT2FRaXp0?=
 =?utf-8?B?Vi9uUmlvUWpmQzZiNk12RjgwbUtEZ1BxZ0lsQk5DQWVqdTNHR2VIZEIwakxU?=
 =?utf-8?B?QTNvMVNreWU5QWZlQVJzVGh6a0txZU9HVm8yVHdXS3VFRXN1cGlOQngycjI0?=
 =?utf-8?B?UkY5ek1idUN2WFI0Yml2ZWYyaWc1R1ozcHdTRVZxdjZ5RXNkMmwza3YxaVk5?=
 =?utf-8?B?d3NvTDNHQ3hwNkdHaVBOcmtZUjJYZTU2UlR0VGhSUE1NZEtlRURSbkUwdjg1?=
 =?utf-8?B?UTNFVnRBUU1nTWN1dEdQZ3BaVlVSUzFhbkxZRU9jSUxLVjNsTGtUNnNTcEZ6?=
 =?utf-8?B?d213QnZvNUpOOUxnZVhDbFlDenN5cThlM0gyMkVWRkg4ZWUvTkdldnpFNDRu?=
 =?utf-8?B?WmU4QU5vR0hVTzdqaW5XV2pwTXdlVWVFb3Q5amd6Y2k2blFTdGlBeVZaaHdZ?=
 =?utf-8?B?MUNtMkduSTRrNkx3QmxCRFF1UHFyWHR3ZDhJTzFKa05lclpNZ3Ayb2RHM3JM?=
 =?utf-8?B?eW1IZjdOVy9ScG51aHFYK2wzOGFIOEMvZXAyVS9iY0hIdkI2WXA3RTdkZVRm?=
 =?utf-8?B?LytaWHE3ZVRzbW8zOFk0RThLRjRyYVRwYmwzczZNRG1hM21yODZBR2xIV21q?=
 =?utf-8?B?MVg1NGJFOENqc1IvU3NweWw0eGJmNk5HR0NqRlpOaXd3bTQyR3B0V1dUT2hB?=
 =?utf-8?B?ZHFpdHNxV3JMYkQwWWYwVG9YdWNlcHliOTNMSGVHN2gwWlB2UHlpY1QzTEc2?=
 =?utf-8?B?V2JTYVFtTkpnVWEwaTJ1bndOeExQZ3JHSFRpSGY4TmhyMnEwUVA4M0RIM2Ja?=
 =?utf-8?B?SlVpQUdTRVpZZzhlQVBtdnFzUE5LUjJPS3YyN2llV0MwTllJMG9iWUZoY3Mr?=
 =?utf-8?B?TS83dFVzS2FsVVdadkF6WnVvMFpnVk1GR1VMcEkwNEhNVXRxTkVicVlFcjVX?=
 =?utf-8?B?bndZMklialVjSGlFR1FHemtsUFc3U3pEWDNPTGNobWZUQmNueXdTZEhiWElw?=
 =?utf-8?B?ZjJIZHB2S2Z4b1RGTUlRZG9RcksxNDhTNUxhU01QNnJxUVFpTzVpRzJsNlhI?=
 =?utf-8?B?Mkg4V2dua2dXQWxDTmk5QmlDNEN1NndCYnoweHNXTG4vbklOYXN4QVVTYjFF?=
 =?utf-8?B?Vk9lcWhad0VCdlJGYld6RzNvQTRGZmZRbmFwVVNtZXF6ZHh4WWJBSDRZdzBa?=
 =?utf-8?B?TW9yZjVOaFh6UldzYU95SWtYMEdsc1NCKy8xRWpLUityZ0xUUWoreER2ZXdQ?=
 =?utf-8?B?SHQxalRXRS91a0NHQ09DWldvTlJtbXpqcjR3VEFDNE83UTdhSDlTNzdsb3RG?=
 =?utf-8?B?aWFVbmlERFRud1d5UWJ2WElWb0lzK01TUmhodTc2UFlEY0ZDRklNSENuWnAw?=
 =?utf-8?B?c3pBTkJ4OU9wZmNpNVBkeVZmSnB6dlVHUmF0QnYxeEZkVWxUL3I1aC9pYVBj?=
 =?utf-8?B?UTBycXFHQ0xBVkJnQ25ZT0dwUUxiTWtpT1lwNUdmYXBlSGk1b1BsVjlQUG5K?=
 =?utf-8?B?TUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70ff119-5582-4ed8-d4c0-08dca11e19db
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 20:23:03.6107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLsv51iaA5nEqiqSfxgI3TI6o5NHYnn7zpJm8cTFFzBNjZ+vSSl5LpE8f06Di5HZkO71BCwDD08Mku4hRAWNuz70JGFMLvqwKC+/SacBwGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7181
X-Proofpoint-GUID: XE4YtL3ljtap9pIcKeRu9tPQfR_unRNY
X-Proofpoint-ORIG-GUID: VlIjGplpA4X1hfEM35posKgPrng_-Nmy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-10_15,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 mlxscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407100145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 20:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201745

--------------2mW9XExG0AvETokz90JwzoQ4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46A59jUj020114

On 2024-07-10 10:58 a.m., Steve Sakoman wrote:
> On Tue, Jul 9, 2024 at 1:28=E2=80=AFPM Randy MacLeod
> <randy.macleod@windriver.com>  wrote:
>> On 2024-07-01 8:37 a.m.,Deepthi.Hemraj@windriver.com  wrote:
>>
>> From: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>>
>> Signed-off-by: Deepthi Hemraj<Deepthi.Hemraj@windriver.com>
>> ---
>>   .../llvm/0002-llvm-Fix-CVE-2024-0151.patch    | 1086 +++++++++++++++=
++
>>   meta/recipes-devtools/llvm/llvm_18.1.5.bb     |    1 +
>>   2 files changed, 1087 insertions(+)
>>   create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE=
-2024-0151.patch
>>
>> diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-01=
51.patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.pa=
tch
>> new file mode 100644
>> index 0000000000..0b8338d35b
>> --- /dev/null
>> +++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patc=
h
>> @@ -0,0 +1,1086 @@
>> +commit 78ff617d3f573fb3a9b2fef180fa0fd43d5584ea
>> +Author: Lucas Duarte Prates<lucas.prates@arm.com>
>> +Date:   Thu Jun 20 10:22:01 2024 +0100
>> +
>> +    [ARM] CMSE security mitigation on function arguments and returned=
 values (#89944)
>> +
>> +    The ABI mandates two things related to function calls:
>> +     - Function arguments must be sign- or zero-extended to the regis=
ter
>> +       size by the caller.
>> +     - Return values must be sign- or zero-extended to the register s=
ize by
>> +       the callee.
>> +
>> +    As consequence, callees can assume that function arguments have b=
een
>> +    extended and so can callers with regards to return values.
>> +
>> +    Here lies the problem: Nonsecure code might deliberately ignore t=
his
>> +    mandate with the intent of attempting an exploit. It might try to=
 pass
>> +    values that lie outside the expected type's value range in order =
to
>> +    trigger undefined behaviour, e.g. out of bounds access.
>> +
>> +    With the mitigation implemented, Secure code always performs exte=
nsion
>> +    of values passed by Nonsecure code.
>> +
>> +    This addresses the vulnerability described in CVE-2024-0151.
>>
>> Hi Steve,
>>
>> I see that this was queued to your -next branch but isn't merged yet:
>>     https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dst=
able/scarthgap-next
>>
>> I'm not too concerned about the patch but I have a question about test=
 coverage
>> that hopefully won't take up too much of everyone's time.
>>
>> As you can see from:
>>
>> https://nvd.nist.gov/vuln/detail/CVE-2024-0151
>>
>> "Insufficient argument checking in Secure state Entry functions in sof=
tware using
>> Cortex-M Security Extensions (CMSE), ... "
>>
>> this CVE only affects systems using Cortex-M Security Extensions.
>>
>> I don't think Deepthi did any run-time testing that would run code in =
this mode but
>> I'm not very familiar with such things.
>>
>> Do we have any tests that would allow us to say that the patch at leas=
t runs successfully?
>> I suppose we can take it on trust that it's an improvement and that an=
yone who is using
>> such an environment can report problems.
> It's always the case that we trust that upstream maintainers test that
> their CVE fixes are "good"
>
> It's well beyond the project's ability to verify every CVE fix.  We
> don't have the knowledge or staffing, so we've got to trust the
> upstream!


I'm a trust but ideally verify kind of guy but okay!

I guess we'll hear if there's a problem.

Thanks Steve,

../Randy


>
> Steve
>
>> Thanks,
>>
>> ../Randy
>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------2mW9XExG0AvETokz90JwzoQ4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46A59jUj020114

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-07-10 10:58 a.m., Steve Sakoma=
n
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdaDVmdomJM+u3fbxM-_U8Q9nH=
UzNor6JvUC8z+yaGOVOg@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Tue, Jul 9, 2024 at 1:28=E2=
=80=AFPM Randy MacLeod
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod@windriver=
.com">&lt;randy.macleod@windriver.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 2024-07-01 8:37 a.m., <=
a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Deepthi.Hemraj@windri=
ver.com">Deepthi.Hemraj@windriver.com</a> wrote:

From: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:De=
epthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;</a>

Signed-off-by: Deepthi Hemraj <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:Deepthi.Hemraj@windriver.com">&lt;Deepthi.Hemraj@windriver.com&gt;=
</a>
---
 .../llvm/0002-llvm-Fix-CVE-2024-0151.patch    | 1086 +++++++++++++++++
 meta/recipes-devtools/llvm/llvm_18.1.5.bb     |    1 +
 2 files changed, 1087 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-202=
4-0151.patch

diff --git a/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.=
patch b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
new file mode 100644
index 0000000000..0b8338d35b
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/0002-llvm-Fix-CVE-2024-0151.patch
@@ -0,0 +1,1086 @@
+commit 78ff617d3f573fb3a9b2fef180fa0fd43d5584ea
+Author: Lucas Duarte Prates <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:lucas.prates@arm.com">&lt;lucas.prates@arm.com&gt;</a>
+Date:   Thu Jun 20 10:22:01 2024 +0100
+
+    [ARM] CMSE security mitigation on function arguments and returned va=
lues (#89944)
+
+    The ABI mandates two things related to function calls:
+     - Function arguments must be sign- or zero-extended to the register
+       size by the caller.
+     - Return values must be sign- or zero-extended to the register size=
 by
+       the callee.
+
+    As consequence, callees can assume that function arguments have been
+    extended and so can callers with regards to return values.
+
+    Here lies the problem: Nonsecure code might deliberately ignore this
+    mandate with the intent of attempting an exploit. It might try to pa=
ss
+    values that lie outside the expected type's value range in order to
+    trigger undefined behaviour, e.g. out of bounds access.
+
+    With the mitigation implemented, Secure code always performs extensi=
on
+    of values passed by Nonsecure code.
+
+    This addresses the vulnerability described in CVE-2024-0151.

Hi Steve,

I see that this was queued to your -next branch but isn't merged yet:
   <a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.or=
g/openembedded-core-contrib/log/?h=3Dstable/scarthgap-next">https://git.o=
penembedded.org/openembedded-core-contrib/log/?h=3Dstable/scarthgap-next<=
/a>

I'm not too concerned about the patch but I have a question about test co=
verage
that hopefully won't take up too much of everyone's time.

As you can see from:

<a class=3D"moz-txt-link-freetext" href=3D"https://nvd.nist.gov/vuln/deta=
il/CVE-2024-0151">https://nvd.nist.gov/vuln/detail/CVE-2024-0151</a>

&quot;Insufficient argument checking in Secure state Entry functions in s=
oftware using
Cortex-M Security Extensions (CMSE), ... &quot;

this CVE only affects systems using Cortex-M Security Extensions.

I don't think Deepthi did any run-time testing that would run code in thi=
s mode but
I'm not very familiar with such things.

Do we have any tests that would allow us to say that the patch at least r=
uns successfully?
I suppose we can take it on trust that it's an improvement and that anyon=
e who is using
such an environment can report problems.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">It's always the case that we=
 trust that upstream maintainers test that
their CVE fixes are &quot;good&quot;

It's well beyond the project's ability to verify every CVE fix.  We
don't have the knowledge or staffing, so we've got to trust the
upstream!</pre>
    </blockquote>
    <p><br>
    </p>
    <p>I'm a trust but ideally verify kind of guy but okay! <br>
    </p>
    <p>I guess we'll hear if there's a problem.</p>
    <p>Thanks Steve,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAOSpxdaDVmdomJM+u3fbxM-_U8Q9nH=
UzNor6JvUC8z+yaGOVOg@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Steve

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Thanks,

../Randy



--
# Randy MacLeod
# Wind River Linux
</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------2mW9XExG0AvETokz90JwzoQ4--

