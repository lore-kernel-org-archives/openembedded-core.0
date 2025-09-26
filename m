Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AE6CAC5BC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 10:24:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14122.1758882279823181131
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 03:24:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=FO7ezSZ0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364670208=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q5U1oX1167882
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WnEeugSWxXnUEi4uowg2Dm9JIfgOOOjeddTSOQZYUTE=; b=
	FO7ezSZ0DiNQfeDV09+MWDd3Xn0soEYR7VxGssTHGzcQnnvttR3Jvp3vx0XnAZb9
	2VQPq41CHmxYBM7UX6w5J9cKOQgmrOZDuQiH/5Xz/in0esA7nruyMvRe7hSrD6YA
	4f5viG1mkoWUwUQA1oxa/pgpbAuN3jNMaPG2P+kFo3aP3eZ10k9Zvl2ojeP7WyqP
	3LeBVAO4jPtzYBuV12MxdYZa8Jict5RoJA9Sbm/Git36a3zvfCALaSydX79jyiup
	u+HS2yVxrHtd21Z/YrWK6YvLB+Tv0h/MEAYH86iywHqKGMz2CHYzqngW45y0iq33
	orAcBD+KzkuYwvT81RAVjA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh8nsh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:24:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T54Tw+mME9lgqKWkhL9ASdgRws7HhhfecYN3JSiwjy5ckZB9EKN6R3K2CHorZyFcW51rmYiBYuKGyw0vPb1djnP0c0HpdGUYvp/AkNikgy6vt0TNSt0TIALxnBq4n1gYstyJisCNe/E0m5qYKsjOVTnA+Ijzyk124pKMZ0A155Zj024EG2oYKVBx9W/i+uC/vTPnvJfU0I6DddVLS0GpGjlTwtNRiSkPhS/UTl8u58YbxmqACYIL+n1LMzqRwaL2oa+YgrnM+xAQAlBuO15aUKr9ckDVviKtMhQPF7/YKKRgHKLY85FolQP+eTzSRChdH/6tCpVKLlm3YlgcDbnv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnEeugSWxXnUEi4uowg2Dm9JIfgOOOjeddTSOQZYUTE=;
 b=yL9RKNcOIpVj/TOcg2II8HfSPK6Id5eoVI9v38xOkmLoVGpOcD0xx5sqU0KZFQ9BLm2acyErH0a+NM/5OtvGZ5ct4NRUUCmnc13mFgTFSFKPmzx2XYbpUrOibXas6DIHPKbc0p3JW0UEfPsUx+YlLn2hIeFQI2HNdtUP9HIl5aVAFMXonEmXvTnq2I3nxf2CnmVRPyKeiw7lyEE382ICnyRKaYzMmI9T0NpxC4IV7NHLKJPGwRUGdSRB3tw+G/+8npBl5v3puFxtrZ4Br8oTHI8Ofy87bidV5gIlHWoBS9ORzCL/8L9Sq9bcivHhdgvs9TyVZoxxcMGTdmT+uLiWoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by CH3PR11MB8467.namprd11.prod.outlook.com (2603:10b6:610:1bd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 10:24:36 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 10:24:36 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V3 2/2] rust: Drop rust-llvm
Date: Fri, 26 Sep 2025 03:24:07 -0700
Message-ID: <20250926102411.3742996-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
References: <20250926102411.3742996-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|CH3PR11MB8467:EE_
X-MS-Office365-Filtering-Correlation-Id: f66c7408-3f4a-4cb3-f35d-08ddfce6e4c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UzJtMnpEbks2RGdWWDB4djZ6UE9XWnJhTnM4bmRyNkcvUlpHQkxwZ2o1bUF6?=
 =?utf-8?B?YXl3RFpObmFyS2w2L3diZlBxVTMzck1MNkROSzdMMEdaWnd6RHB5bU9GN2ti?=
 =?utf-8?B?ZFZ2OFd4TlpOZ1lLejJkS0lURWFQYXFlQm1ZQ1VyTUM0dzFaWDR0cmZLcWJR?=
 =?utf-8?B?MGFld1lPSXBIVHhGYUVKUG4waWJBeXQ0aUVPZ1VORHk1L0JmQy9UczludUwr?=
 =?utf-8?B?QjcyczB0K253ZDhPdkxiZDhVcW9CN0pUNm5nUzJNRk1QdmozS296QnRmZW5J?=
 =?utf-8?B?YXZlL2ZQSkg1ZkhqVHVoTmhJN1JKRk05RUJnaHBTZjl6SFhKYm9PM1FwTUcy?=
 =?utf-8?B?eFg3dER3NG5GRUlMdU1wejVJZEFUVjNSL09VUDJkWGdIamdmd2FBdGVDTTRE?=
 =?utf-8?B?amk1eDRLditvNkFUa3Npb2JlSzYxekZReEdycFI2OVgzRmVsUGkvdjNmdEQy?=
 =?utf-8?B?NVVKNlRpb0pyNHBSU1J0ZTRJZUY5NkdocTdKRDlnZlpzN1A0NTJ6MlFwNDk4?=
 =?utf-8?B?dDBweWVTVlRBUHA0M3haVTdZS2pub3hIdTU5dlVqMmNlUnNCMEpBd2RYNXV3?=
 =?utf-8?B?czVxNkloVkI5eXVKanFPQ3NaWGxDOXJHbk9OYktXaTRuMGN1RlpYdzZ6MmVq?=
 =?utf-8?B?Q0xzSGNrUW93SC9HajlnSWtzNHpmejV2VWtnenJuWEJwbjFSd1BQS1MxTDZX?=
 =?utf-8?B?TEF5NDFkWG9BempqZFpRNXQzcEFiZDd4d09UWTZ1TmcxMzVVQ1c2ZkVsYjZr?=
 =?utf-8?B?S3lackJRMnZoZEFlYlhOaExMWU54OExSM0xTTXpXNktSTDlXV1loL1pVcHEr?=
 =?utf-8?B?WDJnV2VIZ2xuL3c3SjBJdTRTR2hhcTFmQU1DaUhPVmZOS3dITkNTeEFkTVBn?=
 =?utf-8?B?akNteThWUE1YcnI0NHhDeEg0aG81dy94U1orc3d6djJoWnRSVlpqd3N2d0JF?=
 =?utf-8?B?VmxMM21DR2ljbTNYUGpvMDgyVElzWFhySjMrOWFpcm80VmpCZ1dEVkI2YXpt?=
 =?utf-8?B?QzJVYTNvSnNHQkRQNEpSQW9UV1FpT3hSbkExN2Znd2RXUCtJK3kwSWx2OWhz?=
 =?utf-8?B?SlZhN1p3RFh6cHluRC84dmtER2FtNm9IOFRJOWpkTU9CSW42aS84ME1hamVE?=
 =?utf-8?B?SXZpKzJYdExEV3hqLzdXeWdnbmhjMm1BbXZhV21RdFZWcUlWUXA5TEkyUlF0?=
 =?utf-8?B?eGRpSzRzcWFvTTR5U1ZGR1V1TW5HbHVZZ3gxVTc4Z1hYSEwxS0hVK3h1TkEw?=
 =?utf-8?B?cFZYTVVMekhmemg5RXNxWTdibUF2K1ArUE0yalBGYzJwN3ZFd1VVQTlkdFdz?=
 =?utf-8?B?ZlhLOEVqRFNTYmxiWHR6bklWQktGWlM4WmJHSGxqUnhlVS8xd2JCMDl2bzhq?=
 =?utf-8?B?SUFkQ2RTWFRpck9NQk44aUdVblZMVlVvVTJhZTdMVm9Hb1RwajlMR2ZSaWhm?=
 =?utf-8?B?TVQzWDFLQnI0NU1iY2ZJckJuck8rQTFxd2c0UzFqS0NBbG9Da3RML2lQelFu?=
 =?utf-8?B?WjFLeTh5OFVaOTlKQkRsYnhlZGZLYy9YRktTV201UHpuYTlIRFp4OG80ZXRx?=
 =?utf-8?B?dXRrQ29KZGw1Q0pQbHBYZXFFSHFWUzBZeTRHN3hTaEtSQVM2aHlvcnVvNzJZ?=
 =?utf-8?B?a2dpYkNNT2ZPdGxVK3F2RW1yZ3RHSi9jdWY2Q09WT0dWZTB4VFZNdkRJSE5E?=
 =?utf-8?B?RHBUZ2ZwUFJaZlgrb0E1QjYvVWJ3cU1sdTVSNlRKbHZiTUhUSkpYZ3hiOW5H?=
 =?utf-8?B?aHA0amtFcGF4YXRJb2tzU2svNzZLczJwdCtwQ3Y0Qlo2SWdGWGdrcE83Vkhl?=
 =?utf-8?B?UU51RFBOWHVWU0pBKzdVbWlKc0F6ZHlNRDBiTU5JOU5XTUVnQ2d5MEczZkZP?=
 =?utf-8?B?QTdxeWtmSDljekgwUmpDdFZRbzVCQ09CbTk1UVRoN1JhYmh3NS9MZHdyNzRn?=
 =?utf-8?Q?/IlVLEgdrlw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXN0NW5UaUJvM200SGNwYkU4enlHaU15WnRFd0k3dUs5YjZVV3VpSmFPaHdl?=
 =?utf-8?B?TlJuMWtpckd3TThLaXk5aC9FWENNbWk0K1B3VlJRZkQ4QUFwOW00dTV2MldG?=
 =?utf-8?B?NWRGeDBSZkRjN3I3dkJxdnRCdkYxWExRaXBaeURUcHgzMFNiMXhtdW03aFpt?=
 =?utf-8?B?b0o5ckZ3ZXQxdFA5UDRxRy9Lci9iZTUxVFBxRzFOcDBFVndmT0RhV0NDREM0?=
 =?utf-8?B?MFZBNXFCVHRxRTlBYkZVRkY1bEV5SmpMaG9BNU1QdzNqQ3hWeU5mdExRMEdD?=
 =?utf-8?B?SHkxWVNtMUFadEFxUmkvTkdMUGJDYUltdlF4TmdQNXFSZjhOOU9qRERTNzA0?=
 =?utf-8?B?eEJqbERGZjdha3RXVmFoaDNWSGFXUDBUV1ZkQ2FGd1JaRXhKWUZCNzNoV3g4?=
 =?utf-8?B?RmY5SWMrU2pzUVl1Uzh3TU9sS0dMNXJpcDJsVjJURzFMWWVZV2Z1aVVZb1hB?=
 =?utf-8?B?K3BPODVJbzU5Z1UwM1hXajhZRUhha3Z2c1hTL1VMemFQZXB0czJ2QW5PcHlS?=
 =?utf-8?B?UUNSaUlGMlBnNXFXRWlJTzBaME9iTDhXb2VsRnBCUGUrV2RKQTVKSmhaZzBp?=
 =?utf-8?B?MlM5VFJPd1FZWmI0NzRrNUFlb3NEczhUL0Q0aG00ZlJtdzJRd3RiVkNzUTNK?=
 =?utf-8?B?a3h5eGw5dEdjcW1TQ1cvQnJxRVl6ZjVqOEUwVnVjNEc1MTNVVWFLYWFqR0dh?=
 =?utf-8?B?SkFWMWI2RmNjcDdLalRGUG5zdlNSL2JUK3MzSWxOUUxPblA3RWNITi84cnFG?=
 =?utf-8?B?bFpwL0NuY0o0b0RVdElMSXFHdkJoaTd5aGl4OG9COC9YcGR5d0JQNEpIQXFi?=
 =?utf-8?B?a2Y5RUZDL1M2WlRuR1lTclduOEhJWTAybi9OSUhrY2JjMStzcmlzbjdSVWww?=
 =?utf-8?B?eUFsUGFDMTVxTWV5VlE3S21zaWl1S1hKRDduS015NlAvZk0wME11ME9rQ2dV?=
 =?utf-8?B?OTVDRDRLMGwyYlFEcEtVM0lmQ2ZMb3BtQnlVVlZuWEtva0FKVkJUR2IySXYx?=
 =?utf-8?B?S05idkZLT1dodTNIZm9tV3RZR1FrVWZlY3FlVTBBS3dia3kyZUUzVDFQLzF1?=
 =?utf-8?B?blRuUnp2WDc2RmVwakIrWjV5NllrZWdmcGNFZnJFSk9mdXRvZ1hsbmczcUN0?=
 =?utf-8?B?MlgvdmZOREh6L0NmdWlYS2hVVUZVeFhGMjFsZkw4UGljcnowTldzODlUcEdJ?=
 =?utf-8?B?eUZRdVZLeUxvQjhGSm05cWRLWTgxZE5xSFhqVzl6U2FTYTNJL3lvVGF6Uk4v?=
 =?utf-8?B?MDBpbTVQbGNBRDExVjFzOHBHWTBmaWk0NERkbkYwZFZDVHMxbUlPVFhBRm14?=
 =?utf-8?B?c0JuVUJBeW0zc2IrOGE0bHplTk5lMy9peTB2Q0V0VTh2YStoMjk1NHFlQ2RC?=
 =?utf-8?B?SlJJV1Fhekc4QXlFU29LdWhiZUVtOTFHUFFxRndKb3l0dktwMEFCRlNQVUxX?=
 =?utf-8?B?Zm9IVjRlSWdwS3E5RkpoMU0wRmJoTktuTUk4VnV6bndXeXhjSmdmWWNWdEVl?=
 =?utf-8?B?d0diMkxBaktmT2pGOXBsTXc5TkFldTJvcGVkeENpaHpBdG13Nlp3UC92WjBh?=
 =?utf-8?B?Z1pvVEsvVTdjZloyMlZrOFN0bEh0enduZmthVzQwbTB3RlA4Q080RDc1eHAr?=
 =?utf-8?B?a092N3ZLaU9PT0JzSDlZS2FjZTNGMXR4TXl4WFhjZjYxNTFieXY2S2N2THBR?=
 =?utf-8?B?RlY5dXptSU5RUjhFNVl5R1NkUXlaZXNOOWJwc2M0Uk5ZUXBWeWRmVHV2Yjh1?=
 =?utf-8?B?a3g2MXRwR0M0ekZmQ3hiUG5rT3U1TDYxWGRaS2puYmR5VHZhS0U3K1UrWmpH?=
 =?utf-8?B?UkZ2WTNERWhYcGd4Z0IzNTN2U1JMMHJ1SXdabU5wbm5rT1czOVNLUCtGZCs2?=
 =?utf-8?B?Y0lzVWdBZWpBUlE3d29NbWhBUU1va2RpbFZPUEFUQ3R3bG1KS0FqbmRjQXB4?=
 =?utf-8?B?enJDWkFVV1k3dDRkcVp4MThTSldQSWdBY0dYSG5HcEdXbzBRNy9ZREg1VEJw?=
 =?utf-8?B?bldlSlEvTm9UVzVJdVFwK2ZMb29IeldCVVZQT3dUUzllZzBBUm13MytBT1Rs?=
 =?utf-8?B?Tm51S2VWL2o3aG9QOG9xa1IxUVVqRmtndkl5ZTQ0WE1Gdkw5V0hFc0NGbXgx?=
 =?utf-8?B?YS9yWGE4K2kySkw3OXN4aWhHYTdJZEpDR2dyb3BOdGNVTE5LMWwyK0s4YzVG?=
 =?utf-8?Q?/reBEfN+XZmygHkylIW+4YM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f66c7408-3f4a-4cb3-f35d-08ddfce6e4c4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:24:36.8214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGQLYgG28ysMU+0fCNueNobT7Gjgme1NmC9AfWbY0HjOF3Fo/wlKWz932etlrfRqVFrkUuIV9RxsyPaSHJ+YsYSsb6HVuT4JixZWxjSqiqwjL4RJm586gdxfcRfrYfaf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8467
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA5NSBTYWx0ZWRfXwTe+M98szUt/
 hqDH8OgkoR63PNo/jnynbXu9+40fEVQupTsjivLCy9H07EV2HwkM6zMDKLauKA2Xw4iXZY0P4KX
 5tXJMppB6EzJHvaTmVfJ0hE0PN3YMLtpxYxQsGXjooCnBGCc7EPlHtBvOaOQruWvVxq3rY75jLS
 XiELfr1r7zuCln89RlWC5zjzdIH/thn8ODrdffLwQ3nsUu/qkK0LjcAHHWF8yTLlixJJi9I2m1o
 I44nVhHxVKiD4QJ6MhZFN+rP2dUTmwV3UGCYxMS9IAYDQzciEVXJnUT7bdsvBGmVxSrfinU0zKt
 dsnOIfA95uuVIp+0HM8QTISt+zRRAZjQ3e6/1n4/1g/PjE/wBlQRf9efvLdTDqzHGyZ/+bnfh4q
 dnYbTSU/HJH+DGUwxkrmOf7ekKUu4g==
X-Proofpoint-ORIG-GUID: kYJkVDp1KBRtkA3ULAFXBQAF3gKzE539
X-Proofpoint-GUID: kYJkVDp1KBRtkA3ULAFXBQAF3gKzE539
X-Authority-Analysis: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=68d669e6 cx=c_pps
 a=F7X/6K5kN+zqVHn88SdM/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8
 a=mDV3o1hIAAAA:8 a=Twlkf-z8AAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8
 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8 a=8wEic9LhAAAA:8 a=pGLkceISAAAA:8
 a=IvTj1HvjAAAA:8 a=F_APRniP6ELLG6ECTw4A:9 a=jwqizywn4iEqV798:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-74SuR6ZdpOK_LpdRCUo:22
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=M9VCcFR7d36vLOFuqMn8:22 a=kmyLcwvAnC_t3PsnBtKb:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260095
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58Q5U1oX1167882
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:24:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224076

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Drop rust-llvm recipe because now rust depends on clang for building

*Dropped Patches:

0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch(Merged)
https://github.com/llvm/llvm-project/commit/b46f34452e9dec50eee6ddbe07875=
f05e421a81c

0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
0002-llvm-allow-env-override-of-exe-path.patch
(We have the above two patches in clang)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...-gcs-instead-of-gcs-target-attribute.patch | 66 -------------
 ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 ------
 ...-llvm-allow-env-override-of-exe-path.patch | 33 -------
 .../recipes-devtools/rust/rust-llvm_1.90.0.bb | 98 -------------------
 meta/recipes-devtools/rust/rust-source.inc    |  1 -
 6 files changed, 230 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-libunwind-Use-g=
cs-instead-of-gcs-target-attribute.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherE=
mitter-sort-ClassInfo-lists-by-name-as-we.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-=
env-override-of-exe-path.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm_1.90.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 0988bf50a7..7eec664619 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -773,7 +773,6 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-llvm =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burton <ross.burton@arm.c=
om>"
diff --git a/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-inst=
ead-of-gcs-target-attribute.patch b/meta/recipes-devtools/rust/files/0001=
-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
deleted file mode 100644
index a704671fb9..0000000000
--- a/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-=
gcs-target-attribute.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From e4f4094de8ddcbe6d5ff1cdf782d2b89e0563903 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Apr 2025 19:51:19 -0700
-Subject: [PATCH] libunwind: Use +gcs instead of gcs target attribute
-
-__attribute__((target("gcs"))) does not work with gcc
-
-GCC-15 has added gcs intrinsics [1] but the syntax for enabling it is
-slightly different. This syntax works with clang too.
-
-With gcc15 compiler libunwind's check for this macros is succeeding and =
it
-ends up enabling 'gcs' by using function attribute, this works with clan=
g
-but not with gcc but '+gcs' works with both
-
-We can see this in rust compiler bootstrap for aarch64/musl when system
-uses gcc15, it ends up with these errors
-
-Building libunwind.a for aarch64-poky-linux-musl
-cargo:warning=3D/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-=
poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/s=
rc/UnwindLevel1.c:191:1: error: arch extension 'gcs' should be prefixed b=
y '+'
-cargo:warning=3D  191 | unwind_phase2(unw_context_t *uc, unw_cursor_t *c=
ursor, _Unwind_Exception *exception_object) {
-cargo:warning=3D      | ^~~~~~~~~~~~~
-cargo:warning=3D/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-=
poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/s=
rc/UnwindLevel1.c:337:22: error: arch extension 'gcs' should be prefixed =
by '+'
-cargo:warning=3D  337 |                      _Unwind_Stop_Fn stop, void =
*stop_parameter) {
-cargo:warning=3D      |                      ^~~~~~~~~~~~~~~
-
-[1] https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D5a6af707f0af
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/13=
8077]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/llvm-project/libunwind/src/UnwindLevel1.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/src/llvm-project/libunwind/src/UnwindLevel1.c
-+++ b/src/llvm-project/libunwind/src/UnwindLevel1.c
-@@ -185,7 +185,7 @@ extern int __unw_step_stage2(unw_cursor_
-=20
- #if defined(_LIBUNWIND_USE_GCS)
- // Enable the GCS target feature to permit gcspop instructions to be us=
ed.
--__attribute__((target("gcs")))
-+__attribute__((target("+gcs")))
- #endif
- static _Unwind_Reason_Code
- unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exceptio=
n *exception_object) {
-@@ -329,7 +329,7 @@ unwind_phase2(unw_context_t *uc, unw_cur
-=20
- #if defined(_LIBUNWIND_USE_GCS)
- // Enable the GCS target feature to permit gcspop instructions to be us=
ed.
--__attribute__((target("gcs")))
-+__attribute__((target("+gcs")))
- #endif
- static _Unwind_Reason_Code
- unwind_phase2_forced(unw_context_t *uc, unw_cursor_t *cursor,
---- a/src/llvm-project/libunwind/src/cet_unwind.h
-+++ b/src/llvm-project/libunwind/src/cet_unwind.h
-@@ -42,7 +42,8 @@
- #include <arm_acle.h>
-=20
- // We can only use GCS if arm_acle.h defines the GCS intrinsics.
--#ifdef _CHKFEAT_GCS
-+// Enable gcs with clang for now, gcc does not build unwindlevel1.c cor=
rectly
-+#if defined(_CHKFEAT_GCS) && defined(__clang__)
- #define _LIBUNWIND_USE_GCS 1
- #endif
-=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-=
sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/rust/rus=
t-llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
deleted file mode 100644
index 48af6fc283..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-sort-Cl=
assInfo-lists-by-name-as-we.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 27 Nov 2020 10:11:08 +0000
-Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
-
-Otherwise, there are instances which are identical in
-every other field and therefore sort non-reproducibly
-(which breaks binary and source reproducibiliy).
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/Tabl=
eGen/AsmMatcherEmitter.cpp
-index ccf0959389b..1f801e83b7d 100644
---- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -359,7 +359,10 @@ public:
-     // name of a class shouldn't be significant. However, some of the b=
ackends
-     // accidentally rely on this behaviour, so it will have to stay lik=
e this
-     // until they are fixed.
--    return ValueName < RHS.ValueName;
-+    if (ValueName !=3D RHS.ValueName)
-+        return ValueName < RHS.ValueName;
-+    // All else being equal, we should sort by name, for source and bin=
ary reproducibility
-+    return Name < RHS.Name;
-   }
- };
-=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-ove=
rride-of-exe-path.patch b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-=
allow-env-override-of-exe-path.patch
deleted file mode 100644
index 9be26677a9..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-o=
f-exe-path.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7111770e8290082530d920e120995bf81431b0aa Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH 12/18] llvm: allow env override of exe path
-
-When using a native llvm-config from inside a sysroot, we need llvm-conf=
ig to
-return the libraries, include directories, etc. from inside the sysroot =
rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
-
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -226,6 +226,13 @@ Typical components:\n\
-=20
- /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
-+  // Hack for Yocto: we need to override the root path when we are usin=
g
-+  // llvm-config from within a target sysroot.
-+  const char *Sysroot =3D std::getenv("YOCTO_ALTERNATE_EXE_PATH");
-+  if (Sysroot !=3D nullptr) {
-+    return Sysroot;
-+  }
-+
-   // This just needs to be some symbol in the binary; C++ doesn't
-   // allow taking the address of ::main however.
-   void *P =3D (void *)(intptr_t)GetExecutablePath;
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.90.0.bb
deleted file mode 100644
index 42d4031da1..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb
+++ /dev/null
@@ -1,98 +0,0 @@
-SUMMARY =3D "LLVM compiler framework (packaged with rust)"
-LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
-HOMEPAGE =3D "http://www.rust-lang.org"
-
-# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
-#
-LLVM_RELEASE =3D "20.1.8"
-
-require rust-source.inc
-
-SRC_URI +=3D "file://0002-llvm-allow-env-override-of-exe-path.patch;stri=
plevel=3D2 \
-            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-a=
s-we.patch;striplevel=3D2 \
-           "
-
-S =3D "${RUSTSRC}/src/llvm-project/llvm"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
-
-inherit cmake
-
-DEPENDS +=3D "ninja-native rust-llvm-native"
-
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-ARM_INSTRUCTION_SET:armv4t =3D "arm"
-
-# rustc_llvm with debug info is not recognized as a valid crate that's
-# generated by rust-llvm-native.
-CFLAGS:remove =3D "-g"
-CXXFLAGS:remove =3D "-g"
-
-LLVM_DIR =3D "llvm${LLVM_RELEASE}"
-
-RUST_LLVM_TARGETS ?=3D "ARM;AArch64;Mips;PowerPC;RISCV;X86"
-
-EXTRA_OECMAKE =3D " \
-    -DCMAKE_BUILD_TYPE=3DRelease \
-    -DLLVM_TARGETS_TO_BUILD=3D'${RUST_LLVM_TARGETS}' \
-    -DLLVM_BUILD_DOCS=3DOFF \
-    -DLLVM_ENABLE_TERMINFO=3DOFF \
-    -DLLVM_ENABLE_ZLIB=3DOFF \
-    -DLLVM_ENABLE_ZSTD=3DOFF \
-    -DLLVM_ENABLE_LIBXML2=3DOFF \
-    -DLLVM_ENABLE_FFI=3DOFF \
-    -DLLVM_ENABLE_LIBEDIT=3DOFF \
-    -DLLVM_INSTALL_UTILS=3DON \
-    -DLLVM_BUILD_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_LLVM_DYLIB=3DON \
-    -DLLVM_LINK_LLVM_DYLIB=3DON \
-    -DLLVM_INCLUDE_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_TESTS=3DOFF \
-    -DLLVM_INCLUDE_TESTS=3DOFF \
-    -DLLVM_INCLUDE_BENCHMARKS=3DOFF \
-    -DLLVM_TARGET_ARCH=3D${TARGET_ARCH} \
-    -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust \
-"
-
-# Forcibly disable the detection of these packages as otherwise
-# it will look at the host Python install
-EXTRA_OECMAKE +=3D "\
-    -DPY_PYGMENTS_FOUND=3DOFF \
-    -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DOFF \
-    -DPY_YAML_FOUND=3DOFF \
-"
-
-EXTRA_OECMAKE:append:class-target =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-EXTRA_OECMAKE:append:class-nativesdk =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-# The debug symbols are huge here (>2GB) so suppress them since they
-# provide almost no value. If you really need them then override this
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-
-export YOCTO_ALTERNATE_EXE_PATH =3D "${STAGING_LIBDIR}/llvm-rust/bin/llv=
m-config"
-
-do_install:append () {
-    # we don't need any of this stuff to build Rust
-    rm -rf "${D}/usr/lib/cmake"
-}
-
-PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
-
-# Add the extra locations to avoid the complaints about unpackaged files
-FILES:${PN}-bugpointpasses =3D "${libdir}/llvm-rust/lib/BugpointPasses.s=
o"
-FILES:${PN}-llvmhello =3D "${libdir}/llvm-rust/lib/LLVMHello.so"
-FILES:${PN}-liblto =3D "${libdir}/llvm-rust/lib/libLTO.so.*"
-FILES:${PN}-staticdev =3D+ "${libdir}/llvm-rust/*/*.a"
-FILES:${PN} +=3D "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.*=
 ${libdir}/llvm-rust/bin"
-FILES:${PN}-dev +=3D "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${lib=
dir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/=
cmake"
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index cf8274b443..ac814c67b6 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,6 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${R=
UST_VERSION}-src.tar.xz;n
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.=
patch;patchdir=3D${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-=
rust.patch;patchdir=3D${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.pa=
tch;patchdir=3D${RUSTSRC} \
-            file://0001-libunwind-Use-gcs-instead-of-gcs-target-attribut=
e.patch;patchdir=3D${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-va=
rian.patch;patchdir=3D${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] =3D "6bfeaddd90ffda2f063492b092bfed925c4b8c70157=
9baf4b1316e021470daac"
--=20
2.49.0


