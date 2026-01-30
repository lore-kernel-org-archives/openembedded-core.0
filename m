Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79EFD73EB5
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 02:58:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2325.1769741898185652293
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 18:58:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JmLYfn2N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6490267fb3=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60U1vSpm3583741
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 18:58:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fBJDoNGlSONZOVkt2sGRTN+UzusWPBmVFO+i8bs+nzI=; b=
	JmLYfn2NxG52wehIvdRt4D3dBCwbK4+6dR6PgSHZp4yydEqCY4Z9b7fRoKnMW2il
	BWdkk7Vnkakvch8qGE/CpjliFcx13zwru3EZJMWoPok/Hl3ZA1D6ecHsgHMGWApN
	z6jPdXEcIQMa/UhWfuTLaAYp6aPDBf7YajAo6bn1abcQcd1a4o5deBHjbuiaxwve
	HJ+XwXcIza6q9252FmhYcJOho4Rt/+dCC3i5NgXVT1mvCqy8tabo/H6I8REIwqB+
	ejI2UfoKS6jK7qHcrUZSBs6BUdnyzCj9Gdw6XdtmtiyoGSDMLfhxkzNxf5pXVKYu
	QUFdeVTBqtgFpn7IFTnElQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011019.outbound.protection.outlook.com [40.107.208.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4byx2t9nhc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Jan 2026 18:58:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EF+mUti/cEm9+dGEJ9679jTWyso8EL2MpPjNDggSkDEcHv6ApryFv2kl2/Ed6DDirPV+gEegc5fcwTvG5xdxyI6/gAKu+iRtMbvyK3+O4n2nwiTW7cMYG1PSIKhHTQAbcmSRYIutDf6t+j+crLeRmoP4WU3BBRf7V9uENK/OqVfG6xE06nHKgsdI6dLJ7sRTea9RrdDKkvjYbC1L26agGgGJHbRVupcFV9kT34nWZIHYwukfqBK/RJQx0Bq8vy8YZTdHaaJEWXUbAEYgW+WOQKhTI4sVoFYrz6LApjZuHxejFmObp+U3YnfXQFvUQ0bep3vesQrVjpKUT3BnOxZ6ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBJDoNGlSONZOVkt2sGRTN+UzusWPBmVFO+i8bs+nzI=;
 b=w9uNU/7fUwPIibskL/JCZ9/thOOluGDMGD000AgQGXEr/LCL1AmDhGyNw6nMWT5JMHrlNTxik4nRLJMoqN0cSqkFWUV3PPzfPeosk5q9fT9IeJwPAQk/ojdxM/ac79+nz0q3WnVfhr4b/RVUgpZToGLCtQ3iT5jp3J0cRPBgHCBTcBBH83yx69cQUsze8OfJa2CuJAbmM40ol+iH4yO0wyh96If0UW2z5Se6H1gcgno3lqei6xh8qoqTjVqz57faNpLBkFjsFrgRFVP4O1lq6qEZIr27uuv4/fA6PwqsjHY796x/UGm0IUzxe076GtUlY/9ILBEfYeltbCff/WmHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH2PR11MB8779.namprd11.prod.outlook.com (2603:10b6:610:285::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 02:58:12 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 02:58:12 +0000
Message-ID: <959503cb-1863-4a89-8e7d-84bdf2ea7e26@windriver.com>
Date: Fri, 30 Jan 2026 10:58:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] runqemu: restore support to run without bitbake
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260129030811.104017-1-Qi.Chen@windriver.com>
 <CANNYZj89FNRQXGM6MQUDKhZnTt9in3=i7rgNkh1BnkThUnEtyg@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj89FNRQXGM6MQUDKhZnTt9in3=i7rgNkh1BnkThUnEtyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH2PR11MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: be61bcf2-067b-4910-c483-08de5fab67d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S1Rxa1J2cXN2UjlFSlljT1RDcUtKNWJ0cVV2VWluM3Z3SzBDbGIzVEFiNElJ?=
 =?utf-8?B?RE85WGRQTnVaUzNyVG9pVmV1QkNyWHoxbVdXLzl6eGI0bURLaHNWVC9kQnl4?=
 =?utf-8?B?dWQ3cm80U3JMeW1ONlEya2xXLzN2NWk4OFZCb20vc1luZ20rYXdWdjQzYjJ5?=
 =?utf-8?B?U1NSYW9rRlptYWxRU0VzS0x2cTQrdDh3cFFONllXd2l2clE2dWN3SnRXeVli?=
 =?utf-8?B?b2FJYXdJai9FVUJ0SmpsTkhlTUhUeFRqaWJKdU55RWVLWEpnVG9XTkRHamVE?=
 =?utf-8?B?c2pLbUhWRDVVZWZBcWhHVVVicDdPVjJIY0lGd3Q1cUluWTRtNmdJckhLU3F6?=
 =?utf-8?B?MlRrSHp3MDNoU1dVM24xa0JhbzhqM01ST2IzREQ3WkRPWStoSW5RdGNKYWhI?=
 =?utf-8?B?aXJ6cllHU2UrcVc1RUpycTliZEE0WUg2RW9od0w4b1NFbmZWTm5BcFJ5bk1m?=
 =?utf-8?B?SjFJRndUVXlOTW5KbXNqT0RMZk5RbFpSaWFRaUNCbEs2NjRBQVZIMXJNcmVY?=
 =?utf-8?B?RkhDaWdvaDI3LzJKdWM4cmNSdDZWRi9aNGZuMkNDUDhNRGxwdWpZKzkvNTBw?=
 =?utf-8?B?M3FTOVFxRTk0WHNUeFdrRjB5NUZ4SklOdVB0Wm5kSG9ZeGkyMlB1SWY2Y2M0?=
 =?utf-8?B?cy9rMnVPRlkvWEVQdjdYUzJEQXl2TElpUUFKL2lvdDVUbWwweG5yK2M5dmJV?=
 =?utf-8?B?Qzh4Ty8rWFNSRy9BNTdqNXU0dERmb01rakpxYjdCelp3L2U1czkwd3I5N1hB?=
 =?utf-8?B?SmdRSmd1NzM1R1dZdmh0eGZLQ1VIZVhxN1dGYis3VHR6eTBydW1Bd1ZwZTkz?=
 =?utf-8?B?WEo0dnRPb2ZTM3dMOWxIK2NaZ0JZQUR3bTdta3pVeFNQRjBlb25RUllwaWg4?=
 =?utf-8?B?bE5Qb29vdXptRE1nZ2Nid1daMERBdTgxblJNRHdiMHFaVkNjeWtnZEhudmpp?=
 =?utf-8?B?UE5PYU9iK1RXc0xDUjFrUnpEV25yNjNXTFp1b2NDM1hveTgwU24xMWRSbzh2?=
 =?utf-8?B?TlVid21LYmZwVjVRY2xUYjJScmM4SEJ3Y2VZdEcxdDg3VUlaMTg5cUd1Z0lN?=
 =?utf-8?B?MXgzclQvWHN0eVFSU0dpZ2VGc1BGMjVpazJvZCs2Q2FXM1pmTHByYTlNVnA3?=
 =?utf-8?B?dTFRd2JaSWZlUzFwTlVxT3Rob0p6UjB5MHArUkI4V21mQVFOZFNkNVRqdUts?=
 =?utf-8?B?akJseVp3ektnWldOazVocWhFZDJMRmFMbHpyV1VuOHRLTWl4ZnZNZ2h4OVNT?=
 =?utf-8?B?ZUJqVStGTUw5SWtvdU5OZmFXM1VJUzUwVStQM1NRdm5hR3VtMmxrblUyMHl4?=
 =?utf-8?B?MlRIb2tqd3BGR1FlSVJyckw3Z1dxSURxbG9zM2p0bis0TDNkdHdDZ29Va3Vr?=
 =?utf-8?B?Qm5jNmtjTEhGbkhSaGcycDMvREF0Smc3bkM3UjNBaGNyc1ltRUFmWVBQUE9v?=
 =?utf-8?B?Tkh3d1dRSWJiMDBzVFVNQk43ZUx0MGhhYUF2dFdSVXZjdTVSTkVsT0V1Um1t?=
 =?utf-8?B?R2h0NTV3Ti8rVVdEemN6SVRXRzJoMGdDNTlHQy93R1BQSHdXa0MrUjVrR2k2?=
 =?utf-8?B?cWdhdkdXT0FqSFB4VHZyN21pSmx4STlVcUROT0RsYUpUdCtTME9SaWtsNkdZ?=
 =?utf-8?B?eWlxQzQrcEZBNE43N2ZxelR0bk1lM0h4UTJZdWJyaFpwUkNGV1hsZHlTZ2RR?=
 =?utf-8?B?VkpoYzI2MVdlajNaNmU4UVRObHlOVERESXZleFlIZklQTjltbC9mSy9MaHY0?=
 =?utf-8?B?ZVV0d0l0cnFKcU8vdnNUazB4Njl2Z2xpVHUxSGlRS2VNR1FoS0pmVDZRV0Yw?=
 =?utf-8?B?U2xpeXEyeFBLQVdMbnRwZmlGTVBEbklkRXNwNzJaN0VJNmdUSUVNL1V3SE5W?=
 =?utf-8?B?U1ZoelFzdWgzV25nSWFnakxiaXRRdGZpNW9aVEF1T1dSV2w0OEd2d0VON3M1?=
 =?utf-8?B?eFhaanNnYWZ5MStycjVKTkNwZzBQcng4SGgrRGpiVzZqd0lrTmtIa1pmYTFB?=
 =?utf-8?B?N0dlMkQ2WVppdTN5YnZhWGdYRkx0VUhyYm9uaEdRbFUzbFVBbVJSS3FOYm1U?=
 =?utf-8?B?V1Y0TUE3TTQrUkM5VXJJcGJvc2tNTG5RV1crM25ldUs0TVJTU0MySXBSaEVp?=
 =?utf-8?Q?v2N5h0im2TBEPAEU4AA9hSoq/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S3ZmUXZEcnpmb3dldlpDSGEwci93MXExNDZlNExsQ1dmbTA5RWMwOFRSZXZl?=
 =?utf-8?B?TmFZNUhybUZmTHduNUw0UG44VE54SXVXK1Z0QTVKN1dPSnljU1FySUo4dS85?=
 =?utf-8?B?T2pXSjAyL25QQWVObFl6d1JDNGdtZGc5c2RJSmtEOWtWeitDZURxUGFWdkx2?=
 =?utf-8?B?RXJTaFFGdnhOcWFWRmxIZ2N2RnVuUk81cXZQN1JVL0tVbEtnNUZoUkxLVkRv?=
 =?utf-8?B?eTdHcElnUDFxdXhFWFZ3TS94MXVhRllDWVA0R0JBR3l2aUVBbFlVM0tSMUxU?=
 =?utf-8?B?OHdhbDY2NHp3ZGZ2TGsrM1RJNVBaeDhyUXYrVTJhcDUzUzBWOExRMEY3L0RP?=
 =?utf-8?B?eTNEUDB4TUdxejBCTDhxaUVkaUcvdE9aOS9NN3VacUFESFdlWVpYUlBxUGxh?=
 =?utf-8?B?YnpWOXhmcFdsS1NaRWxreFZsNENwNUR3TGlQTG02SEorUDNPK1lVMGVia0cr?=
 =?utf-8?B?TUlOODV3NkkxSk9jNXh3WGprRk5mYUpTVzRRcUdyakQxakg4bERoek9mT2Ey?=
 =?utf-8?B?dWF4MjhhMSt1MENTQ0I3d0pTTWZMSFJ1bHRwa0tBdXh1VU5LSWRwc21wZHRj?=
 =?utf-8?B?UEM3WUNCQnd5SlVFK1ZDcXp2Rm14RVVXaFJsd3hTOVhOOXdndTUrZmNyQUJl?=
 =?utf-8?B?VUFaMXlvL1lsM1gyck1senYyTnU5MDg4L2hkaTg4TXV4MTRna2lqNkVGdHla?=
 =?utf-8?B?NVZsN25XL294L3NZV2t1T0hJaFhaNnpDWjhZdTFIUEp3MmJod0dVTHdSaDNO?=
 =?utf-8?B?Q3RMSUVYcDlHc1VLd2RQZ0tqSlc3QzVQY2FkT1hTR0xpNVdMdEtXNmhwTFkv?=
 =?utf-8?B?aXliQjlhTk50ZE5uOFVkOTBsK3Y2bCs1K2hzSTQ0RFo3ZDhXZlFVdFNZbmdZ?=
 =?utf-8?B?ZTBNZlFmNHFrbjBoZW8yMlhiWHE5U2p1cnVJOE9mL3lhakVYRzFMOGhZdy9F?=
 =?utf-8?B?dHpqeVlDZjhQK01CNFZDL0Z4cFB0aU5KTFlXWDlmbXhOc0piYjRqM0w0SWNm?=
 =?utf-8?B?OTJCdmVzMWtHSEg0OVJqUEVIemhuUXBZWFI4Q2tLYVdXb3JCZmpFa04rUThZ?=
 =?utf-8?B?dlhQNEdEZE1EZmcwcmdyS2pNZlpWK2ZDUW01ZmtDUlA2L1ZKYjhPYklMOU1W?=
 =?utf-8?B?eG1kL3RCcWxXWmlDS3ZRcVd4Nk53azZGQ3dCVGVFN1ZVcDcrZTFoWDMxUC96?=
 =?utf-8?B?aVYzZTRYKzh1a3h3dE10d1JNY3N5WndkNGdlNzYvb0lIdXRvR1hDdHBRakdy?=
 =?utf-8?B?TW9Ba0NWVEdQanNPRzVKN3prR2ZqZlQrbmFiTEU3OEdwOWtTakc2eTQzT01Z?=
 =?utf-8?B?Q2tMMngyUG5kb09VekRPdjNjY0VCN0o4OXdJSEtaUEZ0NU5ONjBtdW5oZ09r?=
 =?utf-8?B?ZHR2Mk1WaDQwOFRuRXlxcDJPcCsrbDJXa0xLMHZjcURlVTltWnB1LzFZM3hm?=
 =?utf-8?B?V0w2RW5jdFhzTUtTaDhnNERLMVVWQ1dYZzQ4R2dwSUp1SHh5UUQ1VkpCT3Vx?=
 =?utf-8?B?UFhZQ0lHSlFCcUNad3ZLcVU3YURValo5bHNlZjM2SWR6SXk1SXRCQURkY2hO?=
 =?utf-8?B?LzBpNHBaS2JJaHIwWkpqamp6NGg4LzRGN2dnQ1F6OUlzZnY0aDZpcFNzcWRw?=
 =?utf-8?B?WDJwYU9MY0RjK0JUcHptTElIUXBEaE1wcUE5VytEdVpSTkxEeHhjUGwrWnlt?=
 =?utf-8?B?TVVPTkh5dnBNcDZ4RHZmRmpCSFBHYkp4dHp2Yy9ZbGRwVWVjMDI3aHZid0x5?=
 =?utf-8?B?OXBJNzBqdXFNbmx5akVtS21aMks4YVpZWXc5Mks0L2U5bG82T0twTlBtWTdm?=
 =?utf-8?B?TjdNbzFLWTd2YnMrTGY1dURKRXNxYlFEV0ZXYUdmTENuUnZadVU3aUdRVERv?=
 =?utf-8?B?WVJIKzBNQUNJWTZPMjJxTC9SYVZMSlUwYUlFWXBQZzJtaWZoTHBFSSticlVp?=
 =?utf-8?B?ZkdlZWxucGE3MGV3b201dGRuaEI4ajZEVVdEK09rZDhtL3MvUllPeVF4cGtT?=
 =?utf-8?B?cDF2dTMxWUdyMHVOdW1SZ1c5bitwbi9VaDVIcjdhbk45dEdiZ21DSjFyTUhy?=
 =?utf-8?B?WEh6R0xNeVUyNDZqZ1RlNVM5ZWdCN2dSLzJYcjdvdWpPa283T2hZWG1UNk9v?=
 =?utf-8?B?ZVgwcVpLUTRZbGp1MHJiNGV6d0lqTnlLUUduZjk0M3pwNlFvclMrTnJlWHZY?=
 =?utf-8?B?R2w5NWdaSTBPUTkwS3JSWDdydzZ0NWlpdkNjTXVHWi83N0ZPV0RTcWdCa09U?=
 =?utf-8?B?YnByZlZDY3dNQzlRK1AxZm53U1l0VGtWWkhPTXRxUTlZa25BYnhqZS9PamM3?=
 =?utf-8?B?NFh6VnlHN2dYS0JOcFlPdG1MbktDMnZOeG9TQUxDYmdVd2puUkxVdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be61bcf2-067b-4910-c483-08de5fab67d3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 02:58:12.0440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 65jgbnh2vaqnTHIjj3j3HcI2WRx5wZAmcnqdeVwVMd4MpoHgdSSuz04DdtMfJEkh0w0zeqbr5INjJT35MY8iLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8779
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: c_FiVIN0R4YE_pg0pnDmCbXNtUhBMl1j
X-Proofpoint-GUID: 8Ye8ENhKs0IJ0f3_HAds6cNd9l4KP0EA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAyMSBTYWx0ZWRfX0x/Bsks3+3HR
 7j82r/owm29wNqbCOJb84g6YD8IyedPVGwQO4nRTZRza3VGEs1ahRvEwkuKLQWtzSzhizfKRcXE
 aeZLhLBketuwZdgxTFyYy1I1ME7/nCNO1yVGSOdRT3pEdBdTF+uoZtiUVTYhnRBQZ/6DVu/JJCF
 1QCEFbdcIiG96+Mhm98hXcr+xw4X/ogPysnOuZtNQexzb/MiPGS1ng7VT4u3/9e3WbAlIrccmvI
 awuFQPhtd9FAB5mi3nzk+jeYzw3PyU2qyCQCeFXKMP846SimhVOE91/LSPeofQ/iJkcI3cc0kgd
 Y2Q7VQ58D6rRTsh7OB6FWKoiN973UWisXjrJ+cYZ7ccw81Rn431v0/b+pIso0WEbAeY4I7OBHx9
 G9hePWCdXORm47XPQ7p0GlwiLYH7IFy16YyVMT30BYIZuVs1M4fyp69kYDSUbBjoHppbTPqrNTY
 aNkdS+pAQeBL46TwPOg==
X-Authority-Analysis: v=2.4 cv=NcDrFmD4 c=1 sm=1 tr=0 ts=697c1e49 cx=c_pps
 a=eOcJweQzB5mT18+DdV5GwQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=2V6DY6BgAAAA:8
 a=pGLkceISAAAA:8 a=5XTsw3FG2avIWsLWtCsA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ldqKKs2zR4t-S6fqr-1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 02:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230175

Hi Alex,

I read the commit messages carefully but I did not find any use case or 
yocto bug that those patches fix or improve.

The major reason for this code path removal, according to the the commit 
log, is:
"""
this code path is never taken and can be removed.
"""

This reason does not stand, which can be seen from a 'git blame' on the 
codes. I've also found the history and put that in the commit message.

I will send out V2 to add the use case and steps of using runqemu from 
SDK and provide some background.

If there is some use case that these three commits fix, please let me 
know and I'll take that into consideration and send out V3.

Regards,
Qi

On 1/29/26 17:57, Alexander Kanavin wrote:
> Apologies, but you can't just hastily undo these because something
> broke in your setup. We've made these fixes to solve other problems
> and improve usability, so if there's a use case that needs to be
> supported, you need to show steps to perform that use case, what you
> expect to happen, what actually happens, and whether we need to
> introduce tests that ensure this use case works. Then we can work
> towards a fix that does not re-introduce the same old problems.
>
> Alex
>
> On Thu, 29 Jan 2026 at 04:08, Chen Qi via lists.openembedded.org
> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> This patch is basically a revert of the following three patches:
>> - 0c10a78796 scripts/runqemu: raise an error when bitbake was not found
>> - b931f74442 scripts/runqemu: remove the code block that works around the missing bitbake environment
>> - 8197be4dd3 runqemu: ensure that bitbake environment is either returned, or an exception is raised
>>
>> The comment is also changed to reflect the current usage:
>> "invoked from a running bitbake instance" ->
>> "invoked from environment with no bitbake (e.g., SDK)"
>>
>> This code path was deleted by accident based on the reason that nobody
>> is using it. But in fact, running runqemu from SDK needs this code path.
>> Such case has been supported for years.
>>
>> A little more history on this code path:
>> In 2016/09/09, this code path was introduced[1]. It was introduced
>> originally to handle running bitbake inside bitbake situation.
>> In 2026/09/19, running runqemu from SDK is supported using this code
>> path[2]. This means that this code path was then needed by one more case: SDK.
>>
>> Supporting running nativesdk-qemu from SDK easily via our script dates back to
>> more than 18 years ago, as shown by 'git blame' on the nativesdk-qemu-helper recipe[3].
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=1e8165ea2f19aecdc03ccd102ee44ef0544f0f39
>> [2] https://git.openembedded.org/openembedded-core/commit/?id=93649edc034f2540ff55dc9b41638797209cfb9c
>> [3] https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   scripts/runqemu | 47 ++++++++++++++++++++++++++++++++++++-----------
>>   1 file changed, 36 insertions(+), 11 deletions(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 32a3d6296a..7e3d11f653 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -1007,12 +1007,34 @@ to your build configuration.
>>               if not self.bitbake_e:
>>                   self.load_bitbake_env()
>>
>> -            native_vars = ['STAGING_DIR_NATIVE']
>> -            for nv in native_vars:
>> -                s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
>> -                if s and s.group(1) != self.get(nv):
>> -                    logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
>> -                    self.set(nv, s.group(1))
>> +            if self.bitbake_e:
>> +                native_vars = ['STAGING_DIR_NATIVE']
>> +                for nv in native_vars:
>> +                    s = re.search('^%s="(.*)"' % nv, self.bitbake_e, re.M)
>> +                    if s and s.group(1) != self.get(nv):
>> +                        logger.info('Overriding conf file setting of %s to %s from Bitbake environment' % (nv, s.group(1)))
>> +                        self.set(nv, s.group(1))
>> +            else:
>> +                # when we're invoked from environment with no bitbake (e.g., SDK),
>> +                # we won't be able to call `bitbake -e`, then try:
>> +                # - get OE_TMPDIR from environment and guess paths based on it
>> +                # - get OECORE_NATIVE_SYSROOT from environment (for sdk)
>> +                tmpdir = self.get('OE_TMPDIR')
>> +                oecore_native_sysroot = self.get('OECORE_NATIVE_SYSROOT')
>> +                if tmpdir:
>> +                    logger.info('Setting STAGING_DIR_NATIVE and STAGING_BINDIR_NATIVE relative to OE_TMPDIR (%s)' % tmpdir)
>> +                    hostos, _, _, _, machine = os.uname()
>> +                    buildsys = '%s-%s' % (machine, hostos.lower())
>> +                    staging_dir_native = '%s/sysroots/%s' % (tmpdir, buildsys)
>> +                    self.set('STAGING_DIR_NATIVE', staging_dir_native)
>> +                elif oecore_native_sysroot:
>> +                    logger.info('Setting STAGING_DIR_NATIVE to OECORE_NATIVE_SYSROOT (%s)' % oecore_native_sysroot)
>> +                    self.set('STAGING_DIR_NATIVE', oecore_native_sysroot)
>> +                if self.get('STAGING_DIR_NATIVE'):
>> +                    # we have to assume that STAGING_BINDIR_NATIVE is at usr/bin
>> +                    staging_bindir_native = '%s/usr/bin' % self.get('STAGING_DIR_NATIVE')
>> +                    logger.info('Setting STAGING_BINDIR_NATIVE to %s' % staging_bindir_native)
>> +                    self.set('STAGING_BINDIR_NATIVE', '%s/usr/bin' % self.get('STAGING_DIR_NATIVE'))
>>
>>       def print_config(self):
>>           logoutput = ['Continuing with the following parameters:']
>> @@ -1691,6 +1713,9 @@ to your build configuration.
>>           self.cleaned = True
>>
>>       def run_bitbake_env(self, mach=None, target=''):
>> +        bitbake = shutil.which('bitbake')
>> +        if not bitbake:
>> +            return
>>
>>           if not mach:
>>               mach = self.get('MACHINE')
>> @@ -1707,10 +1732,6 @@ to your build configuration.
>>           else:
>>               cmd = 'bitbake -e %s %s' % (multiconfig, target)
>>
>> -        bitbake = shutil.which('bitbake')
>> -        if not bitbake:
>> -            raise OEPathError("Bitbake is needed to run '%s', but it is not found in PATH. Please source the bitbake build environment." % cmd.strip())
>> -
>>           logger.info('Running %s...' % cmd)
>>           try:
>>               return subprocess.check_output(cmd, shell=True).decode('utf-8')
>> @@ -1722,7 +1743,11 @@ to your build configuration.
>>                   cmd = 'MACHINE=%s bitbake -e %s %s' % (mach, multiconfig, target)
>>               else:
>>                   cmd = 'bitbake -e %s %s' % (multiconfig, target)
>> -            return subprocess.check_output(cmd, shell=True).decode('utf-8')
>> +            try:
>> +                return subprocess.check_output(cmd, shell=True).decode('utf-8')
>> +            except subprocess.CalledProcessError as err:
>> +                logger.warning("Couldn't run '%s' to gather environment information, giving up with 'bitbake -e':\n%s" % (cmd, err.output.decode('utf-8')))
>> +                return ''
>>
>>
>>       def load_bitbake_env(self, mach=None, target=None):
>> --
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#230110): https://lists.openembedded.org/g/openembedded-core/message/230110
>> Mute This Topic: https://lists.openembedded.org/mt/117521005/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


