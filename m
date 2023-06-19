Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A8BEB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 04:36:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1183.1687149377809617233
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 21:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=olv2bSfi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55343858d1=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J4SA2e003726
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:36:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=tzj/zDIiGr2Gw6qMpiYyh3t277oRYQNYnNPfz0vkz2o=;
 b=olv2bSfiMqo8g7GMMjcKpu5GN/ENmSuYlkSstVxD66ZMtEraaKstluQOhX3QH859J65R
 picbrGpvXf8tamM+HZBLqLMdL0g/phskspf7nvku3Mi2zSCPMrV2dbhCTiHcXTYuxwXp
 7iAnd9jBDnJ0QFCox1G+2IqAuLiOs+7/eMdoST33Myjd2FnoFUu383KvE2iMcOSRu9+0
 B7g6vClMJkAdCcmmA06ScTNVUzWKZP6XinEzpNS03uM4ufOlMfubjnTrL+vXKYEX+kby
 KKBmMakY6Nb2z3qfmUwqJ4rIViELPrg8mKhRYDXIuhaF8HB1wFxXo46XJNfYgACjoPB0 3A== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9842s4f1-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8NCV/FutDOzWHJe8khJ3iXWc/m+MjC2h0qX8MZiJ0SQBDSbExafxaOWC+vXTk7pzxR5oQz9FGkPtinWlvwqFrY0IodJdLez6ye0TRrPrG/k8/UPdYE6mjnsPJTiLNkhE9W5mjItcGCd/StX4lqlmIJpOKxE41U21HbrRnHBPuHqNVhoJGCg5it256AYQedsfsVx8yKAAX8vi/L+NBP+ES+cCsPwbICiBOT4W9YCCX++2ewjZ0HYpcrk6pXQxAdkLmcwDscI2NvAOCDzjaJorfYTzcHKvBHa2GAz5vaZjFaCwzb9RVDpelHudC7NMvzbu39B2ILbF9RoJA94TnPXgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzj/zDIiGr2Gw6qMpiYyh3t277oRYQNYnNPfz0vkz2o=;
 b=lwtd/xZ0T5UZVFl7HcsiKDHxQ1L2ixD6eW3cItA2TGocUyukSwzERwO6xjyMUXkX8OxH8Fh93cBgZOlhUC7YjafG9Q8feeRugpBRN7t7fACDurfQrK0dEml+bh+5G8A77rdaw0/QxHA9FQpeKUn9ZSZmQT5DCGEjCPEigVzbllp+ZbzlIFY59FiVA4P+HhRknwmJXhefDljhtK5kdad2UD+ILt+s5PDfz7GHpbMDNW82vx2fV2/2k2X1AR77j3Xiw2Cn2VeH4EAFk/hN/XMbubNUqJPUgwlrIrFp++SyhslJy08Mj+u7VbQzfKVjHCecYzkS91YYflSg92SAKp+tGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 04:36:14 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 04:36:14 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 4/4] unzip: remove hardcoded LARGE_FILE_SUPPORT
Date: Mon, 19 Jun 2023 12:35:56 +0800
Message-Id: <20230619043556.3432048-4-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619043556.3432048-1-Qi.Chen@windriver.com>
References: <20230619043556.3432048-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:405::17)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 291b8fea-d4a7-4fd3-0c89-08db707eb6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NPAvhV6SdWuNrDXFMVNVKnMp3H3rx8ajuVqmVrC0WP/3abQP01ZRIgiqUSCmOp097IRerZCwnwpTDLpePIt21FLv1yxOcTJoPz5Mv5ZVeNnDcm0nF+CMLefBdhz/vQgi+kCkwr/RaAat8NWAbeaoOWzWF/WTASGfn767WMUCT+ieDhaTWNmzf+1ZLAfj3RVLG84lYSlQUGKsqNmauakqwqWYL3lhF8kt+AXpBKvJuMYm/C3Vw3xWuouZtsEwc+RRUOIQBeony87yJ1LwYxq2hopKVcpmA8xu9+8h2WitSHPJ8C1q93gFEeQX0nbogY+6PqYUff9YYa/v53T7LDVtzDHLzVpC8lCSsR0+SAGus846DUiCtbKXqNtzKn5IFuBaL//LT6DqeFSFnrfEK3jtz608BS/Q2+ecqbZv3i+yaW0uk+/BlYRMxHmolEsLsCNZlDaMM2rF0zz7zFgVXL//MMXpmjd4SK2987OfXeVxoHQLkpElQicDXKrRPMMa8sgSf3oamkzM1VmRVgj+3qixoTUS5GuoAPFwwau/2fecHn7dTCPNFROPbCg/D2qcqtKdOec9EfxpODIbLOa+/YeaA/bcyNBMavqYq1DCdys24ZfzuMWdnyofNUNtFgnHSQu5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39840400004)(366004)(396003)(136003)(376002)(451199021)(186003)(6512007)(26005)(9686003)(1076003)(6506007)(2616005)(83380400001)(38350700002)(38100700002)(478600001)(41300700001)(66556008)(66476007)(6916009)(66946007)(36756003)(8676002)(316002)(8936002)(4744005)(52116002)(6486002)(86362001)(6666004)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eupAKbmy5NkrglPavlOzT0s4wCLkRu3ACJUxSo42mJvGJKBefVnKu5RyeoQe?=
 =?us-ascii?Q?vx4gizgJB8nDL7y7ZFtn69h9zm+Av6DoFIylCxIvxqvFg1YAsEjKDZ7+yYpP?=
 =?us-ascii?Q?q/CvRDJH3dt7Nf3/tswifX5ZKFZT4kcu0u35QZ+YLMjpB+Ikb0xwWrxotMjx?=
 =?us-ascii?Q?uZon0EDE2P4WNvnwFtKli6PBC1bRhqNtdhsl4UkRGFmD4ZCdItXn8Jaip+5S?=
 =?us-ascii?Q?0v5ZmHwP2f60rzSp7atZL/5MVEAo1gSiYhOrhDja3/DlGcfnqLAPPcu+pyCt?=
 =?us-ascii?Q?0ENwpp6n+K12zbIqjHyUfE69fVpIHbkDldqwfoomUvd39jZ6F6b0s+biSesK?=
 =?us-ascii?Q?u+rkJxOPrSUk4N46bRHq6VB/YoaLGrM1Qghx8vbyObNBvmwFGaE79SaOzNB3?=
 =?us-ascii?Q?b+gIiySy8/qYEAEMPWu70F+uyRhMfbENYpSokMbUOXbInIOpAMy3qAnTPDio?=
 =?us-ascii?Q?Kqe/Dn8J4cS28/Qwu69StcbnGscJgIqdKEfuJoLF7YYXUHugIq4sKrP0sBBR?=
 =?us-ascii?Q?dz5jaG6dP4mNtQkhi4V/q+pltlOyyXUP3TV1XjWXjiDSiTUfj+SGeTdtlNXc?=
 =?us-ascii?Q?IheCDUUXt95h6yU/UL9X2kFAY1oP5ynL1iUq9g2Owj5l7BZYDK/yZv0nQYzu?=
 =?us-ascii?Q?KwaYBernMXUgKzY8O9kybCGJWw8CjDn9lbxGB8wqO0zJy1zKfHlWQJoi4yAO?=
 =?us-ascii?Q?QnQmLFUo1R1n5yHEIPfG5PMihglHMVCbCKfqRhRyIdTnQv4xXGEsrHwIZoyo?=
 =?us-ascii?Q?gV9npp8QOEaLauIUwD7+HWCt1njZkXz7L1w3c/6wJQgqQQqW3ZWDa/vi2Rr/?=
 =?us-ascii?Q?k5z6aMGRituZ6py4KN556e42va3f5+ZlPe8pyL6g1QBRzTqkB5sFqvKGnm38?=
 =?us-ascii?Q?VwPdX8LyLxoZ0UFowHUGBKeXQqpEDfIRBnm7k1ZNTCWWz9t6q52DjBPBrFQ4?=
 =?us-ascii?Q?/5KPKtUJw03DlYe+Dcd3omqxEMJO6oMVzuOcll1JttwGuyRclL57QHSphuWV?=
 =?us-ascii?Q?pdispYOlfRUP1KlsrW7Pfhec9jIlTE89BGkRaML/dDJQwvv8vJm26Cs8Gvag?=
 =?us-ascii?Q?8vw/YBTrd1RfPnh8n3Aqp/XhGQKw9YJRR6YbLqWkqcl8dVRxuK+6BSDqDbWQ?=
 =?us-ascii?Q?UYNN9lNMFE82ug8hLTHFpVlQhaNe9315xddXijKGvK1mQmsSrWdKTblan+h5?=
 =?us-ascii?Q?uiSsBPGaxq9AvW6rT6KYqOd8JIXsDIve9HXJnzgmTJ0muxBDAiC7jKjkxmtc?=
 =?us-ascii?Q?c4OSIeYbJWjyXW83gs0ccpCHa3mDBt1RkPJH7n6AwHCbY42HAmR+zo4ewD3b?=
 =?us-ascii?Q?7c7lrwZ9c3K5VWpEXnbCQlySSPCWXkAQNJlcFLKyAXOeARJYui6dUB1UyqnE?=
 =?us-ascii?Q?xu7yEVvEuthJV4uQPrvY6HqHbgKiY4KcxzzOjVctOtgbBGZrimArvU+9uGse?=
 =?us-ascii?Q?/P+LaEuT4QQH50/CABBzzGCWGvU6vbtB95z9WAvH8U+f3qjVbxzC9Ypqxn4/?=
 =?us-ascii?Q?SRNRwrUCeH3axdwYV9jHtutEaK9pRuyxHoH2eRfOcND7RgQNTHPuo3dyaAhK?=
 =?us-ascii?Q?A3GAszxqi7eb6tuq+wzyBNSf9KXTdG7NTdeKWCE2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291b8fea-d4a7-4fd3-0c89-08db707eb6e0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 04:36:14.1669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Typkucn6yuskSBXL9gG5HvoJSwDoql0MUOWpdwe81WR1pjG0I2UHOcwQy/gZXNLQsG+7o9HfqAulX7XG9absMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
X-Proofpoint-ORIG-GUID: UQh9rhOrCByUk7bSl_WNOGaPjZ2TXYux
X-Proofpoint-GUID: UQh9rhOrCByUk7bSl_WNOGaPjZ2TXYux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_02,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=897
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 04:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183087

From: Chen Qi <Qi.Chen@windriver.com>

Now that unzip's configure can correctly do the detection even in
case of cross compilation, there's no need to use this hardcoded
LARGE_FILE_SUPPORT flag.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 391e5cd22a..3051e9b5bc 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -47,9 +47,6 @@ UPSTREAM_CHECK_REGEX = "unzip(?P<pver>(?!552).+)\.tgz"
 
 S = "${WORKDIR}/unzip60"
 
-# Enable largefile support
-CFLAGS += "-DLARGE_FILE_SUPPORT"
-
 # Makefile uses CF_NOOPT instead of CFLAGS.  We lifted the values from
 # Makefile and add CFLAGS.  Optimization will be overriden by unzip
 # configure to be -O3.
-- 
2.34.1


