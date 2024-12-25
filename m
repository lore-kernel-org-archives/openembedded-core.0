Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1B5E77188
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 02:41:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1754.1735094493503275518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Dec 2024 18:41:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2089cb89f3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP2Z2Q0028117
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 18:41:33 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2pb3f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 18:41:32 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BP2fWJU005453;
	Tue, 24 Dec 2024 18:41:32 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nx2pb3f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Dec 2024 18:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsBCKQp/UILm/6+lSaZbqWYQQ/CP3APJYgUvtoTIQTRzaMWm1WwnnCvqrFZFNpmpMRfaB15JBxIw1EZaIsSmt3HI1kSB3Fq+COipav21J5G7SmRcz1GO/wmAQNm4FRnxjdMLfKCypqzju1E+TlPZ+k3gBhbhBjvHMJiw8/SrAgjTcCzyQfmZduenjGaGqqMi6G0wmWepipzdpYSGb5LwaiT7Xwbik8g85SoO5hqvgwP5VZuaTuIc2NpMOUE5qf9Bxh6MS31Hzzx2BZM9Mi2AbbSArpn31BihijS5dqzr0EsTPxNcx4iY+ZICJqBB+ZelQqqauTBq/6zJMXGPJ0psTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYH9SaZBMaqC1/pCr3+49hS3HUjRQW62CgDdwftoEZE=;
 b=MBZ3qgkgbwRKEY2Gj7u1Xokwd7xUKlRvBK1JCQtvZj0iI/ZbKumB+aNythvhayY1Xi2pDdMb3Qj9MtxQpIuPNCZlpeI/csXQsd3BbO5FD67UpbkAAGVSV2IOjG4+ikp6Lc1+Wi6RZsb9AkYuw+WFJplP3u29qXusgR+clDt3A7h543SJxQ6/FXtORNuTxbRus9uL8jlRtmJNHhkR14735WtBAdEuQixilCQ+sqzNUkPZwgx1GeZ0g66tIe2TCSF3W24TNESdaoTD4fGDjXQLi5ucIQGNq87O7osSEF7rD8UF2t4m++brA7pSZrZ/x1KZ9Aeyt9+K9FboLN/NP6gF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Wed, 25 Dec
 2024 02:41:24 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%2]) with mapi id 15.20.8293.000; Wed, 25 Dec 2024
 02:41:24 +0000
Message-ID: <edfe793f-c45f-4cd8-881d-94004ac70a51@windriver.com>
Date: Wed, 25 Dec 2024 10:41:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] meta/lib/oe/sbom30.py: correct alias
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <D6DSYBCD4I4G.2O4ZDW15ZPJ1S@bootlin.com>
 <13203.1734439760027052834@lists.openembedded.org>
 <D6GNPTJSA478.375DKCFTK0OMW@bootlin.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <D6GNPTJSA478.375DKCFTK0OMW@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::14) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: 9728b1b4-cf5d-4bdc-ac94-08dd248d9fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUpOU0p4SEY4cFpaWlM1d25CY3phRkJQRVY0aVB4RTBHWFZMVHI1TWxXNGlJ?=
 =?utf-8?B?S2lhQ1psVWg5Tm0wTDVOaWpzK0YzNkcrY3FhSDJieVE0c2hhSU8rMEpzUEhy?=
 =?utf-8?B?MHVBWmF2bnVIbk95bkhBTUFhalF5SllKUURZcXNpbVRqdkk4aVhJVVphOFdP?=
 =?utf-8?B?U1JxbnFKYmt0M0o4S1luWE1mUTBGYndFeTF0N2dibE9HL1VzU0M1bXpZWXAv?=
 =?utf-8?B?TVdxMWp3Z1UxSUJLRFlUdStzeHFKbjJKK3U1TjRxbE1lZmpZNU1oRHhROUk0?=
 =?utf-8?B?bzFnNkRZbmRBYkhkVUprWS9mYXFSQk9TRmdsTTdvcWlZVHpBMHA2SmlCWmxG?=
 =?utf-8?B?eWFEcGNJMkpLb2lxWlJ2U29KMFk4VUdrQTJRejh0Z0pQcW4vcFJpT0pMaDhp?=
 =?utf-8?B?Vk5lNmd3WDYzd2FuZWNVNnpreURRYXRtOW5oTGhSZW0wM0VicjJ6d1ZaYm9m?=
 =?utf-8?B?STgrRHVtbExvakN3RC82WW5kN2JmVnlMUmNkTVEyVi9XSm8xN2xmS1hmVXJx?=
 =?utf-8?B?eThWVTFjNVcxTy9pcVowOFR0Z3VZM0Q1L2pHaVJhVEg1MldKRnoyZlRFSHpM?=
 =?utf-8?B?QUtxSG5PSmRhejhpREhUVnN6YW9BTThFN0ZEbGdhUGgzUDE1N1NwbUJ6UGRq?=
 =?utf-8?B?WW4xNmV6ZVcyZ1BQb2RzbENJTGFqYStrbXRoU28xc0Q2RElvNHlVRFVjdFN6?=
 =?utf-8?B?YXBHbGZGYkhXaWo3VGtIcmFEMTdTcldJSHJWODlxL2xKOXZ1enNGWFFPMDFO?=
 =?utf-8?B?bUx2Ynd0ckNEL2c1dUNLV0pkZS9KcW9NTlRLRFAybTNpYk1Ma0xxWFRWaEZ4?=
 =?utf-8?B?d3BDMjlaWmNrUWdwWXBmZTU4Ly9SWWwzWXk2a2x4aEM4YzZENEorUExzSFNy?=
 =?utf-8?B?bUhoS1ZFdnVzM2FSWG1uRVdveFF5eGZ3ZTRwdzllcWdUKytURG1QQXpZM3Nq?=
 =?utf-8?B?OFQ1WDMxQllXOVdDT3AzRk9uOXJHUGdqRFMxSFk3dm5vQW1aVHhYQ3gwemxP?=
 =?utf-8?B?d3d4QktZWXlZTkVaU2JpbmYxTEYyUXgxYytOTDdXZEJUWHJvYWtwV3lGektU?=
 =?utf-8?B?a0JYN05YWGkyL2VKaW10MkpNSWtwN1F6cDY2akJWVldaUmpqSWNXelhNTFBy?=
 =?utf-8?B?MzUxTlhlQURNQmFaSUtEMFdueVJKb3RuOFF6ZEpldWtkaFFFTldhcC9FZWNH?=
 =?utf-8?B?azZYby9aQ0k4NXdUZnI1eTl2c3YveUFkbm1nK2R1Tm5CUVhmbDVDNTRQWnRi?=
 =?utf-8?B?ZHlkanB2YzhKdmw5bHlVUGs1NWNpMXFua3d1NVlyZnNuaGRNRW0vMHZMdTMr?=
 =?utf-8?B?TzRXL0Zac2svY2hwMzNSK2M0UGRXSmw5Q1BTbW55ejVOcjNORUMrTTA3cDd2?=
 =?utf-8?B?QTJ2Ym1YZHBRcVkzbisraUtkOEJYcHppUC9veksxd0h5OUo1YmtyTnhSUXZH?=
 =?utf-8?B?NUluQUZJMkhSS0FhclNRL3pCdzVZMXpNdjNBUlg0Rko4alNhZE4ybnhiOTQz?=
 =?utf-8?B?cGdZMEpVOHpTZXpaNU84ZUxOVEYyblcxS0h2SjN3cjlQK1RUSDI4aVlOOE5l?=
 =?utf-8?B?UmpBdk4wVFJBZzgzTFR0QzJUNWJMbEg5ZFpaVmwzRmN5c1ZRK0hSdnlOUHdW?=
 =?utf-8?B?dXBBS0o0aXRJQ2tmNUcxYnZKYWFxZXdhQzNRdUlMNnRObGVpUG9aQkhPRkJt?=
 =?utf-8?B?RjJhYlVOK3dWTDF3c0hiSU5zN3Rsait0K3RrSE42UWw1SzhQc1hqWTA4TFlm?=
 =?utf-8?Q?jdYy+fFTu+JTw5Vwm1eOi4dnD5PmKBYJLEHb7Rh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VDY0WlNZcHNlcE5SUFM3UEI5NEo3TlJRVEJCT2JEK3lSWVluY2V3Y1RRUkdC?=
 =?utf-8?B?Ym03QnFHV3BhOWdPNjU5Y3lUWjN5VmxjVklMdjRVSTUwa2tYNnU4Y0NiZm1C?=
 =?utf-8?B?NXlISi9XeGFsRDVma2VQZ0l1RTUrSEJnUWpvMUVqS2xuZG9DMkJHanJTa0Fp?=
 =?utf-8?B?WG9XcXIrM3hSWXF3Uk5mOG1KVVdnZXZDc0djQUp6QWsycE84YlRqSVVHSnBZ?=
 =?utf-8?B?bS91eDFWUHdZRmVxMndmcElwSThESHlVN2Y5czlMRVZJWWk2cThnbTNlL0pI?=
 =?utf-8?B?aWdJblhnYlV3VmlNTC9PY2JWMEJDbjdsQ09kSWh1aEdYa3JDNmI1Wk55WnB5?=
 =?utf-8?B?TjlPR2trVjRTc2NpdE9CM09sZE10eXp2Rm5xdzh5YktoQ0h1VGJkOENJUkxZ?=
 =?utf-8?B?bEY2SXFGTCtybGlldjVZY1JqVWMwR2YyeVZHdFZwWGpsT3lPY3lFa2hPT2Jt?=
 =?utf-8?B?NkNFWFVNMlB2bzQwSGIzZS9mUVVrR0lyaWE3YUlHQUIyeGJwejRQejJqSHM1?=
 =?utf-8?B?TytYWHFLSjNtOVdERWlhYXgwV1d2cGRsU29zRlN6cXVuZVRtKzRIY3VpQ1lj?=
 =?utf-8?B?WEo4MEFhdXpTNC85TTlaSmhOOGVaSjRzTTVvM3AwVU5KWHByNXFva0ZCbXgx?=
 =?utf-8?B?L1A5ZXZBS2RlS0FnVWd4OGlzcTd5QkY3enlsV1RkUVkwZ093TkRhQ2x6RkFx?=
 =?utf-8?B?blZ0TzJwTDlNbEVoVVZ4Vlh4SW02aWVsVEZnUEVtV0FBOElwTXNrSUhTZXpP?=
 =?utf-8?B?Tnl0cjRWTU1VMnE3NTRYcURIaXN4dzM2clBGMUFGTW84ckUxVTNsbUZ4bE9u?=
 =?utf-8?B?dklVbTR4MmNZK1NOcEFiR05hdVMvcU1YcTY2bWkzSkFBVFBHdVZ1alo5dkpV?=
 =?utf-8?B?K2M4YUpvRlM4K2todTZzU0JpRW9IVy9pOHhtZGhOcWFRSi9iZXpHSDYrWDJV?=
 =?utf-8?B?bHJGY0w0NWsrWU40OUsrZzVyTklIdzdpWkdaUXFHTDRIaFQ5OXh4Q2pERHNW?=
 =?utf-8?B?RlhoOUtJcFZoMXJOQWIrSTNodWxLdE1vV1NDR0dtY1NNN0VxRHBNbDlJOTJ1?=
 =?utf-8?B?emx1S0dDTUpQZXFzRGxsb3NadXRjK20rU2t0d2FwZW5SRWdzcWVvSHY0YjRs?=
 =?utf-8?B?aitBZXVLZ05UZVVPTlRIdGRKNjAyVnRTRXBCdXRCVEFNWEtGQ3RCbGFobUZ0?=
 =?utf-8?B?K3p4b1BNTnNScEIyTEJWOGxqbHdGTEtGajJocUZGT3JWTTIzQU1PUzkrK2M0?=
 =?utf-8?B?SThCYVBNREFvRjhxUVhocGJsdmNCUiszZ1V1Q2oyM2JHQVVRaUF6UFVaOHpT?=
 =?utf-8?B?YU5VbDFiY1I2bDRCVU0vbHdoYk1yS1VaeXowVmpEYm1IRnVtQjJmQWFlQ0oz?=
 =?utf-8?B?UWtQSkpSemZxYU5YVjRMQVU1NmZCdG9yeXBPRlhMV2JtQUtIbituNk16MUhN?=
 =?utf-8?B?c2tnYldrMm1Sdml6WjNFVThKZnlTNVlUNW9vWTc2OXNLcUJkdWJBUjdNL2Rz?=
 =?utf-8?B?akhCNnVsNkcwK0pmV1RFWkptZDcvaWV1ZGtkNVd3RmErWEdBRytUSE1wYnJE?=
 =?utf-8?B?N244OTd2TkZCZ1ZQVVZsSVFMNjNXZ1o5YW8yNmlKUnNVSHJQWjdUbW5PcGVZ?=
 =?utf-8?B?c1QreVIwbEtQV0hOelZQRFVnQVN0UEZYYXdTR2NFSzNHQmIrKzRKUEkvRmZp?=
 =?utf-8?B?OUFQQUxTZDBKQVJiYjVRU25naFhXWW50QnJsOHp5anF2UkFqOGc4WUEzbVdU?=
 =?utf-8?B?Z2g5aFZuOVVkQ3puTnE5NDB2dTJzUit1ZDJtMm43Mlp0d0hFdG1lSUVudWFJ?=
 =?utf-8?B?YUtxc1dWTHplRDNzNnFGM3NnTnVPK2FBOGlLZUZBWHQxZkVuallRZXE3emRV?=
 =?utf-8?B?Y0hMbFhZajMyZzFPbFNnZm9peEFMcUh1bU96L2lTWlQvSmgvamRPS1Nweitk?=
 =?utf-8?B?NmsyaTJJTE5yU1U1aDZkQXlPbGdTeXI1TnQ3WlkzWUNZSEFySkFXU0xJMldh?=
 =?utf-8?B?UFRiOUVtYml1UmRKRlRxa1o1TmNuV0xqa00vRmo2ZVdTb0VzUjA4QTNxWFBC?=
 =?utf-8?B?RzJXaTg0N1RPeXB4ZHFmYWJtdWEyckU5RTQwWXFVb2cybzh2S2xxeHZ0L1FI?=
 =?utf-8?B?TVFZQnpCQlhJTlpLL1M1V0ZzaklodUpHWEgyOU04cWFGblJZNlphMXE0OXRq?=
 =?utf-8?B?SkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9728b1b4-cf5d-4bdc-ac94-08dd248d9fa3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2024 02:41:24.6118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mdskop6CcUf+Uq4EQfxbsFP0PyQlg/YmpHPgCIdt6bAlaU7Epm+EBiKXWsmTwOqyzCjom4WCIn6LDHukWAqUHx5hm4wzaE3v/SUqhZUbi38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-Proofpoint-ORIG-GUID: SHs9mseRk-mkIMX4lcggFZeLO1HAujRt
X-Authority-Analysis: v=2.4 cv=LtNoymdc c=1 sm=1 tr=0 ts=676b70dc cx=c_pps a=ruI+LRy+bJmAUyIDade2ZQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=W7RivAhHcAIZ1bZwRIAA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: SK3SLFE0n-hfPGACA61D3VXDhGRloTEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_09,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412250020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 02:41:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209068

On 12/21/24 00:09, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Hongxu,
>
> I'm back on this issue. So yesterday I tried again to pick these
> patches, and got warnings again:
>
> https://valkyrie.yoctoproject.org/#/builders/29/builds/682
>
> If I relaunch the builds, sometimes they will success, sometimes I still
> get the warnings. Something seems to be intermittent here.
>
> I tried to reproduce locally, and again, I get the warnings in some
> intermittent way.
>
> My setup was:
> - Clean build directory, empty sstate cache.
> - The local.conf attached. This is mainly the configuration used for
>    https://valkyrie.yoctoproject.org/#/builders/8/builds/698, with some
>    minor changes (like disabling the shared sstate configuration).
> - Using meta, meta-poky and meta-yocto-bsp at this revision:
>    https://git.yoctoproject.org/poky-ci-archive/tag/?h=a-full-685
> - Used: bitbake core-image-sato core-image-sato-sdk core-image-minimal core-image-minimal-dev core-image-full-cmdline core-image-sato:do_populate_sdk
>
> Now here is how it went:
> - On my very first build, I got some SPDX warnings.
> - On my next build they were all gone.
> - I tried to tweak a bit my config, cleaned my cache again and still got
>    no warnings.
> - Then after some various modifications, I switched back again to my
>    very first configuration, and got again some SPDX warnings.
>
> So I'm sorry, I cannot give you some exact instructions to reproduce
> this issue, but still we have some intermittent warnings :(
Hi Mathieu,

Thanks for the information you provided, it helps me to reproduce two issues

1. While hosts with different archs (such as x86-64, aarch64) sharing
same sstate cache, build image from existed sstate cache reported
SPDX ID missing warnings. Here is steps:

On x86-64 host, build image core-image-minimal for qemuarm64
$ echo 'MACHINE = "qemuarm64"' >> conf/local.conf
$ bitbake core-image-sato

On aarch64 host, sharing above sstate cache and build image
core-image-minimal for qemuarm64
$ echo 'MACHINE = "qemuarm64"' >> conf/local.conf
$ bitbake core-image-sato

2. Sharing same sstate cache for different machines

$ echo 'MACHINE = "qemux86-64"' >> conf/local.conf
$ bitbake core-image-minimal

$ echo 'MACHINE = "qemuarm64"' >> conf/local.conf
$ bitbake core-image-minimal

The issue was caused by the following two patches,

[OE-core] [PATCH 2/4] meta/lib/oe/spdx30_tasks.py: fix hash link 
conflict while multiconfig enabled
[OE-core] [PATCH V2 3/4] gcc-cross.inc: add var-SSTATE_ARCHS_TUNEPKG to 
vardeps of do_create_spdx

I will resend review and drop them

//Hongxu



> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>


