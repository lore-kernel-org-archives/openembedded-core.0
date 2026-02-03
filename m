Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1535DE87834
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 14:04:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17168.1770127450340620242
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 06:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=sAA5WfHN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6494b3a7c5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613B02kg1683699
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Feb 2026 06:04:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cYNB4diwx57eepLfgn2UcB2sx2uiG1a8PCc6lfKGWCY=; b=
	sAA5WfHNA6kOqNiSbGwUL/P3aITNwVVpA6Z+2xGkOHEvOKNadxLKYjt/cxaNxTDk
	fANHqaZ82h4QshRVAWh4COm/VNXOL9tRXAh4v4vJFRmXOSPD275CvVXwRtDaZuZq
	Pdlw2oQJF4t3d0/yQRkTE6D2bXvyBYGlPkKCaqLhIVl9wDL7cba7hBSCMs30yBaa
	eOeYfoHkHpsCZy5RVSCSXQF7FmuFNXnd6oWlNjxSb4kh6AryB2eGBVmic4SUDJla
	H5d/EFYgS0lXP7rssOfLqBm5YAWvuh+TYToukWJLwGCdqKuOuoGwlL0259L09rrY
	ObC+/sulyQ6nf3JENfRogw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010013.outbound.protection.outlook.com [52.101.193.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c1dw0u6e1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 06:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSbFli7lOl4hmlGXPl60iKGTWuTn1iiX03UQm77aWwsrFXD6Ld99YWT/5HLl24Orw26BazY7NG+R4XAWYUCsIuoWss1rEeeSLfB9/pU3oSJ6wPKCxd2MWLHg5jI/D6KPZ3otqJxImKILi+fu/Zcp2gw4FkhumUgocI8JfT8cY7T9AI4sBzZSuy9blIzw8SMjvTuBeUVZEjePdVeC1BkYLoooia33zY6UXTRuqsRcPwHuhloeYp+VtWjePAy+9WG6KVrnZin+UgAKS9qaPzBivwkFHXZ1Pc6NjSfC3Zs2KmNT8Yb9f5bsgNV1YAPBec+QumftLrtmwZkmFnVqUCnjzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYNB4diwx57eepLfgn2UcB2sx2uiG1a8PCc6lfKGWCY=;
 b=ZNQAGz16B2Fnj+1l21HWOcYjaaVEBVOpE+Q2Gxic1o5p968k+L/QCH3hihQAhiiVryBhskcwipeOmYxYRpa4+OjeK+ZKWl1vWYren6K5cLQBR9/xeOntVh20bTw8zaSZvoNSh/xHZaACCD6C1Sw15CrcLndmtNFZR8SEWc8umhHh8/kOWiKPfkdkXcoZwFI0R2IMTbB/jya59a41RbJ5Q6bRy9adeWl5/CPLlDkU5F1GP0+9arRu1Z7V+iukDYh8zIqADW5r/8Mfl3DfzP8/+or1SK1b8GjpBzXYHCoNOnRt/pg6XZNyMpuSaIGE/wfP1U68pZ5u08OIWPWHRErtgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH3PPF1618AF7BB.namprd11.prod.outlook.com (2603:10b6:518:1::d0a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:04:04 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.9564.010; Tue, 3 Feb 2026
 14:04:04 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [RFC 3/4] oeqa/selftest/clang: Add selftest for Clang/LLVM/LLD
Date: Tue,  3 Feb 2026 06:03:27 -0800
Message-ID: <20260203140337.1971735-4-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
References: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH3PPF1618AF7BB:EE_
X-MS-Office365-Filtering-Correlation-Id: 509ac944-04e4-4531-b7f7-08de632d163e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmVEZm5FbmVIL0xNa0swY1RnUmgwSGRvYWxhMXhrTHRIQk1aVGwyTWlhVk5P?=
 =?utf-8?B?aTRIVEY3WFAyZTllcVpDSXRSWUdUNlVnQmREa2RjTlIybEhMV25RQndkTWtF?=
 =?utf-8?B?QjU4TzJaOXNNTGk1eHMzMWlvS3IxcURXNUZ2Z01sRUJzQTFabFhUQW90eTlW?=
 =?utf-8?B?NHFROFkyMzhBZitlbGNBZEl6WmllM3Q5cDJnNUFlVVdiQVoxSHhEWGlUUnV3?=
 =?utf-8?B?QkltMzlJZi9jcG1KeXRnOHVVa2EyVkM1RjhvRU95T1Q4QnFwKzNnb005Wjdl?=
 =?utf-8?B?bHBBRHhEY3BubTk5LytMdENwYzlNYmNlaVdEYm5uYlFkbGNWdHBMWkQxelBQ?=
 =?utf-8?B?c3k1YnB6bWpFMmJqUjhHMWJ6dDFJSWFOeDVqQXZIS0JGN2tiRVZKNjRjTzlh?=
 =?utf-8?B?T1VsRUVVMzFSdC9mcWxzZTRuSi92NmVwZmhrMFh2eGhBZzhXWmx6d0hZWWVl?=
 =?utf-8?B?U0xjalhRNUxQWlJvTUlOZDZyQkl6T0laZktvTzg0VXJ4eE9TQ0I3a1JNY0NZ?=
 =?utf-8?B?SU9MYkRQWmt2czlJVk5VbCt4OWFjYWZNVmJodXRCN0puZUI4bGhmalVpb0R2?=
 =?utf-8?B?M0lEbTFwSmp4aXFhZlJZK3VGbGh1SzExM3FLTFIwZ29jSm9uaUtxc01wcU52?=
 =?utf-8?B?TWExZ0hORUpVcWljeVNmRFQ2NlNrZzB5Y2VvemFSUTZHdGNJaGI3VWEvTzJQ?=
 =?utf-8?B?YVh4ZER5aWJaNVpESk9KNkgyYjM4enR4OXVxQnhoM29zYjhTTDJSRnVLNmJz?=
 =?utf-8?B?RFd5bW90TUtBNTdQUTZ4SWpvbmNYMWJkQW1ZR2hURGtqcWJ1N3o5QWQxMW5w?=
 =?utf-8?B?VmNrL0dVR251YjBzcFZON0xyYUFzaWR0SDRyZWJwdkVNa01IT0wyYlNiaXZn?=
 =?utf-8?B?bVZzOVZHcGRhSk41WkxTTnhtR3luVHFzUnMzcW92Y1BsV05tdnBpbUdndWFI?=
 =?utf-8?B?SGlEcEhNdUlzTyswQUR6VXhIQ0lBcTZOTlByQjJzK3NGS3U4RnlyWWhlT09M?=
 =?utf-8?B?SlBTa2JuNUNqL2hQeVcwMThBSXdZMlArTUtGUVRMUzRTR1ZvajBheTd6V1dQ?=
 =?utf-8?B?dWczdWFSMGsrWEhXZm5ocW9LNmc2cmdldGZLdFhGWmMxSnIrYU43NVJpTGg5?=
 =?utf-8?B?RHdnUE5BbTcrVCs3U1laUU9xSWdkSmVCMHlLcy8zNkVDd0xsRHlpdmk2WCtk?=
 =?utf-8?B?YTBKMHpaYXJGU0lQT1hjK09icFRVL3R4b253VHpENEo5UXVXT0wwbGlHZUIy?=
 =?utf-8?B?Y3RyMmd0K3hnZnFWTmx4c29ndTIwQnVWTjZmUExZODVxMnFNTFNxY3ZWMzg4?=
 =?utf-8?B?YUlERFlkYnRTZWE3NTc5UW5kdUcxQUk4VG9iSnJKTG5HRW1vS1dqMW1rMHBy?=
 =?utf-8?B?YUVOZm1oWGk4L3ZyelRlQTlTM2ZwaXFrV20yTzA1dTMrWml5M1dwUEV6TUc5?=
 =?utf-8?B?MWdGYlB1QlJiMVA1VkFYV2owUCtxVXJFZDhubWEzNVZyc080WkxIZGVzNmpD?=
 =?utf-8?B?ZU96N2ZudU03NEF0aUllMGh1aEE0TDRCRVNtL2g1YjdqY2w1Mmd0cU10Z1RB?=
 =?utf-8?B?NDVlbWh4dG9CQVNINW5yUnFnYTFqY29qS0k0akZySkoyOVZMc1BCZEtaRUJO?=
 =?utf-8?B?S0UxbXc3NjZCem1uOUlLdmpQdlErK3MyY21xbmVIY09HcXBIY1AwRmdHczVU?=
 =?utf-8?B?Nm8ySkxXQkFGYmZUU3Z6dFlrd0hMOEEvQ3gwOVFxS1pGUWwzcWdyZThNRTQ5?=
 =?utf-8?B?clNiTFNxUDE0UEMzUTRwazNPeDlqeFlWSUx4L092T3RNTHpLTk5vTHNheElx?=
 =?utf-8?B?QXFYWVV5OXJqUUlNMkJTUFlTNnZVZXhpK0hQMGw5V2UxY0kxTHlkdzlMUUsw?=
 =?utf-8?B?ekdJT290UEk5MVlNdGFHR2lYZFlRQnIvQlExRlduUFd0MENWVHoyS1p2alJu?=
 =?utf-8?B?RjduSHNuWDFYOWVoR2xsa2wrRmFNZnI3UnBDQ21LTityeUVITjcvOFhzdnRI?=
 =?utf-8?B?bGY4VmRRR2dsZlZiTzdwemY1U3Y4TlBUMVdiTjRPemc5RTVxY0xpVE5BQlJV?=
 =?utf-8?B?MUhkRXdGL0tGT0JYaXU0elYwbStOTG9WNmlHWHl0d2Nkc25Ba1VHeW00bTNx?=
 =?utf-8?B?aDRPNTJhZWlWYTY5Z0FwdzY5d3hCUnhHQ1Mxak8yYmViVEgzdTZpajNKdlhK?=
 =?utf-8?Q?5qHg3qcWl5xZ+oBulwCkoFM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlpOTGsxdE9ycXU1NjRmMXVKbGcxOTlHTFdNRGFMVDk4eGd5RnZaTmQxS01Z?=
 =?utf-8?B?UFNjaFFBY1Q4cUl0cHpRaTdTQUY4amFpOU9zYTVWNjZTL3BLZkl4aFFlS0d6?=
 =?utf-8?B?REdqYjcyZ2wzbm1tQXp4WUdCdDFkWmF5cExrZDl5YkhpUkpma04yZG9seWJY?=
 =?utf-8?B?bXF2Ly9INWF0dXRpc2JDcWkrU001UW4zVGFjWEkwSWh2dlN0NW9GUVRvd2t4?=
 =?utf-8?B?dzRXcU83NElOVThZNnlPOWtlZk0rY2RjZTBTYmluNUszcGNYV2FzdmZKS3N4?=
 =?utf-8?B?Q0lmVU1YQS9xSlR0ajc5dWdpRGY5bzJhSDZqZTZKa0NIczVoWStoZkZML0ZX?=
 =?utf-8?B?M0NwcUpvc1RzcXNqVG9zaSt5M2hwVW1zTCtlcmFXbnp2TmxTMklYMGVxL3Nt?=
 =?utf-8?B?ZFBSQlA0bGVwRVovVWtVTi9hNkVWbmw1TG8vRE9idDVGYTZtV0RLbkxWaFVU?=
 =?utf-8?B?MmFOUlk5V3pMNS80bWlaejFiMXl4T1JxUEpnSE5ReWtQRlN1U1FUTXFDWjFJ?=
 =?utf-8?B?VGR5WlRTc3hvQmgyNHdHK0dhL0JwNnluTkdaaUpsWkMwalVNWUdKU3ZkVkV1?=
 =?utf-8?B?RUcvdDE0cDBRYWpETUNRVDBxMXZyblVobll0NVRPcWw3VE12RVFYbEJyZmhY?=
 =?utf-8?B?QkowOVdMQk5qTHlrNUNKdC8xU3RkNk15R25rK0NRejFRdWZVeWhyVWNjWTcy?=
 =?utf-8?B?QnQ4cjVSWktzQm1wVFVnSXJva0xHL2pKOURFREVhN21LVzdNajRrVGwvRjBz?=
 =?utf-8?B?TnczS2JVU3pEbHFmZGZPWUIvd3g0dURyV1VLbUJRM3NQTS9lVWd1RmtVVUZ6?=
 =?utf-8?B?cUJJRDZTWDRKUG96ZlNRbHE3aUkzOXkzVTRFdm83NFZIQjVmcTJpeHJxRkkr?=
 =?utf-8?B?Rk1Gd1RUdjZMSGJ1L0NmK0lxN1pSRG1XR0dpY0dqVEJ0SzQ5Q2krNEdKMnB1?=
 =?utf-8?B?aVJMYStaLytQa3JBS0NudFNlY09HdVlJSWE4VmJURFEzRUlEVTNaTXRoc0pQ?=
 =?utf-8?B?WW5WcUpwdStDTjc5NWd0OGtiR2lvRytLQUlvRWZSY1RCSHZhR2ZNaks0VnRy?=
 =?utf-8?B?SlNDaDR2ZERoSFRHcjdMZ01kREs2UWU2NXBJc3lKTCtXMFlvVCtmNjUwclU2?=
 =?utf-8?B?amZMb245bytDelRYT2dGTDdJNVVoaXJGZk1NQ2RjMDR4Z3dQaXZvMVNwL2RS?=
 =?utf-8?B?WHgzQmJvR2txeEpJRDNOb1NVdWhvcWt3MllEaW1WV2pqWDRycUxQSkpXUlJB?=
 =?utf-8?B?WEcyNjJyYVZXME51QW9TSWpWTXI4VzUxN0VNQno5QkdCV1FBL2JET3hpVFpT?=
 =?utf-8?B?K0F0VlhETDZ2ZmJMNTExNWNFd1p4NGxaN1h0bE9UeS9HNC9aNFZTdnFCaGp4?=
 =?utf-8?B?cXlabDVleFM3MzBqbU5qUVhZUGh3QmlYcEVpN3JiK1VCam5WWkdQZmtXQ2xQ?=
 =?utf-8?B?cUFTa1NvcHA1SnhMa0ZTWjdFQkxOUTNMekZwQ2x3R2cza29kOEdSYk8yTCsw?=
 =?utf-8?B?REc0ckVEdWRoRi9EdlZFL3NlVzlIVzlFUFdNR25LZlNVbWVWR29IRWE1bXd2?=
 =?utf-8?B?cjVjZXdwNm1KNHJIdXVvK2RjUEw4RHlyL2I4UnBEWGtzRFpMM1FZZ3R0allM?=
 =?utf-8?B?WWkrR3NQMXlPQTlLZm1QKyt3WTJabVE1MlhxODRtVWNYZktPV3ZKeEJySUMz?=
 =?utf-8?B?dGZrc1Q4dzFJbFpNU1BNMElaeFdrbHlIV3BhSlFHREdRU0ErT3hNTmxBeW9E?=
 =?utf-8?B?NG9ZT3BhTWdiNkdsdUxSVEJDeUpRcm9leUZMWFR0aVVZOUVQdkQyVkNscHZt?=
 =?utf-8?B?TEVsR09jWU1jQ0pGVnZXM01lQ0t6aGRnMTlUT3l6Mks4NVorb1JRcTZBaFli?=
 =?utf-8?B?OHdqbU9JbG1EcWxrRWYxT1l2ZzArNGxnNS9IMFlISkJrTE4xRE83bGJkR3gr?=
 =?utf-8?B?MzlOQUxkWDFSM081TDZOZDNxbDJLV0JPbVJleWVHVzF6WStFWmcxL00xYk4v?=
 =?utf-8?B?VkN1Ri9CZkR6Z3hwOTM5MnQyWFcyVnluVkRSNG5vd20xMHhqeWozamJRTXN4?=
 =?utf-8?B?amtJTGc3b1hmSVB2SUlvT2lKRmdxQktYSmpwVUd1RFBJUmp5RUVrbC93M3pv?=
 =?utf-8?B?OGRmS1R2TElleU96Z2Q1WmdrWCt2MmxiZFNYOWkyeFpyUlpoLzBmY2lXSmRh?=
 =?utf-8?B?QnAxWjFWc1JiUmdpODBtY3NTQkpIZGxCV2xiYlFFY1YzbXVadUk1SG9rRTdh?=
 =?utf-8?B?ajMzaHhqVWJJZUZ3di9yMTJ5Y0ZtSnIyWTNPRS8yR1FQd3V3TUFQYmRmb1NO?=
 =?utf-8?B?clllczlJU0JZN0tKcGhBVWN3RXUyZ0hRK2psMHZlZjk3L1JpMFpndDBUamdp?=
 =?utf-8?Q?iROozkHoZedpeRQL2Z8sU77Bee0qaXj5W8w1r?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 509ac944-04e4-4531-b7f7-08de632d163e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:04:03.2211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9mFjOT3D6KyGl8x+i+uoBHn6Xb93I706rYe0YAEtiJj9SjldcuPYbT4cXa05lBL6ZW2j6A3cSz/iX8XlCtbcifhRFD8lTZpsTGvBM4Lgl8j5cjhz0irMJU5QsUIXACNh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1618AF7BB
X-Proofpoint-GUID: 2GXFGW3J5Q69oZZc2GMTqTdbjk3IIorR
X-Proofpoint-ORIG-GUID: 2GXFGW3J5Q69oZZc2GMTqTdbjk3IIorR
X-Authority-Analysis: v=2.4 cv=Htd72kTS c=1 sm=1 tr=0 ts=69820059 cx=c_pps
 a=N2Bp1sGBA0q5hqNMPvyVyQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=SQQGA60Wx8lJcxWaSqYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDExMiBTYWx0ZWRfX/j6uYdWqmese
 dmvjLxix42C9fGVd2/PFDZ5coKEkiGBMcw/PTdODivDxanflhlXpo6xr8wUmaMwdi54w4vSysZ3
 tqTBCk5lipxDk1/dL1yW0B66FTUZYLEE7Dy0RIiLOoXq6wWB1Vw3AGUlTCoHvGTUCXb5tqD08TL
 BfrL9WM1ZGJAXW1HwE/rYKQBXg26Lqr5HUaDrjvKf7w40Rl8Aac4KTiIHzF31fMquiUXiVGgNz1
 tW8jS6U/LW2NSPqQ2amQHSf4roXxK4k6611gXyTMOWn4wrL9oJMTo0H/wiYHrQEeAxRbReEoDJX
 TO1/EK1Ig6eHFrPzVc/lJxfn+a8XSD//wnhcBcRzv9HHw/VsA80NjY9yCPWxQXuTMqrcMJj9/Vx
 y+xdDnXfluYWb5KwGdjKGQFPs4qapOtJzwF+KGvex4j0lLGCanFKyMe5n5K677yoLdKc2OAmykE
 uhYXw+lpH4zKXE4SwYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030112
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 613B02kg1683699
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 14:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230456

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Add selftests to validate LLVM, Clang, and LLD test suites using
llvm-lit for both native and target builds.

The tests cover:
    - Native llvm, clang, and lld using llvm-lit
    - Target-side execution under QEMU via NFS using llvm-lit
    - Architecture and OS-specific test filtering
    - Known failing test exclusions

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/clang.py | 301 ++++++++++++++++++++++++++
 1 file changed, 301 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py

diff --git a/meta/lib/oeqa/selftest/cases/clang.py b/meta/lib/oeqa/selfte=
st/cases/clang.py
new file mode 100644
index 0000000000..a13bb8eae2
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/clang.py
@@ -0,0 +1,301 @@
+#
+# Copyright (c) 2026 by Wind River Systems, Inc.
+#
+# SPDX-License-Identifier: MIT
+#
+import time
+import contextlib
+import subprocess
+from oeqa.core.decorator import OETestTag
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu
+from oeqa.utils.nfs import unfs_server
+
+class ClangFamilyBase(OESelftestTestCase):
+
+    ALL_ARCHS =3D [
+        "aarch64", "arm", "i386", "x86_64", "x86",
+        "mips", "riscv", "riscv64", "ppc", "ppc64",
+        "hexagon", "sparc", "sparcv9", "msp430",
+        "loongarch"
+    ]
+
+    EXCLUDE_OS =3D [
+        "Mac", "macho", "Darwin", "OSX", "wasm",
+        "Windows", "Win", "MinGW", "COFF", "zos",
+        "FreeBSD", "aix", "fuchsia", "ve"
+    ]
+
+class ClangFamilyNativeSelfTest(ClangFamilyBase):
+
+    def test_clang_family_native(self):
+        recipes =3D ["llvm-native", "clang-native", "lld-native"]
+        host_arch =3D get_bb_var("HOST_ARCH")
+
+        for recipe in recipes:
+            bitbake(recipe)
+            workdir =3D get_bb_var("WORKDIR", recipe)
+            build_dir =3D get_bb_var("B", recipe)
+            staging_dir_native =3D get_bb_var("STAGING_DIR_NATIVE")
+            test_dir =3D f"{build_dir}/test"
+            result_log =3D f"{workdir}/temp/{recipe}-results.log"
+            result_sum =3D f"{workdir}/temp/tests.sum"
+            lit_bin =3D f"{build_dir}/bin/llvm-lit"
+            arches =3D [a for a in self.ALL_ARCHS if a !=3D host_arch]
+            filter_out =3D "|".join(arches + self.EXCLUDE_OS)
+            env =3D os.environ.copy()
+            env["LD_LIBRARY_PATH"] =3D f"{build_dir}/lib:{staging_dir_na=
tive}/usr/lib:{env.get('LD_LIBRARY_PATH', '')}"
+
+            cmd =3D f"{lit_bin} --filter-out '{filter_out}' '{test_dir}'=
 -o '{result_log}'"
+
+            with open(result_sum, "w") as f:
+                try:
+                    subprocess.run(cmd, shell=3DTrue, check=3DTrue, env=3D=
env, stdout=3Df)
+                except subprocess.CalledProcessError as e:
+                    raise AssertionError(
+                        f"{recipe} llvm-lit failed =E2=80=94 see {result=
_log} for details"
+                    )
+
+class ClangFamilyTargetBase(ClangFamilyBase):
+
+    DEFAULT_PACKAGES =3D [
+        "bash",
+        "libgcc",
+        "libstdc++",
+        "llvm",
+        "python3",
+        "python3-core",
+        "python3-modules",
+        "nfs-utils",
+        "grep",
+        "sed",
+        "findutils",
+        "cpio",
+        "which",
+    ]
+
+    def setUp(self):
+        super().setUp()
+        self.target_arch =3D get_bb_var("TARGET_ARCH")
+        self.tmpdir =3D get_bb_var("TMPDIR")
+        arches =3D [a for a in self.ALL_ARCHS if a !=3D self.target_arch=
]
+        self.filter_out =3D "|".join(arches + self.EXCLUDE_OS)
+
+    def build_core_image(self):
+        features =3D [
+            'IMAGE_FEATURES +=3D "ssh-server-openssh"',
+            'CORE_IMAGE_EXTRA_INSTALL +=3D "{}"'.format(" ".join(self.DE=
FAULT_PACKAGES))
+        ]
+        self.write_config("\n".join(features))
+        bitbake("core-image-minimal")
+
+    def start_qemu_nfs(self):
+        ctx =3D contextlib.ExitStack()
+        s =3D ctx.__enter__()
+        nfsport, mountport =3D s.enter_context(unfs_server(self.tmpdir, =
udp=3DFalse))
+        qemu =3D s.enter_context(
+            runqemu("core-image-minimal", runqemuparams=3D"nographic", q=
emuparams=3D"-m 2048")
+        )
+
+        status, _ =3D qemu.run("uname")
+        if status !=3D 0:
+            raise AssertionError("QEMU SSH check failed")
+
+        status, _ =3D qemu.run(f"mkdir -p {self.tmpdir}")
+        if status !=3D 0:
+            raise AssertionError("Failed to create TMPDIR on target")
+
+        mountcmd =3D (
+            f"mount -o noac,nfsvers=3D3,port=3D{nfsport},mountport=3D{mo=
untport} "
+            f"\"{qemu.server_ip}:{self.tmpdir}\" \"{self.tmpdir}\""
+        )
+        status, output =3D qemu.run(mountcmd)
+        if status !=3D 0:
+            raise AssertionError(f"NFS mount failed: {output}")
+        return ctx, qemu
+
+    def run_llvm_lit(self, recipe, extra_filter=3DNone, timeout=3DNone):
+        build_dir =3D get_bb_var("B", recipe)
+        workdir =3D get_bb_var("WORKDIR", recipe)
+        lit_bin =3D f"{build_dir}/bin/llvm-lit"
+        test_dir =3D f"{build_dir}/test"
+        guest_result =3D f"/tmp/{recipe}-target-results.json"
+        host_result =3D f"{workdir}/{recipe}-target-results.log"
+
+        filter_regex =3D self.filter_out
+        if extra_filter:
+            filter_regex +=3D "|" + "|".join(extra_filter)
+
+        cmd =3D (
+             f"cd {build_dir}/bin && "
+             f"python3 ./llvm-lit --filter-out '{filter_regex}' ../test =
-o {guest_result}"
+        )
+
+        return cmd, guest_result, host_result
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLVMSelfTestSystemEmulated(ClangFamilyTargetBase):
+
+    LLVM_EXTRA_EXCLUDE =3D [
+        "BugPoint/compile-custom\\.ll$",
+        "BugPoint/replace-funcs-with-null\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice-absolute-md\\.ll$",
+        "CodeGen/AMDGPU/lds-run-twice\\.ll$",
+        "CodeGen/Generic/fp128-math-libcalls\\.ll$",
+        "CodeGen/Thumb/2009-08-20-ISelBug\\.ll$",
+        "CodeGen/Thumb/2010-07-15-debugOrdering\\.ll$",
+        "CodeGen/Thumb/2014-06-10-thumb1-ldst-opt-bug\\.ll$",
+        "CodeGen/Thumb/PR17309\\.ll$",
+        "CodeGen/Thumb/dyn-stackalloc\\.ll$",
+        "CodeGen/Thumb/frame-access\\.ll$",
+        "CodeGen/Thumb/ldm-merge-call\\.ll$",
+        "CodeGen/Thumb/pop\\.ll$",
+        "CodeGen/Thumb/pr35836\\.ll$",
+        "CodeGen/Thumb/pr35836_2\\.ll$",
+        "CodeGen/Thumb/smul_fix\\.ll$",
+        "CodeGen/Thumb/stack-guard-xo\\.ll$",
+        "CodeGen/Thumb/stm-deprecated\\.ll$",
+        "CodeGen/Thumb/stm-merge\\.ll$",
+        "CodeGen/Thumb/thumb-ldm\\.ll$",
+        "CodeGen/Thumb/ucmp\\.ll$",
+        "CodeGen/Thumb/vargs\\.ll$",
+        "CodeGen/Thumb2/2009-08-21-PostRAKill4\\.ll$",
+        "CodeGen/Thumb2/2009-09-01-PostRAProlog\\.ll$",
+        "CodeGen/Thumb2/constant-islands\\.ll$",
+        "CodeGen/Thumb2/ldr-str-imm12\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-1\\.ll$",
+        "CodeGen/Thumb2/pacbti-m-varargs-2\\.ll$",
+        "CodeGen/Thumb2/thumb2-ldm\\.ll$",
+        "Other/spirv-sim/.*",
+        "Transforms/LoopLoadElim/.*",
+        "tools/llvm-cgdata/merge-combined-funcmap-hashtree\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-concat\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-double\\.test$",
+        "tools/llvm-cgdata/merge-funcmap-single\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-concat\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-double\\.test$",
+        "tools/llvm-cgdata/merge-hashtree-single\\.test$",
+        "tools/llvm-locstats/locstats\\.ll$",
+        "tools/llvm-locstats/no_scope_bytes\\.ll$",
+        "tools/llvm-objcopy/ELF/basic-binary-copy\\.test$",
+        "tools/llvm-objcopy/ELF/binary-first-seg-offset-zero\\.test$",
+        "tools/llvm-objcopy/ELF/binary-no-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-paddr\\.test$",
+        "tools/llvm-objcopy/ELF/binary-segment-layout\\.test$",
+        "tools/llvm-objcopy/ELF/check-addr-offset-align-binary\\.test$",
+        "tools/llvm-objcopy/ELF/dump-section\\.test$",
+        "tools/llvm-objcopy/ELF/gap-fill\\.test$",
+        "tools/llvm-objcopy/ELF/pad-to\\.test$",
+        "tools/llvm-objcopy/ELF/parent-loop-check\\.test$",
+        "tools/llvm-objcopy/ELF/strip-all-gnu\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-keep\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections-only-section\\.test$",
+        "tools/llvm-objcopy/ELF/strip-sections\\.test$",
+        "tools/llvm-objcopy/ELF/update-section\\.test$",
+        "tools/llvm-original-di-preservation/basic\\.test$",
+        "tools/opt-viewer/.*",
+        "tools/UpdateTestChecks/.*",
+        "tools/yaml2obj/ELF/custom-fill\\.yaml$",
+        "tools/yaml2obj/ELF/header-elfdatanone\\.yaml$",
+        "tools/yaml2obj/ELF/header-sh-fields\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-end\\.yaml$",
+        "tools/yaml2obj/GOFF/GOFF-header-settings\\.yaml$",
+    ]
+
+    def test_llvm(self):
+        bitbake("llvm")
+        self.build_core_image()
+        ctx, qemu =3D self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result =3D self.run_llvm_lit(
+                "llvm", extra_filter=3Dself.LLVM_EXTRA_EXCLUDE
+            )
+            status, output =3D qemu.run(cmd, timeout=3D3600)
+            if status !=3D 0:
+                raise AssertionError(f"llvm-lit failed for LLVM: {output=
}")
+            status, _ =3D qemu.run(f"cp {guest_result} {host_result}")
+            if status !=3D 0:
+                raise AssertionError("Failed to copy LLVM lit results ba=
ck to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class ClangSelfTestSystemEmulated(ClangFamilyTargetBase):
+
+    CLANG_EXTRA_EXCLUDE =3D [
+        "APINotes/yaml-roundtrip-2\\.test$",
+        "APINotes/yaml-roundtrip\\.test$",
+        "Analysis/dead-stores\\.c$",
+        "Analysis/exploded-graph-rewriter/.*",
+        "Analysis/scan-build/cxx-name\\.test$",
+        "Analysis/scan-build/deduplication\\.test$",
+        "Analysis/scan-build/exclude_directories\\.test$",
+        "Analysis/scan-build/help\\.test$",
+        "Analysis/scan-build/html_output\\.test$",
+        "Analysis/scan-build/plist_html_output\\.test$",
+        "Analysis/scan-build/plist_output\\.test$",
+        "Analysis/scan-build/rebuild_index/rebuild_index\\.test$",
+        "Analysis/scan-build/silence-core-checkers\\.test$",
+        "Analysis/virtualcall-fixits\\.cpp$",
+        "ClangScanDeps/module.*",
+        "ClangScanDeps/multiple-commands\\.c$",
+        "ClangScanDeps/optimize-vfs-edgecases\\.m$",
+        "ClangScanDeps/optimize-vfs-pch\\.m$",
+        "ClangScanDeps/visible-modules\\.c$",
+        "ClangScanDeps/Wsystem-headers-in-module\\.c$",
+        "Format/docs_updated\\.test$",
+        "Interpreter/cxx20-modules\\.cppm$",
+        "Modules/double-quotes\\.m$",
+        "Modules/framework-public-includes-private\\.m$",
+        "Modules/implicit-module-header-maps\\.cpp$",
+        "Preprocessor/header-search-crash\\.c$",
+        "Preprocessor/headermap-rel\\.c$",
+        "Preprocessor/headermap-rel2\\.c$",
+        "Preprocessor/include-header-missing-in-framework-with-headermap=
\\.c$",
+        "Preprocessor/search-path-usage\\.m$",
+    ]
+
+    def test_clang(self):
+        bitbake("clang")
+        self.build_core_image()
+        ctx, qemu =3D self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result =3D self.run_llvm_lit(
+                "clang", extra_filter=3Dself.CLANG_EXTRA_EXCLUDE
+            )
+            status, output =3D qemu.run(cmd, timeout=3D3600)
+            if status !=3D 0:
+                raise AssertionError(f"llvm-lit failed for Clang: {outpu=
t}")
+            status, _ =3D qemu.run(f"cp {guest_result} {host_result}")
+            if status !=3D 0:
+                raise AssertionError("Failed to copy Clang lit results b=
ack to host")
+
+@OETestTag("toolchain-system")
+@OETestTag("toolchain-user")
+@OETestTag("runqemu")
+class LLDSelfTestSystemEmulated(ClangFamilyTargetBase):
+
+    LLD_EXTRA_EXCLUDE =3D [
+        "ELF/fill-trap\\.s$",
+        "ELF/oformat-binary-ttext\\.s$",
+        "ELF/oformat-binary\\.s$",
+        "ELF/partition-synthetic-sections\\.s$",
+        "ELF/reproduce\\.s$",
+    ]
+
+    def test_lld(self):
+        bitbake("lld")
+        self.build_core_image()
+        ctx, qemu =3D self.start_qemu_nfs()
+        with ctx:
+            cmd, guest_result, host_result =3D self.run_llvm_lit(
+                "lld", extra_filter=3Dself.LLD_EXTRA_EXCLUDE
+            )
+            status, output =3D qemu.run(cmd, timeout=3D3600)
+            if status !=3D 0:
+                raise AssertionError(f"llvm-lit failed for LLD: {output}=
")
+            status, _ =3D qemu.run(f"cp {guest_result} {host_result}")
+            if status !=3D 0:
+                raise AssertionError("Failed to copy LLD lit results bac=
k to host")
--=20
2.49.0


