Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB0E106FD84
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 06:03:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9806.1773381780429831426
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 23:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=X8mcgExq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7532a81742=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D55N7F2017429
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=/QjZcUn0k
	I6QpAcAczK60JeMvm5tN3ARg4KHuB3CODU=; b=X8mcgExqCkyxDuz0Q8jPhzPaq
	oUzTMVRPpuTm/JM0uq4SUOgrWJxWqVfX7IScMeMqcYATcfSqzeibJ1hy5g5joAIz
	lQ7xDNmFvAzBux90xy61a8OAwu5CA24Mlkb0HA4yuAm6bVMheDoYm8CiZvl3hyU2
	sS8Uhapo8WIQF3aH3AY0Gokyr56a17S3PaKEF7E9bhnvHval/5q2ustYGxUtKKFb
	xD19DJJaQmlSxtwrauc7dsNW4vjigMg1mbSQuLSP9Pu/i0VSdycrmubmdvC3iFTW
	nFpogCpCFyBYaa3KIGppBk1YD8NuIQhHbNhLWhuYKe74aXZ5vQ/WDPjKFo6ig==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cutxqs777-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:02:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAi8E0GbU1SUOtcKxi6/nOaqZUJMZQH8mgTi8ZVvvr1oWC6jtukhVbcpzEqQnJpknjaND8Wq5GUdSWeqwU7IKBSRv6VgxGaviC4irmcGfWnjpbhatlEsuFrIGS5/r0fdXBbKbEWPhgILiWF6BMi7kw7zV59nCEXmd9M0MdBpHRcHLmRSfo+KGo57D5vpc8pXKVRjDAjS1g9yF/qD/CZ0biX0KrxZHt3zyHd/4ONT8C13x/VzIgvlOZ+iKcI2b7HHtuAMSb3eTkAy8ReocL8A0lPgOM3uRqSBkQh7dIabQRnzyORbkqcBCEAeGdsq3FIPX9PSkMAtF6XrB5I8OVue1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QjZcUn0kI6QpAcAczK60JeMvm5tN3ARg4KHuB3CODU=;
 b=fRwaG6/iA3Ksk3SuVtI5D+EKUItbwCcj6xFI7wF3TAN34xeKbFpHx2jv4daqoutPfgUsgjul57DsZVQ9gAQYATqo+Z0oOufUuL9UQV27M6nk7kT9X3AK+/zjydUaJlxrSquNyB1sIrkO43w2kgFz8iNZVGFI201Z/9zZgL+LvX1qXENjgB8Cq7nC02Zi19r28It1iqRFohnACPJZozYVgaLzx3dbfLbFHNr2EVODkVAiHRUzPiLqR4S2UHzoINVHHcgY46nvEeexqpJI1DazRUoZMxcx8CSIumGdtOMnZW1rlXEUoCxQYKi5oLw++WQKad0N3tZTVKpC0URtZJk/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 06:02:54 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%5]) with mapi id 15.20.9723.000; Fri, 13 Mar 2026
 06:02:54 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Subject: [PATCH V2] rust: Enable parallel-frontend-threads
Date: Thu, 12 Mar 2026 23:02:26 -0700
Message-ID: <20260313060226.2354003-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::10) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|DS0PR11MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd121a7-422e-4d15-ca7c-08de80c62a94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qM3g9FkPgzLXUAG79V3OmxSKDRC2zxH2jOHe4D3sWTfkAlvAhJSnHKr3ae3/GxtBlHrQ5qlMgBVCp5m9x9Dy7PEkZiI5d3yuPFpeUjt8jQORXFwDHpUOddLdTBRdEkUtCydsOldFIoglleVlUmoRQ9iRWsVa9G1WVHU+XnAPeZIqurHp87sQQpsdkGEJboVmut44uyhEAGOU+q/QVGoj2MelD6cUFDu9pY1G2LBWDhgi/4MCRYpdM5UsNTZSk7+x2mTQMTuzTLTukLbinwDy6Imn+OyJS2F8xO4NrZa99iDNPQ/aMWb+aTn+J9PaTLfztcmr9WGXmda0+DzHcvvqFwxVFOypmOq/X+DHLv5hR5ISTGlW0Et8C7NR/yG3bpkqaOvK4Ff78YFIjl4jx7qDZRBEzRHmz4PKeyzlx3HNvK7LylZJPPSBVPpz9St4RElY3Ji7aoyjy+IeC6oDQeyLlNzAK1OdpiIqN15xQGZsM8Lt9is7tm0SdJGM7WkV52xdULEr+La5fEk8BweXibprgju32rXpLZDySQY8HQo1SYhoagM9VM4wVc5FApjcua3OBEqs4CwNvRy2bVOsrBwGJU03Y0gf1BxjNlQ1Var86acICtphshD4V3MqRgH8/3lvLR6ljWKfMJaSKFSLtIhFkyUdBBYFDvMoQBdLHEinVjomX8WqAxVWo0EPY6q8FaUA3sr1t5D6QuaDai0W8l8emI93dFsrJB2BiMI6mcVb+5RW1Duds3aSeSkzAHnO8T4YBcDuivN3eBrZgR8HQZ5GmJvsBLEY21p5q4pCXAKlip0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dGhrRjBVV3dwYmxpQ2daTy9KYVJDdlJjc3JFZjFwVGgwblVVd1NycE8xWWwz?=
 =?utf-8?B?YmxKcWlQTEZOZlpNbXgzRUU5RW80QUMrbHVPbHU2blJXemVkbUhZQ0VGc2RS?=
 =?utf-8?B?TE1YZDJqZjNjTG1DbkZRTmVzSGlZbVYyc1cvaXpWZkIvc01hY2tab1M5Yjl5?=
 =?utf-8?B?NWJ6T3F0TEhEdTZIaGhqY3JFZU5hZTZOMXI0VU13eVQ4UGFRM0JGYW56OUhL?=
 =?utf-8?B?RFoyNTh2OGRBZ0prYWFxNVEwRWlLNStYTzl6akRvaUZzL2Y3TWordlJzVVZl?=
 =?utf-8?B?YzRSVTU0RTdUMWNRb3lsdHEwbldIMzN6UStCM2pTaWRJR3VyY0JVcmdkYXhz?=
 =?utf-8?B?azRaRVhZZHd3TlZZTGt5cHpRZkkyeDRSWDMvZE9NeXNGVUMzcTdPbTJSNlNF?=
 =?utf-8?B?d3Z5ZlJNM3l6MURva3A3SzhHd2pvQnFsdGRhUEZISFAzNVlhNFJhZjFiTnQx?=
 =?utf-8?B?bzcwdmlIZURmY20wUVhPb1ZKTWIxaVdVejgzYmxHTDg2eVlnRk5HTzJjdGQ5?=
 =?utf-8?B?YVRUKzBZQWY3QTlqNC9xakdCdy9acHFWUWJ1bERPSGFGbkhRcGY3VVkzYnd5?=
 =?utf-8?B?K0NRcjU4NFFhOGVlSGRaUUU3QjdjMnpxNTV0MGdHaUQ1cWx2UVR4M0N5MHMv?=
 =?utf-8?B?M2dxYUF6Zkl0ZFFya0liU0NqdVVPKzBDQXNzMGZFVkZ4ZmR5SUNoWW04dis2?=
 =?utf-8?B?Y0JSa2FmMmFSSUJPdHhRQ2J5bEE4V2xOT3dRc0JqSlFUNzBmTnZvTzJkcFdR?=
 =?utf-8?B?dHppbnQxV2hhWlErTUllclZzR0I3alZ1OGJaVG9JUGo5SW1XN1RESlFZbDB3?=
 =?utf-8?B?WEFaWU1rS0dxYjhML2htdVIrUTVsUUVPekM1dTNNNTd0bGdpcStYNmZhLzl0?=
 =?utf-8?B?TGk1OWhKY3c3RmUrdVlMa2VVbkFOMmREVlJLU0N0RXVVMnN5c0RLWWk1QzRC?=
 =?utf-8?B?K1E2STE4Z2VDWVcvQWoyMjZSU3hwS3FKa1V6eC9IeDQrai9Ca04yMkowb3FN?=
 =?utf-8?B?YTJNMHpBSlVlL1lsaXEyQk5wN0lnbjN2SnhmeHU3bHpzRmNtTUo3dkt1MC9J?=
 =?utf-8?B?M2RiM01WOElIelNMRWlGZWdxV2dQSnhXUjNuaW5Xcy9kWlJabkd3Y29HNFg4?=
 =?utf-8?B?Y3RkdVpBTzZnMERaU3NxT1BzMjFodDNiQ0JsSkpWdmJ3dkZGZEVXT0pBOHpp?=
 =?utf-8?B?ZGEvbTFMMVNwRExMeFZmdTdHL2praU1XS2lwNzR3ZGRDTUJSb1hzdW5KUjYr?=
 =?utf-8?B?VkpraHlhYnpZeTNST1Z6VHp0eHlKTndFYW4yYjZCbW51eTRWU2FPdHV0SHpT?=
 =?utf-8?B?cTdxSGFWKzU0eEhVYnRPc29XRDR3T2Y3QmV5Z1Nmcm9VN0ttZHlTUERaSHpi?=
 =?utf-8?B?bVRBa3N6SlR2RmlYSDJRUjBtTlBrUW1NaEVEekc3dDB6Unlwdm9NS1pBdURk?=
 =?utf-8?B?czhTZE12RTNwbzkwek9TSGFZaUZRM2gvUDQ4T3JwRzl0c1dDUDVHY1N3RXJU?=
 =?utf-8?B?aGtBaVd6RzIvTlQ0R3M5S3dod1Zlcm1tR1BTUE5HMUlTZzIzc0NRaHpLT1VC?=
 =?utf-8?B?V0xEbS9hOENEZTNWcXl6YjJyRjFMWUc1cS9yY2FCcGhIZzVCTmY5QVBJUG4v?=
 =?utf-8?B?cFFWdVNFM2ZhQW16UUl4MndWaWhPS0p6d2hSci9RNGFDZVdWbVB4bEF5ekpY?=
 =?utf-8?B?dGRvOWJEYWtLandOM3pab2QzSW5ZNW16d2FITjNZQ1V6ODVIVlY5UW44dVhE?=
 =?utf-8?B?c013ZWo1dkMzWFh4NUQzRnU1ay9qc2p3elJ0cEpIdzRlalI1cE0yc05ZMDNw?=
 =?utf-8?B?aVk2NVhMMjdjR09hRDBJZmpWNlpHd1ZIaWE4RzRCU1NyRXM5OHJJT2wxbkV2?=
 =?utf-8?B?US9JOFBlNEVNTDlqdW5kK09mN1B5YzdPZ2wvNmJUeWd6dUJOMnlxK1BlS3M1?=
 =?utf-8?B?dnpFZzNTQVFqdlNKbXFXTkY5MFdPbFZxdCtlVEFQQng4TFhrNzdlYkFrR21h?=
 =?utf-8?B?R1JITXFud2NkSTFLeHN3U1JDUVJFRWZmQzJUZkJETUE0MzdqajMzNFZJN3Ra?=
 =?utf-8?B?MG5Yam1kTHZGTldzaHlqTzM3Q3l5WVRyTEJ4S1IzS2UxdWNzRUxQVm9CM3hX?=
 =?utf-8?B?azB0d1NORXd2ckFhM3hpMmJvN2RKUkhwRzZuaVZBQjZ5eExadXNZMG50VzM4?=
 =?utf-8?B?QUoyK3p1T0JQRnQ1dHdKakhsLytJUTJydCtmMU9mYjdqNmw2b1FuNmVYS1FS?=
 =?utf-8?B?NFREaWZPcnlhZEMvcHFDalplL3U1V2t5ajcrWkhmSlJIWmFzUnk1L2VEemo5?=
 =?utf-8?B?V1VrT1Z2MGFPeTZ6WkVqaERPNEpocG91RkR0alZLWUt2UnRSQi9UL2RoZEJT?=
 =?utf-8?Q?VeNHxUXBxEXd9+Xw=3D?=
X-Exchange-RoutingPolicyChecked: 
	UB9W7iYGYgIzxi8Kg7DbyVwYc4RBaFcQ2zzS3Sc8vDutyP21vYIr8lUTO+ZsZtp2VCBRgwWa/6lGGCGnocWN2SGe5hMGG39EW4LoKHvFfNJd5H1VaycILMuGnkVvxz8lv74m9FUo/TsIZR3DKbW6vhbB7ha1up+u6IAl9zqvS3Y+Hu17Ipk1nyp6rHhqRwTAl7/R4R8J2K/UjENlIqSeXzjyxS7G5jxNb2YFLjc1LxXtpP+HD3wNcH93C9JnmfAi2Fg1KWyfe1cy68lKGKoKglpn4MFfOLICrvBiDNO0DxG+McyKn0W+Ca90ROQx7LC2ZyeugtvwlYj+LNieaXMJEw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd121a7-422e-4d15-ca7c-08de80c62a94
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 06:02:54.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZX6Rzif0LCGC1ekBx9jC+/3Narb3AMh9trUhN49EMaDXMbKCitzmckyJvXs3xLbr6HuszW1aC7YgHwvGEZ4GudiSXiSB0J/8esPnPbhm16c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7459
X-Proofpoint-ORIG-GUID: KOcwrHCz4XBnuO1_34m_ANYIpT9IyeGk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA0NiBTYWx0ZWRfX14mRV2D8hjUt
 JtwYbFfbq9ZM44H1MHpsBvO1JwKDvPRafsCTs+ItxcDqwkmcpiLiYPUG8txJ+aatV6Jxqw85ylQ
 GMCJQtanbsMc3p8xFUk+CPO0C/p3HlsqBCcR0XoKOROt3F/604WCfDhKojdXrJqL+402/uN/JPK
 CDCWS4CG9m1L359VLCLF+QObtjXRCKQITtqpv9qUxaQnkFl6AgMUBPC63owYsLuMxhUelPWWLkO
 3IlxbcvLn7/8RLEyjsSpLno1PUoNiMLsi/lMH8AuFU5QaasWT8MYfaWzLaE27KRWEfI9c8tGHGC
 P1EVAiybBjBWCn+IJIy8BCKWXIA/oDh+lc1Mh8YUAgTsoOjTCISxTfdtfXs6i12LvxMdre+Xoul
 +CJwrAGdcKL6a85e5CZKNmb358trr680PcRTYXjlWVNblN8vnjrS5VAKUz9e2Jj9U8kNm9Xjegi
 DvAYg3KY9lWHZlUN2kw==
X-Proofpoint-GUID: KOcwrHCz4XBnuO1_34m_ANYIpT9IyeGk
X-Authority-Analysis: v=2.4 cv=feegCkQF c=1 sm=1 tr=0 ts=69b3a892 cx=c_pps
 a=8DpcgsHgAViCMqsLoRaOsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=cIMPpnDlGGUJmGH34bkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_03,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130046
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62D55N7F2017429
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 06:03:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233023

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Enabled the parallel-frontend-threads for faster compilation of rust code.

Test Results:
A few tests (bitbake rust) ran by with and without enabling this option.
- Machine config: Intel(R) Xeon(R) CPU E5-4669 v3 @ 2.10GHz with 144 CPUs.
- Avg. default build time (w/o this option) - 56m 50.104s
- Avg. build time with this option - 49m 17.224s
- Performance Difference - 7m 32.880s faster builds (=E2=89=88 13.3%)

parallel-frontend-threads is limited to a max of 8 for best results.
More info - https://blog.rust-lang.org/2023/11/09/parallel-rustc/

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.94.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust_1.94.0.bb b/meta/recipes-dev=
tools/rust/rust_1.94.0.bb
index 2be0bd8d89..3ef80444bc 100644
--- a/meta/recipes-devtools/rust/rust_1.94.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.94.0.bb
@@ -139,6 +139,7 @@ python do_configure() {
     config.set("rust", "llvm-tools", e(False))
     config.set("rust", "lld", e(False))
     config.set("rust", "use-lld", e(False))
+    config.set("rust", "parallel-frontend-threads", min(oe.utils.paralle=
l_make(d),8))
     config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
=20
     # Whether or not to optimize the compiler and standard library
--=20
2.49.0


