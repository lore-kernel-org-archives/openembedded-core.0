Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB73BC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 04:46:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.26682.1749185186316005875
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 21:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8252d755fa=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5564TFPW018503
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jun 2025 04:46:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t4uw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 04:46:25 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5564kOP9011618
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Jun 2025 04:46:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9t4uw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 04:46:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQ/doX0LFxjOdWFAcwFB9dqQr/+GB3mwCw/uDDf2JwS7dMJSfZvsFEymV8lT/d7+ZQx0bSYjSfD/lQDIhbC8V0mDd/iTDzYBv7wpOVQapL4S/5A0yFPqQc25G6Tn2PmN5PzUB8tudj0EKyyu1rVDSWJDGtTv8rA9isb5spTmRxUinPQ7l+k5HIX9gr1Hk9Hhi/U9mQcdj/pW77AYRonmjvV2eB+RfcYz/+xa9H/X+sSaj3XcRRYI7Zz1buav1GRm+0sTF4BQ0pBwtZtS94nue7RhCP/068eiHeEuSJlIUw2GwOHROzJ96skO0sbJSIX6EJqqp5z0qBWhGXnx8ZUI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ovufFeAyOJyNsNO7wbxxZJcoEHShuCxhxg0A2NYSgdM=;
 b=HrZ7kXNmMIbrEn/NcV6p+1ByktM0WlqynetC54LtPtoXrahHnDr0ijNKs9ZL2L8LrdaiI1HSeKFvWmnROCWV/fP61mtiOr0Y5kf3DzlnilNF9xNIS2fYaeg+hWCjhutrg4iHwzxN/oOnf62DW7r7puvI8m2iE+PwkGrv2OexAis+D0TFbB3p+lGaHgYpeOHJxwNuFIa3S18yK3UOQXJ7MMrO5p0hhP8Tii7V5FkVzmQuSw0KCD+39kLIlnOziGNoVMrc8xppwhxDnuFGtpxuY8ySfrGAlcRaF16eQW273LTl+BWNKka3C1o7xmvzaVS+7jzmqK6/mrOip9XVNxMTqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Fri, 6 Jun
 2025 04:46:22 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.8813.021; Fri, 6 Jun 2025
 04:46:22 +0000
Content-Type: multipart/alternative;
 boundary="------------n8w4CVHuxyhXV6sNi3P1wIqC"
Message-ID: <28f95180-6ac5-4aad-8eaa-882ab0f7aeb0@windriver.com>
Date: Fri, 6 Jun 2025 12:46:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [walnascar][PATCH V2] libsoup-2.4: fix CVE-2025-32914
To: openembedded-core@lists.openembedded.org, steve@sakoman.com
References: <18443C9C9F8B536B.2267@lists.openembedded.org>
 <18465A694310BD22.10724@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <18465A694310BD22.10724@lists.openembedded.org>
X-ClientProxiedBy: TY4P301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::6) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7e9b5b-ff5f-44ae-78cb-08dda4b515db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Wm5pWGxvalNKVmdqaVV6RURabEw1RFBPbWM5aUtreWhpeC8zdzRJaW15bEFk?=
 =?utf-8?B?a29mSVE3dG9KTytkTjk2anZuczRmOHpJWFpqUHRGR2RleFRoMjNLeDY5b3pw?=
 =?utf-8?B?SmhxVVh2Z0x2Uy8wYmlMOVZsczdYV05SdkV0a2RsT2ZOWWhDWjRJNW9UYmkr?=
 =?utf-8?B?MDVMajVHcEh1VkdmQ0krOENBbjNOcjBIaitxYmI0YjBsSUFteGtQOCs3cDBY?=
 =?utf-8?B?RFB2anU0UDM2VW1LSVJ5enk0cThvb1VGU3BWMDhrOXQzeDJGSG5acjkxMENP?=
 =?utf-8?B?MHhTUFRSaU95ci9qTzFXSWk3dk5HZSsyYmgyc1RSTG5JZFpuR29LbDNGTVhY?=
 =?utf-8?B?bTg4cVIvRGNiV3pjbCtyRkUxa0VYdjdzM3ByUkhLSkpvcld3aitPTkVOVTZh?=
 =?utf-8?B?NklLWWM5Z2dydkQ5ZU0zc21GbkZQdGFiNzFZR1RTcVpFMHhwNU9manp0aGlI?=
 =?utf-8?B?UUM0Q1dXbXloeGh3T1gzRXg5dWl1R1NnTmlQalV1S0F6dGlQTXcrMy9jSW5u?=
 =?utf-8?B?dHNVMmJlYUcyQ0p3WmN6K2djSWVjZUlSdzRodVRwN3dYd1dOV015T3hRUEdI?=
 =?utf-8?B?WXVYM0s5LzZiYXdRakJveGFqUGRIOEdVajVidHlGNXdZRjlpSkZQT05Cbm5V?=
 =?utf-8?B?SXllSUFFei9FNUY5MGk3UVFqQWlYVTVoLytFbitwU0paWkpIeTNvSHdoZHp2?=
 =?utf-8?B?V0dqWU8vM3hjSHpMeHFFNk4vRHhsWkxxRUNQMFZoYmpYQnJxWDl4YXM4a0VM?=
 =?utf-8?B?eUtwT05HNU9RY0xDWFgxcEkxYm5xQzd4cDg0czNHZHhGOGFMT09pSmxDYTFZ?=
 =?utf-8?B?SG9NTmpRYVViNWdNV0oyTzhJL3hjRkttSnhDVEcrR3BpaVBuVVVmVXBBeHBh?=
 =?utf-8?B?bzJsOGx5OS9PcUFKQTAyd29MQVltM3NXYi9UK0tOL0NZN1ltRkluQTlGM2kz?=
 =?utf-8?B?RHVNM2xNZEV3dlUrWXI4WGdobnllWEVUQ3BsRDZFNkZ3ZWQrT3c5bmZGZS9x?=
 =?utf-8?B?VDRCMFVqYTFMVFhUL0JjZHk4eWlqUjNFRXIvbnB4dFNuYnhENkFzaGZLM0NO?=
 =?utf-8?B?eUJ6L2dHalhEVUVMUDYraDQrN3puS09mVW5Mdm1VYnUyU25xVXpZTml6NUJX?=
 =?utf-8?B?RHl1ZkpzVHEyc2ZKSU9vTXNNbnJteEU1NjdSTWhBU1p3VkJvOWRQdVY1RkJp?=
 =?utf-8?B?Z0RQVmpkRjdGWEE1K1BEM0JhOW5PcEhtYStXRzNSQ1hFdDVZTGxnWjZBZkU0?=
 =?utf-8?B?Vm8xOFYyZEI3bmJTZW5Wc1l2WnNZNTN1bGN0akFjaDV3QnFaVnhzcXBPNUlr?=
 =?utf-8?B?N0Zpc1JsNmZzdnFsNU9rcFBhMGV1Uk9TSUhqNUhLeDg4TG1mOFdzS0RMRko1?=
 =?utf-8?B?SnV0MmRmZ2Z1TFlDaURjZVlNblkxazRCa29ybDlTeUNzamtYMC9SMVVTeGRj?=
 =?utf-8?B?dDMwQXg5TEVkblo1SGp0c1czOGNtdEh1N3A0VjFRWWw3TzFTNXgrZkF2VytC?=
 =?utf-8?B?b2FOL3lxY1NWQ1NaY0VkamxsTGd2L0JndXNVY0lNbHVPckxsVjFUcUZ2R2dr?=
 =?utf-8?B?bVdWVnR2UjU2N1JUb3dmTDRuYlFRd2wvYjNJaFl6VWRKdVhLS3VPaUl0TXV0?=
 =?utf-8?B?TXYwOSsxNlRaeXhYSnhHZWdLZFZ5dTIySnhpR1F2L3MrU0xRRmp2UGFhUHdy?=
 =?utf-8?B?Q0ZCY1BoRzcwV0JWdE9peTloY3B3dno2ZjFjdjk3UTJ0M05pcTloSUNWbFQv?=
 =?utf-8?B?SWd1cEZETUphays4YjZ1SmR1R1FXeHVKTk9MbWlTazMxdVhnMk9oeG1FM1Np?=
 =?utf-8?B?T0pka3lxYk9yYXNCeWd5d0V1dTByNE9XWUpQSFlRaW53cnJRaHhHYTI1c2hW?=
 =?utf-8?Q?lStdjjeVjgGhO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUQ2bnNHZGc2eDNXTmJZclN1QnB1RllrelVlR3BkcThOdHBuV011aTVhYUFz?=
 =?utf-8?B?OC81akszZDJYcTZOTzFIbnpvWVRZMDUwTFQzT1l0T1ZrSzBJSmlnNWlBRzlm?=
 =?utf-8?B?aXM3Q1k2ZmIzV1NMYnd5bGU2MVk4Mk5MMG5HcDUyTWRHR2huWUVIbnY2cFR3?=
 =?utf-8?B?S0kycFg3TjlucFoyZ1VIYWV0VncweXJMOGZ5d0lKUDl0UjFESVBBVHEvWTZE?=
 =?utf-8?B?TThJTWlqOVFxWVBlVkpNRDdmV1BFVDVMUzlpbkd6VDBYUlVKSGhGUStGaXgw?=
 =?utf-8?B?MWRBOWJEQ0dtbWl4Qi9lSy9RVWtTVmJlZzY0THRHMW5GUHNwclc4WUVaY2d4?=
 =?utf-8?B?R1lrQ1RDZ2dnK1lGTmR4aTJSNHNEUGxsOTBFVXc2azIzeEl1VnRLbGY2QW1l?=
 =?utf-8?B?N2VrQ3psbDNQMjdDZEFERnJvRmY0T0Y2VVVRdE1qYjFsL0VldHNLc1VKNlE0?=
 =?utf-8?B?V2JmUGdoaUl3NTdJWVRWWldDUmpIWFVEU3JCZGNWMGlLZjBsSmJteGIyRDZv?=
 =?utf-8?B?R05xUmNENi9sNThOWDhaZGh5ejQwWEdtSk94b1l0QXJLanpwZTJzc3RlTFo4?=
 =?utf-8?B?WjRLTi9OYThUc3RMNk9xbUVZUDlaaWd2dEYrVE1hdXlqaUczeFVPcWR6Ym1y?=
 =?utf-8?B?bkhDTE1zOXd2NnpTZTFSV2lmM3lndnlYQ0Rid3pEejZOREc5S1JlL213VDI4?=
 =?utf-8?B?V3dnSFRNM2o2bldZSzl0amRRMGdJblVXN0E4emdvOElvVndaUHZweG5VeDB1?=
 =?utf-8?B?WGhGTW03WFpTbk5qeWZLTnJaejVtcjdXc1d5SHZjWkN1RmR3Z2oza2RBK25G?=
 =?utf-8?B?dWk5Rm1zYWRKWW9nS3NjM01SVmdWVkNhSnZycGpWQ2VjTU95S2lrb0F0K1No?=
 =?utf-8?B?RFROUG5hVG1kS3hCeE1PL1FCcXVuT1g3Y2lKRUlETXVlb0REeVY1elkzQ2Yw?=
 =?utf-8?B?cXJ1Z2ZQOWRoTk96U2FWV1ljRmlNczlpOG11UWVGcVdzOHpZaS9KdzhhNzFT?=
 =?utf-8?B?WVJUNndDR3Fab2lxVy9pRms5YW0rZ3F3TDNycFdrUWkwTS9iemxwL3h3Wk5r?=
 =?utf-8?B?d0R2ZjQyMXFqRkxYaUJOOW9Eb2IyNWhTQXBwQ0dWNlhLNlVmS2ZGUmVBNm1O?=
 =?utf-8?B?akthajdqUE92amFMSGxmSVZnRW9PNXhwbUg4VTBLNlpDNnBrY25kUnlFZXFT?=
 =?utf-8?B?NWdtYU9OZXBQTVRCbVJucUY0QTcyYm9HckMxS0hTanRmMHVkVk1XVmxPaVVP?=
 =?utf-8?B?WXVNQnNCOXcxYmVwVDIrZVZxMUg0UFR2Z21DM0IyOVUzYjMrMmM4VTI1TVFh?=
 =?utf-8?B?c1lIc3V2MHh4alpBQk9neVk0em9FK1NWbmF4bTMwblFZRXlJQUd6Sis1eGpX?=
 =?utf-8?B?UDl6UWdZVkxFUG5jRE0rU0FhajViMjIxdFZONmdhaXVGa3RwMFlZd3RiUTBy?=
 =?utf-8?B?WkdXVXFXa0xoWDRwZmFiRExPSy9adCtpR3V2aUNwbytmWDhvQWJqS1ZRQnYz?=
 =?utf-8?B?dUhFTHE1b0hZbjgwN1hNeHQzNlI0TkFFTkcyc1RPanZoQkp1YW1DQ3pZS0FF?=
 =?utf-8?B?cVVyY1h2eVRHMFpYQ0tuS2p5NkljNmhEVzgxeisydVgyTWVTWDQwUjdkSnFS?=
 =?utf-8?B?bWdTV0lDQmFPYlZ0ZWNUSkwwS0tTMXo3dVc0a2xnRFZCaUpoN1NoVnVIdU1u?=
 =?utf-8?B?bE1lbW80UWJuS3ZEL1JiaEZmUlJSMkRDeGRnTEJjMC9nc2RyUjB0UXE3bUJZ?=
 =?utf-8?B?N3lrZzdjaHJ2TVVBd0VwSmlnZWhxQTBNWTlEVlVyNE5pODF5SWNLUitycFUy?=
 =?utf-8?B?djAvalFSN2FlcGp5eFVmTDV0QjA0Y3NOOXhWY3hYREE1czBMdzZiVTlEWkZm?=
 =?utf-8?B?dDc1bFJxRkYvaUY4dVdSWm1GQ085T1RGSjh5S3dpZDlTSlpCcEo3ZzRiQ3hN?=
 =?utf-8?B?WktpRjRhM204L2VKYUx3bHhOck5pUmxTL1pJdThDaFo0L3NNL2QyandVaGEr?=
 =?utf-8?B?ZktBYWplM3lJQ05HNUI0UTNxcWdYNUNBL1UwbENONkN4K0F2RWlVQS9kWllL?=
 =?utf-8?B?R1pjZzUrem8yY2tHRDVrc3JBbElEMUsvaTR3UWJacjdHdUVXSjRlT1R0Ky9V?=
 =?utf-8?B?RUwxMXBoM1JjTy9oNGVQOVpFbGUzZkZ1WUNId1JoaEVIUUFjcnJqUUk5TUFZ?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7e9b5b-ff5f-44ae-78cb-08dda4b515db
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 04:46:22.1726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSjqUDl668npXetagQArroJCQCFT/UiQWXF+hiIqlTkZOfjZpzyh8HyKBwif4WQzAoehGvi7WkpB1LfRB9r6oPDgW//UloMyaH3PI11w+/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
X-Proofpoint-ORIG-GUID: MzB7giOWa71-la5bP_IrNRywy5y-vL91
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA0MiBTYWx0ZWRfX7Hr9RRAhRW/t PHAhayLeksV4Tk36i8vW603679O0EjQLj9tdEGomd2VXjACzCQSYe7XTHGVMKLo0Czt1ZunLRcu WzoaftHl3rMI2v90g+Gz4dRNNag+IcC2f5unpdbhWRSvyM/Lqck/WUP9c+pA0QrfoIsMvjYfnqw
 8hZeUM4pp6DGJJ54q9+3ZkDpPgrBfCpqkgCqF1zNWjvsLqC2qbryoX47Kh17NEvgxpL5QEjomHv kkFQcr9XK2ecY6I+FAGM+6d2yP5KY/FhVZr/otYZa+aeYesMvW+XMKz3uvZzczvVdcN9Ul9VRgX XVgi1sftXV5PZqKfZl9t3pSOg6i09yYzMe2wgq/crVv3kumSKwpbEWz0Lk4lAL3IEaVQtqigSP1
 wEvQzAkRHu1+dVq/2MRLK6vcBCpwd2N4gJl7+3CBPFlW9j0adFHSLhdvHx1PEGX1kW0f5EZS
X-Proofpoint-GUID: ZWXqT5okYx4tUOaCImXsnhMNun-qo_pG
X-Authority-Analysis: v=2.4 cv=Q4DS452a c=1 sm=1 tr=0 ts=684272a1 cx=c_pps a=NJVP1U0jasB0CsydaCS0nQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=qu07bJc2W3w-Nk41BL4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=VMYcY6RBaRPXj-5NZaoA:9 a=p-X8bMi1RtbUyrPt:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506060042
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 04:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218096

--------------n8w4CVHuxyhXV6sNi3P1wIqC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5564TFPW018503

Hi, Steve

I noticed that this series already in openembedded-core-contrib, branch=20
stable/walnascar-nut.

I need to update two patches,=C2=A0 this one, and another one is: [OE-cor=
e]=20
[walnascar][PATCH V2] libsoup-2.4: fix CVE-2025-46421

Could you please help to update these two patches,=C2=A0 thanks.

//Changqing

On 6/6/25 12:41, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../libsoup/libsoup-2.4/CVE-2025-32914.patch  | 35 ++++++++++++++++++=
+
>   .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
>   2 files changed, 36 insertions(+)
>   create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-=
32914.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.pa=
tch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
> new file mode 100644
> index 0000000000..9f3bb21a25
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
> @@ -0,0 +1,35 @@
> +From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 2001
> +From: Changqing Li<changqing.li@windriver.com>
> +Date: Mon, 12 May 2025 16:17:20 +0800
> +Subject: [PATCH] Resolve "(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read =
on
> + libsoup through function "soup_multipart_new_from_message" in
> + soup-multipart.c leads to crash or exit of process"
> +
> +CVE: CVE-2025-32914
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/me=
rge_requests/450/diffs?commit_id=3D5bfcf8157597f2d327050114fb37ff600004db=
cf]
> +
> +Test code are not added since some functions not aligned with version
> +2.74.3
> +
> +Signed-off-by: Changqing Li<changqing.li@windriver.com>
> +---
> + libsoup/soup-multipart.c |  2 +-
> + 1 files changed, 1 insertions(+), 1 deletion(-)
> +
> +diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
> +index a7e550f..dd93973 100644
> +--- a/libsoup/soup-multipart.c
> ++++ b/libsoup/soup-multipart.c
> +@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeader=
s *headers,
> + 			return NULL;
> + 		}
> +
> +-		split =3D strstr (start, "\r\n\r\n");
> ++		split =3D g_strstr_len (start, body_end - start, "\r\n\r\n");
> + 		if (!split || split > end) {
> + 			soup_multipart_free (multipart);
> + 			soup_buffer_free (flattened);
> +
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/=
recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 79ffa19c20..7c1de29fd5 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libs=
oup-${PV}.tar.xz \
>              file://CVE-2025-2784.patch  \
>              file://CVE-2024-52530.patch  \
>              file://CVE-2025-32906.patch  \
> +file://CVE-2025-32914.patch  \
>   "
>   SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03=
4153df1413fa1d92f13"
>  =20
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218095):https://lists.openembedded.org/g/openembedd=
ed-core/message/218095
> Mute This Topic:https://lists.openembedded.org/mt/113498708/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------n8w4CVHuxyhXV6sNi3P1wIqC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Hi, Steve</p>
    <p>I noticed that this series already in openembedded-core-contrib,
      branch stable/walnascar-nut.</p>
    <p>I need to update two patches,&nbsp; this one, and another one is:&nbsp;
      [OE-core] [walnascar][PATCH V2] libsoup-2.4: fix CVE-2025-46421</p>
    <p>Could you please help to update these two patches,&nbsp; thanks.</p>
    <p>//Changqing<br>
    </p>
    <div class="moz-cite-prefix">On 6/6/25 12:41, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:18465A694310BD22.10724@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Refer:
<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../libsoup/libsoup-2.4/CVE-2025-32914.patch  | 35 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
new file mode 100644
index 0000000000..9f3bb21a25
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32914.patch
@@ -0,0 +1,35 @@
+From ac844b9fc7945c38ea21fb7cf1a49a5c226d7c9c Mon Sep 17 00:00:00 2001
+From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+Date: Mon, 12 May 2025 16:17:20 +0800
+Subject: [PATCH] Resolve &quot;(CVE-2025-32914) (#YWH-PGM9867-23) OOB Read on
+ libsoup through function &quot;soup_multipart_new_from_message&quot; in
+ soup-multipart.c leads to crash or exit of process&quot;
+
+CVE: CVE-2025-32914
+Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf">https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/450/diffs?commit_id=5bfcf8157597f2d327050114fb37ff600004dbcf</a>]
+
+Test code are not added since some functions not aligned with version
+2.74.3
+
+Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
+---
+ libsoup/soup-multipart.c |  2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/libsoup/soup-multipart.c b/libsoup/soup-multipart.c
+index a7e550f..dd93973 100644
+--- a/libsoup/soup-multipart.c
++++ b/libsoup/soup-multipart.c
+@@ -181,7 +181,7 @@ soup_multipart_new_from_message (SoupMessageHeaders *headers,
+ 			return NULL;
+ 		}
+ 
+-		split = strstr (start, &quot;\r\n\r\n&quot;);
++		split = g_strstr_len (start, body_end - start, &quot;\r\n\r\n&quot;);
+ 		if (!split || split &gt; end) {
+ 			soup_multipart_free (multipart);
+ 			soup_buffer_free (flattened);
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 79ffa19c20..7c1de29fd5 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -21,6 +21,7 @@ SRC_URI = &quot;${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-2784.patch">file://CVE-2025-2784.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2024-52530.patch">file://CVE-2024-52530.patch</a> \
            <a class="moz-txt-link-freetext" href="file://CVE-2025-32906.patch">file://CVE-2025-32906.patch</a> \
+           <a class="moz-txt-link-freetext" href="file://CVE-2025-32914.patch">file://CVE-2025-32914.patch</a> \
 &quot;
 SRC_URI[sha256sum] = &quot;e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13&quot;
 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#218095): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/218095">https://lists.openembedded.org/g/openembedded-core/message/218095</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113498708/3616873">https://lists.openembedded.org/mt/113498708/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------n8w4CVHuxyhXV6sNi3P1wIqC--

