Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907D5C001E0
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 07:01:38 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.82])
 by mx.groups.io with SMTP id smtpd.web10.5765.1690354889386470409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 00:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=k+Ef0DtE;
 spf=pass (domain: siemens.com, ip: 40.107.20.82, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHH6ShI6gvUk8MyAHeeh6+uzrNYAYTOJzhI//8sQB8WKTJkWR7yZeNU9N6sNxD6dLlaBUnYadp9M+PC2/OAKa94JFJsMgn+H3GEmbhU9CFCYK8+qLdvlmnfc/YdnMKq3KBUCVTRwForZbkS8w3nruq/WrJPL9DznIHQTSZcqIj6AYTicK9COtp0h/fpxioWHQuocZi94saSxphYoE8/HIE+kMyR81/ItEEsrKiX//rWEFIJekodf/RMn+lDzjsI6JB12n5V1oYl/isDC7Z1F/LGV4kp6NCvsaoh7qEULPaPgvdvXtNCbT7ePKeWt8mvHz1o7KFD+ImpN4k6kiYZtAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8m1OQwNNIyYN/4zHU867cZr+nJmjeA41RaIepuJaR88=;
 b=XFVih8wkPSI7CVbUjBU9tCsOI0jJOqqZ6yhWkupF9moMzm6WrIow+padNoiG5au6ZGrCZEuI3pOXJ/Y35bXdIySle6ciQotHqiqMzZPRxWxtC9ZxMgDv5KXvNNxJPb0SNpeGDMucZ94swmjRRkCy/uFVDHssPspzmgZNeAhV1VhM5pIZz330xS2m2eOrK5WkK6WUCQ9QyF/b8yWCysbdbUcXbCtypaxdo1VDs+sbDwt29MHYFijslx56yWBMu6tKcJwAHJqoTVF60AvEbKFoWwDsEQa4rls97ZPhObQ0FRhQxwbbOcGcLcF5ppuYl6/dGALbqzyM04xCsae206GT1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8m1OQwNNIyYN/4zHU867cZr+nJmjeA41RaIepuJaR88=;
 b=k+Ef0DtEEqcRBD6jE7Jpx/KzPjHUSWY4g8dLq63w7dw6IqydWFwuoW/YhtrcOXtGsNcvOeXuYt/y7gDa6d3IYfkttFgp2IlxoYWHcboUbNrvCLvtW+aum9Rs6dbL/bGbDuD1Cs12zqA9itMqhhaVhNwRkHrZ0NBfCZdv8COvFVd10tplxeeqcob4VtivAcJHtfj42qXlt/dR1LCgm0XVgnSUfZ2vKGj7k7Gvil/EwfEEN+wSxk7BeX8Qc6gmsb89F7T/6Cpdml3TzjW20C2z15o3NqTt+DOC1jcG6Z9TBP95iLeq5zHbIKVGfS/sHhAx5VTkLrqses35MMnjYes7Gg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB6169.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 07:01:26 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::252f:e0b5:470c:b374%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 07:01:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "schitrod@cisco.com" <schitrod@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
Subject: RE: [OE-core][PATCH] meta-networking: cve_check: convert
 CVE_CHECK_IGNORE to CVE_STATUS
Thread-Topic: [OE-core][PATCH] meta-networking: cve_check: convert
 CVE_CHECK_IGNORE to CVE_STATUS
Thread-Index: AQHZv4vBJZaZqv1F90yGIS1aa/RnX6/Lnj0g
Date: Wed, 26 Jul 2023 07:01:26 +0000
Message-ID: 
 <AS1PR10MB5697DC9FF4B618AD9454817DFD00A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20230726063722.10076-1-schitrod@cisco.com>
In-Reply-To: <20230726063722.10076-1-schitrod@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-07-26T07:01:24Z;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=45930bf7-1531-450d-b172-e79b6a5317aa;
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0
document_confidentiality: Restricted
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB6169:EE_
x-ms-office365-filtering-correlation-id: 17bc0c3a-ad2f-49f1-c157-08db8da62125
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FzeAXVmVs8K3NqK/2vK0n6VuHDCeqbJ7h3Um4k1qAmQ3cRwLWikudHxKnN2LFn0dv/lPMErHUCyo5DVTPTQEWaZ6yu/E0xX0ctrG/Iu1KAniiVEFwWxQd8tFXki50XOCLftX98KRZFr+ZxXUeTYhHasJ+6c6bGw17NBE6opJ022EltCwv7OCCigygJbQhMxRa/RQ68ZyU69DYoxGw0OUe6cLt+ioRLW19G3x36Mh+we1tcF5kVNMywJp/yyF02hy89lz4qwdPS09e+T+ewgrjNWvC3FzzPYiXH6KBzCVCtRSsaStUQ1O9+VHjnA5wYsaBSOhf2kd/OO+3C0ZBdwsII8ozHt3Ii0d38OkldUZmc8eeQchdtjO3pg1iCRMV0k8FaAih611w+PZNcNcfzW28UgakDuoQiHdv0RJdG5gpdisQxdk0PryQ/TRoUvteG8fEL0h0ZU5I+J7pbIRUG5ThnKdhlv7IOrZMYaVDc3iSdghytbsNxWtOblXb+WCvMuFT24G3V3Coj3bELZ/qGf6Dw1uQTNq87ttlPm1pPUtFdQeLvalZp7aaFDvqu9MHuKJyBKh15Kp4k2Ou67VOj7U9QEYzCosM0GgDMrjvVwYxyg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199021)(64756008)(66946007)(66446008)(66556008)(76116006)(66476007)(38070700005)(55016003)(83380400001)(86362001)(122000001)(38100700002)(33656002)(82960400001)(110136005)(966005)(26005)(478600001)(9686003)(55236004)(71200400001)(186003)(7696005)(6506007)(558084003)(316002)(41300700001)(5660300002)(2906002)(4326008)(8676002)(8936002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?UwTRmj/SB+GEFeRuEcu8ySkYzuMF4064WjmgVybzXhuzjRnjQlE/KdHknaWV?=
 =?us-ascii?Q?YZ3+t7cX8R9A1mjcJFYg3hv8GPTwKSe/EkJQEb3j0le/72NS0gXvLwLWQqYo?=
 =?us-ascii?Q?TuDW8LLxKetX4XweySkoqjVmM1lZe0dx2nXFOss+tofA8w8Hy3ly+apFXjj8?=
 =?us-ascii?Q?uhGL3l5Qcli5c6aXgqR+wq4z8EGDsI7vWRg1vQtOEqhKnGvbJdZIA6hHR3C5?=
 =?us-ascii?Q?YRsU00lywXm6xKtsuEuidhlcu0+heMGZagrSnet+ONY44j1MxrMqphv/PnS0?=
 =?us-ascii?Q?haMLqom3sZFvtv2pHznW+FNxnaot+lA2osueRYyQwaT96zzjHBI2tprWl1k2?=
 =?us-ascii?Q?hY2LOV07p2Do+iDKWGrhdHq4WtdBPN8ghbb+OA+m02TXFcFI5rUxjPobj56O?=
 =?us-ascii?Q?wJOOEefkVhhhi8LyX/5SkUk2TkC/Yjkq5o0+3iync7flGG4zBDZPI5Zz3y4W?=
 =?us-ascii?Q?hCa/HMVhBHmOcN06UE+phILhCrd4VPl8jTKFoHrIdvOI1R/KzQrTGqCFEA8C?=
 =?us-ascii?Q?4lRL/lmKbGW5K5msXyPJpzM3u2X7RyiE25tqJiNnLnf5s6AXDztmwGP2Feaf?=
 =?us-ascii?Q?L8rhafRH266hkoXQ2jyzbCY1z4icamJ9VgaMYrAk5ufSp5USk6avoHsH22/4?=
 =?us-ascii?Q?pHt97SYcAS531sfcZfE1XeocTpaJdT8ZiA07fb97KouhCdlBwUGzjhKQe3o5?=
 =?us-ascii?Q?9T8HlI2cpL1kx/I/poPY/fFiab2JvFxqPdIIycMcVV2qBx52h9+Zko2ogArQ?=
 =?us-ascii?Q?qgWOrGZ1ffXkFM2DbKS7w1rbGDT4+YehrRXejiVl94ZZF1+zpgAJlnetUplC?=
 =?us-ascii?Q?X+CqvQ7MOu85cadW7FO6hxJHhqKWzymax8ckn+dzzMBy5gAZi7EKqcEGgkcG?=
 =?us-ascii?Q?e0ATFQ3KISSViX1WFyszMvurc3OumeZBgMBS6nU+0fdMJBs5aoFlgFyC/o7j?=
 =?us-ascii?Q?fgnh1JmVGAXsQGhN0Y4Rxcj4a8lY/iobNNkhBNyYXu8oH6ewLNRA5EgsqgYS?=
 =?us-ascii?Q?Ufpzm3+xZ9v5dMNpc/gzH8yW4IczP55f0EylPM65rbIxdvfI2AQYiqau59hg?=
 =?us-ascii?Q?3UFJnKWAFBal9whkwGss6OP13O70u7Ag9KBrBkW81zggCF0tqWzq/6I4OJ6K?=
 =?us-ascii?Q?0Nn5LoA0QzEz7Z9ubU+XitXyusRT93LTrd7edJul5/egm3vWreR2lZ25Sv1t?=
 =?us-ascii?Q?bIl2WfzwLtSfujuzPrIs4GM3kHmPWSzKimBVpaXHJMEyNnA/jN2Rnz2LzzOT?=
 =?us-ascii?Q?BIv9nV0MPsgCM0QlhGdgxk898328+Pcr0C4LQ7O5SerkHrj73Rqtxy7mgAlu?=
 =?us-ascii?Q?be7Oo01iuRAkdgZLfUta5mdBNsCtg37oWRaIzJ4SOCXNCtphnBaSU2c+LYmf?=
 =?us-ascii?Q?Rll0r0W8OPjxKYS1z7hZSrh/0MLS5Jjsc+cI97kLa4uEyDo5DTM0OXjNApyx?=
 =?us-ascii?Q?7VDtugCyr/EPWUQB/na9StGGckKS+5DueR9EQrFs+0UUzScro6a4kW7STkhn?=
 =?us-ascii?Q?FbeeRZtqiOOAadMij4tZ4XBI077emx1+/35Qp/VCTiuBf1p5ZBj5tpN+ZhND?=
 =?us-ascii?Q?4W7qao74ufz5igZ0vNytCVT1001x02MVPL7EfEM1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 17bc0c3a-ad2f-49f1-c157-08db8da62125
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 07:01:26.2723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qjNUtIR3BL+Y1NrrB/KpFGg1R6ldfdg3aDI0zlNA289ATaHNb1RXXYS6HGBteszqagrPQf+fA55dRHldaWhrwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 07:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184865

There is already a patch available to convert all of meta-openembedded reci=
pes
https://lists.openembedded.org/g/openembedded-devel/message/103992

Also this is incorrect mailing list...

Peter

