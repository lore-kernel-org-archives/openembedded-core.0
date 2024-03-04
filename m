Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97422C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 07:20:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.93083.1709536845292114275
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 23:20:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iKajuTRj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=379381f229=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4246mC00030032
	for <openembedded-core@lists.openembedded.org>; Sun, 3 Mar 2024 23:20:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=dhcngsiCCMdB2oIEKp
	ALrOJuKT1dKHVyD0AVnMG0fHg=; b=iKajuTRjMCRDPGTixsFv14vA46Bz9vfCLL
	kq8RnaDgugYg29hy3W01m82NyHvCGQ0q1moVLEEpCoZK0NOcuWMfeYmcV1AbX6th
	J542EuNZgiQ1px1Pksm9PkKoJXB/YyYB0fJbHZzlv3T4beoLE8q1wIf41AI8Rfwx
	+T7k6Yq9uWBRfQG39uuq8HT0x7d+sI3AJUeSCI3PhLLb4Xr81oR0c6AOBm//MPEZ
	azYKtuhq388XRbcxucWZo6YYC00hYlc/DKvrBEf/ScKIG95HHToUISvxDdIBkXLA
	/+ut9b/jxGxo+P111M5/B3CmR0dwVcKovPtfQoL+LMyHY5zqFVFQ==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm1664-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 23:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRdWSmgN+q7Wwy0Z2oJ44jczUT1gabolI/0TS13e7oyFEJ2L/XQyWC24vdw/TxTv4exIFB3T9OPrBqV1lp02TdxpyelDWfze/OUC9PDgJn0s6jmshHW0gb7RPkskP56/ID0GBGzAXYdO00kPEdyueB/1D1dI84oRwq5GtyUp2y4gFRWDQF0kZBHBdiWTwH6x8cLBhdERIH2YGVTofNxTzbU6/2f9sNq5fcRJ3AKH6IZHs/P0SBn2GERpgSMZ/ufBdSAx/JI67mlXZpjSRJuPeGbr26z0EZF9ZbM/BXEdvX08cKOTCIUBseqIMqosFoqgCNR4Wceh83Yg/b9ZGOGtDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhcngsiCCMdB2oIEKpALrOJuKT1dKHVyD0AVnMG0fHg=;
 b=aZKI5UC2adnUoH6IRrrFk0+qxmPE63GA85TqpwPaS1vJh3M3EFmqgTSBXH4KZtLob155Lde3xvXTCei54smQjFPin0s+qEYfQl576t51n2ud9woRXIQ2iN44fXP/u2hMTk3BOfENnxlyV4g7QwTexYM79qLeVWtGwZTDLFUDB91XglXp7tfxSNulKVbYJt152dokpes/Dc/7MtoOlNSqsfqy2R5zsd5FX8hDaz6Hj36OAUSIINRt3e6+x++KYLzrp+6llrG8yIgJx6KUniet+XFAs98NEP/KbBho9g2Fki8uIKfAwBrAtxuYleiak0JUto4BeJ2dAp4SeIcdAjSUtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by PH0PR11MB7422.namprd11.prod.outlook.com (2603:10b6:510:285::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 07:20:42 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 07:20:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] expat: upgrdae 2.6.0 -> 2.6.1
Date: Mon,  4 Mar 2024 15:20:30 +0800
Message-Id: <20240304072030.381063-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::35)
 To DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|PH0PR11MB7422:EE_
X-MS-Office365-Filtering-Correlation-Id: ad21f112-0b1f-4e3b-ca5d-08dc3c1b99d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GKdIfhjQkm1pKKFBbT6MlCmwzj+P6/rr+eZ6mFSaWm57EPuY+Au3/vCWlFuV9JS/Fta1f6WryJTWMePwuCKfGSpBZuu//i+GKPglJbXmybqL5YLa4i/GVEkGsHop61aE6B7vDhUrTqYOmMBtY8mFGxM6W9MTTUE4QpM22ns3MTVT/kgN/ZKN5q+w16fbbZEDqN+KHaC819uhNeCzzKWmvgyFA8jMqcAfYc0iMkGLbgWAyHZcaG8RPGm1E2DcWsy8SpeLzkU8+Chde72mN1BKisBUi1qJu2bSh56x6+1lDlCNoQ+r42/AYiKt95YzObKGw/Z1+f3TYN8mqOJZrnktk0cODsunVuOu4oGV5n0O6ZnmQKYxdGsU+3uEhPJWGDVhF7DzJqfbaBEZVMoQRxZJjsPF62d4+3j+StqVdtLE6/gDt1suSYBywAcxItpmgSca3Dy8+1LuzxW6Ch96HOES1gO/qW9zWVtipzv/xBl/WNm+IzbZGxrxrJvH0EtFC6+o0n8FgQRsshntMloaUmT85gTODcsrQE2bBfwRbKJ4DgJYO1ZRO5e3JXPZMyGwpzVjWQv0ux0MhBSrb/ciXtTu+XdW8j2ZiA3hg7Ye62b+2LG2nuT+T1ZOoU31RDCpLiKPWMrg5Y62YQX8+Wkk4ypv4mS5UpY69Yf03s3XaBh5XTtJeBVWeFmMjT8gtKP3+2YV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VPrIt776vAynjfaPi/3sUnXZC0xC810WDflgzAtHhZJ4W6Kaaoi4Mhvg5EwR?=
 =?us-ascii?Q?f3KXaMImrfchzydLD6irCd2oqCmeYV2WNlipzel+Iw3qRod9GekN4G4kjLOW?=
 =?us-ascii?Q?XoMN83woHaP/5CpDRRGwOxzAkvP+gaRG5BCbCRK1o8bO1sQ+8FUx8pom4waw?=
 =?us-ascii?Q?XC77/At9EPGTc8tNy1pF+RkJO/pYtIZuiHgfpiERGDTXwiTUvIIwVyzr00SR?=
 =?us-ascii?Q?bWUoiv3rssRJiSYoiBWPv/9t0LlL4b541gLjEvjJifeuR7xePDYMMJQBjdMe?=
 =?us-ascii?Q?86OMWZJDPsm2cht9gTA9hCCw+1ZeubpK6oGPs95znIrhHnbrpCnwmSj8Dr7e?=
 =?us-ascii?Q?IGi9fY8rTnSFb71wa5DZN58pO5XsDi7jGqMKOqPBpUsB0+C2tCJyNv9cXo47?=
 =?us-ascii?Q?rBXDRW9HYzv0Jg6eDkJzoWFFHqK4AeFAESqRkyvLD8M/eoYU6W21xNWi1cp8?=
 =?us-ascii?Q?S/erhAm2uXLYMV+XeNc1ay5cDo5YkybzOSosIFnayezeDjb+1K+ziizHReQC?=
 =?us-ascii?Q?EMnfdqKK39L2+yei9KYFrrKmqljndFHuJkJYZcp5vY9vaRFO97l/Wp90U2AL?=
 =?us-ascii?Q?qczDBVerZDRM3Qw10HQAQFbEGQAt98pCY4C7W9cToS9VvNhpTpujFUmgn0Ay?=
 =?us-ascii?Q?oPrjbou4YutKSKjUgwvVVxakcJFIJ1AsNdPDgBGbDExUYV/f1HcN6HAjxD9O?=
 =?us-ascii?Q?Lz9btCvT3aXtN/+L3WZiP+/8m/uIbFIz85BUl2EoG6EJy37gdhM3iBfHDf9c?=
 =?us-ascii?Q?hQi5uDWCa8nqH1CfcJucYa1D9vtyOzp6J6fxPsPzy7ZSZI+VHdKiRWPbmlwE?=
 =?us-ascii?Q?tVOhSCMEWbbZ0RSE9Fi++fxw1rBm1TijwfOCcAy9citNyVt8wF/o+P5qipO3?=
 =?us-ascii?Q?XObgP6ZZt/aPiTkNJu39PF8WpGMXpmjZdZcm5LkAH7tTygbt8hQmASXArbS/?=
 =?us-ascii?Q?bX1FZA8EJTNEs813xlk8vm1TLR0ENejCxpc3nlJ5WfZQw77DJDkTLv9Ov/Zf?=
 =?us-ascii?Q?tQ877nvXLAjym8weeHVd9X8NNvTewSWQs7fjTCkNqcsV7WuUdgaIAi2i+kAv?=
 =?us-ascii?Q?vAZXr2I59HEnmnKax+vLhjUJKN0cKoWQSUv4qPT7avMj2UIA5FrNctf4XU/q?=
 =?us-ascii?Q?0SkUgrP+dyIf3+gWfZ2TQWtiPhPod/1j8rmZAoXjOH/FHXogkHwY3CjrY8Vf?=
 =?us-ascii?Q?g4Gr1VHKvGTtVgSvCcvSjvTo12fc1hV260DjNGN9NzzBTXlKgvcPVWwFFoGH?=
 =?us-ascii?Q?nq/Ng6g7d3fJbcIzHCm5eRQCVvmXyRtYacq6tCwWkvo2JO1cfXyGEk/L0YIP?=
 =?us-ascii?Q?5ovH1jJd9kRSykJRHUct5qvqyRDAiDiDWg8EgcsNGL4sHdx9Uz22stj8TNhD?=
 =?us-ascii?Q?3nXvD0jHRORcG1bDxi0I3m2A5OUkJ4idMJOitNBR9yhL3W4SZZjxGN2ZTRQn?=
 =?us-ascii?Q?9VjNa029T/5U9UIrCM6m/5xD3hE0Iwf2M3KuVHHr6CNJhE4kC9xv+hnoXQmp?=
 =?us-ascii?Q?K8T1amIjXLxdaDtOig4fD36L6o5p26lZyzrw4QZNLD4SAc5L6yvYv+fPCkZd?=
 =?us-ascii?Q?Y5rLnbs7jb4cx4PFe0VSNT/NGP+Xbg7nNzoudK8i?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad21f112-0b1f-4e3b-ca5d-08dc3c1b99d8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 07:20:42.4494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5w0iSwGNgEoAlbbPh0G/jWc3ZM9Ru9zxvZ1aPV/sMA+D2V5HFGQ9Xeg2LAK6ww3yeBt+0vFg1NB9AjpLQWDvCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7422
X-Proofpoint-ORIG-GUID: q9q3lcNyi20CwZLyeVV_JBPQnSSdb3zv
X-Proofpoint-GUID: q9q3lcNyi20CwZLyeVV_JBPQnSSdb3zv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-04_03,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403040054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196590

ChangeLog:
(https://github.com/libexpat/libexpat/blob/R_2_6_1/expat/Changes)

Bug fixes:
  #817  Make tests independent of CPU speed, and thus more robust
  #828 #836  Expose billion laughs API with XML_DTD defined and
             XML_GE undefined, regression from 2.6.0

Other changes:
  #829  Hide test-only code behind new internal macro
  #833  Autotools: Reject expat_config.h.in defining SIZEOF_VOID_P
  #819  Address compiler warnings
  #832 #834  Version info bumped from 10:0:9 (libexpat*.so.1.9.0)
             to 10:1:9 (libexpat*.so.1.9.1); see https://verbump.de/
             for what these numbers do

Infrastructure:
  #818  CI: Adapt to breaking changes in clang-format

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/expat/{expat_2.6.0.bb => expat_2.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.0.bb => expat_2.6.1.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.0.bb b/meta/recipes-core/expat/expat_2.6.1.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.0.bb
rename to meta/recipes-core/expat/expat_2.6.1.bb
index 1f9f7b269a..9bdc3b6206 100644
--- a/meta/recipes-core/expat/expat_2.6.0.bb
+++ b/meta/recipes-core/expat/expat_2.6.1.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "ff60e6a6b6ce570ae012dc7b73169c7fdf4b6bf08c12ed0ec6f55736b78d85ba"
+SRC_URI[sha256sum] = "4677d957c0c6cb2a3321101944574c24113b637c7ab1cf0659a27c5babc201fd"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.25.1


