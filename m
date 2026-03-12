Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA28FED2C7
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 04:07:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14361.1773288449910243131
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 21:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IOw3nKkT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7531c189fc=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2SqXw810956
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=wN4TdbWOZ
	RVzxRO5RdUEbg8islW2U9p3N7L3f0kjcKc=; b=IOw3nKkT7MTQtUOPACMRu/AeO
	ATK7kuXx4tlsN5Ehy5pTYFQ8ZEbncU2QnQdYa8FGnsUzawChzPMCI8o7Q4brVXau
	8/9E57mPFMFEFKV8znlhmsRgiPuuCGyhO2OF/0+sjbQTpeHcEzX1AP72kjqCNjSv
	hsI/X7ChNgK7qlsSzGB43fW2Z+ahSbTrNMLWDfXCuSKjHGx1Mico45AJYZn+nP9i
	7v5MIKPhQH20MSl33fja1q7HP+4MofuvG6Mmj1IDQGQ9zOlSWmo4e2E9Qhs7zJe3
	JNiPmt7uKYzZYmrCL8Es1lnvJ+PvcP4YSjR4gJib6jaopaNTZNEAeqP5laL5w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013071.outbound.protection.outlook.com [40.93.201.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6t87mx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:07:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsu1PH5652+6hvA85LZxq/qoI6dP2RzNxsGVmZx9WSMMrS7S92AaApA09uzqXvHA58REZtmGbzXZF+YglGE11XoYv82Wfg42EwL4Gc6sgRQsT24JJKvBRy4+hMNM+qEiVlsIpv/X03jSReycbPfl5hKXR//9g1fpIebV+pFWSaUA36yggoZVdTJZNbmE3yQHffu2TNHTcPUDJLpdfZsU9pdBrAqRZWWQz2HcDwNlFcJb3O7N0sgZsD6VWFH7YmPiseOEmr6e/FcHo6wwZkEI40+xW2gctbdZmrrKxNDLvyJ2vsTXwTJtF0R13iFWCEAuu9BGHJkn5YoJMWKZQHulNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN4TdbWOZRVzxRO5RdUEbg8islW2U9p3N7L3f0kjcKc=;
 b=Aa/etexn5USYG5ywXrZ9Kkvm6reI0QSJDU6kDp0F2FIJSgQerYIm/XdY/2ul32quOO9pLVVPuBe6XsE6k5krpZ5ZHcuekMsXZoz1uvNbNrg+yX74pnlf7dZz9NVMwn1Ccd532h6qbXeG+Vqa48WH+bmxfxr9FRUB6cKkNCrwELLsz0C7uWqvmPiyUaXjlBb6IvKOAidg+drWzkqnNyik6ZwVtVQFJhisL6RHHUXZNhcFPkSKDv845wgL+n0iWjRCBLG2IxQzdEy0FC6e3x2hK3w6Ddw1SUt9GrIt2MyAo8SvwPTtQpCax/BzOIsRJKdHUPOYAwErvwyMynq5CnhUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by SA3PR11MB7626.namprd11.prod.outlook.com (2603:10b6:806:307::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 04:07:26 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 04:07:26 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Subject: [PATCH] rust: Enable parallel-frontend-threads
Date: Wed, 11 Mar 2026 21:07:03 -0700
Message-ID: <20260312040703.1487119-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|SA3PR11MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c3b7f7-affa-45c9-055f-08de7fecde8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	RK94xNykaRXLTLfP4Cr6XFF7lvvqIFnl+ZM41frhrDSxWm/8wdT2SzvcHFOUa6dwa58R3jmvPggjmTbhh6adm/dOYB99IQiZwsKxCtLFyd36A7+SjkuWZKcUZ5b3bE5eaMTPLxifVsZ0ykGJvag8dy3fwIxi3BIHkTMH3mqVdJPyU1RoBE/6RWG7OsMZ57VQwCSbBJu341US7OPSVOXC872eK6phtNEO0mQD6b62Y5E0n4oKQlZ7FAx+4CNtybInGfuVgWfoho+XTZUOKaCJmwBU87Ig8VugmmY9r2WCmg7hSXcEMwX4m8EBBCzOHa4mJJ6Y1ZQWq9TxJ4Ie9cx/GXv1u7zmbnl5pIaObp2ApvPFdBzD6Z6aOjO6zKeYwQ+/pOmmIByg9yehizwJ51wKn2kx7ikLg2/4zu2xskSJqHOC0wBwph5KHOHtTfdvpvvOtk5xQq/BAiXxpUqCHjPjCA/vJ+eALbAnswvBPTW3I7UWP8wC320CbQ+aKG7CeAi/7If9qfYMsZFmTFacsz6+uNjPD4pZgdlD4wDDNWxLTi7s7B6uklPXHdJ0/WbTdvuv/kytNerqOmvLcgNcYvidjdGUWRNMPCykujd4ehRw+lt/Luwjb4ZhLc8jkg09YurHY4c/olHl7VSwpTz2ToBA3N3uFoARVglxsvSoXoxWrMFgpeAM7CID8ymXoBYAS6NiR6j7W7gff/gtKuO8BE9DyersFHsQxQzMUQppEmb4s0UrVzjq4oiwp/pQl6gdiICRptJbiHe7a8Q1eM4oXxlDQndamFypdVumVj9SjYe1qpc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGxBYXg0aHd6bEZtNUdhZ1RkS0diSEtWWTM0RUtSZXZJK0lCZm1KbjlUSyto?=
 =?utf-8?B?U3lwdWNaK01VaHlubmdNTDVScWRjczNGUkFQbUU1WmlYUXJoOFJ6dTRueEEr?=
 =?utf-8?B?ekw4KzI2VHVralhGYjBDVnRQeXIyTndXMmRJN0taUXovT1RKZUtTZFUzaGw2?=
 =?utf-8?B?VVlOeStKSzVTbFp5WnJhd1dtVEp0M2dvRGU0K3pCeXd4VjVObUhPOEx0azdR?=
 =?utf-8?B?S2M1SDBBWEQrczJYbTZpb21WOWFaV29BQTY4MytuQ2RRUHBvKy8wR3JOTnM1?=
 =?utf-8?B?R3BnWUFFb3ZndnpSeG92WWs0STdxL2NkVERZSVhWU0U0MlN4RkZ1ZjVISlpv?=
 =?utf-8?B?YVVLdUYzWW41c1MzSERNTTNMaWF5YzRmbGNFVWNiU3NTelRzRWhhWjFzMzh2?=
 =?utf-8?B?WTIrSTVQT1llZTY2eTc3NXZsa0ZlUXd4VklRdUdhclVHNjN1ZGxLZGNkY2Rn?=
 =?utf-8?B?TmwxYzRtN1RyckxZbU1ZZFNaR1U4dUxDYVlEU29DMGhKNGxLd3dPbmpqN3A1?=
 =?utf-8?B?RU1iVXhsekdpL3c2d2VtSFhkbDNHTzFzUExLTHNSK21GSHo4RndIQzBoeTF2?=
 =?utf-8?B?M3VrWHozK3VtcjlhTUE4M2tUSWR0RnlXQzhxQXVuU0dTRnQrVEpCaWFTZCtY?=
 =?utf-8?B?bHo0SG9GelQyT2toZXZtUVJKamNsQ2tLcFVkK0pGek90T20vM21zZFZiZld5?=
 =?utf-8?B?SW10MWtFQmpBenpIdDh2SFdWZS9YcnhBUktjSDhKaG1XdnBadURsSlJFNlVS?=
 =?utf-8?B?WXlpcTl5QzVwRXd6aW1rQlQ1aTB4Q1VCMEV5Vlo4UlRDRVNaRjdDSVRaalQx?=
 =?utf-8?B?aXpGQm1jTUdlSEExbVBLRHhTMkM5UUozWHVXMzN4ZHgvT2Q1SjFOWmpBZEl0?=
 =?utf-8?B?dDlublU4NmhzM0hib3ZESnQ3aGZ0Zno3dlRhZkVFTHN2bjhSSmRJUms4Q3lw?=
 =?utf-8?B?MWwxOTZpOXF6M1JKZmkwcFROazAxSWhneldxRk5kRVJBbWx6UXZjS054QnFS?=
 =?utf-8?B?VUtEWmxuRGRRSUxScWRsVy9VNkNzOXRBK3RwWmM1MS9MVVZJSksyVVZ5eXNG?=
 =?utf-8?B?MHpRRkx2cm1Ubml0MisrK1NRbWF3YzRtMndORi9LQ0VncmR2aFRPN1RVNlNz?=
 =?utf-8?B?MjU5UTB2bjFiWkU0VVc1K2pLbEhXOTUwemplQkIvNXZMQjNuUFpJR2FLUm9F?=
 =?utf-8?B?c1RBVGNGUllVVnVuV3hDcDdpZGJOekxoRGk5SzNYRmFiOU45SDVhR1F4N2RW?=
 =?utf-8?B?MU9SNW5lRVdSUldacTJxcXp5Skh6eXdLZkUxM1NadjhVTTZyZVFnVTJjcklT?=
 =?utf-8?B?VVozZ2JQdVNDcWZwb0hZMHJRL3NLcVBIajlmb2NPdThZUWozT0lNTHI0STNH?=
 =?utf-8?B?eFRzSURtanQxU0dCTWZpZlBXMCtkdS9uem5CK1VVekpoYzVncElYTmFLQ3dT?=
 =?utf-8?B?QnVkbFg1bjZCMDU1L09ONzEwY1orczVIdzNjSVdldzBUZmMyTVdKVUpFTlpj?=
 =?utf-8?B?alI0YUpRc1VKOFhKeUhPVzJUSkNYU0ZNL3BDd1NZVTVDVFVENmp4STVFa29P?=
 =?utf-8?B?VDJrbEVCMkFScDNWWlZtakpDeEZ0aEtwY3M5ZmRkV3ZscGJjV2VNSjFZRzdC?=
 =?utf-8?B?QTNLem02Mk9yckFyQkJsTWNwMnpxRzZFdHd1cS84MzRIQ2Ruakx6YTh0ZHl5?=
 =?utf-8?B?RGcyQVAyYWF5blRKOHZpRzY2OU8xZGxtMGdIbjBmdVZYMC9EUVZNZ0VjUjNs?=
 =?utf-8?B?TmQxQ1BweWNCRTRCaUJlWGFCcHkxZitWeGc2Q0N0Ry9sTE92MnFIaU1RaUNL?=
 =?utf-8?B?YVltSGErUHhHLzQ0OVN5WGREcVRNM09YRnpZSFQ0dlQvN3pTdDF1b3FrTnFi?=
 =?utf-8?B?S0I3T2NNQklTWU5xV05WRzhKSGtjd2llSzkxUVVsL3YyVmsyc2ZhemlZZDI2?=
 =?utf-8?B?NndKSGZzdVNScUxVY2NUczdHK3htaDU4WUg3c3c1aGV3WUhacXlYWWMrUE1S?=
 =?utf-8?B?dVhYenBCcmNsZzRHcjY0dXZuTGgrNWhUQ0hoZDk5RHIxb2I4UUpuU2lvNmMv?=
 =?utf-8?B?VUVNdmNmT2tqaHJCWmZHVDVVZVRxbHNBSEZWZlMvelJ3UVBJNmllaWI2Z3pw?=
 =?utf-8?B?anpPWURaR3FnaGlvd0RUYUswbStrUW9RRldCOVdveVNGM1A4bXlyQThjR1Jr?=
 =?utf-8?B?WHhxZWx3R2Fmamp1OUdub1BzU2loRFNJOGRLeEhRVm95YzFXUitUeGVjNmlU?=
 =?utf-8?B?SmFOWVpEeUFSUTl3SnRNRG1IVVorRkRtQ2p4MDdRcXlhdytqWWo4ek93cUJK?=
 =?utf-8?B?SVJrUDlicU5zMlc4WlJnZ1VUcUMvempIQTF1ZER6OWZ3VG1OajRBUzdKSnVW?=
 =?utf-8?Q?Sm7UgSjBc5vHmJCs=3D?=
X-Exchange-RoutingPolicyChecked: 
	Jv5CSP4dExHT44vNoGBgISnmQ49NfpEPDWsz9Wp4DmVU7NbBEwN6ZOHEMV5YJQ4iiT9EkmWpqsynrztaqHVG/PqWEH+0+GMrfjell4mnm+VwiDXPCKVMoX0y6Hc6rGL/5rzY4VODsWojSGInSlf6YJc+cPrCWOOhJtwdR8S31iSOYc8AQLev+BL5lRcfXyGjTUrsnsFbwULOeGo1u3J5ERpSvqpR4CfkA6Cs+h4yMX2apZZXOK4zioUuapq68ydkKKWHYCiVxPI3NNT3orCgF/3MEbIQ/zHr0DQCyjvHTbaBWAWoT55dAf/xJRpNZnSadrkyzWl9rQrahfT+/IHJOQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c3b7f7-affa-45c9-055f-08de7fecde8f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 04:07:25.9100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g17U/fGswDjBTVw/ShPp/H3xZxOr/VvFKstUYg/qFfw7ELhkjq21yUgFJfo248KW1kC/kOTp1wpwoq088/ABC3XWt6Tnzi1GXClhrGML3f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7626
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAzMCBTYWx0ZWRfX2HlWGZN5vqMG
 QbpXXZfybx320S2bfrW6SjtjjECU2qoaHQpNk4m+ZC6l3H36NAdaKGkoZL6INbvrMoL59z9twNu
 vD4tOmJIJpqrk0vSU5kGOi9W4GMPylcKeQhZK1QDRnVBXOQyLJC67QsacfTNzgYappEfHC4KF1+
 sQqZh9zo6OE3ZjHb+lERPQhdvJbVElhYZZjobi+UnHwyRX4DoH//LH6fznDzjwcAiRBg3QWUEoX
 m49Rei23OK2L8oH0SMEx3gJNDZXXuiCftRndDb70sqml9od5g90AaQqAMQGWDhtMYUdF5asCbn5
 EWnIFMQ1sr7l467lL5WTRZNL7mmQ8TF/yqR4VCM8YKRBr9Zj6LVXew11pdfdCzZMJTd1LPBtCB1
 oHzJj/VhE/aQzbo1MOLUIVMugeF+0MQYcMRzx0aGSQQ4e7dADlB6qliwp7N19V3CvLhMubFRxqE
 rsy7LG1r4XdPFEwgqfQ==
X-Authority-Analysis: v=2.4 cv=LYoxKzfi c=1 sm=1 tr=0 ts=69b23c00 cx=c_pps
 a=J0RhwYao4za//xiv/28V8w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=cIMPpnDlGGUJmGH34bkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: pNy4x9h7EDQpNxgf2qGZDy3iXGTTX526
X-Proofpoint-GUID: pNy4x9h7EDQpNxgf2qGZDy3iXGTTX526
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120030
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62C2SqXw810956
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:07:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232921

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Enabled the parallel-frontend-threads for faster compilation of rust code.

Test Results:
A few tests ran by, with and without enabling this option.
- Avg. default build time (w/o this option) - 56m 50.104s
- Avg. build time with this option - 49m 17.224s
- Performance Difference - 7m 32.880s faster builds (=E2=89=88 13.3%)

Tests were performed by setting thread count as 8 & 16 but no much differ=
ence is seen.
So, the parallel-frontend-threads =3D 8 is set.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.94.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rust/rust_1.94.0.bb b/meta/recipes-dev=
tools/rust/rust_1.94.0.bb
index 2be0bd8d89..82f42b7f50 100644
--- a/meta/recipes-devtools/rust/rust_1.94.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.94.0.bb
@@ -139,6 +139,7 @@ python do_configure() {
     config.set("rust", "llvm-tools", e(False))
     config.set("rust", "lld", e(False))
     config.set("rust", "use-lld", e(False))
+    config.set("rust", "parallel-frontend-threads", "8")
     config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
=20
     # Whether or not to optimize the compiler and standard library
--=20
2.49.0


