Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF16C5B543
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 06:22:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.80472.1749536555263509039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 23:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82563faf14=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A5oA8K030880
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 06:22:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2jngk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 06:22:34 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55A6MXgw015171;
	Tue, 10 Jun 2025 06:22:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2047.outbound.protection.outlook.com [40.107.95.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474an2jngj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 06:22:33 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKEHdZjjUeqUbApdu9fXevI0b9kqKAZ7TXhA7tvlZkgn3WZAWKYoufaPfRHrEVlKgd7c3QekCXDp6Zk7UzLcZmlkG9GfFyoCaBYOzdysF2sMPja4zhDEQH0Nnbj713h5t0h+cSn/kWfwCMwSy9zsg17rBadzJFZNQlzhu6l7hMY895VXjgRNDwKcqd9qc+gHSnwcP/317Zs2OKUPLfExdSOl0E/cV4MgOFlPp0vUESihF/2OumgS8cWKZEi5ZRwZcvFE+HqjBE5h0XbG+aAoa2zEJ3f3EhhOqH954MWNYWPbOtYTQJx/ov4hQdPjQxJYVEv99igAJq1NmS8RBzQ0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJZoyjXHiTFb02EdkmMliyvZxZODDqxDZiuLhVlLZq4=;
 b=NbT/zHs7CO/TKA+1hqXU05iZkrgydn9Tgz9jzr+W1OT3keJFx6qG0U7+ty6u28smsOUL8U8OwCiROxVgrTNyxZ4EXgkblBot0Rdn2ScWaoY+mArnEdfgfTLMmlSof6lOBffH+QNNHXSgXywH0EkTswEGhi6qbkJkzY8dserP9Yp23AXNTaPPPS2XGSwan8GYFRymY95pYdE98asC8OUc29FCqQJ1P6aa3XLb8EH3Jj9Tn8BZAB8kczKKtJtHTRwHY/v/sHc08R8gdTsyTV4h7FvYLQVSO9HCl0YX6hIfHsIgw9F6CBwEuNHBn6etdkf91Cnd+xq6xUUU9FOwjIctvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SJ0PR11MB5917.namprd11.prod.outlook.com (2603:10b6:a03:42b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Tue, 10 Jun
 2025 06:22:31 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%6]) with mapi id 15.20.8813.022; Tue, 10 Jun 2025
 06:22:31 +0000
Message-ID: <776339ba-a505-4f95-808c-69c46b21a2f7@windriver.com>
Date: Tue, 10 Jun 2025 11:52:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.85.1->1.86.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250606124816.365627-1-Yash.Shinde@windriver.com>
 <1846920EC8E84923.17668@lists.openembedded.org>
 <6e5e734bfa5e67cb2be0fabe624e488b87478d20.camel@linuxfoundation.org>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <6e5e734bfa5e67cb2be0fabe624e488b87478d20.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN3PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::7) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SJ0PR11MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: dc6bfd53-c3b7-4de8-7208-08dda7e72e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RkJ0RnFOSklZUE93TFRQM1VpQXZaS1B3dDZreERVN0V1NWg2WWs5RDE2SEJ6?=
 =?utf-8?B?R25sbmtQQitzcHNtZnRXV0xJYTh6L2RSMktWdW5ycFhYQXJiUWtZblh0RGVz?=
 =?utf-8?B?K0JMbElzM1luMW42bm9BOXRpcHJGd3JON1dEL0RBYWxHdUU4QUY4Zis4WXJG?=
 =?utf-8?B?bzAvT2syK003KzJCUStRRWlLVmxpdm9obTBVMnIwK3dhbklDaGw5MFBDamlP?=
 =?utf-8?B?RXNac1grcGs4b2ZhZysvS2ZSWFhhajQ2aXNrYzRyRVJ4ZkRCM0ZWQWs3OG9q?=
 =?utf-8?B?V3ZjU3RxOWM1c1hiVnd3cW5VSjFMdUlSOGJ3MEx0cHlad3l3SGs1M2RZcWd1?=
 =?utf-8?B?cmVkRWt0MzFiekQwRjJiYURQd0xuOURibmZXbUVZZUg0V2FwWjJETHhWcUtF?=
 =?utf-8?B?R3RtVnEvaHVuZTkwS1BZRVZObTduUXJXNjlWWjRmRGc3QzRBc3FaQmtGMjJw?=
 =?utf-8?B?MWFIT3Zjd2I2dzY0RnZiWk1vZjBCZ0tPVVNaTm9nUzBkNStKd1JBNUlCc3JP?=
 =?utf-8?B?MU9kT1d5blcrVzloZUdyMm5Xc0orL2V0Sm4zUlJEd3JtNER6QWNSa1dveS9a?=
 =?utf-8?B?NTUzMTlHSGFrK3dXbjdNTUxlN25kVVlqUklPc2p3UFBlZlhDaTJWYUZQbGF6?=
 =?utf-8?B?U1R5WnE4cEd3OVVVY0cwbTF3VmlleWh1UWFmN1NJNXJ5c2N6SmFhZlptZ3I5?=
 =?utf-8?B?M0h2alFScmFOb1pzVXJuczgyU2RMRjZSc0dBNVJ6b2V6a1V6d1F5dnRnSlhF?=
 =?utf-8?B?TjhGQjkveWdiaWhIV2QydzVScEdRNUF4Y3E5cGpGblVGbnpNRCtqYkpXKzJJ?=
 =?utf-8?B?S0twa01jL0QvbU9FOGtIajBMcDVNZ2xlamVvUm9lL0N5TVBDUTJHdzNQeDQz?=
 =?utf-8?B?d3A4azVQd0YyeFJzZjZkSzFxa0llclhLSUZKekZLU1ZSSDk4czlPRXdkbE9I?=
 =?utf-8?B?V0hRTVY2WmFSaTlyMEZIbkxqZ2pXbmlMS1dNYnVoZW4xWUQ2WTBOTE5WcHd4?=
 =?utf-8?B?YUdIcGN4QSszSysyN3VWdW9IMjUrWW5CdHJVSmFXK3BhTzVLUktXYlhIY2Fq?=
 =?utf-8?B?UXgzMlFTZnVBWTZOWDhubEFqVWgzOTRXSXpwUjhaYVNFYVN3WUZvT1l3aVFW?=
 =?utf-8?B?UTdSWUxlaWtUZWw2TmhLaEJvZDdva1puT0kxQUt0T1IrM25MSEJjMm1HQ2s2?=
 =?utf-8?B?bElXSzhxa2diTGdXcWkxWmsxWlllbXNkR3Z3alpFN2EzaUhSZUVNS2xvbGtE?=
 =?utf-8?B?a3BtM3JxYUFrRkpGMXJaMWRWVE5XWG9aT1FkTGNOWWpVMXMzODZUUDdQa2pO?=
 =?utf-8?B?M3lCWFVZUEVLTmVxd2k4QjhTV2dmbld4S1lTTzViUkl3WVU3L2VqV1FsYlNl?=
 =?utf-8?B?d3g2c2dacjhsUmFaSk4vREl2Zll1RElyRm9qeUd4WnNUME5EWXZPMFNNYlZU?=
 =?utf-8?B?NHFMVlRnNjZ3NUcvZHQxTEYzY1NRa1JVVkk2UnA4blhiNkZDdDZnajZuS2hQ?=
 =?utf-8?B?N2VCMXNDSkFrVWVVTG5QdGJvbGZ3aGpyMzk5K2xZVUpuZWNRNmFZRzB3N2JO?=
 =?utf-8?B?UjROVmJYUytLNFJlNTVaS1N4Y3h6QllIelhWb0ZxU0xybXBTT3hsempHR2tP?=
 =?utf-8?B?VXQ1ZEQrdnBTTFNXZVg3OEdZOTB4MDQvZmN1bnpMamVCN3FQM05PM1BJTVhS?=
 =?utf-8?B?ZUYrTnRMdkFMOHcrd1BHcThJQkh3MXhoTTI3NzNtRmlVSGc0MElhZGNVaFd1?=
 =?utf-8?B?SEFvNXhxNFdqYWtoUnhDVE1PTlNIcjhEYkQ2dnJNQTE3U2xRZWlkSjhGRVJP?=
 =?utf-8?Q?ADRaHPP0TETRe3INbScaT1VO3R7hi9zS+EOs8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2NzVVZuTmdOOGV1SmZrbnpWT1VJTENQZnRUSUl2S045MFFlV2RtNmJXVCtv?=
 =?utf-8?B?OEtGTVoyaXJudktaWmYxa3E5dWU2T1YyZmluUWdpWjUrTDhVclRHNExOT0kx?=
 =?utf-8?B?TW1lMGJwaXRxZGJ2R3pjV3hYVWpLYTNGUVhmYlFwVWdLRHpRQkV0aFdiSkZa?=
 =?utf-8?B?TG53bXp4R281bU9ydEtEbmdjSkxWVmNSaHByTGlVVFZNV3phMTdrQ0JmbjY4?=
 =?utf-8?B?eE9sa0MyK290dDYvQ0Z1WkZ4UVdKSFZIR0oxNXo4dGtid2ZyaWc4MGxiZk9V?=
 =?utf-8?B?eUgwQytMbHZwUENFUmVqcjZKYzVXSTVQNHNBVktMN0ZWemFrSEhGaU1XV280?=
 =?utf-8?B?RjhTZU9Ia2wxVVZJQWtCcFdDS0dqa1BWanFtTktZZ3RxMUZkcVhlRmE2cTEy?=
 =?utf-8?B?WjZvMEhIcWdEOFQ2T0piWGpIRTA4ampzUjloWTh6TEQzYmxWZkhjSDBHUTZZ?=
 =?utf-8?B?ckpFUEsrV1ZKR3hjc1dDbmppcnZydnJINHRZRFQwRG0zNHlGbGlqM0FKa3dW?=
 =?utf-8?B?Wm01dDY2L0V0RjVGY2xheDcwUmFVMVRkWndoekNDdGJZUVRhcnliNGNTNzdM?=
 =?utf-8?B?MW5VUk8vMzlJL1BkNlRGZWhTSWxjSG5DUldXTHJ5UTVsazNzYnBmOC9hMDNX?=
 =?utf-8?B?QnZ6QzhxWElLRVlsVklNalJ0VXAxMm8vU0M4ZldZMGJoUXcrd0J5RlJxL2Yy?=
 =?utf-8?B?ZXdDaGRVa1l6L0hiMVJaanhIWnlVcSsrc3BKUFhFTFJQZENaT25vbG1FSkFK?=
 =?utf-8?B?TVNibWFRZVRYMjZrNXVYZnZXaVErRllCNlJTeVNhTnhrNDJEdW54a2Jac3c3?=
 =?utf-8?B?SEVrVkVHWEdMbCtQNnVwMUFuODh1czFta0ZidlVwZHlDcm5tK1prd05LQTIx?=
 =?utf-8?B?dWIzYXBDcmJIQVZTbkQrM2o1NThIM3QwZlp2cVlOUEQwRklOV0pQbGZFTWtZ?=
 =?utf-8?B?YWRzVGg0MVVmNWRZQjNGWW5sYUZkQ0tYZjcxYU0vUWRVeHh5TWFSRjdTcnht?=
 =?utf-8?B?WEhNL0REY2lRMXAyenpaYk4yaWRlY2lUVHB0TnFrMDY2R2huSkVPYSsrdHFT?=
 =?utf-8?B?ZjZZc3pwZWN5YmlBUVBqQ0sxWm5oM3ZwT0hHU05ZRXVuZ2tVbVVOL0Q0UVRI?=
 =?utf-8?B?b1dLa0UwT1ZaNHI0MEpmdEVyRDVRRmNodzVCWHJtNWJoUVpTc290WExiVGI2?=
 =?utf-8?B?L2E4bTBxK2dzY0hqZ3UycTAxRmE2NWprWG1NWW53TExFZG0rSXN6U1dhTmdi?=
 =?utf-8?B?aU53ald4bnN6YWxOT0hTU3U2Tmp3b2RiUkVOYmJTc08vRjkvL2ZzbzJyY3g5?=
 =?utf-8?B?c1p6RFNPNnZHbE84QTlXOXhOamVLTisybmdTd0ozV1hOTjdJdGdEZzJ0ZmRM?=
 =?utf-8?B?enFWTmxlTTZNaERoR25Cb3BtNXZxVGV5WnRrMEsxSENjaFhnNlBKcmEwYklx?=
 =?utf-8?B?WHQ0QjdibERVVWJaZTVMb3oxM2NtdElWb2hnQXBqekM3aEQzOTQ2d2gyODNq?=
 =?utf-8?B?b3E5T3lnYTVBbWpFVnB2Z3BPRVdiYWFWQW1yOW9mRVBjaGUvTU5UL0habE1J?=
 =?utf-8?B?YTZrNVlKZXZtSlpwUjkzYVErN1VXTXFNNjFDQWJDZ3h0UGpJRFNGN1ZNQmdP?=
 =?utf-8?B?M3BycmNlYjRPOU5GUlpsNWxHelVQQkYybWZDR3ErNzhCdFJ5VFE1Y2JraW95?=
 =?utf-8?B?bEVJSUtBcWhVQzZGWk40YmhXeFllN0gvZUJ5Z0NyQ0ozeGwzbGtoU092YWdV?=
 =?utf-8?B?TjU3ek5rbG1qY0puVnpwU3Uwb3ljSGRZRjlzVENlLzYrZGowaXBmVXRkSDRx?=
 =?utf-8?B?SkRCL2MwUFN1MS8vWG5zc0RSSkhMdkdhaUNYYUR4eS9jRUMxT0M1WXMxUGVy?=
 =?utf-8?B?c3Jncmc5emIrSWhNWnZ4STNrOXUyTXVwOFRFZ2x3dzBxTERJeG40aGRTYmhn?=
 =?utf-8?B?RWpaWkt5Y0drZHhoUGNvZS9lSVBrdU1VL1lWaCtYN0ljck1XWWFPZVp1TjFU?=
 =?utf-8?B?KzA4a2p2R1U1R25JYmh2OExsbTZxT21jbEZnTE13Qm1VamVMUDFkaUVmdHRH?=
 =?utf-8?B?ejAxaHN1c1NCVnJHckNvcWRvNngvRzFZNmNXNWQvakptaU9LMmRsZStaR25O?=
 =?utf-8?B?SC8zT1U2VkRwYUp5em55MlM5MWJ1cCtTLzF6NEs5dnFiUDk3L3B4WWF3blFS?=
 =?utf-8?B?aWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc6bfd53-c3b7-4de8-7208-08dda7e72e43
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 06:22:31.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 58NzAhrNFaKE1uqkj/HSppfuhRAjJdI/+ilxE6p2kVgNLUPJORC4TBWtX9m9LmOjKbMIo/mpdRsqi5U8R30lAlUQ/fwr3g2VUUtuhqtD+J8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5917
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA0NyBTYWx0ZWRfX393upTPTntZG kXKQY3vyedepNHN/8nyIGz3W4SMzZmI62tnC9KglKSdk8gyT7N7+m000DeNtjD2KVjqvW7Z0N02 iUWM8wlPZJ9/IRMeIUkKb5pi4rsRQboasxoMFIMwueuagyqBv4HNxGxlRIIsapo+Fxzw0NBG2Dc
 hdit8VmgW3UXfaXWrcju3FHDKpQ7EmG9mD86p+nVyJmY4DAZYujnwgyD7y7bkNmvVpdIzH8z5Ui eEhjzrfYpOs+npSOs2KmtFiIbuVzTC9SBok2Ltliem0C6H9zzUvli130VAr2m6+47+mhUT/0EIY PG6XmdzQzY3I+mxgZbTNw5chjwecxw/XRqxUf+f9W/zcnNNoMU8LjtGEoAEE7UpvRYdBod4pFyz
 wqL4XVhEJS18ZlEQF2Ht0yZg1B0WVkZWwfE/Y+Py3yT8S18tNQrZRv/kEhMnT9zzb7lE6Ncn
X-Proofpoint-GUID: Vyx9tLkzFVNP-isASIvm5feesLPb9epk
X-Authority-Analysis: v=2.4 cv=fdSty1QF c=1 sm=1 tr=0 ts=6847cf2a cx=c_pps a=YMoqzFPP0rmi67lb+G4OcA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=JFp3QMheGYQvuXMpedgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: WkzMDy6cGXeg-9k-cVXu5LiuZdNCrSA-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=861
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506100047
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55A5oA8K030880
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 06:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218314


On 07-06-2025 03:12, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2025-06-06 at 22:41 +0100, Richard Purdie via
> lists.openembedded.org wrote:
>> On Fri, 2025-06-06 at 05:48 -0700, Yash Shinde via
>> lists.openembedded.org wrote:
>>> ---
>>>   meta/conf/distro/include/tcmode-default.inc   |=C2=A0 2 +-
>>>   meta/lib/oeqa/selftest/cases/rust.py          |=C2=A0 2 +-
>>>   .../rust/{cargo_1.85.1.bb =3D> cargo_1.86.0.bb} |=C2=A0 0
>>>   ...l-codes-on-riscv32gc-unknown-linux-g.patch | 32 -------
>>>   ...teps-tool.rs-switch-off-lto-for-rust.patch | 54 +++++++++---
>>>   .../Zdual-proc-macros-additional-check.patch  | 31 -------
>>>   .../rust/files/rust-oe-selftest.patch         | 85 +++++++++++----
>>> ----
>>>   ...ibstd-rs_1.85.1.bb =3D> libstd-rs_1.86.0.bb} |=C2=A0 2 +-
>>>   ....85.1.bb =3D> rust-cross-canadian_1.86.0.bb} |=C2=A0 0
>>>   ...ust-llvm_1.85.1.bb =3D> rust-llvm_1.86.0.bb} |=C2=A0 4 +-
>>>   meta/recipes-devtools/rust/rust-snapshot.inc  | 78 ++++++++-------
>>> --
>>>   meta/recipes-devtools/rust/rust-source.inc    |=C2=A0 3 +-
>>>   .../rust/{rust_1.85.1.bb =3D> rust_1.86.0.bb}=C2=A0=C2=A0 | 20 ++++=
-
>>>   13 files changed, 154 insertions(+), 159 deletions(-)
>>>   rename meta/recipes-devtools/rust/{cargo_1.85.1.bb =3D>
>>> cargo_1.86.0.bb} (100%)
>>>   delete mode 100644 meta/recipes-devtools/rust/files/Zdual-proc-
>>> macros-additional-check.patch
>>>   rename meta/recipes-devtools/rust/{libstd-rs_1.85.1.bb =3D> libstd-
>>> rs_1.86.0.bb} (95%)
>>>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.85.1.bb
>>> =3D> rust-cross-canadian_1.86.0.bb} (100%)
>>>   rename meta/recipes-devtools/rust/{rust-llvm_1.85.1.bb =3D> rust-
>>> llvm_1.86.0.bb} (96%)
>>>   rename meta/recipes-devtools/rust/{rust_1.85.1.bb =3D>
>>> rust_1.86.0.bb} (94%)
>> Thanks Yash, this is definitely moving in the right direction.
>> Unfortunately there was one issue that showed up during testing:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/178=
8
> and
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/1787

The error occurs during the llvm-tblgen bin installation for the builds=20
mentioned above.
I couldn't reproduce this error locally yet.

However, after removing the llvm-tblgen bin installation, the builds=20
work as expected including
rust-native and target, likely due to extended tools are disabled now.
The earlier "No such file or directory" error occurred when it wasn't=20
disabled.

I have sent a v2 that excludes the llvm-tblgen installation step:
https://lists.openembedded.org/g/openembedded-core/message/218313


Regards,
Yash.
>
> Cheers,
>
> Richard


