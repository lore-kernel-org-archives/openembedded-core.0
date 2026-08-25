Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121C7C5DF81
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11733.1787618786492801895
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sjxkxQA/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P0kN2U3988430
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jSNM4cQDn4e8mUDDrodBcncIET0x27smzf9S6GO48Lk=; b=
	sjxkxQA/A2rfUg2Gzozxor+pn3pn5sguyOFd7a0Pruuw7jf8lf0jvcjwubwNfEaD
	rDlRywAkQhxc4ORWsNiPR+ZqKNmtmYi9GLNeC8ZsxBJGsiYV9nu5cmat3PDp8gOp
	UajoEU4gOnaOGLZ49eRoY5plFmuFX8SL2OhmI+2jPABVDcxF/qX9NCS+aj1Lv5Oy
	d5ZtDRT/pN3sC0tHAPS8rFSv5QHZZ5fHtK5WTPZz6vk2dgVKWU7IpZiycFJjX+UJ
	Hoa5UiSCJMTFxqw3A8JfuDzJmYZY4qfIAU+OE8DDL2pXhISM6nJlFHoCRMLZ0Hb2
	Lc4LQHG3c49usvKfeB9s8Q==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020090.outbound.protection.outlook.com [52.101.46.90])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6unnv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 00:46:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Od4DSjQQ3JPTU1ynHVFIQ4Hprm1P8OYLW1vP8v/17vbnJlYDalN4FplbgTJKdgTyM+JV1ytANeWRi/GyorU41aOaj/009OP8bz7mtnoFZnAj1JZOfyckFHN1+aEy2d2CPGH+SYvUbinvADPqbsqWIpsoHF1lVIdm/AGnU+g01csPsTcXrc3kZpql4ACX3aVgxhc/vKEJhJP0JAo33+VuE7kB3d7DvsoNxz1KT9ODD8YZMijjxrB6Ecw3neKrnvK6WRSWjkMjR920IkIRO/bEpXjFbma1GoshxsKuXd+ft3RAuARpvV8Q928grSf8HxpKkwtxMIRv10+93LbMYEA8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSNM4cQDn4e8mUDDrodBcncIET0x27smzf9S6GO48Lk=;
 b=AUKVf9uHsoBSlu78+uJZE8rnjwsYjHoAQFKKoGvjhlwx67mwuyBg4e/k+TlF50QafbKCOaxRLNS+adRYG2qguSp1kefSFnL84rZPoFiT4nafkwAMlDtxVedT6WY0DM5UwYGEJyohiqyxCOUg2F2N7rI1Tf5vI5XKMgiJNNIFBJvxC4c2h4T3ATD17Lq2AnQPGzt4vN2KsB7iAgFSQmvs4eEo1f91P6sFAsE6JhoYim5r6v2p0dVx18dCptanhXwV0XOVq3aInl9/vZGYQbYgRa1MA/SXZ+M7hW6Q9xqgtRPyvprWB1NFUK6l+tTCZ9KsDWrQczDK65VGUvsNdMCkDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DSSPR11MB9642.namprd11.prod.outlook.com (2603:10b6:8:377::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:22 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:22 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 14/14] lib/oe/package_manager/rpm: handle RPM 6 non-zero exit
Date: Mon, 24 Aug 2026 17:45:51 -0700
Message-ID: <20260825004555.4111831-15-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|DSSPR11MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: f4dba8d8-f8f3-476c-7c3a-08df024248d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|5023799004|11063799006|10067099003|6133799003|56012099006|18002099003|22082099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	9zPmug/qoYVkLYDvfFm3K6T8i7XpkcaPMTppSW6YBFKC/Tewp5/S6fTR1jj3IR0Oywn7ieBMxxCokV5sZn1P6gkOwQWgstwJA8v7CzVXHPBPBvKxsehllqFVBteuXrpiNKDDOpvPctrH27J+/53D8+BeETtZfKdeETkvv7rDU2t2mN8QeSTFkD3E6KmzjOqUmzy8pU4Uj8IdHpgs6SJemf8G18tbB2M7Hq90X5+jZ2DNbMW3HXujEStNbYOUjApQNn7dVG91yTk6eclCeSrSTUT+8YVqIvzN7DmO8gI42qEluj+ZLzi8/qofxryyZ4KUC4VaOV7FecynV0971cgVaV8cYoC5Lxcg+bbebpv7Of7Z9ffWlnhOcpSbwVugGEKnvZWVjB+YggBDPCMvMsEGp0jbqJDcKN/3xfTB8gmdjZUdoKeKXsZGbPGbxSou2qorxkRDZ6uf+W4DZqhwZn9Rur0wqEArGMQQ7LuvCJxhkcIlVXBQTc7nQyOU1ynuQ5fsXiuqEgJFv4AdXAblvwDIW2IJ/WY9vadiVIKxi2JLhH1FZjv5WaPnecx5HnsFfsFoHQOdJUnkwC1zPsGfQOV3rAJDj98sb5Pm8ifoPZ96q/F90ueqF9fqTN2+nRmyXb4Odk983rgk53KE/R1QWBQvT+wTZ5MFy5+pz2eS3n+sojrDUFxr8IPU/He+4jmadeIg+Uvxbq5rIs2Ji/WF5ZULx/y4hox+nuRqDYDHEP9mcZ8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(5023799004)(11063799006)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(3023799007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clJ0cUtRWVBNNVZ4Yjg1Z1FTSHVpT0luM3NaOGpqemRyZ3dyeFU0WktQZGhY?=
 =?utf-8?B?Q2tKQTZsOCs2UnlkUHVvaHVvc1dOamRMTkxUK3RUdXF3YXhiUmVlSFRDb3gy?=
 =?utf-8?B?dlJpOUFZeE8zSktJbk5nLzl5MWxCMWxjdUpsRjdELzJsamZka2RlbDR5a1JL?=
 =?utf-8?B?ZWV3dE9Zc0JQcHhqdURMUHI0WU1scWJEbHBOem12U0dhekZ1bFplS3gvQzJM?=
 =?utf-8?B?cjBTa2V3Z05RcnJwTFY0MGdGNHNyMU5jUTJ2UWZjcXVlYjVGeUx3dXBVU2RZ?=
 =?utf-8?B?RUs4STVjdDV2QWFrRnl1ZktEMDB5aUpNZVJwVms3WlRTeWdmdlNKVkxMWE5N?=
 =?utf-8?B?SVhhaEw0ZXB3K1VZN2hFZUFralc5SDJVZExDQmxabnlMR2tTRWNRcmRxeGhK?=
 =?utf-8?B?YUpLajNDellKM0tiV3dOeDd2L29KUzh1NDBGM3ZhczhsZUJiby8yNnFubTND?=
 =?utf-8?B?cXlmVFpBZGN4UFFpUld5NkpoZjFrWjJRcER0QTZaT0FHeFJhZXRhaHRJMm1w?=
 =?utf-8?B?S01vSWxaMERlQ01UYnZTQW15RmZvWVhpNGpwSlV2VFp1TnV3a0ZHQXVIc2ZD?=
 =?utf-8?B?ZVF3VnpDaGQvNE1tZ3R2ZzZkNWlodXZjZjZjOXJvclpRaWlrZmNuRnVxa0x0?=
 =?utf-8?B?VWdwK1NMaWczU0FwdWwvdk5TazZyaFQwOFhrQjNwSGFEZ1R1WWIxOWwwMEVW?=
 =?utf-8?B?cjJHaDdzbXlCcGM2dk1hVTZiRy9nT3p0dUFPVmt6TWQvc1Zob0RsRU13VE85?=
 =?utf-8?B?VzZZaEwwd0tsQVdtbmg3MlBsNzJBR3Y4VXZMRjZlUUpKazhyTU9JbW9KNFF3?=
 =?utf-8?B?RGtlQW41NThjbjJ4T1BBenphaFhWMUsxd1BrSlZwT3Z4dk9jTXpRWWlqQllz?=
 =?utf-8?B?ZkZrU3hYUSsvdkNxR0pTdFA3Slh5a3dOekpvOFYzeFVQdk1xa05kNWJwMk1N?=
 =?utf-8?B?dXpxaHdFNXhOUTZhOGlRSVdOWGJnT2l1a1lnV1VrenN4dmRQK3ZvZXBZZ3ZB?=
 =?utf-8?B?aFlCMHlHNm9xeGpURmtzYW5WUnZJbnVVM204cFcvSjN6cTd0QW9YaldPRTEy?=
 =?utf-8?B?VDlibG5aNTdYb01jSE5ZRkVQQVZHVkZwM3VXQktkT2hBallRUFNkUVZOT1pY?=
 =?utf-8?B?OHA4aFBGbkFQNmpZZjlLWkFTMjNWYXh6R1lzNUl3VDU2N1Y1TEVtMEcxUVRt?=
 =?utf-8?B?WTJhU3VNYThBMm1yUFhaelNIa2ozR2U4VFRaRjhBUlR6VVNXTDZoSFVnWW1W?=
 =?utf-8?B?TG42QkpYMDR2WTl3ZGhxbzEwMnpQWUZrOXVtYWlEZmFxS1RyMkRuTFFsSTJs?=
 =?utf-8?B?eEd6bWt1OFZEeWEwMlBxSTJlNlVCVndFeERGVm9SNkJZWjdJY1JpWkk1b1BS?=
 =?utf-8?B?eG1UL2RlMjBTYzNlMWNQZkgyVXhFakk5aGNsUVUzSzZjdXpvZEYwSVZvNzZH?=
 =?utf-8?B?MW9VMVhkdysrTTh4QkcvTVVMb29CMzFBcmJ6TC9JblFHa2MraHljVlJadkxV?=
 =?utf-8?B?UEpPK3NFQ29DVCt4M21QdDFtSUdnbHEwYS8xdkUwcHplbG5adFBqY25KSW9q?=
 =?utf-8?B?OXM4WVBzMFJZUk9Tc2o4bWhINmJUdkxsekZVdW5xMFdkQ2s1MmFUL1EyUXdP?=
 =?utf-8?B?V0VzNkdRUFYyRjhVajdLTE5vVHpNRDRyZksyVG5ZUFJRcmpWVGxIZFVzbm9Q?=
 =?utf-8?B?dVA5YlFncm5jNXo2RW9kQkdvNTBYMjdVNWJzcmJubjJXTnY2M3BLbmRSREJh?=
 =?utf-8?B?UW9EdlA0MmJKYWdSRXBHYkxKQjRsSS9LWnV5RlhIU3hDaFFwQjRBRXdoT25M?=
 =?utf-8?B?cnRHQnl4T1JwN0ZCRno0d2Y0RTVCdklab1F1OFdaV3B6RWlDZ0t5TXhRQXhn?=
 =?utf-8?B?NEFyVGpwV3JUZUFESWdBZElqUmFEMW1XdkZBL09FNTRRbHJ6Tk16eWdhKzB0?=
 =?utf-8?B?Z291Q0ZiZHJ2TlIyWG11RjdQVVFERTNwbllBVUlWdnJydDhZUk55RCtiYXgx?=
 =?utf-8?B?OXk0MGxKTitFeGVraHhyeDlUd1lDdnlnRS91Y016eUlyQXZqdTVZWUZrbmgz?=
 =?utf-8?B?a3YvRGpBajZPTVQxbDFKaUhxQXdLRTRlcGhEYXMvZDBZOHBocElyL0xMSUdk?=
 =?utf-8?B?T2d5dUJYUkx3dDNIbzd4WWRJeUtzMHh0VER5QVRuR3k0azJtLzB0VUFJUWpU?=
 =?utf-8?B?NC8xRi8wV3dnbDM3SU82OUh0WVltSVJCTDNmKzFiZFAwQlYwQXJhdytMdDho?=
 =?utf-8?B?STNRUmloUGdrZHE4M3pjaS8ySXVrZldFUjU1NFhGUitNT1UwdnFGdnBKQW9N?=
 =?utf-8?B?bGdXRTBMVCtzcE1tRGF3QXM1cS9TL1BGVDdUSGl2aklzK2J3Y1E4Z1hsaVNF?=
 =?utf-8?Q?PZ7D+th7wdDGagnE=3D?=
X-Exchange-RoutingPolicyChecked: 
	UMR5uCCRQ2jwoBTM1fIEgpWCIZBtfT1FPnhOyhvK3LNzFtt+e6eKWLF4gwOjKqoTOS2oImMZhTqNaw1GbVY0idsQjovcgUasOzEJoMUDv+mmE3V8MAwh2GowX7CGifq/ZOgQ0N+ymQ/4/9ZGDn0CbTriYyUfnyjgRzcLTnWv6cpuVnzgBKGwyr6yx/C2j1YdxGV5vmP/yokoRIrI1kd8aXaBBN1+vjomNXQwF9cew6QlIX6aUpGaVs5j0n8pVvt0bhxEzVqE17AoMRJS9m9q0mvdA3vqRL92iW1Zq2ln/uZa2QW/tCRRTAEgoaovfSkjZ43YVhgKvb2J87rsDhuozA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4dba8d8-f8f3-476c-7c3a-08df024248d7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:22.4946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Z73kJiCKHvsx0l91dXHnYCxRO6LG1GluelUcwVquScrsYWFbQbOrG3v1+lkFcIEW0n7sSXDYCQfvymLOart8w0TBbxc9znC7SB84PGxdNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9642
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX7Ym2YkB6+c2C
 w5lKjYjWIvuaafwPCqhq3n0cxO60YGVSn0oaXMhQbxjSnok8Z/IUJQAT/7on35Mjz9DZLDGU3Vf
 3quoCzk8ioizxQwpl25BvYOQh55Jfq6FcWY5QRf20xRCCPFn7vtR
X-Proofpoint-ORIG-GUID: lZ86MtfwMeZxnxbJ9G0s12B-hbWIy7Ku
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX8RU+oL9PcIQP
 pnCs68oVOMAxYj/LniS+uWoDS63xjEifcRDeTns3BDHuOiP18zd5p5pqBtIVsLr6u5lKAveN3/a
 drBmX8ewTJ7qTCqleLiH3I8haymVj/L6j6pMmQhcTGHwsWvaQ6uN1g2mSDDSuIHwZusu3128GRX
 z54SZCHUM3Z/oAlshpd3VgT0WQSb9xHmLjiLTWOEgoYMxAFa+e5/aNrx8rQ3gt5O8fGnAWufsh/
 6J6FfTGa+YUDqYnjPOAwd3gIthoBBGq86oo+UwLS163W4+V1Svh2/3AtZ4/y9kZgwkseKdJKr/S
 UQnWC1iGyeAgt6OxwDSeSBQRuvpKba6Ekvkx+yseeKwCAAZ4TeZbMcWqAx4dSrzKsmQH2bJ+tF4
 QxUiu9xT/+ooMZVWVcPO/Ubb0BJTMAqB7lq5bWTr11L6iqR/oyDmOG+p/s8SWQP1MPCO7DFbZqV
 TS/t75HZ+Egg96XeNhg==
X-Proofpoint-GUID: W8i1sPGHbgrowCnW5TT5kWPr8JK9gpqE
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8ce5e0 cx=c_pps
 a=mKvPdnfujGBEPWwSy16I3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=xrz2xm_XJy7u4lCe5tcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250003
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 67P0kN2U3988430
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244171

RPM 6.0 intentionally changed rpmtsRun() to return -1 whenever any
scriptlet fails, even non-critical ones like %post where warn_only=3DTrue
(upstream RPM PR#3819, lib/transaction.cc).

Root cause =E2=80=94 two changes in RPM 6 lib/transaction.cc vs RPM 4:

  1. New field set before warn_only resets rc (transaction.cc:1754):
       ts->scriptError =3D 1;

  2. Final exit now ORs in the new flag (transaction.cc:1910):
       RPM 4: rc =3D nfailed ? -1 : 0;
       RPM 6: rc =3D (nfailed || ts->scriptError) ? -1 : 0;

Call chain for a failing %post in RPM 4 (exits 0):
  runScript()        warn_only=3D1 =E2=86=92 rc reset to RPMRC_OK
  psm.c:896          if (rc) break =E2=86=92 NOT taken, install continues
  rpmte.c:823        if (failed) =E2=86=92 NOT taken, rpmteMarkFailed() s=
kipped
  transaction.c:1652 if (failed) =E2=86=92 NOT taken, nfailed stays 0
  transaction.c:1896 rc =3D nfailed ? -1 : 0 =E2=86=92 rc=3D0
  Python ts.run()    returns None =E2=86=92 DNF exits 0

Call chain for a failing %post in RPM 6 (exits 1):
  runScript()         ts->scriptError=3D1, then rc reset to RPMRC_OK
  psm.c:896           if (rc) break =E2=86=92 NOT taken (rc still 0)
  rpmte.c:823         if (failed) =E2=86=92 NOT taken (same as RPM 4)
  transaction.cc:1652 if (failed) =E2=86=92 NOT taken, nfailed stays 0
  transaction.cc:1910 rc =3D (nfailed || ts->scriptError) ? -1 : 0 =E2=86=
=92 rc=3D-1
  Python ts.run()     returns [] =E2=86=92 DNF raises "Could not run
transaction."
                      =E2=86=92 DNF exits 1

In both RPM versions, RPMCALLBACK_SCRIPT_ERROR fires and DNF's
_scriptError() (dnf/yum/rpmtrans.py:407-418) prints:
  "Error in POSTIN scriptlet in rpm package <name>"

OE's install_pkgs() already scans for this line and calls
failed_postinsts_abort() (package_manager/rpm/__init__.py:210-219).
With RPM 4 this path is always reached because DNF exits 0. With RPM 6
the CalledProcessError raised by DNF's non-zero exit intercepts
execution
in _invoke_dnf() before the scan runs.

DNF 4 (lib/dnf/base.py:1146-1158) was never updated for this RPM 6
behaviour. When ts.run() returns [] with no failed elements it
unconditionally raises "Could not run transaction." =E2=80=94 the comment=
 at
base.py:1147 still describes RPM 4 semantics where this case meant a
global error such as a transaction lock failure. There is an open DNF5
issue (#2507) but no fix in DNF 4.

Fix: detect "Error in POSTIN scriptlet in rpm package" in the DNF output
inside _invoke_dnf()'s CalledProcessError handler and return the output
instead of calling bb.fatal(), allowing install_pkgs()'s existing
scriptlet scan to run as it did with RPM 4.

Tested with oe-selftest runtime_test.Postinst.test_failing_postinst:
  rpm 4.20.x: PASSED =E2=80=94 DNF exits 0, scan path exercised as expect=
ed
  rpm 6.0.x without fix: FAILED =E2=80=94 CalledProcessError before scan =
reached
  rpm 6.0.x with fix: PASSED =E2=80=94 scan path restored, bb.fatal() fir=
es

References:
https://github.com/rpm-software-management/rpm/pull/3819

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/lib/oe/package_manager/rpm/__init__.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/pa=
ckage_manager/rpm/__init__.py
index cd6efe3d3b..ccb4316bd0 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -333,6 +333,13 @@ class RpmPM(PackageManager):
         except subprocess.CalledProcessError as e:
             if print_output:
                 e_output =3D e.output.decode("utf-8")
+                # RPM 6 fails the entire transaction when a %post script=
let
+                # fails, causing dnf to exit non-zero. Let install_pkgs =
handle
+                # scriptlet failures via its existing "Error in POSTIN s=
criptlet"
+                # scanning rather than treating this as a fatal dnf invo=
cation error.
+                if "Error in POSTIN scriptlet in rpm package" in e_outpu=
t:
+                    bb.note(e_output)
+                    return e_output
                 extra_info =3D ""
                 if "install" in dnf_args:
                     if "Error: Unable to find a match:" in e_output:

