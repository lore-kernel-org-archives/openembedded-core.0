Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0766CD37AC
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 01:41:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4331.1778290917370382548
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 18:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Hxnj5A3W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9589ca456d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6490vjIC4159157
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 18:41:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0JopuUo5FpXtCFa7SbfBzGRweZEMbHS/IqLkgoQNk7g=; b=
	Hxnj5A3WZq/dkqWt9qluoka8RsFJRAyeNRzPMTKxRYfYb6DZ4q+93DpK6lhsStxY
	bhryhjD7VNsf4bt8s6QbfCt7xwGxs3xOEFq0mBzx8HMPMKBAEWV0wpeGJyeZHwfo
	AVriVJugbuFrkCvkWsu2vNFrQcouUvDuVcQp3bWz8al5t6bedbxBcXzQCet2/inm
	WQgtmCu7WoDhafhDxq5aMFWjUPjmH8pxXfHuII4jQjcc304j3WJu+vRINFPc2eXt
	TW8wYgUwcFumdB4flCtX53JxBRiN3KWabWnAJdT77oVsyj3QdtmtxyaHsqI46zWn
	HMiJ9m2G5oQXIfo8/abDHg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013049.outbound.protection.outlook.com [40.93.201.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1hkmgntw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 18:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQce6TFCFBwhRaDeKzANOKPX31v1SNni6AVHi71LxLbRi9jPrlHEdgYyZOunNSKB3QfwgPagSZLY9FRVURQ5vbjP8vnRNWr8T2hibuxrAT9QnwpFmdz9gTxsFLkzyTQlHqmm3fOkshITT1KjsONHJXigg3at1t2HIKwy6220JSS9rXQj9e6BLY/Ekb3gSA5ebliDBFIvZplAxsf3BDqrCidu3XKXesJQON89ktzJ4oBptT3PfcpwO170ptVCUMRo0tWhT4cnSOECX9/r2kBKbE4OqL36TpLr1r5k8iTKMm+5D15FByZzeDmgjTDcFLEVJ5nnmM5DuTgWD+FM7oZHEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JopuUo5FpXtCFa7SbfBzGRweZEMbHS/IqLkgoQNk7g=;
 b=nfVfLpFRN3ju5STz0BpkglkkKMVGF0j3Q0YtmGahHYNklCnt81YbzYpkwoGdHyuMG40zIO8nqgMf0TUCFum2CTWVp71drEh42pSJemxdYRLrC/M/UAYlifBLNmldJ5Dytkbpv4sVsxOA4T0sOQSUxmRfccT7uGWkNrpTt1HgYe4Dc0i3rN3AtegZQObtG+adZHjI3AzUaMD/RhDus/aNXSxJBeParBYcCSUbO+ZIiERXnKXKvSbAOyfDFpg/IaQBWJH6RpHCxI+b4+qoIysx+NU2tCuRnP0SLGzSgcXPSCM1jcVdjBCC9y2cmqbEXRM7xibj8Dz6WxLpAstvfPqBgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA1PR11MB7131.namprd11.prod.outlook.com (2603:10b6:806:2b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Sat, 9 May
 2026 01:41:54 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 01:41:53 +0000
Message-ID: <db7385e4-6c92-42d7-8526-ce6192b7f775@windriver.com>
Date: Sat, 9 May 2026 09:41:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Pseudo abort issue on ubuntu 26.04
To: paul@pbarker.dev, Richard Purdie <richard.purdie@linuxfoundation.org>,
        "mark.hatle@kernel.crashing.org" <mark.hatle@kernel.crashing.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
References: <DS0PR11MB7312D96BD98C4D7FAD8D2BD6823D2@DS0PR11MB7312.namprd11.prod.outlook.com>
 <0aa707e8222442434bf9361242653873931b9af3.camel@pbarker.dev>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <0aa707e8222442434bf9361242653873931b9af3.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TY4P286CA0107.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA1PR11MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5a2de0-98b4-4a0b-1905-08dead6c259f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|3023799003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	M6bvKv3e8vcsQ6IsHykRF6ZjvuGbsp8osYBKhERCCFlF7gH+7gIICo/yL0ew/LAdoscSAPXJNJkKtV9EbJ5HybeyhYGtx23Vln+fPy8llWWvufyjovVgvbjDl3OoTgCjAhlyKnOmM15RSutWtTve7frTB/hKnZMj9QGwNHcaqac9ferFKss8z9cbWfc3hhC0bD3L/QWFUocO5Kb8/IOnhtA3jIslcyQgTMMHFzd+XggqE7GyvuVsH51+rjiRcQtlycIk1L5ANHdd1qzYddtjUE4SZSe2jakb6EMYRfSoWByrWT93sIS1EKXXeIoXSCseoiwoO9NI89jwaKgptuhLOLNgF5cRoKTcn9jwbgXgShryQxvOHGTfklw4k+2Rdf8F7W2DZnkXeVDiQk7ATwE7hGp2SyyBH/cm+92H0NNYUzY2Zetzyvy8Q5EVFduiriQoGCLq9ldWXiqBeq6F0+gOW4arouIELEDJEzCDK6SG9Zn5k2yZs3+SBtpgP719umhIw5PQ2R8CpvRioyZbikSEGMbIotayC9NtPRcmLL4k+KcrPzLcU8Z0WDujzQi+eQf8sGW1Hw++FpFCKLRxBZpNgIKHvDQjP8voB68VMNan/OEsAan7VmPFpJen7BgaaScOWJ1u7VRavrtQ2bG8Lxs1GA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(3023799003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U2h1TFZSRFYvUnJVWFVHNUpyVzJ1bXZkRFdyQnY0alJhTW0raWpVaGNKWnZn?=
 =?utf-8?B?YUh0eDNMWlcvaG82d2hYbkFJbG9ka1A4bWdZQ1FFMXlLRzlIWlBDaVFPWmZS?=
 =?utf-8?B?NnFZcC9RdEhRVFVJbWJlODIwZnhjZDN3bEw4ZE4wVnNlMnlZN1lLRzVDcjRm?=
 =?utf-8?B?bC9kYXh0RDgwOEpNYnY5aHhZd2NKYTdMK1VVTnZVa0VVWkdzbTRROHZYZWNq?=
 =?utf-8?B?U2tuSnlnTmpqMmZ6RjZneTRic3hFdWcwOUJMbU1RZXFISWE0bUYrNGwwenM1?=
 =?utf-8?B?Tzd1bS9KdVpGQmJzd1ROWVRIWVhhQmVYaFFKWGlzWnZFdGxjdlF0ZVlMMURo?=
 =?utf-8?B?SWkzN3ZJVmJkVWF3b3ZEVWJPeXJYT1paWGg1cThXY3Z6NUZSbWY0a2liVnhR?=
 =?utf-8?B?RVVTMjhzd0lOWWQvWFBDVTEvVTlyMmw2QWx4ZU4wM0xPT1ZRTzF5Z1QwMFE5?=
 =?utf-8?B?NHczOXQzVTc5YWRMbzNSc0hRUm1oL1hkMGlqVUhUL2dXVE1hODlxN0dBU05R?=
 =?utf-8?B?czBTZGdPdXhiRzRCd1JWeXp4OEpYa2tWNndLZ21HMkFmZjZReUNGTk1zODBv?=
 =?utf-8?B?MEdGdE5MRFMxdnNpNldzcWlxK0MwVlkvRUNreXJURTk5N3Z4NjBVTVEyK3Rz?=
 =?utf-8?B?UHVOZ09WbTczM1AvaURHb0JIVEZmbGRGd3huMTV1dUdkckNxbEJSb2dLYk9r?=
 =?utf-8?B?S2Zmc3IycmRNZ2RjWmlZV1FiclYwbEFDeGNOM3VFVEc2dlVDa0ZJWHZ6VjFv?=
 =?utf-8?B?aFZOU0hldWRGWE1uVGhnNkV2bHMwMUF4TU5UTmJ5YmdJa2dXMDdWNW5oWm1L?=
 =?utf-8?B?V0gxZ3o0bktSYTJvMGo5TllZeTYxZDVKUWpVYlBDdlNvL1Y1bmNNM3FRMUI5?=
 =?utf-8?B?WllSUGlQNzE3dU5VZWpBTUhsSHVlSWFjOGVHdlFOSEttMDNWejR1SXB2UldX?=
 =?utf-8?B?a0N1YzBQQXQxOWJmSWxxbVkyNmp4OHc1UmVvaVZmMWkwV1NpaCtsQWVVUE1y?=
 =?utf-8?B?WmxVM1BuZFFMWWFiRlM4WWl6ajZjaC9DcXBLLzY2OVFCSG53U0d5RTlSYmpZ?=
 =?utf-8?B?UjNxMElkeVZsSWt4YSsyMERMRkRwNEYxYW0zNmxZUS9sM1FqYkVYRk4vS3N5?=
 =?utf-8?B?cmRCMFhzUWFvZitkczhHaWZEMmV3L1NOenc4UUNqTEpkcEdtMUlQeXg0czl6?=
 =?utf-8?B?QXFpc21ITmlnQTQwOC9WdUVTQmhLVmR1dFdaTGtPUWhXRE0zN0Q0eHA4dlhp?=
 =?utf-8?B?UjFWeXk5dU80ck8rdXJEL3k1QUQ5Ti9RWWhJNXJVWStxSDJMdW5qdkR4VTZY?=
 =?utf-8?B?dVlDWXMva3pDVHZBakhsRWwwM3FXcFU1WmR2V1RSM053alpvYVdac0xxZW1D?=
 =?utf-8?B?MFFDNGRKQ1pEYjc0Q1QrU0NRM3V5eHJkRnJKd3NsTjJWdXZlVkE2aFFzeGZt?=
 =?utf-8?B?bENZM2pJWGJtMHJ2UTdDQmtuME4rWW5ZRlFJMmtTZitQNWJ1QlQweHdzV0R2?=
 =?utf-8?B?bkd2NVlyeEIwdWxtZTR4dVFlc3I1SStOT2lwODA3ektCc1Q3eDNnRHdmZW9o?=
 =?utf-8?B?RXJTckZtSXpNNE1QN3NGZXlXNERiWUZvVGFVdURWTGNVa0lDOEx3QmtMcE1l?=
 =?utf-8?B?QVQ0ZjJCNHVIS1VtUUdEMEk1bk9xWWg3aWJZN0VLR3MrclJMN0pTVXVreU5v?=
 =?utf-8?B?M0xCdW5NMHluZHhSZ3dWOVhYcEJ6Q3hCOHBlcUo0azNGR1NUZFNteEFiN1dG?=
 =?utf-8?B?a1UrMGdWRk5WUU1wZnkrYnZRS3grNTZSZ2VvNTlISkJhWm9Odi92RWlVc0hF?=
 =?utf-8?B?M241c0gwTmVPRDhnZTEwSERmN0VOYk9CVG5WSVR0VXhqSnVqNE1hYzY4VVk1?=
 =?utf-8?B?dzNDS09GQXdESVNoZ0lhTlBQTjVGa085TVJTMG9kY0lUMmc3bHdVU0labFFC?=
 =?utf-8?B?TTBDcnZESDcxRjRCSXpmT1ZDcDVnZlJtcEJJTVZWSGo2MHpxb1YxbE9FK2lq?=
 =?utf-8?B?NDdTc2NSV3NKbGt4QmVYSXIrR2pTd000ZjVmcUR3OWRiK09SQXhiR3hpRFZ3?=
 =?utf-8?B?RDg5aEFHVGpRaDJFVkw5ZzNPLzc5WFdneitvVG5HcEVCT2VzUUx6RFdySGFo?=
 =?utf-8?B?cU0vL3JhVDZGeDlxRkowejlYTGZwV1A0SzJoU3AxZXUxYnN6bmJHOGdSNlJS?=
 =?utf-8?B?bmJZM1Rwekc5eVMwdThyQTAvZ1J5ZmhPdjhtS2xrb09qTk5TQkhWTEtGTTlx?=
 =?utf-8?B?amJ1M0xWcFd1eEN2dlRZNTN2aWx2eGRWTmtXNXpNZWdISVY5S0NCcnBCaklH?=
 =?utf-8?B?eWYzRHEzUEJyMWVDQlJvaDVTMFVOMkYxSDMzbVZ2R2gvQVJZMzdOUWFXRkkr?=
 =?utf-8?Q?9GjsRwY7rFYj0XkQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	YBQDl7Lb61QoHRZpg/n0PN8To5/CkNZWhtWB8C15wM+SBTyBZELNNTku0BS1s2DiqAIfcQRqPeTFelk7bLP8spdK7u4MTY6DapksHg7BSv84YU5sPMfKiFY6F6B79MyhkqZYQVZxwVyWBYe0FIa16t31LK+7XExTWBtU2idW+I1v8aTBZd1PFZuOL6+OYbPOHARJaAjVKjLJN1TIpBOuLL0lLqK53i8a/45YM4WPhEvW4Okdezr6UmsA11KjcH7D8rdhU3Idv6ZIlDRdRnaLntQZVbTC3JmKhrwQER/sEeKTJPG8jK8htwWcrELpay3vxuoeGO1LG/OXldXyhVkquQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5a2de0-98b4-4a0b-1905-08dead6c259f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 01:41:53.7028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XckNHS4L6jztrM4s/5vAuF5h1ddvhXM8ELVrHZiqUIh5518eGycC7SMrW7SVrLhi7+7Jlbz5YcBLLpMwqlZdEJ6gJDCq0Gg+2VAjzclolGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7131
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDAxNSBTYWx0ZWRfX/JTXdns4c0Pv
 IwCrf1KULLhN9z6C4xnaIpciZEQPuzKxypwvPjH0ueh1T8TxaS5d43pSt+4AxYrneZIJgClm25+
 6EtqAFEAZpTmPXmhmxI/3Ppy6KdXFXMyzWPxa+oWz2W0lXnpDViA7t2N+x3z+Lm8zOdogfvWMBp
 FYT1GKeUd3dPjOFvhC+ojg/m8dajdgKWpXFCgY0ZjmcSOjujFBrG/1YRyQzRzcqqKXSsa/+TejT
 7/Io42s35xjSqGmmSPk0IJg1RpprpZDXRINH7b5VktVOzCSdGrXanm3iYmcc07y98OqF33ziNOM
 s5oWYB8qZTYs8IXwc2p457sZI8Iv0LK/sk+5dkLv+SPbKl9p7yWOcGoi8MXQOabMmuuUAnB+rDl
 M1hDPSTe+aZbaYqxRXwVtyc/OOwJNto18pYv4H40UVIVsmmHQ4HwfKxazY9cgQSvVC/ETXU95UK
 2xKaLxqxv6w3q8qiXSg==
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69fe90e4 cx=c_pps
 a=onUmW/TBZy4T/WhMO3N4DQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=oMtIHeyGAAAA:20 a=X-pmbOGEAAAA:20 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=rey087cz1G5yhPwkir8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: CJ2kBNUt7tIBdWGWTXZtBoi0HmQ9tZ_g
X-Proofpoint-ORIG-GUID: O-TMibQee3lWqaZ1xXlaBdMgFdgbLINg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090015
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6490vjIC4159157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 01:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236750


On 5/8/26 22:58, Paul Barker via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2026-05-08 at 13:19 +0000, Changqing Li via
> lists.openembedded.org wrote:
>> Hi,
>>
>> I am trying to build project on ubuntu 26.04.  "bitbake postfix"  fail=
ed  at do_package since pseudo abort,   after doing  some search, it is c=
aused by ubtunu26.04's new change,  Ubuntu has officially begun transitio=
ning its core system utilities from the traditional GNU Coreutils (writte=
n in C) to uutils (a Rust-based rewrite).   I would like to seek some hel=
p,  could you give some advices about how we should handle this?  Thanks.
>>
>> Here is how  it happened:
>> * =E2=80=8E  In do_install stage:
>> There are  2 files target to installed under ${D}: (there are other fi=
les following this pattern)
>> ${D}/usr/libexec/postfix/smtp:     which is  mv from file under {S}, a=
nd then chmod
>> ${D}/usr/libexec/postfix/lmtp:      hardlink to ${D}/usr/libexec/postf=
ix/smtp
>>
>> With the old gnu coreutils:
>> when install smtp,   mv will call renameat2, which will finally callin=
g real syscall since the oldpath is under {S} which is not in PSEUDO_INCL=
UDE_PATHS.
>> then chmod call fchmodat,   then fchmodat wrapper will save an entry w=
ith uid 0 in files.db.   install lmtp will also insert an entry with uid =
0 in files.db
>>
>> With the new rust coreutils:
>> when install smtp,    the behavior of chmod is different,   statx get =
current mode,  rust chmod check the current mode  is the same as the targ=
et mode, then
>> fchmodat is never called, then smtp is not saved in files.db,  and thi=
s will also make install lmtp insert an entry with real uid like 25610  i=
n files.db since smtp is not found in files.db
>>
>> * =E2=80=8E  in do_package stage:
>>
>> Exception: subprocess.CalledProcessError: Command 'tar --exclude=3D./s=
ysroot-only -cf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux/postfix/3.1=
0.8/image -p -S . | tar -xf - -C /yocto/build/tmp/work/x86-64-v3-oe-linux=
/postfix/3.10.8/package' returned non-zero exit status 2.
>>
>> Subprocess output:
>> abort()ing pseudo client by server request. See https://wiki.yoctoproj=
ect.org/wiki/Pseudo_Abort for more details on this.
>> Check logfile: /buildarea1/cli10/yocto/build/tmp/work/x86-64-v3-oe-lin=
ux/postfix/3.10.8/pseudo//pseudo.log
>>
>> tar command may  call stat  for ${D}/usr/libexec/postfix/smtp,   since=
 the  we have a same inode entry in files.db for lmtp, above error report=
ed.
>>
>>
>> The key  issue is ${D}/usr/libexec/postfix/smtp is not inserted in fil=
es.db in do_install stage,  which will cause wrong uid for lmtp and  psed=
o abort in do_package stage.
>> I think we cannot change behavior of rust coreutils.   I am wondering =
even we patch postfix to not use hardlink, the pseudo abort issue may dis=
appear,  but since
>> chmod not call fchmodat,   we don't insert entries for these files,   =
maybe the uid etc is wrong in final image.
>>
>> [1] https://github.com/uutils/coreutils/blob/main/src/uu/chmod/src/chm=
od.rs
>> [2] https://github.com/coreutils/coreutils/blob/master/src/chmod.c
>> [3] https://lists.openembedded.org/g/openembedded-devel/topic/11921139=
7    // patch for build postfix with linux kernel 7.x
> Hi Changqing,
>
> The tar command failing with exit status 2 should be resolved by recent
> changes in pseudo. Which Yocto Project version are you using?

I use the latest master branch with pseudo 1.9.6.=C2=A0And this issue onl=
y=20
can reproduce with ubuntu26.04 with uutils installed.

ubuntu24.04 with gnu-coreutils=C2=A0 works well.

//Changqing


>
> Thanks,
>
> --
> Paul Barker
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#236725): https://lists.openembedded.org/g/openembed=
ded-core/message/236725
> Mute This Topic: https://lists.openembedded.org/mt/119214074/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

