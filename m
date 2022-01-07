Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7347CC433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 09:49:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.22])
 by mx.groups.io with SMTP id smtpd.web11.4547.1641548962193911300
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 01:49:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=UktE9zcN;
 spf=pass (domain: outlook.com, ip: 40.92.89.22,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/zJBSetMjx3WG5BLFELMzG1q7D875DmCm4fnyrAtSEjf4qtkhC0rPWmGXG3EL1dhSwUwkobCcEvnGzm+c3qB+83ZDxvzJez9Wxlyx5b3jp3ReAfCiveFpRagywRBUpfqr7h53tsItF5bKHzxASMh84gOzUt+UUfhvZ/Qg/BTzZJo/Q3M7IM6WUT3V7WTagNCd+WGhJSoGxkG+/byipvfhTtzAQcZQOjqytayaQPGoDbSctLbjdnh82enQiYvYawXWdyc/kNbIjYf1QThY2o8Z1V5ODCIbAurWDadkUMn6U/dz/eoyVxsJw7EvAtiWfus9BMum+Omj0qBTgo5U39sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fGiJHNHUhjG/8k8c/mJmrMHN+3eefQ0cjgmnYjBcZ8=;
 b=R65mhD0BWLk/iygIAidCmYU/yY06W8g+8RVs733LzR+xKgM/81eRECSUymUqToSqqfp0L9m6olWGaws2XZ2An9WuahC5GaZoASSRVWm8u0cnvj4ydoFSEqMPP0dHdSIDa5S4ndNMLn+yWzbN/KUAOhdq8H1qHg2a72w+m1FlIX7korbZ6m8ht7cb1wF9Kw6PJ1BPbqfPEBpQ/GZe6Wq5z0Y2ZFL9bbVUuFqFNru9zzMq4Vc+4KZ1FZlZKvjUKTKNGym094VOvSeurtf5N5rKtcgd0NAafyY2Y1IkNb5wwJ/PxBvqkxsi8vxTzAIgLK3lGlqMKMw2WthWSpCY/FYKUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fGiJHNHUhjG/8k8c/mJmrMHN+3eefQ0cjgmnYjBcZ8=;
 b=UktE9zcNpLVqWjUuxydrDod6/wr+r+P2rxJbq1hhEd7t0fCFddscBTEzOsFezMtW6/DTzjaKx07vPqSwGMEVEFvf0kGoL0qV9087CV4NPh1eXsrTvcEBE6F5CBiIr5blq+12zQ6HsL2ml6rz5jEGgMqo72ppCy1fQdSX9CnGlAViZDqD4xvXi54dmoNu/P7VqjEZ9o3POwcwyuP7Ds54Hl1/BYqb58I4/0mjRq65mBLQ5s52AyF9UXG8/pKJLJMkQvEyS/7XWxBCQ6c0RGtYUn1zB7bz614BlW6+g4IfSUlzHtWMjU8D4cIOQC1ppUyGKV2oKEPViSjGdPJc4JRfpA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM9PR09MB4515.eurprd09.prod.outlook.com (2603:10a6:20b:282::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 09:49:20 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d3:5a56:4869:a401%3]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 09:49:20 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH][RFC] cve-check: add lockfile to task
Date: Fri,  7 Jan 2022 10:48:51 +0100
Message-ID: 
 <AM9PR09MB4642E340833111CA87F6C789A84D9@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [v8SLusy3xHkDQ4/o8h9oJfvN6vpM/CcLma0G+ZfR7qmop1dYekVomjPQDzRAglxe]
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <20220107094851.4192558-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8df4b326-a23c-456b-d660-08d9d1c2f9eb
X-MS-Exchange-SLBlob-MailProps: 
	KBSGuA5p8vCjI+JhPsSDDOSbo8lK4xzWmcLRiZoxe08RFgDr7t4NP+YdwdkqTIV3dIkuvtzXeSMnNs2vvVld4OfIp2DhhNuTEqCR/6Zag95k5R5d8ehT48d6FGAQi2VQPXnEsxDbn5IwPfxRBhBU8knuccSSyCV8eRI9C5dUSxF9dpJpqQ+AEAO15bjBIIhcEQW1tDynYIeoq1YuWMZDv/sUyzOWGlUx7LVk5Bs9E/30dVzRQ507JlTnImxjYUKxgOhRbIATLujq1rWWiSjPgPoe6w81CoCa22PUUdBg6D7qo8u/+iT4kYRobfnqMj2IE8dvULSRm6q+MEzdAhPLNSB0v7WuNO1GXokFDU+YYw+14Iqn+VaIHMGkRlPONd0zyEVXkzjfozP4nBtKhgFzssV2877rIb+I0X5ogNcysUUmd9hBSrGUSaLWhmaVYLhW49ScH24Xo5zdmKnzs292uL7ivLGbjRYkzPOageLo6C+QeAgC7EL9YmzHNutiNiCUIkbzKfofroopfs92g19hwKh7IFfd5dIsIvbGpncDU8Xe/byMDe4fW+Om2dPc6Z5njH+CCRl1qLvO4ECuKffzIft4duo0iPVcjh9frz2MJOzM3LyraBa80eQ2C8S7cj/xcinTR+ThVbfykxMeLbSRbnPFDehC/hfTXeTQiUr1SKP6d+XybZvpN7I01EovmW+3USUUqb3ax3xcNAMW58eMZCP2ZvYplkBg6r0z//NEPFekD0EZApklNFcsn5mdIxEipVJjFNqJUxIEaS9msuRV+8Mu0b4k/ICchpD3qN7eZrY=
X-MS-TrafficTypeDiagnostic: AM9PR09MB4515:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZKhVwNHdSp9CaHMVvz0rCwpIpP6Ri9VcJ4m+mgY0zbha19SMHz04J/Ej37pLacDqDyiadnftX/ZI8voqzr/c8DgFZGMZRk5/obamxdMpan4wXSPY0ZDatpAksmKRH2rlbctqVM6VqUz2+gUKvPdiyg02XDU/8XOO1v17OD/4N7JLgH2K32jiTo/CoWzA7VByaRn+LdezBGTIop7Ais6y7XYlZ7qpjdFb/ZliXY3aILHVkKd8fzjI9xP0cUGLiufN0qT/5Cu4umTuiJhHB5VmDxnVYowXrZVPgyQpKkX/zgnoMUZuLV6c0GtxF+PIdsCDBgSUULBdqnVqcV+KO3MBK15GeuNfHhqdIdCYryqq0fqPFdw3Ngj/zbeW8gzcNtExzNp1ynDT2+x0wSusc0+34WA8SiLRJwOJvxPE7QJiKY21uPxR71SbGaXMlyqvY3WssTGv2lyLU1sYm27/fFrLFKD5JM0jzjKd9daaAH0plRwzU1tm11dHy3nASo9ziJfP9J49CM27w4f8pbcigji6DhZCNStIGQWqqq4x0oztYiRxdosEJnv40oal4nq4KczHlf6Lb84w3eOYjKC331ar48/0OBkK886VLoKsEf8BQm+3DLZDkC+eSTQoSPCmQ245
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JG5LDhp4nAIdeLqhap3wycYDjSJyV/efoCcghWhF+ZqTVWdJndwV7FjT9hdU?=
 =?us-ascii?Q?pAfud+VvmxWXP2aKT21G27CoplKDSD6egU7VVHCkyQ1YwIguE9JUW4MtkCpo?=
 =?us-ascii?Q?ph3T4luzuiCzmpnxVpFSjC/8iZOHyYJ+FGYIm9tIYWIu8hsOpuQ2O8nIhxQA?=
 =?us-ascii?Q?3Rdn+v03JBmqUhNW/cP3enKIpiRMS141E6IO5FRkQPO4vN2YGohRWn+zFRlu?=
 =?us-ascii?Q?VpADLPyE3eDQrDchzSdAMs9iTeFW1ZbDTAwgiPdCvT5ZjqyxBmRHHuWFgEAI?=
 =?us-ascii?Q?ywWmbVaWXxAD8CbgmLme22YTXqJgIeLdkFuGMr+ZrUD+1/aeyPT2oX6R+cxF?=
 =?us-ascii?Q?zSu3PfjpyVP4SwanFmIT9LZK69+yo89r2U4Pow1NftKnSpgnYWr88SluNAY8?=
 =?us-ascii?Q?vYu7JEpUC9csej+C7M/2n2Bg/YSMpzWf6ZsClYBMF8ifWulstq4YkehvbEWj?=
 =?us-ascii?Q?zcO78nDDr0H7UGhUEKklBKsICzDw5nJd+WRYScdUl/jp1tySsByISo/i/Y3/?=
 =?us-ascii?Q?8wZpOSvTyL6b6FxyN4CZfAOwsYnYA2uH6L6ND1/tIpCibf9pJfpV1aV8z/lV?=
 =?us-ascii?Q?Sn1tQUV5ShDgnFFoa2LxWcU11yNbsSv37Ekq64m7nV4kzAgGaQVSEABZpJwO?=
 =?us-ascii?Q?C3dcTgrxlOoV3PhkL0moW9rVLQjbfQ3S2qnjfh3NzWXixHNWj7FsmGnYr/g3?=
 =?us-ascii?Q?oDCqWYZfQohRU/g91NE5YOhLZf5fbFwWuzR/OJHmclE41mmN2q4FblUH5BcZ?=
 =?us-ascii?Q?jBXksIP4+zqUK39riyjeAZy7pRchHNnArg+VjPBz1O4HW6gG7gFjLmlRMguL?=
 =?us-ascii?Q?SgTKFzuuIBAKj8soo/ExY58a3B7V9bYqN024YX2wVhgPJqgNTzM+2ELtjiND?=
 =?us-ascii?Q?qSqtjKu7HVIWobV+CoVLlnljZCRSSDuKY+8S7MVpEkf831GH22HPq99u57h9?=
 =?us-ascii?Q?YbvDIAJ4WrT1ldHtYo/de8QyCguNPAPav7Sla4jBwoMzjDWGYm112NtGOdCY?=
 =?us-ascii?Q?QXhsvp2utFLxq1C+qVapZEcx8w=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8df4b326-a23c-456b-d660-08d9d1c2f9eb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 09:49:20.0696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR09MB4515
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 09:49:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160251

this should prevent running into the very rare error
sqlite3.OperationalError: attempt to write a readonly database

As highlighted by https://www.sqlite.org/faq.html#q5
it is likely that the adapter won't allow use multiple exec calls
at the same time.

So it's best to prevent multiple accesses at a time, by reusing
the already in place CVE_CHECK_DB_FILE_LOCK

YOCTO #14110

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/cve-check.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 70d1988a70..6c04ff9f09 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -111,6 +111,7 @@ python do_cve_check () {
 }
=20
 addtask cve_check before do_build after do_fetch
+do_cve_check[lockfiles] +=3D "${CVE_CHECK_DB_FILE_LOCK}"
 do_cve_check[depends] =3D "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] =3D "1"
=20
--=20
2.25.1


