Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89269C52D7B
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 14:51:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.61950.1723128681924221717
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 07:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=895026df3f=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 478Bf7qx008456
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 14:51:21 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0bshpgy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 14:51:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQzwLMu+nHbNvUVKPOpStlhIX/5z86FiLx43luu2YRtT4xezAGCImrukm8BwRSNF/cKj1XRRP/ZjxGi9skrQtsq8kChTuB9MAeUg8ysW4S7jJ9xMQpFmjXX+DEths3f7VhdcEySMTJPRLcCXBAc1KFs3BNexiEi9p0ObD1SXFREnBZgmVelQBg4/8vUF5fJf5kKEzIA9OAVgusx5XJMy2q7+2YZiRgC55OLztg8aw9hLeE/gAssb1rJEzGUMwU3/9mu7M7u/fvvSYHjiZGsMWgtcVp4JiRqH8xsYPdtCxCmFQSI8uImpzA4LXOiBWkGZ+J2CSsw65hb2j5XnPgwRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxqRG5uUtl2zG1MyRt8SRBurT/znuhRh3nloL8UZCpU=;
 b=C8o7QmGQ6Z2m95s/eynRl3vK/ahfK/7N9AcEdNuq7bDiddDbA5ZAwG7c6MfOcm4Ref3gfzz+7RVBWwYHvvpBEuD1H42NEfru9kWHHXSMxjgqk8f44k8O/Cz/9KFUc8Zard4NwLdjWSTlsOsPTM6s0xkmoIHCHb82tD1ZXW2gZpOhHepTtxkDW5kLoWVTPMSknl0NtFJLsGQX1A0TO1jc1Bd7hd8NhAuQSSYLdkXJEhFC5YWUX0d+9xCLtmFgAa1IqwugeF0l+FmB/jKnrChbHfroXxaCKkFSNsCznDpcX56IY6xwaCT+GLH2WUPXXlDXuPGLQ21v2aBiJIHMhYG6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 14:51:13 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%7]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 14:51:13 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH 3/4] openssh: Increase MaxStartups and MaxSessions
Date: Thu,  8 Aug 2024 07:50:41 -0700
Message-ID: <20240808145042.3914762-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808145042.3914762-1-Harish.Sadineni@windriver.com>
References: <20240808145042.3914762-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: ddf3b4c5-23d6-4b73-1828-08dcb7b98c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JjDcHnWtRYF33WjCi6eBUoP1SP5ImkeHjJbWxueet2bI5mukWX/vipYy87dv?=
 =?us-ascii?Q?wth0uGChqb0VH8pvq3ZbucLU+cXXTwM35jGzXmslT2hn+0wuzlQb14nmVBkJ?=
 =?us-ascii?Q?HdA9BaIj/JkJxdRqMcFjY7jmS65BQDFJKCS5N0/eHP6oD1k3B4VbEWqXnDuM?=
 =?us-ascii?Q?NP7KtCpJZMvtfQwVXLxVQklyvr4r00wCqGD8/FAYVJ5YFmQh0IQZB/6fjhmC?=
 =?us-ascii?Q?bzWbWE6Ghxz7y3tVPW9/VnSoAiYebQaVqdpucBj22y2Y1AZBtKcc1Voe0/ud?=
 =?us-ascii?Q?pXwUw4SFWinYeG24Hl2X7QoQcfg8wqNH4tHJ6xxGGvMDDXnDrupwUW8rwk14?=
 =?us-ascii?Q?7vJ9tSvLhlmgQMMt0fTPjRDyKmdC2uE/Cj2hmsEYPtHj4yy+PZG36H7eMZp7?=
 =?us-ascii?Q?HeVz7vMb8mCvl9aIkbXQDK6icZvCajPzMezeHwXTx96xkp1CO3X9M4NpiLWc?=
 =?us-ascii?Q?KFm/4+OII26SXbYDoAXa7G6ft6FHlAo0bO/jN9YojMQwjDSgqW7RfFVJAYSY?=
 =?us-ascii?Q?jvXB/WTWuAbafn24Z+Kiqc/ctgcEjDApIfm0GCPPLyl7AWdiJjMzYvJMP2fr?=
 =?us-ascii?Q?XOICpeJtgs9ICtjKhLeEzrnKtnFIiR+E1nCG8F+HoVeXyjPEcIn0SCtrteon?=
 =?us-ascii?Q?Or2YA9I5F90DkVDtEtqrpjtllAveIlyGDNi3MRvXyyIbrYUHmRo0I1ZeJWza?=
 =?us-ascii?Q?/pShucNJuA1YCt6UlLcVbTLDwtNRRwpUXt/8dXWh1VG0qxg7uAUljaq9IEhe?=
 =?us-ascii?Q?mqf+oe2J+oa0ZNNfweZ+/JnBnWQg9yeOpZj/8xB/owap+v+gYVCM7jmQ6ZGF?=
 =?us-ascii?Q?/zFC1q3S+L8X6TfCOuJDxmQmv/tTVkc5+uUQk37liwkaqcuKAKlbgpNSubtB?=
 =?us-ascii?Q?U4GMwdr0zrWwOmxbULQg9POyS38Ya9AEAXpH3/baq69XAsKGD0hsUYUX8rYL?=
 =?us-ascii?Q?FufguZ9Qx+25BfUnci43WLkIVBZbi/xDr6A8A50yFQoPm2vFNKFRihImYx4v?=
 =?us-ascii?Q?nw6Zhs/ra2DMe4nvh50/Lkfk1ZF+K4mEN5leWPh6PCOLQIJ82M3/uY1Bq04P?=
 =?us-ascii?Q?v33K7C8DkxHi0i27rXiJ/a4DzYRCQpP+oHWE7moHbNLlzF/WwPJf/CarmvYC?=
 =?us-ascii?Q?Ct9iSCTMfPsNcc67w7ilyGh6sJFSPn0prLpYsJPes3tt/8FFST7pS30uH8gv?=
 =?us-ascii?Q?5Fv0F6dcGzC8gfmC5oboYnXtcjXn61G1+TwCbvuIYlmNP4063BatoZfCm09A?=
 =?us-ascii?Q?vQcK97NDJWSNtUZwtdjrfPHHztiEjm3JNCLeyW0rRYzzd5OkWF6e5xID/FDb?=
 =?us-ascii?Q?FuB1hFLs6qQ8IxphCRznkDB327a2JAhOaOMlgQCZovvVOsm4gTDoHPbm3D8Y?=
 =?us-ascii?Q?TIdrnHBXFaBU0FvI5bYf9y2u+RrMK5J9pEjaSv9VMSxBExiJFw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pQT2HOKM4paD/77jGbQfE0Yj8QybzE3Uhs1Ot48hoLdAKKjT5hzLjCSAbVwz?=
 =?us-ascii?Q?wTNjhejQGxuXJHTk0cfNnSOeIn10LSS0MYoDe03UgaBRb0i0O0HWjDsxUIn6?=
 =?us-ascii?Q?XvVgk9oqZbJgOMh5m0zFvO091Vfhdw92vkHVQS2ah27PIRDxOUGSPNzd0vB2?=
 =?us-ascii?Q?avUJ753Voicw533DUn8pyX4edwDTAyIpZVU5Z6DA5k3yZVW71qzWFBoxy6B+?=
 =?us-ascii?Q?+RXyhstrwoulkvUvh3J3gHGJa02UlcZmXRoWIFEAzOBbNhefB8DRnX5J2YHI?=
 =?us-ascii?Q?G5YNNCs4P5SY5PkcsJCvuz6vinoCifLnZDxfFWdCLu97STv+jzNAtpcx4r85?=
 =?us-ascii?Q?VTYmNvc6tXxvMzuEG7Tb4vomJHgfhoqBROtTyOvupRyH3bbMRaQHOouKI+hB?=
 =?us-ascii?Q?wt9xquJarqsJRdWLQF9fq9d80TWVWekp94rY4yznGaJhwgp4KdPi24x0VfSI?=
 =?us-ascii?Q?oe8TgHsuUGEVifNxPSL2flbvwPCdNHbDhq/FACnddvM7OcoWzoKG3IBxJzZm?=
 =?us-ascii?Q?FUwOJz1lXQBPVVGhsUB/JtkTcfEw95ph3TFg1mu73LDpYbQDZMXC0fFScKkZ?=
 =?us-ascii?Q?h8FPep29Cj8jwBdoMi39wFuMvMhEv7SLphQqnzCJJrYzLRF2NWXQHKtJskMt?=
 =?us-ascii?Q?xLHPznGrNXwZKS07iPE5GpNu3c3mgLb3tY5fXD/8WzMHaF/MDfgEXdohod1v?=
 =?us-ascii?Q?Gf0Wfb1r033lZPEVAlOM/LyjOBp+OA93vIJmXjFsKVDnRBc7U0X4vuTq+6+6?=
 =?us-ascii?Q?WDF2vMIgGdbAsOipHY1be8MT+v29RuHpFCILqe9cdLxsAShMt2Wc1BQGxkK8?=
 =?us-ascii?Q?anYam04NIErxxJdRMdGsVHE5M7aGcJ133uvLlloFRRcs6AZ0/PL2ZfzRXWGx?=
 =?us-ascii?Q?jEPnKs2Zfd2C/mIeuC87ePsJdofZmtB26ZaUvkyBFUYlpHP6/LZO2pKEfAle?=
 =?us-ascii?Q?g9jiyb99W5wb/ujXH5uDuTgo6tyNZBo3C3XnYG4g0i28xBULg4dFDN8imY07?=
 =?us-ascii?Q?KoBO34/mw0T0tkGrxACkP94eZvNeuJdn7oddFUhse89MiZ0+MeM0KN9aBBDc?=
 =?us-ascii?Q?Zn9msaRHdI0gpcOb9h34BXa6JicBwHpSXvE0UYzQzOcoo7eVMYCjiDCPCFt4?=
 =?us-ascii?Q?kNFaL7FI7Kkeha8JiiKynNrYXM9BlPRYgxAIFiHYgux4iIndr0FhqrvGUtZi?=
 =?us-ascii?Q?QJfHqVTINNDMjNTwQh0ic/WVYvKSsNFPruUK3b0a27HsECZqlQkPsazEQrgb?=
 =?us-ascii?Q?KZbkVRwcKWles8iPl+ddiAQOxthMFF221Pgvd/KDVIfD/tmGJIB5gnbN/EWe?=
 =?us-ascii?Q?qwtvL85vn7+TOhMf5cNMX3NTa0d70RWPcpN2CpPdDzs6/B5Fv7bVr9AqgF1j?=
 =?us-ascii?Q?XQYv8ZN4aOzfCMVcP5YpKP3ldHfuVzyjdcnxIwRDyozgT1neX1IFMdzwzX4G?=
 =?us-ascii?Q?CvYVA96Xd/NgN0mEydjgF/NlRTE6l2CsNQl2j1oruExgSxUE5cRFnH2pgS+I?=
 =?us-ascii?Q?ZAkjxbpRD65ln07OitoH04VobFaNH8HOQE+Sg7twc1rJMl2mj+iQI5v/Z/nm?=
 =?us-ascii?Q?n+D0pBlVkU2jctaa4xFAaILkZioSs5BlmLWavoH6XJv/z1QcdYizNlL9YC0u?=
 =?us-ascii?Q?iA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf3b4c5-23d6-4b73-1828-08dcb7b98c6d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 14:51:13.3405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QTnnqP9gmM1pw9gaJbvpvk4htM2KMic+HqaP7UuUwzFVhd7ZUXZtvdmmHxm6ZutnGonKlj6zIpgpT1Q80xgQG47oh9bXW6U0qiKtuoDHuzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
X-Proofpoint-ORIG-GUID: ZZl0tKOl715W1QK2HWUAEEzis5oVnajB
X-Proofpoint-GUID: ZZl0tKOl715W1QK2HWUAEEzis5oVnajB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_15,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=890 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 14:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203141

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes the following failures:

while runnig oe-selftest for gcc, testcases that need to be run on qemu
are not running due to below failures:
- kex_exchange_identification: read: Connection reset by peer^M
   Connection reset by 192.168.7.2 port 22^M
   ERROR: Couldn't create remote directory /tmp/runtest.3549814 on ssh
To resolve kex exchange identification error increased the MaxStartups.

while running oe-selftest for gcc, with allowing multiple ssh sessions
some testcases are failing due to below failures:
-mux_client_request_session: session request failed: Session open refused by peer
 Host key verification failed.
 ERROR: Couldn't create remote directory /tmp/runtest.3658735 on linux-ssh

To resolve mux_client_request_session request failures increased
MaxSessions.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-connectivity/openssh/openssh/sshd_config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_config b/meta/recipes-connectivity/openssh/openssh/sshd_config
index e9eaf93157..37ffe28142 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_config
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_config
@@ -34,7 +34,7 @@ Include /etc/ssh/sshd_config.d/*.conf
 #PermitRootLogin prohibit-password
 #StrictModes yes
 #MaxAuthTries 6
-#MaxSessions 10
+MaxSessions 1000
 
 #PubkeyAuthentication yes
 
@@ -100,7 +100,7 @@ ClientAliveInterval 15
 ClientAliveCountMax 4
 #UseDNS no
 #PidFile /var/run/sshd.pid
-#MaxStartups 10:30:100
+MaxStartups 75:30:100
 #PermitTunnel no
 #ChrootDirectory none
 #VersionAddendum none
-- 
2.43.0


