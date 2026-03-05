Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9450F513EB
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 23:23:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57745.1772753029068398412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 15:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ff+RoPy8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75246fed85=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625MQ9H42588564
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 15:23:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=BjATmfJ0h/x7VaBg4ZWbVhfXjT/O6HkrIgaRmoPhogw=; b=Ff+RoPy8c/m2
	M/AUQaB27774Cm3DLhI8ECXhi2bTh70MxQvZTNkqNrRvE5VeLj5AqtDRQyb9eV9n
	uYGaP5hbpBYP/LPuiM1eBlm36I9k9LuYFvHo7IWVljTU4adqVzo+rt1enGwgofV7
	z2kzZ/w0asZeq56/3uu9Y35ff1y1Ph7UqVovkuqrWO2k5gH1QCqhEkD+CfuIHtM7
	ymiWCcEza60c8BaczHj0dmQneA67ph4mwslom43IKBZJZOV/ehErWyLZsfNhbHFw
	22QNERuk6/YrWRkcwXCXkqPUuDjA0nWmXGG8Q4cSBsp1b0CT9EVHum3jZZJWJddP
	zY8kXWxHtA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012057.outbound.protection.outlook.com [52.101.53.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cm0rgpp3v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 15:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xobox0auxDc3meLx9eC4yv9D7tZNYgpF56Cc3U6B0T4TNDV4QCDb2JC7nH2DlOPWG3RomCWc7JTSW4n5zi+lPDy7TKe5rKRyyPvjWwyvcR4LbejjWJMwGsv9F09vg65wM38i/QYh/vWBQ2/L3SNGm//kzia03744qNLePoHV52Afki1g+7/jYdvJusOsXphCL+tbqC/kuZP+iLChrIBUi50KHP93Wfs5+td95N4QkJAYdaKrUoIVGbbcktrpm0HsoTapxY1Y/f4gdZXDo1Fsf20Wu2xehr+dcfjN6sW1wnIvwm5uOuE20EX4MLW5KT80IGCWfDoC9Uz15TC23SKQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjATmfJ0h/x7VaBg4ZWbVhfXjT/O6HkrIgaRmoPhogw=;
 b=Glir/iXo8F9oos9RP87WOD2N1Zl9IDOQJZfNuAiFI7mjsjJtFAndKOBKwtzsbgwlBAj1/4aAT8+feRVhBjkwcpZqHSOfKUEY+pwwr+ijMVUFPY2/MUmv6NK/90MZnrxqYDIF5m/NhBwdigZINBcCKQcssGOw5DWXV4aS3crOt4heXCFJrGyGFtweG5me6GfsL/++UBYVgOl1fScaqNTX+wAx2kLaYvQAAYmGDmoRFKsdi08F01skM4FXDz4SIUjz6eCOMmw+YsngEPtkWd/Qff9TM4xGxBPX9XxoRwje4h4sWS5Hm2/41UR0vJ8n6jIz6bpRCDKNM+dGZUDWILpzxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.17; Thu, 5 Mar 2026 23:23:45 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 23:23:45 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] libksba: upgrade 1.6.7 -> 1.6.8
Date: Fri,  6 Mar 2026 07:23:27 +0800
Message-Id: <20260305232327.449180-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305232327.449180-1-yi.zhao@windriver.com>
References: <20260305232327.449180-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0173.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ca::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 176dd412-3255-49cd-622f-08de7b0e3f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xH+PXcyQW1R/rVw6fSg+DDjVpSb9+Dq+Q2iw3XVKy4XX2titiUUDjlyp909gkzQYyf1IsumYCipkAu0dTWgYFrP9Duj2aE60L5uGbZzvVAwXjKGOk7kJQM/MZBrlon+4gQKlJsKSDHAWqa1CYLTYdEW5lU4DHnpVThEYtANhCtcdfO6xtZx63BFp1jsCEJKs/a03FKIMty4qipi1xjtCn6QEsYvax6LDxaKK/ftEE0tR1va6YwC07oNLA5kbCME9Z6IkRcScDcgILgfBd/mMDubX/U++2irOLRQZWwtf0dQFYKMtk9Can+yTRqn73vJ3yzIQOfdrUQC2jct2Pb/sUR0KoDd2Pw/+DHT3X2E+sYx73A2edVjFt4rWJ9Oh91/Sa5q4BAROR294+B4Z2SIhN/ImyAkbnfSqb7eYL8u2s2e3iq5V2APeZPHnrRwWPxTEUHsR4CN7H+5QaWsE76OqxByWzCn1iR0kF93fnuf1OdRuKqDdyYUfnoE9yYAPojWVo7NHdo5GkACiQcUEGGVW7sX4vPjgqB6htBrh647SySFo2sLrI8zrkhXoAOtchz+1niaCxexLQX8vVnsY6lQrP0baoeSdKfOPltvG4SETD+zGI7cPE6VUpMJE2VeT5Ddb+YkI1KjEz8kk2m/s0sP75jMsYwTikASje4I1kgqcyP096q4SgHCfofRLr50nEkpf6esRkQfVtQz+ejiSeJxPFYDZQbDwQyacdpHH/BRdYPuD/zFB6FvHAfDe+lB1kNXpzf7SUaVA6AELvBECEEoUDBetHcSDRsaMJoOBrF5Uic4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qZ4x8mjjT53k3+JMkvG4mO/prALyARFwgW0JhVXB5eo3UplZoy5aQ+bZAQda?=
 =?us-ascii?Q?Qj5+glMOdLL6fx9OospfctvAM2FHpTdq8T96F47SzIrY9q01ZpyDHj9cjnSw?=
 =?us-ascii?Q?5lEWHpQaHrDDYz/AsenPd22KYWAcwaw4Mjj0Xqg/zDX5LuadZyDLadqQgU4e?=
 =?us-ascii?Q?OKZqsR0sdJeLpzI6ElIcDqm9syXYnsd/KqndUa+buMhBeYEIB5yNhDBqwLLQ?=
 =?us-ascii?Q?HVaZjZPchJfPTubJZ4KNwrQC5bE2vXUuXhXydE3pREjGHGikgTRD175g2Ifa?=
 =?us-ascii?Q?xN8agXPLtOwtff3xD/hCPxdUORwyd2LknwAIpvEADX99+LNrbV2Q2eZOaEvL?=
 =?us-ascii?Q?/SlX90sfwl8XeAoS2o9qsH96RQFgmUFSaX7jnn52DSedpEpyK2v5FN9xeSe3?=
 =?us-ascii?Q?u/Ep735blbX92GuEK3H09nrufDWHUwl3UWJ/jIDeJEyo7nz8f2FzAYrhVOHx?=
 =?us-ascii?Q?+IXkU069wMKTwPKrFxe4NtHtZUImWh3EBmniG2k87h685PVHmYCi0cN1TtKb?=
 =?us-ascii?Q?irHRXjUlT+vdhZEfxedWBPcjOpiKaQ1Bid63YBb6RcXOjy7JeB5H6m4gq/aQ?=
 =?us-ascii?Q?uWVeFw9wdPVteFW1QjqpklyseJyqDbdzcBfZVhW9POwD3+cyqufhmvivq51S?=
 =?us-ascii?Q?N+SIKUvvISNjIpv59oiru1eUvP0hBxBFa6dRQH3OJpeUl1pXR+kQcgiWyowE?=
 =?us-ascii?Q?wg9mmCuTmiHXCYTDQOpng36SzgUbBcPgbjojzkfiQHlRocU1Rxa0YFlQc464?=
 =?us-ascii?Q?KgG2kwXKlIAmt/UTgWZtdAV+jie41usDbxfrEzEIGxeq75EdZhuyBCTAvedx?=
 =?us-ascii?Q?WjYVe0Pik/rxDzy9ieTndlmrU1iMK2ugRSNSFQ7dot/fZSoKassFV+/jJUxu?=
 =?us-ascii?Q?SgljHFigzSR2mIyqd27oZsvZzA/vZowTlLNHIzF8nGuX+CaW2zN/WbAB9Z5s?=
 =?us-ascii?Q?0sPa71NzvzLJE2qM0Vgspt42tupQcDt9AO/aNjxCqdZC7qpiv4XaJ0+zDC1q?=
 =?us-ascii?Q?jdRIogD2VKJVlJnUw7Z0fu8LXDBzzTgNSEFm29uDCu35cO9a4t3JKVeAIhvT?=
 =?us-ascii?Q?ml2uVt/Nq5n4dXPUeh8e9eOnbBrwUJ0/JT6ekSgAYnxIy7bqdfQhzU+saOLb?=
 =?us-ascii?Q?kPdmuTyj9A74Fv3M1THNgoT1YGXAgIEkplQgCA23TKbWz3TPAq8uUMaRN1kZ?=
 =?us-ascii?Q?SI8sCCueB61cBwkF3ef7IJxqkjs/zZJ1M2b/uXbHe2FGbiwVOCHh4IVYjDy8?=
 =?us-ascii?Q?ZnTOGgRm05dbfefLOyWvK1Z3sW2FPkAIx18XdOwKz7iZcEJS3zbpfVAsbdjO?=
 =?us-ascii?Q?pETcDjolFppKKoTz1rg1j+Gt9tT6rF7DNfOuVr0BWMzdg4/vsL+BdLdpX9IH?=
 =?us-ascii?Q?fpA5/TyZQEGq16VIb30juMjvONmiXaxVlGIBHPyZqpL/RanPaHZMO4q4Cgfz?=
 =?us-ascii?Q?4bVLbjZQH/uhKeEGjmIsThb2yUitvfWOiB0O8QRuuFvs+XcZNjStD1Jk0ILX?=
 =?us-ascii?Q?hZuAm3FnFao5fmm48Oc6itQCb5URVczLIGbf8xxFL5vbPdFfHiny4bdb5/XK?=
 =?us-ascii?Q?BYuEcSvcW46JcVwWyy4LSLeyyPAoBJR4HCrkkRVxTO2Ps6qsgfx4pEok0ooR?=
 =?us-ascii?Q?cfl2zrBmXEaWn+fqa07LqMLAW6oHdo3nCDddDaKS+VdHef2g6WVOVEHtn+J+?=
 =?us-ascii?Q?ckBnYaRbnH/z4SxDxLZ8c6tanPjTiPIZT8VonCb0hPQZMecGIB30OPSJQ5sA?=
 =?us-ascii?Q?ACzs1gqUCQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176dd412-3255-49cd-622f-08de7b0e3f15
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 23:23:45.4255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60IT19RFeFskyAqGjl2ahwvQ7hIi6dlu5FoF8/hmfyuLFsEbauJ84X2zQQkVB+wf2BJYbCvZ3OcYThqFdS4Ssw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
X-Proofpoint-GUID: UdwZI-541nladaNym3SDLHp3NJbnd3K9
X-Authority-Analysis: v=2.4 cv=Of+VzxTY c=1 sm=1 tr=0 ts=69aa1084 cx=c_pps
 a=tGmZTgOEbyl7bSJKA46FEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=m3KDTYARNPNk4brXedgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: UdwZI-541nladaNym3SDLHp3NJbnd3K9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDIwMiBTYWx0ZWRfX9qYEPhgR2zr6
 oiiSCt33lSLI8+m8y3ZbbvzAN2r0MQo9csIWq8qeCP/8JFgSqRh5LeRJaRTo+yKVm3C/RU7RIoS
 SFSql4azkItcBSVamBQRTaWNOWyHTSHbPbd6Gv6H1fIs2ofxaZ15++EcQ3pXX0i9rFVNyvgqmGZ
 eFHuCsXjlj66uSIgC2y1oT2OP4ABHdlEXMN/5kgU+f8fkfRqArkl16nfheEXtbBHdqCArdpX2sf
 atyt0sEop/cGrfivZpk6xwXJR25SnKMMIf3EnHRoPPEuZCaWJI1yH2VxZRoxrZlL5+Fur/c+mA3
 kai5/Vr4W8naXUcjW4mNX4gIL29UviRNFIsYSHshUdWcNCAAy6N9zFS+EEDG6qTEwvTF+pT8H8Q
 SlYqLa99F8HWbP1i8dPm2Gmb6r/B518NIDTZ3iuGJqpklkpavMws3tUtmsYgOntIldTq//bndn6
 8cJz8GcjEtIx4RavI3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050202
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232527

ChangeLog:
https://github.com/gpg/libksba/blob/libksba-1.6.8/NEWS

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libksba/libksba/ksba-add-pkgconfig-support.patch        | 6 +++---
 .../libksba/{libksba_1.6.7.bb => libksba_1.6.8.bb}          | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libksba/{libksba_1.6.7.bb => libksba_1.6.8.bb} (95%)

diff --git a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
index 468fbd76f8..ef9066cd1f 100644
--- a/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
+++ b/meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
@@ -1,4 +1,4 @@
-From 46c0582d1087220e9404a14a851085b8f29773c4 Mon Sep 17 00:00:00 2001
+From 929f7670a6c1e9450f239ee374bb34ac13c13592 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 3 Dec 2012 18:17:31 +0800
 Subject: [PATCH] libksba: add pkgconfig support
@@ -15,7 +15,7 @@ Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
  1 file changed, 5 insertions(+), 88 deletions(-)
 
 diff --git a/src/ksba.m4 b/src/ksba.m4
-index 80f0d38..8f8761a 100644
+index 835cacb..bc729a9 100644
 --- a/src/ksba.m4
 +++ b/src/ksba.m4
 @@ -107,39 +107,7 @@ dnl this features allows to prevent build against newer versions of libksba
@@ -45,7 +45,7 @@ index 80f0d38..8f8761a 100644
 -  fi
 -
 -  use_gpgrt_config=""
--  if test x"$GPGRT_CONFIG" != x -a "$GPGRT_CONFIG" != "no"; then
+-  if test x"$GPGRT_CONFIG" != x && test "$GPGRT_CONFIG" != "no"; then
 -    if $GPGRT_CONFIG ksba --exists; then
 -      KSBA_CONFIG="$GPGRT_CONFIG ksba"
 -      AC_MSG_NOTICE([Use gpgrt-config as ksba-config])
diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes-support/libksba/libksba_1.6.8.bb
similarity index 95%
rename from meta/recipes-support/libksba/libksba_1.6.7.bb
rename to meta/recipes-support/libksba/libksba_1.6.8.bb
index 4b9e22538c..205704917e 100644
--- a/meta/recipes-support/libksba/libksba_1.6.7.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.8.bb
@@ -28,7 +28,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "cf72510b8ebb4eb6693eef765749d83677a03c79291a311040a5bfd79baab763"
+SRC_URI[sha256sum] = "0f4510f1c7a679c3545990a31479f391ad45d84e039176309d42f80cf41743f5"
 
 do_configure:prepend () {
 	# Else these could be used in preference to those in aclocal-copy
-- 
2.34.1


