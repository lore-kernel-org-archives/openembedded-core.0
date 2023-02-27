Return-Path: <ovidiu.panait@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE69DC64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 15:43:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.93390.1677512582608818234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 07:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1422c8561c=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RAvgh8014796
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 15:43:01 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmka0qy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 15:43:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHwdAr4RRR74GynIA+0dtDYkDQFczkBIBcFVumV6jeKWNN1kwufgiRdibr04blC29ya0KyuHTN+JUq4W/F/UuhGyPmLfFYGB6O1zOuun1hsNtFCOhYwxCF6aP5XwJ8CnFU7yGUlUIWCTbdPn3PvKBn1/MkXbsBvZJylRv1oYNCmhANwkgzX/deqmkHsLdxYLcoQL/yrGgT1VM7iC6ijEjjvDlf1OnIhN8sUM5ri01sCnP3stIf2mS4iwXW/XXh4xCjUadA2+2NGBtHqRv/kbefX4RlcVWbEcP+MkgXvwtaVAzWL98eD167XMp9Pjw0k63M8x5OwtqcU+fT/sOr+pNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6di11FBrBXXhZrDJ129OvRhRvkIELIvtsLwTfoVrHg=;
 b=N9gIaNUJXU1B9oEZAYLJRAd6lHKjAb2Wg6d7f4ka1VtPB9h4E4vKw63MygGNgesiNMybr7tyA+tC9ILrNOfUNLvYVzf525LnbvzLfEvcn3ZARhAE33n9uctrEoNVqN6BucnhGhnm6sx4EjBZUje0uq/IBc87/RAMqshBcQWdn8Qz8lyWZT3QORQJE6r82ivR+cCOBBi+ee9sX9Bv4O5GaDpl+S1oRjlkYJQEdQcxH1zCM3qZwcG/fHhssf2CIYwn9T+3kgyAcKEtfxR9jH/00iCNwr3b9N0qZRRlq5xydopzXZGLRnZo2rqZrkYktn0dh3TLnVNxiI3TqdgdR6EhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 15:43:00 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::31f8:d3d4:2c0b:cec4]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::31f8:d3d4:2c0b:cec4%8]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 15:43:00 +0000
From: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sstate.bbclass: fix cleanup when sysroot in manifest != RECIPE_SYSROOT
Date: Mon, 27 Feb 2023 17:42:30 +0200
Message-Id: <20230227154230.3566400-2-ovidiu.panait@eng.windriver.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230227154230.3566400-1-ovidiu.panait@eng.windriver.com>
References: <20230227154230.3566400-1-ovidiu.panait@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0001.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::11) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|SJ0PR11MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c2184d-40fd-4846-230c-08db18d94df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	c95TpkDZ2cfgpXYh670F/zAH0CugLt0s5OpCrO2tfzOz4EJPriV94E/ricxYNhNzmn4t0ZhzrCnVIGYUlH2KDuwjhF2DWdVyDMXn7v0psgARR8DLou98okoyr4/IoGAWpSSKI6I0GR/3D0aR0SeP/+bOlHTV+fORRzbIwuLmTErdzZzybYrvw+lepXyMBCN+LLbuuQ8Gc9LDQmWMhVkZ0h8FQRGavQLShe3rPpXXCfHCAXi2JXbnSY9qyP7DsqwiSGFbIjUQ4pSCDF/TX5WCRWj4bUjH3/j1HAoJlVrsYyHoucW21sIg2IfocvRsshLjt/NhH61iIW4HI4+LNhyiO7NVMMYG3yV+kEqe7I3M4tlSAD53M588IRWc6QTcYRhtI9iw+JPwlCQ4tG4FekYODYsi7gZG5Bkd06CID2/IsiJBBoaVqrqgzZiNTte81oN62DOOD34uFErO4cn3bXV2jYl0YQJsbieOizueqVXm6wo0bl4N1yoW20NVc1QjNE4gO5OHeiJWJW/NDHu/ueuPgoRH7KnGxrwlULDLnRZIobwq7FKZsjJoQXhFVBXZk5lVo676gH1/5YytH16obwBe9vzvgn/phoUASJBDTQrqbRaGHh438rEh1eGHGNAkemSnSYKiSrSG/2RMRJi6kzHveP/H4b5Be32BhUuARr7VhOgyCutYMz/QhP+v07WXYULYPB1rxVFb3oGLc/48I7aN+paTFDLOysJA7wIeUzEhVXk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39850400004)(376002)(136003)(366004)(396003)(451199018)(83170400001)(38350700002)(38100700002)(66476007)(66556008)(8936002)(44832011)(2906002)(66946007)(8676002)(41300700001)(6916009)(5660300002)(478600001)(2616005)(83380400001)(6486002)(316002)(6666004)(1076003)(186003)(26005)(6506007)(6512007)(52116002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9L5G8MzDnlJd/lYI1P3slSDMJDCM9A71Edk4wnzXi5H4430b4LX5MjYEHpCP?=
 =?us-ascii?Q?Z3AiAM3eso2xZ+xQLcDk1DuLBzR6H0gIE2jamP+bbwKPftihdy8fGGOydGlK?=
 =?us-ascii?Q?vwGzn/N7N4faOmO94QZlx4H/+0ZcOP6LaMwuxlz8hoRFcTUJegKvy4Lpbr/g?=
 =?us-ascii?Q?Pd9w//Szoo8kaN4kzu4rMy83LoqOSdwG55WGLywRVA9Gq01aadVVXFhm6bTg?=
 =?us-ascii?Q?x6yQo32GyhFzHbe2QJKzqYhJ/n8dQq2uWWpA87upWFbqVs10YCDzIBjvlpJh?=
 =?us-ascii?Q?7rkm7/035kCvFpRRmMBli5RHez0WZFsDS2jh02b/MH3NsaqQdrioApQDOnyX?=
 =?us-ascii?Q?FD/tUQfXsi5e4QZ74VkCOyesWNol3XRczNrnIk5W2HMqvoUBrwVDDXeTYIoi?=
 =?us-ascii?Q?F2ulJFulHIjvLWSnHH47NvHJi1Od/cJPmbPU7c5qhdfpRpO4fvmOn//nGg3v?=
 =?us-ascii?Q?yl7LK807Q7hq6KnuJ1aiNYfwIiHRaufjzUIBUgEWDSMSv94QnE0e7QmcKCtz?=
 =?us-ascii?Q?uZYVOyhiDIC5R5J/qLlX/7OLEtgNOf7SaaJenCMPfLeuK9X/Yu3OU1Uq1ilU?=
 =?us-ascii?Q?Ra+iBiJlU0/5EkO9C4KuKnhAqRHbf5UzLv/FokNuNh0d3Bfy+Smnb/9noT13?=
 =?us-ascii?Q?6KQiyoGt8wzsxjRmyFPlnsOlJCS5nmWJg1nRTwj+7cTe9NGHhdBPYkrOoQDI?=
 =?us-ascii?Q?2CPjEMJ0LAeriZMlINaL3iBxNMxtqLPzbEzu2EBpzFEQGl2XnnQc5mg8KpF+?=
 =?us-ascii?Q?/3VxKqcBlRSL5x0PRd2TYusLunAxbhEViyQhC5PaucA0EokQCl5K4ZJqcJj0?=
 =?us-ascii?Q?D7ec/DnliPbfVgEEEyCnGoPknke8MEto8UoEzjgAKsLnsY5XMHKvuA5LY0FV?=
 =?us-ascii?Q?IaRH/kZTDNgHAbDfYHCX95yXvZ1/+BzXeMWxFYmSBUAiY3Cr7+kYsEtjNMCe?=
 =?us-ascii?Q?3qZ4n/rG5cunVh7eZh9+VFas6wldtkmdak/EDMoGbiI4dQXyjCSIx6zdBujS?=
 =?us-ascii?Q?bWJvQygSi5vw0+5mH3Mfi7lvExusBr8+73/YVKjjWaXcH7NgDHRq75BcWtYq?=
 =?us-ascii?Q?vgrfy1XWDrJYZBh5ejzWV3YxEn5JcO+g+OgUv9KfNOG+3Nwf9cqDU8FY7+H8?=
 =?us-ascii?Q?Noz9sri2Pfohqa3ZW47FAXrW0AJaM3aEo+ROQhoIz+9HsH9JyfjM6fuoMLSy?=
 =?us-ascii?Q?oqkZAjxBKt4KDurX937QjRUld8XgXQYHVM2MLxkabEF2WhqLATH8ILQ02iWk?=
 =?us-ascii?Q?KPZzY3s+4SdxvIi+DSpaVU/bgCs0GgLjj3oNvEdkifOVrnmJCm0DPR/2Xpdu?=
 =?us-ascii?Q?n/SwiBXfH9SAh5yuAof4/KWAoHqiGEM5/s1QFdVFf5o/D2EjewfSt8yFHMyK?=
 =?us-ascii?Q?8VgLPxoOsfcqjQY0Q26v/TsM18ZE4l36oS/RliDNvB6V8X1O1moWqjixiJAQ?=
 =?us-ascii?Q?jtNVuLW8Tq5fJIY9PKwEBz6m+hPwSw57+sPYcb30UYJb2Kf3D1MlBGFK+yvx?=
 =?us-ascii?Q?BRa++i0y9/F7qlKXXD7A45vbeWwh01/UXDartUqCoTGzn7pKVDAHYAWzgtF/?=
 =?us-ascii?Q?FOSPo8K62xpDlOe+bRRTpk+vTfnigQZVDFNRw20jBDTKZSfgDUKOVZu0zKmE?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c2184d-40fd-4846-230c-08db18d94df1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:42:59.9394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZC3ObSr75Tz6k3rWWiKtO+DoPnPqBDU02n7tOPNF3mlecbC3AhWidMveZbjlh0yd8sGTTp2Z7pJZxukB7my8/085dnb8Q89Co5XZ3cxl70c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
X-Proofpoint-GUID: A5LgVVj6gYIcKZlSXpBonZzqX8I_JEyN
X-Proofpoint-ORIG-GUID: A5LgVVj6gYIcKZlSXpBonZzqX8I_JEyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_12,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302270121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 15:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177798

The following scenario currently fails:
git clone git://git.yoctoproject.org/poky
cd poky; . oe-init-build-env

add to local.conf:
require conf/multilib.conf
MACHINE = "qemuarm64"
MULTILIBS = "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 = "armv7athf-neon"

bitbake gcc-cross-canadian-arm

update local.conf to force a rebuild:
GCCPIE = "--disable-default-pie"

bitbake gcc-cross-canadian-arm

Failure log:
The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:extend_recipe_sysroot(d)
     0003:
File: 'poky/meta/classes-global/staging.bbclass', lineno: 164, function: staging_copyfile
     0160:        os.symlink(linkto, dest)
     0161:        #bb.warn(c)
     0162:    else:
     0163:        try:
 *** 0164:            os.link(c, dest)
     0165:        except OSError as err:
     0166:            if err.errno == errno.EXDEV:
     0167:                bb.utils.copyfile(c, dest)
     0168:            else:
Exception: FileExistsError: [Errno 17] File exists: 'poky/build/tmp/sysroots-components/armv7at2hf-neon/lib32-linux-libc-headers/usr/include/asm/byteorder-32.h' -> 'poky/build/tmp/work/x86_64-nativesdk-pokysdk-linux/gcc-cross-canadian-arm/12.2.0-r0/recipe-sysroot/usr/include/asm/byteorder-32.h'

In this particular case, the paths in lib32-linux-libc-headers manifest file
are prefixed with lib32-recipe-sysroot:
$ cat build/tmp/sysroots-components/manifests/lib32-linux-libc-headers.xxx
lib32-recipe-sysroot/usr/include/asm/byteorder-32.h
lib32-recipe-sysroot/usr/include/asm/sigcontext-32.h
...

When gcc-cross-canadian-arm is built, the actual files get copied to
recipe-sysroot directory during do_prepare_recipe_sysroot().

Because of this mismatch, on rebuild, sstate_clean_manifest() will not clean
the files in recipe-sysroot, but will instead try to delete the non-existent
files in lib32-recipe-sysroot. This will trigger the FileExists errors later.

Add checks in sstate_clean_manifest() for this corner case, so that
RECIPE_SYSROOT gets cleaned up properly.

This fixes BZ#15045.

Signed-off-by: Ovidiu Panait <ovidiu.panait@eng.windriver.com>
---
 meta/classes-global/sstate.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes-global/sstate.bbclass b/meta/classes-global/sstate.bbclass
index af93546b04..edf5c7fb65 100644
--- a/meta/classes-global/sstate.bbclass
+++ b/meta/classes-global/sstate.bbclass
@@ -529,9 +529,20 @@ def sstate_clean_manifest(manifest, d, canrace=False, prefix=None):
     entries = mfile.readlines()
     mfile.close()
 
+    recipe_sysroot = d.getVar("RECIPE_SYSROOT").rstrip("/").rsplit('/', 1)[-1]
+
     for entry in entries:
         sstate_clean_entry(entry, canrace, prefix)
 
+        # The sysroot directory stored in the manifest file might not be the
+        # same as RECIPE_SYSROOT, so the real sysroot will not be properly
+        # cleaned up on rebuild. Handle the cleanup here in order to avoid
+        # "File exists" errors during do_prepare_recipe_sysroot().
+        manifest_sysroot = entry.split("/", 1)[0] or None
+        if manifest_sysroot and manifest_sysroot != recipe_sysroot and not manifest_sysroot.endswith("-native"):
+            sysroot_entry = recipe_sysroot + "/" + entry.split("/", 1)[1]
+            sstate_clean_entry(sysroot_entry, canrace, prefix)
+
     postrm = manifest + ".postrm"
     if os.path.exists(manifest + ".postrm"):
         import subprocess
-- 
2.39.1


