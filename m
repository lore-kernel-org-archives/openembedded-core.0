Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF06C61CE2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11822.1787618773981173903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZoiGcboz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONJgxV128494
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 17:46:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	ZoiGcboz34Ab64g338kico0dvc81MSTLGaDDd2txEoOSf1gY4CO013szdtpiKHey
	USte21uqdbE1Ilf6uv1oDWJKrF/krJECx0HmnE3F+FsRTBnizrYUWEz5LcNIkkdj
	I/d0lBFLVZHlpRXpQoNjcXaNg0/C2lL/aS8iOKojOAGFRfR1twoiEcZlxRL4j8I2
	AvPHV5tFOA2Nxs+pg6QTq7B/PZTFuldgcLt/e6VCLkTkHahIJX88pxwd0rlI7G26
	l6O6/e8ANlHZXlTDzgSj3144D0jaq53edtEuVwSQ+Ob/8RAiHg5F4iNRpbsl1apn
	7RKq8N6oDgG+0K/xaK+aDQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021075.outbound.protection.outlook.com [52.101.57.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkdu9-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 17:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnFTCk1+9/w9BbolfLKz4c8ayF12fbPGhbWkRV1TZ/GLlAbDdlJZncvMBPNiLa6BYu3dSl7ut0fxH1ZUU20YwTvBUKgkiJ2gY/um2iI9PWP3PPLVm48YslTQPecuu+M7MxrUxd3T7Xl3QcHYC9+NvH+7dyA5AroDWois7in4WPtNi4aVnrrsygvADxtyxqwWSWbt7WCtkd86nab+WtepxpstDjsjjT9lC55mOXQ+cAOgCYHo5/cubUu5kHjrQy/mi/96XXZUppb5ewKaofhuJhE3BlFOyhEj5P6A8dOBQNTdHaNIXYJ8BDrxj8csM0Ffwf4GodBjy/0cKnjYceoJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=esrXpAZeP6pq+jJvN7J/Ln+g9uVDjidFJE1JOWhS6wMshXkNBRg5cYkbfgsBzDhu2ixf03aQ1pf4cCB0tBFPx6LR3H5YzRxLXt7jN+sS+7OXAcSz/+8plxdYvsRCkjqxjWhkgzNUGLpQ2H1Y9heui/abNU+4YFTcRSNR3j4c8u7/Omg+K1TxeNIKZwOxoEnetQRCp3GNqSDfNWW6M8tfNlJr+SBnwWTJHPCYkK6cPxJyTTPMdmNOL4wxZ6QSX3wczEafZ9IZtpaPaa7kdh4ujGsseFOoZpJeOzz2s0bOxDiqcNvshNzKbnacAF9WRKDIIw7L1/3JjFxIgWXMtK6lUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:10 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:10 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 02/14] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Mon, 24 Aug 2026 17:45:39 -0700
Message-ID: <20260825004555.4111831-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
References: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|LV3PR11MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: a4c2d368-1fe6-41fa-7e8f-08df024241a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|18002099003|22082099003|56012099006|11063799006|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Q2pgiLEHLJ3D2G1kteCiUMJ2A1wOSfGDF/HcFVYDF/4/3re3xhL+gUM/jFxpC1IGy4wGdh4J4MkW5aSuuuoz6b/PnM34+RGKipGnPRnxDqSfriywkJyDRffgtGqFF3e5SW1pdkPQcDZWScI6S+UXDSLMocc0uJB85GbJkOd6f8j5B8rKg5oKHGrZhKy5MnK3/7CFFly9YuZV6/YTHjVhOTVzKSW3PF/l+HTpfmNjG8MipEL09UlD57Iv68y8yLkFLav1JZZfjUTJ7VG1I3YRKGNnIlhzIERHG7OlbBOT2nFlaDyC4NKlyY1jHTyFxNag3v1SH8PkjjWnVIvPKHze4CFrfYkfSByTtAW0nCwqncy1GwWjZxs07/SKwZ6FZ7C47/nQQu0JNA0i7iv+4XzThiAmHxMDaLyHOAsIcTWwKBjbRWMrUNgj6lqsJGj5IQWAHL7ij0q2C0wHP1kQLkD+PH/QNFAwK3TcAM9VAjb9ApBayX+rpDeWx/VJbNWSBNqwTw5MvcPOTwPg1zLfRaAu4PPLO/DC9CDbhTa7IOsJeztljQI5gL1XwVj6gct44AeYioz5tNxfG3t4Oebmdd5M+O5gAxaMIeBewk6Lc0uGUQm3jNtNhW3FrCKSCyuep831IN8z2+fvMQv4quV9saRxQYnzbNcz2ItHTQzXPR9/l76tc+kFnoj5a3nb00toU0A9TItNbZwXlU/SU6VqKSqFE6/dzpA5sHG/gZ5xzNLZIuc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7RfPq9RF3YQCeH0V41lAuYaOsurGA88Rg7+8DeHSg5wYgE2sN1FjBu43/gdu?=
 =?us-ascii?Q?DL9RYep59iSO+3h4FQdU9tSyc1S6rSyxEZTGmX4s9I2qNy1RYe4XBv9xQKSj?=
 =?us-ascii?Q?EKZ2BWkS9ZuZVuko1RMCEXcUeSwYbMHOqYMaG3QTGk/FYErIz4F6aL6SH3YK?=
 =?us-ascii?Q?OwuOLiYYAPtbADFTCaNb2wtNRJyTPEiGGQ04/4SMRSKj/SwEXXOeQONKgNyb?=
 =?us-ascii?Q?NZ6z+6l1x59I/wGi3Qj9lSx+0IytLL1VdiCzrS5AzC3ytRWGHeW7iNYsYn64?=
 =?us-ascii?Q?sVwaUscIvKONAqhsuGSi3fSI8RZ5whh6Ua1zrB7LGYmpkAEk8B10enjaTFl0?=
 =?us-ascii?Q?DNobNgjo/59iA3bRukhSJ6pZFoGdxnpVEgP520tiRzo8l7DDNKf7Qwmxe97v?=
 =?us-ascii?Q?FTij/VxfUXcc9Ln8mzqCU/nq/WOSrPKUjVB6m3fzC/OqshJQKQwj2Zkm6YVZ?=
 =?us-ascii?Q?CEsERzKl+9V1OjKH7AkmHASoojNk8hH16bCALziPo/iC5J03tK2TaIllchOk?=
 =?us-ascii?Q?05kgPgWTr0yJUwpCSOsFHrxXU2V+1rHiK/oXrtWxtqks10Zdf7QZXj0E5U/t?=
 =?us-ascii?Q?v32eMtxR5ez7UywpzeXDxSKpccjcJiOdWsQLItE0cVCpy6PHqsJYvkjBYlCD?=
 =?us-ascii?Q?Ifub7BHGkfAuK96wFRPugn1EINA55hWfEBLFjZNzXoaaDDp8QmyrPmIlszYX?=
 =?us-ascii?Q?IVikBAiHEdhTDKdpHPw9Jc+0+ClTBk3OcPtJYXZ/sv4cQHBxHh0rribkVQFS?=
 =?us-ascii?Q?Eb2CBBn4vtD6icNPAt/MT0V+zxNhcPwnXF3KQT5nNaJHpw0r3osdgmFndNzV?=
 =?us-ascii?Q?rhTRqP4rOge8/VYX0RvyDTTybYQVaDzw7acDCJaHocHWV6X2QZZvVRWUkWLG?=
 =?us-ascii?Q?+cPN/343QNywijCZPazOPuPJrSXkezhRo0FV5WJk0h0rBktT7nWBAIURM56e?=
 =?us-ascii?Q?45AMkWtq4qgxupwKjsxGqk4fIKelwy1KCwEV2H1KXpyMB+APr0uaXqq6rIxw?=
 =?us-ascii?Q?jhtd1D9f1nrHPW7ZZNzNDDHei/dC9eIdkkjYajO3WE/qBSb6x0mE7IA9JB1a?=
 =?us-ascii?Q?u+/M9aaS9hS2otoKSBMFnh64nVOv/ek8CXDdSNn0oe7t/Xb9BNCBx3Y1mWy7?=
 =?us-ascii?Q?OjwkMRCLyl06Ss7cGE898Q/zMhFh+k42WqKuuA9SYhJUM3tAnz5rhjb7KC1w?=
 =?us-ascii?Q?uSzWNBw4Y8svDBkrNGEzQMdTWkakfjc1WEhDGPYTqfjJGFz0GtiDaZay2n0e?=
 =?us-ascii?Q?f7ORrH0v12oDhU9Q35hTGfqFmHmynk533EKhU8Ap+NepVXcJ9lg7X84V+HdU?=
 =?us-ascii?Q?K+Dk8Xv8BHND38+2OzwraGLxgjP3MRmPpKT54qZxUD6a2fVlhDUtAPW0lj1z?=
 =?us-ascii?Q?AVM+y4CqHxA/QxQtk8uWODshTu8bl1oH33LQ5p8SAdihdgRHMs8rG2QxQ1mr?=
 =?us-ascii?Q?JVWqdnv0KudENgFCuc3Pi8tAGzWnmFxFib3dFisGPkHIDAYZJwkO9q5rQ0Wv?=
 =?us-ascii?Q?Y8Yh3iC5UauTZutsh9kcohuMMLA1KI+1RP/Cyeu+WeLdWGTjEChLHwqc0QHl?=
 =?us-ascii?Q?90OHneol3WASWciPo1wjMafGXDGwfigTQB36vaNdHK3T8+KkeVQlAnXUUE5Z?=
 =?us-ascii?Q?27iXAuvpmxd5Np6YI2MQ1PJoAWViTbDvPdhwIfc2K6NKlOFDuwQLN01Fx2Mj?=
 =?us-ascii?Q?IW/i2pIE2PzSK5EMv3jb/rWy5qMPjSkSfNUnJciFrUtsUqU6AKUWbQw1VJtz?=
 =?us-ascii?Q?FNeB9vmoxjkju6cCkB/xY2tdydmPd2U=3D?=
X-Exchange-RoutingPolicyChecked: 
	BgxznLQR/Z7Sys4cJLKPGKtyfRavFLnmthzArJr6KzEiUOuuzi+iay1IMH9pm1qnMldGzuqQ4B3uRE/0i3KMi5tiLpYEqp3NneATr8z6vcTi7T+WX7H07VqTElnCAicmcEX0usYrxZMWBBlf+eH2mNSEc+DjXQK44mFaUarZYm+n2Go4UHp77hvkC/HFohToZXTt9WgzHNzMTBYXrfwtDlW3LjePuevfQMgpDDg3u+xjt6wd3C8o++05j8BmPLDg6Mb8pcp1FqEg66Oi6LKBHLYE7CIh3Y1Y39yfPIOzDyxj8JvI7frGIdRkDWZH+L0Y1SjJPrz27GsJByZhHtt1Qw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4c2d368-1fe6-41fa-7e8f-08df024241a5
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:10.3368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqbMjxz3XgLvIUHBxzlmeQvZSYkyyFS3rRIDw+dglJLrYI2OBXc6xGe7HEQY0zVdItnLRi4D68cGnsK+1dm0QxWD0jK9iQrcemBTsFC1Hi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: zmPA4AnUTMsKwScYN-a1shpHNH3XAJ-a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX+SWoJra+GeQ1
 tXPCetxdmsVXwYRQohEbPytmBOqzOxKQqmi7N21/UGxbbnCUD7MgM2PLWWfp8/+9l7AQtxnGAzO
 e25/A3IDq6VVbEAnjSJeBro9nNAzhSRNfjdn0SR/dXarjJjJ/RVKov4UjcwyqZpbgeFTVNhtGUj
 4lUeYlvUiZwvXwGgIq7bbMp6AhEaWPxllI0muyxoTq+bOkPpZ3/+XaaAcV2KahM3i79n4h/pbkv
 zHqQaOzmsMFYvoy5j/WAdJJGa4YWr7/avCEvzMd7j+NFqnQbW0su86QoTaHtW7slin0fQQuZ2FM
 lfHxxxSafewrHoC34qbZHPXEGiQq3qK1pRyFbQQS1cXDpjK7OKKNOq8TZNCue25K1rBtPvKGN0L
 te/Dt2AVvrsEfeVCYfjGbKo/Vj8jQF7MhTsUGgDI/fycl0F1JBeNjOj6JOCsDrqCqwZ6Ot1qr5O
 hQunx0/XdiSmDN+S6Yg==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8ce5d5 cx=c_pps
 a=aQ32ZPuKfpH9dcZYVOilFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: QxEFsMTPU_tC90VogHsRYpKjlJVV2zxq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX6XH4M6BO7l0+
 bUu/JfhZNYTJGViX0pTL/IK57L0m1N6t9VjB4qPoH6WuZlYhP9jxqGaz+i5yBUOUQ8l277pDd9/
 8rCBnDDOHWPp7/A6lsEQJm59uuq7fTWc/s3oHJlVi+oNdGDxvg2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244157

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.2:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib,this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f286d3a0e2..9af4cbdd94 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -585,6 +585,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"

