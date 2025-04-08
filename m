Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093CFC36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 02:43:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.65586.1744080197088540662
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 19:43:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6193b5791a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5375doHD005314
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 19:43:16 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4ayca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 19:43:16 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5382hGIk000504;
	Mon, 7 Apr 2025 19:43:16 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2041.outbound.protection.outlook.com [104.47.70.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tyt4ayc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 19:43:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WefrWupR8x0Yyp3MGVSAC+YCL+ZiRAqPdr7GgUHyeHMipJzy0GhF2lzCwTIZQAwYvpC9rHOR6SEbQT+FAlqJQX1xKw9KZqkQSsa9dxlW6aM4DpzsUT3F01iouXfxAJ9TM3iZvacgy1UtMSa1JlreL8yfh0xYVr89tV+KKNQdOAEDc+0AtPH8n8O8AHNRTShwWKPbY19VLID1vXH/kO3pbMxgActvcg1lbNWHl35adIAO6kI0zQbNU+Tb7eK4kPFNhDDYsUOVXwkd1udym5eQx2wU+bC5+4uQS8otWiE/Dnwrb7jf/6AjlruyfYrOazT7HqIOratdSgKmB1fUN3ij0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDv///KsbqpYUX3GJUgnW+R/uQW7SaQ3/XBm4SCqWzM=;
 b=w4AMz9Zp7GlhnvDKMpRLLQ/qEX+Xfz5bBbY6pvEUVaS8v4AAJdg/OpPFTJjrQWNwaCBR6q0J45a+F0OHe9P3Kmf/t+tMLXJ0KmyzKNDP43wJkUk5GQyZskF8ZXUyWmKWiR7Kdjh4BEbPEcFfEHzVhqA1Ndtt6LRErG1bZOGTy/kNIKtMgUcR2rNlyldkmE1KslipettP0LD6wTD9LfQulZBqRePspq5QTDb0raWnTPK0H44sibLy1FmJNfrcl5IW9954GiBRKbuiWrJffGiy3j2E+WZQ2Rui23BSzS8uVNafx0uYX/R110rIbrNXiktFOyv23ArqpLFkSSp8A1MLfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 02:43:11 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 02:43:11 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] qemu.bbclass: move to classes/ directory so that
 INHERIT can use it
Thread-Topic: [OE-core][PATCH] qemu.bbclass: move to classes/ directory so
 that INHERIT can use it
Thread-Index: AQHbpGxyIakl5x4S1ECubwV+dS9TBrOYAmGAgAEUgrA=
Date: Tue, 8 Apr 2025 02:43:11 +0000
Message-ID: 
 <CO6PR11MB5602B8DF97CB29C690B94297EDB52@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20250403074552.971291-1-Qi.Chen@windriver.com>
 <CANNYZj9BwZVVt2Mk61KY0S0NLmD8zR-=a2EDnSccKF7xRL6ofA@mail.gmail.com>
 <61379a9d-d66b-41cb-86f9-56a9208317da@windriver.com>
 <CANNYZj9a0u7ou3AtYANOC+xeXDCQd0nusXAoOm2+aP_BdM_SjQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9a0u7ou3AtYANOC+xeXDCQd0nusXAoOm2+aP_BdM_SjQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|CO1PR11MB4804:EE_
x-ms-office365-filtering-correlation-id: fa531522-4fc1-41df-8128-08dd76471a48
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RkIrRzd4RndhSnJzV0J0QjBUZm9PL1BsZjRGQjF0a2ZVcWdFTWR4UnpXb2Jo?=
 =?utf-8?B?WkorbllHKy9yWG5TaVFwOWliNHJoSlRjUStwUGhPeGFneDBObG92c2htK2lK?=
 =?utf-8?B?eHFncTFWa3FQMmxNVmZtU0l4bXJRVFhVV2liQWZDeVdXUnJzOVNUYXNRY1FW?=
 =?utf-8?B?Yk9IN0VodWxVR2t3M3pwR1owcTgyQ2JXbjN5TDRQYjZ2Sy9xMkFoQ3drczZy?=
 =?utf-8?B?S0FCL1M1RW5LeGFoaFY4RVpBaVdNN2FkOUZNOGxZS0N0Ti9RaFZ6L0VOWFRz?=
 =?utf-8?B?aU1UN0NPNjJvdnZabmM4cVZtTDhIWk05QWNxYzJacUZFQ2FvbWVmeFY4Vnpm?=
 =?utf-8?B?M3NXVktZd29ITlVsSThHS0o0NnhSaDkzSFowTnRBUkZtVUZyVzZSemNJbjdO?=
 =?utf-8?B?cngzSFZ4RFVHRnpyN2lYUFlVZDJvYkw2MWhvOHdIazg1anczditPdk4xZ1l5?=
 =?utf-8?B?eXIrOExMT1pMdHhYR09ZN21OdWp0SERES25LR0dLamIra2VpWnVQenZtdThO?=
 =?utf-8?B?N3A1US9saFZlN1lUcm9WT1RFdnQyTGlPQUtvR2t6OXl6UkJoaDV6c3N1VWN2?=
 =?utf-8?B?MVdOMjJoTTNkNkhtdlcrbEhmdlArRElxU2pDWHIzVzZ3TC84cUcxaWRzanRy?=
 =?utf-8?B?ajA4RC9UUVo2YmdUcXNPR3Bxa2RQcG0yaE1ENjZpL0ZURm1keU42eXVWVzBt?=
 =?utf-8?B?dSt5S0JCMVRLMkxlNjZva2RqRStlOHJtaGROZzN1bWdrOXQwNFF1dDlrbWZu?=
 =?utf-8?B?RURrY0lRaW9NcXBBR2tyWUdSVUtqNmpWUUZJN0RTeGVwN2ROcG1WSDMvNVFw?=
 =?utf-8?B?Q3MyQVc1emFMK3NVV0dMNEZUMnVTOWRFWVZwazJPZXBnZ3VTem4xKzFnRjJa?=
 =?utf-8?B?RnpIZjAzTUxFekljVUxKNFpGYzB2SFhxcHZSZXNjZnRxdWZtTks1MUtmbHhO?=
 =?utf-8?B?Ky9UYktha3pCaWVKK1RSZ0k5V2xlc2pZTDJwYWlldGpCV0gvWTZOWnBxeTkw?=
 =?utf-8?B?OXZ6ZDdVYjEzUG9adnByb2Rhb2FUWXpXbzJCWlQxT3MyWE1MTkIrSmlYMHZC?=
 =?utf-8?B?UDg5NDNJUmtoSzJLQ3RZS2xBR0I3OHRuS1JiRTQzQmtSU0l0Z05IQ1JoUGVT?=
 =?utf-8?B?SFhYb09XRldWMy9VOGwzSFlSOVVSUitaUGRVdHlKQkdUQ1pGNnUvL1NJMnRT?=
 =?utf-8?B?RUg2SHRUOWZaeVJkSmJRM3ZEZFZVaTRpUmYwbWZySEFmbkV2dlZzQ1ZJczhh?=
 =?utf-8?B?eTM0VXF0NXl3WjVBM3V1ZXh3MUNhRGhqOW94eVpjOHVPSFRucXQzRjlkR1E2?=
 =?utf-8?B?WURzdVdrUTQzSy92Zm0ycmRVZnVoUHFBZmZzeGNORjNnVGFzNGlVeHZldEdU?=
 =?utf-8?B?N1owMjI0N2JrdTM4M1pGaVZJY0I2OVhIbkdta0tVV2ZRejJOT2hkOGY2QTY4?=
 =?utf-8?B?ZDJ4RS9lZ25SemxpSlZHcWVWazh5ZWd5aEZNOVMxY3VQQmNsZ0JRdmhwVjN6?=
 =?utf-8?B?aVpsY0ZZb2J0a1RHaHB1dUlTRkhzMm11RnV6NlBoV0t2akNwa0hFUzBLUG5o?=
 =?utf-8?B?YllkckVjOW1WbEhiVlFrUFlSMFRITGFyaHU0RGNtd2Y1KzhxejZjOHRCNlQ1?=
 =?utf-8?B?czZDdmpISnlaSUVmN2N1cUZod1N3cWwrSjBESEl3K2JlTE92bWhDb0RvcE4w?=
 =?utf-8?B?VTF4cDBMSHBVK0ZSVWphSTl2ZmNlYkZJcTNKN0txckNXelFMTml5YWUwMWU1?=
 =?utf-8?B?elpnMEcrSXdqSVIyVkhWa2Z1NnFtNzZxcmI5Y3RXbStad2hGRlI3VjJuU0Fw?=
 =?utf-8?B?b1ppNTdWdXExajRzaStMVzNuUmt5TkpLdkNyWEhWaGt1VG9leW01Qk4zMTZZ?=
 =?utf-8?B?MHgvOVZZcms5SmFpUThXRm1YNEU2RmczQ25ZMjF3akdVdXo3dGdhai8rdnpr?=
 =?utf-8?Q?2srpsFIe16JHP6+I0e0R/qR04tVMe4ci?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aDRqV3M0NjFQcjJncml5RURCc0V2TWVkUmlBUVd5RUxxUkpTL0hFRUdZMW9F?=
 =?utf-8?B?eVloQlI5alpoeE15RjdZU3M4amFPeGNUK2NxSG1IZ0szenJUMnlrdk9NYzJr?=
 =?utf-8?B?bFRmc3NVdmorbDdjV0JRWGVPV2NGdnUxNHU5S1ZlakJ2MGV2anlOUklqQzNh?=
 =?utf-8?B?QWo2a3hIbnZNYkFKV3dYNElxcjhuUnJTNTM1eWRFVmk2T0FqY202ZFlLWnRB?=
 =?utf-8?B?aitiWWdwRGRTbDVkQU84c2FoTEowWmloYnBHR0tsbFM2VTFDMm9JSlp1U0Ez?=
 =?utf-8?B?U3UrNm9NdnAyMnVaVmprUGd6TDRLMklFNkExRWx6cGlxcndFeXdjNEJKOTMx?=
 =?utf-8?B?bEpmUjdKYjZjZTNCVEdYWUpSdUZNUW0xU0FkRmZ1MjFRMTVBZ2xIQzZyTmhq?=
 =?utf-8?B?T3UzS2swTlB0c01YdHBpa25kUHRBL1ZDZi80OXd4MWs0QS9zS2RTVkpaK240?=
 =?utf-8?B?UjdPMVVJdmo4Snp2R0NyU3V0dEZiU0hYa1Jpb0dnS0txbUQvbzlUd25ndVo4?=
 =?utf-8?B?MDBuK1BVWjZ2Zk5MTnJPZU9YODdSRG9HT1N2Z093Mmk2RE14THBOL0R6Z3Rp?=
 =?utf-8?B?bWZzejNGTHI2MFpSa3BlNTR0NXRBK3MrdFlKYUlwLytZaDhsbWtWVVQ4a0RY?=
 =?utf-8?B?V0NJUXpoZkI0REQxNDRjV21QZDNHdmNLMGE2WHFhbkxaK1k5cG16RGV0WUVO?=
 =?utf-8?B?emc3WWcvd0NyVWFGUTlKdml1Mk1VeHpqSkkxMU9COFBzaEZya2U1dXo0bWYv?=
 =?utf-8?B?dytlTlRZa3FWcnBTZ1pnRmhvenQvWXhFZGpHbFpsbDc4Wk92SlFWNXQ4bk92?=
 =?utf-8?B?R1h4aUdoMUlVU25LQ1RLMmdUWU9qc2NVWnA0TUV1MUROUm8yZjhTNzlralJD?=
 =?utf-8?B?Q2dWVkxBN1habzRCTHJIUktIRDM5QlpLNkVHNnFkK2xJSFB5V0x4KzNnVi9w?=
 =?utf-8?B?Tm5NYVJHVERxSDQrMzh3MXFhSmJxaDM3dW9YN1g3L3g2eExmb0RRTHpvV1hL?=
 =?utf-8?B?bGk2V0NoWG9vVmNVcGs1YzFJOGRNTXZoSGhSN2FOeUtZaFZGc2NMWlFLZ3dy?=
 =?utf-8?B?cmJiRFJBeDNzbUk5eVZsZTNvcExIbnMrZERTcm1taDNDVmdpZy9Zak9JRDlW?=
 =?utf-8?B?VVRDam5lckl2NEFkT0kxSlh5M0ZsQWFBcmp6anBvM2crZHZRNU9LNVUxOE51?=
 =?utf-8?B?Y2kxZk4rU3JXcVR0VWszbjJkV0NUbXM0VEZUMTZ2QjF3cjk3Q3BnY29jaVM2?=
 =?utf-8?B?NFRjY3Q3WTVPNFdVcTdnaDhYSXJPOVQ1d21uNU0rQzM3WGsyV2tpS3RCL05H?=
 =?utf-8?B?T01kOEZXWENsYlVTd2xzdTg0cjZqLzZKU09mL01EUEMydU1Ma0ZGOFhIUGVz?=
 =?utf-8?B?V24vM3REdmYwT1FnVFE5UGhMbzlpdnQ1TVYwUFhOc2RUWU8yRUJTS01KRGZ6?=
 =?utf-8?B?c1l5NlptYmt1aWVrV3N3SEVjVERYcExQMzVlSmVqQ1lDRGdWVkNCamZGWE1y?=
 =?utf-8?B?Y3ExQnFqU05lYkpGWmE1bmo1eGpRblVKdzIxaHBDUmVXZVBtM3hxVThubkxs?=
 =?utf-8?B?Yk5pNnNRbzFxMzd5UDFmczk5NEp6SXd1eVE0djMveDRjY0FsVVhjR3NVblJJ?=
 =?utf-8?B?ZFBtWkdHZzJBWHlJRDBqaTlYWERQVDZQQytkOERzd0N6TGswRE5JWGtBZVBk?=
 =?utf-8?B?YUVkSlg1TmNhM1BLMlUxalNoeFdBQ1diQjRhUlVzLzl4SjdEMHRGeGI2Qm9v?=
 =?utf-8?B?ZmpDb0FrVFVRT3dZbktEc0JSUmQ4YS9QQ2pnT3NKcUtNWnBWV01BbkRqRER6?=
 =?utf-8?B?bXFIc1pXbDVmMmdWUlpFWmJic1lPMXFlQUZoeU9BU0VvVHA4ZmdoVzVsUnhs?=
 =?utf-8?B?QkNGeEVQZGluYW92YnB5dDhnbTFBWEtzYXM3U2NDQURFYTJsSGFiK2J1c3hr?=
 =?utf-8?B?QkFjb2tCdEVNNXc3K1NOd3grRXpXVmdCQjhpaFprbTVuL001MTBvbTBoNEFU?=
 =?utf-8?B?V2xhbnRmMzNnN2JVdExkYTRWVlNSSXVWQm9RUm9FblFSZ282MEorTXZ0cVZT?=
 =?utf-8?B?TlY5N1FZMUxzWjVNaG9QbG01WVg3eXdXU1BkYnpYVG9GUHpEb3k4ZEZpYXlB?=
 =?utf-8?Q?WdR8NSZhs6UKdT7tcb36XGmWh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa531522-4fc1-41df-8128-08dd76471a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 02:43:11.1723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e7ZzIRxe5rCJi5SC9Hx8iX6QrDKbPFDBI0MgAVq6U6+X5u5ZaGXIM9nQvgF5wXlfI0SrLAQh05OX3MzquFj+Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-Proofpoint-ORIG-GUID: rM-FaKfvaaDV12tflvPqErK3t9yS7cV7
X-Authority-Analysis: v=2.4 cv=RMSzH5i+ c=1 sm=1 tr=0 ts=67f48d44 cx=c_pps a=ybfeQeV9t1qutTZukg5VSg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=w_HbZ-kElbsavAsC:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=D3Jo3E6HJMJlU5tKqBgA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: KGzZpy73DxSaHyP7aI_h25skKcNRm2pp
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504080018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 02:43:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214504

WWVzLiBJdCBpcyB0byBzdXBwb3J0IHRoZSB2ZXJzaW9uIGNoZWNrZXIuDQpJJ2xsIHJlZmFjdG9y
IHRoZSBmdW5jdGlvbnMgYW5kIHNlbmQgb3V0IFYzLg0KDQpSZWdhcmRzLA0KUWkNCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPiANClNlbnQ6IE1vbmRheSwgQXByaWwgNywgMjAyNSA2OjEzIFBNDQpUbzog
Q2hlbiwgUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBxZW11
LmJiY2xhc3M6IG1vdmUgdG8gY2xhc3Nlcy8gZGlyZWN0b3J5IHNvIHRoYXQgSU5IRVJJVCBjYW4g
dXNlIGl0DQoNCk9uIE1vbiwgNyBBcHIgMjAyNSBhdCAwODozMSwgQ2hlblFpIDxRaS5DaGVuQHdp
bmRyaXZlci5jb20+IHdyb3RlOg0KPiBNb3ZpbmcgcWVtdS5iYmNsYXNzIHRvIGJlIHVuZGVyIGNs
YXNzZXMvIGhhcyB0aGUgYmVuZWZpdCBvZiBlbmFibGluZyANCj4gb3RoZXIgYmJjbGFzcyB0aGF0
IGNvdWxkIGJlIHVzZWQgdmlhICJJTkhFUklUIiB0byBtYWtlIHVzZSBvZiBpdC4NCg0KUGxlYXNl
IGJlIHNwZWNpZmljLiBJcyB0aGlzIHRvIHN1cHBvcnQgdGhlIHZlcnNpb24gY2hlY2tlciB0aGF0
IHJ1bnMgZXhlY3V0YWJsZXMgdGhyb3VnaCBxZW11IHVzZXJtb2RlPw0KDQpJJ2Qgc3RpbGwgc2F5
ICdydW5uaW5nIGEgdGFyZ2V0IGV4ZWN1dGFibGUgdGhyb3VnaCBxZW11IHVzZXJtb2RlJw0Kc2hv
dWxkIGJlIGEgZnVuY3Rpb24gYWNjZXNzaWJsZSB2aWEgbWV0YS9saWIvb2UuIElzIGl0IHBvc3Np
YmxlIHRvIHJlZmFjdG9yIHRoZSBmdW5jdGlvbnMsIHNvIHRoYXQgdGhleSB0YWtlIHRoaW5ncyBs
aWtlIFFFTVVfT1BUSU9OUyBhcyBmdW5jdGlvbiBhcmd1bWVudHMsIGFuZCBub3QgZnJvbSB0aGUg
ZGF0YXN0b3JlPw0KDQpBbGV4DQo=

