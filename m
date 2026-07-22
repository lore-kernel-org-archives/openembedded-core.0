Return-Path: <amaury.couderc@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF06C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 08:20:22 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43334.1784708390249285235
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 01:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=yKxIiL+5;
 spf=pass (domain: est.tech, ip: 40.107.130.49, mailfrom: amaury.couderc@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1vOuWb4kNrEN8t/wdiCE9C4xdi+/vT38FVwAiPNG+xeAQOU7o5lKBUkbG6ArY4nWG/DgbRn8vUDSDg2T+izoqp1BL0a3MQ67EqNndbrFcoY0mkeatBNlEib3SEd4rIpoEa7ocHGvAx6aA+uF0+83cYAYMtPpLXG+CNmVApWutc1M8hbUc7lm+1FqUww34IlBizW5elHh+KfcrCKaSR/gPHGurMEKAdP+LxsoEHydZfffPa4uOQvwUBpGXSHGI2yheH+XB1VGu+gximwS4qUeo5HVxBNSkOqZRckkqv0YiU1Dz+F2HKR8oed/2zOoRxAdefnyhee6RmCaBdxh2+8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ph6F/b+gtt2ixaqG3NuyU7yMk5DfAecHCfDGj6mjgWU=;
 b=oEHhfbJak+Xm499IBcyBdDuotqvFGd6+mF+dUSGY28OaRod8YQ37/096eLdb4YyzCUtEI4iFVx22uNNV6aq4U7jUwOfCHqxy7Wej0lrLGJAZ+o2uRN75dc+UjGODZUgZ0ZtppkTFLOs8rPorU2uN0ZOhnC6ARqDHhcunIG2zARd5UslxEOox6INEmpRwFXddY9FEE7iM48X8GkXtbhVNUJ9Z1oUNkAt5UYjTuEdjrB+BnwEvwKIILgXgVHvnvCpCZ0dhPpdV89iNMJSWsNu4T6A8CmlOGQSiKSHCDDk872Ohl5KqTfDWcdEAv+98eJd2Bivnj756WKAv8yQf7rD5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph6F/b+gtt2ixaqG3NuyU7yMk5DfAecHCfDGj6mjgWU=;
 b=yKxIiL+50SfHCjxhHK3Go1mHbrGND9kN8q0RgvDubSB1QUH3+2p4In76bpOtTesYK12ctZruM9lvvWsfPJdjJ938vfzjlB7535oZVEBerVVOSNrZPEo7q32VAOilIo6qfXMK/E0HhFhJDuN2hJa/pX5On+m17N+xqDjmcv47O9Wk4BfVySiB4NStd1WFLbUkjNwypvrerS/2G5im89zchKhboI2XrrN8NGaz6FOdF/jVzlJeOzjP/abriBUPBV45bYo/xRjgZNKrOsoszTIuCW2Y3Ao16sdNGo4sp6DKxSxLwA7Y1lh29dRMKTupzBtMihALzY9NUuLlKSrKvl0CLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6ad::11)
 by PA1P189MB3492.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Wed, 22 Jul
 2026 08:19:46 +0000
Received: from AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95]) by AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 ([fe80::1afd:f059:542:3d95%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:19:46 +0000
From: amaury.couderc@est.tech
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 0/5] wget: fix five CVEs in wget 1.25.0
Date: Wed, 22 Jul 2026 10:19:28 +0200
Message-ID: <20260722081940.15007-1-amaury.couderc@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P194CA0017.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::6) To AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6ad::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3196:EE_|PA1P189MB3492:EE_
X-MS-Office365-Filtering-Correlation-Id: 487c66a9-27f3-40f3-ffe7-08dee7c9fd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	t/qqZLBVNLhlE8DhnpqZ+HjC+cwF20j7k2/E1Sx3Bdpb0bfWIZPvLfAgmqeV9zARiB2jpdrcxsh90kTPd8DTTyPn8zNPSaRyuirj+IkezfK5IEyToVLiL/KB4wjZOnP183wXmZZuhYbdivSsTAjoOV1K2M2o5551plyF2lP48P72FFkPg0rPqyt6EZwfMbGSz6lLak7YuepS7B0TMJ+e6qiIz7MGy3+pGxTrWpXygNuGhdrUUsM+mOPK+Jcb0dZAJlp8W3arXENn4FKaRBP/pFYwfCE4swpsC/IIKd3b0QHw22GbHuliczUpX3jEJsPV6k8SWoykd5y0dmh3D7ZdLFF0gIFJay0ZMlF7G0JmUQeIAbp6UMmKfmXaH9IzSIWduOzw3Iq/paiYR9ETt95yy03sag+S8Tkxst9+BSWvW+S1c7hxRc44eCK3BzA4r5qF2I+kriEfgs7soNPZdrYcL1Pk409y+qNFdZvSSLqzIgAOK4To6DRVZtRaLOVJ9S5AyerwCSxIqy+oq64TvWs+xbfV+kYLMpUCKmSbIuuiynohtsopWZb+2pXzR4f3MtHgsBCI59OVMvAdQO2MA6Hm3lNjc3nr9nket8H4PfQhzZ5migV2FtU1CYo8qW6idViIEKk0AVS9o9x/4ovPR3N7C05igEixWS6iguh7r6x0WJk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3196.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CdP5dncCkJaHiALC9Ze+EMFnDJQK7BtPnob1HAFXiU/YfYv4m5fdNWnalYH9?=
 =?us-ascii?Q?80Z7/yjLIvcpLR9Dt2NOOoCBWH1P9Dict81ILfo4Fb4++8Gk5cf6RZTp3W8v?=
 =?us-ascii?Q?838Mo6lQvJXfS8m31sfYyJEwLuHRty8nOE7YlF75eNs4l9TUcnLAMVUmEsI+?=
 =?us-ascii?Q?feny83Cx/fiK+H4uhhPdSSohfChIkPIWGimQmnNQIxyTpxw5nWfvs6lQY5HA?=
 =?us-ascii?Q?ELL4n90BkF4vRQA3tdqAZCNrxu4ZW57+bU95AVMyRpIhrN8yfOitoEN1sJ3Y?=
 =?us-ascii?Q?OMxNcp0cmKXjHMA8XZpgMULB76AXDcA/0rYFpzsVmLcbiavKsPGUyabUunNj?=
 =?us-ascii?Q?tdu4hKGs1x2vLUOOKncOllbCzc8EE67wZkvqUUQmGptv024ad8GpLGWTlWUQ?=
 =?us-ascii?Q?1g9aUQCd4irf6t5nE+22SFgrUhL9Q6uRt9qbDP1Xeu9sOqhc7nQlWtOmRK5C?=
 =?us-ascii?Q?+qV9YRTEL69IqjOjCfLICItceYIJ9JDoiG7Sqb7LYDmriXQLY/XifYgYunYN?=
 =?us-ascii?Q?pBGzTSC568OSs2/ca1WNlOz5tifb92TySkMJOSLjuogj9fbpLuTDrvNQYJs7?=
 =?us-ascii?Q?7s38KPeXHa31vR36SmQKxieODMa0hpZnBCz1F02ygMBzsRFkVmK2MY/14gzS?=
 =?us-ascii?Q?7geIoEBPyhsWWUQY4Zo63EyhUxiyQ5+2Uj8jIR08GWryEXbkjm3j6N2Q12WE?=
 =?us-ascii?Q?EMdtrayip0QTyWlUBil7u2lGdID6Vs84EjTeSJshwVwZ30HOrQPkjPzBJX+t?=
 =?us-ascii?Q?lPHlRVGdL1O3Rb1UGBdZ/76nvdqTjufeLlzINg3nuj2gFxZkOyNbM4FyzvTU?=
 =?us-ascii?Q?vfb4Z3WxwPURGCQtXBeQCWSysGSuoW0p4fY+e/fjtGxx+Tt+0itWoz9ucNR1?=
 =?us-ascii?Q?nPL5mh6ZlYocZnLuM2s7CYqNIGcrmqBnbO/uHlc227E9tFKuWfMWU61YUTrU?=
 =?us-ascii?Q?Jse69ZCyiCECZ+DxmocImm8o355TvVRBDamUIIfYGG1lfP+s49OWKLPuPpWw?=
 =?us-ascii?Q?ndUF+fzWFcJp9j4D/GPDHb5m9p/buwRng+zlQ1QEB5e3BpJEBNzh2V9apJFG?=
 =?us-ascii?Q?LW2jj4X5FVcXOnDcVaqoWzZ938BZZw2w0z5R2hSvT9+GhTe8L+xUeS5o6RxJ?=
 =?us-ascii?Q?G4z0M20js3JZI4mxIyWsJ5Bw30ScUx1zAJdQ7Qxwz9S/dXzQrpIrS7/+OGL3?=
 =?us-ascii?Q?ZsdH6KOVp28X++Qkn+fQReU8aUZsLIQ1BV/Bo8GHsHH7xtbZp1Pbzshriq89?=
 =?us-ascii?Q?sBYI4UKZsJ/58Zal361NhvS+TrHgxwXahxHA76Mr3ZnfDdx4K2XjazyO2x1Z?=
 =?us-ascii?Q?iwE5euqLndXr/RecwmRC9WXw+UsWRaBHIcZTa+WzDvGM/HLEQ0vxcP9xA4Gd?=
 =?us-ascii?Q?C+DCLBicZkhvp3LWAIHCzZVZqG3sBH728vd8LdRuJRKf3jBpViEK60sfGduu?=
 =?us-ascii?Q?IX1T5f7u0honUUaKqlucvjBQQ5bEwFo3F5oJl0Vo90vJlajy6KFU9iiFbx8+?=
 =?us-ascii?Q?pJFkGWuToeIiFr+LR9y+OrGfL5GlO4sGgQNmYLEhf8hczk4YP/xw8RyCV6PH?=
 =?us-ascii?Q?T5+FqJwSWSIOh6WTzMx//xQ7SY+5q3wuwOcE/jqmmoudgQJf/sLDAmxdDA6J?=
 =?us-ascii?Q?AZYKYww4BPNrPtZgJYpuFqDAqVGNMFHiFLXqwya2ulHTZpFNP09C8f2wzAkC?=
 =?us-ascii?Q?tAD5KInl6ntGt63q/H9leIjklFBRkrOO02B04KY+l143VT60uhIC1yfl2Y1C?=
 =?us-ascii?Q?AbarUmoLYg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 487c66a9-27f3-40f3-ffe7-08dee7c9fd76
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3196.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:19:46.0524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3xY2COvns8snM4Yj2S8LQfqUybbH0KPb6hf0fWv3ixmqY9jsLy0/PlpJDtElv5osWw9RImJVxsQZ5TEuIlcmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3492
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 08:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241614

This series backports five security fixes for wget 1.25.0:

  - CVE-2026-58469: buffer underflow in metalink string trimming
                    (clean_metalink_string)
  - CVE-2026-58470: integer overflow in HTTP Content-Range header parsing
                    (parse_content_range)
  - CVE-2026-58471: buffer overflow in filename encoding conversion
                    (convert_fname)
  - CVE-2026-58472: integer and buffer overflow in HTML entity quoting
                    (html_quote_string)
  - CVE-2026-15146: SSRF via FTP PASV/LPSV response address spoofing
                    (ftp_pasv, ftp_lpsv)

