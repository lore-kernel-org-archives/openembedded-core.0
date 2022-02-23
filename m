Return-Path: <liwei.song@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCE0C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 09:58:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5572.1645610293655483373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 01:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rkixDHEM;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=90537503df=liwei.song@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 21N9URUt025929
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 01:58:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=lkTmDUms74FeaRzj7Om1g98n96BZ1e96fAoEkXdxXAc=;
 b=rkixDHEMGF68nqtf8dy1ohKHlyOnWQa/B7FDJLP/RhmikCvjYSge8RT+kKY5zj3m+gc6
 elTS89wOuACy/t0BEBHbgBGwcRJ6183qEPq3V7TLXtRlakLBzgPqjKoF6P53Raqst/Zk
 vW67xeWGnVilBPkSbt3e6IaeayJ47Tn3NqRm/OI9YId6W+K29lVaTg/2mTCKhhpp7DGW
 5eaLk03TPZhxfVr987ru2XGmgu6UmScP8Gz3bSnU039q9FL9CWLzqe9evh7PLChB6YxL
 R16oEsRGRTK62Ogzg6V4xHCCtmbImnKMjYrUBWQe6Ee+U6qG5ZIVHUY8MdQcBQ6eHH5K hQ==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ecs9u975j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 01:58:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dog5YZD6NiJQI6AnnNEI/yzdOjY2Y4fx/YPEyEXiMWTmaTN+nLPoLlG8gZVhv8uXbr0fW9r9PVoUfieZj9ffCtUE+p1bldW73Q1iOZuQZ00O2jjveVfbHZ1YohFrd/rIJsicTzWMPB4inr0S4at5w1rlfAK9zaEPqLxA5d8y+4Wq0lisD9dDVQcPweXJRWYQnJbrw2xXusTAE+tesk9eJsBNuRcoakv5H6kPJDmieZLkeCUGlEmPBB1C7MG6VTjLtzwr419ZuBqmsHpgUAWm1nd9qE5x+593w0Qq1bXj4R8La9LUjNL5n18LDn69NorYwebhHni+2/SRrH44V0XzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkTmDUms74FeaRzj7Om1g98n96BZ1e96fAoEkXdxXAc=;
 b=jfTOsZiicCJOunijImOu2ZDF4/Lwa2i0cYSSGKa428wUObC0vb9yzK+yJwChipToWDVOUoQlldpNrm8WcI31EEVoWhKW/ik64PsXDbtKzeDhHgR8msaepwdGUn92MRNpQoYVXlbl1bYid95GTvroSm6uCfpnJAA1ZqALSF3kgLPFzW5ivceQ17f5Hrajc2rJQrEaU9s8C/TqOY8LaQLt0pU6o7Ei+Ox09phvRxd6LUVpH5OsKtNxkZ26M44jUlwOmXCdhIaJjS/mBiqIIRPLZqc+D7fPI/vsG0H9aG1dILgQitrdVavIAz+CNY8Yu/oL1iWP2zr770BQNz2GVOCoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5348.namprd11.prod.outlook.com (2603:10b6:610:bb::16)
 by BYAPR11MB3384.namprd11.prod.outlook.com (2603:10b6:a03:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Wed, 23 Feb
 2022 09:58:09 +0000
Received: from CH0PR11MB5348.namprd11.prod.outlook.com
 ([fe80::e843:f280:ee74:7c59]) by CH0PR11MB5348.namprd11.prod.outlook.com
 ([fe80::e843:f280:ee74:7c59%6]) with mapi id 15.20.4995.027; Wed, 23 Feb 2022
 09:58:09 +0000
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Cc: liwei.song@windriver.com
Subject: [OE-core][PATCH] qemu: add tpm string section to qemu acpi table
Date: Wed, 23 Feb 2022 17:57:55 +0800
Message-Id: <20220223095755.5758-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To CH0PR11MB5348.namprd11.prod.outlook.com
 (2603:10b6:610:bb::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b61efa14-a0f8-4cf5-9286-08d9f6b2fed5
X-MS-TrafficTypeDiagnostic: BYAPR11MB3384:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3384EC8B93AAF7BD798C62189E3C9@BYAPR11MB3384.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LySEK6W5hQIwft5Ld9mPyI1N38nto9hYOeZM5lGTf2x5TjnMXqZ1jO5L9f/f0gI7dxIdhmld537SwvdJIugtg43IrDBk3hFfV/M/4p4EXuXkVUjsCPS/Nh/ZE+C5nsrqwu+C4H3wiwPGj6FFbCSvSP4CXigrSxwluUv8Fd3Xjf4n4cTmWrSa8UOe3J2Xwf/cUvTKTVKO3Bw68zNgllAw1IOsOgazvcfE10guCx7XrhLxVuiIr04VGEMOEyUqUIOrZ+P/Xo/Z3YApfC/gBKDbjT5vOnkByq7dCVr/upMCob1DT06UAwBKbhqPnqEEsCBVvCwmM1g++JixTygBBMOcLYAfsJfUsUgYkEe6+RQ9WYof1MV8sVcqTwptnv/PbTJ7z4EXZ14qUC3dSsV4AF8Sbngblw2b8NtF7i22kBq+zd2r+LlQnX5gWD7+b2S8ONWh2bQAy/GwzGXrev86AzQQHlAhouasgL6lzJPVTl+toniA+dmF4ZPqzO/GrdseUggD92aYkD+d7FUFaj1k14sdUD2B+Yfl6oIzDvrhYe67uo4BUIWaOlPqYECmEjVJoTI+bAKZteVOhwnOwXObMXUlQ2/5fQfiWMCLTKy4jmNdkI72GT/DqgXEgR+fE2KXvanBK8R/VUHNYZdUCU2QxpSzaPQG5NdICn3aUJTGSzZ4Vsd7XQRqUHZVG5+ZogtY/ctrv0rKkp93TWdRnz+6L+4u9Z/0sO8pyVKxzR3WhRLFlTNxBuFOB9g++6/AWyvQF+Bf4aw+wKSmg8kM3vNRGI4s13IoIXK8JEuhCwT30uhPtbRYlKSbKzkcYesAnfAoF+Pn
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(2906002)(66556008)(6512007)(8676002)(38100700002)(38350700002)(6666004)(66946007)(8936002)(52116002)(6506007)(966005)(508600001)(4326008)(44832011)(6486002)(5660300002)(86362001)(6916009)(2616005)(316002)(1076003)(186003)(26005)(83380400001)(36756003)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HYlST7kMVE87QoNnvVDBgajY//fWyfEIWuW+JU6D5WxdU3FH7WWQAcFh16r+?=
 =?us-ascii?Q?5ZKkH7ds0cEyaeoW8JyUPCBF8bJ75iXsrG0HaFUKnUBjqVzFxj6piQ4zgDq7?=
 =?us-ascii?Q?m/Ld+3I8KyQ9sm0JuOS7NbH1sVIAtvnyFm82R1ljYfc3pQ3H9vZ1JkA3x4Bu?=
 =?us-ascii?Q?LrK7CiXxlksDapP+a5GIZ8AfVqlO/P7ZAH76/U7nexXYvaEbVY865dGx4mus?=
 =?us-ascii?Q?yfC3yQ4YwkqQ3kdvOkyOvoRsmAFTmPT5YmWwSQ/w0sPaAqMpc1MVrFovNp9T?=
 =?us-ascii?Q?5Gszr4A58AqLNYPs+7UQVeFCwTU8eKnk2QvKVzH8Ed2z3d0mIWgsvahED2s2?=
 =?us-ascii?Q?88pR0aKM6X7o9rGwwSA5htS7ZHi7eOfQULmHWggW1q83z9f7djJQWV9AWknN?=
 =?us-ascii?Q?aO7Eh+G3kfahNYz/2eewW+rupxLlLxmu0njpmGH5DQl2OQ4c2xk2Fwsd9CrZ?=
 =?us-ascii?Q?tWB5URc9hQKPjJygVc2eEN0g2uH/K1DKyRZ9nn8+jkeVigWdF2ouZm7Dp4tp?=
 =?us-ascii?Q?TjlIgr5DA+TnRJBxkyzJkn+GpohgP0aMMltdDV95D2n0IqZvgQLHPLHFeilz?=
 =?us-ascii?Q?cR8+Am2FRfufeEsq7Eb2VqbFkK365cBoUlDgyDfTeRKZebtlbSrCG+Y/rH1g?=
 =?us-ascii?Q?pPE/HPDH02jOZDJsw/xCLTLYDDAuOrYvTtBZ1Juu1s1REUD7TieI152nLJ2y?=
 =?us-ascii?Q?OEBMwojF7KDYD5PgqCqeXx/YhCsq1zDOYaXeZZa7ds5AYpseOdsYB4MIy8xQ?=
 =?us-ascii?Q?Umzi+D7cGH7qveyxYUIb39QblpGVZWWPdwyWazhHVtzKqzyKQiQA/fdWLwgp?=
 =?us-ascii?Q?2wq6e+NNZz9U/f36nbrwSPmqi8DyeyPFMSAGrZYtcGAd25aUK/WDvCdOs7zD?=
 =?us-ascii?Q?5p0a6HcYQXMRuiFHKTfX3uKan6H8wu/QiB5t0GtR+PhqNZ3v0GCM/cLWdzOb?=
 =?us-ascii?Q?EQflA+C7OnxIQrJq/0t/eMshnR25EWeemOrvdZZirMXjOIZTb2pzVcX74D3p?=
 =?us-ascii?Q?tEcItDOXvIAbSMOxrJGcNYO+KfC2UigRomeNObjoY8V7txpGk3vS7AX7Nyj8?=
 =?us-ascii?Q?LktrwFp9AhiXfO/kYNTrtvx+rte4qO8xIdJ11IkNqLRowo3b0rkKwnoc0ROK?=
 =?us-ascii?Q?c/JoUW8Wqs8mDgjxA1ip4lu3+v96ho0Ya/fwA97Qi9qofgMxhKIzImkdCs/x?=
 =?us-ascii?Q?lReM2kTyQUuymoI9U5hFnvjCz7TO3MY+6hTX0odpMloqo5BL+f4O+vC7pmM+?=
 =?us-ascii?Q?hfuxiEbOVLh3PXtt8HbEHJTJUqSP2dm9BACrZd9YNx25v6RS3sIxQT4PoFsz?=
 =?us-ascii?Q?vbp+PJVUnhiBF0yJLciKACCUd9sXDvTqPgTcebQcotmDjl9NpKUC0d3vSuMG?=
 =?us-ascii?Q?8lqDuT86kx2azQhHerW4gLhkbTeIzkKkQ+Ay0bZOy8wBFwkemZoqunl/ZU9g?=
 =?us-ascii?Q?xLPvk2AZ77k3Y9lanmgKjgtXmEExMhsgJ8onF39isd8Dg/qxUE2miWJTn3qi?=
 =?us-ascii?Q?7cYs5+HC2AWE3sC7LN+CCPqm0EhNgsXNbNA6AUfVVkeIFrxlIzmvY8c3N+9P?=
 =?us-ascii?Q?DcCABlS0vg8QLsgZ6xEkZNYnkuJirWj3OnFMjmbi1H+5eRUCsJgcCttoV4nk?=
 =?us-ascii?Q?rBTBl5KyFej2yV2u7j54gTZPL3WITOOaateuetLtfClDgxoxXItToctIQ3Gc?=
 =?us-ascii?Q?begZ/w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b61efa14-a0f8-4cf5-9286-08d9f6b2fed5
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 09:58:09.3562
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 e56QEU1vHVA9vA8bD16UWuMlKzkTlR2YXydpaHZhRmpg5GiYZjJlGNruPmVlez/bTPWYJtPkuEg0gtTtIfX7RIMl6Ie+YXD/U9eIiAq6K00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3384
X-Proofpoint-GUID: -MsJ5hfBQInLI1oUkWCjqiXSdSqBFgru
X-Proofpoint-ORIG-GUID: -MsJ5hfBQInLI1oUkWCjqiXSdSqBFgru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_03,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202230055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 09:58:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162249

This will create _STR and _UID section for TPM in qemu acpi table,
with these section, the missing "description" and "uid" files will
be created for TPM in /sys by kernel.

Signed-off-by: Liwei Song <liwei.song@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...issing-device-identification-objects.patch | 83 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-acpi-tpm-Add-missing-device-identification-objects.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 80b83be63f70..fe2bb4d94836 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch \
+           file://0001-acpi-tpm-Add-missing-device-identification-objects.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-acpi-tpm-Add-missing-device-identification-objects.patch b/meta/recipes-devtools/qemu/qemu/0001-acpi-tpm-Add-missing-device-identification-objects.patch
new file mode 100644
index 000000000000..ff9167487900
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-acpi-tpm-Add-missing-device-identification-objects.patch
@@ -0,0 +1,83 @@
+From 5903646d3913af6544680f6645fcb7296d0b3a1c Mon Sep 17 00:00:00 2001
+From: Stefan Berger <stefanb@linux.ibm.com>
+Date: Tue, 4 Jan 2022 12:58:05 -0500
+Subject: [PATCH] acpi: tpm: Add missing device identification objects
+
+Add missing TPM device identification objects _STR and _UID. They will
+appear as files 'description' and 'uid' under Linux sysfs.
+
+Following inspection of sysfs entries for hardware TPMs we chose
+uid '1'.
+
+Upstream-Status: Backport [5903646d3913af6544680f6645fcb7296d0b3a1c]
+
+Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
+Cc: Michael S. Tsirkin <mst@redhat.com>
+Cc: Igor Mammedov <imammedo@redhat.com>
+Cc: Ani Sinha <ani@anisinha.ca>
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/708
+Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
+Reviewed-by: Ani Sinha <ani@anisinha.ca>
+Reviewed-by: Shannon Zhao <shannon.zhaosl@gmail.com>
+Message-id: 20211223022310.575496-3-stefanb@linux.ibm.com
+Message-Id: <20220104175806.872996-3-stefanb@linux.ibm.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Reviewed-by: Igor Mammedov <imammedo@redhat.com>
+Signed-off-by: Liwei Song <liwei.song@windriver.com>
+---
+ hw/arm/virt-acpi-build.c | 1 +
+ hw/i386/acpi-build.c     | 7 +++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
+index d0f4867fdfe5..f2514ce77c0b 100644
+--- a/hw/arm/virt-acpi-build.c
++++ b/hw/arm/virt-acpi-build.c
+@@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
+ 
+     Aml *dev = aml_device("TPM0");
+     aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
++    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
+     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
+ 
+     Aml *crs = aml_resource_template();
+diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
+index 0234fe7588b7..ce823e8fcb97 100644
+--- a/hw/i386/acpi-build.c
++++ b/hw/i386/acpi-build.c
+@@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
+                     dev = aml_device("TPM");
+                     aml_append(dev, aml_name_decl("_HID",
+                                                   aml_string("MSFT0101")));
++                    aml_append(dev,
++                               aml_name_decl("_STR",
++                                             aml_string("TPM 2.0 Device")));
+                 } else {
+                     dev = aml_device("ISA.TPM");
+                     aml_append(dev, aml_name_decl("_HID",
+                                                   aml_eisaid("PNP0C31")));
+                 }
++                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+ 
+                 aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
+                 crs = aml_resource_template();
+@@ -1844,12 +1848,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
+     if (TPM_IS_CRB(tpm)) {
+         dev = aml_device("TPM");
+         aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
++        aml_append(dev, aml_name_decl("_STR",
++                                      aml_string("TPM 2.0 Device")));
+         crs = aml_resource_template();
+         aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
+                                            TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
+         aml_append(dev, aml_name_decl("_CRS", crs));
+ 
+         aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
++        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
+ 
+         tpm_build_ppi_acpi(tpm, dev);
+ 
+-- 
+2.17.1
+
-- 
2.17.1


