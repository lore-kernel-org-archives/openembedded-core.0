Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303E7FEE4D2
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 08:01:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115553.1772265689781232006
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Feb 2026 00:01:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=ZSg6idgn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6519ba32ce=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61S6qODt2834359
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 08:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=24sHJfgh2xQ6/Lt71EsA8VgRrcMhpZKjt6MgfBUFwxs=; b=
	ZSg6idgnQoi4T7xS2dY4DPkPz6pQmb7eKSjFyyISxDLK1i7bSp62F1y5xhpbRX2j
	i/p3a4fwTGUlDh6ouxrcRlCtdjciDv5ssObOyhMg2M3N27qaZOId9u1sGRlvR1Sy
	hsjBBWJSNoI2fDNcli/e6tZ2n4OM8x0p1f3AFlwGwxIrIsdgkye6/ZwbQIrTOJBL
	65txK409QTiNE/ktPQcaT9E76powkrhrlGXkn/1nVmciIFDBroPGGzSJddYzsFrC
	WY4S1OtXgNCQUEpduSQw/HxMdQ5X2hk8ULD0Qd/jUyTg4qSpOuRYztamzjFLt1pV
	1BtJ3QGyPX1fPhqfQnzWBw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010012.outbound.protection.outlook.com [52.101.61.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4g7a9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 08:01:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiNQ9YThTKavhjAJ2rPyTd3tacNy5oVRT9IQJDCZjRdzyfxts6Ul/ZKqRLu4x1znjALlOQ/4NIdly+81JrWupJDwhdXc3qHA8q1YBwYuBQnYN9FTCHXqeTUJDz9r4p1u4Gn+EyrO2PvEKZ3xCn2Hqj07sCfqOSO3hcz6rb8zewDat4vH+09v8XOFd4v/YLlhdSwrKdqANbw6EXjCjdVztfE32lyFOEjYW65/fW9Vlnzto3BjSEjF0ZKw9n/fHLnNw1R8lwSsVgFKtk4PHpabat+ceGG+eTWgy5JPytenPH8SCiDs9rIoPcUiaUEAPxkkt4CWA3NhcL4NmTmgJH/eeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24sHJfgh2xQ6/Lt71EsA8VgRrcMhpZKjt6MgfBUFwxs=;
 b=WrRwAmGgALzzYRcMhY9ngTae7IaDi7Q1ChtU2huWgGBuTV4e79Ng/FlqIHSg3hPHqELQY2tfJlEXv+UKCnhhY+VwqghtXtC8bCHIgHS6BUxMKoZ3CqnpooPEX9nbg4mtptYd9/hcUskvINVLCQstnAuADS96DIDXabuGH1HfGMebUqpDudRjNm105di4Saw21R9lY7XKwSZaq4Eym9FoOQOEUJcm2Aps9VyeDO38RNRt6rngjaS5VSFWp+24ZkccDg+sAmP5LoYM1fAqCkZUxbhamGHsV92YpZbvrJGJGWedsXCGiZfrDnHIjFSRGFepQ/8+fQDJ8NNfRS2kHz7dvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SJ1PR11MB6299.namprd11.prod.outlook.com (2603:10b6:a03:456::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 08:01:23 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 08:01:23 +0000
Message-ID: <3ac31ee1-ed0b-4abd-8c59-c6bc664e74ca@windriver.com>
Date: Sat, 28 Feb 2026 16:01:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 0/7] rpm: 4.20.1 -> 6.0.1
From: Robert Yang <liezhi.yang@windriver.com>
To: mathieu.dubois-briand@bootlin.com, alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <cover.1771409846.git.liezhi.yang@windriver.com>
 <DGIA0D4P60DI.1CA8PWS58YCCF@bootlin.com>
 <212e8187-1b6f-4c2c-8d57-97cc66387c56@windriver.com>
 <DGKMRZ496JHU.1T1MJETE5VNUN@bootlin.com>
 <CANNYZj9DHuV3rmaAsZsPcbZ2ZsbMrNe+keNgVazav=3hUnYQKQ@mail.gmail.com>
 <DGMFHKEHBIY4.24DUCLY3ZXN7N@bootlin.com>
 <01d72b81-ac28-409a-abea-99671fd3b214@windriver.com>
 <DGPMPU6AOIVH.3E9XQEJBJMTZV@bootlin.com>
 <9ec2a6d2-a03a-4a30-9490-10e0fe7cc5e1@windriver.com>
Content-Language: en-US
In-Reply-To: <9ec2a6d2-a03a-4a30-9490-10e0fe7cc5e1@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: KU2P306CA0023.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3b::15) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SJ1PR11MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbb768d-ef59-483f-809c-08de769f9071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	zHpB0w6pfz40FGzlfTyDJGZ32fk1FFRr+Xdw1zjLSpQr7Sa4bfNiBznyYzFQR6j2d1+3hNYJ42rgRKg4o8fLO5HybwRGwfJCszMWamcSJJsNy2HfomM5Q1oOIY5gHz+RpJ++GS/ulGeFU6Ts7ZdpW0pHHJeMnX6e0NDf3e01kks5Tn2Edmv6EbYqd5ADy1Fn3JLrehxivcYx+R2lK6IbiKmIIJUnkWT5c5sZdrvlz9sQAPNNzvYPOk000zhUrKr5oy9tHEmcx88jh24BsRWL0WkwXIaRsCdWzcIOSvvgzr99K/Car8HV10O4jASok6rArfg7VsiGAvTgckEt7SuRkImo8AxWXEurGy+iYGkFbHUnWfm9rXDFIJpLrKl8xIMyW8NZG+LDuEMtJXVpblPXnHz6TU7meYeAXvj30ZXDCojyIn3DEMGSBh3IgwioGpTahy09+NMoHazPk/kLAJo2fn4x+Wkc4MU/sFcJbp/9LalgrmdtUZ6bpfoR+8Ea82JA6SX+HZXjzW8fpOFsOyypL4TgpiysBbGv5a3lfAalVKe0Ja5Ga3e4zB8Eh4MJKgaDK9O8FcYz3HNc/ZcB4V1h9CUIFtvR8dKjEdsM2djxM0+iwcjOse/Ll9ac+w/U6w6E8T3VMnYLfP1BzA/NJEwLjNcgMvHi81Vx1M3TD0CayjknhThNHaSBwBGuYOeGOgKQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?blZnVzVEcEJZQmpPaGJXZFJVMkVYMEhPUEs2R2xFZC9NTDNEOHRIQVJ2djho?=
 =?utf-8?B?TzI5NE5kbjU1UTQ4WE5tQ3NjbDJaTDZHaS9BZm5VMTJWQnAvL0kzSXBqTEVt?=
 =?utf-8?B?WWVDeGZSWWpINmFqZTI5Z1BHZG9Pb3hKdEhHRTNOME9wR0l2M0ZlbjYvTS9v?=
 =?utf-8?B?bWVnMUZrUmc2Z1RHbUVUYkxKZmowOWIxcDlBUHAxYnNCRHVJSE9JN3RaU0x6?=
 =?utf-8?B?U042S3Q3OGtoRHhobGZXMEd1UCtoYmNRTUt0QVlrUURIdUpjeXJqUTBXRUxL?=
 =?utf-8?B?VzMzUlprTFFwb21NYm53RnZwY2RHWm56aUx1RGFYRytsSWFwd1IrTGtCOEdu?=
 =?utf-8?B?MFFlcGcwSktmdExlZTRZa0xhQkdaN1dpSjA2RFU0QmJtRFVzRjVzeDFjamQ5?=
 =?utf-8?B?b3JmeHdlQXlWdW8vL2ZuQ3Urdy9lZnZ4amdxL2hYYVk3OTZGVGh2c3BrS3B1?=
 =?utf-8?B?VDdsZDBuT1ZLYjZxRFEzWjhVMjVPZzhiemJXWHNETG9PTHk5cXZOYU90b3JO?=
 =?utf-8?B?MndZQmt6LzVHYkJZTEJlWjB3ZHNzSktYMGd5TkQrL1JvZkp2Ymxsc0JDR1FQ?=
 =?utf-8?B?N29lSC9TNjcrWUpRYSsvL2RuTkVLZnlUZGlhN0lxUGNMS0xlUmlRbTlqejVR?=
 =?utf-8?B?NkNmQ09JNkgrU2k1UXlJamd0RkpNYnhqcDUrVDh5WU1DQ3hOMWhndmxKNGNk?=
 =?utf-8?B?TUR2eTlzTStqdGpwQmdKc0RpeExYaGxmMVRUZ1BpRzRYMCtXMlNFRlZDQm5u?=
 =?utf-8?B?WjFZL2JLVnpmK1lzZHpteGNXM1Axdm1JV09XUXQvdEtJRnJJcTU4K2U1T2NG?=
 =?utf-8?B?RnFYdkJHMTExaUR3TXFsb0ZFdEprL2lJV3RSZUNOV1BlaEpoNkpwMEJkaFZC?=
 =?utf-8?B?eDNhdGtuTTZRTEpHN3lHYnNCMTVPa2RhY2N1OGkyVEFmVUUwTlBNUmo4WDhi?=
 =?utf-8?B?TDdJNEJoT2hBTlJXYXZuTzBEbUZ5QlN0U0s2bGcvQktSWHJXZmlkeWZGbU9o?=
 =?utf-8?B?MFNjL1MvMzFmRWNxSGtQZ0NTcHYxNUNZRDI1NlNzMUFpU1RuM2xHam5LNnkv?=
 =?utf-8?B?QVlFUGFCTUtFQ2hTNERidEc5VnQ1d3NycmovZXF5MFRIZUo4aFRXNU0veURG?=
 =?utf-8?B?TTk2Y0RGc1IxT2hPVnVoMWhYQnFGb3Jvams4cFZaR05oQlpuRFFwWGdoWk1V?=
 =?utf-8?B?M00wdmU5OXllVVRHWGRnL0x4Wm41MEVTeE9UUjZ6NGNKODVKdUI0VmtURXZW?=
 =?utf-8?B?cnNTQmRnK21PTFh6aTduR1pPM1hrTmk2R0xlSW91Q0prTm9vZWR0aXhKYWZi?=
 =?utf-8?B?Z2ZmL3BnYjE1OVdqRG9uN29FVGtuSlRaNTlJckxwUFdpTk5NcFRxNEI5NjNq?=
 =?utf-8?B?M2ZvTER6NmpyWWZQbjg0dHdmME1jM0hkbStRZk1YZnY5UC91ZklRbUZWWXhU?=
 =?utf-8?B?MDJ1cFBFdTA2eHUwazRia3p3V0xMNmdqeVBNZEVFeXJUN3laTmxKdEpEMDVP?=
 =?utf-8?B?eS92cHFCQVQ0TU5hdWkvcVBVSDJWZTBYUnptems1VzJqalp3TUloODBHdFRR?=
 =?utf-8?B?bHIxdUtTUTBMenpNaERiSEw3bENEdUlTaTRLKzJJMS83V3V3TjJ5bnd3alY1?=
 =?utf-8?B?NUY5eFRJeERoWndQTDU0alIyblUvNHAxLzJJWjV0R3I5L01pWDQzZDAxQ2lw?=
 =?utf-8?B?V1JUd2pXNTgrTzZEc2Q1aTNlQnlycWVtbHZzR3ZEQlpaK3hLK2loVFBLWE9P?=
 =?utf-8?B?SGs0OS9vRHAwWThlNHE5SHJ4enVSS3FsMHJ4UVpibTl1VUQrd0xZV25GR0x1?=
 =?utf-8?B?eGxGTDRjZkcwZm9Rd29FeDdwbCs3Mk45NVNpTWM1amhjR3Mwb3g0QmgwUUVB?=
 =?utf-8?B?b2wyZ2tNRnZ4M096cHgrQ0dmNVB6WnRLRFM4aUFXdkxmcENGTW1ockc2Znk3?=
 =?utf-8?B?ODFNQk01NldxLzZUV2dWNnZVTWhaMnF1YkxsMmdCYm16dHpSS0lSdFNVRUNS?=
 =?utf-8?B?OEFia1U5UEdveWREQXBBdFhYc3YrbFF0ajVCQzdENFFpZTAwNUs1U0VRT1Ji?=
 =?utf-8?B?NkQ4NFI1MzdiQUdQSHM1enpOQVF2QmpqaHdha2dBeFRkUXBGK0IyaU5hUjJi?=
 =?utf-8?B?WUxvZzJBNDZyRFV1VHI1aWVONDdsR2NSRklzMCtHNWU2QjBSalpJYy82dGJn?=
 =?utf-8?B?Q2IreklIeDUvQ0tYOEJyN01CUmlCVmRxK0FwMUloRmpVR1ViSjBFaTRaUVMx?=
 =?utf-8?B?NFY2ZEc5bExZa1Y3UFpBMTg5d0xjS0YrY3h4UlFlOGlPcVhzREUraTRDUTVY?=
 =?utf-8?B?UDhZdGRLWnh5RUtsUVRwYVVwWkVXb21aNXlXTXArV3VXQlZLYWxKUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbb768d-ef59-483f-809c-08de769f9071
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 08:01:23.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Elu/G5sLrxMy6NQ1wbtu7Z/dNUEfHqjzMPHfPISCfjXH41Au8dnXcSPlGnJOwKz6cOTNaL4u3xqHiPDskOq1Za2W8AXgc1eBnzdIoo6qHPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6299
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a2a0d6 cx=c_pps
 a=Os0crU6ZVxYeJaTskmJGZw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=5wnLb4LVCee74d2kYzUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: cG3OWyFUVDlDGSfgaTuPr1Aa7aSCA3EZ
X-Proofpoint-ORIG-GUID: iDAxoCwhHZnlvEQBhUK3nU39o1S-XDMg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA3MiBTYWx0ZWRfX2IuVIZZmO4A5
 OcSoYD+BmV2Glzn68RYDSaiySGWTZgK0QLXS476fqUrARNl+LeCRwV97NIQMPSd3kBJUMhZ12QB
 3gSm2YKFMCTnwobmArsGQZhD51f8gVI9HE+dXkTRXANnDQ/7FqQ9rUZjN0FsY6Kpz16U+IcVKLA
 dZ1r2RmvAUbyD/GRr4Kpc2VnIXVG8wsVN186cvDvEXeQDWP3b+IDOa3q6U6Vn4ElNrRm1nrMzjU
 V+sj43qh/AYCsZM/LO+/LulszaWvYpDpGMuE9QvlbzRxcGpPaIf0DYc1TuN3xT34c97kfpZaYYJ
 mFDvtdf1xTKNs/WuVzMvQmvR85PFlQbSotkb6Vvv9WmSYUugIX0HC1zv/X7vBJa+c+nrdx1D9N3
 NPIbcF0xMH2sHbBzY7+LUK9hseRs9Bz5QhoZWciPnkhl6j5NfMApf79gondwvHCyDyP5mbeX2fd
 mtSf6unqimFeP3OCxEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280072
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61S6qODt2834359
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Feb 2026 08:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232125



On 2/28/26 11:53, Robert Yang wrote:
> Hi Mathieu,
>=20
> On 2/27/26 17:16, Mathieu Dubois-Briand via lists.openembedded.org wrot=
e:
>> On Thu Feb 26, 2026 at 5:00 PM CET, Robert Yang wrote:
>>>
>>> Sorry, but I still can't reproduce it, would you please help to try:
>>>
>>> $ git fetch https://github.com/robertlinux/yocto rbt/rpm
>>> $ git merge FETCH_HEAD
>>> $ . oe-init-build-env ../../build
>>> Add the following lines to conf/local.conf:
>>> PACKAGE_CLASSES =3D "package_rpm"
>>> OE_FRAGMENTS +=3D 'machine/qemux86 distro/poky'
>>> OE_FRAGMENTS +=3D 'core/yocto-autobuilder/autobuilder'
>>>
>>> $ bitbake core-image-sato -cpopulate_sdk
>>>
>>> I checked the manifest file, the error packages were installed correc=
tly.
>>>
>>> Would you please help to send me the error build's conf/local.conf an=
d
>>> conf/bblayers.conf?
>>>
>>> // Robert
>>>
>>>>
>>>> Thanks,
>>>> Mathieu
>>>>
>>
>> Hi Robert,
>>
>> I did reproduce this again, here are as much data as possible about my
>> build setup:
>>
>> - I'm using an ubuntu 24.04 docker.
>=20
> Thank you very much for your kindly help, at last, I can reproduce the =
errors
> with pkg-config installed on ubuntu 24.04 (Can't reproduce on ubuntu 22=
.04),
> there are host contamination issues. I will fix that.

The rpmbuild + Ubuntu 24.04's /usr/bin/pkg-config is very strange:

* The flac-dev.rpm requires pkgconfig(ogg), but libogg-dev.rpm didn't pro=
vide=20
that, this is incorret:
- The libogg_1.3.6.bb inherits pkgconfig, so the libogg-dev.rpm should pr=
ovide=20
that, but it didn't
- The flac_1.5.0.bb doesn't inherit pkgconfig, but it still finds pkgconf=
ig(ogg)

It just worked in the opposite direction. This solution is don't use host=
's
/usr/bin/pkg-config, and use the one from 'which pkg-config'.

I will send V7 after more testing.

// Robert

>=20
> // Robert
>=20
>> - oe-core version: either your rbt/rpm branch or
>> =C2=A0=C2=A0 oecore/autobuilder.yoctoproject.org/valkyrie/a-full-3239 =
from
>> =C2=A0=C2=A0 poky-ci-archive [1].
>> - bitbake version: either today master branch or
>> =C2=A0=C2=A0 bitbake/autobuilder.yoctoproject.org/valkyrie/a-full-3239=
 from
>> =C2=A0=C2=A0 poky-ci-archive.
>> - meta-yocto version: today master branch.
>> - Attached configuration.
>>
>> You will need to adapt my configuration, at least to fix layer paths a=
nd
>> DL_DIR / SSTATE_DIR.
>>
>> [1] : https://git.yoctoproject.org/poky-ci-archive
>>
>> Thanks,
>> Mathieu
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#232089): https://lists.openembedded.org/g/openembe=
dded-=20
>> core/message/232089
>> Mute This Topic: https://lists.openembedded.org/mt/117873427/7304958
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
>> [liezhi.yang@eng.windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20


