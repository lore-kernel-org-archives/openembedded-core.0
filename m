Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFF2E67A6B
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 05:17:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11660.1772515043293124606
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 21:17:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=l3ZCk0Cx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7522a5c2d2=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62350D961546121
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Mar 2026 05:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=nxBpXk3/hReKPNLD3tAQ1U
	XBvK6cDlu+wJHL1JUxDQI=; b=l3ZCk0Cx1kP94eFyXJG3YcAOQqIuy0dcELh6PB
	P7tTuckvO5PQG6LDM0wh7FIIfLC9Wb6Fjn8IY1Aa7mlRoXIDduE/QSqICnAicrDo
	L4IekAh5oGUA9XhJn7LVIJsi5iIFO40dli6TrZT3Mr4GV2MWN3y8LsHo7W0nwjyc
	E0zzBMMn92ZmA9Kx9rY5PfP0mZMkQW0GSn+nBI3NIJRnWPiS+N+jB/qwMkjhkJUP
	aFMAPmMFLk9svNn11uyi0ZQPbtQOnHrm+W2BI9xsme61Z6UK9+Oi9xpuJxb8XJ2r
	MROVE/+xxiyQ26yspequnT1NfZmCFXqgfr3OZAilW8emMfeQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4k80a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 05:16:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHzIOGYf02kw9vdfEyIQxhBEGi7vfwJMnhqYv9xYh9fDFxuqEQBulhNKVeAbFgCUH1sQAh2gnO39NG+q8SIJETEOWJlcb9xteiq1+MVPd7VeDOS8IkvFSTEbNfo66G8NhlvF9PxMZfy3juKqBFZBJbmRn2HXr9kclqgq3csHf5ganc9FRx+TUXz6oJT7duBPncA5EGboWn2tE2hK5kFYyw66eEPPxBtDrIR6W2Pdgy6brQQMTaT0a1omykO45bNBrxOj+6DrZSQoC1Tm7hhhB0bGVSO2kYnSl/mMP5lJphLDxa8WYht4v2Qdcd2r834FHyaGo6gzKSYazXqU0VhccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxBpXk3/hReKPNLD3tAQ1UXBvK6cDlu+wJHL1JUxDQI=;
 b=ePDlKzNlk0UTDXWtAutJSjelHZVNyh21J5YgxC2+vMmrGXrzHR4ah5j2CYauhpwTSIvnun+DA9yj4Ot8ECAcRTGrEg8ZOhreDc02SNZ49Gn0P4D8/ObiH1xdhG2YR41exa+an7uQ3Z1Av3rBZQ6v1//uC6MVP927EFfQhQWpACJEcSdcuCa40MGeY0wN0aRLIAmvWoE4FVWKjvVeUkQdedUvjoq6oVLmhEdJHjzjyUd0wE7e6W6m8plI5IL7QAnsXVtJiprvS1ewX/2h4NXOFC7rzaypzWq87jjSCKWubVMH218KyKkUR4V0/UNX8SaGNUwRx8LlPZdBfTY3QFVdCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Tue, 3 Mar
 2026 05:16:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9654.020; Tue, 3 Mar 2026
 05:16:18 +0000
Content-Type: multipart/alternative;
 boundary="------------dTgPXfMPmfJpnx4UIIhgdZmy"
Message-ID: <2c995775-aa0e-48c6-8dc2-f79176665d45@windriver.com>
Date: Tue, 3 Mar 2026 13:16:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ruby: upgrade from 3.4.7 to 4.0.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20260224015117.3338374-1-changqing.li@windriver.com>
 <b29f349d58b2f2286e404c258d1c865e10ba5e5c.camel@linuxfoundation.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <b29f349d58b2f2286e404c258d1c865e10ba5e5c.camel@linuxfoundation.org>
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH8PR11MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c1201c1-b50f-40d6-74cc-08de78e3ffc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	XjGz7Zqc59mzXkBeh6cR6n1HK6y8ahedbZSOcST+Nx1t9FWMAXLOw320gLs4SxOWtDtUWdeYpvFyBQM8w7LrRRfvIukIDZ6BwglxX3akQCSdLHua04+OanQG4Otzm3o0XD74HZeIJq2aLvjVwslbGkb47YQEKWM5efBDL9vy5IVScycyvNAbYHah+j4z9o+Qx4v3uytRrP5dj4egJfPDJqs14Ep9B9ftGCof2SSvIWV7bFrstVJZhKmx/r0jervD/QMXf1QPqfnG//orI4JCJ2XDDRu/bK/L0CynOH//9VgqPrW5BD3sztbAvdc+RNwXM7y4TRiGiNv1VbvfnT9Kmcc45LOD1FNRDA3kPwYTONmwz9trWomh8MzN7h+zrg+79b1UjST2Je7kUwIRdL866cq81bEYh9FLMVIWpPRcTu91H5acCnBb5M2pMZG0t48DiG9LFn5qOluU+aEFfA/K88vO3AgLX075SnxZbQnMh/0LG3VmDDlggWYVFPW3s50zDN3DJyotQZMhlsz6JcetebMicSPoC/G/yTDaVMBKg3eo7rwNJASEzBpFEg/SE3d5PG2Z1yMfkKv3ZiCg0yQ537YfWrpZQUymgNFxIImEHMDOpnPhgdHZyA1lL3KIEWECPf3zxDgBlgwMlqN/a7lGrzGyrz1Greqk/EgWWhdX2TmRYInMFBH4YIj/OEGZCbcI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clZZbHhCQ3lWK1BnUU5JY25XYzZWQUtRRG5mUXFvcjVBRFhBckNJYThBMVN2?=
 =?utf-8?B?ZG5KY0l0VlhyNkMxQlNVRmIvOFdYblB1R2ozYjhDTzlGWUY4VklmekhiSGZU?=
 =?utf-8?B?LzVubnBYVVFuTklTRlVQYXlPTWo0RTUrc3V0VTRzRFVEeGJsVXlDYmhnMm9u?=
 =?utf-8?B?WmJQa2c1QTkyR3FIUVRCNFBTYjV1WTdhSEhjZWhwMTRTdmNrSld5L202YzAw?=
 =?utf-8?B?cDd4QzYwbzZMVmNVaTh2RlBWQm9JOHpuaHI0V0VxSEZORFJkWVZPS2FSRE1i?=
 =?utf-8?B?c05CQnJsbWpjdHVwQWp4QXljSllIWkFNV09NUC9LUHE0ZWtwRWRMUVI1NFI5?=
 =?utf-8?B?RDlZK1J0RFlCRStpMU0wTFdlV2lrK01oUlByWUJjRUl4NkhqSzRKSGcyK2lO?=
 =?utf-8?B?cHpmYU5ydE5iY0h2M1lSSHk0cC83ZnYzSm4vclJQMndXMzNSclNwcEtScDYz?=
 =?utf-8?B?VnR3YTdGck5JcGV4VWlaS0tBMUdVOWhSM1NWaGNoME95N2ZucWliUUlDampC?=
 =?utf-8?B?d1ZZOU5ZNi9qUVRtQTY4UHhBTDdpUDhRaFNyYVVqdEJWVlpjN3pNOExvT2Er?=
 =?utf-8?B?K21GaXRJNUVQUlBDL3BGYWdYR2l4RjIyN1lxckQwOGhmS2ZhaHVZUFdzalRy?=
 =?utf-8?B?V1E1K3huKzZVQTFnZ3JKV3BuK0loNmx0eHdzejZ6OWJCSS9ORVdSSi9VSm5o?=
 =?utf-8?B?SUpzOUNQWWVXR0s5ZHg4aWZVb1gzbkRBQW5sL21HSytOODhNeUVyZUhzaERF?=
 =?utf-8?B?citCOGtXeUJ0eW1lbmhGZGlGSGtsNUp3NHErWktreHUyQWVIMUFxZTUrUmQ1?=
 =?utf-8?B?VFIvcW10eHFuaVFOclRGQVNEVXlPOWFHdU5vRS8zV09XOEY2NmloTVVTdEVP?=
 =?utf-8?B?ckp0VjRnQW5wRFM0SXhiVVhzZmhSSDI5OW1hTFpPRGY5KzNDTTVWZFdHazNV?=
 =?utf-8?B?U0ppVndrSDVjRll6eXRicmU1MUtJOGIwWDhoRDVsRjVwM3ZsSHNnZGN2TkpE?=
 =?utf-8?B?d2tTOTA5dUMreEY3YlpENWJVMkFHU1ppdllranJ4YWpNRFd6Sm1nMVUxbUsx?=
 =?utf-8?B?NUMxQkxmMWRCNkZWZkZLWU1EU0NVZDNQMWh2eUdZcUJHNTVlSkNaVklxWVln?=
 =?utf-8?B?RG1Dc2kvV0JCemMrN2lkb0xydnhtdForZTI3ZThjSXpmbHR3MnZ1NjZCZUtS?=
 =?utf-8?B?QkxVdWlpN1NVVElVMHFCSG9aZ1FHNTM4cnliRzdpN0ZUR1pZd3BVaWVISTJ4?=
 =?utf-8?B?SHhlWlhjdlZEcEFsR1hvYzYwSTdyU3VUL05WdlBXMVJHMEZhYTZRK1NFaUJS?=
 =?utf-8?B?SDljRHJLcm0yVlp0V1FTcnpqcEU4MHVhc2tSdXBNTzNCZ1NlUCtXbDlzRUVj?=
 =?utf-8?B?eWpXMlA1V0FuSjlKdUwzcjJGMXRTd0VMZE1mL2RMNGNXN0Q5dUhpdjJ1WE53?=
 =?utf-8?B?QnhycS9hMmNnODlrVi96TWhUSFpzUVRlNS9tZUpBY3BlV2tRRjkwNS9vWkIr?=
 =?utf-8?B?QzU5NUUwVm9IelVPY3VWbGlPdXVrTDdoM1BkSXRvbGozK1pyOWZxcmwvL2RK?=
 =?utf-8?B?L3EyU08yNHZrb1VMZjRmVlY2SzJqTzE2QTJCQkZSQlZVVzlQbldxVS9wZlZm?=
 =?utf-8?B?TUF5YkpLaHBvZThxQldENy92czlpTjVmN2dDazZwZHVLNzBCZUFnajgreCt0?=
 =?utf-8?B?MTBIM3hJa2pXSUNtenBOS3plaW1BQ3l4QVlEbmlsTG1kQXN5bEs1VWNZQVd0?=
 =?utf-8?B?bFduWFZ2bCtFejdnbGNUVVErTloxLzN5bWc0SnNNd0ZOWnVtR0tNcGpIdnpr?=
 =?utf-8?B?dUQ2VTNNcVZrUlo0dDdWK1lEVFJMUlhhd1BGMGpsZ3JDa1VuYTF0UVVlRCtj?=
 =?utf-8?B?d2ZXLzJoOE4zZXZyT0R3WG1CUjNrUmllKzhnTUJvelBlOXF3VXF4L0FnMHhs?=
 =?utf-8?B?UENjaTBhVnkvaXVqTk8xblltUnNIaDF4YkVtbTJLM2VNL1Byalc3aGY5ekc2?=
 =?utf-8?B?VU9sdUcvMGZsTFVmb0dnTUE3VldyL3BlWHU1czhoN2dRU2FhRnQ1a2JsT29x?=
 =?utf-8?B?d01KZCt5aUVKams4aExVbmxaNzF1NEhodFRjMUMvUFhYbEo4bFo4Wi83NWZq?=
 =?utf-8?B?MU9XeXF3dUNCVmo4ODdkaENGV1FjRWx4TTNSUGpTZFRUT2kyQ1kzL1hPWnpP?=
 =?utf-8?B?ZVJuWmFObG5xMWFvaHVIdTBEQWhOQzEyMmJtelcxOFV3amlpUnAwSFUrZGdM?=
 =?utf-8?B?RHFoTU1LYVV2YkhxNk9EZlFFbDdOOHBvYkRyZHdMai9uam04Qm4wZEdFenlx?=
 =?utf-8?B?SURSS0xTN2NqWC9keXBMWk94RUltNnJmUlpQb3BEUUhQOU1lT1NUZ2kwVm1G?=
 =?utf-8?Q?ggvbecnFvfqH2Reo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c1201c1-b50f-40d6-74cc-08de78e3ffc7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 05:16:18.0234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NdyW75sAcyawXAbma30gQoMENgXMXB5hsiTeLX8idu20w0hJdSeY7a1iRpC24q+ZXiiim5Ele5LL1V8HBwPX4qB6zTdy+xGTfcIEr3DDeXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a66ea5 cx=c_pps
 a=jETFHvz8UvQZFuPXE07H+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=xNf9USuDAAAA:8 a=_4TRruOiA0QqZgtJN-IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ag1SF4gXAAAA:8 a=UBFVfQAFWYhimOpKR3UA:9 a=iz5vzrmBoaJw2LR9:21
 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=r-HJ9bD__24A:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: K3Mk8aSpC-EfxWAGLB2gTIXKdGQGsH68
X-Proofpoint-ORIG-GUID: ZgvAI6ajlAi2ZvusXvFR8J1MBkfEBReu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDAzMyBTYWx0ZWRfXznsfuayUfgji
 bKnp0c1vdpDlE8fy1mfr3pCE9r1a94oEODCZFRo0sQSghFccr+3YhDTXcILkgwlHfKFItrbNvHf
 eS1pP++Csnbkrb29DFlDEqOXAjoOu1wuXXdnZgsPP9xrFKaQUNqLAHaR4jXBbKnKc7o3nX1Duz/
 nXFIjg/ye/vcTDlcSHuP2I/Gd9F3+qRyI7EN0OkzQCz2L6UsNFjtpHos64SPnucJekpHFyplIbg
 7wm7oawPTBqHoqAznd9exx/kW+Q2/vRhYRzdaqhXsEJY5gc67nmqTYgeCelzinlR4QumbMx6Mb0
 VZyYDkzzWoSQOw9FG6Gy1LLZK0m/ZdaGRbjemnV+b2WvMdlhiox92DmwiUZkEprcJERW2oNDQ7Y
 2euR/ve93rIyJmVEB/6nMEM7XVkTJzLGINDOyJ9BJDrXlSyNb5OhvAMRWnr3aCMJih9jHMNVLxP
 PluM1PSylG49J8J4bYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 05:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232237

--------------dTgPXfMPmfJpnx4UIIhgdZmy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62350D961546121


On 3/2/26 23:07, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, 2026-02-24 at 09:51 +0800, Changqing Li via lists.openembedded.=
org wrote:
>> License-Update: Add license BSL-1.0 and Apache-2.0
>>
>> COPYING - Add Cross-links between Japanese and English pages
>> LEGAL - Update LEGAL for JSON vendored sources
>>
>> Refer:
>> [1]https://github.com/ruby/ruby/commit/e652af18816ffe0b85109b8de082734=
9bf03f16d
>> [2]https://github.com/ruby/ruby/commit/d5fbff50c7ff880ae71b8a8ae9aad97=
6c69bea73
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   ...doc-build-reproducible-documentation.patch | 30 ++++++-----
>>   .../0006-Make-gemspecs-reproducible.patch     | 52 +++++++++++------=
--
>>   .../ruby/{ruby_3.4.7.bb =3D> ruby_4.0.1.bb}=C2=A0=C2=A0=C2=A0=C2=A0 =
| 11 ++--
>>   3 files changed, 51 insertions(+), 42 deletions(-)
>>   rename meta/recipes-devtools/ruby/{ruby_3.4.7.bb =3D> ruby_4.0.1.bb}=
 (93%)
>>
>> diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproduci=
ble-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build=
-reproducible-documentation.patch
>> index 90b2aee7ea..f0be3e4af6 100644
>> --- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-doc=
umentation.patch
>> +++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-doc=
umentation.patch
>> @@ -1,4 +1,4 @@
>> -From 2e140fea6c275f3258893d2da2480027b16efb92 Mon Sep 17 00:00:00 200=
1
>> +From 278d02b08f513b288f31648bc5ec5c47ecb61686 Mon Sep 17 00:00:00 200=
1
>>   From: Christian Hofstaedtler<zeha@debian.org>
>>   Date: Tue, 10 Oct 2017 15:04:34 -0300
>>   Subject: [PATCH] rdoc: build reproducible documentation
>> @@ -9,29 +9,33 @@ Upstream-Status: Backport [debian]
>>
>>   Signed-off-by: Antonio Terceiro<terceiro@debian.org>
>>   Signed-off-by: Christian Hofstaedtler<zeha@debian.org>
>> +
>> +rebase to version 4.0.1
>> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>   ---
>> - lib/rdoc/generator/json_index.rb | 4 ++--
>> - 1 file changed, 2 insertions(+), 2 deletions(-)
>> + .bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb | 2 ++
>> + 1 file changed, 2 insertions(+)
>>
>> -diff --git a/lib/rdoc/generator/json_index.rb b/lib/rdoc/generator/js=
on_index.rb
>> -index 065caa4..cfa1f33 100644
>> ---- a/lib/rdoc/generator/json_index.rb
>> -+++ b/lib/rdoc/generator/json_index.rb
>> -@@ -176,7 +176,7 @@ class RDoc::Generator::JsonIndex
>> -     debug_msg "Writing gzipped search index to %s" % outfile +diff -=
-git=20
>> a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb=20
>> b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb +index=20
>> 065caa4..a76c202 100644 +---=20
>> a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb ++++=20
>> b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb +@@ -177,6=20
>> +177,7 @@ class RDoc::Generator::JsonIndex=20
>> Zlib::GzipWriter.open(outfile) do |gz| -- gz.mtime =3D=20
>> File.mtime(search_index_file) + gz.mtime =3D=20
>> File.mtime(search_index_file) + gz.mtime =3D -1 gz.orig_name =3D=20
>> search_index_file.basename.to_s gz.write search_index gz.close -@@=20
>> -194,7 +194,7 @@ class RDoc::Generator::JsonIndex - debug_msg "Writing=
 gzipped file to %s" % outfile
>> +@@ -195,6 +196,7 @@ class RDoc::Generator::JsonIndex
>>
>>            Zlib::GzipWriter.open(outfile) do |gz|
>> --          gz.mtime =3D File.mtime(dest)
>> +           gz.mtime =3D File.mtime(dest)
>>   +          gz.mtime =3D -1
>>              gz.orig_name =3D dest.basename.to_s
>>              gz.write data
>>              gz.close
>
> This does not look like it is updating the patch correctly.
>
> gz.mtime =3D File.mtime(search_index_file)
>
> should be replaced with:
>
> gz.mtime =3D -1
>
> but both lines are left after this change.
>
> That will probably 'work' but isn't a correct update. Please can you
> send a fix for this.
>
> The reproducibility issue also recurred in master:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3490
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260302-t9zp1=
mo6/packages/diff-html/
>
> so this makes it more urgent we get the other changes in v2 (I note
> that v1 was merged by mistake). Thanks!

I have send a patch to fresh above patch,=C2=A0 and also=20
0001-Don-t-save-the-original-name-and-timestamp.patch rebased on=20
master-next.

Thanks

Changqing

>
> Cheers,
>
> Richard
>
--------------dTgPXfMPmfJpnx4UIIhgdZmy
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/2/26 23:07, Richard Purdie wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:b29f349d58b2f2286e404c258d1c865e10ba5e5c.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 2026-02-24 at 09:51 +0800, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">License-Update: Add license BSL-1.0 and Apache-2.0

COPYING - Add Cross-links between Japanese and English pages
LEGAL - Update LEGAL for JSON vendored sources

Refer:
[1] <a class="moz-txt-link-freetext" href="https://github.com/ruby/ruby/commit/e652af18816ffe0b85109b8de0827349bf03f16d">https://github.com/ruby/ruby/commit/e652af18816ffe0b85109b8de0827349bf03f16d</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/ruby/ruby/commit/d5fbff50c7ff880ae71b8a8ae9aad976c69bea73">https://github.com/ruby/ruby/commit/d5fbff50c7ff880ae71b8a8ae9aad976c69bea73</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...doc-build-reproducible-documentation.patch | 30 ++++++-----
 .../0006-Make-gemspecs-reproducible.patch     | 52 +++++++++++--------
 .../ruby/{ruby_3.4.7.bb =&gt; ruby_4.0.1.bb}&nbsp;&nbsp;&nbsp;&nbsp; | 11 ++--
 3 files changed, 51 insertions(+), 42 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_3.4.7.bb =&gt; ruby_4.0.1.bb} (93%)

diff --git a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
index 90b2aee7ea..f0be3e4af6 100644
--- a/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
+++ b/meta/recipes-devtools/ruby/ruby/0003-rdoc-build-reproducible-documentation.patch
@@ -1,4 +1,4 @@
-From 2e140fea6c275f3258893d2da2480027b16efb92 Mon Sep 17 00:00:00 2001
+From 278d02b08f513b288f31648bc5ec5c47ecb61686 Mon Sep 17 00:00:00 2001
 From: Christian Hofstaedtler <a class="moz-txt-link-rfc2396E" href="mailto:zeha@debian.org">&lt;zeha@debian.org&gt;</a>
 Date: Tue, 10 Oct 2017 15:04:34 -0300
 Subject: [PATCH] rdoc: build reproducible documentation
@@ -9,29 +9,33 @@ Upstream-Status: Backport [debian]

 Signed-off-by: Antonio Terceiro <a class="moz-txt-link-rfc2396E" href="mailto:terceiro@debian.org">&lt;terceiro@debian.org&gt;</a>
 Signed-off-by: Christian Hofstaedtler <a class="moz-txt-link-rfc2396E" href="mailto:zeha@debian.org">&lt;zeha@debian.org&gt;</a>
+
+rebase to version 4.0.1
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
 ---
- lib/rdoc/generator/json_index.rb | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ .bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb | 2 ++
+ 1 file changed, 2 insertions(+)

-diff --git a/lib/rdoc/generator/json_index.rb b/lib/rdoc/generator/json_index.rb
-index 065caa4..cfa1f33 100644
---- a/lib/rdoc/generator/json_index.rb
-+++ b/lib/rdoc/generator/json_index.rb
-@@ -176,7 +176,7 @@ class RDoc::Generator::JsonIndex
-     debug_msg &quot;Writing gzipped search index to %s<a class="moz-txt-link-rfc2396E" href="mailto:%outfile+diff--gita/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rbb/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb+index065caa4..a76c202100644+---a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb++++b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb+@@-177,6+177,7@@classRDoc::Generator::JsonIndexZlib::GzipWriter.open(outfile)do|gz|--gz.mtime=File.mtime(search_index_file)+gz.mtime=File.mtime(search_index_file)+gz.mtime=-1gz.orig_name=search_index_file.basename.to_sgz.writesearch_indexgz.close-@@-194,7+194,7@@classRDoc::Generator::JsonIndex-debug_msg">&quot; % outfile
+diff --git a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
+index 065caa4..a76c202 100644
+--- a/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
++++ b/.bundle/gems/rdoc-7.0.3/lib/rdoc/generator/json_index.rb
+@@ -177,6 +177,7 @@ class RDoc::Generator::JsonIndex

      Zlib::GzipWriter.open(outfile) do |gz|
--      gz.mtime = File.mtime(search_index_file)
+       gz.mtime = File.mtime(search_index_file)
 +      gz.mtime = -1
        gz.orig_name = search_index_file.basename.to_s
        gz.write search_index
        gz.close
-@@ -194,7 +194,7 @@ class RDoc::Generator::JsonIndex
-         debug_msg &quot;</a>Writing gzipped file to %s&quot; % outfile
+@@ -195,6 +196,7 @@ class RDoc::Generator::JsonIndex

          Zlib::GzipWriter.open(outfile) do |gz|
--          gz.mtime = File.mtime(dest)
+           gz.mtime = File.mtime(dest)
 +          gz.mtime = -1
            gz.orig_name = dest.basename.to_s
            gz.write data
            gz.close
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">

This does not look like it is updating the patch correctly.

gz.mtime = File.mtime(search_index_file)

should be replaced with:

gz.mtime = -1

but both lines are left after this change.

That will probably 'work' but isn't a correct update. Please can you
send a fix for this.

The reproducibility issue also recurred in master:

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3490">https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3490</a>
<a class="moz-txt-link-freetext" href="https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260302-t9zp1mo6/packages/diff-html/">https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260302-t9zp1mo6/packages/diff-html/</a>

so this makes it more urgent we get the other changes in v2 (I note
that v1 was merged by mistake). Thanks!</pre>
    </blockquote>
    <p>I have send a patch to fresh above patch,&nbsp; and also&nbsp;<span style="white-space: pre-wrap">0001-Don-t-save-the-original-name-and-timestamp.patch rebased on master-next.</span></p>
    <p>Thanks</p>
    <p>Changqing</p>
    <blockquote type="cite" cite="mid:b29f349d58b2f2286e404c258d1c865e10ba5e5c.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">

Cheers,

Richard

</pre>
    </blockquote>
  </body>
</html>

--------------dTgPXfMPmfJpnx4UIIhgdZmy--

