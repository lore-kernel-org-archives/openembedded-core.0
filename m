Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB37CA5FFC
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 19:34:46 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28535.1791228884765004419
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 12:34:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=hO7IIZNg;
 spf=pass (domain: est.tech, ip: 40.107.162.1, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JR15R3K4GlNc3KrgyaQgifqC47yen7S228ijZD0U17Z7+yDa8075rIMGtosJXm1Yt+q3MhSVApuHACWYaqIydePgF3UG8RbsxuoeSW738nAH6OC714syxhFT1Y72m38MMZEd+MBedhz8tDYu1TB5OgKbqT2NyAKVW1Rlv11S0eTWot/W0HNtcpnD4d5vrMB9NiWWM/jAu5ZnUJNElRR07THOyspAV9S+TYTrAKl9Oj+BQNyMU20lr97tjyT8VO9cD9OKy3qslllN344+IlLzYWJVpoV2yK7tLEVfrap7prniLjyiovqfaTlero5Mer33hfecE+29S7u0j2utfFMEYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXyc3Ot85F+A5uuMPESm/M8NCVNvAec5LxL4xxiLLzI=;
 b=muMJxCsPvbWVEF1oH0kp1PNvhOhiXberAWaB8a5pahw+2HqPj4oiF6aKfZC4GN4tBbNIbZgU/wjFuUhQL8GIv/moG0JjWtvUoTH9eJXJDpRHzQruprKJq3SdUI6H0oK0ZYGbxCH5/PTb5V9KPSoqs870bN65UlUxGB5S/HUx/hCP1+roQ7fvyL94SO/ChJAPsag+tfw9jvBG74NBdl0HnBcduZN+AjUwyVCi4cS9tacKQ/32jFUuPI+pCfxRyNyDokHvbwWeYeDV/z1TvjMhRPAlEhh/puc63GaltaY7w9NPzRHnDep7vP3c22y9zuXH5bld2wepMzvXxhkbli6agg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXyc3Ot85F+A5uuMPESm/M8NCVNvAec5LxL4xxiLLzI=;
 b=hO7IIZNgGyrsoahqABd8NFSwOZjHK7Wr9/s752bn9BlgTVKmtHwNjsE52ZkpnR59Wk+6IkND9cgPmucFelCmt3GNQH5da4JVJLrFqguA1CUElwAov2l+kvTjN1DvxbmxkqJ1mRE2OnVvc5tZF7nLYShVSNm6N29gAD935DBXq3cJO2kScslQrQ6/ZiNXABvqKoDdX0N8l4HujNlnQiiYtk4mDLk2huHTyHhPDuv/AO3yJGlJ9XoLe2xsPUDUDxIoq5AHfqjjB1LG3dxwCJiczBuMIDlmF8RWkLC1uxWsDilOVJnZFi/rtmitknR+7kjrUw5ElBDKkhPfzAOdKvIMKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS8P189MB2096.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:52d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 19:34:39 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 19:34:39 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: volunteer to maintain a package
Date: Mon,  5 Oct 2026 21:34:36 +0200
Message-ID: <20261005193436.31706-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0062.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::13) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS8P189MB2096:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ada34d-7cec-4e90-09e1-08df2317b23f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Lk5jfXbTOhGl7l7KOwv1IuzMcvPqrpzX3AoXImQyY6k3VUufaQGBprjVFCIioyl6Urry05h45dyxOpk/D6/83e/HQocMIUBRWEIHK58huFuWJVIAbxqNev64ApR5wEQNP1btAS09vMXvYFi2Mtmz7YE4EcbAqfk2ZRMjgEjzRYJCbPlJQK5rY9qru4et8/IHzXHehhiWb1Rd/B+Jq3lyEi7jys9JZiYUzZ93F/e3HzHRpOQ2GCoONAgDuaPYdavP6ODBSNVgG4BaVSQNV9fxk/qV5H6F/5Wm0j9k4xAkkIZxDoOfuFi1DufD5/xzZZizyljr59ptBsAy6+fNju9YGmR4S4SXR81flGgfLne8M1UaAseWl4uO8Wtm1/dA1He3nsYZaBNztPoTsOw5l6FnvVYE3N+vNaxLANdognczaPZsWnccFYubNL4C70EIX5d8knRqqdcE85I+HWxXiq9m6W+4EYg/0UkC11KujusBAWfUEzSJzEHfklIWjnpSSqc8S3iAF7NWi74Bu8n81xWV5CUX6bxz2vtnOoFrlNTFBS2lRd8F7kE0RdgnPRbsmlnFrx9OivLJJ4GWIE3Gr6SpdUkQ3iksi16hST1cgURzXhiXRxuuGfsEhczFXfMVy4iOlPToa+gq9KXNvQ+S/dJfosv6WzUGssKUK3RyM1/XhSo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3v711pFkO7mhcLPV/4JxLz4Yn6rO2qWFrsU9BBZBuKhV55MStb9P5hFQt1Tf?=
 =?us-ascii?Q?pkiiPm6Rs5yDoRPWOCWKi5P/2Czuj6lwFtosEYhcfJL2tUX+QtcPW6b76qyX?=
 =?us-ascii?Q?bIcVLKLQTZkM3uTtGw5WwoGGpvwCDFWJdhdsh/uCp5HeXguRvOEb8e0IQnrh?=
 =?us-ascii?Q?100KkqUHntzoopqkp3/wY4Rmn1NUSXpsB0PrD6uznRZvirIUyaUr/3Vq992q?=
 =?us-ascii?Q?C7ggQlwWjFWOVLn1bNLKPmWt+O5ozJtJXX/GVS9WKIUGTrK16U0vXYmFQUal?=
 =?us-ascii?Q?beeZirm75XJcrxrjgEiN5uCfTgsMl4YQlEcnovVqa7eSV1l7L2lh7qpFD1aD?=
 =?us-ascii?Q?cRlb3ya92/AM7cT6NHBbdjo06C/TZc3o8LLNyZic84vXzM991VHb3WiJXD6m?=
 =?us-ascii?Q?Rc+1Ej0BCVSrRhF1kzY+M1z8UMCsoj4/aOaecCpmx6qGbPNlqC9qMGZstiZX?=
 =?us-ascii?Q?p8ZnttjT+Va6c4emeiEiH4S3ew+/F8KmZhscSv3w2U8y66XAg5Or7biryJXR?=
 =?us-ascii?Q?VMccjgdcxERxtWCBUlMr0i6uINBovw6sLS7QB1vIqmoGJLBTm8l3ziasr7zN?=
 =?us-ascii?Q?3aznsTf5TtMmwe8F0VrKfJK3JIrrn0JTxFDL6GfuEcJPu7N4elUroRYVgXNl?=
 =?us-ascii?Q?NNyrVjRnphmYlZ076ulveosPUaB1Q4QusFnHFpobjJTveR+RBk9RYQt5aS9J?=
 =?us-ascii?Q?g7O+VnlC0L0xxS7Q9LvqiCrPyP6gP4WUPgWDrBKgsDwuAhfG2dYLkrp+gDK4?=
 =?us-ascii?Q?h46R1QRoUKiwuhEz61ZJxoro51fy2FOaOJdsxTdylesCt4zZJmw7sMz5fJrP?=
 =?us-ascii?Q?Q6uaUE3ORa7Ictt+sxtItrJBPabWAVUU5XNFpmwxHmO0ggm0j9p1YfSdIUZw?=
 =?us-ascii?Q?ygRpScLOwQyGTrUuEtPkCAbR4wdKG/oyFROF0fa+pmSeJeYbHO9a+0mTrxXc?=
 =?us-ascii?Q?9ceEzo0NY9ZDhxGvAar5zS7iLS1RwrB9sh03ntXDoLEg+etLuCCBMvsxqAol?=
 =?us-ascii?Q?tRzz5oGUjQmvRmaQ+0hEfTuhlJGJsO1NhO+rvVk8iBCk6njMWgmhzOpadjoD?=
 =?us-ascii?Q?4NZztg8utusxT5y4xeU8cSSbMpWt+DZBIOCrmtjRRj9eKtcekqpz2eCPSXH7?=
 =?us-ascii?Q?QWAm4u+ysHzCxXJk9Tmxkg1+H/exN3MCOoYnRHOSpoCVaufazGUZUU9Qa0Xs?=
 =?us-ascii?Q?AzPFa3wO3divlVWdwjVWYcsDE7P7qkXVML55JGmeNlVbFoYneJDgB0ps//Gh?=
 =?us-ascii?Q?2Wp4wgqLZPZKAMbT2wlJNfx8btbbv0XfHuwTS4iS5JtZM8zm/MvczKnsDYZ7?=
 =?us-ascii?Q?lN8667uF+QJGC81OXhnATo/HQWDLQxfCscYQ6RdfBRKOW+tmAOR2phokbFmP?=
 =?us-ascii?Q?gy1DnNlF2/qiaBtTixyv3KXseRpzPjom1SUpNFd+bxuxPo6SOkafJZKraToa?=
 =?us-ascii?Q?MtavbvOPx4eM5+LX+k7opMrDCU64H9IDURkaxGftQboNCjv2gdKgDzCz0BMC?=
 =?us-ascii?Q?k8Joq7hJsS2ZsSZZsMouGyIbSQ6UmsMsN4FVfv1SEWMpjBlc/TQFQRKEl/KI?=
 =?us-ascii?Q?jKMgxAgflpahQdQZk4MHZ4LLOWg6LB8YMS67YAEYtDA25IFgA3RmSYjyTll2?=
 =?us-ascii?Q?HR7mJNbeXSHO/v8M1E6cTjJBa0k7+vxfbUIK8HHn8IkHBoMT7+PVskio3quY?=
 =?us-ascii?Q?u5dxFf+hLel5fgDMCtpEGE/cKi5nJtuNqIfnowlGZrJnYoELapjpSmUo1T+S?=
 =?us-ascii?Q?iv3WOHlOzKpxwVHpxJdz0epFUFWBV7w=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ada34d-7cec-4e90-09e1-08df2317b23f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 19:34:39.2516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dPvUW1tFcubghGByMWK8SDsHfYlYNrVBMzJ4kKfjaI0jVMAG4ZplKgBeogV1Tb9cLPtK4SUI61UPYoNgu4n3ZxOI7oDOqytMfN5dqSAKmC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 19:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247258

- volunteer to maintain ethtool package

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index d601dcb074..d3dbc7b508 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -175,7 +175,7 @@ RECIPE_MAINTAINER:pn-enchant2 =3D "Unassigned <unassign=
ed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-encodings =3D "Unassigned <unassigned@yoctoproject.or=
g>"
 RECIPE_MAINTAINER:pn-epiphany =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-erofs-utils =3D "Unassigned <unassigned@yoctoproject.=
org>"
-RECIPE_MAINTAINER:pn-ethtool =3D "Unassigned <unassigned@yoctoproject.org>=
"
+RECIPE_MAINTAINER:pn-ethtool =3D "Jaipaul Cheernam <jaipaul.cheernam@est.t=
ech>"
 RECIPE_MAINTAINER:pn-eudev =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-expat =3D "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-expect =3D "Unassigned <unassigned@yoctoproject.org>"

