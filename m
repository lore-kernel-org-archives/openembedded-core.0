Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E062BC47258
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 03:22:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14474.1706066558921570063
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 19:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QHvP3JdB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1753a196b2=william.lyu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40NKR99O009545
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 03:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=abb0NzSl2xsfAvkZ9B
	d0/YNnKt6D7S0SeV3z0ok8s38=; b=QHvP3JdBKg9UHn1y/Tvsi5uZzq5fIg1SE7
	ZORRUneK7kD3j/tLn2aEx1SP/w4LDm9qtOqTf0iyQBkkrZaM6QIJC4Z2OPN4xNQa
	ryGMm0uczR7eDS9E00QkK0Kb3LaLiKxDUW8Haaxmq5KgPzGfPvcTU4glZPEbEqYf
	aZ1T9hUQfbyONscxdtKvzHLYDLoasILALdpEsbS6HkmY+9CSkYjcdmG6oknOXKcd
	hcB9VBbDl7GTxIqz0vANVO8KmfM2nnYDqJiJxq3pSRGvOUR6VCnsF0RsJZN3gFn9
	eVyJJnznakm5+QfTKEUbRrL4hQq72GEzJy3enagaAVm9blFLAuIQ==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vtmg289u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 03:22:37 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PZlNcu4KF8sB7pB/o2iG26IvWs5bzQUhr28pD0Y3GQ9U9vC9njSMRDCN5jOZ6a34W3od+iUsCcy4VWopn+z4OWFTiDcFfssPm1AXDVm1ZVyDLHRfhJqZ3rNq5LaJr2mcYPK2HugUi/B2GS/RrNtBKNfwYDbvnaF1UzP/jwfblxjNIShKgam8eEDdrCltAlU9s6Jfe2X6+YW92mtA1iDJWUi/QN+oZkU0A/TZZe0TrJHUbPp4VLeQjikLKfCuvtgkRvtWhUN+uhubkJIJT9d45jbRNGcUYNRdGRQGrqCUpHSqOIoTSqrA8jwebgjJJY3akErRj9LYKRvpfL5cwFCWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abb0NzSl2xsfAvkZ9Bd0/YNnKt6D7S0SeV3z0ok8s38=;
 b=d1Qo5ewi/nxc+YY4nW+hYz8EYJRrszmBjJZYRY4xz3RBHG1Z5VXnc1/SPSRw43f1eUOwAiCwXgKziSSQTR9ICDwxViMuiiwmBHWqb8IMSbAlwwKVnMfIIrwHC6TYLtfnX3AR2nkm6vrdWuaB9twpIg12qyFvjMnd/VvBjmJlvjC38lhcMOxdMQ2kvMinqabCl44Ha8eG73uPKWy9yBDGRJ4hWorpDNjFzOMq8dVNHwRRr3YxcXdwH8GcKQruQwMDlZpiHSJPhvYpCh3gJE6yGFPIcNBWEWVvOVVS9mTz/AfzYw+8Jy2/W/IDwGKuQ/53s0fyFsrSUN13hpqvHdoGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MN2PR11MB4447.namprd11.prod.outlook.com (2603:10b6:208:194::25)
 by DM4PR11MB5262.namprd11.prod.outlook.com (2603:10b6:5:389::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 03:22:34 +0000
Received: from MN2PR11MB4447.namprd11.prod.outlook.com
 ([fe80::8206:ec84:da0f:f2d8]) by MN2PR11MB4447.namprd11.prod.outlook.com
 ([fe80::8206:ec84:da0f:f2d8%6]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 03:22:32 +0000
From: William.Lyu@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: Fix perl-module-* being ignored via COMPLEMENTARY_GLOB
Date: Tue, 23 Jan 2024 19:22:20 -0800
Message-ID: <20240124032220.1906541-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:a03:40::49) To MN2PR11MB4447.namprd11.prod.outlook.com
 (2603:10b6:208:194::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR11MB4447:EE_|DM4PR11MB5262:EE_
X-MS-Office365-Filtering-Correlation-Id: 064b980b-1995-42ae-a706-08dc1c8bb419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hGzOAFc/G07yE/bX2bpfCRjU+Zi081DMWp9WANHnzofyMo+nTsjXwNNo1u34dWECMkqE40Qf0uYpMldahKBKybMkVY8weVB+O43++FatLbfstDAvU/zc4nCuhsgS43k7ObqZrUTKrnxPOZh2QW+nFgP8EbeC8325K0bFrXmv9NkWSmTQzM6OL5UXAfL3BVYv0E5Ig/uoCqSZcKvy5IJfK1+NxP9O3T9dj2FhQQNuEq6O2EdqZ7ycGbYMaVlJBACBuR7MyDty1I18vbJhgI6m9WoUCh1JFO3kVo8Of0KefNtvSUja7H6Hah6tLE5i7GRZZ1oyakVO2sRZRO06bJTk5fGOUzeKmZuKNjhHSIgVx3qE/fPaWkUTOZ0qmlh24z7jJ8CEp2rT8HUTggyp3Qh10waLruFrTB/FC9HVZ4wbVP0S3/jXyHMjvLLKO8LXky027VUYhBDoEVpelS0VoJtD59wnLNMrNcRP51nw3d8n3xGK0Dxs59dbqHc+tyAb/DMLc/PVis7028WgAGr0QN+QNRRnkXnCEdoQucJDUZCSrp9cPeRuMSrNQMOmAfV2MGgoWVqPcagDxSBxpKvdf79f8uU5is6SnEScxjkN3WMJR5Kf78VdCYIf8Bd5Ekv6hasd
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4447.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(346002)(39850400004)(366004)(376002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(2906002)(5660300002)(6916009)(66476007)(66556008)(66946007)(8676002)(8936002)(52116002)(6486002)(6666004)(478600001)(36756003)(86362001)(38100700002)(6512007)(9686003)(26005)(1076003)(316002)(38350700005)(83380400001)(41300700001)(2616005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U9OziBHvt2mbP0ymhQh+imLjKNLw9zTvb9smRXEIZfT6xpQMwCk1YQxQTbGg?=
 =?us-ascii?Q?9z6gO8RvXCwpLvjAMd8EbP+epEDycxYff8ivY5fi1C99okbiBEaFL5YrAAv6?=
 =?us-ascii?Q?wZuoA2InVrJM05L5iYEUF26TINYf/rde62WkrZBhrBYV53HZypfFwAouEezA?=
 =?us-ascii?Q?WpAtchepupOC177fZ9MAHrB9917Uc4YICBQNBt1PJTvDR+8JTpefnJ41HQIK?=
 =?us-ascii?Q?r6STSwLqZly78lRlqtPlGAcVGRiTUBohcBAIu9Je2j2F3qqQnoy4Enq3iD8y?=
 =?us-ascii?Q?npXI9ojgJuUrnVhaD/MEqTv26hl5Ee9bQo/UHF7zC+zvRwhCAhG5HHvTTiAH?=
 =?us-ascii?Q?aemqttzfBP0O0vFeUvKHXjYpJ5NLwZBfapUSBx8UkcpQKtQSdLg8QUFiGa4Y?=
 =?us-ascii?Q?/PlJZjR5MQbg/kQ/zoUXS9HVv8R08NSN44kI3U7DEBaEPmyrAReJy97HyTTK?=
 =?us-ascii?Q?KN0vmMhTHKqnQ+tAyZG8TZWCJbXoNdT0mqwdICub1I1qHO8fNcLxiTpfp/J4?=
 =?us-ascii?Q?67nUinaC6UqYV0Jdz6ujXArArjYiMEl6WTZbVq4oLupkakG72fa4RCGXOTiZ?=
 =?us-ascii?Q?OvEkbBXfABkc2I88046OeLLTNH7cD4aYyPcuUbLEqErdSvx/7x3Ex9hBJNOc?=
 =?us-ascii?Q?kFThV9xmGrSGcLVaAVH9yxClNeM3WtyHO5BLsbj3j539dlEBpf6sE+WzaGHH?=
 =?us-ascii?Q?VCGwDjPvbpRnWkfGs2/dvNs4atFG/sGZEkfNy6OjTCUJl7BPjMYBTxdsb/uo?=
 =?us-ascii?Q?cQkiqSGYAcBgl5kRksQg4sdq9gcqfjxFO6uEMbKSYjjWiDm40qaoG94jYdsz?=
 =?us-ascii?Q?PK+oUfDr3P0YzI/4Xo8Lz6kbr0XUQSpEu37f5wnk4vv/8TUkgdMu8evgtg/+?=
 =?us-ascii?Q?0uekxBErZ+MiE3uMW6Ap5e/Fh+eWqhAv1kk3wHqI7thCmH4H684SSabsVSpO?=
 =?us-ascii?Q?aLjU3hTGj5+xXagN1fCJ4rX6GKGDRmsI5fca/7AJk9jknW+U1qAEScuphAHF?=
 =?us-ascii?Q?ZFyfJJyoKCb4QMiBwLPgzUE5RF2wpJzK0z8dMa/nM6P8OYu3rEYeodDcNLUj?=
 =?us-ascii?Q?M6zrX7u2DgtgHCMoTSi2rYYSMsS7f3voLKqBgjAOpAaM6adNf+/RI4B2xAWc?=
 =?us-ascii?Q?KE45L+7m0yA5/oiE0axExZECfm9cFkU7MeZbdm3tKZhnUoplsSPbTRg6qLG2?=
 =?us-ascii?Q?WymNbVuzfXOw+NoofTx4VIh3Q1GqUow/SFcBKux01PQOHE3cJofl1j7QiiA4?=
 =?us-ascii?Q?rG8a4cMvEVrwtzluy2S6ZT0rTbROMIagX2JRhOS+D1yC0PQeZbi23R+LTHAj?=
 =?us-ascii?Q?mIop3usgbt+wl8lOo23BD1hpc1hYXUcEEGXCR0+wGJUaLU6PBhBpYjVAxkYA?=
 =?us-ascii?Q?ncXh6ApzeBNNw5VY7kMe9gpv5uCN+CU4FZYn4LT8MbmcH4SD0NvqEuAouVea?=
 =?us-ascii?Q?I1yHcDzTSqqLdIig9zcSnrB2Usm12GI9q1yYzfuXq0nXMqXMS/AeTquJ9rGF?=
 =?us-ascii?Q?0dF5Z/OlmqE2hwVjg1GML62AlPGrxRYosNbuSne8XU5gGYitiP0v3kgwzisK?=
 =?us-ascii?Q?WLdwHwH0m0Cc/7RI6QLYH+TrMMfwT53CPR9cjiXaVh3Xd/7pzJy2qMIHFhRm?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 064b980b-1995-42ae-a706-08dc1c8bb419
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4447.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 03:22:32.8382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uYTYZdYDen1Dyooj6dNGLVHUw8c5kMLSBJNTmnMWnbDxcgiaQeNgesVDmPsPCbYS+7pfl6J1B/KxWD87D8nykgerCKdj/fV+gLigoTG3TAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5262
X-Proofpoint-GUID: FhWaPdxkZCvzUMepwNZ9X6ebvHWk6xhe
X-Proofpoint-ORIG-GUID: FhWaPdxkZCvzUMepwNZ9X6ebvHWk6xhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_15,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 mlxlogscore=798 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401240023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 03:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194257

From: William Lyu <William.Lyu@windriver.com>

When perl-modules is added via COMPLEMENTARY_GLOB, all perl-module-*
packages recommended by perl-modules are ignored due to the defined
behavior of COMPLEMENTARY_GLOB.

This patch changes the relationship between perl-modules and all of its
perl-module-* from RRECOMMENDS to RDEPENDS. This makes sense as
perl-modules should represent the collection of all optional
perl-module-* packages. After this patch, perl-modules itself is being
RRECOMMENDED instead of the individual perl-module-* packages
perl-modules represents.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.38.2.bb | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.38.2.bb b/meta/recipes-devtools/perl/perl_5.38.2.bb
index a9d684cfc5..329652a718 100644
--- a/meta/recipes-devtools/perl/perl_5.38.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.38.2.bb
@@ -306,8 +306,8 @@ ALTERNATIVE_PRIORITY = "40"
 ALTERNATIVE:${PN}-doc = "Thread.3"
 ALTERNATIVE_LINK_NAME[Thread.3] = "${mandir}/man3/Thread.3"
 
-# Create a perl-modules package recommending all the other perl
-# packages (actually the non modules packages and not created too)
+# Create a perl-modules package that represents the collection of all the
+# other perl packages (actually the non modules packages and not created too).
 ALLOW_EMPTY:${PN}-modules = "1"
 PACKAGES += "${PN}-modules "
 
@@ -322,11 +322,15 @@ python split_perl_packages () {
     do_split_packages(d, libdir, r'.*linux/([^\/].*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, r'(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|.*linux\/)[^\/]).*)\.(pm|pl|e2x)', '${PN}-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 
-    # perl-modules should recommend every perl module, and only the
+    # perl-modules should runtime-depend on every perl module, and only the
     # modules. Don't attempt to use the result of do_split_packages() as some
-    # modules are manually split (eg. perl-module-unicore).
-    packages = filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGES').split())
-    d.setVar(d.expand("RRECOMMENDS:${PN}-modules"), ' '.join(packages))
+    # modules are manually split (eg. perl-module-unicore). Also, the split
+    # packages should not include packages defined in RPROVIDES:${PN}. In
+    # addition, "perl-module-config-git" is not a valid package as
+    # Config_git.pl is listed under FILES:${PN}.
+    empty_module_pkgs = d.getVar(d.expand("RPROVIDES:${PN}")).split() + ['perl-module-config-git']
+    packages = filter(lambda p: 'perl-module-' in p and p not in empty_module_pkgs, d.getVar('PACKAGES').split())
+    d.setVar(d.expand("RDEPENDS:${PN}-modules"), ' '.join(packages))
 
     # Read the pre-generated dependency file, and use it to set module dependecies
     for line in open(d.expand("${WORKDIR}") + '/perl-rdepends.txt').readlines():
@@ -352,7 +356,8 @@ python() {
         d.setVar("PACKAGES_DYNAMIC", "^nativesdk-perl-module-.*")
 }
 
-RDEPENDS:${PN}-misc += "perl perl-modules"
+RDEPENDS:${PN}-misc += "perl"
+RRECOMMENDS:${PN}-misc += "perl-modules"
 RDEPENDS:${PN}-pod += "perl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


