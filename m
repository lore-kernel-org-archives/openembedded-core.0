Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6015AE80AB0
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 14:20:43 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.75])
 by mx.groups.io with SMTP id smtpd.web11.18723.1695824439238603144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 07:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PXOTVdMA;
 spf=pass (domain: siemens.com, ip: 40.107.15.75, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6lmUpLap+8hm7yHdZ/rh55q37lRqWlPcxyjcnGxiuSOlWmL1I1dA5jgwgM4UuqVtYqD36GvEbq3uNcLmLM7gRVYjEuI8t9MOhVrfQgih3U0WwbzC0sa5zme+HLq2wk/fUNGWe5lLonnxsKs7KBMXz9xeZj1Rn/DfyGWmriygQfigDRKP/xyz3uM9M+OXH0h2bliwyCK5jpoWoJ6Ra1ntTOtnfcgD12/Iv1Uh0yk6755SZhndP/gBdRfMR1WjjZ1HXyCJU/PA97SEpOApUGfpbagqms8bRGSMHqInhJ3h39ESc3JBtncyLL4ExD7+t0bn0+GaTzdbu33B42ZCWbzlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2CmeTLI2hmrvhd2rywymmgfpmMvQRWwwYuMEzVGzFg=;
 b=R9MGdKv62VunPI/NQmIkLct4PyfyrWxd5s9BVFmu2Q5n5VovXuGP2Rqwbn2NfeKw2n+qO3KeZEYcfL0D8HWhTuHf7vCKi8bjyreBwKC2XtH4xnxN3QaoIWXTu1ocCYan7/9M/9v38KnHwuwNyjEQ5aeyU4DzUIM6oWDok6cNLYK+WdkzzDa6DmTKofZ2skcMfypZk6Zk1bBcGHQA6qajUVk16Lhum1GiOtDF2DZsdnds5vvevdJT+DmjaEU4CI6t4GWXDuR0R6w0Y9npkIuaO6MhhapqfhUAg8HwZi41JSk87rxs/EldKlBIbaKedF8N2NaT1maLCvENUZbBYHrV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2CmeTLI2hmrvhd2rywymmgfpmMvQRWwwYuMEzVGzFg=;
 b=PXOTVdMA3uKKkM5iBInlehm0NFFucCZAVIzKj1SCyoVTyUf783382kLCM85AuhCvz3kID/n+WApO9kcwAPbxQ0jOGeuFh4RgbXt1WACu14KUJWOozwy7XEackPBsaipWwn/ojyFGm6NqGstIKV0vlmn9U/8LLCK6OzIsxzNHdLbnJ29iNHTc8/eLGQdEn5kZxIp4LOnsATTjGzhAFynqnAY//SmDA2wTaNgrIja8qTzAQsD4Pam97Yc/07cAgWg837C98OARK7R/brndD8GPeqTh8fjQI27iT4m0robh9IVZn3sjXQHWlCUNWjXcqJQAdZdjncaIQ6QK+5b6PfE/dA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV2PR10MB6407.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 27 Sep
 2023 14:20:36 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 14:20:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "soumya.sambu@windriver.com" <soumya.sambu@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on stable
 2.35 branch
Thread-Topic: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on
 stable 2.35 branch
Thread-Index: AQHZ8RanJrqC79PrMEm5w8gIkz2gYrAuuONw
Date: Wed, 27 Sep 2023 14:20:36 +0000
Message-ID: 
 <AS1PR10MB5697950F9D7CE003C7EE2A31FDC2A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230927074534.1274994-1-soumya.sambu@windriver.com>
In-Reply-To: <20230927074534.1274994-1-soumya.sambu@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3a455280-704e-496f-bef0-f9769cf7c0d5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-09-27T14:18:48Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV2PR10MB6407:EE_
x-ms-office365-filtering-correlation-id: 54a36975-1d10-4eae-dc5d-08dbbf64eae6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 K3NviLz00L6V3d/pG9Omq0EHckgoBsltjeME7aj5ms+gChdp+vFx6WlDCruxcqh18CfkU4v35Ul3G73OlpW8qKvK7zzOBQES27Z4Cx8JKKRTr+I6d1l3+WpZ8xnt8vqoQrgxoz7YNWhWVXduSXkictpk9G6w+ZX/GNTuulB2E1vhm9EWIdPtsq/hL+0cUHCR1i0NfQCSewroW64pJypcEhHNPRC5hgb83B+sPPcbVKDI2BMxb6ETWF65AOk8j/VcU0w16uL2HqMQfa+QSAy7L8NWb3Vdel5EkdZuUMHhhPS2o7O/s9qCXgpr1+o6D4MwvHGisgGYaz+MTWetuVWdCF7WMg3t5U+GUI2LdPKnMPD+m/YS5Y8hcV8wwRJJ9sN+dCuWwxubbO1FEPC1tUwnvwAPkwNAwyqUodwle+2DllJ8BcaF6mmUTClARseCJwjUupfCxjX+nJP+XBVL0sfLWmPvOYrxVfSg9KgfroH0lC3ESaOGSc+nbqLSojzs+Eyk7KhagtDsfjL83WsweAotx+Ozg7FBRIB2x64t56DLmngi+7jM42x8g0bxH/RJdZpVJZ1keA+n/reoqBTxUfnayvogRAMoqcJU7Jx2FJgE8iuBx/bYu1dUeBT5vTOASpuH
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(346002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(1800799009)(26005)(9686003)(55236004)(86362001)(38070700005)(82960400001)(122000001)(38100700002)(33656002)(6506007)(55016003)(83380400001)(15650500001)(5660300002)(478600001)(8936002)(66446008)(66556008)(71200400001)(316002)(6916009)(7696005)(66476007)(4744005)(41300700001)(66946007)(52536014)(8676002)(53546011)(64756008)(76116006)(2906002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?3rbSsOie7KQyRcl3witj84yot8lqjZZto1Z4uhPeJb7Hxkueu7YbSEo4y529?=
 =?us-ascii?Q?7u6SyKFPn/Z94Pc80o3NfpKF4x4/N7YqklTLvwW5e2dnooMDbhbIK2JN2eDj?=
 =?us-ascii?Q?e5eXc1i0vl+131O/jiFY9ZjOnC8fIfgRf8CXAKdOxO6axkkqjxn189kXDyn9?=
 =?us-ascii?Q?Sh6j17uy7rpnGZJnUJStqdA0Y1DtLBBddyAa+T/xeTFYXT/x6H69iTj9b/CW?=
 =?us-ascii?Q?xoAOtQW0ViLBJSO82Tjm6XPjAv6nr6RAhVIdbOtCaeQxtmj+MfNhcleu4kNp?=
 =?us-ascii?Q?joWNCRHM00ktvFtPf5T0cZnSzGm9+DFOsV+KDHmF5ymi4RFooshFcFQRc2K/?=
 =?us-ascii?Q?r6yKX9Iv7zB7LXtEgvnEYtUUdPB2z17SUmD5V52GzkH3LX1rReRyWqJvYIbD?=
 =?us-ascii?Q?yFCCMIohahgUhJZdDxX5cOwxMUFxAcJlY8/YaksfncFrmbXGtebgOfbDJ0Ql?=
 =?us-ascii?Q?LAhmGe16xJaYdmf5MULt+0wh/eH3RmnNGYk6AQ/k7rjsFi4yX1a5uaEb3mf0?=
 =?us-ascii?Q?E7sA0wWbRj3VLTTcckSDJwxUlLJK7AtiwLX0vX8ocD6GlwvdWBojxTXIqszR?=
 =?us-ascii?Q?RjfaHEM8d0DJScGli1ZwYzxD272GeXfmJipAQmqcKQM7YAW+ShPh8+xycTf9?=
 =?us-ascii?Q?8EKtdNP+moQ+iK7mFlt2GnojGgaSmTllJdcZsI+51492878R8oNZ7KXRCQPc?=
 =?us-ascii?Q?6TfLUAKHp+efqzeZL7J96jA+zzN1iGhHFOL8QBOKzbOpCzY7GzzUoEbZJQg8?=
 =?us-ascii?Q?/NTtMNf/e8q7GnrBEq3cNqJr/lK86POQ1OtEPi0xfjJrefPUurWJwg0anJrx?=
 =?us-ascii?Q?qy41fzVjao3hLvyxjxvCYoyQkxxKb8H0gWcbNwl0VONjR1pwaHxtq+Y5yxQJ?=
 =?us-ascii?Q?Qf7rC7TKCIwqsl6jO0yw1J/8XhMqjEa0nJsArkQ7MjKohPPvOWPb9rxfuCnn?=
 =?us-ascii?Q?JWISLKDdZ8+rvMUa3J6EcdyAeYWPveXCGaOOjatCIv2rsrnmJPusmJ5OYrAU?=
 =?us-ascii?Q?1YGuZJvXJ5ZDEqp7qDkhzkdC8QPRzb5xkNLoqrmo7NZs93BuW2b9sgJkz26/?=
 =?us-ascii?Q?F+NWIj96/4yA9Ny/bVuUSuPCIPDLcno3leh5pz72HNQSbtnnJp5WCE3C/1Ml?=
 =?us-ascii?Q?8kX8wgbSncse9JYa1/R8zds9Kl1KiXD8ShGUY9TD8OBymoG3MpnhBu25ztxr?=
 =?us-ascii?Q?j85MsN6fuZe4qzabGWEf4yCwE1B6OUW2bSQ1b3R+kGBGB1jXQSnyhNz1qkcC?=
 =?us-ascii?Q?kgqo6YHRIQT6zVhtgjBkgaxVg1Qtfz4EEvQRyrZk9RLKoaAV7ZG0v8z4gb8G?=
 =?us-ascii?Q?PhUSz42iQr/oj5qKWe0h6MWPpjy8vlxKi4BR3XHp7XqkLfR1PXItWuwhpkCv?=
 =?us-ascii?Q?cWm6J8KBpUfy0QZFQ5u2krSXnIbAFzENkBFzRG4e0cFb9paCcIEmzp3XshkY?=
 =?us-ascii?Q?kSs8P9LB7ythgCcSTGOHb//jOeUxDQurs8eJ1iw1i2OnqP1y2PcatU9c25BL?=
 =?us-ascii?Q?gpmlgMIDYK94Fdq/DEdkgSb8nRN3pIRpSqBBWwW68tx3CBkzNVpitcnOTONb?=
 =?us-ascii?Q?jqed+XKO2gH/eWM0sS+QWpaxDBcSeqxfCu3c7GX7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 54a36975-1d10-4eae-dc5d-08dbbf64eae6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2023 14:20:36.1431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tqoxaHBZmT1nGr7DyY8u+mCwlbJUIcKd2vUuptaNkrvhT7iq8AROAXtrlTJwas6gFMHdrJc3lYE9NRzSj3vRJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6407
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 14:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188326

-----Original Message-----
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> On Behalf Of Soumya via lists.openembedded.org
Sent: Wednesday, September 27, 2023 9:46
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 1/1] glibc: Update to latest on stable =
2.35 branch

> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> Adresses CVE-2023-4813, CVE-2023-4806

Could you also add these to CVE_CHECK_IGNORE?
Otherwise they will stay in cve-check reports since the recipe version did =
not change.

Thanks,
Peter

