Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DF8C04E69
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 02:04:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3828.1690855440883015555
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 19:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AxkEtBQV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7577539d50=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3710SrMU026444
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 19:04:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=SjlpTMGZKMRuDFSJ4Cjk3MIAdk98FdkOxpg4a8+N2d4=; b=
	AxkEtBQVUDbjdvHZXfdOGE1UeZ5IvUt783Z/W+y4dCtCbvraSu9nAVOhbMH46DiH
	QERj68xEA27LYPwcXr4Je8R4EdOy/KCyUb2EKbEDsrLCuN0c2tkQELJfd2MX//Q/
	7DFLcPpb0OagEUpy07yh5DoH/5Y5XgogeRbt7rg7f8rkMI4/AKGIkC4qZPbfoWrk
	Mr3tLZo5MAi2+Ql7zbnIlGP2+Rr3S/Oq4tP6SgT17dfLbDcQN5w208YJN+ogVoHp
	PnHIFUAqveDwmvyXQZGDRGyRpPaiABHczW3X+rEk+Uiy/Aq0Gfsf10jaCldbhQhP
	fydI9tLvZZjfyeX2zn1uMg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s529fhymc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 19:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmZa9r9T1HZbyFeDlyYohvEUYkGBe6RaIhQgWHjK+eNwT66LskeYmB84m1yaaK8OsH4a4kA370J1vYuvJvUqwN5e6WrK8Au49eu/aS5ZNd3CkKeUTNqJFzg88LG2epmgzuyvWbd5OoCRDM+0PsTzhN6BuFjMg1dA4x2L43MuduW1nPC2MhKXXT1eIUDXFvu3FhpAkYl+olJBktjcsdWKH/eGzmKPb/K12bkV06BGhui9BUVAH/rTYHtjD3IqaylGHVmmcVrJYq+S+wC+Xx5jkOMAihLEwNISqP0DaumKKNt+K2Y6wTQmptEG9LASIvGKrB2HoAQZbctSvy1dja6kDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjlpTMGZKMRuDFSJ4Cjk3MIAdk98FdkOxpg4a8+N2d4=;
 b=bx3KBf6hG/D9t2ePevNSsM6Hf3Bds6X5V2UdvX/XGpchb24lUhcLhwpQ0uAJTTxbouKSx5VCpFFza0lghq+zaQIz6Kvw64mrcQeoH04wkrMRke+uX4SZfgL5e/rSKhu9l+YX86sgGVS0v6cD7IuUOuaN6YB0/ZSJZauzuOAuGhRJM/LOa+bsyAQoARjTDomiE/R1azNO3zDeUdJJJAoEXL+P3Hk2UzJmrP+2Jqsm59Y7seknD/rHXX92dXqAsggUKblWPApPnnMHsrhwacg3lMKrnWrRGwtfJy1ZJbRFnqHtpDPNO3VShNpsDroH0kdJzQ0yfG95+Cd1Q2zmmztD0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by LV8PR11MB8558.namprd11.prod.outlook.com (2603:10b6:408:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 02:03:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5a0c:5fbb:a169:a76d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5a0c:5fbb:a169:a76d%4]) with mapi id 15.20.6631.041; Tue, 1 Aug 2023
 02:03:57 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2 2/2] gcc-crosssdk: ignore MULTILIB_VARIANTS in signature computation
Date: Tue,  1 Aug 2023 10:03:36 +0800
Message-Id: <20230801020336.349339-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801020336.349339-1-Qi.Chen@windriver.com>
References: <20230801020336.349339-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|LV8PR11MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e77885-f878-4bba-9abb-08db9233908d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9v9n5hhrR+xvf/8zk4j8cJSSzsrfL3GaeqxNQkmOKN8X34TJPYnFcL5Ak329Tg8gJQ8tVG/Ud72tBXw7VSFJAl6HBxsbBOzbop2Hb8EtN7l+vRlAbIYaDlo9VNIdxRJaqSC4gLAOUeQ9rDik8rW7grFeDchKIv9pdMAfObS6D43WE4G3QsxhWUS/f80iukFIIl1SbghuI7Ovddy3FgQXPtQpDYoOXXoeoqzTmOpUQJd37YFq3d38hrJkhCjitZ6F+aZ3WjH07oDburiNeiCeaBzd2kZg31hONAytfimfZZho/Bb4wiSO94GD0NnnyHBM1MvfcrDjIpg30/kRzTocwVn4RgC1D4OXLIYeB5IkLaDJG7QKqrnMshJjMD6xCUPb0O/uwpyoOTHHvcyLjclLaZkIMOv3qCHXn9YBrjz2RRMJbxQh8DdhgeIHoD0kE+yOZZVVQB9EH6AXQ0XRsBYGh/wGQ3sVXwd86K4s31X8+6k+zL5OpEnjKSIRp5n6xoa9ybI+kpFmyHjEltJFERrqBot3gRYhW1qlpBngvbxTyMwuJErmlI79DVt5pNQ/u7HsE051oLUXIyzi4f2aAZwEsMB+LXJcyKfd3VRc7cJnqNeLA/4rcNT7bMByTeVj+b27
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39850400004)(346002)(376002)(451199021)(5660300002)(2616005)(186003)(8936002)(1076003)(8676002)(6506007)(26005)(316002)(478600001)(66476007)(66556008)(66946007)(6916009)(86362001)(6486002)(41300700001)(9686003)(6512007)(52116002)(6666004)(36756003)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pRcjuBv+27sZYKCfgATo4aPH1K8MvitNEbpUAgAl+dP5rpeiBxwArKRi0KWR?=
 =?us-ascii?Q?pEsXWIF5n6gZTq0UugHsgoiD8p5iJYyWRZwQt0d+olX1+Ffw9327Fs4sf5y7?=
 =?us-ascii?Q?Y/qqoa9mbp/FQOoX4+Qyab6rBkZeZStggYJlSIxRNN4FW12LXKqEaIkQna9X?=
 =?us-ascii?Q?SiJRcx5podxE3IBFSZQCJQcJVYzwid9ic1VIjNKNdWGqXnyJYCJUEYpX8n2o?=
 =?us-ascii?Q?e9eNmWlSnGYc/31f9sLMrVHF3A9ZYC4NPqPpTmSszLVYoOWosyzserjztLFB?=
 =?us-ascii?Q?cd91d4Ts+DjuwUCrA8W6diPA2QScei5RbI7CAXJqtC4Q/MljddNTZYKhCP7R?=
 =?us-ascii?Q?KENjNlF4jKHJCR7n1TONN01OesfRrqVND9QyBHF5ACb7Qej3HcFuJGqkzYHV?=
 =?us-ascii?Q?mg9ky2YDg18JAYYE0GvebM3/o/02YF2H4O+m3/pti9nsJ6PU0Z+7o+MCjbeP?=
 =?us-ascii?Q?PGYZSTjn/tSdqOGAPr0H0m3otV8P69ffIccaIMaLtuGanVfi3zPB6YYaeFr+?=
 =?us-ascii?Q?vJdEGaIg2z+UxesDkS24xFijI+tT0siuL3Xyye8vceUuY7cSPvdk1bfmyKLk?=
 =?us-ascii?Q?Www8HrHg6YX0W3q3iWaFCXX60nGlJi6sRuvgjZe7UDCxx3noUQcImfKAjIQj?=
 =?us-ascii?Q?pifYjkRe657Dz2VwsvMv1rZ3H3KXkzipbheawfltRYHYCotBxLBnMihQ3ONy?=
 =?us-ascii?Q?bwXSaCeLTCjR9qLK4Eo5nz1P4vtcU1WKRYd3JUDl7IUHnr6hqdfSkIOvdu9c?=
 =?us-ascii?Q?bd4okBiz7mgR+tglmp9u2C1l2hU6GdZ+Mnm3MvKcNFp5hUZupisUL5qdg/Ux?=
 =?us-ascii?Q?jrziWGTTCXz1kljmm0TVl4ynbQj7tOGP+JWlDLq+GDB5y5jDVw8XnomjwB09?=
 =?us-ascii?Q?AtS0topz4Bwu5br6XF5CO4/6DxQ5ah1w/3bDrXlbuAJERPQ+6UJhkH5qd8ja?=
 =?us-ascii?Q?uVSEPcjpaWIGyKZrJLDpXudr6PP1vMlCyQNwPWnsP6NLPT7wXGpngNuREbA0?=
 =?us-ascii?Q?l12thN0Onbwy7CaTDgO/hJ5fJNhJb1qqlIXlrFFpkoRJx2DTRVAsAEa05xQa?=
 =?us-ascii?Q?9zGznHYutJbN9ufia5JW9c3VUoPKwUBqnIRqZlPSwGaHwi3RQ2VEijU/XDVz?=
 =?us-ascii?Q?PKg0oM1ZKTAtGqFgBNJgQzsRG8g3QG0fzZ+bZi0tDuPz3B5X8qwuF9o85KT/?=
 =?us-ascii?Q?tGTbA+y1MB+9EeHxk0WkaNactziam++Dnu0+XJoa8tvVADFs0XN8/frXxPRT?=
 =?us-ascii?Q?71wIpfXKG7SxJz1bDIQ2Y7QvZIhAtChEq1EPLwrYdLRaMeURq0J+rhoLcAdb?=
 =?us-ascii?Q?bE3UC3OPCuV+WQboycJ2CDCfyKKRZVlbqSQkRjyEknOEoPphKVL1Bea+B1YR?=
 =?us-ascii?Q?U+iuimSWVzkw1z5r4FdsItHbJDPyKZxW6xE3z2XBkmnp/1n1o/szmZ3PPANG?=
 =?us-ascii?Q?mR0zyOWSRVKUF9v26abeqD/7GAYEHonTB6UEgGR8FGP+w4GnLKLNU9IJf6Yh?=
 =?us-ascii?Q?mA7oGLFYcUOa+Oy1Rhe0ChJJKICSaT7lfREcVo8R3CVbf3zphineohMXBtcc?=
 =?us-ascii?Q?LvzgOvdov6+WXcyXKHNWMNHxzu1O+KGaJGL7SYvL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e77885-f878-4bba-9abb-08db9233908d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 02:03:57.2507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRC001QcG9HyUYXTKo+12kCxuk4HD4HMEJ36lLU9oI9s0dyS02AASnzEbfXjzMRFrWRbAVG9v0P6xvusic1qVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8558
X-Proofpoint-ORIG-GUID: p-21Cgv9z_flvzGNMb8uYJk19m-cHNSp
X-Proofpoint-GUID: p-21Cgv9z_flvzGNMb8uYJk19m-cHNSp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=960 lowpriorityscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308010017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 02:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185184

From: Chen Qi <Qi.Chen@windriver.com>

The gcc_multilib_setup function is a function that is run at the
do_configure step, so it's counted into the signature computation.
The MULTILIB_VARIANTS this function uses is also extracted to be
taken into consideration. After the change of setting MULTILIB_VARIANTS
explictly vardeps on MULTILIBS, the change of MULTILIBS changes the
signature, thus causing rebuilding. However, in case of gcc-crosssdk,
the setting of multilib should have no effect on it, as it's used
to build nativesdk packages, not the target packages. So ignore
MULTILIB_VARIANTS in signature computation. This fixes oe-selftest
case sstatetests.SStateHashSameSigs2.test_sstate_nativesdk_samesigs_multilib.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-crosssdk.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index bd65b1fed2..7eaad2314c 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -10,3 +10,5 @@ GCCMULTILIB = "--disable-multilib"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils gettext-native ${NATIVEDEPS}"
 PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
+
+gcc_multilib_setup[vardepsexclude] = "MULTILIB_VARIANTS"
-- 
2.34.1


