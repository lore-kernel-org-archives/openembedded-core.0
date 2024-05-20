Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A691C25B77
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 08:11:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56010.1716192662583797550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 01:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5870edb5a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K5PlDQ003963
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:02 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y7bx6rq1j-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EsnCSGLuH+lVjy13uVAiNKj484bCIPNvN+z7Y1frrfS9GuA4LtOiwKbrd+oS8VA8KzBbEalFJuZR0aSIpJ0XDsV+TPwIP2J8Kz0EApDfgvkIPEwwyIBbK1w7tHfJqbRLSFZYqJoohuRwbI3y0U6o28IzvcrKSSnhuHPVnAZ1G8twv2i6dvdI/QGsPcjPfAjEYGZlCgaSv1W7rmOMiazz7MPHS+vcr1101ZplsmAi6EmuXmcj+fKcxa9UqrNVIq0fzKDLcptY28Q8sBJsza/dRyCRhnUcNzcRiYFQ+01qVePBigIy3k+ThuNgHUZEg7yVfTd3hXgWIEzmkIywziRzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCPKQZJuE4ebdZYMiEO+KfSpg0KLBkwR1C82ed5YbA4=;
 b=OZRBhNG6uy2rC7veEuoTno3uwNaDea92zAEcmwvdsbbP6t+TVrCE2+Jbo8ChyHOzQEkw9BDuLNEMcZMPc28VbbB9KQ0yPQThHBWnjyDC95Q3NW0gdtTzuumTtjJWTxFypGLlni2wdHXLfP2iLlk5FTMa99SUbkojKTItip4rlnG+C6tp82ug6LC/M7v5wutYNMHZEJtyAseoyNG3g8Lt04XxdefBZe9/k9STorrxnk52YsrGAEfH2uj+V8X7HYEVTJDwI4xXmqccQXfbc3PCLzcB2aJLMHYaVtyoH+VvQgG3RdkbL/hN/oOZrh5GwD2nEY+SmDmTDNxOXY4p7/6+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:11:00 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7544.052; Mon, 20 May 2024
 08:11:00 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/6] pciutils: upgrade from 3.11.1 to 3.12.0
Date: Mon, 20 May 2024 16:10:37 +0800
Message-Id: <20240520081040.2380736-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520081040.2380736-1-Qi.Chen@windriver.com>
References: <20240520081040.2380736-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f11694-ffc2-4721-d877-08dc78a4627d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oMgLHQWXAFyJEWSJpBtrUmclfe8eVGcrr0GN4uxG35PydjvlhcurBa4IAXR3?=
 =?us-ascii?Q?b+PGkjyOza1TQWt0AZ0MFY3RkhgJzq8yvVpOgVtw1TfGCZvxEFU2m0wT11qS?=
 =?us-ascii?Q?qGMU9bTZA6ksrUUxVhl3vXEwurxy9eK22soKysVFcAhqseefKS6tX36bAZnV?=
 =?us-ascii?Q?C0NzsNMl8U83gsQAHodgHQuSzs3HVVoPCvxawsg2IccOUueinEPVh6vKzGLS?=
 =?us-ascii?Q?qSf7Gj2UIWO3hIp44zZUcOglPozJ/RWpu+Qh1vcd9oiRHEj24oLZvg4pD+XS?=
 =?us-ascii?Q?R7mlWVnf7FyIYb8jKDfq76WipoYxAfiesT02PwfhYom1hUR4JTADVvAfHdO4?=
 =?us-ascii?Q?Nj0zKNQI96eAo+7/FwfFsZgf+oPdWYbN9G5QdTWnC33OcdYmZS6ED2Gg9STc?=
 =?us-ascii?Q?m3W+ajws+sjGTyqM4ock/wYX5JbbfgBHKME5RW12r7fCdZMrmLp+TFXHcksX?=
 =?us-ascii?Q?3UmFa1uPfdNH+s6I/TN1FVj5GQUO2+RcTtmLdFvDVeessaxkCbp0W9CQStMB?=
 =?us-ascii?Q?7OZ6tsAk+6BrmeBL71O+y8xjbuYXPJ1BQNxqepfnlXb271kP4saXzklpvbSU?=
 =?us-ascii?Q?4JNFbn0smAdzbvwJrDFsyaCs2zoIrDXwltjzmOSZUHTMAt7oHk8rXDmPVmbE?=
 =?us-ascii?Q?8jli8A3g+VsZClTHfkq0VK7c9kZfzDTzJx4VFsCfmpuGSetREVS9V359Qv1r?=
 =?us-ascii?Q?ICnj3MTuECs+u+0jfZvVlgEesQcUadYnar3uMIy/rK7nfF2L5NSRXHJ7AdQX?=
 =?us-ascii?Q?eLbnN/Tm20tK+9qnGnNYZhyvk8JSAEpp14pmQzFaJkbUPhccu/M93dPC5YEG?=
 =?us-ascii?Q?BZjEsswhqVZBwJ5BzC+shu7OT7DkmyElgT9JmtXU1Z2DN+HIZULBCqr51Q/U?=
 =?us-ascii?Q?kOke51oH2WrbAeiVDtGopOuWScPXyLQfSccYhbS8oFZA01QSACnk/gOpe0+P?=
 =?us-ascii?Q?LVsmKxQD07vg5BliCsWySCkBvpxvOVU4yxz9/e/awi1zKO/sAuwWc86BuvvS?=
 =?us-ascii?Q?LAN0YW9lS2cP6aUfDlj7RdCMMW63ZUCcKB7wTddu0fCDNZ+OVebJ8CGsy8AO?=
 =?us-ascii?Q?6LjUIDpKmlKNa2WvnL3h/O99AL1s8hDfCGz/qqbPw5YtrpFjza7eawVq/Pql?=
 =?us-ascii?Q?q85Um8iPlBO9eqHxGP/eWE966PaqmMVaTVy0Wrx2P1gUkfW/OdlpQabQmDSU?=
 =?us-ascii?Q?hQSRW4yHObR/3aJ13Q8BFHS2WpJZsRXqrYyYcAmpPqBN7mWgb6aSmdoe9mY3?=
 =?us-ascii?Q?karL0+Ibw/eADjqjFjxsBpfLGUqO5+yUlz6U+OUhHEVj4JCj5AAPAbQomRta?=
 =?us-ascii?Q?EjkbyCnlxVOGDmYUJUShXhKgiNdhsRr++ZzcLmCMMVBjQA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aKRMU6upEJlioa+hqxzBf+uBvK98MY5mIjyVgfLpQatvWgTpxhu7P2DJcTOU?=
 =?us-ascii?Q?FBMHj1AdVLjLBe4bJGYS0q6X9pkVyZQegJCPMgVt4yPlVIfTyAp6wFhN/N1y?=
 =?us-ascii?Q?w1dYRubIqX9Ata1PNbpsu50Ru7Ytg/CZ+kQepIXPoikem26Q9EWW/UId0jOR?=
 =?us-ascii?Q?IqJHttVZPeZMzwF9m4T1M98BnwYodpsu778HKPdT7eB53URi1I0xAm/RKFwe?=
 =?us-ascii?Q?/yNJIbxgcParrfi6mxEpIhetNaYCNc8NYf5kkhi5w+6qcZ4qS1CFH52E5A+a?=
 =?us-ascii?Q?s+TK1Xs8cI40zuERZU9MWFd59dH2IunTar1DkPHf3FAD0XQisKbW79BZH8N8?=
 =?us-ascii?Q?6qohO7I2P5L8b0ZCizUQTJb1Y+rftnOc/StNyKqY0TwL79iNTmmOOf8v+COI?=
 =?us-ascii?Q?QXgeFocPU5Icf2HjbKwV+skhAemhgH+Nt45noRoBkI7fEqmGXGJbQYobPPJZ?=
 =?us-ascii?Q?SewSxxP6ThdO1dTU9ixM+4u1aFBkVxaEchQYbwHDH/1V8P26u+15R5ZTa0Gv?=
 =?us-ascii?Q?pLxut6E/c75MceF8t4QgdPYEv/1EShRqbgbyzV2cG/ntTCVsfiekQgvhLQN3?=
 =?us-ascii?Q?8VnnJCw9mqx9e1ehc7b6aDvhsEXKZZ013v6BHPdsJEQwmj6tXjcSlB3wjs2K?=
 =?us-ascii?Q?Ymx9JsoJ8ZSxGXylg5UTtDUfUYhkleuMG0b2vworGpqG2sDBBVzz/c1aAIlQ?=
 =?us-ascii?Q?ZKR7rCDUyV/AjZs2g2S6IzortysFiXNCduYiJiZrn62rb6eXtqf5rjw9ZtIn?=
 =?us-ascii?Q?9mdOn9+gGghJklA0GQIewuaw3+Nj7wLuNea4PU+/StSLUDj6kmo9vtrp8oEf?=
 =?us-ascii?Q?vcKJtz8RaX65zMTpdoohghm9BuFshft/nY+yZHsQyJoNpiNzlVen0MrKuvGX?=
 =?us-ascii?Q?35KMS7c2UgvlsdUrOumonxX1HxIzesAXWyxHbC2F1ceThbOiLEp1xm5i51YE?=
 =?us-ascii?Q?nQKKrGoxyCG+JEjVoRc7nindd5LToSpGZuOE/+iHQ1xTtch3X4mTJ30i7y+E?=
 =?us-ascii?Q?U6MXdd2Hy9SiwQW3xB5xiZxwcTTwRDP1ZguQVeNdYllUUR4Lo2cMYopfcPo1?=
 =?us-ascii?Q?84cpY62omnWhzXiiZ+OWG80poZ68sn8AqiyGojA12inJKyHG5Fp/AWFIxUji?=
 =?us-ascii?Q?jL0RGX2ZczaA0oeHHm/GladMiRdPHJM5M+lVwhUyRd0LnHdcv0lB+wxCFAJN?=
 =?us-ascii?Q?SjhIH/6AQESG/gIVj4h1kh0QLeTQSZY+dejHoUEZ6p5hIlMQDfHmMwti1Tgc?=
 =?us-ascii?Q?/F3FfkfXYO37j626t7pY6qdM4lo8ABlzA75J6bRcil9MM2GuadsDr4g8Lf+Y?=
 =?us-ascii?Q?0lVnfN1EoQ93WG84YLsCsQdJbHzyxKMsng9c2T/Itx9BgI0oOHQrxytZo5HZ?=
 =?us-ascii?Q?fzVEK6SsHa03ex81NNha367PHkoNANqP4R3zFZB4cBN55WqEzDqCAOqmlPjM?=
 =?us-ascii?Q?SGUZU95qskLqcikelHlL4JCLZ8apTDKVtzlFVDmCTvs32hRb+J6/ffyiC23v?=
 =?us-ascii?Q?Dr+6CePVnINZyzg0uqUYlGwjQFZSJdtAKLIVC2qrjktw/Elq/xXCA+roJyWW?=
 =?us-ascii?Q?fyJ8HGtETTh6NGsN0zyM5EgBth1tYYd6QyKq7ELA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f11694-ffc2-4721-d877-08dc78a4627d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 08:11:00.5227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QwmKWD5dbraOEJFdo49fkiXzADfHiFPD1crKBMo1mF97MtixVY0YtEtgbNp8klN7F/C2neRjEd8J4Liy5awrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
X-Proofpoint-GUID: _jxAD4nf4yYjRB8cbsCy7zqP1mnpkS2B
X-Proofpoint-ORIG-GUID: _jxAD4nf4yYjRB8cbsCy7zqP1mnpkS2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199558

From: Chen Qi <Qi.Chen@windriver.com>

configure.patch is rebased against the new version.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/pciutils/pciutils/configure.patch  | 13 ++++++++-----
 .../{pciutils_3.11.1.bb => pciutils_3.12.0.bb}      |  2 +-
 2 files changed, 9 insertions(+), 6 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.11.1.bb => pciutils_3.12.0.bb} (95%)

diff --git a/meta/recipes-bsp/pciutils/pciutils/configure.patch b/meta/recipes-bsp/pciutils/pciutils/configure.patch
index 5015cf4884..0ff151b8cf 100644
--- a/meta/recipes-bsp/pciutils/pciutils/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils/configure.patch
@@ -1,4 +1,4 @@
-From 561216c8cbc280aaa9aecf30cb11835a4a0a78ed Mon Sep 17 00:00:00 2001
+From 6af07e1f812b2444d33ce199308c87e04b2f5dc7 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <rpurdie@linux.intel.com>
 Date: Wed, 31 Dec 2008 17:20:38 +0000
 Subject: [PATCH] pciutils: Upgarde 2.2.4 -> 3.0.3
@@ -23,20 +23,20 @@ Upstream-Status: Inappropriate [embedded specific]
  2 files changed, 11 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index aaec04e..9c1dab0 100644
+index be23593..aa13be5 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -123,7 +123,7 @@ pcilmr$(EXEEXT): pcilmr.o $(LMROBJS) $(COMMON) lib/$(PCIIMPLIB)
  pcilmr.o: pcilmr.c $(LMRINC)
  
  %$(EXEEXT): %.o
--	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
-+	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) $(LDLIBS) -o $@
+-	$(CC) $(CFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
++	$(CC) $(CFLAGS) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) $(LDLIBS) -o $@
  
  ifdef PCI_OS_WINDOWS
  comma := ,
 diff --git a/lib/configure b/lib/configure
-index 3df057a..c87e71c 100755
+index d02160b..52c1eee 100755
 --- a/lib/configure
 +++ b/lib/configure
 @@ -9,6 +9,10 @@ echo_n() {
@@ -88,3 +88,6 @@ index 3df057a..c87e71c 100755
  c=config.h
  m=config.mk
  echo >$c '#define PCI_CONFIG_H'
+-- 
+2.42.0
+
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.12.0.bb
similarity index 95%
rename from meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.12.0.bb
index 044074ccc3..480a338696 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.12.0.bb
@@ -14,7 +14,7 @@ DEPENDS = "zlib kmod make-native"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[sha256sum] = "3f472ad864473de5ba17f765cc96ef5f33e1b730918d3adda6f945a2a9290df4"
+SRC_URI[sha256sum] = "f185d116d5ff99b797497efce8f19f1ee8ccc5a668b97a159e3d13472f674154"
 
 inherit multilib_header pkgconfig update-alternatives
 
-- 
2.34.1


