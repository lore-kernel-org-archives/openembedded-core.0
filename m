Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 038DAE83063
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 09:09:54 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12615.1770109790278808665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 01:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=BlmAJKTj;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.7, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHI0t6/0BdMH4uqu+RndhPK4V4rm0ShgFGldFRVV1RscKVkawspBXXK0rC4iWWeYk+unP+Z0X422B4AsWg6DLwkV90uiB8CipaxD9pZ39Mm5/3KkvEAqA2l+rgvgvNtiqnI2PgdZ36Lx2+xTVVTSXi255pCmWOGKF9IFpRWtG6Ebwph88t1RX7FEYFjtdwkqB6tQWJoOBQ4o0oRS+SGXuKenrLtLCTrDGAZiyJMrQ75n0DoI7L7RynAJXXOHtZX682rz/fEz9DAwwqQY5SWaXcxqV+0V4MrK8ytYuvqQer2AOvDE6bPfFqDVGbUCN6WJtfba2uEPowC0HEHkhZd+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6W1166USilshHv5So4SjI6mhbSmXnP7Ca5e7ut/atQA=;
 b=AOfVk78jJshKhlbTLXwRM+y3Iyst0QpUXcwzDLk+7gqgI8vrmpE0T4vfSK8+Z5LDpf+oljw1+lLw/UIc7YOkbJL0kaLftjG4+zt/gUwquvcol4RXQGfNLKRlPvs2Nre6/Q29vrQ6mD/QWlJJlS9TdIPyRz6yYSyePDd8EbudBZQ+p5kDUkB+rmNEvfag13Jmo5WZg05pXT/CFuKlHPft6bQSu3xIfOqcj/Hl0BFMapbdgW+zpbkawiFIZt8BlSuHFI/8Wa4jmCQ8wT5ltJyQhMRJI8lxCIAvz+ywF78L4PbxIF+ieeayMWMj8pNHXxWeGXiU87fP3wRXXdGVRQP87Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6W1166USilshHv5So4SjI6mhbSmXnP7Ca5e7ut/atQA=;
 b=BlmAJKTjyWEv1S8Ok4JmoVvzxAR3IG9iiLppEIzra24XJ+IbBN6cFy/NdmdNrKNT94UzcTMSRVBIjbY8WFehtL96JjK3R8fHKIrtbfEGI8jh8SUphTexZssrlHU300y4pSMzD3vbMMfzII6dR/ujMF5hXX/h3bRP2wyU2SL70zjmX2nJul501GnTpkTKUBBTSLOduzKnpUxlNvCr+brV0OW9alvfBbJ7qDiJ5ZiEZGQ3DTqfvAHk0qhsHiIdd5BIJwDfCU4Flion6CYWierSzem1YsMYHbIh8rWRF9DhNOjJX9YDPY1m1V6Apey9+hig/q0kadD9QnUVm5QnbioChw==
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by OS9PR01MB16921.jpnprd01.prod.outlook.com
 (2603:1096:604:410::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 09:09:46 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e879:dd8f:65fd:b1a8%3]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 09:09:46 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0.46.3
Thread-Topic: [OE-core] [PATCH 16/17] python3-wheel: upgrade 0.46.1 -> 0.46.3
Thread-Index: AQHcjsDC1KJcyp2YnEKoPdFnjY+xYLVnzUOAgAju32A=
Date: Tue, 3 Feb 2026 09:09:45 +0000
Message-ID: 
 <TYWPR01MB118611F7E01DE48387E26B4D7DC9BA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <20260126123844.1052-1-wangmy@fujitsu.com>
 <20260126123844.1052-5-wangmy@fujitsu.com>
 <DG0DGSLH43T6.27SQHKZ8XUB43@bootlin.com>
In-Reply-To: <DG0DGSLH43T6.27SQHKZ8XUB43@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9ZDViMTMyNWItMjVkZC00YWJiLTg4NjktMzJlMWJlZmI2?=
 =?utf-8?B?OWFjO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI2LTAyLTAzVDA5OjA5OjQxWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|OS9PR01MB16921:EE_
x-ms-office365-filtering-correlation-id: 7dc4f50b-e732-4d66-3f2d-08de6303f9c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|14052099004|38070700021|1580799027;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cmZHTFpMM1I2L29zMXZ5am94ZDdMVC9HM29zdHVlS2Ziemc0Yi94UmRNU2RU?=
 =?utf-8?B?aTh4b3lqVCtURHcwb1oyaGt5L1BQWm5ieHRKSDlaeVh3UzY3b3NvdHNxWncr?=
 =?utf-8?B?cHd4dnNmcDJpb1gxVnlHdENrWXpiVkZ0aURTcVE2RXU2QjlBQUdwaG1jMSs5?=
 =?utf-8?B?Yk5KRXhrSDBxOG1kZ2IzV2JPdlY4dWhHMVQvc2NialJqVEo0VTlmRElPNkJN?=
 =?utf-8?B?Smd6UDRlMEx5OGx3Q3FNa2VqVWYwTi9wVFNtRy82NHh6c0xKNGhWaUNvOVNC?=
 =?utf-8?B?R2NkNGFXd1c5YWtrTjduUDFXT0QyRWRKeUhDb3ZSMjhvblhHcy9hRDdReWRM?=
 =?utf-8?B?dDRhQlhDdFhvb3MweTNWUHFqVUZoVFFsWXY0WTNKYjhmYzVDdmhnM1ppYnVV?=
 =?utf-8?B?Y3l0dUZhVnZnelRGSmZqOU9VTDZENnJZc0xHTWU3Q3lZQUFUTEgzcEpyUVYw?=
 =?utf-8?B?R3MxVXBiNGNrQm1qYXJRUGNhWTdRYmZpaG4xelAzUm4vTHoxVmtPNU9Zd2Vn?=
 =?utf-8?B?N2FuNXVNOVQ3L2ZsNmRNbm9oRm9CdytRNGpLaFpsby9PNmtXaHRoa1hFTmJD?=
 =?utf-8?B?N2ZBUmt1NGp2Z0NxaHJXQk9iYjNoTUh2NWRFVk1VcXRXZFZYR3k3WW5sRnVt?=
 =?utf-8?B?UGFVRDRtNktMam95SjlJWkdxMW1oWlF0TU1NbWtINmlYa0RyTFdjNERkWXBp?=
 =?utf-8?B?S0hqazNFOUVQdXZjdG1kNy9wb3VBOStaVWd2NkVndHpYT082LytQNnRWQzNC?=
 =?utf-8?B?c0JiRXRmQWJ6bmQ3SDVBTFpxZDM3dTZCK0pRbFdlTWIrZitXdWp3WTNMait3?=
 =?utf-8?B?aUc5QTRqMkdSMXZmR29qc05LUFM2RzhiQzk4LzI0MWhETnIwTTJ1RmRNdjM5?=
 =?utf-8?B?U0l0RFpKUkdOSkdPeE96bmtXYTBtSldMMlZmWDQ5Z3pPUWs3SVhwc0xHeUcz?=
 =?utf-8?B?UWI1MDlXaTRiTlFqVExvdkZZSFZ6WW04ejhFMklTRkpuNjJYUDJNTTA1NzI3?=
 =?utf-8?B?RGZHaEFrelNFcU1nTEsxVFJnSUJIWlpEdVBUb2F2ZTRZcEpLYjBGd1BqRUxp?=
 =?utf-8?B?MGRzb1pQditZMWhTaTJlOXZEWGQ4U294Yk9WbmZibFZ6OHVqM2Z1Q09XcGFK?=
 =?utf-8?B?R0FFOS8xRHlFZkJJSEpLMm91Q1lUVjQvRURXSmpLTkFqTzZqUktPbjdKZkUy?=
 =?utf-8?B?TjZBcXNBczcwcm1yQlhtc0pUY0hnbE1TMkNLQVUrby9TdU5QRi9ZMDl6SzlK?=
 =?utf-8?B?S2trOElOOC9oVlZjSzEwVEErRU9mbDcwUGFVaFFwY3dnRnRNVkladFJqcE8z?=
 =?utf-8?B?djIyZkI5SEk5R0dZQXdJc25JSXFUem5VdlN4QlhJWUNJaVFDMlRxVEQwYXhl?=
 =?utf-8?B?aEl4dEJPS1VCMEQwN29DMFhkNHkxUVRsSCthcmY5YXdWNW52VC8xMVlKNGFU?=
 =?utf-8?B?SjI1cXQ5cE9LSzNtMTJsTFIvOEVmZTdDT3FLZE9UKzNHVWlwM2RlTVk3TlJW?=
 =?utf-8?B?bllKUlJxSW5hc1l3WmZGc25PU0NBVVRLbVRTZWJZNzMvclJGRHUyaFYwTk9t?=
 =?utf-8?B?V21LcXRmczYrNjNjb3l4SjJUZWZuNzlOdVd1eVhXbk1oZ0d4VXl1bVdZRVR1?=
 =?utf-8?B?djBacUtMYmxnVnVBLzBYZWxucHBCTTJ4bWpLUGFJdmowUzZsaU8rb0ZTdWpG?=
 =?utf-8?B?TWFEcUlPb3pKUnZiWDFJa3JocHlEQnpyK3dHazBpanptTlJCczErUGd2Sndj?=
 =?utf-8?B?MlVxWDhwV1EwU2JKK3Jmak9mbUxQMWRZNCtpK1gweU9reC9ab1dpSEF3UTJr?=
 =?utf-8?B?V1BJTmNFQzdSK0FyNFNHS0UzYlIyc1pyVk9ySDB1YjdGMVBSZkY0eG9BOG5k?=
 =?utf-8?B?UmlFeGhOdVVWeGZlaFFhWXVrQ0VsbENJalkxNm1SQmhFZ3pVdElvVk8zYmlT?=
 =?utf-8?B?dXZlSHVpSHZmRVZRTVN3b0IwQlFwTzhod29CR1JUcTVSMG5Oa21weXlKSFcr?=
 =?utf-8?B?a0JESXFGMkVrNjZqbWhqY1RXSU43c3dFamYzL0lILzhIOGloa0c2MGpLci9t?=
 =?utf-8?B?Q2pKbkVlMkc4MEVibXM0V3ljK1kvMFlySGh1NGVCMCs5elQwTlIwVEdUQkR6?=
 =?utf-8?B?N0JrMmJFUmhtdEc1bTltM2lLTXhjam85VXBJQzMrVzRlQS9mbHdJM3hKMDha?=
 =?utf-8?B?R0E9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(14052099004)(38070700021)(1580799027);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RU9ETVNCWHlPMzNGSmNNaGpFTEoxT2RWY0hNcUxxenNZY0VOSS9DM3QyVEpw?=
 =?utf-8?B?Mlk4NjVQTE93UEJRQzNCVEppOGFEZ1ViWUN3eU9sTzZvSmlPRWhEeDV1OEZs?=
 =?utf-8?B?RkFDa0R3b05uZWFWbldCUXlrWlMvZmlXaS9xKzJCTVhqRklYb1lsYUtuc1pB?=
 =?utf-8?B?amllVzlCQ1d2OCtwSExXK2NoMkZQMk5pL0NrNXBuVWplQmtmU0pQUWJQejhp?=
 =?utf-8?B?dGhrbUpqOGZ2MnYxaVFRNVNsWEptdFN6VTcxRk94eWdpOHFLdmo1WFFDcXht?=
 =?utf-8?B?ZFArclc5TU1JdHBwTkoxR2MyandYcFVGeE5waHhyenFKTFUxNjMzQiszblNn?=
 =?utf-8?B?czhRMVJWVzR0b2swWHhzbkZDVEZ5WXo4TFpnUlBoYlJZVGlGYTRhcU5hOVFB?=
 =?utf-8?B?eHpqZDBlL0xTdmplTW00OVVzSXJScnBkT0tQVGFzK2tHQWZmZ1FZTmEzazYr?=
 =?utf-8?B?cWRqTDErYnBFdk8vRGZudWRNSnUyMHpqdmlUY1AwLzU0NXdhaWlpTDR3VFE4?=
 =?utf-8?B?aXNNby95Qmg3ekRlOFo5YUdYY05nWkcxZ0tZMnBqcXNqZXIwcUIxbkllckFj?=
 =?utf-8?B?NERicytCRmdHTXRlQ09ORlBwY2lkZnYxYks0Z0dDT0F1RXovTlBqOE1HRVJB?=
 =?utf-8?B?WHQ4U2UvQzlIbGNrcjdubW5LVHB6Vy9vMDB4WGpKUkdSYWRHQVJQU29OQVNl?=
 =?utf-8?B?dUpRRVRVOFZEM21KWFhZWVJUNlRydWErVjE1QWFoUURqYVhEWjBSY3B4a05R?=
 =?utf-8?B?cTVUSU1udjNhUEdhTURUeUVRaEpZTE5qMkxxenJ6ZklQRHJpZnVmTGVDRzBX?=
 =?utf-8?B?YUZEdndrNW5iSkFnTDBrenRVVUEzR25vL2ZEK0tyalVKaVpFaGRLTUhWMUFD?=
 =?utf-8?B?Vmtyd29RRFdnS0w1L3pKbXkvK3IxZjhnSVhaVzBqakJFOHdVQU02bzI3K3d0?=
 =?utf-8?B?Rm1NS280M3FPS0t0QjRiUEgvSnpKM2QzUEwvMGdFQXpNa1kvTUl6TXY2N2Vn?=
 =?utf-8?B?TG8wbWVBNWpTaFF6SFVnRTBYamVUWnJ3dEQzQ2FKMzQ4Tnhha2pYaFdKc2Jy?=
 =?utf-8?B?ZWZJeW9IMzEvYW42cndDSXI2cDZsMVE5Ulh5SnBjZHduMk93YkV5Z0JFWEp6?=
 =?utf-8?B?WmdJS3M3OVRwSHBpOUU2dzhKZENrRjZkMmJUNFQvWjNkbVNLcjBqWW5ScmVk?=
 =?utf-8?B?ZHg0MzlFQ1ZHbisxUDRmZzV1N0d0eHk5OVFuV0E3cDdkVlZjVkE0bjhuM3Fr?=
 =?utf-8?B?RldxejRmSU1ZWGRaOWdmSCtzMFlTbnpLUTBSRWo4T2swQkp0S01PdG94VGhV?=
 =?utf-8?B?ZVVyRlVxeWpDc3BHZUx4VUJ4WXA0YjIxZzdMbFh1czhCaFZjenl6bXBScjRw?=
 =?utf-8?B?WTRHVkkwNFZ3b2ZiM2grM3JEaksxTE5uVUNuVVBkQmJ3c2FaOUNzZHVQMWVu?=
 =?utf-8?B?MDl4ZFRMNGFUc0U2bEFGNlR4bnVIemtMM2RoL3ZTai9UdXM2WU0wNGZqaFJF?=
 =?utf-8?B?R1YvUUZHWjJYalQ4QnRMcldKamQxQlBUS05GQXEzMzQrYTVldi9PRnhMYzc3?=
 =?utf-8?B?ZWc2aVdXbDhXTlJxeFJmWkg3Z0dvWktxZVozbG44WHZDRElUVVN2VEZQa1Bh?=
 =?utf-8?B?Ti9lcE5oVThuN2ZzejFueHVKUFFtVDQ5RC9SZDFtLzhGWU00UHBubWZ6a3Qy?=
 =?utf-8?B?S3E2c3UyVS8wSG5qcVNWNmZVSGVQMUpNbE9Gb2U1dWdkdmZSa3RkdEhXd1lL?=
 =?utf-8?B?dWkvS2NOS2xWTE41cmxYVHZqMmVBM2pHRmxqUStLNHRlUWZSWU5WR2thL2wy?=
 =?utf-8?B?SGpNQTl5WVBhUjhnMVNiaC96aXh0Z05HOEh5TVQ2RVNKZE9IVHEreEdQM3Fh?=
 =?utf-8?B?dXdldDRlcENqc3NPbSszYU9hcXlvd1lQUUQrdHU1TnRzeDZlbElrM3Zjdzcy?=
 =?utf-8?B?d2NHTkE3UHpRL0tsaHBqVWNhaGQzMUQzeXBOclUwTGVaWjJtUnlLc3lhbEZ5?=
 =?utf-8?B?eFBzazNKTHduUTFlMERxVDZlSkwzcDJabmU4M3o3WVMvNkpiYUk1NUNTV3kv?=
 =?utf-8?B?WExjYjhZWk9vVFJ2Lzl3WHVBSDNiRjNHUGYrMGh1TE96cTZEM1Z3S2pHS0w5?=
 =?utf-8?B?Mk4vTS9hS1JUdE9DSEtXd0ZhRUxXMGR5bzEzM1IxKyt2VUZNbWU1dFk2QitM?=
 =?utf-8?B?Vm1mNjEzZVMwWFlzY1dTazdnL1dTSzVzSENXblg4N01iM3BLZ3YvTDNzc0lx?=
 =?utf-8?B?cFRuMWZ2bi9sVDhLc21pOWovbFFNL1psMmZNTXNLMlRpZWxMTTNqNmkvQ3lW?=
 =?utf-8?Q?t08GYasf2BKceqhMbS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc4f50b-e732-4d66-3f2d-08de6303f9c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 09:09:45.9497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zlFClt4WuMolH7tO7AfZ2M/x5tdKArOi2O9ntfAH807AGBlByrNw86lHEHE4a1PyaMskAv9NRK04AhzDwFCSFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16921
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 09:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230421

DQoNCiAgLS0NCkJlc3QgUmVnYXJkcw0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQpXYW5nIE1pbmd5dQ0KRlVKSVRTVSBOQU5KSU5HIFNPRlRXQVJF
IFRFQ0hOT0xPR1kgQ08uLCBMVEQuIChGTlNUKQ0KTm8uNiBXZW56aHUgUm9hZCwgTmFuamluZywg
MjEwMDEyLCBDaGluYQ0KVEVM77yaKzg2KzI1LTg2NjMwNTY2LS04NTY4DQpDT0lOUzogNzk5ODg1
NDgNCkZBWDogKzg2KzI1LTgzMzE3Njg1DQpNQUlMOiB3YW5nbXlAZnVqaXRzdS5jb20NCg0KPiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQg
PG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEph
bnVhcnkgMjksIDIwMjYgMTI6NDUgQU0NCj4gVG86IFdhbmcsIE1pbmd5dS/njosg6bij55GcIDx3
YW5nbXlAZnVqaXRzdS5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDE2LzE3XSBweXRob24zLXdo
ZWVsOiB1cGdyYWRlIDAuNDYuMSAtPiAwLjQ2LjMNCj4gDQo+IE9uIE1vbiBKYW4gMjYsIDIwMjYg
YXQgMTozOCBQTSBDRVQsIHdhbmdteSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90
ZToNCj4gPiBGcm9tOiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAtLS0N
Cj4gDQo+IEhpIFdhbmcsDQo+IA0KPiBJdCBsb29rcyBsaWtlIHdlIGFsc28gaGF2ZSBhIGZhaWxp
bmcgcHRlc3Qgd2l0aCB0aGlzIG9uZS4gSSdtIG5vdCBzdXJlIHdoeSBpZCBkaWRuJ3QNCj4gc2hv
dyBvbiBteSBwcmV2aW91cyBidWlsZHMsIGVpdGhlciBpdCBpcyBsaW5rZWQgd2l0aCBvdGhlciBj
b21taXRzIG9yIGl0J3MgYSBiaXQNCj4gaW50ZXJtaXR0ZW50Lg0KPiANCj4gRmFpbGVkIHB0ZXN0
czoNCj4geydweXRob24zLXdoZWVsJzogWyd0ZXN0cy90ZXN0X21ldGFkYXRhLnB5OnRlc3RfcGtn
aW5mb190b19tZXRhZGF0YSddfQ0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2pl
Y3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNTYvYnVpbGRzLzEwMDQNCj4gaHR0cHM6Ly9hdXRv
YnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNjEvYnVpbGRzLzI5
NjMNCj4gDQo+IFRoYW5rcywNCj4gTWF0aGlldQ0KPiANCj4gLS0NCj4gTWF0aGlldSBEdWJvaXMt
QnJpYW5kLCBCb290bGluDQo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcN
Cj4gaHR0cHM6Ly9ib290bGluLmNvbQ0KDQo=

