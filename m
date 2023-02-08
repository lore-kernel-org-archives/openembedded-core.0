Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F051AC05027
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 09:22:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4629.1675848173589962001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 01:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Uxp6eNmS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=14035990f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3189FDRO004515
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Feb 2023 01:22:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=SpXmX69bsubdjEJgV0ALjkeyB0szqDGUbhsOXtOVNMM=;
 b=Uxp6eNmSR/nHKwrtYlL/Zzpag10To5DjzNyviC+UIhyMQ398RnL3OYUgK2SGz1fqVomk
 LYxzpGbEVz7dVmEKOgnb08BNQhQzR3ljJLofQhjfe/Swd4BgCpuRv4SrTVcItmfp+r57
 8G9EyMGbT9eWT7cUfdTfVNfqppLpKOpMOsvKKUG4QSjspF5F4Lve0pxzYzU5tbRfp2SF
 Vxk+ahPzXdKqW7rUeHWcR2RlITAZ30ozUszz4rIKotp5eWZ9yB3Kfzx6vxj5hzGs4dtt
 pRZsOR3TVLq5OlUAt6W4PQYEcnO/QbMe4q9GsWPOeZCKX8YkEcdgkpzReMc5AzbSWDnM 4A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nhkh9bsqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 01:22:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JEVtgIepcRkzAbYc4VJVO8Cze4VkCdOUwEeeZ67BVQJYD5JaeiXZW//a+qdb/kMT4xA4wTuDUKKLK2jPDPlwy1SK+yUN153YGn/YDboS8CY8SQsgMNr6DhuThG2zbrcacRmjA8L380m3z3x3APtH1KcsHp9DYKCteXHYGK30Go5GAvIEwn3p1Eavq49iNGLYg0xM8oYWiV9auLiYNtPArtuehrkS6fpVDDsm4o8C1ctHAWlq/zOpWM4H/GRHVMpmfMn29haeEIJVWHqxijeuUx5vGFCP9EBCrY8HSzEtYsCPcN6tB+RRAvmJCA6OwT0tQGCcp1Fl6usoxAA7PCiLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpXmX69bsubdjEJgV0ALjkeyB0szqDGUbhsOXtOVNMM=;
 b=dV+PN4p09/esJtD+6Gl/2e71exvXrxMIq3BLq4P/+rMT+g6gqp9jv1vl+4SsPhLmVBEX4alcP2glD4Mu1qOC8M3R0/bcssrOiDqUqLH1/PAqzrzHwKwFA3mhtZUtJCepT0jk0TsUCsbCGwViys/622bSb6hvmCPmA3hSaCEyRXStf4qIifa91lw6IJX2kuDh/Y9CK8GT13NvRmoZ+vGyeqZ2aVZCBngZZHgRZKOTzAWAlHXGqeHzY5zm27D7F3CwiMUXDrhUf2iHdFpIUiyz8dj5BnMobHl8hoc2wFPvA+sotWc4wxVBOmq58DlDgtIcQeon2YDkWPVnVmObAuzF4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Wed, 8 Feb
 2023 09:22:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::3b28:4c3d:1225:fff7%3]) with mapi id 15.20.6064.034; Wed, 8 Feb 2023
 09:22:50 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] ffmpeg: fix configure failure on noexec /tmp host
Date: Wed,  8 Feb 2023 01:22:36 -0800
Message-Id: <20230208092236.716798-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::45) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: bd37032f-8723-4a56-669e-08db09b60c3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3gGakhpIai+bYfwU0ygnLJa0pjypduaxSs69Qh4VNKQ+h7DSI/5jjDvIkv9E/JMfSzSyDmfcxTU0megPjdbAKwNJqct+wvxIc8Z44P55BDVioMiI2lcglvSO+9Z4K2I9brGm91/uUAg979Bi4KaD4S6VYa1B06w712nFo4QVvkPqn1YT9WDgxqnzThZJ4tBvBzmAVYBs2+koCsGcPGFIBlEHOhJWzQ6rG6oc6LvTyiTOSXe66pldSAqTW5vK2oiX4wqo/aVXFI7PWq+An+T3SutAj1AQEdp7Us/Wa/Z2Kkdk9TFxFhm+qlhHnC7mARGeZanpJ5yX0cOh8vGYxiP+LhM9UbPnQ972PA9liMMvF5jd7xBBl+/jn03CL0KtS74/wRT/g88RuyfJAgPqHuOAIsASIECW51u8g7CdwGEujdpbLRyUgxcdApPo7W3gyWrgTj9INTGvuaVv1Y4ZfFxG4c1K8V0u1JEdD09Zo4+nuAmjpPKgrRdQjYPaW9NNpnEiJjZ0Sn8n1SFc6WG/I2TgNyAHfo6JMEr8kJ2SrhTTpdtcsnXYkRQfX0Kvzch7JiMuDCQ4jtJHXc6cCCgHYxEbXEJ6A9KFNcCmFht6RyRWcz4P2uvXWyEJY0ZpoCQiPSmJfMiAjUkqsoIu2PTU315OttjydnVV6hfRF/+h0H0zhagl2CKBXbDTo8/jU5+qs8DFF/ytBc2dqD5nJTWm4xe5zA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(451199018)(316002)(36756003)(2906002)(8936002)(41300700001)(5660300002)(86362001)(38350700002)(38100700002)(66946007)(66476007)(66556008)(6916009)(8676002)(26005)(478600001)(186003)(6512007)(6486002)(1076003)(6506007)(2616005)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Y4ZC7vflxa+uQNlyvaDOKplZbzrxkdDgCfvP0vzfr1wvKYVJbHiKvBqD612?=
 =?us-ascii?Q?NuQh6ZCS5LrRawk/H5RhpfUJbzO4uuYeLsgYUNlTWSg9ZYKWqzT2JAU0Nnuy?=
 =?us-ascii?Q?usBFkvg0ibS8eerFcQeoJRabo+ObdXg9OR9A/ZA/th2D28eq4OXQXUl9jcdn?=
 =?us-ascii?Q?YICs+Bn3zUl/2JnK+pbBziPMumtLQRYspeAtfsUPoxuGPMokpU9/vNV0ifBp?=
 =?us-ascii?Q?LZ/++2D3s1zYvujYo1iM8TfQEcvKPPQTgt8YCXLjieu5k6BL0Tb8q0bZeKZB?=
 =?us-ascii?Q?UI32nZeF7A7XeCmLq+yzi4wpQ3rSoid57BRVL055J+VKJ4RIqhVKus3LCHLx?=
 =?us-ascii?Q?bib/dN03IbwH8/0t0wzQXMNj7H9RF0bqbS5x5kWvOgXXwFSUn8MneLWNuBhr?=
 =?us-ascii?Q?KP17RYE9RMg8DKXeubtVnO+e44hBapVRvM/Lr7ZGMIvVLdDXuTZNeEd3q4Hc?=
 =?us-ascii?Q?pmlbCM2yr33d0r/EZcp7bRxZ23KqB3IDgzSnA4C3Gss/dyoUO1U+/kSSUI61?=
 =?us-ascii?Q?bEIpusS9B99YzGNrucDZexM8qQ5iAGFcj8obxJBg2jj6AUC1ZD6NLHIT6PL7?=
 =?us-ascii?Q?O8pLl984hyzSy/bJcyowbC+TJJeeDo1HlIipEtIuAa+Y62Rb2prkRytOjMi0?=
 =?us-ascii?Q?evyz/SoKGEg/pfeEcQtY5MP+jZA5AgYvGaVg0w0ftlmhUFE1igmDzYjXpq9b?=
 =?us-ascii?Q?wd4x4e+wmdfzdbJtmSwMZqk9e3ZSGIi0anNohs4St84TZOn1tKkC7/0Fbn1T?=
 =?us-ascii?Q?L4VKAbQRaAfaD7VXfvimrcN6AvGviyQzNUNTT76LwH54slglGm8lFQHqciLC?=
 =?us-ascii?Q?GIHlFRcaMPmxcUBIu2bexT10TEsRibnT0PLAVXzhz5zxE9LLK6v2Mg0WTG5X?=
 =?us-ascii?Q?2kNAVt0XaXZ3MU43ZHPUste6TLQpPrWSyGiSnZTi/PJmlhv5b8ehjr6f+7hC?=
 =?us-ascii?Q?WRwzB8JnuKAUjrAByWeFRRGEgNnzcBqC7h9PoZ2Xpb8iM3PlRDi8huXEnazL?=
 =?us-ascii?Q?KbErqjwXL5JwOqrFresgKSZlGUkuoWhWs+QSlLiLln3/dG2NSxxW4SpGIrj9?=
 =?us-ascii?Q?K88/9XbfHsCXgRZpZR/NuHrvPSDaCv/EvNYgx+S9lYRz3sVlpopfk+QndLGv?=
 =?us-ascii?Q?QRgQF8Oggx4rxYSQRtzuF4lNlSRT5aapJ3fRvMIoQeB0uIfQAbln1ERFan5C?=
 =?us-ascii?Q?3D1P+7C5q78/tRamxekWIE3oNHkeTsAV3lsUrIlYb9C3wg7r7mCoV6PpJn8i?=
 =?us-ascii?Q?2s20nlXldsEuEffMGwawUyWzb/xZHTtvRk55Eb+g0eF1lhtI11HNWHSirUKY?=
 =?us-ascii?Q?aK8ZHIu/0edTdovC7opWipNRljd7vMUePTE2O03JTAJPoe1y1t75yCkdaFLZ?=
 =?us-ascii?Q?3JqH14xMBUDPJHt1Z2d3luzyamEL+ZWBs19mlv+bkDHlbOY2+w7jIQh5H/wb?=
 =?us-ascii?Q?gax5MR7krrgojj7Ga+suco9XqBa6AyWY6oMHRICqSIFdxusOs89SyKE+4lqz?=
 =?us-ascii?Q?KyMfiwukwKW7CrkULjgiKqIlmKkDIDoXqDxIUCUCxh8FWun14o+EZwe04gBY?=
 =?us-ascii?Q?4CLxFtThEWHUB4NJsoLKU3rPzkk8ZcZ2U0m3KxjRVXWVmtlT030lH5h8MqhE?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd37032f-8723-4a56-669e-08db09b60c3e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:22:50.0934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i18073u7KsyIuhZNldgLfH/x88I6RJeMKyiB9gAqWyc/EZZPZEznFJWpIVO6MZlbhPYLspGUWyyU661/zTWG7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
X-Proofpoint-GUID: c2PzvaWBrYg485pdj9pNG6awWtjFzpOK
X-Proofpoint-ORIG-GUID: c2PzvaWBrYg485pdj9pNG6awWtjFzpOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-08_03,2023-02-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0 mlxscore=0
 spamscore=0 mlxlogscore=748 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302080083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 09:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176897

The configure scripts uses /tmp to execute some generated files.
If /tmp is noexec, then we meet the following error.

  | Unable to create and execute files in /tmp.  Set the TMPDIR environment
  | variable to another directory and make sure that it is not mounted noexec.
  | Sanity test failed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
index 0f67c9e949..63abc5d437 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
@@ -141,6 +141,8 @@ LDFLAGS:append:x86 = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -f
 EXTRA_OEMAKE = "V=1"
 
 do_configure() {
+    export TMPDIR="${B}/tmp"
+    mkdir -p ${B}/tmp
     ${S}/configure ${EXTRA_OECONF}
     sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} --debug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g" ${B}/ffbuild/config.mak
 }
-- 
2.39.0


