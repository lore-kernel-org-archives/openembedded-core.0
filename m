Return-Path: <alessandro.pecugi@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD7DC83F07
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 11:17:14 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.125])
 by mx.groups.io with SMTP id smtpd.web10.10471.1724930224709245965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 04:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seco.com header.s=selector1 header.b=wupzTo/n;
 dkim=fail reason="dkim: body hash did not verify" header.i=@seco.com header.s=selector1 header.b=Cjea/45d;
 spf=pass (domain: seco.com, ip: 40.107.22.125, mailfrom: alessandro.pecugi@seco.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uShUbODflnKtqs8/tZ2N1nPnEL6kGMPqjAizGWmmnfhCLK/tHOnICTcJxya3TrHZakIzVRsUmUJN3a/4EaQSMfWMJ9/+u04gViYi25EoTLZJnTjb0LuYNBO60EHKLDh4/V1dmULJ9Pv6Ki0Ud8Q3HzUMxdAD0hq+CAyrfM2YEWSReJQINaSEajNZfsaNQM0chGUIDY8MLLjpoUqePCuW7Bb6vh0DGzWmQ23NXUJtqUbYbjwAZkFu9SnSqhlIV2V7FGK7Il9ZuaCre6ufn/cQEHTDWJbG8AD0miYw40OEn0kaTtF71uU25Uujvixefz6Zmco5lUXAqqaXSSzLGMFCnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlQRxnse7+QPyObGZsgUOEDGzZlHe/5H+XlsZh0jPOo=;
 b=E0BShTkOc/GQ3h2wliPH1q0nCDF0HIYWLIFz4CC7fxopLv1oShqoOzM75ruDhLhPn/kEjzeNEX1fuoF6rwfjUWiBOK+UiK29/K6g2rl0sERd1MWKPahjIyOu9fRn3ypny4zw6uPqAMMJlEhMshgOhV7heUYaESCLZ2JERAVZ8sZ2yOheKCdETLq8PJFfRxlO7Zhownl6ZAO9A39PSSiznDyWLaELAlOIpOoASSCW0afDpkeWWwcFYi9knBnTzSnw0crZyYrLQQA4bTOtGghkTvxt2uaWh551gPtPLVROta5ce2sFzU69WB+UQozuGtNp2VKaSaYPLk3PRNYNuG4BlA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 20.160.56.83) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=seco.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=seco.com; dkim=pass (signature was verified) header.d=seco.com;
 arc=pass (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=seco.com]
 dkim=[1,1,header.d=seco.com] dmarc=[1,1,header.from=seco.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlQRxnse7+QPyObGZsgUOEDGzZlHe/5H+XlsZh0jPOo=;
 b=wupzTo/nClHuiXa99qiFC0ZgSBVA1Ee4zKzLvODCl7/iQbHs1qN/2wj6DqhKzpR/hY2xuqZ2i6UteYhda5xgqEVWD/+Dc8qAVs8OF6HFKZWM0/4TCmZ+6CVGXmz90TEhRxj4xSLrYAb3UcEcYNI5nTL7NuRhA331fURdO59v/+I07aSFLPvvskBKUtFlP7ancwnJpNxGfRZYD+7F0MtwzkWbcApGxFngVzxuz3BdoTZ/l7XphdY+XvExNGLYpwnxBp3l8bg/BqBIFFN27spIVINfI/+xsrcgr1eD8DTmizuYhNl3q9yeh1rZ0W1wF5DGeEnyI32b4aWyoih8ptSgTA==
Received: from AS9P194CA0013.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::17)
 by PA1PR03MB10865.eurprd03.prod.outlook.com (2603:10a6:102:484::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 11:17:01 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:20b:46d:cafe::e9) by AS9P194CA0013.outlook.office365.com
 (2603:10a6:20b:46d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28 via Frontend
 Transport; Thu, 29 Aug 2024 11:17:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.83)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.83; helo=repost-eu.tmcas.trendmicro.com; pr=C
Received: from repost-eu.tmcas.trendmicro.com (20.160.56.83) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 29 Aug 2024 11:17:00 +0000
Received: from outmta (unknown [192.168.82.132])
	by repost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 7D8E820080F8D
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 11:17:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (unknown [40.93.65.7])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 795A02008006E
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 11:16:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQjsdU6sKfJrXveAQ+xEAimHjh+R9a3p0WRnccS0VYSMJSD06l1lZ5gNIGlVrKcwUxFwbhHD/WYEqHxcTt83D5ZpvSBOJuVDwasGOzWFmUPy1lUKCoFFfwRRvcOMAglInwe7Mjs2t4ZkET2GvkdI/H0Gkq7Le/Rz5NyXtKHrEOuflUrwWV/nOzo/PO6X8CE8QpZEJzY/D8BKP85Fr0hV7hJ3KKn+74TqnUfY0sK7zUo8m95ZW5DAOGUajHFa1Ne5afsqEogZpeyKZ/UstH1dMxj/dJq54iAMmNyivn3GplN3vBZOBkZxpSaefnhpz9DQV3vJa5XcytMqnnA2EOAC2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKVvn77ruWT67PLiOSsQgiLOJfTxiF2isTtfNT/8/6s=;
 b=lH3j5OrtNhOOVZtMd8D6AcI1Z4h3tP/BNOTqJ9JQDSxWEEp4kxHGNNh1WrpMqo2M3p9jrQUS4/2MbQnfCMYBLE48kGZatq0uViGncjr/bIGcfXTk//r+glqaEzWrIQ/gs2SELXuDB3v05Uk5QDWvJl076wYDTx3LY0RvolMms5HNGoqWpRVfzJfFgV5uCE1Q0QdNogJRhY828g4hoELpEJm28x+nHxnk0WRZSZA2+2LId9qtgNRZNcUg9FoVfLZUY1CFjRHYQ+Z/GjnHI9vKtGL3hOmsdQhuWgZJ4RM4Zyxti65rAnJTOiDvpwkRJzlo+lO/9D71hxsKpSL8RnjG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKVvn77ruWT67PLiOSsQgiLOJfTxiF2isTtfNT/8/6s=;
 b=Cjea/45dBp75q086EuGCKZOFdV9iQemsXVtdy/X+YChszin1z4YcG0Js+UtCd3FcaRPrn8gMYqhENgC5pnUd2KhmsrWr5K9gcsoKDhjYRX/UlmAJVz4mNCLKbIVgBBY5ub1owoenP/W7b19MNHLRZOJRgKrLCvJvAj9+QmjNZXgskCJvBOFoYtRbmBzr73luM/FLMGBuSmdOjT541pTNpcTLpMPzZgTkbeehimSJR9dtmb7qiebynBecotGty+yHDQnjFgO/X3nCbEuynYhz4ieK3xYJwcDoFFMG6CYxtM5ODGgjH1Wj0/WIfauXYs/AdNIKPZlq6WVDMeOzI0wAiw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from AS4PR03MB8178.eurprd03.prod.outlook.com (2603:10a6:20b:4e1::17)
 by AS4PR03MB8628.eurprd03.prod.outlook.com (2603:10a6:20b:58b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Thu, 29 Aug
 2024 11:16:57 +0000
Received: from AS4PR03MB8178.eurprd03.prod.outlook.com
 ([fe80::3bac:929a:bb6d:fb3b]) by AS4PR03MB8178.eurprd03.prod.outlook.com
 ([fe80::3bac:929a:bb6d:fb3b%4]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 11:16:57 +0000
From: Alessandro Pecugi <alessandro.pecugi@seco.com>
To: openembedded-core@lists.openembedded.org
Cc: Alessandro Pecugi <alessandro.pecugi@seco.com>
Subject: [PATCH] runqemu: add sd card device
Date: Thu, 29 Aug 2024 13:16:04 +0200
Message-Id: <20240829111604.149519-1-alessandro.pecugi@seco.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MI1P293CA0008.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::11) To DB9PR03MB8172.eurprd03.prod.outlook.com
 (2603:10a6:10:370::11)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS4PR03MB8178:EE_|AS4PR03MB8628:EE_|AM1PEPF000252DF:EE_|PA1PR03MB10865:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea01c7d-1605-4071-7808-08dcc81c1a5d
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?1wlyl/z4CroNUsBt5uzM8bbWBUsWfL0GmxP00EXRVg1x0/QLJbtJvyJYSCtV?=
 =?us-ascii?Q?4upNeviURnHnCqUjomj4oGn6/sLyBxnB2s+poz/fy/tpSwou5wQo3x8XnQgm?=
 =?us-ascii?Q?euJ+kXOGvXRCc4L4MJ9j/FwDyisb2IxjHVDNrNWa5IbldE4g7HiuPrdEZKn+?=
 =?us-ascii?Q?mA4Rnay5w8wPELItUpYyx476cero4dtkiAGD3/7sruhIQwb/HXnE321GpAnp?=
 =?us-ascii?Q?h21Mf7VA/aobW5t9o3es8DdacjwLhHnUc7vI7/6flZPaotFyLnSi9TEUX4GV?=
 =?us-ascii?Q?dN4kBzpogq1tOBl1a87Pr0K9mDLBxlsWT+Lrg1WEEFts2sbwTftSbY8iQSsI?=
 =?us-ascii?Q?N2LtXuu+BXIHiDLa4NUZJVE7MjbIYBExVIci29P6rDt3hBggDYk5aJ/TANXi?=
 =?us-ascii?Q?PVcuVhsQDtruqxusLsExlsIwMn89wReYxNfI0NRVKn/mn3j4BD/0mHD7ABGP?=
 =?us-ascii?Q?biFxp1KqdXlOQnKoSQkxLB1nBes7Ks2BlE4RKoVpgtv8XSF/RXWw8bQ+YZln?=
 =?us-ascii?Q?YFcUNrGSU2g3r1EeVgX3Tb04V0VTmSmLr1kPyEXS2He5ugyMI7bAO8VrDKpa?=
 =?us-ascii?Q?YjogmWNY7pfjd9vm3ADahs2c4a46jF3+7IWLyXaiR4UFPD+DgWRDxtZ9cf/k?=
 =?us-ascii?Q?+B9yIob5GzZSIJiqK4RHcXnuCNwJC7kFC8IMr5Q4Xkd7F5tZOmioUTbLighY?=
 =?us-ascii?Q?ZXvW0jKC2stF09mopdUwPjOpf+it3Zus0Qlqra8oJNNx0IHIiPTi92HkNG9F?=
 =?us-ascii?Q?MRW2NePqrFNfU6P4aJMpjj8w2Cv9FnNX1fEyPxxIzUQDtuYOrSxJGkDUcS3R?=
 =?us-ascii?Q?0TuCayXWXsWe4CflnMHyGE4t65khdbxg1FYKaDTrXwRYZtAgn68oQfuZ1zKg?=
 =?us-ascii?Q?ZtZjcLJ3HjPgSeSx/dkgJGYFMAYoWdNfNdyCSGIaxWh1X0DtrhqoDCkuom7E?=
 =?us-ascii?Q?TgH6Ry1zF3gYDDrJaPdWA+CVSCMG1hs+FHiAeDS4RCp2gPO9rHVuHktFuGMk?=
 =?us-ascii?Q?5ePGc4ffL2xlQ8hNkHcl9OwFOzBWLVYLYdC2RTjvTq2yqDhppmbKdboxxW+4?=
 =?us-ascii?Q?Hn1VD+1zKBF59hLh+AF/srHFzFWmyD8zFna1iHyiuYmmaIMUdqXd3Myb3r2V?=
 =?us-ascii?Q?xmApb7F9xz3mrdc0xa9ZcHd0ULN7uTIWK0fetug8o6XvayxhFhtbt7Vq2Mgm?=
 =?us-ascii?Q?X25ysbHk4cmW6E2dTLgw3TLL+wxK6/Hjy3HOhQE5Mr3EVpyuVVVXVqKHU4pX?=
 =?us-ascii?Q?rrQ1p0XEPE+K4825SlKb2XHYoN+PDtCrna9DZqQ623zBM53ugt+HgFrVvKpZ?=
 =?us-ascii?Q?BHIjmXLUTE5qQWntjifatYKfBFFUO0dTPvNXlwb0Q+VpCkmXP0UfeSDdN4dB?=
 =?us-ascii?Q?Xc3yF+UdegHHgWF2ggg4ViQAdp4PbPHISx2oGpUyLPTFF+0slw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8178.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8628
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	90320dff-63c1-41e2-250e-08dcc81c1819
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?udeg8P46snH9fsgMRgKAkyXQCQUj8KR8M7S8FyY8KmKA90MZIgA6YZZI/MGq?=
 =?us-ascii?Q?t5tHSx/y2xW0Gvw5JoqpSddJ4n386WRZhx6BRnYyx2tfPEThZ8+IG7hAIXOW?=
 =?us-ascii?Q?juyIy7CJPYZ+WB3fbzxL2HVfNWjVB18J5BW1jWefJZ09yR7jv2XlXl5mdv/R?=
 =?us-ascii?Q?aIUtLq1ZTCRiW8jj0Iyuv5B67+VKSK1dkDail6A5uOjylguoRmqmvOVNVDbV?=
 =?us-ascii?Q?6KPqT2W9i7KkJn62elcvv1Ur6825PHGFRTtySfS3ihcoiXRDXuwowivxg/22?=
 =?us-ascii?Q?ErObpoqfVYmF2CPwcckfsVXmABti6Rhf+fYL5Ay5YqoTWPz2xxHYUmWmzwBJ?=
 =?us-ascii?Q?3IG54nN32/8sSJhgA36j+0xbSqiGEBsHdqFviCwAbH/TafeIhnLqQIMN9m5K?=
 =?us-ascii?Q?Z/xTdlrLFbTTJ/eMdF5DwB6RcpwoiQcez9fuAZQWHGdW0RIIwrlf4ZDSI7WF?=
 =?us-ascii?Q?uWS+BVQOy4q3aaaObNf+ASo9pjeIV+NUqT+RDXppsOTQAxdKYxL3KV3YDqlP?=
 =?us-ascii?Q?or3S5D8WjUIvZ2pWnM5bxk8lpQ8Sa+reEK6oNVOFBMsnFvhmxW3CixwnI4+T?=
 =?us-ascii?Q?421+ixJ073NZ98APxR54ccCplcxSC/0bpysmjS8MJxwNHDjF4HPwl1wEQr8e?=
 =?us-ascii?Q?ramyEnrOOJJNGT8siPXjYjxIOB4rM7ykWgVhVrJ7rcTXjaA9HsoIu8PV4GXs?=
 =?us-ascii?Q?FwGCuESbL9PxKFjK34UxWBHVmhdjmAxpq6gdA+5bVZ6prMCHocIwy+mcq0iU?=
 =?us-ascii?Q?k8VOx6V0b7EpIbzYruf3cTbRVXCzephaOTH9L1HsOdMw0vuNYGcoyW6WtcUz?=
 =?us-ascii?Q?eJ9+phI3L/watcIIVCO8q+NgzgoGm0oSqf245gQB9ISFC+dPZlySkh0lt75i?=
 =?us-ascii?Q?rrYbY81AiBVKKWKkkDfwJh7Qs5TQW/4LNdQbuv5BZGa2vPBGRKz+nRCyc/cG?=
 =?us-ascii?Q?KrhThCVzFDhsu77XSXfEWgTUqx9Sc23BnQUhPXrFNNjTbxTeuskHFU27xkk5?=
 =?us-ascii?Q?B78O6dLzpf5H5/TYHcFqObJWhGUTBAR1m2JwqMdAhGH7ggSH7n9vCpU7zu0T?=
 =?us-ascii?Q?D/YcObWXP9dR8q9XE9OByo302KuEh7PncT1a0ZQTD7x8rfTHcqmWHDFveYFF?=
 =?us-ascii?Q?c+Iz1DHeilJQeJB9lyU+jzh7ymZPtwR/JSkLdehddYXydkBdsY8k6xTXijQJ?=
 =?us-ascii?Q?FL7kHsW0OpW0JzvlHiG7QrnYEO4xdhBj86Haz+VdL34ttmwGYRn4Pb4mfK0u?=
 =?us-ascii?Q?y95EzBuikvg0tuhqDRkw3OI0/py5fAsZfJ8iNtteJkWoEnSGUG49DUHHhv8T?=
 =?us-ascii?Q?Ck5U59VJQmcBi68IAk5/adbF3fmd+7AprhSwZpH0VbQjtlY+m7Y14xN96n8F?=
 =?us-ascii?Q?7C56jgzumt7BM2E0sQywdFDbyW/HRHq6Emw+wfrLWCk4lXsSOFnxkRGvqQmN?=
 =?us-ascii?Q?pbexTRdfx9FAYvExoNHoXCH1qO4I+fOp?=
X-Forefront-Antispam-Report: 
	CIP:20.160.56.83;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:repost-eu.tmcas.trendmicro.com;PTR:repost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 11:17:00.6427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea01c7d-1605-4071-7808-08dcc81c1a5d
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.83];Helo=[repost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR03MB10865
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 11:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203912

runqemu currently only supports scsi, ide and virtio drive types.
Implement QB_DRIVE_TYPE=3D/dev/mmcblk which adds an sdhci-pci device and
mounts the rootfs file as an sd card.

Signed-off-by: Alessandro Pecugi <alessandro.pecugi@seco.com>
---
 scripts/runqemu | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 69cd44864e..d86b80b86e 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1295,6 +1295,10 @@ to your build configuration.
                     elif drive_type.startswith("/dev/hd"):
                         logger.info('Using ide drive')
                         vm_drive =3D "-drive file=3D%s,format=3D%s" % (sel=
f.rootfs, rootfs_format)
+                    elif drive_type.startswith("/dev/mmcblk"):
+                        logger.info('Using sdcard drive')
+                        vm_drive =3D '-drive id=3Dsdcard0,if=3Dnone,file=
=3D%s,format=3D%s -device sdhci-pci -device sd-card,drive=3Dsdcard0' \
+                                    % (self.rootfs, rootfs_format)
                     elif drive_type.startswith("/dev/vdb"):
                         logger.info('Using block virtio drive');
                         vm_drive =3D '-drive id=3Ddisk0,file=3D%s,if=3Dnon=
e,format=3D%s -device virtio-blk-device,drive=3Ddisk0%s' \
--
2.34.1


[CleaTrial, SECO SpA]<https://clea.ai/demo>

