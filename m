Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6130AE7716E
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 23:32:56 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.26])
 by mx.groups.io with SMTP id smtpd.web10.25830.1733441566095753105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 15:32:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dyi71EnQ;
 spf=pass (domain: siemens.com, ip: 52.101.67.26, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3Dssxi9b8yu3ZiUecc4WH6QPJSGoPe7DKOmQsE7lUHAkDK+XR243Jx3zUmqwYOeiz2gGKRhqtHD9FQfcAafAkFpl4uB9Xo1/NQr8Q724Ms8wVnCn9c+tf4E+0Lz1KbKe0Uqj2z/IyiVFP27v+5mTjSSHmFITKc/vbK9ckVj/J6S5oPdIcSBkzO/+9MmFzU9ltUUZgDe9oERMJogx0PONitWgA0lpacCi3qDSyG0NR58HVeFGy/4g6Bc40Cv3e3pTfhQMxGefICzQz8xlVDuqZRHzv8gPEM0TUT8hIaws1l1NHov6UAED30BuuPtxhT27JA9ziENpPR39E6zLFU7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV5T30L4irI09vQoVdiMzM1vwLjEXc4vRwsAlr9vn2k=;
 b=wKFFNJcWmOw3RR8CeA6mgDFH6ptIMlKNh8JnV4bgsew1wJl+3I4hihlXFRv86g0eEa2OEWKPSXJ7ED6e4wkeoJHo52jDozoESTHK8dOsHdipFKSSDmFcMFeOIcfehUacro0MCgeWZYONp+THeDrV6r1ytZ64BwOL/oRAAjnO/PUmRbFNxDJOAlC359KyXIRigg4jP0Jqd6FUYSaTKBHYIBGpXzF+OHXdpFf/lRWF3L/i9RXIZVHXAQIcabBj3YTdbMTlldJbsVZkOHJmCSeBNzvgrYQYzu3hGpvZj+H/Ibwl8KlHY0vLDUdoDBqR4mKV8x3U3j/HvYwKAfPF7LFAuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV5T30L4irI09vQoVdiMzM1vwLjEXc4vRwsAlr9vn2k=;
 b=dyi71EnQPCsEFFnIYdEqXWvXtE6rbDstEGeyCfx1aWbSlg7CReGF717Szdbm5O4UIw7fN48XyhMoIDbgYKAxk2zzVWELKhRK0Jv9fder8ndEaAnUQaHXC/9HPkN1xRN2sRblP7g1cD8eVkGOaTTu+HNTe440DbbPYvX+pBbbpHGt2JA9bKVXm39q809tJMOJDZMEMnl3f4/HCnPC5x4jNXt21Crm6dCU0z2gTtjI1BDcdPy3mD3YfTdjy0V0QQkJF5KxGrX48bhhFOqsTfoTWLMiq8p0too7wKm9B/x3l4shREDY+o/k1SERlxfsa43Fp1tSdiahGoySpJHLPGznYA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB9PR10MB7266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:461::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.9; Thu, 5 Dec
 2024 23:32:42 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8230.007; Thu, 5 Dec 2024
 23:32:42 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][styhead][PATCH 1/7] ghostscript: upgrade 10.03.1 ->
 10.04.0
Thread-Topic: [OE-core][styhead][PATCH 1/7] ghostscript: upgrade 10.03.1 ->
 10.04.0
Thread-Index: AQHbR22Snr4XACqANkK58E4HAzFPFbLYTOyA
Date: Thu, 5 Dec 2024 23:32:42 +0000
Message-ID: 
 <AS1PR10MB569753D05556B9D9A6F3BF37FD302@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <180E6BBDF894D49F.19074@lists.openembedded.org>
In-Reply-To: <180E6BBDF894D49F.19074@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=232cfb69-8fb8-446e-8937-c5960f2bda13;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-12-05T23:32:03Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB9PR10MB7266:EE_
x-ms-office365-filtering-correlation-id: 52bc72f3-825f-4f33-6317-08dd15851d7c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?PcJ/Q7rYCcSryGe0YHfFqB8JdXyh406tOyHCfN4vf1ObAla3uWV7x6mqDPv8?=
 =?us-ascii?Q?Ay5p6XbYU0k90J3wsjh+XX8PknBONKxFQ8HT9mTqAgdseyBQjOtXACgHVdZR?=
 =?us-ascii?Q?XV/H0vRDlBRs8Le6sy/KSZ3RBjv15u4wqnRZueoimWkpAh/eW28cXErMVbh/?=
 =?us-ascii?Q?MeK2ql+LUY1kIT3Mgbrp5jMzgIBlVO2OlMugpdhJA05d0faDqfh5oKn7xZXi?=
 =?us-ascii?Q?ZlJhEBjww4KHMfq9/pkja27yOXVnmnusJRPTeaGjwsZ43aBKaknBNLKHXTF8?=
 =?us-ascii?Q?q5OXe6g154VSkA9i3rApRqqpky5fS2rBklmRV1D4Vzinp6tdVq9X3CnqGp2m?=
 =?us-ascii?Q?7jLFyJzY0+NcJQczyS4W740arXMWh8d1C02W64erFWJcDxqwhJlSyREy9eRw?=
 =?us-ascii?Q?6l7ISKC3V16gCEnWbb64yQlPXNtawTeuyB8oIKrnXm8HABvzglTUAKs4Y879?=
 =?us-ascii?Q?AK09PJh8JUceFpgourCc8GtsvhKrYGgJ1BPOZwoEa1WwwomGOhkyOoKJq93J?=
 =?us-ascii?Q?DsSHgyjix8N3dbC+PRcVw1wr4Doo26OYjyZabvQqB3TlZsSoSK8QLcPA+gLv?=
 =?us-ascii?Q?l1Jr3iqDhFgvOnfB51Tufi0BjNVpyOA0lYroA/0qB41wHXUXV4yjn7eD5G6Q?=
 =?us-ascii?Q?WJ4fIYNbhY7pl5harUY6O8Mne5QM4VCXuFhaR3K7YXlrEH3tZLN+ZwG2QX13?=
 =?us-ascii?Q?lzdisPUzfUmzKHTyvbB1KktmaYSLNx82MQXf0j5gkmGXzFLKWOhmdX1wTwOx?=
 =?us-ascii?Q?NgUeInVuzWfG6gkV9NyMKY9K3yZY4ATZuEGnm1M/mKCn7fPUTRlXAkms64O8?=
 =?us-ascii?Q?4sWToaXdKEp0yYQKziQTFIwFwHSj3NR1k0dVmxDSJjBJyJSbJg4rGFnzTRM0?=
 =?us-ascii?Q?Yu9MVd5Nu9sWoqzMW+wu+TDEtOiTBL2ZXeKjSaoFQoXokaR3Uiwmi9V56q+q?=
 =?us-ascii?Q?ExFaljdHR4x+I9d7/LIRY0N9G2l+jv7RWWaYhM7HZjh5sx/z5Z1uB7CcEFoX?=
 =?us-ascii?Q?R2m6u2U0T4E36chfpTovKf94fv991OSAShgEzi0KRi90Jaf5GymY+2d1i3Fb?=
 =?us-ascii?Q?KpWk+wIQUzQ8mnrzr+MLnQG1HThO93Atxj9k0WWEEP9NQ3GE3r9GSQAjKhZE?=
 =?us-ascii?Q?VSiNqdyWrmEsXf8G9vh9Df/GVQodSLAKRb05sFWYjRD8NK/Yl+5H/Eg+U12j?=
 =?us-ascii?Q?cM8orRZvr62JYn1JHNrXInpRDCgYLQ+6EHEshKrhxUaHGDbtBRuGjQBHNcCL?=
 =?us-ascii?Q?WeRDdV64iCD9kXpwPIZS7pARZjapksgsLu7AFIFkqJ+2G44KAqjRQoTIMzN1?=
 =?us-ascii?Q?y2E4VB8fI1aRtxqLDzLVTgxDVWvFdTOCb+foR74Qis9nUAaBUr1CGV5xeyDr?=
 =?us-ascii?Q?OtU6bC+TcqI9cZFOkm9PDMAvDnfZplaZ8OM5/UqGztV2nqSUyQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Q792B+hFHCu5vD/8JnlKfdkRKsO4adUcyjOCf4GC7rTHUmqkf7REEuPOEm+f?=
 =?us-ascii?Q?S/w1ZuViYWThc5QsfsRUPFFL8M7x4yPFh3H9sLiZDETryJ+dwpqbOOgM+AB/?=
 =?us-ascii?Q?lV+e3800CG+EhsuAacftjKP8XmIpa0SEO2UMCQ2JwIvWfKNDhBysakrWZqxi?=
 =?us-ascii?Q?uSTkxhnKd25gTxuzASER7xAv+4kwUqcSOES0zAWg6NLuSaTr6ZEDCdTKHTWU?=
 =?us-ascii?Q?TjFrYaeicxdib3Swh3NjrXXLVamvR8oiQPw9rXvPkKTqfL6Kggmv35p4jnvG?=
 =?us-ascii?Q?nZtGzmgOgDk1YYbjeMtXltVnbnB5UfKc2jXx59MnSimlJt2CC9m6F/pfNDLr?=
 =?us-ascii?Q?DaeYTNOgz2WP6Bw+xhvIUK9RuYibBSmLu8SBO4PTreWwiDvEP9Qu5E1jeUiT?=
 =?us-ascii?Q?ALavyhlr5lgSLN2Nh6idUHZvcYc7+nubtmryocAzxgUgXUrttwxoHPMNo+hJ?=
 =?us-ascii?Q?40m5iE8oyacQt4EJgJ69xZQzVITMv6MVHFAGEfrXkkQdiZdMtCFUcSFLv5dG?=
 =?us-ascii?Q?F2nzfTApoxRasJxggrdPicWwwD6xv8GEdBx4sBsemk6NykeP/GOZTReWqVwl?=
 =?us-ascii?Q?B2W1lSJvn+Ik+wlo/VnNDBOOciXuO97gQpUZtHoW5reAhwEQ9rXRYFuhQtW0?=
 =?us-ascii?Q?xmdFbE161lBnrE+ahuia6o/vLhpJAjXATDaLzj5x+7F2iwzM/HnJcpc6I2Yt?=
 =?us-ascii?Q?/XnCg1qNgl9OJfZY8/+9tpabKfWf9cxDbEtRuTGSUmbcEpz2IyA1JmzDRzZ1?=
 =?us-ascii?Q?myOqvGDx5O0lAA2KmzPQixnwVhT1H8oVLtMS80y3yBQMmIVtfwpc41EJCyAf?=
 =?us-ascii?Q?moGx8SV2rtC4MuTWXDrSNADoPMv8+qvm1zgC1KoIdVqS+YYxaJttz8KntAYE?=
 =?us-ascii?Q?4RzT+bZ7Rs3ZYsZwdp8wMI12K/e+OJTElydo6ImG/+fb4x/DTAK529mjnoCg?=
 =?us-ascii?Q?o/pCHGYyn83ScBnqtlqtUuC2jbCmZqJqiKZAKKx+E24BkHELPo2JfxE+YwCr?=
 =?us-ascii?Q?EuskfAKAUdCaFgz53jCb3e3TJeqBN+sPbPQ2Ndd4AakoTrheIzQtcx/z8jDy?=
 =?us-ascii?Q?H/wwCgbaCqkfN+ntJrBSROzCmylXsc3FT89/wDzBK2C7E+F7n2C6s20BJmih?=
 =?us-ascii?Q?arIwIc1pbnaWb+D5oA8pjsPGbkS0rz/B3KhlIR1zcggrIa6MYx2AYX/JsjBK?=
 =?us-ascii?Q?nfo4Ceuu0NZ9+jjYOXbt6hhD1hd1ZhePj5rfUAtg4OJVQju/p/h+WmSwI1Th?=
 =?us-ascii?Q?8T8wxkMpt2J7WVlxQxTNGLvD6ZSR2fDCXV6WFAk2243S2ssxXoT1B/+EE3aL?=
 =?us-ascii?Q?vdTigmCXTcf1VUBpBgxKKN0jtnwciG0OiEvNWBYFflSx2jfs9I5Gs76f8Dro?=
 =?us-ascii?Q?IRoAjM+iTNMx5lPslhLGVd4BN86a2qMW9DppuI2Zn9swifG6FCTghI9PnyHc?=
 =?us-ascii?Q?Q8RYUtkhZVHyueekgYJw/ARCMJEqNZnzQmlX9IgYbBdSLqMP6OdBDXDCDPij?=
 =?us-ascii?Q?MjAbx9wsNbc3iq8DV1YpsuBd9Nw5nGxvZ1nGGfcf/vDT/pWI1V4JXPzPqYrh?=
 =?us-ascii?Q?HKUJtFVAQcAtqxf1L7WkCHpWTFBpKeUHF6UxCXq9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 52bc72f3-825f-4f33-6317-08dd15851d7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 23:32:42.5784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aIFYQDDnIgH1uDPEP1/M1rzIMbm1vSteT+d7I8bIKYDeCcdxT/zFmllqDtWwPYnMEIe7y1ZqKOAiyrZY5RDv6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208392

Please ignore this patch, it's only part of the series sent alone by mistak=
e.
Peter

