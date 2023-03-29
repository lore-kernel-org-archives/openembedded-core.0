Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A516C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 08:38:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19525.1680079117944454901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Mar 2023 01:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NXl2KIS6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=345254bc0f=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32T8F1FU007751
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 01:38:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=xu6/8wytbxYZ8VVSSGpggFDN7ZjEqJttVyT1Vvqh42Y=;
 b=NXl2KIS6yZC1xYo6aMXPMoWKhvdC9zFShZbqOTzIOo5uXeEO5FU9yB8n2sFrZRqP61hI
 IKeueJLEmuFWXb6oOAHTg+go6g4Kpoxgpw97JHScPqF5OnRLiQyd0bILTCGo/t3Jz51F
 YwmxtGh49RoIr4zqmg9fCLM12d9TvghEhDg7gX8WxwCI8/ASMyILdEgAhn0215sM4eLv
 jJoCiVG5uy05IE/9ezJyi3XS5VYznyVOeE0m/DOciA1EVwr6tYgInpAuEkNjuucBfA3K
 ojZdVd6LI1duxMocnZN4i6hT0MZsCT7AbZYUrHIjp0o+qDTH4WWfPl+gC4eIxv3MA+KY WQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3phv85vb4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 01:38:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYcQd5rkCufyHl66EO38zbdPRZxVFo/wN2MtduMqDodK0t6nGQ+Uve0J+J0zI4hBhW03ydWkOdNrVDJ8/xuS+3VYueJi5JISsw0qE6l6S7RpSiZsAy6bN8vbob2WKHUrJadc5mT+734uHrBAY14d98toomMPvHnHNDa56PGjEmgiohhBCFJne7/S9mCag0bfnENorIODqJKHWJlPBJYhu1rf3kyQs5P1qPZ1cpriruJi2OY7SJ/2ylUuH90zGC41K+tcYK93Gg8RE6i/dfR8qF/HI7Pf4S6TeHmdCivA1zmpk1/mJPU+FocWmp7YaRcMe6zMybPeKNQIzb8pkQCXNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xu6/8wytbxYZ8VVSSGpggFDN7ZjEqJttVyT1Vvqh42Y=;
 b=lRJ60JHL+4LKnEcoeEobIjaz05zLz/aRpoPglM74NwHAzR5YuF5tpj3s4faUK3T/VtRYrOmjWQ7E3UMkbnRTHRHm9hYISm6EjYVmo2nkdjIFNyqfs9sZYAQymgcpubs4XuwU6U6WG4KSsgAVqRSIoRslVsbCW/3+tnWD5M4uSt5om+TYn27b/r02lsRVbVlmJAa2VZildRxP0QC/lm6dOvJCZj9KfI3h5Y+hsNEEgto9iBZF4qowbTqO8Wg9h/KMLV0s2NnnvuwBN/4MjE0h+jIE0hEteqWOAyQoXmm6CsPDWvV6Upa0Bp692VxChZL9I8GAr4N6i/HetcLwfY8SLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by MW3PR11MB4682.namprd11.prod.outlook.com (2603:10b6:303:2e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 08:38:35 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::9f42:14ae:2b0a:d1fb]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::9f42:14ae:2b0a:d1fb%3]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 08:38:35 +0000
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gobject-introspection: inherit python3targetconfig
Date: Wed, 29 Mar 2023 11:38:17 +0300
Message-Id: <20230329083817.2637609-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR08CA0035.eurprd08.prod.outlook.com
 (2603:10a6:803:104::48) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|MW3PR11MB4682:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f8dfa6c-173e-4c85-3b89-08db3030fc27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KXJT4qQgzje9Wn8MwCqpcboMA9lngsHVxDCTH85Xa6c4s40JKurJH4Od5XWqT4K871te6/hZs9vAjBNm3yLyhtgHxNTLj3cgbQPWJIucypAPZLOcCBzFlh6ZrHFJpUW/SO+io/o5ICXnO9NGjubrXfTFHBluWrxm8QVlVwPLOhiM8ajPITuLOT1dLLWT2u7nOXjUaLdh8l9VvZXO+jcDY5pPIDWmfH1gt5GLdfFf9jKcHzbGxyCjFSVxKlagVKdW/OEBhxeHtaYM5XmIMXumBjInMPUvnGhnMLPUDesYed0kQZ6s2LV7F19OG3GydDodIsU4BxW6RhWSCEphGhnoygharYlYarLo+JbvlWl8LH5q751EcTRfdqlEriRaH6R8TK34jfZHBZI3gw5bwNMDZQaFCvCdjvcRezCOVKsDaFopKKKisPp0yjyojMxK9plw3qkKYrgG02z5WW37gz4eQfS/gJfkcuoQcbA4bB2q0CUTPls++fQtcwmAV1FrpjxMxgwMSM/omXs6fdf8W7GaR6aQ+JG+vBFSFZw72MjjuegPS09dn+vfaHlFmgyqMRee1TkPn8OuLGQLFTg6V+dRfudOB936T+8b2gO+57sZ+9V1dnitjiUFQ3OO/KOWQYnI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(376002)(39850400004)(346002)(396003)(451199021)(2906002)(83380400001)(44832011)(8676002)(52116002)(41300700001)(478600001)(316002)(6486002)(66556008)(66946007)(66476007)(36756003)(86362001)(26005)(6512007)(1076003)(6506007)(6666004)(2616005)(186003)(6916009)(8936002)(38350700002)(5660300002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s1VGxMvRCDOB/hmOds5w9YJuoTN1aIEifGq7lgvbvL1y1QdMt0eE6GG50G4Q?=
 =?us-ascii?Q?V1Hxlbpk0fzH2RfZckHRv1yBlGkHVtTEwuS9JDdaclLm7MVn+JZNNi2c8TKn?=
 =?us-ascii?Q?xsxE4UYUxqD/o48HNl6FHim4AcPJWbKvPFJ9wM4isVe4vm2ruoda3vNEDfIB?=
 =?us-ascii?Q?K+uLYQtjOOdoIg2Oc+owvzzjSZKwYiGojVNBdaQ107yh/D8uZpMqYy8w385b?=
 =?us-ascii?Q?iZ2Sh/RgC70jQ07rdJb3y/Pe7c4VIQ9+P6XA31KMUcoe5xe+37UhHqRDe5eu?=
 =?us-ascii?Q?/e5m6Y7VdCoxU1rpIH9Yr20lE/5A54uCzxEmKvnEgk07J1sAykn5XE1Qk6m8?=
 =?us-ascii?Q?vYfYzmyRVl8m9EuKiCYd7nucEwrBlnPaAbmKu5qYztLVniIw3NS7W/CVRWH2?=
 =?us-ascii?Q?opxvC4D3i29/1FBYcBF0jwqqRPXNBK1Iaq48Jai7UlMtdeub2yzhoLAfEKgn?=
 =?us-ascii?Q?pWembP/ltEVJoidI6IClNcWEQTbfyOq4AFnvuJ/zfM58FFhpwXXGM/IAcvAu?=
 =?us-ascii?Q?1TUd69n1kAotDyXgxduFtg8KYgIn/kF/98oFKqdAZDXBPYv4yBd9nSTF1hS3?=
 =?us-ascii?Q?QNx4UhzsPzyDQAQLgiW8975RcWE1CTsBdF/cJ1upEwZPv5CgpFZo536NgtSE?=
 =?us-ascii?Q?wJVohpqFhx0+1Pgore75IMw1ygrr1Wjz2Jr2nk3shIzN9qgHpwnAw+VKvvfU?=
 =?us-ascii?Q?Y62YDL+9r1nMg1gCQtd3en8Ir+9ONmWK4XwXud0ffcpMbO0mqNBaMiqCaYps?=
 =?us-ascii?Q?FzO9aJ8+/lRggR4twq8vISjPQhAaAm5Wael3bscVfqPDQueaNh8Ic1fu/Ett?=
 =?us-ascii?Q?5xdHeHnlIwGvLrQdejkX84Vpz/QunlQboxfhB/5ZmteOhzpQU99ev9OOMxlI?=
 =?us-ascii?Q?+nZs6t24R0TphyLQertUIsQpY19LysVIW0dQQMIH3jTkGvNORbRFtCrKRNHJ?=
 =?us-ascii?Q?jKA1bDZBdBaWiOOVVhRZAFkpkoRKdluZ0hlvVbyQiVvX5Vn1jPTu//bPiiAS?=
 =?us-ascii?Q?P6PMAHWsIohMmth1vjRjfdFEyG2naZ4RrCRFNXTPDihaxglHo65JYwk/VuED?=
 =?us-ascii?Q?lhWZ7B/kVnjQ+TUueUQg0Yy2YftpUmib8rsuJzjYkw82TOYraVePY/75UGi5?=
 =?us-ascii?Q?JMWVwWlcVlW9Wl/ne9UkawEDbV29D0H9FDae62ZjCH3ekr5AYD0RVo6MKtAg?=
 =?us-ascii?Q?LloEGjkAo5ABrkUQ03uVY/+A5Lxmh8stAxZK4joWDl9Otp0bG5ktI/OtB/j5?=
 =?us-ascii?Q?HB5nmf+RuiBytgJtRZrvFg0578+EiWsVSg8NA2JdpT3bRslm2C1G6rGYJfzt?=
 =?us-ascii?Q?S79y/LAFogxnzdtNqT6YF/hz+GSONywbzlpqFNIKmEbttjVdR6t9sko4nPzI?=
 =?us-ascii?Q?GHPoLOzG0FkC4Cb5kF+0PO+V9Krfrb7t5d/uh2wdYymBCdnpZCzVSc5QC/Xj?=
 =?us-ascii?Q?r/XtYqiNzi078Sl+3AaBAJ8qmxyXNv4rUXmEPr3kU7ef23zUuagKa2SZJUmP?=
 =?us-ascii?Q?dOQFcSyaOiiFKwnMyn6+tElHuSNy8/ZJ77hz+6LIbKKzFCf3tISOBR43pF8d?=
 =?us-ascii?Q?/zcBxO21mCGcNX+UjAaN1klvzxTKHAmVLYAdyCoV//d8FSJPUbXP12u3aTET?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8dfa6c-173e-4c85-3b89-08db3030fc27
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 08:38:35.2521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ec9R/tZvSOQB3TsbEbCgoH+2Ti29GeOHUY2uQRJPwNiuVcLJRBRyiELVn/DTbHvByK+4f+b2JuMRR0PTP7ZfGH4THnFnx0+8Mx6qi2KDqBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4682
X-Proofpoint-GUID: BkVVV8GSeqsE4sSpiHvOGRzCbr_GGHY-
X-Proofpoint-ORIG-GUID: BkVVV8GSeqsE4sSpiHvOGRzCbr_GGHY-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_02,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 clxscore=1011 mlxlogscore=792 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 08:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179269

When building gobject-introspection for aarch64, the generated giscanner
python module has the wrong "x86_64" suffix:
./usr/lib/gobject-introspection/giscanner/_giscanner.cpython-311-x86_64-linux-gnu.so

The EXT_SUFFIX used by meson to generate the python module is taken
from the native python3 sysconfig instead of the target sysconfig.

Replace the python3native inherit with python3targetconfig to fix this.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../gobject-introspection/gobject-introspection_1.74.0.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
index ab9d2d35d9..781ed65da3 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "347b3a719e68ba4c69ff2d57ee2689233ea8c07fc492205e573386779e
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-inherit meson pkgconfig gtk-doc python3native qemu gobject-introspection-data upstream-version-is-even multilib_script
+inherit meson pkgconfig gtk-doc python3targetconfig qemu gobject-introspection-data upstream-version-is-even multilib_script
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-- 
2.39.1


