Return-Path: <Ghanshyam.BanaitSanjay@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C16AC9830D
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 10:30:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4863.1790332236578141869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 03:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=LCWWMJ2E;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3728c4202c=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P535i82499881
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 03:30:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=zOOsmq6HAJweO5tHxIxd
	67ID2jhfdOAcOnPe/CKrFxc=; b=LCWWMJ2Ecovuw6OJZnzR3kNE6pE1x8DypeN6
	RpxZ7A+zv/pksijn9xY5Rqlg9djCy3qa9kPTILJZAPwY48gFdAXKhbb2PGyo7z2e
	zml8oEbowWyJUfyKJiPdg0RVqywYWrOARY/ROD3wMeR0h9DI6Xc3pcn8uM2xmqiv
	6x84bAPHg+GDbDkylQof0RaFskxZaTsluWWMPCoVnLsdEN3zwRr2lOvNIwQ0c8A3
	jOfqBtUV4m1Z1tlLbIG5SHBSGfFm5n8PXVgiFh9Dbhkpo3AMFG/XVQKp7qf6bCtC
	K2CH2Z0E7tur5y9bcj6na/7mCGjbMmX/TWWtnwmFf1oMaTzTig==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022094.outbound.protection.outlook.com [52.101.48.94])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gvt0xtc9t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 03:30:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bFaiFCpQTxXtxhCk2o7Ps4EOHGQBy8pHZkmZLLXZxgiMITmOfDxJiXqID5Dg1G88IfeuePHv9GSxDVrZGYhnIh/GaQOofWv9xNv1/xsjtMhRybrZcPuFsVfY4FvRU0t31LtZOcz9et1t6VH66QgZbO+sEWroWS6VUuwn2LF5W08KJnvtpU7mkjypiszqlOKbRo+5o6Vgfw3ud2TU3yFB+DLW+yfasaVuUhcYnmxLY6atyeSu2zXrpubDOpdKkoGSntD5dGmFe0UpXiFG2FLmIDZ6Qaqntv7CQbH+OujQtN1WzeV4z4lwdUPgBZ7HeFAghs19vWXcgU8TP9QcNDgZDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOOsmq6HAJweO5tHxIxd67ID2jhfdOAcOnPe/CKrFxc=;
 b=WIkKbsSAG8Iq99Kp+RyreuCAIeGnHLmmQtZCjra1AKysPVqjaBhZepZUI1IUS2d5cmbB22lUJRGBMdCrOmUoRm7Po+yjjFkmmNDrSJjzpYO1uOPXAm7L8lELFW0mbSseoalcYq0F5MLwlEqL+IazqszmaMGOGmObhuO6ql86bb4yB8y/j3WKWCUObmnXJij12ZeoilqGSvL12XB8M7MdcwVk3MRNgPV0UpASUjntwVe22eYocmpv9mpM1yjNmJ3eWBvxxdR0NOG2TAEog3qnwASKyIooiOYQsqo8jsRXH4hrGUq00PlEwV7mWhNWpe12yv4aAtu8uv6KwU5cS9MqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by MW4PR11MB6737.namprd11.prod.outlook.com
 (2603:10b6:303:20d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 10:30:32 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02%8]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 10:30:32 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] wget: fix CVE-2026-15146
Date: Fri, 25 Sep 2026 16:00:10 +0530
Message-Id: <20260925103010.3001030-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SEWP216CA0094.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::11) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|MW4PR11MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c94015-feaa-4a98-06a5-08df1af006cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|52116014|366016|13003099007|38350700014|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wrM8DUmxj0nPCgAhBivokrdKd/gwNRbV06W/MthKzj75fnGnOczaJg/qvJ8pHvrjM9ODLCBL6M5HlhmYQnBOqIDtvqesxQtPZHiC77g5NJdkLOlHb9EL45ypXX90jU8C2OTestwIJXl0zYttamj4fZ9AIMs55Ma0LiCD3XL8nZ1Tp7KnEk6g+ujGj3/mFlIG23XS8yPDHe9Ho+RiSxAG1bxeGxD/KUq32sFuWP0epimAETXcTDfmsjLdf//LHZQYbqUtchoLQuz5utRkqOHliySb4YLJY3EOaj9qTtlzGb85oetJtgvaWRFxnEzKEMMY4/gfRYDswd5b/ld6zHBCoP+fv8OggbScFOkehY0I3iCq0bqzJqbyarqr3XndCpQwNlP5uJRF+/0U/6VZx4mbFFOQt+PFpGtYHfYNqFnBAgP5huOMGqTGopFMnKT1PZi01e0JeJdwjpsKgNo3hHXYKnLDwj7IdEOXxp4HCXRqYTltY/bl7aaEWx6w3YzxdZwkp0cRveRJj8NrH28N9a+vONWQyyNgCrDeU18zU1eT+UIjOv2vXsWmfyXSuR08peqEivQilfTGx1hxMiiUyC5t/dphNpx226592j+ahBqvYgGHIoTTd/zmiar361aZlVCKwwGzzu8pVCfcaMvL6x31EbDfF9Z2cDUpGPMbM4KvKus=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(52116014)(366016)(13003099007)(38350700014)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1J5VGZMVUZqVlQvNkJuRXphNkpFNzRibE5PUit0empqNzJhYVhQNGREY2RH?=
 =?utf-8?B?WENkTDZ4R2R0ZVcvWFljSGkzZ1UvNXp6M0o0Ky8zNk8yWTM0eTFtOHU4Z3Z1?=
 =?utf-8?B?bnlibEN0UWllWFJSbzlLSWlKNnhvN1d0MFRIVnN3SVlDK3NpVUU3OHM3SjFw?=
 =?utf-8?B?REdod3BudU1vNENheDBIcDlKcjJldDJWYU1TcXdtMzV0NUczODl6RTY1TXFl?=
 =?utf-8?B?UGN2Zkh5c3FYMi9JdVI0bEdFR1VGUEtCOEF1ODZNR0UzMWFsTk5zaUYvTTJZ?=
 =?utf-8?B?MTNQb3c4aDdKR2o1RUdjdGZPcVR3VXJOaFNRR2hrSTltYVM1MTJHeXY3dFpV?=
 =?utf-8?B?SUlZSXV1MkpLc0FkVG5QM3cxT2RTTDNrZmxKc0JNcGp5amRGVU1nTTNQdHF1?=
 =?utf-8?B?ekpITk8xYWIwRlY2eU1XZklqTElQTzQwWHlFV3ZkVFd1ZThpTHpvQU9salNq?=
 =?utf-8?B?Rzg4eERsLzF2UUgwdmt1dGQwUHE0Yk1iS1Q3d0p6TDJoYzVQZHBEQkpiTjF3?=
 =?utf-8?B?bDRKOGx1bks1T24rRWVGeUJDeUMxV0RzU2JiTk5YYXgvYlZKNENoSC9MdTFU?=
 =?utf-8?B?SlhoU2hRUjBqcVgvQnVTc25pVEVib1VHSTM3K2FLdCtCQXlTZFlGT3g5TEFS?=
 =?utf-8?B?VG1GT0xKQy9FYWp1SXVjYS9mQmp1b0tvam1SQnU5VHV3bEhaL3RNbDB4aHhH?=
 =?utf-8?B?Ymw0cXBDbEFnOU9ycFZXUExVcGtKenlNSXVQUVBqblRBN3ZUMXMrdUc3N0Ra?=
 =?utf-8?B?VzMwTFBmZDJxZXNlWUV2NkZ3VWFYWXdOOTRkUGFaN05selNrQUtOa1pwakhG?=
 =?utf-8?B?TlQ5STl6bkhTZWswaTRTTWVJYVAyVHlZNXV4TUV4WUoyeDhiSU5pRVNWUjRk?=
 =?utf-8?B?bk5qdEJIUFpZMmpjYU0vZ094WDY5eERHbm1jRGR3TzMvb3JmSTdtUk9acTVX?=
 =?utf-8?B?QWVVeHNTRXd2UU5XeUhLL1FBMUdITXF5SFhISlNLZ1JnTGlaaUNyb09SMnVV?=
 =?utf-8?B?aTlKUzBQNExGRFVmbzBRbWdEby9FTFNSKzl3V2VXVTFFSUZteHZHcDNid1VE?=
 =?utf-8?B?YURWN2tvdFhlRDJ3bjJrZG4wV2Z3QmRrenNJbW1OVWhSTHY3OUx1VWtUS2p3?=
 =?utf-8?B?S2QvYlo4ZW4vd1ozVzYvREkwNi9qalZmMHNYM3pLa1lkMUc5enkyTkJjbUFM?=
 =?utf-8?B?L3QyQm5sUHZHUEkzanNJd1NsOEVNamtVWTArSkFJNlEyQ2NWamVIN3hwNlBC?=
 =?utf-8?B?VlFEbEF0WDNDUkJUamVRdXlnVWJsZm9ScnM3QUJpWEJaZXVCcUt0SEN1UDVT?=
 =?utf-8?B?bXFnK3FBK05VdUNCbURna3JHbE9Ra0hKWXdwV1pkN2ZQN2xQbGJObnhLRFRm?=
 =?utf-8?B?N1cvb1FIQzhKa2t6TzhRMGRtYWVYdVhIY1AvSFNmZjdOeFFMRFEvQkFjREhw?=
 =?utf-8?B?NWgxRG14OEJ4ZndmWXpmUm5vZ0txQUMrZGhKcTQrdERhSFFPZGs1YVFqeEwr?=
 =?utf-8?B?aXZWOTNkdXpCNno4WVJBNFIvUXFQQk5uTUtMSEFLYnlPdDhiaGhLd2tqY0lV?=
 =?utf-8?B?UTFDdVh3RVl4eVpoY0FHNjlwSWs2Zmg3Nnp4Y0tYZS9PR3RtQ0MxZUlPQWxQ?=
 =?utf-8?B?R3FSSnZNS0FDdFVhUWUxWHlXWVdnVGRhNFhUaHdqdUlFUjQ2c0MrRitnT0Vs?=
 =?utf-8?B?ZlBoOW5WYTNlSmkyMWo3cHVkdk43RUdYLysyMU5iL1ZRSjBpc0xob3Ivc0Fh?=
 =?utf-8?B?eXFYWHlPeXBvOXhCdFdtVkRSc05QbkdSQVl2ZGNsSmZoSTl2WFpoengyWEFW?=
 =?utf-8?B?TFNyeEJqdnZhWUFOVEVSRCt2L1pnRURYSlBDaDJtcitsY0RJS3g5T0JNcFVU?=
 =?utf-8?B?M21raXFtczZ5WDV3dDFhNFBHd0d4ejAzZ0NQTk1MMTRjMXdLeFBOL2ZmMXhN?=
 =?utf-8?B?dmFPcVBJZ2JLWVU1aVpMbHpMbmVRc3JNeFA0ZWIxMS9YUGxaNmtKaFBmOUJS?=
 =?utf-8?B?SkFydUUzcFVrUkw3M3l3bEFIUG5xbFU4K2tKUWRWckppRS9uTGpGd0FObXYv?=
 =?utf-8?B?S05odVJ1cVRqTzZ2cXJXdTZWaFVSQVdzZTJIZDlScitoVmhVUWN6cmQrVGRC?=
 =?utf-8?B?c1Uzc1c1M1VHNG9lS2dnM3NBOGZxblhWVU1lU0Zqc200MklqV3dqVDNjeUFW?=
 =?utf-8?B?cWZGVEFSeGRpSlBLTk1DOU1KbDY3WWpQZXFMNGFlOGVDam1wblJZekJYVUhC?=
 =?utf-8?B?bWRlTloya3d2YTVKVzUrZytxcUk3V1JkUm4wVWVOQ0ozdkJ5SXlkUGpxOVBu?=
 =?utf-8?B?NEdKRGd4TDBhbCtWMTIxVy91blgyMjV3cnRvaUJhWlVuYmJkVXVUMXVzeTFj?=
 =?utf-8?Q?ySvJAXS2VRJB9qiwHK59OqQD6XSdhO8TxusdD?=
X-Exchange-RoutingPolicyChecked: 
	2cFI16WlOoKb0zI1Y1dvC5BCK8eDbkVf7QIwdRxYpIx+u04DnuHWt8eOc0B0cUQJXSowtNYyhc25OF7uCzBR+JmMQfJ5h69vvvTfry+V7Xv7l5JWcCrIvraP3kihLEXYipgAVuHXzjF01t2qUw/jJxt8SbrYZbRiqCZLR0Clwq38lwD6VmXdBAiu7s+J0hemZFNPxPPSC+TBt4tEZFUY6X0qF6i+0QcPetw4EFOV7EjErODmjXFxLLpILhfJlJuf54wiLz6SJKnBMv7wnzQauyzNMg87CJF3nViMImzUSTBMISAQ0bXVEPYnQ6DUEVf2USlJtVbxGrPX+nsMswD3HQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c94015-feaa-4a98-06a5-08df1af006cf
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 10:30:32.1173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E67QO/v+yQJ4WAfYvWnPXrEnGH6CZPXYqPy+X3qfE/f+WPED32EVcVcGAaW+osIzGRjdp/9b6oCZEtpzb/M3nMF2xPcMdOOZ4dYf9qgQpbbafHZ/QPiSKin9kjtFExMc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6737
X-Proofpoint-ORIG-GUID: pJqBHQzbpX-WtSCMaFxAJsZz9syDYA0r
X-Authority-Analysis: v=2.4 cv=Lv4HWXdc c=1 sm=1 tr=0 ts=6ab64d4b cx=c_pps
 a=kWDUzu7Sg0boEHrzbzcNEA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=mDV3o1hIAAAA:8 a=PYnjg3YJAAAA:8 a=8r2qhXULAAAA:8 a=xNf9USuDAAAA:8
 a=fxJcL_dCAAAA:8 a=t7CeM3EgAAAA:8 a=koS_CkKyrU6iBq9c7OQA:9
 a=7jqKeCjk4K9AMwHj:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8gvLZcY7Nlvl4CGD_6nf:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ObmvtD6WMDJ6O4cpRQe4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfXzMEGfuNZf+sH
 jvzy78ym5NeP/vFcx7hS9u7lDfMzWLNVJr9ykjYqrEnLo9DTGqMfzpo9DnYtSiDZI0vz1XQtlPU
 dmplofG+Gv5x5BOVFl+EACCV04JP951XFzFNfAX5bx2MRMnLpHlpd5zNw89/YYXD2uN7+se8mNl
 HApi5qrm06BuTmXHuDm8i8HRTH/iqvvaCKUlvWtFAbzUYFLCl+kKqHcEwFre6qjUhUC0qy6FALg
 xVTI1gOO4tzelgPxzoowvmJr0LVayYpgEkRIEI5s7QLhUyqNv2BJ+GD83ADmac5zconptcNFAj9
 8jsMAwadimAMB0K7HM/pMN9q4Sh/QJ4eN8E9u2/e15PxjJnY9mepcCV5LEGHWIpuhv3BdzsBekW
 plpLoea6qYo85xV0yvdlKRtjBaBlYQ0I2JOaoWMVtpCeBtlbPP2AacTTC+yUR56OjRLxILrkzAh
 qPDpnkpkeYjTZD0A6cQ==
X-Proofpoint-GUID: pJqBHQzbpX-WtSCMaFxAJsZz9syDYA0r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX8UzzRPfOfGlW
 bb+5NVbDu+c2Avfhx/3O43LPS/B9jMGcm4yelJ4THJ97qbkZBd1wuov6935X6gI+plTbFS6UB1f
 bPJoII+7u2W1tG3pTgeckfVKot0fWxoaMKVuLDwH6Dzyy+wq4mkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250041
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 68P535i82499881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 10:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246613

GNU Wget does not validate the IP address provided by an FTP PASV respons=
e while operating in FTP passive mode.
A malicious FTP server, or an HTTP server that redirects to an FTP URL, c=
an exploit this behavior to redirect
Wget=E2=80=99s data connection to an arbitrary IP address and port.This a=
llows an attacker to forge server-side requests
(SSRF) from the machine running Wget, potentially accessing localhost ser=
vices or internal network resources.

Backport patch to fix CVE-2026-15146.
https://cgit.git.savannah.gnu.org/cgit/wget.git/commit/?id=3D4f85853f6418=
63d5915786a8413e1a213726a62b

Ptest Result
DURATION: 17
END: /usr/lib/wget/ptest
2026-09-25T10:26
STOP: ptest-runner
TOTAL: 1 FAIL: 0

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-15146
  https://www.cve.org/CVERecord?id=3DCVE-2026-15146
  https://security-tracker.debian.org/tracker/CVE-2026-15146
  https://ubuntu.com/security/CVE-2026-15146

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 .../wget/wget/CVE-2026-15146.patch            | 126 ++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-15146.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-15146.patch b/meta/=
recipes-extended/wget/wget/CVE-2026-15146.patch
new file mode 100644
index 0000000000..5d8d1a898e
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-15146.patch
@@ -0,0 +1,126 @@
+From 4f85853f641863d5915786a8413e1a213726a62b Mon Sep 17 00:00:00 2001
+From: Acts1631 <acts1631kjv@proton.me>
+Date: Sun, 5 Jul 2026 17:22:55 -0400
+Subject: ftp: validate PASV/LPSV response address against control connec=
tion
+ peer
+
+* src/ftp-basic.c (ftp_pasv): Reject if peer address doesn't match adver=
tised
+  address,
+  (ftp_lpsv): Likewise.
+
+ftp_pasv() and ftp_lpsv() copied the IP address and port advertised in
+the server's 227 response without checking that it matched the peer
+of the control connection.  A malicious or compromised FTP server
+could therefore direct wget's data connection to an arbitrary host and
+port of its choosing (e.g. an internal service unreachable from the
+attacker directly), which is a server-side request forgery.
+
+ftp_epsv() was already safe since it only extracts a port and reuses
+the pre-filled control-connection address.
+
+Fix ftp_pasv() and ftp_lpsv() the same way: capture the control
+connection's peer address via socket_ip_address() before parsing the
+response, and reject the response (FTPINVPASV) if the parsed address
+does not match.
+
+Verified with a fake FTP server that returns a PASV response pointing
+at a different loopback address (127.0.0.2 instead of the real peer
+127.0.0.1): before the fix wget connects to the spoofed address, after
+the fix it rejects the response with "Cannot parse PASV response."
+Legitimate transfers using a correctly-addressed PASV response
+continue to work.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-15146
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/wget.g=
it/commit/?id=3D4f85853f641863d5915786a8413e1a213726a62b]
+
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/ftp-basic.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/src/ftp-basic.c b/src/ftp-basic.c
+index 4870256a..0f4bb821 100644
+--- a/src/ftp-basic.c
++++ b/src/ftp-basic.c
+@@ -623,10 +623,19 @@ ftp_pasv (int csock, ip_address *addr, int *port)
+   int nwritten, i;
+   uerr_t err;
+   unsigned char tmp[6];
++  ip_address peer_addr;
+=20
+   assert (addr !=3D NULL);
+   assert (port !=3D NULL);
+=20
++  /* Remember who we are talking to on the control connection, so that
++     the address returned in the PASV response can be checked below.
++     Accepting an arbitrary server-supplied address would let a
++     malicious FTP server redirect our data connection to any host of
++     its choosing (SSRF).  */
++  if (!socket_ip_address (csock, &peer_addr, ENDPOINT_PEER))
++    return FTPINVPASV;
++
+   xzero (*addr);
+=20
+   /* Form the request.  */
+@@ -677,6 +686,16 @@ ftp_pasv (int csock, ip_address *addr, int *port)
+   memcpy (IP_INADDR_DATA (addr), tmp, 4);
+   *port =3D ((tmp[4] << 8) & 0xff00) + tmp[5];
+=20
++  /* Reject the response if the advertised address does not match the
++     control connection's peer.  */
++  if (peer_addr.family !=3D AF_INET
++      || memcmp (IP_INADDR_DATA (addr), IP_INADDR_DATA (&peer_addr), 4)=
 !=3D 0)
++    {
++      xzero (*addr);
++      *port =3D 0;
++      return FTPINVPASV;
++    }
++
+   return FTPOK;
+ }
+=20
+@@ -692,10 +711,19 @@ ftp_lpsv (int csock, ip_address *addr, int *port)
+   uerr_t err;
+   unsigned char tmp[16];
+   unsigned char tmpprt[2];
++  ip_address peer_addr;
+=20
+   assert (addr !=3D NULL);
+   assert (port !=3D NULL);
+=20
++  /* Remember who we are talking to on the control connection, so that
++     the address returned in the LPSV response can be checked below.
++     Accepting an arbitrary server-supplied address would let a
++     malicious FTP server redirect our data connection to any host of
++     its choosing (SSRF).  */
++  if (!socket_ip_address (csock, &peer_addr, ENDPOINT_PEER))
++    return FTPINVPASV;
++
+   xzero (*addr);
+=20
+   /* Form the request.  */
+@@ -842,6 +870,18 @@ ftp_lpsv (int csock, ip_address *addr, int *port)
+       DEBUGP (("*port is: %d\n", *port));
+     }
+=20
++  /* Reject the response if the advertised address does not match the
++     control connection's peer.  */
++  if (peer_addr.family !=3D addr->family
++      || memcmp (IP_INADDR_DATA (addr), IP_INADDR_DATA (&peer_addr),
++                 af =3D=3D 4 ? 4 : 16) !=3D 0)
++    {
++      xzero (*addr);
++      *port =3D 0;
++      xfree (respline);
++      return FTPINVPASV;
++    }
++
+   xfree (respline);
+   return FTPOK;
+ }
+--=20
+cgit v1.3
+
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-ext=
ended/wget/wget_1.25.0.bb
index 51ef1d485e..91e998ea2f 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -25,6 +25,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-58471.patch \
            file://CVE-2026-16599.patch \
            file://run-ptest \
+           file://CVE-2026-15146.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdce=
db726ac9d0da3784"
--=20
2.40.0


