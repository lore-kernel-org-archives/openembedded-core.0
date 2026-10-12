Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C0ECA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 06:23:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7748.1791786214693960001
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 23:23:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=UAj6e0ZC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=474542f348=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5JNbN2075083
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 23:23:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=RF0BTU1pO
	vTNhQHCNbXJVEoyuUmrcGi/VCkEKZCYPIY=; b=UAj6e0ZC1yvnG2qEsY2HCFOyo
	cOs92zHEKOINDXHXB8efsd70a+vo2sKp8dHvwVMm0D5YaLJSi9IOFRTfFc3dGCNl
	TzGYZV5LHPo2dJnBLV4o/cJ86YSXTj+BhylEnKSP74tGwD4zv4sluPp3rIY7+IPX
	yt6k/5YuHBYm5zKXZQIHYk0vOLZ9q4E1lKp2Q4GgZ05ZFMdMBvD2mQmNN5uc/5Gc
	DMPF9Am9aA+GFstyq9Fa8ntUXd9M5aHAfyH7a80lkngzIOWPUCIj5x7gjUFaGlYR
	eDKoNv2gtDlry2wz6yV9E/P2KCzuarE+ddILt3gqq3itoNWUeRRBNWiT//uKw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021123.outbound.protection.outlook.com [40.107.208.123])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h7gn19neq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 23:23:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jWOjMmiRDLj3AVkdlDpiYXeJ4dFhjdZ1vY/ldGHdjsGivekuS6ISjxTgbzBTJr1FHje4VUNFWqZ72suqpaMuzTFpM4sSVGoGArh1R12En6ndOqqdgV3py+i1c/Gl7CpKgZtLbOTM7ZGWzRweqfxFbtsYPUn+DfbEC515aMAwFAy4dtNi/E1tv657eO9bkxrNXZC/UJDtvoweGt7y3+gBuw/HvHJC6fMvITv30thN8EuTmFa7iV+T6tyg1mMg3a5js92tfBkZCrZVSK/YHSdd/KLbD/sHKE8iiq8PjpawHVo9gSKk4wUYpxXlVhtqvun/vt4ABqZSowWx3WZqsv1vcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RF0BTU1pOvTNhQHCNbXJVEoyuUmrcGi/VCkEKZCYPIY=;
 b=AjUdZDTb2Xy6QyE8F54jKveERBjOyxujPy001bpy3/T1zklRH7pHAhGiQc3G9Nj7/L5Ov8F+TeyY4X8sNhoTBYkQyU7WvGb+3+jyByhaUIo+DL36j1w7IzEkV783agz2hEOpyABst9E/wMCRCC0jJ5RhzbaH3AHB0KDTw1dP7HseL8m1x/Gbl6gIaNfuOmhFuJC0rFwM77ZnT5L4JNlm4wSvFydym+QTB/mQ1rKSAdc9nGD5kR6WfPTMERhgdvELuiBsU7020oUAwO7StbcI3Wzm3KERuPu2jSCUp0XEOXULwCo7iz3z1O0kFvlga3kdSMn8cwDtJTINYFiR3DyRiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 by DS7PR11MB7835.namprd11.prod.outlook.com (2603:10b6:8:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Mon, 12 Oct
 2026 06:23:29 +0000
Received: from MW3PR11MB4571.namprd11.prod.outlook.com
 ([fe80::3fec:2722:27b1:67f9]) by MW3PR11MB4571.namprd11.prod.outlook.com
 ([fe80::3fec:2722:27b1:67f9%5]) with mapi id 15.21.0496.010; Mon, 12 Oct 2026
 06:23:29 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@windriver.com
Subject: [wrynose][PATCH]  gcc: Fix for CVE-2026-102010
Date: Sun, 11 Oct 2026 23:22:57 -0700
Message-ID: <20261012062306.2547997-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To MW3PR11MB4571.namprd11.prod.outlook.com
 (2603:10b6:303:59::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4571:EE_|DS7PR11MB7835:EE_
X-MS-Office365-Filtering-Correlation-Id: 1acd120d-a36f-41f8-51ed-08df28295515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|11063799006|38350700014|56012099006|13003099007|260925021311599003|260925022911599003|260925021911599003|10067099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 
	EfiR7vLdoIr/PGZsaKCmLaWvOO1DI4OHrbVF7N7eztDNtliTbVL3XL7dQKYXMnLbWzArkJHh507R602BfDexyQYjQ9enwBl2XvjWEYeHHlBjKZ2vgKQIYVLXWW3YqN7+pQcCMojkRlBLfne0yHkOnJsbEnKiCNTmGSYAT2fLhaahP/LTpM2LI0b2cftHNndu80vFazjFrZxdXXms8dfm83shMaQP/ecOS+fMkxEnwpdEAhErSxettWJBa070bERNbXQzcG9b4YokE9/0/CSQRB3JfQ+JkIPw6iD3oykv0e4IQZHKsuW8dKEozwJ6te4dsUcN/XuAdancUS0nKBCiT3ZFY4Jm2anXRdK0XF4ZzTQvGnCZ2HwFHTFkHJOQwz+KHTf23hiZbk9T64YgVljqBfjeLWpNnkY7UaSkG+UlPMJ8cy1c+CDgqeqrrdJbIQ8Dhy+x1WuZI/NhuJmO4cUsq7VvAEU7FMz3uzanmhCgmp/7twXKtkg0ydXou8ZTkLjIZTu0rcSddR2zEMv/Z4lcLxZy4VEMCX7ZohBBTWhdIQGvU5AJpLTJedwYoQbhblPv0BxyLoQ5yduxzeto8YkrAB3lUNEXdjKao27N+LvL6XKDrplj8sNLHNB9eDB79mN/UWrxbYreRE1F6pkGoS6Q72u0vyAHi8DUMBhIvmjhMF4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4571.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(11063799006)(38350700014)(56012099006)(13003099007)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(18002099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Uitya0lWUkkwcFQ0ckVOS1VROWJXNmtBOXdnWkNRQ1NGZ2hmOTA3OTJ3VWls?=
 =?utf-8?B?T2hzMjFYZHA2eEVKaHVIZDUrdXdnc3NDL1VuaCtwamt0MUtQdlB1NFNJbDJQ?=
 =?utf-8?B?KytxVjdpWlZHWUZyNVl4UEpnUXloTnY0MmdiZ3Z3WVkyK1RNOEs3M0hZditS?=
 =?utf-8?B?cTRIUDhvMGR1WnJpaTBPdENmVDlMVHBvMVJoTXJaUXdYUXRDdkxoSzg1ejBE?=
 =?utf-8?B?b3d4Z0FLMWJsWEJ1eFF5RmV2aW1hM2tPMTl6cTVqMnN0Wk1sT2Vibm03Z3k5?=
 =?utf-8?B?Zkp5ZjJVL2JiSmRrZmEwemJqNzU2Z1JJOXVIOHBjT09zd1ZBZmpqMWI2TE5l?=
 =?utf-8?B?QnZHcXk3UjdScTltUW9lT3c5KzdWdUJNVVVRZys5ZXR5VkV2MHgrU2tjemlo?=
 =?utf-8?B?YkpEQ1FqeVVpNmE3MGxrTDdIMy85ZHBwdTRNT3FtY0dkNTF2WkVLNG94dnUx?=
 =?utf-8?B?Wk5Lb1VWYVluVnpWVU1CQ3lnSkduZGtGalpuaVpnSUJtVkFEWmZmUno0UXZG?=
 =?utf-8?B?Lzc1ZitUVnh2bmltVVA4Sm13eEJlMUlqdXU3czFTUDlIQllNaWlDWWtZaXpJ?=
 =?utf-8?B?UDYyajFEZTQwTjR0UzJuQ1VNQXBoMDYwK3VlNENybnlaN1pDdFBiRDhleWo2?=
 =?utf-8?B?bmFjRzZBTkhpcytFQi9FMWIvdjNrNUgzdy9YbXNKc011UDNha0ZLd2Y0SnRW?=
 =?utf-8?B?MURpWWFiR0FHUWlXc25ZTVZ6bTZxaEdkTzhMbURMbGhwWVR0WUpIUWZrWS9q?=
 =?utf-8?B?T2FDWWhZeWRBQmpCODVaTFFjNlZ3c1RsMnFQOUdxdmxrWkwvUFUzdWVHQ2Fp?=
 =?utf-8?B?UjcyWmVQY2lpYndOS2hqUndCc05ia1FjZFhoRlNoRlYxeHAwaDBzY0srNmJo?=
 =?utf-8?B?eWcyU3hNY2w5aU5nV1oxOUkvSXZMT3pOanlma1lHZGtwRXlyMksyUUdvMDFi?=
 =?utf-8?B?M1VoWUE5SW5HMzQrR0N1MThkR2NlMkcxSERZVUE2c0ZLTVZmOVVqMEVhN1F5?=
 =?utf-8?B?WTFwSTVmOGswR2wybUhGZDlFVUdkUjZPQ1NCQVM4T3pSYm5aUmFkdnZlYW0x?=
 =?utf-8?B?NS83VWFHbGVjM2FzcjJ1UUN3ZTlZV3AvMUZmOWhqZHFvZUE4NFMxSVNUS2RY?=
 =?utf-8?B?YksyeGZkakpMRkVDVmJwWDBMaDRiYkVWRHdnMmx5MkNvZjlMbDYyL0ZEQWVP?=
 =?utf-8?B?cmlVQ1NLTFFBNDZteWZ1VWovQVBtakRKdUFnTmdzLzY5Lzh0WWtMTHZJVGJ6?=
 =?utf-8?B?c1RJY3l1ZDBMK1VaVjBtT2RTeXlaY21wa2w2c1pkc2xJemtCalZDNENEYUNZ?=
 =?utf-8?B?SEpmMC9nNHdnNHJBbjV2WkswdjRTMXFMMlhVcEk3Q2gzZ0FWR09rM3JJU0Ix?=
 =?utf-8?B?SHpmM2VQNW1JRkRmUzVpMmJTbHpPcC9sMHBLbllkcFo0bDdnRzREUitHYnBj?=
 =?utf-8?B?NXNHb1hlY3JFTk9ReXpwV3hYK3RZNFdNeFhmS1M5THh5K0djVnJKVlEzU2NB?=
 =?utf-8?B?RXhwakFFbnpPZlhhazVxUTZBcnNGMmd1Q2lpNURMU0Q4S1RrSkxxa0lncGdP?=
 =?utf-8?B?UElLM1d0dVB4WlhNMnJOVmRISW5GQmwyL1V3R3JLdysvTWZ5b0l5ZnB4KzJC?=
 =?utf-8?B?UE9UNzZPSlAxQXQ2dkJIbUZSbHdSb2JvZUdNOHp6NjlOSjdTWnV6UGNWQU9J?=
 =?utf-8?B?RVpRWHBjR0ZOQURhazN6bFQ4TGhpcjlqSkZ3ak9jbjFwRXRqRnFkZ3B2Yy9C?=
 =?utf-8?B?UVdMUjB6L1Z0b2g0c1NqUnlqWm0xUVpLbzZxcFVSZGhMU0oxS2VubnN5RlNi?=
 =?utf-8?B?bzNZU0YyQ3kxMmxiNi84SURFNnREaTkrSmVBemxlRWwwZmJIUzdTM0ROeHpH?=
 =?utf-8?B?NjdURVNvejhjYTJid0JualF5TE1Nc24zNStjdUdNK2MzYlh6OHh3QWNzQ0Ex?=
 =?utf-8?B?ZWFRamFmQUN0cnVmeVRhdFQ1bVZ4VTFHN2RPMUJHNysyUWxJWGVpS0hlNFJ4?=
 =?utf-8?B?SXBUMzJSa21lVStvODMxS1ByV3dTRC83NXcxa3VYZ3ZIbUpBT0d6RXNJdDdu?=
 =?utf-8?B?ME14MWk1Vi9mdjU0SzFldG9TWW5yM2daSXRhVnJNSzZWdGM3bWxmS2JNRG95?=
 =?utf-8?B?bnVmS0xicTY0SVdob28xK3lGU2xKcGszNmhGQzRQZ2V4RHJ1MUpVMXJxeGlP?=
 =?utf-8?B?UTZpN2tUT3ArTWRQQmV2NE9GUkF6VmpWK1NQQ002VGN0TVpZZnZSYy9QMDhG?=
 =?utf-8?B?b2JxRlJMdExUcXNOYm11QjR6ajNBNWxlMGlSMWYydlFSNTV0U0xwc0F2U2dn?=
 =?utf-8?B?L0ZRU2xYRXJaLzhXdlhRUW1EYWtRN0pCQUJzMTYzVlFiN1Rsd2xoOXVxeDJt?=
 =?utf-8?Q?GoeoFfwtomhq5Kps=3D?=
X-Exchange-RoutingPolicyChecked: 
	ceG44ufwT5NHI0ssYTjLyyEs8NnFwcHsvzKlYR8j2b/o+thzIvn9T6NcV2cfbiPkzzuJS3uiMpM4NcjVFKCUnemp7w73isv3exW4VrKB8/FRxAP76zkqTotgEPhIfteHg0aRgh727DhjuTqNgjsto3owsRSHyjEqLnvt+VjmXfcYYBLJbfdV/hz/sT7qHjk39XhaTCW+pLX9f85AW6WOSCsmcvniliASinx2QJAfvoIERPR6mliDYzezo4Y0Q7uksswmZAyf+MznT+m2KGwmevpdYSWnadOsN9UvYahi699o4r+DX3sohiU9E49Ra3Rg/nSUrwLGnSmBxvc10Aozpg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1acd120d-a36f-41f8-51ed-08df28295515
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4571.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 06:23:29.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 404Dz3Ii6fcNaZrmeazQ7Y/r/j4JGA4vBB93009obXltNWAm9dIwuboirAxs9inatbETWphFXzvCvkmKBO0WgAArRhrSK0JqHdqGNfry8W4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7835
X-Authority-Analysis: v=2.4 cv=KcNHIgYD c=1 sm=1 tr=0 ts=6acc7ce5 cx=c_pps
 a=CxbFE7Xfbix2UyL9/Td2hg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=PYnjg3YJAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=pLcd0w-RwbstPt7WJ1QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: WZuhd8Uj5Ebf08mFxWe_fnXhbW3tTdxn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNSBTYWx0ZWRfX6RcQQXjOqfLR
 tNpWH0bP9mCzNrm6eha+Qw6JhMBDOxSnWRv7+j9hCoqkWc6wMXhqhoEZ6rxSegCuktozbayYohW
 GVy8Dwtkw8lmpLRm4heXSBhQYgZIvl104epGneDNsJ6zysfEBhdY
X-Proofpoint-GUID: WZuhd8Uj5Ebf08mFxWe_fnXhbW3tTdxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNSBTYWx0ZWRfX+5KeZY3r9k/o
 PkGcDYcjGndK8dCeKVfEDj7bAL2lZzqzlpGbWuw06PcHz00HjXTG4VKJEQlQXg1wiAqhMEEX80R
 Qh9AritniMWHgPGm1visGhH5+X4ceVnPtgi5hOKsVmnvZQRVH7XVp7Ewjgo10KvoaT0M7A+OrA9
 xLzMcrfv69KbUePX+Vk9gWD7AgS2UNssGmD264H73ISwx0jVYx08Y1tAMSLg1KkPjxwwzRBi5fb
 I3Icwiu7WBKyBsCPN/mYqaDaz+nHQn7OM9j512JanRkWW06BE8KiU/NmigmXt4n9NZcBibO2b4j
 Mp5dtqHKyqm3eVXoLTtHb0xqU3f1Q+UDl2tdAe13IeN/dBh4CMPKm7EmfzVwnZPkWx7dFpV2fkU
 ZnpjkgWxgINnw49KM/HaPyh53Tjk478ctMOAa1b7vAGoswMUAb9hyv+8idvMLkRA8uxZCdx3Y9l
 uZgF5gDf8oK5S5TpDCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120025
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69C5JNbN2075083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 06:23:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247613

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

    PR 127656 use-after-free in libstdc++ pbds binary heap erase_if

    After reallocating the storage the m_a_entries pointer is left dangli=
ng
    and the new storage is leaked. Update m_a_entries after reallocation

    References:
    https://nvd.nist.gov/vuln/detail/CVE-2026-102010
    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D127656
    https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Daaa8351f4d2e636f9=
680a1f0a8ebc2f0a60611e6

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-15.3.inc        |  1 +
 .../gcc/gcc/0029-CVE-2026-102010.patch        | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0029-CVE-2026-102010.pa=
tch

diff --git a/meta/recipes-devtools/gcc/gcc-15.3.inc b/meta/recipes-devtoo=
ls/gcc/gcc-15.3.inc
index 2f74351085..ed719197bc 100644
--- a/meta/recipes-devtools/gcc/gcc-15.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.3.inc
@@ -75,6 +75,7 @@ SRC_URI =3D "${BASEURI} \
            file://0028-fix-gcc-libitm-false-postives-02.patch \
 	    file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
+	   file://0029-CVE-2026-102010.patch \
 "
=20
 UNPACKDIR =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/sources"
diff --git a/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-102010.patch b/m=
eta/recipes-devtools/gcc/gcc/0029-CVE-2026-102010.patch
new file mode 100644
index 0000000000..5eed94ab5a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0029-CVE-2026-102010.patch
@@ -0,0 +1,73 @@
+From 29e51a820d76c766ae417fcba912714337b0eb17 Mon Sep 17 00:00:00 2001
+From: Jonathan Wakely <jwakely@redhat.com>
+Date: Fri, 25 Sep 2026 18:14:34 +0100
+Subject: libstdc++: Fix use-after-free in pbds binary heap (CVE-2026-102=
010)
+ [PR127656]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+After reallocating the storage the m_a_entries pointer is left dangling
+and the new storage is leaked.
+
+libstdc++-v3/ChangeLog:
+
+	PR libstdc++/127656
+	* include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp
+	(erase_if): Update m_a_entries after reallocation.
+	* testsuite/ext/pb_ds/regression/priority_queues_erase_if.cc:
+	New test.
+
+CVE: CVE-2026-102010
+
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcomm=
it;h=3Daaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6]
+
+Reviewed-by: Tomasz Kami=C5=84ski <tkaminsk@redhat.com>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+(cherry picked from commit aaa8351f4d2e636f9680a1f0a8ebc2f0a60611e6)
+---
+ .../ext/pb_ds/detail/binary_heap_/erase_fn_imps.hpp   |  1 +
+ .../ext/pb_ds/regression/priority_queues_erase_if.cc  | 19 ++++++++++++=
+++++++
+ 2 files changed, 20 insertions(+)
+ create mode 100644 libstdc++-v3/testsuite/ext/pb_ds/regression/priority=
_queues_erase_if.cc
+
+diff --git a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn=
_imps.hpp b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_i=
mps.hpp
+index 752688bb8e94..1eec3c9fb334 100644
+--- a/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.h=
pp
++++ b/libstdc++-v3/include/ext/pb_ds/detail/binary_heap_/erase_fn_imps.h=
pp
+@@ -121,6 +121,7 @@ erase_if(Pred pred)
+       entry_pointer new_entries =3D s_entry_allocator.allocate(new_size=
);
+       std::copy(m_a_entries, m_a_entries + left, new_entries);
+       s_entry_allocator.deallocate(m_a_entries, m_actual_size);
++      m_a_entries =3D new_entries;
+       m_actual_size =3D new_size;
+       resize_policy::notify_arbitrary(m_actual_size);
+     }
+diff --git a/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues=
_erase_if.cc b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queue=
s_erase_if.cc
+new file mode 100644
+index 000000000000..30b8452eff96
+--- /dev/null
++++ b/libstdc++-v3/testsuite/ext/pb_ds/regression/priority_queues_erase_=
if.cc
+@@ -0,0 +1,19 @@
++// { dg-do run }
++
++// CVE-2026-201020 use-after-free in binary heap erase_if
++
++#include <ext/pb_ds/priority_queue.hpp>
++
++bool is_odd(int v) { return v & 1; }
++
++int main()
++{
++  using __gnu_pbds::priority_queue;
++  using __gnu_pbds::binary_heap_tag;
++  priority_queue<int, std::less<int>, binary_heap_tag> q;
++  q.push(1);
++  q.push(2);
++  q.push(3);
++  q.erase_if(&is_odd);
++  q.clear();
++}
+--=20
+cgit=20
+
--=20
2.49.0


