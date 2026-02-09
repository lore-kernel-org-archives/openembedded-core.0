Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABBEEF06FF
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 02:12:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38971.1770603117967337387
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 18:11:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jp9xWpIB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6500e05fdb=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6191lL7N736155
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Feb 2026 02:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aVL7yNINTTws8c6LZUm/BK7BOc8T9jJU/Kn/GvfWiXQ=; b=
	jp9xWpIB/c89QWEemLvYpDSJxMubdHH8GkjEznyOG5si22LaMHaCQ4IgdEX5EDIx
	aazjvd0O5bby2ZN1B5/3k7TmTPz29E3HvKXrXoaDFax6sCU1Mu+hhpwOHMHrwuSU
	rVfT7tTKR8pjx9bOKkH+MqnHxpn1iUsTVgGQvp47cnGnN3tCvOIL7DLbrNWPo7KR
	JRxgHYP2KY2YX7Ymyic0OgCRWiWQRpEVx5YphHZcM7N0GS2UaQXAbJrDiSWDLJMM
	sR37VY5fL/xdVhVKJE+SWc+QQnlkkj33mwlHWbvd4X0uU3oDjT9kTZ5E1EBpVyK1
	u52MlSqUI6mrXrALkKYJlA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010048.outbound.protection.outlook.com [40.93.198.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc59bw7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 02:11:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BojzNQUIBCWi9RIBXaugMPnWNqxvH5bRRARmKzgcjcR80FHp6rm1EJsJOzm4JCO2oXaHLNz2hE9YWS8WVNhQlQvP4fY5yEsaehbQpIHPGLXC4elwrUDtndMYTrQ9AuK3Rp55yD3j19/rT61gb3gK8iaYgHUu0szpLNBqwPwEuNrp1/TiAg7mwE5pNOZGuUgDVQsH8U5nTuZsIKwiwcuTJ/Z5iedd9Xns3ledDIwFdYNNsSh4eePjcKP138tP6N9PWlRicOk2viA3BcOBAO3OQ5v8crWdZy6gXIF5kVa5rEuSN6GmVpLfhODUseuL7V92vhbMPlXMYd1Yf8vHv64MJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVL7yNINTTws8c6LZUm/BK7BOc8T9jJU/Kn/GvfWiXQ=;
 b=kBFhlP2zrkRPmJDKCtN6/Sib3LHtnZjeFTj/lytQChZcQisPPGS3ZGZJ7crNG7AOIbEb79kh0F7chdGHu8z78p/oepkBmy6C3DbMfE5WHjsqH4yhaLs4DN6+I/P6YPfxfXXtEj64K+2o0RUyX16IEmGsb80tYG/SB05zuYtjpnVEQMkKg+h47RsCeTnrI1gT6XJqsPCAJiCP5rzSoyqGCUAg/k8GIN5Jl091K8KHl9yOMw26txUetuWVbdGspTx3XDhCkTI4ln1+xmoUO3TfjWlMMjk1AibpsL039RCnUtuSB9tEgFqQ9OHdwEgRtVSG3d1ii1KpkW/Ob+4K6gR3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DM4PR11MB7758.namprd11.prod.outlook.com (2603:10b6:8:101::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 02:11:53 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 02:11:53 +0000
Message-ID: <57514211-c8a8-4fa8-a9b2-5693930700d0@windriver.com>
Date: Mon, 9 Feb 2026 10:11:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] vte: fix build failed for ppc64
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
References: <20251224031644.535650-1-hongxu.jia@windriver.com>
 <A1C75F2E-EB7E-431D-B4D0-9570DC3A4B19@arm.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <A1C75F2E-EB7E-431D-B4D0-9570DC3A4B19@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP286CA0283.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::11) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DM4PR11MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 54416852-10a1-4274-9a92-08de67809778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M05JanZpTWxCQlBycVpKZlpHQnA2d0twRFhORm5ucXJmc1RQa21ISFZxb1RL?=
 =?utf-8?B?Mkk5ZVhJU0c5cHJyMjJqaXBXRmk3T1F2ZWxEZjdVT2dSajdOTkUwVUVxb3Zj?=
 =?utf-8?B?RGU2RW9DdCtoMm5vV3BhOStPdE1CZGJIU1BaYVYyZ0JRNUo2RVRRaXZnY1JM?=
 =?utf-8?B?Nm1qT0hYOXViRGduYlo2NnhGNXc1R0NDOGloT3FpVWl1aXU0QzJ0dWFDYUw3?=
 =?utf-8?B?eEkySWNscUtINmdIamdhSkJoMStWQ1lhYXpMVHJ4cWl3NTR1cE93SFRuZkJM?=
 =?utf-8?B?UjJsOS9xMk1qNlFVOVNCSStrRFR0UG1Vb3hzVFRWdlNEMGJHMU5vSmxkR1U2?=
 =?utf-8?B?d0tWMUMwaHRORnNWZ1dMa1NIa2ZWRTluaDB0ZTUwYmo1RzlaWUxGeEhab1Fj?=
 =?utf-8?B?V3VReEdnYmQ0aitEV3l3Nk5STUtIV09WaHpMcDMrTG4zZXQ2NkVTSzJXbUdw?=
 =?utf-8?B?QURNSE1qbGtsS3BhK3BRcDBiYkxXY2xMWjVWNzc1NTRjTDgvbzVuSDhWRncx?=
 =?utf-8?B?TE9lcElQQU9udjFsRzVDVkRuRXFWbWJRTFlvRE9uWmlqN3NKQnVYRHFuQVZZ?=
 =?utf-8?B?UHErVXpwc2gzVnhnVkZiSnE1TE9pbSt0L0U2czJuRkNQdE5RbFE1Nk1KZlkx?=
 =?utf-8?B?OWxpVmxob3RBR09ONWEyaTlZNmlaSGtYN2dCU2hUQmwzNC9yTjZBRVRDWjVQ?=
 =?utf-8?B?M2F6czE2eHU3VXBraVN3Wk1IYXNablREOHgxU0tBUThBbEwvckpKZmVQcXZ5?=
 =?utf-8?B?bi9HSm1uRCtFT3NybC85YlU2d1R3ZXFBN3BHQURLMmZXbFNrYTd6WWx0YUpC?=
 =?utf-8?B?TGlPZHNzOExuVkg5U3A5RVlqZHVVenk1SEk0LzhpMFBEK1N4NkNrMmhQWmVO?=
 =?utf-8?B?TUVrb1JaRWNiVGdFclZ6cksvZ2RJWDBqSGZLU2wzS3R2RWQrYVVjOU45aWRL?=
 =?utf-8?B?azRuUGZRZjNSai9vZlYvaFlnM0QwQ2xNUlhQN01nRzFGbVNuUytkSCtpU0I0?=
 =?utf-8?B?bTJZcTZoeWlCL1BvYTJZVVBESDZYSTYzWVp3TFhqcnZjQll2eUhpeDlqRXJT?=
 =?utf-8?B?QVhiZmtlTXk1cXJNYkk2cExEM2xZMURiOTB4REhCRWpINDZrYzNBZ1NSRGJr?=
 =?utf-8?B?U3ZmUmVOdEM0emUxeVdITHhOcW9aQklnYnAzYkw4STdNOGIvSTZpY1FQczFl?=
 =?utf-8?B?a0ljQVhMS3lJRXcwL3pEcmdncVQ4dStLdWRld0JFTXg0SitEcFh5UWVhcVM2?=
 =?utf-8?B?RDZPWWVkOWV1dVRWNTZ4WUdOUm9SbFloWGdQVHpoakl1eEtrVmdYbWxacWZQ?=
 =?utf-8?B?WEtrbTNZdmJiNEFVSGdGalBBMUJ5alVHVlRWMXZUWG9ybjdIZjg2QUg0L1kv?=
 =?utf-8?B?cG5VRjEyZzF0eXpCQnBWTnNmcmtvSWErRnU1aG0xL0NiRlZBYTdWaVZ3b0pi?=
 =?utf-8?B?SUEvMDRhYTVFVSszT0k5bjEzaGhMSE5YR0NCTjFRL3lJNVdPT1pOZFMreE1L?=
 =?utf-8?B?QklNS1VFZ1d0djBzVExLc1E0Q2NRMkFVSytQcGkxQVUzRG9QSEg1dSswblgz?=
 =?utf-8?B?SytoWEczSjIwRmRMV0tvOUhhdnVsR0pmVjFUUnZ4Ujd0ZHEzRHAwaTZKOUVZ?=
 =?utf-8?B?Zk44MXozSlhVM0NMNkl2M000KzNDSGNjZldQSDB1R1lGWlQrTVpkRm4xTCs3?=
 =?utf-8?B?N0EyRUJGT1JkdmM3Yzl3aVRtTHV3bEMweUpUeDdSWVlTVERmU3g4OFQzL1NM?=
 =?utf-8?B?Q1M3dGhKWTdqVFJ1L3BpaHRoTk56ZXliRFV2ek1FVGQ4QnlBOXhKaExnVTNm?=
 =?utf-8?B?NUpRa1MvQzFpMVRqRWU5T3RVb1RPeGZmNytoNk9IZmlZVDVaZjNpeXlWa004?=
 =?utf-8?B?RDc3MjRVVzlTUE1NR2dsL3Q3QWZVajVUeDU4U3Bza0ttb3p5dXJJTHdDRjlM?=
 =?utf-8?B?bjRnM1U1a1M3NjVqZ3djdUJ3bzdMKzRtTTBHdHlKQ1VJOUhsaEUzODBUaXpN?=
 =?utf-8?B?ZW1LUFI2bXByQVJNdVdldjBPSXhLcWhic1lrdExrM2V0azNDT2JVQTN2UGNl?=
 =?utf-8?Q?uIy7jM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?THBaVlVyMWZuRDNMYjJsaWNBRFFYM2oyYmFzTDNCdTdaMm5NSHNUZGZiSThH?=
 =?utf-8?B?RXlYclFieW52ZE9GUmR6SVNleE1yWUhMN1Q4YnBSUzdTQ21obEZCWUZXUlRv?=
 =?utf-8?B?VVZtY3VOUktLdmc2Z1lDTWVlR1RhMXlEU3pQamJzZ1JSWTg3ZS9tdlJ3dGc0?=
 =?utf-8?B?bkd0MWpLckQxNlo0YVowSU1PMkhnSlR3UVYrcktuS1ZJeWd3cFhILzFoMzZl?=
 =?utf-8?B?UUlLNzRDVU1iSXZJUzY3Q3NpUUNjSjkzTHdjM0lwYUdPZis5b0hoQ05sc1g0?=
 =?utf-8?B?eFJEQytlV3U1WitaNmhuUXoyQzJHS05OeFVmRS9Sazc2cGVxcHJmQVF1WG04?=
 =?utf-8?B?M2hxQlZWNWJ1Yk56UTd2SlRMRU1JaXljdmhaYW51RVZ4Z3phSFNmVmtydFJ0?=
 =?utf-8?B?NWtnZWV1ZjhHL1pUaUdJanlzNE8zVjczdFFpcVhlZXk5K3QyTWF2eDN2WStM?=
 =?utf-8?B?OEpTMjNFRmpmQlUvTWdwemZwTkltdjlha05KTHJ5NzBQamw5ZlZYakFQWXht?=
 =?utf-8?B?cTFaWHpYb05BWWhaSmpWMEpyemE4djRtekVYQzdmOHNEQ3BRZUU1V3I0R2t5?=
 =?utf-8?B?TkxIaWFhOWZpNHp5a0h4ajVvVjZ3QktxZXF5bzRFQ20vdU8ralBkYkR1SGVZ?=
 =?utf-8?B?VHJVTTZFamYySEF3dUZoRFFJUEY5N0lOUkxDVWtQQWVreTY5VUdYT2FtbWo4?=
 =?utf-8?B?ekVsaUZOa2R6YnprWFR5NzNKMytqY1cvSmMvK3lnd0VaL0E1c090ZnBhdVlK?=
 =?utf-8?B?aEVqdjFGQ0c5cVZXZDU2VTJDMG1Zay9SbEhSOWpub3lYZlRBZzJ5azRFdnB5?=
 =?utf-8?B?RU5BUk1CUzlTVVpLVk1nR0Rra1ZSV1c2UndHYVdMRlhLb2hSUTFnNG9wWGRt?=
 =?utf-8?B?ZEZoSXZEdzdKMm43emczcUpyakFNZzJXdlBmRzl4Q0U3cjhFWGVOam9NTS9v?=
 =?utf-8?B?N3FVSzJFWUN4c1pVUnNYS2N6SWhEam95Mmt3SEFWMHQ4dWh5Y0tLMVhzcEQ5?=
 =?utf-8?B?c2ozZkhES3VIb3JIa2ZyTThENUMwRldwQkxndE95dHFTdlNlcXJhZ0plbFpB?=
 =?utf-8?B?c0hTLzVESDdoWWErckZIRHdTYzVBTG9UekZHdkZzaHh1YUVkYXR1ZzhPSVlk?=
 =?utf-8?B?ZFhZTGJVMjNmdFE3V2RkZThDSUU0VU5DelZrZVpGZkd0eTJXTmZsVVJERHVZ?=
 =?utf-8?B?eFNmdGhsL0JBaWpsbEd2bVdqd0YvV3FxczFWOVZpUXVXQVdtOENhb2QyRUVu?=
 =?utf-8?B?RzZGVXMrVVNrRU1jQ0phQU5PK2IrZThUL2QrZVRIRmd0UXVUNlhCMC9PSnFq?=
 =?utf-8?B?Uk12Vlp4Uld4cExCNFFwbnQ3OXpZVFg1ZGxxeFNxRzBJMGFxNzUrTWFGaGw0?=
 =?utf-8?B?MmVBQjZZUlBDSXcyUHlKQW15eFM0YkhoYXBJcHdhWW9CUCtkRVAvUDVhWE9a?=
 =?utf-8?B?bngzNFRtaEt0cDNHTkpZdTM0cUFXbTRPVUNJc2ZFeVdEWGhaYXEwM1M5OW5X?=
 =?utf-8?B?amd2NTNtVSs2eGN5VnRQcG9KVjJLNEtITVkwNjI2S0VGdS9wNEU0WlROZStH?=
 =?utf-8?B?UlB3N2U2bmRiNWE1UC9KNzZLRTdsRFdYZnJnWWM4WkExUGdRTWkzZld3TDll?=
 =?utf-8?B?dDBGY1YxeWdzdW5qMEtuTFA2Znhrb3dUaGR2RE1kKzJPVVJwQTFHR1pqcEhh?=
 =?utf-8?B?djRSTGlGQkNqWVRqTFRQckNrZjAzdEp2Y1RIazFKbTg0bEJ6RDY2MHJiOEY3?=
 =?utf-8?B?NzdFVitIbjBoODJyUDBNeU1UQXMwdWhqdXNqa2JibkpVKzFLelJMaDN5MXFO?=
 =?utf-8?B?aURuUW4xMEdIS1V6OFBvMW1yUkJLR1JPOFQva3B0UUJiV3Fuc0N6bDN6bFdh?=
 =?utf-8?B?d2VZTGtTc0NBWDQ0ZHcweXl0dW50UkJnRlNDQ3NuL2NEaFBrKzNUYTRnaHdj?=
 =?utf-8?B?Q0pBOEQ5MEZJbE13M2JSaDdqTTZRdDM1bGh3NjNpWWJHVitNZ0RzRkNmdEI4?=
 =?utf-8?B?RjRzVEYrSTZsaFlORjJqMmNYNlpEN0Yyc1RWOHdRU2lFRFZGTll0SXFvdWlF?=
 =?utf-8?B?UFNERlR0UEFaS1FTS3FGelAxRGFITy9qMDdmRUNndllML0Y4VWFnNnhPaVJL?=
 =?utf-8?B?djZHbTZIcENZTlNpcVk4M3hJT1ZGYkZxNTlKc1NDZ3l1czE1NlNQMmJ3MGFo?=
 =?utf-8?B?bXNoUkRwYlFEMG5TTHdLR0lQMDdORlFPcGNad2FscTlFZU5zQVp4QnZGekE3?=
 =?utf-8?B?eW4xbWNraFpzS1BIOGY1dXNHS011UHplTndxMTFoTlNpdEFGa252ODgrdDFF?=
 =?utf-8?B?SkovTzVkWGdMQzRZVWlhNVpvS2FpRG1BR0R0UGF1T3k4QVM0TXBmdz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54416852-10a1-4274-9a92-08de67809778
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 02:11:53.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiPXXq7E/wEKnW5sHuuoCoXfY/IaPAl/cknfonb1u+iycJs+YVazoSlStUwT+nUkRfB4tHDsDZ7ZBxkskjo51TWPxI3wKwAyln/2nFo9AQQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7758
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=6989426c cx=c_pps
 a=2TFapuF8m4VBt/+2R/0yYQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8 a=7t3YQbF7ku8yl6mWbhIA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDAxNiBTYWx0ZWRfX3Yz9qCLhC1Fj
 XPKWbTQcJ9JLkSna6Ng1jcGgRd6SVtfLcnkEaWrC6JALKDXkkLhn82QRWYGARgOxqWzrh99ffhI
 k/8JtYwBpS9R1+s5CUGv78s9f4vTzHvZAua3JpZqxguDRCiYsQcFZg92pJsBoIH3Y449d+Insrw
 h+jF1wax2MXDuNm+911jHAggguZOsyXyRhnrpZORX8qrw2bv8pWLUNa1IWuU+uu+jjE4WEVGje8
 KdscRcRI+rnDPCQRfkftFb/Lp63UWtn+sHj1WNFbCkSqO897Kb6aa+Ni5ZSudgV1q5vdmYtiGGv
 uRDneRvGgLYqCSVF7BOQZkZuTStKFRooISw0NXKRGxkB+vtGXs7RfuGCTiK4iCdoQvpJi1Vafnd
 Egocqf/5zkXVhBp6dysomt6qUJSQuktSqKdB7neRoAwbenEaxv8bgBf+N5E578s1oBVep/I7xyY
 I7x1ni8tysyVI4eU2Wg==
X-Proofpoint-GUID: MZn5JgIfQWQptx6fcZVYC3GVnVtgOn5y
X-Proofpoint-ORIG-GUID: 6VUc8w__di1NfO8XcokFmWOglQmwk9uJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 02:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230705

On 2/6/26 23:07, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
>> On 24 Dec 2025, at 03:16, hongxu via lists.openembedded.org <hongxu.jia=windriver.com@lists.openembedded.org> wrote:
>> +The source file subprojects/simdutf/simdutf.cpp is generated by python3
>> +script singleheader/amalgamate.py and the definition of write_v_u16_11bits_to_utf8
>> +and ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64 [1] requires option
>> +--with-utf16 and --with-latin1
>> +
>> +Add option --with-utf16 and --with-latin1 by default.
>> +
>> +[1] https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5
>> +
>> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/vte/-/issues/2926]
> Upstream have closed this ticket, pointing at a fix in the simdutf repository instead. Is that possible to backport instead?

Please drop this patch, we do not maintain ppc64 any more

//Hongxu

>
> Ross
>


