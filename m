Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 981EDE73150
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 09:36:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49382.1770024962537665693
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 01:36:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KX3ucp0Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6493f4f895=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6125P2sx2273793
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Feb 2026 09:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=UNOYkAMF5
	cJjR8gSa143l3k24gSjxKkz5UvqD5gqa/o=; b=KX3ucp0ZFySVLrh8Wqa9WHdNN
	1kGw42Cbzj9me3j5UxFeLJsJ75aQWlGLtZpU7DyZd60bNaSDvoQtuuDplK4ExDHm
	ThVF4Q3Oj3V+azEExo7+xVa7oUTYjFMN05rINlTliTRNpFVRMkOAqM/aq0SaPZbr
	SXFvXnWTNC+hMU3gXDq6Wu5LX7ZXtLbnWH+0n22HmHVu5QAUUtbh50JHhhTxfHQ5
	pTJzB51003/G2qIMSZ78AU/GSDjgjBDk6U5F0uX2BlqQSlOGhmuT54vyxw/DXmNq
	P7LfcDmrLit+7V7Iqssb8rynV6e28m5HoXgNdSXFHZncIgJ2PNsu8RpUPAHQw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c188jsugs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 09:36:01 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRLxHzdJ6te1jiAmax88LZ3ExT2hJoBNG9LQZ7uQXyh8+7jOXhtnhtVC6S4XwSwsYJAytm6AE8Wlquttw4bjrKPHNd9xrPXAn8oyeh4Ygk6NNF+oaLmbvTZy3TZumyvCfcihVLZxo1kSJ6we+CZRubEeu2gM2UakJH93fQSWOBDD6YmTUr8FqmlCQ52vYULNvQYZoej9/0MjNkigAgiqh+QmyouIngYwSnV+EkcJdUw33LaK3IKMJ61viu1KR7KJR3Ome9ZgYGtP7sTKP8VPIzOFpFrhVlpqlAcydn3lanqfdeQ1GAvKQhyY60YNybC3BAwGz90KU6JbwtjJIBUMjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNOYkAMF5cJjR8gSa143l3k24gSjxKkz5UvqD5gqa/o=;
 b=NiXRTpIUSviEKkwUAxcN0jaMLIvSbkwozvYwaY8yKP3lJ0KR6khGXGLBc5fh721Wd+BU+p+YgyZG5y4TNEHnAk89OmRelw32fJmIgCHAS8wX51L34k5F9p1FRuqapH1YY9vCFwpNFcEcJxkmY58frrE+9FLvgMB1/xqWSeGDk79Oo4exOhdEYUsxUP5D42mQzPsngAyeHXtFKpknLbj+3OLA7+FcRlH1Lr53kAupcmMuFLZugwfukezJqQ/HXI7xeiJBJVfvjcmEz20Z4KPIcefM332mZSDeMgZNgd59/V7nf2NVR+SV3AY/7R3O+SHYGQQ+GcYhexMIMINDWBv8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7147.namprd11.prod.outlook.com (2603:10b6:510:1ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 09:35:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 09:35:56 +0000
Message-ID: <264f0cef-de05-4515-bd33-71c136e01b46@windriver.com>
Date: Mon, 2 Feb 2026 17:35:52 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Subject: go-mod.bbclass and gomod:// do not have all sources codes available
 after do_unpack
Cc: "MacLeod, Randy" <Randy.Macleod@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0105.namprd05.prod.outlook.com
 (2603:10b6:a03:334::20) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7147:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7a2fcd-eb79-45b3-4a5c-08de623e772a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K1FnTzZrazV3Tk90am1DMVRWNVdSWkhTanlNY3dreG1EdFMxUmM0ZmYvSzFy?=
 =?utf-8?B?d08ybWxUS3Rqb1k5YWNxT1lsWktONFJLdkVBY2NKcFh4VkpOWDdtcm5pRlZu?=
 =?utf-8?B?VzJ1ZVl5WlZMTzB1MGdBMHZHWThWZ3BJc3dtSFprN3Z4eHdjUlBsdFdHOEFj?=
 =?utf-8?B?NUV4aDBwZnNQQm5uU09FZXppaWplSUNzdkVVZGpPdjVXTmVaR0dFdGZTY0t1?=
 =?utf-8?B?TjNmRzRXemwwMFRsdTFqRWRhS0diS1NKa2dyZXJWSzQyeUVWa05ZaVYyWGdW?=
 =?utf-8?B?ZG5wbmhka2xRSVQ4TGQ0VmJHUFl4bFdSZkt4Y2d1VGQ5TnBFOXErd09VcWtO?=
 =?utf-8?B?MEQzZ1RzTWxWSDdOY09CZ2ROT3hzUVRGS1VhT2RlbnFKbUxONWFmU0lqZnNO?=
 =?utf-8?B?aDAzRU5ncEw4VDdkNkJGK1hQZTloTklqbnlDMENBT25TWE5CR2NKbTBtMm95?=
 =?utf-8?B?ajlYQnNLYzBRUmtBM1ZaOTZYdlhqb20xclU3SmpsVk5qZmJhN2xuYmp0SmtJ?=
 =?utf-8?B?eXFacjkwbnV3ckVOa285SnQ3czJyVFMwYThyS0dlS0FmSGhMcHIzT0wzd3kr?=
 =?utf-8?B?TXF5QnZjQWRyL3RTTGx4OFkwSGpsbkZQOEdlMVo0dkZIZkx0em9QQTdLczNn?=
 =?utf-8?B?SEZlWWxXRzNYM0E3d2tkSzRidTUxQjBRclZmZG9NZDd0eVJ5Vy9vS1lpYXkz?=
 =?utf-8?B?Q2p4MTR2ajRIaHk1ditrQklJUWtKcDNQdENDMzdKL3BjdkNvOHlkUFh3UTRR?=
 =?utf-8?B?T1dhVFdFRTBWRXJYa3V5QmtOdzlQMkltM2tUME43VUVRVlMrYzdVNFg5QUJT?=
 =?utf-8?B?ZERvc2dHL2JZZ2R4WG5IYTl6cm1UREZwemtnbFk3eG01L2lHKzgwazU3RVNE?=
 =?utf-8?B?YkMzcGIzdHdwYk91NklHV0czTmF2VlZiV2Y0NmpSZnQzYWZvVnJKdXRKeTA2?=
 =?utf-8?B?cGQwYmpiRHFGZVhHdnJKa2YwVzhHZDR3UmNXVmswTW9lRm5LRzVFazFxL243?=
 =?utf-8?B?WE12aFkyQk9Sc3VseVFoY0xPZDBkTGNrV2NEd3VvWWw3UHFZMExud1c4QnBu?=
 =?utf-8?B?aWxNRTRseGtWaWYwZ2p1UFNYS1h4cEh3NWUvQVJLdFVJNXR6aytROThyUmZL?=
 =?utf-8?B?V1lYOTJ4T1J1VGpCNEpCMXRDME95Yk9PTUNMUE04UHczYTB6U3JPUnFVaTda?=
 =?utf-8?B?cloxRHNVLzlhdVJ1WXBkL3ZtTlJRSHltQjFBSEo4U3ZrUHlXYjY5OVlJTFR0?=
 =?utf-8?B?UXo3QlNNS3VtNEVVUGFpVGJyMTRxRWxCYnBlbXZ5dXlrZitMVGE4LzBra3dx?=
 =?utf-8?B?TG0xcUlleURSeDlIQTlEdW9EYmFpMzdKa1pPNVJjeEtMd0R0bnRENDRqcVN4?=
 =?utf-8?B?b0hSaUpwcEt2dkhqVGNMVmpHZUN4R1pwVzRTTG4xMnd6SE9SMUlDSVpwS2lP?=
 =?utf-8?B?QzFlUlVFeC9PSTUrNnBVck5IZTlHTzBzRGlwNU12dGhaTldqRDNMUHdtOHVo?=
 =?utf-8?B?TzRqdHhLRmtRdmc4dUl1RGxOdUtYWG9Ock01RGVnQ0pOdHZSMGs0V1pILzBk?=
 =?utf-8?B?QnY2SUpnSEJ3Q2FzU1gyeWw3ODBPU2RKUC9rRzdhcSs5S2ljdEtlMzNmeURP?=
 =?utf-8?B?QzVVdDJ1eVFNdERidHBnc0psYlVBNHkwc1V5aGw1V0tJYnpuM0RlcktwcFdi?=
 =?utf-8?B?L0pLVG11eXVWSzJOR0MzMnF6bDczVkR0SWdWZWlqTUY2Uk05czB2WTBVUlJr?=
 =?utf-8?B?T1U1SXhhdDRPTXIvWGJCRGxtZVlGdUJUaG16SXVTaEV6WFFEa0hBQ2hCVGpB?=
 =?utf-8?B?SFRjeDdPOGRlc251UEUwbnZYcFliTFJHYVZxTmYvUE9RRXd6Umg0TzhxK3Bi?=
 =?utf-8?B?K2I0TVViZXhmU0lxVXdDbkxOdjc0Y2FaUWRmclFpaUlabXUyK3ByYmF0MS9H?=
 =?utf-8?B?Y3RoQnZKKzJrVnU5NnNPQ0w0OU8zRFJFTUZBVEdYN2lGaVFXTDNFWHIxWmpU?=
 =?utf-8?B?MFkwblR4NkNuTG01My9KUmxzbWlkblFyYnZTaUtza2x4YUJmUExzVWFFWkhq?=
 =?utf-8?B?WTNOV0JCQ3lHVnRzN0NXa2xydTFqTkFqbVllaUp2VHJLK2RxeEt4L0xkMlF4?=
 =?utf-8?Q?GU2k=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWpybTNRd3Q3ZmhuOGIxajYwWFJIaWsrRFd4eGRmWWppS0hHQzFtVkpQVjZT?=
 =?utf-8?B?cjczWHhKSU4veWxMTDVIQjBYaVJXSWJXZ0hwUU1ESlcvVUJlRWdvTGdjaVNG?=
 =?utf-8?B?UjBEckJFMzlpNWEvNTB6OUlpZkl5UVdVMFBDU29FOWZxUjRaZ0hhbFk4dDRZ?=
 =?utf-8?B?QjliSUU3aG9naUtiNmlad2RjVDEweUJyU2t0bnFLNHVMQ0RTN3ZYa1IrZHdj?=
 =?utf-8?B?dGRQSWRZdjJac3VyNnRyRkVsaGhoVWxiMTlsMTlETHl6YUl3QVFBWXdodkVE?=
 =?utf-8?B?UklKMzZMR3JqUzljNDZZaEZ0R0szdDAxdUNhazR3dnRpT0F1VGVYejEyNFNr?=
 =?utf-8?B?SW41RU5SdFY5ckNFbERGdDlIbXI0VmxhZnUvcnZCWER6RlNSekNJdmhaS3Vz?=
 =?utf-8?B?UlJXVVV5YW56cGxIUUxET1J2eUxwbEl2R0Z0Wi9ZNlNuaWZLbnlVQUw0U1dF?=
 =?utf-8?B?VnA5RXFjSzdiN0VyVnI3WmtnVWF6cnVaVmxua0FaZ3NnUk95RU01R3hCRmV0?=
 =?utf-8?B?U1RIL2c3MjRMY28yWC9NUlZrdy9lZ3krMFBEd1NGZFFva1hpcEducmlqRmZX?=
 =?utf-8?B?a3NjQytwQWpEa1pTVHFSWXM3VWNwLytoM29sRFRCeGNXOFZGbTNLYVRscHNp?=
 =?utf-8?B?cWJnRDVUckhjU01BTkJDRDNzOU02ZXlmYWNiTEpyTGl0d1I3T2twU3JmQWcx?=
 =?utf-8?B?b256cEZOUEEzUHREMFlac2RYeFRLeWN2UkpRZUhtRm9UQ1RCalhZMU50QnFj?=
 =?utf-8?B?dlFtMVA4WXNGbVYwcHp1MEdJMnB2WG1zamdtRndRejh4cnZsOFFYaVpmMUg2?=
 =?utf-8?B?UTd3QmRTdExsdGd5aFdqVzBqdEN1V29kakU4ampSK1B6VUpQV1RuaTlZOWxG?=
 =?utf-8?B?blo5RkVTUXFsSWI1WDMzZjJHZHkzUm5rRy9LV0VRMjl1Q2lHYm5GL0Q3d3Zy?=
 =?utf-8?B?bGt5bG5JQk1COGlLWlNLdzludEtjUGZmOEx4UUZ4Vk0vYTVGYXlYcFRoSFZq?=
 =?utf-8?B?S0ZZQzlnaVhiYUFTVW9Cd0MyRVlFc3RCYkYrNExNWlJOYUkwUk5PVDFidVNK?=
 =?utf-8?B?WVp2REdmblBKNlRXM29ZRjE3WmU4cjhIa2puTnRsY0tFR3IwZHlxSUpMUGJx?=
 =?utf-8?B?YnEwKzNMd0JiTUlBUzFWSDNLam5PMk5DT1lSVFdLbkpFeWFYVXdURS9ieFpl?=
 =?utf-8?B?QW5EVXJQdjkzVXErdS9OZWQ2bGljeit6d2NMRGpzTkhld1dIR2pvcGpQaFU0?=
 =?utf-8?B?UUJPY2NyWFJKeGJTTlJxTTlKSndTSGw5TkJDSkFmT1BRMTRQWmpIMGJyaFk1?=
 =?utf-8?B?MjYySmpHelVYSXB1RDlydVVrNHU2UkFmcmc4QlVwNUpMOHRvWWM0c3BwYVg4?=
 =?utf-8?B?cnRsWkJYNm9icFRVd1draGRoZTJtd3MvMjhqUERENmorN050VEFhWGZCNUkv?=
 =?utf-8?B?RVc3eXpzTHpMZlRIRDE3ZENCZGVBNXplYzYwMWVrU1Z6VHg2TWJoQTAxRUYw?=
 =?utf-8?B?KzJVY2duNWY3RXFpVWtvb2p3WDVnajdlRDUyNXQ1WXBMZ3dTclB1THBiTnU0?=
 =?utf-8?B?SjFYcDRXemdVclU5NWJTcExEZHozYnN5dzd4aTVMQ2x3QmIwNU0ra1ByTVhv?=
 =?utf-8?B?dzRFTENLYjJlU3ZLcHN1dC9FUXVHTUlqempKeUIwSEpGaEliMm5tdStJZWJS?=
 =?utf-8?B?QmtOVDhvdXNYdnlZZnJraStzUFpaS0IvQmZXaUxoU1RTWVJpMlN2Rlcrc1h0?=
 =?utf-8?B?QkNZTFFKTzB0c2R3UUlxQmYzQmxva1pUMm9Pb3RuQ21Rb0JlZ2hGakpTQXlE?=
 =?utf-8?B?dmtEaC84NldmV1RvcmtXQXhrMlFBUnVudVpLd2h1dE56eWhBN3NnaXFCZTcw?=
 =?utf-8?B?eG1PWmx3eTArRDA2QTEwZUs2OUN4V08vdUlYa3R5c1hpZ080MS9xMGhwampR?=
 =?utf-8?B?TzQxaVNZVVdHQll6ak1RQzFaUGdkbWQ0ZXA5NkVROVVEdVlQVWZPN1hPd3hE?=
 =?utf-8?B?RStWMFllaXdlekhGandHUmZjQXRBOTRqUmFhbWhQdWJOWEF2a283WnZyeG1M?=
 =?utf-8?B?VUpWUUtuMTB6VWFEdEI1enV2VmxxaWNsdkc1dkNmam1rWWVnR0NVVEFBbmZG?=
 =?utf-8?B?VWp3MkJkVUp5NW9odXpQSEI5OTk5TmNEaGJYQ1pxQ1lKZExTNDFBT0Npb2hs?=
 =?utf-8?B?TXpScjVGTFA5SXZmMzdadU1yU2cybXNCdDVKc3EzMDl0YXN1TzI0ME9GOTBt?=
 =?utf-8?B?R1NtNDF1TklSODA2NXhBS092bkUvQTdMYm1wMXo3aUZnaUhYUTBjNWg4dSs5?=
 =?utf-8?B?YzRRZXRLaXFiZGdTTlNhT3craWhZQmxEMWhhQVU0M204UHlWQ3ltZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7a2fcd-eb79-45b3-4a5c-08de623e772a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 09:35:56.1139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5lGmRz026P0MP6aAuiCImy4nQaNajHiq8WxSPHRiG2yG+AmHCBffv+RvKK3UZfjNmYKA1ptNhuoC12xHxUwuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7147
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: kxpfdFp_PekbVXQbNkGymxvm5-2as6I2
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69807001 cx=c_pps
 a=wCl41NmqrnDcz9wBTMCcbg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=waJdq9ulpDdKJuc2fDAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4MiBTYWx0ZWRfXx3TWXXffYaYs
 k7wCorYBFQ+wf4xOv3r/xN4geT5mWYGMxeZXe5y+/VZUKE78XQw5bJktD2xZTxJETndpXIv7Chh
 D/SY8GqyThZzvcfLEMPtLcnLdmvejsJcqT1JhdMxl8VZcT7lz0C2T7MevYAYAvjxWVF0EuEsbD4
 d1B03yxdIXVwWaz6vJIFOWdzhaK/GWzenE+AN7XRrffQ4TFhyHjFOGAaMOJhbq41LKr5Jh7HiRo
 c4uQ2QGK9BuGhbg4PJFaIEKlDOS4o43HRyryzA6FeZv5iovu1wBjte0j+EGMjFrHVB91v9/oxPy
 P12INBedoF6gV+yL+OSCd800iFZsETMN13uRkoHliHAg6lpBwMgDoR316Et1O8qYY8PyAyQV7fU
 5gbMkj9HUYptZCBYw3eKbvRMHoEYwt7Yv2Xjl1Gk/3CnyVUrRZLjaKIfdGvEPixxs6YS85pe9Dr
 L3YOZJILEYVKqW7bodQ==
X-Proofpoint-ORIG-GUID: LWHYstmhLhWF88-1z2-jEWZGs20rNGmK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 09:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230348

Hi All,

When I was checking recent nerdctl issue about rm_work failure, I found 
that our gomod handling has some problem.

In short, source codes are not available after do_unpack. They are only 
put in place during do_compile.

I think that's why go-mod.bbclass has:
"""
addtask do_compile before do_populate_lic
"""

But this is quite a workaround. do_populate_lic is not the only one that 
need to have full source codes.

For example, meta/classes/archiver.bbclass needs sources codes. There 
must be other classes that assume sources are there after do_unpack and 
modified sources are there after do_patch.

Another big problem is patching. When source codes are only there at 
do_compile, this means we cannot patch it. But Yocto should have full 
control of the sources, we need to be able to patch any file we want.

In summary, from what I see, the current gomod mechanism does not meet 
Yocto's requirement of fully controlling the sources.

I'm bringing this problem up to have more discussion.

Regards,
Qi


