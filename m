Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EC2C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 14:14:47 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.40])
 by mx.groups.io with SMTP id smtpd.web11.69274.1722521682733691091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 07:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=L9ojk6kg;
 spf=pass (domain: siemens.com, ip: 40.107.20.40, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkthceFEBPZLbSVBsconaJLVIWv/KPT7ttzDZ5B8PSgXsgu+IdNtdJN9Btq6r2dGG0N2Qu0UTT3BmleJAq23CjTBR5IFlStKCBFeNCIYyRRQuktPeHzJZxHA4tC6aG8HzfSLCG6vcWH4JdEnEqf+wuMeqssi0NZp88LWg7H7RfD23zYr2+sM8o6LGQ8zlMw7MBN25GbP95FQX82QUa5tg2vNdfl0W/f6YTzdzakoxePFGirPohopdZErgdMOQaY68VgYX8slN8XFHJ6X8hjNTN9DyjuBai3G100wsb9moZ6+A6SIiLLHwEPkO3Ioj69S3kDoXLE62nH9/wN/ZpqjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rp4+u1hhBSN1r+xRlmlFjbPrN+K9eVUI6i+gqIrQu88=;
 b=IPmmM2zDghPHvtEiaoRU7bRtcIeB3nxXNrwkqs1JwKq+IOorT5vf6fwNL8XNIOmM1qCx5lfmQGxfg7RsPJgClC6q4add3wW/Hn1OHKyLQBtnw0hwcn6LPJl0vVFB9zWy1aSRZyQwxm8Skefd47Vqpzd4DTzR8orbbyeOIA3dtr6W/47Z7IBiF5ULfssiw1Ruf7ovlAhSuJzGgMe3NQe756CSjK6pxdHP4RUt5A+1u+josWOs6+kk2vMdtPPFXYOXd57u9Cqi+b316lhniVJW68K9iBQ3PAvaFDnRoYKW5WYHwIArlQM3Hj4v8Ruz9fp2EHbsAjgtULI/un2Kf+RHHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rp4+u1hhBSN1r+xRlmlFjbPrN+K9eVUI6i+gqIrQu88=;
 b=L9ojk6kgnAz3i0kzhvGF7f+Y2xqNp6wrtLuqCUffLx1Oh/3giuLOJlTJEkyMyn2v/52Je/xpq9fOvuD+JccUdHxNq3mLhKin5ldDk6Lr2SSeMjzNrh90gqQ1EExFYiZeFdBh8aUpVEK6EqK3TwnNrLBzCMS3VoahRC/P6RKM0K7o0HaiqEGLO/3BfCXLd+O1VSpY/BF5xPYoDSIZEjO94HR6n10edKYBC1D0KFwfSqgnLaF8HQ2qaHN8rgIjALIiOMr3QsNuxq2ecIiI8X5FNthPPq8XFen3qQrn/I79R9AYIWBO/OYBXUkjGN8eOr753GMaWeNU8JyK/qWn21+c5A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PRAPR10MB7623.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:296::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 14:14:39 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7807.023; Thu, 1 Aug 2024
 14:14:39 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"rybczynska@gmail.com" <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Marta Rybczynska <marta.rybczynska@syslinbit.com>, Samantha Jalabert
	<samantha.jalabert@syslinbit.com>
Subject: RE: [OE-core][PATCH v3 1/5] cve-check: annotate CVEs during analysis
Thread-Topic: [OE-core][PATCH v3 1/5] cve-check: annotate CVEs during analysis
Thread-Index: AQHa3d3FIJ3tUv7k5k+Hce4Dm9vzArISdjGAgAAF8QA=
Date: Thu, 1 Aug 2024 14:14:39 +0000
Message-ID: 
 <AS1PR10MB569733CDD80687F96EA1055FFDB22@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <63e1661173a1ee8e65538cd330f614a91719b2bf.camel@linuxfoundation.org>
In-Reply-To: 
 <63e1661173a1ee8e65538cd330f614a91719b2bf.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7b0bbac0-1dd9-4438-ae97-210d747b2c2c;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-08-01T14:05:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PRAPR10MB7623:EE_
x-ms-office365-filtering-correlation-id: 63bbeaf7-4eb4-4dae-6aa9-08dcb23447c7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WERmOUNkZmw1R3NRNittWVRXSWZWN0MwOW4wSVZhZllLbmt5R1MzTzNJdW9z?=
 =?utf-8?B?Z050bVpJQk1OMmhHcVVGT2NXUlJMZjkrWFBCbUxaUzFHdTZma2t0WjFWWVpS?=
 =?utf-8?B?dE82bHJCU1Vsb0lEdVFoVVkvd0lOZDJ4WGdYZkRIMEZDVUF6bkdjQWEwdEZH?=
 =?utf-8?B?TEhteldoNkNseDBTVnFYZWlOU25IZit4Qno0dVA4bklvRm1KOUtnbno1Vm9x?=
 =?utf-8?B?MDl5OW1TTm1ieXFSRFF6VVdaUldubzVLZ3hIT21lMUk0cGRRWlM1ZlBlL3h5?=
 =?utf-8?B?RWovTTY3c3QyR1g2aDhWWVBYTXZjd3Z4WkIrMkNtS2pqMlJpc2R5eE96YjI4?=
 =?utf-8?B?bkxoZ0Z1bk5vZ3RTVjdsbDZXUUdlRkQwd2ZYNHVqc2o2MnJFS090SkRrVzdv?=
 =?utf-8?B?dktBVGc4WUduUXd1UWl4dWppMloxSTN4YWVuc2F4djJlbnJ3VHUxMHJPQ01u?=
 =?utf-8?B?NWpUWGh6VGpyZC9nQWNLdDR5MS9LQjBhVUZJUGVnM0U0cHhuZmRmZ2wyMUZK?=
 =?utf-8?B?VUpYMUU4bTE4dGc0RFpvZWRQd1N1MDJxYitkZG5BZFM2VGZwMmt3R2trQlNQ?=
 =?utf-8?B?QnVxZFZUWjNRRWZsbS92MmVkR2g1T09OM091ZWR5RG5ZSUFlV3hNUzkrcVFx?=
 =?utf-8?B?VW15SWUvejdLb2tFa0dBR2pmWFd0NkdQTVl6UXpldkFCYThUcWRPd3R0OUo0?=
 =?utf-8?B?a0RUb1hmTVBDTGJKUDRhZndPa0sySG9LeTE4Snk4VWdRMnUyMlBVU3hOWkpU?=
 =?utf-8?B?cDU0ZXhJaUV0SHNqUmhEcjNmbDEzS252ZDBtMmtVQTNHeXBQdGtrbWpPVlAy?=
 =?utf-8?B?WTBsbkE2UmFGcFI1cTFEVHJGUXNXZmZKbUR3VEpXWWR1RWgwT3dXcG9TVThk?=
 =?utf-8?B?b01HZzRBd0cySzdsRG15TncrVjFINHBqOThiWDVTdzNaWTdYTU5tN3JBWFRa?=
 =?utf-8?B?L01oUXV5Qk9zMVQzTDdFZjUvTlByWENNQmtma1lvNWRxRER3UVlrQ2FzL2Ft?=
 =?utf-8?B?eTlvSlJWdUFaa0c0NVlIbnA0NXUzQXYvYUFIQzVPQzVUOGFnQ29rUWYwQ0h5?=
 =?utf-8?B?Ymp0THdRT21vVm5mYytxN3YrR215YktmN1QvT3QzcWNwN2NFWHVDKzR1THBW?=
 =?utf-8?B?UkE4VmV1R0JmckRYTGNiMlI2TTFOSHUxZ1VnSzdpM3hlNmNrRm11S0pNSUJM?=
 =?utf-8?B?cTluejJDcFVWU2JNcmY4Mjc3UmZNT0NpSkZkQWorRy9YbkFWcWRKVzZ1eVAw?=
 =?utf-8?B?c0hmQWtNWHR3enVrcHBLd0h1QVE1TFdUSlRoQjVlVk40YWVYc091WmZLTDZH?=
 =?utf-8?B?dDJJem5tYWxmZWtkNHhCdVp6VTRsbWt3TnRYaXZUZ2YzM3N4ZDczRDJHVDNz?=
 =?utf-8?B?QzlaZjFCRzBISVRtN1dvYUt1dEdVcS9yRWhjelJPNERPTnptZkQ1MXFySFgw?=
 =?utf-8?B?Y0hHY1pGRG03K0lYYnZ2NU9BVzhOQlBPclNzblcreE1KSXlreFVYdjRlN3po?=
 =?utf-8?B?VEdTRzZ0NlVzSzdVV3ZKN1QydllLOTgwZ3pQaVlGRFJUb3llSk1jTUhPVVhJ?=
 =?utf-8?B?aWxQSGI1RS9JV3A2Und6WnJvTEkxR2REMkQ0MWN4cnR6U3cxRXdDbnZPSkZW?=
 =?utf-8?B?aUpOLzBWbmlIRFVGVTloM0s0R05yUmFhdFRINE5NTHAvT3Q2c2o3cUFJWUhK?=
 =?utf-8?B?OU5QUGJSUElCbWxCNDF2QVg0Vk5hMk1VQVZxZGR3eXh3aSt3YXhSUlVjMjha?=
 =?utf-8?B?YU9Vb2p2STd2cUNpTTYxMWw0SUFlZU5oaXloaGNUVTB5Y1czTDJnaW9hTFFB?=
 =?utf-8?B?eE5vR1E4dTZERHhCQk9iWGJENG03dzV5RlBRWkVjVWc0cGxZVitlTFAxTWs1?=
 =?utf-8?B?TlBwTTNjbGZhWkY4b1d1bWFLcmVmeHpPd3NFQmNEY3l3R3c9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?czhScTVEMGdGcHlHZ29sUFAwNjRRcjVWU0Fhd1F1WjEyLzBUWU9KeTdzWm5E?=
 =?utf-8?B?Wk1pOFFJc2RtTTQ5bFZCVzdlQU5VRjl6T0dISWNMWTR3N2toTDBoY01FcE9W?=
 =?utf-8?B?SWJORzNQZC9tV0NsUU5lcE94YlIwU0lOSlgrU1NxMmdoS0E4VXFNbFZiSnZh?=
 =?utf-8?B?b3ZLNlV6RURrbWxUSXFFNnlsWTYyd0pOOVNhZGVPQWw5d0dQQTUzSHlZbVFj?=
 =?utf-8?B?cDByd1REclFXcjc2ZXhUc2RHMmxESzBUd0tLMHRrcFRYMTdBVUo4eGdlVXlY?=
 =?utf-8?B?Vm9FOUU0N3gwdmVNaThaL0xkbUxadnBwK25lMjdESEMzeTYzTU9aRG1YOEt1?=
 =?utf-8?B?UVlZQ21nTWFDemk0Q2h5ZjZCOUgyNWkzSjBzSmF0bEtkM21FVnVNQ0duMzRT?=
 =?utf-8?B?c0VtWXhBeUJoWU1ZSGttZ0V3R1ZPc3ExTGJIcXNmdG1MeEluNGFhL29XVGNs?=
 =?utf-8?B?cVJ1b2tZTDVYMS9UVmZramVrUjdjUDFJeHkxU2NCVlBXOE83ekJIS0N1SmUy?=
 =?utf-8?B?VWMvS01QSTQ1NGpENW5naDl3OGt3MGhNWTRNeUkzWkVoS3EzODVjNTVtSE5y?=
 =?utf-8?B?U0dQWTJKWHVyamdScTc1UDkyL3gvUmRXWjA1OVJ2WUVJbTJvamRjN0luOFdY?=
 =?utf-8?B?ZDJNZW1aSEhjemtlNTJ2VVdzQmtkOXRMTTRJUHVERE9heXB5Q3Q1QXlHQmt3?=
 =?utf-8?B?SnVOWm85Tkk2TitHS0pyVjV6VmgyMmFxZnloWUk4WVdKbzBpWXM0OGF5WDU0?=
 =?utf-8?B?QWgwb3hMN1ZjQWVPVDhkRWc1alpKcHBOUVh6NE0rYTFaR0xGRTZUZDhZOXVB?=
 =?utf-8?B?L3RmSHFsT2dqbk0vUDRPSEI2ajJJVHJkazFYYnBYeGV4NTBURTlFZDV5VVJE?=
 =?utf-8?B?MkUrNWdIZHU4WWhKTGZDTlR3Q3RJNEtFOVJ6OTVyYlRBazRDTjNYZEF0RDQ1?=
 =?utf-8?B?RDI5cHpwSWw5VnVHclM1cEkwMUUrbm5Sb1VxVjJiMFV1N1NqNWVCUzBPQWxR?=
 =?utf-8?B?WTBRTUYyenlIV1hiZjNWMHFINDR6a20rTm05dU5yeC9XWHIyZms4T1ZIM282?=
 =?utf-8?B?NnROZDF5MUc0TDNLVGZ0NnhkZ01HSVp2ZUg3MTZCTG9ud0FGaGZwZ2g5b1RH?=
 =?utf-8?B?ZlhkSHhQc1hhM2dZR0tuYVE4RVFoMnBJUFJQMEJyMThmNGowanhWdzhZRGYr?=
 =?utf-8?B?c1pCOXR2bkh1Vy85TktiMEZXMVZ3R3h6MWdQMmxoOGR0bFJCQ2p0TnJZTUFw?=
 =?utf-8?B?SWZjb2V0RVl3cmdHeFRNUFd4WGJHUkg4V2RGSUVMMnQzdlk2WDhQMUMxek1Z?=
 =?utf-8?B?UTU0QlNpdnRjSkJnYlg4cnNqOXJ3dENING9SVVl5bjVjNGxDU1FHbHBLOCs0?=
 =?utf-8?B?a1lZTmpxeHNCWVVuemdYRGNZOTUyWjQyc2FXRTJzbDNMQlRrcGhLakJod0Z5?=
 =?utf-8?B?dlArQVhNdE9zNkxRNFlhbjRGcmUzV1Q3MGw3aVZwZWgzeWRWWDdDNUlyaWhv?=
 =?utf-8?B?dld3TU9EQ2lOREIrL1hINmwwNmhGYUxEL2d5SERIR2VLdkYyandpcnlpL2V5?=
 =?utf-8?B?VDFXcGEzS2pBL0R2YlRROHU5ZTN6TCtzTUYvUG1vT0xadXh3R3g3aTQ3R3c3?=
 =?utf-8?B?VmErS1VXN3FVUjBKSTNNdmx3SXczYkI5dW9DR091aXNJTDZwWG5FLzMzd0hC?=
 =?utf-8?B?bGhJVjNFTUYrODRubmFnVTVZZ0xzeVd4REQ3TmlnWkdlb0R3OG95VzAyT0Ez?=
 =?utf-8?B?Nk5USzBZLzZUOXE5eC9leVlPRG5MbGdUMmJhRVNhSmszSFhsS0ZYVDhldlU2?=
 =?utf-8?B?T1B2OFpPZ05BYzlNNW1Bb0NkZUVxei9NK0dwQTlYOC9vaUYrMm9tYUdmY1pK?=
 =?utf-8?B?ZUNFaEFHN0ZNR2IxYld2Sy9SZm1tcGxhVEoyNWR3T2tMRkNySTJzTFR4RVhO?=
 =?utf-8?B?cXhUS3h4bzNBZy9tclNyN1NERytsVlRmUFBvcG1oQk41OEJneE53ckRrWGVs?=
 =?utf-8?B?dnMvZExBMWtxVFFwQmZTUithYm1Ld28vTW91aS9kWUR2ZjFxOWhrMzMyTmth?=
 =?utf-8?B?ekpvcFNCZFZ4SWY4KzF0MVI4dUxzL0FIUXMyNEp4YS9oS01tcmNscXFEZFUr?=
 =?utf-8?Q?8dcJW5G9hYyUqQVCotneRS2+e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bbeaf7-4eb4-4dae-6aa9-08dcb23447c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 14:14:39.1460
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZIMGQT7uzRSzc1qEFy0cB4YHcqQack0LNwmKamfc9r2g/ysggSAZHypUR5KnoPPMsKohsIw9jMc6oqMnlBK/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB7623
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 14:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202738

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IG9wZW5lbWJlZGRlZC1jb3Jl
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUgdmlhDQo+IGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAxLCAyMDI0IDE1OjQ1DQo+
IFRvOiByeWJjenluc2thQGdtYWlsLmNvbTsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBDYzogTWFydGEgUnliY3p5bnNrYSA8bWFydGEucnliY3p5bnNrYUBzeXNs
aW5iaXQuY29tPjsgU2FtYW50aGEgSmFsYWJlcnQNCj4gPHNhbWFudGhhLmphbGFiZXJ0QHN5c2xp
bmJpdC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0ggdjMgMS81XSBjdmUtY2hl
Y2s6IGFubm90YXRlIENWRXMgZHVyaW5nDQo+IGFuYWx5c2lzDQo+IA0KPiBPbiBXZWQsIDIwMjQt
MDctMjQgYXQgMTc6MjUgKzAyMDAsIE1hcnRhIFJ5YmN6eW5za2EgdmlhDQo+IGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gQWRkIHN0YXR1cyBpbmZvcm1hdGlvbiBmb3IgZWFjaCBD
VkUgdW5kZXIgYW5hbHlzaXMuDQo+ID4NCj4gPiBQcmV2aW91c2x5IHRoZSBpbmZvcm1hdGlvbiBw
YXNzZWQgYmV0d2VlbiBkaWZmZXJlbnQgZnVuY3Rpb24gb2YgdGhlDQo+ID4gY3ZlLWNoZWNrIGNs
YXNzIGluY2x1ZGVkIG9ubHkgdGFibGVzIG9mIHBhdGNoZWQsIHVucGF0Y2hlZCwgaWdub3JlZA0K
PiA+IHZ1bG5lcmFiaWxpdGllcyBhbmQgdGhlIGdlbmVyYWwgc3RhdHVzIG9mIHRoZSByZWNpcGUu
DQo+ID4NCj4gPiBUaGUgVkVYIHdvcmsgcmVxdWlyZXMgbW9yZSBpbmZvcm1hdGlvbiwgYW5kIHdl
IG5lZWQgdG8gcGFzcyB0aGVtDQo+ID4gYmV0d2VlbiBkaWZmZXJlbnQgZnVuY3Rpb25zLCBzbyB0
aGF0IGl0IGNhbiBiZSBlbnJpY2hlZCBhcyB0aGUNCj4gPiBhbmFseXNpcyBwcm9ncmVzc2VzLiBJ
bnN0ZWFkIG9mIG11bHRpcGxlIHRhYmxlcywgdXNlIGEgc2luZ2xlIG9uZSB3aXRoDQo+ID4gYW5u
b3RhdGlvbnMgZm9yIGVhY2ggQ1ZFIGVuY291bnRlcmVkLiBGb3IgZXhhbXBsZSwgYSBwYXRjaGVk
IENWRSB3aWxsDQo+ID4gaGF2ZToNCj4gPg0KPiA+IHsiYWJicmV2LXN0YXR1cyI6ICJQYXRjaGVk
IiwgInN0YXR1cyI6ICJ2ZXJzaW9uLW5vdC1pbi1yYW5nZSJ9DQo+ID4NCj4gPiBhYmJyZXYtc3Rh
dHVzIGNvbnRhaW5zIHRoZSBnZW5lcmFsIHN0YXR1cyAoUGF0Y2hlZCwgVW5wYXRjaGVkLCBJZ25v
cmVkDQo+ID4gYW5kIFVua25vd24gdGhhdCB3aWxsIGJlIGFkZGVkIGluIHRoZSBWRVggY29kZSkg
c3RhdHVzIGNvbnRhaW5zIG1vcmUNCj4gPiBkZXRhaWxlZCBpbmZvcm1hdGlvbiB0aGF0IGNhbiBj
b21lIGZyb20gQ1ZFX1NUQVRVUyBhbmQgdGhlIGFuYWx5c2lzLg0KPiA+DQo+ID4gQWRkaXRpb25h
bCBmaWVsZHMgb2YgdGhlIGFubm90YXRpb24gaW5jbHVkZSBmb3IgZXhhbXBsZSB0aGUgbmFtZSBv
Zg0KPiA+IHRoZSBwYXRjaCBmaWxlIGZpeGluZyBhIGdpdmVuIENWRS4NCj4gPg0KPiA+IFRoZSBz
aWRlLWVmZmVjdCBvZiB0aGlzIGNoYW5nZSBpcyB0aGF0IGFsbCBlbnRyaWVzIGZyb20gQ1ZFX1NU
QVRVUyBhcmUNCj4gPiBhdmFpbGFibGUgaW4gdGhlIHJlc3VsdCBmaWxlLiBUaGF0IGluY2x1ZGVz
IGVudHJpZXMgZnJvbSB0aGUgb3B0aW9uYWwNCj4gPiBmaWxlIGN2ZS1leHRyYS1leGNsdXNpb25z
LmluYyBldmVuIGlmIHRoZXkgbWlnaHQgaGF2ZSBubyBsaW5rIHdpdGggdGhlDQo+ID4gcmVjaXBl
IChhcHBseSB0byBhIGRpZmZlcmVudCBwYWNrYWdlKS4gVGhpcyB3aWxsIGJlIGZpeGVkIGJ5IG1v
dmluZw0KPiA+IGFsbCBlbnRyaWVzIGZyb20gdGhhdCBmaWxlIHRvIGFwcHJvcHJpYXRlIHJlY2lw
ZXMuDQo+ID4NCj4gPiBGcm9tIG5vdyBvbiwgQ1ZFX1NUQVRVUyBzaG91bGQgYmUgYWRkZWQgZGly
ZWN0bHkgaW4gdGhlIHJlY2lwZSBmaWxlIG9yDQo+ID4gaW4gaW5jbHVkZSBmaWxlcyBhZGRlZCBv
bmx5IHRvIGFmZmVjdGVkIHJlY2lwZXMuDQo+IA0KPiBTb3JyeSBhYm91dCB0aGUgZGVsYXkgaW4g
Z2V0dGluZyB0byB0aGlzLiBJbml0aWFsbHkgSSB0aG91Z2h0IHRoaW5ncyB3ZXJlIG9rIGJ1dA0K
PiBub3cgSSB1bmRlcnN0YW5kIHdoYXQgaXMgaGFwcGVuaW5nIGhlcmUsIEknbSBhZnJhaWQgSSBo
YXZlIGNvbmNlcm5zLg0KPiANCj4gQSBmdW5kYW1lbnRhbCBwcm9wZXJ0eSBvZiB3aGF0IHdlJ3Jl
IG9mZmVyaW5nIHRoYXQgd2UgY2FuIHVzZSBhIGNvbW1vbg0KPiBpbmNsdWRlIGZpbGUgdG8gaW5q
ZWN0IENWRV9TVEFUVVMgZW50cmllcyBmb3IgcmVjaXBlcy4gV2hpbHN0IEkgY2FuIHVuZGVyc3Rh
bmQNCj4gc29tZSBvZiB0aGUgY29uY2VybnMgYWJvdXQgdGhlIGV4aXN0aW5nIC5pbmMgZmlsZSwg
d2UgYXJlIG5ldmVyIGdvaW5nIHRvIGJlIGluIGENCj4gcG9zaXRpb24gd2hlcmUgYWxsIHVzZXJz
IGFncmVlIG9uIGV4YWN0bHkgd2hhdCB3ZSBzaG91bGQgZG8gd2l0aCBhbGwgQ1ZFcy4NCj4gDQo+
IFRoZSBhbHRlcm5hdGl2ZSBpcyByZXF1aXJpbmcgYSBiYmFwcGVuZCBwZXIgcmVjaXBlIGV2ZXJ5
IHRpbWUgc29tZQ0KPiBkaXN0cm8vY29tcGFueSB3YW50cyB0byBhZGQgYW4gZW50cnkgYW5kIHRo
aXMgaXMgY2xlYXJseSBub3QgYSBnb29kIHNvbHV0aW9uLg0KDQpJIHdvbmRlciBpZiBjYW4gY291
bGQgYWRkIG9wdGlvbmFsIGNwZSBwcm9kdWN0IGZvciB3aGljaCB0aGUgaWdub3JlZCBlbnRyeSBp
cyB0YXJnZXRlZD8NClNvbWV0aGluZyBsaWtlIGNvbnZlcnRpbmcgZmlyc3QgbGluZSBvZiB0aGUg
Z2VuZXJhbCBleGNsdXNpb24gbGlzdCB0bzoNCkNWRV9TVEFUVVNbQ1ZFLTIwMDAtMDAwNixzdHJh
Y2VdID0gLi4uDQpDVkVfU1RBVFVTW0NWRS0yMDAwLTAwMDYsbGludXhfa2VybmVsXSA9IC4uLg0K
DQo+IA0KPiBJJ20gYWZyYWlkIEknbSB0aGVyZWZvcmUgdmVyeSBtdWNoIGFnYWluc3QgbWFuZGF0
aW5nIHRoYXQgQ1ZFX1NUQVRVUyBlbnRyaWVzDQo+IHNob3VsZCBiZSBhZ2FpbnN0IGluZGl2aWR1
YWwgcmVjaXBlcy4gV2UgbmVlZCB0byBmaW5kIGEgZGlmZmVyZW50IHNvbHV0aW9uIHJhdGhlcg0K
PiB0aGFuIHJlcXVpcmluZyB0aGF0LiBXZSBjYW4gbGlrZWx5IHNvcnQgdGhlIGZpbGUgaW4gY29y
ZSBidXQgbm90IGluIG90aGVyIHBlb3BsZSdzDQo+IGxheWVycy4NCj4gDQo+IENoZWVycywNCj4g
DQo+IFJpY2hhcmQNCg0K

