Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF3CFA3741
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 01:48:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1483.1667267335105157985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 18:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ASEnkDrm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83045f318c=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A11c4pM005853
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 18:48:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=fYcHihCBHYPJWkwjGNX0aEXjnVKlp94g9B/CSX17Sv0=;
 b=ASEnkDrmpUwkIgPGBVfWkFcUL/Bqp8jBBbZgL/zEXMV6XAwHizC+ILRTnUh2K1vvp9FY
 ihewibt4ae/YJpoR7Jt1YKzpU2NLSoYKpHHuI771uoO6FMCG/oMdaY46kkaqn85/NSFQ
 dn2tmgqpShBXP41hka2zeMEMM6/K2VX5z6Fo40Au9Ar1KdxwjP96bW5g3XXE5Sn7zbKR
 wTr/U6iBAlcZCSYH6vvKJHNN6b9Tk9fRNkrxRNxGH9eRYH/N2TVif2u/G1Ltc5OPAyL9
 AQH3lBodma7aFFF3NZOdEasl3W5LAgkcgNQw0djT2jchTdc3EaBgdKfWN00EHmSM6wPS aw== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kj2gs8ws7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 18:48:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uq4H3MwN812/0DyGuhaNTz73cjKa1x2cEPLWIgm22kdQPXpRiLT267YlvTsYMaSIXyfzZosDE32xwNvoZ8i/Tx2EVxEGXO17CcgBgaSRDKpl70+WRKlnvdNtk60TI9nv6X6p+jhPgj5YG/25yk3j+xWBh0WjiRprkd4jOC1Sl1dFD566RdAHhMWjcPiKFXORSzxl+ZzeDgiU5quefhbPJmkA+pbBieOW0WPFGTRXsw0NgF7o3oxb+SSsJiW1IuR2ngnk47M2BOLoxnthaWFA9jWHIKBxSUOsx6jOrMPnbYKo8d11ZIqXwL3qxf/TEeAShDz+E2gT0yxKlzOCTBqqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYcHihCBHYPJWkwjGNX0aEXjnVKlp94g9B/CSX17Sv0=;
 b=cCl2UL9XdxAP510LWekkEaxd/WqTUN/dwbW3vLT6Bv03ErvK8ul4f2QP88IAHdsqMq70eQPSlCeJWKx3UUUf3FmtE2UaENc3Hmfv++E2WWUv0tSYNOB09c0OCHPwrEWdW8tbCPLdkpHCau1a87zdWg216dD2mAc6+AD5VOVhiUdrrueqLDEmQN+pdQuwBBLqBAjEvZSuIuUSFwrnzshVqOGyECtNCf+zNsx1gWiBhFVZVHUS+CqaZlPdOW4lLwguGSG+VT1R4ziik9PjtD0XQ5F4O5AcHKaA+I/aleg3auGQo4KibKKEPuzenAQX5RkdpFZjGJUeDUfg1vwPesDZnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Tue, 1 Nov
 2022 01:48:51 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%8]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 01:48:51 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][master][kirkstone][PATCH V2] rng-tools: Add Arm aarch64 CPU specific configuration to address excessive CPU usage on startup
Date: Tue,  1 Nov 2022 09:48:36 +0800
Message-Id: <20221101014836.36363-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:100:2d::23) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM6PR11MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ff1342-b41f-4fbc-882b-08dabbab3a1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YjxPixLsnTGb0QY4tcFcBNHaB7vXkbrsXSPCnMlNFTcSww0OxUvU1PtbA35hLJOyFC3RuXhXmJQusd1uBE64IOEYUMY6Xlc8YUUWGL19t//ZQJE3cBso67OtAnzDtIwrUMi67o/Tc+0/WRcwxZ7NMKTlEOft//6xJXgZ0TFvuddOmOR9fLi660c2MCykGu9rlnU7kWHuQ7/liRq7OEcHkZYh++oX3E8aCplzLM260hrEl6h45/H5cXGreSMKbNBoLtwq+Fcb217nHB9rrBH+BcFY9BpHTBnKA3Gqqu8iItibEyEXDxiRlZA1gLd2som8I9FxVz++HRu40njuBdL4gbB3uotzBbXv4uAvP0cj9lUfqzoVK7iYIZjhFDqjdBli/zS7289lQv5UL+U2wWjW9WyIGy4Q2tjQ9c1/ooV6A1/5yBu0bj9gT0QP7ccpaQgCb5oMBRl+PiI4jxK3oFIHH81TCn/uPC/hDJUShU01I/R5+ZRDZTOerGIy0EVvUkiIzCW2uSC/DjSzYSsu3kK5cw0JlemZwN0L+c+y7YU2CPJMs9GAPmy4zAolVu6nPMXHD82qPg8tbU7KoNEcnqNQQm7HHufEC5oC0xfk+ij6IVaAT/ee1TuG7lvSAxfokgjypMI7zknn1ykJW8wJQe4m/KBXDtJvbzP9Ny8Oa941SxUGWAwUmiWHpLVYRk1QoLRZ35VItvHe2k07MAi26Z7k3kTPs2eGTjggWcFUBB9zFgdKbw1+QZcFnfGQt1b4I41r9ge7j74okv4GjG7Mu0w+x6IV3lonBY4e1lu6n8kcDnDy0qnYaU6rvhXnS6nJWUmy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(376002)(39850400004)(451199015)(83380400001)(6666004)(966005)(6486002)(2906002)(44832011)(36756003)(86362001)(38100700002)(2616005)(26005)(6512007)(1076003)(186003)(52116002)(316002)(66946007)(38350700002)(66556008)(8936002)(6506007)(41300700001)(6916009)(66476007)(8676002)(478600001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CO38LnBJTBtMMenvhyhfVDQ8Fa2r2NAs9KAPcf2K5MOnZ9EQthxY7XOetvmr?=
 =?us-ascii?Q?ycpy1eO5k7P9m45Con8KGgAFrXJtUVVuM1mIigNZF+OQI/3kRasHFPFstk+M?=
 =?us-ascii?Q?pUPR0m3O/yLD46W3aqlxLpEhJ2a9P59Xy/XBabMRGPxEZMjrQj2lesGzdSs+?=
 =?us-ascii?Q?9ukmFLhBokliAgedS1CdwlWwP/Oq6ExYNlcLC58euFvZiuMjxkS9dWDlWFln?=
 =?us-ascii?Q?iyNmdSY/fNLiHcoS0NCk4TF/pn65ghwzfo/eK/qJ9JG1l7K09g4ARsTlv2dg?=
 =?us-ascii?Q?1eUwOjWTt/Tu/PO9qV4k7VomzemiXkIXl3zmSSvS04LFlUN+OvOoPPwEIwo+?=
 =?us-ascii?Q?wgo4vRL/O7VCj3VBgDMevU2TBg+S/pOqjIzRVbZqiX/DxxD8pjI9pJOBgh1F?=
 =?us-ascii?Q?8nweMQJIqHjduznjDdBMqT9fbM5VjdotYy17phol7cmyzG4Gs4lduz55I09Z?=
 =?us-ascii?Q?/dpFqRO8/DGZOMJevHokU+FLmHKYqOs6gd/OebbVGgzwzchI2oIujIR/TRjJ?=
 =?us-ascii?Q?n+Skj+kieCQSwbCmG5LrGhLQAifvOIlkxVDPcpxmKF9wmQBmfeKDv55dHve1?=
 =?us-ascii?Q?E+jU/QLBdirHzlJ7l402Jl/1nm54WAYAIRa77R8/mIQqz7v6/qZ7OEPsiO4s?=
 =?us-ascii?Q?oadzvhgaWiMr6NJu/jgyKdr5L3noEvX8QCGRc2XYsw4KJG6n7wQXsDC+nu2y?=
 =?us-ascii?Q?ER1lYNTWPbhFq/hW/i1WTjTCQ5Ddyp1wcc9v+bx0vWDuHVrRzHkAG8TCji9V?=
 =?us-ascii?Q?VJz2hozh/r9lk4acnCwj5hGeCqOxjKuuNU8yGT6iZQqSL2/m0YZMiOlF/rbb?=
 =?us-ascii?Q?+xrHEOikaa/9etLynOH/p6Ym4CEG6M9HlJlgl+yWO72YnWwf5+p73Vi1di9U?=
 =?us-ascii?Q?uss3vTfnOkx6coHuX7513qRFjNzPq09dtXJoRaZzeEowl3Ax09qj1yT0p4Co?=
 =?us-ascii?Q?vLq7RAvGnlBxSKYaERO1JM7aq5X/4NpNu5kn5Ffv4FRb8cvodvvC9JUn40x9?=
 =?us-ascii?Q?rd4gq/zprVtJabOL6EOVjE7EE7Uu6z/GhHFwBec250+Ca18n+UmhgIdP149W?=
 =?us-ascii?Q?9Z4E1tcDyn8QEetSZ/bNTGOktWMcS1X0P+HuVpHORe/YMukDLhazby6sA37Q?=
 =?us-ascii?Q?GFcKr6b+AXIM6usJCbb8Z1zifqDufMSQqiwXDnfeQtcLRpNuisz+jLoHIDjD?=
 =?us-ascii?Q?IMnvukbqYwgSsGbmyQuk+PcKqwENcOazSARNAs1wf9BkayolG80BeM6K/lU3?=
 =?us-ascii?Q?ViOiRAMtTemBi3VFs7NgbK0z9g9r3kuE4zYLNZQZ7bgFsGWiUZIbYS55Zfno?=
 =?us-ascii?Q?h/EYU6uBTu+0FcF448JTd6BQWbsC+GpxEokI7yyD8fbTT23ZUe8UvKKsgbWf?=
 =?us-ascii?Q?z+SQDR2d/Wuz8IE6lHIh4XItbHTWa4cSrngtBKQ8H7BQFglLpGRMHQo4ZEQf?=
 =?us-ascii?Q?xzb8nBKmLPQ2rTYDuSBvyKYfU+3DmPhLOauMVAL/latnYvp94Vs0yXiuvNmN?=
 =?us-ascii?Q?unNHA7YePb6aByH7WIjwYGwXew4eEajBbLqZ8ypCXtVT3WQsPRwRns7hGvqT?=
 =?us-ascii?Q?7tERkTo8ErZKdUCCGKcOCp9CDxSO0yogMzcOpf8m5QcRaGOU12DXH3YvquUO?=
 =?us-ascii?Q?hg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ff1342-b41f-4fbc-882b-08dabbab3a1f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 01:48:51.7324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64rBysaw9KJDYS/3MERpYw3tUR/W/UDVc03mjqNn3H7EAcflGCfKmjMOCpqsE2y0WeU9WoxVG+XFqDc+Ys6OxURUGCYGrjF4FxW5q5oK5lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
X-Proofpoint-GUID: iScO4WGxzZt9Aw5ZNpFkiUBH1ANQbG-6
X-Proofpoint-ORIG-GUID: iScO4WGxzZt9Aw5ZNpFkiUBH1ANQbG-6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_22,2022-10-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxlogscore=785 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211010012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 01:48:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172349

With the default jitter options aarch64 CPU-based devices typically experience continuous
high CPU utilisation for several minutes after rngd starts.

Accoring to the rng-tools issue #150[1] and comments[2],in order to address this,
the following configuration changes have been made, those configurations
also can be found on Alpine Linux[3]:

- reduce the number of threads used to 1 in total, rather than 1 per core.
- reduce the buffer size from 16535 to 4133 which reduces the time taken
  to fill the buffer (and so reduces the duration of CPU load).

[1] https://github.com/nhorman/rng-tools/issues/150
[2] https://github.com/nhorman/rng-tools/issues/150#issuecomment-953079212
[3] https://git.alpinelinux.org/aports/tree/main/rng-tools/rngd.confd-arm

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
Changes in V2:
  *put the aarch64 specific default file in meta/recipes-support/rng-tools/rng-tools/aarch64

---
 .../rng-tools/rng-tools/aarch64/default               | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/aarch64/default

diff --git a/meta/recipes-support/rng-tools/rng-tools/aarch64/default b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
new file mode 100644
index 0000000000..5a2fbcc9ef
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/aarch64/default
@@ -0,0 +1,11 @@
+# With the default jitter options Arm CPU-based devices typically experience
+# continuous high CPU utilisation for several minutes after rngd starts.
+# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 and
+# https://github.com/nhorman/rng-tools/issues/150
+# In order to address this the following configuration changes have been made:
+#
+#   - reduce the number of threads used to 1 in total, rather than 1 per core.
+#   - reduce the buffer size from 16535 to 4133 which reduces the time taken
+#     to fill the buffer (and so reduces the duration of CPU load).
+#
+EXTRA_ARGS="-r /dev/hwrng -O jitter:buffer_size:4133 -O jitter:refill_thresh:4133 -O jitter:thread_count:1"
-- 
2.34.1


