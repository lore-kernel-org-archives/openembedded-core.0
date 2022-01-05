Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FC4C433EF
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 06:02:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3561.1641362530286568484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 22:02:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=VnyVHXTo;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=80041a28b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2055w4rd028049
	for <openembedded-core@lists.openembedded.org>; Wed, 5 Jan 2022 06:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=R48t17GKmLu5tbiWHdDBqZx7THpZ5rzy6Zlq5cnCukg=;
 b=VnyVHXTomz4NO3mB2+MeGPaKXvx9pVDC5t8bJoUBmyOBQhSCRlQIMIjA8K0pKrQKbnFD
 yMr3I+N47gGIBre7hyp4m29kUI8XBmJimGHDHp90O3AYfEvbY+kzNrNvhsa6l+EnSfue
 /y3E7Wjiy6Iwy/bdjEE+g0LgCs3/qBAkZsJqlXPdmOU0rxw7LC0VW6vm699JxV1TTmZO
 u5hb5gNvc12jZNNskEIiS1yRygNReCMS7UR5iB8y4EMhPFr9Ot7x7XKquS5SpBepW+gw
 2XfXjgT13YPOQ8BWdSCZdeDe3Kuv4qGeuhUog1CkdYPZVKi3223soeGWUJpid07JquTe vg==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dc5309258-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 06:02:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5H9nQfq0W1ePKe+ovKGhAyPHwoSctGkks6fpqRj+tTccfIjEz1C0xWOZK9jkZadJh7BbRwegp987qLV4juRlxUraM5QT5jI7/dDKkU/s9vHD94JljhRMz5KBmBcX8vr/W5OjVQfWLG+XLRNmy6e8tUUW4/0MadwZVlBtxbYghna/RA0J5D+vlGzGavKcc7Ypa/RZclZbv/jVxI+DGjPdB0MKxyZRSbS80Xh0e4YRKSNVgqchK8r8uaYG3xrDxSMi1koaU9121wHHD404zjv5KCSGG3fDHtFP4ieu+rKK9+qcVPehwtXiJBneXOp+KPhj2iDFeUpEtPgveLIp845LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R48t17GKmLu5tbiWHdDBqZx7THpZ5rzy6Zlq5cnCukg=;
 b=SMx+bnClgVzUpoC5+QIhCGllNLYiJ6Y5CnnozsuB/AlYo9lwCelNOHP1CTqz6D8IsZmQvvRQsSuzfJQlO8oVv8NChzpI6J23nL/YQtaUQ19UJsiTBZfd73pWNNnn5kV6CW7zbM8qAqfq/3zvo01AZ7HskiXyFJ1uOPE64KkQv+U6EQHGXpQxXGD+nocq0ydhd792/1W1bmgHzt4filZafQ+MToUcNSIR5M4PoRhRkBJ7C23EgiYC0ggMXBRtU5tC/4bnhBeZlMy52CWdw+sRbWSSr7KUzz9bSevmlzUSWqOa/+EneKs7s/vFIABK4ZL5L4O9e5a6Bn4vI9fph/rTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB5609.namprd11.prod.outlook.com (2603:10b6:510:e0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Wed, 5 Jan
 2022 06:02:06 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::b52c:74ae:e50a:5206]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::b52c:74ae:e50a:5206%8]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 06:02:06 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] populate_sdk_base: remove useless dirs such as /dev
Date: Tue,  4 Jan 2022 22:01:54 -0800
Message-Id: <20220105060154.68560-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 921e58e4-c808-42d3-4a21-08d9d010e6b9
X-MS-TrafficTypeDiagnostic: PH0PR11MB5609:EE_
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5609544AB42DCB95C36CDD1BED4B9@PH0PR11MB5609.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:862;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xfx7Zu5ZZChHyXDZxty4isvd2T1ctwZQyIk43HniiqAoX40ToR3j06Ar39yaJJAkpZN2BhKrDdyWx2DguRLZBPNyXqWSIVkNBEIc3PXNIP16DJYK8BeZYMU8Tv+8XnHsOArHQWKRoRDDmgIkCxkk3KK4v470aD63IOHbiBLfG2e7cA7mkF2OfZdWwvLv9eGjxYeSi6yucoHaTx/cO2qiGfXTQ9EqnMIGVZXOlT0Qtc7yLsj2VaWO5nNPwIOzF5uRx02/9J3nnPNuO8YfwXljpAWGgCTkwZNbOYAIo70KbKuTd4WGK4M9k0L3ioJkJpURDEwLkEpHV/5BrciVse8gR3oXBzh4QHQKN3Jyr+rDK59Smr2pKKAJVQ5fipXNzr7cp1tcbgm0lOPAowRWpU1psK5ZPkfkxBjNgW2Va2UBXNEoWyXzq5I+vDTKkU2iVfzJ4NCx0FfSSVm7tJ3CkDJ6VktYoAszzc2XxkaOU5OKbiInDWyAoeiu/Gg2nJUJVZTD6s9gx7yGQE0DD61ae26P574YpRssbcx4g70uSVgHQ9s/uRims733wI70A4s5JNo+Ucq+8UDwSIpDVoLX8yDgpltCbX83CFfrSwLqD+M3ajAoz+3hgiYHVS/KVMfojR92gUcdRh/u82d9wzrTwiCNQB8Z5mrXguD1PwZkhnzGMz8xviqMDXFmJEGb9GE3ddlaG4ro0grRwB1FRX+MXFpeCw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(86362001)(8676002)(186003)(5660300002)(6916009)(6506007)(83380400001)(2616005)(508600001)(38350700002)(2906002)(6666004)(38100700002)(36756003)(26005)(6486002)(8936002)(66556008)(52116002)(66476007)(1076003)(6512007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j0JmqZleXkbtIuSipZcA7fD3rtvRS9KJHFtjGM6jApq0bOA/wJGOaRWjLJNb?=
 =?us-ascii?Q?RbpxyrJ445BcvSGwkZ2G/m3rOzkLj2uiPYEpGB34GMJrdG1i8FeLcz5qdGNy?=
 =?us-ascii?Q?kdAyK9tfazHjtnbTsvtkdDIpNVedGROZVpoFzv9LY9MEzESiyB0p9fXmywiB?=
 =?us-ascii?Q?3VnpL7TVjBrv326n/kESy7Zts7UYgp2SpSRtPdciXb7uifYla+Mz6s0H61Yk?=
 =?us-ascii?Q?5YsJ/Jth1xMmBwIzOKD1uOrIEmBAVup5NnTfeNAim74WjcP5qenJVs0wJQQx?=
 =?us-ascii?Q?7zKdVume1bpF12ONH7jbingweiLpDqn3BCn6dK5z5SRrhJbv4PFxz5G/R9X6?=
 =?us-ascii?Q?tAoomvs4DAVRJmzwetfBZ4MuhAIwqhHHZBEwr/HjYEfbqRxhyZKhjCO/AkUG?=
 =?us-ascii?Q?D5EjBrY3F+V+0xTYyL6ChSabqxFyTd362GZBxABf3Mv9niNmSuu7WeFg68iW?=
 =?us-ascii?Q?dlwP5XpNwVe3fRrlJD5w1InmLvDklpfibqsoiznyUloh2Cajw6wXKw8iF6Xz?=
 =?us-ascii?Q?N7GZUWr4mQX2XejRwjjuUivjkK0DPcs9aC3RM8axJybk1QVCAdSmNvIQvJKd?=
 =?us-ascii?Q?r2MVjILp74zkzPxj9ZSSl2pInYsvuXZ/bFTB8wNi3cmq+sgA9CTH//+JPQZN?=
 =?us-ascii?Q?TInZhwGKho+XZLYwdMQhIPy6uDgLxOn55Vop8/q+bq4PJke6K5AMS/VZ2PXW?=
 =?us-ascii?Q?FOO+UPhKqLODc4VLaxr/4a1zeGl69763Nsn60G116Jjkz5BJCr/zc+o0+lKu?=
 =?us-ascii?Q?F0qsA5Iek1+UA+OvoYyY9VTPk6PBH2imeCHGZmAFPMkgyWAMoBfGF1g9Up2H?=
 =?us-ascii?Q?wQiWjirEIt6if1cfsfFAAdEbuZ7CEIzGGzpjX0WMYWBl5+hMuCaHYjeuzBOu?=
 =?us-ascii?Q?eeA3eBH/3zz2H+iyqcvxN/ATXGwuIz3MQE2Txzsewk/E1et3Zc8xlUsassgo?=
 =?us-ascii?Q?HxU6YRWEPBfsseQDJyQR8ZXwa6ib15ZuMMOuVFvmIYeMx5jsIe3SPiNNOHta?=
 =?us-ascii?Q?Af+0ZNUq2yywuDFSllY4zhqtVferdGTtMgqZcJ13GeusadCROQuD9KW2O+2x?=
 =?us-ascii?Q?CjUyKXWenjeLV0PsFfIZ4ubLHyrs063H4OG16MZw4CwqhboUraU0oQWvAsSi?=
 =?us-ascii?Q?d/G6e2Ju8UM0GEVmyqgiySp6u+0Q215n8r7wwP17a32T+drohf4NWnqVcDt/?=
 =?us-ascii?Q?sGTiAt7u+3kHoCRfUvqyLMlzfgrKtW8WGflZj47UVtQbUzotMia6kM7qtjyg?=
 =?us-ascii?Q?ntMcubCO+yeSjpePR1QFZRR7wioYcGH3hb/s3xU6gZu27h2kzNdbqvY8LpHY?=
 =?us-ascii?Q?nVbT/f9e7nxDWzt4sP2SXlmrrTb/m8Y1pMlWj9AwEAe5I3tqUTAzMS9lPG2N?=
 =?us-ascii?Q?ld8UoGkZL4jHCZxIL2ADga3Vo++TzaYo22+cb9Hx7gUFGWxcWMgpYmreR/7e?=
 =?us-ascii?Q?ax/NphXN+6+afGQsuw8AKLnyXjSXL0iauXNb6/BOwOhgWiolkziAaGVsuNPA?=
 =?us-ascii?Q?guOg6jAkE462XDDslFRRCpF7h/R5NAV+e4MFA8/vqchkzYSoHJguHkUCwFwD?=
 =?us-ascii?Q?itPY1lmqPE1Bvm+/FEy8JyrZlMym8ojUuOn1sct7rHBDYzGxn2hr5udY0CGl?=
 =?us-ascii?Q?AwvQkOGRshby7KOgGd2mP2o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 921e58e4-c808-42d3-4a21-08d9d010e6b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 06:02:06.4373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pPejH+8ftLHSnUm2v9GvT0blgJxXgLhP8neqR4cgsLa9yRoyOn1tRE6auhXBj8XbXqij3CX8qvXtHm6GsQ3P1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5609
X-Proofpoint-ORIG-GUID: p0NxDRIkuKe2W6RmWGoJDPcp36x_Fcc4
X-Proofpoint-GUID: p0NxDRIkuKe2W6RmWGoJDPcp36x_Fcc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_01,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=799
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201050041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 06:02:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160178

We met a problem that core-image-tiny-initramfs's SDK cannot be
installed. The error message is like below.

  tar: ./sysroots/core2-64-poky-linux/dev/console: Cannot mknod: Operation not permitted

In fact, the '/dev' direcotry is useless for SDK. So remove it.

This patches uses a variable, SDK_USELESS_DIRS, to hold useless dir entries
so that it could be extended. For example, '/usr/bin' could be added if wanted.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_base.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index fafdd96749..d4065b9b13 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -92,6 +92,8 @@ SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
 SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
 SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
+SDK_USELESS_DIRS ?= "/dev"
+
 python write_target_sdk_manifest () {
     from oe.sdk import sdk_list_installed_packages
     from oe.utils import format_pkg_list
@@ -103,6 +105,12 @@ python write_target_sdk_manifest () {
         output.write(format_pkg_list(pkgs, 'ver'))
 }
 
+delete_useless () {
+    for d in ${SDK_USELESS_DIRS}; do
+        rm -rf ${SDK_OUTPUT}${SDKTARGETSYSROOT}$d
+    done
+}
+
 python write_sdk_test_data() {
     from oe.data import export2json
     testdata = "%s/%s.testdata.json" % (d.getVar('SDKDEPLOYDIR'), d.getVar('TOOLCHAIN_OUTPUTNAME'))
@@ -122,8 +130,9 @@ python write_host_sdk_manifest () {
 }
 
 POPULATE_SDK_POST_TARGET_COMMAND:append = " write_sdk_test_data ; "
-POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk  = " write_target_sdk_manifest ; "
+POPULATE_SDK_POST_TARGET_COMMAND:append:task-populate-sdk  = " write_target_sdk_manifest; delete_useless; "
 POPULATE_SDK_POST_HOST_COMMAND:append:task-populate-sdk = " write_host_sdk_manifest; "
+
 SDK_PACKAGING_COMMAND = "${@'${SDK_PACKAGING_FUNC};' if '${SDK_PACKAGING_FUNC}' else ''}"
 SDK_POSTPROCESS_COMMAND = " create_sdk_files; check_sdk_sysroots; archive_sdk; ${SDK_PACKAGING_COMMAND} "
 
-- 
2.33.0


