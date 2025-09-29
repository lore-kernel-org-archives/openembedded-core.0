Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108F0CAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 12:05:15 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.5])
 by mx.groups.io with SMTP id smtpd.web11.51708.1759147511228853653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 05:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=gSv5VVD/;
 spf=pass (domain: siemens.com, ip: 52.101.70.5, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evt4THCEdWf/3Jr1XDF9JHHF+elJgBML7PlTL6Rn5OSN4ewBpFE7i9m4s/3vYiu55vSb4oMiYPMDqtY4+6GXTy4NaV0+qUf+Ux4HIe4c9EVbqldlXe0gkZxYtmx7HQxZotqRKCwS1it/Dnv4ABvFipj6tu9dUH+r53x9vJ4gPPGnKqGfLSEG/wtRNMQa6vy87gX3uuAeAYC+/sKFWKGhXRJSinxqYcQvmlcu1NZn3wibr+1rQotTlMF7VYangEb0rf+msj5S97gfFHF0kJRQMUj9w6bhUMsCA9XtTLgTi4oqQ5LDfWReQMqGCdQwqCcG9IJWSP9dRJDB3MWVaFXQmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixzFxJOmZMwhnZeV2/0w7PvtFDkMMoz9eUiCd5l9URg=;
 b=PPpUSmZCsxOzwDvjxaYF8KXlvJPyNR7NeWv4RHlNoj11agpM8PEd3D378ldGv4jz/XcaRGC2DVAFx5kasrCU0lLOe/3nvMNJoLAyLbNsipn0Gs1/ygefHrDhrIImKyIPBeAfqu1WMlev1sRmij0eRwSMGFinrN4syv6SqsQSXlWFczAe0pOubcLg6CaZDK912r3xCXUjD7tV++Db7+OKhZnAXqI5t3lbdN49qb6L/vbBl+pCz2OUq237QdgRdrRXEv31d9k5sJy5T5w2E7l2r4XkWf2ZauD06iyj3B3Aez8Q4BH86vClkOb4u6jB6wu0/F77H0zCjnKNOJuzu8ItcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixzFxJOmZMwhnZeV2/0w7PvtFDkMMoz9eUiCd5l9URg=;
 b=gSv5VVD/qvcSctIBIAmxzvTo1D702giMmLAYa0GUkZFfrNve/y8Yp1ItGa4Jk0a83yKpECIIfBYPgfJt/2STEVJmQ8MRGsFNhptNz/PtEeJfVS7nxqphOQhVKykAB8dPNM3FErqeqvu+sLvGJIZc952deEW08zVdmWbscqPgsP4/GEMZjCJ8+F/jlUtP3aYLRMBjonS1l5Y/oyc93oTuoHe4vxA8pZlhPR1BDtn5YFh8OvTPNaX3xwNhP++E1GZsfl+epwSBsN7qogrq/CvvzVQimMv+gN8PZznUAHRdDxaiQegEU2U6hYiYj/jj7H4iA0mdLAQI6lbQx8Ug6PwDAA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB8008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:5f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 12:05:07 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 12:05:07 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] busybox: patch CVE-2025-46394
Thread-Topic: [OE-core][PATCH] busybox: patch CVE-2025-46394
Thread-Index: AQHcMMU+dB3uPbrmHUePby+eqv/dqbSqBFSAgAAMbRA=
Date: Mon, 29 Sep 2025 12:05:07 +0000
Message-ID: 
 <AS1PR10MB5697F3EF71790F88C79BE247FD1BA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250928221332.1308547-1-peter.marko@siemens.com>
 <DD58S1JBO8QQ.1O3KA6E2WCT9T@bootlin.com>
In-Reply-To: <DD58S1JBO8QQ.1O3KA6E2WCT9T@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8aed6a35-36de-4a63-b01f-a27a22f927bc;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-09-29T12:04:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB8008:EE_
x-ms-office365-filtering-correlation-id: 5bdb3d50-0f98-45b2-4c22-08ddff506ea4
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?a3NOOWtxdyt4bkRyVVJLbm1JYTdrMEo2TXZ1d251RWJWQ3Fnc3pmTjdobEpi?=
 =?utf-8?B?Nlp4U2IrTjAwUXdRVUlLMXd6b3hjQTBBbk5DREVKN3J6L1kyRGtQMjFtcGNV?=
 =?utf-8?B?QzBFT0ZCRm9qRmI5a0F1cDVoVHJnZGNxeXZVb1ZuWUdqMlI5ZUFma3VtTmoz?=
 =?utf-8?B?VVUzTWVRVm84RDI3OU5MazJmUGxRTlltS25tbnpsME5xdHZFNkxjK0hBaXFr?=
 =?utf-8?B?T0tHQmtFNklSYXVNdUpta2p0emFjUWcwMk5KT2NqNEFpTE1Da3Jublp2Ukxr?=
 =?utf-8?B?d0tmeTQwdkUxYVhTTEt4Q2R4blQ2c3NKKzFzOCsrcFBURTUycXdpdW1reEJr?=
 =?utf-8?B?ejYzaDZOdGJ2QWZjVGo0YmRkQTdzTW5Rb2xQdXVXdUw3ZHhHVHoxK3VkUFBC?=
 =?utf-8?B?MEYyNFBSMGJ1MXJ4SmtnUENpQW9mUXhVSDdJWFZQb1VpeHlOWm9KN0VxNmlt?=
 =?utf-8?B?QW0valY0RGlzSml3Q3RpN1p6YkNucC8weWpsdkEvTWQvUzA4elVwd3pJRmdO?=
 =?utf-8?B?OTFXcjJKbEtEdCtWeUdIMkZGZ3hTdTg1K0I3dkREaHd3S3R2d2thZSszZ0ts?=
 =?utf-8?B?V3RDU2JvWE5VNnkzWThmWTB0dVNreTdZVmNUMnV0czhodUNSTjlPSlI5MHYx?=
 =?utf-8?B?WmtKUi9Gb2c0Ry9aYk5ONXlEYWl3MS90c29hN3o4WTNJVTRXVTVQV0ZCRVls?=
 =?utf-8?B?c1ZvdVdwd0VhVGoxZUVBZUh6QzdBRVBBaVR4NUVCc1diS0lGNWs4OTBiWlNC?=
 =?utf-8?B?cEVYbTJ1RlpZWGUzTjhLTnM0WVA2RGkvbnVOaTJWVEtSUDJXaWlSOEN6Tk0y?=
 =?utf-8?B?dEQxQS9Xd0ROMnJ4NEpBSDY3L3JXRHErVEZkcGRqM1VySUlOMHE3RkVkeitM?=
 =?utf-8?B?RU9iL09lUGQzTEd0amVLRkpHYmhYRjNpcDZ5R1NxSng1dlhrQ3pZSE9Lb3o2?=
 =?utf-8?B?bzh3RUl1MU1BQVFuN3p2NStxWnlMTWh4ekNtNEZmWk05Y2Y1K1JpTGJTZVR4?=
 =?utf-8?B?aWU2U1hMVVlJSE5RTjBycHRjRkd2eElKcTh0SUZYZDhBOUJyY25MSm9MTnFm?=
 =?utf-8?B?ekV4Sm8zYXdUY0NZN095TVM0SkdMMTdiRXZnSndPNEV6SlVNazJYK20vd3BL?=
 =?utf-8?B?MkpKaXgyaGp2WkpMMkV0OGUzbnJBNmMxdk8wd3NTN3Y5bEFJQVpSRlJJdW03?=
 =?utf-8?B?U2xUUUZtRVlCZWtTUGQ4cHU3Wmh5cmZ4OHYyclRhYmNBTm9TVklwdnlERVBI?=
 =?utf-8?B?ZEFKZTRMVng4MkQ3STk5c01Bd3V4UjV3OHMxK2hYc1U0SmdOL25Vc3k0YWx2?=
 =?utf-8?B?SUs5V1NCOHlsN2ROZUFGSzcxRjB3YWg5d3NtSGZ3U1JMWDgrbG45SFZ2NXVu?=
 =?utf-8?B?LzROUHJiYzM4MWdERTRrY1c0aDdZcDE1MEFEY2NIenBiMjZyalYwbzdMQXBh?=
 =?utf-8?B?b3RQNXU0QUVvVnk1UEFTOC94OTRmVVNIOGx1NnJQZEYrS3hnMWd0dnpwSGgw?=
 =?utf-8?B?Y09rMHh2VHVMVmxHdjhTTVJXVTNDWG1TWTV3TkdZNGlMblFkM2VaUm95b1RU?=
 =?utf-8?B?Yklic0RNZlg2VlVodVFxUnJKTUxYQ0dYVkJGcGFzaTNhaVlhNU90Zk5tcWhv?=
 =?utf-8?B?SkN1NklYTUpjSWhrOXdlR0pLNk5FcjJ3ZWVCb1FwUGNWVHNwTTFyRHNwRTkw?=
 =?utf-8?B?cVp3RUl2cTkxMlQrMHJIZy9zSm5mZnEzUUpJVVZCYUlNN21CbklNb1JYdGR4?=
 =?utf-8?B?Qk56cDBWY1lzSUpsZnJ4VW4yQ0U2QU5wSTc2bDBnZWgwcHlJa2xsaC9oM213?=
 =?utf-8?B?aWJ0RjFNMVFSVjNtMFZ3K2lQT0FSWExYaTlJWEF6VFEyL3lXaVFJUmFUc0dv?=
 =?utf-8?B?NXNRU0tkS1BOb1hYdXdxUzdvVmFrYlpiek0rcUQ3cDAzNGtyWS9aNzZteVBo?=
 =?utf-8?Q?L5s4oVxMmvt1yLdBIpqMZdoAAZRYQYvl?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U3NRUm5GRGNMeEo3TEpwOVdoUWF5U3VuT0h1UENhQVhQaC9zT0hBOGsxZmhH?=
 =?utf-8?B?UEZBbzc5S1JZdU1FWWlXVG5qZjRZTHJseHhYUnkzdnNBWTRRaU1FYysrbDZY?=
 =?utf-8?B?dWJPRVNJdkx6bzdIYWNNbmpaMHI2OXJwRWsxTlJ1WXF2RDlzWmNuSElQcmQ3?=
 =?utf-8?B?c2lFaHZqVUhWd2tBQnpFZldaVkdFbGNMaUxjQUgwNmxYc01EQXJzOUxIQlFH?=
 =?utf-8?B?VzMrV0pFY0YyWDRmb3N2MWRtRjVaeFl2bzBmSndBVFRmTFRkeVNRVDBWV2M3?=
 =?utf-8?B?d0xFZFYyNG4vMFJQNHdXczd5NEFyYWFzdElib3FRM1VETlhnd3FyL2t4OEtu?=
 =?utf-8?B?d083MThrU3NteUZWdWJvcXZadUtJa0kyQ1VZcnI3Ri9lYnE0Mzg3UHNLRGMr?=
 =?utf-8?B?WDRMK0d1VUYzRjZXVHM5OWlwVjhRK3JYY0owOU95VXJSbmp0OURYdHBUeDFa?=
 =?utf-8?B?cDBJQ0pvS1R1MERLY2JIVEpOdVpTaFRyQnh6ais0ZzY2UThPaGhkck14ekpL?=
 =?utf-8?B?U1RUSU1LeFdqK3ZlK3czbURMWW1sd1gyTlFaM04xWUpXTU5wTjNvQWYzWDU0?=
 =?utf-8?B?ZFRPc0Z4bkpVeUQwenJWdWZ4TFhXRmF0Y21HcDJJZm5nYUF2ZkVZcVdQSkR0?=
 =?utf-8?B?QkJTallVV255VHZndDhiSXFnZVo5TVhOQWwvcEpvdHZvbmFUK0hjN2RFbnZh?=
 =?utf-8?B?Q1VNaHlyVmRURlEycWxqbEJrQWU4NlF5OFFneEJlUWwyZTBhUzRjS2E4dHhP?=
 =?utf-8?B?M0IxaFZ4U1dYL2U2YU1JVEYxMUJSYUozMVZZQXV0dGlaMzBibUt0V0ExUkxC?=
 =?utf-8?B?VStmRjRXbDZtY0RiNjl5UXlQYU80WDJ3bTVzRjNBVDlSeEhoK1o0Vm8vV1dx?=
 =?utf-8?B?NzB6R1RjLzNRQU5qaUlOTXIxeGhZbVdyTGo0WGRkWFFpWnhhM05GRXF4YWFl?=
 =?utf-8?B?akkxODBSUStBaVBtQ3RuZTlZOEx5MUczcUxrTnZiT09LOWRybDVEeThCaG5r?=
 =?utf-8?B?L2l1QnNrUHRpVFB1VDN2SXNuRnk0M1BZMmcvcmsyY0kxcW40V0pqdDhwK0Vi?=
 =?utf-8?B?SGovRUhvTGZybGN4aVR5dmkrM0pGMU1VZml2ZDhQQy9GdnNQMDh1aDdSTTNB?=
 =?utf-8?B?S1dheGNPZ2xERy9oSEc0N0wwa29NSG5mMVJxT0lCc0lDZHVtc2RBOS9pcHBX?=
 =?utf-8?B?dWlGVXdIdTNPc29VZWZsZlFDdEhFUW10dUFiRFhqWHFTVjdVbW5xK1hyWkdH?=
 =?utf-8?B?SGFEbWVLakx2V3VsWDNuN3BSR2VhVXl5MVY0aDcyWU9NRE9EREhmUjh6ZXZp?=
 =?utf-8?B?ckJhWTNNUk1McHRrZmFFVHlWbHptU003Ym00UWN6SFBTbVRnQXc2clcwT2hx?=
 =?utf-8?B?M20wNWpPUTM2dmVaRXIxUUZOc3FXNVV3VUoySVMrcFdQRjc2U2QwWk4vVktx?=
 =?utf-8?B?eGlUd05nQ2ljQUFKZTBUcU9rQmhudEpnUm5wWm95dlRuZy9ZWlQ1a2FYVU9M?=
 =?utf-8?B?THJpN3pvZjlVajdUbk9PTjNrMWk0bmRUNUVLcU9mbk8zMjI3S1UwZlJwWkZB?=
 =?utf-8?B?Z20yU3d0TmsrdzNTR09DbUlmNzhUNzRWdllQNTJ0U0psQkNVZnNLVEZyKzBy?=
 =?utf-8?B?RHIvV0FmZWROZlVIenBUZER2TkRqc2lQVDZWdGZkbHlOZkVPd2FWdW90eUo0?=
 =?utf-8?B?bVdYMVo4RnVjbHV3M0JoSEJHT280ZnYwdThKM3VwaWF5WSswWFY5QjdTSXRO?=
 =?utf-8?B?NE5aV2VVVXhSZnFnVEx6YkorVVkwU0YyNzJkbVBYRXZGaitPY2tGZVV5T3Iy?=
 =?utf-8?B?cHdtQzFCWmN3dWhqWTZPTXFocGd0WVZrTUFOclRRWWdqL2tvMmtyL2tyYWJL?=
 =?utf-8?B?TmE2T1BSaDA4a2hqRVVvR2IrYzg3bCtpSCt0d1BHZ3lYZWpQSmc2bnJsUmIz?=
 =?utf-8?B?a0lMQXdEMFlYQ1p3eStMZ1NYZG9adDJqQVdzM1ArRWIxdWlLOGNvaldMcU9O?=
 =?utf-8?B?NHZXSm55SExDZjZCZ3pBSkd5akRybThESGEvTjhnVHVrTGtZZ0ZMRGVYMGlH?=
 =?utf-8?B?aWpXaEJiUWdQQ3NJWDBpZXczNEhIdEJUY2xuY1UvaGMzUVhwODNEbUVZYUNk?=
 =?utf-8?Q?pwjUyrbb1wtZVPeSV6rYNkZSF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdb3d50-0f98-45b2-4c22-08ddff506ea4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 12:05:07.4894
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k4Eo0M2RybK1Jk45PF5XKBjfxmrVdjwBRRq5QDxj5OwSvhPLG4jGv9Kh4AIaJTZ9C2AI5GJQiW1wF4Byg17nyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 12:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224140

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBEdWJvaXMt
QnJpYW5kIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IE1vbmRh
eSwgU2VwdGVtYmVyIDI5LCAyMDI1IDEzOjIwDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUg
U0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBi
dXN5Ym94OiBwYXRjaCBDVkUtMjAyNS00NjM5NA0KPiANCj4gT24gTW9uIFNlcCAyOSwgMjAyNSBh
dCAxMjoxMyBBTSBDRVNULCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+
DQo+ID4NCj4gPiBQaWNrIGNvbW1pdCBtZW50aW9uaW5nIHRoaXMgQ1ZFLg0KPiA+DQo+ID4gU2ln
bmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+IC0t
LQ0KPiANCj4gSGkgUGV0ZXIsDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQo+IA0KPiBJ
dCBsb29rcyBsaWtlIHRoaXMgaXMgYnJlYWtpbmcgc29tZSBwdGVzdDoNCj4gDQo+IEFzc2VydGlv
bkVycm9yOg0KPiBGYWlsZWQgcHRlc3RzOg0KPiB7J2J1c3lib3gnOiBbJ3Rhcl9QYXgtZW5jb2Rl
ZF9VVEY4X25hbWVzX2FuZF9zeW1saW5rcyddfQ0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55
b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvNTYvYnVpbGRzLzU0Mw0KPiBodHRw
czovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy82MS9i
dWlsZHMvMjMyNA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3ly
aWUvIy9idWlsZGVycy83My9idWlsZHMvMjM2Mw0KPiANCj4gUHRlc3QgbG9ncyBjYW4gYmUgZm91
bmQgaGVyZToNCj4gDQo+IGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL25vbi1yZWxlYXNl
LzIwMjUwOTI5LTUzL3Rlc3RyZXN1bHRzL3FlbXVyaXNjdjY0LQ0KPiBwdGVzdC9jb3JlLWltYWdl
LXB0ZXN0LWJ1c3lib3gvDQo+IGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL25vbi1yZWxl
YXNlLzIwMjUwOTI5LTUzL3Rlc3RyZXN1bHRzL3FlbXV4ODYtNjQtDQo+IHB0ZXN0L2NvcmUtaW1h
Z2UtcHRlc3QtYnVzeWJveC8NCj4gaHR0cHM6Ly92YWxreXJpZS55b2N0by5pby9wdWIvbm9uLXJl
bGVhc2UvMjAyNTA5MjktNTMvdGVzdHJlc3VsdHMvcWVtdWFybTY0LQ0KPiBwdGVzdC9jb3JlLWlt
YWdlLXB0ZXN0LWJ1c3lib3gvDQo+IA0KPiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHRoZXNlLCBw
bGVhc2U/DQoNCkxvb2tzIGxpa2UgdGhlIENWRSBwYXRjaCBicm9rZSB0aGVpciBvd24gdGVzdHMu
DQpUaGUgcGF0Y2ggY2hhbmdlcyBwcmludG91dCBidXQgdGhlIHRlc3QgY29tcGFyZXMgdG8gdW5t
YW5nbGVkIHN0cmluZy4NCkknbGwgdHJ5IHRvIHN1Ym1pdCBhIHBhdGNoIGZvciB0aGUgdGVzdCB1
cHN0cmVhbS4NCg0KUGV0ZXINCg0KPiANCj4gVGhhbmtzLA0KPiBNYXRoaWV1DQo+IA0KPiAtLQ0K
PiBNYXRoaWV1IER1Ym9pcy1CcmlhbmQsIEJvb3RsaW4NCj4gRW1iZWRkZWQgTGludXggYW5kIEtl
cm5lbCBlbmdpbmVlcmluZw0KPiBodHRwczovL2Jvb3RsaW4uY29tDQoNCg==

