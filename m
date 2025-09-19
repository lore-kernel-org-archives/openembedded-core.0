Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35ECCAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 09:03:15 +0000 (UTC)
Received: from esa13.fujitsucc.c3s2.iphmx.com (esa13.fujitsucc.c3s2.iphmx.com [68.232.156.96])
 by mx.groups.io with SMTP id smtpd.web10.12055.1758272583949192365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 02:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=D5nOPjVe;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=rjSunelZ;
 spf=neutral (domain: fujitsu.com, ip: 68.232.156.96, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1758272584; x=1789808584;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1adOuuow92afHn3PbnV6eWdU24tS+okobP0MYwgkLdU=;
  b=D5nOPjVe2K62dnsBsbtKjUFyi5aTJyR1ak1xcNErIdHwtKmmUrcHesI6
   OSrIJ3QhacqSfMXXfPVuvIMj/qm5neevM4rXOxZKDw0ADBYB57+HIPk69
   8FRObiSvpz2i+JyFCROIsmeNplZSzgXLG2zua0MWGxaf7dGRFDuH/+M4q
   tuwmCbSaK75V1E4DxFK+kYkgfIfdbO2JJUCaCCkcCJBHwE9FtIhjqdQeZ
   wey5xWftr1NC9KflYe+mujI0dWDlJHAVWruIBugPB/cjmrScp7seg7kx5
   otFzggyLlf3g7MlLGvn2Pe9sCJGVz7ZOUTeaZPBG8dE3ceQ8JvQtIvuhx
   w==;
X-CSE-ConnectionGUID: Ts52VJ9ITTub76yQOSt8Zg==
X-CSE-MsgGUID: SnanWk8NR+inB1EdoXV+1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="167917998"
X-IronPort-AV: E=Sophos;i="6.18,277,1751209200"; 
   d="scan'208";a="167917998"
Received: from mail-japanwestazon11011066.outbound.protection.outlook.com (HELO OS0P286CU010.outbound.protection.outlook.com) ([40.107.74.66])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 18:03:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfcH9KtvMUowUZEOUNF3y2plyfi2EPnplb3j2jcCMsaMykh7zD51nkfeGBBAkiAW3JRmjnLr6MEpFJb2o5BsQavGRDh/UwY816oifuw3SQZPaTMSsGcNi67e1H/CRFBUSe0L03dbDjMX9wuDltB4FUscCqnshIKUhMY6Mo7aR2IM4RRlhauwrXSaoxFSzQHJM4rdJU10e3r+82r1KniydF+mSmifu9OSWKq6aj4RrNd9QiMZpO3dvrTcx6UhN6+Gq9TH3RRmvnxY0PC7ZKgTOO/SLQKI0mklDmEs805kM4i/3IEp4NDl8f5HzVA/c53a+8FurjOD/+Bj65WVOJVPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1adOuuow92afHn3PbnV6eWdU24tS+okobP0MYwgkLdU=;
 b=Dwz9ICl/JWnLq5lmsBZpAIX3Beyh8RJlAP5+bqeXxzdTTfKAWlfiERK59ZjQa/Dn63tX9Iry+YVFhv9Fmi5jhPjZWkPzveWtvewqdB2ezUSnM/UM5lUus96CCIRqWLxI1SSW884eLsg/ytOnOauYOjrU9ZEPXCXC21wfAHKb5MI/qapOjPiScUB5gNcmymBA1TFL14FPF2tTD/YGtLw9YJhDbSe3v7OywocACtg4Zn7Cfg1jlA27hKEDf1va4iHo7ZOPhSp9xfNyte4UDt0CsNV2XEjpA7/wqRGtqm4QBNh2tG0QQLJDGIW4qxKGKQBpT5i0bgo7A7Qap2lpx3HbKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1adOuuow92afHn3PbnV6eWdU24tS+okobP0MYwgkLdU=;
 b=rjSunelZVCMu7shJK/tEBgelVfFJ7yjEruPEs8CdlC7L2+QaBbyVm2e/ScFgL2NSne8Usc+kJQCGjyyZQAw83+pgbka01VEmt4hTd6LdwSiJP2UjbQdlixHhF0DhDaGfF4bHM56dya9FTvviqPKfbuDozA2QOksuUahDATziS29D/yyyBcdH3Y5xpvAGwI3qoyjowr/AocDIKB4GAq5/SMoZG9rDPHhRovX5yapKrxAI2lLURA/C1XCSB3IsEUfOTVTbDSKj0pRimXwjp8zpVlCIeoKY5Yj6ybkusRG4VRx/OPEeCKWOjPDCbhAgMR5ZzxpigGJqcClPxe0YHDurfw==
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TY7PR01MB14405.jpnprd01.prod.outlook.com
 (2603:1096:405:23f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Fri, 19 Sep
 2025 09:02:58 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%7]) with mapi id 15.20.9137.015; Fri, 19 Sep 2025
 09:02:58 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: "mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 12/40] libdisplay-info: upgrade 0.2.0 -> 0.3.0
Thread-Topic: [OE-core] [PATCH 12/40] libdisplay-info: upgrade 0.2.0 -> 0.3.0
Thread-Index: AQHcIjOvwHaY1HF2SU2mo57OD1GKfLSMiyoAgA23/LA=
Date: Fri, 19 Sep 2025 09:02:58 +0000
Message-ID: 
 <TYWPR01MB118616ED67C84B013936B12B1DC11A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
 <20250910091646.998-12-wangmy@fujitsu.com>
 <DCP87HYRXEEP.FPUKTEDSBO5C@bootlin.com>
In-Reply-To: <DCP87HYRXEEP.FPUKTEDSBO5C@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9NjY4MmI1ZmEtOTAyYS00ODI5LWI0ZDQtYTMzYTczYWJl?=
 =?utf-8?B?NzVjO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTA5LTE5VDA5OjAwOjAzWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TY7PR01MB14405:EE_
x-ms-office365-filtering-correlation-id: a68c3612-383f-408e-b554-08ddf75b5456
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?K3Z4aXNzODNOaWFIWWtrUHpQdGl3R1ZVNDE4Q0RKclJSQ3U3UUxHTXVQWHRu?=
 =?utf-8?B?V0RKd0lCUE84cW11aU5MWGlETFYxM29aYmRZS3RGSzJCVUxQWWRPNmtESy9F?=
 =?utf-8?B?bnpWZ2t4MTJ5Nm9OR1NkNFBhazhDSXk5dW16dzFUYzA5TmhwdWJRNnJRczMv?=
 =?utf-8?B?Z2xKdEJuZEx4V3pUMU1CTkxzWTJ4YXEyRmFDbkxSeXZXSmhvdGMvN0wySFl3?=
 =?utf-8?B?UEx2MjEwMDVSQlozWC9JMlFEU21KaUNNTGJkYnZzbEppeVFPVFVrek5Bd3Zr?=
 =?utf-8?B?eGdFZ3dEQUNWNi9PY0JJdU1kWlIxL1phWWlXZFdXb2FsNGE2RWNTVE8xeFVz?=
 =?utf-8?B?d1M4Umh6MkRabEdqY1MwZ1J0NUd4TDJPZXkwcmVlcnZQcU1ySlA4QXJPNzNP?=
 =?utf-8?B?OTZtUlloQSs5cUI1VXQ1TDdsdUswWnFRNFMvQWhGWnRlUTFIejdqRnFLUEZy?=
 =?utf-8?B?dkxoQStzejBXZWkvU05wNHVCeUZXQXBnM1JyMmo4SGRvY09KMnBobUlTQ1ZH?=
 =?utf-8?B?ZFNaOGpjNDNzZUxGZVVuSGhFOG1EcTUxVjRpYlI3a1ZHSHBTOGQ4ZnVmd2RY?=
 =?utf-8?B?Y2RrM2h3RHdjMVpjTjRMQ0dsYUoweHVYU0FyQU16Ym1EREJiUlNTanhqdEdM?=
 =?utf-8?B?aUYvZ1J6RXlsSDVFcEROam1kR3RzLzlzcHczWWZUdUxCYUt0SnVIbnV5TVl3?=
 =?utf-8?B?QXkyY2ZpU2xiVisxMFAxdlBTMnBQK1FzOUt3eDZPSmtnWnlrS3JkR0VoVFdv?=
 =?utf-8?B?cGJFMjBkK05hY0R5SDduQ2hNS25BR1lKbnlKVUNPN0dNdHVOZGlVbVI2Ykxz?=
 =?utf-8?B?NmNEaVpSTDZVTUhYa0ZQMmJKaS9aU1dhQW1XUjJpNWRMZWNZUTJDOEh2NE1J?=
 =?utf-8?B?aStqQXNrZ0NTOXJWL2NxVW1LbkpnbVk3aHBDVTVGNHZFU1hhWDRWWU5ML0Nk?=
 =?utf-8?B?dDlYN0Eva3NaZTVTLzRKUEoyZll2N3cxQmdCbVpXaUpnaEg4MDgrZUk1TitB?=
 =?utf-8?B?S3RxK2RnWUJPTTFaWWI4WG9jU1lPWStaNW5vaFJOY0dEaEVZSVhoajZXLzFJ?=
 =?utf-8?B?UW1VMWRLUWZHUUlpazNMbElNM2sxUmNWL1E5OTIvdGZKRzlNSU1sRDF5YTZN?=
 =?utf-8?B?UjY4dGF1VDNBaUhnd2VvM0lUaVIrN2IwMEpHNzJSQ011eDlJZUhqOXdLV052?=
 =?utf-8?B?djFtQUVWbHkyemg1U2QxNE9pbEJvbTNZd2x0Z2tVRXNBcS8wZXhReVR1MXRj?=
 =?utf-8?B?TUdzbDZHTTZ1Y0JmWkdNSTBWOXY0SnA0aW9oeW95dWdqRHVpaDdsTTNQK1d0?=
 =?utf-8?B?VzJsa0ZmSDBTeWpCVVFOb1NZcG9STzM2V1lxTFkwQ0FJTExUWDFTcmRucVJu?=
 =?utf-8?B?MVlRMC93RUJvNWZnSXRCMG02bnpaaE8rRXdjaXJXMlRQVUlnekgvYURwcTJP?=
 =?utf-8?B?K2RuNWpBc0tacG5tUWp3MGI3T3d4ZHZjc1pOVjYrOXVOdGdRUTVycGsxdVZy?=
 =?utf-8?B?bUFGNkg4SVlyS24rYy9HZGZsdE9PNjljWXlJNU5HL0ozYjUzRTFPeWYzcHNR?=
 =?utf-8?B?ak5jRUhLTFFoRE0wVm9HcUg1cmI1Y1Frb3NzWFc1MmNDSEI2d2E4ak9SVGJQ?=
 =?utf-8?B?K091Qkd1UDk2T3BQOTNWRVh0MExub3Y2ZjRxSHJQd1JwUzcwOTlkWDdzNXly?=
 =?utf-8?B?ZDZKTWhaRWIvSyt4aHRmYkxzUENkZkJuYXlCNUpndDRaNkZzeFJWc3Y0V1U4?=
 =?utf-8?B?SmpJcmtnTnFaL0t2WEFsRk51RlJrdDExNk9sVHBZMnpjOE1hT1pnZXBwcm55?=
 =?utf-8?B?ckIvWElEdXZPcGFTNFh6L3A0WU5tVS9scUx5OUVTRktyZmxkT2dydWZYbU14?=
 =?utf-8?B?YjlVa1FPdEt2Ukt4UlJXeFZVUitQMndxRm0xaEhoV2dOeERmOXEvVzN2Mk5R?=
 =?utf-8?Q?8UVxQUONPO1sBZeolTEgryHs7nyjbbeq?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L01vRlMzSzNCRkRsWUsyNEVuTk1pY1YzU0JEeVgzTEZ3WGJheTRRTktaL0J3?=
 =?utf-8?B?eSs0QjVUZFhub25JMVNnRDFJb1V4UTZnOFlmRG5mVjBEZlRHejNNTWpKR05S?=
 =?utf-8?B?VGxUTDJ3NGhqR2lxcGh1d0MvcDF0UWpQRElicnYydDM1Z0NrSjl6N1BMcHBy?=
 =?utf-8?B?VEdnbXdsRm9BQkpabGF1SG9SQ1pkdVBuUlJUeUdOSE9JNzBMdG8vQzBTT0pk?=
 =?utf-8?B?SHhHdWhSRkVSczdBd3dsK25LMGthUnh6SEtSaHNpOUV0am9OMU1YVndUZUVy?=
 =?utf-8?B?ZzlCZElaYW1CUDUrQ0tJRGlSbytwUy9GZktQUDdtWTFRM05XdFVaT1hhazVw?=
 =?utf-8?B?MkRuQ2drU0RxbFNFN2FKOEl6SE9QUmpZUWkrenZxMyt0a3ZnZm9YTFdncW1P?=
 =?utf-8?B?b0lVTmpMeEUyQUFnVG1hS0FHMnBxUWF2MUJvcEJZd3g5UjZxakNaWERNN3pz?=
 =?utf-8?B?blcrdWNCRjVUSnFEQS9SaGVwZlk5VytqTXFDSEZTemo1TG91UUJhb1RzTHNM?=
 =?utf-8?B?ekJ3TjJzb1dmU3ZHb0J4RTJBSVdPRk02UDFURVMxdENuekdNS2t2RXVjY0tJ?=
 =?utf-8?B?SUl0Z3NEZ0Q1eDRqL2RUZFNocnlacjRpaGJOOUU1dDhWUng2VVJYYU96QXZr?=
 =?utf-8?B?RzZsN21TU25DZ0M0ZFpzVWRCRytzaW05UTFxcTZJNlN6U004Tng3dEFuLzUv?=
 =?utf-8?B?S2E1WHpCWGUxVERLazBLUUpMektRTkZjbGxXTlZlNXVSUTM4Z2hDNXpZQWp5?=
 =?utf-8?B?ZVdPZjBicStjd0dDYk5PSTRlMkxyS28xZlVtOHJVYUJxNXZqR0JqTVpwVXh6?=
 =?utf-8?B?Zk5UVjBVd2lyRG9OUW5POVM5dGNCR2VJR3ZQTGJOYzRPN1V2T09sVllybmhT?=
 =?utf-8?B?dUNMclZMTGdJTVk4NTUwQi9QSEJGNXhmQ2ZlWnRpVmtjYnRDVEpoMEljbk92?=
 =?utf-8?B?cVcyVGZveDY0MU1pTGpSdk52bXpoVTZsajRnNkMzZCtWZHBHdG53cWU3ZGhS?=
 =?utf-8?B?YXVCVTArZkNCVUk3MHB2ZkFpZFdCdzZwbjA0eFNOT0p4YjRabzN5cFdVVUVE?=
 =?utf-8?B?OENtS0NDcW0xc09HNjZjc2piNkNITU5PdVRNdHhjZnhtNXovQzJuY1dkUGJm?=
 =?utf-8?B?TDF2MVFpT1pnY3JsbXhQVHN5cGRvWGZYRFhydHpZZ2pqMDVvMENUVzNwM3BP?=
 =?utf-8?B?WUZ0S2trK3c4cnZsVFN0Tmo0eTRsM1B6QkxVS3BuOFBhcm5JMjVNRnRyMXFj?=
 =?utf-8?B?SENZWjlCTXYrZkNlc0FuenROYUlQNVpjU205dmU1c0JxS3FBajZHa0ljL3la?=
 =?utf-8?B?VnVUU0REOEZjVThablhVV0hGa0FWUEU0ejYrZDVDdDBLSFViRW14L1BxdHow?=
 =?utf-8?B?Vm8wQitXZ1RJZ2JOcDVpRUlTUmgrMGFMZ1FVNUJhcklhaWN2RVUyNnU1a3BJ?=
 =?utf-8?B?VGU0QmNJejF0d1FQdldpWHA3WFBKa00zRkVvVGZ5UzhJNm9oN2xEemhsTzdQ?=
 =?utf-8?B?bStqZmtVOGpUM3A3MFpINUU4dXZqL042dnVIMWtleVFuQW1JSkVJYnFWQUt2?=
 =?utf-8?B?NHV5UmpVRGpVUEd5ekFNeklGSGROZkxISUUxd1lBbGJveGY0TFZ3VlFPTkZm?=
 =?utf-8?B?bGE3UmhPeWlQODV2bGxBKzl4bkhIYmlpaXZGdWFUQS9PdFZObnEvTEpRamxk?=
 =?utf-8?B?bUhWNHdjUW96K1JJaFhaRTAwelk0RXgzM3JCWnltV25wenQxLzNONlN4dUQ4?=
 =?utf-8?B?WlZnUVk3NllBbXlTZTRkazZERzE4c1o0dEFNRmQ2RG83cVpiay9GREZsR3BX?=
 =?utf-8?B?MFRqalJybzNKRUMrVStETEszRUYxL0hBd2x0WEY5ViszK0ZCTkx3VFZWWldJ?=
 =?utf-8?B?bVc4TERrd3hOQUgyQWVxanNiWDFvODdLWEVpWUxZN25lWmhUWFlrTXlibDVo?=
 =?utf-8?B?WlF3dkM2b3BiRFpUNmRmVCtscUtHeFVQN3dSYWNzRTN2T0hFcFlFaEN6NklG?=
 =?utf-8?B?a01HcTJESVhKdUE3NmMxWG8waHRGR1cvdW94YU95alh2TXNqcmt3NXovMDVL?=
 =?utf-8?B?V1VNcVZ3Qm5tRUF5TDFhdTBuMHdMOGl3dWt1THZLUldZRjd0dmFoWUw3VU0v?=
 =?utf-8?Q?ypkrDmHClM0iKJtz/e8Oed2X2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	wsbNGH4LiC7rbhwSGHt2m/yliNVAr9W1AgfC9rcaAaXDQInbC1+yAU3+c3rIYAv2xJLxzNjCK4WYTTDiYkwMkZFNQKt0nX7PBPPdO7T7Fo5KLX1e2A27e2TWSA3nF54F/iVmZSp87Md6f6CNZvfQDFpklJ5+XneG5BcjmxWr/dUk7mHCc2RyN0HAy3nLMrtGnWLjVwjWJwHHsIieYVu8Iw8m6Nc3SnBSe6vWa9L5s4wlWoelNpecERnvjznQoYlM2h1u0XvQOgUcR7K54pe81e2sGV3z0q1pitwZCLgkuT2A9SOuU0CtZhQjS9y24t+aqKMJaZMOwIZWtcpBFdm0PLuN01ZL04iqChA7fQROFep39T8qIQD/y2CVm4n0X6KFQYVCtoaA5gvN+aqvzmQErZn/VabgGZAIJ2lyPGz+wfBpZadtAW7m1V/Zv7DFbraCFUGJ2HNGBLuD+0sJsW3f8AnhcUyo3g61CVCDohigahcQ0jTCyPTG9O+ciVTYGl2FyulsuNDtMc/OGSbCiuEn+WxCY0snzAnL/UqRx5kFXyFb7NS6cMr25LIotY4e9fwyam94sOSz0EwNYXVu7vwLH7PnrhcHElHZ25mOIbeYQ9JWSblZESb4dw2CXU1Y3NC2
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a68c3612-383f-408e-b554-08ddf75b5456
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 09:02:58.5488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WYffKQpqQwyvLt7xKBL1OwQQ9T6BqVg/zTISnj+xYUH3YccwBW0IvZBZK9KlfksXrjv83vI1GpEc/ceBgwwkuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 09:03:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223732

QWZ0ZXIgdGhlIHVwZ3JhZGUgb2YgbGliZGlzcGxheS1pbmZvLCB0aGUgdmVyc2lvbiBjb25zdHJh
aW50IGluIHdlc3RvbidzIGRvX2NvbmZpZ3VyZSByZXF1aXJpbmcgbGliZGlzcGxheS1pbmZvIDwg
My4wIGlzIG5vIGxvbmdlciB2YWxpZCwgcmVzdWx0aW5nIGluIGFuIGVycm9yLg0KDQpTaW5jZSB0
aGUgdXBzdHJlYW0gd2VzdG9uIHByb2plY3QgaGFzIG5vdCBiZWVuIHVwZGF0ZWQgeWV0LCBwbGVh
c2UgdGVtcG9yYXJpbHkgaWdub3JlIHRoZSBwYXRjaCBmb3IgbGliZGlzcGxheS1pbmZvLg0KDQog
IC0tDQpCZXN0IFJlZ2FyZHMNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KV2FuZyBNaW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNI
Tk9MT0dZIENPLiwgTFRELiAoRk5TVCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAx
MiwgQ2hpbmENClRFTO+8mis4NisyNS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpG
QVg6ICs4NisyNS04MzMxNzY4NQ0KTUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gT24gQmVoYWxmIE9mIE1hdGhpZXUNCj4gRHVib2lzLUJyaWFuZCB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxMCwgMjAyNSAxMTozMCBQ
TQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6
IFtPRS1jb3JlXSBbUEFUQ0ggMTIvNDBdIGxpYmRpc3BsYXktaW5mbzogdXBncmFkZSAwLjIuMCAt
PiAwLjMuMA0KPiANCj4gT24gV2VkIFNlcCAxMCwgMjAyNSBhdCAxMToxNiBBTSBDRVNULCB3YW5n
bXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gd3JvdGU6DQo+ID4gRnJvbTogV2FuZyBN
aW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcg
TWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+IA0KPiBIaSBXYW5nLA0KPiANCj4gVGhhbmtz
IGZvciB0aGUgcGFja2FnZSB1cGRhdGUuDQo+IA0KPiBJIGJlbGlldmUgdGhpcyBvbmUgaXMgcmVz
cG9uc2libGUgZm9yIGEgd2VzdG9uIGNvbmZpZ3VyZSBlcnJvcjoNCj4gDQo+IEVSUk9SOiB3ZXN0
b24tMTQuMC4yLXIwIGRvX2NvbmZpZ3VyZTogbWVzb24gZmFpbGVkIC4uLg0KPiB8IEVSUk9SOiBT
dWJwcm9qZWN0IGRpc3BsYXktaW5mbyBpcyBidWlsZGFibGU6IE5PDQo+IHwgTWVzc2FnZTogUmVx
dWlyZWQgYnkgRFJNLWJhY2tlbmQuDQo+IHwNCj4gfCAuLi9zb3VyY2VzL3dlc3Rvbi0xNC4wLjIv
bGlid2VzdG9uL2JhY2tlbmQtZHJtL21lc29uLmJ1aWxkOjU6MjI6DQo+IHwgRVJST1I6IEF1dG9t
YXRpYyB3cmFwLWJhc2VkIHN1YnByb2plY3QgZG93bmxvYWRpbmcgaXMgZGlzYWJsZWQNCj4gfA0K
PiB8IEEgZnVsbCBsb2cgY2FuIGJlIGZvdW5kIGF0DQo+IHwgL3Nydi9wb2t5YnVpbGQveW9jdG8t
d29ya2VyL3FlbXV4ODYtd29ybGQvYnVpbGQvYnVpbGQvdG1wL3dvcmsveDg2LTY0LQ0KPiB8IHYz
LXBva3ktbGludXgvd2VzdG9uLzE0LjAuMi9idWlsZC9tZXNvbi1sb2dzL21lc29uLWxvZy50eHQN
Cj4gfCBFUlJPUjogbWVzb24gZmFpbGVkDQo+IHwgV0FSTklORzogZXhpdCBjb2RlIDEgZnJvbSBh
IHNoZWxsIGNvbW1hbmQuDQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5v
cmcvdmFsa3lyaWUvIy9idWlsZGVycy81OS9idWlsZHMvMjM1Nw0KPiAoc2FtZSBidWlsZCBhcyB0
aGUgbmdodHRwMiBidWlsZCBlcnJvcikNCj4gDQo+IENhbiB5b3UgZG8gc29tZXRoaW5nIGFib3V0
IGl0Pw0KPiANCj4gVGhhbmtzLA0KPiBNYXRoaWV1DQo+IA0KPiAtLQ0KPiBNYXRoaWV1IER1Ym9p
cy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmlu
Zw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

