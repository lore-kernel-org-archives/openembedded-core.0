Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97679C3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 09:25:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11298.1721208305112948725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 02:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7928d6fc0d=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H4eHar016568
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 09:25:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40dwenrkcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 09:25:03 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46H9MXiw022703
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 09:25:03 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40dwenrkcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 09:25:03 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvltwnaisShvXNXYIsiofEhNBL7tlwyZEdKAu8E/UdW/M18gQIEsgqSv//65rT+5nJw6V4Bdbp0p9mXvj45qkNl9I4hGNW8BPsgrYSfbJPUk5v+pd99a1qxH8HIxMYH7OQ/JIajul+PyZjR0STdz5xleGj4J8y8LeB3ajk19OEqy/tghnv/uTeG5W2A+TlXZdO6sXzMWh8SbSwdhHX41k9Nn1inQulmr68bgMl3HWfl3UpjSrjIdyQQXge1pAy1P0PUwAe3ojYBAzki5JNX3iq9Fy6lwUdtwMcyr5C+J3xspYCx6Gtw79C32nJT0LWTqsdIKd9PGgUhxfWU/5HeY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXiJObuOlIY4OY8hqwc7QF2kDvS2yUz/XQH/jeb2gT4=;
 b=R7B8CPSycSJ01OQ80RrJ/rjYjO1LQPYpt83UHna/MmU38Di9YwueOLVQG9TCs588DYgbphU4zCxionnVnkzRr4OhJdYBt1Onkc2ZJ1tHcfB7DJKSsKv1Xi+PfRDdIXpC4wM+HcaV1kTiy5w5MnRgpEVm0X3ZkrlAf5mZ0x0mN8Hl8Z31dNDcA/yaDoO+MJOvmDneIUrIxW3MurNzkduJVv/8TUNa8tkcgFVa0AJgN78Nk2EBf2nf6zwQV6u+MYoiXiZgXtGHo95PtXf+ABFQHlDog4J+uGSYaBoBy0SZXHufZ5XNbuLSf1oH6a7NmsIKnOzT8q7J8/FknklO4HHoSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28; Wed, 17 Jul
 2024 09:24:59 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 09:24:58 +0000
Content-Type: multipart/alternative;
 boundary="------------Pxf8tph81NE98HgK2Imn5nbA"
Message-ID: <7a2ff36a-b221-2743-0ecc-a46b26b79c29@windriver.com>
Date: Wed, 17 Jul 2024 17:24:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH v5 2/3] openssh: systemd notification was
 implemented upstream
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        Jose Quaresma <jose.quaresma@foundries.io>
References: <20240716141639.1564355-1-jose.quaresma@foundries.io>
 <20240716141639.1564355-2-jose.quaresma@foundries.io>
 <CAMKF1sq9uq7tf_8K_-54mVdnerEbQQubBx2QXmX6xuU-RTgYXg@mail.gmail.com>
 <CANPvuRnPcYdSTjM3Kc8j1RfBw8LWRxj_quabmMZr_aOpUS8xRQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANPvuRnPcYdSTjM3Kc8j1RfBw8LWRxj_quabmMZr_aOpUS8xRQ@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a0426a-8bc0-4bf1-b357-08dca64253c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUg5MDB5NWJwWDF3MmlZTHZJN1FPZFB5Z3AvMTNmRm9XUk1OT1J6V3grQWdZ?=
 =?utf-8?B?L2NCd1dyajFMZ2FHeFZtcENTZmliZWRBeVFtaU5YQi9UbTBUejdiWXpGRWcr?=
 =?utf-8?B?Y3FRb29iWU1XbXJVczhpU2dzR1I1YXlJTHNMM1c0d252M0ZSMzJxbVVRRjhi?=
 =?utf-8?B?VjBwRXhlcFpxZjBQcjkvV3JGY2UxcWdiTVFNZHFBc3FULzVUbk13a1FENFhK?=
 =?utf-8?B?YWpXRmZZM0FiQ3lDdlhMalBhWUhiUzB2QXh4MWVrVUMvNk9NTXRPM2NIS25t?=
 =?utf-8?B?akk2R1JIRUlGMHhPUEZxZHdsZUsxRS82aXBaOUFna0h6WHhjTm9zLzJReVRT?=
 =?utf-8?B?ZjU2WHh1R1U0b2tId242alRReGZGTVVOQ3ZHTlUxbXc1OGF3ZlBxdU1ESllx?=
 =?utf-8?B?WXkzOEdXdXV5bVBJMllUOFFwRU5JQ3lGVEJLY3hMMmZocHQ1R0I3dktXcTdF?=
 =?utf-8?B?Q0tBUlVVSUdaa3FRRjBkYURWaWZUZ3JycHV1YTRWYWZoZHQ5YjhmMnI5Njc5?=
 =?utf-8?B?NnA1Ui8zVGxWNzlYWnE0R1VpMUlDVmVLUmJpSUZ1UFJHbkRDT3VLNE02N3VW?=
 =?utf-8?B?MjlTU3ZsSkRsOWF0cmJOUGY2WG03cXNQQzR0YmVrb042VW13ZnkwRUtWdDdU?=
 =?utf-8?B?MFVicVRYU2x6MVZtOVlDdmhuSjdNMGFXd1FzdGNieWUwQUVSKzFuOXErdWY0?=
 =?utf-8?B?dkZNSXVRdEdoTVBFQ2ZGTERQR09acHc3NkNhU1dJWnBRMkRUd0d4QVpmRlN3?=
 =?utf-8?B?c1dpZjc4L0ZTaGlRNGtla05zRkQyR0NwWGdGcVNBZVMramNnL2Q5aHZDOXhl?=
 =?utf-8?B?dEJBWExlNXF4RzVLOFpMMFZHWlNadXBIL0xZUndTTytnc1pyd0JPeUh6YW52?=
 =?utf-8?B?VXVMOUx3WUxZVll2OUxhd296WDRDaDUzQmljMUo0L2tNWkhHeklmSUp3YVZw?=
 =?utf-8?B?NGdBZzBCZUtqcUlmK2laN1pja00zZ0xCdUJoL2psS093eG9oMWlrZUxFYkIv?=
 =?utf-8?B?NFNmRWpyUFVMLzZVSXF4RUVDREZyYjJ6WEI1ajY1SkpGM09ZUUtTcnRCbUtD?=
 =?utf-8?B?ZjNCLyttTit3OW1DeGxzNlEzZ0JGNnkyclUrajIxbzZ6UjYxeExyQjRDRkZO?=
 =?utf-8?B?M0wvUzZJakZweW4zOEMvdGN5NXdsMytNNlA4bE1BOVVUejJhaDZUd0NZdEFl?=
 =?utf-8?B?V3I2ckYyZ2tVbHJicHdTTDdXaGNTSHBPR2tNMVFXdC8ydXNHSUt5Tk9LUWVo?=
 =?utf-8?B?ZUdkeDZNeHlrT2JGa0QzQVFKS2diOFdCUTBDYnBWMEFON0V6TXVvMmRabFZD?=
 =?utf-8?B?Z3pRK0hMeW5rYU13dFZFVDFGMEV0ZlJGM0VQQVVkc0Z2QzB6R1hGWjlyTkhX?=
 =?utf-8?B?N2NnMldCaDNJdWlVWHMyb0llbzNnRVhjOXRKK2dwRVl4eHphVlZ2VnJ5TzdN?=
 =?utf-8?B?NDdneGFtUnptVVNvclpYTWhDTXJzNEpWU1I5b3ROVG5RYmxUdW0vaFA5WnZL?=
 =?utf-8?B?TDdnNjJQUnhUSDl6cWNtb3ZLYmVWZzAzWTd4TFVWZ01NbHhDamp5a2h0Yitp?=
 =?utf-8?B?ZTZiSnZIcVNVeTdPQ2pKbHJURkZvMWZRVEk1ZzNDTWRCWk9rbmRzM0JGaWhj?=
 =?utf-8?B?S2FuZ0VCOGQzdm0xNFdEMDlRQXhST1I1OFFzRHpyK3Jpc3pYVjJBQ1gvVE5v?=
 =?utf-8?B?M1RoWEdBRG1aQmczNnVtWlhUZVkzQ3FUU09nanppeTB6ZWtoL3ZyQytVMlln?=
 =?utf-8?Q?3eisl3nHVKThWKcsQQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3dRWjlvcXlEVFNXSWRHTzQxUG5QRmI3c3dtamEvSVVKNFVTU3ErSlZOYmp1?=
 =?utf-8?B?Y00yRWoybWdZOVlONmtRQjlWOVN0eGhRRTVPN21sOER0a0lzd3dFdzloSFE1?=
 =?utf-8?B?TkQ0NDFEUFNRMmhXRmoxY0s3VGYzZlFrZjZSN3RXMURIbG9YNmx5TFhNSUhF?=
 =?utf-8?B?bzJ6T01XeXh4eGZZaUMxK0REUndudHBFbS9KMXA4K0RRTUlHZ3AwSHVhckdl?=
 =?utf-8?B?Ti9ZdTlOVDkybWFta1BaTmsyYWtLWHZJRURzcjJrNmZmTGROWFNMekxmQ3Z4?=
 =?utf-8?B?a0ZuMmtyL0ZHZnZQTE4zRS9vMkhEbENWM3ZwdXFQbUMvTDU3dUhIakVCekF5?=
 =?utf-8?B?UGZ1ZTF2OGEwYkFOaExnNjBnOHZQcGM1VFQrb1RhakFUWG1Wd2hlaTRmalpx?=
 =?utf-8?B?K0h2Y2tPMzZTK1pKTVl3bmV3dTZMZmlVRG5DaEVTY1E2bXVNK2lDYzJJMXM0?=
 =?utf-8?B?TTFZeVRjb1hCQzN1Q1g4ZThXK3cvQmpIdWlZekZidG5uT1dXdVNIQWpzTVc3?=
 =?utf-8?B?QW50cnZVRTgxWCtDT1BQTmVhTG0yNERLZ1BHYUtnN2VjMjBhZDFOVDBORGw4?=
 =?utf-8?B?a0YzejN2OGlUVXdBMnp2RzRML05tNVNaUnpVYTBTWmI1dHFsdmloN21VaDFW?=
 =?utf-8?B?MzBvanVIOEdxbTBnY0RyL3BPYXRrVmcwdFFWQUVmNGNudGU5RGFrbUNqUldo?=
 =?utf-8?B?S3pleElmcDFRV01hT2k3cFFNdndDSGFZTXB1cVc4MVZoL3QxWlhRVXBIN1g4?=
 =?utf-8?B?aDJHQmx5dkNDZ0xUM3F4ZFFyKzN5TC9YaWRZYXpRWFJIOWhjYzg4dE1sdUFa?=
 =?utf-8?B?RXczZEZwenVrbUdoRU4reTBrVmdWK1gzeTIrWXRhRnlHNExjWnFNZDN2QUdw?=
 =?utf-8?B?WWFjWlk3MXFSdkpWbzl1RWplWUlONTJCZG1LZGpJdVlLSHZYc2kzcEJPT2Jy?=
 =?utf-8?B?eUNVTXRnRnZDS01EV1hlRFlMSHorTHR3dE5wTW9JV1hZQ05xZklhd29vVkNn?=
 =?utf-8?B?d0hHMVEzT0N4NlRyOFBLMllCY2JxUE9SOFZaZ3N2cFpYelJ6UjVrcDRFSG9r?=
 =?utf-8?B?RlcySmRGTTROelJwLzVhd2VQaklBVjdLRDhTYmVoWXY3eHF5THVBUTd3M0gy?=
 =?utf-8?B?NXdXZm83dGRFMHhFZ1IrZkswUGZvTmhNYzNPNkNrYVBBQ3BZa3lYYldyNklT?=
 =?utf-8?B?empvTytkcXh4Qlo3azRLckZqUlJNRVM5eEQ2R2YrUXpKa3lTaUYwdlB3VFlB?=
 =?utf-8?B?VjhmWUJsb0N0VTh1b3lSRmVYaGFUTDhwSTcxeEpHaVhVazRzaUdqcGp3Nng0?=
 =?utf-8?B?S3EzRldKcjZBUWU5YkJhVFo4MmtZaTlvbFN1ZE5CN3VlejdSVzRzWjI1R2di?=
 =?utf-8?B?dFc3SWdEMzd0SENFWm9Lcmt4K09JRnNUMkJPYldWdlBsa1VrdVZnbXI4ZzNE?=
 =?utf-8?B?UHRrNTgwM1dmYlpRekVTVGZOd2NZZzRlZ25OMUQ0SW1iS0JoNnJVajg0RXJr?=
 =?utf-8?B?eDgraTJJOG5mL0lnenhjNktJQjlZRFErMzBDVjZRcDVvQ2ZGUS82dHZjak5V?=
 =?utf-8?B?VmxycjcyQzgvKzFiYUxEcW1NNFY0MlhmMXZaemFady9aaVVZZjdkbng5UkFC?=
 =?utf-8?B?TWswY0ZSYjFHUmtTN254WGtFSTlJWGdLVENZemJBWGtORmtMWjRvNVcwSGV4?=
 =?utf-8?B?bTdnMHB4cFZUYndubGhRS01jeS8rTWY4YjdOb0pJUnBlSENGWFhZc2luYXFz?=
 =?utf-8?B?THZkNlk3Rmt2SXhCbzBnM29KeURIN3loQXB5aVJTQ3VNazA3cHk3ZS80RFRh?=
 =?utf-8?B?QVNzMjA3ZW8wQnhNY2pEYjZQeVpPOHZjWDdnVjB3YysyMlRiRnZETzA0MVQx?=
 =?utf-8?B?emRHNDVra3RPbHZMRXdTNE9qU3hMM1lZSm4wRkRKd3BudU40bDJWb1BzWGZB?=
 =?utf-8?B?d1VTcVhXNzhIeEpkSStJSVJwM3FuNkNlbnpKYzQ5YVJKNTduaS9RN09VcllD?=
 =?utf-8?B?OStuRHc3dVNQUTdjYmRKTFpYUUNQVmQ3TGJkOGFmRll5ZUk4T0diR1ZMUkpH?=
 =?utf-8?B?R3ZzTGxmTDczY2NuRU85MlZIeUhhUTdMeXg0c2hGNGtzNGVEN1lCWXl0dWdD?=
 =?utf-8?Q?vvACnBs03Mz0+lmhr1nz3kET9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a0426a-8bc0-4bf1-b357-08dca64253c9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 09:24:58.7741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2gcHtLzBdKvk+5GbsoFyBVn9cZHKy4QCk3JsSAG1TBxurLZAmkxXJ9dB6MeT1dQ6Maz9X0cU0Gsjcl2B/5MPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
X-Proofpoint-GUID: amkHl_IVtCnLpPGMfYS2FCd2aHktmA73
X-Proofpoint-ORIG-GUID: RNSyk-xYTYufShkFxsLnuUE3niJoCND9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_06,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407170072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 09:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202150

--------------Pxf8tph81NE98HgK2Imn5nbA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46H4eHar016568

I think the problem might be related to the "+Type=3Dnotify-reload" chang=
e=20
in sshd@.service. It's in inetd mode so the upstream change about=20
SYSTEMD_NOTIFY should have nothing to do with it.
I also doubt if the following line should be removed from sshd.service.

-ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID

Regards,
Qi

On 7/17/24 16:46, Jose Quaresma wrote:
>
> Khem Raj <raj.khem@gmail.com> escreveu (quarta, 17/07/2024 =C3=A0(s) 07=
:38):
>
>     actually I narrowed down my problem of disconnection to this patch =
in
>     the series. Earlier I thought it might be related to the openssh
>     upgrade patch
>     but reverting that still causes the problem but this patch when
>     reverted, the problem is gone.
>
>
> I will jump on this today and try to find the root cause.
> The ptest goes well in my local tests but I didn't do anything with=20
> testimage.
> I'll see if the testimage picks up something.
>
> Thanks=C2=A0for the feedback.
>
> Jose
>
>
>     On Tue, Jul 16, 2024 at 7:17=E2=80=AFAM Jose Quaresma via
>     lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX=
7AfK0o33vSBIxkkcgx8BUuo8VXD$>
>     <quaresma.jose=3Dgmail.com@lists.openembedded.org> wrote:
>     >
>     > Still side effects of the XZ backdoor. The systemd sd-notify patc=
h
>     > was rejected [1] upstream and was chosen a standalone implementat=
ion
>     > that does not depend on libsystemd [2].
>     >
>     > Racional [1]:
>     >
>     > License incompatibility and library bloatedness were the reasons.
>     > Given recent events we're never going to take a dependency on
>     libsystemd,
>     > though we might implement the notification protocol ourselves if
>     it isn't too much work.
>     >
>     > [1]
>     https://github.com/openssh/openssh-portable/pull/375#issuecomment-2=
027749729
>     <https://urldefense.com/v3/__https://github.com/openssh/openssh-por=
table/pull/375*issuecomment-2027749729__;Iw!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_=
OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BXB1d=
9mL$>
>     > [2]
>     https://github.com/openssh/openssh-portable/commit/08f579231cd38a1c=
657aaa6ddeb8ab57a1fd4f5c
>     <https://urldefense.com/v3/__https://github.com/openssh/openssh-por=
table/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c__;!!AjveYdw8EvQ!dyD=
MDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSB=
Ixkkcgx8Bcg4kaOm$>
>     >
>     > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>     > ---
>     >
>     > v4:
>     >=C2=A0 - split update of Upstream-Status in new patches in the ser=
ie
>     >
>     > v5:
>     >=C2=A0 - use the upstream solution
>     >
>     >=C2=A0 ...-notify-systemd-on-listen-and-reload.patch | 225
>     ++++++++++++++++++
>     >=C2=A0 ...tional-support-for-systemd-sd_notify.patch |=C2=A0 96 --=
------
>     >=C2=A0 .../openssh/openssh/sshd.service=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-
>     >=C2=A0 .../openssh/openssh/sshd@.service=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +
>     >=C2=A0 .../openssh/openssh_9.7p1.bb
>     <https://urldefense.com/v3/__http://openssh_9.7p1.bb__;!!AjveYdw8Ev=
Q!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o=
33vSBIxkkcgx8Bamvaj4m$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A04 +-
>     >=C2=A0 5 files changed, 228 insertions(+), 100 deletions(-)
>     >=C2=A0 create mode 100644
>     meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-li=
sten-and-reload.patch
>     >=C2=A0 delete mode 100644
>     meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional=
-support-for-systemd-sd_notify.patch
>     >
>     > diff --git
>     a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-=
listen-and-reload.patch
>     b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-=
listen-and-reload.patch
>     > new file mode 100644
>     > index 0000000000..4925c969fe
>     > --- /dev/null
>     > +++
>     b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-=
listen-and-reload.patch
>     > @@ -0,0 +1,225 @@
>     > +From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep 17
>     00:00:00 2001
>     > +From: Damien Miller <djm@mindrot.org>
>     > +Date: Wed, 3 Apr 2024 14:40:32 +1100
>     > +Subject: [PATCH] notify systemd on listen and reload
>     > +
>     > +Standalone implementation that does not depend on libsystemd.
>     > +With assistance from Luca Boccassi, and feedback/testing from Co=
lin
>     > +Watson. bz2641
>     > +
>     > +Upstream-Status: Backport
>     [https://github.com/openssh/openssh-portable/commit/08f579231cd38a1=
c657aaa6ddeb8ab57a1fd4f5c
>     <https://urldefense.com/v3/__https://github.com/openssh/openssh-por=
table/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c__;!!AjveYdw8EvQ!dyD=
MDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSB=
Ixkkcgx8Bcg4kaOm$>]
>     > +
>     > +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>     > +---
>     > + configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +
>     > + openbsd-compat/port-linux.c | 97
>     ++++++++++++++++++++++++++++++++++++-
>     > + openbsd-compat/port-linux.h |=C2=A0 5 ++
>     > + platform.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 11 +++++
>     > + platform.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 1 +
>     > + sshd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 2 +
>     > + 6 files changed, 115 insertions(+), 2 deletions(-)
>     > +
>     > +diff --git a/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     b/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     > +index 82e8bb7c1..854f92b5b 100644
>     > +--- a/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     > ++++ b/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     > +@@ -915,6 +915,7 @@ int main(void) { if
>     (NSVersionOfRunTimeLibrary("System") >=3D (60 << 16))
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([_PATH_BTMP], ["/var/log/bt=
mp"], [log for bad
>     login attempts])
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([USE_BTMP])
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0AC_DEFINE([LINUX_OOM_ADJUST], [1], [A=
djust Linux
>     out-of-memory killer])
>     > ++=C2=A0 =C2=A0 =C2=A0 AC_DEFINE([SYSTEMD_NOTIFY], [1], [Have ssh=
d notify
>     systemd on start/reload])
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0inet6_default_4in6=3Dyes
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0case `uname -r` in
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A01.*|2.0.*)
>     > +diff --git a/openbsd-compat/port-linux.c
>     b/openbsd-compat/port-linux.c
>     > +index 0457e28d0..df7290246 100644
>     > +--- a/openbsd-compat/port-linux.c
>     > ++++ b/openbsd-compat/port-linux.c
>     > +@@ -21,16 +21,23 @@
>     > +
>     > + #include "includes.h"
>     > +
>     > +-#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST)
>     > ++#if defined(WITH_SELINUX) || defined(LINUX_OOM_ADJUST) || \
>     > ++=C2=A0 =C2=A0 defined(SYSTEMD_NOTIFY)
>     > ++#include <sys/socket.h>
>     > ++#include <sys/un.h>
>     > ++
>     > + #include <errno.h>
>     > ++#include <inttypes.h>
>     > + #include <stdarg.h>
>     > + #include <string.h>
>     > + #include <stdio.h>
>     > + #include <stdlib.h>
>     > ++#include <time.h>
>     > +
>     > + #include "log.h"
>     > + #include "xmalloc.h"
>     > + #include "port-linux.h"
>     > ++#include "misc.h"
>     > +
>     > + #ifdef WITH_SELINUX
>     > + #include <selinux/selinux.h>
>     > +@@ -310,4 +317,90 @@ oom_adjust_restore(void)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>     > + }
>     > + #endif /* LINUX_OOM_ADJUST */
>     > +-#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */
>     > ++
>     > ++#ifdef SYSTEMD_NOTIFY
>     > ++
>     > ++static void ssh_systemd_notify(const char *, ...)
>     > ++=C2=A0 =C2=A0 __attribute__((__format__ (printf, 1, 2)))
>     __attribute__((__nonnull__ (1)));
>     > ++
>     > ++static void
>     > ++ssh_systemd_notify(const char *fmt, ...)
>     > ++{
>     > ++=C2=A0 =C2=A0 =C2=A0 char *s =3D NULL;
>     > ++=C2=A0 =C2=A0 =C2=A0 const char *path;
>     > ++=C2=A0 =C2=A0 =C2=A0 struct stat sb;
>     > ++=C2=A0 =C2=A0 =C2=A0 struct sockaddr_un addr;
>     > ++=C2=A0 =C2=A0 =C2=A0 int fd =3D -1;
>     > ++=C2=A0 =C2=A0 =C2=A0 va_list ap;
>     > ++
>     > ++=C2=A0 =C2=A0 =C2=A0 if ((path =3D getenv("NOTIFY_SOCKET")) =3D=
=3D NULL ||
>     strlen(path) =3D=3D 0)
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>     > ++
>     > ++=C2=A0 =C2=A0 =C2=A0 va_start(ap, fmt);
>     > ++=C2=A0 =C2=A0 =C2=A0 xvasprintf(&s, fmt, ap);
>     > ++=C2=A0 =C2=A0 =C2=A0 va_end(ap);
>     > ++
>     > ++=C2=A0 =C2=A0 =C2=A0 /* Only AF_UNIX is supported, with path or=
 abstract
>     sockets */
>     > ++=C2=A0 =C2=A0 =C2=A0 if (path[0] !=3D '/' && path[0] !=3D '@') =
{
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f("socke=
t \"%s\" is not compatible with
>     AF_UNIX", path);
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>     > ++=C2=A0 =C2=A0 =C2=A0 }
>     > ++
>     > ++=C2=A0 =C2=A0 =C2=A0 if (path[0] =3D=3D '/' && stat(path, &sb) =
!=3D 0) {
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f("socke=
t \"%s\" stat: %s", path,
>     strerror(errno));
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>     > ++=C2=A0 =C2=A0 =C2=A0 }
>     > ++
>     > ++=C2=A0 =C2=A0 =C2=A0 memset(&addr, 0, sizeof(addr));
>     > ++=C2=A0 =C2=A0 =C2=A0 addr.sun_family =3D AF_UNIX;
>     > ++=C2=A0 =C2=A0 =C2=A0 if (strlcpy(addr.sun_path, path,
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(addr.sun_path)) >=3D =
sizeof(addr.sun_path)) {
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f("socke=
t path \"%s\" too long", path);
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>     > ++=C2=A0 =C2=A0 =C2=A0 }
>     > ++=C2=A0 =C2=A0 =C2=A0 /* Support for abstract socket */
>     > ++=C2=A0 =C2=A0 =C2=A0 if (addr.sun_path[0] =3D=3D '@')
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr.sun_path[=
0] =3D 0;
>     > ++=C2=A0 =C2=A0 =C2=A0 if ((fd =3D socket(PF_UNIX, SOCK_DGRAM, 0)=
) =3D=3D -1) {
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f("socke=
t \"%s\": %s", path, strerror(errno));
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>     > ++=C2=A0 =C2=A0 =C2=A0 }
>     > ++=C2=A0 =C2=A0 =C2=A0 if (connect(fd, &addr, sizeof(addr)) !=3D =
0) {
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f("socke=
t \"%s\" connect: %s", path,
>     strerror(errno));
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>     > ++=C2=A0 =C2=A0 =C2=A0 }
>     > ++=C2=A0 =C2=A0 =C2=A0 if (write(fd, s, strlen(s)) !=3D (ssize_t)=
strlen(s)) {
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f("socke=
t \"%s\" write: %s", path,
>     strerror(errno));
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;
>     > ++=C2=A0 =C2=A0 =C2=A0 }
>     > ++=C2=A0 =C2=A0 =C2=A0 debug_f("socket \"%s\" notified %s", path,=
 s);
>     > ++ out:
>     > ++=C2=A0 =C2=A0 =C2=A0 if (fd !=3D -1)
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fd);
>     > ++=C2=A0 =C2=A0 =C2=A0 free(s);
>     > ++}
>     > ++
>     > ++void
>     > ++ssh_systemd_notify_ready(void)
>     > ++{
>     > ++=C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify("READY=3D1");
>     > ++}
>     > ++
>     > ++void
>     > ++ssh_systemd_notify_reload(void)
>     > ++{
>     > ++=C2=A0 =C2=A0 =C2=A0 struct timespec now;
>     > ++
>     > ++=C2=A0 =C2=A0 =C2=A0 monotime_ts(&now);
>     > ++=C2=A0 =C2=A0 =C2=A0 if (now.tv_sec < 0 || now.tv_nsec < 0) {
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_f("monot=
ime returned negative value");
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ssh_systemd_no=
tify("RELOADING=3D1");
>     > ++=C2=A0 =C2=A0 =C2=A0 } else {
>     > ++ ssh_systemd_notify("RELOADING=3D1\nMONOTONIC_USEC=3D%llu",
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
((uint64_t)now.tv_sec * 1000000ULL) +
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
((uint64_t)now.tv_nsec / 1000ULL));
>     > ++=C2=A0 =C2=A0 =C2=A0 }
>     > ++}
>     > ++#endif /* SYSTEMD_NOTIFY */
>     > ++
>     > ++#endif /* WITH_SELINUX || LINUX_OOM_ADJUST || SYSTEMD_NOTIFY */
>     > +diff --git a/openbsd-compat/port-linux.h
>     b/openbsd-compat/port-linux.h
>     > +index 3c22a854d..14064f87d 100644
>     > +--- a/openbsd-compat/port-linux.h
>     > ++++ b/openbsd-compat/port-linux.h
>     > +@@ -30,4 +30,9 @@ void oom_adjust_restore(void);
>     > + void oom_adjust_setup(void);
>     > + #endif
>     > +
>     > ++#ifdef SYSTEMD_NOTIFY
>     > ++void ssh_systemd_notify_ready(void);
>     > ++void ssh_systemd_notify_reload(void);
>     > ++#endif
>     > ++
>     > + #endif /* ! _PORT_LINUX_H */
>     > +diff --git a/platform.c b/platform.c
>     > +index 4fe8744ee..9cf818153 100644
>     > +--- a/platform.c
>     > ++++ b/platform.c
>     > +@@ -44,6 +44,14 @@ platform_pre_listen(void)
>     > + #endif
>     > + }
>     > +
>     > ++void
>     > ++platform_post_listen(void)
>     > ++{
>     > ++#ifdef SYSTEMD_NOTIFY
>     > ++=C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify_ready();
>     > ++#endif
>     > ++}
>     > ++
>     > + void
>     > + platform_pre_fork(void)
>     > + {
>     > +@@ -55,6 +63,9 @@ platform_pre_fork(void)
>     > + void
>     > + platform_pre_restart(void)
>     > + {
>     > ++#ifdef SYSTEMD_NOTIFY
>     > ++=C2=A0 =C2=A0 =C2=A0 ssh_systemd_notify_reload();
>     > ++#endif
>     > + #ifdef LINUX_OOM_ADJUST
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0oom_adjust_restore();
>     > + #endif
>     > +diff --git a/platform.h b/platform.h
>     > +index 7fef8c983..5dec23276 100644
>     > +--- a/platform.h
>     > ++++ b/platform.h
>     > +@@ -21,6 +21,7 @@
>     > + void platform_pre_listen(void);
>     > + void platform_pre_fork(void);
>     > + void platform_pre_restart(void);
>     > ++void platform_post_listen(void);
>     > + void platform_post_fork_parent(pid_t child_pid);
>     > + void platform_post_fork_child(void);
>     > + int=C2=A0 platform_privileged_uidswap(void);
>     > +diff --git a/sshd.c b/sshd.c
>     > +index b4f2b9742..865331b46 100644
>     > +--- a/sshd.c
>     > ++++ b/sshd.c
>     > +@@ -2077,6 +2077,8 @@ main(int ac, char **av)
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_signa=
l(SIGTERM, sigterm_handler);
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_signa=
l(SIGQUIT, sigterm_handler);
>     > +
>     > ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 platform_post_=
listen();
>     > ++
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Write =
out the pid file after the sigterm handler
>     > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * is set=
up and the listen sockets are bound
>     > +--
>     > +2.45.2
>     > +
>     > diff --git
>     a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-option=
al-support-for-systemd-sd_notify.patch
>     b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-option=
al-support-for-systemd-sd_notify.patch
>     > deleted file mode 100644
>     > index f079d936a4..0000000000
>     > ---
>     a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-option=
al-support-for-systemd-sd_notify.patch
>     > +++ /dev/null
>     > @@ -1,96 +0,0 @@
>     > -From b02ef7621758f06eb686ef4f620636dbad086eda Mon Sep 17
>     00:00:00 2001
>     > -From: Matt Jolly <Matt.Jolly@footclan.ninja>
>     > -Date: Thu, 2 Feb 2023 21:05:40 +1100
>     > -Subject: [PATCH] systemd: Add optional support for systemd
>     `sd_notify`
>     > -
>     > -This is a rebase of Dennis Lamm's <expeditioneer@gentoo.org>
>     > -patch based on Jakub Jelen's <jjelen@redhat.com> original patch
>     > -
>     > -Upstream-Status: Submitted
>     [https://github.com/openssh/openssh-portable/pull/375/commits/be187=
435911cde6cc3cef6982a508261074f1e56
>     <https://urldefense.com/v3/__https://github.com/openssh/openssh-por=
table/pull/375/commits/be187435911cde6cc3cef6982a508261074f1e56__;!!AjveY=
dw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7=
AfK0o33vSBIxkkcgx8BfwiLKAT$>]
>     > -
>     > -Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
>     > ----
>     > - configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     | 24 ++++++++++++++++++++++++
>     > - sshd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 13 +++++++++++++
>     > - 2 files changed, 37 insertions(+)
>     > -
>     > -diff --git a/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     b/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     > -index 82e8bb7..d1145d3 100644
>     > ---- a/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     > -+++ b/configure.ac
>     <https://urldefense.com/v3/__http://configure.ac__;!!AjveYdw8EvQ!dy=
DMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vS=
BIxkkcgx8BZPaE51L$>
>     > -@@ -4870,6 +4870,29 @@ AC_SUBST([GSSLIBS])
>     > - AC_SUBST([K5LIBS])
>     > - AC_SUBST([CHANNELLIBS])
>     > -
>     > -+# Check whether user wants systemd support
>     > -+SYSTEMD_MSG=3D"no"
>     > -+AC_ARG_WITH(systemd,
>     > -+=C2=A0 =C2=A0 =C2=A0 [=C2=A0 --with-systemd=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Enable systemd support],
>     > -+=C2=A0 =C2=A0 =C2=A0 [ if test "x$withval" !=3D "xno" ; then
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_PATH_TOOL([=
PKGCONFIG], [pkg-config], [no])
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test "$PKGC=
ONFIG" !=3D "no"; then
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 AC_MSG_CHECKING([for libsystemd])
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if $PKGCONFIG --exists libsystemd; then
>     > -+ SYSTEMD_CFLAGS=3D`$PKGCONFIG --cflags libsystemd`
>     > -+ SYSTEMD_LIBS=3D`$PKGCONFIG --libs libsystemd`
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPPFLAGS=3D"$CPPFLAGS $SYSTEMD_=
CFLAGS"
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SSHDLIBS=3D"$SSHDLIBS $SYSTEMD_=
LIBS"
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([yes])
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_DEFINE(HAVE_SYSTEMD, 1,
>     [Define if you want systemd support.])
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SYSTEMD_MSG=3D"yes"
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 else
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([no])
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 fi
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     > -+=C2=A0 =C2=A0 =C2=A0 fi ]
>     > -+)
>     > -+
>     > - # Looking for programs, paths and files
>     > -
>     > - PRIVSEP_PATH=3D/var/empty
>     > -@@ -5688,6 +5711,7 @@ echo "=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libldns support:
>     $LDNS_MSG"
>     > - echo "=C2=A0 Solaris process contract support: $SPC_MSG"
>     > - echo "=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Solaris project =
support: $SP_MSG"
>     > - echo "=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Solaris privilege suppo=
rt: $SPP_MSG"
>     > -+echo "=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0systemd support: $SYSTEMD_MSG"
>     > - echo "=C2=A0 =C2=A0 =C2=A0 =C2=A0IP address in \$DISPLAY hack: =
$DISPLAY_HACK_MSG"
>     > - echo "=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Translate v4 in =
v6 hack: $IPV4_IN6_HACK_MSG"
>     > - echo "=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 BSD Auth support: $BSD_AUTH_MSG"
>     > -diff --git a/sshd.c b/sshd.c
>     > -index b4f2b97..6820a41 100644
>     > ---- a/sshd.c
>     > -+++ b/sshd.c
>     > -@@ -88,6 +88,10 @@
>     > - #include <prot.h>
>     > - #endif
>     > -
>     > -+#ifdef HAVE_SYSTEMD
>     > -+#include <systemd/sd-daemon.h>
>     > -+#endif
>     > -+
>     > - #include "xmalloc.h"
>     > - #include "ssh.h"
>     > - #include "ssh2.h"
>     > -@@ -308,6 +312,10 @@ static void
>     > - sighup_restart(void)
>     > - {
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0logit("Received SIGHUP; restarting.")=
;
>     > -+#ifdef HAVE_SYSTEMD
>     > -+=C2=A0 =C2=A0 =C2=A0 /* Signal systemd that we are reloading */
>     > -+=C2=A0 =C2=A0 =C2=A0 sd_notify(0, "RELOADING=3D1");
>     > -+#endif
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (options.pid_file !=3D NULL)
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(op=
tions.pid_file);
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_pre_restart();
>     > -@@ -2093,6 +2101,11 @@ main(int ac, char **av)
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     > -
>     > -+#ifdef HAVE_SYSTEMD
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Signal syst=
emd that we are ready to accept
>     connections */
>     > -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sd_notify(0, "=
READY=3D1");
>     > -+#endif
>     > -+
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Accept=
 a connection and return in a forked
>     child */
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0server_ac=
cept_loop(&sock_in, &sock_out,
>     > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&newsock, config_s);
>     > diff --git
>     a/meta/recipes-connectivity/openssh/openssh/sshd.service
>     b/meta/recipes-connectivity/openssh/openssh/sshd.service
>     > index 3e570ab1e5..c71fff1cc1 100644
>     > --- a/meta/recipes-connectivity/openssh/openssh/sshd.service
>     > +++ b/meta/recipes-connectivity/openssh/openssh/sshd.service
>     > @@ -5,11 +5,11 @@ After=3Dsshdgenkeys.service
>     >=C2=A0 After=3Dnss-user-lookup.target
>     <https://urldefense.com/v3/__http://nss-user-lookup.target__;!!Ajve=
Ydw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX=
7AfK0o33vSBIxkkcgx8BfffE4_Q$>
>     >
>     >=C2=A0 [Service]
>     > +Type=3Dnotify-reload
>     >=C2=A0 Environment=3D"SSHD_OPTS=3D"
>     >=C2=A0 EnvironmentFile=3D-/etc/default/ssh
>     >=C2=A0 ExecStartPre=3D@BASE_BINDIR@/mkdir -p /var/run/sshd
>     >=C2=A0 ExecStart=3D-@SBINDIR@/sshd -D $SSHD_OPTS
>     > -ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID
>     >=C2=A0 KillMode=3Dprocess
>     >=C2=A0 Restart=3Don-failure
>     >=C2=A0 RestartSec=3D42s
>     > diff --git
>     a/meta/recipes-connectivity/openssh/openssh/sshd@.service
>     b/meta/recipes-connectivity/openssh/openssh/sshd@.service
>     > index 9d9965e624..dcfec8f054 100644
>     > --- a/meta/recipes-connectivity/openssh/openssh/sshd@.service
>     > +++ b/meta/recipes-connectivity/openssh/openssh/sshd@.service
>     > @@ -3,6 +3,7 @@ Description=3DOpenSSH Per-Connection Daemon
>     >=C2=A0 After=3Dsshdgenkeys.service
>     >
>     >=C2=A0 [Service]
>     > +Type=3Dnotify-reload
>     >=C2=A0 Environment=3D"SSHD_OPTS=3D"
>     >=C2=A0 EnvironmentFile=3D-/etc/default/ssh
>     >=C2=A0 ExecStart=3D-@SBINDIR@/sshd -i $SSHD_OPTS
>     > diff --git a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
>     <https://urldefense.com/v3/__http://openssh_9.7p1.bb__;!!AjveYdw8Ev=
Q!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o=
33vSBIxkkcgx8Bamvaj4m$>
>     b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
>     <https://urldefense.com/v3/__http://openssh_9.7p1.bb__;!!AjveYdw8Ev=
Q!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o=
33vSBIxkkcgx8Bamvaj4m$>
>     > index 4f20616295..4680d12be5 100644
>     > --- a/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
>     <https://urldefense.com/v3/__http://openssh_9.7p1.bb__;!!AjveYdw8Ev=
Q!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o=
33vSBIxkkcgx8Bamvaj4m$>
>     > +++ b/meta/recipes-connectivity/openssh/openssh_9.7p1.bb
>     <https://urldefense.com/v3/__http://openssh_9.7p1.bb__;!!AjveYdw8Ev=
Q!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o=
33vSBIxkkcgx8Bamvaj4m$>
>     > @@ -24,7 +24,7 @@ SRC_URI =3D
>     "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.=
tar
>     <https://urldefense.com/v3/__http://ftp.openbsd.org/pub/OpenBSD/Ope=
nSSH/portable/openssh-$*7BPV*7D.tar__;JSU!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OI=
NCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZvn3Qu=
C$>
>     > file://run-ptest \
>     > file://sshd_check_keys \
>     >
>     file://0001-regress-banner.sh-log-input-and-output-files-on-erro.pa=
tch
>     \
>     > -
>     file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patc=
h \
>     > + file://0001-notify-systemd-on-listen-and-reload.patch \
>     > file://CVE-2024-6387.patch \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     >=C2=A0 SRC_URI[sha256sum] =3D
>     "490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc5660f773ffd"
>     > @@ -52,7 +52,6 @@ SYSTEMD_PACKAGES =3D "${PN}-sshd"
>     >=C2=A0 SYSTEMD_SERVICE:${PN}-sshd =3D
>     "${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode','s=
shd.socket',
>     '', d)}
>     ${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','s=
shd.service',
>     '', d)}"
>     >
>     >=C2=A0 inherit autotools-brokensep ptest pkgconfig
>     > -DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
>     'systemd', '', d)}"
>     >
>     >=C2=A0 # systemd-sshd-socket-mode means installing sshd.socket
>     >=C2=A0 # and systemd-sshd-service-mode corresponding to sshd.servi=
ce
>     > @@ -78,7 +77,6 @@ EXTRA_OECONF =3D
>     "'LOGIN_PROGRAM=3D${base_bindir}/login' \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --s=
ysconfdir=3D${sysconfdir}/ssh \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --w=
ith-xauth=3D${bindir}/xauth \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --d=
isable-strip \
>     > - ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
>     '--with-systemd', '--without-systemd', d)} \
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>     >
>     >=C2=A0 # musl doesn't implement wtmp/utmp and logwtmp
>     > --
>     > 2.45.2
>     >
>     >
>     >
>     >
>
>
>
> --=20
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202144):https://lists.openembedded.org/g/openembedd=
ed-core/message/202144
> Mute This Topic:https://lists.openembedded.org/mt/107252588/7304865
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
Qi.Chen@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--------------Pxf8tph81NE98HgK2Imn5nbA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 46H4eHar016568

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">I think the problem might be related t=
o
      the &quot;+Type=3Dnotify-reload&quot; change in <a class=3D"moz-txt=
-link-abbreviated" href=3D"mailto:sshd@.service">sshd@.service</a>. It's =
in inetd
      mode so the upstream change about SYSTEMD_NOTIFY should have
      nothing to do with it.<br>
    </div>
    <div class=3D"moz-cite-prefix">I also doubt if the following line
      should be removed from sshd.service.<br>
      <pre class=3D"moz-quote-pre" wrap=3D"">-ExecReload=3D@BASE_BINDIR@/=
kill -HUP $MAINPID</pre>
    </div>
    <div class=3D"moz-cite-prefix">Regards,</div>
    <div class=3D"moz-cite-prefix">Qi<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 7/17/24 16:46, Jose Quaresma wrote:=
<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANPvuRnPcYdSTjM3Kc8j1RfBw8LWRx=
j_quabmMZr_aOpUS8xRQ@mail.gmail.com">
     =20
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" moz-do-not-send=3D"true" class=3D"moz-txt-link-=
freetext">raj.khem@gmail.com</a>&gt;
            escreveu (quarta, 17/07/2024 =C3=A0(s) 07:38):<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">actually I narrowed down
            my problem of disconnection to this patch in<br>
            the series. Earlier I thought it might be related to the
            openssh<br>
            upgrade patch<br>
            but reverting that still causes the problem but this patch
            when<br>
            reverted, the problem is gone.<br>
          </blockquote>
          <div><br>
          </div>
          <div>I will jump on this today and try to find the root cause.<=
/div>
          <div>The ptest goes well in my local tests but I didn't do
            anything with testimage.<br>
            I'll see if the testimage picks up something.<br>
          </div>
          <div><br>
          </div>
          <div>Thanks&nbsp;for the feedback.<br>
          </div>
          <div><br>
          </div>
          <div>Jose</div>
          <div>&nbsp;</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <br>
            On Tue, Jul 16, 2024 at 7:17=E2=80=AFAM Jose Quaresma via<br>
            <a href=3D"https://urldefense.com/v3/__http://lists.openembed=
ded.org__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2e=
u2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BUuo8VXD$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">lists.openembedded.org</a><br>
            &lt;quaresma.jose=3D<a href=3D"mailto:gmail.com@lists.openemb=
edded.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">gmail.com@lists.openembedded.org</a>&gt;
            wrote:<br>
            &gt;<br>
            &gt; Still side effects of the XZ backdoor. The systemd
            sd-notify patch<br>
            &gt; was rejected [1] upstream and was chosen a standalone
            implementation<br>
            &gt; that does not depend on libsystemd [2].<br>
            &gt;<br>
            &gt; Racional [1]:<br>
            &gt;<br>
            &gt; License incompatibility and library bloatedness were
            the reasons.<br>
            &gt; Given recent events we're never going to take a
            dependency on libsystemd,<br>
            &gt; though we might implement the notification protocol
            ourselves if it isn't too much work.<br>
            &gt;<br>
            &gt; [1] <a href=3D"https://urldefense.com/v3/__https://githu=
b.com/openssh/openssh-portable/pull/375*issuecomment-2027749729__;Iw!!Ajv=
eYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPh=
X7AfK0o33vSBIxkkcgx8BXB1d9mL$" rel=3D"noreferrer" target=3D"_blank" moz-d=
o-not-send=3D"true">https://github.com/openssh/openssh-portable/pull/375#=
issuecomment-2027749729</a><br>
            &gt; [2] <a href=3D"https://urldefense.com/v3/__https://githu=
b.com/openssh/openssh-portable/commit/08f579231cd38a1c657aaa6ddeb8ab57a1f=
d4f5c__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2=
WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8Bcg4kaOm$" rel=3D"noreferrer" target=3D"=
_blank" moz-do-not-send=3D"true">https://github.com/openssh/openssh-porta=
ble/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5c</a><br>
            &gt;<br>
            &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.=
quaresma@foundries.io" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">jose.quaresma@foundries.io</a>&gt;<br>
            &gt; ---<br>
            &gt;<br>
            &gt; v4:<br>
            &gt;&nbsp; - split update of Upstream-Status in new patches i=
n
            the serie<br>
            &gt;<br>
            &gt; v5:<br>
            &gt;&nbsp; - use the upstream solution<br>
            &gt;<br>
            &gt;&nbsp; ...-notify-systemd-on-listen-and-reload.patch | 22=
5
            ++++++++++++++++++<br>
            &gt;&nbsp; ...tional-support-for-systemd-sd_notify.patch |&nb=
sp; 96
            --------<br>
            &gt;&nbsp; .../openssh/openssh/sshd.service&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; &nbsp;2 +-<br>
            &gt;&nbsp; .../openssh/openssh/sshd@.service&nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;1 +<br>
            &gt;&nbsp; .../openssh/<a href=3D"https://urldefense.com/v3/_=
_http://openssh_9.7p1.bb__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re2=
7vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8Bamvaj4m$" rel=3D"nor=
eferrer" target=3D"_blank" moz-do-not-send=3D"true">openssh_9.7p1.bb</a>&=
nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbs=
p; &nbsp;4 +-<br>
            &gt;&nbsp; 5 files changed, 228 insertions(+), 100 deletions(=
-)<br>
            &gt;&nbsp; create mode 100644
meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen-a=
nd-reload.patch<br>
            &gt;&nbsp; delete mode 100644
meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-suppo=
rt-for-systemd-sd_notify.patch<br>
            &gt;<br>
            &gt; diff --git
a/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch
b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch<br>
            &gt; new file mode 100644<br>
            &gt; index 0000000000..4925c969fe<br>
            &gt; --- /dev/null<br>
            &gt; +++
b/meta/recipes-connectivity/openssh/openssh/0001-notify-systemd-on-listen=
-and-reload.patch<br>
            &gt; @@ -0,0 +1,225 @@<br>
            &gt; +From fc73e2405a8ca928465580b74a4d76112919367b Mon Sep
            17 00:00:00 2001<br>
            &gt; +From: Damien Miller &lt;<a href=3D"mailto:djm@mindrot.o=
rg" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-free=
text">djm@mindrot.org</a>&gt;<br>
            &gt; +Date: Wed, 3 Apr 2024 14:40:32 +1100<br>
            &gt; +Subject: [PATCH] notify systemd on listen and reload<br=
>
            &gt; +<br>
            &gt; +Standalone implementation that does not depend on
            libsystemd.<br>
            &gt; +With assistance from Luca Boccassi, and
            feedback/testing from Colin<br>
            &gt; +Watson. bz2641<br>
            &gt; +<br>
            &gt; +Upstream-Status: Backport [<a href=3D"https://urldefens=
e.com/v3/__https://github.com/openssh/openssh-portable/commit/08f579231cd=
38a1c657aaa6ddeb8ab57a1fd4f5c__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_J=
x8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8Bcg4kaOm$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://github.co=
m/openssh/openssh-portable/commit/08f579231cd38a1c657aaa6ddeb8ab57a1fd4f5=
c</a>]<br>
            &gt; +<br>
            &gt; +Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose=
.quaresma@foundries.io" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">jose.quaresma@foundries.io</a>&gt;<br>
            &gt; +---<br>
            &gt; + <a href=3D"https://urldefense.com/v3/__http://configur=
e.ac__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2W=
GexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer" target=3D"_=
blank" moz-do-not-send=3D"true">configure.ac</a>&nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 1 +<=
br>
            &gt; + openbsd-compat/port-linux.c | 97
            ++++++++++++++++++++++++++++++++++++-<br>
            &gt; + openbsd-compat/port-linux.h |&nbsp; 5 ++<br>
            &gt; + platform.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; | 11 +++++<br>
            &gt; + platform.h&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; |&nbsp; 1 +<br>
            &gt; + sshd.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 2 +<br>
            &gt; + 6 files changed, 115 insertions(+), 2 deletions(-)<br>
            &gt; +<br>
            &gt; +diff --git a/<a href=3D"https://urldefense.com/v3/__htt=
p://configure.ac__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUD=
wMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer"=
 target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a>
            b/<a href=3D"https://urldefense.com/v3/__http://configure.ac_=
_;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbq=
UYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">configure.ac</a><br>
            &gt; +index 82e8bb7c1..854f92b5b 100644<br>
            &gt; +--- a/<a href=3D"https://urldefense.com/v3/__http://con=
figure.ac__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz=
2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer" target=
=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
            &gt; ++++ b/<a href=3D"https://urldefense.com/v3/__http://con=
figure.ac__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz=
2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer" target=
=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
            &gt; +@@ -915,6 +915,7 @@ int main(void) { if
            (NSVersionOfRunTimeLibrary(&quot;System&quot;) &gt;=3D (60 &l=
t;&lt; 16))<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;AC_DEFINE([_PATH_BTMP], [&qu=
ot;/var/log/btmp&quot;], [log
            for bad login attempts])<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;AC_DEFINE([USE_BTMP])<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;AC_DEFINE([LINUX_OOM_ADJUST]=
, [1], [Adjust
            Linux out-of-memory killer])<br>
            &gt; ++&nbsp; &nbsp; &nbsp; AC_DEFINE([SYSTEMD_NOTIFY], [1], =
[Have sshd
            notify systemd on start/reload])<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;inet6_default_4in6=3Dyes<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;case `uname -r` in<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;1.*|2.0.*)<br>
            &gt; +diff --git a/openbsd-compat/port-linux.c
            b/openbsd-compat/port-linux.c<br>
            &gt; +index 0457e28d0..df7290246 100644<br>
            &gt; +--- a/openbsd-compat/port-linux.c<br>
            &gt; ++++ b/openbsd-compat/port-linux.c<br>
            &gt; +@@ -21,16 +21,23 @@<br>
            &gt; +<br>
            &gt; + #include &quot;includes.h&quot;<br>
            &gt; +<br>
            &gt; +-#if defined(WITH_SELINUX) ||
            defined(LINUX_OOM_ADJUST)<br>
            &gt; ++#if defined(WITH_SELINUX) ||
            defined(LINUX_OOM_ADJUST) || \<br>
            &gt; ++&nbsp; &nbsp; defined(SYSTEMD_NOTIFY)<br>
            &gt; ++#include &lt;sys/socket.h&gt;<br>
            &gt; ++#include &lt;sys/un.h&gt;<br>
            &gt; ++<br>
            &gt; + #include &lt;errno.h&gt;<br>
            &gt; ++#include &lt;inttypes.h&gt;<br>
            &gt; + #include &lt;stdarg.h&gt;<br>
            &gt; + #include &lt;string.h&gt;<br>
            &gt; + #include &lt;stdio.h&gt;<br>
            &gt; + #include &lt;stdlib.h&gt;<br>
            &gt; ++#include &lt;time.h&gt;<br>
            &gt; +<br>
            &gt; + #include &quot;log.h&quot;<br>
            &gt; + #include &quot;xmalloc.h&quot;<br>
            &gt; + #include &quot;port-linux.h&quot;<br>
            &gt; ++#include &quot;misc.h&quot;<br>
            &gt; +<br>
            &gt; + #ifdef WITH_SELINUX<br>
            &gt; + #include &lt;selinux/selinux.h&gt;<br>
            &gt; +@@ -310,4 +317,90 @@ oom_adjust_restore(void)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;return;<br>
            &gt; + }<br>
            &gt; + #endif /* LINUX_OOM_ADJUST */<br>
            &gt; +-#endif /* WITH_SELINUX || LINUX_OOM_ADJUST */<br>
            &gt; ++<br>
            &gt; ++#ifdef SYSTEMD_NOTIFY<br>
            &gt; ++<br>
            &gt; ++static void ssh_systemd_notify(const char *, ...)<br>
            &gt; ++&nbsp; &nbsp; __attribute__((__format__ (printf, 1, 2)=
))
            __attribute__((__nonnull__ (1)));<br>
            &gt; ++<br>
            &gt; ++static void<br>
            &gt; ++ssh_systemd_notify(const char *fmt, ...)<br>
            &gt; ++{<br>
            &gt; ++&nbsp; &nbsp; &nbsp; char *s =3D NULL;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; const char *path;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; struct stat sb;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; struct sockaddr_un addr;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; int fd =3D -1;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; va_list ap;<br>
            &gt; ++<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if ((path =3D getenv(&quot;NOTIFY=
_SOCKET&quot;)) =3D=3D NULL ||
            strlen(path) =3D=3D 0)<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; retur=
n;<br>
            &gt; ++<br>
            &gt; ++&nbsp; &nbsp; &nbsp; va_start(ap, fmt);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; xvasprintf(&amp;s, fmt, ap);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; va_end(ap);<br>
            &gt; ++<br>
            &gt; ++&nbsp; &nbsp; &nbsp; /* Only AF_UNIX is supported, wit=
h path or
            abstract sockets */<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if (path[0] !=3D '/' &amp;&amp; p=
ath[0] !=3D '@') {<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error=
_f(&quot;socket \&quot;%s\&quot; is not
            compatible with AF_UNIX&quot;, path);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto =
out;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; }<br>
            &gt; ++<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if (path[0] =3D=3D '/' &amp;&amp;=
 stat(path,
            &amp;sb) !=3D 0) {<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error=
_f(&quot;socket \&quot;%s\&quot; stat: %s&quot;, path,
            strerror(errno));<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto =
out;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; }<br>
            &gt; ++<br>
            &gt; ++&nbsp; &nbsp; &nbsp; memset(&amp;addr, 0, sizeof(addr)=
);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; addr.sun_family =3D AF_UNIX;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if (strlcpy(addr.sun_path, path,<=
br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sizeof(addr.sun_pat=
h)) &gt;=3D
            sizeof(addr.sun_path)) {<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error=
_f(&quot;socket path \&quot;%s\&quot; too long&quot;,
            path);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto =
out;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; }<br>
            &gt; ++&nbsp; &nbsp; &nbsp; /* Support for abstract socket */=
<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if (addr.sun_path[0] =3D=3D '@')<=
br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; addr.=
sun_path[0] =3D 0;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if ((fd =3D socket(PF_UNIX, SOCK_=
DGRAM, 0)) =3D=3D
            -1) {<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error=
_f(&quot;socket \&quot;%s\&quot;: %s&quot;, path,
            strerror(errno));<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto =
out;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; }<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if (connect(fd, &amp;addr, sizeof=
(addr)) !=3D 0)
            {<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error=
_f(&quot;socket \&quot;%s\&quot; connect: %s&quot;,
            path, strerror(errno));<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto =
out;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; }<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if (write(fd, s, strlen(s)) !=3D
            (ssize_t)strlen(s)) {<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error=
_f(&quot;socket \&quot;%s\&quot; write: %s&quot;,
            path, strerror(errno));<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto =
out;<br>
            &gt; ++&nbsp; &nbsp; &nbsp; }<br>
            &gt; ++&nbsp; &nbsp; &nbsp; debug_f(&quot;socket \&quot;%s\&q=
uot; notified %s&quot;, path, s);<br>
            &gt; ++ out:<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if (fd !=3D -1)<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; close=
(fd);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; free(s);<br>
            &gt; ++}<br>
            &gt; ++<br>
            &gt; ++void<br>
            &gt; ++ssh_systemd_notify_ready(void)<br>
            &gt; ++{<br>
            &gt; ++&nbsp; &nbsp; &nbsp; ssh_systemd_notify(&quot;READY=3D=
1&quot;);<br>
            &gt; ++}<br>
            &gt; ++<br>
            &gt; ++void<br>
            &gt; ++ssh_systemd_notify_reload(void)<br>
            &gt; ++{<br>
            &gt; ++&nbsp; &nbsp; &nbsp; struct timespec now;<br>
            &gt; ++<br>
            &gt; ++&nbsp; &nbsp; &nbsp; monotime_ts(&amp;now);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; if (now.tv_sec &lt; 0 || now.tv_n=
sec &lt; 0) {<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error=
_f(&quot;monotime returned negative
            value&quot;);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ssh_s=
ystemd_notify(&quot;RELOADING=3D1&quot;);<br>
            &gt; ++&nbsp; &nbsp; &nbsp; } else {<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            ssh_systemd_notify(&quot;RELOADING=3D1\nMONOTONIC_USEC=3D%llu=
&quot;,<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; ((uint64_t)now.tv_sec * 1000000ULL)
            +<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; ((uint64_t)now.tv_nsec / 1000ULL));<br>
            &gt; ++&nbsp; &nbsp; &nbsp; }<br>
            &gt; ++}<br>
            &gt; ++#endif /* SYSTEMD_NOTIFY */<br>
            &gt; ++<br>
            &gt; ++#endif /* WITH_SELINUX || LINUX_OOM_ADJUST ||
            SYSTEMD_NOTIFY */<br>
            &gt; +diff --git a/openbsd-compat/port-linux.h
            b/openbsd-compat/port-linux.h<br>
            &gt; +index 3c22a854d..14064f87d 100644<br>
            &gt; +--- a/openbsd-compat/port-linux.h<br>
            &gt; ++++ b/openbsd-compat/port-linux.h<br>
            &gt; +@@ -30,4 +30,9 @@ void oom_adjust_restore(void);<br>
            &gt; + void oom_adjust_setup(void);<br>
            &gt; + #endif<br>
            &gt; +<br>
            &gt; ++#ifdef SYSTEMD_NOTIFY<br>
            &gt; ++void ssh_systemd_notify_ready(void);<br>
            &gt; ++void ssh_systemd_notify_reload(void);<br>
            &gt; ++#endif<br>
            &gt; ++<br>
            &gt; + #endif /* ! _PORT_LINUX_H */<br>
            &gt; +diff --git a/platform.c b/platform.c<br>
            &gt; +index 4fe8744ee..9cf818153 100644<br>
            &gt; +--- a/platform.c<br>
            &gt; ++++ b/platform.c<br>
            &gt; +@@ -44,6 +44,14 @@ platform_pre_listen(void)<br>
            &gt; + #endif<br>
            &gt; + }<br>
            &gt; +<br>
            &gt; ++void<br>
            &gt; ++platform_post_listen(void)<br>
            &gt; ++{<br>
            &gt; ++#ifdef SYSTEMD_NOTIFY<br>
            &gt; ++&nbsp; &nbsp; &nbsp; ssh_systemd_notify_ready();<br>
            &gt; ++#endif<br>
            &gt; ++}<br>
            &gt; ++<br>
            &gt; + void<br>
            &gt; + platform_pre_fork(void)<br>
            &gt; + {<br>
            &gt; +@@ -55,6 +63,9 @@ platform_pre_fork(void)<br>
            &gt; + void<br>
            &gt; + platform_pre_restart(void)<br>
            &gt; + {<br>
            &gt; ++#ifdef SYSTEMD_NOTIFY<br>
            &gt; ++&nbsp; &nbsp; &nbsp; ssh_systemd_notify_reload();<br>
            &gt; ++#endif<br>
            &gt; + #ifdef LINUX_OOM_ADJUST<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp;oom_adjust_restore();<br>
            &gt; + #endif<br>
            &gt; +diff --git a/platform.h b/platform.h<br>
            &gt; +index 7fef8c983..5dec23276 100644<br>
            &gt; +--- a/platform.h<br>
            &gt; ++++ b/platform.h<br>
            &gt; +@@ -21,6 +21,7 @@<br>
            &gt; + void platform_pre_listen(void);<br>
            &gt; + void platform_pre_fork(void);<br>
            &gt; + void platform_pre_restart(void);<br>
            &gt; ++void platform_post_listen(void);<br>
            &gt; + void platform_post_fork_parent(pid_t child_pid);<br>
            &gt; + void platform_post_fork_child(void);<br>
            &gt; + int&nbsp; platform_privileged_uidswap(void);<br>
            &gt; +diff --git a/sshd.c b/sshd.c<br>
            &gt; +index b4f2b9742..865331b46 100644<br>
            &gt; +--- a/sshd.c<br>
            &gt; ++++ b/sshd.c<br>
            &gt; +@@ -2077,6 +2077,8 @@ main(int ac, char **av)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
ssh_signal(SIGTERM, sigterm_handler);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
ssh_signal(SIGQUIT, sigterm_handler);<br>
            &gt; +<br>
            &gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; platf=
orm_post_listen();<br>
            &gt; ++<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
/*<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 * Write out the pid file after the
            sigterm handler<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 * is setup and the listen sockets are
            bound<br>
            &gt; +--<br>
            &gt; +2.45.2<br>
            &gt; +<br>
            &gt; diff --git
a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch
b/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch<br>
            &gt; deleted file mode 100644<br>
            &gt; index f079d936a4..0000000000<br>
            &gt; ---
a/meta/recipes-connectivity/openssh/openssh/0001-systemd-Add-optional-sup=
port-for-systemd-sd_notify.patch<br>
            &gt; +++ /dev/null<br>
            &gt; @@ -1,96 +0,0 @@<br>
            &gt; -From b02ef7621758f06eb686ef4f620636dbad086eda Mon Sep
            17 00:00:00 2001<br>
            &gt; -From: Matt Jolly <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:Matt.Jolly@footclan.ninja">&lt;Matt.Jolly@footclan.ninja&gt;<=
/a><br>
            &gt; -Date: Thu, 2 Feb 2023 21:05:40 +1100<br>
            &gt; -Subject: [PATCH] systemd: Add optional support for
            systemd `sd_notify`<br>
            &gt; -<br>
            &gt; -This is a rebase of Dennis Lamm's &lt;<a href=3D"mailto=
:expeditioneer@gentoo.org" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">expeditioneer@gentoo.org</a>&gt;<br>
            &gt; -patch based on Jakub Jelen's &lt;<a href=3D"mailto:jjel=
en@redhat.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-tx=
t-link-freetext">jjelen@redhat.com</a>&gt;
            original patch<br>
            &gt; -<br>
            &gt; -Upstream-Status: Submitted [<a href=3D"https://urldefen=
se.com/v3/__https://github.com/openssh/openssh-portable/pull/375/commits/=
be187435911cde6cc3cef6982a508261074f1e56__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_=
OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BfwiL=
KAT$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https=
://github.com/openssh/openssh-portable/pull/375/commits/be187435911cde6cc=
3cef6982a508261074f1e56</a>]<br>
            &gt; -<br>
            &gt; -Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiang=
yu.chen@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">xiangyu.chen@windriver.com</a>&gt;<br>
            &gt; ----<br>
            &gt; - <a href=3D"https://urldefense.com/v3/__http://configur=
e.ac__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2W=
GexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer" target=3D"_=
blank" moz-do-not-send=3D"true">configure.ac</a>
            | 24 ++++++++++++++++++++++++<br>
            &gt; - sshd.c&nbsp; &nbsp; &nbsp; &nbsp;| 13 +++++++++++++<br=
>
            &gt; - 2 files changed, 37 insertions(+)<br>
            &gt; -<br>
            &gt; -diff --git a/<a href=3D"https://urldefense.com/v3/__htt=
p://configure.ac__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUD=
wMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer"=
 target=3D"_blank" moz-do-not-send=3D"true">configure.ac</a>
            b/<a href=3D"https://urldefense.com/v3/__http://configure.ac_=
_;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbq=
UYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer" target=3D"_blank=
" moz-do-not-send=3D"true">configure.ac</a><br>
            &gt; -index 82e8bb7..d1145d3 100644<br>
            &gt; ---- a/<a href=3D"https://urldefense.com/v3/__http://con=
figure.ac__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz=
2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer" target=
=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
            &gt; -+++ b/<a href=3D"https://urldefense.com/v3/__http://con=
figure.ac__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz=
2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZPaE51L$" rel=3D"noreferrer" target=
=3D"_blank" moz-do-not-send=3D"true">configure.ac</a><br>
            &gt; -@@ -4870,6 +4870,29 @@ AC_SUBST([GSSLIBS])<br>
            &gt; - AC_SUBST([K5LIBS])<br>
            &gt; - AC_SUBST([CHANNELLIBS])<br>
            &gt; -<br>
            &gt; -+# Check whether user wants systemd support<br>
            &gt; -+SYSTEMD_MSG=3D&quot;no&quot;<br>
            &gt; -+AC_ARG_WITH(systemd,<br>
            &gt; -+&nbsp; &nbsp; &nbsp; [&nbsp; --with-systemd&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; Enable systemd
            support],<br>
            &gt; -+&nbsp; &nbsp; &nbsp; [ if test &quot;x$withval&quot; !=
=3D &quot;xno&quot; ; then<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; AC_PA=
TH_TOOL([PKGCONFIG], [pkg-config],
            [no])<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if te=
st &quot;$PKGCONFIG&quot; !=3D &quot;no&quot;; then<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; AC_MSG_CHECKING([for
            libsystemd])<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; if $PKGCONFIG --exists
            libsystemd; then<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            SYSTEMD_CFLAGS=3D`$PKGCONFIG --cflags libsystemd`<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            SYSTEMD_LIBS=3D`$PKGCONFIG --libs libsystemd`<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; CPPFLAGS=3D&quot;$CPPF=
LAGS
            $SYSTEMD_CFLAGS&quot;<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SSHDLIBS=3D&quot;$SSHD=
LIBS
            $SYSTEMD_LIBS&quot;<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; AC_MSG_RESULT([yes])<b=
r>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; AC_DEFINE(HAVE_SYSTEMD=
,
            1, [Define if you want systemd support.])<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SYSTEMD_MSG=3D&quot;ye=
s&quot;<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; else<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; AC_MSG_RESULT([no])<br=
>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; fi<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fi<br=
>
            &gt; -+&nbsp; &nbsp; &nbsp; fi ]<br>
            &gt; -+)<br>
            &gt; -+<br>
            &gt; - # Looking for programs, paths and files<br>
            &gt; -<br>
            &gt; - PRIVSEP_PATH=3D/var/empty<br>
            &gt; -@@ -5688,6 +5711,7 @@ echo &quot;&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;libldns
            support: $LDNS_MSG&quot;<br>
            &gt; - echo &quot;&nbsp; Solaris process contract support: $S=
PC_MSG&quot;<br>
            &gt; - echo &quot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;So=
laris project support: $SP_MSG&quot;<br>
            &gt; - echo &quot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Solaris p=
rivilege support: $SPP_MSG&quot;<br>
            &gt; -+echo &quot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;systemd support:
            $SYSTEMD_MSG&quot;<br>
            &gt; - echo &quot;&nbsp; &nbsp; &nbsp; &nbsp;IP address in \$=
DISPLAY hack:
            $DISPLAY_HACK_MSG&quot;<br>
            &gt; - echo &quot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Tr=
anslate v4 in v6 hack:
            $IPV4_IN6_HACK_MSG&quot;<br>
            &gt; - echo &quot;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; BSD Auth support:
            $BSD_AUTH_MSG&quot;<br>
            &gt; -diff --git a/sshd.c b/sshd.c<br>
            &gt; -index b4f2b97..6820a41 100644<br>
            &gt; ---- a/sshd.c<br>
            &gt; -+++ b/sshd.c<br>
            &gt; -@@ -88,6 +88,10 @@<br>
            &gt; - #include &lt;prot.h&gt;<br>
            &gt; - #endif<br>
            &gt; -<br>
            &gt; -+#ifdef HAVE_SYSTEMD<br>
            &gt; -+#include &lt;systemd/sd-daemon.h&gt;<br>
            &gt; -+#endif<br>
            &gt; -+<br>
            &gt; - #include &quot;xmalloc.h&quot;<br>
            &gt; - #include &quot;ssh.h&quot;<br>
            &gt; - #include &quot;ssh2.h&quot;<br>
            &gt; -@@ -308,6 +312,10 @@ static void<br>
            &gt; - sighup_restart(void)<br>
            &gt; - {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp;logit(&quot;Received SIGHUP;=
 restarting.&quot;);<br>
            &gt; -+#ifdef HAVE_SYSTEMD<br>
            &gt; -+&nbsp; &nbsp; &nbsp; /* Signal systemd that we are rel=
oading */<br>
            &gt; -+&nbsp; &nbsp; &nbsp; sd_notify(0, &quot;RELOADING=3D1&=
quot;);<br>
            &gt; -+#endif<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp;if (options.pid_file !=3D NU=
LL)<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
unlink(options.pid_file);<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp;platform_pre_restart();<br>
            &gt; -@@ -2093,6 +2101,11 @@ main(int ac, char **av)<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
}<br>
            &gt; -<br>
            &gt; -+#ifdef HAVE_SYSTEMD<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Si=
gnal systemd that we are ready to
            accept connections */<br>
            &gt; -+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; sd_no=
tify(0, &quot;READY=3D1&quot;);<br>
            &gt; -+#endif<br>
            &gt; -+<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
/* Accept a connection and return in a
            forked child */<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
server_accept_loop(&amp;sock_in,
            &amp;sock_out,<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;&amp;newsock, config_s);<br>
            &gt; diff --git
            a/meta/recipes-connectivity/openssh/openssh/sshd.service
            b/meta/recipes-connectivity/openssh/openssh/sshd.service<br>
            &gt; index 3e570ab1e5..c71fff1cc1 100644<br>
            &gt; ---
            a/meta/recipes-connectivity/openssh/openssh/sshd.service<br>
            &gt; +++
            b/meta/recipes-connectivity/openssh/openssh/sshd.service<br>
            &gt; @@ -5,11 +5,11 @@ After=3Dsshdgenkeys.service<br>
            &gt;&nbsp; After=3D<a href=3D"https://urldefense.com/v3/__htt=
p://nss-user-lookup.target__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8r=
e27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BfffE4_Q$" moz-do-n=
ot-send=3D"true">nss-user-lookup.target</a><br>
            &gt;<br>
            &gt;&nbsp; [Service]<br>
            &gt; +Type=3Dnotify-reload<br>
            &gt;&nbsp; Environment=3D&quot;SSHD_OPTS=3D&quot;<br>
            &gt;&nbsp; EnvironmentFile=3D-/etc/default/ssh<br>
            &gt;&nbsp; ExecStartPre=3D@BASE_BINDIR@/mkdir -p /var/run/ssh=
d<br>
            &gt;&nbsp; ExecStart=3D-@SBINDIR@/sshd -D $SSHD_OPTS<br>
            &gt; -ExecReload=3D@BASE_BINDIR@/kill -HUP $MAINPID<br>
            &gt;&nbsp; KillMode=3Dprocess<br>
            &gt;&nbsp; Restart=3Don-failure<br>
            &gt;&nbsp; RestartSec=3D42s<br>
            &gt; diff --git
            <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:a/meta/r=
ecipes-connectivity/openssh/openssh/sshd@.service">a/meta/recipes-connect=
ivity/openssh/openssh/sshd@.service</a>
            <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:b/meta/r=
ecipes-connectivity/openssh/openssh/sshd@.service">b/meta/recipes-connect=
ivity/openssh/openssh/sshd@.service</a><br>
            &gt; index 9d9965e624..dcfec8f054 100644<br>
            &gt; ---
            <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:a/meta/r=
ecipes-connectivity/openssh/openssh/sshd@.service">a/meta/recipes-connect=
ivity/openssh/openssh/sshd@.service</a><br>
            &gt; +++
            <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:b/meta/r=
ecipes-connectivity/openssh/openssh/sshd@.service">b/meta/recipes-connect=
ivity/openssh/openssh/sshd@.service</a><br>
            &gt; @@ -3,6 +3,7 @@ Description=3DOpenSSH Per-Connection
            Daemon<br>
            &gt;&nbsp; After=3Dsshdgenkeys.service<br>
            &gt;<br>
            &gt;&nbsp; [Service]<br>
            &gt; +Type=3Dnotify-reload<br>
            &gt;&nbsp; Environment=3D&quot;SSHD_OPTS=3D&quot;<br>
            &gt;&nbsp; EnvironmentFile=3D-/etc/default/ssh<br>
            &gt;&nbsp; ExecStart=3D-@SBINDIR@/sshd -i $SSHD_OPTS<br>
            &gt; diff --git a/meta/recipes-connectivity/openssh/<a href=3D=
"https://urldefense.com/v3/__http://openssh_9.7p1.bb__;!!AjveYdw8EvQ!dyDM=
DTQfmXOSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBI=
xkkcgx8Bamvaj4m$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">openssh_9.7p1.bb</a>
            b/meta/recipes-connectivity/openssh/<a href=3D"https://urldef=
ense.com/v3/__http://openssh_9.7p1.bb__;!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OIN=
CHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8Bamvaj4m=
$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">openssh_=
9.7p1.bb</a><br>
            &gt; index 4f20616295..4680d12be5 100644<br>
            &gt; --- a/meta/recipes-connectivity/openssh/<a href=3D"https=
://urldefense.com/v3/__http://openssh_9.7p1.bb__;!!AjveYdw8EvQ!dyDMDTQfmX=
OSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx=
8Bamvaj4m$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>openssh_9.7p1.bb</a><br>
            &gt; +++ b/meta/recipes-connectivity/openssh/<a href=3D"https=
://urldefense.com/v3/__http://openssh_9.7p1.bb__;!!AjveYdw8EvQ!dyDMDTQfmX=
OSDtp_OINCHZKvb_Jx8re27vm6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx=
8Bamvaj4m$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>openssh_9.7p1.bb</a><br>
            &gt; @@ -24,7 +24,7 @@ SRC_URI =3D &quot;<a href=3D"https://u=
rldefense.com/v3/__http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/op=
enssh-$*7BPV*7D.tar__;JSU!!AjveYdw8EvQ!dyDMDTQfmXOSDtp_OINCHZKvb_Jx8re27v=
m6ogUDwMTZlQz2eu2WGexbqUYAYEPhX7AfK0o33vSBIxkkcgx8BZvn3QuC$" rel=3D"noref=
errer" target=3D"_blank" moz-do-not-send=3D"true">http://ftp.openbsd.org/=
pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar</a><br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D=
"moz-txt-link-freetext" href=3D"file://run-ptest">file://run-ptest</a> \<=
br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D=
"moz-txt-link-freetext" href=3D"file://sshd_check_keys">file://sshd_check=
_keys</a> \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-=
regress-banner.sh-log-input-and-output-files-on-erro.patch">file://0001-r=
egress-banner.sh-log-input-and-output-files-on-erro.patch</a>
            \<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-=
systemd-Add-optional-support-for-systemd-sd_notify.patch">file://0001-sys=
temd-Add-optional-support-for-systemd-sd_notify.patch</a>
            \<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;<a class=3D"moz-txt-link-freetext" href=3D"file://0001-=
notify-systemd-on-listen-and-reload.patch">file://0001-notify-systemd-on-=
listen-and-reload.patch</a> \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D=
"moz-txt-link-freetext" href=3D"file://CVE-2024-6387.patch">file://CVE-20=
24-6387.patch</a> \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;<br=
>
            &gt;&nbsp; SRC_URI[sha256sum] =3D
            &quot;490426f766d82a2763fcacd8d83ea3d70798750c7bd2aff2e57dc56=
60f773ffd&quot;<br>
            &gt; @@ -52,7 +52,6 @@ SYSTEMD_PACKAGES =3D &quot;${PN}-sshd&=
quot;<br>
            &gt;&nbsp; SYSTEMD_SERVICE:${PN}-sshd =3D
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@bb.utils.contains('P=
ACKAGECONFIG','systemd-sshd-socket-mode','sshd.socket','',d)}${@bb.utils.=
contains('PACKAGECONFIG','systemd-sshd-service-mode','sshd.service','',d)=
}">&quot;${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-socket-mode',=
'sshd.socket',
            '', d)}
${@bb.utils.contains('PACKAGECONFIG','systemd-sshd-service-mode','sshd.se=
rvice',
            '', d)}&quot;</a><br>
            &gt;<br>
            &gt;&nbsp; inherit autotools-brokensep ptest pkgconfig<br>
            &gt; -DEPENDS +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}=
">&quot;${@bb.utils.contains('DISTRO_FEATURES',
            'systemd', 'systemd', '', d)}&quot;</a><br>
            &gt;<br>
            &gt;&nbsp; # systemd-sshd-socket-mode means installing
            sshd.socket<br>
            &gt;&nbsp; # and systemd-sshd-service-mode corresponding to
            sshd.service<br>
            &gt; @@ -78,7 +77,6 @@ EXTRA_OECONF =3D
            &quot;'LOGIN_PROGRAM=3D${base_bindir}/login' \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; --sysconfdir=3D${sysconfdir}/ssh \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; --with-xauth=3D${bindir}/xauth \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; --disable-strip \<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
            '--with-systemd', '--without-systemd', d)} \<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &quot;<br>
            &gt;<br>
            &gt;&nbsp; # musl doesn't implement wtmp/utmp and logwtmp<br>
            &gt; --<br>
            &gt; 2.45.2<br>
            &gt;<br>
            &gt;<br>
            &gt; <br>
            &gt;<br>
          </blockquote>
        </div>
        <br clear=3D"all">
        <div><br>
        </div>
        <span class=3D"gmail_signature_prefix">-- </span><br>
        <div dir=3D"ltr" class=3D"gmail_signature">
          <div dir=3D"ltr">Best regards,
            <div><br>
              Jos=C3=A9 Quaresma</div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#202144): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/202144">https:/=
/lists.openembedded.org/g/openembedded-core/message/202144</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/107252588/7304865">https://lists.openembedded.org/mt=
/107252588/7304865</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:Qi.Chen@eng.windriver.com">Qi.Chen@eng.windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------Pxf8tph81NE98HgK2Imn5nbA--

