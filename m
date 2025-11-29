Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBF8CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 03:44:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9002.1764387877951929705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 19:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=s3pf7T54;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4428fcfaaa=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AT3cuBf1390155
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 03:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=P47RdUhN1tPYh2EAALb5xDdEa4v7V9PQs8jbzevwmeI=; b=
	s3pf7T54gK4bpl/OMzbw1q5cuxQoQ0juqtvtZKZnPKFhIfB1R833FT/Wk7Tj6ueM
	yvBP4q5q7Vc+t4GxGNrJAsglREtenkv8sgF0eF6X5EexA3YEKSKScfow3ABGzf/s
	cf6vlR7puisvIHB2kgg1Xaqf9BL1T8MI9R+3/ecfpKnSq3GKa5sVi2KSB2zUD0PB
	WYKlmuOv+Z5Mjlfy2N3CEfzsdUrVaKe49VII3e2O4Sw3AQeNQD4pRJZusRoY17/D
	viqxIq7f9lEnik6Z2aSgpONXJcRFeYV5+0qEsWs0bbAm5fZB4LE38ytx/RdSA+no
	Ztchwkgof/F/FY6g05Ftsg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010020.outbound.protection.outlook.com [52.101.201.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt681dx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Nov 2025 03:44:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6j2VlMfPRPdh5Gfe1CAk5corOD+yQmvol9CgzogB+XZMqKsyLYTkwA3Lu1VqLJFDs/+Uy2gV/KSbJ6/hmKzvWFWYoTaHESvnq7XHVTfJQMb/gY7jTc6yrkWwmCYI0g9kuGfdbK5c1KjjQUxKLPpZgTRu3r2ap0DvPB7NzMcf9PXj0UVQuexdQRXup4nZc8EZsCj2P/5jDV8pxx6NlTHIgb/VADC9ly6rmmtGKU6hv4hl5wMlX47QDT3cnk7ynXkXdWc//i3zsHcsMbNb8zRLGSV7umwqT/ROGul8C6MyZF+jzCoD+gkhILZwRHGynykgmRDgdeGkX5fzyA3fi+77w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P47RdUhN1tPYh2EAALb5xDdEa4v7V9PQs8jbzevwmeI=;
 b=cY89KRbo1CPJc5t7tHtQMKcxMqU9b2bye85dxVp9qI8oHwQa7zr11QaMeKVGIEdWG2CJ+WNk8bLyl5qCWWkScNI1w7O5QueWI84EmmCTq1y4AoMWlqPI/kjwxcsdIba0zFcTDIM1G+OHKm9Le5HBowKzkb+BR3X+EdSPojGW5PRJFRydTdByAB0pNYU8I1dWMaQYFbGb+s14HwwyOA9w91Il6QVR6KtP7w9DNtIgQ1QqdXzehS50V8OA3tbg3003TQSoCdrap4G67O7l0QDPu5WkC9x/J9Xnlx7XcHmU7zh7M5Vx3+EqA8b4lpoAtmPgZC/PNJnNYtPjZZwrHvXEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 03:44:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 03:44:33 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][RESEND][PATCH v6 1/3] base-passwd: add clock group
Thread-Topic: [OE-core][RESEND][PATCH v6 1/3] base-passwd: add clock group
Thread-Index: AQHcYCAIs3h5eyoO80SPvtZnEe5XELUIHneAgADl/JA=
Date: Sat, 29 Nov 2025 03:44:33 +0000
Message-ID: 
 <CO6PR11MB5602607AFE5FF118F22C12E9EDDDA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20251128043221.3603223-1-Qi.Chen@windriver.com>
 <CANNYZj-FZ0rrKbYU_ew8vpkppAhfdMiMJfRqc8UFS6j5yaaErw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-FZ0rrKbYU_ew8vpkppAhfdMiMJfRqc8UFS6j5yaaErw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=edf2bfa0-d406-47fb-ab4e-bab2dfb8d6cf;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-11-29T03:43:40Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|DS7PR11MB7833:EE_
x-ms-office365-filtering-correlation-id: ee4a7930-df85-4ee4-c571-08de2ef99c2a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VG1ZbEJSd0c4V1R1d0gvbnFCVHE2WFdOTlFuMVpJVWdaQlpUK3k5NzZUZkcx?=
 =?utf-8?B?SFJveElvN1IrcTlReHhlbXF0cHcyams5K3dURUxOdUE3K1R2WVAxNE9lZWNE?=
 =?utf-8?B?bU02UE5vb1ZUQUZ3QkRXbjhucUpLVW9Mek9QS056NHFxMk45WG1JRDI3b3cz?=
 =?utf-8?B?ak95SDRFWkI3QjRQaTdLR0RBekxwYVJXaWhjSDRHdDk5YTY3Ull0NGkrWndL?=
 =?utf-8?B?akpOSmk1aERHQ1BvVmNzazYzcThGSzJkOWV5Rkt5cUIxZXNZKzdNS0pzaDhO?=
 =?utf-8?B?Um5xNktKUktmOWpyeGxPbGRWbktSZ0dCNStKazcvTFdvVE1YVEdIQ21pbE1V?=
 =?utf-8?B?Vk83WVVNbG9scjJrQUgvM1k2RkdtVDlUM3dlenFLUWFhdVhLYTNDZVJ2Qk4z?=
 =?utf-8?B?SGFpb25BZ2U1ZVBjTDNaMk1ud204d2FWNkFEM1czTE1lRWtXU012dkRRcGMx?=
 =?utf-8?B?RUNHRnh4SXFDbHA3T051UDFFQmlMZngzM2tJb3oxZjNoRlcyK2wyTGxJdWwv?=
 =?utf-8?B?NHhoU2VWZXpBaVRUZ09OYisxaTYxZVFPdGM5VjFHTEE3Q05UL0tDS3dzUjNx?=
 =?utf-8?B?RXA0Tzcyb3JoNHlvUlNiV3JhMzVxcm1MWmRiVUUwd3ZUV1VCL3F2K1YrTVRJ?=
 =?utf-8?B?cW1lbmQ3aGxXRGsvQkdMWnF4TmZYQmIwQjMyL2NzeUJ2VGNIeUlXczFCN284?=
 =?utf-8?B?L3JzSW5Ga1pNb2dvbkJpVGRRLzdvVy80YVlmbXNndHZuTnp0RHVrbU54MmFp?=
 =?utf-8?B?WEEza0hKcWtleWFTOWFuV3NXQzh5SkNlbnlFT2w2bVN6V2JpaFJlaUFKS0Jr?=
 =?utf-8?B?TStVUmxRL0hibkhZdDVsQzQvRVUwNENNOHQ5K1VnVGF3USt3SFFFZEtJWlVR?=
 =?utf-8?B?ajdkUDRGNnNEU0NPNS91Y01NRnMrNTNPR2t2clJvTmhsTm1BVmFjZHRXeU94?=
 =?utf-8?B?Qmh2cjRkSlpEUWxWaHROY1FOeEJieGtEUTF6U3I1S05IMkc1VTAxV1JsV0ww?=
 =?utf-8?B?bmhHZEpwZTZZZGdsNTRxUjNBQlliT2JMYXU5dHA1NUNWTHhLRWR6VVhpVkRB?=
 =?utf-8?B?NDlVdnorMUx1OS92THcwU1BFZGxjUnM1K0J2ZkxSNFBDRlZSQTg4cEs2ZTJW?=
 =?utf-8?B?VGIwSzlhbGdZa3pjUU45WnNRZ0R5bGhkRjl1UW0yT0VBVHpYdmNXYmVMTjNw?=
 =?utf-8?B?MVVkVjNyOFprQlRCVzN2ZUVpQU4xa2gzaE0yVE4wb2l3alM5bDlwRmNmemo0?=
 =?utf-8?B?YVc5aC9CRFd3VGpuaDFVZ2MyWVVNL0MrZTRyT3VXQUdMVllWeW94dTQ5KzZW?=
 =?utf-8?B?dFF0dDZiS2dpSFF6T2ZoOG16K29iaU1RdnZ4bDQ3SEdFN3A1RmhWMFd3cFF1?=
 =?utf-8?B?VVZrTGprT0ZVaU9CMTNmSDZMZDFQOUVWTjRteGdjalZ0UU41WmR5c1kxNGJP?=
 =?utf-8?B?cVl3Wm1rNldaM3FITXoyVWtZcWVQT1g0MHViWHljNnhYSXpKS29icGFCRzRL?=
 =?utf-8?B?VnAwYWFMQTQvcWxBa3NiZEpReGVSTDVOL0Y3QjJsSkZ3dmNXTFdGK1BDMW5N?=
 =?utf-8?B?MS9BeEl1aXBFN3dxODVJWjMzZmpBZ2Y5VWNkUit5L1ZzQk5vdG5EcTBkOVFB?=
 =?utf-8?B?MXhjQ2RtVjdEajB3djJLdnhHTjRHeE8va3JKQTZiS3haSW9GT1BSMThzVEhs?=
 =?utf-8?B?RU9pZUZQYkhEWktCdDlLdW53ckNqajR2bDlocjNWWll4YUhDMm1vTzlkaDRL?=
 =?utf-8?B?SGdkc3h2Y0ZiU29vOXg5UXJQOXdQWmJRbUo4ekF6VjFpZkV3Y3ptMWdqSllE?=
 =?utf-8?B?SU1jK3NiUm1OQzhZN3M3cmJpYVp6SHdWK01Ba1JQNmVYSW5rZzlFdENIZCtX?=
 =?utf-8?B?aVAvYlFXV1FiQnpQcDU3MHRQZnJnWXV5M2NCdE1CWjIybkp6bkY5VWF6QXFx?=
 =?utf-8?B?K0xVNUxIVG8vYnNncEo1Z3Y4NUJRSG5reTNwZDJuc2VVaDlGb3A0UExNaTZU?=
 =?utf-8?B?akVMMFp2Vm9BPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y0NJZkpCelhtN0hTMDRCN2ppWHFIby9qOWtxcGZjQnZ0TWRnc2V6U2ViVzJG?=
 =?utf-8?B?STVqb0RySXd5dlBOclBibWQxOUcvZ1dSSFJua2JBSjBPaUErOHQzR1BPSXVF?=
 =?utf-8?B?VTBrY3NlZjF4Mmdqeklmbk9iWFhVSDB3M0RFajNqOFFVOC9PVEVKZ1lHWmdD?=
 =?utf-8?B?ZXB0b0ppSVcvRklvWnVhNDFWcjNTVDR3eXVpWXRDNCsyZDFpZE1XMEl5Yjls?=
 =?utf-8?B?Szg1bkQxamdpVHF1NkR3SUE2dUswdGVPQUtSblA5aENaY0NvaGxkZ0M3L01T?=
 =?utf-8?B?OTlIL1h6dUVxeGdxU3pPek1WYlJ5Z2llekNraUJzVS81WHdoUVNyQTZqQ3Bn?=
 =?utf-8?B?ZklET0pXbVVQMmlDRlRhNHlBS1U2cXFzTXNJZWU1ZFZXd1JtNWxkcTd0WGZB?=
 =?utf-8?B?RTZPbmtmMFpkUmZrOCtHQy9OeXZRVnBVcy9tZERvMjdCRkVsNExqM1JSNHM3?=
 =?utf-8?B?MDVpbStvSzBDVFdObU4yMEJURFMybjV0VEJMam9hcmwxa0M4bFF3c3dsSzYr?=
 =?utf-8?B?QUdtOXNjVzdQZldzNlJySjJlRjR1cCt5ZEk4cEZIYml0dnI2ekU1SWFIN0tJ?=
 =?utf-8?B?bUNUa0NlL1JRdGRrUXZLTkgrc0FZakpEQ1RnRHJGYmJGWHRHcENzNDVyRElZ?=
 =?utf-8?B?Sm4yNjRVQnhYVjdCYWFZVmlUZnEvUWxrMHBxOUtZMU9QQmY0WnYyYVVnOFlI?=
 =?utf-8?B?d25qQ1NYWldoeEJSTXVoT2l6bDU2TzR5bDdvbWEvMGkwQWxOL0R0V3RCOE0y?=
 =?utf-8?B?am5UUk9PYjVPMVo2UG1EOFdDOWthTDR2U2MzLzNsQmJqZTZZcmlYUHpFNmVH?=
 =?utf-8?B?YWFwZXpNeGRnWGd4akhZUWFnbUFONjFWMUs5UVdTY29GRVVIR2Vva2dvQ24z?=
 =?utf-8?B?YzdSS2ZhVW92cEFDbjRRdUdzMGhVWHQ3WWRpTGxqS0w4Mm94L3k1Tjd4YTRB?=
 =?utf-8?B?Q01tcmY2Z1F1ZUM0MkhSZkV1dlRmSlFFZkFqNXVpWVE1Yi9GS2FEYzRMTGEz?=
 =?utf-8?B?ZjhidmM2bmgwdkUyRkZRUUsvZ2RWM1Y5ZmJTdGF6K0VJcC9FbmQvZnhpLzJI?=
 =?utf-8?B?OGxuSG1VdVIzck1zRkNldVQyM21ac1oyYUdHSTBkQU80V0NWRmVzcFhlNHpE?=
 =?utf-8?B?UUdtNmtySXdZVDBySTZZM2JCemE5YjY1NGp6WjMrQzNWV1NSbjVlTTk5SW1l?=
 =?utf-8?B?bjFaUHFpYzZjRFJwV2hLV2JOdGt6ckRTSmNTZEJaMTUwSkdnYzd6TFc3UEtD?=
 =?utf-8?B?aFZMT0lVdjlLN1E1Q3F3aVVJTVNhbGlxQlQwRm5POCtFVE5KMDY5SmhLdEo2?=
 =?utf-8?B?ZFBST3RQWHliNUgyNHJkaE5XQ2dUSlZRRzQwaTdEeVN3eCtON2dMQXF4RHZG?=
 =?utf-8?B?bmZuY2NGNis2bTkzckNUWnRoUzFhMlZFaFhVVE5QMmNaZWdGSFkrc2VXTlhr?=
 =?utf-8?B?UnhYcy9UOG9QL25wVzRtZ0RLSjZmVngybWdabmh5Y2pSYStqK2NuTmxsTDdH?=
 =?utf-8?B?MlVEZlBYZlQxcnA4NnhIRUFtQWdJWGJFVTRvaGI1aURlbEphM0hjdzVpOCt4?=
 =?utf-8?B?V0ZOWlNiOGtoNGhJb0RSbGliV0N2TVFnZXpHV25jSFZ5d2d4OXJOeWs1aEky?=
 =?utf-8?B?T0lBKzJIUlFMdXlvOHFuTjQzdWRvbWMwTlhxRkhJUm9mejZmRTJJTUhNMU5O?=
 =?utf-8?B?UVRVdG11T0x5NFpxWE1DaDRDbWVPbzRFVXBBK0NSVFc3TVVWd2t3dkN2bm5u?=
 =?utf-8?B?VjZ6VGIyYXpLUnU5M285b1NkUDRQb1NzT2tsNWlpd2MwdDE0VDdlbWM4dzUw?=
 =?utf-8?B?RjhJZElRdDFmRnY2M1JFK0swVmdXWW0reGsycUlmTm50a2pmRkZpc1lYdDBI?=
 =?utf-8?B?K0h6bktNOC9pNzVCZW9RQS9LZmNacnR0Qm5jbmpkOERMVlFlNDcrMXU3dng3?=
 =?utf-8?B?WXVNNkd2RlN1b0NKWXhhdnFNaUsrM3c4ZDFvVzZNNElma2lmZ1dWUjZsOWNS?=
 =?utf-8?B?eGRoelBla1VZQjkrUzZ2dzN5ZFUyYk1yR0laYU90YUp6UUE1VEc4SElyNmR5?=
 =?utf-8?B?ek91ZU1KSWZyVHJJZHRyYmlLNmZEYW5QUkRaNXZIZ2U5aDFMZGcxZlJubGdX?=
 =?utf-8?Q?AxV5U2f1ytrDqGQX4016Njfg7?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee4a7930-df85-4ee4-c571-08de2ef99c2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2025 03:44:33.4710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gwM4zyhH61Rnzhk8m1Cxqu3hVV7dL2eVWtXbEp+VNNsydYID0UFCyb4JQLZzFuP0ldpq6hoR7698mZ3pU0xClQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyNiBTYWx0ZWRfX8Kz5EoyvFNeJ
 tU+jUd5IrXDPLjbanvG+9dVMdGXqcww7kyKDn5Ggt2QJMz4u1czC1zoJ5O2loIPJBriv2iOlvc/
 qU3971TigvYszLxDkgV3CkfEJ0RW+2jDLiq1DAxtFC+LHLBLv4PC8tO5S9QStP7pnYJUVxEcZvC
 uAL2aBCAI4XeGUUgSFYB8BWHFTPjANTAFtp2gzKdUlYGetXBJa0+Sw2Im0RVcROw+ZfnVzY3YAc
 nczF8AAXXdHoQCveEDj3+E8FRDBDbaQeYRRm8tbXbacr//MghKO+WKAAQEGvf8rNFsfug6WHQdX
 tzeDiwaq9t1OF/LN8vO7rb4RYxg60NL8CfrRlRRuCZoDcNXfIPyDu8iS2vAdLHzXqAkLBBZDR0I
 qPaWtp7VOblzz0h824OeH+yUFBnlDg==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=692a6c24 cx=c_pps
 a=RzNzSA3Xhmsnv5027CV2rw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=xNf9USuDAAAA:8
 a=danhDmx_AAAA:8 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8
 a=gTvrX_570HQyRvwvmtkA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HHLBUv-frH7mQyrxomdRkytyvDUbGnix
X-Proofpoint-GUID: m7fSCv5IydbCDsJIsMJ8wRVdGzdwnYiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511290026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Nov 2025 03:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226924

T0suIEknbGwgc2VuZCBvdXQgdjcuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+IA0KU2VudDogRnJpZGF5LCBOb3ZlbWJlciAyOCwgMjAyNSAxMDowMSBQTQ0KVG86IENoZW4s
IFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtSRVNFTkRdW1BBVENIIHY2
IDEvM10gYmFzZS1wYXNzd2Q6IGFkZCBjbG9jayBncm91cA0KDQpJIHRoaW5rIHdlJ3ZlIGhhZCBh
IGRpc2N1c3Npb24gYWJvdXQgd2h5IHRoaXMgY2FuJ3QgYmUgZG9uZSBmcm9tIHN5c3RlbWQgcmVj
aXBlIGJ1dCBJIGRvbid0IHJlbWVtYmVyIHRoZSBjb25jbHVzaW9uOyBjYW4geW91IGFkZCB0aGUg
YXJndW1lbnRzIHRvIHRoZSBjb21taXQgbWVzc2FnZSBwbGVhc2U/DQoNCkFsZXgNCg0KT24gRnJp
LCAyOCBOb3YgMjAyNSBhdCAwNTozNCwgQ2hlbiBRaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8UWkuQ2hlbj13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
Pg0KPiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+DQo+IE5ldyBzeXN0
ZW1kIHZlcnNpb24gKHYyNTgpIGludHJvZHVjZXMgYSBuZXcgZ3JvdXAsIGNsb2NrLCB0byAiZW5h
YmxlIA0KPiBhcHBsaWNhdGlvbnMgbGlrZSBsaW51eHB0cCB0byBvcGVuIGNsb2NrcyB3aXRob3V0
IHJvb3QgcHJpdmlsZWdlcyIuWzFdDQo+DQo+IFRoaXMgcmVzdWx0cyBpbiB3YXJuaW5nIGF0IGRv
X3Jvb3RmcyB0aW1lOg0KPiBXQVJOSU5HOiBHcm91cCBjbG9jayBoYXMgbmV2ZXIgYmVlbiBkZWZp
bmVkDQo+DQo+IEFkZCBncm91cCBjbG9jayB3aXRoIGdpZCA4MSB0byBmaXggdGhpcyBpc3N1ZS4g
VGhlIHdoZWVsIGdyb3VwJ3MgZ2lkIA0KPiBpcyA4MCwgc28gODEgaXMgY2hvc2VuLg0KPg0KPiBO
b3RlIHRoYXQgRGViaWFuIHJlamVjdHMgdGhpcyBwYXRjaCBiZWNhdXNlIHRoZXkncmUgdXNpbmcg
c3lzdXNlcnMgdG8gDQo+IGhhbmRsZSBzdWNoIGdyb3VwcywgaW5jbHVkaW5nICdjbG9jaycsICdr
dm0nLCAnc2d4JywgZXRjLiBXZSdyZSBub3QgDQo+IHJlbHlpbmcgb24gc3lzdXNlcnMsIHNvIHdl
IGhhdmUgdG8gYWRkIGEgcGF0Y2ggaGVyZS4NCj4NCj4gWzFdIA0KPiBodHRwczovL2dpdGh1Yi5j
b20vc3lzdGVtZC9zeXN0ZW1kL2NvbW1pdC9hZjk2Y2NmYzI0YmM0ODAzMDc4YTQ2YjRlZjJjDQo+
IGRlYjVkZWNkZmJjZA0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRy
aXZlci5jb20+DQo+IC0tLQ0KPiAgLi4uL2Jhc2UtcGFzc3dkLzAwMDEtQWRkLWNsb2NrLWdyb3Vw
LnBhdGNoICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKw0KPiAgLi4uL2Jhc2UtcGFzc3dkL2Jh
c2UtcGFzc3dkXzMuNi43LmJiICAgICAgICAgIHwgIDEgKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAz
NSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgDQo+IG1ldGEvcmVjaXBlcy1j
b3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFzc3dkLzAwMDEtQWRkLWNsb2NrLWdyb3VwLnBhdGNoDQo+
DQo+IGRpZmYgLS1naXQgDQo+IGEvbWV0YS9yZWNpcGVzLWNvcmUvYmFzZS1wYXNzd2QvYmFzZS1w
YXNzd2QvMDAwMS1BZGQtY2xvY2stZ3JvdXAucGF0Y2ggDQo+IGIvbWV0YS9yZWNpcGVzLWNvcmUv
YmFzZS1wYXNzd2QvYmFzZS1wYXNzd2QvMDAwMS1BZGQtY2xvY2stZ3JvdXAucGF0Y2gNCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uYWY4NzE5NDlmYQ0KPiAtLS0g
L2Rldi9udWxsDQo+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2Jhc2UtcGFzc3dkL2Jhc2UtcGFz
c3dkLzAwMDEtQWRkLWNsb2NrLWdyb3VwLnANCj4gKysrIGF0Y2gNCj4gQEAgLTAsMCArMSwzNCBA
QA0KPiArRnJvbSA0YjNhOGYzNDcxNzlkN2UyYTEwNjJlZWVkMTNhNjQ3NGRlYjI4NzI4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgDQo+ICsyMDAxDQo+ICtGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRy
aXZlci5jb20+DQo+ICtEYXRlOiBUaHUsIDE2IE9jdCAyMDI1IDA4OjQ4OjQ5ICswODAwDQo+ICtT
dWJqZWN0OiBbUEFUQ0hdIEFkZCBjbG9jayBncm91cA0KPiArDQo+ICtUaGUgY2xvY2sgZ3JvdXAg
aXMgbmVlZGVkIHRvICJ0byBlbmFibGUgYXBwbGljYXRpb25zIGxpa2UgbGludXhwdHAgdG8gDQo+
ICtvcGVuIGNsb2NrcyB3aXRob3V0IHJvb3QgcHJpdmlsZWdlcyIuIFNlZSB0aGUgbGluayBiZWxv
dzoNCj4gK2h0dHBzOi8vZ2l0aHViLmNvbS9zeXN0ZW1kL3N5c3RlbWQvY29tbWl0L2FmOTZjY2Zj
MjRiYzQ4MDMwNzhhNDZiNGVmMg0KPiArY2RlYjVkZWNkZmJjZA0KPiArDQo+ICtOb3RlIHRoYXQg
dGhpcyBncm91cCBpcyBuZWVkZWQgYXMgbG9uZyBhcyBwZW9wbGUgdXNlIHVkZXYgZnJvbSANCj4g
K3N5c3RlbWQgYmVjYXVzZSA1MC11ZGV2LWRlZmF1bHQucnVsZXMgbmVlZHMgaXQuIFNlZSB0aGUg
YWJvdmUgY29tbWl0Lg0KPiArDQo+ICtVcHN0cmVhbS1TdGF0dXM6IERlbmllZCANCj4gK1todHRw
czovL3NhbHNhLmRlYmlhbi5vcmcvZGViaWFuL2Jhc2UtcGFzc3dkLy0vbWVyZ2VfcmVxdWVzdHMv
MTddDQo+ICsNCj4gK1NpZ25lZC1vZmYtYnk6IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNv
bT4NCj4gKy0tLQ0KPiArIGdyb3VwLm1hc3RlciB8IDEgKw0KPiArIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQ0KPiArDQo+ICtkaWZmIC0tZ2l0IGEvZ3JvdXAubWFzdGVyIGIvZ3JvdXAu
bWFzdGVyIGluZGV4IGU1NGZkMWQuLjZmODQ1MzkgDQo+ICsxMDA2NDQNCj4gKy0tLSBhL2dyb3Vw
Lm1hc3Rlcg0KPiArKysrIGIvZ3JvdXAubWFzdGVyDQo+ICtAQCAtMzksNSArMzksNiBAQCBzdGFm
ZjoqOjUwOg0KPiArIGdhbWVzOio6NjA6DQo+ICsgc2h1dGRvd246Kjo3MDoNCj4gKyB3aGVlbDoq
OjgwOg0KPiArK2Nsb2NrOio6ODE6DQo+ICsgdXNlcnM6KjoxMDA6DQo+ICsgbm9ncm91cDoqOjY1
NTM0Og0KPiArLS0NCj4gKzIuMzQuMQ0KPiArDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
Y29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuNy5iYiANCj4gYi9tZXRhL3JlY2lwZXMt
Y29yZS9iYXNlLXBhc3N3ZC9iYXNlLXBhc3N3ZF8zLjYuNy5iYg0KPiBpbmRleCAxNzc5MjdkNjc0
Li5lNGUwODkwMjkzIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBhc3N3
ZC9iYXNlLXBhc3N3ZF8zLjYuNy5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9iYXNlLXBh
c3N3ZC9iYXNlLXBhc3N3ZF8zLjYuNy5iYg0KPiBAQCAtMTMsNiArMTMsNyBAQCBTUkNfVVJJID0g
Imh0dHBzOi8vbGF1bmNocGFkLm5ldC9kZWJpYW4vK2FyY2hpdmUvcHJpbWFyeS8rZmlsZXMvJHtC
UE59XyR7UFZ9LnRhcg0KPiAgICAgICAgICAgICBmaWxlOi8vMDAwNS1BZGQta3ZtLWdyb3VwLnBh
dGNoIFwNCj4gICAgICAgICAgICAgZmlsZTovLzAwMDctQWRkLXdoZWVsLWdyb3VwLnBhdGNoIFwN
Cj4gICAgICAgICAgICAgZmlsZTovLzAwMDEtYmFzZS1wYXNzd2QtQWRkLXRoZS1zZ3gtZ3JvdXAu
cGF0Y2ggXA0KPiArICAgICAgICAgICBmaWxlOi8vMDAwMS1BZGQtY2xvY2stZ3JvdXAucGF0Y2gg
XA0KPiAgICAgICAgICAgICAiDQo+DQo+ICBTUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2Y4Njk4NzBm
ZWQ3ODYyYjU3YmZhOWU5OWNkNWNkNmYzNjVlMjM0OTcwNWExYjY1YWY3ZmMxODI2MjliZDFhYiIN
Cj4gLS0NCj4gMi4zNC4xDQo+DQo+DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzIyNjg4MCk6IA0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIyNjg4MA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMTY1MDk1ODgvMTY4NjQ4OQ0KPiBHcm91
cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVk
ZGVkLWNvcmUvdW5zdWIgDQo+IFthbGV4LmthbmF2aW5AZ21haWwuY29tXQ0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPg0K

