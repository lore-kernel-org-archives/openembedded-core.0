Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 387CDC2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 10:12:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.137139.1719223957358860389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 03:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6905150c53=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O6ROd4013579
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 10:12:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywnk5sg3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 10:12:36 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45OACZQi003404;
	Mon, 24 Jun 2024 10:12:35 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywnk5sg3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 10:12:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+oMyeol8EGKNBGph6gdxrFNCfBgi+Lm1YE40o8bo1gwDxcahmqXzgPyzm7dnRreyFXssEX7EeICGcIdi4genm6dHwL6KGzGFuRAPsu4BMTsPz5ncR1hwdo09GiJPpkuBYM6DVx5FWnNOs9qhGFSRhmapkIyd3Bwt5ias/4HPCJMo6zmZT1SlgyJ2j2Gw+w5oaOErZPG7upgCEQWMOdXJu2MrN3K7UyVmwmrc8uiWVx7SZkPkcMwxl8ZHgFq8+GrV/oO+fjZYYHZ51JAT+vz86QuAZvp4zzcKSAyu+ETuBIM/BoKmHVSEwT8ofA5H4XkujBkq2H5t/v6b9HR3VVr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EULO8veiGNj/CS9NGZTzhX7aAkWKOFFM3ZEpKydHaY=;
 b=emnloL4qb4sPnp+Q3XXR/iFT/xbIf+SKOIf2EHQjiCvvhkVUfJspb3mJ/R8An6HSpNSlzHS5OooB9vD3wrY/AqZt88Z7OOhnjeWj7LK23+WQBi2U80zpzh/8QiTkyYFHmeMbNhyHkAbNhCIHsH7w+AUqpwlT4AwsNEn6MIiGDB38xVyY7wcQetR36wQXD6VUNT+AVivEcgazY2zYxIQhoWmVbUsEmdM7SBMAulVQxG11qNlcSYdz4chxDROP6fmFM5BQ5PIqkMxcZdJ2LIBX+HlFYry6I3RbYm6rmtbi98RDyGAjddEJPJbewFF8VCoSqpH09KiHqEglpqiMfSPBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB8264.namprd11.prod.outlook.com (2603:10b6:806:26c::17)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 10:12:33 +0000
Received: from SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569]) by SN7PR11MB8264.namprd11.prod.outlook.com
 ([fe80::e92:66a8:56ff:f569%7]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 10:12:33 +0000
Message-ID: <7001a7c7-f500-49bd-ae2b-711d42a97f06@windriver.com>
Date: Mon, 24 Jun 2024 18:12:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/1] gfortran: update runtime dependencies
To: Martin Jansa <martin.jansa@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
        openembedded-core@lists.openembedded.org
References: <20240616153135.3058410-1-kai.kang@windriver.com>
 <20240616153135.3058410-2-kai.kang@windriver.com>
 <17DA6AA6C1087792.28936@lists.openembedded.org>
 <CA+chaQexmQso_xy45yCMU_EsVDq9RsX+qmmuuVb3r8ur3XQe4A@mail.gmail.com>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CA+chaQexmQso_xy45yCMU_EsVDq9RsX+qmmuuVb3r8ur3XQe4A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::20) To SN7PR11MB8264.namprd11.prod.outlook.com
 (2603:10b6:806:26c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8264:EE_|DM4PR11MB5296:EE_
X-MS-Office365-Filtering-Correlation-Id: cda8c58e-6d9d-4566-191b-08dc94362a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|4022899006|366013|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ME9aVDVwN0hmZmJVSEFzcW1Bd3FBRWdmdTljQXZyd2dIZlRVaHNTMkJoUUU3?=
 =?utf-8?B?a1I2Q2hTUXlYQkc0WElVZ0R5anl0QzUxZCtnc1k2ek1wei9iMHZPaW01dmln?=
 =?utf-8?B?dFNzWUVTTWxFVjNjWDJYVGw3RDgrQ0NuQ1NvWUlvbDFGMjduRTFrVHZwSWRo?=
 =?utf-8?B?Tk9MM2k1WHNrTWU3b0xBTThRUVd3ZkFpeUErV3BwRDBiL2JMc1pNeUt5eXo5?=
 =?utf-8?B?dkNjSE1vMTNpalhYamt4YVRTWkhxaG5Ndnp2WXZ6cU4xVytRNTJLbGc4b0Zo?=
 =?utf-8?B?L1V4dVMxYW5XUzFXZHU3MTlOL3h4QzVrSzhCSXFMb0pHTElwUE5KYkc5ekVE?=
 =?utf-8?B?K2dJNjRqWkJuYm0xT3lBeVZrRERlYnhjYitBVTNBV3d6akxJVjhuRW1WYUlJ?=
 =?utf-8?B?N1A2Mnp6K2lIekgvOUFOTGVMb1J2Mm1XYjFuV2I5TTVjVHZMQlR0d2ZrZWNG?=
 =?utf-8?B?VGtLZTdvWWtGbDJ2Qnd6VTR6b21xL0ZrbS81N1VtYWhYWWNPRFBXUUszaEtz?=
 =?utf-8?B?TzVIbjRMQnJOcUVUcDRJbW81T3QrOEhlV1ZOdW13dTZVdWg1UndMTjdabDlO?=
 =?utf-8?B?YVBnUE4vYjJ1R0pXZm1mcTZDNnZVenF3K1dnNXN6bS9ieFl3NzdvbDNVOUUw?=
 =?utf-8?B?RUY4a21qbHEvUVgwNnk2Q1lSdFdYMmtDZXVBdS9PMWptbWozM2cvOFE5Q21G?=
 =?utf-8?B?OWsyOUV6dWd3MS9CbVlWaXV4THc5WGM3M256RHRzcVcwWDBlU2J4NDViZkZJ?=
 =?utf-8?B?ZHVWb3lpYldxSzF5U0JRaG5CS05LcytJckhEVmdCN3kvVnlGYThRZTBNTE5I?=
 =?utf-8?B?dUR6VGorUTZtZUJ5cjczQksrQk9vWUJIRTd0a0FpYktMbEJiTEZTV3VDaWti?=
 =?utf-8?B?VWY0M2VIOFNTS2VFaXVyTmQwdlBycENhMFpIZnVudEgrQnJmTFllMUsyaTlP?=
 =?utf-8?B?LzUvTkxTcXFLWC95Z25IUE9JRmVSb0d6N3ptcko2WlJSeWZIK25COHZ2VXlz?=
 =?utf-8?B?eVdUU1ByK3BuOE0wV0RtM2YycGpwcTQ4aEFuT2xMTW9xdGxtaWJyYWhIbDdP?=
 =?utf-8?B?cXRmRGZxbmtzL2FIbklxQWNHR1JadHJtN1piT0t5L3dKNm12Ui9wQTJVY0Ny?=
 =?utf-8?B?T0RTbVk4NkZKeHVMUU9OTmdFMVVqR2J1TSs3UkVCcGRNcGxmSG0xSkc3WVBr?=
 =?utf-8?B?RzNPbHYyMlpKbFJ2Uk9BUzg0YU9zdGw0Q3dEMFppdjdSSXBTdzFmeVBtOFFK?=
 =?utf-8?B?Uk9WbkVqbm5iZURNRWRLc3pSa1RPcEJEZTBwQnlHeE9PQmZWMUNON0dyMFZv?=
 =?utf-8?B?dHYvdXVRMkx4YjNFSTBLY0Z1eWpTZFZMRjN1djFzL05SaHJQOEdvRnM3RVcy?=
 =?utf-8?B?K0g4U3FiV1ZiQ2VIcjdNRGJnYnVUaDNKTzlUeHE1T2pWYVZwbUlaWTNTRUc3?=
 =?utf-8?B?VTJVQlA0UGlCRDUzV2d2LytOekVKR21ZY3A0QW1iZDlwUzVHWG1FdEZMZy9u?=
 =?utf-8?B?d2dyN0ZURHdtcXBqdksxV2dIVjRjSEFzWmNzRHp4YkpqK0JvWitza0JBWitk?=
 =?utf-8?B?bmlIem15OVpsNU5WTjMzR1pFNU9MS1NybUZwaGJnNS8zSGdiZzlCS09YaGdY?=
 =?utf-8?B?N0U5Z3FuM1FhSTdHZWZMVldraU1aeG92SjNoYTNrTzJndFFldlNVa1lpbHo2?=
 =?utf-8?B?NXFLZmJUTEZLRWorWVJ5bjZWRVlnL1oxMG8vaWhQQjg0Ri9qOEVwcHZBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB8264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(4022899006)(366013)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnFnMVdoMFZscGtpVXhCSXhmbUJsaSt0RGhkUDNiMHlQbFliS2hrZTdSZk81?=
 =?utf-8?B?RUt3Zy9QN2c3QmxkSFg3VzdHQzYwaTNGcDgreTJnMGhFdmNUVEw0SE9hRzBp?=
 =?utf-8?B?OTkyTXBPWExJcDBCaTJWVzU5bWRtOGpMZ0haVjlhbjdlVTF3bC9KY3o1L25Y?=
 =?utf-8?B?R2lOTkFsWWNKMVVUTG9mdTdEclJWRGRFaXlXUjBhbzltSjh3STBQeVJSRUNv?=
 =?utf-8?B?TnowUUF6Q2w4eklvZEdHdE1Pc0JYdDdXSStDOU0wak5od1pIYnRSNURPZzkx?=
 =?utf-8?B?RC9mcmdCWXhqMWpRRDBOcC9PREh6K1NMMWV4MUR1NE9CZ1RnUkNOSVU1VU1m?=
 =?utf-8?B?UitUckx1MzFXQmdNL2M3TVZxaC9hNHpZSzJaRmJadXhHZ29JUmlmMDhmeGk4?=
 =?utf-8?B?SjFkN2QybHY4M2lpMlpLem9jcVBYckFvdnpCWEkwWFBYUitqaVVrYkMxbjNq?=
 =?utf-8?B?NG4zcUhic2RaNDZIaGxFbFhsSHZKQXkwak5LWW43dVdVZW02cGljL1VPRlZl?=
 =?utf-8?B?cS9mNTNxM0Q3MDkxbzVQTkEyZVhVNkh5Um5YWGl3SzBSNG15UnZ6NXJQbDlC?=
 =?utf-8?B?bmYvOFFiSjhPQWx1K21tSmxhdU10aHQ5VTN6WFZqVTNtYzNHT0xHcjAxY0Zn?=
 =?utf-8?B?a0FiTmI4ZWVOVXVEQzdxb2tROEZYYjlCWkhHR1hDa1I1QUYxeEpTR1ZnM3N6?=
 =?utf-8?B?WGNScUE3dlovd1JxYVk4bDJaRFcwQk9hVVNKVUROd1p5TmJ3bEhKWTZqaEdV?=
 =?utf-8?B?Y1FzbmtORXEwR1VCNkVCYXlLZW9NOWk2U1dxRG5JZ3pxN1BSUFU1bnZadWVJ?=
 =?utf-8?B?RkhIZmpmajUxcVhIaEhzTTRPdjd1a2poN3hheEkwaEZBd1lvVjJOWWk0ZHRk?=
 =?utf-8?B?WldrdWN4Tk4yNFptYjRRUDNBbTJSTWZRbjFhRG90SEx3UVEwOE1ZRHhjNXha?=
 =?utf-8?B?Z0VHbmFrZVVVbkNHNk5IQ0RKY0ZYNGw2ZnN4eDJiMXVUNS81ZUJreDhDVG52?=
 =?utf-8?B?eGM1THM1R3E4MUJaRXRhV1FBWUNLK1JUaWUyUkw5K2xXb3pvQnU0am1maVRD?=
 =?utf-8?B?QUVyRi9CZGcxWktrTVNzWEZBMjJNZjQ2WXQyVmVaa295YytTNHdDNXMveEhL?=
 =?utf-8?B?VG85d0dxNUpIYlJjem1UVUJuOXlYZk44c2FlNmR1ZkF0Zi9URHZGYXFMSzNO?=
 =?utf-8?B?WjVjb1d6K1BNNTVrYitTSTFhUE5sYmFHRExHUk1wdXZ1VjZVZXlkcVBlR1FO?=
 =?utf-8?B?VnJnVFV4d0FyYVZyT3doUy95MTBkVS9pbzZJb2QvNldWVVRRS0hNQ2dITEEy?=
 =?utf-8?B?VmdHRnJaMUtNV0txd3kxMUx3azNJeTlUTnExbWdtTjM4c2o2OW9aSHpzcHVw?=
 =?utf-8?B?NUpJbGF2RHBucWJHbDhKaURPdEppNUV1a0ZsWjh3SEJycGZ4dUhHaXNtZU1o?=
 =?utf-8?B?S3RYODdXaEtCSkpCU1d6dVVOYzR0aDEySDVHbnFkbkxsMXRIZWZXSXZpaWFT?=
 =?utf-8?B?Q0hyVFEwL1FORDduamNmM01OeGhNVE9IWU5Dc2hMcTVKcFNRT2VYRGJWYzNs?=
 =?utf-8?B?c2trY1hKQXhPMHhHcDh5MFcydXZTK0NCSVFjM0l5dWp4d0Q3YXQ0RGQzRDNk?=
 =?utf-8?B?VDg2cUNqQ0dPeHFKZzF0V0hVYVd0Z2JBOC9BcFpGTEl1SmxPaWxBeHVJVGJk?=
 =?utf-8?B?dzlUTUpCU3NHdHZuY1ZvUWJDNk1nZ3I5Skx6OHM3ZWgxV2hwbitSd2N3SW5n?=
 =?utf-8?B?WE4rNDhxc2syVUczQlYwL09OVUZ2VjlkVnRhRXhuRUd1dUdtM0x2elI1ZVhG?=
 =?utf-8?B?aUJKaHRyc0h6bnFnalBtTmg4NnZXR2dSRk5FNUM3L1lSTDU5c1d0SGhKUVQ4?=
 =?utf-8?B?L1o4cEdURER0emc1RUJzTzNvRmZvakt4TWE2RHpoVW5sZ1ZaRm1XU2dqeTFz?=
 =?utf-8?B?QjVPSzl2ZVNEZmxvOE1ZbUh6S0JJdnlkZUlLd0c2czU0cm16Q0g5dytMczlt?=
 =?utf-8?B?a1I1aE1TdzN2VGozRk4yOTdDS2hlQUp2aXZjcytHOHJFVSs3aHFlcDVZdmUw?=
 =?utf-8?B?WE5vUjZnM2pWZmdrdlA1ZzRIVDB6K28rMXBZZzl6SXE3ekJod2FHNnVHTHVV?=
 =?utf-8?Q?1LFxqTQVfN6+TO/yoKP+UhS/p?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cda8c58e-6d9d-4566-191b-08dc94362a08
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 10:12:33.6346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j3MBybp8liOHISfZ5cBq5EYVxA/ep4ZKDGTWBmF3at3Qi7IGPuXSnmqV85IPIu1vlvSisJN4YKjyYmqPcSqaHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
X-Proofpoint-ORIG-GUID: QbuvlQN-mzrHKXVTCJ7Blji-RgFrMOcS
X-Proofpoint-GUID: CEDK9SKHyA9qbS9KH-M7cVFYFSLTHOUx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406240081
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45O6ROd4013579
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 10:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201074

On 6/19/24 23:00, Martin Jansa wrote:
> See https://lists.openembedded.org/g/openembedded-core/message/200915
> which allows to me to build nativesdk-gcc again.

Thanks for your fix.

Regards,
Kai

>
> I've built nativesdk-libgfortran and libgfortran with the patch, but
> haven't used fortran in runtime at all, that's why it's an RFC, there
> were also 2 warnings:
> WARNING: nativesdk-libgfortran-14.1.0-r0 do_package_qa: QA Issue: File
> /opt/.../usr/lib/.debug/libgfortran.so.5.0.0 in package
> nativesdk-libgfortran-dbg contains reference to TMPDIR [buildpaths]
> WARNING: libgfortran-14.1.0-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libgfortran.so.5.0.0 in package libgfortran-dbg
> contains reference to TMPDIR [buildpaths]
> which I guess were already there.
>
> On Wed, Jun 19, 2024 at 3:24=E2=80=AFPM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org=
>
> wrote:
>> Something seems wrong with this change which was merged today, now wit=
h:
>> MACHINE=3Dqemuarm64
>> FORTRAN:forcevariable =3D ",fortran"
>>
>> I'm seeing:
>> build/oe-core $ bitbake -g nativesdk-libgfortran
>> NOTE: Resolving any missing task queue dependencies
>> ERROR: Nothing PROVIDES 'gcc-cross-x86_64' (but
>> virtual:nativesdk:/OE/build/oe-core/openembedded-core/meta/recipes-dev=
tools/gcc/libgfortran_14.1.bb
>> DEPENDS on or otherwise requires it). Close matches:
>>    gcc-cross-aarch64
>> ...
>>
>> This might have been broken even before this change, but now it got
>> included in dependency tree of nativesdk-gcc (as shown in bitbake -g
>> nativesdk-gcc now failing when host and target arch don't match):
>>
>> "nativesdk-gcc.do_package_qa" -> "nativesdk-libgfortran.do_packagedata=
"
>> nativesdk-gcc.do_package_write_ipk" -> "nativesdk-libgfortran.do_packa=
gedata"
>>
>> Missing or unbuildable dependency chain was: ['image',
>> 'nativesdk-packagegroup-sdk-host', 'nativesdk-lcov',
>> 'nativesdk-gcov-symlinks', 'nativesdk-libgfortran-dev',
>> 'gcc-cross-x86_64']
>>
>> I guess the easiest fix would be in:
>> meta/recipes-devtools/gcc/libgfortran.inc:DEPENDS =3D "gcc-runtime
>> gcc-cross-${TARGET_ARCH}"
>> but I'm not very familiar with fortran (we've enabled it long time ago
>> to build lapack(blas) for snowboy, but wasn't actively used for couple
>> years).
>>
>> Regards,
>>
>>
>>
>> On Sun, Jun 16, 2024 at 5:32=E2=80=AFPM Kai Kang via lists.openembedde=
d.org
>> <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
>>> From: Kai Kang <kai.kang@windriver.com>
>>>
>>> It fails to run both `gcc` and `gfortran` with errors:
>>>
>>> | root@qemux86-64:~# x86_64-poky-linux-gcc a.c
>>> | x86_64-poky-linux-gcc: fatal error: cannot execute 'as': posix_spaw=
np: No such file or directory
>>>
>>> then add binutils which provides `as` to RDEPENDS of gcc.
>>>
>>> libgfortran-dev provides libgfortran.spec which required by gfortran:
>>>
>>> | root@qemux86-64:~# gfortran hello.f95
>>> | gfortran: fatal error: cannot read spec file 'libgfortran.spec': No=
 such file or directory
>>>
>>> And gcc provides liblto_plugin.so:
>>>
>>> | root@qemux86-64:~# gfortran hello.f95
>>> | gfortran: fatal error: '-fuse-linker-plugin', but liblto_plugin.so =
not found
>>>
>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>> ---
>>>   meta/recipes-devtools/gcc/gcc-target.inc | 9 +++++++--
>>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-=
devtools/gcc/gcc-target.inc
>>> index 8e9693b4cb..e9187fc444 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-target.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
>>> @@ -33,7 +33,7 @@ PACKAGES =3D "\
>>>       ${PN} ${PN}-plugins ${PN}-symlinks \
>>>       g++ g++-symlinks \
>>>       cpp cpp-symlinks \
>>> -    gfortran gfortran-symlinks \
>>> +    ${@bb.utils.contains('FORTRAN', ',fortran', 'gfortran gfortran-s=
ymlinks', '', d)} \
>>>       gcov gcov-symlinks \
>>>       ${PN}-doc \
>>>       ${PN}-dev \
>>> @@ -60,7 +60,7 @@ RRECOMMENDS:${PN} +=3D "\
>>>       libssp \
>>>       libssp-dev \
>>>   "
>>> -RDEPENDS:${PN} +=3D "cpp"
>>> +RDEPENDS:${PN} +=3D "binutils cpp"
>>>
>>>   FILES:${PN}-dev =3D "\
>>>       ${gcclibdir}/${TARGET_SYS}/${BINV}/lib*${SOLIBSDEV} \
>>> @@ -80,10 +80,15 @@ FILES:${PN}-plugins =3D "\
>>>   "
>>>   ALLOW_EMPTY:${PN}-plugins =3D "1"
>>>
>>> +INSANE_SKIP:${MLPREFIX}gfortran +=3D "dev-deps"
>>>   FILES:gfortran =3D "\
>>>       ${bindir}/${TARGET_PREFIX}gfortran \
>>>       ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/f951 \
>>>   "
>>> +RDEPENDS:gfortran =3D "\
>>> +    gcc \
>>> +    libgfortran-dev \
>>> +"
>>>   RRECOMMENDS:gfortran =3D "\
>>>       libquadmath \
>>>       libquadmath-dev \
>>> --
>>> 2.34.1
>>>
>>>
>>>
>>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#200913): https://lists.openembedded.org/g/openembe=
dded-core/message/200913
>> Mute This Topic: https://lists.openembedded.org/mt/106704990/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[martin.jansa@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Kai Kang
Wind River Linux


