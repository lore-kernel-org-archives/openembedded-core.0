Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C9FBC4451B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 05:14:49 +0000 (UTC)
Received: from mx-relay02-hz11-if1.hornetsecurity.com (mx-relay02-hz11-if1.hornetsecurity.com [209.172.38.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.210.1784505722132005235
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 17:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ro-main.com header.s=selector2 header.b=l4BO82Sq;
 dkim=pass header.i=@ro-main.com header.s=hse1 header.b=sN9Pk/Gf;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: ro-main.com, ip: 209.172.38.72, mailfrom: anis.chali@ro-main.com)
ARC-Authentication-Results: i=2; mx-gate02-hz11.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=40.107.193.124, headerfrom=ro-main.com)
 smtp.mailfrom=ro-main.com
 smtp.helo=yt6pr01cu002.outbound.protection.outlook.com; dkim=pass
 header.d=ro-main.com header.s=selector2 header.a=rsa-sha256; dmarc=pass
 header.from=ro-main.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=1UJsevduPfpFYTGt/xpO1JrfwyYgur4yDc7CG1g+nUo=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=2; s=hse1;
 t=1784505556;
 b=KgOygvgJlXPmd5+gaQuDU6nOU+F8EbU1OuiqScjgc9SUaWFHdlv94voE5Z78pxpSZqOboEeY
 /sAgtXk6QSwlgUgz4Hwx+IPf6gGG5OlCpgUCoN6x2zGcSz0FrMlmHv+CCHarJbr/akyXwqykTU8
 kVmFfKaV6WVuAXlfTFInmh+abzclF6gKwbkOOLFmkMYrl0t1ztHnrKYfV8aFM+zViig8RPPeiWw
 htoy+jiPbygoeqnm4b5Wk6oYetgLmQMfkqzD3rxlGVRuET1SBG1+R7+OHJqW4siZLq3XdjAg259
 xTBp6WYOsGFTfAqZkGPn9zTm6Z7MJtQT4BdDCPADxsKnA==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1784505556;
 b=XT7Du/J3iwWgq1bbTWgJNClstwQNb5ZAhSd7XyKYjSy3by9Gkc/+KlKjGJNpsPOI1h/bubRt
 flrTW1VtzhoXHLUN3Thz5SroWNiUGGKfffm2/3ABrQwhq9aZFYSUOtPZWtlIhbswI8l2l72v95v
 zCiw364djuuQRF/iXknS7HjMAjkgeyBtDID0XM5OXvecXgZ44CGWk20DGmoLgeW1bkFo6vulvCN
 ltbuitRrgXpGcC9swpElHCDZFQwv0qjFyOBJjJ0glx/zAZqfeWZ++05TlT9+RqfuA0k2Ccz+al7
 Y7xhYdTgUljvK91ipBr6I9CFVn2nPrk960JurVflQ3Dig==
Received: from mail-canadacentralazon11022124.outbound.protection.outlook.com ([40.107.193.124]) by mx-gate02-hz11;
 Sun, 19 Jul 2026 19:59:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxrHFoKlfG6t5kUVxylv323ivJthpWPnY9bOFlc76FdBFWHvb2tQiJZN/L6l681D2cBIzCTmt0JVI7ojl5sQIwHwiKLdZ8gtqn7xQuv5Pqs9+RmphCMc0qbbpxjIhfcOnCMZ9CfnpElhVqZjKvbSF0PUXB55P9lf5+/0DT6MnInfkT1rJPTvxfeJ1qvVK5A3tJYJPn/ck9ILa21HAc/aLavHCSyK9hPTYY5feYSTW4NxnvUo5ZUpDqooca5XCY3ofSTFwnWNmjPiymi8nyOwPWJ2QGB/Gq/fiSMNPaK427lkIZUtKqShzjUZkgqitA6NjkzHADJG9eOBnairv38uzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UJsevduPfpFYTGt/xpO1JrfwyYgur4yDc7CG1g+nUo=;
 b=PTt/HeUmoDieBw4fVOrQagkG7it9yQHFbz3G4NDHh0fIxny5QS9c5EdllD3ZfSBYzNZ/Tl+ZsWfsr5VTokAkZYjxr+5XADVB+JOab61+gd5lxMh5g81U8wdb3vaibDL2kFybQqnDzLEEwfDOKYOAmLxggdeEsX9qS1C57ehuIYfTVygEw+iK6I0h/D1YlyVRiFhumlPyoSKDW8QjZ9HaAyR9/des0wNwWIa+yihk+aO+KLrlq8bV91YIEKowIXcclEjzH3JvQbCyNyx7LN8XzDH/S9AUjLxLIn4zHpDGkq4G5A4Kws/aNivQJS/VT16e9FTJIEMPiPcP2Ip7D12qzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ro-main.com; dmarc=pass action=none header.from=ro-main.com;
 dkim=pass header.d=ro-main.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ro-main.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UJsevduPfpFYTGt/xpO1JrfwyYgur4yDc7CG1g+nUo=;
 b=l4BO82Sq35+fctCt4WXINwt+5XJxUkRl3vvuaruRBf5LqBDiuifb4GGHYKA0NJm4vmz/LPOVAd6xb0ikzzxaHrWj7RgTibqSkQA6zISqwV+e8avexV3oRPONbDvwvrdAoMJY88KyhiKyM+F60OL3O2EXuukFL9uao9iCmDX+GFl22ucsMyqDUZDwtj40Zn5vMlqpA9LbQJWJUH1Dr0FTC6Mgo+VFA+jzqof6gOHPO1kPsUEIo5lBH0mFPv9RAoP0TU7U4x3olM6uA9jVufMqVOu5XvjFLRyzf/hiEEyoSZYXyy92aNCQ19pKYTa7G0xT8pM8ksTV/3TZh5RTMgCW/w==
Received: from YT3PR01MB9626.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:8a::11)
 by YT2PR01MB9970.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:da::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Sun, 19 Jul
 2026 23:59:10 +0000
Received: from YT3PR01MB9626.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::9de:4480:ab75:9d92]) by YT3PR01MB9626.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::9de:4480:ab75:9d92%7]) with mapi id 15.21.0223.015; Sun, 19 Jul 2026
 23:59:10 +0000
From: Anis Chali <anis.chali@ro-main.com>
To: Yoann Congal <yoann.congal@smile.fr>, "chalianis1@gmail.com"
	<chalianis1@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] extrausers: Terminate set_user_group post-process command
Thread-Topic: [OE-core] [scarthgap][PATCH] extrausers: Terminate
 set_user_group post-process command
Thread-Index: AQHdEtx2HOBdzCN120GnkJiFUFZYIrZ1cnwAgAAaQgE=
Date: Sun, 19 Jul 2026 23:59:09 +0000
Message-ID: 
 <YT3PR01MB962678A052EB43C1B344DA62DAC42@YT3PR01MB9626.CANPRD01.PROD.OUTLOOK.COM>
References: <20260713152937.200292-1-chalianis1@gmail.com>
 <DK2W7U194RBL.10J1D4A3IAQPV@smile.fr>
In-Reply-To: <DK2W7U194RBL.10J1D4A3IAQPV@smile.fr>
Accept-Language: en-US, en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ro-main.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: YT3PR01MB9626:EE_|YT2PR01MB9970:EE_
x-ms-office365-filtering-correlation-id: bc0db6d8-0ed8-44f0-02db-08dee5f1b9ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|8096899003|6133799003|11063799006|10067099003|4143699003|56012099006|13003099007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 1iV5MQy+mafBNcQpDdbMwdf8ZCCCerU30dp5vaM2gHsHnxc957PD4WvNMzw1CHlq13d2xZ21DEeWYOun4P+aGML6LWtfYlkk0U3pPXL4vjgN0y9HJpbgRBt0lPDuAZf/vzE13x6nIvN6VVefko32l6zBfyROgnQjZMqB3O3TqfDJam0+RqI38Q13ehuCuW1JXJ952jOHOdhou5eT/jJux6Tak6oUcP42IuNQfaN1Zm9OLPfurWlKwC9dDVi5BWtykEQaGN9aBwyFrwwq6+bE4npfaXZYIR/IcWZrzs79DO0fal17iehg7PO6i11Q//SEuYfBRZcsFrOumaj0PLigy+S8t18LgyDeMANmKnU9F6nYIk+eC2e3DbRtgS/6C+jp9lOTEYXRIIjnhfEAUTvoNTVHpvxV/KapCQwoKirx5alTS7g7SGfPke0zE5jfFm3CfcwV3L5Iqg8BTrEJ0UtRbED16Wmh6t81403Ce2jjNLmVIxrF2xoYJtuckg7Lurga/HffBHyAC8kTlYvj4BXig8DO6aFSImmiiZt4nZlxTLoVT9ialv8uqt0Hj/1PW1rsxFMqYk6039/BIXBSAGk0L17F1bO/WiOrUqOPqW4sN+zId4xdodeFYcEfDDHl4/6DBLd3E6HrKMoad3W2kNmH9v8nYOrwaWeK7SAhsCaiMMavUq2QYK/OuwtqgH43pAtqDVhximOt9MNs0yy0XllVcNhg9PJCCGDNoDKlZOiPFxg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YT3PR01MB9626.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(8096899003)(6133799003)(11063799006)(10067099003)(4143699003)(56012099006)(13003099007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ET80oyNapzF+Luquzrxp+g6wfX8KjI+LjqaiucFzfJZeqPlOwq4ELA3lRLEW?=
 =?us-ascii?Q?xoCeowrePVPKe9sxFM11KnQLz1UqWHtBPlvgkVOGEGkFrDq5u0yZGxk3/WF5?=
 =?us-ascii?Q?GvxWwTuRPhmlZewthH2C785S/PGtyp3b2MGtWnk6F52q6r1duI/iQTK9gy6N?=
 =?us-ascii?Q?lWDLB8ieJj6ovTqGWTH8dX3hB0Ozw/OSF0eFUqmk+knYLhxipqK0wTPZ++9t?=
 =?us-ascii?Q?YXiB/+tBbrdCjZF4e4547d5LnUJAVXp06/SsfyRuoWmxnDtBzUUN6YsWqMjr?=
 =?us-ascii?Q?z0f6x0USQxn+Sm5k4zGIGi5IGDsjST7KZVZVlbv6A6ir+x6bGY4FKX1pPlVE?=
 =?us-ascii?Q?R5AzL21J+dOFuie2ZQfRIwa+aQ+fFSCQIZviByWIiRy6HQkSodi+FeM0PzmO?=
 =?us-ascii?Q?W9kxBa0zmBpOTH/neKfjE9PNNghnFXNPLsAAH0MX+0cGhVBvUi0qRGSsPhw7?=
 =?us-ascii?Q?lTiFslj8Q5HfUpCzu9b4kbI3xwy5sLvAT9EtJcRjZgHvH0Z2ugxqGEbFf6Y2?=
 =?us-ascii?Q?9Pl2eDRBxpYLC/crH55bwyu8iAFy9ss2hloz0lgwvRN0p5eCTm7UHI/F3Eeo?=
 =?us-ascii?Q?WgLQ2rQbCJr3nS2mjNj/VSTjQgVxXCR00C3hdXtilh4K58zVpUo/N7pTWM4X?=
 =?us-ascii?Q?FxsRJr+/31rA/6Sn2ny5WhNKW9ESNtYVZI8Fgu005PoYB8JQLCwAXTQvkF7W?=
 =?us-ascii?Q?iKjR54OnsI4H0Lc2TH9QzibDgDwsUWbSpig4s4b9YEftamEeDbHL1H0dh8g0?=
 =?us-ascii?Q?2fdafcFf9FepKDGhLDFxRtihrQP2mpTPnJxLtsEbNt7dATffO6HEVfRx92WF?=
 =?us-ascii?Q?g3WZPrg/GVqI+55BfAb0CLlA10l2b4ls7IZ0a7yWU1b/FyPXZeet1sOq1Dls?=
 =?us-ascii?Q?HeUz7CFIy9K2MVob4xkI9ocTbmV+f4996B0unjoXivINXt3LB5bzoiXdQbG6?=
 =?us-ascii?Q?FjUZZXKb+EHwL8mw4gBBfe87EwHrzM62/G4nHjJox5FXagp2i4QoywhIr+n7?=
 =?us-ascii?Q?nllL7iN5/rFO9xVtYoWvmz0pPUOJSzaj8ldqmzCv+FopWmgtZuAiNQjeVLGs?=
 =?us-ascii?Q?E34jTLL9lP0RRUcfuzFNHSiB4MLJuZZ5PthzG+Se9OKAP+t2w8BO13ejVSwn?=
 =?us-ascii?Q?rQwm5FlyjC5t1P7hJizD11EVuPdmauMF7X5B8oB7UM9fPwIPsgoUriv21+XP?=
 =?us-ascii?Q?Jy32jq8akAIzU9oyC1mSsoBcryynTGVARapz4wHk3cUzpyTIOYKxVhVtipnm?=
 =?us-ascii?Q?f+ekBh65WIwlipGwJUIE66okyYsBM92y6/2QtP+ycVJO9l4hEJxe3KZa0BMw?=
 =?us-ascii?Q?Ca8l9YXy2KEErkdO744+79ARkbFI5ZbP7IlysY5sKxPs6kQiTbyhuALZnOvk?=
 =?us-ascii?Q?SNeHbly3Mhfnf8UTL4DNbmPkveFd8GoPkGM6rxR9fPu9KzHFFHtDbNpSEDs1?=
 =?us-ascii?Q?E8u+k0aT+Xq9SqYnp6wW8Tl1YSg+M98XbK/6CvIa1LDAymeRE8mhQTQMporc?=
 =?us-ascii?Q?qIP4dlS0FVjDobKa+BCnt5q9UMYwKX+2ladMOkxT4BsOFN/5T9P3FnTzzmku?=
 =?us-ascii?Q?dvOUe7RIOlza/IShIzT7+kh635PDtEvyD0OK0Lteie3Vjof0pqtLWwK6hg7w?=
 =?us-ascii?Q?k6n/Nj1mm7zgmUyaRyC4dyyf5PBEjHgclWZ6tV+SYSEkpbUPqW1q35650q1Z?=
 =?us-ascii?Q?+YXfDaqqj5vtgpd1jZaQLPc+mJ1hFctYDJRZAbJ7uTZu7KAZa+KFQL2qI0En?=
 =?us-ascii?Q?6Hw+kJzeFQ=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	a/HD6IAGuqhSu8FOB48WX0dSQDEVprPYbhXFh59P+kxuL5RAQnyPNHTmMmgTEKLbqVAY4dEmyopqmTdRCzXnnP335c3fCpYBvvh5GmZCp4N19IgC13TVjFAxQy/t2OsZZD99T2zRZZgXhlB1eNWFyBquDOqyr7CQOlAwbk/aVqu3fCRGMESbvB6OP+/KnmrylCF3dL6A9ZuH93zcRvJeN7KgMaIKYlue8etgxErhZSD3sUSgNj2OWiIoK9Ttds6qPsIyl8iC5/unLiR2/mu0d9tu344yuiX7DDtkzkbOg88s7laQeJygZ9Y82aOwX1pO7yyV0xgE2Lux+MWtXv038g==
X-OriginatorOrg: ro-main.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB9626.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: bc0db6d8-0ed8-44f0-02db-08dee5f1b9ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2026 23:59:10.0045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b09cb452-32ee-4d7d-8695-33522dbb54b6
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DhMilUMIIyOo1GW7L09/zwzqgTYEMn+qriQvovZPodqyo6uQYXCLwG9fsdrxBJBEDq9nMt/0Y5ci1vIl6udCrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YT2PR01MB9970
X-cloud-security-sender: anis.chali@ro-main.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate02-hz11 with 4h3LGT48t3z1M8HH
X-cloud-security-connect: mail-canadacentralazon11022124.outbound.protection.outlook.com[40.107.193.124], TLS=1, IP=40.107.193.124
X-cloud-security-Digest: c1ce53d607b1d1636fc02b502c409128
X-cloud-security: scantime:1.845
DKIM-Signature: a=rsa-sha256;
 bh=1UJsevduPfpFYTGt/xpO1JrfwyYgur4yDc7CG1g+nUo=; c=relaxed/relaxed;
 d=ro-main.com; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1784505556; v=1;
 b=sN9Pk/Gf8naCHPRzEaXvoEASWplFbsAbGyqpsI3fgTPqiFAseXAFfe00DSz6eLrcYZFeX55z
 kbLUetYgMAAoBHPPrKTGUkuzwBY6rEfteyja/cqNku+gSvSY6EG67cSoqeAbcsXxQ7Qf9TZ1TcC
 lBkegaJyFNV15H1qTLlgfncq5JS0W2Kb1y2c8mwtXl1i3nYBA42VS/PksNUvOZjyAGYWtXcYyUT
 VvY/QLhm0UjI+8vRSYbxsLtxBolz4UnAg26/wAary0Lr3fzAsA60ImkFQXRvWZ5QOe4HCjSCfIs
 5LJU8lV7vmCJfCUmOM3xHpCuwYIGk2+P+mMyLsRnL+mDw==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_YT3PR01MB962678A052EB43C1B344DA62DAC42YT3PR01MB9626CANP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 05:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241314

--_000_YT3PR01MB962678A052EB43C1B344DA62DAC42YT3PR01MB9626CANP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

You are right but there is  something weired, this variable is ';' delimite=
d in many layers like meta-security, meta-virtualization, meta-oe... but in=
 poky the delimiter is a space as specified in the doc, I will double check=
 to fix things in my side like adding space before my command or even repar=
se the command.

Thank's.

Anis C.
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Monday, July 20, 2026 12:15 AM
To: chalianis1@gmail.com <chalianis1@gmail.com>; openembedded-core@lists.op=
enembedded.org <openembedded-core@lists.openembedded.org>
Cc: Anis Chali <anis.chali@ro-main.com>
Subject: Re: [OE-core] [scarthgap][PATCH] extrausers: Terminate set_user_gr=
oup post-process command

[You don't often get email from yoann.congal@smile.fr. Learn why this is im=
portant at https://aka.ms/LearnAboutSenderIdentification ]

On Mon Jul 13, 2026 at 5:29 PM CEST, chalianis1 via lists.openembedded.org =
wrote:
> From: Anis Chali <anis.chali@ro-main.com>
>
> Add the missing command separator to prevent the command from being
> concatenated with subsequent ROOTFS_POSTPROCESS_COMMAND entries.
>
> Signed-off-by: Anis Chali <chalianis1@gmail.com>
> ---
>  meta/classes/extrausers.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bb=
class
> index c825c06df9..94576b8872 100644
> --- a/meta/classes/extrausers.bbclass
> +++ b/meta/classes/extrausers.bbclass
> @@ -23,7 +23,7 @@ inherit useradd_base
>  PACKAGE_INSTALL:append =3D " ${@['', 'base-passwd shadow'][bool(d.getVar=
('EXTRA_USERS_PARAMS'))]}"
>
>  # Image level user / group settings
> -ROOTFS_POSTPROCESS_COMMAND:append =3D " set_user_group"
> +ROOTFS_POSTPROCESS_COMMAND:append =3D " set_user_group;"
>
>  # Image level user / group settings
>  set_user_group () {

Hello,

ROOTFS_POSTPROCESS_COMMAND is not a shell command delimited by ';' but a
space separated list of bitbake recipes functions. So the
ROOTFS_POSTPROCESS_COMMAND:append =3D " ..." is correct here. If you have
concatenation problem, they are likely caused by the next function not
ensuring the space separation.

Also, FYI, we have a master-first policy, to accept this patch, similar
patches would have been sent to master and wrynose.

Regards,
--
Yoann Congal
Smile ECS


--_000_YT3PR01MB962678A052EB43C1B344DA62DAC42YT3PR01MB9626CANP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hello,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
You are right but there is&nbsp; something weired, this variable is ';' del=
imited in many layers like meta-security, meta-virtualization, meta-oe... b=
ut in poky the delimiter is a space as specified in the doc, I will double =
check to fix things in my side like adding
 space before my command or even reparse the command.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thank's.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Anis C.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Monday, July 20, 2026 12:15 AM<br>
<b>To:</b> chalianis1@gmail.com &lt;chalianis1@gmail.com&gt;; openembedded-=
core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt=
;<br>
<b>Cc:</b> Anis Chali &lt;anis.chali@ro-main.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [scarthgap][PATCH] extrausers: Terminate set_=
user_group post-process command</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[You don't often get email from yoann.congal@smile=
.fr. Learn why this is important at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
<br>
On Mon Jul 13, 2026 at 5:29 PM CEST, chalianis1 via lists.openembedded.org =
wrote:<br>
&gt; From: Anis Chali &lt;anis.chali@ro-main.com&gt;<br>
&gt;<br>
&gt; Add the missing command separator to prevent the command from being<br=
>
&gt; concatenated with subsequent ROOTFS_POSTPROCESS_COMMAND entries.<br>
&gt;<br>
&gt; Signed-off-by: Anis Chali &lt;chalianis1@gmail.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/classes/extrausers.bbclass | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers=
.bbclass<br>
&gt; index c825c06df9..94576b8872 100644<br>
&gt; --- a/meta/classes/extrausers.bbclass<br>
&gt; +++ b/meta/classes/extrausers.bbclass<br>
&gt; @@ -23,7 +23,7 @@ inherit useradd_base<br>
&gt;&nbsp; PACKAGE_INSTALL:append =3D &quot; ${@['', 'base-passwd shadow'][=
bool(d.getVar('EXTRA_USERS_PARAMS'))]}&quot;<br>
&gt;<br>
&gt;&nbsp; # Image level user / group settings<br>
&gt; -ROOTFS_POSTPROCESS_COMMAND:append =3D &quot; set_user_group&quot;<br>
&gt; +ROOTFS_POSTPROCESS_COMMAND:append =3D &quot; set_user_group;&quot;<br=
>
&gt;<br>
&gt;&nbsp; # Image level user / group settings<br>
&gt;&nbsp; set_user_group () {<br>
<br>
Hello,<br>
<br>
ROOTFS_POSTPROCESS_COMMAND is not a shell command delimited by ';' but a<br=
>
space separated list of bitbake recipes functions. So the<br>
ROOTFS_POSTPROCESS_COMMAND:append =3D &quot; ...&quot; is correct here. If =
you have<br>
concatenation problem, they are likely caused by the next function not<br>
ensuring the space separation.<br>
<br>
Also, FYI, we have a master-first policy, to accept this patch, similar<br>
patches would have been sent to master and wrynose.<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_YT3PR01MB962678A052EB43C1B344DA62DAC42YT3PR01MB9626CANP_--

