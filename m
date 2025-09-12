Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A98CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 20:43:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1106.1757709815269225530
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 13:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=SZ5cXahl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1350ed5193=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58CIQmPs1755368
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 13:43:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=ubptAKEycYrKwqQPkmyBVK
	IupK5I4YchcxHfeus/H8o=; b=SZ5cXahlt98587a3PKkUOA0M9oNq4MZVjXgudR
	w/vqOepIoRUTsRGbFJ/0N5QdjIkz0WiiVRa3BCcsqwdrI28VnbcMLpIdnFMrPFbS
	lmZPfi6DJkMI/WfU9ZDg3Zl1DZge49NrOdAX6wc5Fdf6R4WDHkFCXB/WwtUj7GWw
	WmOHVXWiPdqBX0wM2w6ST6OHpnMB2COP9boQcVSv27vF7meUjjPmi4z93Sjq9dyY
	21Ry8Cy+/SDJZwEYejUYHGKlufNDmFCHySzgj1RekCsT5O6JAUw1672ZYbHO1kzO
	RWVy7P8Q+vHQAc135H51mWlWIeRSdNgD6jfh9mYW+IkBGx2w==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494pc3gb72-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 13:43:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD+pbpUlZCBuWnshSjPVihAphj4F9d5nMyic/v5A7WWFdDTLlDl8DV6o11yQA7pleL3Ny7bdedHn7XvgjMqxkQoS0fhN2X1rxx59D9XBq19RUGNI6/KAnxR5YUqzyavzN/m1k/QMgXW6aaZSsoVa3+DQLxQhOTsq/XabeHKYOaYjr/UOoJj1MU5yX2A2+4gC3m44gBmKk0LJQQLANFXrkaR8TWR3vALZmOKmQZGCxf9d1uwNYZ62PE3It3oSGPMjOqZrgMCm2UgSBIQ5zSFFcHeT7S+538p4TeV/UfltJmKFG6Giso9+SlaPTtovLDcdq2YpjA2HQTWMIbDzwCd5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubptAKEycYrKwqQPkmyBVKIupK5I4YchcxHfeus/H8o=;
 b=DQCjmDKo0O0xoVLY2Xf5n4jNNdrQaK/OgpP/dA4PYeZgRIOvyXHQySAet2XzXjBXGOdKbVpSLPKztkMU0IukUGtwhV/uT/VsAblDIsLMGnS4YksOG7g9/34bWQwWUHOWWXmQ+QcAYVGY7TQCof6yO9Qh/pi+dCnrcXwrclUD/0bbSgrYuf9P86Qk7ddNYDTdpeAr6K3gJVmrNk4h1uzwHh4TGQUHLuh72HQ6rIi18EpFeW8zyHsng+ysMhEVnUry5ezF/E6zwKKV88w91L06saDaD3zgi2HvmudWMZCN3TJHhtQATn40QyRnRnlTRnzlYpTioUe707ImhrokMBSB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Fri, 12 Sep
 2025 20:43:31 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 20:43:31 +0000
Content-Type: multipart/alternative;
 boundary="------------bJkpwH1csewq1g4uP9gaq06k"
Message-ID: <18244f3d-9b87-4b6b-8758-e94d678c7220@windriver.com>
Date: Fri, 12 Sep 2025 16:43:26 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Looking for feedback: Add memory to buildstats-summary
To: rob.woolley@windriver.com, openembedded-core@lists.openembedded.org
References: <20250902153929.3365588-1-rob.woolley@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
Cc: Christopher Larson <kergoth@gmail.com>,
        Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20250902153929.3365588-1-rob.woolley@windriver.com>
X-ClientProxiedBy: FR4P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::20) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: c485d086-d55a-4b76-ecf2-08ddf23d0900
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bThVbVZON3dIRWsxQUlhZWdiQTN1VXFWZCtid041TW13ZmxlL1cyQjU5NDZo?=
 =?utf-8?B?d2RrQUdKTFVmNTRDS1pPdGozbXQ0QVc0SDdhNGV1YnFTZ2xmemFueXJ1eTFu?=
 =?utf-8?B?UC9aeEhMZit5cE9sQnN4WXkyQnhHTmlyczZwaDJHWmhpbkNkb2FLUnVaSDlI?=
 =?utf-8?B?bEszaDE2SUVYYk9xWjlEMXE5NkRNbEF1VXNkTUYvaC9iSmxxZU1YR1Npenhh?=
 =?utf-8?B?RXVOb0ZuY3hoaktZWVNwRGc5Q3d0MTI5VG5iVEFYT3NzNml0SytoUFgwOWZy?=
 =?utf-8?B?SzdFdHpYWU1EVEVJaUVVMFlBc01paTZlSVlqM2k2ZlhtU1lJSkl2dmtzekpJ?=
 =?utf-8?B?blF6RytCbnRUT2p2Tk9KbjZ2eDE2L0MxQUgxUXU1R1FJV1BIME1ETWtoWk52?=
 =?utf-8?B?YWg3dk4zbHRoT1doUFBjNDI0a2taa0t1bHJac1prUUFiZjZqWXRXeE9UTkRl?=
 =?utf-8?B?aHVsY2JHUDJoSmxpRGg0LzJuWk5qOGRzV2NDeWtJS3g0OG9OTHFrK1ZlaDQz?=
 =?utf-8?B?eitSZXdxT2NsSlF4K2s1YnRlOGFBR09PdFl4UUJVSXVYb3JjOWxKYmJsbFZv?=
 =?utf-8?B?VW1sUkx0dDRhR0VHNnMvT2VoT0g4V09TWTM3dVNpaGdhNXFBL2hDTmM4cEpJ?=
 =?utf-8?B?Y1FTbXFQaEFxNXFSQW8vaHIzUVVtVkdGSzBYdjI1T1ZybkRZQVkxYnhQWGhn?=
 =?utf-8?B?VWliSWZNMERTZ0JqRGFlMmc3R1VuTWFEb2ZzUjZBVDlPK21yTG5RTlE2cTRZ?=
 =?utf-8?B?UUlvS0s0ekxQQlV1SzR2c3dZNjJnQVN6Wjc5ckgxZXBpV21zYWhMZWVFc1M4?=
 =?utf-8?B?ZDU1eG80azV1QjFUQTZnRU9VdW85bERKL25MTE9vRng2NEVDVkNpUU42RDM1?=
 =?utf-8?B?ZVM0eTdRbUxjS0Q3S0xjYVg0am8rSENMa2tFaWdXM2E2Z1dWZkI1eHZlVzNX?=
 =?utf-8?B?TGxGVjNRMzR3VmxjNlVQSm9iY2RiRlRSajYyZml3YVJ3Z2JNcUsvR1E2Z3Nw?=
 =?utf-8?B?UHllL1ppamgzeXBOb1VwMC8yck9hL3laUzhsdnFRbEoyemplYit6UXRxMVB2?=
 =?utf-8?B?c293c1ZFSHVvZW5XVXJmNlEzWUtWdHA2ZVpTUm54YVdhUmRxbWU5dEpEYVlm?=
 =?utf-8?B?dXRReWthWDQ3MXZtaVpGYUdKU21qVi9OWk9xd2lhcU52M0F4L0lEbUdhRjQ4?=
 =?utf-8?B?TE5jUjN0RmdsRC9ZY05BQWtWalVUUytGTkRZK2Z1aEdmcUFMWHFPVU1HWmVV?=
 =?utf-8?B?aXBVMFpkbFhpRW5iY1pHVEdDTElwZHJESTNBQTJvSlo0UmFReko4MnlydkpO?=
 =?utf-8?B?U3ZlYWg4cVdrMDVySnFBUk9wK25mam92WG9yQnFkVHU5YlZtZStPbWl4dnNp?=
 =?utf-8?B?MFdjOVg3eXY4NHozMTJlanNzT0w3U1o4T1IyVWk2RTczbWRMUDR5LzU3c1hQ?=
 =?utf-8?B?RUNzVUlxWThCQVhybEJLNTdMTUU1STZTckY3NFp5cjBkTVVFOEZkSTJZc3l3?=
 =?utf-8?B?RGc1NENzWEkvVklEWGFEM3lnejJxZFREbzZtQUxrL0hrMytrTGExNmt1MGFu?=
 =?utf-8?B?TkJmZTRja2NaQlBJRVN6RXh0V0F0NGxaUmRyeDBsV1ZyNGZpWFFScXc2UUty?=
 =?utf-8?B?N3ZwRW1ZeGgrdXlReWhnbFBNQXNhZ2Q2V01YV0ZYRTUvTVZ3RjJMdkl2dEZp?=
 =?utf-8?B?cGsvaUdVMEtmU3cxV2h1dTJxd0hYNjErbmxTdWNycjdpakJma1FDVjRGRm1Y?=
 =?utf-8?B?UTFZWDNFT0VrRDFqeVZhbHdEdnEwQUxrZ1dQeFdGMncvRVFIajd4dDFqUWpm?=
 =?utf-8?B?VmFCZC9lK1BicFh3bkpXejBQTEgyN1grS3hxeFFMOFBGenlSejExTDRnUHdT?=
 =?utf-8?Q?gJn4dm68/hw4i?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y25lMVNNamNOYU4xS3UwSTFHMEQ4QVQ3WmxNZ3NaNzBjT1VZb3pldG9zbGNx?=
 =?utf-8?B?TFgyaHd4RFhGdjBMQ2F1V0hVU0h2eVpVTWV0NVpaamdmK2hZYTMzSkVjNGpy?=
 =?utf-8?B?RDA4STJwYkhpTXZLN1AzQkt4dmVqNFhTb3NyUjlCdVJGZUJ2U0lYNjV6eXBO?=
 =?utf-8?B?eHVpNEZaT0ljSGhYR01ab05nVFJobkl4dy9mM1FRM3VZdkZlaTk0Q3IrbVU4?=
 =?utf-8?B?aDY1eUNNTStvclliRTJobzdYNEhFNFJYNUdWL3dHWGZZNUZldU1mcXJNVkc2?=
 =?utf-8?B?T3NQY052TkZ3YzB5RThXWG13OWJjbVNDeHArK0tGd0JacTR6Z2czQm1YTER1?=
 =?utf-8?B?Sm5qUzA2MXBVd3hlZ0E2QmJ1em1QaHAvZk1yZ2RiVVIwQ1BBcElNT0Rhc1RF?=
 =?utf-8?B?SkhXbDUrNWVjZWJPVk1TWjdCazNmcHEwbVRDc0xiUDRTMVEyWHZrZTVDc3dN?=
 =?utf-8?B?T0tmL0l2dUtxaEVFMXpmQnRodHpTcWRBSERXczNKY0dUcWs5M240ZWVrU0Fl?=
 =?utf-8?B?NElOeFhWZTRxYjhuNGxSVHZTelY4YnI0ZFlIQ3FhOXYzaHFnTlZyTyt4aHF1?=
 =?utf-8?B?WG54UURVTkQwZ2luNUM2Tms3bEJlVTN4TWMvaEptTHNQWmJZYU1wQXI0Yzl4?=
 =?utf-8?B?Y2UrcG9wL1VsMXowa1NORXgyaUtWQlAwQ3ArTnMwek5MS0hHTTFNQkhTbTV5?=
 =?utf-8?B?R0gvVVh3SjJNUTExeHhSeEpKeThwTVk5K2hPZnF5ZDJUa3RabFE3STVWcHlY?=
 =?utf-8?B?ZG1MVGh6SEc0elhCV1puN3hRaytsVDJzbGxuZTRZY2hTdGJKZEovMGNDYmNZ?=
 =?utf-8?B?TGs0S0Z6NXRkVkNlUTA2MXJMb0oxSWlRMDNwaGNyN1VudkpVQkJZUEdoVDdq?=
 =?utf-8?B?RDZQbHZNSTllWlMweEd1SEhZL3cwcjVMRlNlMEpYWE9VeXNkNFV2amFxUlEw?=
 =?utf-8?B?UTVOb05Jai9OSVNBMWcrYzV4dG0zY2JLRS8wT0xBaGVJMGRRM284Q3FXdHZa?=
 =?utf-8?B?djBkR3RUd2NZdjRHNGR3QnR2UkhXTXVSM1NUVFdycWhrU3lxUWR6U1hwRE1n?=
 =?utf-8?B?OU04dzdQVEU1TXk0a1JLTS9kUmNZQVF1M1J0OE9XbHYwRFV6c1UzbHdBaE40?=
 =?utf-8?B?UkN5TDRkeVBrK2R3dTFqd1RHZ1QveTNpcStKNExUYkZoVjZkSmt3R3Jqb0tq?=
 =?utf-8?B?S1JTV2hjQ3YwS1ZwZUlvK2w4SlBMQUZmOGlqcnlma043akdMK3Frd2l5Q2xC?=
 =?utf-8?B?Q2FFZVJrMzgzUGtFN2syc2FnZHpnZWprT3h3aDk1TjNHSW1jVlJMR3FtUEhk?=
 =?utf-8?B?WlIwbDB0NUgxME5nQWY5Tis2OWlTV3hkcmVsbXkxOXJGeFJvTStiY010UTRm?=
 =?utf-8?B?NGh6TXNDeWIrdnpBaGU5MFRxMFpTWXJ4dFdRSE1aRE5rTFl6emg0SVdGdzhv?=
 =?utf-8?B?UnRhQnFXRm5FWW04dWx4WXE5ZUdDbDVNU2t0NGlYZGNBWk4razF3aW5NK09U?=
 =?utf-8?B?bkMwaHFsbmcxVXhESHp2NktJUXpRM1dSM1RpaXg4aWNlalkrajlPbGhYMU5I?=
 =?utf-8?B?c3BWcnB5eVJ1OWtWQm1RTlZYcXh4Rm00NHRIRC9YT0o5T2g3dC9tUUplYU1V?=
 =?utf-8?B?Rll2TGlpVWVZV0FCc0RjNTExeFp5WHRFbXFTYTJYZmZDbzQ2RE5Yamx2TXpW?=
 =?utf-8?B?YloranlnVUlpZTQ3OGlkWlR0R3FZZXZ3T2xTOVdScXF0Kzg3MTFpSktHN05I?=
 =?utf-8?B?OTFCQlhacHVtejdrTGxNVmFlR0NqTDRlV1ZGMGdFV3NIVjd1Q09DMUtXd0g0?=
 =?utf-8?B?NHRBOWJCYjRZNTQ0WnR3OVJFbHpxS2MzeE1hcUVqcHJLT0ZyOEhzcHRVSGM0?=
 =?utf-8?B?US9OcjBCQ0VQeGM1a2VZUktkS05RVjIrNVBueUZCcTlVT01RWjhUTjdZYzhM?=
 =?utf-8?B?em43RXQ3NjNvQW96cWVRQmxHQXVTNUFNUU1pTWhTTGc5eVdxU0ZRelNMMEpL?=
 =?utf-8?B?QThZM3l3RloyNk5lckZOSlZkRDNjc0Z0RUQ5SzQwZmM3UWNvWE0zU1BHM1JE?=
 =?utf-8?B?eGNXRUNqNzNUckZFZm5rbzc4NTNGVWI0UlY2Si9ETThwM2ZwS2pKTzFJWHph?=
 =?utf-8?B?R2xxSEJDMExySk1md0toOEpQR2pCSmhFVlg3bTVHQzhCTm15WEwrTmVoWlhi?=
 =?utf-8?B?Z2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c485d086-d55a-4b76-ecf2-08ddf23d0900
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 20:43:31.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rdLL2PRHNQ+ZmjRwESRaKwtw9drER5Con37Vt44j1zy9Ceushh7Ex17bv1LIt7lDiSs0QngrB3zjg4KzrG7UXc1ALZ6TSCEVYmWSppSlEpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=eqvfzppX c=1 sm=1 tr=0 ts=68c485f6 cx=c_pps
 a=YRACufkBk+Nn0Aes1d57Eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=jJrOw3FHAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=7ITx4KPVvMipSF_B_Q8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XQ5kL1R6wjlrhz-_aLkA:9 a=fC9RL2_ZiWd1z8vr:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _rf4XOLxcnHuvIqwUyQO4s5_oEACtnRw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDE4OCBTYWx0ZWRfX0jM2lZhvz2qt
 2ORfqMSlIBd5/izpGVJmcnqXR80mu3eJpKc6xOZizIUmIrYDq7DV4QSLxvc57el5yWmA5INJOca
 l1+GirkpaPtKMzPpQ99dCSh053xXWYnZLmBJEi93LtBCQWdNoIWTOAlH+SrGLiOKqc2yuj2/k2B
 umZoYOEIepJirvtGHHm8NCBGm9W0kf1spjAfy7sIjxEvcWz+xQNH++x9GIguwn6ZiRVzpa0PW69
 Y2Ap+rfKyi/h9cJrHuMl0Osyu30Qyl6tBkzhxSQ+SW40Y96nBUN4C/Oop6fWHAvFg6xhrjjKhy2
 TggLvwt/Xid2e/dwr/JbsqLawkJF+3azp4H8d6nzPW6D149SQUiqSVGNQ/sCqs=
X-Proofpoint-ORIG-GUID: duJL-okWKT1g3wr6DGSXCbq7AUC12-H5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_07,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 20:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223335

--------------bJkpwH1csewq1g4uP9gaq06k
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58CIQmPs1755368

On 2025-09-02 11:39 a.m., Rob Woolley via lists.openembedded.org wrote:
> I was observing processes being killed by the OOM killer when certain
> recipes and tasks were being executed.
>
> Many of the physics or mathematical libraries consume a lot of memory i=
n

Tish, That's French!

(
 =C2=A0 To me at least! ;-)
 =C2=A0 See: https://youtu.be/1-rUOrKviOM
)

> the do_compile phase. Running a build with buildstats enabled showed th=
at
> the maxrss for these tasks was very high. The highest maxrss value I ha=
ve
> observed is 7.3GB.
I think that after we get the jobserver enabled (this fall?), we might=20
have to
serialize some of the link of large applications to avoid having too=20
much memory pressure.
We might find that BB_PRESSURE_MEM is sufficient to avoid OOM but we'll s=
ee.

Can you tell if there were several large apps being linked at one time=20
when your
build was OOMing?
>
> I wanted to summarize the results, but noticed that buildstats-summary
> only accounts for the duration of the tasks. I wrote a quick enhancemen=
t
> to extend it to also print and filter based on maxrss.
>
> An example of its use and the modified output is shown below:
>
> ```
> buildstats-summary  tmp-glibc/buildstats/20250901144058/ --memlimit 200=
0000 --sort=3Dmemory
>
> start                          duration   maxrss     recipe:task
> 2025-09-01 09:27:54.740000     0:01:22    2027764    create3-republishe=
r-1.0.0:do_compile
> 2025-09-01 09:21:13.290000     0:01:16    2033980    ublox-gps-2.3.0:do=
_compile
> 2025-09-01 09:23:04.960000     0:01:04    2037628    pcl-ros-2.6.2:do_c=
ompile
> 2025-09-01 08:07:39.810000     0:21:03    2061548    clang-native:do_co=
mpile
> 2025-09-01 08:45:10.120000     0:07:03    2351164    lanelet2-core-1.2.=
1:do_compile
> 2025-09-01 08:56:17.390000     0:02:02    2414996    dartsim:do_compile
> 2025-09-01 09:15:27.110000     0:02:00    2445608    mavros-2.10.1:do_c=
ompile
> 2025-09-01 08:27:01.290000     0:03:16    2450224    rmf-traffic-3.3.3:=
do_compile
> 2025-09-01 09:26:44.610000     0:00:04    2468600    openvdb-vendor-2.5=
.5:do_package_qa
> 2025-09-01 09:15:26.830000     0:02:18    2535556    irobot-create-node=
s-3.0.4:do_compile
> 2025-09-01 09:26:48.090000     0:02:05    2542520    mavros-extras-2.10=
.1:do_compile
> 2025-09-01 09:27:21.880000     0:02:38    2552664    sbg-driver-3.2.0:d=
o_compile
> 2025-09-01 09:28:58.090000     0:01:12    2586168    fuse-viz-1.1.3:do_=
compile
> 2025-09-01 09:26:07.880000     0:00:26    2627588    openvdb-vendor-2.5=
.5:do_package
> 2025-09-01 08:59:03.790000     0:04:26    2636372    libflann:do_compil=
e
> 2025-09-01 09:07:55.820000     0:00:04    2657452    openvdb:do_package=
_qa
> 2025-09-01 08:25:42.940000     0:02:41    2674024    ceres-solver:do_co=
mpile
> 2025-09-01 08:27:56.430000     0:06:14    2804552    cargo-native:do_co=
mpile
> 2025-09-01 09:15:24.760000     0:03:05    2823900    robot-localization=
-3.8.2:do_compile
> 2025-09-01 07:58:15.970000     0:09:31    2990388    linux-raspberrypi:=
do_fetch
> 2025-09-01 09:28:31.750000     0:01:55    3033436    fuse-models-1.1.3:=
do_compile
> 2025-09-01 09:15:02.480000     0:04:02    3064352    gz-sim8:do_compile
> 2025-09-01 08:44:39.500000     0:09:58    3176792    fcl:do_compile
> 2025-09-01 08:46:12.870000     0:09:08    3213876    gtsam-4.2.0:do_com=
pile
> 2025-09-01 09:07:19.880000     0:00:30    3261900    openvdb:do_package
> 2025-09-01 09:22:39.530000     0:02:00    3455096    microstrain-inerti=
al-driver-4.7.0:do_compile
> 2025-09-01 08:36:26.350000     0:08:22    3495032    cargo:do_compile
> 2025-09-01 08:59:07.570000     0:00:55    3532888    gz-physics7:do_com=
pile
> 2025-09-01 08:44:16.130000     0:17:53    3716804    opencv:do_compile
> 2025-09-01 08:58:28.070000     0:02:46    3862464    lanelet2-python-1.=
2.1:do_compile
> 2025-09-01 09:11:32.360000     0:09:22    3985780    rmf-traffic-ros2-2=
.7.2:do_compile
> 2025-09-01 09:16:20.870000     0:03:37    4400996    ublox-dgnss-node-0=
.5.7:do_compile
> 2025-09-01 09:12:30.060000     0:05:34    4592184    ros-gz-bridge-1.0.=
16:do_compile
> 2025-09-01 09:11:05.580000     0:08:14    4599324    pcl:do_compile
> 2025-09-01 08:28:38.090000     0:04:39    6326400    sophus-1.22.9102:d=
o_compile
> 2025-09-01 08:46:44.050000     0:18:08    6964496    openvdb:do_compile
> 2025-09-01 09:24:36.750000     0:05:58    7093536    performance-test-2=
.3.0:do_compile
> 2025-09-01 09:14:37.610000     0:11:23    7352348    openvdb-vendor-2.5=
.5:do_compile
> ```
>
> I would appreciate any feedback folks have to revise the work:
>
> Notably:
>
> 1. Do any existing scripts depend on preserving the old output?
I don't think so but I've CCed Chris and Martin who google suggests may=20
be users of this tool.
> I added the start time and maxrss
>     as new columns as well as a header to describe what each column is.=
 Should any changes to the
>     output be disabled by default and only take effect if you pass in a=
 new option?
He who write the code, decides on the defaults. Add them!
>
> 2. There are additional variables in the buildstat files that are still=
 not exposed.  Should
>     we create a generic way to expose these values or wait for a use ca=
se to arise?

Which variables?

../Randy

>
>
> Signed-off-by: Rob Woolley<rob.woolley@windriver.com>
>
> diff --git a/scripts/buildstats-summary b/scripts/buildstats-summary
> index b10c671b29..41b34be042 100755
> --- a/scripts/buildstats-summary
> +++ b/scripts/buildstats-summary
> @@ -24,11 +24,13 @@ class Task:
>       task: str
>       start: datetime.datetime
>       duration: datetime.timedelta
> +    memory: int
>  =20
>  =20
>   class Sorting(enum.Enum):
>       start =3D 1
>       duration =3D 2
> +    memory =3D 3
>  =20
>       # argparse integration
>       def __str__(self) -> str:
> @@ -64,6 +66,7 @@ def dump_buildstats(args, bs: buildstats.BuildStats):
>                   task,
>                   datetime.datetime.fromtimestamp(stats["start_time"]),
>                   datetime.timedelta(seconds=3Dint(stats.walltime)),
> +                max(stats["rusage"]["ru_maxrss"], stats["child_rusage"=
]["ru_maxrss"])
>               )
>               tasks.append(t)
>  =20
> @@ -71,10 +74,12 @@ def dump_buildstats(args, bs: buildstats.BuildStats=
):
>  =20
>       minimum =3D datetime.timedelta(seconds=3Dargs.shortest)
>       highlight =3D datetime.timedelta(seconds=3Dargs.highlight)
> +    memlimit =3D args.memlimit
>  =20
> +    print("start                          duration   maxrss     recipe=
:task")
>       for t in tasks:
> -        if t.duration >=3D minimum:
> -            line =3D f"{t.duration}    {t.recipe}:{t.task}"
> +        if t.duration >=3D minimum and t.memory >=3D memlimit:
> +            line =3D f"{t.start}     {t.duration}    {t.memory}    {t.=
recipe}:{t.task}"
>               if args.highlight and t.duration >=3D highlight:
>                   print(f"\033[1m{line}\033[0m")
>               else:
> @@ -113,6 +118,14 @@ def main(argv=3DNone) -> int:
>           metavar=3D"SECS",
>           help=3D"Highlight tasks longer than SECS seconds (0 disabled)=
",
>       )
> +    parser.add_argument(
> +        "--memlimit",
> +        "-m",
> +        type=3Dint,
> +        default=3D0,
> +        metavar=3D"LIMIT",
> +        help=3D"Hide tasks with lower than LIMIT kilobytes (0 disabled=
)",
> +    )
>  =20
>       args =3D parser.parse_args(argv)
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222737):https://lists.openembedded.org/g/openembedd=
ed-core/message/222737
> Mute This Topic:https://lists.openembedded.org/mt/115028531/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------bJkpwH1csewq1g4uP9gaq06k
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-09-02 11:39 a.m., Rob Woolley
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250902153929.3365588-1-rob.woolley@windriver.com">
      <pre wrap="" class="moz-quote-pre">I was observing processes being killed by the OOM killer when certain
recipes and tasks were being executed. 

Many of the physics or mathematical libraries consume a lot of memory in</pre>
    </blockquote>
    <p>Tish, That's French!&nbsp;&nbsp;</p>
    <p>( <br>
      &nbsp; To me at least! ;-)&nbsp; <br>
      &nbsp; See: <a class="moz-txt-link-freetext" href="https://youtu.be/1-rUOrKviOM">https://youtu.be/1-rUOrKviOM</a> <br>
      )</p>
    <blockquote type="cite" cite="mid:20250902153929.3365588-1-rob.woolley@windriver.com">
      <pre wrap="" class="moz-quote-pre">
the do_compile phase. Running a build with buildstats enabled showed that
the maxrss for these tasks was very high. The highest maxrss value I have
observed is 7.3GB.</pre>
    </blockquote>
    I think that after we get the jobserver enabled (this fall?), we
    might have to <br>
    serialize some of the link of large applications to avoid having too
    much memory pressure.<br>
    We might find that BB_PRESSURE_MEM is sufficient to avoid OOM but
    we'll see.<br>
    <br>
    Can you tell if there were several large apps being linked at one
    time when your<br>
    build was OOMing?<br>
    <blockquote type="cite" cite="mid:20250902153929.3365588-1-rob.woolley@windriver.com">
      <pre wrap="" class="moz-quote-pre">

I wanted to summarize the results, but noticed that buildstats-summary
only accounts for the duration of the tasks. I wrote a quick enhancement
to extend it to also print and filter based on maxrss.

An example of its use and the modified output is shown below:

```
buildstats-summary  tmp-glibc/buildstats/20250901144058/ --memlimit 2000000 --sort=memory

start                          duration   maxrss     recipe:task
2025-09-01 09:27:54.740000     0:01:22    2027764    create3-republisher-1.0.0:do_compile
2025-09-01 09:21:13.290000     0:01:16    2033980    ublox-gps-2.3.0:do_compile
2025-09-01 09:23:04.960000     0:01:04    2037628    pcl-ros-2.6.2:do_compile
2025-09-01 08:07:39.810000     0:21:03    2061548    clang-native:do_compile
2025-09-01 08:45:10.120000     0:07:03    2351164    lanelet2-core-1.2.1:do_compile
2025-09-01 08:56:17.390000     0:02:02    2414996    dartsim:do_compile
2025-09-01 09:15:27.110000     0:02:00    2445608    mavros-2.10.1:do_compile
2025-09-01 08:27:01.290000     0:03:16    2450224    rmf-traffic-3.3.3:do_compile
2025-09-01 09:26:44.610000     0:00:04    2468600    openvdb-vendor-2.5.5:do_package_qa
2025-09-01 09:15:26.830000     0:02:18    2535556    irobot-create-nodes-3.0.4:do_compile
2025-09-01 09:26:48.090000     0:02:05    2542520    mavros-extras-2.10.1:do_compile
2025-09-01 09:27:21.880000     0:02:38    2552664    sbg-driver-3.2.0:do_compile
2025-09-01 09:28:58.090000     0:01:12    2586168    fuse-viz-1.1.3:do_compile
2025-09-01 09:26:07.880000     0:00:26    2627588    openvdb-vendor-2.5.5:do_package
2025-09-01 08:59:03.790000     0:04:26    2636372    libflann:do_compile
2025-09-01 09:07:55.820000     0:00:04    2657452    openvdb:do_package_qa
2025-09-01 08:25:42.940000     0:02:41    2674024    ceres-solver:do_compile
2025-09-01 08:27:56.430000     0:06:14    2804552    cargo-native:do_compile
2025-09-01 09:15:24.760000     0:03:05    2823900    robot-localization-3.8.2:do_compile
2025-09-01 07:58:15.970000     0:09:31    2990388    linux-raspberrypi:do_fetch
2025-09-01 09:28:31.750000     0:01:55    3033436    fuse-models-1.1.3:do_compile
2025-09-01 09:15:02.480000     0:04:02    3064352    gz-sim8:do_compile
2025-09-01 08:44:39.500000     0:09:58    3176792    fcl:do_compile
2025-09-01 08:46:12.870000     0:09:08    3213876    gtsam-4.2.0:do_compile
2025-09-01 09:07:19.880000     0:00:30    3261900    openvdb:do_package
2025-09-01 09:22:39.530000     0:02:00    3455096    microstrain-inertial-driver-4.7.0:do_compile
2025-09-01 08:36:26.350000     0:08:22    3495032    cargo:do_compile
2025-09-01 08:59:07.570000     0:00:55    3532888    gz-physics7:do_compile
2025-09-01 08:44:16.130000     0:17:53    3716804    opencv:do_compile
2025-09-01 08:58:28.070000     0:02:46    3862464    lanelet2-python-1.2.1:do_compile
2025-09-01 09:11:32.360000     0:09:22    3985780    rmf-traffic-ros2-2.7.2:do_compile
2025-09-01 09:16:20.870000     0:03:37    4400996    ublox-dgnss-node-0.5.7:do_compile
2025-09-01 09:12:30.060000     0:05:34    4592184    ros-gz-bridge-1.0.16:do_compile
2025-09-01 09:11:05.580000     0:08:14    4599324    pcl:do_compile
2025-09-01 08:28:38.090000     0:04:39    6326400    sophus-1.22.9102:do_compile
2025-09-01 08:46:44.050000     0:18:08    6964496    openvdb:do_compile
2025-09-01 09:24:36.750000     0:05:58    7093536    performance-test-2.3.0:do_compile
2025-09-01 09:14:37.610000     0:11:23    7352348    openvdb-vendor-2.5.5:do_compile
```

I would appreciate any feedback folks have to revise the work:

Notably:

1. Do any existing scripts depend on preserving the old output? </pre>
    </blockquote>
    I don't think so but I've CCed Chris and Martin who google suggests
    may be users of this tool.<br>
    <blockquote type="cite" cite="mid:20250902153929.3365588-1-rob.woolley@windriver.com">
      <pre wrap="" class="moz-quote-pre">I added the start time and maxrss
   as new columns as well as a header to describe what each column is. Should any changes to the
   output be disabled by default and only take effect if you pass in a new option?</pre>
    </blockquote>
    He who write the code, decides on the defaults. Add them!<br>
    <blockquote type="cite" cite="mid:20250902153929.3365588-1-rob.woolley@windriver.com">
      <pre wrap="" class="moz-quote-pre">

2. There are additional variables in the buildstat files that are still not exposed.  Should
   we create a generic way to expose these values or wait for a use case to arise?</pre>
    </blockquote>
    <p>Which variables?</p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20250902153929.3365588-1-rob.woolley@windriver.com">
      <pre wrap="" class="moz-quote-pre">


Signed-off-by: Rob Woolley <a class="moz-txt-link-rfc2396E" href="mailto:rob.woolley@windriver.com">&lt;rob.woolley@windriver.com&gt;</a>

diff --git a/scripts/buildstats-summary b/scripts/buildstats-summary
index b10c671b29..41b34be042 100755
--- a/scripts/buildstats-summary
+++ b/scripts/buildstats-summary
@@ -24,11 +24,13 @@ class Task:
     task: str
     start: datetime.datetime
     duration: datetime.timedelta
+    memory: int
 
 
 class Sorting(enum.Enum):
     start = 1
     duration = 2
+    memory = 3
 
     # argparse integration
     def __str__(self) -&gt; str:
@@ -64,6 +66,7 @@ def dump_buildstats(args, bs: buildstats.BuildStats):
                 task,
                 datetime.datetime.fromtimestamp(stats[&quot;start_time&quot;]),
                 datetime.timedelta(seconds=int(stats.walltime)),
+                max(stats[&quot;rusage&quot;][&quot;ru_maxrss&quot;], stats[&quot;child_rusage&quot;][&quot;ru_maxrss&quot;])
             )
             tasks.append(t)
 
@@ -71,10 +74,12 @@ def dump_buildstats(args, bs: buildstats.BuildStats):
 
     minimum = datetime.timedelta(seconds=args.shortest)
     highlight = datetime.timedelta(seconds=args.highlight)
+    memlimit = args.memlimit
 
+    print(&quot;start                          duration   maxrss     recipe:task&quot;)
     for t in tasks:
-        if t.duration &gt;= minimum:
-            line = f&quot;{t.duration}    {t.recipe}:{t.task}&quot;
+        if t.duration &gt;= minimum and t.memory &gt;= memlimit:
+            line = f&quot;{t.start}     {t.duration}    {t.memory}    {t.recipe}:{t.task}&quot;
             if args.highlight and t.duration &gt;= highlight:
                 print(f&quot;\033[1m{line}\033[0m&quot;)
             else:
@@ -113,6 +118,14 @@ def main(argv=None) -&gt; int:
         metavar=&quot;SECS&quot;,
         help=&quot;Highlight tasks longer than SECS seconds (0 disabled)&quot;,
     )
+    parser.add_argument(
+        &quot;--memlimit&quot;,
+        &quot;-m&quot;,
+        type=int,
+        default=0,
+        metavar=&quot;LIMIT&quot;,
+        help=&quot;Hide tasks with lower than LIMIT kilobytes (0 disabled)&quot;,
+    )
 
     args = parser.parse_args(argv)
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#222737): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/222737">https://lists.openembedded.org/g/openembedded-core/message/222737</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115028531/3616765">https://lists.openembedded.org/mt/115028531/3616765</a>
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

--------------bJkpwH1csewq1g4uP9gaq06k--

