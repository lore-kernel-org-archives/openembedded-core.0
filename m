Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 912F9C44529
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 04:31:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15637.1784608306694021345
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 21:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=IIie4EKt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1662381085=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L46B1r1635816
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 21:31:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q1PQchsry7TqxfKAw092qGwn6B/m4k513lmPNJJrN8Q=; b=
	IIie4EKt3bvO3l6kFKTGVRvdNtTmnIeBory/p4eKtAvG7WzfKkGqzNf9R+LGUPxQ
	0CTwMrTLK1DpmhdNTnupF3Xpkf+gkCC1onOvvGjvInSsbcKxyMUasMXYbQxYPPWI
	qgILCiNjAB1swocpOSthZvy3rm5+PugSw2ve2OSFlrx8/2WucCUfr5xtMYyyg3mi
	dHKckDSUC3DtLIz09TDAwjAftZOA0sAwYpVQJVJKXhY83Y+mvbIUzU8Qz6jIDvYr
	jGpTGr1Imwy/mI4JL0ABT9WdaU6CS3ViXWBkbaSJAF8DEZVO/oItzSCTI+VlEnJG
	Fv90N4n6BtVwIVLfBJDvgQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg90cutfp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 21:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgRed0xSTfaKzoWu+g4uhNOMnGvSH2q7aPagzeLUKicZCNALSQIJTD7ib8eyPLW45jB4b2/UqF0xrqPB/2zdaFbnxmi8L4YdLBX6jYJ3nbIGox7FPcLJG0WYi5+EgF2MfQJ0XKH8jzNkiazCXd6Z55XhkDDc5AcwEtO8UWkyrkBuqTEVk4QBuGUJXNmTZJcNdAO7yD77bt0MacBjTc7D3aUbaii0i4p97oV9916ZdbqQjB/FfznNBCbRoMPDQ9A9mN+H+g1sLNQvgV57S27LEQkRLYJlZ8xU7zmpEN5K1q8ZoKthTPBReQEgYy7NWlZcsQcL/i8Ruho3+O2lrV2trQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1PQchsry7TqxfKAw092qGwn6B/m4k513lmPNJJrN8Q=;
 b=L2Gk8phchp7qzdpXdqI1oQk3h/W8OJVHjotwboZutdTHNjWwlMUJsksaFkAfZpqXIRKwe1iluPfKs1TkqlfzamDw34gzL1T+fxMxUZp1pixIBO9LbJQvaFK4yOo5ABmFntjCBNdT4aSKPg8tRyQ3kBV2mvEAnJ0Vw44c23IRemfXrMKk+AXae8xsOEYexVMpmnXb1rQQHazTbQiNiM0kpCm4UUEJvIjOAabU9sBvQqIwQFufAdozqKeesLUMWdTFi8WZz9BlJTAj48DL8xc4VPruLSMAy+iCOn8i8t46HbBBwK7Yl+mCYuWQbRiQD0/ZA8G/ggIVgoMzLDCjm4eyIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DSVPR11MB445312.namprd11.prod.outlook.com (2603:10b6:8:37a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:31:44 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 04:31:44 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 2/3] rust: refactor source handling into a shared work-shared recipe
Date: Mon, 20 Jul 2026 21:31:11 -0700
Message-ID: <20260721043124.3538696-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260721043124.3538696-1-Deepesh.Varatharajan@windriver.com>
References: <20260721043124.3538696-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DSVPR11MB445312:EE_
X-MS-Office365-Filtering-Correlation-Id: de5bad6c-3a53-4ccc-cdcf-08dee6e0f80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|13003099007|38350700014|29003799003|25016099003|6133799003|12006099003|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	2qGmiQ/BitD54Gw3tuULfnorRdHkbVyr7arAsbNspzFYzOy7S8vAdGrIh83hKsZPGC/HfowyUfjQxbYmdVerfgGOnlktw98RjM3yeuL+jVYxMG+zt+MZNq0qWQeFv3gqsZrxYtOxgmEkFItsgTd+umkzrllVE0bF4l/GtmPay3kc0J3ZZnimUNkoeJ8GJfaqHb8aUPenLLUZHsj+2CFjaVx9so38mMUnyq4FSPzx0g8tSji37d8fy473dP7ajNvubAMiMQRH2PWbqTqMoOJ+gfZU2QlNklbbT5Z7DuGo8vRXQUGcrWyz317JDpSQTcAAO7ebZRyWkNEZqL4D7NMOWN0F9v8GW68sR623/hj90U6Z/wxr5XwwguWtxomzR5BG5SaPL+QlGVmpRWAuHHaG/WLUT1VHHTiTOgpRmmoB5ipjDWQpsnJICd60PzoLGX0/h7pib164kg26efHfJdMu68yzRJ/KmvGlqw5QvqQz09K4eY4EpFvI00eNg1+wCZKbxrGD3F7ydoVDfJrfSzwBE9MZfydZ9bG2wmT5LscEkI+s0Gy5OKRG1chtVsCDnB/J6TBcJIDk6yUwTUYYj9ZyhVnow9QMgV6y9jnrYJtCv98lmwnAaRSR234KK23++5wdr4gyE9LOnAqZZLhMt6+uKpFcbDlYX3spdQn118MAhco=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(13003099007)(38350700014)(29003799003)(25016099003)(6133799003)(12006099003)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDJUUm44MzY4bVNPVkF1VVpnaTMySnYrdHNRVHJ4cnlBa1VhQU91M2xJaXIy?=
 =?utf-8?B?TTlRTUpoS3ZVUDEzOThGN3A1ZWZuV2JpM1RxZGNhcTRQbFg5SmQ1dEx1RGkz?=
 =?utf-8?B?QXZrNXBMRUs1eUlFVkpSL0UwT3dBQmR5Szh5b2l2YVM0bENIV3VwRVVxMlJx?=
 =?utf-8?B?aVdmRUNsMGJNUHNCTjlnRGJKRWgvQ25iQ2RoejVzTGxIMnlEUUZRNkovODBo?=
 =?utf-8?B?YjQ4b1FxZkhvRWZBKzROek5LTnZUYzFCb1psejlSUXhpMXE4UDVRemFXVG1R?=
 =?utf-8?B?VW9vS3A5L2VzeDJJdWpIek1BQ0lvZUxQcjZUMnBOQkttckJ0ZGpNZDJIUmt0?=
 =?utf-8?B?Mk43N2ZkY0o4RVI2M29IaGs1V004MlBRR2Zaa29IblBwaGpZeFYwZ0RMVzNu?=
 =?utf-8?B?NGZ5MTQ1MHQrMjFraGovN2M0cjFhZXZNV1oxeWoyVmRXaWFkeFpsRGM3elpu?=
 =?utf-8?B?d0pxVm04SzlQZmZ6SWVKdTE3dlR2MllnNDkzRGRReXE5ejJEdkdCVzJxYW83?=
 =?utf-8?B?UkpQQkZoQ3hKanVvc0swL3Q1UDZjLzFlL0x1SlI5dGFpcmhUTWc5K1lpWGlm?=
 =?utf-8?B?ZHFTWVhxS252em5lbjVoOTgzZUw1MngvV0VkamF0WjRYVWFUMkNyWlptREhn?=
 =?utf-8?B?UnhybW1CSFhKVXZRMEt4UGR5MS9leFZFL1NUWEwvMnE3NTR1Tkl3S1ovTzgz?=
 =?utf-8?B?YUp5MHBWb3BRcXJnaEllSU0yRkd2ZEwvc0tTcDBVcnRLVXkzdEhGV29IblhU?=
 =?utf-8?B?VU9tTnFtRzROclhmQmFSd0hTUDNXVWdlWExISW9HbktMQlZ4YWhXTEZERmw2?=
 =?utf-8?B?eHd6bVRsL2lqVHhCbEdTSW1BbjBxUWVuV0QwWXZWNHh5UEdNaDlQSzNFQVVV?=
 =?utf-8?B?Y2szS3kwOW9hdVh4RlhvV2xEQlJMRWN6MlNleXJRQmZ3TUYxcU1xL09WZHhO?=
 =?utf-8?B?QWxXUlV5cjBtTk9UNUVPQ1d0dktUalp3NXVyTjhpK1lRRDdwb3JQRXZUYjJQ?=
 =?utf-8?B?c05EVHBGRmJ0OWQ4bzdRUkpOZ0cwTWdFemdESUdGaUZCOXhSWTBwMGp1VENQ?=
 =?utf-8?B?dVFGYzRLNU5ILzRPd2lhYUdJZG9MWExvRVNBMG95b29DeUxQVFBZQVg0bDlk?=
 =?utf-8?B?ZXl2VlIwdzUrYkNLTTVpTGl1SXRXOUdxWHdvblozVENVU2p3MmtFWCtNN09r?=
 =?utf-8?B?UHB1VHlpS250cEVmZVJvVVg0N2w5WmYrc0FYQjc0ejgxT2dwa1dsNmpSVXJs?=
 =?utf-8?B?d1JTbFlmR25BVjhKWmo5a2N5d3g0RWQ5dGNvelpMODBFeXlrZjFZWWtsQUlz?=
 =?utf-8?B?NUZWaTNIbUNZQmlMMkx2NHhxS3AzM0RsR0Q5dlhxc21BRzFwTWRHSUorVUU1?=
 =?utf-8?B?QnNqTVpJbnNmY2NLSDZGc2JJVXZnT3VhN25jdjZkcDZSaFNKbVk2eUpocGJM?=
 =?utf-8?B?aDhQd2pzT2VXYlkyQzNwUGhFbXo4c0RrTERjVk9nRUluUEdyV2c0bmxMZVdq?=
 =?utf-8?B?WXNsOXF6a1FnZDIvSjZGVFM5M2pQZ2o0REpST2d6UDgyaW96eTMyWFI1VUwz?=
 =?utf-8?B?Y0l3YXI4MXZhT0JFMnVJbGF0b3JKYjZzSFYzUzdTT2htKzVCRlhEQmlrQTg3?=
 =?utf-8?B?OEVhVHJFRkw2NGNOOGRwQVMzT2tPMFZ3UGdHQzlwbmZxVlh6K0dhSFdId0hi?=
 =?utf-8?B?S0p5RzRWZnlnL0JBcUZHYWJ2WTh1bnRWajFMK0lid2ttckg4dUZQTWplMFpB?=
 =?utf-8?B?WGU5MTdYKys0cEU5Qm5FT2xGSUwvaHBrcFhtZ3NEclhDRytZQ1RrQi9ueXlx?=
 =?utf-8?B?UXMwTTBLanYrU2w3L0NUVi9DcU9rL2Ntc3o1aCtlSTdteDRDWk83eGFxV1lr?=
 =?utf-8?B?aGduaWx3bS9BUjQ4WnhmTWtlQjVlRzJROVlLSW5LTGJRZjNlc3VJZWFQN3F0?=
 =?utf-8?B?UXFEbEh6ZU5RYVowTWdZR00zZm1VMlVoa1F4emtjNWxuQ2VjN01HMGF4cHFS?=
 =?utf-8?B?TE1JaWd2NHRuQ2hRWGE0UkZWOUFWU1g4bHFqWDBDNGRGbUQzb3J5S21mbTZY?=
 =?utf-8?B?ZkpWbGIvQkp4angyVWVubGEzMFR5emFoeTg3ZkFodDllWWQyc1g0N0hldXp3?=
 =?utf-8?B?SHJiQm9pdXBwVEo0SkFSZUVyS210YVN6aGtwSlNIeXhqMGhpYk9FYmVhQWVh?=
 =?utf-8?B?eUFlZG9tUjBWRnBhYjJsT0d2ZXJ4dGZOTFlwaWR2N1daYS9ZWUZwZjRJUitt?=
 =?utf-8?B?c2VGUGp0OCsvRUozU1ZtejU5SXlNSjk2ZjN0bHk3d0N2ayszUXJUZ280YnBF?=
 =?utf-8?B?VWEyWDZpTE5LVlIvYWVENzVxeTEydmhIb20vdU5mZnF6eFAxREk1QlVhdGEv?=
 =?utf-8?Q?GVa0cy6PAd2qCYcEgp4wvuDorNjl46NAiI6l3?=
X-Exchange-RoutingPolicyChecked: 
	pa7cDk7ME8CELp15kD8kz7xHvuE0uWb9j+wE6YMGiHgo17iee+if7O4qGi7kCmcIpi3SGYq79odmPCWK+R9qx3mrlnD7EhhWqU1m4N7Op8YxVBZgwTduCeIRtSgf2OqRzrbss76yxbcLwQ8kF1OSBNgsiIHCGcRv5XtUTpZ0H4VANYLLZIRlmaNahoFrkgTqDZBd6TV6x7XtAqbcDGU3EldQZc+1xx7Klqig57YqHXWYmahXWXXxVEjzzegW2qUT7py3wMOxbzSGt4KKUlw9NKnTfO/N4f479xVbJKV6+UOwTQBM/kTX1Xj+PQWKNZJzGva52JeHKybF6Pv6scuVkQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de5bad6c-3a53-4ccc-cdcf-08dee6e0f80b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:31:44.3373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXvOZ6/sl4BPXLNcIC8DY1BQ/JdFUvgYBuedPDGrPcsouqrwbPjahF0XWQy+psYzYPotqGSxltg9iYuk/vC3CS20hzz01R7suaXKBbZujrhy4KaX8kkDZYBHQQuzJZhC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB445312
X-Proofpoint-ORIG-GUID: E6YdjWugzT77yL4fxdB8qKmmWbWuKnyh
X-Proofpoint-GUID: E6YdjWugzT77yL4fxdB8qKmmWbWuKnyh
X-Authority-Analysis: v=2.4 cv=AOkSgtoa c=1 sm=1 tr=0 ts=6a5ef632 cx=c_pps
 a=CD2IJdD5qp8L8UJuiUkm2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8
 a=8wEic9LhAAAA:8 a=ag1SF4gXAAAA:8 a=Tr0CIQbrg0mKLZOxC6IA:9
 a=5O9rwaaqg39D_ep3:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=M9VCcFR7d36vLOFuqMn8:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0MyBTYWx0ZWRfXyCYK//DzmmRW
 yIUT+C4poJjdjVvXzg8qwjjj+Ou44C+nHz8Ptq1OpFWaEUsQNFIRGLtRctvD22FGZEOQQruFC7n
 5DncIkeE7x1MaqfECdSRwKE1fAoMGlhUBiXKqL2Y/dvk8mhPdwCR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0MyBTYWx0ZWRfXz8ZV33W9JCgG
 eJl5m97a/0/VLsJiE1g1GzK+iXxtWGtQCp7lznIDukIwCphUcNyNeBkGcazEJV9DKLrAX5v55EZ
 zst7GwPdqpG/KGDBF4T4uAM0nZrnYOk+oPVitKQJ1ulU2V4zsUXjxrUfLb9/7c6Yf783NHWLpYs
 vlHef2DpaxmRdCQFpmed/bQFww0Ga7xOGpmn7E5hLGdXh6RwddQtQm68R8BNZ5jd7hEp300RiaO
 MLHJeW80XPxXXsBPNeejlQUSqVZYq4PDMD3qKa/h5fAD0rzNzSQxvu0wiwPHJKRNjGUTy0OsBoN
 YYExNAgjyUOEC+eG4rt6dtu6rWDTZTok9A8fyki3uzDfNiPTdbtOzYs0Vbw2b9z40bjOgL+aTeQ
 4S3TKt2CXffdluHxXl2QX4+vnG/goK53Cq4xPQ2ltQbN/E5yxmdI1MyWJ1LtjsS9LsXo5x3co0S
 RUOc7YSS79GucQjkPNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210043
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 66L46B1r1635816
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 04:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241497

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

[YOCTO #15808]

Consolidate Rust source management across all Rust recipes (rust, cargo,
libstd-rs and their native/nativesdk variants) into a single shared
source tree using the work-shared pattern.

Disk savings: a world build with multilibs enabled, together with
nativesdk-rust and nativesdk-cargo, now shares a single ~4.2 GB rustc-src
tree instead of maintaining up to 11 independent copies (~46.2 GB total).

Performance (clean core-image-sato build, qemux86-64):

Before: 68m53.507s
After:  65m46.159s
Improvement: 3m07.348s (~4.5%)

New files:

- rust-source.bb: A shared recipe that fetches, unpacks, and patches the
  rustc source tree into ${TMPDIR}/work-shared/rust-source-${PV}-${PR}.
  All build/install/packaging tasks are disabled; this recipe exists sole=
ly
  to provide a single copy of the source. Inherits allarch/nopackages,
  excludes itself from rm_work, and is hidden from world builds.
  Also defines RUST_BUILD_ARCH locally since this recipe does not inherit
  rust-common.bbclass but still needs the mapping for snapshot fetching
  via rust-snapshot.inc.

- common-source.inc: Included by consumer recipes (rust, cargo, libstd-rs=
)
  to disable their local do_fetch/do_unpack/do_patch tasks, clear SRC_URI=
,
  and add task dependencies on rust-source-${PV} for configure, licensing=
,
  and SPDX generation. Also provides is_work_shared_spdx() override for
  correct SPDX shared-workdir detection.

Modified files:

- rust-source.inc:
  - Replace RUST_VERSION with explicit MAJOR_VER/MINOR_VER/PATCH_VER and =
PV.
  - Set UNPACKDIR to the work-shared location so all consumers share one
    source tree via RUSTSRC and S.

- rust_git.bb (renamed from rust_1.96.1.bb):
  - Add 'require common-source.inc' to use the shared source tree.
  - Set B =3D ${WORKDIR}/build to separate build artifacts from shared so=
urce.
  - Set CARGO_HOME =3D ${WORKDIR}/cargo_home to isolate cargo caching.
  - Set build-dir =3D "rust-build" in config.toml to distinguish Yocto's =
build
    directory (B), which holds config.toml, from the bootstrap's own buil=
d
    output directory. Without this, bootstrap defaults to "build/" inside=
 B,
    creating an ambiguous build/build/ nesting.
  - Use absolute ${S}/src/bootstrap/bootstrap.py path since cwd is now B.
  - Update install functions to reference rust-build/ instead of build/.
  - Update do_test_compile to use absolute ${S}/src/tools/ path.
  - Change do_rust_setup_snapshot from 'after do_unpack' to depend on
    rust-source-${PV}:do_unpack (since local do_unpack is removed).

- cargo_git.bb (renamed from cargo_1.96.1.bb):
  - Add 'require common-source.inc' to use the shared source tree.
  - Change do_cargo_setup_snapshot from 'after do_unpack' to depend on
    rust-source-${PV}:do_unpack.

- libstd-rs_git.bb (renamed from libstd-rs_1.96.1.bb):
  - Add 'require common-source.inc' to use the shared source tree.

- rust-cross-canadian_git.bb (renamed from rust-cross-canadian_1.96.1.bb)=
:
  - Rename only (version now comes from rust-source.inc via PV).

- rust-common.bbclass:
  - Add a second --remap-path-prefix for ${TMPDIR}/work-shared so debug
    info from the shared source tree is correctly remapped.
  - Retain RUST_BUILD_ARCH definition so that consumer recipes (rust, car=
go,
    libstd-rs) which inherit this class can resolve snapshot directory na=
mes
    used by do_rust_setup_snapshot and do_cargo_setup_snapshot.

- lib/oeqa/selftest/cases/rust.py:
  - Adapt the selftest to the build-dir/source-dir split: use B for build
    artifacts and RUSTSRC for source paths.
  - Update remote-test-server copy path from build/ to rust-build/.
  - Pass --build-dir and --config explicitly to bootstrap.py.

- conf/distro/include/maintainers.inc:
  - Add maintainer entry for the new rust-source recipe.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-common.bbclass       |  4 +-
 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/lib/oeqa/selftest/cases/rust.py          |  9 ++-
 .../rust/{cargo_1.96.1.bb =3D> cargo_git.bb}    |  8 ++-
 meta/recipes-devtools/rust/common-source.inc  | 28 ++++++++++
 .../{libstd-rs_1.96.1.bb =3D> libstd-rs_git.bb} |  4 ++
 ...n_1.96.1.bb =3D> rust-cross-canadian_git.bb} |  0
 meta/recipes-devtools/rust/rust-source.bb     | 56 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    | 16 +++++-
 .../rust/{rust_1.96.1.bb =3D> rust_git.bb}      | 31 +++++++---
 10 files changed, 140 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.96.1.bb =3D> cargo_git.bb} (9=
1%)
 create mode 100644 meta/recipes-devtools/rust/common-source.inc
 rename meta/recipes-devtools/rust/{libstd-rs_1.96.1.bb =3D> libstd-rs_gi=
t.bb} (92%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.96.1.bb =3D> ru=
st-cross-canadian_git.bb} (100%)
 create mode 100644 meta/recipes-devtools/rust/rust-source.bb
 rename meta/recipes-devtools/rust/{rust_1.96.1.bb =3D> rust_git.bb} (93%=
)

diff --git a/meta/classes-recipe/rust-common.bbclass b/meta/classes-recip=
e/rust-common.bbclass
index 057aeda67a..6bc42016d1 100644
--- a/meta/classes-recipe/rust-common.bbclass
+++ b/meta/classes-recipe/rust-common.bbclass
@@ -14,7 +14,9 @@ FILES:${PN}-dev +=3D "${rustlibdir}/*.rlib ${rustlibdir=
}/*.rmeta"
 FILES:${PN}-dbg +=3D "${rustlibdir}/.debug"
=20
 RUSTLIB ?=3D "-L ${STAGING_DIR_HOST}${rustlibdir}"
-RUST_DEBUG_REMAP =3D "--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC=
_DIR}"
+RUST_DEBUG_REMAP =3D "--remap-path-prefix=3D${WORKDIR}=3D${TARGET_DBGSRC=
_DIR} \
+                    --remap-path-prefix=3D${TMPDIR}/work-shared=3D${TARG=
ET_DBGSRC_DIR} \
+"
 RUSTFLAGS +=3D "${RUSTLIB} ${RUST_DEBUG_REMAP}"
 RUSTLIB_DEP ??=3D "libstd-rs"
 RUST_PANIC_STRATEGY ??=3D "unwind"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 4c6307086c..bfff5082c2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -784,6 +784,7 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-source-1.96.1 =3D "Deepesh Varatharajan <Deepe=
sh.Varatharajan@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
index c961a8f652..4111d72044 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -46,7 +46,8 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
         recipe =3D "rust"
         start_time =3D time.time()
         bitbake("{} -c test_compile".format(recipe))
-        builddir =3D get_bb_var("RUSTSRC", "rust")
+        builddir =3D get_bb_var("B", "rust")
+        sourcedir =3D get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
         default_installed_packages =3D ["libgcc", "libstdc++", "libatomi=
c", "libgomp", "libzstd", "llvm", "openssl"]
         features =3D []
@@ -111,7 +112,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
             # Copy remote-test-server to image through scp
             host_sys =3D get_bb_var("RUST_BUILD_SYS", "rust")
             ssh =3D SSHControl(ip=3Dqemu.ip, logfile=3Dqemu.sshlog, user=
=3D"root")
-            ssh.copy_to(builddir + "/build/" + host_sys + "/stage2-tools=
-bin/remote-test-server","~/")
+            ssh.copy_to(builddir + "/rust-build/" + host_sys + "/stage2-=
tools-bin/remote-test-server","~/")
             # Execute remote-test-server on image through background ssh
             command =3D '~/remote-test-server --bind 0.0.0.0:12345 -v'
             sshrun=3Dsubprocess.Popen(("ssh", '-o',  'UserKnownHostsFile=
=3D/dev/null', '-o',  'StrictHostKeyChecking=3Dno', '-f', "root@%s" % qem=
u.ip, command), shell=3DFalse, stdout=3Dsubprocess.PIPE, stderr=3Dsubproc=
ess.PIPE)
@@ -131,8 +132,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase,=
 OEPTestResultTestCase):
             # PowerPC mac99 QEMU has 768MB RAM limit, so we need to mini=
mize test binary sizes
             cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo -Cl=
ink-arg=3D-lz -Clink-arg=3D-lzstd';"
             # Trigger testing.
+            # Run bootstrap from sourcedir with explicit --build-dir and=
 --config
+            # pointing to the separate build directory.
             cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";" % q=
emu.ip
-            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py te=
st %s --target %s" % (builddir, testargs, targetsys)
+            cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.py --=
build-dir %s/rust-build --config %s/config.toml test %s --target %s" % (s=
ourcedir, builddir, builddir, testargs, targetsys)
             retval =3D runCmd(cmd)
             end_time =3D time.time()
=20
diff --git a/meta/recipes-devtools/rust/cargo_1.96.1.bb b/meta/recipes-de=
vtools/rust/cargo_git.bb
similarity index 91%
rename from meta/recipes-devtools/rust/cargo_1.96.1.bb
rename to meta/recipes-devtools/rust/cargo_git.bb
index f16688fc76..8047a2b255 100644
--- a/meta/recipes-devtools/rust/cargo_1.96.1.bb
+++ b/meta/recipes-devtools/rust/cargo_git.bb
@@ -13,6 +13,8 @@ LIC_FILES_CHKSUM =3D " \
=20
 require rust-source.inc
 require rust-snapshot.inc
+# Use shared source tree from rust-source.bb; disables local fetch/unpac=
k/patch
+require common-source.inc
=20
 S =3D "${RUSTSRC}/src/tools/cargo"
 CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
@@ -21,6 +23,9 @@ CVE_PRODUCT =3D "rust-lang:cargo"
=20
 inherit cargo pkgconfig
=20
+# Explicit CARGO_HOME avoids cargo caching in the shared source tree
+CARGO_HOME =3D "${WORKDIR}/cargo_home"
+
 DEBUG_PREFIX_MAP +=3D "-ffile-prefix-map=3D${RUSTSRC}/vendor=3D${TARGET_=
DBGSRC_DIR}"
=20
 do_cargo_setup_snapshot () {
@@ -32,9 +37,10 @@ do_cargo_setup_snapshot () {
 	fi
 }
=20
-addtask cargo_setup_snapshot after do_unpack before do_configure
+addtask cargo_setup_snapshot before do_configure
 do_cargo_setup_snapshot[dirs] +=3D "${WORKDIR}/${CARGO_SNAPSHOT}"
 do_cargo_setup_snapshot[vardepsexclude] +=3D "UNINATIVE_LOADER"
+do_cargo_setup_snapshot[depends] +=3D "rust-source-${PV}:do_unpack"
=20
 do_compile:prepend () {
 	export RUSTC_BOOTSTRAP=3D"1"
diff --git a/meta/recipes-devtools/rust/common-source.inc b/meta/recipes-=
devtools/rust/common-source.inc
new file mode 100644
index 0000000000..a0d4dc542c
--- /dev/null
+++ b/meta/recipes-devtools/rust/common-source.inc
@@ -0,0 +1,28 @@
+# common-source.inc - Disable source tasks for recipes using shared rust=
-source
+#
+# Recipes that include this file rely on rust-source-${PV} for fetching,
+# unpacking, and patching the Rust source tree. This avoids duplicating =
the
+# ~4.2 GB rustc-src tree per recipe variant (rust, cargo, libstd-rs and =
their
+# native/nativesdk counterparts).
+
+# Disable local fetch/unpack/patch since rust-source-${PV} handles them
+do_fetch() {
+        :
+}
+do_fetch[noexec] =3D "1"
+deltask do_unpack
+deltask do_patch
+
+# Clear SRC_URI to prevent fetcher warnings from stale URIs inherited vi=
a .inc
+SRC_URI =3D ""
+
+# Ensure the shared source is fully ready before dependent tasks run
+do_configure[depends] +=3D "rust-source-${PV}:do_patch"
+do_populate_lic[depends] +=3D "rust-source-${PV}:do_unpack"
+do_create_spdx[depends] +=3D "rust-source-${PV}:do_patch"
+
+# The SPDX class uses is_work_shared_spdx() to detect shared workdirs.
+# Since we redirect S rather than WORKDIR, the default detection fails.
+# Override to always return True so SPDX processing works correctly.
+def is_work_shared_spdx(d):
+    return True
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb b/meta/recipe=
s-devtools/rust/libstd-rs_git.bb
similarity index 92%
rename from meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_git.bb
index 2a5e977a5e..31d42a8525 100644
--- a/meta/recipes-devtools/rust/libstd-rs_1.96.1.bb
+++ b/meta/recipes-devtools/rust/libstd-rs_git.bb
@@ -5,6 +5,7 @@ LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
 LIC_FILES_CHKSUM =3D "file://../../COPYRIGHT;md5=3D11a3899825f4376896e43=
8c8c753f8dc"
=20
 require rust-source.inc
+require common-source.inc
=20
 # The dummy crate named `sysroot` represents the standard library target.
 #
@@ -30,6 +31,9 @@ CARGO_FEATURES ?=3D "panic-unwind backtrace"
 CARGO_BUILD_FLAGS +=3D "--features '${CARGO_FEATURES}'"
 CARGO_VENDORING_DIRECTORY =3D "${RUSTSRC}/vendor"
=20
+# Explicit CARGO_HOME avoids cargo caching in the shared source tree
+CARGO_HOME =3D "${WORKDIR}/cargo_home"
+
 do_compile:prepend () {
     # For Rust 1.13.0 and newer
     export RUSTC_BOOTSTRAP=3D"1"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.96.1.bb b/m=
eta/recipes-devtools/rust/rust-cross-canadian_git.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.96.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_git.bb
diff --git a/meta/recipes-devtools/rust/rust-source.bb b/meta/recipes-dev=
tools/rust/rust-source.bb
new file mode 100644
index 0000000000..ba696984b3
--- /dev/null
+++ b/meta/recipes-devtools/rust/rust-source.bb
@@ -0,0 +1,56 @@
+# rust-source.bb - Shared source recipe for the Rust toolchain
+#
+# This recipe fetches, unpacks, and patches the rustc source tree into a
+# work-shared location so that rust, cargo, libstd-rs, and their native/=
nativesdk
+# variants all share a single copy of the source. This eliminates duplic=
ation
+# (up to 11 copies of the ~4.2 GB source tree in multilib + nativesdk bu=
ilds)
+# and significantly reduces disk usage (~46.2 GB -> ~4.2 GB for rustc-sr=
c).
+#
+# Only do_fetch, do_unpack, and do_patch are meaningful here. All other
+# tasks are disabled since this recipe exists solely to provide sources.
+
+SUMMARY =3D "Rust compiler and runtime libaries"
+HOMEPAGE =3D "http://www.rust-lang.org"
+SECTION =3D "devel"
+LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
+LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c75=
3f8dc"
+
+# This recipe only provides source; disable build/install/packaging task=
s
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+deltask do_populate_lic
+
+# Prevent rm_work from removing the shared source tree
+RM_WORK_EXCLUDE +=3D "${PN}"
+
+require rust-source.inc
+require rust-snapshot.inc
+
+inherit allarch nopackages
+
+PN =3D "rust-source-${PV}"
+BPN =3D "rust-source"
+
+# Place WORKDIR under work-shared so all consumers reference the same lo=
cation
+WORKDIR =3D "${TMPDIR}/work-shared/rust-source-${PV}-${PR}"
+SSTATE_SWSPEC =3D "sstate:rust-source::${PV}:${PR}::${SSTATE_VERSION}:"
+
+# Use work-shared stamp directory so sstate is shared across all archite=
ctures
+STAMP =3D "${STAMPS_DIR}/work-shared/rust-source-${PV}-${PR}"
+STAMPCLEAN =3D "${STAMPS_DIR}/work-shared/rust-source-${PV}-*"
+
+DEPENDS =3D ""
+PACKAGES =3D ""
+baselib =3D "lib"
+PACKAGE_ARCH =3D "all"
+
+B =3D "${WORKDIR}/build"
+
+# rust-source.bb does not inherit rust-common.bbclass (it is allarch/nop=
ackages
+# and has no toolchain dependencies), so we define RUST_BUILD_ARCH local=
ly for
+# snapshot URL resolution in rust-snapshot.inc.
+RUST_BUILD_ARCH =3D "${@{'ppc': 'powerpc', 'ppc64': 'powerpc64', 'ppc64l=
e': 'powerpc64le', 'riscv64': 'riscv64gc'}.get(d.getVar('BUILD_ARCH'), d.=
getVar('BUILD_ARCH'))}"
+
+EXCLUDE_FROM_WORLD =3D "1"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index 5678e00671..49207a3947 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,6 +1,12 @@
-RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
+# Version is split into MAJOR_VER and MINOR_VER for easy bumping and
+# to allow consistent use of PV across all consuming recipes.
+MAJOR_VER =3D "1"
+MINOR_VER =3D "96"
+PATCH_VER =3D "1"
=20
-SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-sr=
c.tar.xz;name=3Drust \
+PV =3D "${MAJOR_VER}.${MINOR_VER}.${PATCH_VER}"
+
+SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;n=
ame=3Drust \
             file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-lin=
ux-g.patch;patchdir=3D${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=3D=
${RUSTSRC} \
@@ -13,7 +19,11 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-=
${RUST_VERSION}-src.tar.xz;n
 "
 SRC_URI[rust.sha256sum] =3D "77a6ff3003a4ad0cb00697b043c879e3e1a15d945b1=
a1f63818903bfc3fa8b98"
=20
-RUSTSRC =3D "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
+# Point UNPACKDIR into the work-shared location so rust-source.bb and al=
l
+# consumers (via S/RUSTSRC) reference a single shared source tree.
+UNPACKDIR =3D "${TMPDIR}/work-shared/rust-source-${PV}-${PR}/sources"
+RUSTSRC =3D "${UNPACKDIR}/rustc-${PV}-src"
+S =3D "${RUSTSRC}"
=20
 UPSTREAM_CHECK_URI =3D "https://forge.rust-lang.org/infra/other-installa=
tion-methods.html"
 UPSTREAM_CHECK_REGEX =3D "rustc-(?P<pver>\d+(\.\d+)+)-src"
diff --git a/meta/recipes-devtools/rust/rust_1.96.1.bb b/meta/recipes-dev=
tools/rust/rust_git.bb
similarity index 93%
rename from meta/recipes-devtools/rust/rust_1.96.1.bb
rename to meta/recipes-devtools/rust/rust_git.bb
index 8b0f1d1459..da042ffaae 100644
--- a/meta/recipes-devtools/rust/rust_1.96.1.bb
+++ b/meta/recipes-devtools/rust/rust_git.bb
@@ -4,6 +4,10 @@ SECTION =3D "devel"
 LICENSE =3D "(MIT | Apache-2.0) & Unicode-3.0"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a3899825f4376896e438c8c75=
3f8dc"
=20
+require rust-source.inc
+require rust-snapshot.inc
+require common-source.inc
+
 inherit rust
 inherit cargo_common
=20
@@ -24,6 +28,9 @@ INHIBIT_DEFAULT_RUST_DEPS:class-native =3D "1"
 PROVIDES:class-native =3D "virtual/${TARGET_PREFIX}rust"
=20
 S =3D "${RUSTSRC}"
+# Separate build directory from the shared source tree so that multiple
+# variants (target, native, nativesdk) don't conflict in the source dir.
+B =3D "${WORKDIR}/build"
=20
 # Use at your own risk, accepted values are stable, beta and nightly
 RUST_CHANNEL ?=3D "stable"
@@ -38,6 +45,9 @@ RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NA=
TIVE}/llvm-config"
 # own vendoring.
 CARGO_DISABLE_BITBAKE_VENDORING =3D "1"
=20
+# Explicit CARGO_HOME avoids cargo caching in the shared source tree
+CARGO_HOME =3D "${WORKDIR}/cargo_home"
+
 setup_cargo_environment () {
     # The first step is to build bootstrap and some early stage tools,
     # these are build for the same target as the snapshot, e.g.
@@ -66,11 +76,11 @@ do_rust_setup_snapshot () {
         done
     fi
 }
-addtask rust_setup_snapshot after do_unpack before do_configure
+addtask rust_setup_snapshot before do_configure
 addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] +=3D "${WORKDIR}/rust-snapshot"
 do_rust_setup_snapshot[vardepsexclude] +=3D "UNINATIVE_LOADER"
-do_rust_setup_snapshot[depends] +=3D "patchelf-native:do_populate_sysroo=
t"
+do_rust_setup_snapshot[depends] +=3D "patchelf-native:do_populate_sysroo=
t rust-source-${PV}:do_unpack"
=20
 RUSTC_BOOTSTRAP =3D "${STAGING_BINDIR_NATIVE}/rustc"
 CARGO_BOOTSTRAP =3D "${STAGING_BINDIR_NATIVE}/cargo"
@@ -173,6 +183,12 @@ python do_configure() {
     # nothing about when trying to build some stage0 tools (like fabrica=
te)
     config.set("build", "build", e(d.getVar("RUST_BUILD_SYS")))
=20
+    # Yocto's B (${WORKDIR}/build) is where config.toml lives. Rust's
+    # bootstrap creates its own build output directory inside B; name it
+    # "rust-build" to avoid ambiguity with Yocto's build directory and
+    # prevent a confusing build/build/ nesting.
+    config.set("build", "build-dir", e("rust-build"))
+
     # [install]
     config.add_section("install")
     # ./x.py install doesn't have any notion of "destdir"
@@ -223,13 +239,10 @@ rust_runx () {
=20
     oe_cargo_fix_env
=20
-    python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argumen=
t(d, '-j %d')} "$@" --verbose
+    python3 ${S}/src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_ar=
gument(d, '-j %d')} "$@" --verbose
 }
 rust_runx[vardepsexclude] +=3D "PARALLEL_MAKE"
=20
-require rust-source.inc
-require rust-snapshot.inc
-
 INSANE_SKIP:${PN}:class-native =3D "already-stripped"
 FILES:${PN} +=3D "${libdir}/rustlib"
 FILES:${PN} +=3D "${libdir}/*.so"
@@ -241,7 +254,7 @@ do_compile () {
 do_test_compile[dirs] =3D "${B}"
 do_test_compile () {
     replace_llvm_config_path
-    rust_runx build src/tools/remote-test-server --target "${RUST_TARGET=
_SYS}"
+    rust_runx build ${S}/src/tools/remote-test-server --target "${RUST_T=
ARGET_SYS}"
 }
=20
 ALLOW_EMPTY:${PN} =3D "1"
@@ -282,7 +295,7 @@ rust_do_install:class-nativesdk() {
=20
     install -d ${D}${bindir}
     for i in cargo-clippy clippy-driver rustfmt; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release=
/$i ${D}${bindir}
+        cp rust-build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/re=
lease/$i ${D}${bindir}
         patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
=20
@@ -322,7 +335,7 @@ rust_do_install:class-target() {
=20
     install -d ${D}${bindir}
     for i in ${EXTRA_TOOLS}; do
-        cp build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/release=
/$i ${D}${bindir}
+        cp rust-build/${RUST_BUILD_SYS}/stage2-tools/${RUST_HOST_SYS}/re=
lease/$i ${D}${bindir}
         patchelf --set-rpath "\$ORIGIN/../lib" ${D}${bindir}/$i
     done
=20
--=20
2.49.0


