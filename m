Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEC8C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Mar 2022 22:12:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.47.1648678325525890854
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 15:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=e2OjKFxE;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=10884e0209=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22ULnKXZ019943
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 22:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=2vAKT1WWSrszi4+H4MUXDZv2sS2BzCZOkgheinXfZw8=;
 b=e2OjKFxENRVqMqQdQUYBwNH0OvHRZPLlIdwxHb2fePcp2JFitSGwW/lgNshtMvP4agTz
 MT1QMnaK9HqSEItzjDFOzL6LypHf76L+0MhRPVADrt/9sBVscCXjBEu1w1u1f+jH1JAx
 dCk5YPLWDyJ7kcqnulKzuToGXKysyMYKvQkj8qGLftS89j52AnLWL/B1hOTwQnKelZ7D
 J2JKhx/lptwEUtNQ7igGMVfrOoiMIHBSf/1s4mJAycl9vJ+sD3QpqLgG5X6vu10m/qwS
 q6923EeyCnHen7HoCD2WCrOrSYMHUhtcQwzns5U1twgI6STJFhdHa3dyxN+LYO/CTCES aA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1r213x43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Mar 2022 22:12:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvkFUOkx1snNXtSCOali5zMIiFDkIPlXBklojDPFsfwkSKXdaXc6uJZhepF4RvJrPsg4S01AvV9EbgicdXMmV6U1an4qj9+P5+wDuJm6LkSsk6Xrv4SnU9LOZgZTf0D95IxNAMp6UECMdReEjiFX4ZDqyeuPFIHMzS9ScKBiM5k2KMLGzHzjNrmvp5IgL7l2FObUrRI9vP3YanwnPIemHPTi+zSTRMtdFq3/ArUgQ/qIRS3xpvxbhi+tt6uQFyE+7IKOpzSvsmFZ7oihrjx1VB0OZ1vk1C5qvg+hwaFzBIO5P9Sv8T0nVpFkwVWf6o5dvzPTmTsUazwlm2VLGy9k3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vAKT1WWSrszi4+H4MUXDZv2sS2BzCZOkgheinXfZw8=;
 b=i4KtYY+/rNPnIwuqoANs1dXj12p48u38eX+zqmKUbrs2VehXYo6vTXHEfxi4rwwsx+AuCylfWHofk+o+IRaTEj6rMwNw6G57vdafnqZwUk4t2hqHG3cBP+wHGj/lvAkdkJJWgNsWhy0PxjQvMZFI4FQdcQAm9AgGAqMKiZgMAognVdQppvDXj8nB5N03Y7HN55lNvmhDw9SC/OYpwadCX+pPZ0ZGFVFBdLlE4Mp9iCqaBtPt24MxKd/gE9xaQnHScz0cW0Erd4FHf1Hw3xECLThx06ulJMBNAJQ8PgM8ncZC6XiqB/ZKz7wIOQ0mK8a+F/ZfHNu1D8UsfsrI2zHJ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.20; Wed, 30 Mar
 2022 22:12:02 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::e581:b741:b80d:c8a2%4]) with mapi id 15.20.5102.025; Wed, 30 Mar 2022
 22:12:02 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 2/2] depmodwrapper: Use native staging dir
Date: Wed, 30 Mar 2022 15:11:39 -0700
Message-Id: <20220330221139.54366-2-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220330221139.54366-1-saul.wold@windriver.com>
References: <20220330221139.54366-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0024.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::37) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1d74f50-64ee-405a-0d78-08da129a5100
X-MS-TrafficTypeDiagnostic: SA0PR11MB4591:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4591B7AE35BEC9FCB4397B1FEE1F9@SA0PR11MB4591.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vxvc2+q8pjxx7+twyLQ22ta3gqJUnEMHtKuhTb6WyNvok4n2hCwyD0Eb0HrWQkDF11kseEfaBECo/HWWmUaX1o3POUbCTChZb9HOiK7nXNlvaiR2R571jDaaTU2lL7eI2+wnTOERuSEcu9jBqblYpm9KNXtgyT31O394+HXFjeB0DJ5PpnXmoeYeDn8sPtq79WmArd0pr4oSjvny0CGMlsI/6bNczUu/2Toir+7N/tpWGwb1HNm3HbIOdd2FuZT0wapZzzz44tfBEO6D290hN1Uj+OyOPgJ6RkguBpHyb9oEzRWGU/ed+5DMgpcC/ye7O0+XVDu6uz11J/di79hAiObR3+Y6nD1UubGitloKh8rS96JvI17kz8YVxcxj3pbwiV7CWCZMjuTBZkt/kg3ocBGxCGSxSQR6xyuQ469W02bawHf7sgzSuFX0/u643HPtQwtAQmRhkCW0sBwW28R7TuBMozfYk0WaIdiH32sO5RU3nsEU1vKXxtG3WcXzpR5usjqJLluey9ZU0000q+hj1py0wHvK19hZe36sBEgMynhIIeckBqjQSReB0qTqvIOrt3zImT2dPXHDMJsEQDVtOonjSkr+Md8i8dA6/7zwfMUEhI+niv4ar5fA1a7xkErAYKFXSP9tzCecbISUgn3jKPdisByu/dNEQVbiEsp4V3U5S11Ti9WtSo3Krm3EbA5gKtaA0j2tncuWMcud9sCWFw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(36756003)(2906002)(38100700002)(38350700002)(83380400001)(44832011)(8936002)(66556008)(6916009)(6506007)(1076003)(107886003)(8676002)(4326008)(86362001)(2616005)(26005)(66476007)(66946007)(186003)(52116002)(6666004)(508600001)(316002)(6512007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kI47Blzn/fPCRbZHmfeZq0NIqYABrChYjEwhWu4MhEo31bUXOsnk7QJ+amRk?=
 =?us-ascii?Q?jdMudeoE6DFhQd+l4nKPDmAhfoBgAXljReUnBg6bxu1sUwb5df5pM+anzN+7?=
 =?us-ascii?Q?WFh84pspLIDKw0eztB5WumvQMowgswE/BNTX8tp92+PSmKp1yq/KCgJDK1Qf?=
 =?us-ascii?Q?itQVotTD0NsWj6DGcEW5WbyYsUv7IYto82xiE7LWhI/qTtN8UXi/kVXcDcSH?=
 =?us-ascii?Q?v3kdeox6wcLH142KdyflIgUS6k611SZzbW+kR/KKr/M/9zLuHEJuAuKpgO9o?=
 =?us-ascii?Q?AzC3eKe0WEdHjqN1AcGXypYQVp8UfZcxQe+lv6iK99yFi375aIXz5S1d9lYz?=
 =?us-ascii?Q?QutDO1dwpgyf7QceTSDMbyhwRXGtBa/UWw8c0rIuasCHKeBD7dHwgpm/TgR2?=
 =?us-ascii?Q?f7WmkRiKvdn577IzdZDgCnIUWZ65/JuX/zz8W2OKS566G6H607n5tLqDDt6k?=
 =?us-ascii?Q?XUGTexhbIUlynufAunpCF2RJTpucD2ugAs3jDvbseJ4Cd6PLYktE+t/n8FkL?=
 =?us-ascii?Q?Om0oMIZSo3ijC7fJy4Fhn9ILNXrohaJqtAewmmIOs25ohdlnLU/wtSdnjU6y?=
 =?us-ascii?Q?gx6ciFOxGu4h0ZC7/lqhQy8vhtiv2zqVOQ0QF8J6wg2bj+k735hmTTYfaAeS?=
 =?us-ascii?Q?Jja0S4pCj8quF9SXUFyp7wDb8NHkiVYoyqFmravUa/43FUCEt61BATM1qnfK?=
 =?us-ascii?Q?bc0/5Q2JnjBNXg3DXXduYUqyw5VqMbyN7/1iOhFcWCc8yMgMeK0WVmdZPuv7?=
 =?us-ascii?Q?+uv6vBOTCezXjrFxz4b/fbMp2J1isWDxgLKonu1gwjeFOOHzTwx71nQHMP+M?=
 =?us-ascii?Q?Ke1P6FMjNZrN+ZL/JaugVHhuxlnfWAA6i3SxY0TViKYJec65MnUiaD0Km1Y1?=
 =?us-ascii?Q?vqvqIdmSwtYwRXMvknJFGTfyZVv+kEhQ0ZsTw6GIIOHM3yE5UuXOKEt/WfGD?=
 =?us-ascii?Q?wqgeAcflUUZ9Z58wIecpLuoKXl13WiuzZc7RQ2IVonHqbZY+e1dcixaTXJfy?=
 =?us-ascii?Q?7EHYjPZr7QRrdfgCGSIG8NnwqZLeBUyHXJJSF5ZJ3o7n8O/51ImhfIeOb0nm?=
 =?us-ascii?Q?i9gUQMkU8w4o6tcaqmNpbQRVkdzYDvbsDeJQxO6TqcMZDXs5BqpOKOO4IpBp?=
 =?us-ascii?Q?9ocGRDCEBA1veW6Njcg2oYGXuL+OKymGBfUgMOdpUqPl8hwfDXeQZfBbm0QB?=
 =?us-ascii?Q?XYpDPCIjLE6xct78Gyhe1ag2dFxjhY5WI2ApS0bqIzhmdsT80LCIaOSzd4Ue?=
 =?us-ascii?Q?1FLZ4KrSiHCpjVuxo0nyeID9YeCUqfClwNrq89KjSWtKlNf4QFj0YJoCyY0C?=
 =?us-ascii?Q?8rKJ82JYYHBMwAf8jgVm8DM/9BTZrWDcRRGmTY/cuw16TSWndlwn2Y7Lau6S?=
 =?us-ascii?Q?bdua6a3puHauv1vnDo6jfHFm74fNYLKVCEGPPP0PZCLWBvHj83F1mtwwTn5C?=
 =?us-ascii?Q?fN4ZA9arO2C3uVGzAdCUAvJwLCeXOsl+hSGuJ2zKrLFLXw3NH3tlc+yzTOAw?=
 =?us-ascii?Q?KSyeChkx/WbOn+qcmFQLua5aOk4VKUchS75jUXv/ZakbobfEZ6lJUk8Id8Oa?=
 =?us-ascii?Q?y6fZSHgArt7xwlSno6XgIfZ/jtqcXBbmoisiCzwlEf5s99/LqGDxp2dwG5XZ?=
 =?us-ascii?Q?cVeEY8/31SAxOy6vR+VNrDkWR0sNwpsZPf7igTqcnShrtdk22lGvygZaifML?=
 =?us-ascii?Q?rZwGEE+lSy52n0aijDNaKStVsJ31Mrfm1es2/TyxIitQoNXIoDscG6Ykhoao?=
 =?us-ascii?Q?x3gtq/JJupSpQtdEm38CBKMC60ZB4iw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c1d74f50-64ee-405a-0d78-08da129a5100
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 22:12:02.3317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xESgq3c6a9OfZ6Z3aECl9k613btbMUmGgi1Fec7DGlEracz/e+pPK/r0LTmH2uK6CY9AOGcVq13HF6z0j0xfcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
X-Proofpoint-ORIG-GUID: av9QKDaMDC-Yetm3IzI0SlCbCXIc7Fzp
X-Proofpoint-GUID: av9QKDaMDC-Yetm3IzI0SlCbCXIc7Fzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_06,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=850 mlxscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Mar 2022 22:12:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163794

Use the native staging dir so that we can get the correct depmod.d configuration
files. When depmod runs we want to ensure that the newly supported exclude.conf
is read so that .debug/<module>.ko files are excluded.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
index aa23ba41276..9921b7e8ad7 100644
--- a/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
+++ b/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb
@@ -35,9 +35,9 @@ fi
 
 if [ ! -r ${PKGDATA_DIR}/kernel-depmod/System.map-\$4 ] || [ "\$kernelabi" != "\$4" ]; then
     echo "Unable to read: ${PKGDATA_DIR}/kernel-depmod/System.map-\$4" >&2
-    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" "\$4"
+    exec env depmod -C "\${STAGING_BASE_LIBDIR_NATIVE}/depmod.d" "\$1" "\$2" "\$3" "\$4"
 else
-    exec env depmod -C "\$3${sysconfdir}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
+    exec env depmod -C "\${STAGING_BASE_LIBDIR_NATIVE}/depmod.d" "\$1" "\$2" "\$3" -F "${PKGDATA_DIR}/kernel-depmod/System.map-\$4" "\$4"
 fi
 EOF
 	chmod +x ${D}${bindir_crossscripts}/depmodwrapper
-- 
2.31.1


