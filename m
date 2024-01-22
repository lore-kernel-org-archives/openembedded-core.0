Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806EFC4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 05:29:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.66729.1705901389393640523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 21:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dtgBTkP4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1751a95c74=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40M584Iv003898
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=K2kflQKQHASXQNRHwI
	HzRQ/gCmt+CHSvAuQoCE9vZUA=; b=dtgBTkP4GQrxHGmng83yqR2b5rZEEwA3D/
	DX8Zuma42cObe+JDcK8hWxJZFRqT1JVhMOmX6wkvTn0M5IAixstCSX2UGM+6bnnH
	H3OJ/pUgsElvWoWdvYeCNgQxyzBrDYpKRzKkFFq6CkjvkEQw22xj8sMEFi4N4yTx
	2yZnsQ9qkWzhxg5EEwCFxWexXav5FXC5tZcjs/PFbQY+Ut3L+U3UqH4EkJwk0ou+
	fkuVc2aSp9VcaSlcfyzx7URCZuDAl3o3vevX45sgGmF6EmMRPeRte+4hsBB/g1yK
	bFjvHQiH5DmNLtjdz5R4gw6Mqwir/l+zi/3amYUNmhp4Vre1D1/A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyhkeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:29:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJNUv2nmtv412JSMm/LSK5L33wyzBxRsq2latW2q45qx0vv4jgynup2gDSbOT47Bnmg2PCCF2Giv5bapmUAGQrLXj6RuFfx6xt5YqL6o+EqXLqaXH8Sc+N2k+MOJL1wjeg2gYPnZHawlHBBtw3aPtRrnaa1om12gzYCnzRosb7IlTh+W9cX+8Fcn5MrEWQK09Lm6QMV9jsVs4yrwrIh9ARtCm8QGgF3FLTmAgn3PVdAgDF+T81QHUkwgnaSVw/9v7KruN27zUrYAIToQnop6W4gyvublh/NlcfPhRTx8iaXtd6/gUJy89Sj6HYGBKc65ojHY1DXiYKroV7Mab8J2Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2kflQKQHASXQNRHwIHzRQ/gCmt+CHSvAuQoCE9vZUA=;
 b=HQcb6APgmsYy+bvvWLph028o7U6wDdw9Xlgn3HjerAB0p+CqkopbyDLWQcm6O9PSsDh30kXtBDYmlVm9aWcAaV9BzIG4enVjRyErxUBEfSH3H6obr+Bdya516/HOytkntBvY4VHlU7CFn40BvF/Vym/i1HmwleUmv76rL6nqfXeGCHQ8FQAtbiI4zpKE6dPd61URL7VX9OvQ67yXS6Gs7X7IzcVYpYOg6ec5hero+FB9AcdRNrYxtA5F9RMEHUeyH9ubrCgaghUf5jiFjypLceao92SOeKKq20qm1y1nCYlasm1f/iFaFxxOfrFA0v5sRLp2uAnPk3Zk9xuwP6Sp8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB5886.namprd11.prod.outlook.com (2603:10b6:510:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 05:29:44 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5d84:2b01:5029:9315%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 05:29:43 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] oeqa/selftest: add test case to cover 'devtool modify -n' for a git recipe
Date: Mon, 22 Jan 2024 13:29:26 +0800
Message-Id: <20240122052926.1962273-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0107.apcprd03.prod.outlook.com
 (2603:1096:4:7c::35) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB5886:EE_
X-MS-Office365-Filtering-Correlation-Id: f00a018b-973b-44e9-026e-08dc1b0b2363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SziLlPC9aOuL1pAgovTcyfUFlUY5eCuWRFGDACXLJh8/WFX6p/nAOhLAEEyhY1FPfoBr9r1tmWdEPnZY5klTvpboiOPkyCAMIuFn6uQjjncCzvauEYkyboMylFnuhCUjqHYf+dYkpE6T1eonrxXZ3S+l8tKLEaBVcHa6ObYIj3KcIq8wkUVEHZwJWctC1hguXmP/ovLTHkMgeq8pldFzgqdcblQo1j1edgGpNe80vTY8JpG0keOhpOEI3mxyQA9k2P7Npk59gVY+0Ff7a0MdvvkoaH04ZHjb189ZEgC2xP+ObhKcrn4FAxXfHnPk/cQBNG0NincRqIgt3+dDY0hEn/EBQjZtSu+X0qdX69XX3msPi1x94uG+xYp8Vdy6cBHK9M8LrZgBFnENXfwQqr1hawmXuM9ha28vtWMdjVp2DnjKq1lMBWRx4aCuno3OB0T1348cmt74M2ekhnUkjNI+QLOk+uSn5JtNExA4SG9E4X+dag30pO+wqtFOT0Ku5vuv9hxwNLeIdlZLtjTeJi904nWAseln2wktwx4neM3yDPQa+/GfQZnlRJ2dQm5Va7GV0A8J20/4eU8Lzs7dKSBVNCsWv8XIVpj7HYFSIf2ch0E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39850400004)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(1076003)(26005)(38100700002)(2616005)(52116002)(5660300002)(8676002)(8936002)(478600001)(2906002)(41300700001)(966005)(6486002)(6512007)(9686003)(6506007)(66476007)(6916009)(66946007)(316002)(6666004)(66556008)(38350700005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Da9RiylYBdIzpIrqSEgF/7CoighCOUdYO+pKO28nb+FxkxpvDQjgeGy9IuRm?=
 =?us-ascii?Q?5WV9yV795nnUJb+ErJujLAsZ2jR80dAZtQnKN5W+2yEkctBf+ZYBVlaZw6du?=
 =?us-ascii?Q?NC/5tEMYEwCrgYHaF83v1JzMMv9Fnjuq8cksa55C1EZgGnZo+gMzrVUIoQUE?=
 =?us-ascii?Q?HDlPHnJgVCFHlVDxup75Ar9wLFBKkN4qFjoApMGAJrw9T+12JpIhpfOy4pPE?=
 =?us-ascii?Q?fl+fZFjY9+YPp4gSAS53OsGxfy7TUwLLlFd3OCPIXjBm0NCUa8G+90xaUeNZ?=
 =?us-ascii?Q?4exU211li6klL4NwCWHYFtF5wkJ+F8r9qu9XhMyT8vDFVUl1YTuUB+W1HkBl?=
 =?us-ascii?Q?Z7EIXY8gtIhVMO8Retf7IxHuciNz3SDFyevMrQtJCtkJR5HOPbacTgByvZhZ?=
 =?us-ascii?Q?3OQ4wkN3cQ4URVinM+UerLy8TCDvMk65AgJvPZR/mChwxyVtS16WFy1RR0V8?=
 =?us-ascii?Q?J0C0g33JDjCtu0YPzfdDFRWfAvQNbcEevn9JVcCDO4JDnSVvlh2FxFUWKtJl?=
 =?us-ascii?Q?HCPnm6NLMkFIMFRfbdMuEGO3gLrD3BKAqE4Z2WgHRJIS3M4/jKbIZph3yftJ?=
 =?us-ascii?Q?JjBQgiY8U+yLvXmQjxYVPNeU0EnBMQgE8/Y8qDRma7M3saqxj6jWLTs+Slz/?=
 =?us-ascii?Q?gTJCtMKLhn7yPGQrkN1BigavJR+b86mKYWy35LSY/ylyt49+MkqO/3GewdYT?=
 =?us-ascii?Q?faEUjt1TVqxuu/lht9cuTWWKV8UaHd6WVrAfVtDap73tZZHUIFmriGwEdDvN?=
 =?us-ascii?Q?0lWan0hvszg/Qxzn30/9AqyYkItz4daqP6OQrd+68XXedbu8zAGbKSwmpi0g?=
 =?us-ascii?Q?KPYIIqtkbiscLPSrOn6F15DgUaq7MP0dEQ4Y6FtP23UKMkOg3/thc2pgHOub?=
 =?us-ascii?Q?kylfU8ju2/M08LfdcPK2efthY78lZk3pkzWChVZHq5y69liglMxodx9JB4W6?=
 =?us-ascii?Q?QGpncxzs3WjrNMUV4ZTu//8G9CIgU/h3Mp6mfnLittZloAss31Xqc67NNDPE?=
 =?us-ascii?Q?ZTHKxddL0XIV8ciWpo7dpIKwPcDgOqVLF6tyLOjdXPWfEMnQw1wzBUpI2sn8?=
 =?us-ascii?Q?LccDDAqZTFA4Q6dD8fRqzUG9dj8SPNNWqb5ZdpNiNR4gjOEHehzP0TZf6bpR?=
 =?us-ascii?Q?MYn/FxRhpuqiPtQW+276xuGTTQZUGV/m01zE2xWzzhApFCOf0cNYMtHPJc8C?=
 =?us-ascii?Q?2OIPvBoHr0mZZCmqQ/S92Aqud2ueMnRd9uUHgymXhA92l3MWjSwOiXEZANZf?=
 =?us-ascii?Q?dwGsfZtx4qzGxEWgIo20E8waGU7FcBywG9IpE5K2mnRejtCQxGeAfurhXT1l?=
 =?us-ascii?Q?UgJa6bsncH7qrMzsZl+6zOAq38ih4/FIP8SI/41N44w6ZnMYlDQr6o0pjRFW?=
 =?us-ascii?Q?ylTd/fSa/lchy83kzQa0TI3Bzv+fodU8KLjnJTXohxxYK2NVwGkrDvjV3Lwo?=
 =?us-ascii?Q?0uGlTw0FO6RgTrq1XRJjpkTse5FB0V6hCOweY7p5t2LN69z/qQlwuYAQ1zhR?=
 =?us-ascii?Q?SljG81x2fm3xFghGlNnYAo6C9fc/3ykk/duSys/raemYhZAjI5+OmFsDVFsM?=
 =?us-ascii?Q?4O2reLDy6sh/ThMccKIyIy9J0DgCMdgmGKmeX9ag?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00a018b-973b-44e9-026e-08dc1b0b2363
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 05:29:43.3384
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyK2+J9ZpheDDqsWSm+hbkYlT+nkQKFx1YcQVvi+BO0QBXX4tTzz4PPaUrrTj2XRVQuicGhdP4CB0TOsysp8yQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5886
X-Proofpoint-GUID: xMVSXDLlLKquEKpnWkIWNKTeENIqrLAv
X-Proofpoint-ORIG-GUID: xMVSXDLlLKquEKpnWkIWNKTeENIqrLAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-21_04,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=790 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401220037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 05:29:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194114

From: Chen Qi <Qi.Chen@windriver.com>

Add a test case to ensure the following error does not happen again for
'devtool modify -n'.

Traceback (most recent call last):
  File "/buildarea2/chenqi/poky/scripts/devtool", line 349, in <module>
    ret = main()
  File "/buildarea2/chenqi/poky/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
  File "/buildarea2/chenqi/poky/scripts/lib/devtool/standard.py", line 924, in modify
    if not initial_revs["."]:
KeyError: '.'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a877720769..22ea0ecba9 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -917,6 +917,28 @@ class DevtoolModifyTests(DevtoolBase):
         # Try building
         bitbake(testrecipe)
 
+    def test_devtool_modify_git_no_extract(self):
+        # Check preconditions
+        testrecipe = 'psplash'
+        src_uri = get_bb_var('SRC_URI', testrecipe)
+        self.assertIn('git://', src_uri, 'This test expects the %s recipe to be a git recipe' % testrecipe)
+        # Clean up anything in the workdir/sysroot/sstate cache
+        bitbake('%s -c cleansstate' % testrecipe)
+        # Try modifying a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake -c clean %s' % testrecipe)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('git clone https://git.yoctoproject.org/psplash %s && devtool modify -n %s %s' % (tempdir, testrecipe, tempdir))
+        self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created. devtool output: %s' % result.output)
+        matches = glob.glob(os.path.join(self.workspacedir, 'appends', 'psplash_*.bbappend'))
+        self.assertTrue(matches, 'bbappend not created')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(testrecipe, result.output)
+        self.assertIn(tempdir, result.output)
+
     def test_devtool_modify_git_crates_subpath(self):
         # This tests two things in devtool context:
         #   - that we support local git dependencies for cargo based recipe
-- 
2.34.1


