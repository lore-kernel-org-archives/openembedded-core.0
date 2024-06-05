Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2111DC25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 15:42:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18855.1717602133358120323
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jun 2024 08:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68866e7383=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4554v3fs008689
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Jun 2024 08:42:13 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f3y71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 08:42:12 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 455FgCVr012340
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Jun 2024 08:42:12 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yg35f3y6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 08:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ig+7MjqsQ4t+Ou0/z+JwGWaxyRM4XtMtPd+HQly5/9vvNz9SqiZ4pQCgGHJWQadxHx78lcvl5ORRNQTf9ECFrejdVSYHuA++gXVsSd4hwDPeZXgNo9P9sJscRYpJwOTVz/yNHIWMSZxsdmayHmYwLcSt/LVXtHY8eccMMddBI9Xz5SbD5Yl7hpXSHFq+JAOWyO/AB0PiKVJ/tT0YHq2N5017Bsl63ioYUoh7Odpqjz1+xtD8WoT3PZiKvUO9C/4mzA/s3poO8HjnXyDbjCPDWdVJEJGm/rChntIv+YxRvOTCooO7FW/HqoaXiR8bIi8HD8/Zxn/O4jFEuNzobSwDuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7DOygDFRTKOseYA6qRVafy02s9lr45wKz9Az7r//ac=;
 b=MtP8u6xZBnNT22FqFJh5bkfuSuwK3L+q8LK5vAF++GtMHtWhvi8VTGjiUW1kOO/bR9Ao9ZMSyI7ZP8OpKUCwZwsE7X3tldXPSIoKf2HIwoP8TpIRHHuEdSayCWC/IHpnjCZef20tVHXQcJQhH1p3NdtS/3tfi0RRsomCii0YWdiqxD38cTlW924YFhJGDUFY0qWeb2WKrfJPHIbnAi/DbyKtIZK9u1RfwwBBzANYKt092FbAFqCAs1zMKacuIZZumapT2B1K8luiS6EofJ9vxFvhyKJ4OA0XIvVh67j7aRyLlYWP4jy65WfooUppnw+7i4709wVelET8z8lw2HRdug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CY8PR11MB7266.namprd11.prod.outlook.com (2603:10b6:930:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Wed, 5 Jun
 2024 15:42:06 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 15:42:06 +0000
Content-Type: multipart/alternative;
 boundary="------------2WC69a523u7SywLKQQREWAb0"
Message-ID: <86ffc957-8b91-48d9-afc9-629b0e1dcaad@windriver.com>
Date: Wed, 5 Jun 2024 11:42:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH V2] gcc : upgrade to v13.3
To: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org,
        "steve@sakoman.com" <steve@sakoman.com>
References: <20240605143945.405558-1-Deepthi.Hemraj@windriver.com>
 <18618.1717599402117239778@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <18618.1717599402117239778@lists.openembedded.org>
X-ClientProxiedBy: YT4PR01CA0481.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::23) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CY8PR11MB7266:EE_
X-MS-Office365-Filtering-Correlation-Id: 4186f252-1e36-401f-51c4-08dc85760dd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q3hQdjRWbDZmamsyelg4MkFMYUFIZlAwdDQydFk3SkptOVVmaW9MQlhPbWV3?=
 =?utf-8?B?anpYb3crMXd5L3RMY2Y5M3hzNmxxbkwvSG5BYUVzRHd2UjUrQkxyMzFIejBv?=
 =?utf-8?B?WlVPMjNPR1NEZDk5OWMwQjN0Mk5UakFNbU5tRy9GTkVNZW93VlpDRDZTQ3hx?=
 =?utf-8?B?NnlIUndSWDBycy9sRGxMd1psOTdTTnloWUZRUzYyN0xwVzJkSE5CYUVWM3Nl?=
 =?utf-8?B?bFNUdWVaUm91NTV4NjFRY1hTZldLWURHSVM3dS9vam95Sis5cDlNaFJ2czBQ?=
 =?utf-8?B?UUhodnFxWHlFV25wTXpTM3lMSDlyZ3lIWUd5UTN0TFRqMlluREJzN3VXOHk5?=
 =?utf-8?B?cS8xakpDWnlPQ3d0M2dzOTA0ZDRYcFluRGhyaGRTa0kzYTZXUFZPSDI2SFBU?=
 =?utf-8?B?eVUxY0Y0T2EyY0VIaHlRRTZreGhJK0I5aXFYcWNNR3k0UXk1TzU4VkV1QlJG?=
 =?utf-8?B?Q1d4TU9iRWxLeTJMeEg4d2FmQjBlQUU0WmVLb09GNW92M01HSFplZkMwZ1Nl?=
 =?utf-8?B?QmNibGFtV3MrUng3ejhnczdZR0JLVGFQVlV3eFhYNUl4cDM4VzN3MWE1VTkw?=
 =?utf-8?B?dnkzVWpHcTZvVGQzcFdkTXdEODVvbUNpWjArYmMxRk9BYUdnUEwxRkpLTTNN?=
 =?utf-8?B?UnB3ZEdrTXNuUmp2RFkxSDdITEYrNmNTeE9FK29rWitEaHdOK3VGdVRsaU9i?=
 =?utf-8?B?N1VDeWZOa1pUN0hXODZNR3BOZ1g4MHFKQXdjNkNQYWRNeHB5aElBR0ZlQ2Mz?=
 =?utf-8?B?RkZWS3pCbmh6WmVrQS9QZmtmL2hTdGJ3R2Q5OW1nM0ZaazdwMU85MXVyeTNF?=
 =?utf-8?B?NmxYWVZ6L3BIdHJucVFMVEVmU2lBNHpDZWdLRmljdEsrRW1iN25OOTRtU3lr?=
 =?utf-8?B?OFN1UWo5eitiRmxXdHFSZno1QTlBMGRUNEpnUldYZVZUZEMzZzdYYllSTkMz?=
 =?utf-8?B?REFkRWlGd2FFTVYvaUNuSW0veEdpSmhaN244VFJxdmNoeEo5YTZvUE1BL2lI?=
 =?utf-8?B?RGlsQnZGTEZTTmZzTDhucC9IUGIraEVPSURsYUc2ZmdjYzdEaC9BWG81WTZJ?=
 =?utf-8?B?Y3JVMnk2NjhlZVhGdmFESVM0UXlSZVErcEgrUHVRN3EzdEgvdnZGT1RjaGY1?=
 =?utf-8?B?R2RpR1Y5OTlreU9wZlNSNWJyaXBzc016ZkQ3RERIRmVsREdMNkl6MUJ5Z0c0?=
 =?utf-8?B?c0lFczdHSStaMDNzRE5JUitSTGVUY1Vydy9SRjhYMHQwbS9IdjJnWHlQdlFQ?=
 =?utf-8?B?T2JudFpudHRDZEJaSEpXTW1hZW1kb1dtc3dTZTRhY0VKL0Rkc294dXlDVlMr?=
 =?utf-8?B?c0s4T2xDQ1pzRFMrSHJsZEpnS3BVdGg3MFhHVnAyNTFYbVdCVGJ1bk9CSXMv?=
 =?utf-8?B?QmJCWDRsZ0VtOFN5NFFiak96V29GcnhZVXJOK3cyeCtZcUJrQkx2UXN2TEVj?=
 =?utf-8?B?SUt2VGJjdDRwSmlKOW1QbkdQY2dUQld0U1JHd05JQkhHdjBQSFREcXQrK1RH?=
 =?utf-8?B?OGlKdE95cGFDNk5ncmlRTVhkcDJKaCtPQWJMdllRTDBhZ1Evb3B5TmFEMkd0?=
 =?utf-8?B?S3A5WHh3UWYwMHNVcmp6V3dmd25rc1pLUjA1RU1yNHdxdHg5cE12N1lTckhJ?=
 =?utf-8?B?Q0ZUZERwWlY3K0hOdHhJMVU1bnFxamZhc04wcTB0QVMxZ0ZWdVNueHUvRkx5?=
 =?utf-8?B?OXdPTzR4RW81WGxWaVQ4Qno1YmEwYTlaR0t4UTNXR2g4SGptZnFTNkJnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d3I4V3J6ekhhWWF5R3NPQ2syV1JEYmQxMEtvWXV3M2xkMjhySFlJbXBOandw?=
 =?utf-8?B?YmdrY2JMN3Q4Zk1scU5RUjZHaEcvUGRiaENsVlMyYlZRTmJXZG85V1d0UUZz?=
 =?utf-8?B?U25QTGFTM1hwU2loYit4MEpzT1hHbTV6cis5SWY0NG8zL3VoOWtZeXg3YWkr?=
 =?utf-8?B?R1Z3SW9QRlhZWStEaCt2SHBJbGtvbEt3cTIrTlZFOE1KVTJqS2sxQmgrUWZW?=
 =?utf-8?B?WCtZUzJpWFlJN3d6U1IrczYzNEJMdnRDcjMrejRpMFM5V3BMYWh2MjJlVjFG?=
 =?utf-8?B?VTVOQ0NjNnYvOUhwcE5iT1RyUEFaSSsxY2NyZ2RMUm5LYkdpM2ZRRFRZSnZW?=
 =?utf-8?B?cVhwT0QvUFlQUlVYZUNhekZLSEEwVG5nSjJVeVR5QVhrQ0FYczBySWR1b2t6?=
 =?utf-8?B?TDNZWG9QUHppQ0FGNDNRUHlxR0kxcGw2NlJLMEo4NFZkNGVzRGlzbEUxckVL?=
 =?utf-8?B?amJaa3FYeHNLSjljblBFZi92Y2tpdEIxZlk4UTdJZ3B1dkdEc2thQXZrcEh6?=
 =?utf-8?B?MEtYTFpoQlpURmwvTkJ1UCtoeWdTZVZ6aFZ4RVBocXZoSm1uR1VKUGR0bzM5?=
 =?utf-8?B?TndDYmVPT3hidjJXSFVZTEJSQ3p6WTJSUGo5dGZ2UzY5T2NOMk1DVmd3dWpN?=
 =?utf-8?B?a1RCNnJ1RGlsUHY0R040czBsMTYzTUpUc1lYeVVTREw2dFQxeDZWaHkrcnB5?=
 =?utf-8?B?S0lERHdWOFZBUjZIWDhLYlRPRnhOM21YZVN1NWp4amdyaGJyQ3V2Q2NXdEFm?=
 =?utf-8?B?WVlqSmtJL1R6MUM3a0lmb2JyaFNDYUp6aFNXK2RLbmplN0N3VTkyY2F0RzRD?=
 =?utf-8?B?ZEcrNVgxYXJHbmp0WlZhN3ZLbWlBTWJwS0dBN2JXejlWSU1YVkRkK0F3UFpP?=
 =?utf-8?B?UWR3eng0VDBvTDV4Wm1BSlpGS2pubW1zYlZ6Q2lvbUlPTmVrVFRYTktnY0p6?=
 =?utf-8?B?VUtqOHdYZDN3ckVpUjgrRXNYeU9KVG9nVUYzOVU3WE4yN3dFejZnVXFTMGdY?=
 =?utf-8?B?REZvY2tUZm5Ec2NpSUZoVUVRTGpUQ0QvV3FRNTFQTng3YnRpTHhEWGFsNVU2?=
 =?utf-8?B?N3FucEdSVEl3b292UjhGVDJYNXgvbVNwcmw1ZktVKzh6ckJkMWc1UzZic3lo?=
 =?utf-8?B?NkJWbEd3a2w0Y3hIREZKUGlEcGNaNW5HdlZROGRhSTZyN3dodHRHNkpIUCtV?=
 =?utf-8?B?L2ExY2tEcitaZEtHM3ByMzMxVEVBbStRUWVEeSt4WWlUT0FndzBCNkZ5RWZ1?=
 =?utf-8?B?cElMMzV1N3FYczZERjkweVZTd28yZzVyWlhLdStjT2c5SWF3M08zcUFDRGdn?=
 =?utf-8?B?dTBiWm1kT21od3NIM2dXN0IvNFJGRk1Kb0Noc3NyemlaeXBnRDVadmE2TVc5?=
 =?utf-8?B?S2FiWUVVampMblV4dFQvcWsySTRmTzNGT3UwME9IK0FORUhkM2hTRitqL3o5?=
 =?utf-8?B?YldNaWE5UktsSG5mSlZOcnFUL3BBUnpoL3ZBNFFKTjhzZHFmUU40SnV5YnBj?=
 =?utf-8?B?QjJ5UEEwNDJNOGx3TFVhV1JxQjd0anowenhiQXlMdVUvRXYxakNkcnpBRG1U?=
 =?utf-8?B?QWw4VCtjTlR2bStKcnhwMC9CUlBJeFBSVlhYR0VLRG1jZEJVWXdQbDRBMXRI?=
 =?utf-8?B?K0FVMVRvQlJqOFl2MzZqTWNQQ3RPS2o0N0UxRWFkb2kzdFMrLzNxWXEyODk5?=
 =?utf-8?B?ZWpjOWdFMW00Y1BVTkVXcGRsaXk0UTNOVXUzRjhKTDhycTV5RTRVeldlNnhM?=
 =?utf-8?B?NXdxVlVMUnkzZlM1NnIya2M2K0QxN0NkVHJTRGhHekV3Q1hlNTNxTWx2ODgx?=
 =?utf-8?B?ckhRcmozYUM0MGR0ZG0rMGR3bGZ2T001L2xJSXNDK0RUcVgrLzlsVnBiWWtv?=
 =?utf-8?B?bWZ0ek5EaGZ4QjNUNld1amVpRTVBS0NoVTFZRG5PNmVlcDJoaytRZm5XU3h3?=
 =?utf-8?B?VDBuaWhmSVJpZElKaEltbHpsdGJybWFMaGwyQUdlN3lONU5jeUt5VkxlRnM0?=
 =?utf-8?B?ZXpoNmVpSWpRWktjWnpmdGdoRXNocmhqUVV6dnZlbEJYaHZIaWdzaEhCb3pY?=
 =?utf-8?B?UXdueGFPYzBrTm9RZjFpb0ZMMmE1QVdQZG1ROCtjTHJqby9iM3o5L0U1RWhZ?=
 =?utf-8?B?bnFjYTlrNEw5dXdYM1J3OFFQQmxzdWRJTksybTJwTTY0eHFtelNKSERYZVNK?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4186f252-1e36-401f-51c4-08dc85760dd4
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 15:42:06.5645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sz5sHFtV1ut2zEM4OGTef+IDQOt9BcPJH/U1SHULT1uZCLz6XSMovih7Svcp77sJHvNZ7OAj5o7WJXrKsOxS/Q1OxQD3YoJoIkMmh4+SWvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7266
X-Proofpoint-GUID: uhPYnhQuYyNGdzL26_AdIn2YDni8ymUW
X-Proofpoint-ORIG-GUID: nkcqvRGf6KA_wEjVWyRQcY8c3fVIAIy7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0
 clxscore=1011 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406050119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jun 2024 15:42:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200372

--------------2WC69a523u7SywLKQQREWAb0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4554v3fs008689

On 2024-06-05 10:56 a.m., Hemraj, Deepthi via lists.openembedded.org wrot=
e:
> Regression testing was done and below are the test results:
> *After update (v13.3)*
>
> =3D=3D=3D gcc Summary =3D=3D=3D
>
> # of expected passes =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0248620
> # of unexpected failures =C2=A0 =C2=A0 =C2=A0 =C2=A09
> # of expected failures =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02484
> # of unresolved testcases=C2=A0 =C2=A0 25028
> # of unsupported tests=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04145
>
> *Before update (v13.2)*
>
> =3D=3D=3D gcc Summary =3D=3D=3D
>
> # of expected passes =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0148304
> # of unexpected failures =C2=A0 =C2=A0 =C2=A0 =C2=A015
> # of expected failures =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01420
> # of unresolved testcases=C2=A0 =C2=A0 =C2=A025136
> # of unsupported tests =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02688

Here are the computed differences for each category:

  * Expected Passes: *+100316*
  * Unexpected Failures: *-6*
  * Expected Failures: *+1064*
  * Unresolved Testcases: *-108*
  * Unsupported Tests: *+1457*

(Thanks to ChatGPT 4o !=C2=A0 Please do present the differences next time=
 to=20
save me, ChatGPT, and others from the task. )


Can you explain the huge increase expected passes?
i.e. did upstream really add ~100316 new tests?

Ah, you have a typo, and expected passes for 13.3 should be 148620,=20
based on:
https://lists.openembedded.org/g/openembedded-core/message/200008

The number of unexpected failures has decreased so that's good.


Also, did you check on the build problems that Steve reported?

That should be discussed in a cover letter for v2, v3, ...

Please learn how to write a v2 cover letter and send that with git:
$ git send-email -1 --cover-letter

Also, I saved your v2 patch and tried to apply it to scarthgap HEAD and=20
that failed with:

$ git status
On branch scarthgap
Your branch is up to date with 'origin/scarthgap'.

$ git am /tmp/gcc-13.3-v2.eml
Applying: gcc : upgrade to v13.3
.git/rebase-apply/patch:121: trailing whitespace.
@@ -31,16 +31,16 @@
error: patch failed: meta/recipes-devtools/gcc/gcc-13.2.inc:65
error: meta/recipes-devtools/gcc/gcc-13.2.inc: patch does not apply
Patch failed at 0001 gcc : upgrade to v13.3
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Looking at the diff between v1 and v2, it seems that you have some line=20
wrap issues
and perhaps more. Please test for this by using git send-email to send=20
to yourself or
someone who is using a sane (non-MS Outlook) email client and save the=20
patch and apply it
to an unpatched poky repo.


Thanks,

../Randy


> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200370):https://lists.openembedded.org/g/openembedd=
ed-core/message/200370
> Mute This Topic:https://lists.openembedded.org/mt/106504365/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------2WC69a523u7SywLKQQREWAb0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-06-05 10:56 a.m., Hemraj,
      Deepthi via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:18618.1717599402117239778@lists.openembedded.org">
      
      Regression testing was done and below are the test results:<br>
      <strong>After update (v13.3)</strong><br>
      <br>
      === gcc Summary ===<br>
      <br>
      # of expected passes &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;248620<br>
      # of unexpected failures &nbsp; &nbsp; &nbsp; &nbsp;9<br>
      # of expected failures &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2484<br>
      # of unresolved testcases&nbsp; &nbsp; 25028<br>
      # of unsupported tests&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;4145<br>
      <br>
      <strong>Before update (v13.2)</strong><br>
      <br>
      === gcc Summary ===<br>
      <br>
      # of expected passes &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;148304 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br>
      # of unexpected failures &nbsp; &nbsp; &nbsp; &nbsp;15<br>
      # of expected failures &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;1420<br>
      # of unresolved testcases&nbsp; &nbsp; &nbsp;25136<br>
      # of unsupported tests &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2688
      <br>
    </blockquote>
    <p>Here are the computed differences for each category:</p>
    <ul>
      <li>Expected Passes: <strong>+100316</strong></li>
      <li>Unexpected Failures: <strong>-6</strong></li>
      <li>Expected Failures: <strong>+1064</strong></li>
      <li>Unresolved Testcases: <strong>-108</strong></li>
      <li>Unsupported Tests: <strong>+1457</strong></li>
    </ul>
    <p></p>
    <p>(Thanks to ChatGPT 4o !&nbsp; Please do present the differences next
      time to save me, ChatGPT, and others from the task. )<br>
    </p>
    <p><br>
    </p>
    <p>Can you explain the huge increase expected passes?<br>
      i.e. did upstream really add ~100316 new tests?</p>
    <p>Ah, you have a typo, and expected passes for 13.3 should be
      148620, based on:<br>
      &nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/200008">https://lists.openembedded.org/g/openembedded-core/message/200008</a><br>
    </p>
    <p>The number of unexpected failures has decreased so that's good.</p>
    <p><br>
    </p>
    <p>Also, did you check on the build problems that Steve reported?</p>
    <p>That should be discussed in a cover letter for v2, v3, ...<br>
    </p>
    <p>Please learn how to write a v2 cover letter and send that with
      git:<br>
      $ git send-email -1 --cover-letter</p>
    <p>Also, I saved your v2 patch and tried to apply it to scarthgap
      HEAD and that failed with:<br>
    </p>
    <p>$ git status<br>
      On branch scarthgap<br>
      Your branch is up to date with 'origin/scarthgap'.<br>
    </p>
    <p>$ git am /tmp/gcc-13.3-v2.eml <br>
      Applying: gcc : upgrade to v13.3<br>
      .git/rebase-apply/patch:121: trailing whitespace.<br>
      @@ -31,16 +31,16 @@ <br>
      error: patch failed: meta/recipes-devtools/gcc/gcc-13.2.inc:65<br>
      error: meta/recipes-devtools/gcc/gcc-13.2.inc: patch does not
      apply<br>
      Patch failed at 0001 gcc : upgrade to v13.3<br>
      hint: Use 'git am --show-current-patch=diff' to see the failed
      patch<br>
      When you have resolved this problem, run &quot;git am --continue&quot;.<br>
      If you prefer to skip this patch, run &quot;git am --skip&quot; instead.<br>
      To restore the original branch and stop patching, run &quot;git am
      --abort&quot;.<br>
      <br>
      Looking at the diff between v1 and v2, it seems that you have some
      line wrap issues<br>
      and perhaps more. Please test for this by using git send-email to
      send to yourself or<br>
      someone who is using a sane (non-MS Outlook) email client and save
      the patch and apply it<br>
      to an unpatched poky repo.<br>
    </p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:18618.1717599402117239778@lists.openembedded.org">
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#200370): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/200370">https://lists.openembedded.org/g/openembedded-core/message/200370</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106504365/3616765">https://lists.openembedded.org/mt/106504365/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------2WC69a523u7SywLKQQREWAb0--

