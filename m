Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF2DC4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 17:07:18 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.114])
 by mx.groups.io with SMTP id smtpd.web10.68562.1707152836948444481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Feb 2024 09:07:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=qTYNKjqE;
 spf=pass (domain: axis.com, ip: 40.107.6.114, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkPmpD/X0T3KspPMI2Itv3G1llOdwMcdnu1u/qWVwhDsUCKMIu71pUIgR/GfRLEfEnhGW6O9nK+VbmMFVfKeZHBwQruGgYEWKHexqh+Uud8X6ZLbkXjdmFukj/tKVIbq039wynYuxySLdvKHUEJYFDA6YQtEZVSIb2IzdmK1LeQc4rUpDQim7itb8EpOhbrSqvbi2lpRYYtLFRF2thohwidnKWKm9ykowIUKRoEsmEQsoKPZttGDM8IDuuQ2Dqnn8nsEGWoUbmNXz1CPF6zyzaYuVJ/QHjaPjI3caMgU595E6Hu9cXHf+LeAI7XSwYV6/mzuDfaqAsm0gLFTcvR4vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5/WDAwCrzBs5cxN0E61gerwgLQtNuLoGG19DqJZO9k=;
 b=Am1XT4UXsTHeiPFzKaa2smxTymgUPHn6LasyqS3+Z8W0yQsjGQeh7NE57bKY3iyx+uqvtVzfLPw0F2pnaNufsXUx1oOwxxnY9HzzTHxvN5OhQ1NJzSVwvGFmKplBSfvlgAmSD8V+s9AZV8ZaqI6qLQcNtisCGY20e5adLRYKGgyVXPcsUGianWSMMYrgDgVSMgX7Xx+PcseEx2V5lblpbOxNFemjAq5zJxJI1eWb3CltsS2PvXq3rb79izcgvwSJ8cPUIZmnMpxlmoNkIWo/25fpwmz7QP36LTPRkZHqDvKeii6ox3+RiGWjHMqI+LxKvFtzpjGQ+XjhiYHQLFnCSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5/WDAwCrzBs5cxN0E61gerwgLQtNuLoGG19DqJZO9k=;
 b=qTYNKjqEJByNVAUdly62ZpvSeMdN/+HnHTUFviWao5zFlUrgxiXrgdDUnvTs5z5hRZcJTtmOL3bgKTOSIAO/6hHsVlDGXofIfeZSr+P0Cr2Fh+S19G/9g6fXQpqwaTS0VPkKq2jp/NOAAje6wcl01Gcmqp+LsooYt4MtFvliMgg=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DBBPR02MB10823.eurprd02.prod.outlook.com (2603:10a6:10:537::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.34; Mon, 5 Feb
 2024 17:07:14 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::5b1d:259f:4ba1:8906%2]) with mapi id 15.20.7249.027; Mon, 5 Feb 2024
 17:07:14 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "joe.slater@windriver.com" <joe.slater@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "randy.macleod@windriver.com" <randy.macleod@windriver.com>
Subject: RE: [v2][oe-core][PATCH 1/1] eudev: allow for predictable network
 interface names
Thread-Topic: [v2][oe-core][PATCH 1/1] eudev: allow for predictable network
 interface names
Thread-Index: AQHaWEih41HBjv2+uUK9NLYumXp1RrD7+oHw
Date: Mon, 5 Feb 2024 17:07:14 +0000
Message-ID: 
 <DB5PR02MB102131B26BE4C24323A53ED31EF472@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240205153302.670089-1-joe.slater@windriver.com>
In-Reply-To: <20240205153302.670089-1-joe.slater@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DBBPR02MB10823:EE_
x-ms-office365-filtering-correlation-id: 2259c8db-9eb6-48fd-c770-08dc266ce644
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rGRzm5xPMF7iAbxAv5m5JIw7dL1umIyWJMiWBl/uH6bi7RmiY43U2OqFegPBqtWijMCX7qfDNHJ5RLwcjb0erNnXR0MnF37jAyzSwW43y6wmkdkd8Ypmre9/4VEJSn0dqIs/3TGkPkI24uyfOu+YV/jIeyh1Smk+r2NADZNzqjcAqyx4YiA3h/sfzfxsa1FW8m43xkfEpTMsTKkGXViiqviEIgGT+fQxO3NMzYzM9Ybx9/N/kAQEe3WdXbhFflQiW3xOkauhYcn0jk2TKIrTmP8NBA7ce/Ui2LgYCkRacoHC3LvFiyzJk7SOlxwUqYNx5JlfDz5vzoBjS67ouy6r55XL6EgwxZsGiSxJtJ9A7rTT2KWQhadBrRs81iZKmkhXkNyIU18EmaQ+01waLe8DXKLkPX38Oc4RMeu1pyqgTD+zqrg6tjPEwvl/y8E34Lwt6y91HRMHlEFOVLwaaeRWr7WwkB6BuRnJzjd494tThljQXZcYyhsi/ykbJEOLy0/3TWSttix1qulbc1BgMRuiJFB8LLPs1Q9YciY6MQkSU7cfJ7tOuSzvZ2UKI0t8BgjJ8jJG7xZP0la2YXlqMXJoAnM8yAPcTm1PrzzCF8Sq6jcJhpyl6TqGucLb8VN+UYvY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(366004)(376002)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(4326008)(8936002)(38100700002)(122000001)(52536014)(8676002)(478600001)(66556008)(66476007)(64756008)(76116006)(66446008)(110136005)(316002)(66946007)(2906002)(5660300002)(71200400001)(26005)(44832011)(6506007)(7696005)(9686003)(53546011)(38070700009)(41300700001)(86362001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TC9dDGrY7CYog+xWs/aYIgiQ+6AgTKcahWGXgfDqwkLyZmwIrhYVSTCoIOsS?=
 =?us-ascii?Q?VH6upUwdPxwGU29K4+jEV0Dpaxu+ArDF+zs+QLrFWpnFAtUxYrP4h7TYbQ1A?=
 =?us-ascii?Q?F6+yV6A2fFL+bFrT4+t0/ufPRjVtsZOzBxMCuCyZ416a7n5IgjutzJhjsUlv?=
 =?us-ascii?Q?gPGkj8XI/Sb5k1X1BeA7s0TWHo9Z5z8wPisl6E8nNpRIAAbijPmbTc2zm6SI?=
 =?us-ascii?Q?+igbv0buu4PJhjqhiS5EDz4pJ5zFalEZz/8OB4kRc6Nrn4i+3sMaEi5/NpO9?=
 =?us-ascii?Q?WIf1LhpIf6ILs3tA5cW8vKZ3/1uTBna3XrYIce6F5B63eWonb44t2wmJeXDp?=
 =?us-ascii?Q?u0Ux4r3+T4s5+utkjohOKB4+Ewor9EAwND1qgkEdYYqse4U7+Z8ZR3+E06U1?=
 =?us-ascii?Q?OA4Xp4IZ1Hq+/W6vg0C/rJz1BRW/5F9cv0lkjsdWxDCKgZCBJo9eam8oEyDm?=
 =?us-ascii?Q?M80hwBI+W1ezzXle62kCzMdobl/OdyJAKgpgzXGH/BibHyQQ8SLmIY0j5Z5O?=
 =?us-ascii?Q?3Acr0gGPMiZ/icyXMq+lzeNNhabD4DglUioOLDJKhDqxZgyHXfqG22jG6yN1?=
 =?us-ascii?Q?pCLLcMd4UIbvrdSNvyN0CpuJdaHpZ5fmdHYgAqDigWeUE8qy4VzrB4WLtJTZ?=
 =?us-ascii?Q?r2fCFHwtqphWtS0sHKkCuHIIu0by2VcwWKS40mg3/QB+b/Gl6MgzSsWuaK9S?=
 =?us-ascii?Q?MRTWpY8438T9debqPzIbWn3Jhvee/2GDXfwbB1VOKJ5YYXwT9uLzhhn4j9+i?=
 =?us-ascii?Q?LNkPKpfezE150NvbZlZDJ+WkP/cWUd3+pPxMQnlmJyVhvvs01as64UTNXnCS?=
 =?us-ascii?Q?f1rkYbiOWR3F5XWEDEKZJrz3ngHr8ZsA5ldUe294bHgznYJWH4WCWWmhnM9j?=
 =?us-ascii?Q?LZbjj78jBkFHC1BEzR7C7EdpJu55DSasUqxMK7W1vi8kff54fcexGtCxH+tt?=
 =?us-ascii?Q?AiXEsoZ/Bpb/oYbHtuWQPkrix89pNkds5e+OnhQVM3zC7eEaiDH0Pe1p0tD1?=
 =?us-ascii?Q?7k+rovmRR3mA3AOFfVher7nPl6L4fEvMRxv7oIcf3LM6LelcMHXo7vtlzVt0?=
 =?us-ascii?Q?GYk8ml3z3r/ojnUD/OlvpC8zq27577JMVr8wbVDjG+iFEIWz46fNrXrxngtZ?=
 =?us-ascii?Q?gq/zGwhSW24LWjANHIFm5Kqsxjsa9sa3TUfevjlrch8emcTwiKmDrW6p5UQa?=
 =?us-ascii?Q?Uw0PrmwQxLaXK/fBlkAXi38CRgcHVUofOmAXHVMmZEPV4iOOqwXsTmlrdzV0?=
 =?us-ascii?Q?Bgrqf8LpocuMMyY2cnXET5d7YZNDCBEx48jTXKFiDty4j1GMAzdgweYnqwef?=
 =?us-ascii?Q?L1UpUYxvRr6GzKwYQ4BUjEef4JRgZCHwRKFzhUZN3tFKZxVSlO1dmGDF33D9?=
 =?us-ascii?Q?8Rim+X9bZiinvsBL/war4JdmM5hHoV0/3D62X7wcNSl1y0t+XeHFUGhNYtOe?=
 =?us-ascii?Q?g5eww+IjQKuJTGd6sfU0RCT7N+3MAgRbSflaRIpOWKNbp292LDX49zxJq12U?=
 =?us-ascii?Q?Wor5iGttihJj/rconFLKd8VAtVhXKGtKaZ78YurfBqL38S+AbP5BJbYJRn3t?=
 =?us-ascii?Q?yCx8twwSEGWRGXDqnzA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2259c8db-9eb6-48fd-c770-08dc266ce644
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2024 17:07:14.0905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cODem0mtWDva7qS/5vjdJp+IsVA8vO63Is8JllkPARmZ70KcBIe1FDHaIWAu+cX3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10823
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Feb 2024 17:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194957

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Joe Slater via lists.openembedded.org
> Sent: den 5 februari 2024 16:33
> To: openembedded-core@lists.openembedded.org
> Cc: joe.slater@windriver.com; randy.macleod@windriver.com
> Subject: [v2][oe-core][PATCH 1/1] eudev: allow for predictable network in=
terface names
>=20
> From: Joe Slater <joe.slater@windriver.com>
>=20
> Do not suppress renaming by eudev if 'pni-names' is
> a distro feature.  The previous behavior was to always
> suppress renaming.
>=20
> eudev is used when sysvinit is the init manager.
>=20
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-core/udev/eudev_3.2.14.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-core/udev/eudev_3.2.14.bb b/meta/recipes-
> core/udev/eudev_3.2.14.bb
> index ddb3c3340f..5c522d0db7 100644
> --- a/meta/recipes-core/udev/eudev_3.2.14.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.14.bb
> @@ -49,9 +49,10 @@ do_install:append() {
>  	install -d ${D}${sysconfdir}/udev/rules.d
>  	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/l=
ocal.rules
>=20
> -	# Use classic network interface naming scheme
> -	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
> -
> +	# Use classic network interface naming scheme if no 'pni-names' distro =
feature
> +	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', 'true', 'fals=
e', d)}; then
> +		touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
> +	fi
>  }
>=20
>  do_install:prepend:class-target () {
> --
> 2.25.1

While I appreciate the effort after my comments, the original patch has=20
already been merged.

//Peter


