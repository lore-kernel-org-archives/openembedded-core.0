Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FD6D3E775
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 19:11:24 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4140.1765393880080928331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 11:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ANRRaNsk;
 spf=pass (domain: siemens.com, ip: 52.101.70.53, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjOmlN6ngRKA76zLSOSt0SJOy/YwPnYTsVIs76+jQGMsb6nRJkkn0NVZ4hWCqaDS+uBaRxDQkYl+Ey3oANh50h4AZjjHzKH0y6LFucqbNh1Ujpw7KpSAspYwNafFicLbd7qUgJCsxL4Rv1+WzQXsWmnE4WgeppLIYEmFDjhds6PmcZE1MlpbrsPrc34DdMBwxWPC/dqBXMjf7t4Te01Y8PAc2t0bldsKWunVLgCxu2yiiP4VaG3OBVSOchMRdGO2G5tH5ASNwnnq9sNE+0fdpLW5WE0zSe9XTc9Q8CyrltGzLsT/d1oWw2fx+UyjzSKRIEE3xM870vK82zx9wEp+LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKZZ1jDECQQ1mn7xOrqF//1XXsrwcLeJldQYT/XxykY=;
 b=Q+XiBRUZ27OJVx0jRbmaiGwcdahm0pEUgEWKB59qZkCFhS7GNw3UfkoeiBeOsmfQMug+z29xxD31PtcWktQ/RczfWluD6Rbojq2feCUYlm3tgahFw/tE+lpkIqwFlE0Ym/lHIA6tO2B1YmYIX2PPnX3dJbo+dDw+uZk7rXqoaGSc4b4JelY9rvNYZI5dIZcZEdIdO23Wul/DMpXYwGZ/H2eS9QfbhV5eLMw4Vkc/ZfYfTPeNQxJrpZWjzrD1C0G8tNfUWzJGl5EtWkXaHaFInY4LjOguGQXmF/5qJc5qmezpTuvmW/pwJY9mFAlykn2S8mJ2Xe4y1tRBDcExZcTg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKZZ1jDECQQ1mn7xOrqF//1XXsrwcLeJldQYT/XxykY=;
 b=ANRRaNsk3cH+R4B5gzYIy7x98mnMoquT1/q/rrCG631U7BmF8caAV4bPxDY5rxubI3bBc8wncmS3Y0I69thBXVjy3JuEuu/q+SvmKbCdkWJdmROHsC/738zIOrAU1W+8bhawSiJ3lWYw/u2qMeZtye6piZsXYzga7n9fAEhhuUE+vO2V3tcWDQ/vx8KhuA6XDlIjqXdEGAXEwwPb3x2bJCrg2Vtsct09eixs71DzfXXKqm+h82pieY/8Y8BpCFWFJlqdxAQ09nG6surYe8xmSn5Q6Fvg+ZVsGziAfiD6+naSEce/IgsiXYY2CEi3ZCnh1ALlH4ecoOIdhOfrnvHbYg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB7402.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 19:11:15 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 19:11:15 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Steve Sakoman <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap][PATCH] Revert "lib/oe/go: document map_arch,
 and raise an error on unknown architecture"
Thread-Topic: [OE-core][scarthgap][PATCH] Revert "lib/oe/go: document
 map_arch, and raise an error on unknown architecture"
Thread-Index: AQHcaghIKMppkyEcjkWg55PcVOIyIbUbPTWQ
Date: Wed, 10 Dec 2025 19:11:15 +0000
Message-ID: 
 <AS1PR10MB569750572D9608D2958AB13BFDA0A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20251210190746.6670-1-peter.marko@siemens.com>
In-Reply-To: <20251210190746.6670-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=db4ea057-4f07-40d7-94e1-22a5e892f0f2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-12-10T19:10:24Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB7402:EE_
x-ms-office365-filtering-correlation-id: f2ab4679-cd0c-43af-c310-08de381fe3dd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?vtFMTur6UxTzqavl/D1hvNZRNvbhu5bOBWokxmfXBhBLibqQJbIub8OJ/2oy?=
 =?us-ascii?Q?dmNS9YiIfzReG5dvZexZKVY8zefmxZpswqteyCo6wjvkXkwlojMOOCNQO8nO?=
 =?us-ascii?Q?T48csGW7fsCsaCPpLHfXrdhGxJzBDTUz3V9w1YWOdR7b8qnfv68ioYoNcUyd?=
 =?us-ascii?Q?xJtCnYPMw/oZUtRuwX3IDf4wQGZtLqdImPQWTCrdBLGIEabZLcsFrACA1rgU?=
 =?us-ascii?Q?5L1GnTlSnGsHMQ2LJ7w0n/kS1CLP2OhpGBD6GAYRrbXBHbLMbOX9Q8cBqcAs?=
 =?us-ascii?Q?C3A1IYYCy0aZzWfY6WbFiibm7XhWCJ5XMkf15muWIPmWJP2dbNwLJKboyR3j?=
 =?us-ascii?Q?oes5pt3d5WYKun/+EI3uWyZ50FtJM0YnfOOq21ZH2Kmk0Trizy/E4OyCo8Ew?=
 =?us-ascii?Q?xIcOJ/C29deydD8WwIj/H0sy8vUPkmsAnxr84Zg12m0/o/lDFEpdFcDsA0y/?=
 =?us-ascii?Q?ZdI3l8yUrqfIy3EVf21dnWbPtvTDFPI2OUNvukJi5sA9yWS78YEVtfH3MdfM?=
 =?us-ascii?Q?sdvG8pbIYblMkOZNaIU74IKlK3tuZRE59SS0LT74r84AIGdMH1y6K8VZziVG?=
 =?us-ascii?Q?l7Z8/66dKK6AolneXUeFdNRP+5w2NBZFNU9Gq12yETb7VWCkJL0Tu4G5NYDo?=
 =?us-ascii?Q?OlObNBM1Ge/jP7saZsbUaKzV7Hxe8OydbOtJhKDeBRq4L6hMUHjxvjalEyV3?=
 =?us-ascii?Q?PLt5+dwFjOcik6zb7BNaG29ei9GVgH9a1PRV4vdEM4XlJ2SzTUGEJC79uHZX?=
 =?us-ascii?Q?iwMerO1exieeIIg7yv3KOMlcJP0w/RiEMNAqJ0SDP1O1/fhibT2XpGUJsrfS?=
 =?us-ascii?Q?W6tUjJ2tCtbtY/3db4oHk6B76VFCKas1ZS2Oxgz8eM+oWbl9WMP5HKQs03xS?=
 =?us-ascii?Q?nSj3J8ApwqLTYZW/fpirjsakTXjKMs4p0+tr7pNwB77pfmOuHhmYYwgN2qyx?=
 =?us-ascii?Q?lgX+jDCxSiroTuU2LlLHMHQr/sF4NvE98J8H00Hl4lAG2bgo/0DRSLN1GM6Q?=
 =?us-ascii?Q?+umb+5DesvKIu6ZEUu5JYwLc04lbtpE8wVhZpMJ/nX4DoNwXzUoZbYJlSN3P?=
 =?us-ascii?Q?Ig/gdI/EpKM1YhtDLXv+CPu+mCh+M+bAZK/Y3rXn0z/wGtqSZFusW7lwkpGU?=
 =?us-ascii?Q?iwdM55zIsq/S4eFcOzkgRbaf0ke93BlN/1olM3EbkOIANd+cwFshi6Pg6TOU?=
 =?us-ascii?Q?ATyuEaE2eOCJsF1TTPgDxsjK21M2JF+xgYupaFwFI2zn/NHvJLYH7d+GZ319?=
 =?us-ascii?Q?gh6czcwsuhn+8RujSwrFV4GD/21wvt10XS+50hTj6DbI6xFDaFTQvLsxKMqh?=
 =?us-ascii?Q?lCYDMahT4qjHgdouIrkDASA4HHlD2I2Vci7MfwK/lprHPCiXiPUNMgntoltx?=
 =?us-ascii?Q?Vwhn4TxO5Vj9Wtj4TuR60kB7BwE+06TwnXkL4CNK/MRDEr5HxUjZhbdtVVCy?=
 =?us-ascii?Q?4G27jp6cRj1yQ4shk0I9fXDlYyGlMB37WERm6DfGTyiEmeJeYyPv4Q=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?JZvAqergJMqcMnlBBIQ3jrOQzLUuuxpgbfLHdH4XNaVNV6tgAdLoboNesS1J?=
 =?us-ascii?Q?MpZqbEELB8DPwuXDNasq59sTIz8lbB+3fGAShtP+bwJcfeELDi0SukFrxYY2?=
 =?us-ascii?Q?eB1QCR5OjNpkUh+U23VzhuqBQ1/jAHnBQsoN0jTNqDzWhmRZ9QTIjUB+ETmQ?=
 =?us-ascii?Q?nh8qgJx5prEU40e/x5w66S+VTEok1qownyTVx4j7TYOCo5gL+76KHAeNVMzo?=
 =?us-ascii?Q?KaMxKT7vYqKhwWnTnwg0fxBjlA8fEc9d4P6ZSzDkTaWHrXwIpihF7w0a5HcY?=
 =?us-ascii?Q?R1LON7AveuxCTu7wAmufZTf8s1wyt3QJJh7Se3mW3RNEz2AavIVw/paymNEJ?=
 =?us-ascii?Q?xvdcG6oYSENiM7F0k+acXs29p9q5GHZEt20KI9tcCE9PI4W6t09viJEpTOcB?=
 =?us-ascii?Q?i2xnX2gHxEtxiN6WyAmdN3QDSBWFp4mmNI10dg3pRmF41CdrEFQKVJz8FmLO?=
 =?us-ascii?Q?hZEIsQ5z4YrQAZGikHWE9cmzKuPkp05v/uZIsFN8b8tiN+dDK9J5g+QHKcfD?=
 =?us-ascii?Q?eJbsrn1M9+S7OJNOD2S6kjX4mbixgL08B0PpTOfIduk6ZhmcaDjrR1dIU1U4?=
 =?us-ascii?Q?8ItiqUvUrssZDRz5vS2gskBC3LZ44/I8MXIk4i7FaSgwzpHDsx0au57X7HAK?=
 =?us-ascii?Q?FCY3rFJhUHFp7mGX9Z8y8bqb6px0ryM7wVpBWcjUyMzGM9Hgu69yGWRXmWAT?=
 =?us-ascii?Q?Qs9M0PjoHDJfS5cpePBqNofY5IcSiIv9E8d5TbTCQ5s/FGmaC0zQwP2gKjxO?=
 =?us-ascii?Q?vo9ta1u4aVCpGN0v8Uzdc/lVBa1jqi1sjrPURHKvXV7kugExO5LNeCzlAcdT?=
 =?us-ascii?Q?fuY4fxNT+NwklMFNLaUDf3z1bOzxrkhuVBeZhhnE6e/3hKDASDMB4s5w3och?=
 =?us-ascii?Q?s4t+A7hszBp8RwskMruGRFoUri4I2V5JOuJV6s8kAbZ00aKVnMseKvO8Llbh?=
 =?us-ascii?Q?bcW4J9jn3hXc8SSjZShKT7xHbLGb/D5tbYGxi7oZMMNPlQEzSOZs7XzIzwBW?=
 =?us-ascii?Q?EcGwBh7FTRt5/wqxWv9N7Cbhyly5e1tzVmTBih6f9X+nJTamrfgLIEevlra+?=
 =?us-ascii?Q?EQLrYAtHotJ1BynzxOJ3XQysruQqBOs2rt7gILNyjQgOWUrDdag3SRxLmvBF?=
 =?us-ascii?Q?/qlW8wOGyqiNsZBOLEY6RDDfxC5BP73xYzkoYVGZXoPV6P9Uk4wfi/SdvF0K?=
 =?us-ascii?Q?IB9KcMY1jr4xj7SupY56+J2i5rsfWrrDwz/IhXfCYrS3dVvqAFgYUqeBbvI4?=
 =?us-ascii?Q?wxqWQzNSPTVF6ClYufwXIhfvZ7PPWvb/63d7zlVSVOLBqAYmPub9Y188tmFw?=
 =?us-ascii?Q?JJg135RrdPWxgHK4Wos0BQBm+c2At2wBmCR1iMsL/30QLSp/gmLpiQqsyh/l?=
 =?us-ascii?Q?finXFn1j2R/p3C3z0djGdZXoTLkIcTpiUi1zPx29mW7pFQ9/7lttAoDmBiix?=
 =?us-ascii?Q?5ANBsrBBWhF2nRF8TYfS1FyEXC87kIQEqQXqB9RdTuPEDCckRyByoXFOSl8t?=
 =?us-ascii?Q?VUOGzVXoLQujPQPJjyp0RAekqal/FsufUzjg5DiKoSjNVNRHxYOHh1ioEiRQ?=
 =?us-ascii?Q?7RVduxGsW4UEb7rK/xNITmDcaiITXh4FGNlQE/UQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f2ab4679-cd0c-43af-c310-08de381fe3dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 19:11:15.1129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbZLhB6f/Cm/6zoEox1bgafZroP7t8MhiDruQiUNtSKURq7oROr0Aa6qoLwn/3Idql6MxglFwThMBCvLibKZDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7402
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 19:11:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227506

This should be taken before release.
Two users already complained about failing builds.

Peter

-----Original Message-----
From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>=20
Sent: Wednesday, December 10, 2025 20:08
To: openembedded-core@lists.openembedded.org
Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] Revert "lib/oe/go: document map_arch, =
and raise an error on unknown architecture"

From: Peter Marko <peter.marko@siemens.com>

This reverts commit e6de433ccb2784581d6c775cce97f414ef9334b1.

This introduced a breaking change which is not suitable for backport to
stable LTS branches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oe/go.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
index 4559dc63b28..dfd957d157a 100644
--- a/meta/lib/oe/go.py
+++ b/meta/lib/oe/go.py
@@ -7,10 +7,6 @@
 import re
=20
 def map_arch(a):
-    """
-    Map our architecture names to Go's GOARCH names.
-    See https://github.com/golang/go/blob/master/src/internal/syslist/sysl=
ist.go for the complete list.
-    """
     if re.match('i.86', a):
         return '386'
     elif a =3D=3D 'x86_64':
@@ -35,4 +31,4 @@ def map_arch(a):
         return 'riscv64'
     elif a =3D=3D 'loongarch64':
         return 'loong64'
-    raise KeyError(f"Cannot map architecture {a}")
+    return ''

