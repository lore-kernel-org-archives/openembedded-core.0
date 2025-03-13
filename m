Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCE6C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 18:15:02 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.3])
 by mx.groups.io with SMTP id smtpd.web10.22170.1741889699614570839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 11:15:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=j4p1YONk;
 spf=pass (domain: siemens.com, ip: 40.107.162.3, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6oLwwCosEIjx4wcZbYPJ2leQ49Jz311HW0FqhqBq3W4IXPdEVtoo2uaS5RrwnYxkLt231S1198foJeM1S65OErRmg47qx+YSLg3vRMq9CkXUuXKcrrMbrdSPbWKs7/t/FNDfI+2Rs0L4ieDQulA31t7docaoh5OrQC6C6KchC9qP84xARcqEarObazuBrSBMxIwj2iNzt/mYSIc857EL9yPETqWgSXvSXT3yerGLux9CvYfljGfqEbMJ2+b/0ZrZXiloWMtv/5qmY/uiryicYvw8cyFoGMIXJOYyppMudZMQiUZ2gMTf6Bkp0g7v77kcXjc1eMCrZONCnKfzQsJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piAI3p94eLufSHkDn83RNnWHtTuEsVbvb9Q9Qh0go1s=;
 b=KBNDsPO6NcESMbF/55EJDwgxczQst4GEOISzjiCQ5+lKvc0ZbKSajd5AT4bG7p+fSyKEdVKglNOh28lZ54YH1/6AJ9C5gXFVgxrLlk+BP4lIq4C4O/RoAwdq348sIcOdTcwkjS0ZGS4kR7LxtbpZZKy3+bbsEgZGc58ajPtcHdyOmbHfE9BS/S3DKyX9Vvn7W0BlPQY6reFSLnofqfiuLkHFq3KHoBpGQbs1mhnm6W+yzkfT7fBag0T4opbWpkp5qPMWo7+lIQ8fbGp5yzzSy/PM10p/MuLuH4mLFrm3XK6RoEM1RdELbRRkmpp1ktW/iaDD5Nbe/r6aKrQecFn17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piAI3p94eLufSHkDn83RNnWHtTuEsVbvb9Q9Qh0go1s=;
 b=j4p1YONkKGpK8+YB7q7BshE8IIVslV4m+zZ2kWXlzuQLPPy4E75LZV2MqG9N9CX0mfuJ6gidXt1CyI5s/tHdnABtGLZcw25B1QX6EK/ypQDP0RgMwyL4O2WsfH5VXpWEMiUnLw6lsrlNrHbScJy7MlSIhcz/4Z2hsfQvnGPaf8HEyhXKSo+8liURdLMeOatIpPdrn8A3p0+IyK+L/PC+50Hknt4J+9ebK7y4JxXfSxT82NQOnEE6KdmthUNxhj7JkXbRuiQL/R4EsRbsnpnVED9vhHyCynTJ42IyPsA8Z982ytRMAYLEIuo+G53MCPRQ7tPUq7DdHw3juTcJVTcUYQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by GV1PR10MB9025.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1c5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Thu, 13 Mar
 2025 18:14:55 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 18:14:55 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Jose Quaresma <jose.quaresma@foundries.io>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH v2] go: upgrade 1.24.0 -> 1.24.1
Thread-Topic: [OE-core][PATCH v2] go: upgrade 1.24.0 -> 1.24.1
Thread-Index: AQHbksbUDqN/puT780CoKa29SaSDrLNxXgIw
Date: Thu, 13 Mar 2025 18:14:55 +0000
Message-ID: 
 <AS1PR10MB5697DEF32F93D862F25BC8CEFDD32@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250311204646.1661420-1-peter.marko@siemens.com>
In-Reply-To: <20250311204646.1661420-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ef6e2240-a5fb-48d2-81a7-65189caadcd0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-03-13T18:00:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|GV1PR10MB9025:EE_
x-ms-office365-filtering-correlation-id: 66676386-a7d3-401a-c9f5-08dd625af4e5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ky2/i2MyKG/QkW35xwLrmF5vsWJ78m+rW50vDTJfpJ6j0xcE4Cxl65ezS7a7?=
 =?us-ascii?Q?XyyAwBZH44JxdXO9NvTO1A0lnuyCIEYCdv0JrxYD3dIJDCSzSH9sxkBOG+mA?=
 =?us-ascii?Q?RWb2A/qzcwopVEnpnvUYVD4eN0yh72/8fgJsKRKP84uyh0p3wrTqrrtfjOVH?=
 =?us-ascii?Q?lxzJRFiA6q7OZvDF3FZdWnWgien2BVXmrTe+t572sy7JABOYQ2dHQw4OzbJK?=
 =?us-ascii?Q?JB8nfoGrsAZsohfoddjHep2lhwWo/hwxb94A6DvUOu9kxqyKJ5M3bWjq6pIM?=
 =?us-ascii?Q?OF9R8DJsIA7iePnE0eA2meR/Pd4Q4FzK08X/5WgeSIiA6L+5fjHU/TZAgBTY?=
 =?us-ascii?Q?kB09k5BQABzcXSvaz1Iw9o1fGQEP1RTVq2JyH7oGV/NWFtpAn7AjY//7Ju8D?=
 =?us-ascii?Q?aE/zYKwSRQhWxQe1Rp5E6Zz/CKKyTNoxXjMI9gAlDmuZLGxBkqvDPYn3TIZt?=
 =?us-ascii?Q?Tc7wGKVCmBPXqCb0pajKp3aqBUHHtYUjvvOgpi42TQRRE4QjzXYzUdQdTq/u?=
 =?us-ascii?Q?JT/8YN7zMHJdv1FVWr6k48gh2z0GwegDdgTpM7FYxTQfEgDEXEDH7fwBBKcO?=
 =?us-ascii?Q?39vlgwxtHn/bK9DcZJ9DndBeQxRXFucNgGEwh1jDhoLGa/iwmEFKRUOpZKxE?=
 =?us-ascii?Q?7tpEuanKVnvEjSb+vk5ta09FRjlVxa20sz/zKvzVftQR+wvFa6ulinYDdbq+?=
 =?us-ascii?Q?m56A58HeSEtvzp3HMftJoekDMxyY4Y3slrZGiLnU3BV85P4KmkiBJLw8vBMC?=
 =?us-ascii?Q?bfBYazz+fcWySNjgXomoR69oWr4L4l6VjjV17fLn8TpN/fKZgvq/MqMSkhrW?=
 =?us-ascii?Q?3VmxNED0uSCjpOXEvNSerZHWDdes+DOgnqyY3O3+vW0KKDJaqjtQfC/unQwH?=
 =?us-ascii?Q?uNL0mrOqKr1V4n5woWEjMU9E+iA5ACE5bkNk0CGCB3U2fgLM3Z2k6apfmpfL?=
 =?us-ascii?Q?g1o7fHyl8Uw9jyeSjTUSOafgWagEA5+e0hFhi4azAYprjYRYyoQmEhbfs0UK?=
 =?us-ascii?Q?qlSOpT5sT+i+WIjAmjqB9sJ77Y4NoL2UxZG/ie6pd5qfTjQteC6X6cQkGknV?=
 =?us-ascii?Q?QIV9+6NhEA9s/IC623KO3p3JkG8zsYYJZopK8bsxdmHKO1n+RNz4Fha2+cTW?=
 =?us-ascii?Q?9j2VpTaReXuACYpgzUkqgQU5OYFrNjPWJtFd5RVsPzFHKoM21fsOH+CuHswG?=
 =?us-ascii?Q?utq3J9yZhij2gBofPGDkhDnB3B7kBMsGAw+6ueRlRr55YUCuRii5YHLUUsxz?=
 =?us-ascii?Q?SRNDts005csy6Wpo8BvBDXvZK8VVeEqTiCXeWu4h/3lHRu3df6KDAIxgDfO/?=
 =?us-ascii?Q?beY2hlSvFWSZnR8LFJRuxudeOIpSEwb90nvFjGGVnDDWphztLcVUHKVhQDd2?=
 =?us-ascii?Q?513Lm+Nuvi3BFx1iS0ZUtPkFWe18HXfAJrH8eB1iztQRJI9aA6DM8zFqRrS4?=
 =?us-ascii?Q?hW6qjowow7TgXQ0N6zJmUQIqHfqr5xn4?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?nS/5Ga1fxdVT53DxjK0ZAx4JB4h2UQwxY+9yBCf1w3u2WtnAl0aKAeUoYNSZ?=
 =?us-ascii?Q?SUH6LKGl+jxX2PamG+xxHQZPSz/EHj7rOR6ci4elyj762uD/ndFgEsCqRHca?=
 =?us-ascii?Q?uqbU9x6hPcOPvnSVeohOKZXDaTssdeVG1SBvNER8o3BKRKpCMO6No5LG6y5x?=
 =?us-ascii?Q?s11m7INmoNaLU1OVeJQgrmIRk9PvYi6HCnmXbDmD+gyqVnENjtk0Pfx5L3Fb?=
 =?us-ascii?Q?iOq4Zhd04hJJ32jmfHFR9c66i7W6RZJ9er+oTs/sKr8YhzOYs8xr8IzsqGzF?=
 =?us-ascii?Q?p+QyBWv6sshXRHTgJDuCm1+ck+nSF3kzmpV1DUkjHLt2ywyv6Np4Xfx8bmnq?=
 =?us-ascii?Q?KGlvgyqN+GaXerHBjLjcS5soP3N9XI2iFghgIKUBkNgut6ouPiTPazF+i+2k?=
 =?us-ascii?Q?fWLg9z6eEOlLXP9XOTCOYM2R7c4HOMJh49S4v6EMHrGE95KZjV2w7elkhZMY?=
 =?us-ascii?Q?PoLcv37eCENppVqQyWxLOAms6if/gutkN1C/5WbbZ0ZkWMnpr8LFFCix5cCI?=
 =?us-ascii?Q?jDTCQHflh/7ik0lBF76Cjvzg6cqh2FK9GtwOZ+kESSqELHLc9Y3yzeu0BU0X?=
 =?us-ascii?Q?U556tgosCvtv6YAIqpNQ62X2f7FXc9Wq0VzOgPz+WBEJFPvVUKKCV+dNseph?=
 =?us-ascii?Q?aOgLlL1gtk77ML22XIYxoAxQv6SDbndls5i5bqzTF8n3rYi15iUfVFSJIH8l?=
 =?us-ascii?Q?vPD9v9i8myCEtomUMDSIZQyq00XTn/jwqdmMJANroMgQSFXbg58eLqHRaid4?=
 =?us-ascii?Q?iac2e5utR524tbwLTHwE/8PwW6PzjJpE0dipBjjSdNJ7P+88qvHhOhv/3uwV?=
 =?us-ascii?Q?X61dwe+wRk868TBkvX7maD7iWlqpL4Zb4obLZQJQ7uF7L6Is/SEnQk32aajn?=
 =?us-ascii?Q?KXEMfo1s7+YVrGE9wWR7gIBe99cDUnEflqnv5KNuQMjxJMbG8ZSOQvfdsFxo?=
 =?us-ascii?Q?9idtfaOPB99ggQiMqWybnY77Qk18ElSu4d0RwxjbQROfwlwDBMttYX1JIQ5F?=
 =?us-ascii?Q?A4kxlThyXK3urYsupKhZdaVseUi85ZIUVp87fBDegYwtp4E8QLxbq9G4Dqo5?=
 =?us-ascii?Q?M/wYOKsS3YY7iU5rOJ8QlLCYdMMyvLXM63r2ICHjV9EdY6S704oc4Gv8jI1F?=
 =?us-ascii?Q?XhnLZZHhl/APuW8DnD9xcee9X766ldvL1B+wrn6ryQRyzYFRCeSXWNdE91l3?=
 =?us-ascii?Q?IC8fr7obrp3oSjqyvqaLfO6JVDojdhc7ZKjhcQeg1RQxCBvTL7ZahJXROn/l?=
 =?us-ascii?Q?KsJvY75ETVsoI/Mt5T0KD+f/YWVaz5qJPEjQzYDF8UivfhAJaZB84jx6nbIu?=
 =?us-ascii?Q?xsP4vn5eqGDESoGUR9E1twinKkiYy5LaNQSL6W54oFVAHmTqICdkekhnQ3Bq?=
 =?us-ascii?Q?Q2HVzZevvnA9fMmAXU5mhFyNkm86Ch38H1XyKD3hsKc/8Qj3SmoFGEIkGz7e?=
 =?us-ascii?Q?zn2HmJ8Sc2eGxr0BGTw3GBZ5Kc79fP3yhwo4aG76Vh6T/UHxRYsnlP/uc3rM?=
 =?us-ascii?Q?XCb7BDF1epEEzqPWKHFfIzMmVUbbBBkAeWOO29GFnYC16nntpYtYnVOyP22r?=
 =?us-ascii?Q?abwksNvrMXtIYcaWxpHMlabcZcc/eFOZI+o42XJg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 66676386-a7d3-401a-c9f5-08dd625af4e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 18:14:55.1702
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U8DQdw5h/Lcfwf/yqWKO41blqLUQd9rgMLHjS+r3AFF6xBqSgAlQryEYt2udIFhUlNyytjYIy6JKW+4kzinQ6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB9025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 18:15:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212801

Hi Jose,

After go upgrades on oe-core master, meta-lts-mixins kisktone/go
branch become outdated together with oe-core scarthgap.
We have now one open CVE and more will come.

Would you pick new versions up to 1.24.1 to kirkstone/go?
Would you also volunteer to create and maintain scarthgap/go?

And if we would like to follow what rust mixins did, there should
be a branch-off of current kirkstone/go to kirkstone/go-1.22 to have
a kirkstone mixins branch equivalent to oe-core scarthgap.

Peter

