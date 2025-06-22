Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE0EC7115A
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 21:22:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5409.1750627355770404639
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 14:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8268ae25e6=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MKsxes025942
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 14:22:35 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mgtxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 14:22:34 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55MLMYNb001902;
	Sun, 22 Jun 2025 14:22:34 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mgtxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 14:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5n8Ywf1atDpKYfsf/z8gXnDddU9redijg6qldHIJePRqjiTEurwAGac2OEQt5JpMDlaX1/jCG+pWj5MXHnfeZbi6qRGOpFhh041Sh4gk3/9RkTQUPULRh8STWGPlnuLCi9qVvgvkW+GQ6yxrMmFZzd5u3bxfPFzSUqZfUou5J3fiCaJ0N15gVn/WcUAV39+8TjnNIe/1Wx131Ci2Kcid6f10j4reIUC1NWQ3yMeu3roXj7KKkYRYvMBTCFDMXXoPjh+NjZSjW6x6wytiy0dHTmnwsw0X87wbiLLMpUuCwxGnncDK5UqMszPBh4yuue9LsqgU7Vd5eqjjyKwzBYYbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hq9zcx30ZS6CkWYOD4SDdiHb7se4XaHzuOBGHoag4sU=;
 b=UPEEoGwu+hMzTKhxj4J36umVZObn9ma12L9FbkJfaXtpddke+/JVJt1kwlhO5ahcTl84F0BlJDgAaTPkKeYc+6PTOxTpr8vyj5J7SMXUVgefk0ARkV7ZXFYo4TEBAKmTv2+ohM8VkJACBgyS4uaf1s6l6r3Fh/K15Tnt6CVx8AsDx0k9KJjftsuWlJa8oxtf1iAIOnw3oGofHLUHcQDbzFiXc5owvW8xAQMx/womfghUvrEq+iV+FONIixZ+YTFg52lN2FGSEvuM9i2tByLiASpdXmr6STIbsNo5Mveh52UQP6r50CMYHakxRc0J7+SJFDP8jImYS58Zw+i6pLkyJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by IA1PR11MB8864.namprd11.prod.outlook.com (2603:10b6:208:597::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Sun, 22 Jun
 2025 21:22:29 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.8857.025; Sun, 22 Jun 2025
 21:22:29 +0000
Content-Type: multipart/alternative;
 boundary="------------uLpIIv49y0ObrXDsGc6vVgGC"
Message-ID: <488c0487-f767-4c4e-b74e-cdd1ba93ffe7@windriver.com>
Date: Sun, 22 Jun 2025 17:22:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] clang: multilib-header fix for
 llvm/Config/llvm-config.h and clang/Config/config.h
To: liuyd.fnst@fujitsu.com, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>,
        "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
References: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20250521031413.1566-1-liuyd.fnst@fujitsu.com>
X-ClientProxiedBy: SJ0PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::6) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|IA1PR11MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 66cf8d15-8594-4fe6-e71d-08ddb1d2e4b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|7053199007|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eTBFNmN1bW83SW1uV3BHTHV4TTFkY3VNd0o4TjlFMlNIZDNjNHhYbDQyODZU?=
 =?utf-8?B?RzdDdm5ia2IvbkhBeHR1OEJYcUxMUDV6QVl1SmF1TzU0SGx3YTNrYnhvUStF?=
 =?utf-8?B?RG5scmx4THorYWg0aERMNWMvaVJMVmlSTDZONldKK2RSMU1kdEpxNTU0UVQx?=
 =?utf-8?B?SEZjSXRzUVk2R2ZCQWI3Skw2OGxBK3B5VVZEajA4UEk5QTg0YUdaQTJ3SmJC?=
 =?utf-8?B?RHErcGNIV2V1RGNuZW93QWFZUmE2NWZqTzZRRVR4aGlKcENCYjFKWEZrWVNp?=
 =?utf-8?B?NDcwczZSbVdLQXJjaVZ6OStIbkY5WG9xLzNucG40SnljTGE2M2V1SDV6RFUr?=
 =?utf-8?B?SmdBa2FFRmRRL0hHRjUyQ1duY2Y4b29HczRmN0Y4ME1lVGJ0dDJycDlvVjJX?=
 =?utf-8?B?ZktJekxSdmlKb1R3WGkyQzFhY2wxRHpuZG5pODhuRW83dy9zdVZ2NDlhRG5Y?=
 =?utf-8?B?OWdaR3djYzBkdXIrTlpsdG9HTjVtWWFlZXVRdExJY3FyYldrN2NMMlhaVWFR?=
 =?utf-8?B?VXZjVXFaNm03cjR1TjN1Vy80V1ZQd1BGQVdQbFRlczBSTVJsUzNiWTh4VlE3?=
 =?utf-8?B?d1hNR1NIVUVwNldRQkJRQ3JTQXlaNVBuelNneEJFd2VhWklGYXJYbjVwdXlV?=
 =?utf-8?B?YmJSVEVBRVV0Nk1YbTlrVldsck95cUtFVTlwVDNaWnNYdExIdnhqbUdGOERi?=
 =?utf-8?B?Vmo3RURxMUZEdndTNHJMS2lRbWw3OHRlTEs0RGR2RHVOemYrWXE2SzFFb0tp?=
 =?utf-8?B?YXF6V205ZkdCY0VyUGJRV1I0c21saG5nOEUrOVRNZlZOOWFxNVpwSFlhdkt1?=
 =?utf-8?B?bXdUNHZqa01zNVljR0JxNUhhOE5NaHEyNnphRm51Y1ZCWFp4d003eEh6ZE9N?=
 =?utf-8?B?YTZUTDJaZDJkSkFyUnBpTFRjSG9oNDBLaXhicVl2VEZEQ1NpS3g3WVN3SG0x?=
 =?utf-8?B?ZDJybzFzM1h0eExuY3d1TC96V3VWT2gzY2lzenB0MVF5REFoWnJXRFRUamFr?=
 =?utf-8?B?SXB3L21zRjY1TmFEYjBrdlZvalEvaDJYWU5iUFphNThMeXZiTzhlS3paa2hs?=
 =?utf-8?B?djJ1NGJlVVozbW9zdi9xTHNSSldGZ2JuNG1NNUVoWm94eWo1SHFiaWN4Z25U?=
 =?utf-8?B?VmlMeWJ6Uk1iaVZmMUR5TkFXSWNVTHRseU9CTU5HanBZNDBiRTZDRmg5YTRR?=
 =?utf-8?B?ZWIwUy9tNlJ4enROWmpnRHNEcnQxalNRS0JaNDU1WHZjUjJBcjRTQ3ZtS3VL?=
 =?utf-8?B?dmxxb0h1RExqMVV3eVdFaHFaZGNDbnZEcWdmWHhrNXlCVzBUeHVFQy8rczlN?=
 =?utf-8?B?NEFwMnlsb3dQZUx0VEErQ1JGUjFGOWNNb2dQbStPK3Z4a21sMUI2NmI1Zzdk?=
 =?utf-8?B?NXZNKzRrMHZXNVJrWWxGZVJObHlrQzRtNy8zUE5CWE5jTnBmV01oS1VZMkEx?=
 =?utf-8?B?bUpzQll0Y1BmWHlTWjZTV2t6NzJwcklGOUVTcm1tM0dxdTEvc0Jva0psU1I0?=
 =?utf-8?B?S1JLY2E5T2NTYWlYdVdNTjZ3bm43ZFozZ0RpWHJmbXdGdGRtbWJTTTZjb013?=
 =?utf-8?B?azBuVlJ2SUFXQmRKbVhDNlM1RXIxZUFpTUlQb0pvMEJWa3ZtRGhab1htcmFY?=
 =?utf-8?B?M3V5c09VWGVFNjBPb1JtTHhSelUxcDVrWEJ3NzZpTW5qVm9lRDQwYzdSUmxy?=
 =?utf-8?B?SU4yVHVYVTcyeVVEcEthQ3M4RitQZ0Y1WUN5b1hyQ1Y0Q3Jtd3I1US9KOFVr?=
 =?utf-8?B?VFVLSWxic3ZlSVFOdmJGbzFUclMzL25Ubnp4d05uTkQvNDhZNTZnNVdqVjF5?=
 =?utf-8?B?L3Bxalg4b3pydFBLY05sUFRyQzYra2c3RHUrUzJFK2lCTzZlcnJsdWs3RS9N?=
 =?utf-8?Q?YTx8cjgL/kFNe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(7053199007)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RWR6a3FMQitoeFEzVW4zaE9zQ2Q0cVc5OXIydDdhUjh1M0JPTXMvb1NORk1H?=
 =?utf-8?B?QnFuV0xaRTgxM2owYnhSR2ZnZFNhaTd1aE9iZm9HNXU0NCtTZHcwcVZwSHM4?=
 =?utf-8?B?T3daWWVRK05QMXFFdk1qMDNzeFZldXMrd2JrY1NWcVFBYTY2aFpwbUNLZy9Z?=
 =?utf-8?B?YWdvamhoTGhuZUtnMEhacXBwTVRNdGpkRDA0T0ZCNlJnZVRVTGlpN2VhaDRH?=
 =?utf-8?B?M2JxMnJuSE5yMmZobTFXNjRQVmp4R3l6RERualZwVnRieFgzcDUwcmZZZWdI?=
 =?utf-8?B?UzJDSEhLb09rMzBxbDdvakxrV0pIaGpQRXJQYk1PWlhad2ZOMXdtTGxMR1U5?=
 =?utf-8?B?eWhaSnJmZnpHRjcrZTlmeUZzd21Uci9VTzhrSW80YWdkaU8rWXFFZGp1NjFJ?=
 =?utf-8?B?WElPMFZqWmk2U3hNWDF1QkMzWWtFMWQ5WmRJS0kzdmNldGZVK3k5VHNkQ1hS?=
 =?utf-8?B?V0pBVEpQUUlyeXd0ZmFzR2FURTg3ZUV3aFE2V0JNZUROb05jODBOWVVHRDda?=
 =?utf-8?B?Wk5HYzFTVFJaQm1FM0hLbU4xbmdud1B0Z0Q0d3R6VUM1Uit5RHQ0cDZkd2Nk?=
 =?utf-8?B?VU9TZzd3Tjc4eDArUWFPUzBkbUxPWHZlQWRmNEFpOUxmRFFRWlhQaWtVV1hm?=
 =?utf-8?B?QkN5U1dzT3lJR2swMEU1cjVIc01FNWVoRlFXSHA4R0UzdUZvMXlSUThibnVq?=
 =?utf-8?B?QTNSSTJYZ2UwUDZzNk5YWGlVaDVPRjFsQmxxRTRjbkc2RWZEb1BaSDdUWDZy?=
 =?utf-8?B?SHFQRDVSb25YWEQyRU8zS2xGaVZuQm9IaUpKS1hkV3FxQkQyVXZxN0tSN1NS?=
 =?utf-8?B?eG9TV1pnT2NWL2ZMT21Neld4U1FWVFhEWDFWc1BhWUdWVzVzTndNU3EyV1VU?=
 =?utf-8?B?aGpNZUFINjdpcGVPWnNuQ1dLSVFWa1Q0UzZ0amZQUExWTWhyeUFDUjBRU2JQ?=
 =?utf-8?B?bnFtWTdITE9LaFJ4V2tNdXhpTittRmtGTnIyL0JQL3E1WkdyL09BMFpZbVZO?=
 =?utf-8?B?YTVOQkw5SFpxVUE1U3RKaHhDZDEwcUxsbkt6OU5hY1VkbjNkQ1plNDhVb1oz?=
 =?utf-8?B?Mm12UHlDcyt3aG81c2RzKzlOWk9CNFZaalR0Zk5mcmJmWDQzcDIrYmRSQXZ2?=
 =?utf-8?B?YU5hVTBQbVlmdjVmTG1TSm55VDAvWlpXa3BLVjMwTFozR1Q5UzFsOUs0Y2xw?=
 =?utf-8?B?aGhSMkt4R2VVMENJaVpMMnUrN3QrQ1Z2V3FzRzM1QmZuOUo1TWNYaWozczFr?=
 =?utf-8?B?SzJCMzBJN0N5czZRT1ZSUzlHaDFuTmlLYUtXK05veDFUVTFTeG9sVDFMRDVl?=
 =?utf-8?B?bHp3SS94QnhmbWNzKzR5R2l6Z2xTR04rNzF4eUs5clg1bnBUbzU1OGRvOGQ5?=
 =?utf-8?B?QUxpem45ODBFcWFZYUVNOE4xTE50cEJLS0dwWi9EOHplT29TVFYzWlBVMVJ5?=
 =?utf-8?B?N2M1dHk5ZnJya1dFa3lTRGhFVHFILzdXVjVhMnVjWnRLUndLbEtNTTJGZ1JX?=
 =?utf-8?B?b1FEZ3BGbFMvcTdPQjgyZ2s4WnJEdEhDK3VHYXpMN3hpenVqcm1Ib3lzZ1pG?=
 =?utf-8?B?VlFtRUQ3NkUzUDhzVTBpb0djdEtJb2p2TktZa0krNklqc1F6cnhYSUgxeXpP?=
 =?utf-8?B?NkYyekx6TlNEMkw4SytCRmpselRMOUI4YmpKVHlxZVI1U1hWTW90SlZlWTRa?=
 =?utf-8?B?a0pmM2VrMVM5aFVwMXB5VSt4WmJraHRxRWFUSjJSZEF2ZzA2MG1aa2NTSGdR?=
 =?utf-8?B?dTRVUnFPZ25BUHlucXJTM3p4UjlmMVBvSVc3UnBUSWV4UFhDa3NyVTQwVitK?=
 =?utf-8?B?eWFLTzFPT1hPcFJxZG5ZellxVFVRcGhoK05rbS82NjlsbU9aV0JIWFRicU1m?=
 =?utf-8?B?dWVMTExLNVlLSVJMZTFNd1ErRXQxVWREOUY1T2xTU25BKzIxdG1ZVSs3Mmpv?=
 =?utf-8?B?aDJ1SG9WLzJDZ3k3eXBlNlFsT0Z6ZWNDc29oalJHblJ6QlJmUlFRdDJXSXE3?=
 =?utf-8?B?ZGVxS05kdkJwb28rc1I4cFRKa21QemxWQmdKK1FiY3lEQWE1cXFUMmJpeVND?=
 =?utf-8?B?ZTBwaktJTUVLWGhoU25KTjBTSTY4RVhxUDVxVERINEcvRThUK3Q5cUtOd3BF?=
 =?utf-8?B?RWd3Q1lGeHRieGhnUGM2RGdMVjJ6andKZW1QQ3VNbG42c01uQ3htZVdHUGM2?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cf8d15-8594-4fe6-e71d-08ddb1d2e4b5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2025 21:22:29.6067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPAbY4LqgQSjEKAN+6TC+gm1Dl+NjO88ljFG7+Ub8/Gx62PazxfOwtFbTIHxn+J/lym8cx5wpXVAmn4N2N1YZTty6ZMQOz0CA41Z/hYThyE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8864
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDEzOSBTYWx0ZWRfXy25Y3T60Nekv o+5dKUWYXct0ApOWSJjpN24OURX6xo3xxpox/UcY8GSeJH2QalX80Fu/0J3Z/oEpua6GBQ/Lh/2 unaAZoMS22/k3j3Ze6As0UzfxDaAqaAjkmLG4oFTWL++vJQ2si+Hpho/BgKBz14j4Wfbx6zd62j
 q8MfwFZ5l1AdbzFDHIIHz5ixDjgqKeoI6DbEeqxhMy3m0+bcn2Vm61cAzdITUu0j3N4hNSwR8xc FzGaIgmfxpH+lPm+KQJgRRGPXFqkZRCk8rNmXINGBOpEVfifZNwoNk3fJKlMKSFktelnrfaKL3x rYisNlur2ywxbQ7bMG/JjzmhCppZuer8Fjg2KDXPzC/NgDy2YgLvqWuR/2L7JIMv7f2RQ5FC1Xo
 mhdoBshj/MyBJxPsu0vtb10QAVDiyxciL/UW8l3W+4FizFn8xj5RBBPdHpt4jVgsUcvcCJyQ
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=6858741a cx=c_pps a=G8Sf3mT1jvIaQOhbhIGySg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=mjaUHu8XhXXln3gKnqsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=qsIOyAu0HKiLLKTbUcIA:9 a=O7blUZE9VBqRVJJq:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oTl4pTK_eciZA_73KVTkqa1xWZvpjStf
X-Proofpoint-ORIG-GUID: 81zvH23ZTe-S6numx7IE2UvJTHiyxZvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506220139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 21:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219195

--------------uLpIIv49y0ObrXDsGc6vVgGC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55MKsxes025942


On 2025-05-20 11:14 p.m., Yiding Liu (Fujitsu) via=20
lists.openembedded.org wrote:
> Error: Transaction test error:
>    file /usr/include/clang/Config/config.h conflicts between attempted =
installs of
> lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64
>    file /usr/include/llvm/Config/llvm-config.h conflicts between attemp=
ted
> installs of lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.=
core2_64
>
> reproduce steps:
> 1. Add in local.conf the following lines:
>
>    MACHINE ?=3D "qemux86-64"
>
>    require conf/multilib.conf
>
>    MULTILIBS ?=3D "multilib:lib32"
>
>    DEFAULTTUNE:virtclass-multilib-lib32 ?=3D "core2-32"
>
> 2. add lib32-llvm-dev llvm-dev to core-image-minimal.bb
>
>    IMAGE_INSTALL =3D "packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL=
} lib32-clang-dev clang-dev"
>
> 3. $ bitbake core-image-minimal
>
> Signed-off-by: Liu Yiding<liuyd.fnst@fujitsu.com>
> ---
>   meta/recipes-devtools/clang/clang_git.bb | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-de=
vtools/clang/clang_git.bb
> index b41b700292..d083dae28b 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -22,7 +22,7 @@ INHIBIT_DEFAULT_DEPS:class-native =3D "1"
>   LDFLAGS:append:class-target:riscv32 =3D " -Wl,--no-as-needed -latomic=
 -Wl,--as-needed"
>   LDFLAGS:append:class-target:mips =3D " -Wl,--no-as-needed -latomic -W=
l,--as-needed"
>  =20
> -inherit cmake pkgconfig python3native python3targetconfig
> +inherit cmake pkgconfig python3native python3targetconfig multilib_hea=
der
>  =20
>   OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
>  =20
> @@ -236,6 +236,9 @@ do_install:append() {
>               install -Dm 0755 ${B}${BINPATHPREFIX}/bin/$t ${D}${bindir=
}/$t
>           fi
>       done
> +
> +    oe_multilib_header llvm/Config/llvm-config.h
> +    oe_multilib_header clang/Config/config.h
>   }
>  =20
>   do_install:append:class-target () {

Hi Yiding, Khem, and everyone,

This is mostly a note to myself but if anyone else has tried the=20
following or wants to, please let me know.
I haven't worked out exactly what the test is yet either so stay tuned.

I think I need to test if this patch enables on-target compilation=20
(packagegroup-self-hosted should be able to pull in either gcc or clang,=20
IMO)
and if I install both clang and lib32-clang=C2=A0 what options to select =
to=20
get the desired multilib.

Also if we add that selection mechanism, do we still need this patch.

../Randy


>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216962):https://lists.openembedded.org/g/openembedd=
ed-core/message/216962
> Mute This Topic:https://lists.openembedded.org/mt/113223787/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------uLpIIv49y0ObrXDsGc6vVgGC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 2025-05-20 11:14 p.m., Yiding Liu
      (Fujitsu) via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250521031413.1566-1-liuyd.fnst@fujitsu.com">
      <pre wrap="" class="moz-quote-pre">Error: Transaction test error:
  file /usr/include/clang/Config/config.h conflicts between attempted installs of
lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64
  file /usr/include/llvm/Config/llvm-config.h conflicts between attempted
installs of lib32-clang-dev-20.1.4-r0.core2_32 and clang-dev-20.1.4-r0.core2_64

reproduce steps:
1. Add in local.conf the following lines:

  MACHINE ?= &quot;qemux86-64&quot;

  require conf/multilib.conf

  MULTILIBS ?= &quot;multilib:lib32&quot;

  DEFAULTTUNE:virtclass-multilib-lib32 ?= &quot;core2-32&quot;

2. add lib32-llvm-dev llvm-dev to core-image-minimal.bb

  IMAGE_INSTALL = &quot;packagegroup-core-boot ${CORE_IMAGE_EXTRA_INSTALL} lib32-clang-dev clang-dev&quot;

3. $ bitbake core-image-minimal

Signed-off-by: Liu Yiding <a class="moz-txt-link-rfc2396E" href="mailto:liuyd.fnst@fujitsu.com">&lt;liuyd.fnst@fujitsu.com&gt;</a>
---
 meta/recipes-devtools/clang/clang_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index b41b700292..d083dae28b 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -22,7 +22,7 @@ INHIBIT_DEFAULT_DEPS:class-native = &quot;1&quot;
 LDFLAGS:append:class-target:riscv32 = &quot; -Wl,--no-as-needed -latomic -Wl,--as-needed&quot;
 LDFLAGS:append:class-target:mips = &quot; -Wl,--no-as-needed -latomic -Wl,--as-needed&quot;
 
-inherit cmake pkgconfig python3native python3targetconfig
+inherit cmake pkgconfig python3native python3targetconfig multilib_header
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = &quot;BOTH&quot;
 
@@ -236,6 +236,9 @@ do_install:append() {
             install -Dm 0755 ${B}${BINPATHPREFIX}/bin/$t ${D}${bindir}/$t
         fi
     done
+
+    oe_multilib_header llvm/Config/llvm-config.h
+    oe_multilib_header clang/Config/config.h
 }
 
 do_install:append:class-target () {</pre>
    </blockquote>
    <p>Hi Yiding, Khem, and everyone,<br>
    </p>
    <div class="moz-cite-prefix">This is mostly a note to myself but if
      anyone else has tried the following or wants to, please let me
      know.<br>
      I haven't worked out exactly what the test is yet either so stay
      tuned.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">I think I need to test if this patch
      enables on-target compilation (packagegroup-self-hosted should be
      able to pull in either gcc or clang, IMO) <br>
      and if I install both clang and lib32-clang&nbsp; what options to
      select to get the desired multilib.<br>
      <br>
      Also if we add that selection mechanism, do we still need this
      patch.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">../Randy<br>
      <br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <p></p>
    <blockquote type="cite" cite="mid:20250521031413.1566-1-liuyd.fnst@fujitsu.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#216962): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/216962">https://lists.openembedded.org/g/openembedded-core/message/216962</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113223787/3616765">https://lists.openembedded.org/mt/113223787/3616765</a>
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

--------------uLpIIv49y0ObrXDsGc6vVgGC--

