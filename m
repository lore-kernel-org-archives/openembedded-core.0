Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E07FCD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 08:47:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149407.1781599621604862429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 01:47:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=NjbpmfGa;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=06273c465f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65cct3060923
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 01:47:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=CrOFwg2JcGigbXd34w7YXOepoVf2RfIfeIgfUf4zsNs=; b=NjbpmfGaDbbq
	3TOFKPmM83o9LC/c2PV53itBtcsNUmjiwCzbvBNvjCZeBfd0teTFV4aX4k8EnCgj
	W0ocpxfNX2rvgL5KVTpEP8PtyBvgDGaymDgIOVQzY63Bbzk4NtqiHBHYGwKG+t3M
	T4cIMraivgM0wYsxPQz7We75qWVT7HtOZRrybCSOBXs6klnHLEm4+MZOeB4ZCme0
	8dt2lRRSpSlAIz+MCFPRu7qCi8Ik6C8tWe880TrFS7p/DBlJSktvvbB7rvsWaIkv
	W739qoIrk5jm3g5BqRqEuJDL9dNijfWBebZYXVAUrZrZIltCWIcopO2ACrK6t7HY
	WT1Vx/V3Vg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013055.outbound.protection.outlook.com [40.93.196.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es6qdv0ka-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 01:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPb+KKYti93N8+5b3KRB1raNaxQLf4qZd3dKYPP7nEjFHA8VuRprkptA4EdXamhjIDqHqDt8X+YiKN8VwMVfmzG2cvsoNBUcytIEmtA6mItXE6H4S4omtDf16nB7kj1Zmi1FrK0MI23uaeUREoW4e8LGO09HsTBhYy3dno8iAs9XsI1ELNkx9JPQqSr3XTWFgVUGy/jACh29uYCTfTzbhqAxno0T26yAeJTSB508YJJ6G6UFYlOenpDauxxjBx8uuYFR8spajE36dNgG/fDDrVUaI6j4AWUSQ1baw0zGEoLadOYUjL6KZ+/DdF7Bfw71k9yBy7T9oE80cAI6DaSdvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CrOFwg2JcGigbXd34w7YXOepoVf2RfIfeIgfUf4zsNs=;
 b=PLVo1BSNEX2t/yn1SSH1fdAF7Ga97XrmUPIyNCIRsVnR688fzjJbYZTHxy62BLHMtC1EsZd3aF6n/IAvQ743Uds0APPKz3rvIiXpWkjUPujomjvYyymxk79gisK4fuQ98BWY27Lp+ZSjpuDVHt9qDRsN73nx5PGCjr5x709X1s08yhvuXFSMhxvyEg6U+R5qDRx0tPXCCT9cMBCSP4kVBoiRwAwWVPkGzHKIoBpTtUrTtjzvldp2cH2XEkMp3ePKr5RWfXwDl1h/FC12yh/4Hqk9lFIurIbsPWYt5JuzHWkXual6+jRbwxgJ77f/sLkKU5LIpCK6sMM4Gwyvsgh8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 08:46:58 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:46:58 +0000
Message-ID: <3d5c27d1-873e-4de8-a147-a8e90e9ec685@windriver.com>
Date: Tue, 16 Jun 2026 16:46:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] strace: upgrade 5.19 -> 7.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <cover.1779349122.git.liezhi.yang@windriver.com>
 <805b80291449f0ce4ce4b278786f80326434d3b2.1779349122.git.liezhi.yang@windriver.com>
 <6e75c9801b521bb5a711f6ac403c7cb549aed492.camel@linuxfoundation.org>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <6e75c9801b521bb5a711f6ac403c7cb549aed492.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SEWP216CA0017.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::14) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 67733777-89be-467e-1e98-08decb83d315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|11063799006|4143699003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	VIxb4NsGxUA+UAaIRBw0Gl/4G7mUdSvWqJBB++ntvbNILk9imeuKhzYtWiX193jDIjzqDPgYte0ApaL8X6YLMb2MCCoYFVzSpHCspUCz4aQowIhKQGR+CI+Tl/qZANb9JVoMWFTnvQaRxD9PELodKvO/iEgguIagTab2pHpdlVb3Ln1RNHf3zLMhdNFdt7U1PyBxbYrKCqLkD6h9ztHSD5RSwrZFJ1RoaRW14JHyzdZv2otv7GEJuEkmATOB8QwNx69hmTdZ4fGD239AjQOmGi9VbtRojrurbZ5nCzEKV+z6PcpmiW2a2hA3bit4MydPfa6PGvfITEtW6XOyVnG0AeookuazGKU5F85xhQIeZT5AK7tOvBz3gmePuORB2s0xpR6EY4WoJMD11GS4io0TDbMUfi3tY6XPjTjn/yh6404NeOmF/hMBp3qKTAxLCcNq9x80MbYhtv4lD3XVHNuZlUJaqT1LW2xhd3pWJIKmL5+PGcyd0buIckg2f3T//dMbmTaPiFBFTBZ4ylRdhZipHH9ViyQFGjhJ794xBTmb3ASLmfiGIIONoLKRdkrXhrXM3pjh1DizQdymjTHCTisxiRD1csqALBatHpDYZG1xtqOXtJTQKP3Xh2Foe5goahExis7eJ2G7a/HOUWPCkj6mk/QAHHBMeTaKkhLcUae8JQYa4OmtFc0vFkHXQJ/2FzmD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(11063799006)(4143699003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UVozTkJ1YmNkS3V2ME5heVE1VlR1LzhpNFF0S2J0dTIycUorcDREOTVOV09X?=
 =?utf-8?B?TTgrQkplTVUyaEhNUmtRUE9WOGp2RkJ6NDM5eHVObWc1eTMyQXZVeXFOMlI4?=
 =?utf-8?B?SFNZcVNVazdoL0J4WnRxbHZSaFphTEpxdndxejZaZ0xFTnhNbGRORzRqcnFQ?=
 =?utf-8?B?R1UzV0lySFNUK3YzM1F4MEdGeDVtNDAwS2RTS1dtNGh5SUEwSURjQkl2NDZh?=
 =?utf-8?B?NTlIRHEvNkxQZUNHSXpJREY4U2Z0M0ZWNHlqazlZVW00TnBudlRLSWhGYTBE?=
 =?utf-8?B?dGxyNU1TcURPMEtaRGRuMVNmNTNyOEsrQjZpV0J5dFJPcUlDNjNadmZWS0dr?=
 =?utf-8?B?R0NpQjNlMi92a3l0SnFHTndZV1NJRDFsRUE4WGU5ZXRRMTBYNkw4aTBPaC9N?=
 =?utf-8?B?eEFmVWpXMzF0dzhEaHgwZlJvMUZWNzhzZUFiZUh0d3JtdFMvemYzc1AvL0NH?=
 =?utf-8?B?MWVHQnF6SGxqeWNOVjBReGt3amlMaVN1NWF2TS80elFRSlJzdGxQWHo1VTlM?=
 =?utf-8?B?dDdLd0xYUXJwRlkwaFFHdUVlS1gwekFOVm5GVkdiczZRcUJGTTZ4MndKQlJW?=
 =?utf-8?B?cFIwWDZ3VVgxQmROVjQ3SkZtbm0vQW1iQTdZSUhNMWI1S2t6S3lJWkxSQWJY?=
 =?utf-8?B?L2FEMGhSV3UwRmlZOVBrd1RUUWhPSUgya2NqOE9EcGxZK1REVHY3YWdxR3F6?=
 =?utf-8?B?N2w2dzkzMkFEZ1k3Z1RNMjFTOVhGZG5ENEdwM3VwbWtJem9kbytWSUtlL2Ri?=
 =?utf-8?B?eHRTcngxb3NyS1J2cUhxVGxmQkY3cVFvdndra3dXeS9rY2dzZmh2MnFhMWt6?=
 =?utf-8?B?SDZhYy8xa3RjRUxnNHowUkxYdDIxL0ZrTjZwTU5CaUlrWFV0NXQzcEY0aFFn?=
 =?utf-8?B?bDJ2S2xIc3JxQnlTWjVyUW81ckJlL2RGR09CUDBQcHMrQ3l3NGN0WGd1MHdX?=
 =?utf-8?B?UDc3RTlHNXg2djJyZHE0Z0tDTk81YUZSeDZZSG84M2hoWE1ueGNxVnpLeXZQ?=
 =?utf-8?B?WkgrbWlxRmQySnZNdEd6Uk1nMjQ2RkpsemJ2SkRkakt4R2RqT2RjanB6K3lo?=
 =?utf-8?B?cXhUVGcxdCtjb1VhWXZXekcxRDFLaWZKTGZUVWZXWFlORGMwMkxJdGJMNTNH?=
 =?utf-8?B?eTRqKzRWUWU2VzFFdFlMT3BQTTlJbTNlbjBlaFlBdU1xdWJGTUppd2JxVmZP?=
 =?utf-8?B?MGtEZFVXZFIzOXNtM2lGWWIwVFg2SUJ3TFRGcUhyZkN2ZmRFcnoySit4L0kw?=
 =?utf-8?B?OG5DZEQ0dmVtNElRdGowQ216Z3l4V2pKaEVlRWFkYVNlSEJFS2lWL28wRlVy?=
 =?utf-8?B?ZWNGNDMrdkU3Q0JnVzBtSUdEQllsbmt3N0NHbkRhOTZmSEFDTjBRbzl6QXdP?=
 =?utf-8?B?SjBXOUQrUW9obm5QODJNNFo5SDN5THkrQ3BQWHlSV2VBdE5uZUVrdTkvOUR2?=
 =?utf-8?B?QjF5MmF0d0lxUnZFd2Y0SkdMazN6MjU2M2VMZlZSakVVRHRTWjJ6V2lqdDNx?=
 =?utf-8?B?aGNxc3FuVGc3QXN0TWlJYXVUUlRGcjdqQzFNRlFpenE4VWNMMGdjdUJMbUMz?=
 =?utf-8?B?WmRrYXJvVWdyQW9WZ2duVmtDajhUeUd6SlZyQkNpbzUrQjJRY3NWTXcvdTZO?=
 =?utf-8?B?YmJ3M0xsakRFZEZUdGtKNHFjMG5FWm9hWDcrU2xzMk52M3NPdjM4N213MUFS?=
 =?utf-8?B?UEF6K0R4Qld6YmwvMUNCb3dIZngySzhNOXpsT2Vpa0pjRXBGK0x0WS9weWJX?=
 =?utf-8?B?VkNnYzZ5NnIyQlN6RVp1MktxZDFWenM2ZWFybi9lblNPdlRLVmp5eXlMRHpV?=
 =?utf-8?B?WUxjQTFLblZTL2hxL3Q2ZGhBelBFOHcydmsvakova0c4SHBDaFNhTUgxU1hE?=
 =?utf-8?B?dXlxdGNLUlhpMWJReGpPbkI1ZDVMVldXTC9UNkVJMFlIME9VNVNKaU1pREdO?=
 =?utf-8?B?M2ltUzRQWVg1MUJyWW15ZjFyb3lRMXlUOG9nN0dheG9iR2V5SzEraUNHWjZK?=
 =?utf-8?B?RlV0NGVtUjkxN0JxL3RxYkFCaWRZaTIwajNpY1N1MkxDZVRITDB4cXNHcCs5?=
 =?utf-8?B?MFJPamNFRm54UkRUTHlnZnE0Rk04UVBSM1lZYitRNHBNeThlSjcvOE5tS282?=
 =?utf-8?B?cEErdyt5a3lCVmlTakJ6SHMvc01PZmdlempJWlNVQ3A4ZTZBNVpvQUJMSGs5?=
 =?utf-8?B?ZUJXc2ZzTElVWGpodUxHNlVmUnI0bEVrOXFPL0xpUWJNMHJtZ3I3SWFkTjNn?=
 =?utf-8?B?cUZ6U1pSZVgxVDJLQXFrb01pRmpXd2lYUVR3UThOZzZzb0l5MnhXUFlucFRR?=
 =?utf-8?B?L0NoSXR2a3ZmaWx2N1NQRWdCZ0Uzd0VVTXh5L2x4Qmh4UldDc2JDSXc4aDZV?=
 =?utf-8?Q?zQ4rME+xdxreN1Ts=3D?=
X-Exchange-RoutingPolicyChecked: 
	L9dFTEuJKg4qIHW+4djybv6VQhnZbHOXuyYgym1tYFyHMVLvhOc9Q7MLmxEXWCCROiuddfd5JTkYKGo/kV1tm8qhnAHN0p+tP+ivm3nRQ4pyJ2qpjbLwdtU6UcmbjblSmnc3rehDNdFNdDWGTroDqIlFJuDK6Gx+DfOQcPMgc0lOP3ZA6hgb/fwvCAER3wRJLy8O/4uDEdYfhTusR/s5kgaYlsnfz+1mivzZMihjXdhZgYuVK9KgiE1fN5XNC1IaOXmUg5kf6cwEWUUgIOpJxL794M30+5wumjdcNI1FlFjS3Fg+6pDqVCG5ua4Sk1rkuWArZj33EGdUaLK7DBH/BQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67733777-89be-467e-1e98-08decb83d315
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:46:57.9197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUpuGq3g5owz5ZcLa6J0YO09Kmjvq1YQqzO1Q7i9ODQEmdNu1erTphfbXkKwNC9o/XhF8KqeqxPU+YsC91XLWX0OqN9li3j1B0568x3p/cQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=DLq/JSNb c=1 sm=1 tr=0 ts=6a310d85 cx=c_pps
 a=E5oZx+PGEUUM7Gb8cE5EWQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=9_vostdtSnoxh-66c6MA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: V-2j3zmxyghUujxuNlk6vH-p5QeE-UVn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA4NyBTYWx0ZWRfX0HOrSWKElYqL
 cMjA0YvNWJUNeNRNmMcAgEF/tw8rXLDdBHejlnxGXeG5/sXzBgiLphV968NOPXx/OTa2ATC7jdG
 DuQ8X8RFCrt/J0DwBXQSSb9V2xmp8f6aRHFIA+vXd55KvqZQV/iaguOJ9ZUVoCFCUzwxX00wstM
 ufQf2Hh2BL6b0j+HLdb0VUk6khAqrN2xtHU+ehbtcdIlr2X99EQvDFd3n7emiFjlMWd6ZAOJqJG
 CnjhnVenfnYZON5puQZS38jNDdcdzWw3Tgne1m/7PVZcIpBOaXtRtmipmn0azPQ9C5kXz5hYu1V
 yTw9qWbU8IFvzFus05UdpigL7vqq5TOZAb5YxU8vvcKLuAJtYzFB4qh8JabEcm6kMoLWYFw0h+b
 VSK2js18vOufCAxgqUi0gy6TozGRgOlbZlVY7Qv+YME5HygBPcGuppwx89eX8hjcQb9YB2/WnBf
 sxX5W5w5opwsVBBI+/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA4NyBTYWx0ZWRfX/BE3MI0dMTah
 kdwPtleV7CVCF+/Np2bMlKimRuzFz4NvAp4n5CVMK5M85CdRx3IVjBRJBH+iWCkpw5+7uYj0Rkr
 CJpDJRq+YPyznadxJz2JbQ94/qXJEMKQpMQxMY4ra/wUxr/TXtwn
X-Proofpoint-ORIG-GUID: Li0lCRMRzAuFTn9HCLTlNDYf8sbhNRWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160087
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 65G65cct3060923
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 08:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238881

Hi RP,

On 5/28/26 21:13, Richard Purdie wrote:
> On Thu, 2026-05-21 at 00:46 -0700, Robert Yang via lists.openembedded.o=
rg wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> * Remove strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch, AUH =
has
>>  =C2=A0 copied it to the files directory.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  =C2=A0...gnore-pwritev-pwrite64-tests-on-musl.patch | 16 ++++++++----
>>  =C2=A0...toconf-macro-to-detect-largefile-sup.patch |=C2=A0 4 +--
>>  =C2=A0...kport-ax_prog_cc_for_build.m4-macros.patch |=C2=A0 2 +-
>>  =C2=A0...001-strace-fix-reproducibilty-issues.patch |=C2=A0 2 +-
>>  =C2=A0...002-tests-Replace-off64_t-with-off_t.patch |=C2=A0 2 +-
>>  =C2=A0.../strace/strace/Makefile-ptest.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 ++---
>>  =C2=A0.../strace/strace/ptest-spacesave.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +-
>>  =C2=A0.../strace/strace/skip-bpf.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 +++++++++++++------
>>  =C2=A0.../strace/strace/skip-load.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>>  =C2=A0.../strace/strace/update-gawk-paths.patch=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
>>  =C2=A0.../strace/{strace_6.19.bb =3D> strace_7.0.bb}=C2=A0 |=C2=A0 6 =
+----
>>  =C2=A011 files changed, 40 insertions(+), 29 deletions(-)
>>  =C2=A0rename meta/recipes-devtools/strace/{strace =3D> files}/0001-Ig=
nore-pwritev-pwrite64-tests-on-musl.patch (78%)
>>  =C2=A0rename meta/recipes-devtools/strace/{strace_6.19.bb =3D> strace=
_7.0.bb} (93%)
>>
>> diff --git a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-p=
write64-tests-on-musl.patch b/meta/recipes-devtools/strace/files/0001-Ign=
ore-pwritev-pwrite64-tests-on-musl.patch
>> similarity index 78%
>> rename from meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pw=
rite64-tests-on-musl.patch
>> rename to meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrit=
e64-tests-on-musl.patch
>> index f21f68001f..d19533854c 100644
>> --- a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64=
-tests-on-musl.patch
>=20
> This is still moving one of the patches into files/ which isn't desired=
!

This is because the 0001-Ignore-pwritev-pwrite64-tests-on-musl.patch is a
conditional patch:

SRC_URI:append:libc-musl =3D "\
            file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "

So the devtool won't copy it into workspace, then bb.utils.which() can't =
find it
, and will return the last section in FILESPATH which is strace/files, I =
can't
a regular way to fix it because that's how the bb.utils.which() and local=
path
works. But there a workaround, add the following line to the recipe can f=
ix the
problem:

FILESPATH .=3D ":${FILE_DIRNAME}/${BPN}"

I will send a V4 for it.


// Robert

>=20
> Cheers,
>=20
> Richard


