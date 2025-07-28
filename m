Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70FFC87FC9
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 10:31:26 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.2])
 by mx.groups.io with SMTP id smtpd.web11.78448.1753698674487121314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jul 2025 03:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kF3+U2Tn;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kF3+U2Tn;
 spf=pass (domain: arm.com, ip: 52.101.72.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BCMv8XciwDsJL/Og4Xv3SbQzg+bs2DwWKDBXQoDCHYHmP7AXekkqftBzfzntmlGD3QgLmP18ugigwRAm2W+tYsk4yL30Tola8DEfT4DLlzN3eY3j3L4QBOQbcFR2h0cjYizu9rAWHbYc4apZa0QZQtVcVQ4hkO81+jRYLXWvFN9P3euOJzI3sEXKQVVT3pi6Ju9wy2rmEv9lCaMB9E7U5rUCKw4rD1iVlmR36pM8cOWxwsq29gBzGL44Z86rtzQe+qrAM2SQSmaLhbWYqKAkcRTUSESYcolbqPu3UAl4V7IV84TSye9JSgkW5lAOvsjWWyDTi3YTE237jYs7g2A/xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPNzy7x2PB7TxwvwlWj9odDOZ3fWSfuflwhBzPNxDeM=;
 b=EbIBhCtMl1YoOiW+e48fq/M3aPGRy6jK47PLHBYkyAVc/hV38NzPtvdykojhM9fLZWu7qfrSu45uFh8gJxAS9sk6mC3WUbOUwFWwFxwo+nDavgYb3xk9wrv+QIOOMkDfk08tR5B8gEnHBcHVm9VBS+dcF0DCJHc3gA+StkKpuIA3rYZfFGfyjk8dhLtdC2+3eibBMuW4LtYsFGNxzlUce4zEAQhj6UBYTXhqVhwdV9wTXBvjCU9smBQP5vw4gjSUrnawYmdMjZNdRT6rZpeGK/T2kv/W5MqUrvM4ZqgvvpaW41YGs6nO+zLWXxcg56WbSQCMjFMqHs3IJyH+OOT9FQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPNzy7x2PB7TxwvwlWj9odDOZ3fWSfuflwhBzPNxDeM=;
 b=kF3+U2Tn2MVxzqc0I6s7UZoT/KFTYJ6TwvPLDbeC9v27ouuvE57HjJqY9p0lNz9jn7xnRYlt6bAt0FGwrBRM7Ycx/3NtflxeU2FLTZLP6E+7XllfERYduGQGxSGJDtdYrQKj5X8W9T7MdzJ5VV4X4TSh3DvqLEzXgFwK7OBFfc0=
Received: from AS4P190CA0045.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d1::16)
 by GV1PR08MB10907.eurprd08.prod.outlook.com (2603:10a6:150:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:31:10 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d1:cafe::51) by AS4P190CA0045.outlook.office365.com
 (2603:10a6:20b:5d1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.26 via Frontend Transport; Mon,
 28 Jul 2025 10:31:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.10
 via Frontend Transport; Mon, 28 Jul 2025 10:31:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKWvCsGDSK34fe1Zv4e3IDhPgBRWa39ETAEvwb18XjdMmOU+6Tu/9pjltFi/pyRww0AolcI1YvHAKLbnXowXrshL+bNMCEm0W/PXd8+VhCO1l7RKl+SMdbFh3QK8Aslxz1lgmzMYaiP35V6E+pbhP+BdVDVkqD0wxhCePzt7/lNwkIUgDiQ8/8QdWi0X9rHe6rkfKgAr8to/bv1RIYb0t+47t1s5FNj9cLYlGUe0Ehr96z7ble9CoWsqfOgrj2lwokTQLTbEwoIFoV/+yTmQWy56tzz+cEEBycDtxMF5yEJbjq6xyN8syjx9gWeRbMpZUqZHH+AeEL7zFD0pHjQedQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPNzy7x2PB7TxwvwlWj9odDOZ3fWSfuflwhBzPNxDeM=;
 b=uXLQtDVjwNmCQp+J9JeurKge/x0KVwBT0xdAicL+qN7nkQApXR4bacJEwLuPeL1bTZNerUcwsvIH3H1uLIg6L6alaD4t4LHH6C8wofBOo7FEhRkiLeQvjRPI26klTr8JcnSPe6dhCdG79GVbbtQqX3PwjuJ8GmfnboPUF56s3abPYu+urilqQR5hbuiD7NQdgdk1n35bgpwcKeAkLXmiOVlfk3r3qj5ysKtGUosKbRCsgVjC77bJSYEIxgRG2LoT8Jok9CaTptxQ/yhLI5LlU+N5B4y7v6ikMfm1IwRsODodQEqIBwN9cYvbRaQ66C2Fk1R0EpTe/XUZUsXi/0gS2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPNzy7x2PB7TxwvwlWj9odDOZ3fWSfuflwhBzPNxDeM=;
 b=kF3+U2Tn2MVxzqc0I6s7UZoT/KFTYJ6TwvPLDbeC9v27ouuvE57HjJqY9p0lNz9jn7xnRYlt6bAt0FGwrBRM7Ycx/3NtflxeU2FLTZLP6E+7XllfERYduGQGxSGJDtdYrQKj5X8W9T7MdzJ5VV4X4TSh3DvqLEzXgFwK7OBFfc0=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by DU0PR08MB8163.eurprd08.prod.outlook.com (2603:10a6:10:3ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 10:30:36 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 10:30:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] lldb: don't build rpaths into binaries
Thread-Topic: [OE-core] [PATCH 2/2] lldb: don't build rpaths into binaries
Thread-Index: AQHb+8zal/yR6f65UUipTA22NDWagrRAFIAAgAdJKQA=
Date: Mon, 28 Jul 2025 10:30:36 +0000
Message-ID: <C43B5F16-3FC9-4235-8A79-1D126747D057@arm.com>
References: <20250723122448.2250339-1-ross.burton@arm.com>
 <20250723122448.2250339-2-ross.burton@arm.com>
 <CAMKF1soq09as9t9AMeF2Q8My4Zv=op-VxqFS6_fhek8b93neSw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soq09as9t9AMeF2Q8My4Zv=op-VxqFS6_fhek8b93neSw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|DU0PR08MB8163:EE_|AMS0EPF00000196:EE_|GV1PR08MB10907:EE_
X-MS-Office365-Filtering-Correlation-Id: 54355815-bdeb-434a-9805-08ddcdc1de95
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?AwgZp1VxHY0PnOACJuIRDhYBrhG4U4J3AXpWdo67TXR1VeK+1i6sp94aRcKo?=
 =?us-ascii?Q?8omyqY+Ih1vwgixNGhgCM4846qy8tPfz4K5i0RjK7ukxbsC/fZ7AGmueMEDo?=
 =?us-ascii?Q?vPdnsaATGQQMHRjTic+s3C4fD3ichwD8P2ba4o9J5EJIP+STOfiVNcvtbijI?=
 =?us-ascii?Q?BZ+UZi+nVZxSIyDBaHlT9p/cAElk1Ezf1PwMx4CpVD9NrbOyaGRdIXxvSERq?=
 =?us-ascii?Q?Njzv+S/oTogWWHPO19rAIqA8oGtBkfjIRbpYzD+6YXW2Muw3asKiLcZSroQJ?=
 =?us-ascii?Q?GgkpIhVWCKitG98xNsKQ6hB+xED78I+IYOvpgtvpMJLHgHgzUwiBQnmOYlqV?=
 =?us-ascii?Q?4KjthmkFf5jPPlsskrMDEA2/SWZ0ErXjJLVvU3yPpVdrBVG/TFWwKA4T8k02?=
 =?us-ascii?Q?MMP9t0qgYR7IE6jZs1SMQO82vhjpihg0680yBSnrnTKvinVC69rBYE6QiqBQ?=
 =?us-ascii?Q?Zs4nJiK24HIf4iUbfUATVKtopADBWwLue0mlf60uYDxQtEqd8tyNX6OS/1bR?=
 =?us-ascii?Q?guqRVDRSaxAYZYVyEnaGgf2esWSdeCw1jHsd2dND/J3aKPnB6cBNQTlD3SY7?=
 =?us-ascii?Q?sjncyisRdf1vPIs8KOKaonnKvuh1FZqQZCzz6Wb13tW7AVykkO0qxe4FrWj3?=
 =?us-ascii?Q?+tMqdRApguZz2bRRFGIfSalYgppRVLLgHaJTHRvWzbieuXZZU+17ft/zywEx?=
 =?us-ascii?Q?XLliqD5HNXsNtxgwUHZrMZrF0aNf/kgqt8U8TOd08YW0hfuP0IokV6TTV8cg?=
 =?us-ascii?Q?hwquO1iJn0aPQlNuMxJlPeW/0kcYmsguda7kadl/sS1x6NpGWOYrG/yWOBrl?=
 =?us-ascii?Q?o5ujWii7z3FocMT6pMR7barwXT5+dS+2snJlQsRTWw3WrmVbOaAO4Z+Uz+8f?=
 =?us-ascii?Q?WIzZDvzDBn9PhOcAquGJ9wihBLMA0Laa/j6KuV/4IblNk4TEOjQsjyv1G3Ku?=
 =?us-ascii?Q?ne3C0/rIPBrj6U0V4NEVU5VkF+juiLCJFTzgt9tRJn4ZJ80T3UCHmUKHIy2K?=
 =?us-ascii?Q?yC8gmbrT+j2WPU5/NDKLlHmfoC0Liuyuq73bfrVz9GKnYCaxJnGoI/FKevtJ?=
 =?us-ascii?Q?xjSPvDkLNWB4UxSoTE1moOduDpxVUbnn70nQ+p0+5GRGMSc+RWVUFrNvDvZV?=
 =?us-ascii?Q?gcNpxoXSX2/qwUAEB/fBENy4i1Ys7re31ValoETzmZxqN2iWlvNamzNlO+EJ?=
 =?us-ascii?Q?rpbvzwdKH9MXfcrTuLXS2dRLzDirmsvghtepB7E2xrEH1Hdro8gAaxjdW7BN?=
 =?us-ascii?Q?O+n6R7lAs/Qy1k7CujSfhr/kUXMCa1ht7dOm249bLD9riEVOxpw7IdAwt7eJ?=
 =?us-ascii?Q?DW68e0qSULVjhLrNM/cYxOjRVZLQSGg/7OmtZhEsGyzbFke7o9uKx8gezkGk?=
 =?us-ascii?Q?5cddVPw9pUOgbvw3zRDIruwiS2iW/+YReaCDwmrDrTJTx+LGURgQb30D5sLm?=
 =?us-ascii?Q?sgYJ+D/+eFVfWwg9EpxXzFXYSBh6ctwy7aIjVMM0/m8Iz5i0xZ4jaQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <33959A9D236577409C61E511F32B8D4E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8163
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b9cb7837-3626-4037-7557-08ddcdc1ca75
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|82310400026|376014|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yY6fjt4akN3W7SdpNbKIr4svCWOIbHG9x5qkZxJ4VrTtootQObCBnnMohkso?=
 =?us-ascii?Q?W+Zy8YCftwEnZ0dTtlcumXH/YWNxhnDB2ZdFnmCcXXozAwYlxwe9dbCg5KcY?=
 =?us-ascii?Q?SchnwHI3HmStO5MZ27ORED4hR9rZ7q2Ui8Gg6+gSkaiJDLmUD5+CBOM8eYO6?=
 =?us-ascii?Q?KUVbmkEa3pHe6fCUlIi3jcPFpKVJFlfhoXIeNXA765rgbME5siQ+veFNZcJu?=
 =?us-ascii?Q?jl7ZQQd3KRTzUgp1Db2bGIhhDt8s4eiDh9mYUjnk146isa4FiHYXuX0zmeZM?=
 =?us-ascii?Q?tcI1SWKNC1EixIrshF/XwJvuWtDYHKla/om8bdx6bO0hYJYLFkR+6N5aoC3O?=
 =?us-ascii?Q?et2PF7leASSf0Wofj3HQ1J1lySmC2jdA3g7frrl7g9G5qJvdZbwcgdJ5rvHY?=
 =?us-ascii?Q?hzv7+GSnt4cr6TFw2atHMi5zEUrZgTkKApmrMwY7bCPOiw01/8Lalea4g6nQ?=
 =?us-ascii?Q?ZDx3cAJahdD6/Bmhgbl9LAkM35KUrc0i25ordtk8aJM69lfNCn19SD3F1F4s?=
 =?us-ascii?Q?eGmfwnyjU91BenBsV2PK6BxvYUTe1+hrSIHnsv9oT5/mbq+xe3VwQdqtvRD/?=
 =?us-ascii?Q?nKRyaSybAKa2WSq+4r3UcUT1rRRYzrnQjyxpfqSqrOdhY5BgSiW38ke2Pbab?=
 =?us-ascii?Q?h+RkV+a4eGnIX+iC1T6/Z+jnFd0RwgwHSwg6dsSy26G2G3zSZwHM+xvXCK0z?=
 =?us-ascii?Q?Nn81XmQ6C7nATMPl6ctgZHettyd92n+5el3t/tNbpkkQ/e3eUv3L2zqlWleh?=
 =?us-ascii?Q?VQZk14MnFfMNkZUYkljZbSlA7iYlDTDsUQwoSZh6Xlmjr3/f0VvaJ/HvZb1V?=
 =?us-ascii?Q?/R4GSZKP091q1U4zH2bCA62rTHCHhxuwEVakg0aHVGTcGewUNjyT+BOLbrz9?=
 =?us-ascii?Q?TdABARiOqofBLel4rLr1tcMX+KHJ8md94+kkODFVTtKXYqolu9gCajMe6x9t?=
 =?us-ascii?Q?ky+XwIRxOBeFKSOlmGUfYDDNPjxuTDiX00QxUV2n9Dub0J5B+WqUq+J5wASO?=
 =?us-ascii?Q?hWkMNwckgCfvZaDTbfnaweEVnd7x1JMKoXr+CHk4qQSRCEq4sLbddl/GKnDI?=
 =?us-ascii?Q?gIxILy0DE4BH69xqPhVklh7WpubAgSuXIrwZLYVLrDFIaZAJHqnhaKf/Pj/L?=
 =?us-ascii?Q?Wku3dB6UDbgWINzhOPTwBDsJtVJ7flqf/tpH0cOe9s+Dqo7c/shJ4B9STpyI?=
 =?us-ascii?Q?9DgFQ0sbqdM11e9MOHOnAkdJ28enCdGL82TOsR3n38enx8SniJaZ9zCM02VR?=
 =?us-ascii?Q?NQNCAUc104sfh21b9Ot0/M/2TIce5X+Ycn9G6Yd2RUB4JeQqIUUpyVuO1GN+?=
 =?us-ascii?Q?WIpUkSE0iQzyjLOIiJsy3oV+64vl+Y6ToGsi01WZul5MHzX0BcNiFpyNw70W?=
 =?us-ascii?Q?8fYDkClj4lNQkogWv4zaZdNoDadMJD3LXFzwZXXabd7hfasnjBGGDod7HdXb?=
 =?us-ascii?Q?0WRfO5lHwsS1afmTmBuyrrpPo4sf2GBtnFK/1FxXeksVFHYH31gg6H4gNBrF?=
 =?us-ascii?Q?pumlAhRcDv9XBz/hnW9uN0RgVStta33pHv8V?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(82310400026)(376014)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 10:31:10.2744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54355815-bdeb-434a-9805-08ddcdc1de95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10907
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 10:31:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221000

On 23 Jul 2025, at 20:14, Khem Raj <raj.khem@gmail.com> wrote:
>> diff --git a/meta/recipes-devtools/clang/lldb_git.bb b/meta/recipes-devt=
ools/clang/lldb_git.bb
>> index 4eec175ff0e..eafc3cb3128 100644
>> --- a/meta/recipes-devtools/clang/lldb_git.bb
>> +++ b/meta/recipes-devtools/clang/lldb_git.bb
>> @@ -24,6 +24,7 @@ EXTRA_OECMAKE =3D "-DLLDB_INCLUDE_TESTS=3DOFF \
>>                  -DLLVM_DIR=3D${STAGING_LIBDIR}/cmake/llvm/ \
>>                  -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tblgen =
\
>>                  -DLLDB_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/lldb-tbl=
gen \
>> +                 -DLLDB_NO_INSTALL_DEFAULT_RPATH=3DON \
>> "
>=20
> I wonder if using BUILD_WITH_INSTALL_RPATH=3DOFF might make a good choice=
 here
> we do not run lldb from the build tree anyway

The lldb cmake files use explicit RPATH flags so this might not help.

Ross=

