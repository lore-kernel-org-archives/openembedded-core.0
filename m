Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BAFFC54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 11:26:19 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.58])
 by mx.groups.io with SMTP id smtpd.web12.3568.1663068376181765656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 04:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com
 header.s=selector1 header.b=WhxbtQVl;
 spf=pass (domain: vaisala.com, ip: 40.107.1.58,
 mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiEH7XoNyzpOFChSes8Tyff8Y3Jl/VKGW20FlvB7Bz4dj/ZDHuEL+wTUVywkvPXJq6wkGWMelYd+Rjw6DaLR9+L7MB+6MpfbkdQfjgquoTv4+OgbHOGJua4Uzt4JFQ/7OdmDqsjBS4Gt34DXP7RxYuSfs9KjhNY/6nRYlbWI/4JfCG2aNAzs5GcjJPH+HclOw0lVafIrdl6rfA++3heLgbUu6x2c8uegSpLfvSMdQY2pwUWN4WMDX4vv5XLaoOhLnbfzjSZZluIt3gM0DT7/J/UB9RS+6m6PB1qVvvOM6sXGm2kUjBW3hB65ytXVSaZkvQpsTpvAS0f3Xae2v/RTrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qSNWpP1gmf0XNlPqzj6Lu+FkDeJAFCU7/K5fAu74J4=;
 b=f9qqNIlwqIe3rFo/Ln0KS9C5WGw3hZHbwEaPUpsbKoI77SSap9KQAcjGdH8+dDwaUokhzuvHe9hwcrgdVMgZFlzw6Rmg4FVzOdZpzz9jZ1qBW1yBDdSVDqHiBvncCYiwyd/YPXI6AjrjbsqCuxPD2GZeEVgrdIptZ9VYZjsl0Z1f57oovwt0c8g3J6VFfK2V0MA05Itkrye5V7Ez87jAW6GA97jvnoRM6v5qUJwspDClEyq7VxxJ4bXsdoEDcoTCnfDA2/x2B++u2vPVBgRMfgv2EQ24euk25IJxhEOhnC9COqdIYbHh74H6uaDmG3nVeOSYFhPutJhtzi3pQQ+p+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qSNWpP1gmf0XNlPqzj6Lu+FkDeJAFCU7/K5fAu74J4=;
 b=WhxbtQVlAISj3dY0c7uR/OLgIfmsMuZtav8X30xLFEuDv3AU80RmM8bEt+coU1W9GhBpkT+T2hEFt4U0sGL7d4wkxP3HjZVgqtEEUY3RonEvch3s6R60EuwlUKYIP5xDSKmLsYB6dDaqPrsIIvtbbmvXWwOthfXCYyIrW0JB32v44C0PC1P8ywZntAaC72TiNdzyOFb9s8E0v/ZW9o2S0PfUApo0OEdyQQz6ZA2AYAAq/BOZlo9+MgOJkxZs5vDFF1qb/2HARFwJn5z4HJpswf74T3vlkdnCa46+38SmeWmewZJC2azs69P2KEkoiNz1g0lFm2rRwWk1vFMSH/3AIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by PA4PR06MB7279.eurprd06.prod.outlook.com (2603:10a6:102:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Tue, 13 Sep
 2022 11:26:14 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::28bb:5222:3452:fafa]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::28bb:5222:3452:fafa%6]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 11:26:14 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	"niko.mauno@vaisala.com" <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 2/2] systemd: Add 'no-dns-fallback' PACKAGECONFIG
 option
Date: Tue, 13 Sep 2022 11:25:49 +0000
Message-ID: <20220913112549.1458008-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913112549.1458008-1-niko.mauno@vaisala.com>
References: <20220913112549.1458008-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0014.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::29) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|PA4PR06MB7279:EE_
X-MS-Office365-Filtering-Correlation-Id: 3039af10-f629-4029-66c7-08da957ac451
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ttZhyQG1BXdssV449bfrS1zoCTh/tOCAcpD+saWx9ggta8HiIggn16mCsH46Q74UaubDIh085Sqo4uRRwW51nsMCivYy0iA4VlYYuulM4+BALrnwNqpyu0hU82vwXhMCoHLyapf+EWWFIwSd+4NLR0xpW4s/fRpnn4UTp4eOC8VQwAiqJdyxrsoEBG9W2VhlNsOZjB2aQxeg95iwP5mOjR2+nDezh9pE8I5X3pRiDgBWKLZ5ipMc7uILt1RHudcO4xOovWQ1sFEpmWck8NtFew61OTnJFEk0rLmMGEUrX6JHlBJdbiriPjdTUzVDzvc204UREJ7nfzDgG3c16h83xhghU4cQ5SBJ1ZBCinFMCsopIvmgpoDMqTjihZmqozt3odlnX3p1WfDeaSP4TMwlJVuBBq0HJbpfrUC3b4+C5wlS5jUsjSUrJfFy3WGHKntGnNoVR+pKsPLZFW2FGq1GIsJFNeDlau4G8iMZsSwZPl7L9EfOk5lGESQTefjYN0/edTDnAsS74/D5wO7K070FYN16ZHmGwZbfVUR8EGE2c23zXNQ45So+Xbmqnw8/kCkDsWmB6luQ8suGHFqKIRUHhtKoVtUzHslEj6Tdex2BRZxUeLnUPdWwKzscx8h6BKwGYyS27qJJRp9+H1vnNefM5g+1HMElmOXGe2Y5yaJtY21OUK2km8Dqz3u3ljJAeLsvmYiN6GdIXCO88aNEbfcH4vXaJ4btqw8BG26R+MblMpeqMooGsqkPsjSNmFiop+zpUTA9upMQmzQ/nPsrshSS/oRdcRvjIgvZBJI7TXlTeVo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39850400004)(396003)(136003)(366004)(451199015)(478600001)(66946007)(41300700001)(4326008)(26005)(966005)(36756003)(86362001)(2906002)(186003)(6512007)(6666004)(66476007)(2616005)(6506007)(8676002)(6486002)(6916009)(316002)(54906003)(44832011)(66556008)(8936002)(1076003)(52116002)(38100700002)(38350700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RYS0MrJX2ChLXFBpO9+l+2KzkHdccO99kCkUSE3HQza+uazVwBxeBQoNH/ns?=
 =?us-ascii?Q?keH2Myr/vcM6fP3HHjvzkmN61LMyVBEfL4voDU2IaoRzRW2NlPrwuzRe3vyY?=
 =?us-ascii?Q?PAGuKZWA8EZ7HeNUiZcOSJLQI/ECcJBYB4t8nhComgBuQR70YksvZfHmbhtR?=
 =?us-ascii?Q?j5bfSRqDv3uh77LMpGYdHHWYjg2RhSIVIKA43JRs6PwA3BXalTBz/KBnbnIb?=
 =?us-ascii?Q?yFcCJFZhCwcuafEP8ByzbIa7zs7NdUW/1mW0FFZz4OxUvHetcaRZyRaBvMtH?=
 =?us-ascii?Q?ltkJPt6hzXdOYmULRU33vSvAXo8o+XA8KhOXSlWg+6wXq+l9i9jSqy4IAgD6?=
 =?us-ascii?Q?d32ebT6JdFUKHcZttkQFiGDcoe7M9rcBzDsIxTlj84DKtvk2VqWVp3Xe9MDY?=
 =?us-ascii?Q?C4ZiU1rXT3zj6ABuq9WUVFHpuUx/YxjsldoazCVMTkV+E9A9dDNRUcwFOka5?=
 =?us-ascii?Q?FTZiq5F3Gqmv7nT60Pl8oEYPrcClNkx9ecn3JZz7/Ck9wyZd5kKQJV2GeMve?=
 =?us-ascii?Q?5YGrXsv6fQIYzeu8bl71ILu9cDSK9oto2F8HtUNc05/Tpf2XRZyUTdzZsZq7?=
 =?us-ascii?Q?VdKLl9wNjwYJqHPiFoPrKXTv6zGicDZX83jcmClLzbs56WdkyE+g+PhPbf4z?=
 =?us-ascii?Q?iQcWh/fU0KzAOLCBImwn0jvMW9BhIYFbe8YBs//Nh3uyScZco7zte8Ee47Wa?=
 =?us-ascii?Q?lXJG3uh+N/Sy4QZXu1oXuE39ao8R7uNGhsOn0Xl7coWB5FVYb84d81HvKefA?=
 =?us-ascii?Q?k4uiCMx/RgqpMaOd+EHSj1GIzvsJZFxUztyeCLsjuZKigOpAKUjQVEtNxkcX?=
 =?us-ascii?Q?VtTKbG/f1FIkE0cxOB6F834s1KP0YenbKp+fsZt0/mhHDiE2sY/4LFnpGgLO?=
 =?us-ascii?Q?QgL+zH9iwfAPuyqsWPJ55Oililqr7POXIpYoFeRbe+Wh1iFKVnKJfC6AWLV7?=
 =?us-ascii?Q?ORECugkjIvBxSrZQDkk9Fe5Xo68o/aaB0nBTBHhCgSaVVQkqTutwtyULXe5U?=
 =?us-ascii?Q?AadOUs0ukPQcWfn4ZQxGLK3mnpAmOl4g/S7MWCb+tC5zv8/8bvBSL3R+RnDV?=
 =?us-ascii?Q?VCZkddGpFfaxgj0nagvN2fYFJo/PqWXFuTxP0WKY496UoqQKN+YzrunmrhyI?=
 =?us-ascii?Q?s1jA9le9RRxF2VvpJXzRpev/PVx8UbzoBAT97tb/F42Srcu3cILZx9QDGtnh?=
 =?us-ascii?Q?osUs9CbeuCYXfhSafNolV5CdqNTDBY4dFJGloOBdp21A5kF8CZp4XDlRBk/L?=
 =?us-ascii?Q?47hpTWwEaWY3EeFcTYgyGkyb+q5ny2XDioOCWzlLtOEFz3YWTXxidgRQLfU/?=
 =?us-ascii?Q?INgo+/itbKB8AeJo1nujqFnpYCtU+wwzENmiFSLB8VPuCf6rJtT1cIdWPvcT?=
 =?us-ascii?Q?baG3P7id/kY1HuYRcTQ49nF+hlwl6Sb1CQY3hTsczlss40JdbYhowpKr2w7B?=
 =?us-ascii?Q?32wCEDlvlK7ufNZWZHDokAT5SQtdR/OnperRO+fr5m5ZK14HxOAzV0/vIG1p?=
 =?us-ascii?Q?MLx/6HJrFcgAJ0mvoHZy/I/ATUVXR8X3N4iq1QkB0EIBTHMgG0Sj4U5zxIHQ?=
 =?us-ascii?Q?e+6am1aQWQmIMJzc6poKrw3+37l3ubL+wl4JlyeMTJcxX27zy574Et+UBNy2?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3039af10-f629-4029-66c7-08da957ac451
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 11:26:13.9657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Z+dGphKH3yv5xtFZRXnVB/rCcFURDdN083u8vyVbXrYIrKn8I4sKcFyG+NZ4WwcizeCoXHxmTcWhYuNkIa6/MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7279
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 11:26:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170571

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

systemd defines a default set of fallback DNS servers in
https://github.com/systemd/systemd/blob/v251/meson_options.txt#L328-L330

By adding a PACKAGECONFIG knob providing a convenient way to opt out,
and then adding that value to systemd's PACKAGECONFIG, the output from
runtime 'resolvectl status' command no longer contains the following
line:

  Fallback DNS Servers: 1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google 1.0.0=
.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudflare-dn=
s.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare-dns.c=
om 2001:4860:4860::8844#dns.google

(From OE-Core rev: 2b300d6b9ec6288a99d9dacb24a86949caf99e55)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/systemd/systemd_244.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core=
/systemd/systemd_244.5.bb
index a648272bc0..f3e5395465 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -162,6 +162,7 @@ PACKAGECONFIG[manpages] =3D "-Dman=3Dtrue,-Dman=3Dfalse=
,libxslt-native xmlto-native do
 PACKAGECONFIG[microhttpd] =3D "-Dmicrohttpd=3Dtrue,-Dmicrohttpd=3Dfalse,li=
bmicrohttpd"
 PACKAGECONFIG[myhostname] =3D "-Dnss-myhostname=3Dtrue,-Dnss-myhostname=3D=
false,,libnss-myhostname"
 PACKAGECONFIG[networkd] =3D "-Dnetworkd=3Dtrue,-Dnetworkd=3Dfalse"
+PACKAGECONFIG[no-dns-fallback] =3D "-Ddns-servers=3D"
 PACKAGECONFIG[nss] =3D "-Dnss-systemd=3Dtrue,-Dnss-systemd=3Dfalse"
 PACKAGECONFIG[nss-mymachines] =3D "-Dnss-mymachines=3Dtrue,-Dnss-mymachine=
s=3Dfalse"
 PACKAGECONFIG[nss-resolve] =3D "-Dnss-resolve=3Dtrue,-Dnss-resolve=3Dfalse=
"
--=20
2.35.1


