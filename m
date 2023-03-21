Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9436C7619A
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 15:40:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16642.1679413237952072449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 08:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=B6NGxslW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2444fa4cce=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L8P26p030425
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 08:40:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=WN6pDWIcyy5f7OwZcMkIzlmWyi4u5FitnWBxtOofH9k=;
 b=B6NGxslWeYK+2x0h6eBigAwVOf6iFUa59k4zbVael7ufqOLyEH5ncTC6pIFwZhFuXMQP
 VciNPal8kkQuD2vxxyylpfYg5zioMOugmhMFnq22PNDIjqdy0Bl1tgpYcKug0/uVNJw8
 FIoguAT000NJFcbY7UCb7KeeDpWDoMG0N7utQS0SUIYWIqZ5PQoewiYMrZdoAaRkkzH3
 U0bLNZVfjUpAC87V0zPU9Vu0Yz6ghaa1MaY1DPFTZzHNCzUemWhayIOSUbNVbXd73qV5
 dQS976ycwN7qtjjdBxiKnki7Oo6/MX9v+ikcRGxMJlw5G5BhuV2dJFBaMhHwu9XQ1OA7 Cg== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pdctmjw4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 08:40:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzhw61GmtXwgseFHj3xIfL21+0nnhd9WRbJRS4DhsMic7mfORPHFqxIijTMlPOBC5BMxwwtuwU7C2iPZ7W4WRlzfyaONnU8P7/ZDrtwL4/PLkhO7OaFFa6/i1XRS2KhqRTVqmSRmZG+oUhGuwt8it4tZTJVAAh5SmO16EZk2J/LBzkRZmNnMekZbbF/9e6l9hQ47yrKWuwGwspf+jlOMf8aT8yRRTR4pwu1xjeGRVUz8QZMty++JXy67b8SnR4Rhh3lHriaUiK/y+SGLkxuhfACgK6ekmciZdm1jHPP95WIdonSv0t6h5kb8RBtxPWd8r5tmRVLEg5ocXtiszPEIWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WN6pDWIcyy5f7OwZcMkIzlmWyi4u5FitnWBxtOofH9k=;
 b=FKTAU0IiQiuOYH/hTAgV2q2CndQQ178/IcEkQgdVgE1p89+m0HEblVnXGMeT+rAFYsuDpToepGG8Kj1QPxqAVpeuCYG12uw/1/t7Bfa/OTuS20gyq3M4ZYWwr/KCk2Nk9V65xmbEtUME3YPi8IBp+XUmgUkWib0dE07N9TDXtXhaGWGO2w/u1Bbt6qtefhaB+U5DhMVjSDZDgogEMNfutsEcfuHdIetNAJNc1/MbkbjMD1kPnSaurN9X+nO+Nxc3gK4CcjzEaNCpkKLAmfX64Idk8uNNTlu3g0Gr2gFUtxVA24TYnZhRIAyhOgY7H0Ubovxq0Qmr4B++vzHi3nnXgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 15:40:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::ab37:4985:7b95:2b95%7]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 15:40:34 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] debugedit: add recipe
Date: Tue, 21 Mar 2023 23:40:15 +0800
Message-Id: <20230321154016.34836-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TY1PR01CA0192.jpnprd01.prod.outlook.com (2603:1096:403::22)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 003bf56f-2b8f-4576-f45a-08db2a229c02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EDdthm69v/Ganwu5l+LdAr8Pa9DYrU4666CCq5coDZGluw+86DnUIlHUEl9MDW0Tzp+JC4hCb6TiocPkd7VRnIm7zYYQLDln/F+0W17b07uSA3VxLBxU6/GgWKJp9Bg4uZj83qiukzUWTAjLFXfa0SRjv2f/heb7LZzPm3dZbIkES2af+PgyuMN59eARBxlizB9VucaFismU91rtYb8V7y7A9B2LnpXzz7b+Anne68LgoN6k7q+9NpzhG3+jBkmyryBU+uL8rtXKpAbxj9OO4qKv2/W59Sky0nv80kyofdxJANeWoYQLflnsHqbospqpx8+Dc1EDlv1KXH837R3ZHIsFr+jvA90tafTOp9DxFLtnvszG8Xt6guCa9E50TVkSg1Jc/2FXE2xst0gcHF8fjtWHAnmd6KS4nNTJ3Gew2qYFjCbNy0HrcIcjRRKl9qnZXmlCJHS2S07TloY7O5Kn+zVL0VQTq/TrQCqqmeW8uBsGGXLvd3vOf0X/ei+lG1FjpvfstlTp6+Urte8koIH11ppjjWbNShg9IpBhbnthlTr/pIgtVF45UAbJIKD0eQMJsoIonP9D6ONWdfIjNC7NFuKu+OHBR+IRLNWTsDsUkTj/HThTsys7F3KRtkGYaB+dD8M2w1RFAEDMecWC+3soPcvOk6Qcp0OTMDN3AxpJQCxWoF1VCA5305Wjh17BxaJBqhpw147ZdbcDbiJl7vVPCGAPFoWKWwZ7xv2B/7tvTXo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(136003)(39850400004)(346002)(396003)(451199018)(38350700002)(38100700002)(86362001)(52116002)(316002)(8936002)(66946007)(8676002)(5660300002)(36756003)(66476007)(6916009)(66556008)(41300700001)(478600001)(2906002)(6666004)(186003)(2616005)(6506007)(6512007)(26005)(1076003)(966005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cQrZf8zPgviZ6XA9lZFfNhXnfa9lTd+gKz1bvEoEJk9Hm10dC6drP3WQMSId?=
 =?us-ascii?Q?ORdYaXpzM2LFets1etdw304vjiijLEjjI21CGV7O6vDc/FG3jLIAhWazPQWJ?=
 =?us-ascii?Q?Is9aUJHmcMy3uHkWi8Hpxs8cL4mZaKMTDRwPauHhrEe31umOmQ0SwbDlQqrf?=
 =?us-ascii?Q?R1fOELhvjz+lM+4DeajqHisbVYkCz2/XlOY9MDf8lL+dQj2R6aT+CVYulER6?=
 =?us-ascii?Q?WOo8OjMVCzDSTHD2ZLpkC35of/n37cd/4UqhVn54jkGINjNDCNrr0AsffiSC?=
 =?us-ascii?Q?r1EgQF3m4c5uc/+MjhV15Oaj0JHv0bH/cCg9WYmxNOlMapypKjd5+hJYSxfa?=
 =?us-ascii?Q?yXQ5JKNJ+yRV0UvKouV3dTEtLWoq42dpswgLZw923WFdYaAFmVO9MIA8Vls+?=
 =?us-ascii?Q?8jASNVtaRKD3eI3iAu4VA0N7m6vKUcj3i8WtdR+y68z97wTUc9scgfoaojhg?=
 =?us-ascii?Q?mI/Sa8TEky2q+vPobTQAoYMb7Q1Cgyqb2Mmd8dYnat0xFLLGGDiT+DsHNBGL?=
 =?us-ascii?Q?COGO8Tmw7JNpwzvmaAw5ikDQuNha/Xd1xsmrHsg67NeGG6dFRyU4qBD3ZsP0?=
 =?us-ascii?Q?9z9tnnKc3xoP4I5LctmninJ5e7C6KwA2+6FYabsTINyMTd21wUkmLItOe/q0?=
 =?us-ascii?Q?qndxVdxRXHkh/Fa1o/g/x5oCrX8xy5ZZoa+70qnF39mkXkf28KycpbinDTzv?=
 =?us-ascii?Q?2kxwH1oERH0ittv2AbXZqSpQP46IGPq0BoUczSuKFGYAAMMPBwjw2pBrr2/+?=
 =?us-ascii?Q?vHUzG5Dw7Tprnt45nQ17qKutT5bOOvjSKvVn9zF6xpSLFPBw5COarQH9rWOn?=
 =?us-ascii?Q?lLP5bmJ3oUspiqtkVptyBkCYumeMLBBcA2NPQkXSSXycdACCVWvKCt7gvU1w?=
 =?us-ascii?Q?lFR24OScHHgizDbcLa7NsmHZK+jghSFRRYzppfOqQSBuHWFsqhC8S5eu0e4G?=
 =?us-ascii?Q?Mq+pQU3rt+T3r1NKFqlbj3CMpIN7gUh8W2lSjPoMTikQxOPhccpO7QNjK5LM?=
 =?us-ascii?Q?7nUX+fOuCVWBRtnKvBV4PDNR9/tf3Dma8a8QWACloNmpOP/UeLWu9HCJ1xQN?=
 =?us-ascii?Q?MhTcWIgpCNyC+bHHKEXZSU8nWoNbBSWh6K00z6ZZQYM2yw3CvAXDHF6kBL4B?=
 =?us-ascii?Q?4glZ1RDbpl3GTZSw10Xk4nd0W8/FTDlTbaZngOzHCheVQriyrgaFnHrUTI4g?=
 =?us-ascii?Q?gyp+ph1uUc2mC+g1utxkqKeQ72DqkimeKChSm2Dd1Yss9NgEDsF5cbUg4D07?=
 =?us-ascii?Q?hTQ4FmOjdtri75Q4ugT7YZ67DDMMnGO3sgrb/m/Pmy40vmcRgT6pBSF4Zpfw?=
 =?us-ascii?Q?39jY6TL1nCuo7VEniVM+FI0yk4uA0FpzymU3OvnU5C2MVRPMDnTxKPXyzbBx?=
 =?us-ascii?Q?DO4WWq5NAHmbHzAGa5mKB/dgI/Ql/byUt7OnN9fM8gR5nXgPBMRXNEqpd5xa?=
 =?us-ascii?Q?9grFgNmuApE/wNKWoOR6QuQLYGifgu5t1k/q3XAEAi3hbL2Ld1+PPAJyP3KC?=
 =?us-ascii?Q?Nzf0qXregGP69ai+ireLSoicg3iKE3b+cWc9pn0BhEwvPK0pUy9+qXB8XTcb?=
 =?us-ascii?Q?WNrdJ+biMaJRtmQe7lW/3Le3G3J92qTg/xFLlMsB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 003bf56f-2b8f-4576-f45a-08db2a229c02
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 15:40:34.0406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bVwNjYYIIIxca8zUNc/84lgBSkCs0nqOlSTI0zUO2kAUlfFekY2ehTFQrDU+Y8D4T/bsXQZ+61XOpTCSNr/9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
X-Proofpoint-GUID: hHrfuhSeS6r0jQE9mWo8U35_AQxcFaCh
X-Proofpoint-ORIG-GUID: hHrfuhSeS6r0jQE9mWo8U35_AQxcFaCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0 clxscore=1015
 mlxlogscore=831 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303150002 definitions=main-2303210122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 15:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178889

This recipe provides find-debuginfo which is used by rpm, more
specifically rpmbuild.

RPM upstream removed find-debuginfo and switched to use debugedit
in the following commit.

  https://github.com/rpm-software-management/rpm/commit/04b0805a756cdd9466fb9dc717846f5bf15518cc

Without debugedit, rpmbuild fails to generate debuginfo package when
%debug_package is added to spec file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../debugedit/debugedit_5.0.bb                | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/recipes-devtools/debugedit/debugedit_5.0.bb

diff --git a/meta/recipes-devtools/debugedit/debugedit_5.0.bb b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
new file mode 100644
index 0000000000..624adf0416
--- /dev/null
+++ b/meta/recipes-devtools/debugedit/debugedit_5.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Tools for creating debuginfo and source file distributions"
+DESCRIPTION = "debugedit provides programs and scripts for creating \
+debuginfo and source file distributions, collect build-ids and rewrite \
+source paths in DWARF data for debugging, tracing and profiling."
+HOMEPAGE = "https://sourceware.org/debugedit/"
+
+LICENSE = "GPL-2.0-only & GPL-3.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+                    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "https://sourceware.org/ftp/debugedit/${PV}/debugedit-${PV}.tar.xz"
+SRC_URI[sha256sum] = "e9ecd7d350bebae1f178ce6776ca19a648b6fe8fa22f5b3044b38d7899aa553e"
+
+DEPENDS = "elfutils"
+
+inherit pkgconfig autotools
+
+RDEPENDS:${PN} += "bash elfutils-binutils"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


