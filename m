Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9B8C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 12:56:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21986.1784638602158391841
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 05:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=l29BfEaC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16624639ec=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LBlkG52408131
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 12:56:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=fPPwY1y/+2LvM7k5bMMVX8
	Z6WDYOeQ7esMIYl7t5/IE=; b=l29BfEaCL31T3Yi/fdxNr1YQUW39dWYjS+VaYB
	Yec3WeEWG4kODlAEJHoKnsy6CBgxWhKHE9/xsyPt5hrDHE+y+va3htjvQEiIStBp
	mrmTWOjbFo6MLzm4T7COybt13v7qlTbqjDBvUU57Vy+f6DJp/4B2gdSNSgGNEUfZ
	dWnqvel7y7+dGQrM1ddwMrfgIkwYDehQUTW3+BIGuHOFen51g0fN8zBA3+bbw/5y
	C/U/WsCXSjsGzPd2R4bUZ9qNCUyQW78m8ZzL/ec1uXZB5+bwpWLnGU9ZAU6eLpA/
	JvHGcmgSj0JHY3ac/wrOfcVAChseJCZPLhCwUn6q9CnoZyPQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011003.outbound.protection.outlook.com [52.101.57.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg0f5ctr8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 12:56:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jK2VI7n9Kc7hsIBWl+HPuayBECwkvdnaTu05gsbRT/xjiua9SXX397ArOmKTFpgzExAZSI4ST/A9KtEKpr2lgpbWumLpgK0mW1qVTnNzMwj6Hsuhneb28tRAOwNjlOLX5PkQrdp8WnhAN3EvPm7zYAYGyrc28S356WWKPMqi3H82WS/J8PNFM/YPLV+WLJfnazIe35VGS86IxYfuOBnTh0yIQ8g1nX74/yaywRRv3HkwKLdtwMORjk0ta4PevhMdkBjgmP5/Qakcx06LbDRwhhYhZOzfWEz+jxyi/MJC2vzhmTbbfLKBYEvT13px/pMpPzIV9vbVK6/p7GJN0uTe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPPwY1y/+2LvM7k5bMMVX8Z6WDYOeQ7esMIYl7t5/IE=;
 b=wXvDylN0oWtky2iHZBeWkH8t3Q1PL1r+3InX01PpFw0rKR8Tl67ANyueELmOzG6gooKtbtosANPnqTyBQl+yAOUaFd1SrYzf6gM3nI27ZTxCOHD1/tkjEehQmH85cLw9Dpkzr2IppPISLmEkBrl0CxjwwsgdU2Vl71EWzuV6tzXmrRatkQaHLp6hfgJAO2HRNaA2LxapexGlEaZfsQ79Xp12HreTbWksk78N77dyYc5i7Mn1PdoRXFylE9MK5IhJeCWcuGaJygUpwpeOzbJFFDiWNh42Tgw/0gelGg5YqdS0oK7O246fZEX8+z8srOFaZsMoC761k4/s6mGwPCaTsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW4PR11MB6737.namprd11.prod.outlook.com (2603:10b6:303:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 12:56:37 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 12:56:36 +0000
Content-Type: multipart/alternative;
 boundary="------------28yXQQ23BX6udSXxfj4F4eca"
Message-ID: <a2e02f96-4d13-425a-88ef-4748635266ec@windriver.com>
Date: Tue, 21 Jul 2026 08:56:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to
 support Ubuntu 26.04 on Scarthgap
To: Alexander Kanavin <alex.kanavin@gmail.com>, SunilKumar.Dora@windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr>
 <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com>
 <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr> <DJJV9FGWRHJB.26TA7NN2T8LVS@smile.fr>
 <CANNYZj8nhGqmvy0tTnUHCNtnjkjweE-OwqL3gDL0mOYGgQO8OQ@mail.gmail.com>
 <DJO58J8D7X5G.2FRK2OBFYWIDO@smile.fr>
 <3a7e0892-9656-48f0-ae64-ee9ee047b6e1@windriver.com>
 <CANNYZj-UN-4ZR=X4KQLMawCSYoe8zpWqWmPN0xwLkVGNCDNcYw@mail.gmail.com>
 <743437.1784163705822875917@lists.openembedded.org>
 <CANNYZj9=88aGwqtyBXqyaQJvDGTN7p=xkgf9eH-9ESrWcJaSbQ@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CANNYZj9=88aGwqtyBXqyaQJvDGTN7p=xkgf9eH-9ESrWcJaSbQ@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW4PR11MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: ed34235a-68c3-48a6-7590-08dee7277fa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|22082099003|4143699003|8096899003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	FKXKX0h5+jB7H2mpeTBaiEexq9o/lmFSnAOuHiQZsKYQc+FM8y60zziax+wcD09xdFeXMcaWV1+bU92H+nphokigoCjgObNoHMY65l6cveTQ0B6R+Atd+7CzAzPLmiz4p+22CDwnrpE0bNFyAFrP3/D+bF2zfX/u+u0NiNfZBj5Qd4lUYH1Zp7+ATgB1Ur5FsqLpR6aWIfdhLX5BY58ezq60pheGG5opSS3XnprYz17Li50LlkfO0SDtGbGe+aojFrkH/PrsvsdFRJC0AVQ49WT9YJ3XEltfToWkE1vLoCWfDLL1Al3xssvrBGNMEnEDqLhCdHScdNPG0DUBafQSZ3hFXSYbnYn2//PwIUNYJrnR2IntEy8i9IXz+P/U6UO9ko302g5afrt7iRHL8ELJ7/88WhOrlingiP67Pt57OuwisU3hSaf8RS1Ovh94Nj9hn4mJ4v0KWPmAmTmbmYDi4coFBehWDuCeFXcyrpkVSkPXKU5mVrexP1LQdXSgNcsx+bV6ub5r+1GnEzYX11TA68Fvd3GBsJi15fCUOxQ+SxxoJfbwo8UpyrFJSL+OFObDw2kl4NevCfx8tU5enk8oZhkGU90wbN9CVwsnwmpptSIdsHvCepmHXuI3Y1cB2fWpNfVFNu731CvDNYW7erKyz5Q/dz0I8dX+dYEnYEpwpSY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(8096899003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WXIxWnBqaE5aWUNUMXhmOVp5NURjdHc0WjBacytQeTJNeEdQQmN1TjlJR2R1?=
 =?utf-8?B?akM4R3VSNjBhdDByRGtpN0dCSzJUNG9wMDQvNkRMUlJ1a242cC9tQjBZeFBs?=
 =?utf-8?B?anpNaEpzYWlkSGs2MlkzYkhKaENxYUoxUE1Jd1VYck5Zck9QenhaVlpyalA0?=
 =?utf-8?B?WmNFSWR4WWlJNDNGMnJwK0NFd1pnNkFHMW5qZzRMQUdmRXBOblhLeDR0V2xU?=
 =?utf-8?B?TTMrRzArSi9jNkduWHZMMUVYMlM4ZVJLV3NQcVpCNHRUTlZMVXppdWRLby9E?=
 =?utf-8?B?SlNzcVVyK3FiaWRseDd2VlhTZHpqMDJ1OE5GS3IyaGxwNkRia1FhbmlYNVI2?=
 =?utf-8?B?cTByK20xVGJoalBUVlJyZVNBTkFtTWJMZktwWGJ6dXhHWVdMVTUxUWhZbEVH?=
 =?utf-8?B?Y09sUDdWSlovQVVCT3gyWUFIWVlkaHFURVlGYnBFeE5JT0J0eTlMd1ZOQjVR?=
 =?utf-8?B?MXFlQ3k0TkVkb1dUU0V1MGtXR214alpjWGtCdG43MllwMDdHaVZSeVBBUG01?=
 =?utf-8?B?RkpXa0lYdFhKRDJXTGRhaTB1SmhyU29sdnRwOUk2U0lqL1pBZEhJcGMxb0Fj?=
 =?utf-8?B?clkvbHN2d0VCN245ek42emFrUEt1ZGRvOXFNZHd3VmREL1pEb0xOTjRNbnNR?=
 =?utf-8?B?UEplV0w2VVVCWDZ4YzU3UkdXck5ienB1QzJaMjFqdjJNQk1JbGtGc24vT1Mx?=
 =?utf-8?B?SWh1SXhMRzRKcTFkdy9wRjBXZlJ0TEI4VnpOSElxbkhNNWtGemE0UkFZeDBi?=
 =?utf-8?B?TTNlODlsY3E3L1Q2bG44cVZYY0c0VHhLYlh4dytmSTN1THBia1ZVMm90Y0Nw?=
 =?utf-8?B?dStXNS9mdVBZbXU0cW1udC8vbjdaZDVQdktoVWJ3cW1qdHo2UUNNbnRjWVQy?=
 =?utf-8?B?THdETXFRN2pMS3BqQlpRc1VSZ0hJaE5MUFRmMzRCZktVZGZDejR0dFd0TENp?=
 =?utf-8?B?M0RDeFQrVU51bFdzbUJYVkdJakplN2tXMDJFK2xpUmZsc3BNSSs5N2pKMk9U?=
 =?utf-8?B?M1VzOHMxSHl4bEM3S1krMGQwTENZelptUjZnWlBQU0tIZ1huUG1KbVpsSm8z?=
 =?utf-8?B?Rm9hMWs4WUF2S20wSUg2bkRnNHJHMXNKVDR3VTZ2YXZXcGFIaWU0RUo5eElh?=
 =?utf-8?B?UTE5Zy9ORlNIam1ZK2d2Zk1kb1hBUUIrWEF5YnE1aFM1dTE0bStBUGRXOGt5?=
 =?utf-8?B?MjNsK2ZkR3VHLzcxL3cwZzA5MnE2UmtYcHgxK0xZVml4SktDbkhUNlNqWnJY?=
 =?utf-8?B?emFPcXc2b25SUDhCM2wrMjN2VXVKUDAyUm52cEFobzdDcndVekhIb3BWR0k0?=
 =?utf-8?B?VDgwOUY0V21aenlpNHdXMHN3c3dLc2lHelBQNVpDaTZPRDcyZzBUUVBwRm9W?=
 =?utf-8?B?NFhGS3ZDSzd2UlpNYVIyTWMyNjdTT3RnVW10MmtjMzd2MlFiUFlIcC9ZTzVu?=
 =?utf-8?B?bWlJZFplNHNoWS93YTYzS1hJLzJlNE5GTWxJZXlqL2RDUmlLZEJRRGVEcjBk?=
 =?utf-8?B?R01ycjZVYnRFYXpWTHZCbnlJVjNzZXNEVEVRV0JJQkE2c01tdUd2bGlDeWth?=
 =?utf-8?B?VVJKV0ExRzg3WmxxVVUzYU9ONXQ5eFZzWUNHWG9JWkxjalpsdHV6MW9yWnM1?=
 =?utf-8?B?TmhLZ3IrTmJsbjNzYjU0R04vd3VUQStGdlhDamord3J3UDdFcFgwQ0JFUXRv?=
 =?utf-8?B?eC95WnZEY1IycDZEMjhoMEN2OWtFQ0NhdjN6dUxLWi9ubTJtMnE1WjlrRTlP?=
 =?utf-8?B?dHIyOWQyNkVOVi9ReEY3MEV2Kzg4eU9DL2NVMWxVaVZPYXJybFN5UEZ2aVNl?=
 =?utf-8?B?cGJlTktwcjZ3SnZZNDR1cVB1cGtrREhBM2s3bUFhaFQwTHZvem1NaWE3eDhG?=
 =?utf-8?B?R2Q3TkdnRG9Hc2pucDJKY1YzZmkreTd5QWV0UFR0QWVtUnpHdHo5L1pNeTY3?=
 =?utf-8?B?eG9VSkRTZ0d5eEZCWlJlY3lRYW1PWVFGUVNlSjBneHhldVV5N0RBT1N5RVFB?=
 =?utf-8?B?dGk0UlJnczZ1RWp4ODNTU0M2bGFkWmg0N1lYNHNILzBZbm5OSkhzamtRbWM3?=
 =?utf-8?B?NWk4SlJSOTVNVXAvYXpvdHEvYXEzcWlYRDdUR2hNdERrcFBNeFl1cW1aMUhj?=
 =?utf-8?B?ZHFWM1l0d25NOGtRdGY2OEJhc3VtazJzK3Foc2c0ak12TDd1ZUJMT09yU1Fw?=
 =?utf-8?B?OFJIK2FkR21yV3U1aE5ZV0hRNlAwMnZWYkZCbzZHK1ZZWDJrZ2dEOC9QNlFK?=
 =?utf-8?B?NmtVSDlQUU13Sko0L2oySlJBaDlQVHBXdVE2cVpLT3RzU2JvM2VGeDVhaEtl?=
 =?utf-8?B?YlFhSlBnTURSMVd6S1FyaGhQR2QzWDlCaDVhQ2pjbUdkeGhSSE9wUTVZTkNu?=
 =?utf-8?Q?Noh+X9NQWhcN+zBY=3D?=
X-Exchange-RoutingPolicyChecked: 
	DArirUVqqlujf67BGGUC5H03X+wNSbdwccpLQVofHz0+pus+kZV43clhedJyypkshETE+PVBCklI8Av9UCJhXwELr/UCo4742GAPvQyMcJ5+JD0uMFjUaNNiS/U2quAgpCymN4U6mpmEkNj97077itzCLi+NtmryRsI/ghzldW0zKBQSOoMprDHXR3pMJPMsb9Rl6nxHBctNN4d/GxXXxIP1kvyhBJAeYkqIOZOQWI3LCgNpLNi0rRhGYJlLRdY16yIQj/zlQST2q6aAt56vvP7iomRVp3Kez5CIOUlJdG+EvhhNegSh7Y3axBU+cdjE+PcDtxKTjdbBxny9jb0G1Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed34235a-68c3-48a6-7590-08dee7277fa1
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 12:56:36.6571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5fEe6b2kthDVy1BsP5o91tJaFZYPaTxwqStwxCiP1wiMYrrJVWL04GUsU7DXYMKlctoShNwXuhPjZNmJZhzjJu/8Z2hc4XKT4iUjT1Ev3+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6737
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNiBTYWx0ZWRfXxrcwHm8v+4IQ
 HFh3V5hKj+4l/12/XJ1ZBYj9raulZI6NVVbofYzRSOoHzg08syeYhWkw3+wxzkq95WSA3122EG1
 kRC91atug2r2No8xBxRhr2yRBst6vBmoSbHVg3mQnUodfJJJYxmpMKWG+dUlY0LGzaWyuCasiCl
 97H3RYDeXOKu9UEci3OV5YaFDhsV2KzConYa7yVOm4TQlg5FHCLWIii4a/vQ1EOHYj069XhDWzi
 NqAxrthp8vt0sDer0clbMUoEpS6QsyCKFzF+Cj2W78fv9FSY824nrin56GeZhptIzIptUHaDsCd
 CqTvdqYiLauiShP0ZXgMR7QjAlQ4fX7fOGw2Ob/Qzd9MV0fu8KolgN8zxGbbHytSshPmkvIdNbI
 el5zhptB9iud6o7ztpNMVozRaJnojhDEk13Yz6A9sdLlg+iBEUEcl7OWsfUZT86dqvG6EP8zO5D
 mxPECX9IsB7u2ZhnLbw==
X-Proofpoint-GUID: q9NtCXIx6gkPltZHE_59WfOP1t1TU0eZ
X-Proofpoint-ORIG-GUID: IkxVdR_TXMsx0DwvYmonZtc8zFKf6GM9
X-Authority-Analysis: v=2.4 cv=IM0yzAvG c=1 sm=1 tr=0 ts=6a5f6c88 cx=c_pps
 a=VrK8WKSpsKTEY/+VWLGgkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=cMAq4WG02xF87J2zUhMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8
 a=t7j42nQ-Qc_ZVmkvTiUA:9 a=9pWWZnP8B9kSU4pI:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNiBTYWx0ZWRfX/oMpsP6byFI9
 yhK7SQwlCaZTQO3mOZWrNxU+pgl1PL3iaWbh/ci5GaXpUREdxxabYA+fYcLnxvAFAt/mREZQOk0
 ORF8h3zW0SIpR1UQECHA9zdGWFyXcUQThfz5cjLo/a8O0RvCK7im
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 12:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241520

--------------28yXQQ23BX6udSXxfj4F4eca
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 66LBlkG52408131

On 2026-07-16 04:34, Alexander Kanavin wrote:
> On Thu, 16 Jul 2026 at 03:01, Dora, Sunil Kumar via
> lists.openembedded.org
> <SunilKumar.Dora=3Dwindriver.com@lists.openembedded.org> wrote:
>
>> I built core-image-minimal with Rust and Cargo, booted it, and verifie=
d that rustc and cargo work
>> on the target by compiling and running a test program. librustc_driver=
 now carries a NEEDED entry
>> for libLLVM-17.so instead of linking LLVM statically. oe-selftest is s=
till running on my side.
>> If you and Yoann are okay with this approach, I'll submit it to scarth=
gap once it completes.
> Hello Sunil,
>
> Thanks for all the additional research, it's a lot of tedious work.
>
> If you can get the working scarthgap backport for the dynamic linking,
> we can probably just take it and leave it at that. There's a lot of
> distros to be fixed, they all have different processes to do so, it is
> not clear if they have capacity (or interest!) to do the fixing within
> reasonable time.
Maybe, but .... maybe not.
Fedora 42 is EOL=C2=A0 as of 2026-05-27=C2=A0 so YP *could* decide to dro=
p that=20
from the test/supported list.

I'm not aware of how tightly coupled Debian and Ubuntu are but
we (Sunil) *could* talk with the folks at WR who work on a product based=20
on Debian

to find out. So it *may* be a tractable problem after all but see below b=
ut
I ackknowledge that distros are very careful about changes to binutils...


> On the other hand, with the passage of time, the
> older distros will naturally reach EOL and they'll be taken out of the
> yocto build cluster. I want to ask: do you have more pressing issues
> with the rust toolchain (or oe-core in general) that you think should
> be prioritized? Our own resources are stretched thin, and we need to
> use them wisely.
Agreed.

I asked Sunil and Sundeep to get to the bottom of this defect and
now that I see what would have to be changed, I reluctantly agree that
we just wait=C2=A0 it out. I don't like that we've changed from static to=
 dynamic
linking of rust but we don't have any evidence that it's actually slower =
and
as you say, we have bigger fish to fry.

Let's document this discussion in YP BZ, including the versions of=20
binutils for all supported
distros from Sunil's email.

We should lower the importance of the bug and move it to 6.99 and check=20
it in 2/4 years
and revert this change at that time.

../Randy


>
> Alex


--=20
# Randy MacLeod
# Wind River Linux

--------------28yXQQ23BX6udSXxfj4F4eca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-07-16 04:34, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9=88aGwqtyBXqyaQJvDGTN7p=xkgf9eH-9ESrWcJaSbQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On Thu, 16 Jul 2026 at 03:01, Dora, Sunil Kumar via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:SunilKumar.Dora=windriver.com@lists.openembedded.org">&lt;SunilKumar.Dora=windriver.com@lists.openembedded.org&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">I built core-image-minimal with Rust and Cargo, booted it, and verified that rustc and cargo work
on the target by compiling and running a test program. librustc_driver now carries a NEEDED entry
for libLLVM-17.so instead of linking LLVM statically. oe-selftest is still running on my side.
If you and Yoann are okay with this approach, I'll submit it to scarthgap once it completes.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Hello Sunil,

Thanks for all the additional research, it's a lot of tedious work.

If you can get the working scarthgap backport for the dynamic linking,
we can probably just take it and leave it at that. There's a lot of
distros to be fixed, they all have different processes to do so, it is
not clear if they have capacity (or interest!) to do the fixing within
reasonable time. </pre>
    </blockquote>
    Maybe, but .... maybe not.&nbsp;<br>
    Fedora 42 is EOL&nbsp; as of 2026-05-27&nbsp; so YP *could* decide to drop
    that from the test/supported list.<br>
    <br>
    I'm not aware of how tightly coupled Debian and Ubuntu are but&nbsp;<br>
    we (Sunil) *could* talk with the folks at WR who work on a product
    based on Debian<br>
    <p>to find out. So it *may* be a tractable problem after all but see
      below but<br>
      I ackknowledge that distros are very careful about changes to
      binutils...</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj9=88aGwqtyBXqyaQJvDGTN7p=xkgf9eH-9ESrWcJaSbQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">On the other hand, with the passage of time, the
older distros will naturally reach EOL and they'll be taken out of the
yocto build cluster. I want to ask: do you have more pressing issues
with the rust toolchain (or oe-core in general) that you think should
be prioritized? Our own resources are stretched thin, and we need to
use them wisely.</pre>
    </blockquote>
    Agreed.<br>
    <br>
    I asked Sunil and Sundeep to get to the bottom of this defect and<br>
    now that I see what would have to be changed, I reluctantly agree
    that&nbsp;<br>
    we just wait&nbsp; it out. I don't like that we've changed from static to
    dynamic<br>
    linking of rust but we don't have any evidence that it's actually
    slower and<br>
    as you say, we have bigger fish to fry.<br>
    <br>
    Let's document this discussion in YP BZ, including the versions of
    binutils for all supported<br>
    distros from Sunil's email.<br>
    <br>
    We should lower the importance of the bug and move it to 6.99 and
    check it in 2/4 years<br>
    and revert this change at that time.<br>
    <br>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj9=88aGwqtyBXqyaQJvDGTN7p=xkgf9eH-9ESrWcJaSbQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">

Alex
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------28yXQQ23BX6udSXxfj4F4eca--

