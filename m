Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC04C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 16:53:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web10.988.1715964787541232625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 09:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Mz7FT6Sj;
 spf=pass (domain: siemens.com, ip: 40.107.20.56, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HI2SseoGklVMrVoyjymasZ/QMaEjEp28CJAdJrlmAEcVvfG9BZNdqE2J3KxRIS92ClQEHOUaiOT12ILUoU/6YHs8hgR2oIqfR7fBRBunFIT4EUMlSDCK5IemQu2sAjTtEuzuR9SCdd0BhIW1O1u8zDCjlEugdxr2zaoPdCRhNVvYt7UckSo9Ynh1awowjp2LkFI/e06LyRXrztBLkuCtEtZgJpyV5aGfSErcuo2v+ILCWxNC/ulIGPEBuBBC2mDo++mUyhnCUZIIUZk+rm8QmxICi0XPoGZgpS0hqBGhy7/S1Y0fJTQmFv/AACp2gZfmtpP+mmOeCqZvuZJnOyvYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3+wbbaAM5BvnMv/93n7n+gxy+xeAnrW6p0UFq4AeoQ=;
 b=PkBGMPhmFz6bCUn2y/PYsOKfy+xc1thBMPKX3snAy1HSOU3nkIluPsR7MLU24PtC9ByPoxFu4teSHHReh7Xbm2wSmjpwIV4+rX14lz0HNiY8Eynexx9XTANmrYn6nTpXa5QYbfrF8cbtQ+eFcs2Cdts5izISlItMuvYm553VDBUaPXLI+B4+e/khe5y+fsCDahH9KIdIlh6D1r3jQk0VES+8mwtxNemRfoi/V8FVVqxzGeAZkEzs4g89GbOY31tzoYad+6CgHZNw4pQet26WI9ClKQZnTFDcZ7sk0Ifr6b9K3B+5VUJTksyeWaLkURaCWQIdbQeIUpDzNm9EtTJkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3+wbbaAM5BvnMv/93n7n+gxy+xeAnrW6p0UFq4AeoQ=;
 b=Mz7FT6Sjlg3aEOYuSCzwreS2WzIfVy4kdcd1rJtkmR9I8eztGusKyIqmI5z6cNkl2LW3duYjXdgIS4Rqr1UyiilG70uAoSbIMRNr9Vv5YonYwG3kGQyjbnmlzNASoKTlArCj6/2PAcdk7fONcVXsdC6wSk8iCPigAfyHGqLaKwaZbEapvubahF5Mki99387PB3T/lxuTT0EE1N87PzvoQxX/jz8JLZNgSosEFyQ+fP5rpEgdjfFDtqCMRAAsZwRu9dyXzI7GF5RHxStZw7UsCAAHmcBl9htELWFhXUQiN119cdSin+dnxY7q02Fk8b5VklyLS6XrK24N5Sol02GXoQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DB8PR10MB3579.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 16:53:04 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7587.026; Fri, 17 May 2024
 16:53:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "sundeep.kokkonda@windriver.com" <sundeep.kokkonda@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "randy.macleod@windriver.com" <randy.macleod@windriver.com>,
	"naveen.gowda@windriver.com" <naveen.gowda@windriver.com>,
	"shivaprasad.moodalappa@windriver.com"
	<shivaprasad.moodalappa@windriver.com>, "yash.shinde@windriver.com"
	<yash.shinde@windriver.com>, "deepthi.hemraj@windriver.com"
	<deepthi.hemraj@windriver.com>, "harish.sadineni@windriver.com"
	<harish.sadineni@windriver.com>, "umesh.kallapa@windriver.com"
	<umesh.kallapa@windriver.com>, "steve@sakoman.com" <steve@sakoman.com>
Subject: RE: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates.
Thread-Topic: [OE-core] [scarthgap][PATCH] glibc: stable 2.39 branch updates.
Thread-Index: AQHaqHaEuUqRpG3R/kSfJnGS0ZrtyLGbpBjQ
Date: Fri, 17 May 2024 16:53:04 +0000
Message-ID: 
 <AS1PR10MB56974286E1B0CFDCC67896C5FDEE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240517162237.3941083-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20240517162237.3941083-1-sundeep.kokkonda@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=80c6f174-f689-4651-a8fb-84b05a657bf5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-17T16:51:49Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DB8PR10MB3579:EE_
x-ms-office365-filtering-correlation-id: bc922a37-0379-437e-312b-08dc7691d222
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|366007|376005|1800799015|7416005|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?h2J2SxbI6Bgmw+3a/FbMQDRyaS2FGIVM1zq+8tdKv/UobxTOye0+56gUtwLa?=
 =?us-ascii?Q?ZkWLQ/ZY5rM9OhYFf63xO1QegGlF7po5cdNRafUv+ZgmPopti7pseSWMe4S4?=
 =?us-ascii?Q?+Xi1Dp5hmGnbrxh/NX0DJpPm3ow8cNoRmmtq8sAu/BQqrwdycTZPwWd9y1fM?=
 =?us-ascii?Q?SIIQqcH47QfQ2mVO9jlp2bDHLwMa7Cezfjz4T1orWVMWKB13aSBpZv5vCR3a?=
 =?us-ascii?Q?YvkMCbSzdVZMHFjI9dVKM/4VIsgafZMGy+i2WrEwaYVzC7sJBq8VioziVZ06?=
 =?us-ascii?Q?Nuq7rgfkEEL1yT74lXHUKBIBnHcuFhgvgIzEVLwMBpuDc4kznlo3XTn6gvuE?=
 =?us-ascii?Q?U6xuxDihgNsWMBzuCSBvmOIbpMMav4Mgdem0mrtxutAHEDV58QM8gB23VPKM?=
 =?us-ascii?Q?p/9rQxQZGMq18aMnimzWwYx29IPKiO2cLPEPvy6/ZdXOn7/SywbXdirq03dd?=
 =?us-ascii?Q?RP0fILC37udbKozfuiNecQOK/iHsZSheDSzuMlus8QZNu3dc294z+ehfnkzJ?=
 =?us-ascii?Q?Sghu2+svn998/5jknPTmRB4ui3CKFoGZsJeNDbAZ6UOH+44NszK1qbW2zkRP?=
 =?us-ascii?Q?dQm0MlzYR6nIQbhU+FtEABCRm3f74JSswzfTxx6DlhWpbpaTt38jjyFSolH9?=
 =?us-ascii?Q?xFex32o0rhyFXK4AO8sWNQxWllPEQmFkSMTNFmzTFsKR6xRmqXuu+M5c75Ac?=
 =?us-ascii?Q?9aKdkcohTz5qoUmb2Czl4ct7BhzoBorzksQPykg6UeLTwYG2qMD9UX3t2p0K?=
 =?us-ascii?Q?clxx2812RomUx64S47cag1RODIxV82Ng3E5/IamzRwW2uCegIU1GjKJTGous?=
 =?us-ascii?Q?k2HnpsyQ2ijzWngjYzL6WZpp22Fb8tUZ50zAaMJpM3WU/bAm2Pvff3JdA1WG?=
 =?us-ascii?Q?wgKm3yozD5N7U0cWeQw3xLNJL0DPYd9S2kr9r0+zx3/ZN8WI+2IxuPa7Ww8E?=
 =?us-ascii?Q?MXzmxdZSJbEy1AIa+OobxASXE28RO688Kp4yZXLNrH3FL6g4y+/oC9BJOQ29?=
 =?us-ascii?Q?jI4H8ZYRXuhxjZwyxzcWGlgZYe4NPaKY6LLhgA6XOVHL8HuM59IWJ9RwgE/v?=
 =?us-ascii?Q?Lhc8U0cWa8O9Ah1MiaJQF/+PkZX7xQPbO/eIcPg+EjT1GO2z/Vfyso00XP3O?=
 =?us-ascii?Q?KBa5pAEItisOeAjumAKcqCdxINLAZrsPRZgxC4FIcVAZ0BrmeGxDUFugrb9P?=
 =?us-ascii?Q?ICdil/63rAqvqn4+PTSQktqn5UHaQTBcpSKLvTusswrZJ0lMQsXZaxiOi/lp?=
 =?us-ascii?Q?EdnL7e3lYk2Fv3+8YuJ0Mg0urf7uA8G7DuQstBuqHeHmYZ6hvECzafWtfoJR?=
 =?us-ascii?Q?K1VfO95lEe8xdkW8M5PTomUwn9MEE/rV/DGj+etZ5iEG9Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?n8TbqVOWqM9usiPDmRDpymxXlOzb/m2y48TMMQkXdChTzAyUfQBy0PgcNnRa?=
 =?us-ascii?Q?nuUfJhXwh4nFinDH0r49KLnQqfMYAJdzMIRtY0hIy1pjJL2SnXl2NVZnoYhW?=
 =?us-ascii?Q?2QBnWeTdluBlr0JAq2KPIcr2NXOtUX41r2JKneNSKvVWXlMdaVbRUWqqqbM4?=
 =?us-ascii?Q?uNbNbD+jpRMUxXphmLiyvzYhV82ZnO2EX6Da+Zn84lS7w5AoH9C1KnGWDVU1?=
 =?us-ascii?Q?fcJ+52YRSWjbIyWUxb8YQUwwx6zkjv6h9XMyW6uUYwMM33j3vHrpyH6Mjl3l?=
 =?us-ascii?Q?Dqxc0EuuDP4KC4TzXbtOoDT39+3FpldhR5NH1sS6L/Z4zARR84uQ4Q92zjEl?=
 =?us-ascii?Q?WXU8x7Rxa0UlxmhDyLQJWF5EL/KJQlD7DD91mexkYdQfwBLiiEeUV05bjd32?=
 =?us-ascii?Q?RE1SxKmqkIlaWKhRUkVU35BQehUZWXckdc0SW3ych4T4myqkE4eqgwSWI2L3?=
 =?us-ascii?Q?clIiVfb0V+uPBx0zqNJG9ygxa8bYQsDa9iXcM07RJQE4LPxzFhahuC8jyPJp?=
 =?us-ascii?Q?H6LfJOY0sc0Fk0bmyUbeCKHgQdW2IlpoJ5h2EFmpHB5Va01/zvH26XMIHQm5?=
 =?us-ascii?Q?cGy1OKqgl8px2bDNdQgIy9dcxkZz/lGwJmcW3s/dR3JyPE2/CZspPWuCLesI?=
 =?us-ascii?Q?h34sBgA5IxcxEpPR5M7XdY2tHZqevH48erAFEMPoMDAH68qo8aB88eRRNcIH?=
 =?us-ascii?Q?CaNnpq3gbZX3i8cXrhvmeKlVPmyczLBsAlboS92QtTxR6V9oZvvRU256Ttej?=
 =?us-ascii?Q?LsoN/6JCfr2f9wq9sQTfqk0jkuK1Co3PMXjRmgubonxU7Nlh6EjQ5SEz2e6v?=
 =?us-ascii?Q?By7YwIVjWOl2FC8xpw7YtknGZEsyoBy0RfwxYl+fFNOnsKSCzMWwaO5afpGw?=
 =?us-ascii?Q?S0Qj9JhFICt54eSIhGw4aK1vQI/9IT8M/6mlZpiuuha3TMBX7lrwhBoO2+PD?=
 =?us-ascii?Q?fqtWKU2RFA1uu+PllT2lsbbieBC6oWwytIPnFAjxHZh1U8lGmu45FxTBJo/J?=
 =?us-ascii?Q?Z9LqoOHwNaKvZQHzbdu0BRZDJU9lYst8bqfBm7fbuYDGDykpj+sngkGF92Mi?=
 =?us-ascii?Q?dnXKIiOzkvAe2tkGbngjp93QKPquAljD3FLdkiWC2QQ9ZdOrwS1Dyssw0K8p?=
 =?us-ascii?Q?YetxGIRulfCXW4R7LmpSLUUrfHspKO9+TTUf1qpWd8jOSLbG6oX+RzokU8eR?=
 =?us-ascii?Q?6n/4j0Hr29TNWpoF93zWPdMy5S4miMQ+yJQJXgYJjoaxoSvcYL2RlKLlAa9u?=
 =?us-ascii?Q?dZgnvYLx3BVLiPQRWYWFReQedrQyMoya8q6KtNXzFodkbNzso4G5qAcS4bJz?=
 =?us-ascii?Q?43iLwX549dDUS8/ljcWo58iskkoUVAqCiKjACn0Ebyw8jJYvBkFDgD9W7oIq?=
 =?us-ascii?Q?8lHI3xXJIt5ejilTZEooRypn/WfTsgEUj9aY7NZ4IUbmgRrY5vC/oTVhLAfG?=
 =?us-ascii?Q?RbWp0FBbQVM14jwatpG2XttdCmA+oqA93JGk2RjOvWplpK+BqEppVn4/FOG8?=
 =?us-ascii?Q?phc5O/NHqWeV/P9IPxxRsrjsazHAUpPv9Phl41yyF8cn1cSbhCygHxheDx3o?=
 =?us-ascii?Q?M2BgV+XxbZnkkRcK2kWz2v34P2So1wg/IhoQHV6A?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bc922a37-0379-437e-312b-08dc7691d222
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 16:53:04.5940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w3i8wjTc1x6v9YErm3wGB2kvcfcEUEFKoLg/o1IRpw7jGqt8YWyqxDp6RY7Rgs9U/JYwFK30ENY3oVc6dqFzbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3579
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199525

This will not apply to scarthgap-nut as that already has the same version a=
s master...


