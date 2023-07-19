Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E63A3C001DF
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:03:16 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.113])
 by mx.groups.io with SMTP id smtpd.web11.5258.1689796991737819855
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=EkXzNJfT;
 spf=pass (domain: ni.com, ip: 40.107.93.113, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CSvY7TvZEyj71SoCnWCxjfd9ojEmykjlzaYbvCgT3TDzw4Spc1//ZzTrmyYo1A2AnHZinBYyJP+Y62W45c3ls9DXo42tI6YST4pVpG+udSS+UTm9fdJXcUz8oTY5I+URj5NGEqZUMuud83pTI3GAU01gkzKBLA8iDf281c6kNbJy6RJKDOylouFyH1F9MnqWOglxNLs3QkRkj2Gm345x0QJ2DxPPw2lZ016Z7xduURchVCk1g797048ZLWMZxkwlX/mDvcmf/InCJArUsaCri2FFc05GKBfq1FeCO48CEdYh4h2mvCoxybymbB6EyILbD7bgwVFUX6aiHqmjgIy4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/GH85qlye/HmWgcASA0vo9sTlQ/QSJ8m150ALwh3mk=;
 b=QKwJqpkb5rIrsY4DkAO9mYH0dYSEJ54mfG44ZEOtcik+BET7gLtb9FkmC7eHpGlkL6ZnAJn+PsAVxBXLCn1s3MkX1DupHW8y84MaFsv08CXQFrFCz3vnH2Qy0ez4CYLBbQS5NMzsXnDvZLJnQ2P0laS75lcQbjk35ZHU9/Umqj38kMRY9lCRoFSnAMB/zEFKkEPUKhr9KOuvpkf3XdLQQ3COxPtAIqbuBPf9Qlv1vnW4+yjuuQTtZecBlsctF1DRCpO4StSxcg4tqYgrBWv2HgNvTyWeK9SBqttWMbYqw63hvW3jTO3RyilnRYbG5RIlhRwbdfw6mSwTkXTWgzLaXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/GH85qlye/HmWgcASA0vo9sTlQ/QSJ8m150ALwh3mk=;
 b=EkXzNJfT6Sv1iUXsoX8uRdhPVZai0QFQoRu6QYtbxVCrCBMYl+b90ge9i66fM8L2RgklU27gXtTOkYZOdkD0JwXdwdAAy4w3F/QpY6RNk9AVZa4XbXu97ePh6nLNe8/+5PlAF1zJDFXXIwBkFLPVxcw0I6/KGdvswoVEenhaGiU=
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ0PR04MB7805.namprd04.prod.outlook.com (2603:10b6:a03:3ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 20:03:08 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada%5]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 20:03:08 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [oe-core][RFC PATCH 0/3] Add packagefeed recipe class
Thread-Topic: [oe-core][RFC PATCH 0/3] Add packagefeed recipe class
Thread-Index: Adm6fAlzaNwyuywUKkainEAuY84Odw==
Date: Wed, 19 Jul 2023 20:03:08 +0000
Message-ID: <20230719200252.1203047-1-charlie.johnston@ni.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DS7PR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:5:3af::23) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
x-mailer: git-send-email 2.41.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR04MB4870:EE_|SJ0PR04MB7805:EE_
x-ms-office365-filtering-correlation-id: 7f8e03b7-5d38-4213-fdfe-08db88932bf3
x-ni-monitor: EOP Exclude NI Domains ETR True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ypXmkGEzRUjTlhnGgUTUmMGP0htbre6mNC/AR7V7k1tHmF+ixHw1rng2ZMkmrHoeFY6XUItY2h+XiHOyDsQETHMiPBgrBWGW2gxY7KzZZ1cO1NNi8m7lN1+MO8uUmXDBjICbKEpwIjqLOHgViMS82c8QJ1Xa2fVQ/W1CGPeMTJr4WqHNekzJLUTM1f3uxAChYVeU32H+0zkU30EeXGaF1gNFZa+bttyLOEjfuV/vTt1DEy7xobJgsRS1McyzTvJ+36G8dPYDFskiU+zqq37HbZA+oVieQU5Gtx80DOiwRJ4sFeuPYYCEewbTJkzX4IQAhi3yE1bAome1azZysT1v654Pq+t29fOkfYyn0cFvtqEPDsZIecYrlcGwv3hPP6XqpCFHjQ+CghfB1HzOYZObn27Xs00lzB4PSRK+oinc/WVTBn7kmH3uwB/3ZRAu7R9ww8WyRfiawhGmmowV3VYD0QX7daJxLu0aExEONsGVSKugvILdrz27P5oHdDKt+4OFS9byPALGcT05Y6f/bWZEQv1c+p2s6C6hW4IubSxGfHyNHfZtmxw7uItq9fkNMSyS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199021)(4744005)(6506007)(1076003)(26005)(186003)(2906002)(6512007)(71200400001)(36756003)(6486002)(44832011)(38100700002)(122000001)(41300700001)(8936002)(8676002)(5660300002)(316002)(66946007)(64756008)(66446008)(66476007)(6916009)(66556008)(2616005)(86362001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?DmFpH3pm7+n7IMclmxpHuv/TnU/PqkzBhmFW9f4vb0Pqipk5x4XtdCRNx5?=
 =?iso-8859-1?Q?GslR+x34CaYe7hvK7DCccaA/HtfkvZ/T5qivBW4YWvqrQjC9YiiGfhfDOH?=
 =?iso-8859-1?Q?bJUq18/xGfYaq0+Ywqrzu93uTyjdwFp2QAnUnIkONv19o+Xc1xuXw/1NUt?=
 =?iso-8859-1?Q?Pn2NKzlkDENuG91aB4qRC1dr5AqFWfoT/7qzsQo02l/wO/CgJLI6Q+m7vQ?=
 =?iso-8859-1?Q?0tSja7h2jisT9LQcChLjxVFTXtzZg0qWifY2DyDYz0e02C1j+DTOIWOl04?=
 =?iso-8859-1?Q?95GbUGnWVzhHE6+BqKYlrB8MoArpa8irdIZrb1CoOzcd5xnZKxPCu/T3ur?=
 =?iso-8859-1?Q?9xoXi/NQOMQ4vdndwQpzCUcRldDoZqogGsVlnQAMCR5EHZuE56Q15TDAJI?=
 =?iso-8859-1?Q?pU9ifH/jKF9Zqvar2cXgV7kOedgGq9J3o5OugMcNIuvZphGkjNEA6+1Y7u?=
 =?iso-8859-1?Q?FjRJx/RyghHpvfLeTDcmZxpPPRFTOliHAKarAFRrzAU1rNUo0yxbmPCInn?=
 =?iso-8859-1?Q?hjjskrX6IWqoeFYNx0Ou51DD8S32mq5JZTaIGQflKOud5mOoXw3uZJoeVL?=
 =?iso-8859-1?Q?OIBy42N4etmzNkCxiV5WD5fnzieANX9VjWQ0/Q6MLPQTyHlvXNmO6lCloa?=
 =?iso-8859-1?Q?Cza+/ttjVRQ5ePcrl+utbNVgE3DfdNcRgcHQKQxx8rPE048ExopO6F9kV1?=
 =?iso-8859-1?Q?8+Cd+tlkXfKmwSwnMytAmlJbfZD6r/wC+cgW93K38/hC2EEzVIFHcIRVif?=
 =?iso-8859-1?Q?h/tO1tpoLoh8Q43s0h6ciV9uOrkgcfrpoU1kPpMZoSOkqlB6nvgpmc4cBg?=
 =?iso-8859-1?Q?Nc7tbIX5VyL/teFgLrpZ6WYT7UetkIyep2Gqr6gL/m6Sbg5QNcQPeKUT3n?=
 =?iso-8859-1?Q?pZdRE75rIKvR2UTRlGONwx2xnTbKW7UHOaMLUImPgNqK8/7eruv5BU3wbU?=
 =?iso-8859-1?Q?9gtuHGdpRWmZRzZCGlHhHIWhQvMt4JCELy788aB8NK1b5LMAswIlnkBV+Q?=
 =?iso-8859-1?Q?qx+VaXp/ZlEPCUgPGR/tRdMhNUaJP3JftCoHlruWbT/1+4q3+PY5Rb3C5N?=
 =?iso-8859-1?Q?UiN87vQrBbzJcwGBsiVN0vQmWQE6czK7ItDo2Qa6LVrl4fipLPfqbG0NKM?=
 =?iso-8859-1?Q?JxINx0KUBV81En0Tzy/rd3tL2UQ76mA5sWRS47o5HcQvPVX/CLWuGOeJQy?=
 =?iso-8859-1?Q?NKT2Y2l7JNnIvwpRIO6dZvmB281mq2sWIso0jWwAEkzjggoRa68HCjcaCh?=
 =?iso-8859-1?Q?RFhMPjFJFYYpMN2jEUMmJC61uM7hNJkZZrqcogD6aofxIBcmwMPzPndflJ?=
 =?iso-8859-1?Q?epkE7hxdoj2D5qlMqp4WJp9I2BT7bbbP6rY0E9p24EgOaSFBQvnjysmijD?=
 =?iso-8859-1?Q?my8u9QVNDCWhSxbvtnRXDhl/I/dZYX2U0spk7sF1B2+Y+A6aph8SS8gwfV?=
 =?iso-8859-1?Q?o4PiA/FY3WOi+AHpTwDd+qE11Xh0T+jdMEE3I3DnJdYf4DGQCiYyX2qri6?=
 =?iso-8859-1?Q?tyjPwSvdpIsKEDGBTJWXYEFrxZ6v2Zi32PTWHcS1PemOUhq6+bzvCv+qQQ?=
 =?iso-8859-1?Q?2bxMZUfOsQ1McXcItmg9ilKauJWhbcfereHTpJWx5Y98qtuWXTAyJLp3LJ?=
 =?iso-8859-1?Q?Izi3nFAJb5LQ9FEdobvws/yc4LLhiwYRaROSvRfr0NeGIw7P6aBHxz8g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8e03b7-5d38-4213-fdfe-08db88932bf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 20:03:08.1574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /6VA+q/sEAHP2G59wbqrXL02y/8j4ym3kLHDbHConhqMKAjPUX2zuC+PVA2JVrGEUYrHN07QmAbCVqgYiYTNyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184601

Hello,

I've been working on a packagefeed.bbclass to allow recipes that define a f=
eed. I have a working prototype which has been tested against poky using al=
l 3 package types.
This is my first time submitting this type of change, so I'm looking for so=
me feedback to cover the gaps in my knowledge.
Are there tests that need to be added for this type of change?
Should this type of recipe class be SSTATE cache enabled?
What documentation changes are necessary for this type of change?

Thanks,
Charlie Johnston
charlie.johnston@ni.com



