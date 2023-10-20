Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AB7CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:58:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.50806.1697795926196317935
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 02:58:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MDtU/ABu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8657a60783=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K99xcF031457
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 09:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=S5eip9QTyv458nIa0t
	CDwxalSNjM1Z44oq8zeJqpgfo=; b=MDtU/ABugUVhP2LjMMbsOnVISlLFQFMZv3
	l2ujUGEi9Shs7kApSscYgTOngao8Ekhq8wAmEZ3nKmUPNMpiMGMoJnvGPTijLdCo
	QFRlf8JKR4JHlhHQDoxe5+OWbEngeupEgFc4CfmdYXQv6oFbYmRXUP4dMKbNYJEz
	7UwHD5ZIQZu2kQaW4SDxLLyRaYRpGBC7EwnemCpMUqhn1LwjGclwnwzPcE4ou2Jy
	6IZt33BZb630PfTDhOcBMOpvkP4xlD73PmCI/oUDtlpfupXlzJ1EC61XEZyhnnGW
	glwCvX33vYC/N5reM9v+Tc2djf9Z9crldz/TitPAmVUaQhTZ4SRA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuevt8d23-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 09:58:44 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 39K9sjYQ014322
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 09:58:44 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuevt8d21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 09:58:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnSytw1mJTIThSZRkqZHLrAfc8BlP2LKpAl8+uWArJGJ4Z7nQ4R+GrpLJPvjo1nAET/+BKVkvBRgt60acxNzBlmQ0OV5iiOBAz5sWb5lsNUYf/cMA+o3G+9A8nzkDn9i+ehrpj60KetHRPm6fORFk57LCjlYFdIKv7saRrVO1iZwnUtSc+5S0CgFxkouozxgi3QOOi/0AmK4vj8UKxCsuZcZeoiwBiDM33oOFzYX0sJ1pP52vogS9brU9nWcZz2HvJ+UCgulGUyp+ajpdMRrMi8aJ/zZIKYltJq5Z+BbzxqeRFGSlRYUAIlLHu/NHZJqnOkK0Wy6B0u9h9n9Dy39gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5eip9QTyv458nIa0tCDwxalSNjM1Z44oq8zeJqpgfo=;
 b=GS6uE7Kf+3Cc4iFbj0SsEuI8KRnRphrBkFU+VscN/F3TOyLLA4iP2bVoG3KxsGO2irp0aVcX+37el7YrlFpBgvPlV/YrDC803nFIRxBzHdzofnkBgtR2u1uTOF9dtcdV9jlsDN3H/IUhBD9ZwBJh4U7+DhOnqTv1/PJpdays3zOqdQVv8C4nd8V5obs6A7unha1LJfhy/AxQnHRZd+qa6j4PO9xGi7c/aiQcSQV/e/ja/f278TN8K4qyjPTa8swSYaUy2hvldG43fNDzS1QGrlIkENo4UP4t9EGRcIl11f7VwsImku0ageWygBzw50Yf6dGnZiQyZBQXbiPQVIhgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH2PR11MB4470.namprd11.prod.outlook.com (2603:10b6:610:4a::32)
 by DM4PR11MB5471.namprd11.prod.outlook.com (2603:10b6:5:39d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Fri, 20 Oct
 2023 09:58:32 +0000
Received: from CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::f04c:4fda:9b29:3fa]) by CH2PR11MB4470.namprd11.prod.outlook.com
 ([fe80::f04c:4fda:9b29:3fa%4]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 09:58:32 +0000
From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, umesh.kallapa@windriver.com,
        alex.kiernan@gmail.com
Subject: [PATCH] rust: Upgrade 1.70.0 -> 1.73.0
Date: Fri, 20 Oct 2023 02:57:58 -0700
Message-Id: <20231020095758.2672519-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To CH2PR11MB4470.namprd11.prod.outlook.com
 (2603:10b6:610:4a::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR11MB4470:EE_|DM4PR11MB5471:EE_
X-MS-Office365-Filtering-Correlation-Id: 0128bd17-d36e-4848-7b77-08dbd1531da3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A4NjZpqmg55asCYQh37+b4Jfez7xmyPPZWhZt5py+8yhMJjXUiyTuckaEMEaQtKGvf64Pp4bsfAbkBmheG1FA/klvb7EAbosdN9hFPd46SpUQlPoFi6OfpmxE84Fgdf25r+rbo+yCGPBdcTnBYt1P9DOwtnLBZFipAE+uPkOewikCv/kyBExVJFP8NFhl9tWMud6UfnpSf84PeA82QSJ4W10MmZId4arw2waZ9uOKJ1zU/l1zYUS1ejc1waYWBOppArxNuQamLT3lRUlK0SzkRld5ifwb2+gRsLBjI6cruslr1WRSUc+7Omk6w0/UbSaNdJUggAqTCT1p/b64TPWuhf25FMPbWnZRaP/BYRW6vbCV0EBu1oM1RJe/XC2Da8K6zq2SBrwhyp8N52HlrZGxiIXf/fckWAI3+qXAYaQ5MGq5MFx8PEoCUhG22zj5yEphhCmofseqsizxwBtT/NpQouIlAXEaqOXhTa9jgbJF4UAO0r49AuZ9SosoAcDSEJNhJcXNwGDF0iIyqZQF/1NgVKjsrxJtCd8o86x27Q7/ZwYPod9skJeCtYFr5UDU03BFDtPy5/Eg1gglrPBkp65MaPOX5rQZmhvh4HJD+4XGpsjwK7Fb58O1AFRZQs8qR4nFq5+3Bai5aKvbifISQJvkF+eRrf+dqwYsf6HJ82luaM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR11MB4470.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(346002)(136003)(376002)(39850400004)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(83380400001)(36756003)(26005)(966005)(6512007)(66946007)(41300700001)(66476007)(478600001)(6486002)(6506007)(66556008)(52116002)(316002)(6666004)(6916009)(86362001)(4326008)(8936002)(8676002)(30864003)(2906002)(5660300002)(1076003)(38100700002)(2616005)(38350700005)(84970400001)(46800400005)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yLkHedFFrey+K3eONN9tUZdonp8U5CM29IdwoYEkE4P19pEh42cry0FsVA8t?=
 =?us-ascii?Q?HlQmUm+83bcnhRZFe1zDIxc8YVM1FGkdLmpUnuBvf9oNFE5Ll5WMgeUPr8wa?=
 =?us-ascii?Q?h0bIwwnKVaEfjjH7v97d5dTqjIl85m5SHIk7iUHtQxqoo7aS11J5odEkTV0X?=
 =?us-ascii?Q?USyVm8JX2ntKKo4W1bD5uBoX2FgAB+8U2qbqzBV1Rbz5FLsuV87eMW0S6BgA?=
 =?us-ascii?Q?cwZVOZaLtserUtHJjCsl3AVEodzJbdrR1O9kKL04hHk6wlhpVhrhn7mpoD6U?=
 =?us-ascii?Q?MVxcmQ3TGcCy5sdsblSFOjTnSP8KTqd13ddM4ECgeJ110smRk3GIcVhFRijp?=
 =?us-ascii?Q?8mUjMm2bO5NyxOMNWGcn583u7Kbiq5uKlj1fdurSxvtf8ihRiuJPjDapBg8z?=
 =?us-ascii?Q?B/UIR18P4cDnEPN6G9rVMpG+bfL2nektMhP/bbO6+sc0wlFvC2ctcYAM5qXs?=
 =?us-ascii?Q?3qaopOSMtojBcBORHcnIVOt3wD77/8K0viyGwUa27ThtYGQld/jXJFSRgNy4?=
 =?us-ascii?Q?8zc/vbyK62D+x1jt75rX3HBtiwJbtzVNE2luRhBmGP1zXZUzyDml7pgu5Cv0?=
 =?us-ascii?Q?zoYGFc3ndOho2f9asfz0m2LcPCEQNkBGWn6oKhiupflmrCLjta21CB3dsJo0?=
 =?us-ascii?Q?pmtGV06s34UNwAjJSznephG1+lUFT1bnT+RcaYSOhcSCvMxle1KOjvPfm54G?=
 =?us-ascii?Q?LOO/Kivnt2b6168Wkh3Vv79t9huGrkBYaxPqXHs+98CH5gJDLSjHg7Kjkhgb?=
 =?us-ascii?Q?ISux/qNMxJ+J8RxTjcOBnwP69p8EYvSgocWtPgjY2moAVDFAFUxXphv8Febq?=
 =?us-ascii?Q?KWybci3FIdbRzOnyjKxk+KGo566xstdZ4iY2bw4WgmqfyCP8TL4RSdZBMImh?=
 =?us-ascii?Q?kzdX5EnXL4gG2mCVB1LA7KkTHv/lLMoKUgCW0+O9FMn/0LN9dI934wxLhCoO?=
 =?us-ascii?Q?ySlI/C+2FzMPoyljse3lPxyyWBPBywJ72r7jEVNeFF/+TalzK8MpJNpU3X1A?=
 =?us-ascii?Q?QyTnG8HWyBEkzQyYCI6ItXcF7BzH+a/2bRP1x2o6j30Np3nad+tbJ474j12g?=
 =?us-ascii?Q?zoCE6fzLXP8/wJtWLOFSJel00OBE/HtodglbifD5KxK8yBsVMcfJU4F+yZY5?=
 =?us-ascii?Q?NqvdsLWhtQwpphuCjR5XkWBvUzZ5bcNe9MsmLJNFUFSz/MFt1q6/ZuAJQ1XF?=
 =?us-ascii?Q?VdFtbiqSHcQrDvdeoDobZHbZHwvULxcBhVS3SyQnUyf8ToBt47AdqnIP4+uc?=
 =?us-ascii?Q?bqi4KRJ41fiJ3+Us0MCBYWLPDX1yLsD7Vm0eZURGRQiugOCFfeAv1gVI0z00?=
 =?us-ascii?Q?ifm8x4XXGiLOmxPGNg2zYSfvAxNhMcCRtIVtVogKXRoMEpoLfE8i9rdTDmwM?=
 =?us-ascii?Q?WfIKe2kuIpyCAlOM21aYFYIGL2ztWMpJ2IfQTXnzIM1YF5PUiOJRFfSVOJ3d?=
 =?us-ascii?Q?MRCRmi21xtSZk+180TA8ZOUp1mErUq/Z9+aeaYeW/oyGqCJ+hSQrcgQZNAC5?=
 =?us-ascii?Q?Fwv5aGrb2I9soa4yqzKOK1pKhLI3OhzLSzLcfIjy2+yO1esH926TWysk1V/V?=
 =?us-ascii?Q?ts52r0pvDtmx3k0mzzTC2EjejeVL5IIHeKo7bhHQvyhs15Fo4Q07rtvp1xIs?=
 =?us-ascii?Q?3e6HM9Ga1MsRDqTdxWipwzM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0128bd17-d36e-4848-7b77-08dbd1531da3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR11MB4470.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 09:58:31.6788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ngVRJ+xgdKZAeWAG2+ODZgphTFA7E1cPLWN7eXDQBu+h8iP12qI0gcuqSMm7nTIiLQSBqJp0sG9XMUcgt7MjC/cL22pHh+GFNSayr7V/Eoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5471
X-Proofpoint-ORIG-GUID: mpcY34sblYOdtRlsFqrkpQnwHtez81hb
X-Proofpoint-GUID: MZy6LLcimjPtnGI-uXZ-G4jVDy4-SKCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_08,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2310170000
 definitions=main-2310200082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 09:58:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189512

rust upgraded to v1.73.0

In rust 1.72.0 the 'mips*-unknown-linux-gnu*' support demoted from tier2 to=
 tier3. The mips bootstrap compiler is removed from src/stage0.json file an=
d so the same are removed from rust-snapshot.inc. [https://github.com/rust-=
lang/rust/releases/tag/1.72.0]

Dropped: getrandom-open64.patch
Dropped: bootstrap_fail.patch

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../rust/{cargo_1.70.0.bb =3D> cargo_1.73.0.bb} |   0
 ...-Do-not-use-LFS64-on-linux-with-musl.patch |  68 +++++-----
 ...efine-SOCK_SEQPACKET-in-common-place.patch |   5 +-
 .../rust/files/bootstrap_fail.patch           | 127 ------------------
 .../rust/files/getrandom-open64.patch         |  46 -------
 .../rust/files/lib-test-features.patch        |  18 +++
 .../rust/files/zlib-off64_t.patch             |   5 +-
 ...ibstd-rs_1.70.0.bb =3D> libstd-rs_1.73.0.bb} |   0
 ....70.0.bb =3D> rust-cross-canadian_1.73.0.bb} |   0
 ...ust-llvm_1.70.0.bb =3D> rust-llvm_1.73.0.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  |  62 ++++-----
 meta/recipes-devtools/rust/rust-source.inc    |   5 +-
 .../rust/{rust_1.70.0.bb =3D> rust_1.73.0.bb}   |   0
 14 files changed, 86 insertions(+), 252 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.70.0.bb =3D> cargo_1.73.0.bb} (=
100%)
 delete mode 100644 meta/recipes-devtools/rust/files/bootstrap_fail.patch
 delete mode 100644 meta/recipes-devtools/rust/files/getrandom-open64.patch
 create mode 100644 meta/recipes-devtools/rust/files/lib-test-features.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.70.0.bb =3D> libstd-rs_1.73=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.70.0.bb =3D> rust=
-cross-canadian_1.73.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.70.0.bb =3D> rust-llvm_1.73=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.70.0.bb =3D> rust_1.73.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 707402e6eb..4219a9b568 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ LINUXLIBCVERSION ?=3D "6.5%"
 QEMUVERSION ?=3D "8.1%"
 GOVERSION ?=3D "1.20%"
 LLVMVERSION ?=3D "17.%"
-RUSTVERSION ?=3D "1.70%"
+RUSTVERSION ?=3D "1.73%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.70.0.bb b/meta/recipes-devt=
ools/rust/cargo_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.70.0.bb
rename to meta/recipes-devtools/rust/cargo_1.73.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linu=
x-with-musl.patch b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-=
on-linux-with-musl.patch
index 7f8d62a256..5b34f03307 100644
--- a/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-=
musl.patch
+++ b/meta/recipes-devtools/rust/files/0001-Do-not-use-LFS64-on-linux-with-=
musl.patch
@@ -14,15 +14,10 @@ namespace changes [1]
 Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/106246]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- library/std/src/os/linux/fs.rs |  9 ++++++++-
- library/std/src/sys/unix/fd.rs | 14 ++++++++++----
- library/std/src/sys/unix/fs.rs | 27 ++++++++++++++++++++-------
- 3 files changed, 38 insertions(+), 12 deletions(-)
-
-Index: rustc-1.70.0-src/library/std/src/os/linux/fs.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.70.0-src.orig/library/std/src/os/linux/fs.rs
-+++ rustc-1.70.0-src/library/std/src/os/linux/fs.rs
+diff --git a/library/std/src/os/linux/fs.rs b/library/std/src/os/linux/fs.=
rs
+index 479bbcc17a8..ab0b2a3eda3 100644
+--- a/library/std/src/os/linux/fs.rs
++++ b/library/std/src/os/linux/fs.rs
 @@ -329,7 +329,14 @@ pub trait MetadataExt {
  impl MetadataExt for Metadata {
      #[allow(deprecated)]
@@ -39,13 +34,13 @@ Index: rustc-1.70.0-src/library/std/src/os/linux/fs.rs
      }
      fn st_dev(&self) -> u64 {
          self.as_inner().as_inner().st_dev as u64
-Index: rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.70.0-src.orig/library/std/src/sys/unix/fd.rs
-+++ rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
-@@ -121,9 +121,12 @@ impl FileDesc {
+diff --git a/library/std/src/sys/unix/fd.rs b/library/std/src/sys/unix/fd.=
rs
+index 85e020ae413..7489d5d23fe 100644
+--- a/library/std/src/sys/unix/fd.rs
++++ b/library/std/src/sys/unix/fd.rs
+@@ -124,9 +124,12 @@ pub fn read_to_end(&self, buf: &mut Vec<u8>) -> io::R=
esult<usize> {
      }
-=20
+
      pub fn read_at(&self, buf: &mut [u8], offset: u64) -> io::Result<usiz=
e> {
 -        #[cfg(not(any(target_os =3D "linux", target_os =3D "android")))]
 +        #[cfg(not(any(
@@ -56,11 +51,11 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
 -        #[cfg(any(target_os =3D "linux", target_os =3D "android"))]
 +        #[cfg(any(all(target_os =3D "linux", not(target_env =3D "musl")),=
 target_os =3D "android"))]
          use libc::pread64;
-=20
+
          unsafe {
-@@ -276,9 +279,12 @@ impl FileDesc {
+@@ -281,9 +284,12 @@ pub fn is_write_vectored(&self) -> bool {
      }
-=20
+
      pub fn write_at(&self, buf: &[u8], offset: u64) -> io::Result<usize> {
 -        #[cfg(not(any(target_os =3D "linux", target_os =3D "android")))]
 +        #[cfg(not(any(
@@ -71,13 +66,13 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fd.rs
 -        #[cfg(any(target_os =3D "linux", target_os =3D "android"))]
 +        #[cfg(any(all(target_os =3D "linux", not(target_env =3D "musl")),=
 target_os =3D "android"))]
          use libc::pwrite64;
-=20
+
          unsafe {
-Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.70.0-src.orig/library/std/src/sys/unix/fs.rs
-+++ rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
-@@ -47,9 +47,13 @@ use libc::{c_int, mode_t};
+diff --git a/library/std/src/sys/unix/fs.rs b/library/std/src/sys/unix/fs.=
rs
+index a5604c92a80..cc1aab45e71 100644
+--- a/library/std/src/sys/unix/fs.rs
++++ b/library/std/src/sys/unix/fs.rs
+@@ -39,9 +39,13 @@
      all(target_os =3D "linux", target_env =3D "gnu")
  ))]
  use libc::c_char;
@@ -93,10 +88,10 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
  use libc::fstatat64;
  #[cfg(any(
      target_os =3D "android",
-@@ -58,9 +62,10 @@ use libc::fstatat64;
-     target_os =3D "redox",
+@@ -51,9 +55,10 @@
      target_os =3D "illumos",
      target_os =3D "nto",
+     target_os =3D "vita",
 +    target_env =3D "musl",
  ))]
  use libc::readdir as readdir64;
@@ -105,7 +100,7 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
  use libc::readdir64;
  #[cfg(any(target_os =3D "emscripten", target_os =3D "l4re"))]
  use libc::readdir64_r;
-@@ -81,7 +86,13 @@ use libc::{
+@@ -75,7 +80,13 @@
      dirent as dirent64, fstat as fstat64, fstatat as fstatat64, ftruncate=
64, lseek64,
      lstat as lstat64, off64_t, open as open64, stat as stat64,
  };
@@ -119,16 +114,16 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
      target_os =3D "linux",
      target_os =3D "emscripten",
      target_os =3D "l4re",
-@@ -91,7 +102,7 @@ use libc::{
+@@ -85,7 +96,7 @@
      dirent as dirent64, fstat as fstat64, ftruncate as ftruncate64, lseek=
 as lseek64,
      lstat as lstat64, off_t as off64_t, open as open64, stat as stat64,
  };
 -#[cfg(any(target_os =3D "linux", target_os =3D "emscripten", target_os =
=3D "l4re"))]
 +#[cfg(any(not(target_env =3D "musl"), target_os =3D "emscripten", target_=
os =3D "l4re"))]
  use libc::{dirent64, fstat64, ftruncate64, lseek64, lstat64, off64_t, ope=
n64, stat64};
-=20
+
  pub use crate::sys_common::fs::try_exists;
-@@ -278,6 +289,7 @@ unsafe impl Sync for Dir {}
+@@ -272,6 +283,7 @@ unsafe impl Sync for Dir {}
  #[cfg(any(
      target_os =3D "android",
      target_os =3D "linux",
@@ -136,29 +131,30 @@ Index: rustc-1.70.0-src/library/std/src/sys/unix/fs.rs
      target_os =3D "solaris",
      target_os =3D "illumos",
      target_os =3D "fuchsia",
-@@ -312,6 +324,7 @@ struct dirent64_min {
+@@ -313,6 +325,7 @@ struct dirent64_min {
  }
-=20
+
  #[cfg(not(any(
 +    target_env =3D "musl",
      target_os =3D "android",
      target_os =3D "linux",
      target_os =3D "solaris",
-@@ -787,7 +800,7 @@ impl DirEntry {
+@@ -809,7 +822,7 @@ pub fn file_name(&self) -> OsString {
      }
-=20
+
      #[cfg(all(
 -        any(target_os =3D "linux", target_os =3D "emscripten", target_os =
=3D "android"),
 +        any(not(target_env =3D "musl"), target_os =3D "emscripten", targe=
t_os =3D "android"),
          not(miri)
      ))]
      pub fn metadata(&self) -> io::Result<FileAttr> {
-@@ -811,7 +824,7 @@ impl DirEntry {
+@@ -833,7 +846,7 @@ pub fn metadata(&self) -> io::Result<FileAttr> {
      }
-=20
+
      #[cfg(any(
 -        not(any(target_os =3D "linux", target_os =3D "emscripten", target=
_os =3D "android")),
 +        not(any(not(target_env =3D "musl"), target_os =3D "emscripten", t=
arget_os =3D "android")),
          miri
      ))]
      pub fn metadata(&self) -> io::Result<FileAttr> {
+
diff --git a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACK=
ET-in-common-place.patch b/meta/recipes-devtools/rust/files/0001-musl-Defin=
e-SOCK_SEQPACKET-in-common-place.patch
index 8723f552b6..7b59854d94 100644
--- a/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in-c=
ommon-place.patch
+++ b/meta/recipes-devtools/rust/files/0001-musl-Define-SOCK_SEQPACKET-in-c=
ommon-place.patch
@@ -109,6 +109,7 @@ Index: rustc-1.70.0-src/vendor/libc/.cargo-checksum.json
 --- rustc-1.70.0-src.orig/vendor/libc/.cargo-checksum.json
 +++ rustc-1.70.0-src/vendor/libc/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"96bf2f6d97a370699fa12dba540978a01b5cd84=
dd72fe6cff8a7700744e8122e","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"104ceb079ec13f06d=
440a348a07974ff5a18dca1f74b9c2fde7be9e3074c25e7","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"68d860865d8ccc6c493948=
c781105e0901fc3312cfa1337f0092c0668706200a","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"24111461547739f=
3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/macros.rs":"b457eb0=
28b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42a=
b7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9c=
f4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12856d=
ddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.rs":"55a5280c0e549=
8c1632b2772a7846bce0a130dde61a7fd59220d7971f9084b56","src/unix/aix/powerpc6=
4.rs":"8c471cf7e4604da9f640db1be68d918303b326744e36e6ee159114040401d2cf","s=
rc/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56=
d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0=
385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"2546ad=
3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/bsd/a=
pple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820a0483e7c758ed336c=
c59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f263afe=
7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/b64/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5=
cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec833a7=
47866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/ap=
ple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b3bf=
d83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c819dc6=
5ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"52b9=
0d584e771447c3608079681adbb32367267021d12f5eb5940b7646f16f4a","src/unix/bsd=
/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b20=
8170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"8986a=
8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058","src/unix/bsd/=
freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e4b16=
0a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670=
eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7=
d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.=
rs":"fa83dcd4597c6621b95228d80ea6250c37136463300f80a9961a09bdab5e25c3","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686=
d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/f=
reebsd12/mod.rs":"c7c574d65a8408f6eee32bd5d0cc40e33e41c7e61d98d338609ae5bee=
c72f390","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f12=
2f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freeb=
sdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7=
553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs=
":"834ec71df759e8d38489986b7720f1b296ca774c23c8034e2d9b02b9f55ab781","src/u=
nix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d=
22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/=
freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe1=
97ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"58b7766136a2=
2ace828c974f34240eb38feec2c8aa2ee8b6ca38e3b44a6fa348","src/unix/bsd/freebsd=
like/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc9=
1c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"cbfb50=
eeca94674f3e51992ab41cb020127d9405002eacf4b8bf7b2a0418f2ea","src/unix/bsd/f=
reebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747=
a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2da=
e3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bs=
d/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e089551a=
04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e=
3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/f=
reebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe5=
18dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs=
":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d7803eb","src/u=
nix/bsd/freebsdlike/mod.rs":"f5ebb2f36dffd9c897b18b168cf28fbff9cc68983ae2d4=
910cb1ba9764693381","src/unix/bsd/mod.rs":"0c672b075b5616fca2cc56c00ee31c3f=
554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mod.rs":"0a66f7d=
e43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537","src/unix/bsd/ne=
tbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc=
877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f5=
36551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlik=
e/netbsd/mod.rs":"4493317993af390d8aafc2cb7ace4c349dfc9d2451fd666844f04a4fa=
1f47442","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f53123=
7b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/netbs=
d/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902=
d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe1=
2ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_6=
4.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","s=
rc/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee1=
0d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm.rs"=
:"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/un=
ix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124e0=
9bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"c0f0=
6c4af4dd3169b8bcd13a2fb7be6ac9dfa901e11bfd22058fff2aa6caed2e","src/unix/bsd=
/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa066ce=
e65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"1dd=
5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bs=
d/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710=
e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04f=
d287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd=
/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7=
569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630=
289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32=
.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","sr=
c/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf46=
81f91ff7985","src/unix/haiku/mod.rs":"0b5a77da05582896e680e236ddd3d813a7b8a=
2ecfde21c1b72ec17883e2de6a7","src/unix/haiku/native.rs":"dbfcbf4954a79d1df2=
ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/haiku/x86_64.rs":=
"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/uni=
x/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bb=
e08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b8529a84b5882fe=
855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/andr=
oid/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee9072c3=
ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a3081652=
faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android/b32/x=
86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0=
dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85dfa18f=
683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/android/b64/=
aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cd=
dca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6f5c567=
70d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/=
android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec70b02aa3da34cd99d=
259d150c753f620846","src/unix/linux_like/android/b64/mod.rs":"71e4fcbe952bf=
a4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/unix/linux_like/a=
ndroid/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b516445e597=
552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs":"19d4=
bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/unix/lin=
ux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed3=
06dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs=
":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","src/u=
nix/linux_like/android/mod.rs":"21b1b70c1d398bd342794376b41975bfe3daf75127c=
7a11d825cc4b839811153","src/unix/linux_like/emscripten/align.rs":"86c95cbed=
7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_li=
ke/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e652581a530b67c3db2=
5e819919d718","src/unix/linux_like/emscripten/no_align.rs":"0128e4aa721a990=
2754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux_like/lin=
ux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f199493d330c61e75ec16e=
e96","src/unix/linux_like/linux/arch/generic/mod.rs":"249387e62ce11dfe5a936=
52699df6e5d8d29311d70d7a0e58fc1298a2ac8d750","src/unix/linux_like/linux/arc=
h/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43adc4277e1=
42460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2e=
b17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/arch/powe=
rpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206a912c41b8=
15","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd8f8e61202=
8f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/linux/gnu/al=
ign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936",=
"src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae99fd714b4d=
eabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linux/gnu/b32=
/arm/mod.rs":"45be81a806c55fed92c20a33c5e4cfb23b3933f7b4feff47db33d37dda34e=
6d3","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a9232c0354=
18d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_like/linux/g=
nu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8eed72a7f11e3b8c7f=
ef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb=
7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/=
linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c87143332df9e43=
ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs":"caade9dc8b71=
79711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src/unix/linux_like/=
linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02f053b2dc782241=
a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/align.rs":"d32=
1491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/li=
nux_like/linux/gnu/b32/riscv32/mod.rs":"ca8bc84fff8c65ecda6c03421f4fe7689f1=
99dce39f1ca382a45bf0b13a1cb00","src/unix/linux_like/linux/gnu/b32/sparc/ali=
gn.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","=
src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e9348f45d1b07ad=
37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/linux/gnu/b32/=
x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9e=
b413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5e9de2dc31d9e58=
31bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_like/linux/gnu=
/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac566eac9a9566207=
6d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611=
b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux=
_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2=
052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/l=
p64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072",=
"src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be998105fc2f6248b7fdf=
cedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux_like/linux/gnu/b=
64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb7771334445a93876=
d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"9c=
39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab92eb55","src/unix/l=
inux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8=
bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/=
mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb",=
"src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31a542ea73f=
b6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/b64/power=
pc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268=
130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2f=
feacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/li=
nux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f9=
9cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"8=
8bde5520c86793f2cf97062d66c1b3f4dd66206c453a601ebf9110d90abc6f8","src/unix/=
linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c76=
5c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align=
.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","sr=
c/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a02=
78c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/=
x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc=
4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9=
883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f=
7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2=
0218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/l=
inux_like/linux/gnu/mod.rs":"daf0eff7fddf6d7a2c15a5bc89e3a0dfe463a40f38880f=
e3fb444105d0ae0f07","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135d=
e75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_lik=
e/linux/mod.rs":"f305c518fc8ef7e151b22a93d23ad304d1302e71ae7082b0c3676d5409=
ad6646","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764=
776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linu=
x/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f529798372fa7df84ee0cfd3d8=
cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexagon.rs":"226a8b64ce9=
c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","src/unix/linux_like=
/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b19=
4f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"16=
a7a03d998a5db11be9ee81525c7faec4623383260e8bc125b1c53a050fde75","src/unix/l=
inux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc0=
6e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"d=
c52adc264c34bce80753d6bd064e8fc4b8237fa1e5c5315ccb6c72df74c2813","src/unix/=
linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5d=
a896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/ris=
cv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c15c8e716f3e2902c251=
81c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2f=
f56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/m=
usl/b32/x86/mod.rs":"7a1586f77bb693f0b319ec720c35963da056287fc42f8e2ccf1d5b=
2bcccf4fd6","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725=
d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_l=
ike/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b20=
52b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/m=
od.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2","=
src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e9d=
e989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64/m=
od.rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae701728b134e986191b614b","=
src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55afc1db6ffaf461=
f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like/linux/musl/b6=
4/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"42d4b6d368=
07f37759094a732a321080cccdf498b174d632cebba147051de294","src/unix/linux_lik=
e/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb342e8aa41544cffa=
cdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77=
309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/l=
inux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e6b8dddae32d59a=
88d69115637539daf19381f4e39330","src/unix/linux_like/linux/musl/mod.rs":"89=
65596cc33a032f7495c74d0d25ff9169e425491b36c4563b291e9f12e2a1b6","src/unix/l=
inux_like/linux/no_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b2060=
9defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exhaustive.rs":"181a05b=
f94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_=
like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf63=
3936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c2=
7fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux=
_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19c4=
22a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"=
9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix=
/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05=
bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mi=
ps/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0af=
db66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc=
78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mi=
ps64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f=
1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e38756=
98c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_lik=
e/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a=
2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddcfe=
fa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/unix/linux_like/=
linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cc=
cdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba=
5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux=
_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb222e=
e906e05e42102d639a8152ea","src/unix/linux_like/linux/uclibc/x86_64/other.rs=
":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/u=
nix/linux_like/mod.rs":"adfa87d7f8790795f22576ab9b7064f7d0085b539d24d822327=
5e66edbab320d","src/unix/mod.rs":"362da723eaad726ae72664d801315f4cf70a04225=
0de1231761bfd12390e27b8","src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b2c=
710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/align.rs=
":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/u=
nix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4fa=
27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b31=
d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/generic.rs":"eab066=
d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/unix/newli=
b/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe4c=
996f3ca1","src/unix/newlib/mod.rs":"fcf8b307933cba5e9c485537499386326d665fe=
83b6fcfb9e9e1837f73332668","src/unix/newlib/no_align.rs":"e0743b2179495a951=
4bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/m=
od.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67","=
src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e3=
82d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee=
3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"44b74cd89794aecd7db6=
7aad1c4114273f70be8d2e4633e3965f144fe53a7b88","src/unix/nto/neutrino.rs":"6=
2198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab7b","src/unix/=
nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb04=
0bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f25138a200e616048e1=
89debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e4=
2f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs"=
:"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/un=
ix/solarish/mod.rs":"6442ed05eb390d44a03daa9800af1030f2ee3e61db98675262c227=
b28de51937","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92b=
e53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0ca=
ed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x8=
6_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc"=
,"src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a=
8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506=
c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce=
99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.r=
s":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1fb3f4018","src/=
vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb=
181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585=
490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889=
cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92=
be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"=
09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/wind=
ows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb=
31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69d=
fabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb69845f4323b1a1=
4e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod.rs":"c068271e=
00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb=
0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/cons=
t_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"=
},"package":"99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f8=
0c"}
+-{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a1d4350481d43c600687f1921083036db242f3a=
9e5bc9906d4d469fdfe588d48","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"5bd78d7e4e79b183f=
b1dab92cd640a611330131d54c479c69adbe87cbdc95ae3","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820=
a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"a6662488273ffff2a097403281db6b5f4cd1a325f7a1582264bb8da0b553a8=
22","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"892e0b409ced2dfd81d98cbe9630eb83979c1668d323b304a91be13aa711d5=
db","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec=
70b02aa3da34cd99d259d150c753f620846","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"fe4c4015cdafc40b537619c932=
5168f519249ee5acc00cc43b9f0aa5fb95f331","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e6=
52581a530b67c3db25e819919d718","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"87401c80ff504def5cd4309a53a63fdd481642980b9d=
aaa7fee0164a807c2c61","src/unix/linux_like/linux/arch/generic/mod.rs":"7787=
42250aa456cb94efe67a4f8d0213827d90ab74eb5074f9afb9a30e6ea71c","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"60ace1dd76aa88d6b3b5e52fef4bec7881d452780d=
fff635474067b512e03df1","src/unix/linux_like/linux/arch/mod.rs":"466a29622e=
47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8f=
aa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/l=
inux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8=
eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.=
rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src=
/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c435=
02c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.=
rs":"caade9dc8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src=
/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3f=
b02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv=
32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b=
119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf712985b7=
5d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like/linux/=
gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea=
440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece=
66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_li=
ke/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890=
eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703=
cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/lin=
ux_like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34=
ac566eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/=
ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29=
","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20d=
d426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/=
gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4fa=
a79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be99=
8105fc2f6248b7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux=
_like/linux/gnu/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c572=
9e551458ce18d0e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loonga=
rch64/mod.rs":"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab=
1480","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f=
7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linu=
x/gnu/b64/mips64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09b=
b884d80281f96eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a88=
52757b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/li=
nux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc=
1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs=
":"c778a136f06c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/u=
nix/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc01=
11beb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/r=
iscv64/mod.rs":"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb3=
88551","src/unix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3=
bcca745d5a9932c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/=
b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f0=
02f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e996=
6a2b90063e0151a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_li=
ke/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab=
4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs"=
:"891e595d33714b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/un=
ix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b8=
7be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x=
86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafeda=
aebb","src/unix/linux_like/linux/gnu/mod.rs":"a105e27dac14401935ad2acb60618=
c0d0c078f65d5bc06c92940d6ab93659b96","src/unix/linux_like/linux/gnu/no_alig=
n.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","s=
rc/unix/linux_like/linux/mod.rs":"657a86280094d5ce31e1f85d116c95637cb994bae=
b724b78dcbd7684b9be1b96","src/unix/linux_like/linux/musl/b32/arm/align.rs":=
"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/uni=
x/linux_like/linux/musl/b32/arm/mod.rs":"f5b217a93f99c2852f7fd1459f52979837=
2fa7df84ee0cfd3d8cdd5b2021b8cf","src/unix/linux_like/linux/musl/b32/hexagon=
.rs":"226a8b64ce9c75abbbee6d2dceb0b44f7b6c750c4102ebd4d015194afee6666e","sr=
c/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098=
b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32=
/mips/mod.rs":"16f614dd59695497a01b542deacd1669335678bdd0b14d16dde482fb5c4e=
02f4","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477=
628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b=
32/powerpc.rs":"69e3ab4471f876055215a7fccabe514e69299ecfe2fa95d989e4d799e03=
f43e9","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87=
de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/l=
inux/musl/b32/riscv32/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3df71ef8=
2285137f51fbad2354d9","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08=
e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/l=
inux_like/linux/musl/b32/x86/mod.rs":"de632ac323bd2bb4f83d4826d6eb7e29d4b0e=
6293aa0c4cb9c99ef0fcabc71b7","src/unix/linux_like/linux/musl/b64/aarch64/al=
ign.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133",=
"src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd=
426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/m=
usl/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e6=
0801d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f6663=
32bb056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like=
/linux/musl/b64/mod.rs":"884243eb5af7df963d858d5baf47e622b45f04e0ae701728b1=
34e986191b614b","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5=
d65320023043e4354725397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_l=
ike/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e=
58803f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mo=
d.rs":"a80b1813148dec8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","s=
rc/unix/linux_like/linux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee958=
0cbedd298164199d71a67d49167e744432","src/unix/linux_like/linux/musl/b64/x86=
_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cb=
ca6e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb=
75483218f9bd774ae1ae7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux=
/musl/lfs64.rs":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd51=
2f235f","src/unix/linux_like/linux/musl/mod.rs":"f79e4d7bef14f422c6a77f1573=
ff503a82305bfa5ac3e4c6f571c09212b75620","src/unix/linux_like/linux/no_align=
.rs":"1a754a4af299894a79835aa092d8322d301179e2b20609defd6bb4bc880e6b4a","sr=
c/unix/linux_like/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd=
6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.=
rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src=
/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc7=
0646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/m=
od.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","=
src/unix/linux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3=
fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc=
/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315=
afa53a7b9f936","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c44=
34e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linu=
x_like/linux/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd544=
1ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips=
/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb2=
6dd08b2d","src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a46=
90b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_lik=
e/linux/uclibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a4=
0da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.=
rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src=
/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a0=
8eef235e13f825f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs=
":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/u=
nix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351aff=
e7e83f9916c1864bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_6=
4/mod.rs":"196d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea=
","src/unix/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a=
55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"=
45c98e7a0fad03b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix=
/mod.rs":"dd4ce377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053"=
,"src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759=
ab0fb6ad33e71d60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b3126227=
19d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"=
cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix=
/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728d=
e8690bf17299d","src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496=
bba0110989e1f6a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5c=
c120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newl=
ib/mod.rs":"9e36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c=
6","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec83=
4ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6=
afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod=
.rs":"68e0ce186b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","sr=
c/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382=
d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e=
8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa96=
8ed4873c2bafa19a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799=
bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nt=
o/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040b=
c8e","src/unix/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378ad=
d7932bbaf3ffb2ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f=
025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"=
cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix=
/solarish/mod.rs":"55ce4624745e31ad226b47fde177a46176a89da3fa5030663673a115=
102471f9","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be5=
3be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed=
72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_=
64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","=
src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e=
02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c2=
1fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99=
fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs"=
:"e4edcbcf43a325e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vx=
works/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb18=
1d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed673758549=
0a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb=
7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be=
3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09=
ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/window=
s/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31=
794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfa=
beef30571b4f4e38375767a","src/windows/mod.rs":"a9a95e9ebc0102c334650607351d=
4d4dbaff0eaf7730eed1c8020d20e9bbebfd","src/windows/msvc/mod.rs":"c068271e00=
fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb06=
75f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_=
fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},=
"package":"b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3=
"}
 \ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"96bf2f6d97a370699fa12dba540978a01b5cd84=
dd72fe6cff8a7700744e8122e","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"776affa26b66843a2b4f=
1a1c8f88d92f6461b74568911450fea717e9db6f877b","build.rs":"104ceb079ec13f06d=
440a348a07974ff5a18dca1f74b9c2fde7be9e3074c25e7","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"68d860865d8ccc6c493948=
c781105e0901fc3312cfa1337f0092c0668706200a","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"24111461547739f=
3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/macros.rs":"b457eb0=
28b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42a=
b7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9c=
f4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e4c23ab9737e12856d=
ddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.rs":"55a5280c0e549=
8c1632b2772a7846bce0a130dde61a7fd59220d7971f9084b56","src/unix/aix/powerpc6=
4.rs":"8c471cf7e4604da9f640db1be68d918303b326744e36e6ee159114040401d2cf","s=
rc/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56=
d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0=
385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"2546ad=
3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72","src/unix/bsd/a=
pple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820a0483e7c758ed336c=
c59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs":"44c217a4f263afe=
7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/unix/bsd/apple/b64/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5=
cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec833a7=
47866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/ap=
ple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a175879a0245342b3bf=
d83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19b812e6d093c819dc6=
5ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/apple/mod.rs":"52b9=
0d584e771447c3608079681adbb32367267021d12f5eb5940b7646f16f4a","src/unix/bsd=
/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b20=
8170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"8986a=
8c79bcadfbdb58ec1a72e1aff8ce9b341c9392d7b0b7449bddf6db59058","src/unix/bsd/=
freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749b57602fc34a4e4b16=
0a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670=
eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7=
d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.=
rs":"fa83dcd4597c6621b95228d80ea6250c37136463300f80a9961a09bdab5e25c3","src=
/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686=
d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/f=
reebsd12/mod.rs":"c7c574d65a8408f6eee32bd5d0cc40e33e41c7e61d98d338609ae5bee=
c72f390","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f12=
2f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freeb=
sdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7=
553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs=
":"834ec71df759e8d38489986b7720f1b296ca774c23c8034e2d9b02b9f55ab781","src/u=
nix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d=
22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/=
freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe1=
97ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs":"58b7766136a2=
2ace828c974f34240eb38feec2c8aa2ee8b6ca38e3b44a6fa348","src/unix/bsd/freebsd=
like/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc9=
1c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"cbfb50=
eeca94674f3e51992ab41cb020127d9405002eacf4b8bf7b2a0418f2ea","src/unix/bsd/f=
reebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747=
a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2da=
e3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bs=
d/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba3395941c7fa6b11e089551a=
04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e=
3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/f=
reebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe5=
18dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs=
":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d7803eb","src/u=
nix/bsd/freebsdlike/mod.rs":"f5ebb2f36dffd9c897b18b168cf28fbff9cc68983ae2d4=
910cb1ba9764693381","src/unix/bsd/mod.rs":"0c672b075b5616fca2cc56c00ee31c3f=
554dcbd2e88a7c2ba1437aa6e5604319","src/unix/bsd/netbsdlike/mod.rs":"0a66f7d=
e43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537","src/unix/bsd/ne=
tbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc=
877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f5=
36551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlik=
e/netbsd/mod.rs":"4493317993af390d8aafc2cb7ace4c349dfc9d2451fd666844f04a4fa=
1f47442","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f53123=
7b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/netbs=
d/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902=
d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe1=
2ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_6=
4.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","s=
rc/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee1=
0d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/arm.rs"=
:"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729ad307","src/un=
ix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d4065da8b05d124e0=
9bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd/mod.rs":"c0f0=
6c4af4dd3169b8bcd13a2fb7be6ac9dfa901e11bfd22058fff2aa6caed2e","src/unix/bsd=
/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d982181b7bdabfa066ce=
e65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powerpc64.rs":"1dd=
5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bs=
d/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710=
e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04f=
d287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd=
/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7=
569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630=
289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32=
.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced11f54d87b","sr=
c/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57056197b563bf46=
81f91ff7985","src/unix/haiku/mod.rs":"0b5a77da05582896e680e236ddd3d813a7b8a=
2ecfde21c1b72ec17883e2de6a7","src/unix/haiku/native.rs":"dbfcbf4954a79d1df2=
ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/haiku/x86_64.rs":=
"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/uni=
x/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bb=
e08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0d9b8529a84b5882fe=
855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15=
c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/andr=
oid/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35f06ad8653ee9072c3=
ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e0375119bf06a3081652=
faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_like/android/b32/x=
86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0=
dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107efbcd37b5b85dfa18f=
683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_like/android/b64/=
aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cd=
dca35c7b","src/unix/linux_like/android/b64/aarch64/int128.rs":"1735f6f5c567=
70d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/=
android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec70b02aa3da34cd99d=
259d150c753f620846","src/unix/linux_like/android/b64/mod.rs":"71e4fcbe952bf=
a4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/unix/linux_like/a=
ndroid/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf071a6832b516445e597=
552c82bbd881095e3a8","src/unix/linux_like/android/b64/riscv64/mod.rs":"19d4=
bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e49d","src/unix/lin=
ux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed3=
06dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs=
":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d921e9b314d1","src/u=
nix/linux_like/android/mod.rs":"21b1b70c1d398bd342794376b41975bfe3daf75127c=
7a11d825cc4b839811153","src/unix/linux_like/emscripten/align.rs":"86c95cbed=
7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_li=
ke/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e652581a530b67c3db2=
5e819919d718","src/unix/linux_like/emscripten/no_align.rs":"0128e4aa721a990=
2754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/unix/linux_like/lin=
ux/align.rs":"28b2cd7c3eddc53c247aa11340da205d1d2e478f199493d330c61e75ec16e=
e96","src/unix/linux_like/linux/arch/generic/mod.rs":"249387e62ce11dfe5a936=
52699df6e5d8d29311d70d7a0e58fc1298a2ac8d750","src/unix/linux_like/linux/arc=
h/mips/mod.rs":"2d166054a586bb4bf6e4a4ba35f7574907b217225eff8f1a43adc4277e1=
42460","src/unix/linux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2e=
b17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_like/linux/arch/powe=
rpc/mod.rs":"3f6da7b0fa7b394c7d4eea2bb3caa7a7729ab0d6c1491fef02206a912c41b8=
15","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec0440f1dd8f8e61202=
8f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_like/linux/gnu/al=
ign.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936",=
"src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3ee93f7ae99fd714b4d=
eabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_like/linux/gnu/b32=
/arm/mod.rs":"45be81a806c55fed92c20a33c5e4cfb23b3933f7b4feff47db33d37dda34e=
6d3","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8faa92f77a9232c0354=
18d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/linux_like/linux/g=
nu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8eed72a7f11e3b8c7f=
ef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb=
7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/=
linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c43502c87143332df9e43=
ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.rs":"caade9dc8b71=
79711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src/unix/linux_like/=
linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3fb02f053b2dc782241=
a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv32/align.rs":"d32=
1491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b119","src/unix/li=
nux_like/linux/gnu/b32/riscv32/mod.rs":"ca8bc84fff8c65ecda6c03421f4fe7689f1=
99dce39f1ca382a45bf0b13a1cb00","src/unix/linux_like/linux/gnu/b32/sparc/ali=
gn.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","=
src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece66e9348f45d1b07ad=
37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_like/linux/gnu/b32/=
x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9e=
b413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703cc5e9de2dc31d9e58=
31bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/linux_like/linux/gnu=
/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34ac566eac9a9566207=
6d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"bf4611=
b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29","src/unix/linux=
_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b2=
052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/gnu/b64/aarch64/l=
p64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4faa79358e53175072",=
"src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be998105fc2f6248b7fdf=
cedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux_like/linux/gnu/b=
64/loongarch64/align.rs":"6616c38bf8cab53034dce9f968adae8fb7771334445a93876=
d000cfd08f117a8","src/unix/linux_like/linux/gnu/b64/loongarch64/mod.rs":"9c=
39dfc3843e72bd8dba21aa5ef2795411cd8a0004a0cfe79c9b9f89ab92eb55","src/unix/l=
inux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8=
bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/=
mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09bb884d80281f96eb",=
"src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a8852757b31a542ea73f=
b6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/linux/gnu/b64/power=
pc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268=
130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"c778a136f06c2f=
feacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/unix/linux_like/li=
nux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f9=
9cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/riscv64/mod.rs":"8=
8bde5520c86793f2cf97062d66c1b3f4dd66206c453a601ebf9110d90abc6f8","src/unix/=
linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3bcca745d5a9932c76=
5c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/b64/sparc64/align=
.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","sr=
c/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e9966a2b90063e0151a02=
78c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_like/linux/gnu/b64/=
x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab4b308ec11b0578bcc=
4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"891e595d33714b9=
883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b87be1618d5e45f190f=
7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs":"b2=
0218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafedaaebb","src/unix/l=
inux_like/linux/gnu/mod.rs":"daf0eff7fddf6d7a2c15a5bc89e3a0dfe463a40f38880f=
e3fb444105d0ae0f07","src/unix/linux_like/linux/gnu/no_align.rs":"9cd223135d=
e75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_lik=
e/linux/mod.rs":"f305c518fc8ef7e151b22a93d23ad304d1302e71ae7082b0c3676d5409=
ad6646","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c1043764=
776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like/linu=
x/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb4f3779ebfa9320a1f6a4102=
7529d81d5f699","src/unix/linux_like/linux/musl/b32/hexagon.rs":"5625a3dfcd8=
fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa8","src/unix/linux_like=
/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b19=
4f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs":"bb=
5f45dd376e928a22282e1696989399b0e8d0a5fbc8309bb4238926d81e61e7","src/unix/l=
inux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477628288f6273fabbc0=
6e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b32/powerpc.rs":"f=
23491f21f3eeac3e05a76b466567ea633b92a4830ab8b401cbb31c74ad1acab","src/unix/=
linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87de7c7547903359a5d=
a896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/linux/musl/b32/ris=
cv32/mod.rs":"b857ccbc8f0fbc8a6a5959f3496a4fd5a9a1dd986c15c8e716f3e2902c251=
81c","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2f=
f56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/m=
usl/b32/x86/mod.rs":"5e58f759df421b4473f229da417cd5da080226afc0006d71d5dd57=
8c62e27a50","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"6ba32725=
d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133","src/unix/linux_l=
ike/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd426442f09724d9b20=
52b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/musl/b64/aarch64/m=
od.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e60801d852e55dc2","=
src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f666332bb056d0e2951e9d=
e989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like/linux/musl/b64/m=
od.rs":"c349ade36cca16273918124d206493a2f8d0d3ecf359b80ae7ec0317c7ee5c98","=
src/unix/linux_like/linux/musl/b64/powerpc64.rs":"455dc0ffa55afc1db6ffaf461=
f6f2a7b49d31658bfebe0bb4efac5967a6f956c","src/unix/linux_like/linux/musl/b6=
4/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543ef=
e86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"42d4b6d368=
07f37759094a732a321080cccdf498b174d632cebba147051de294","src/unix/linux_lik=
e/linux/musl/b64/s390x.rs":"d8a4fdfea0960ec284cae4facb8b0fb342e8aa41544cffa=
cdcaf08c5a92a43f8","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"77=
309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cbca6e","src/unix/l=
inux_like/linux/musl/b64/x86_64/mod.rs":"7a877cd23b64be66d28e6b8dddae32d59a=
88d69115637539daf19381f4e39330","src/unix/linux_like/linux/musl/mod.rs":"46=
b47255dd8ce2ae32443267f5f334e2e72341d58615edf50611218506a08082","src/unix/l=
inux_like/linux/no_align.rs":"1a754a4af299894a79835aa092d8322d301179e2b2060=
9defd6bb4bc880e6b4a","src/unix/linux_like/linux/non_exhaustive.rs":"181a05b=
f94fdb911db83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_=
like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf63=
3936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c2=
7fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux=
_like/linux/uclibc/arm/mod.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19c4=
22a04f577b2979ef4081e","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"=
9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix=
/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05=
bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mi=
ps/mips32/mod.rs":"d0c4434e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0af=
db66fe81","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc=
78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mi=
ps64/mod.rs":"3f38ee6a4690b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f=
1e0","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e38756=
98c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_lik=
e/linux/uclibc/mips/mod.rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a=
2e2d6b4fee5db3b072","src/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddcfe=
fa2bd17bdc81550826be31a08eef235e13f825f169a5029c8bca","src/unix/linux_like/=
linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cc=
cdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba=
5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux=
_like/linux/uclibc/x86_64/mod.rs":"196d03affbefb85716937c15904831e731eb222e=
e906e05e42102d639a8152ea","src/unix/linux_like/linux/uclibc/x86_64/other.rs=
":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/u=
nix/linux_like/mod.rs":"adfa87d7f8790795f22576ab9b7064f7d0085b539d24d822327=
5e66edbab320d","src/unix/mod.rs":"362da723eaad726ae72664d801315f4cf70a04225=
0de1231761bfd12390e27b8","src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b2c=
710f32f852e92a4d11ad6759ab0fb6ad33e71d60e53278af","src/unix/newlib/align.rs=
":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/u=
nix/newlib/arm/mod.rs":"cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4fa=
27b233732b526","src/unix/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b31=
d0fdb03988c52194c966728de8690bf17299d","src/unix/newlib/generic.rs":"eab066=
d9f0a0f3eb53cc1073d01496bba0110989e1f6a59838afd19f870cd599","src/unix/newli=
b/horizon/mod.rs":"7cc5cc120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe4c=
996f3ca1","src/unix/newlib/mod.rs":"fcf8b307933cba5e9c485537499386326d665fe=
83b6fcfb9e9e1837f73332668","src/unix/newlib/no_align.rs":"e0743b2179495a951=
4bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/m=
od.rs":"0202ffd57caf75b6afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67","=
src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e3=
82d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee=
3e8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"44b74cd89794aecd7db6=
7aad1c4114273f70be8d2e4633e3965f144fe53a7b88","src/unix/nto/neutrino.rs":"6=
2198d95ccc0fe7ece6f9d5c0b29fc22303ef458886efb5e09aad524eca2ab7b","src/unix/=
nto/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb04=
0bc8e","src/unix/redox/mod.rs":"c8afea39f81e73ad4e9bf8a8f25138a200e616048e1=
89debad80a6b7e08f710f","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e4=
2f025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs"=
:"cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/un=
ix/solarish/mod.rs":"6442ed05eb390d44a03daa9800af1030f2ee3e61db98675262c227=
b28de51937","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92b=
e53be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0ca=
ed72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x8=
6_64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc"=
,"src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a=
8e02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506=
c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce=
99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.r=
s":"ff063860fc4fe3bca6332742764e29c1506884added21aa7722144c1fb3f4018","src/=
vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb=
181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585=
490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889=
cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92=
be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"=
09ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/wind=
ows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb=
31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69d=
fabeef30571b4f4e38375767a","src/windows/mod.rs":"5421b92f47cb69845f4323b1a1=
4e533d8a17acc6412c58e67f4d41def749de2f","src/windows/msvc/mod.rs":"c068271e=
00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb=
0675f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/cons=
t_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"=
},"package":"99227334921fae1a979cf0bfdfcc6b3e5ce376ef57e16fb6fb3ea2ed6095f8=
0c"}
++{"files":{"CONTRIBUTING.md":"bdc90b52cf803faac96e594069a86dd8ea150d5ba7fb=
3e6cadfc08dac4c7b0ce","Cargo.toml":"a1d4350481d43c600687f1921083036db242f3a=
9e5bc9906d4d469fdfe588d48","LICENSE-APACHE":"62c7a1e35f56406896d7aa7ca52d0c=
c0d272ac022b5d2796e7d6905db8a3636a","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"ecc47e284f8d007fc048=
666d5108dd41cdc440ab9eedfe8c47d1634613522787","build.rs":"5bd78d7e4e79b183f=
b1dab92cd640a611330131d54c479c69adbe87cbdc95ae3","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"7f986e5f5e68d25ef04d386fd2f640e8be8f15427a8d4a458ea01d26b8dca0ca","=
src/fuchsia/aarch64.rs":"893fcec48142d273063ffd814dca33fbec92205fd39ada9707=
5f85201d803996","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"30f4dc83ef120300d61896=
696512436377c5f36f1431d98ab7e01e498c0c47d5","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
riscv64.rs":"617cd75e79e0e20f664db764a4dc2a396d9fd11a4d95371acd91ed4811293b=
11","src/fuchsia/x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38=
d8aa2ec5852255ac87","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f3=
68ae10ceccefeed9debb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8=
020a2d063c9bfa8b665f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab8=
32b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs"=
:"24111461547739f3646f95bcb66c43f2ae679a727ff5938299434c522c02e458","src/ma=
cros.rs":"b457eb028b8e8ab3c24bb7292b874ad4e491edbb83594f6a3da024df5348c088"=
,"src/psp.rs":"dd31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa926=
4c1c","src/sgx.rs":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f=
2a306ed1b","src/solid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105=
ae66acf36db37a42ab7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad74=
1123d84ed3eb48d9cf4f1f4872097fc27fe","src/solid/mod.rs":"5f4151dca5132e4b4e=
4c23ab9737e12856dddbdc0ca3f7dbc004328ef3c8acde","src/switch.rs":"9da3dd39b3=
de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba","src/unix/aix/mod.r=
s":"54229b5e774669c16912112e8b50fa938db76f534971222a11723a05195a0948","src/=
unix/aix/powerpc64.rs":"cf374d81139d45f9d77c6a764f640bfbf7e0a5903689652c829=
6f8e10d55169b","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1=
a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866f=
e19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b3=
2/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4859532b34cb011e4c75a5a72=
","src/unix/bsd/apple/b64/aarch64/align.rs":"e8eb38d064b5fefec6f37d42873820=
a0483e7c758ed336cc59a7155455ca89c9","src/unix/bsd/apple/b64/aarch64/mod.rs"=
:"44c217a4f263afe7a97435de9323d20a96c37836f899ca0925306d4b7e073c27","src/un=
ix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d1=
5fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9=
be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/a=
lign.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c"=
,"src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c5855038aae5d433c8f5eb3b29b0a1=
75879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple/long_array.rs":"3cf1f19=
b812e6d093c819dc65ce55b13491963e0780eda0d0bd1577603e81948","src/unix/bsd/ap=
ple/mod.rs":"a6662488273ffff2a097403281db6b5f4cd1a325f7a1582264bb8da0b553a8=
22","src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d919=
2cdeeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonf=
ly/mod.rs":"f2e78625fe1eb14f43e730a3987eba888cb8ac04c23008e7c2d2f7c72258b9e=
6","src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"6c8e216385f53a4bf5f171749=
b57602fc34a4e4b160a44ca31c058cb0c8a2126","src/unix/bsd/freebsdlike/freebsd/=
arm.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47",=
"src/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0=
f0cf84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freeb=
sd/freebsd11/mod.rs":"e243ae0e89623d4fa9f85afe14369cc5fd5f2028ea715773dbec7=
22ba80dac1f","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8=
499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/free=
bsdlike/freebsd/freebsd12/mod.rs":"bef9fae288a4f29e941ea369be1cd20b170040e6=
0665a4d49a4a9e79009b72d8","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_6=
4.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","s=
rc/unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b6=
86d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd=
/freebsd13/mod.rs":"3c514e037694ce22724abb3c9c4687defda7f0e3456b615ca73593e=
860e38b16","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f=
122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/fre=
ebsdlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25=
c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.=
rs":"318abe48bfdd1c74ecd6afbd6c9329c5c72ce4f7d420edd6be2fc12b223ae32f","src=
/unix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"e7b5863e222d6cc416b6b0f=
be71690fad909e899b4c4ae810bbca117e4fcb650","src/unix/bsd/freebsdlike/freebs=
d/mod.rs":"4c3cd57aaf7fbce072e28e0d2d285b5fda9702e924561d2fd01e49e6ee186a98=
","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76=
a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/p=
owerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628=
a9a","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"fa4bed4c58cad24ba339594=
1c7fa6b11e089551a04714f9561078e400f5b2b62","src/unix/bsd/freebsdlike/freebs=
d/x86.rs":"6766e2ce85e187b306cd3b0b8d7e15b8f4042c5cff81d89b3af69ecc99c70ab0=
","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1=
daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/free=
bsd/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e=
47d7803eb","src/unix/bsd/freebsdlike/mod.rs":"0eacafac87fb3a32ef1b85980fece=
2792e70eba9856af18a7407cc35be68ea57","src/unix/bsd/mod.rs":"dad51a24a524e92=
bfe9de3ac3b7d394d86058b9b8a1ccd4efa9bbb5c78e7fa1a","src/unix/bsd/netbsdlike=
/mod.rs":"0a66f7de43710e35a6a546e6c39066aa8b91a6efadb71db88738b0a577fd5537"=
,"src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3e=
b4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs=
":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/u=
nix/bsd/netbsdlike/netbsd/mod.rs":"90dd33ef20dc3be8aef5bd152a6a06e7ab34f952=
7b3978487b593aaa16a907bd","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7f=
f5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd=
/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45=
cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36=
bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsd=
like/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c8=
99d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7e=
caf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlik=
e/openbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced=
729ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9=
d4065da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/open=
bsd/mod.rs":"892e0b409ced2dfd81d98cbe9630eb83979c1668d323b304a91be13aa711d5=
db","src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98=
2181b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/p=
owerpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c=
28e","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdee=
aece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/=
sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f40=
85","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86=
570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_6=
4.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","s=
rc/unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95d=
ced11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353=
f57056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"d7ec086b73db4f727991=
79627aa6330a513dcf786b06e19c75ff884d1235948e","src/unix/haiku/native.rs":"d=
bfcbf4954a79d1df2ff58e0590bbcb8c57dfc7a32392aa73ee4726b66bd6cc8","src/unix/=
haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f0=
43b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10=
ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"a1494a0bddf301cceb0=
d9b8529a84b5882fe855ceae77a1c4e8d6034e705e26c","src/unix/hermit/x86_64.rs":=
"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/uni=
x/linux_like/android/b32/arm.rs":"ce582de7e983a33d3bfad13075c53aac9016cee35=
f06ad8653ee9072c3ec2564","src/unix/linux_like/android/b32/mod.rs":"7c173e03=
75119bf06a3081652faede95e5bcd6858e7576b7533d037978737c8f","src/unix/linux_l=
ike/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf=
31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"e6d107e=
fbcd37b5b85dfa18f683300cbf768ffa0237997a9fa52b184a53323ac","src/unix/linux_=
like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf=
6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/int128.=
rs":"1735f6f5c56770d20dd426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src=
/unix/linux_like/android/b64/aarch64/mod.rs":"171f8c37a2d2e45065bd3547dfcec=
70b02aa3da34cd99d259d150c753f620846","src/unix/linux_like/android/b64/mod.r=
s":"71e4fcbe952bfa4a5f9022f3972e906917b38f729b9d8ef57cd5d179104894ac","src/=
unix/linux_like/android/b64/riscv64/align.rs":"0bf138f84e5327d8339bcd4adf07=
1a6832b516445e597552c82bbd881095e3a8","src/unix/linux_like/android/b64/risc=
v64/mod.rs":"19d4bf2237c47127eba9144e0b82e995bc079315e719179a91813b0ae7b0e4=
9d","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f7512=
719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/android/=
b64/x86_64/mod.rs":"4ec2de11a9b65c4325b7b991f0b99a414975e0e61ba8668caca5d92=
1e9b314d1","src/unix/linux_like/android/mod.rs":"fe4c4015cdafc40b537619c932=
5168f519249ee5acc00cc43b9f0aa5fb95f331","src/unix/linux_like/emscripten/ali=
gn.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","=
src/unix/linux_like/emscripten/mod.rs":"712c52856ee323b8057b9452e4ab484a0e6=
52581a530b67c3db25e819919d718","src/unix/linux_like/emscripten/no_align.rs"=
:"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/un=
ix/linux_like/linux/align.rs":"87401c80ff504def5cd4309a53a63fdd481642980b9d=
aaa7fee0164a807c2c61","src/unix/linux_like/linux/arch/generic/mod.rs":"7787=
42250aa456cb94efe67a4f8d0213827d90ab74eb5074f9afb9a30e6ea71c","src/unix/lin=
ux_like/linux/arch/mips/mod.rs":"60ace1dd76aa88d6b3b5e52fef4bec7881d452780d=
fff635474067b512e03df1","src/unix/linux_like/linux/arch/mod.rs":"466a29622e=
47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_lik=
e/linux/arch/powerpc/mod.rs":"bef6b7af9e5e2b4e5545c9c7e3e23a8b743277a0ed958=
53e7eddc38e44299f02","src/unix/linux_like/linux/arch/sparc/mod.rs":"91593ec=
0440f1dd8f8e612028f432c44c14089286e2aca50e10511ab942db8c3","src/unix/linux_=
like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec72519573=
15afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"6ec0eb3e=
e93f7ae99fd714b4deabfb5e97fbcefd8c26f5a45fb8e7150899cdeb","src/unix/linux_l=
ike/linux/gnu/b32/arm/mod.rs":"9ab3e97b579a9122690cd01026e14528862860346b70=
0aafbb755a7e04054f7f","src/unix/linux_like/linux/gnu/b32/m68k/align.rs":"8f=
aa92f77a9232c035418d45331774e64a9a841d99c91791570a203bf2b45bcb","src/unix/l=
inux_like/linux/gnu/b32/m68k/mod.rs":"6aab7f1b864e9691d14aa7d389f717c4077b8=
eed72a7f11e3b8c7fef245e4046","src/unix/linux_like/linux/gnu/b32/mips/align.=
rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src=
/unix/linux_like/linux/gnu/b32/mips/mod.rs":"6b9a5dac6f937ddc1453e808e3c435=
02c87143332df9e43ac64fb8b1eda6c116","src/unix/linux_like/linux/gnu/b32/mod.=
rs":"caade9dc8b7179711102da342819bdf330c42c796b4587d0ed419550dab2e9ad","src=
/unix/linux_like/linux/gnu/b32/powerpc.rs":"5c5d90326b54b57b98eff4745fe7a3f=
b02f053b2dc782241a73e807b491936a3","src/unix/linux_like/linux/gnu/b32/riscv=
32/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e58803f99cd37543efe86621b=
119","src/unix/linux_like/linux/gnu/b32/riscv32/mod.rs":"491a9a97cf712985b7=
5d3ad714691ef60898d88c78bc386a6917de0a6774cc26","src/unix/linux_like/linux/=
gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea=
440895bcca6d41","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"80894eece=
66e9348f45d1b07ad37c757ea694bbd10ed49d3f920b34e9f51a9a3","src/unix/linux_li=
ke/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890=
eef8f1fbc47162e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"c703=
cc5e9de2dc31d9e5831bfb6f354d6e3518b2ae02263f68a9a70f1c0167e2","src/unix/lin=
ux_like/linux/gnu/b64/aarch64/align.rs":"ea39d5fd8ca5a71314127d1e1f542bca34=
ac566eac9a95662076d91ea4bee548","src/unix/linux_like/linux/gnu/b64/aarch64/=
ilp32.rs":"bf4611b737813deef6787babf6c01698605f3b75482269b8546318667bc68e29=
","src/unix/linux_like/linux/gnu/b64/aarch64/int128.rs":"1735f6f5c56770d20d=
d426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/=
gnu/b64/aarch64/lp64.rs":"11a950697fdda0258c6e37c6b13993348c8de4134105ed4fa=
a79358e53175072","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"d7be99=
8105fc2f6248b7fdfcedb5a0519122d28625fcfd5dccf72617fb30c45e","src/unix/linux=
_like/linux/gnu/b64/loongarch64/align.rs":"060aa33cc737966c691aab8511c5c572=
9e551458ce18d0e284e0d45f39beeb60","src/unix/linux_like/linux/gnu/b64/loonga=
rch64/mod.rs":"18edada8aa5d4127d9aa1bd81c62b5a4209f1efd8b2b2631e801c9e855ab=
1480","src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f=
7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linu=
x/gnu/b64/mips64/mod.rs":"628c410b9aaec3c8f43838a28616b577a1d6de60a9799b09b=
b884d80281f96eb","src/unix/linux_like/linux/gnu/b64/mod.rs":"3c6555f30a7a88=
52757b31a542ea73fb6a16a6e27e838397e819278ad56e57a4","src/unix/linux_like/li=
nux/gnu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc=
1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs=
":"c778a136f06c2ffeacea19fa14ce79b828f91b67a002dec5ce87289bae36234e","src/u=
nix/linux_like/linux/gnu/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc01=
11beb3a22e58803f99cd37543efe86621b119","src/unix/linux_like/linux/gnu/b64/r=
iscv64/mod.rs":"c8f07efc5ddd5d874f1ebc329cd6907818d132ac3e30f4f2a4b04be3fb3=
88551","src/unix/linux_like/linux/gnu/b64/s390x.rs":"a2fd9277c2dcf76f7a16a3=
bcca745d5a9932c765c0dc2feb31c3641be25eb0aa","src/unix/linux_like/linux/gnu/=
b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f0=
02f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"e8047e996=
6a2b90063e0151a0278c54885e7b323286cf5ab55cbaf151fc772d3","src/unix/linux_li=
ke/linux/gnu/b64/x86_64/align.rs":"62e822478356db4a73b6bbd1b36d825b893939ab=
4b308ec11b0578bcc4b49769","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs"=
:"891e595d33714b9883b92f0554d1d361fba2b6c3f6cac09a288252f44c6ec667","src/un=
ix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"38f74ce15d9662ce4818815a2b8=
7be1618d5e45f190f7e4db84ff3285b4421fb","src/unix/linux_like/linux/gnu/b64/x=
86_64/x32.rs":"b20218a11364a6dec87f96d6c0d8b19e660697ab09ad5ee0e9b3a9dafeda=
aebb","src/unix/linux_like/linux/gnu/mod.rs":"a105e27dac14401935ad2acb60618=
c0d0c078f65d5bc06c92940d6ab93659b96","src/unix/linux_like/linux/gnu/no_alig=
n.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","s=
rc/unix/linux_like/linux/mod.rs":"657a86280094d5ce31e1f85d116c95637cb994bae=
b724b78dcbd7684b9be1b96","src/unix/linux_like/linux/musl/b32/arm/align.rs":=
"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/uni=
x/linux_like/linux/musl/b32/arm/mod.rs":"923159f09820a7e3ca2340ef6adb4f3779=
ebfa9320a1f6a41027529d81d5f699","src/unix/linux_like/linux/musl/b32/hexagon=
.rs":"5625a3dfcd8fae8c43e6306172dd0c2f7ace8ce9a43a2c03909aef35d96cdaa8","sr=
c/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098=
b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32=
/mips/mod.rs":"7956dae471300c810f596cb6d6cc122640527c139219cc9f2a86117a4167=
a941","src/unix/linux_like/linux/musl/b32/mod.rs":"31677597fd9544c4b1ec1477=
628288f6273fabbc06e38f33da862ad55f019ce1","src/unix/linux_like/linux/musl/b=
32/powerpc.rs":"61b2e40db3e86fa077b0bdb0ff64643403680a96029b531ffc16ba1977c=
af880","src/unix/linux_like/linux/musl/b32/riscv32/align.rs":"efd2accf33b87=
de7c7547903359a5da896edc33cd6c719552c7474b60d4a5d48","src/unix/linux_like/l=
inux/musl/b32/riscv32/mod.rs":"7b067c7989a80e35daa9987af799d97dd1fb3df71ef8=
2285137f51fbad2354d9","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08=
e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/l=
inux_like/linux/musl/b32/x86/mod.rs":"aea0853415d103a6580909b35b9f59625504f=
8c52be79a143060e19897b5316e","src/unix/linux_like/linux/musl/b64/aarch64/al=
ign.rs":"6ba32725d24d7d8e6aa111f3b57aafa318f83b606abe96561329151829821133",=
"src/unix/linux_like/linux/musl/b64/aarch64/int128.rs":"1735f6f5c56770d20dd=
426442f09724d9b2052b46a7cd82f23f3288a4a7276de","src/unix/linux_like/linux/m=
usl/b64/aarch64/mod.rs":"31e75179cbb4e26425b3f5b052e358f593153da662884655e6=
0801d852e55dc2","src/unix/linux_like/linux/musl/b64/mips64.rs":"9a5d29f6663=
32bb056d0e2951e9de989aa1dc016075f009db3f2f628e0cdda8c","src/unix/linux_like=
/linux/musl/b64/mod.rs":"c349ade36cca16273918124d206493a2f8d0d3ecf359b80ae7=
ec0317c7ee5c98","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e77f4cf5=
d65320023043e4354725397f6b079c1b7b6b3cef2c3293350b46b303","src/unix/linux_l=
ike/linux/musl/b64/riscv64/align.rs":"d321491612be8d5c61b6ec2dc0111beb3a22e=
58803f99cd37543efe86621b119","src/unix/linux_like/linux/musl/b64/riscv64/mo=
d.rs":"a80b1813148dec8bc396c02638978c0b4e5e040edafd56d98f8683fe2ae51ab5","s=
rc/unix/linux_like/linux/musl/b64/s390x.rs":"80a92e54e47016d051c7bd55bee958=
0cbedd298164199d71a67d49167e744432","src/unix/linux_like/linux/musl/b64/x86=
_64/align.rs":"77309276ad7a42cbe59ca381f23590b7a143aded05555b34a5b307b808cb=
ca6e","src/unix/linux_like/linux/musl/b64/x86_64/mod.rs":"032863c74d3ca73cb=
75483218f9bd774ae1ae7d3646d2ffb21e4cc7d4b5e0e3d","src/unix/linux_like/linux=
/musl/lfs64.rs":"3e4fb381f3a0756520bde0f1692d4fa45e4ae8133bf7d7c64b0e3fdd51=
2f235f","src/unix/linux_like/linux/musl/mod.rs":"137ffaafdb825095f7012a7d55=
487d0a5cda54fd498999f6db0c4b3e82433f8f","src/unix/linux_like/linux/no_align=
.rs":"1a754a4af299894a79835aa092d8322d301179e2b20609defd6bb4bc880e6b4a","sr=
c/unix/linux_like/linux/non_exhaustive.rs":"181a05bf94fdb911db83ce793b993bd=
6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_like/linux/uclibc/align.=
rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src=
/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc7=
0646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/m=
od.rs":"50288ff9e411ab0966da24838f2c2a5618021bc19c422a04f577b2979ef4081e","=
src/unix/linux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3=
fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc=
/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315=
afa53a7b9f936","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"d0c44=
34e2bf813372c418a8f516c706cdccc9f7be2f0921b2207b0afdb66fe81","src/unix/linu=
x_like/linux/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd544=
1ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips=
/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb2=
6dd08b2d","src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"3f38ee6a46=
90b9d7594be20d216467a34d955f7653c2c8ce1e6147daeb53f1e0","src/unix/linux_lik=
e/linux/uclibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a4=
0da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.=
rs":"a048fce1c2d9b1ad57305642e8ad05ca0f0c7e4753267a2e2d6b4fee5db3b072","src=
/unix/linux_like/linux/uclibc/mod.rs":"1c3d25cddcfefa2bd17bdc81550826be31a0=
8eef235e13f825f169a5029c8bca","src/unix/linux_like/linux/uclibc/no_align.rs=
":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/u=
nix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351aff=
e7e83f9916c1864bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_6=
4/mod.rs":"196d03affbefb85716937c15904831e731eb222ee906e05e42102d639a8152ea=
","src/unix/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a=
55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"=
45c98e7a0fad03b03c4c76f11a80e2423873f0a6563e35c60309a29b2c8ff44f","src/unix=
/mod.rs":"dd4ce377ba9517182e718848739a5c3f58cdbbcd4ee467eef9aaf8df5aed5053"=
,"src/unix/newlib/aarch64/mod.rs":"bac93836a9a57b2c710f32f852e92a4d11ad6759=
ab0fb6ad33e71d60e53278af","src/unix/newlib/align.rs":"28aaf87fafbc6b3126227=
19d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"=
cbba6b3e957eceb496806e60de8725a23ff3fa0015983b4b4fa27b233732b526","src/unix=
/newlib/espidf/mod.rs":"816f235f4aa4baabba7f2606b31d0fdb03988c52194c966728d=
e8690bf17299d","src/unix/newlib/generic.rs":"eab066d9f0a0f3eb53cc1073d01496=
bba0110989e1f6a59838afd19f870cd599","src/unix/newlib/horizon/mod.rs":"7cc5c=
c120437421db139bfa6a90b18168cd3070bdd0f5be96d40fe4c996f3ca1","src/unix/newl=
ib/mod.rs":"9e36de3fd78e10cb6b9a59dc5ebe5a1b44a63ccb91433bb33653fb30d0c303c=
6","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec83=
4ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs":"0202ffd57caf75b6=
afa2c9717750ffb96e375ac33df0ae9609a3f831be393b67","src/unix/newlib/vita/mod=
.rs":"68e0ce186b44e0b3031eb824710e7454dc2a9df98db98120840c3c6f4d885871","sr=
c/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382=
d22de78e53","src/unix/nto/aarch64.rs":"4709c9afdc8d583be876598e7c238499ee3e=
8da5bd2baa614d9c7dd414851555","src/unix/nto/mod.rs":"59ab89a8fb6e0a6d22fa96=
8ed4873c2bafa19a0f60a90c9a5148816cb7440889","src/unix/nto/neutrino.rs":"799=
bff4ab01a6424db6c5a2b76aa5679826d41495f9d13c63485bf13bc80026b","src/unix/nt=
o/x86_64.rs":"a3e18e93c2999da1cd7a6f748a4b60c07aefb73d8ea2aafec19a84cfb040b=
c8e","src/unix/redox/mod.rs":"73658b0d28c82a122875aa2b45c489834f4de58c378ad=
d7932bbaf3ffb2ae789","src/unix/solarish/compat.rs":"00f1ee3faec9da69204e42f=
025f6735dd13d894071a154425dcc43ecbdd06e7f","src/unix/solarish/illumos.rs":"=
cd93c2d84722bbf9933a92842a8998eb0b2afc962f50bc2546ad127b82809fa7","src/unix=
/solarish/mod.rs":"55ce4624745e31ad226b47fde177a46176a89da3fa5030663673a115=
102471f9","src/unix/solarish/solaris.rs":"41b350a89ddf01cd12a10f93640f92be5=
3be0b0d976021cdc08da17bf3e72edf","src/unix/solarish/x86.rs":"e86e806df0caed=
72765040eaa2f3c883198d1aa91508540adf9b7008c77f522e","src/unix/solarish/x86_=
64.rs":"ec2b01f194eb8a6a27133c57681da195a949e03098f3ea1e847227a9c09ef5fc","=
src/unix/solarish/x86_common.rs":"ac869d9c3c95645c22460468391eb1982023c3a8e=
02b9e06a72e3aef3d5f1eac","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c2=
1fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99=
fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs"=
:"e4edcbcf43a325e738c9465507594d0c87abf3f0e2b9b046c1425f8d44bdad0f","src/vx=
works/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb18=
1d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed673758549=
0a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb=
7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be=
3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"09=
ee3b3348b212b050f6ca8ae008a28679ea44a375674307a4e7c9ca0d3ed7d5","src/window=
s/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31=
794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfa=
beef30571b4f4e38375767a","src/windows/mod.rs":"a9a95e9ebc0102c334650607351d=
4d4dbaff0eaf7730eed1c8020d20e9bbebfd","src/windows/msvc/mod.rs":"c068271e00=
fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","src/xous.rs":"eb06=
75f25ba01f73072d2b70907fb8abb1148facefe5a20756c49250f3d65fae","tests/const_=
fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},=
"package":"b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3=
"}
+
diff --git a/meta/recipes-devtools/rust/files/bootstrap_fail.patch b/meta/r=
ecipes-devtools/rust/files/bootstrap_fail.patch
deleted file mode 100644
index 1f44b6eaf6..0000000000
--- a/meta/recipes-devtools/rust/files/bootstrap_fail.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-rust: Fix BOOTSTRAP_CARGO failure during Rust Oe-selftest
-
-BOOTSTRAP_CARGO command fails due to codegen flags like `-Cpanic` were
-prevented from being reflected in the current target configuration which
-leads to Rust build(rust version 1.70) failure in Oe-selftest.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/9dffb5=
2738e0b2ccd15af36d4607a709b21e020c]
-
-Signed-off-by: Yash Shinde <yashinde145@gmail.com>
----
-diff --git a/src/tools/compiletest/src/common.rs b/src/tools/compiletest/s=
rc/common.rs
---- a/src/tools/compiletest/src/common.rs
-+++ b/src/tools/compiletest/src/common.rs
-@@ -431,7 +431,6 @@
-             .unwrap()
-         };
-
--        let mut current =3D None;
-         let mut all_targets =3D HashSet::new();
-         let mut all_archs =3D HashSet::new();
-         let mut all_oses =3D HashSet::new();
-@@ -452,14 +451,11 @@
-             }
-             all_pointer_widths.insert(format!("{}bit", cfg.pointer_width)=
);
-
--            if target =3D=3D config.target {
--                current =3D Some(cfg);
--            }
-             all_targets.insert(target.into());
-         }
-
-         Self {
--            current: current.expect("current target not found"),
-+            current: Self::get_current_target_config(config),
-             all_targets,
-             all_archs,
-             all_oses,
-@@ -471,6 +467,89 @@
-         }
-     }
-
-+    fn get_current_target_config(config: &Config) -> TargetCfg {
-+        let mut arch =3D None;
-+        let mut os =3D None;
-+        let mut env =3D None;
-+        let mut abi =3D None;
-+        let mut families =3D Vec::new();
-+        let mut pointer_width =3D None;
-+        let mut endian =3D None;
-+        let mut panic =3D None;
-+
-+        for config in
-+            rustc_output(config, &["--print=3Dcfg", "--target", &config.t=
arget]).trim().lines()
-+        {
-+            let (name, value) =3D config
-+                .split_once("=3D\"")
-+                .map(|(name, value)| {
-+                    (
-+                        name,
-+                        Some(
-+                            value
-+                                .strip_suffix("\"")
-+                                .expect("key-value pair should be properl=
y quoted"),
-+                        ),
-+                    )
-+                })
-+                .unwrap_or_else(|| (config, None));
-+
-+            match name {
-+                "target_arch" =3D> {
-+                    arch =3D Some(value.expect("target_arch should be a k=
ey-value pair").to_string());
-+                }
-+                "target_os" =3D> {
-+                    os =3D Some(value.expect("target_os sould be a key-va=
lue pair").to_string());
-+                }
-+                "target_env" =3D> {
-+                    env =3D Some(value.expect("target_env should be a key=
-value pair").to_string());
-+                }
-+                "target_abi" =3D> {
-+                    abi =3D Some(value.expect("target_abi should be a key=
-value pair").to_string());
-+                }
-+                "target_family" =3D> {
-+                    families
-+                        .push(value.expect("target_family should be a key=
-value pair").to_string());
-+                }
-+                "target_pointer_width" =3D> {
-+                    pointer_width =3D Some(
-+                        value
-+                            .expect("target_pointer_width should be a key=
-value pair")
-+                            .parse::<u32>()
-+                            .expect("target_pointer_width should be a val=
id u32"),
-+                    );
-+                }
-+                "target_endian" =3D> {
-+                    endian =3D Some(match value.expect("target_endian sho=
uld be a key-value pair") {
-+                        "big" =3D> Endian::Big,
-+                        "little" =3D> Endian::Little,
-+                        _ =3D> panic!("target_endian should be either 'bi=
g' or 'little'"),
-+                    });
-+                }
-+                "panic" =3D> {
-+                    panic =3D Some(match value.expect("panic should be a =
key-value pair") {
-+                        "abort" =3D> PanicStrategy::Abort,
-+                        "unwind" =3D> PanicStrategy::Unwind,
-+                        _ =3D> panic!("panic should be either 'abort' or =
'unwind'"),
-+                    });
-+                }
-+                _ =3D> (),
-+            }
-+        }
-+
-+        TargetCfg {
-+            arch: arch.expect("target configuration should specify target=
_arch"),
-+            os: os.expect("target configuration should specify target_os"=
),
-+            env: env.expect("target configuration should specify target_e=
nv"),
-+            abi: abi.expect("target configuration should specify target_a=
bi"),
-+            families,
-+            pointer_width: pointer_width
-+                .expect("target configuration should specify target_point=
er_width"),
-+            endian: endian.expect("target configuration should specify ta=
rget_endian"),
-+            panic: panic.expect("target configuration should specify pani=
c"),
-+        }
-+    }
-+
-     // #[cfg(bootstrap)]
-     // Needed only for one cycle, remove during the bootstrap bump.
-     fn collect_all_slow(config: &Config) -> HashMap<String, TargetCfg> {
diff --git a/meta/recipes-devtools/rust/files/getrandom-open64.patch b/meta=
/recipes-devtools/rust/files/getrandom-open64.patch
deleted file mode 100644
index b35195e837..0000000000
--- a/meta/recipes-devtools/rust/files/getrandom-open64.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Do not use open64 on linux with musl
-
-glibc is providing open64 and other lfs64 functions but musl aliases
-them to normal equivalents since off_t is always 64-bit on musl,
-therefore check for target env along when target OS is linux before
-using open64, this is more available. Latest Musl has made these
-namespace changes [1]
-
-There is no need for using LFS64 open explicitly as we are only using it
-for opening device files and not real files
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=3D246f1c811448f37a44b41=
cd8df8d0ef9736d95f4
-
-Upstream-Status: Backport [https://github.com/rust-random/getrandom/commit=
/7f73e3ccc1f53bfc419e4ddcfd343766aa5837b6]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---- a/vendor/getrandom/.cargo-checksum.json
-+++ b/vendor/getrandom/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CHANGELOG.md":"cb054908f44d0e7f229dcc4580bcc4f2c3e2da198c84292=
710f730b33cc3d5f6","Cargo.toml":"708a5d9c89443b937aa50260e26a01f9ebfdd50a7a=
e312956795834e3187baf3","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4c=
8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9ca=
dfe4dbdc87203179c0899e738b39ade42177b","README.md":"7ae74633326a22fd6298d7f=
209fb14884277bd98049795f444945acbb2b0dfbd","benches/mod.rs":"c01b05c6d690a4=
b8937d25252f1385a6bff378517318ce832ea520036aabd571","src/3ds.rs":"0f48fc15f=
89b518fb92e06aaa4838b62dc073598e8f288df56ad1e5a9251af1e","src/bsd_arandom.r=
s":"d90c419d4def20f83e7535cd3f5ec07035045011a50c3652951d196a120c5d3e","src/=
custom.rs":"ce4640776d36872dbbd5e194bf29f6bcda3ef4549ca04fe59f5aeab1dea1d82=
1","src/dragonfly.rs":"47f933eac189f6ea48ecf021efd0747ebce1b43d1bece6bbf72a=
951bab705987","src/error.rs":"ff09a7e02d7aff3e45eca6bbef6c686cc46f3c2371a08=
97a856e4dec4b942e46","src/error_impls.rs":"9c34832ebb99cd5e31bc5c8ffc5beb5b=
3fa6f7ff0226aaa1cdf8e10e6d64b324","src/espidf.rs":"19f101486584fde6dad962f4=
d9792de168658047312106641a5caf6866a5bbcf","src/fuchsia.rs":"470d8509deb5b06=
fa6417f294c0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"4bad4f5c09=
6a50338b86aeac91a937c18bc55b9555e6f34806ad13732e64523d","src/js.rs":"370610=
a19045012c87c986279aad6b150cd728a44015dcc5779256e4a2e6629b","src/lib.rs":"8=
e5c2c8edcbdbf2cee46b86d96d951cc6d5c00f7c11cfc9c27de27e756b5c4cc","src/linux=
_android.rs":"ec24575aa4ae71b6991290dadfdea931b05397c3faababf24bd794f1a9624=
835","src/macos.rs":"6c09827ad5292cd022e063efa79523bfdb50ed08b9867ebaa007cd=
321b8d218e","src/openbsd.rs":"450a23ead462d4a840fee4aa0bfdab1e3d88c8f48e4bb=
608d457429ddeca69c0","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2ed=
750d3339e342ab144e1709827e4","src/solaris_illumos.rs":"d52fee9dd7d661f960c0=
1894edd563c1ff8a512c111f7803092d9aa2ff98718e","src/solid.rs":"997035d54c976=
2d22a5a14f54e7fbed4dd266cdeacbdf6aab7d8aee05537e8ba","src/use_file.rs":"16e=
42eb0a56e375c330c1ca8eb58c444e82ef3ad35230b961fdba96a02a68804","src/util.rs=
":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72cda8b","src/u=
til_libc.rs":"2a63ac0e6dab16b85c4728b79a16e0640301e8b876f151b0a1db0b4394fa2=
19f","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af3111e4bacd2e125=
05a8d50a3505","src/wasi.rs":"dfdd0a870581948bd03abe64d49ca4295d9cfa26e09b97=
a526fd5e17148ad9ca","src/windows.rs":"d0b4f2afd1959660aa9abcd9477764bd7dc0b=
7d7048aee748804b37963c77c6f","tests/common/mod.rs":"b6beee8f535d2d094a65711=
fe0af91a6fc220aa09729ed7269fe33cafdc9177f","tests/custom.rs":"9f2c0193193f6=
bcf641116ca0b3653b33d2015e0e98ce107ee1d1f60c5eeae3a","tests/normal.rs":"9e1=
c4b1e468a09ed0225370dfb6608f8b8135e0fabb09bbc1a718105164aade6","tests/rdran=
d.rs":"4474ccebf9d33c89288862a7e367018405968dddc55c7c6f97e21b5fe2264601"},"=
package":"c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"}
-\ No newline at end of file
-+{"files":{"CHANGELOG.md":"cb054908f44d0e7f229dcc4580bcc4f2c3e2da198c84292=
710f730b33cc3d5f6","Cargo.toml":"708a5d9c89443b937aa50260e26a01f9ebfdd50a7a=
e312956795834e3187baf3","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4c=
8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9ca=
dfe4dbdc87203179c0899e738b39ade42177b","README.md":"7ae74633326a22fd6298d7f=
209fb14884277bd98049795f444945acbb2b0dfbd","benches/mod.rs":"c01b05c6d690a4=
b8937d25252f1385a6bff378517318ce832ea520036aabd571","src/3ds.rs":"0f48fc15f=
89b518fb92e06aaa4838b62dc073598e8f288df56ad1e5a9251af1e","src/bsd_arandom.r=
s":"d90c419d4def20f83e7535cd3f5ec07035045011a50c3652951d196a120c5d3e","src/=
custom.rs":"ce4640776d36872dbbd5e194bf29f6bcda3ef4549ca04fe59f5aeab1dea1d82=
1","src/dragonfly.rs":"47f933eac189f6ea48ecf021efd0747ebce1b43d1bece6bbf72a=
951bab705987","src/error.rs":"ff09a7e02d7aff3e45eca6bbef6c686cc46f3c2371a08=
97a856e4dec4b942e46","src/error_impls.rs":"9c34832ebb99cd5e31bc5c8ffc5beb5b=
3fa6f7ff0226aaa1cdf8e10e6d64b324","src/espidf.rs":"19f101486584fde6dad962f4=
d9792de168658047312106641a5caf6866a5bbcf","src/fuchsia.rs":"470d8509deb5b06=
fa6417f294c0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"4bad4f5c09=
6a50338b86aeac91a937c18bc55b9555e6f34806ad13732e64523d","src/js.rs":"370610=
a19045012c87c986279aad6b150cd728a44015dcc5779256e4a2e6629b","src/lib.rs":"8=
e5c2c8edcbdbf2cee46b86d96d951cc6d5c00f7c11cfc9c27de27e756b5c4cc","src/linux=
_android.rs":"ec24575aa4ae71b6991290dadfdea931b05397c3faababf24bd794f1a9624=
835","src/macos.rs":"6c09827ad5292cd022e063efa79523bfdb50ed08b9867ebaa007cd=
321b8d218e","src/openbsd.rs":"450a23ead462d4a840fee4aa0bfdab1e3d88c8f48e4bb=
608d457429ddeca69c0","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2ed=
750d3339e342ab144e1709827e4","src/solaris_illumos.rs":"d52fee9dd7d661f960c0=
1894edd563c1ff8a512c111f7803092d9aa2ff98718e","src/solid.rs":"997035d54c976=
2d22a5a14f54e7fbed4dd266cdeacbdf6aab7d8aee05537e8ba","src/use_file.rs":"16e=
42eb0a56e375c330c1ca8eb58c444e82ef3ad35230b961fdba96a02a68804","src/util.rs=
":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72cda8b","src/u=
til_libc.rs":"a47b20e73637fed248405650f56358f3339e511b217b7ba80e32011d8ee2c=
a22","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af3111e4bacd2e125=
05a8d50a3505","src/wasi.rs":"dfdd0a870581948bd03abe64d49ca4295d9cfa26e09b97=
a526fd5e17148ad9ca","src/windows.rs":"d0b4f2afd1959660aa9abcd9477764bd7dc0b=
7d7048aee748804b37963c77c6f","tests/common/mod.rs":"b6beee8f535d2d094a65711=
fe0af91a6fc220aa09729ed7269fe33cafdc9177f","tests/custom.rs":"9f2c0193193f6=
bcf641116ca0b3653b33d2015e0e98ce107ee1d1f60c5eeae3a","tests/normal.rs":"9e1=
c4b1e468a09ed0225370dfb6608f8b8135e0fabb09bbc1a718105164aade6","tests/rdran=
d.rs":"4474ccebf9d33c89288862a7e367018405968dddc55c7c6f97e21b5fe2264601"},"=
package":"c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"}
-\ No newline at end of file
---- a/vendor/getrandom/src/util_libc.rs
-+++ b/vendor/getrandom/src/util_libc.rs
-@@ -135,19 +135,11 @@ impl Weak {
-     }
- }
-=20
--cfg_if! {
--    if #[cfg(any(target_os =3D "linux", target_os =3D "emscripten"))] {
--        use libc::open64 as open;
--    } else {
--        use libc::open;
--    }
--}
--
- // SAFETY: path must be null terminated, FD must be manually closed.
- pub unsafe fn open_readonly(path: &str) -> Result<libc::c_int, Error> {
-     debug_assert_eq!(path.as_bytes().last(), Some(&0));
-     loop {
--        let fd =3D open(path.as_ptr() as *const _, libc::O_RDONLY | libc:=
:O_CLOEXEC);
-+        let fd =3D libc::open(path.as_ptr() as *const _, libc::O_RDONLY |=
 libc::O_CLOEXEC);
-         if fd >=3D 0 {
-             return Ok(fd);
-         }
diff --git a/meta/recipes-devtools/rust/files/lib-test-features.patch b/met=
a/recipes-devtools/rust/files/lib-test-features.patch
new file mode 100644
index 0000000000..729039d928
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/lib-test-features.patch
@@ -0,0 +1,18 @@
+The cargo recipe builds the crates with 'panic-unwind' and 'backtrace' fea=
tures but these features are removed from 'library/test' crate and this res=
ults in build issues. So, the required feature support is added back to res=
olve build issues.
+
+Upstream-Status: Inappropriate [patches need rework]
+Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>=20
+---
+diff --git a/library/test/Cargo.toml b/library/test/Cargo.toml
+index 91a1abde059..34d02c53ed1 100644
+--- a/library/test/Cargo.toml
++++ b/library/test/Cargo.toml
+@@ -12,3 +12,8 @@ std =3D { path =3D "../std" }
+ core =3D { path =3D "../core" }
+ panic_unwind =3D { path =3D "../panic_unwind" }
+ panic_abort =3D { path =3D "../panic_abort" }
++
++[features]
++backtrace =3D ["std/backtrace"]
++panic-unwind =3D ["std/panic_unwind"]
++
diff --git a/meta/recipes-devtools/rust/files/zlib-off64_t.patch b/meta/rec=
ipes-devtools/rust/files/zlib-off64_t.patch
index 78c8a2a1fb..66da879a38 100644
--- a/meta/recipes-devtools/rust/files/zlib-off64_t.patch
+++ b/meta/recipes-devtools/rust/files/zlib-off64_t.patch
@@ -26,6 +26,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/vendor/libz-sys/.cargo-checksum.json
 +++ b/vendor/libz-sys/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"Cargo.toml":"ce67ce7c1f3c4ad7832d58ed198b8dd745abacc620738d575=
c4b1a9ac9e79449","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379d464=
acb3408d4c599d3dc5fe4fa1b4c84f","README.md":"b23e18bdce29fabc3d34e88576219f=
50d1d735a355e427e6d6ebc09254138070","build.rs":"e034f7828ff43a0bb0f7b690e8e=
99b09b8f4e1ae0560b6fb4008006e9cd4d9dd","ci/Dockerfile":"4d479ea63b9e384b386=
4fa1204894bfae4890017d6bf03486274457fe2c26cf8","ci/run-docker.sh":"0ea7a4fd=
c9f6026110e20fa2e25dbadfc1e6dafed9ded5981ae36772ad207e26","ci/set_rust_vers=
ion.bash":"4284f86ac3923a73dd79e89bef2d0b136c6d104d6dae92e24b4a96eaffa28890=
","ci/test.bash":"73a936768549eedf96a7cddb350ada128e058d5d9004244ebf3d99336=
3b69599","src/lib.rs":"40476f4e896c936c21f908396255c7a4951ef8bf93788858ade6=
cace2539927b","src/smoke.c":"10607c81b73811bfcb9718767312bf97ba2ccf7048ea2f=
18a2085aa06ad7f91b","src/zlib-ng/CMakeLists.txt":"60b836817b51e5893b1e3203a=
daf57a98678af17957eccaef679bd96bcf5d90b","src/zlib-ng/FAQ.zlib":"d1777aa057=
caeef50fc291aac7a414363b2186bb3d65bb0f8bfa2bfd61cf0ad5","src/zlib-ng/INDEX.=
md":"989545e90d8e9ac149034f762ce78ed8976ebf9324326228dea37ca190154609","src=
/zlib-ng/LICENSE.md":"d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d97=
8ea77845436","src/zlib-ng/Makefile.in":"15027511a77e76b423eccf10ebfe66398ea=
96862cbce2415e5ebac7c7cbb6ab6","src/zlib-ng/PORTING.md":"5cff8c878c7958f6a4=
bada5a403dcc88961c9607826faece1aef202b5d95c550","src/zlib-ng/README.md":"9c=
ac4a98ecf45f50adf5030d4dc58b3cf9f3ae8e3ec78d30fdae4a99a2b4b8d9","src/zlib-n=
g/adler32.c":"82ffa1b4fc4b198ba8004135f79b8819d9f2b28e851c30c0ab41e6d32dfbf=
70d","src/zlib-ng/adler32_p.h":"f56915c59a345baf4558374447385a317e29365a4db=
2fbb38af4de3e1a1a0201","src/zlib-ng/arch/arm/Makefile.in":"95464884ba75a7b1=
2c9ceda5845d8d68d5a7d7dac8a8dc24b27beb2192e5b97b","src/zlib-ng/arch/arm/adl=
er32_neon.c":"3990b8d5570b12c2162218fe0e9bc723a03f1c89b5ed3ba70a74a98976260=
ee7","src/zlib-ng/arch/arm/arm.h":"855adbb02d7b9a5714a17d9dcff493610e7cd2b9=
a1f4e58e1c99626ab536e868","src/zlib-ng/arch/arm/armfeature.c":"dd09ad2712b0=
37e8d52173402f39cc2be1bc89d47fc10259ef81b4c64aef7110","src/zlib-ng/arch/arm=
/chunkset_neon.c":"65b70014888e9fbdb89bfbfa52f23b8953dc015466577da292d4780b=
55c5d95a","src/zlib-ng/arch/arm/crc32_acle.c":"5a96afc594697d1399870d1bfb06=
23a03869eff42caae74013f147cec4aa982e","src/zlib-ng/arch/arm/ctzl.h":"feb70d=
55e66025fff806e30e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-ng/ar=
ch/arm/insert_string_acle.c":"d1b1dae5aeada70f2b03c2cbf3112ce55a92401c2d877=
09081b04dcf5992e1ad","src/zlib-ng/arch/arm/slide_neon.c":"19d8cf5c742ac6b82=
164c7a183538ad1129f9f17e9b8bce8b40daac3820fb6c4","src/zlib-ng/arch/generic/=
Makefile.in":"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd6d9d=
b09","src/zlib-ng/arch/power/Makefile.in":"69644d1a0ff8e7f38005c0a55cdbaf3f=
0d87f42abf8fc4f4136271c4fedfb846","src/zlib-ng/arch/power/adler32_power8.c"=
:"79b75e98ad3a62facbbdd8c0b178d3f993b57f6e34d320bf47eca33aa8c330a1","src/zl=
ib-ng/arch/power/power.c":"0647afb3b3b7ce2a19b4815ec8fdeee0b37c759413e5ef0a=
668a2dba22d94803","src/zlib-ng/arch/power/power.h":"f3f15f94fed98a2f7dd5d45=
68c5172e597228be4141d6895062703c3f70024da","src/zlib-ng/arch/power/slide_ha=
sh_power8.c":"932ea533d25e2f5478afe0c47830e7ef24276cad0d75fd91f2d8c799bd4b5=
d36","src/zlib-ng/arch/s390/Makefile.in":"eef6c3169723f089b0b5f852423ec55bf=
0364caeddd7cda991f2e76bc1682107","src/zlib-ng/arch/s390/README.md":"4f5018c=
b7c8ee217710a90193088889a15f1675d205a104140f6a1ac07ce412c","src/zlib-ng/arc=
h/s390/dfltcc_common.c":"6771ec4457da9f4b00c74bcc0828735e21c74b9162cb37383c=
297c3b5028cddf","src/zlib-ng/arch/s390/dfltcc_common.h":"ed339007feae58d187=
9e096addb30ed86cd5cf11222db22c45f48b47328cf6db","src/zlib-ng/arch/s390/dflt=
cc_deflate.c":"7b3dec7be4055c7748defc626dc91db99787c9f3b70b7d7b40282558bbb4=
78e9","src/zlib-ng/arch/s390/dfltcc_deflate.h":"c4c411f221cc0f6b218326e973f=
ef05c65840ba49878aff052dac0bb38121cbd","src/zlib-ng/arch/s390/dfltcc_detail=
.h":"01dbdfaf5e8ccf522663b4daa76e9138dde514292c35a623be4bcbbf4b82dea2","src=
/zlib-ng/arch/s390/dfltcc_inflate.c":"a96226eba3538d3904893cfe1b08395668e6a=
722b56f28d5b5debb3176161b4b","src/zlib-ng/arch/s390/dfltcc_inflate.h":"d7a4=
a5ae79abd1a5456521926b918becfe86c253a4fc23723fbc09f7c3303128","src/zlib-ng/=
arch/x86/INDEX.md":"c12f9bf0d66743a6472fb756bf46def8eea1dd235be7fca994dcb22=
f693a3524","src/zlib-ng/arch/x86/Makefile.in":"9f6fe7567a99e81aaa3bef8ccfa1=
ad40f524efc285cf8dfe0f497a1530f8016c","src/zlib-ng/arch/x86/adler32_avx.c":=
"99056732c7bd5d53dc108f282811a40bf21570926781af5dc7b17cb9218963de","src/zli=
b-ng/arch/x86/adler32_ssse3.c":"883a5520b4481225d097c90c5359106a3c8eb7b9214=
99c94276e999b7c39adc5","src/zlib-ng/arch/x86/chunkset_avx.c":"15060e7ee487f=
b1daef9be25343ae387392276933921e4b4db0c67831dc0854f","src/zlib-ng/arch/x86/=
chunkset_sse.c":"f7ccb55b67101ddb9def951a6d6f9dd4cb108fdd9e65f0f21d82723d1b=
093a22","src/zlib-ng/arch/x86/compare258_avx.c":"8b2838d168de4608327f25fe52=
d53763a82413ee911d87947d3fcd72c7f9bf26","src/zlib-ng/arch/x86/compare258_ss=
e.c":"b5049722ffd4a43a96868eeba5e000271cfc5fcbf3c2657026ead15b1df28a10","sr=
c/zlib-ng/arch/x86/crc_folding.c":"75199cdd06ec2f8f43bf38583b2c4d98bbbbd924=
e659267fdc1fa5134f1472eb","src/zlib-ng/arch/x86/crc_folding.h":"93921254661=
1917e9e066e8ed30cdda95680ec1f5fe0890cc4865b4e6d7fc215","src/zlib-ng/arch/x8=
6/insert_string_sse.c":"9e84a75b6a565422eb105261b6729d2a02b89133bd14372c949=
d5381b5deed3e","src/zlib-ng/arch/x86/slide_avx.c":"5e448e439ac24e7cb10eee17=
6ca37f2c63f73c135c0a2af040e232bad490997d","src/zlib-ng/arch/x86/slide_sse.c=
":"1946cabb634c905fddef0a22b2fad19dfd99110169567c3beceef71145b2e316","src/z=
lib-ng/arch/x86/x86.c":"1af56e27b2e951e1ad1344e62c2f7a8c49a776fcdd1cb0f4ea9=
d6152118a479e","src/zlib-ng/arch/x86/x86.h":"4d2d20ea0087089141e250e77bb3d4=
19954b9092810028b151581b9115a5fe8c","src/zlib-ng/chunkset.c":"c0dbc7abbdad5=
137a9efb2b0a76a212e77d4bf44beebe721c68359fa83002ff2","src/zlib-ng/chunkset_=
tpl.h":"35d15e97bd72d4e03dcec3ee804a08ea6a74faac2ef835caecc0e38bc9daf0c0","=
src/zlib-ng/cmake/detect-arch.c":"a9509327c2f4395955466b0acce453c29592d4686=
022714cb9e8b411d7e60c29","src/zlib-ng/cmake/detect-arch.cmake":"9cbb09b297f=
79e94b55fffb9acbafbee8d6761e854d818f1a0c686e3fcddf574","src/zlib-ng/cmake/d=
etect-coverage.cmake":"e4e372991ba80a16ad47df2716708a56013cc628aa7ed01573a2=
360c60610125","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a40428a10=
4f5cf38ecdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/dete=
ct-sanitizer.cmake":"5e6fe6d2d877540811313f0c8e9884adb21a9ace2e24f23190f0fa=
c1d52dd2b8","src/zlib-ng/cmake/run-and-compare.cmake":"dc45eeb6d3e485404983=
4ec1ec2891342646c7fb803a0b6c2644d6316f89b668","src/zlib-ng/cmake/run-and-re=
direct.cmake":"2de9c784da3e04331465a3c56125b9c7d8e74b898b4cf85353aca196f90e=
a9bb","src/zlib-ng/cmake/test-compress.cmake":"3f37319963a80a31f752fca1c825=
71d552fd4701326bc40fdb02b54ec3f7a3f0","src/zlib-ng/cmake/test-tools.cmake":=
"4dcf099245085ee2b6d8ec41620bca3f7b718365dbb9bb0ad23931e83bf36aeb","src/zli=
b-ng/cmake/toolchain-aarch64.cmake":"8d7ba07ee1cb9fbc7817da1c5e74ce6c85ff81=
c10962a33941f0e24471956e59","src/zlib-ng/cmake/toolchain-arm.cmake":"0b0ab2=
b1093ef851c3dbd6fe53f855628df0778841a488aaef85d2c70f04a257","src/zlib-ng/cm=
ake/toolchain-mingw-i686.cmake":"6551576324fed6ccedffcfe8da762402dc863c20a2=
789a9b0030b9d32e15a15f","src/zlib-ng/cmake/toolchain-mingw-x86_64.cmake":"e=
c7bf5c8640fb61d2e30f8db7b588ca9b66da92d4a59e88ce16c5fc7f9ce02b6","src/zlib-=
ng/cmake/toolchain-powerpc.cmake":"6373abe883a99616aa51422a9b714894dc521211=
be49502463576f58d3d26b2a","src/zlib-ng/cmake/toolchain-powerpc64.cmake":"32=
8d1ea039a30e03ee9a552858b9f180b3da2614b712f618da1a0fa98f30a53b","src/zlib-n=
g/cmake/toolchain-powerpc64le.cmake":"ec90270bd1f4aa649abddddd2618168d399d5=
8a1c1c35b3d8d909e570eb9be1c","src/zlib-ng/cmake/toolchain-s390x.cmake":"cb6=
34252c21c4f55d06cdc49ce522a5546aae592daa0f12aa4282c0aef323828","src/zlib-ng=
/cmake/toolchain-sparc64.cmake":"d70d39760a23886ebd1c5a1a87651bfb47a9b24def=
9e7955ee1cbec60b40925b","src/zlib-ng/compare258.c":"56bfd48d5ff9ca422fbb728=
df7a373436c73796561dff118c7d4039fe70d29e2","src/zlib-ng/compress.c":"1abf5b=
13e3e805becc14f4f16dad9bf816f4fe41754b1abf75f670dcc84567cc","src/zlib-ng/co=
nfigure":"681d5b1303aab0523334c90ff049757e7ee6b2683f2411204b7245ba4adca4b2"=
,"src/zlib-ng/crc32.c":"98440be8a99381151a2d740f2e2228e8c1b23b9193c3642c52a=
4e34799506336","src/zlib-ng/crc32_comb.c":"78cd1a3d31963bfa5bd9d476250b2bb7=
777b12b6ebe0475acf021ca794757165","src/zlib-ng/crc32_comb_tbl.h":"d6615d209=
d6c7d5248c6f7fe4e5dbded13c0eb87997b37693032c2902927407d","src/zlib-ng/crc32=
_p.h":"1fa91375a18e090c0a0dfda39de3df36346a0b1be36c808be6b6c29c32eba922","s=
rc/zlib-ng/crc32_tbl.h":"d629378ba38ff5775095b64e277bcd41c4b89fab9b5647a9fb=
29e15da0db0161","src/zlib-ng/deflate.c":"1a5ff34bf68b88e30f578ce7b15dd996c0=
5fed7bf42f58f4616af470ee18f103","src/zlib-ng/deflate.h":"a074e9a5dd5d689db6=
3655251d6a0948e7a7c0c4a4f6d0ca60bfe18291f3c34f","src/zlib-ng/deflate_fast.c=
":"b3b261b3a02b089599fcd9448965ef5d8e8b0e8e9556857357c9632930c7c748","src/z=
lib-ng/deflate_medium.c":"1c3d95cbac76052d39595ea750c5536541c18302b9abb398c=
27b58955318bba8","src/zlib-ng/deflate_p.h":"95026b1b48aa78204381b32617dd44e=
8c820c9bb21b415ebfcb33e6b5255233e","src/zlib-ng/deflate_quick.c":"280905a19=
1d2b2a7274f2453ac537e01a0fb6e7540a0b212c1514bfb8c9415ea","src/zlib-ng/defla=
te_slow.c":"a2c66723e1e71ffd6ff856407459ab311a4c6546ecf50285081fc7afcd0ccd2=
e","src/zlib-ng/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95aab=
b08e28c30c52bae3e8c4bd5ad","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c984657bf=
26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc1951.t=
xt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src=
/zlib-ng/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4de=
e21bd7e03ec9af67","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d380549=
a330e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins.h":=
"f07e83c5c444554577c4240ff7722057ea2a689f6baa0f9e8bda32b9a46888ca","src/zli=
b-ng/functable.c":"d3747a4674ddbc903ab1d06efe63a1c4b52bf42f7dd38cde3701fa82=
b1d953f0","src/zlib-ng/functable.h":"e5a2d0c10411d23f04295bcb9ddb9889388974=
b723caef65aa5c4ea4739f4aa7","src/zlib-ng/gzguts.h":"cbf2afc8a6183002254a73c=
abe8376e54b1aea2ba042e36138f292c9cdb95d5c","src/zlib-ng/gzlib.c":"5b5bea4f3=
19e5d0a96b92aa431fb33926686cd20686c90d75e42e1481872bbcf","src/zlib-ng/gzrea=
d.c":"fc4a187ba45ceb7b4b50f4f8dedc7685fe8687e6f034638a6437bebf71d51a13","sr=
c/zlib-ng/gzwrite.c":"7c86058ae23f856c099e2663a5676c97cfa4fb5df9b92893c9407=
6ba4aa9a56b","src/zlib-ng/infback.c":"97a35de1a3d3bec50e112853e03bf1628cbed=
3b0fb84459cc423e3f9f61fbea7","src/zlib-ng/inffast.c":"701519ee11d39cdf4e808=
395722415c42ff2be9445f66408fd879370f3242b57","src/zlib-ng/inffast.h":"42e74=
a92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-ng/i=
nffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd52187f3=
64314","src/zlib-ng/inflate.c":"a665bf717ee257a16a8ab993241f2cf9e71d49882ad=
dddb9518b88186f82a5cf","src/zlib-ng/inflate.h":"eb25527d1bdedaa45167926dce4=
c39d9aaa3147b0f4a95f38f5916528c30a09b","src/zlib-ng/inflate_p.h":"4a94c5119=
4da119770cf662ef289994f0c78d95184d54d6ae5d50a393e8f5a62","src/zlib-ng/inftr=
ees.c":"d1d88f98f9129c87f3ce1d6de5bea3ec867de23b1b2bdd585257d231aac82a4f","=
src/zlib-ng/inftrees.h":"624c6653a454447c6274adf922430a19c96ef73c7687e4559d=
247ff48970bab5","src/zlib-ng/insert_string.c":"aa22ba53a1e75821499809277f9c=
a0e5ef92b07a618136dd11ae1734e233b7c9","src/zlib-ng/insert_string_tpl.h":"1c=
eba9903324d10aad6e1d83653c4d534a5b06fd09076414a06215482be00bac","src/zlib-n=
g/match_tpl.h":"eeab4c6eea8511a7579738e622af062ad16f4016312e93ad34bc5903d8b=
3c4a1","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce3496a=
ceaccd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2003-0107.c":=
"1bfbc88dc501cd92b8b26bd8944af6b150b376ebfe7241d90e2b93109be3d68c","src/zli=
b-ng/test/CVE-2004-0797/test.gz":"38caae524705f676bde13a8df9fc8c7d2fe105ba6=
bdbab62a405b0276fd3aa2e","src/zlib-ng/test/CVE-2005-1849/test.gz":"e4d5a606=
17df4b5dd44eda94751ce1eacdb325792bba6e3cc4676719a3adf742","src/zlib-ng/test=
/CVE-2005-2096/test.gz":"8f702d4861aa3ec98ac03a59ff26b430939630cb5cd4266d26=
58d3b836d576f9","src/zlib-ng/test/GH-361/test.txt":"358497d0a7251ea42101dc7=
7b02337f46fd89af09643a8288e2a3082e5d24128","src/zlib-ng/test/GH-364/test.bi=
n":"af5570f5a1810b7af78caf4bc70a660f0df51e42baf91d4de5b2328de0e83dfc","src/=
zlib-ng/test/GH-382/defneg3.dat":"b22bef6b7392401c9e7b079402c4a4074053d7a91=
4d050400e37fd7af6fe26d5","src/zlib-ng/test/GH-751/test.txt":"b83d833803b7bc=
3124fb2a0034081f0b999ad10c33a8dfa3bfd181dc078ae3ee","src/zlib-ng/test/Makef=
ile.in":"c3b6a1ec62838c140a78bc361448d5739756bbfa3bbbf1ffa64c342599949701",=
"src/zlib-ng/test/README.md":"fc485cfaaede6b3d3dc61fdd17cc7eee715c35d6f62e6=
e502f9251fd1b5edac9","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbddd23=
f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v1.2.=
11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d055a=
38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu.abi=
":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","src/z=
lib-ng/test/abicheck.md":"fa5d6d33ff0fd95eefb7c6c0c7f67351282e6eda20c4e3884=
2235a610cc10382","src/zlib-ng/test/abicheck.sh":"b23ee3678acb24caf36fc8402a=
07452de73c50640ebe641f185c7f9d5ea257e7","src/zlib-ng/test/adler32_test.c":"=
db3e8ad9a4e2ecce0c052b0bfe19834d3ff2fb2e9239cc3438a2c95db00b1d21","src/zlib=
-ng/test/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d6d=
74364150e255f126512","src/zlib-ng/test/data/lcet10.txt":"938e69e61b3411d8a9=
e2e630f4265000d810f3dbf66bac58cac19493753526ec","src/zlib-ng/test/data/pape=
r-100k.pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e4484=
9b","src/zlib-ng/test/deflate_quick_bi_valid.c":"0e00da0e048c46204c39aff4b8=
fb79890274d3c6183a9409aefd5c93e4e92a48","src/zlib-ng/test/deflate_quick_blo=
ck_open.c":"455bd347bb88debdfacb409846170274991ec9ba71c52b8fd0e526daf57265e=
b","src/zlib-ng/test/example.c":"8bfad1221a8df5b6202e11f6be4bae5dbccd8a24fb=
7bbd8dd88e7ecd318907e7","src/zlib-ng/test/fuzz/checksum_fuzzer.c":"3a15479f=
2cb40b6c5760dadb246328fab7315f3e3b8e28c1bc246c9b9a867c69","src/zlib-ng/test=
/fuzz/compress_fuzzer.c":"1ab70608075c4bc60f89aa2f327cff88362ee7b1d31da88ed=
54ca51e5f99e5c9","src/zlib-ng/test/fuzz/example_dict_fuzzer.c":"04262105305=
0f0fde90a0428cd1afabda8cc7c3fa59e3e0a55c43ab1e03d3988","src/zlib-ng/test/fu=
zz/example_flush_fuzzer.c":"f12246a184dcfe0a19a98cdc742a1fe8da388ad20b40663=
5d63f1fa10d45b9ca","src/zlib-ng/test/fuzz/example_large_fuzzer.c":"f490abcd=
332fb4e7921292adf6876d38d7f71c8d2443212c781ba88957ff9303","src/zlib-ng/test=
/fuzz/example_small_fuzzer.c":"a9b3436b291ace821b6013311a1100e19a9e1c67fefd=
3f97dbd60688f9bf22b1","src/zlib-ng/test/fuzz/minigzip_fuzzer.c":"7b0e7da9b6=
c60f3b3a13f140cc445050d9e8958d4f59cbb9a498c08f3a53adab","src/zlib-ng/test/f=
uzz/standalone_fuzz_target_runner.c":"306e8ac4e08ea72d18ffae8c908abfef8c6fe=
edf83b068a7ec675ade6a5791a8","src/zlib-ng/test/hash_head_0.c":"d88105a80e75=
6b7206a20c7b2490a2e7e743a2ceb1f20d3e433ce9848f054e1b","src/zlib-ng/test/inf=
cover.c":"b9acffc102fdd140941073ca47e30c938aa937b4929061500c36ffba12c86449"=
,"src/zlib-ng/test/minideflate.c":"93de8ffcbe7c414abf3ea36acdf729bcedb40393=
ec7bd10b356ebe225406e173","src/zlib-ng/test/minigzip.c":"291e2ea30778a3e829=
b96cb47211e89494ece036cd74591178710b4276c9b48f","src/zlib-ng/test/pkgcheck.=
sh":"75b3155125f235e27ee434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed","src=
/zlib-ng/test/switchlevels.c":"c30ae3d27ce6041934532553719622e7ed473541aa7b=
dad8d11d0c55e5220f14","src/zlib-ng/test/testCVEinputs.sh":"5de6198444c16726=
f8e0a8f2beb5b89c5ae7e7e3736ce760b9fbc719493e7e4f","src/zlib-ng/tools/codeco=
v-upload.sh":"ec7a8f1405820810e486e3d7e2fda7eb958c17877b0000b93abdf09d87732=
a2f","src/zlib-ng/tools/config.sub":"32186cfeb5db62c99e1dfbfb07f24c1a509774=
47b4c26d2907021c74422a70d2","src/zlib-ng/tools/makecrct.c":"55c8f7b8e29393e=
95988a29de8cb1a1bdf2738a69d53627bd0f9d7bf169bf0a8","src/zlib-ng/tools/makef=
ixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc48975857bbb4547f1d6acce21ef57",=
"src/zlib-ng/tools/maketrees.c":"2dbfe34691dde327618be496b380fc91daaa304743=
52815773a8b70114b0541a","src/zlib-ng/trees.c":"956ce5b3f3330320cb5baadbf772=
1572259ec41edc4d8c132a20888b7f6f60c3","src/zlib-ng/trees.h":"24174f3543b01e=
e1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f99","src/zlib-ng/trees_emit=
.h":"f68904e04caee0482c72ea92cc775cabe35a0bf7cffce85566c15ace27666af4","src=
/zlib-ng/trees_tbl.h":"35f4fd0ec080c1ade342e2dd1b0f5cdc7e9f18990faa48d7a8a6=
9bc318ebe607","src/zlib-ng/uncompr.c":"4ebb486b27930f8a6ec4a3cc90a207d0bcf8=
a4779d1dbf3b2184a2b2a5735cd1","src/zlib-ng/win32/DLL_FAQ.txt":"d2ec63cb4a51=
886e0813f75bca49a051bede364d855f938e1a7992ab97a79800","src/zlib-ng/win32/Ma=
kefile.a64":"775d6902373d1583430b5d7467f001746be323610c89be27e02bbfe0205994=
f3","src/zlib-ng/win32/Makefile.arm":"7535e022f482920c3fa7a267e84e39ad790d1=
50f72e5c30414baa156c2fdd9b6","src/zlib-ng/win32/Makefile.msc":"deee44d56248=
90e692d87db311216075e967c3ac8aeea6ffcdcac3d03eea260b","src/zlib-ng/win32/RE=
ADME-WIN32.txt":"a8c2d052960b963a49cee5a2ad891f2ff7b34db038f00985eba4eefc99=
966261","src/zlib-ng/win32/zlib-ng.def":"f240276caf805a10d024fc6a66efe915c4=
35734c69732818d92fb04d08ab350c","src/zlib-ng/win32/zlib-ng1.rc":"b567a27640=
7998bae40aacd48a50beba87c0bfbae470d28e66331ac99eb575c8","src/zlib-ng/win32/=
zlib.def":"d9c371ff2677567350386441a2e3d0258010d6502290bbac5ac42ea168bd5212=
","src/zlib-ng/win32/zlib1.rc":"d7f269379144d65bcd1b67c1065e5d4120579f14ce5=
4ecf246eaba394fa989a5","src/zlib-ng/win32/zlibcompat.def":"73728b9df4379dc7=
0ebd9b2a9f20d6e4ed7c031fa1f351cdeae1de7d1db05bd1","src/zlib-ng/zbuild.h":"f=
73424f5f10370ffe8f45f6e3dc52dd095ea778153832461d712a838e3a01098","src/zlib-=
ng/zconf-ng.h.in":"708106f26c4a0d877e2ea644320a2b48b144524b61429c7490e2e742=
a0c0c1e4","src/zlib-ng/zconf.h.in":"dacec2360fd9607f85bdf651409fa3831dd26f7=
4414d242e812b06c3b9c9926d","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b097d3=
18500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h":"7a15bda=
0297b2611da695f895cc57ce44c284b030fe98817281e868a1a86ae35","src/zlib-ng/zli=
b-ng.map":"e8202981574d814cb2a9f06bca7900d0959c24766bd86681bd3843ab0e71f8ef=
","src/zlib-ng/zlib.h":"703bead0c02381c8df8d14d805fde913973b2960811f35e2de4=
f4aaf29ad905c","src/zlib-ng/zlib.map":"e3549810f821d433d57f921ca2fceb867457=
4f778485255a7dc691bf26b5281b","src/zlib-ng/zlib.pc.cmakein":"17668e07edbe59=
71043bea26a2f2b92c4c7cf4724620f1156f3ea1436d2aac93","src/zlib-ng/zlib.pc.in=
":"cf94c9aa44878a62e27c2f75354c08326b3bb5250a9b11496855cf59691177bb","src/z=
lib-ng/zutil.c":"7544aa2d2cfce4693d4e2a639f0631c3e8b3e7d0d846313be0e250c477=
e6812c","src/zlib-ng/zutil.h":"c0e9152d078ca1774c93910fd84531b2f593b3a6b103=
5e4d97a0d28b720ec98b","src/zlib-ng/zutil_p.h":"1e5a2fb8d15212ad094e9a5d5f60=
7f11f8191498b54e0af48d722f92d9c71ffd","src/zlib/CMakeLists.txt":"b87275731c=
c3ebdfea144187875cea204f555c343279c0f35f2d46d661bfe34a","src/zlib/ChangeLog=
":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02ea8c9933fdbe629a640691375e","src/z=
lib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8cad72892318a8831946cba1abd30d65521c"=
,"src/zlib/INDEX":"3b4e325d47ae66456d43fcf143ba21ab67a02a4f81be7ef2da480ba3=
0d774266","src/zlib/Makefile":"ef23b08ce01239843f1ded3f373bfc432627a477d62f=
945cbf63b2ac03db118a","src/zlib/Makefile.in":"5021b2bac4164f48b17c91c8a2e3c=
225be7ad31d8bfab1bbaadd90370afe9991","src/zlib/README":"7960b6b1cc63e619abb=
77acaea5427159605afee8c8b362664f4effc7d7f7d15","src/zlib/adler32.c":"d7f1b6=
e44fee20ab41cef1d650776a039a2348935eb96bcbd294a4096139be3a","src/zlib/amiga=
/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd9dc53d91ed78bbe495e94ccc84ddd423=
edf1f","src/zlib/amiga/Makefile.sas":"0e63cf88b505a1a04327bb666af3a985c5e11=
835c0c00aed4058c0dcc315d60e","src/zlib/compress.c":"5c11e1fc22e219cb986f6fa=
9e4ba939315227e84aef042737d38ec668b89b6d2","src/zlib/configure":"86b38f27f3=
1d2fec76d9355872550dc63cb3949774473fd6313c5a3fd1def0e2","src/zlib/contrib/R=
EADME.contrib":"ca39b78bd7ad84f1df7b0da90770c5b3fa4c8e2c75d132e9222812fac88=
39630","src/zlib/contrib/ada/buffer_demo.adb":"469cf566a6965767fee6b987a239=
ed8cedcc66614940d45a9b434331fbb435ce","src/zlib/contrib/ada/mtest.adb":"41b=
6f31684770334afdc4375871eb1408542f37a823a073556fdbfdb63753160","src/zlib/co=
ntrib/ada/read.adb":"fa5b989aef0c5715a3fcb15de93985f7f10aeb0a7f5716745c95ed=
820eb9af9c","src/zlib/contrib/ada/readme.txt":"8fe9e5303f2e8e8b746c78250e74=
b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/zlib/contrib/ada/test.adb":"5e3a=
be79b387e09a9a42bd0543105e228f39a335240cffc33d71f0ba66ff2511","src/zlib/con=
trib/ada/zlib-streams.adb":"f45988e2bac76eb25a0dc981f46576e7432c35dde1790bb=
c2b650f0090b7fa72","src/zlib/contrib/ada/zlib-streams.ads":"969e8edb0611810=
fb52159dcb7c40228f4e5da810a7a3576b778116a93038c6b","src/zlib/contrib/ada/zl=
ib-thin.adb":"03d89244ee5ec9771d9b5050e586c609f851af551b2e64eb151f1d5be0b63=
ae9","src/zlib/contrib/ada/zlib-thin.ads":"631ef170bde16c3ca8d412b54a0e5198=
15b80197d208f8f393e6fe017bb0968e","src/zlib/contrib/ada/zlib.adb":"c9ca5dc3=
4fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e12421323ab672c","src/zlib/contrib=
/ada/zlib.ads":"02634bec0d5e4c69d8d2859124380074a57de8d8bd928398379bfacc514=
236d2","src/zlib/contrib/ada/zlib.gpr":"859bb69dce38dbe9dca06753cf7ae7bd16d=
48f4fece8b87582dab8e30681d3de","src/zlib/contrib/amd64/amd64-match.S":"1660=
07f7e9adb58fe8b83d85bbfe823f5e05858ba1d06edf637b78886caa2c69","src/zlib/con=
trib/asm686/README.686":"c21cc7147c956ecae17dd084cb41a206b086216fa521012871=
fb07fafd203c6d","src/zlib/contrib/asm686/match.S":"873799062495629f21cd3f77=
9ea4b927add7aae0144e32d3594d9ce70185e99d","src/zlib/contrib/blast/Makefile"=
:"17d5d26c24bf51cad51045a38ffb73cc3539d29e89885aa249fcfd45a8659d5c","src/zl=
ib/contrib/blast/README":"baa763ae03d88ef7ece6eb80d9a099b43d0b57639d6d281e1=
c7c6ca79d81daba","src/zlib/contrib/blast/blast.c":"1ab3e479d342bfc144167b80=
8fb00142264bc50f24a110ca88cc774e351c218e","src/zlib/contrib/blast/blast.h":=
"4d4e3e6f893316f0be77bfd642c857a77f1fa2925acb5df9753e543d35aa3a6a","src/zli=
b/contrib/blast/test.pk":"5f5c262c545574a5c221132d5ef832478d222d70b01534179=
5b3860204140d7c","src/zlib/contrib/blast/test.txt":"9679b2c98e1283222d0782b=
25a1c198dc64ba9ebd1addd6dc6f643a45947cda3","src/zlib/contrib/delphi/ZLib.pa=
s":"1b20e173443a68c189cdaa4795620fb1ac165d9e61a27a1ed2cf690f13530d6f","src/=
zlib/contrib/delphi/ZLibConst.pas":"84bcc580bdf397e570f86f3f5a5b8c7bf537828=
f30b4b72648b81911f6bf5095","src/zlib/contrib/delphi/readme.txt":"f7420ed2de=
77d4b498eefbbe6402a1d17dc2d411735289c78a265c7f10fdaee5","src/zlib/contrib/d=
elphi/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b7226988=
776f8d511","src/zlib/contrib/dotzlib/DotZLib.build":"b96137097669644ecb9f42=
cdd3399d1fce9c512788374609303f7e50abf597f0","src/zlib/contrib/dotzlib/DotZL=
ib.chm":"20d0e3edd57f849143255a7f0df1cd59d41db464a72c0d5ab42846438a729579",=
"src/zlib/contrib/dotzlib/DotZLib.sln":"a979198c5b8d144c1ac8f993bfb6f4085d1=
35aa58ca9dcf63ebabf52b5c695f7","src/zlib/contrib/dotzlib/DotZLib/AssemblyIn=
fo.cs":"314afcfb339ea95f5431047b7ab24631b11c3532c7ce5dc2094ed0cf80a7c16d","=
src/zlib/contrib/dotzlib/DotZLib/ChecksumImpl.cs":"e7c047a2c3bcf88d3d002ee3=
d2d05af414acf53cb4451efacc0f2e95a474ea0f","src/zlib/contrib/dotzlib/DotZLib=
/CircularBuffer.cs":"be84c9736fe7bdc2bfae70466d8fff582504e928d5b5e110fd7580=
90090c8cb7","src/zlib/contrib/dotzlib/DotZLib/CodecBase.cs":"259bdda1b7d605=
2134e631fa24bfd9dca6e2362563496c8b85257b56c848908c","src/zlib/contrib/dotzl=
ib/DotZLib/Deflater.cs":"06ba6696a3c15c53ba5fd5a1c2bf50b51f217010228fc1e4c8=
495ee578f480de","src/zlib/contrib/dotzlib/DotZLib/DotZLib.cs":"9837fe993fd6=
31233cc5e53ff084d86754b97f05ec77c54b0764c2706f186134","src/zlib/contrib/dot=
zlib/DotZLib/DotZLib.csproj":"21606db31dfef6410dd438b73f1db68856eacabcce6c0=
f0411fc4f17e17001f3","src/zlib/contrib/dotzlib/DotZLib/GZipStream.cs":"8d1d=
e9755c77046b4ac71340a0a54434ebf4fd11b085c44454d7663a9b4df1c5","src/zlib/con=
trib/dotzlib/DotZLib/Inflater.cs":"9016ca73818f5b6a28791abc3af6da7c4d2773b6=
a3804f593f6d5737a62b99ad","src/zlib/contrib/dotzlib/DotZLib/UnitTests.cs":"=
ad66ac08de34d253e9615b96a745f3dfeda93f4a978d65d5d3ddb9d0d9b3e099","src/zlib=
/contrib/dotzlib/LICENSE_1_0.txt":"36266a8fd073568394cb81cdb2b124f7fdae2c64=
c1a7ed09db34b4d22efa2951","src/zlib/contrib/dotzlib/readme.txt":"d04972a91b=
1563fb4b7acab4b9ff2b84e57368953cc0596d5f5ea17d97315fd0","src/zlib/contrib/g=
cc_gvmat64/gvmat64.S":"22ff411b8b1d1b04aeaa8418b68245400267dc43c6f44104f6cc=
d37f0daee89f","src/zlib/contrib/infback9/README":"890288f02bb3b1f9cc654b87a=
07fcea695f90f6b9bd672d25bf6be1da2ec1688","src/zlib/contrib/infback9/infback=
9.c":"0a715c85a1ce3bb8b5a18d60941ffabc0186a886bcc66ba2ee0c4115a8e274e9","sr=
c/zlib/contrib/infback9/infback9.h":"dda2302f28157fe43a6143f84802af17403935=
72c2766559593996fd7a5a3245","src/zlib/contrib/infback9/inffix9.h":"84a2ba47=
27767c18af6505f0e81d9c814489c8b9ed330a25dad433db72997e43","src/zlib/contrib=
/infback9/inflate9.h":"32a907676cc36e27d0fdc0d99adb83a0b23f20ab61896269216d=
40fecf08d349","src/zlib/contrib/infback9/inftree9.c":"0c7f10396703b230c5042=
07fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04e0","src/zlib/contrib/infback9/inf=
tree9.h":"8ae61d52e50d2dbdb0378548ecc54fcd88f108c8b6fc30562a3ebec1ca6a599e"=
,"src/zlib/contrib/inflate86/inffas86.c":"6f266f3c7e0faca653256d0189c0f00d7=
dc0b062d02e25df4e1202e49369595c","src/zlib/contrib/inflate86/inffast.S":"70=
777bd21526680005fc34f086d108af49e2668ad86d1749e8e8100a81bfb288","src/zlib/c=
ontrib/iostream/test.cpp":"0f3c77e013949eb9c91e6b690ea894e19d97944d6b0885b8=
2806fc3ad99680cf","src/zlib/contrib/iostream/zfstream.cpp":"8ebb9b3d521cc33=
92953f27658cf1f6dcb763216079f69a1518ec5ca0e42a63b","src/zlib/contrib/iostre=
am/zfstream.h":"4369c35e66f63f52ca4a5e1759bf720507ccabb8f3f132e2f18e68686c8=
12401","src/zlib/contrib/iostream2/zstream.h":"d0343e0c57ff58008b6f29643d28=
9c72713aa2d653fe3dcd2e939fc77e7e20b6","src/zlib/contrib/iostream2/zstream_t=
est.cpp":"f789df183cc58b78751985466380c656308490a9036eb48a7ef79704c3d3f229"=
,"src/zlib/contrib/iostream3/README":"43ec48ecbd95a8c45db20b107fac73b740bb1=
1595a4737329188f06b713972cc","src/zlib/contrib/iostream3/TODO":"af5ebc83fb8=
8f69706c8af896733784753dead147687e1c046f410c0997fd88b","src/zlib/contrib/io=
stream3/test.cc":"8e17fc48dfdbc6e268838b8b427491b5843b6d18bc97caa6924de9fad=
7abe3da","src/zlib/contrib/iostream3/zfstream.cc":"8cdd67ed0b13c192c11e5ea9=
0e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","src/zlib/contrib/iostream3/zfstr=
eam.h":"1bd74778fac45ee090dfc0f182a23e8a849152deb630606884b2635987b357b1","=
src/zlib/contrib/masmx64/bld_ml64.bat":"1c0561908a07ebdff271b12ed757241e181=
3d3db0f3551501b2595c23f0833aa","src/zlib/contrib/masmx64/gvmat64.asm":"390c=
1e6d63cb615b5ba042842738953f9cdc688b2fe35aaca981fd3fae213f3f","src/zlib/con=
trib/masmx64/inffas8664.c":"f6c585e43e6e524107566b1f10104949d0ef902159ac820=
3e1d98e50d4bedd62","src/zlib/contrib/masmx64/inffasx64.asm":"8448d0041fe6e8=
f4188fe5916181a1b274c6d35d75cfb28da60cf4f1edde44ec","src/zlib/contrib/masmx=
64/readme.txt":"9bb66b5028100855683853f12da0be479c7bccf74365fdbf37da2542edf=
f9927","src/zlib/contrib/masmx86/bld_ml32.bat":"b0b05b62715d4a81a7db5b7ca4a=
372d109ec95634c9d3bef9e0041ff52de22fc","src/zlib/contrib/masmx86/inffas32.a=
sm":"78d2cc88f8ed0e32ef960efc987c257bc1688afe7d031a8ba18761e95a6a7c3f","src=
/zlib/contrib/masmx86/match686.asm":"9e9bea3b5517b089da7d39caded07982746a33=
f94f0907ca7e8afefed7be36b6","src/zlib/contrib/masmx86/readme.txt":"1f29a04e=
0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc19a05fb8f9689778","src/zlib/contrib=
/minizip/Makefile":"087034de3dc0223b29e64bb3a4fc3eda7b948e93d2a9ff154aecf9f=
ed2a1eb5b","src/zlib/contrib/minizip/Makefile.am":"2313a3480a2c3745fa7ce216=
829cd0367058907d3a0902e5832c66c84a2fdfc6","src/zlib/contrib/minizip/MiniZip=
64_Changes.txt":"302c62b328647f5472fb7755249a83459be7f8ffb1fae07e8ba318fce8=
f4126c","src/zlib/contrib/minizip/MiniZip64_info.txt":"122719c32ef1763a5f6b=
a9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac3","src/zlib/contrib/minizip/con=
figure.ac":"35330dc0c6188127afd339829d91b19739d23bf3b7301bfb04f775a6fcbbdad=
7","src/zlib/contrib/minizip/crypt.h":"8e872b60255b8447da99885c7159c2e1f1bb=
8143523bdbe71784e60f98bfd67b","src/zlib/contrib/minizip/ioapi.c":"66b39c270=
42f6ad12cc12efb0c82cdf100c6640b5fa959b8b866e252966113a9","src/zlib/contrib/=
minizip/ioapi.h":"8655408534b78dc0889a45f9359fc6d2d5c8e8d8443b81ede596f954c=
720ef48","src/zlib/contrib/minizip/iowin32.c":"2c05bc374d3d847c6a9f29eac9d6=
74abba7659d1e91e34e172248fcb5c274d51","src/zlib/contrib/minizip/iowin32.h":=
"586f22b9c3c64da253ce2b518e0fad61f19a7b47b289fc704cc9708242294c49","src/zli=
b/contrib/minizip/make_vms.com":"65736d9c4888f2373d3db0a13864d150c5040453f5=
bc2a5c8784379a7ea67590","src/zlib/contrib/minizip/miniunz.c":"ced49f20c6253=
6a8ffb270b35cfa4994a1dcdce45f8cf059b941c94ca0022666","src/zlib/contrib/mini=
zip/miniunzip.1":"66d8684392167091ef0fe01598d6a0daa26e7e448e2df6c3cb2574877=
35b83f7","src/zlib/contrib/minizip/minizip.1":"5404596e8e5587a52f563906119f=
32ceee30a6d97a966afa5c7afbe4d373e210","src/zlib/contrib/minizip/minizip.c":=
"fdfcf83979ef2324c1455d369e8add8678c804939d412ce53f8b024578ceabad","src/zli=
b/contrib/minizip/minizip.pc.in":"8b6670b42d8e5e519e1cc89db093efc07ba23cb1d=
dfedd3c93ff2df08c3ce8ac","src/zlib/contrib/minizip/mztools.c":"cd887c4af6d2=
0823bd15f24008b10acf01969b4165d7848656bde843a92428d7","src/zlib/contrib/min=
izip/mztools.h":"6f82c52279e8f79165f4446be652e5741a49992ac58632470335aa34c5=
64072a","src/zlib/contrib/minizip/unzip.c":"497adf676b1cae2a7afa834e4aba863=
83f7b697f5fdd03a8179ea9024a431cf9","src/zlib/contrib/minizip/unzip.h":"d8dc=
58fc0121b6a4b98f3028205bb253f956b1ddf791e9ced3cf44892502a01f","src/zlib/con=
trib/minizip/zip.c":"00f403cb7810578b4b2687dd55fb132c850c3630fba2f3704a8ab8=
96fcc8209a","src/zlib/contrib/minizip/zip.h":"96163fc140e4bf08752e014d20a1e=
ac3f5adcdc408366f6d79c1895f2599cf08","src/zlib/contrib/pascal/example.pas":=
"d842d456ecb6ff80e34cee2da31deb2072cc69ca837497bea8b8bee203403474","src/zli=
b/contrib/pascal/readme.txt":"02f997c37991ddae0cb986039f7b4f6fc816b3fd0ffd3=
32cad371d04c12cf1b9","src/zlib/contrib/pascal/zlibd32.mak":"850e91b6c9ea05d=
e61a411cbda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/pascal=
/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f1603d08aba5bfabc50827d3f15e661268a=
51cf","src/zlib/contrib/puff/Makefile":"d9d738030464aaae354196c14fd928adf59=
1832fce7d71ac1977c1d8d4923a4b","src/zlib/contrib/puff/README":"aceca4bc1bce=
7d9445b8bc9b6640c672d95708185f6070d3a3baae7a9d102caf","src/zlib/contrib/puf=
f/puff.c":"6d0eef92e115a42e570b79d8b07a04af5ccbd6b3f3fbca9cbc61c49db9c9df43=
","src/zlib/contrib/puff/puff.h":"969b7be2a930db0cdcb19b0e5b29ae6741f5a8f66=
3b6dba6d647e12ec60cfa8e","src/zlib/contrib/puff/pufftest.c":"8ee0da78a1221a=
3c2036e22eed06c2faa27a671a46565a60e10111d4ee9c30ee","src/zlib/contrib/puff/=
zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8eddd10223b23554299455c6c9be71b653a=
3","src/zlib/contrib/testzlib/testzlib.c":"c6c37b35c6ecc9986a9041f86d879cc3=
7a9e4d8315af9d725071eb3b2cade0c5","src/zlib/contrib/testzlib/testzlib.txt":=
"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad58dab3ca78ef55b7d0dc577","src/zli=
b/contrib/untgz/Makefile":"8f5ab1564813e091cea8f1bb63da32fd80ac763d029277b0=
cabf50f60aceefe1","src/zlib/contrib/untgz/Makefile.msc":"d0f537de11d9e0e36e=
2a98b3971c537265f4b533b4c48797094365ad9ae8388b","src/zlib/contrib/untgz/unt=
gz.c":"9a12d774301d252dcd38bba07ac369319da4c04c4fef8a50fcbf40aebf29c2a1","s=
rc/zlib/contrib/vstudio/readme.txt":"2a9ca40b68274f4d37649dfab9e5e867a00088=
3592b4ab8fdaec8425a63052c3","src/zlib/contrib/vstudio/vc10/miniunz.vcxproj"=
:"dd607d43c64581172c20c22112821924dfe862f56b2e5eb8780bdd0714d9527b","src/zl=
ib/contrib/vstudio/vc10/miniunz.vcxproj.filters":"c3db9f97952683e688ad83c13=
bb94c816ac3e6b5f277fdea545b0650c125aa6d","src/zlib/contrib/vstudio/vc10/min=
izip.vcxproj":"af73f2cf8ae51e65e85342faeb40849a2310c97bc77def42b38d7070460a=
6cf0","src/zlib/contrib/vstudio/vc10/minizip.vcxproj.filters":"83db58d87f5d=
7ca84b6087aa1f62b15cbc296194c8cf76e47a271f9077b4f3bd","src/zlib/contrib/vst=
udio/vc10/testzlib.vcxproj":"1525ed0893db56db44ec68675c8da3c229dc7867166dfc=
0428816783d16ad43b","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj.filters=
":"d7e04ffa467d417dfa3c0f1c64234cadc84882101bbae483f0a0f5d3d6b566a7","src/z=
lib/contrib/vstudio/vc10/testzlibdll.vcxproj":"3f317d8964f17901c3e68bff5dea=
ec10b6ccc50a572235999e8097292692984c","src/zlib/contrib/vstudio/vc10/testzl=
ibdll.vcxproj.filters":"682a485f0184aabba94e12e1b284499195f37c176d43ecee048=
4f31e4d636f6f","src/zlib/contrib/vstudio/vc10/zlib.rc":"e8b581eb16930e0213d=
37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/vc=
10/zlibstat.vcxproj":"2a38222d6c034d7e0b843c3f0540dc6c53dd48f942ae29f31620c=
a0327248c8e","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj.filters":"d9a2=
c381e51e4d6f027f3517db7db81656e43cec02ed9abf267a0fde6f360180","src/zlib/con=
trib/vstudio/vc10/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4af=
fda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc10/zlibvc.sln":"e659860f7=
05f31b87ea9139a3cb4ebe1561e120bce495383a54614fc82b49990","src/zlib/contrib/=
vstudio/vc10/zlibvc.vcxproj":"3108badf710e2f4a64eab4e7deae6642fb68cc0d94018=
e537149f1761e215133","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj.filters"=
:"58404ba7703c68025bec64b8a17ff1fc7f3a35d15d17ae3bcc4fa753f1348425","src/zl=
ib/contrib/vstudio/vc11/miniunz.vcxproj":"746e4c11fb8af4bcd6a9d68ba81ed1dc3=
66a5de3bed56b291ee969ad733a7bb0","src/zlib/contrib/vstudio/vc11/minizip.vcx=
proj":"340617cae9cf4fcb003308021d3782ec3639e60d62d79a3aafc0a50bb55b061e","s=
rc/zlib/contrib/vstudio/vc11/testzlib.vcxproj":"589eec6ef6d818564ead938a629=
fda50abb6cbf8054b9f66ea780765c1a1b3db","src/zlib/contrib/vstudio/vc11/testz=
libdll.vcxproj":"583bdef522b0176829f0d8139ea2a88b9cbc14379d1334f3a863989ed3=
df9b67","src/zlib/contrib/vstudio/vc11/zlib.rc":"e8b581eb16930e0213d37143a5=
f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/vc11/zlib=
stat.vcxproj":"51aa752698d96df065a9ece02e293492f681b59a8077f036a5a60367dc62=
1e87","src/zlib/contrib/vstudio/vc11/zlibvc.def":"0124fea28bfee49c8a19dad0e=
d5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc11/zli=
bvc.sln":"27389b515997defd080519f95aff87e89fcbe8b26d73c5ebb73c544cfef4d60e"=
,"src/zlib/contrib/vstudio/vc11/zlibvc.vcxproj":"c3dd05e56159aba411475b8365=
6275872524cb3c2fd24d690397d8b634e7e0ed","src/zlib/contrib/vstudio/vc12/mini=
unz.vcxproj":"1494af54570f6e93852932956d49a8c25e57b5abc1ac979945605ca9143df=
9f8","src/zlib/contrib/vstudio/vc12/minizip.vcxproj":"9bf128ed6760ca5f01900=
6f178b1c65f4c7ff122dba8d297b64b0eb72feeb120","src/zlib/contrib/vstudio/vc12=
/testzlib.vcxproj":"367a06caa399bd09f6b9cb60706820943dd6a6cf05794275baaf421=
da9c2a0b7","src/zlib/contrib/vstudio/vc12/testzlibdll.vcxproj":"93416510256=
935d79625dc9fd349cfce6968c062d42a138bec404a26b2f92f5e","src/zlib/contrib/vs=
tudio/vc12/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45b9ee0b=
9b16257f39","src/zlib/contrib/vstudio/vc12/zlibstat.vcxproj":"744ff6ac0d4e2=
dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6a73eb1c68d","src/zlib/contrib/vstu=
dio/vc12/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e=
64ad15f44d7","src/zlib/contrib/vstudio/vc12/zlibvc.sln":"162e0faa80a56d89ee=
a71a0b89377708eec2faa0dc72091cc0abb07fbdea49a0","src/zlib/contrib/vstudio/v=
c12/zlibvc.vcxproj":"754671c59d8996a846241af76082cc8be1aa5fc079eff530d91a9a=
b15a0bee5b","src/zlib/contrib/vstudio/vc14/miniunz.vcxproj":"0312511d4a30ce=
a979c4e36edf994a537ed8a9d924f6b5c536cbcd094773c11f","src/zlib/contrib/vstud=
io/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2db900627c366f9bb93a351381995d9c6=
9a50c0126f64233","src/zlib/contrib/vstudio/vc14/testzlib.vcxproj":"c3a93696=
70af4ebea13d036b452be7418591fbb4c03a675699facac5d8dff5d0","src/zlib/contrib=
/vstudio/vc14/testzlibdll.vcxproj":"69f544898b4275cd3d8e19b8f1f8cb39c1cb98a=
30cdb033242e4b94c57bfa150","src/zlib/contrib/vstudio/vc14/zlib.rc":"92d5d3a=
4938a6350395934153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/contri=
b/vstudio/vc14/zlibstat.vcxproj":"9c7c096b47e7875412c98525efcd16db62e094215=
f0011b9cd739a33ab35d48c","src/zlib/contrib/vstudio/vc14/zlibvc.def":"0124fe=
a28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contr=
ib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca6336cecd8c0e4b65e515fc46ae84c7b610=
08ac9864162f777286","src/zlib/contrib/vstudio/vc14/zlibvc.vcxproj":"71fb6ef=
3b079bfdf4182af17e74c3361ead757467edfc591d9cbe303ccc47b52","src/zlib/contri=
b/vstudio/vc9/miniunz.vcproj":"b2b53bd9e704bfbe769b863acdc2a3368692ca149c4b=
4ed2a0761b0cd16c6726","src/zlib/contrib/vstudio/vc9/minizip.vcproj":"80a701=
fb41a61871ce1d25f6b03e571edb6c3abf0aa45375554b6fac52115eb6","src/zlib/contr=
ib/vstudio/vc9/testzlib.vcproj":"05fc5a87682b17690d199f424f57f6ad7767b8dabb=
29a1039bfcb88bca1b302f","src/zlib/contrib/vstudio/vc9/testzlibdll.vcproj":"=
25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b03b7055ef5ef440b575a43d","src/zlib=
/contrib/vstudio/vc9/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b2=
3981a29484e17093c494","src/zlib/contrib/vstudio/vc9/zlibstat.vcproj":"e8653=
eea37f3bef097eec2caa55e1f698c3c74c959689bc4e97568e88d2bbc60","src/zlib/cont=
rib/vstudio/vc9/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affd=
a5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc9/zlibvc.sln":"26e58d4b2cfc=
d941c367fb2a18537b3b9f002f2ac1278b700ea1129c50501452","src/zlib/contrib/vst=
udio/vc9/zlibvc.vcproj":"86aa6e33db104c0a0ed4a9f21f0db8572cc7755170217aef18=
219fdd74b75e9d","src/zlib/crc32.c":"a04af273e83ecc351bf3794974ab2098d8d960d=
f4044b7b44734c41443ee26d0","src/zlib/crc32.h":"407af59d0abfea84a6507c603eb2=
9809411797f98249614fe76a661def783ce1","src/zlib/deflate.c":"11fd6b0328b65c4=
ad4b5c204d892a97a9083628a7e77dc47836c8e0c799f8da0","src/zlib/deflate.h":"0c=
a7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199be51a4dda38a11b44919f6","src/zlib/d=
oc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95aabb08e28c30c52bae3e=
8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f0475a5c984657bf26277f73df9456c9b97f=
175084f0c1748f1eb1f0b9b10b9","src/zlib/doc/rfc1951.txt":"5ebf4b5b7fe1c3a0c0=
ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zlib/doc/rfc1952.txt":=
"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4dee21bd7e03ec9af67","src/zli=
b/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330e5c262266b1292154b0d3014f=
731cc73f47","src/zlib/examples/README.examples":"402d72eb69c2e03a25034f4b3c=
02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","src/zlib/examples/enough.c":"704e2=
73f65b62c5d2eb06d5bb10c4ccffba56544aa477f0e3957e2296c501b78","src/zlib/exam=
ples/fitblk.c":"950769163c41aff897ee41746a8685d9aa41073b1307f42da19dabe9d3f=
c8b85","src/zlib/examples/gun.c":"d60ca6eb0a3e62ee7fb4a1ab69e8d1525ff06b06c=
e46889cbdfc13fb8f7534c2","src/zlib/examples/gzappend.c":"4182d38bf97ffbdf11=
10df7f65c0e8fab0b28b1ea36ebba8621c14e8e76f1caa","src/zlib/examples/gzjoin.c=
":"90b9d6c39a5fc91cf1cc9b96b025a508a8015dc502cd9374c754b44078593f57","src/z=
lib/examples/gzlog.c":"433d34b71b4e769ece1cceb8bd7d902d2c0a24ccd7550ab1856a=
5ba87f84f835","src/zlib/examples/gzlog.h":"309556e2d7d39250924946b78e2cce0a=
c927857d6e1a02cab64e438f533c20c3","src/zlib/examples/zlib_how.html":"80fb64=
7be8450bd7a07d8495244e1f061dfbdbdb53172ca24e7ffff8ace9c72f","src/zlib/examp=
les/zpipe.c":"68140a82582ede938159630bca0fb13a93b4bf1cb2e85b08943c26242cf8f=
3a6","src/zlib/examples/zran.c":"840ebeb058cd0ca9e92dcb1db665932462a4695fc6=
49b34e865b8d1ad7c5bf77","src/zlib/gzclose.c":"94446cf8cde67c30e64d0a335b0c9=
41fd3fbad2e77f30180d12e61f9c2a5a6b8","src/zlib/gzguts.h":"1ef4741cf10441fee=
ca5c8dde2b6c754f0cbd96fcae697d54a604757289a5e9b","src/zlib/gzlib.c":"5daf11=
e44149e0aba2956d35f73f04f35dca99c3dfa43f5ad43ec20b336e4a1b","src/zlib/gzrea=
d.c":"6f928512cb1792cfeab31a51ff0b211814d2e455bc75290eb31079dc1e5ad2ec","sr=
c/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319b8408c333491a4cd495da55d0b156bc73d=
9ddb4df4","src/zlib/infback.c":"abe44873b5af2ea68ea1d281d915b2800f1832f846d=
2c05442a4711adbe6f269","src/zlib/inffast.c":"4d496ab2a3d29df5fadc3dbff6067e=
039806aaceae6cfcd09ea77d46c2b848fd","src/zlib/inffast.h":"7d8c1c873ce9bc346=
ad6005bb9d75cce5c6352aaf7395385be216a9452a34908","src/zlib/inffixed.h":"237=
ba710f090e432b62ebf963bee8b302867e9691406b2d3f8ee89ee7bfef9b0","src/zlib/in=
flate.c":"8b6c599c3563c14c447c47db0d7dc9a16e8c246a078ec95a169ddcebaaebd811"=
,"src/zlib/inflate.h":"8ec9ac297790276f7e46a961d4c6f9f944fb1dec92401339ec26=
66973cc5983c","src/zlib/inftrees.c":"1960ca67384376f65b6ce8c08fdb501f8eb339=
23e11ef5f61a855708c6cb0a8a","src/zlib/inftrees.h":"c510b36402784b1f898be3b0=
49b923469aa92701de2d9195aed19f6b65c0dce2","src/zlib/make_vms.com":"3064eb15=
3a7684115f1494364f80759bc5a2c227799fdf08df7b9e6e50884720","src/zlib/msdos/M=
akefile.bor":"292ab363f7ffbc4ae84d37cd9bdffd2dac1003bee52d223a8489844870f20=
702","src/zlib/msdos/Makefile.dj2":"9208450c2ae6dcbfcc25560b5b9ca763f461e72=
46e37b0552474edf8fa898906","src/zlib/msdos/Makefile.emx":"c749d6ec7f88e8e63=
9d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d3d64","src/zlib/msdos/Makefile.m=
sc":"0e021a6f42212415b060e4ad468eb415d0a8c1f343137fb9dff2cb8f9ead3027","src=
/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5a0520d0fbe4adee772bc07fe816002b0=
7ccb43db3daa76a","src/zlib/nintendods/Makefile":"ea5823efe6830132294eddf2f5=
6dbd7db8712244c210bb4968c431b1a91bd066","src/zlib/nintendods/README":"e3624=
26c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421716dc629a71aef95","src/zlib/old/=
Makefile.emx":"d811f032272aae50123a889297af3a02fbd60d1e42bbef11466462f627ff=
7b5b","src/zlib/old/Makefile.riscos":"d1a488b160fbfd53272b68a913283a4be08ba=
9d490796b196dddb2ba535b41e0","src/zlib/old/README":"551a0f4d91fe0f827a31cbd=
fbb4a71d1f3dc4d06564d80a3f526b749dd104d11","src/zlib/old/descrip.mms":"8ff0=
8c35c056df9c986f23c09cf8936db63ccf12c3c42f7d18a48b36f060cff7","src/zlib/old=
/os2/Makefile.os2":"6ad247c00f00ff42fd2d62555e86251cef06e4079378241b5f320c2=
27507d51d","src/zlib/old/os2/zlib.def":"ea9c61876d2e20b67ef2d9495991a32798e=
b40d13ede95859a2f4f03b65b9b61","src/zlib/old/visual-basic.txt":"1727650acbd=
e9a9e6aec9438896377e46a12699cca5d46c5399cef524dedc614","src/zlib/os400/READ=
ME400":"6f95a1beb0fbf943a3312eaa3dd2c279f1cef93062bebbff63dd37ac9e2aa8d6","=
src/zlib/os400/bndsrc":"cfe00b1528d5c27813cd6b1ad7aa34b493fd63d615623fb21fd=
1a7bf99d2255e","src/zlib/os400/make.sh":"143394d1e3876c61c29078c0e47310e726=
e1f5bd42739fe92df9ece65711655f","src/zlib/os400/zlib.inc":"c501c522185ba1f0=
506caf90d72f1088b34b2addc169471e949e443ab65e8a75","src/zlib/qnx/package.qpg=
":"90b5c8364d9dc5ef67405b352c19710ebad2905f3f20b9e56ded74661f96743b","src/z=
lib/test/example.c":"520799662a8286725540d6d5a356efe6f595618e5fe2e591972491=
d719bd99aa","src/zlib/test/infcover.c":"f654f3fcc74b33bd95cda63d13fe0ce589b=
cfe965544e0c17ee597d75efbd090","src/zlib/test/minigzip.c":"91089b21e692797b=
b6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51b811193","src/zlib/treebuild.xml":=
"d816c764c8ec2d5b2ebfa7f053f747097926c13fce7fa8628c5d14c991411421","src/zli=
b/trees.c":"f2a5f949ea70dde7c23a54c793aeed630a03df4bb72417cd3aa008000c44699=
b","src/zlib/trees.h":"bb0a9d3ca88ee00c81adb7c636e73b97085f6ef1b52d6d58edbe=
2b6dc3adeb4d","src/zlib/uncompr.c":"31922aa982ee12fd28d1ce5fe6a94a3f07c2a94=
1c821b566a881ca21845cdfaf","src/zlib/watcom/watcom_f.mak":"7e039b912f9cffaa=
40835281430bb284fa9042b0a0d12f6b34700a06bca6576e","src/zlib/watcom/watcom_l=
.mak":"d11b4064604a034725860e63e3f6d347056372e4b1675b183e20a93533b20cc9","s=
rc/zlib/win32/DLL_FAQ.txt":"9e00778319381e6275691dd3a89410c99065b8c0c5db964=
73abe8c859cbdefd8","src/zlib/win32/Makefile.bor":"e878fed2313417db085fea621=
c110889f6a32233b5b6db46e3c4e824c1d0ed6b","src/zlib/win32/Makefile.gcc":"ea8=
feddce7b9707253b9bf86623cf7ebe5294d7aea2b3b0b1b1c1b8cfd73009d","src/zlib/wi=
n32/Makefile.msc":"7c495d63c5afea1d77d162a41b73bab89cee952c12e4647e9684a7ac=
79bfc3f5","src/zlib/win32/README-WIN32.txt":"b71f1f4e4760812c3a11b2bae6f40d=
1066741a90e6646010a32ce50a0e348cde","src/zlib/win32/VisualC.txt":"9ec0babd4=
6eaa012371dee2d3a8a55d9c7130f7895512c3371c737e4a7f6a997","src/zlib/win32/zl=
ib.def":"24fa6dd00f3f4c0d14507a03ddbfa42707a04e3901bb9ff6f90096037a75185a",=
"src/zlib/win32/zlib1.rc":"8fc5f2b5abee40ad66e6d6cfc9f926c2f446e13a7c9ee7df=
8bf58a266d8cade5","src/zlib/zconf.h":"9c0087f31cd45fe4bfa0ca79b51df2c69d67c=
44f2fbb2223d7cf9ab8d971c360","src/zlib/zconf.h.cmakein":"d740b750e9c98e6a4b=
4529cc2a857a3fa8001514b1ce91e0e1d9d293652bf388","src/zlib/zconf.h.in":"9c00=
87f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/zli=
b.3":"5abef003e545566e5599e5ab2e7528e978be59d54546b19d763d062f7a69bac7","sr=
c/zlib/zlib.3.pdf":"7f0f633641d782e360eff9fe831716c5767faf1000e38382a8a8c65=
b0b67f374","src/zlib/zlib.h":"4ddc82b4af931ab55f44d977bde81bfbc4151b5dcdccc=
03142831a301b5ec3c8","src/zlib/zlib.map":"7eb1070ba6bf12e6895e5da06b84a92af=
683827587afaa72bdd45e80b9d8e4e9","src/zlib/zlib.pc.cmakein":"2f1d0b18ce37c2=
af415a469857f02aee2c41a58877aff21d29e9c6db32b55cb7","src/zlib/zlib.pc.in":"=
04c01cc2e1a0ed123518b5855f585c93a24526dd88982c414111ea1fc9f07997","src/zlib=
/zlib2ansi":"d316e3e79054f5f9fe921d35f4bbf4bf0a37b859d29d2b34ae4d7d92afc3e5=
5c","src/zlib/zutil.c":"f7fdc9ef326a2683eb33c794face54e83c751ec17f3d1ba5818=
47a62af36ddcd","src/zlib/zutil.h":"9a63f6690fac1620aa3cecee5752af618806da43=
8a256b4a047fbcd289cac159"},"package":"de5435b8549c16d423ed0c03dbaafe57cf6c3=
344744f1242520d59c9d8ecec66"}
+-{"files":{"Cargo.toml":"5fc1259b26541f617473d6b741816705c91322db9740e347a=
8686e3c0b30ab2e","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379d464=
acb3408d4c599d3dc5fe4fa1b4c84f","README-zng.md":"2f9f34e6b388a401b8d8318b64=
997a7521e4198c5c314f8cea11433623628515","README.md":"75701bfcd7158e924f51ec=
e8debb6d4425ccd6ad5d2806004b5f174423f4b2af","build.rs":"b383e60f71c9b40ecc8=
07ac58473f9b85d7036e8359796634cba2701224493a3","build_zng.rs":"b7768e19f0bf=
876f29eabb6ad6511f530e61d8aa92bfbe89a7cf3818e4824ce7","src/lib.rs":"7c4a339=
4e17e6250c1f4f2067efecc56b1850827596432ad0ce75e5eea800446","src/smoke.c":"1=
0607c81b73811bfcb9718767312bf97ba2ccf7048ea2f18a2085aa06ad7f91b","src/zlib-=
ng/CMakeLists.txt":"5840d2c44e335af0f58f8a2545da60be403946b1181641b35ea7425=
b2e0f44db","src/zlib-ng/FAQ.zlib":"c524f4f86d336b3de71dd6977afddffa9c02fda5=
c26db4dfefae44959e7614a2","src/zlib-ng/INDEX.md":"989545e90d8e9ac149034f762=
ce78ed8976ebf9324326228dea37ca190154609","src/zlib-ng/LICENSE.md":"d3c80be0=
55d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436","src/zlib-ng/Make=
file.in":"1f56adbf5fac7fa36c6e4c11b5f061acb971984c941154cbf0344e2b68b99e7d"=
,"src/zlib-ng/PORTING.md":"4105267b5e00f8d608f31dcf4fe2cfede15cc94568211691=
419e6cba3d8e539e","src/zlib-ng/README.md":"ba04244ad8eea94d834d25aa75b40e7f=
849844a33c68ed180c2a631378e1f211","src/zlib-ng/adler32.c":"82ffa1b4fc4b198b=
a8004135f79b8819d9f2b28e851c30c0ab41e6d32dfbf70d","src/zlib-ng/adler32_p.h"=
:"f56915c59a345baf4558374447385a317e29365a4db2fbb38af4de3e1a1a0201","src/zl=
ib-ng/arch/arm/Makefile.in":"95464884ba75a7b12c9ceda5845d8d68d5a7d7dac8a8dc=
24b27beb2192e5b97b","src/zlib-ng/arch/arm/adler32_neon.c":"3990b8d5570b12c2=
162218fe0e9bc723a03f1c89b5ed3ba70a74a98976260ee7","src/zlib-ng/arch/arm/arm=
.h":"855adbb02d7b9a5714a17d9dcff493610e7cd2b9a1f4e58e1c99626ab536e868","src=
/zlib-ng/arch/arm/armfeature.c":"4800228414695b632b9ceca14409e782d6fc3b357b=
a7ab00858925fc66b5532e","src/zlib-ng/arch/arm/chunkset_neon.c":"95fc7917d1d=
30094e15a35c56d1e9c189c5ca3758553a3467d4da793eaed656f","src/zlib-ng/arch/ar=
m/crc32_acle.c":"e2be53267a2a59fc79c4b3bab00e8b25bf64a8fc8bf2c6684e5b1b1fd1=
480f9d","src/zlib-ng/arch/arm/ctzl.h":"feb70d55e66025fff806e30e48002b35cfff=
79533d352585cfa5f118edbc90b1","src/zlib-ng/arch/arm/insert_string_acle.c":"=
d1b1dae5aeada70f2b03c2cbf3112ce55a92401c2d87709081b04dcf5992e1ad","src/zlib=
-ng/arch/arm/slide_neon.c":"19d8cf5c742ac6b82164c7a183538ad1129f9f17e9b8bce=
8b40daac3820fb6c4","src/zlib-ng/arch/generic/Makefile.in":"f41a34839986eac8=
dd52cf91fada0efff4171c059ab5d7db6347c91bd6d9db09","src/zlib-ng/arch/power/M=
akefile.in":"69644d1a0ff8e7f38005c0a55cdbaf3f0d87f42abf8fc4f4136271c4fedfb8=
46","src/zlib-ng/arch/power/adler32_power8.c":"79b75e98ad3a62facbbdd8c0b178=
d3f993b57f6e34d320bf47eca33aa8c330a1","src/zlib-ng/arch/power/power.c":"064=
7afb3b3b7ce2a19b4815ec8fdeee0b37c759413e5ef0a668a2dba22d94803","src/zlib-ng=
/arch/power/power.h":"f3f15f94fed98a2f7dd5d4568c5172e597228be4141d689506270=
3c3f70024da","src/zlib-ng/arch/power/slide_hash_power8.c":"932ea533d25e2f54=
78afe0c47830e7ef24276cad0d75fd91f2d8c799bd4b5d36","src/zlib-ng/arch/s390/Ma=
kefile.in":"eef6c3169723f089b0b5f852423ec55bf0364caeddd7cda991f2e76bc168210=
7","src/zlib-ng/arch/s390/README.md":"730b9a0230609988fbd1bdd52a7abdaa1fa5c=
65253ac78163dd4a5eccb966abc","src/zlib-ng/arch/s390/dfltcc_common.c":"3d460=
448ad4c5b687da6b7c0ad8498ece92b771dc7ddd0189e096acca5a1cad4","src/zlib-ng/a=
rch/s390/dfltcc_common.h":"de8902d3863c8a7a3f6ea27dec2ee5a4f17ef5d8646e48a5=
86d0b29fe94c9a0b","src/zlib-ng/arch/s390/dfltcc_deflate.c":"d6941d3c5ada225=
ec39b98b35bce1d203aa1f2d994a47c8487d377d9ef2f6efc","src/zlib-ng/arch/s390/d=
fltcc_deflate.h":"5c90a812e2a2f2b842dba027e5640791e52206e74b8423cb78e0b8ea1=
2ed29ad","src/zlib-ng/arch/s390/dfltcc_detail.h":"fe66cd700a1d017eba86c2c6e=
95f53e9a4d1cb491de9cb3963b2a2907098baa9","src/zlib-ng/arch/s390/dfltcc_infl=
ate.c":"83643b5605cdc2d1d7780e1bdeb007f9dc6a1cca633157abbfb5d3232f2b8816","=
src/zlib-ng/arch/s390/dfltcc_inflate.h":"d7a4a5ae79abd1a5456521926b918becfe=
86c253a4fc23723fbc09f7c3303128","src/zlib-ng/arch/s390/self-hosted-builder/=
actions-runner.Dockerfile":"999c962c49508ebf61414e6f9ffea059926ac500d4c6d70=
7ea1f9e77402f7374","src/zlib-ng/arch/s390/self-hosted-builder/actions-runne=
r.service":"33a359eb58d76152f916b40ee1357f7edfda75e8dfb55a5b12ac83bcd6ed705=
5","src/zlib-ng/arch/s390/self-hosted-builder/fs/usr/bin/actions-runner":"f=
647e18728ea15fe927ac9f8cba83a5b343654a0e91b5ebe653bae7af7375110","src/zlib-=
ng/arch/s390/self-hosted-builder/fs/usr/bin/entrypoint":"add4ebdc4f06ed15bb=
1de12a8c9ceb370a60baebb0932a1026a75433940ad3df","src/zlib-ng/arch/s390/self=
-hosted-builder/qemu-user-static.service":"54551049f6181da88700a2a944a72b0a=
f3b8abde876fa28e1348deb5eb96c91b","src/zlib-ng/arch/x86/INDEX.md":"c12f9bf0=
d66743a6472fb756bf46def8eea1dd235be7fca994dcb22f693a3524","src/zlib-ng/arch=
/x86/Makefile.in":"9f6fe7567a99e81aaa3bef8ccfa1ad40f524efc285cf8dfe0f497a15=
30f8016c","src/zlib-ng/arch/x86/adler32_avx.c":"99056732c7bd5d53dc108f28281=
1a40bf21570926781af5dc7b17cb9218963de","src/zlib-ng/arch/x86/adler32_ssse3.=
c":"883a5520b4481225d097c90c5359106a3c8eb7b921499c94276e999b7c39adc5","src/=
zlib-ng/arch/x86/chunkset_avx.c":"13c83149146c408ffdc9358bcb5355259f6196e6c=
c6fe025b7ea3647e313cd0a","src/zlib-ng/arch/x86/chunkset_sse.c":"f14d0557634=
b53af8cd6e2a1ce9d57df50244a72e85ff3b100b5ca287d1cfa8a","src/zlib-ng/arch/x8=
6/compare258_avx.c":"8b2838d168de4608327f25fe52d53763a82413ee911d87947d3fcd=
72c7f9bf26","src/zlib-ng/arch/x86/compare258_sse.c":"b5049722ffd4a43a96868e=
eba5e000271cfc5fcbf3c2657026ead15b1df28a10","src/zlib-ng/arch/x86/crc_foldi=
ng.c":"defb5a7067562612651f693c910db53cf228b7cd7fef11991504767a7d84f224","s=
rc/zlib-ng/arch/x86/crc_folding.h":"939212546611917e9e066e8ed30cdda95680ec1=
f5fe0890cc4865b4e6d7fc215","src/zlib-ng/arch/x86/insert_string_sse.c":"9e84=
a75b6a565422eb105261b6729d2a02b89133bd14372c949d5381b5deed3e","src/zlib-ng/=
arch/x86/slide_avx.c":"5e448e439ac24e7cb10eee176ca37f2c63f73c135c0a2af040e2=
32bad490997d","src/zlib-ng/arch/x86/slide_sse.c":"1946cabb634c905fddef0a22b=
2fad19dfd99110169567c3beceef71145b2e316","src/zlib-ng/arch/x86/x86.c":"1af5=
6e27b2e951e1ad1344e62c2f7a8c49a776fcdd1cb0f4ea9d6152118a479e","src/zlib-ng/=
arch/x86/x86.h":"4d2d20ea0087089141e250e77bb3d419954b9092810028b151581b9115=
a5fe8c","src/zlib-ng/chunkset.c":"cbf26582fff56726cc28bee05ff0a1680c50308b8=
dd9bb8cfb57d7f0a587d0bd","src/zlib-ng/chunkset_tpl.h":"eaaf0804f6162ab26b2b=
6de263a478ffb111559e653372e96e400acba9c63563","src/zlib-ng/cmake/detect-arc=
h.c":"e0da3d16195eefb54bef77163db737a66453f25ae16648aa8f6beeac70787662","sr=
c/zlib-ng/cmake/detect-arch.cmake":"27fa8da497b39ac70d881e2d345749611dae4c3=
0f7b7a9c9e32f2c042672189a","src/zlib-ng/cmake/detect-coverage.cmake":"e4e37=
2991ba80a16ad47df2716708a56013cc628aa7ed01573a2360c60610125","src/zlib-ng/c=
make/detect-install-dirs.cmake":"87031a40428a104f5cf38ecdb8a5028d8c679cfa77=
2a58adde8380c809b34eff","src/zlib-ng/cmake/detect-sanitizer.cmake":"a8f7a45=
15278532b251b567d82ed576fe1ca7e698992ed92d1beb8e8dd22237f","src/zlib-ng/cma=
ke/run-and-compare.cmake":"13d85c12c9d6c7b1b148bd0c5a5b4faa6a4b56f3823bf03c=
4f8d914c9c5949d8","src/zlib-ng/cmake/run-and-redirect.cmake":"7f08d18c09aa5=
8113882ec760735a62a1723a5bfcae9f73bd3713a4dbaeab898","src/zlib-ng/cmake/tes=
t-compress.cmake":"0d2d1595859ccfb6795bb98700a4f7c1652b025cc344a12915246010=
87957888","src/zlib-ng/cmake/test-tools.cmake":"63aabfffd53970b8e145870b2a1=
c03bffa3595f7df04bd86f94e97b6f2a387e7","src/zlib-ng/cmake/toolchain-aarch64=
.cmake":"46be0bf580a49a528c72005484655afad1de3705b39a66a7b0c213b0fa81cee6",=
"src/zlib-ng/cmake/toolchain-arm.cmake":"05e38076fd6ffb9785ff9844ccecd26436=
c9dc4c25b7777b62e5f52e788c3882","src/zlib-ng/cmake/toolchain-armhf.cmake":"=
1a2029163a57415eec9a5dd5f45d3254d349e97b1beb5d16876b741717673341","src/zlib=
-ng/cmake/toolchain-mingw-i686.cmake":"df9000354b820d3713d1469edc9f94cd0953=
89b0cca83965730b8e64857fdf3f","src/zlib-ng/cmake/toolchain-mingw-x86_64.cma=
ke":"ee316e6e3202919da5d497f9e246466fd715fcf079cb5b4afc4774089d1fefad","src=
/zlib-ng/cmake/toolchain-powerpc.cmake":"9bd6fc58ce5b70603657f2c195c4a5cf52=
fae96ad63ac787978831c5858f762c","src/zlib-ng/cmake/toolchain-powerpc64.cmak=
e":"917fc5eef84921d8b38f43c2b4f60870965b4eecc8f018c7b3499e1142c715af","src/=
zlib-ng/cmake/toolchain-powerpc64le.cmake":"5b2edd36d62de513db2d32bfbf77997=
9d81ac527b981cc3379a4e933fc5a94d1","src/zlib-ng/cmake/toolchain-s390x.cmake=
":"cf52cecea7bd2a9d1ff5fd8edcb03c531e3b404bbcd15a15dec2e0e19936f2ac","src/z=
lib-ng/cmake/toolchain-sparc64.cmake":"e543062485d06a7e0fec8135887c5e733635=
17fa4babc23ef7b780916d75afda","src/zlib-ng/compare258.c":"56bfd48d5ff9ca422=
fbb728df7a373436c73796561dff118c7d4039fe70d29e2","src/zlib-ng/compress.c":"=
41df6eb62d6fb1334ecfe0a0c3e50a7ee89528719857f2b8297cbc512149759c","src/zlib=
-ng/configure":"160f69a1e51c49f6454ece92e4c5e08675ca5d90cf22b8f79cbe54c4381=
d93c2","src/zlib-ng/crc32.c":"98440be8a99381151a2d740f2e2228e8c1b23b9193c36=
42c52a4e34799506336","src/zlib-ng/crc32_comb.c":"11a36a6088fb520a58e0304fc9=
9cf12fc8437519e8a70fe74dad58f00af696ec","src/zlib-ng/crc32_comb_tbl.h":"d66=
15d209d6c7d5248c6f7fe4e5dbded13c0eb87997b37693032c2902927407d","src/zlib-ng=
/crc32_p.h":"1fa91375a18e090c0a0dfda39de3df36346a0b1be36c808be6b6c29c32eba9=
22","src/zlib-ng/crc32_tbl.h":"d629378ba38ff5775095b64e277bcd41c4b89fab9b56=
47a9fb29e15da0db0161","src/zlib-ng/deflate.c":"6fb8979ee8bc43f6e12a649708c7=
eb50e60bb9bdc2e55c45ce3b15aefe779179","src/zlib-ng/deflate.h":"7b3c649965c5=
4446097d6157dd31d3685aa7df1082e9aa64cb3cdf6ac2c4d023","src/zlib-ng/deflate_=
fast.c":"d51e1368fc997673c64b5ab9a620439df25f313f8274529d974c5f80b89702b8",=
"src/zlib-ng/deflate_medium.c":"1c3d95cbac76052d39595ea750c5536541c18302b9a=
bb398c27b58955318bba8","src/zlib-ng/deflate_p.h":"2e739301e8c53038c2a958c8c=
8693584cd8dae464ffef05a22db6d6fa9985676","src/zlib-ng/deflate_quick.c":"280=
905a191d2b2a7274f2453ac537e01a0fb6e7540a0b212c1514bfb8c9415ea","src/zlib-ng=
/deflate_slow.c":"a2c66723e1e71ffd6ff856407459ab311a4c6546ecf50285081fc7afc=
d0ccd2e","src/zlib-ng/doc/algorithm.txt":"0d21a0a4c47e512743389628d1385a831=
a5e5ff716491095a382b923287f4223","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c98=
4657bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc=
1951.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009=
","src/zlib-ng/doc/rfc1952.txt":"f7c810fd9d719d002d605207a9b880600f71d039b9=
626c5b4b03f2122438dd2d","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d=
380549a330e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builti=
ns.h":"1d2c2da88009a58f240bac33f562fe5a0a39c1e773813a2d75b45283ff1396cd","s=
rc/zlib-ng/functable.c":"d9db6530035a06f95982ff3d7680a84f4b54b8425874ccbe2a=
b10b906bd5708a","src/zlib-ng/functable.h":"e5a2d0c10411d23f04295bcb9ddb9889=
388974b723caef65aa5c4ea4739f4aa7","src/zlib-ng/gzguts.h":"7b69b2f35264169bc=
794d0d5c00247d93c203f751d226302966c33b524ed9fb0","src/zlib-ng/gzlib.c":"7e6=
ad5d9d32e6429d56a5303e2c6e6870d69c023d6647a52fb95902828de4011","src/zlib-ng=
/gzread.c":"d5d47d24dc463b978fe828320dab140494803fd86b511300f903c7c2eabd4d2=
5","src/zlib-ng/gzwrite.c":"1685ad2c88239b3434cd2c4a9d66b67842310b2d1dfd01a=
ec0fc293eef20e858","src/zlib-ng/infback.c":"4decaa412219fc8adb935754c54a4de=
df3952aaf67107a12512451c65eadee23","src/zlib-ng/inffast.c":"a134d4aa6a46eeb=
e975ca0cd5ef18894fc852b6a840be21ca7243ddbe6c9d8f9","src/zlib-ng/inffast.h":=
"42e74a92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zli=
b-ng/inffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd5=
2187f364314","src/zlib-ng/inflate.c":"f33e2e7eeaa4b33ba6a2c327f8c9939e6b847=
afbdad349da65c97bf81c6083b5","src/zlib-ng/inflate.h":"eb25527d1bdedaa451679=
26dce4c39d9aaa3147b0f4a95f38f5916528c30a09b","src/zlib-ng/inflate_p.h":"4a9=
4c51194da119770cf662ef289994f0c78d95184d54d6ae5d50a393e8f5a62","src/zlib-ng=
/inftrees.c":"7a777f5ff02ce60fbad6cb843ceadd7b3a8a8a0476ae010c87a0377c2e88f=
780","src/zlib-ng/inftrees.h":"fa80eb11c2290b345470a03cb861843e2cb136513523=
3ea8243e9fd79d3618a1","src/zlib-ng/insert_string.c":"aa22ba53a1e75821499809=
277f9ca0e5ef92b07a618136dd11ae1734e233b7c9","src/zlib-ng/insert_string_tpl.=
h":"1ceba9903324d10aad6e1d83653c4d534a5b06fd09076414a06215482be00bac","src/=
zlib-ng/match_tpl.h":"eeab4c6eea8511a7579738e622af062ad16f4016312e93ad34bc5=
903d8b3c4a1","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057c=
e3496aceaccd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2003-01=
07.c":"6ed6fba710f8f2b898750f0ec17720fbf01e45c39e8adbba6409681b34914140","s=
rc/zlib-ng/test/CVE-2004-0797/test.gz":"38caae524705f676bde13a8df9fc8c7d2fe=
105ba6bdbab62a405b0276fd3aa2e","src/zlib-ng/test/CVE-2005-1849/test.gz":"e4=
d5a60617df4b5dd44eda94751ce1eacdb325792bba6e3cc4676719a3adf742","src/zlib-n=
g/test/CVE-2005-2096/test.gz":"8f702d4861aa3ec98ac03a59ff26b430939630cb5cd4=
266d2658d3b836d576f9","src/zlib-ng/test/CVE-2018-25032/default.txt":"d7f827=
8db331c47bd1208bf41e7903cbddee4f7b47c666c40afdd3c96237752e","src/zlib-ng/te=
st/CVE-2018-25032/fixed.txt":"3b27a98edd2f3f580033f9add11d3469d7808c969a112=
8ee00c18ac7a12cef57","src/zlib-ng/test/GH-361/test.txt":"358497d0a7251ea421=
01dc77b02337f46fd89af09643a8288e2a3082e5d24128","src/zlib-ng/test/GH-364/te=
st.bin":"af5570f5a1810b7af78caf4bc70a660f0df51e42baf91d4de5b2328de0e83dfc",=
"src/zlib-ng/test/GH-382/defneg3.dat":"b22bef6b7392401c9e7b079402c4a4074053=
d7a914d050400e37fd7af6fe26d5","src/zlib-ng/test/GH-751/test.txt":"b83d83380=
3b7bc3124fb2a0034081f0b999ad10c33a8dfa3bfd181dc078ae3ee","src/zlib-ng/test/=
GH-979/pigz-2.6.tar.gz":"2eed7b0d7449d1d70903f2a62cd6005d262eb3a8c9e98687bc=
8cbb5809db2a7d","src/zlib-ng/test/Makefile.in":"48d033f2dbb62635624bf2c9e3e=
7fe279b72afc3411d14cb7cfdbf40f5b80e19","src/zlib-ng/test/README.md":"d60ef4=
851222ebc2a9fbc23f292ab11bc7fee40ba6171ea768b2ffa005df5b1d","src/zlib-ng/te=
st/abi/ignore":"02aa87f77656dbc1fbddd23f436cd15465a92df0722da4055cae1bc8bf0=
13097","src/zlib-ng/test/abi/zlib-v1.2.11-arm-linux-gnueabihf.abi":"f5e91f2=
5b558a891fecbeb6e2e9575698630ab700d055a38f3bc4fe66257f513","src/zlib-ng/tes=
t/abi/zlib-v1.2.11-x86_64-linux-gnu.abi":"038337383cf780587d810cf5400d632f3=
a1f8517e63ac4a71b6e5224db8b1413","src/zlib-ng/test/abicheck.md":"6b4a87d760=
b3848fb1ded6782e02a1d074d9e487bdabb29274a62b31cdf48772","src/zlib-ng/test/a=
bicheck.sh":"7ca2884ff37c697d380f620554525f9b9dc7fa76b45f866d284b2ea5b98c65=
cc","src/zlib-ng/test/adler32_test.c":"db3e8ad9a4e2ecce0c052b0bfe19834d3ff2=
fb2e9239cc3438a2c95db00b1d21","src/zlib-ng/test/crc32_test.c":"8f1223d8aa4c=
52a5e7323f422023f6b892ce684eaf7439ad905b855293f40143","src/zlib-ng/test/dat=
a/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d6d74364150e255=
f126512","src/zlib-ng/test/data/lcet10.txt":"1eb5d7bddb1c3cb68064d5b5f7f278=
14949674b6702564ff7025ced60795a6d9","src/zlib-ng/test/data/paper-100k.pdf":=
"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e44849b","src/zli=
b-ng/test/deflate_quick_bi_valid.c":"a36697e5779a645354823f14540bd60b9378c2=
f4c5f2bb981d86bb34f29fcbb0","src/zlib-ng/test/deflate_quick_block_open.c":"=
455bd347bb88debdfacb409846170274991ec9ba71c52b8fd0e526daf57265eb","src/zlib=
-ng/test/example.c":"1c8d9d14128da9fb5415683aa7318ae0aa94b743f75905288a2a9d=
ecd4ead98d","src/zlib-ng/test/fuzz/checksum_fuzzer.c":"65a96358c9a82efc4b25=
1b4f322b02fade7b69f9bc6ac07294e641e3fe1ccdb1","src/zlib-ng/test/fuzz/compre=
ss_fuzzer.c":"1ab70608075c4bc60f89aa2f327cff88362ee7b1d31da88ed54ca51e5f99e=
5c9","src/zlib-ng/test/fuzz/example_dict_fuzzer.c":"be68f9eee3deae7f9163c62=
88742e5455bc28f659f80fdb276fafe215f028b97","src/zlib-ng/test/fuzz/example_f=
lush_fuzzer.c":"f12246a184dcfe0a19a98cdc742a1fe8da388ad20b406635d63f1fa10d4=
5b9ca","src/zlib-ng/test/fuzz/example_large_fuzzer.c":"f490abcd332fb4e79212=
92adf6876d38d7f71c8d2443212c781ba88957ff9303","src/zlib-ng/test/fuzz/exampl=
e_small_fuzzer.c":"a9b3436b291ace821b6013311a1100e19a9e1c67fefd3f97dbd60688=
f9bf22b1","src/zlib-ng/test/fuzz/minigzip_fuzzer.c":"5faecfe9e6ecc47e746151=
bd1cc24a2e2dba8b7ffeb270d2c88cb126273ab446","src/zlib-ng/test/fuzz/standalo=
ne_fuzz_target_runner.c":"f25649ed35b8b7a3899c8d7ff52f9972dfc7bf274889e0a7a=
77fbfdf1c1cfef0","src/zlib-ng/test/gh1235.c":"8310ef780dc483a1708750cd7c120=
b8e9cc0e1614767d24c01869e529074e981","src/zlib-ng/test/hash_head_0.c":"448d=
ef3e8ea13fbcac86202e50b8a71b6cea585d7bdbca0bc6cf6056e4059f98","src/zlib-ng/=
test/infcover.c":"9c0e8068fdc614b1852e8d274231b41ce3ce975d4419ed31e700a0b05=
e702303","src/zlib-ng/test/inflate_adler32.c":"ab430c97ae8f569784710118038e=
8ebf53f4136d1a957e1277c0904f9218340b","src/zlib-ng/test/minideflate.c":"34f=
dce39628ffd173f7736d9fb65dfa40d0b0289def64b935075f6c6cffe1999","src/zlib-ng=
/test/minigzip.c":"7dbce6528601f7fdd586280885ed439cb539e15f36dd3974274729bf=
cdd41928","src/zlib-ng/test/pigz/CMakeLists.txt":"aa70f1025adc004985bfe0acc=
ee9b7a80e04786d82705e27c377a5e8d4ecbaaa","src/zlib-ng/test/pkgcheck.sh":"58=
1b3de9c58e96038af94c73cbdb30eed32900f7abb8fa7692426fa68059b0ef","src/zlib-n=
g/test/switchlevels.c":"ceb6cc4d48a637562009d8f7f82635fa9942acd1bfd597acd99=
454a03a3a98e3","src/zlib-ng/test/testCVEinputs.sh":"5de6198444c16726f8e0a8f=
2beb5b89c5ae7e7e3736ce760b9fbc719493e7e4f","src/zlib-ng/tools/codecov-uploa=
d.sh":"ec7a8f1405820810e486e3d7e2fda7eb958c17877b0000b93abdf09d87732a2f","s=
rc/zlib-ng/tools/config.sub":"32186cfeb5db62c99e1dfbfb07f24c1a50977447b4c26=
d2907021c74422a70d2","src/zlib-ng/tools/makecrct.c":"55c8f7b8e29393e95988a2=
9de8cb1a1bdf2738a69d53627bd0f9d7bf169bf0a8","src/zlib-ng/tools/makefixed.c"=
:"bffd02540231304f9bcc755b8cb9ae5cfbc48975857bbb4547f1d6acce21ef57","src/zl=
ib-ng/tools/maketrees.c":"30e9f70addf691d1241e594a7f31fc78b119b65e8af9ac8e2=
0fe6da01635d3b3","src/zlib-ng/trees.c":"2cd9a1dc8d9231e9fc4e53e56b87307989c=
1b7f33212cde4ee434ef71c28af2a","src/zlib-ng/trees.h":"24174f3543b01ee1ef370=
bbf6d15551a21871cded18b2aadf09a71e7904b6f99","src/zlib-ng/trees_emit.h":"2e=
93093ae5362523a26877d6fd663bb05793795889d2bfb987cbada9a9dc4517","src/zlib-n=
g/trees_tbl.h":"35f4fd0ec080c1ade342e2dd1b0f5cdc7e9f18990faa48d7a8a69bc318e=
be607","src/zlib-ng/uncompr.c":"4ebb486b27930f8a6ec4a3cc90a207d0bcf8a4779d1=
dbf3b2184a2b2a5735cd1","src/zlib-ng/win32/DLL_FAQ.txt":"f17fd3823726adbae63=
b91c00d5db1dccae2e289258edabbbbebde04bb6e7e8c","src/zlib-ng/win32/Makefile.=
a64":"775d6902373d1583430b5d7467f001746be323610c89be27e02bbfe0205994f3","sr=
c/zlib-ng/win32/Makefile.arm":"7535e022f482920c3fa7a267e84e39ad790d150f72e5=
c30414baa156c2fdd9b6","src/zlib-ng/win32/Makefile.msc":"d769a00c0ad4cb5fc62=
4d2ae004dfa3785a2f4310324b03afd2156e759003a06","src/zlib-ng/win32/README-WI=
N32.txt":"cdcca6e7a5d2d23618a48fafb8eea347227f8ecf1f38a6aa90f0e7e455bc6574"=
,"src/zlib-ng/win32/zlib-ng.def":"f240276caf805a10d024fc6a66efe915c435734c6=
9732818d92fb04d08ab350c","src/zlib-ng/win32/zlib-ng1.rc":"ea0ea4d116b583510=
b113a27fdec2ad4f0890206963f0e3838f275b8005dde5d","src/zlib-ng/win32/zlib.de=
f":"d9c371ff2677567350386441a2e3d0258010d6502290bbac5ac42ea168bd5212","src/=
zlib-ng/win32/zlib1.rc":"ec5021dba35f9fae5f5f82ad6b6bd059928548e0608e4ede0b=
cffccf5c1210a1","src/zlib-ng/win32/zlibcompat.def":"73728b9df4379dc70ebd9b2=
a9f20d6e4ed7c031fa1f351cdeae1de7d1db05bd1","src/zlib-ng/zbuild.h":"d4d52d32=
96cc949a5d694e7349a8236854f2ec116c184a310e4e62b28caf5b63","src/zlib-ng/zcon=
f-ng.h.in":"f206ac69c1fa48c670648d26028263372a539ed1243a9a26e5b35bf52e2363f=
f","src/zlib-ng/zconf.h.in":"dbf08736c3bc5e41242b09e13d0a523b440250410476dd=
58747c14e28984f1e5","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b097d318500f2=
7daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h":"d51896e8411868=
ed195d5cf41fda4f1c5a9c891832dfd16b559a5ed6beedd890","src/zlib-ng/zlib-ng.ma=
p":"03ef4439594619e215dbb1717f8c13e16159308ef3817761ba1a3cca7f7834df","src/=
zlib-ng/zlib.h":"7e3666971e08019fc7097f11d593aac9ff6824a1ecc945c48f76009f7c=
27d55a","src/zlib-ng/zlib.map":"9997aa913dec6da106ab2089d2a72ca5e1b7fafe080=
7ac0bc1318ce8c8defab9","src/zlib-ng/zlib.pc.cmakein":"17668e07edbe5971043be=
a26a2f2b92c4c7cf4724620f1156f3ea1436d2aac93","src/zlib-ng/zlib.pc.in":"cf94=
c9aa44878a62e27c2f75354c08326b3bb5250a9b11496855cf59691177bb","src/zlib-ng/=
zutil.c":"53418b23c7878e968b4d04df8ebac74f64f60d32277f2343d16da52059dbc782"=
,"src/zlib-ng/zutil.h":"a14c18dd4a96909aaf0aa016cb6df97d77cf5b735283527c906=
181eead22f0e9","src/zlib-ng/zutil_p.h":"c259b33614007463b41d4184e0bdf10d623=
25445ee9308e1e1885862d201657a","src/zlib/CMakeLists.txt":"d3ea46cd350c74c21=
c2dd97f6d0ad354db76b2b43cc91ec1144b88267f67a588","src/zlib/ChangeLog":"6933=
f4ab74360476bc80d9eda2afd98f93588a5d276e1197926267421dd6959e","src/zlib/FAQ=
":"1e8a0078be0ff1b60d57561a9e4a8cad72892318a8831946cba1abd30d65521c","src/z=
lib/INDEX":"3b4e325d47ae66456d43fcf143ba21ab67a02a4f81be7ef2da480ba30d77426=
6","src/zlib/LICENSE":"845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1=
ed2495753243","src/zlib/Makefile":"ef23b08ce01239843f1ded3f373bfc432627a477=
d62f945cbf63b2ac03db118a","src/zlib/Makefile.in":"77a662b885182111d7731eef7=
5176b4c5061002f278b58bf9bf217e2fa16cadb","src/zlib/README":"4bb4d5664fb9d06=
ef0d47e8ef73104bd545a5a57eb7241be4f2e0be904966322","src/zlib/adler32.c":"d7=
f1b6e44fee20ab41cef1d650776a039a2348935eb96bcbd294a4096139be3a","src/zlib/a=
miga/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd9dc53d91ed78bbe495e94ccc84dd=
d423edf1f","src/zlib/amiga/Makefile.sas":"0e63cf88b505a1a04327bb666af3a985c=
5e11835c0c00aed4058c0dcc315d60e","src/zlib/compress.c":"6d0f0d0784744acca26=
78ce325c8d7c4c030e86f057adb78adcee111d2248c0d","src/zlib/configure":"2d964a=
697f9060d3a8fc5b4272c9d07b22e5fe6f5cf327e5c29f62f67d935759","src/zlib/contr=
ib/README.contrib":"b925ae08d371b33c4b5ffd67c707150729a476caf47cfe2eafc0022=
91f23f931","src/zlib/contrib/ada/buffer_demo.adb":"469cf566a6965767fee6b987=
a239ed8cedcc66614940d45a9b434331fbb435ce","src/zlib/contrib/ada/mtest.adb":=
"41b6f31684770334afdc4375871eb1408542f37a823a073556fdbfdb63753160","src/zli=
b/contrib/ada/read.adb":"fa5b989aef0c5715a3fcb15de93985f7f10aeb0a7f5716745c=
95ed820eb9af9c","src/zlib/contrib/ada/readme.txt":"8fe9e5303f2e8e8b746c7825=
0e74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/zlib/contrib/ada/test.adb":"=
5e3abe79b387e09a9a42bd0543105e228f39a335240cffc33d71f0ba66ff2511","src/zlib=
/contrib/ada/zlib-streams.adb":"f45988e2bac76eb25a0dc981f46576e7432c35dde17=
90bbc2b650f0090b7fa72","src/zlib/contrib/ada/zlib-streams.ads":"969e8edb061=
1810fb52159dcb7c40228f4e5da810a7a3576b778116a93038c6b","src/zlib/contrib/ad=
a/zlib-thin.adb":"03d89244ee5ec9771d9b5050e586c609f851af551b2e64eb151f1d5be=
0b63ae9","src/zlib/contrib/ada/zlib-thin.ads":"631ef170bde16c3ca8d412b54a0e=
519815b80197d208f8f393e6fe017bb0968e","src/zlib/contrib/ada/zlib.adb":"c9ca=
5dc34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e12421323ab672c","src/zlib/con=
trib/ada/zlib.ads":"02634bec0d5e4c69d8d2859124380074a57de8d8bd928398379bfac=
c514236d2","src/zlib/contrib/ada/zlib.gpr":"859bb69dce38dbe9dca06753cf7ae7b=
d16d48f4fece8b87582dab8e30681d3de","src/zlib/contrib/blast/Makefile":"17d5d=
26c24bf51cad51045a38ffb73cc3539d29e89885aa249fcfd45a8659d5c","src/zlib/cont=
rib/blast/README":"baa763ae03d88ef7ece6eb80d9a099b43d0b57639d6d281e1c7c6ca7=
9d81daba","src/zlib/contrib/blast/blast.c":"1ab3e479d342bfc144167b808fb0014=
2264bc50f24a110ca88cc774e351c218e","src/zlib/contrib/blast/blast.h":"9c1c42=
2b76311d4cb06863ffc056668b6240f3dd998bc02e89ee590d482bfdc2","src/zlib/contr=
ib/blast/test.pk":"5f5c262c545574a5c221132d5ef832478d222d70b015341795b38602=
04140d7c","src/zlib/contrib/blast/test.txt":"9679b2c98e1283222d0782b25a1c19=
8dc64ba9ebd1addd6dc6f643a45947cda3","src/zlib/contrib/delphi/ZLib.pas":"6dc=
c65866e3fb3d33d2a2328c547458156883a3e6749d52ded209357a49d61de","src/zlib/co=
ntrib/delphi/ZLibConst.pas":"84bcc580bdf397e570f86f3f5a5b8c7bf537828f30b4b7=
2648b81911f6bf5095","src/zlib/contrib/delphi/readme.txt":"f7420ed2de77d4b49=
8eefbbe6402a1d17dc2d411735289c78a265c7f10fdaee5","src/zlib/contrib/delphi/z=
libd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b7226988776f8d5=
11","src/zlib/contrib/dotzlib/DotZLib.build":"b96137097669644ecb9f42cdd3399=
d1fce9c512788374609303f7e50abf597f0","src/zlib/contrib/dotzlib/DotZLib.chm"=
:"20d0e3edd57f849143255a7f0df1cd59d41db464a72c0d5ab42846438a729579","src/zl=
ib/contrib/dotzlib/DotZLib.sln":"a979198c5b8d144c1ac8f993bfb6f4085d135aa58c=
a9dcf63ebabf52b5c695f7","src/zlib/contrib/dotzlib/DotZLib/AssemblyInfo.cs":=
"314afcfb339ea95f5431047b7ab24631b11c3532c7ce5dc2094ed0cf80a7c16d","src/zli=
b/contrib/dotzlib/DotZLib/ChecksumImpl.cs":"e7c047a2c3bcf88d3d002ee3d2d05af=
414acf53cb4451efacc0f2e95a474ea0f","src/zlib/contrib/dotzlib/DotZLib/Circul=
arBuffer.cs":"be84c9736fe7bdc2bfae70466d8fff582504e928d5b5e110fd758090090c8=
cb7","src/zlib/contrib/dotzlib/DotZLib/CodecBase.cs":"259bdda1b7d6052134e63=
1fa24bfd9dca6e2362563496c8b85257b56c848908c","src/zlib/contrib/dotzlib/DotZ=
Lib/Deflater.cs":"06ba6696a3c15c53ba5fd5a1c2bf50b51f217010228fc1e4c8495ee57=
8f480de","src/zlib/contrib/dotzlib/DotZLib/DotZLib.cs":"9837fe993fd631233cc=
5e53ff084d86754b97f05ec77c54b0764c2706f186134","src/zlib/contrib/dotzlib/Do=
tZLib/DotZLib.csproj":"21606db31dfef6410dd438b73f1db68856eacabcce6c0f0411fc=
4f17e17001f3","src/zlib/contrib/dotzlib/DotZLib/GZipStream.cs":"8d1de9755c7=
7046b4ac71340a0a54434ebf4fd11b085c44454d7663a9b4df1c5","src/zlib/contrib/do=
tzlib/DotZLib/Inflater.cs":"9016ca73818f5b6a28791abc3af6da7c4d2773b6a3804f5=
93f6d5737a62b99ad","src/zlib/contrib/dotzlib/DotZLib/UnitTests.cs":"c95048d=
763c7e367ba0bb7c31981e0610131fa12356bbd9bfdb13376778e9a0c","src/zlib/contri=
b/dotzlib/LICENSE_1_0.txt":"36266a8fd073568394cb81cdb2b124f7fdae2c64c1a7ed0=
9db34b4d22efa2951","src/zlib/contrib/dotzlib/readme.txt":"d04972a91b1563fb4=
b7acab4b9ff2b84e57368953cc0596d5f5ea17d97315fd0","src/zlib/contrib/gcc_gvma=
t64/gvmat64.S":"22ff411b8b1d1b04aeaa8418b68245400267dc43c6f44104f6ccd37f0da=
ee89f","src/zlib/contrib/infback9/README":"890288f02bb3b1f9cc654b87a07fcea6=
95f90f6b9bd672d25bf6be1da2ec1688","src/zlib/contrib/infback9/infback9.c":"0=
a715c85a1ce3bb8b5a18d60941ffabc0186a886bcc66ba2ee0c4115a8e274e9","src/zlib/=
contrib/infback9/infback9.h":"dda2302f28157fe43a6143f84802af1740393572c2766=
559593996fd7a5a3245","src/zlib/contrib/infback9/inffix9.h":"84a2ba4727767c1=
8af6505f0e81d9c814489c8b9ed330a25dad433db72997e43","src/zlib/contrib/infbac=
k9/inflate9.h":"32a907676cc36e27d0fdc0d99adb83a0b23f20ab61896269216d40fecf0=
8d349","src/zlib/contrib/infback9/inftree9.c":"1f262e5ae8094c9d8b172241e567=
c86be560327b840ca8fb771e98461bcb158a","src/zlib/contrib/infback9/inftree9.h=
":"145072793141cb313c91cdf9dee9d4b8e8a38d77099f87e9cd05c7b5ead8f099","src/z=
lib/contrib/iostream/test.cpp":"0f3c77e013949eb9c91e6b690ea894e19d97944d6b0=
885b82806fc3ad99680cf","src/zlib/contrib/iostream/zfstream.cpp":"8ebb9b3d52=
1cc3392953f27658cf1f6dcb763216079f69a1518ec5ca0e42a63b","src/zlib/contrib/i=
ostream/zfstream.h":"4369c35e66f63f52ca4a5e1759bf720507ccabb8f3f132e2f18e68=
686c812401","src/zlib/contrib/iostream2/zstream.h":"d0343e0c57ff58008b6f296=
43d289c72713aa2d653fe3dcd2e939fc77e7e20b6","src/zlib/contrib/iostream2/zstr=
eam_test.cpp":"f789df183cc58b78751985466380c656308490a9036eb48a7ef79704c3d3=
f229","src/zlib/contrib/iostream3/README":"43ec48ecbd95a8c45db20b107fac73b7=
40bb11595a4737329188f06b713972cc","src/zlib/contrib/iostream3/TODO":"af5ebc=
83fb88f69706c8af896733784753dead147687e1c046f410c0997fd88b","src/zlib/contr=
ib/iostream3/test.cc":"8e17fc48dfdbc6e268838b8b427491b5843b6d18bc97caa6924d=
e9fad7abe3da","src/zlib/contrib/iostream3/zfstream.cc":"8cdd67ed0b13c192c11=
e5ea90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","src/zlib/contrib/iostream3/=
zfstream.h":"1bd74778fac45ee090dfc0f182a23e8a849152deb630606884b2635987b357=
b1","src/zlib/contrib/minizip/Makefile":"0f59cf07531cf34cb359f9dbe26d8207a2=
bbbdad618557894eb629925f7e8899","src/zlib/contrib/minizip/Makefile.am":"231=
3a3480a2c3745fa7ce216829cd0367058907d3a0902e5832c66c84a2fdfc6","src/zlib/co=
ntrib/minizip/MiniZip64_Changes.txt":"302c62b328647f5472fb7755249a83459be7f=
8ffb1fae07e8ba318fce8f4126c","src/zlib/contrib/minizip/MiniZip64_info.txt":=
"122719c32ef1763a5f6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac3","src/zli=
b/contrib/minizip/configure.ac":"959e4762ddcb36dcf30512611ca9fbcbcd0c943228=
a6ac2975708798ae09a438","src/zlib/contrib/minizip/crypt.h":"1d25a0fab3189dc=
3c6ae43c7813e1e5d07d0d049bd32bd7bd0e9ccd752bfdd5e","src/zlib/contrib/minizi=
p/ioapi.c":"f6878a3ecf6802f0f75cadb41a114fa274636c386bac794c66cbb27a24d9a29=
f","src/zlib/contrib/minizip/ioapi.h":"9f5448f8d5e8894d6f397dd09d24f7ff39cb=
818cd493a8bd90dda19553b814ea","src/zlib/contrib/minizip/iowin32.c":"103cdef=
91d57ceca7a1c1973772ff7e1d44c7b3e227a3640171957302bd9e974","src/zlib/contri=
b/minizip/iowin32.h":"586f22b9c3c64da253ce2b518e0fad61f19a7b47b289fc704cc97=
08242294c49","src/zlib/contrib/minizip/make_vms.com":"65736d9c4888f2373d3db=
0a13864d150c5040453f5bc2a5c8784379a7ea67590","src/zlib/contrib/minizip/mini=
unz.c":"b29dfb4cff9763497d8f0656c97027995e1ea0b4104e4a217ba7882337ae7a7a","=
src/zlib/contrib/minizip/miniunzip.1":"66d8684392167091ef0fe01598d6a0daa26e=
7e448e2df6c3cb257487735b83f7","src/zlib/contrib/minizip/minizip.1":"5404596=
e8e5587a52f563906119f32ceee30a6d97a966afa5c7afbe4d373e210","src/zlib/contri=
b/minizip/minizip.c":"b5b8f380297be0d90265356704df1e41bee0e903a2169263a2b50=
dc22cc3180a","src/zlib/contrib/minizip/minizip.pc.in":"8b6670b42d8e5e519e1c=
c89db093efc07ba23cb1ddfedd3c93ff2df08c3ce8ac","src/zlib/contrib/minizip/mzt=
ools.c":"cd887c4af6d20823bd15f24008b10acf01969b4165d7848656bde843a92428d7",=
"src/zlib/contrib/minizip/mztools.h":"6f82c52279e8f79165f4446be652e5741a499=
92ac58632470335aa34c564072a","src/zlib/contrib/minizip/unzip.c":"fc9e8d7526=
18a05c1f3a2ce61ebf76d0c8053dd5579458f836834a36e8690bbe","src/zlib/contrib/m=
inizip/unzip.h":"20cdc47658a3e41db897d31650e46cd2c8cca3c83ddaaeb6c7a48dd8b7=
f18e03","src/zlib/contrib/minizip/zip.c":"bee2d6fa310c9451b24c036d5840a8c7c=
90b7cf8d12d5767175c207e56fefcc3","src/zlib/contrib/minizip/zip.h":"75b635dc=
a8294790ab7ec1f72e9f1fd352d75b189c3c9b61c68f76bd7e612043","src/zlib/contrib=
/pascal/example.pas":"d842d456ecb6ff80e34cee2da31deb2072cc69ca837497bea8b8b=
ee203403474","src/zlib/contrib/pascal/readme.txt":"02f997c37991ddae0cb98603=
9f7b4f6fc816b3fd0ffd332cad371d04c12cf1b9","src/zlib/contrib/pascal/zlibd32.=
mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b7226988776f8d511","sr=
c/zlib/contrib/pascal/zlibpas.pas":"720346d2f40429de31bb16a895f42e878f259b1=
aff7d46c63e6616e629b3f7d5","src/zlib/contrib/puff/Makefile":"d9d738030464aa=
ae354196c14fd928adf591832fce7d71ac1977c1d8d4923a4b","src/zlib/contrib/puff/=
README":"c5b9852fb11e0d6b6e916e5134cf034524d901b95368972133e0381e480eb479",=
"src/zlib/contrib/puff/puff.c":"433f7f4495481dd95576dbb548b1bcfc5ca129d3042=
1695fa609f5f6c14908b6","src/zlib/contrib/puff/puff.h":"969b7be2a930db0cdcb1=
9b0e5b29ae6741f5a8f663b6dba6d647e12ec60cfa8e","src/zlib/contrib/puff/puffte=
st.c":"d24e31c1d277d07c268f34e9490050c6b53c68b128da3efbb1d05fc5b31004f7","s=
rc/zlib/contrib/puff/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8eddd10223b235=
54299455c6c9be71b653a3","src/zlib/contrib/testzlib/testzlib.c":"c6c37b35c6e=
cc9986a9041f86d879cc37a9e4d8315af9d725071eb3b2cade0c5","src/zlib/contrib/te=
stzlib/testzlib.txt":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad58dab3ca78ef=
55b7d0dc577","src/zlib/contrib/untgz/Makefile":"8f5ab1564813e091cea8f1bb63d=
a32fd80ac763d029277b0cabf50f60aceefe1","src/zlib/contrib/untgz/Makefile.msc=
":"d0f537de11d9e0e36e2a98b3971c537265f4b533b4c48797094365ad9ae8388b","src/z=
lib/contrib/untgz/untgz.c":"9a12d774301d252dcd38bba07ac369319da4c04c4fef8a5=
0fcbf40aebf29c2a1","src/zlib/contrib/vstudio/readme.txt":"df5fe112bef3c23d5=
767602736f6d0ce43cbb49b584210fe57f6f59e634a49d0","src/zlib/contrib/vstudio/=
vc10/miniunz.vcxproj":"dd607d43c64581172c20c22112821924dfe862f56b2e5eb8780b=
dd0714d9527b","src/zlib/contrib/vstudio/vc10/miniunz.vcxproj.filters":"4b84=
66bf00c70b81c31cc903e756e04151fd90fdcbe102f3568a2c8b6190ea27","src/zlib/con=
trib/vstudio/vc10/minizip.vcxproj":"af73f2cf8ae51e65e85342faeb40849a2310c97=
bc77def42b38d7070460a6cf0","src/zlib/contrib/vstudio/vc10/minizip.vcxproj.f=
ilters":"f2815f9e3386c393d0a351632823b221ef9689da1f422ecaa561dba2a612fb0a",=
"src/zlib/contrib/vstudio/vc10/testzlib.vcxproj":"c21e64259bf9efe97e1103212=
e7a6e1b7372b50067b4ba14cfa678e1f491095f","src/zlib/contrib/vstudio/vc10/tes=
tzlib.vcxproj.filters":"a7caddbac3ba90b5d482e6d926ef35cc40dc3553ed3776ef6b6=
8a528fd5b0631","src/zlib/contrib/vstudio/vc10/testzlibdll.vcxproj":"3f317d8=
964f17901c3e68bff5deaec10b6ccc50a572235999e8097292692984c","src/zlib/contri=
b/vstudio/vc10/testzlibdll.vcxproj.filters":"29c9535775aa76320ee4efd001d419=
61faf6c58cedd8b29d3986e85f73d2f6fb","src/zlib/contrib/vstudio/vc10/zlib.rc"=
:"6041a4727ea47520058a5b4bb8de87592883eb7f26dd39df62879c347f3888d1","src/zl=
ib/contrib/vstudio/vc10/zlibstat.vcxproj":"50402ab8c63f746c034d6ce51d9612af=
f5b6af9aa27790cffa4b7deed4b30eb8","src/zlib/contrib/vstudio/vc10/zlibstat.v=
cxproj.filters":"eeb1de64c252c46b822f73f272127f6f9f0570ef22d234e093070ba95a=
4dde24","src/zlib/contrib/vstudio/vc10/zlibvc.def":"a228e521a561d4456c83c70=
81b4e9950cfce99133af7d5fdd27f12a8fd53efde","src/zlib/contrib/vstudio/vc10/z=
libvc.sln":"e659860f705f31b87ea9139a3cb4ebe1561e120bce495383a54614fc82b4999=
0","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj":"efad8cb150c0e5122f8c700d=
95c5de659dff92b171917c66bdbd082fff500b58","src/zlib/contrib/vstudio/vc10/zl=
ibvc.vcxproj.filters":"c801732b7c7017796add50d2b71a228f99f95a46650baad307ff=
7e8358a2bfb0","src/zlib/contrib/vstudio/vc11/miniunz.vcxproj":"746e4c11fb8a=
f4bcd6a9d68ba81ed1dc366a5de3bed56b291ee969ad733a7bb0","src/zlib/contrib/vst=
udio/vc11/minizip.vcxproj":"340617cae9cf4fcb003308021d3782ec3639e60d62d79a3=
aafc0a50bb55b061e","src/zlib/contrib/vstudio/vc11/testzlib.vcxproj":"99eadf=
df2e41bc036141c174c4d0035d87572ce5795dcc28f39133f818a79d08","src/zlib/contr=
ib/vstudio/vc11/testzlibdll.vcxproj":"583bdef522b0176829f0d8139ea2a88b9cbc1=
4379d1334f3a863989ed3df9b67","src/zlib/contrib/vstudio/vc11/zlib.rc":"6041a=
4727ea47520058a5b4bb8de87592883eb7f26dd39df62879c347f3888d1","src/zlib/cont=
rib/vstudio/vc11/zlibstat.vcxproj":"b07f792843d05ac883391075bc3b9625437490d=
8d40944ad359aa2134a09a3aa","src/zlib/contrib/vstudio/vc11/zlibvc.def":"a228=
e521a561d4456c83c7081b4e9950cfce99133af7d5fdd27f12a8fd53efde","src/zlib/con=
trib/vstudio/vc11/zlibvc.sln":"27389b515997defd080519f95aff87e89fcbe8b26d73=
c5ebb73c544cfef4d60e","src/zlib/contrib/vstudio/vc11/zlibvc.vcxproj":"d02d0=
14ef957119a6fd0ab243c892b74d1592b117750b95fed21097c8ed922d9","src/zlib/cont=
rib/vstudio/vc12/miniunz.vcxproj":"1494af54570f6e93852932956d49a8c25e57b5ab=
c1ac979945605ca9143df9f8","src/zlib/contrib/vstudio/vc12/minizip.vcxproj":"=
9bf128ed6760ca5f019006f178b1c65f4c7ff122dba8d297b64b0eb72feeb120","src/zlib=
/contrib/vstudio/vc12/testzlib.vcxproj":"be88bc1220c0447c2379fdab3ac88055f5=
8a8a788d3e9cec494342187e760eaf","src/zlib/contrib/vstudio/vc12/testzlibdll.=
vcxproj":"93416510256935d79625dc9fd349cfce6968c062d42a138bec404a26b2f92f5e"=
,"src/zlib/contrib/vstudio/vc12/zlib.rc":"90067be57a8c5df594a850352642f8b1d=
cb32e3d088d3805ebafe75a27412b74","src/zlib/contrib/vstudio/vc12/zlibstat.vc=
xproj":"faa229a851c76b77d65bb4742d8369efe566652bb6a1447d1e3539f289b5313d","=
src/zlib/contrib/vstudio/vc12/zlibvc.def":"a228e521a561d4456c83c7081b4e9950=
cfce99133af7d5fdd27f12a8fd53efde","src/zlib/contrib/vstudio/vc12/zlibvc.sln=
":"162e0faa80a56d89eea71a0b89377708eec2faa0dc72091cc0abb07fbdea49a0","src/z=
lib/contrib/vstudio/vc12/zlibvc.vcxproj":"8ac8cb2d29b880a738011d29d0511af9b=
14f321bed90f674109c446f4108d442","src/zlib/contrib/vstudio/vc14/miniunz.vcx=
proj":"0312511d4a30cea979c4e36edf994a537ed8a9d924f6b5c536cbcd094773c11f","s=
rc/zlib/contrib/vstudio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2db900627c36=
6f9bb93a351381995d9c69a50c0126f64233","src/zlib/contrib/vstudio/vc14/testzl=
ib.vcxproj":"88667873d9d61d65016b9501ca925532eb55f56230e5911d3e2a01cd8a9fb2=
a4","src/zlib/contrib/vstudio/vc14/testzlibdll.vcxproj":"69f544898b4275cd3d=
8e19b8f1f8cb39c1cb98a30cdb033242e4b94c57bfa150","src/zlib/contrib/vstudio/v=
c14/zlib.rc":"90067be57a8c5df594a850352642f8b1dcb32e3d088d3805ebafe75a27412=
b74","src/zlib/contrib/vstudio/vc14/zlibstat.vcxproj":"5629eb0cc30674a39aa3=
636f1cdd190393b0dbd4c69a35e36ad85b6340055605","src/zlib/contrib/vstudio/vc1=
4/zlibvc.def":"a228e521a561d4456c83c7081b4e9950cfce99133af7d5fdd27f12a8fd53=
efde","src/zlib/contrib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca6336cecd8c0e4=
b65e515fc46ae84c7b61008ac9864162f777286","src/zlib/contrib/vstudio/vc14/zli=
bvc.vcxproj":"09f496a2ad3afdd5e3f36b7285440369dcac4559656edc00ed7a74c7ec9fa=
10f","src/zlib/contrib/vstudio/vc9/miniunz.vcproj":"7db9b2ef5ff05d3de4ba633=
feab10e85d45434c865d520ffa1974421904996f3","src/zlib/contrib/vstudio/vc9/mi=
nizip.vcproj":"7797a9ad3c0056f3a3cf8fcde7618acd1d151c65d15f841fccd8d9d878ae=
7bb0","src/zlib/contrib/vstudio/vc9/testzlib.vcproj":"8df405917800adccee6ba=
d2116022c2c82d661b37ea40ea16405fe4dbcb4b69f","src/zlib/contrib/vstudio/vc9/=
testzlibdll.vcproj":"cde6806f5c81d1fc311f9921c17ba56f8e386d097783a6a90875d3=
85837c47e7","src/zlib/contrib/vstudio/vc9/zlib.rc":"6041a4727ea47520058a5b4=
bb8de87592883eb7f26dd39df62879c347f3888d1","src/zlib/contrib/vstudio/vc9/zl=
ibstat.vcproj":"d393d418d827ad9fb9c6516f1a7620371d15e3f5afef8ba60b51e50acc7=
199e9","src/zlib/contrib/vstudio/vc9/zlibvc.def":"a228e521a561d4456c83c7081=
b4e9950cfce99133af7d5fdd27f12a8fd53efde","src/zlib/contrib/vstudio/vc9/zlib=
vc.sln":"26e58d4b2cfcd941c367fb2a18537b3b9f002f2ac1278b700ea1129c50501452",=
"src/zlib/contrib/vstudio/vc9/zlibvc.vcproj":"eaca98fcf166738b59fcdbd179dac=
9f98f985c6ba49212b186343a998816f081","src/zlib/crc32.c":"ec3ff0f97858b22851=
3027a490e4330cbb23c6fbdd24d839902ffa89854f209c","src/zlib/crc32.h":"9a22235=
75183ac2ee8a247f20bf3ac066e8bd0140369556bdbdffc777435749e","src/zlib/deflat=
e.c":"4470e36709ce7d6067fa3e8f60bb7f693b055bee42a0d6655ed71faa2db87fde","sr=
c/zlib/deflate.h":"0db1b5ef79ca6ba0f508b7b8bdaa11af45c5ebe2c89ab4f1086dc22b=
963a52fa","src/zlib/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a9=
5aabb08e28c30c52bae3e8c4bd5ad","src/zlib/doc/crc-doc.1.0.pdf":"064f9252d6e2=
e15ea56c2bd18e160e5c9c84bcd137c11a7af497aaa511ace998","src/zlib/doc/rfc1950=
.txt":"8f0475a5c984657bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","s=
rc/zlib/doc/rfc1951.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e0=
3b0b0f301350009","src/zlib/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3=
599bd0fb7c72c2a4dee21bd7e03ec9af67","src/zlib/doc/txtvsbin.txt":"d1549fb751=
37f03102798f70fd34ff76285e717ddd520dd82274c1c0510eacf0","src/zlib/examples/=
README.examples":"1bc1c677bbebe1aa5e85015bb62f0cf3fcdbf95652d30494159bee616=
6c1854a","src/zlib/examples/enough.c":"c14a257c60bbe0d65bb54746dd97774a1853=
ef9e3f78db118a27d8bc0d26d738","src/zlib/examples/fitblk.c":"fd8aaaefd5eb3d9=
fc388bdc5b715d1c6993ecc9367f5432d3b120a0278904edc","src/zlib/examples/gun.c=
":"3bfd36b06284ba97d6105b8a6a5d18b2b34b75b3a1285f16d018680fb174915f","src/z=
lib/examples/gzappend.c":"6de91c8305e37560117bff44136abff72b16b028c0bda0bba=
c7ea07e4988b0ce","src/zlib/examples/gzjoin.c":"90b9d6c39a5fc91cf1cc9b96b025=
a508a8015dc502cd9374c754b44078593f57","src/zlib/examples/gzlog.c":"19687202=
1c96099fd30c880ac2cccd1350fdbd81179731f3914153a26ebf72e9","src/zlib/example=
s/gzlog.h":"681f280437f867820bf39880e2f4fc641d402879e399ba2e6a31d73feefe8ed=
c","src/zlib/examples/gznorm.c":"e5a8f5c3b107f27212f7d5fbfcf072a337a1b4ea32=
929ae31c168997438a5cc0","src/zlib/examples/zlib_how.html":"80fb647be8450bd7=
a07d8495244e1f061dfbdbdb53172ca24e7ffff8ace9c72f","src/zlib/examples/zpipe.=
c":"68140a82582ede938159630bca0fb13a93b4bf1cb2e85b08943c26242cf8f3a6","src/=
zlib/examples/zran.c":"10f9568b1f54cdb7474a38c5bc479aa0edb07a0eed2e999bdad4=
c521f6b25330","src/zlib/examples/zran.h":"9a0d4c15f898c43deae2c5e98a5c66c63=
7a1b25573d662fe91a789c386eaf971","src/zlib/gzclose.c":"94446cf8cde67c30e64d=
0a335b0c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src/zlib/gzguts.h":"fa85c9da=
be24e42ba95c702870416ff67ecc58906321f8e74b72a50dfd7df400","src/zlib/gzlib.c=
":"635b7b6df79a5ce6e0f951669e4c82704d7972d8afb87278b9155c2cb4c5066f","src/z=
lib/gzread.c":"41c69d43fb3974bae58d9169aea3514221f70dc77bb7a35c79626dd3be01=
adf2","src/zlib/gzwrite.c":"c7454689751c8f41ec63a1381a0053fb149095abe1c3b89=
c8a996b2d7ac8adce","src/zlib/infback.c":"6a6cfe3d7e239d590692bc2664ac58d3ef=
92be30ff4cb3c6dbf5deed28f79eb5","src/zlib/inffast.c":"41d93aefdbfee54558091=
30af74fcc76cf7259b1aa8b34d0060d14e57463e8bb","src/zlib/inffast.h":"7d8c1c87=
3ce9bc346ad6005bb9d75cce5c6352aaf7395385be216a9452a34908","src/zlib/inffixe=
d.h":"237ba710f090e432b62ebf963bee8b302867e9691406b2d3f8ee89ee7bfef9b0","sr=
c/zlib/inflate.c":"f1679575fef1717d908dd09d7bfe8fff89c21941cadd7c255a2ccccf=
ba3a287e","src/zlib/inflate.h":"e8d4a51b07694bf48cb91979c19974cf6a5ab0b8a09=
d26ec0d14df349230673e","src/zlib/inftrees.c":"b9db40bbb68b63dccbcdfa78d6877=
51e33178af8669f1c1236309cfd5d2edc0e","src/zlib/inftrees.h":"44084a93673386d=
b6282dcb61d739c84518e10dff66d1c6850715137c827464c","src/zlib/make_vms.com":=
"14ed54bdd391c1648cedfb69d8a73a26dcc7f1187d59b0f18d944b7665cec85b","src/zli=
b/msdos/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bdffd2dac1003bee52d223a8489=
844870f20702","src/zlib/msdos/Makefile.dj2":"9208450c2ae6dcbfcc25560b5b9ca7=
63f461e7246e37b0552474edf8fa898906","src/zlib/msdos/Makefile.emx":"c749d6ec=
7f88e8e639d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d3d64","src/zlib/msdos/M=
akefile.msc":"0e021a6f42212415b060e4ad468eb415d0a8c1f343137fb9dff2cb8f9ead3=
027","src/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5a0520d0fbe4adee772bc07f=
e816002b07ccb43db3daa76a","src/zlib/nintendods/Makefile":"ea5823efe68301322=
94eddf2f56dbd7db8712244c210bb4968c431b1a91bd066","src/zlib/nintendods/READM=
E":"e362426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421716dc629a71aef95","src/=
zlib/old/Makefile.emx":"d811f032272aae50123a889297af3a02fbd60d1e42bbef11466=
462f627ff7b5b","src/zlib/old/Makefile.riscos":"d1a488b160fbfd53272b68a91328=
3a4be08ba9d490796b196dddb2ba535b41e0","src/zlib/old/README":"551a0f4d91fe0f=
827a31cbdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11","src/zlib/old/descrip.m=
ms":"8ff08c35c056df9c986f23c09cf8936db63ccf12c3c42f7d18a48b36f060cff7","src=
/zlib/old/os2/Makefile.os2":"6ad247c00f00ff42fd2d62555e86251cef06e407937824=
1b5f320c227507d51d","src/zlib/old/os2/zlib.def":"ea9c61876d2e20b67ef2d94959=
91a32798eb40d13ede95859a2f4f03b65b9b61","src/zlib/old/visual-basic.txt":"17=
27650acbde9a9e6aec9438896377e46a12699cca5d46c5399cef524dedc614","src/zlib/o=
s400/README400":"5eb702a0dd460e2bea59ee83014c3f975e892057850c639f793bb74004=
4a38ba","src/zlib/os400/bndsrc":"3c36a17975eed5a8d33bc5443b39fead1e68c01393=
496be9c1f4a61444bcb0f6","src/zlib/os400/make.sh":"143394d1e3876c61c29078c0e=
47310e726e1f5bd42739fe92df9ece65711655f","src/zlib/os400/zlib.inc":"dede389=
61ae2e7a2590343bf1ff558c6f51e46714dec33f2d11d8c34899b3875","src/zlib/qnx/pa=
ckage.qpg":"d521336be75bdd145281c6d166241905751ec97093ecd6fec97a313f631ac0e=
1","src/zlib/test/example.c":"64ae90d60b40a8aec4700e5c4e7a71898ebb92948b7a0=
7f939b3e763cb3e8b35","src/zlib/test/infcover.c":"f654f3fcc74b33bd95cda63d13=
fe0ce589bcfe965544e0c17ee597d75efbd090","src/zlib/test/minigzip.c":"f9777d1=
e8b337573e12daa8091dcf22e88a9b155fc0acad15b8224c377bfe027","src/zlib/treebu=
ild.xml":"89b50165782643554a38d5c58c203d9648b540e5a455531dcb58b5676a019955"=
,"src/zlib/trees.c":"b338f1ec9038bd77efc09c8fdb99ef27b5db5b3da9baa301e544ad=
c8e3b6a662","src/zlib/trees.h":"bb0a9d3ca88ee00c81adb7c636e73b97085f6ef1b52=
d6d58edbe2b6dc3adeb4d","src/zlib/uncompr.c":"7b3d8ca0f10ef7c74044c3172ca8f9=
f50389cd0f270ee4517f438e7e06be5623","src/zlib/watcom/watcom_f.mak":"7e039b9=
12f9cffaa40835281430bb284fa9042b0a0d12f6b34700a06bca6576e","src/zlib/watcom=
/watcom_l.mak":"d11b4064604a034725860e63e3f6d347056372e4b1675b183e20a93533b=
20cc9","src/zlib/win32/DLL_FAQ.txt":"9e00778319381e6275691dd3a89410c99065b8=
c0c5db96473abe8c859cbdefd8","src/zlib/win32/Makefile.bor":"7d73a0d2c3e38b7c=
610bbc9c22f683a4fe1ab9b8b65649a3a8ac4ff7fcc14ba6","src/zlib/win32/Makefile.=
gcc":"97140c30506a8f6b2edb6b3d8a1b6b539d7929d4b957deba9950301090f579bf","sr=
c/zlib/win32/Makefile.msc":"235529bd529d4690d5d4b7871fdd0a1f118f2fe18862cbd=
ec5f5ac674c55a60d","src/zlib/win32/README-WIN32.txt":"f414b3702f8d3bf1de42e=
0f41604bd78c44e537aae16b6107e3cdaa5759caa16","src/zlib/win32/VisualC.txt":"=
9ec0babd46eaa012371dee2d3a8a55d9c7130f7895512c3371c737e4a7f6a997","src/zlib=
/win32/zlib.def":"c00693a5c825f8bfbdb68124fd03cb2fa5269338071147bdaa14434aa=
f3962b9","src/zlib/win32/zlib1.rc":"54e161029b59e99a4f9cb2281b956f00ecfb181=
4318ddef9c741ff4f832c5c1d","src/zlib/zconf.h":"80e0a31a4c0e6f20d1bad0df9927=
1b9d535aa9f7c4e62f1a54f643adb4c6dfa2","src/zlib/zconf.h.cmakein":"bb12900d3=
9488e6a9ed67ebd7cf5599f3ced8937b7077d4d5001e470c7a1392e","src/zlib/zconf.h.=
in":"80e0a31a4c0e6f20d1bad0df99271b9d535aa9f7c4e62f1a54f643adb4c6dfa2","src=
/zlib/zlib.3":"aefd0162070fcb0379dc18e27b039253cd98c148104c1097dd60e0d0b435=
e564","src/zlib/zlib.3.pdf":"91343dffd2876dcf4af567f299ce99872b066232451093=
d6d12e02e4654873d8","src/zlib/zlib.h":"a980a0d104198a53cc220c51ab5856e5be90=
1bec8a2d02e0ee79a8754219dfed","src/zlib/zlib.map":"33e2a7c4defd6222945bb0f7=
191b6380afb4f518e804af86a44aad4a9090bf9e","src/zlib/zlib.pc.cmakein":"2f1d0=
b18ce37c2af415a469857f02aee2c41a58877aff21d29e9c6db32b55cb7","src/zlib/zlib=
.pc.in":"04c01cc2e1a0ed123518b5855f585c93a24526dd88982c414111ea1fc9f07997",=
"src/zlib/zlib2ansi":"b3f9c88abbdf16143e5d5110e44fff198bcda9ee1358e036c8d44=
5e9d0cbce85","src/zlib/zutil.c":"8108af451ad14271065844736ac7c436275b92826c=
319318070508d769371428","src/zlib/zutil.h":"cf94d865e3a9162c0571cba7f74c8f0=
1efbdca26b981d6cc9c545d4c3991e3c2"},"package":"56ee889ecc9568871456d42f603d=
6a0ce59ff328d291063a45cbdf0036baf6db"}
 \ No newline at end of file
-+{"files":{"Cargo.toml":"ce67ce7c1f3c4ad7832d58ed198b8dd745abacc620738d575=
c4b1a9ac9e79449","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379d464=
acb3408d4c599d3dc5fe4fa1b4c84f","README.md":"b23e18bdce29fabc3d34e88576219f=
50d1d735a355e427e6d6ebc09254138070","build.rs":"e034f7828ff43a0bb0f7b690e8e=
99b09b8f4e1ae0560b6fb4008006e9cd4d9dd","ci/Dockerfile":"4d479ea63b9e384b386=
4fa1204894bfae4890017d6bf03486274457fe2c26cf8","ci/run-docker.sh":"0ea7a4fd=
c9f6026110e20fa2e25dbadfc1e6dafed9ded5981ae36772ad207e26","ci/set_rust_vers=
ion.bash":"4284f86ac3923a73dd79e89bef2d0b136c6d104d6dae92e24b4a96eaffa28890=
","ci/test.bash":"73a936768549eedf96a7cddb350ada128e058d5d9004244ebf3d99336=
3b69599","src/lib.rs":"40476f4e896c936c21f908396255c7a4951ef8bf93788858ade6=
cace2539927b","src/smoke.c":"10607c81b73811bfcb9718767312bf97ba2ccf7048ea2f=
18a2085aa06ad7f91b","src/zlib-ng/CMakeLists.txt":"60b836817b51e5893b1e3203a=
daf57a98678af17957eccaef679bd96bcf5d90b","src/zlib-ng/FAQ.zlib":"d1777aa057=
caeef50fc291aac7a414363b2186bb3d65bb0f8bfa2bfd61cf0ad5","src/zlib-ng/INDEX.=
md":"989545e90d8e9ac149034f762ce78ed8976ebf9324326228dea37ca190154609","src=
/zlib-ng/LICENSE.md":"d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d97=
8ea77845436","src/zlib-ng/Makefile.in":"15027511a77e76b423eccf10ebfe66398ea=
96862cbce2415e5ebac7c7cbb6ab6","src/zlib-ng/PORTING.md":"5cff8c878c7958f6a4=
bada5a403dcc88961c9607826faece1aef202b5d95c550","src/zlib-ng/README.md":"9c=
ac4a98ecf45f50adf5030d4dc58b3cf9f3ae8e3ec78d30fdae4a99a2b4b8d9","src/zlib-n=
g/adler32.c":"82ffa1b4fc4b198ba8004135f79b8819d9f2b28e851c30c0ab41e6d32dfbf=
70d","src/zlib-ng/adler32_p.h":"f56915c59a345baf4558374447385a317e29365a4db=
2fbb38af4de3e1a1a0201","src/zlib-ng/arch/arm/Makefile.in":"95464884ba75a7b1=
2c9ceda5845d8d68d5a7d7dac8a8dc24b27beb2192e5b97b","src/zlib-ng/arch/arm/adl=
er32_neon.c":"3990b8d5570b12c2162218fe0e9bc723a03f1c89b5ed3ba70a74a98976260=
ee7","src/zlib-ng/arch/arm/arm.h":"855adbb02d7b9a5714a17d9dcff493610e7cd2b9=
a1f4e58e1c99626ab536e868","src/zlib-ng/arch/arm/armfeature.c":"dd09ad2712b0=
37e8d52173402f39cc2be1bc89d47fc10259ef81b4c64aef7110","src/zlib-ng/arch/arm=
/chunkset_neon.c":"65b70014888e9fbdb89bfbfa52f23b8953dc015466577da292d4780b=
55c5d95a","src/zlib-ng/arch/arm/crc32_acle.c":"5a96afc594697d1399870d1bfb06=
23a03869eff42caae74013f147cec4aa982e","src/zlib-ng/arch/arm/ctzl.h":"feb70d=
55e66025fff806e30e48002b35cfff79533d352585cfa5f118edbc90b1","src/zlib-ng/ar=
ch/arm/insert_string_acle.c":"d1b1dae5aeada70f2b03c2cbf3112ce55a92401c2d877=
09081b04dcf5992e1ad","src/zlib-ng/arch/arm/slide_neon.c":"19d8cf5c742ac6b82=
164c7a183538ad1129f9f17e9b8bce8b40daac3820fb6c4","src/zlib-ng/arch/generic/=
Makefile.in":"f41a34839986eac8dd52cf91fada0efff4171c059ab5d7db6347c91bd6d9d=
b09","src/zlib-ng/arch/power/Makefile.in":"69644d1a0ff8e7f38005c0a55cdbaf3f=
0d87f42abf8fc4f4136271c4fedfb846","src/zlib-ng/arch/power/adler32_power8.c"=
:"79b75e98ad3a62facbbdd8c0b178d3f993b57f6e34d320bf47eca33aa8c330a1","src/zl=
ib-ng/arch/power/power.c":"0647afb3b3b7ce2a19b4815ec8fdeee0b37c759413e5ef0a=
668a2dba22d94803","src/zlib-ng/arch/power/power.h":"f3f15f94fed98a2f7dd5d45=
68c5172e597228be4141d6895062703c3f70024da","src/zlib-ng/arch/power/slide_ha=
sh_power8.c":"932ea533d25e2f5478afe0c47830e7ef24276cad0d75fd91f2d8c799bd4b5=
d36","src/zlib-ng/arch/s390/Makefile.in":"eef6c3169723f089b0b5f852423ec55bf=
0364caeddd7cda991f2e76bc1682107","src/zlib-ng/arch/s390/README.md":"4f5018c=
b7c8ee217710a90193088889a15f1675d205a104140f6a1ac07ce412c","src/zlib-ng/arc=
h/s390/dfltcc_common.c":"6771ec4457da9f4b00c74bcc0828735e21c74b9162cb37383c=
297c3b5028cddf","src/zlib-ng/arch/s390/dfltcc_common.h":"ed339007feae58d187=
9e096addb30ed86cd5cf11222db22c45f48b47328cf6db","src/zlib-ng/arch/s390/dflt=
cc_deflate.c":"7b3dec7be4055c7748defc626dc91db99787c9f3b70b7d7b40282558bbb4=
78e9","src/zlib-ng/arch/s390/dfltcc_deflate.h":"c4c411f221cc0f6b218326e973f=
ef05c65840ba49878aff052dac0bb38121cbd","src/zlib-ng/arch/s390/dfltcc_detail=
.h":"01dbdfaf5e8ccf522663b4daa76e9138dde514292c35a623be4bcbbf4b82dea2","src=
/zlib-ng/arch/s390/dfltcc_inflate.c":"a96226eba3538d3904893cfe1b08395668e6a=
722b56f28d5b5debb3176161b4b","src/zlib-ng/arch/s390/dfltcc_inflate.h":"d7a4=
a5ae79abd1a5456521926b918becfe86c253a4fc23723fbc09f7c3303128","src/zlib-ng/=
arch/x86/INDEX.md":"c12f9bf0d66743a6472fb756bf46def8eea1dd235be7fca994dcb22=
f693a3524","src/zlib-ng/arch/x86/Makefile.in":"9f6fe7567a99e81aaa3bef8ccfa1=
ad40f524efc285cf8dfe0f497a1530f8016c","src/zlib-ng/arch/x86/adler32_avx.c":=
"99056732c7bd5d53dc108f282811a40bf21570926781af5dc7b17cb9218963de","src/zli=
b-ng/arch/x86/adler32_ssse3.c":"883a5520b4481225d097c90c5359106a3c8eb7b9214=
99c94276e999b7c39adc5","src/zlib-ng/arch/x86/chunkset_avx.c":"15060e7ee487f=
b1daef9be25343ae387392276933921e4b4db0c67831dc0854f","src/zlib-ng/arch/x86/=
chunkset_sse.c":"f7ccb55b67101ddb9def951a6d6f9dd4cb108fdd9e65f0f21d82723d1b=
093a22","src/zlib-ng/arch/x86/compare258_avx.c":"8b2838d168de4608327f25fe52=
d53763a82413ee911d87947d3fcd72c7f9bf26","src/zlib-ng/arch/x86/compare258_ss=
e.c":"b5049722ffd4a43a96868eeba5e000271cfc5fcbf3c2657026ead15b1df28a10","sr=
c/zlib-ng/arch/x86/crc_folding.c":"75199cdd06ec2f8f43bf38583b2c4d98bbbbd924=
e659267fdc1fa5134f1472eb","src/zlib-ng/arch/x86/crc_folding.h":"93921254661=
1917e9e066e8ed30cdda95680ec1f5fe0890cc4865b4e6d7fc215","src/zlib-ng/arch/x8=
6/insert_string_sse.c":"9e84a75b6a565422eb105261b6729d2a02b89133bd14372c949=
d5381b5deed3e","src/zlib-ng/arch/x86/slide_avx.c":"5e448e439ac24e7cb10eee17=
6ca37f2c63f73c135c0a2af040e232bad490997d","src/zlib-ng/arch/x86/slide_sse.c=
":"1946cabb634c905fddef0a22b2fad19dfd99110169567c3beceef71145b2e316","src/z=
lib-ng/arch/x86/x86.c":"1af56e27b2e951e1ad1344e62c2f7a8c49a776fcdd1cb0f4ea9=
d6152118a479e","src/zlib-ng/arch/x86/x86.h":"4d2d20ea0087089141e250e77bb3d4=
19954b9092810028b151581b9115a5fe8c","src/zlib-ng/chunkset.c":"c0dbc7abbdad5=
137a9efb2b0a76a212e77d4bf44beebe721c68359fa83002ff2","src/zlib-ng/chunkset_=
tpl.h":"35d15e97bd72d4e03dcec3ee804a08ea6a74faac2ef835caecc0e38bc9daf0c0","=
src/zlib-ng/cmake/detect-arch.c":"a9509327c2f4395955466b0acce453c29592d4686=
022714cb9e8b411d7e60c29","src/zlib-ng/cmake/detect-arch.cmake":"9cbb09b297f=
79e94b55fffb9acbafbee8d6761e854d818f1a0c686e3fcddf574","src/zlib-ng/cmake/d=
etect-coverage.cmake":"e4e372991ba80a16ad47df2716708a56013cc628aa7ed01573a2=
360c60610125","src/zlib-ng/cmake/detect-install-dirs.cmake":"87031a40428a10=
4f5cf38ecdb8a5028d8c679cfa772a58adde8380c809b34eff","src/zlib-ng/cmake/dete=
ct-sanitizer.cmake":"5e6fe6d2d877540811313f0c8e9884adb21a9ace2e24f23190f0fa=
c1d52dd2b8","src/zlib-ng/cmake/run-and-compare.cmake":"dc45eeb6d3e485404983=
4ec1ec2891342646c7fb803a0b6c2644d6316f89b668","src/zlib-ng/cmake/run-and-re=
direct.cmake":"2de9c784da3e04331465a3c56125b9c7d8e74b898b4cf85353aca196f90e=
a9bb","src/zlib-ng/cmake/test-compress.cmake":"3f37319963a80a31f752fca1c825=
71d552fd4701326bc40fdb02b54ec3f7a3f0","src/zlib-ng/cmake/test-tools.cmake":=
"4dcf099245085ee2b6d8ec41620bca3f7b718365dbb9bb0ad23931e83bf36aeb","src/zli=
b-ng/cmake/toolchain-aarch64.cmake":"8d7ba07ee1cb9fbc7817da1c5e74ce6c85ff81=
c10962a33941f0e24471956e59","src/zlib-ng/cmake/toolchain-arm.cmake":"0b0ab2=
b1093ef851c3dbd6fe53f855628df0778841a488aaef85d2c70f04a257","src/zlib-ng/cm=
ake/toolchain-mingw-i686.cmake":"6551576324fed6ccedffcfe8da762402dc863c20a2=
789a9b0030b9d32e15a15f","src/zlib-ng/cmake/toolchain-mingw-x86_64.cmake":"e=
c7bf5c8640fb61d2e30f8db7b588ca9b66da92d4a59e88ce16c5fc7f9ce02b6","src/zlib-=
ng/cmake/toolchain-powerpc.cmake":"6373abe883a99616aa51422a9b714894dc521211=
be49502463576f58d3d26b2a","src/zlib-ng/cmake/toolchain-powerpc64.cmake":"32=
8d1ea039a30e03ee9a552858b9f180b3da2614b712f618da1a0fa98f30a53b","src/zlib-n=
g/cmake/toolchain-powerpc64le.cmake":"ec90270bd1f4aa649abddddd2618168d399d5=
8a1c1c35b3d8d909e570eb9be1c","src/zlib-ng/cmake/toolchain-s390x.cmake":"cb6=
34252c21c4f55d06cdc49ce522a5546aae592daa0f12aa4282c0aef323828","src/zlib-ng=
/cmake/toolchain-sparc64.cmake":"d70d39760a23886ebd1c5a1a87651bfb47a9b24def=
9e7955ee1cbec60b40925b","src/zlib-ng/compare258.c":"56bfd48d5ff9ca422fbb728=
df7a373436c73796561dff118c7d4039fe70d29e2","src/zlib-ng/compress.c":"1abf5b=
13e3e805becc14f4f16dad9bf816f4fe41754b1abf75f670dcc84567cc","src/zlib-ng/co=
nfigure":"681d5b1303aab0523334c90ff049757e7ee6b2683f2411204b7245ba4adca4b2"=
,"src/zlib-ng/crc32.c":"98440be8a99381151a2d740f2e2228e8c1b23b9193c3642c52a=
4e34799506336","src/zlib-ng/crc32_comb.c":"78cd1a3d31963bfa5bd9d476250b2bb7=
777b12b6ebe0475acf021ca794757165","src/zlib-ng/crc32_comb_tbl.h":"d6615d209=
d6c7d5248c6f7fe4e5dbded13c0eb87997b37693032c2902927407d","src/zlib-ng/crc32=
_p.h":"1fa91375a18e090c0a0dfda39de3df36346a0b1be36c808be6b6c29c32eba922","s=
rc/zlib-ng/crc32_tbl.h":"d629378ba38ff5775095b64e277bcd41c4b89fab9b5647a9fb=
29e15da0db0161","src/zlib-ng/deflate.c":"1a5ff34bf68b88e30f578ce7b15dd996c0=
5fed7bf42f58f4616af470ee18f103","src/zlib-ng/deflate.h":"a074e9a5dd5d689db6=
3655251d6a0948e7a7c0c4a4f6d0ca60bfe18291f3c34f","src/zlib-ng/deflate_fast.c=
":"b3b261b3a02b089599fcd9448965ef5d8e8b0e8e9556857357c9632930c7c748","src/z=
lib-ng/deflate_medium.c":"1c3d95cbac76052d39595ea750c5536541c18302b9abb398c=
27b58955318bba8","src/zlib-ng/deflate_p.h":"95026b1b48aa78204381b32617dd44e=
8c820c9bb21b415ebfcb33e6b5255233e","src/zlib-ng/deflate_quick.c":"280905a19=
1d2b2a7274f2453ac537e01a0fb6e7540a0b212c1514bfb8c9415ea","src/zlib-ng/defla=
te_slow.c":"a2c66723e1e71ffd6ff856407459ab311a4c6546ecf50285081fc7afcd0ccd2=
e","src/zlib-ng/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95aab=
b08e28c30c52bae3e8c4bd5ad","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c984657bf=
26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc1951.t=
xt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src=
/zlib-ng/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4de=
e21bd7e03ec9af67","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d380549=
a330e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builtins.h":=
"f07e83c5c444554577c4240ff7722057ea2a689f6baa0f9e8bda32b9a46888ca","src/zli=
b-ng/functable.c":"d3747a4674ddbc903ab1d06efe63a1c4b52bf42f7dd38cde3701fa82=
b1d953f0","src/zlib-ng/functable.h":"e5a2d0c10411d23f04295bcb9ddb9889388974=
b723caef65aa5c4ea4739f4aa7","src/zlib-ng/gzguts.h":"cbf2afc8a6183002254a73c=
abe8376e54b1aea2ba042e36138f292c9cdb95d5c","src/zlib-ng/gzlib.c":"5b5bea4f3=
19e5d0a96b92aa431fb33926686cd20686c90d75e42e1481872bbcf","src/zlib-ng/gzrea=
d.c":"fc4a187ba45ceb7b4b50f4f8dedc7685fe8687e6f034638a6437bebf71d51a13","sr=
c/zlib-ng/gzwrite.c":"7c86058ae23f856c099e2663a5676c97cfa4fb5df9b92893c9407=
6ba4aa9a56b","src/zlib-ng/infback.c":"97a35de1a3d3bec50e112853e03bf1628cbed=
3b0fb84459cc423e3f9f61fbea7","src/zlib-ng/inffast.c":"701519ee11d39cdf4e808=
395722415c42ff2be9445f66408fd879370f3242b57","src/zlib-ng/inffast.h":"42e74=
a92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zlib-ng/i=
nffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd52187f3=
64314","src/zlib-ng/inflate.c":"a665bf717ee257a16a8ab993241f2cf9e71d49882ad=
dddb9518b88186f82a5cf","src/zlib-ng/inflate.h":"eb25527d1bdedaa45167926dce4=
c39d9aaa3147b0f4a95f38f5916528c30a09b","src/zlib-ng/inflate_p.h":"4a94c5119=
4da119770cf662ef289994f0c78d95184d54d6ae5d50a393e8f5a62","src/zlib-ng/inftr=
ees.c":"d1d88f98f9129c87f3ce1d6de5bea3ec867de23b1b2bdd585257d231aac82a4f","=
src/zlib-ng/inftrees.h":"624c6653a454447c6274adf922430a19c96ef73c7687e4559d=
247ff48970bab5","src/zlib-ng/insert_string.c":"aa22ba53a1e75821499809277f9c=
a0e5ef92b07a618136dd11ae1734e233b7c9","src/zlib-ng/insert_string_tpl.h":"1c=
eba9903324d10aad6e1d83653c4d534a5b06fd09076414a06215482be00bac","src/zlib-n=
g/match_tpl.h":"eeab4c6eea8511a7579738e622af062ad16f4016312e93ad34bc5903d8b=
3c4a1","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057ce3496a=
ceaccd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2003-0107.c":=
"1bfbc88dc501cd92b8b26bd8944af6b150b376ebfe7241d90e2b93109be3d68c","src/zli=
b-ng/test/CVE-2004-0797/test.gz":"38caae524705f676bde13a8df9fc8c7d2fe105ba6=
bdbab62a405b0276fd3aa2e","src/zlib-ng/test/CVE-2005-1849/test.gz":"e4d5a606=
17df4b5dd44eda94751ce1eacdb325792bba6e3cc4676719a3adf742","src/zlib-ng/test=
/CVE-2005-2096/test.gz":"8f702d4861aa3ec98ac03a59ff26b430939630cb5cd4266d26=
58d3b836d576f9","src/zlib-ng/test/GH-361/test.txt":"358497d0a7251ea42101dc7=
7b02337f46fd89af09643a8288e2a3082e5d24128","src/zlib-ng/test/GH-364/test.bi=
n":"af5570f5a1810b7af78caf4bc70a660f0df51e42baf91d4de5b2328de0e83dfc","src/=
zlib-ng/test/GH-382/defneg3.dat":"b22bef6b7392401c9e7b079402c4a4074053d7a91=
4d050400e37fd7af6fe26d5","src/zlib-ng/test/GH-751/test.txt":"b83d833803b7bc=
3124fb2a0034081f0b999ad10c33a8dfa3bfd181dc078ae3ee","src/zlib-ng/test/Makef=
ile.in":"c3b6a1ec62838c140a78bc361448d5739756bbfa3bbbf1ffa64c342599949701",=
"src/zlib-ng/test/README.md":"fc485cfaaede6b3d3dc61fdd17cc7eee715c35d6f62e6=
e502f9251fd1b5edac9","src/zlib-ng/test/abi/ignore":"02aa87f77656dbc1fbddd23=
f436cd15465a92df0722da4055cae1bc8bf013097","src/zlib-ng/test/abi/zlib-v1.2.=
11-arm-linux-gnueabihf.abi":"f5e91f25b558a891fecbeb6e2e9575698630ab700d055a=
38f3bc4fe66257f513","src/zlib-ng/test/abi/zlib-v1.2.11-x86_64-linux-gnu.abi=
":"038337383cf780587d810cf5400d632f3a1f8517e63ac4a71b6e5224db8b1413","src/z=
lib-ng/test/abicheck.md":"fa5d6d33ff0fd95eefb7c6c0c7f67351282e6eda20c4e3884=
2235a610cc10382","src/zlib-ng/test/abicheck.sh":"b23ee3678acb24caf36fc8402a=
07452de73c50640ebe641f185c7f9d5ea257e7","src/zlib-ng/test/adler32_test.c":"=
db3e8ad9a4e2ecce0c052b0bfe19834d3ff2fb2e9239cc3438a2c95db00b1d21","src/zlib=
-ng/test/data/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d6d=
74364150e255f126512","src/zlib-ng/test/data/lcet10.txt":"938e69e61b3411d8a9=
e2e630f4265000d810f3dbf66bac58cac19493753526ec","src/zlib-ng/test/data/pape=
r-100k.pdf":"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e4484=
9b","src/zlib-ng/test/deflate_quick_bi_valid.c":"0e00da0e048c46204c39aff4b8=
fb79890274d3c6183a9409aefd5c93e4e92a48","src/zlib-ng/test/deflate_quick_blo=
ck_open.c":"455bd347bb88debdfacb409846170274991ec9ba71c52b8fd0e526daf57265e=
b","src/zlib-ng/test/example.c":"8bfad1221a8df5b6202e11f6be4bae5dbccd8a24fb=
7bbd8dd88e7ecd318907e7","src/zlib-ng/test/fuzz/checksum_fuzzer.c":"3a15479f=
2cb40b6c5760dadb246328fab7315f3e3b8e28c1bc246c9b9a867c69","src/zlib-ng/test=
/fuzz/compress_fuzzer.c":"1ab70608075c4bc60f89aa2f327cff88362ee7b1d31da88ed=
54ca51e5f99e5c9","src/zlib-ng/test/fuzz/example_dict_fuzzer.c":"04262105305=
0f0fde90a0428cd1afabda8cc7c3fa59e3e0a55c43ab1e03d3988","src/zlib-ng/test/fu=
zz/example_flush_fuzzer.c":"f12246a184dcfe0a19a98cdc742a1fe8da388ad20b40663=
5d63f1fa10d45b9ca","src/zlib-ng/test/fuzz/example_large_fuzzer.c":"f490abcd=
332fb4e7921292adf6876d38d7f71c8d2443212c781ba88957ff9303","src/zlib-ng/test=
/fuzz/example_small_fuzzer.c":"a9b3436b291ace821b6013311a1100e19a9e1c67fefd=
3f97dbd60688f9bf22b1","src/zlib-ng/test/fuzz/minigzip_fuzzer.c":"7b0e7da9b6=
c60f3b3a13f140cc445050d9e8958d4f59cbb9a498c08f3a53adab","src/zlib-ng/test/f=
uzz/standalone_fuzz_target_runner.c":"306e8ac4e08ea72d18ffae8c908abfef8c6fe=
edf83b068a7ec675ade6a5791a8","src/zlib-ng/test/hash_head_0.c":"d88105a80e75=
6b7206a20c7b2490a2e7e743a2ceb1f20d3e433ce9848f054e1b","src/zlib-ng/test/inf=
cover.c":"b9acffc102fdd140941073ca47e30c938aa937b4929061500c36ffba12c86449"=
,"src/zlib-ng/test/minideflate.c":"93de8ffcbe7c414abf3ea36acdf729bcedb40393=
ec7bd10b356ebe225406e173","src/zlib-ng/test/minigzip.c":"291e2ea30778a3e829=
b96cb47211e89494ece036cd74591178710b4276c9b48f","src/zlib-ng/test/pkgcheck.=
sh":"75b3155125f235e27ee434d76b6f72bd825899b55f6d59ef2d032fe67a2896ed","src=
/zlib-ng/test/switchlevels.c":"c30ae3d27ce6041934532553719622e7ed473541aa7b=
dad8d11d0c55e5220f14","src/zlib-ng/test/testCVEinputs.sh":"5de6198444c16726=
f8e0a8f2beb5b89c5ae7e7e3736ce760b9fbc719493e7e4f","src/zlib-ng/tools/codeco=
v-upload.sh":"ec7a8f1405820810e486e3d7e2fda7eb958c17877b0000b93abdf09d87732=
a2f","src/zlib-ng/tools/config.sub":"32186cfeb5db62c99e1dfbfb07f24c1a509774=
47b4c26d2907021c74422a70d2","src/zlib-ng/tools/makecrct.c":"55c8f7b8e29393e=
95988a29de8cb1a1bdf2738a69d53627bd0f9d7bf169bf0a8","src/zlib-ng/tools/makef=
ixed.c":"bffd02540231304f9bcc755b8cb9ae5cfbc48975857bbb4547f1d6acce21ef57",=
"src/zlib-ng/tools/maketrees.c":"2dbfe34691dde327618be496b380fc91daaa304743=
52815773a8b70114b0541a","src/zlib-ng/trees.c":"956ce5b3f3330320cb5baadbf772=
1572259ec41edc4d8c132a20888b7f6f60c3","src/zlib-ng/trees.h":"24174f3543b01e=
e1ef370bbf6d15551a21871cded18b2aadf09a71e7904b6f99","src/zlib-ng/trees_emit=
.h":"f68904e04caee0482c72ea92cc775cabe35a0bf7cffce85566c15ace27666af4","src=
/zlib-ng/trees_tbl.h":"35f4fd0ec080c1ade342e2dd1b0f5cdc7e9f18990faa48d7a8a6=
9bc318ebe607","src/zlib-ng/uncompr.c":"4ebb486b27930f8a6ec4a3cc90a207d0bcf8=
a4779d1dbf3b2184a2b2a5735cd1","src/zlib-ng/win32/DLL_FAQ.txt":"d2ec63cb4a51=
886e0813f75bca49a051bede364d855f938e1a7992ab97a79800","src/zlib-ng/win32/Ma=
kefile.a64":"775d6902373d1583430b5d7467f001746be323610c89be27e02bbfe0205994=
f3","src/zlib-ng/win32/Makefile.arm":"7535e022f482920c3fa7a267e84e39ad790d1=
50f72e5c30414baa156c2fdd9b6","src/zlib-ng/win32/Makefile.msc":"deee44d56248=
90e692d87db311216075e967c3ac8aeea6ffcdcac3d03eea260b","src/zlib-ng/win32/RE=
ADME-WIN32.txt":"a8c2d052960b963a49cee5a2ad891f2ff7b34db038f00985eba4eefc99=
966261","src/zlib-ng/win32/zlib-ng.def":"f240276caf805a10d024fc6a66efe915c4=
35734c69732818d92fb04d08ab350c","src/zlib-ng/win32/zlib-ng1.rc":"b567a27640=
7998bae40aacd48a50beba87c0bfbae470d28e66331ac99eb575c8","src/zlib-ng/win32/=
zlib.def":"d9c371ff2677567350386441a2e3d0258010d6502290bbac5ac42ea168bd5212=
","src/zlib-ng/win32/zlib1.rc":"d7f269379144d65bcd1b67c1065e5d4120579f14ce5=
4ecf246eaba394fa989a5","src/zlib-ng/win32/zlibcompat.def":"73728b9df4379dc7=
0ebd9b2a9f20d6e4ed7c031fa1f351cdeae1de7d1db05bd1","src/zlib-ng/zbuild.h":"f=
73424f5f10370ffe8f45f6e3dc52dd095ea778153832461d712a838e3a01098","src/zlib-=
ng/zconf-ng.h.in":"708106f26c4a0d877e2ea644320a2b48b144524b61429c7490e2e742=
a0c0c1e4","src/zlib-ng/zconf.h.in":"dacec2360fd9607f85bdf651409fa3831dd26f7=
4414d242e812b06c3b9c9926d","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b097d3=
18500f27daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h":"7a15bda=
0297b2611da695f895cc57ce44c284b030fe98817281e868a1a86ae35","src/zlib-ng/zli=
b-ng.map":"e8202981574d814cb2a9f06bca7900d0959c24766bd86681bd3843ab0e71f8ef=
","src/zlib-ng/zlib.h":"703bead0c02381c8df8d14d805fde913973b2960811f35e2de4=
f4aaf29ad905c","src/zlib-ng/zlib.map":"e3549810f821d433d57f921ca2fceb867457=
4f778485255a7dc691bf26b5281b","src/zlib-ng/zlib.pc.cmakein":"17668e07edbe59=
71043bea26a2f2b92c4c7cf4724620f1156f3ea1436d2aac93","src/zlib-ng/zlib.pc.in=
":"cf94c9aa44878a62e27c2f75354c08326b3bb5250a9b11496855cf59691177bb","src/z=
lib-ng/zutil.c":"7544aa2d2cfce4693d4e2a639f0631c3e8b3e7d0d846313be0e250c477=
e6812c","src/zlib-ng/zutil.h":"c0e9152d078ca1774c93910fd84531b2f593b3a6b103=
5e4d97a0d28b720ec98b","src/zlib-ng/zutil_p.h":"1e5a2fb8d15212ad094e9a5d5f60=
7f11f8191498b54e0af48d722f92d9c71ffd","src/zlib/CMakeLists.txt":"b87275731c=
c3ebdfea144187875cea204f555c343279c0f35f2d46d661bfe34a","src/zlib/ChangeLog=
":"4c9f1a65b9b4be8bf164a97775ef50e4db4e02ea8c9933fdbe629a640691375e","src/z=
lib/FAQ":"1e8a0078be0ff1b60d57561a9e4a8cad72892318a8831946cba1abd30d65521c"=
,"src/zlib/INDEX":"3b4e325d47ae66456d43fcf143ba21ab67a02a4f81be7ef2da480ba3=
0d774266","src/zlib/Makefile":"ef23b08ce01239843f1ded3f373bfc432627a477d62f=
945cbf63b2ac03db118a","src/zlib/Makefile.in":"5021b2bac4164f48b17c91c8a2e3c=
225be7ad31d8bfab1bbaadd90370afe9991","src/zlib/README":"7960b6b1cc63e619abb=
77acaea5427159605afee8c8b362664f4effc7d7f7d15","src/zlib/adler32.c":"d7f1b6=
e44fee20ab41cef1d650776a039a2348935eb96bcbd294a4096139be3a","src/zlib/amiga=
/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd9dc53d91ed78bbe495e94ccc84ddd423=
edf1f","src/zlib/amiga/Makefile.sas":"0e63cf88b505a1a04327bb666af3a985c5e11=
835c0c00aed4058c0dcc315d60e","src/zlib/compress.c":"5c11e1fc22e219cb986f6fa=
9e4ba939315227e84aef042737d38ec668b89b6d2","src/zlib/configure":"86b38f27f3=
1d2fec76d9355872550dc63cb3949774473fd6313c5a3fd1def0e2","src/zlib/contrib/R=
EADME.contrib":"ca39b78bd7ad84f1df7b0da90770c5b3fa4c8e2c75d132e9222812fac88=
39630","src/zlib/contrib/ada/buffer_demo.adb":"469cf566a6965767fee6b987a239=
ed8cedcc66614940d45a9b434331fbb435ce","src/zlib/contrib/ada/mtest.adb":"41b=
6f31684770334afdc4375871eb1408542f37a823a073556fdbfdb63753160","src/zlib/co=
ntrib/ada/read.adb":"fa5b989aef0c5715a3fcb15de93985f7f10aeb0a7f5716745c95ed=
820eb9af9c","src/zlib/contrib/ada/readme.txt":"8fe9e5303f2e8e8b746c78250e74=
b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/zlib/contrib/ada/test.adb":"5e3a=
be79b387e09a9a42bd0543105e228f39a335240cffc33d71f0ba66ff2511","src/zlib/con=
trib/ada/zlib-streams.adb":"f45988e2bac76eb25a0dc981f46576e7432c35dde1790bb=
c2b650f0090b7fa72","src/zlib/contrib/ada/zlib-streams.ads":"969e8edb0611810=
fb52159dcb7c40228f4e5da810a7a3576b778116a93038c6b","src/zlib/contrib/ada/zl=
ib-thin.adb":"03d89244ee5ec9771d9b5050e586c609f851af551b2e64eb151f1d5be0b63=
ae9","src/zlib/contrib/ada/zlib-thin.ads":"631ef170bde16c3ca8d412b54a0e5198=
15b80197d208f8f393e6fe017bb0968e","src/zlib/contrib/ada/zlib.adb":"c9ca5dc3=
4fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e12421323ab672c","src/zlib/contrib=
/ada/zlib.ads":"02634bec0d5e4c69d8d2859124380074a57de8d8bd928398379bfacc514=
236d2","src/zlib/contrib/ada/zlib.gpr":"859bb69dce38dbe9dca06753cf7ae7bd16d=
48f4fece8b87582dab8e30681d3de","src/zlib/contrib/amd64/amd64-match.S":"1660=
07f7e9adb58fe8b83d85bbfe823f5e05858ba1d06edf637b78886caa2c69","src/zlib/con=
trib/asm686/README.686":"c21cc7147c956ecae17dd084cb41a206b086216fa521012871=
fb07fafd203c6d","src/zlib/contrib/asm686/match.S":"873799062495629f21cd3f77=
9ea4b927add7aae0144e32d3594d9ce70185e99d","src/zlib/contrib/blast/Makefile"=
:"17d5d26c24bf51cad51045a38ffb73cc3539d29e89885aa249fcfd45a8659d5c","src/zl=
ib/contrib/blast/README":"baa763ae03d88ef7ece6eb80d9a099b43d0b57639d6d281e1=
c7c6ca79d81daba","src/zlib/contrib/blast/blast.c":"1ab3e479d342bfc144167b80=
8fb00142264bc50f24a110ca88cc774e351c218e","src/zlib/contrib/blast/blast.h":=
"4d4e3e6f893316f0be77bfd642c857a77f1fa2925acb5df9753e543d35aa3a6a","src/zli=
b/contrib/blast/test.pk":"5f5c262c545574a5c221132d5ef832478d222d70b01534179=
5b3860204140d7c","src/zlib/contrib/blast/test.txt":"9679b2c98e1283222d0782b=
25a1c198dc64ba9ebd1addd6dc6f643a45947cda3","src/zlib/contrib/delphi/ZLib.pa=
s":"1b20e173443a68c189cdaa4795620fb1ac165d9e61a27a1ed2cf690f13530d6f","src/=
zlib/contrib/delphi/ZLibConst.pas":"84bcc580bdf397e570f86f3f5a5b8c7bf537828=
f30b4b72648b81911f6bf5095","src/zlib/contrib/delphi/readme.txt":"f7420ed2de=
77d4b498eefbbe6402a1d17dc2d411735289c78a265c7f10fdaee5","src/zlib/contrib/d=
elphi/zlibd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b7226988=
776f8d511","src/zlib/contrib/dotzlib/DotZLib.build":"b96137097669644ecb9f42=
cdd3399d1fce9c512788374609303f7e50abf597f0","src/zlib/contrib/dotzlib/DotZL=
ib.chm":"20d0e3edd57f849143255a7f0df1cd59d41db464a72c0d5ab42846438a729579",=
"src/zlib/contrib/dotzlib/DotZLib.sln":"a979198c5b8d144c1ac8f993bfb6f4085d1=
35aa58ca9dcf63ebabf52b5c695f7","src/zlib/contrib/dotzlib/DotZLib/AssemblyIn=
fo.cs":"314afcfb339ea95f5431047b7ab24631b11c3532c7ce5dc2094ed0cf80a7c16d","=
src/zlib/contrib/dotzlib/DotZLib/ChecksumImpl.cs":"e7c047a2c3bcf88d3d002ee3=
d2d05af414acf53cb4451efacc0f2e95a474ea0f","src/zlib/contrib/dotzlib/DotZLib=
/CircularBuffer.cs":"be84c9736fe7bdc2bfae70466d8fff582504e928d5b5e110fd7580=
90090c8cb7","src/zlib/contrib/dotzlib/DotZLib/CodecBase.cs":"259bdda1b7d605=
2134e631fa24bfd9dca6e2362563496c8b85257b56c848908c","src/zlib/contrib/dotzl=
ib/DotZLib/Deflater.cs":"06ba6696a3c15c53ba5fd5a1c2bf50b51f217010228fc1e4c8=
495ee578f480de","src/zlib/contrib/dotzlib/DotZLib/DotZLib.cs":"9837fe993fd6=
31233cc5e53ff084d86754b97f05ec77c54b0764c2706f186134","src/zlib/contrib/dot=
zlib/DotZLib/DotZLib.csproj":"21606db31dfef6410dd438b73f1db68856eacabcce6c0=
f0411fc4f17e17001f3","src/zlib/contrib/dotzlib/DotZLib/GZipStream.cs":"8d1d=
e9755c77046b4ac71340a0a54434ebf4fd11b085c44454d7663a9b4df1c5","src/zlib/con=
trib/dotzlib/DotZLib/Inflater.cs":"9016ca73818f5b6a28791abc3af6da7c4d2773b6=
a3804f593f6d5737a62b99ad","src/zlib/contrib/dotzlib/DotZLib/UnitTests.cs":"=
ad66ac08de34d253e9615b96a745f3dfeda93f4a978d65d5d3ddb9d0d9b3e099","src/zlib=
/contrib/dotzlib/LICENSE_1_0.txt":"36266a8fd073568394cb81cdb2b124f7fdae2c64=
c1a7ed09db34b4d22efa2951","src/zlib/contrib/dotzlib/readme.txt":"d04972a91b=
1563fb4b7acab4b9ff2b84e57368953cc0596d5f5ea17d97315fd0","src/zlib/contrib/g=
cc_gvmat64/gvmat64.S":"22ff411b8b1d1b04aeaa8418b68245400267dc43c6f44104f6cc=
d37f0daee89f","src/zlib/contrib/infback9/README":"890288f02bb3b1f9cc654b87a=
07fcea695f90f6b9bd672d25bf6be1da2ec1688","src/zlib/contrib/infback9/infback=
9.c":"0a715c85a1ce3bb8b5a18d60941ffabc0186a886bcc66ba2ee0c4115a8e274e9","sr=
c/zlib/contrib/infback9/infback9.h":"dda2302f28157fe43a6143f84802af17403935=
72c2766559593996fd7a5a3245","src/zlib/contrib/infback9/inffix9.h":"84a2ba47=
27767c18af6505f0e81d9c814489c8b9ed330a25dad433db72997e43","src/zlib/contrib=
/infback9/inflate9.h":"32a907676cc36e27d0fdc0d99adb83a0b23f20ab61896269216d=
40fecf08d349","src/zlib/contrib/infback9/inftree9.c":"0c7f10396703b230c5042=
07fe1595a2f2f8ba9c43158c4bd79d5b22ca36e04e0","src/zlib/contrib/infback9/inf=
tree9.h":"8ae61d52e50d2dbdb0378548ecc54fcd88f108c8b6fc30562a3ebec1ca6a599e"=
,"src/zlib/contrib/inflate86/inffas86.c":"6f266f3c7e0faca653256d0189c0f00d7=
dc0b062d02e25df4e1202e49369595c","src/zlib/contrib/inflate86/inffast.S":"70=
777bd21526680005fc34f086d108af49e2668ad86d1749e8e8100a81bfb288","src/zlib/c=
ontrib/iostream/test.cpp":"0f3c77e013949eb9c91e6b690ea894e19d97944d6b0885b8=
2806fc3ad99680cf","src/zlib/contrib/iostream/zfstream.cpp":"8ebb9b3d521cc33=
92953f27658cf1f6dcb763216079f69a1518ec5ca0e42a63b","src/zlib/contrib/iostre=
am/zfstream.h":"4369c35e66f63f52ca4a5e1759bf720507ccabb8f3f132e2f18e68686c8=
12401","src/zlib/contrib/iostream2/zstream.h":"d0343e0c57ff58008b6f29643d28=
9c72713aa2d653fe3dcd2e939fc77e7e20b6","src/zlib/contrib/iostream2/zstream_t=
est.cpp":"f789df183cc58b78751985466380c656308490a9036eb48a7ef79704c3d3f229"=
,"src/zlib/contrib/iostream3/README":"43ec48ecbd95a8c45db20b107fac73b740bb1=
1595a4737329188f06b713972cc","src/zlib/contrib/iostream3/TODO":"af5ebc83fb8=
8f69706c8af896733784753dead147687e1c046f410c0997fd88b","src/zlib/contrib/io=
stream3/test.cc":"8e17fc48dfdbc6e268838b8b427491b5843b6d18bc97caa6924de9fad=
7abe3da","src/zlib/contrib/iostream3/zfstream.cc":"8cdd67ed0b13c192c11e5ea9=
0e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","src/zlib/contrib/iostream3/zfstr=
eam.h":"1bd74778fac45ee090dfc0f182a23e8a849152deb630606884b2635987b357b1","=
src/zlib/contrib/masmx64/bld_ml64.bat":"1c0561908a07ebdff271b12ed757241e181=
3d3db0f3551501b2595c23f0833aa","src/zlib/contrib/masmx64/gvmat64.asm":"390c=
1e6d63cb615b5ba042842738953f9cdc688b2fe35aaca981fd3fae213f3f","src/zlib/con=
trib/masmx64/inffas8664.c":"f6c585e43e6e524107566b1f10104949d0ef902159ac820=
3e1d98e50d4bedd62","src/zlib/contrib/masmx64/inffasx64.asm":"8448d0041fe6e8=
f4188fe5916181a1b274c6d35d75cfb28da60cf4f1edde44ec","src/zlib/contrib/masmx=
64/readme.txt":"9bb66b5028100855683853f12da0be479c7bccf74365fdbf37da2542edf=
f9927","src/zlib/contrib/masmx86/bld_ml32.bat":"b0b05b62715d4a81a7db5b7ca4a=
372d109ec95634c9d3bef9e0041ff52de22fc","src/zlib/contrib/masmx86/inffas32.a=
sm":"78d2cc88f8ed0e32ef960efc987c257bc1688afe7d031a8ba18761e95a6a7c3f","src=
/zlib/contrib/masmx86/match686.asm":"9e9bea3b5517b089da7d39caded07982746a33=
f94f0907ca7e8afefed7be36b6","src/zlib/contrib/masmx86/readme.txt":"1f29a04e=
0227b74e20ba1b7c764b3ca5bf596dd2c06e89bc19a05fb8f9689778","src/zlib/contrib=
/minizip/Makefile":"087034de3dc0223b29e64bb3a4fc3eda7b948e93d2a9ff154aecf9f=
ed2a1eb5b","src/zlib/contrib/minizip/Makefile.am":"2313a3480a2c3745fa7ce216=
829cd0367058907d3a0902e5832c66c84a2fdfc6","src/zlib/contrib/minizip/MiniZip=
64_Changes.txt":"302c62b328647f5472fb7755249a83459be7f8ffb1fae07e8ba318fce8=
f4126c","src/zlib/contrib/minizip/MiniZip64_info.txt":"122719c32ef1763a5f6b=
a9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac3","src/zlib/contrib/minizip/con=
figure.ac":"35330dc0c6188127afd339829d91b19739d23bf3b7301bfb04f775a6fcbbdad=
7","src/zlib/contrib/minizip/crypt.h":"8e872b60255b8447da99885c7159c2e1f1bb=
8143523bdbe71784e60f98bfd67b","src/zlib/contrib/minizip/ioapi.c":"66b39c270=
42f6ad12cc12efb0c82cdf100c6640b5fa959b8b866e252966113a9","src/zlib/contrib/=
minizip/ioapi.h":"8655408534b78dc0889a45f9359fc6d2d5c8e8d8443b81ede596f954c=
720ef48","src/zlib/contrib/minizip/iowin32.c":"2c05bc374d3d847c6a9f29eac9d6=
74abba7659d1e91e34e172248fcb5c274d51","src/zlib/contrib/minizip/iowin32.h":=
"586f22b9c3c64da253ce2b518e0fad61f19a7b47b289fc704cc9708242294c49","src/zli=
b/contrib/minizip/make_vms.com":"65736d9c4888f2373d3db0a13864d150c5040453f5=
bc2a5c8784379a7ea67590","src/zlib/contrib/minizip/miniunz.c":"ced49f20c6253=
6a8ffb270b35cfa4994a1dcdce45f8cf059b941c94ca0022666","src/zlib/contrib/mini=
zip/miniunzip.1":"66d8684392167091ef0fe01598d6a0daa26e7e448e2df6c3cb2574877=
35b83f7","src/zlib/contrib/minizip/minizip.1":"5404596e8e5587a52f563906119f=
32ceee30a6d97a966afa5c7afbe4d373e210","src/zlib/contrib/minizip/minizip.c":=
"fdfcf83979ef2324c1455d369e8add8678c804939d412ce53f8b024578ceabad","src/zli=
b/contrib/minizip/minizip.pc.in":"8b6670b42d8e5e519e1cc89db093efc07ba23cb1d=
dfedd3c93ff2df08c3ce8ac","src/zlib/contrib/minizip/mztools.c":"cd887c4af6d2=
0823bd15f24008b10acf01969b4165d7848656bde843a92428d7","src/zlib/contrib/min=
izip/mztools.h":"6f82c52279e8f79165f4446be652e5741a49992ac58632470335aa34c5=
64072a","src/zlib/contrib/minizip/unzip.c":"497adf676b1cae2a7afa834e4aba863=
83f7b697f5fdd03a8179ea9024a431cf9","src/zlib/contrib/minizip/unzip.h":"d8dc=
58fc0121b6a4b98f3028205bb253f956b1ddf791e9ced3cf44892502a01f","src/zlib/con=
trib/minizip/zip.c":"00f403cb7810578b4b2687dd55fb132c850c3630fba2f3704a8ab8=
96fcc8209a","src/zlib/contrib/minizip/zip.h":"96163fc140e4bf08752e014d20a1e=
ac3f5adcdc408366f6d79c1895f2599cf08","src/zlib/contrib/pascal/example.pas":=
"d842d456ecb6ff80e34cee2da31deb2072cc69ca837497bea8b8bee203403474","src/zli=
b/contrib/pascal/readme.txt":"02f997c37991ddae0cb986039f7b4f6fc816b3fd0ffd3=
32cad371d04c12cf1b9","src/zlib/contrib/pascal/zlibd32.mak":"850e91b6c9ea05d=
e61a411cbda16fa0f10118cd88bb32c4b7226988776f8d511","src/zlib/contrib/pascal=
/zlibpas.pas":"28b90aeeb3da8d1f6a98ab9f5f1603d08aba5bfabc50827d3f15e661268a=
51cf","src/zlib/contrib/puff/Makefile":"d9d738030464aaae354196c14fd928adf59=
1832fce7d71ac1977c1d8d4923a4b","src/zlib/contrib/puff/README":"aceca4bc1bce=
7d9445b8bc9b6640c672d95708185f6070d3a3baae7a9d102caf","src/zlib/contrib/puf=
f/puff.c":"6d0eef92e115a42e570b79d8b07a04af5ccbd6b3f3fbca9cbc61c49db9c9df43=
","src/zlib/contrib/puff/puff.h":"969b7be2a930db0cdcb19b0e5b29ae6741f5a8f66=
3b6dba6d647e12ec60cfa8e","src/zlib/contrib/puff/pufftest.c":"8ee0da78a1221a=
3c2036e22eed06c2faa27a671a46565a60e10111d4ee9c30ee","src/zlib/contrib/puff/=
zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8eddd10223b23554299455c6c9be71b653a=
3","src/zlib/contrib/testzlib/testzlib.c":"c6c37b35c6ecc9986a9041f86d879cc3=
7a9e4d8315af9d725071eb3b2cade0c5","src/zlib/contrib/testzlib/testzlib.txt":=
"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad58dab3ca78ef55b7d0dc577","src/zli=
b/contrib/untgz/Makefile":"8f5ab1564813e091cea8f1bb63da32fd80ac763d029277b0=
cabf50f60aceefe1","src/zlib/contrib/untgz/Makefile.msc":"d0f537de11d9e0e36e=
2a98b3971c537265f4b533b4c48797094365ad9ae8388b","src/zlib/contrib/untgz/unt=
gz.c":"9a12d774301d252dcd38bba07ac369319da4c04c4fef8a50fcbf40aebf29c2a1","s=
rc/zlib/contrib/vstudio/readme.txt":"2a9ca40b68274f4d37649dfab9e5e867a00088=
3592b4ab8fdaec8425a63052c3","src/zlib/contrib/vstudio/vc10/miniunz.vcxproj"=
:"dd607d43c64581172c20c22112821924dfe862f56b2e5eb8780bdd0714d9527b","src/zl=
ib/contrib/vstudio/vc10/miniunz.vcxproj.filters":"c3db9f97952683e688ad83c13=
bb94c816ac3e6b5f277fdea545b0650c125aa6d","src/zlib/contrib/vstudio/vc10/min=
izip.vcxproj":"af73f2cf8ae51e65e85342faeb40849a2310c97bc77def42b38d7070460a=
6cf0","src/zlib/contrib/vstudio/vc10/minizip.vcxproj.filters":"83db58d87f5d=
7ca84b6087aa1f62b15cbc296194c8cf76e47a271f9077b4f3bd","src/zlib/contrib/vst=
udio/vc10/testzlib.vcxproj":"1525ed0893db56db44ec68675c8da3c229dc7867166dfc=
0428816783d16ad43b","src/zlib/contrib/vstudio/vc10/testzlib.vcxproj.filters=
":"d7e04ffa467d417dfa3c0f1c64234cadc84882101bbae483f0a0f5d3d6b566a7","src/z=
lib/contrib/vstudio/vc10/testzlibdll.vcxproj":"3f317d8964f17901c3e68bff5dea=
ec10b6ccc50a572235999e8097292692984c","src/zlib/contrib/vstudio/vc10/testzl=
ibdll.vcxproj.filters":"682a485f0184aabba94e12e1b284499195f37c176d43ecee048=
4f31e4d636f6f","src/zlib/contrib/vstudio/vc10/zlib.rc":"e8b581eb16930e0213d=
37143a5f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/vc=
10/zlibstat.vcxproj":"2a38222d6c034d7e0b843c3f0540dc6c53dd48f942ae29f31620c=
a0327248c8e","src/zlib/contrib/vstudio/vc10/zlibstat.vcxproj.filters":"d9a2=
c381e51e4d6f027f3517db7db81656e43cec02ed9abf267a0fde6f360180","src/zlib/con=
trib/vstudio/vc10/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4af=
fda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc10/zlibvc.sln":"e659860f7=
05f31b87ea9139a3cb4ebe1561e120bce495383a54614fc82b49990","src/zlib/contrib/=
vstudio/vc10/zlibvc.vcxproj":"3108badf710e2f4a64eab4e7deae6642fb68cc0d94018=
e537149f1761e215133","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj.filters"=
:"58404ba7703c68025bec64b8a17ff1fc7f3a35d15d17ae3bcc4fa753f1348425","src/zl=
ib/contrib/vstudio/vc11/miniunz.vcxproj":"746e4c11fb8af4bcd6a9d68ba81ed1dc3=
66a5de3bed56b291ee969ad733a7bb0","src/zlib/contrib/vstudio/vc11/minizip.vcx=
proj":"340617cae9cf4fcb003308021d3782ec3639e60d62d79a3aafc0a50bb55b061e","s=
rc/zlib/contrib/vstudio/vc11/testzlib.vcxproj":"589eec6ef6d818564ead938a629=
fda50abb6cbf8054b9f66ea780765c1a1b3db","src/zlib/contrib/vstudio/vc11/testz=
libdll.vcxproj":"583bdef522b0176829f0d8139ea2a88b9cbc14379d1334f3a863989ed3=
df9b67","src/zlib/contrib/vstudio/vc11/zlib.rc":"e8b581eb16930e0213d37143a5=
f17868839b22c758b23981a29484e17093c494","src/zlib/contrib/vstudio/vc11/zlib=
stat.vcxproj":"51aa752698d96df065a9ece02e293492f681b59a8077f036a5a60367dc62=
1e87","src/zlib/contrib/vstudio/vc11/zlibvc.def":"0124fea28bfee49c8a19dad0e=
d5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc11/zli=
bvc.sln":"27389b515997defd080519f95aff87e89fcbe8b26d73c5ebb73c544cfef4d60e"=
,"src/zlib/contrib/vstudio/vc11/zlibvc.vcxproj":"c3dd05e56159aba411475b8365=
6275872524cb3c2fd24d690397d8b634e7e0ed","src/zlib/contrib/vstudio/vc12/mini=
unz.vcxproj":"1494af54570f6e93852932956d49a8c25e57b5abc1ac979945605ca9143df=
9f8","src/zlib/contrib/vstudio/vc12/minizip.vcxproj":"9bf128ed6760ca5f01900=
6f178b1c65f4c7ff122dba8d297b64b0eb72feeb120","src/zlib/contrib/vstudio/vc12=
/testzlib.vcxproj":"367a06caa399bd09f6b9cb60706820943dd6a6cf05794275baaf421=
da9c2a0b7","src/zlib/contrib/vstudio/vc12/testzlibdll.vcxproj":"93416510256=
935d79625dc9fd349cfce6968c062d42a138bec404a26b2f92f5e","src/zlib/contrib/vs=
tudio/vc12/zlib.rc":"92d5d3a4938a6350395934153416a7eb74353cdfb2321f45b9ee0b=
9b16257f39","src/zlib/contrib/vstudio/vc12/zlibstat.vcxproj":"744ff6ac0d4e2=
dcdf74c7d33b979fbfd2b18550947eb99bfd46dc6a73eb1c68d","src/zlib/contrib/vstu=
dio/vc12/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affda5a389e=
64ad15f44d7","src/zlib/contrib/vstudio/vc12/zlibvc.sln":"162e0faa80a56d89ee=
a71a0b89377708eec2faa0dc72091cc0abb07fbdea49a0","src/zlib/contrib/vstudio/v=
c12/zlibvc.vcxproj":"754671c59d8996a846241af76082cc8be1aa5fc079eff530d91a9a=
b15a0bee5b","src/zlib/contrib/vstudio/vc14/miniunz.vcxproj":"0312511d4a30ce=
a979c4e36edf994a537ed8a9d924f6b5c536cbcd094773c11f","src/zlib/contrib/vstud=
io/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2db900627c366f9bb93a351381995d9c6=
9a50c0126f64233","src/zlib/contrib/vstudio/vc14/testzlib.vcxproj":"c3a93696=
70af4ebea13d036b452be7418591fbb4c03a675699facac5d8dff5d0","src/zlib/contrib=
/vstudio/vc14/testzlibdll.vcxproj":"69f544898b4275cd3d8e19b8f1f8cb39c1cb98a=
30cdb033242e4b94c57bfa150","src/zlib/contrib/vstudio/vc14/zlib.rc":"92d5d3a=
4938a6350395934153416a7eb74353cdfb2321f45b9ee0b9b16257f39","src/zlib/contri=
b/vstudio/vc14/zlibstat.vcxproj":"9c7c096b47e7875412c98525efcd16db62e094215=
f0011b9cd739a33ab35d48c","src/zlib/contrib/vstudio/vc14/zlibvc.def":"0124fe=
a28bfee49c8a19dad0ed5a49277d451018b4affda5a389e64ad15f44d7","src/zlib/contr=
ib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca6336cecd8c0e4b65e515fc46ae84c7b610=
08ac9864162f777286","src/zlib/contrib/vstudio/vc14/zlibvc.vcxproj":"71fb6ef=
3b079bfdf4182af17e74c3361ead757467edfc591d9cbe303ccc47b52","src/zlib/contri=
b/vstudio/vc9/miniunz.vcproj":"b2b53bd9e704bfbe769b863acdc2a3368692ca149c4b=
4ed2a0761b0cd16c6726","src/zlib/contrib/vstudio/vc9/minizip.vcproj":"80a701=
fb41a61871ce1d25f6b03e571edb6c3abf0aa45375554b6fac52115eb6","src/zlib/contr=
ib/vstudio/vc9/testzlib.vcproj":"05fc5a87682b17690d199f424f57f6ad7767b8dabb=
29a1039bfcb88bca1b302f","src/zlib/contrib/vstudio/vc9/testzlibdll.vcproj":"=
25c1cc5319f1c4b7dbdb595c3cfd6ec3ba217818b03b7055ef5ef440b575a43d","src/zlib=
/contrib/vstudio/vc9/zlib.rc":"e8b581eb16930e0213d37143a5f17868839b22c758b2=
3981a29484e17093c494","src/zlib/contrib/vstudio/vc9/zlibstat.vcproj":"e8653=
eea37f3bef097eec2caa55e1f698c3c74c959689bc4e97568e88d2bbc60","src/zlib/cont=
rib/vstudio/vc9/zlibvc.def":"0124fea28bfee49c8a19dad0ed5a49277d451018b4affd=
a5a389e64ad15f44d7","src/zlib/contrib/vstudio/vc9/zlibvc.sln":"26e58d4b2cfc=
d941c367fb2a18537b3b9f002f2ac1278b700ea1129c50501452","src/zlib/contrib/vst=
udio/vc9/zlibvc.vcproj":"86aa6e33db104c0a0ed4a9f21f0db8572cc7755170217aef18=
219fdd74b75e9d","src/zlib/crc32.c":"a04af273e83ecc351bf3794974ab2098d8d960d=
f4044b7b44734c41443ee26d0","src/zlib/crc32.h":"407af59d0abfea84a6507c603eb2=
9809411797f98249614fe76a661def783ce1","src/zlib/deflate.c":"11fd6b0328b65c4=
ad4b5c204d892a97a9083628a7e77dc47836c8e0c799f8da0","src/zlib/deflate.h":"0c=
a7fb0cf1dd63001c6e9e4ff93c8dbff2fe521199be51a4dda38a11b44919f6","src/zlib/d=
oc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a95aabb08e28c30c52bae3e=
8c4bd5ad","src/zlib/doc/rfc1950.txt":"8f0475a5c984657bf26277f73df9456c9b97f=
175084f0c1748f1eb1f0b9b10b9","src/zlib/doc/rfc1951.txt":"5ebf4b5b7fe1c3a0c0=
ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009","src/zlib/doc/rfc1952.txt":=
"164ef0897b4cbec63abf1b57f069f3599bd0fb7c72c2a4dee21bd7e03ec9af67","src/zli=
b/doc/txtvsbin.txt":"47c273bb22c9773248d380549a330e5c262266b1292154b0d3014f=
731cc73f47","src/zlib/examples/README.examples":"402d72eb69c2e03a25034f4b3c=
02b110f0f67149ecfa4fa0e4b2bf0ceb49a8b3","src/zlib/examples/enough.c":"704e2=
73f65b62c5d2eb06d5bb10c4ccffba56544aa477f0e3957e2296c501b78","src/zlib/exam=
ples/fitblk.c":"950769163c41aff897ee41746a8685d9aa41073b1307f42da19dabe9d3f=
c8b85","src/zlib/examples/gun.c":"d60ca6eb0a3e62ee7fb4a1ab69e8d1525ff06b06c=
e46889cbdfc13fb8f7534c2","src/zlib/examples/gzappend.c":"4182d38bf97ffbdf11=
10df7f65c0e8fab0b28b1ea36ebba8621c14e8e76f1caa","src/zlib/examples/gzjoin.c=
":"90b9d6c39a5fc91cf1cc9b96b025a508a8015dc502cd9374c754b44078593f57","src/z=
lib/examples/gzlog.c":"433d34b71b4e769ece1cceb8bd7d902d2c0a24ccd7550ab1856a=
5ba87f84f835","src/zlib/examples/gzlog.h":"309556e2d7d39250924946b78e2cce0a=
c927857d6e1a02cab64e438f533c20c3","src/zlib/examples/zlib_how.html":"80fb64=
7be8450bd7a07d8495244e1f061dfbdbdb53172ca24e7ffff8ace9c72f","src/zlib/examp=
les/zpipe.c":"68140a82582ede938159630bca0fb13a93b4bf1cb2e85b08943c26242cf8f=
3a6","src/zlib/examples/zran.c":"840ebeb058cd0ca9e92dcb1db665932462a4695fc6=
49b34e865b8d1ad7c5bf77","src/zlib/gzclose.c":"94446cf8cde67c30e64d0a335b0c9=
41fd3fbad2e77f30180d12e61f9c2a5a6b8","src/zlib/gzguts.h":"6a54a06d269245d73=
201e76280c0f11c282dc6ec51729ccd9051fe6c9907e851","src/zlib/gzlib.c":"5daf11=
e44149e0aba2956d35f73f04f35dca99c3dfa43f5ad43ec20b336e4a1b","src/zlib/gzrea=
d.c":"6f928512cb1792cfeab31a51ff0b211814d2e455bc75290eb31079dc1e5ad2ec","sr=
c/zlib/gzwrite.c":"ba3b7b7ad2ff7ef0c19319b8408c333491a4cd495da55d0b156bc73d=
9ddb4df4","src/zlib/infback.c":"abe44873b5af2ea68ea1d281d915b2800f1832f846d=
2c05442a4711adbe6f269","src/zlib/inffast.c":"4d496ab2a3d29df5fadc3dbff6067e=
039806aaceae6cfcd09ea77d46c2b848fd","src/zlib/inffast.h":"7d8c1c873ce9bc346=
ad6005bb9d75cce5c6352aaf7395385be216a9452a34908","src/zlib/inffixed.h":"237=
ba710f090e432b62ebf963bee8b302867e9691406b2d3f8ee89ee7bfef9b0","src/zlib/in=
flate.c":"8b6c599c3563c14c447c47db0d7dc9a16e8c246a078ec95a169ddcebaaebd811"=
,"src/zlib/inflate.h":"8ec9ac297790276f7e46a961d4c6f9f944fb1dec92401339ec26=
66973cc5983c","src/zlib/inftrees.c":"1960ca67384376f65b6ce8c08fdb501f8eb339=
23e11ef5f61a855708c6cb0a8a","src/zlib/inftrees.h":"c510b36402784b1f898be3b0=
49b923469aa92701de2d9195aed19f6b65c0dce2","src/zlib/make_vms.com":"3064eb15=
3a7684115f1494364f80759bc5a2c227799fdf08df7b9e6e50884720","src/zlib/msdos/M=
akefile.bor":"292ab363f7ffbc4ae84d37cd9bdffd2dac1003bee52d223a8489844870f20=
702","src/zlib/msdos/Makefile.dj2":"9208450c2ae6dcbfcc25560b5b9ca763f461e72=
46e37b0552474edf8fa898906","src/zlib/msdos/Makefile.emx":"c749d6ec7f88e8e63=
9d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d3d64","src/zlib/msdos/Makefile.m=
sc":"0e021a6f42212415b060e4ad468eb415d0a8c1f343137fb9dff2cb8f9ead3027","src=
/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5a0520d0fbe4adee772bc07fe816002b0=
7ccb43db3daa76a","src/zlib/nintendods/Makefile":"ea5823efe6830132294eddf2f5=
6dbd7db8712244c210bb4968c431b1a91bd066","src/zlib/nintendods/README":"e3624=
26c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421716dc629a71aef95","src/zlib/old/=
Makefile.emx":"d811f032272aae50123a889297af3a02fbd60d1e42bbef11466462f627ff=
7b5b","src/zlib/old/Makefile.riscos":"d1a488b160fbfd53272b68a913283a4be08ba=
9d490796b196dddb2ba535b41e0","src/zlib/old/README":"551a0f4d91fe0f827a31cbd=
fbb4a71d1f3dc4d06564d80a3f526b749dd104d11","src/zlib/old/descrip.mms":"8ff0=
8c35c056df9c986f23c09cf8936db63ccf12c3c42f7d18a48b36f060cff7","src/zlib/old=
/os2/Makefile.os2":"6ad247c00f00ff42fd2d62555e86251cef06e4079378241b5f320c2=
27507d51d","src/zlib/old/os2/zlib.def":"ea9c61876d2e20b67ef2d9495991a32798e=
b40d13ede95859a2f4f03b65b9b61","src/zlib/old/visual-basic.txt":"1727650acbd=
e9a9e6aec9438896377e46a12699cca5d46c5399cef524dedc614","src/zlib/os400/READ=
ME400":"6f95a1beb0fbf943a3312eaa3dd2c279f1cef93062bebbff63dd37ac9e2aa8d6","=
src/zlib/os400/bndsrc":"cfe00b1528d5c27813cd6b1ad7aa34b493fd63d615623fb21fd=
1a7bf99d2255e","src/zlib/os400/make.sh":"143394d1e3876c61c29078c0e47310e726=
e1f5bd42739fe92df9ece65711655f","src/zlib/os400/zlib.inc":"c501c522185ba1f0=
506caf90d72f1088b34b2addc169471e949e443ab65e8a75","src/zlib/qnx/package.qpg=
":"90b5c8364d9dc5ef67405b352c19710ebad2905f3f20b9e56ded74661f96743b","src/z=
lib/test/example.c":"520799662a8286725540d6d5a356efe6f595618e5fe2e591972491=
d719bd99aa","src/zlib/test/infcover.c":"f654f3fcc74b33bd95cda63d13fe0ce589b=
cfe965544e0c17ee597d75efbd090","src/zlib/test/minigzip.c":"91089b21e692797b=
b6208b2b45eeb90f5f1f1e4f6b67b99dea5676f51b811193","src/zlib/treebuild.xml":=
"d816c764c8ec2d5b2ebfa7f053f747097926c13fce7fa8628c5d14c991411421","src/zli=
b/trees.c":"f2a5f949ea70dde7c23a54c793aeed630a03df4bb72417cd3aa008000c44699=
b","src/zlib/trees.h":"bb0a9d3ca88ee00c81adb7c636e73b97085f6ef1b52d6d58edbe=
2b6dc3adeb4d","src/zlib/uncompr.c":"31922aa982ee12fd28d1ce5fe6a94a3f07c2a94=
1c821b566a881ca21845cdfaf","src/zlib/watcom/watcom_f.mak":"7e039b912f9cffaa=
40835281430bb284fa9042b0a0d12f6b34700a06bca6576e","src/zlib/watcom/watcom_l=
.mak":"d11b4064604a034725860e63e3f6d347056372e4b1675b183e20a93533b20cc9","s=
rc/zlib/win32/DLL_FAQ.txt":"9e00778319381e6275691dd3a89410c99065b8c0c5db964=
73abe8c859cbdefd8","src/zlib/win32/Makefile.bor":"e878fed2313417db085fea621=
c110889f6a32233b5b6db46e3c4e824c1d0ed6b","src/zlib/win32/Makefile.gcc":"ea8=
feddce7b9707253b9bf86623cf7ebe5294d7aea2b3b0b1b1c1b8cfd73009d","src/zlib/wi=
n32/Makefile.msc":"7c495d63c5afea1d77d162a41b73bab89cee952c12e4647e9684a7ac=
79bfc3f5","src/zlib/win32/README-WIN32.txt":"b71f1f4e4760812c3a11b2bae6f40d=
1066741a90e6646010a32ce50a0e348cde","src/zlib/win32/VisualC.txt":"9ec0babd4=
6eaa012371dee2d3a8a55d9c7130f7895512c3371c737e4a7f6a997","src/zlib/win32/zl=
ib.def":"24fa6dd00f3f4c0d14507a03ddbfa42707a04e3901bb9ff6f90096037a75185a",=
"src/zlib/win32/zlib1.rc":"8fc5f2b5abee40ad66e6d6cfc9f926c2f446e13a7c9ee7df=
8bf58a266d8cade5","src/zlib/zconf.h":"9c0087f31cd45fe4bfa0ca79b51df2c69d67c=
44f2fbb2223d7cf9ab8d971c360","src/zlib/zconf.h.cmakein":"d740b750e9c98e6a4b=
4529cc2a857a3fa8001514b1ce91e0e1d9d293652bf388","src/zlib/zconf.h.in":"9c00=
87f31cd45fe4bfa0ca79b51df2c69d67c44f2fbb2223d7cf9ab8d971c360","src/zlib/zli=
b.3":"5abef003e545566e5599e5ab2e7528e978be59d54546b19d763d062f7a69bac7","sr=
c/zlib/zlib.3.pdf":"7f0f633641d782e360eff9fe831716c5767faf1000e38382a8a8c65=
b0b67f374","src/zlib/zlib.h":"4ddc82b4af931ab55f44d977bde81bfbc4151b5dcdccc=
03142831a301b5ec3c8","src/zlib/zlib.map":"7eb1070ba6bf12e6895e5da06b84a92af=
683827587afaa72bdd45e80b9d8e4e9","src/zlib/zlib.pc.cmakein":"2f1d0b18ce37c2=
af415a469857f02aee2c41a58877aff21d29e9c6db32b55cb7","src/zlib/zlib.pc.in":"=
04c01cc2e1a0ed123518b5855f585c93a24526dd88982c414111ea1fc9f07997","src/zlib=
/zlib2ansi":"d316e3e79054f5f9fe921d35f4bbf4bf0a37b859d29d2b34ae4d7d92afc3e5=
5c","src/zlib/zutil.c":"f7fdc9ef326a2683eb33c794face54e83c751ec17f3d1ba5818=
47a62af36ddcd","src/zlib/zutil.h":"9a63f6690fac1620aa3cecee5752af618806da43=
8a256b4a047fbcd289cac159"},"package":"de5435b8549c16d423ed0c03dbaafe57cf6c3=
344744f1242520d59c9d8ecec66"}
++{"files":{"Cargo.toml":"5fc1259b26541f617473d6b741816705c91322db9740e347a=
8686e3c0b30ab2e","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"34c467b6945a22696d060b8fdd2379d464=
acb3408d4c599d3dc5fe4fa1b4c84f","README-zng.md":"2f9f34e6b388a401b8d8318b64=
997a7521e4198c5c314f8cea11433623628515","README.md":"75701bfcd7158e924f51ec=
e8debb6d4425ccd6ad5d2806004b5f174423f4b2af","build.rs":"b383e60f71c9b40ecc8=
07ac58473f9b85d7036e8359796634cba2701224493a3","build_zng.rs":"b7768e19f0bf=
876f29eabb6ad6511f530e61d8aa92bfbe89a7cf3818e4824ce7","src/lib.rs":"7c4a339=
4e17e6250c1f4f2067efecc56b1850827596432ad0ce75e5eea800446","src/smoke.c":"1=
0607c81b73811bfcb9718767312bf97ba2ccf7048ea2f18a2085aa06ad7f91b","src/zlib-=
ng/CMakeLists.txt":"5840d2c44e335af0f58f8a2545da60be403946b1181641b35ea7425=
b2e0f44db","src/zlib-ng/FAQ.zlib":"c524f4f86d336b3de71dd6977afddffa9c02fda5=
c26db4dfefae44959e7614a2","src/zlib-ng/INDEX.md":"989545e90d8e9ac149034f762=
ce78ed8976ebf9324326228dea37ca190154609","src/zlib-ng/LICENSE.md":"d3c80be0=
55d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436","src/zlib-ng/Make=
file.in":"1f56adbf5fac7fa36c6e4c11b5f061acb971984c941154cbf0344e2b68b99e7d"=
,"src/zlib-ng/PORTING.md":"4105267b5e00f8d608f31dcf4fe2cfede15cc94568211691=
419e6cba3d8e539e","src/zlib-ng/README.md":"ba04244ad8eea94d834d25aa75b40e7f=
849844a33c68ed180c2a631378e1f211","src/zlib-ng/adler32.c":"82ffa1b4fc4b198b=
a8004135f79b8819d9f2b28e851c30c0ab41e6d32dfbf70d","src/zlib-ng/adler32_p.h"=
:"f56915c59a345baf4558374447385a317e29365a4db2fbb38af4de3e1a1a0201","src/zl=
ib-ng/arch/arm/Makefile.in":"95464884ba75a7b12c9ceda5845d8d68d5a7d7dac8a8dc=
24b27beb2192e5b97b","src/zlib-ng/arch/arm/adler32_neon.c":"3990b8d5570b12c2=
162218fe0e9bc723a03f1c89b5ed3ba70a74a98976260ee7","src/zlib-ng/arch/arm/arm=
.h":"855adbb02d7b9a5714a17d9dcff493610e7cd2b9a1f4e58e1c99626ab536e868","src=
/zlib-ng/arch/arm/armfeature.c":"4800228414695b632b9ceca14409e782d6fc3b357b=
a7ab00858925fc66b5532e","src/zlib-ng/arch/arm/chunkset_neon.c":"95fc7917d1d=
30094e15a35c56d1e9c189c5ca3758553a3467d4da793eaed656f","src/zlib-ng/arch/ar=
m/crc32_acle.c":"e2be53267a2a59fc79c4b3bab00e8b25bf64a8fc8bf2c6684e5b1b1fd1=
480f9d","src/zlib-ng/arch/arm/ctzl.h":"feb70d55e66025fff806e30e48002b35cfff=
79533d352585cfa5f118edbc90b1","src/zlib-ng/arch/arm/insert_string_acle.c":"=
d1b1dae5aeada70f2b03c2cbf3112ce55a92401c2d87709081b04dcf5992e1ad","src/zlib=
-ng/arch/arm/slide_neon.c":"19d8cf5c742ac6b82164c7a183538ad1129f9f17e9b8bce=
8b40daac3820fb6c4","src/zlib-ng/arch/generic/Makefile.in":"f41a34839986eac8=
dd52cf91fada0efff4171c059ab5d7db6347c91bd6d9db09","src/zlib-ng/arch/power/M=
akefile.in":"69644d1a0ff8e7f38005c0a55cdbaf3f0d87f42abf8fc4f4136271c4fedfb8=
46","src/zlib-ng/arch/power/adler32_power8.c":"79b75e98ad3a62facbbdd8c0b178=
d3f993b57f6e34d320bf47eca33aa8c330a1","src/zlib-ng/arch/power/power.c":"064=
7afb3b3b7ce2a19b4815ec8fdeee0b37c759413e5ef0a668a2dba22d94803","src/zlib-ng=
/arch/power/power.h":"f3f15f94fed98a2f7dd5d4568c5172e597228be4141d689506270=
3c3f70024da","src/zlib-ng/arch/power/slide_hash_power8.c":"932ea533d25e2f54=
78afe0c47830e7ef24276cad0d75fd91f2d8c799bd4b5d36","src/zlib-ng/arch/s390/Ma=
kefile.in":"eef6c3169723f089b0b5f852423ec55bf0364caeddd7cda991f2e76bc168210=
7","src/zlib-ng/arch/s390/README.md":"730b9a0230609988fbd1bdd52a7abdaa1fa5c=
65253ac78163dd4a5eccb966abc","src/zlib-ng/arch/s390/dfltcc_common.c":"3d460=
448ad4c5b687da6b7c0ad8498ece92b771dc7ddd0189e096acca5a1cad4","src/zlib-ng/a=
rch/s390/dfltcc_common.h":"de8902d3863c8a7a3f6ea27dec2ee5a4f17ef5d8646e48a5=
86d0b29fe94c9a0b","src/zlib-ng/arch/s390/dfltcc_deflate.c":"d6941d3c5ada225=
ec39b98b35bce1d203aa1f2d994a47c8487d377d9ef2f6efc","src/zlib-ng/arch/s390/d=
fltcc_deflate.h":"5c90a812e2a2f2b842dba027e5640791e52206e74b8423cb78e0b8ea1=
2ed29ad","src/zlib-ng/arch/s390/dfltcc_detail.h":"fe66cd700a1d017eba86c2c6e=
95f53e9a4d1cb491de9cb3963b2a2907098baa9","src/zlib-ng/arch/s390/dfltcc_infl=
ate.c":"83643b5605cdc2d1d7780e1bdeb007f9dc6a1cca633157abbfb5d3232f2b8816","=
src/zlib-ng/arch/s390/dfltcc_inflate.h":"d7a4a5ae79abd1a5456521926b918becfe=
86c253a4fc23723fbc09f7c3303128","src/zlib-ng/arch/s390/self-hosted-builder/=
actions-runner.Dockerfile":"999c962c49508ebf61414e6f9ffea059926ac500d4c6d70=
7ea1f9e77402f7374","src/zlib-ng/arch/s390/self-hosted-builder/actions-runne=
r.service":"33a359eb58d76152f916b40ee1357f7edfda75e8dfb55a5b12ac83bcd6ed705=
5","src/zlib-ng/arch/s390/self-hosted-builder/fs/usr/bin/actions-runner":"f=
647e18728ea15fe927ac9f8cba83a5b343654a0e91b5ebe653bae7af7375110","src/zlib-=
ng/arch/s390/self-hosted-builder/fs/usr/bin/entrypoint":"add4ebdc4f06ed15bb=
1de12a8c9ceb370a60baebb0932a1026a75433940ad3df","src/zlib-ng/arch/s390/self=
-hosted-builder/qemu-user-static.service":"54551049f6181da88700a2a944a72b0a=
f3b8abde876fa28e1348deb5eb96c91b","src/zlib-ng/arch/x86/INDEX.md":"c12f9bf0=
d66743a6472fb756bf46def8eea1dd235be7fca994dcb22f693a3524","src/zlib-ng/arch=
/x86/Makefile.in":"9f6fe7567a99e81aaa3bef8ccfa1ad40f524efc285cf8dfe0f497a15=
30f8016c","src/zlib-ng/arch/x86/adler32_avx.c":"99056732c7bd5d53dc108f28281=
1a40bf21570926781af5dc7b17cb9218963de","src/zlib-ng/arch/x86/adler32_ssse3.=
c":"883a5520b4481225d097c90c5359106a3c8eb7b921499c94276e999b7c39adc5","src/=
zlib-ng/arch/x86/chunkset_avx.c":"13c83149146c408ffdc9358bcb5355259f6196e6c=
c6fe025b7ea3647e313cd0a","src/zlib-ng/arch/x86/chunkset_sse.c":"f14d0557634=
b53af8cd6e2a1ce9d57df50244a72e85ff3b100b5ca287d1cfa8a","src/zlib-ng/arch/x8=
6/compare258_avx.c":"8b2838d168de4608327f25fe52d53763a82413ee911d87947d3fcd=
72c7f9bf26","src/zlib-ng/arch/x86/compare258_sse.c":"b5049722ffd4a43a96868e=
eba5e000271cfc5fcbf3c2657026ead15b1df28a10","src/zlib-ng/arch/x86/crc_foldi=
ng.c":"defb5a7067562612651f693c910db53cf228b7cd7fef11991504767a7d84f224","s=
rc/zlib-ng/arch/x86/crc_folding.h":"939212546611917e9e066e8ed30cdda95680ec1=
f5fe0890cc4865b4e6d7fc215","src/zlib-ng/arch/x86/insert_string_sse.c":"9e84=
a75b6a565422eb105261b6729d2a02b89133bd14372c949d5381b5deed3e","src/zlib-ng/=
arch/x86/slide_avx.c":"5e448e439ac24e7cb10eee176ca37f2c63f73c135c0a2af040e2=
32bad490997d","src/zlib-ng/arch/x86/slide_sse.c":"1946cabb634c905fddef0a22b=
2fad19dfd99110169567c3beceef71145b2e316","src/zlib-ng/arch/x86/x86.c":"1af5=
6e27b2e951e1ad1344e62c2f7a8c49a776fcdd1cb0f4ea9d6152118a479e","src/zlib-ng/=
arch/x86/x86.h":"4d2d20ea0087089141e250e77bb3d419954b9092810028b151581b9115=
a5fe8c","src/zlib-ng/chunkset.c":"cbf26582fff56726cc28bee05ff0a1680c50308b8=
dd9bb8cfb57d7f0a587d0bd","src/zlib-ng/chunkset_tpl.h":"eaaf0804f6162ab26b2b=
6de263a478ffb111559e653372e96e400acba9c63563","src/zlib-ng/cmake/detect-arc=
h.c":"e0da3d16195eefb54bef77163db737a66453f25ae16648aa8f6beeac70787662","sr=
c/zlib-ng/cmake/detect-arch.cmake":"27fa8da497b39ac70d881e2d345749611dae4c3=
0f7b7a9c9e32f2c042672189a","src/zlib-ng/cmake/detect-coverage.cmake":"e4e37=
2991ba80a16ad47df2716708a56013cc628aa7ed01573a2360c60610125","src/zlib-ng/c=
make/detect-install-dirs.cmake":"87031a40428a104f5cf38ecdb8a5028d8c679cfa77=
2a58adde8380c809b34eff","src/zlib-ng/cmake/detect-sanitizer.cmake":"a8f7a45=
15278532b251b567d82ed576fe1ca7e698992ed92d1beb8e8dd22237f","src/zlib-ng/cma=
ke/run-and-compare.cmake":"13d85c12c9d6c7b1b148bd0c5a5b4faa6a4b56f3823bf03c=
4f8d914c9c5949d8","src/zlib-ng/cmake/run-and-redirect.cmake":"7f08d18c09aa5=
8113882ec760735a62a1723a5bfcae9f73bd3713a4dbaeab898","src/zlib-ng/cmake/tes=
t-compress.cmake":"0d2d1595859ccfb6795bb98700a4f7c1652b025cc344a12915246010=
87957888","src/zlib-ng/cmake/test-tools.cmake":"63aabfffd53970b8e145870b2a1=
c03bffa3595f7df04bd86f94e97b6f2a387e7","src/zlib-ng/cmake/toolchain-aarch64=
.cmake":"46be0bf580a49a528c72005484655afad1de3705b39a66a7b0c213b0fa81cee6",=
"src/zlib-ng/cmake/toolchain-arm.cmake":"05e38076fd6ffb9785ff9844ccecd26436=
c9dc4c25b7777b62e5f52e788c3882","src/zlib-ng/cmake/toolchain-armhf.cmake":"=
1a2029163a57415eec9a5dd5f45d3254d349e97b1beb5d16876b741717673341","src/zlib=
-ng/cmake/toolchain-mingw-i686.cmake":"df9000354b820d3713d1469edc9f94cd0953=
89b0cca83965730b8e64857fdf3f","src/zlib-ng/cmake/toolchain-mingw-x86_64.cma=
ke":"ee316e6e3202919da5d497f9e246466fd715fcf079cb5b4afc4774089d1fefad","src=
/zlib-ng/cmake/toolchain-powerpc.cmake":"9bd6fc58ce5b70603657f2c195c4a5cf52=
fae96ad63ac787978831c5858f762c","src/zlib-ng/cmake/toolchain-powerpc64.cmak=
e":"917fc5eef84921d8b38f43c2b4f60870965b4eecc8f018c7b3499e1142c715af","src/=
zlib-ng/cmake/toolchain-powerpc64le.cmake":"5b2edd36d62de513db2d32bfbf77997=
9d81ac527b981cc3379a4e933fc5a94d1","src/zlib-ng/cmake/toolchain-s390x.cmake=
":"cf52cecea7bd2a9d1ff5fd8edcb03c531e3b404bbcd15a15dec2e0e19936f2ac","src/z=
lib-ng/cmake/toolchain-sparc64.cmake":"e543062485d06a7e0fec8135887c5e733635=
17fa4babc23ef7b780916d75afda","src/zlib-ng/compare258.c":"56bfd48d5ff9ca422=
fbb728df7a373436c73796561dff118c7d4039fe70d29e2","src/zlib-ng/compress.c":"=
41df6eb62d6fb1334ecfe0a0c3e50a7ee89528719857f2b8297cbc512149759c","src/zlib=
-ng/configure":"160f69a1e51c49f6454ece92e4c5e08675ca5d90cf22b8f79cbe54c4381=
d93c2","src/zlib-ng/crc32.c":"98440be8a99381151a2d740f2e2228e8c1b23b9193c36=
42c52a4e34799506336","src/zlib-ng/crc32_comb.c":"11a36a6088fb520a58e0304fc9=
9cf12fc8437519e8a70fe74dad58f00af696ec","src/zlib-ng/crc32_comb_tbl.h":"d66=
15d209d6c7d5248c6f7fe4e5dbded13c0eb87997b37693032c2902927407d","src/zlib-ng=
/crc32_p.h":"1fa91375a18e090c0a0dfda39de3df36346a0b1be36c808be6b6c29c32eba9=
22","src/zlib-ng/crc32_tbl.h":"d629378ba38ff5775095b64e277bcd41c4b89fab9b56=
47a9fb29e15da0db0161","src/zlib-ng/deflate.c":"6fb8979ee8bc43f6e12a649708c7=
eb50e60bb9bdc2e55c45ce3b15aefe779179","src/zlib-ng/deflate.h":"7b3c649965c5=
4446097d6157dd31d3685aa7df1082e9aa64cb3cdf6ac2c4d023","src/zlib-ng/deflate_=
fast.c":"d51e1368fc997673c64b5ab9a620439df25f313f8274529d974c5f80b89702b8",=
"src/zlib-ng/deflate_medium.c":"1c3d95cbac76052d39595ea750c5536541c18302b9a=
bb398c27b58955318bba8","src/zlib-ng/deflate_p.h":"2e739301e8c53038c2a958c8c=
8693584cd8dae464ffef05a22db6d6fa9985676","src/zlib-ng/deflate_quick.c":"280=
905a191d2b2a7274f2453ac537e01a0fb6e7540a0b212c1514bfb8c9415ea","src/zlib-ng=
/deflate_slow.c":"a2c66723e1e71ffd6ff856407459ab311a4c6546ecf50285081fc7afc=
d0ccd2e","src/zlib-ng/doc/algorithm.txt":"0d21a0a4c47e512743389628d1385a831=
a5e5ff716491095a382b923287f4223","src/zlib-ng/doc/rfc1950.txt":"8f0475a5c98=
4657bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","src/zlib-ng/doc/rfc=
1951.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e03b0b0f301350009=
","src/zlib-ng/doc/rfc1952.txt":"f7c810fd9d719d002d605207a9b880600f71d039b9=
626c5b4b03f2122438dd2d","src/zlib-ng/doc/txtvsbin.txt":"47c273bb22c9773248d=
380549a330e5c262266b1292154b0d3014f731cc73f47","src/zlib-ng/fallback_builti=
ns.h":"1d2c2da88009a58f240bac33f562fe5a0a39c1e773813a2d75b45283ff1396cd","s=
rc/zlib-ng/functable.c":"d9db6530035a06f95982ff3d7680a84f4b54b8425874ccbe2a=
b10b906bd5708a","src/zlib-ng/functable.h":"e5a2d0c10411d23f04295bcb9ddb9889=
388974b723caef65aa5c4ea4739f4aa7","src/zlib-ng/gzguts.h":"7b69b2f35264169bc=
794d0d5c00247d93c203f751d226302966c33b524ed9fb0","src/zlib-ng/gzlib.c":"7e6=
ad5d9d32e6429d56a5303e2c6e6870d69c023d6647a52fb95902828de4011","src/zlib-ng=
/gzread.c":"d5d47d24dc463b978fe828320dab140494803fd86b511300f903c7c2eabd4d2=
5","src/zlib-ng/gzwrite.c":"1685ad2c88239b3434cd2c4a9d66b67842310b2d1dfd01a=
ec0fc293eef20e858","src/zlib-ng/infback.c":"4decaa412219fc8adb935754c54a4de=
df3952aaf67107a12512451c65eadee23","src/zlib-ng/inffast.c":"a134d4aa6a46eeb=
e975ca0cd5ef18894fc852b6a840be21ca7243ddbe6c9d8f9","src/zlib-ng/inffast.h":=
"42e74a92b496ab0726be317e8497a12bf3c3cf3d0d533440ce65befd3929c71c","src/zli=
b-ng/inffixed_tbl.h":"a94225335396245e9f0ccb2e9b4b334fe7ee0111ed8e32a26bcd5=
2187f364314","src/zlib-ng/inflate.c":"f33e2e7eeaa4b33ba6a2c327f8c9939e6b847=
afbdad349da65c97bf81c6083b5","src/zlib-ng/inflate.h":"eb25527d1bdedaa451679=
26dce4c39d9aaa3147b0f4a95f38f5916528c30a09b","src/zlib-ng/inflate_p.h":"4a9=
4c51194da119770cf662ef289994f0c78d95184d54d6ae5d50a393e8f5a62","src/zlib-ng=
/inftrees.c":"7a777f5ff02ce60fbad6cb843ceadd7b3a8a8a0476ae010c87a0377c2e88f=
780","src/zlib-ng/inftrees.h":"fa80eb11c2290b345470a03cb861843e2cb136513523=
3ea8243e9fd79d3618a1","src/zlib-ng/insert_string.c":"aa22ba53a1e75821499809=
277f9ca0e5ef92b07a618136dd11ae1734e233b7c9","src/zlib-ng/insert_string_tpl.=
h":"1ceba9903324d10aad6e1d83653c4d534a5b06fd09076414a06215482be00bac","src/=
zlib-ng/match_tpl.h":"eeab4c6eea8511a7579738e622af062ad16f4016312e93ad34bc5=
903d8b3c4a1","src/zlib-ng/test/CVE-2002-0059/test.gz":"60bf96b8f433bd7e057c=
e3496aceaccd70ec80f596a4aa8bcc7786056705ce66","src/zlib-ng/test/CVE-2003-01=
07.c":"6ed6fba710f8f2b898750f0ec17720fbf01e45c39e8adbba6409681b34914140","s=
rc/zlib-ng/test/CVE-2004-0797/test.gz":"38caae524705f676bde13a8df9fc8c7d2fe=
105ba6bdbab62a405b0276fd3aa2e","src/zlib-ng/test/CVE-2005-1849/test.gz":"e4=
d5a60617df4b5dd44eda94751ce1eacdb325792bba6e3cc4676719a3adf742","src/zlib-n=
g/test/CVE-2005-2096/test.gz":"8f702d4861aa3ec98ac03a59ff26b430939630cb5cd4=
266d2658d3b836d576f9","src/zlib-ng/test/CVE-2018-25032/default.txt":"d7f827=
8db331c47bd1208bf41e7903cbddee4f7b47c666c40afdd3c96237752e","src/zlib-ng/te=
st/CVE-2018-25032/fixed.txt":"3b27a98edd2f3f580033f9add11d3469d7808c969a112=
8ee00c18ac7a12cef57","src/zlib-ng/test/GH-361/test.txt":"358497d0a7251ea421=
01dc77b02337f46fd89af09643a8288e2a3082e5d24128","src/zlib-ng/test/GH-364/te=
st.bin":"af5570f5a1810b7af78caf4bc70a660f0df51e42baf91d4de5b2328de0e83dfc",=
"src/zlib-ng/test/GH-382/defneg3.dat":"b22bef6b7392401c9e7b079402c4a4074053=
d7a914d050400e37fd7af6fe26d5","src/zlib-ng/test/GH-751/test.txt":"b83d83380=
3b7bc3124fb2a0034081f0b999ad10c33a8dfa3bfd181dc078ae3ee","src/zlib-ng/test/=
GH-979/pigz-2.6.tar.gz":"2eed7b0d7449d1d70903f2a62cd6005d262eb3a8c9e98687bc=
8cbb5809db2a7d","src/zlib-ng/test/Makefile.in":"48d033f2dbb62635624bf2c9e3e=
7fe279b72afc3411d14cb7cfdbf40f5b80e19","src/zlib-ng/test/README.md":"d60ef4=
851222ebc2a9fbc23f292ab11bc7fee40ba6171ea768b2ffa005df5b1d","src/zlib-ng/te=
st/abi/ignore":"02aa87f77656dbc1fbddd23f436cd15465a92df0722da4055cae1bc8bf0=
13097","src/zlib-ng/test/abi/zlib-v1.2.11-arm-linux-gnueabihf.abi":"f5e91f2=
5b558a891fecbeb6e2e9575698630ab700d055a38f3bc4fe66257f513","src/zlib-ng/tes=
t/abi/zlib-v1.2.11-x86_64-linux-gnu.abi":"038337383cf780587d810cf5400d632f3=
a1f8517e63ac4a71b6e5224db8b1413","src/zlib-ng/test/abicheck.md":"6b4a87d760=
b3848fb1ded6782e02a1d074d9e487bdabb29274a62b31cdf48772","src/zlib-ng/test/a=
bicheck.sh":"7ca2884ff37c697d380f620554525f9b9dc7fa76b45f866d284b2ea5b98c65=
cc","src/zlib-ng/test/adler32_test.c":"db3e8ad9a4e2ecce0c052b0bfe19834d3ff2=
fb2e9239cc3438a2c95db00b1d21","src/zlib-ng/test/crc32_test.c":"8f1223d8aa4c=
52a5e7323f422023f6b892ce684eaf7439ad905b855293f40143","src/zlib-ng/test/dat=
a/fireworks.jpg":"93b986ce7d7e361f0d3840f9d531b5f40fb6ca8c14d6d74364150e255=
f126512","src/zlib-ng/test/data/lcet10.txt":"1eb5d7bddb1c3cb68064d5b5f7f278=
14949674b6702564ff7025ced60795a6d9","src/zlib-ng/test/data/paper-100k.pdf":=
"60f73a051b7ca35bfec44734b2eed7736cb5c0b7f728beb7b97ade6c5e44849b","src/zli=
b-ng/test/deflate_quick_bi_valid.c":"a36697e5779a645354823f14540bd60b9378c2=
f4c5f2bb981d86bb34f29fcbb0","src/zlib-ng/test/deflate_quick_block_open.c":"=
455bd347bb88debdfacb409846170274991ec9ba71c52b8fd0e526daf57265eb","src/zlib=
-ng/test/example.c":"1c8d9d14128da9fb5415683aa7318ae0aa94b743f75905288a2a9d=
ecd4ead98d","src/zlib-ng/test/fuzz/checksum_fuzzer.c":"65a96358c9a82efc4b25=
1b4f322b02fade7b69f9bc6ac07294e641e3fe1ccdb1","src/zlib-ng/test/fuzz/compre=
ss_fuzzer.c":"1ab70608075c4bc60f89aa2f327cff88362ee7b1d31da88ed54ca51e5f99e=
5c9","src/zlib-ng/test/fuzz/example_dict_fuzzer.c":"be68f9eee3deae7f9163c62=
88742e5455bc28f659f80fdb276fafe215f028b97","src/zlib-ng/test/fuzz/example_f=
lush_fuzzer.c":"f12246a184dcfe0a19a98cdc742a1fe8da388ad20b406635d63f1fa10d4=
5b9ca","src/zlib-ng/test/fuzz/example_large_fuzzer.c":"f490abcd332fb4e79212=
92adf6876d38d7f71c8d2443212c781ba88957ff9303","src/zlib-ng/test/fuzz/exampl=
e_small_fuzzer.c":"a9b3436b291ace821b6013311a1100e19a9e1c67fefd3f97dbd60688=
f9bf22b1","src/zlib-ng/test/fuzz/minigzip_fuzzer.c":"5faecfe9e6ecc47e746151=
bd1cc24a2e2dba8b7ffeb270d2c88cb126273ab446","src/zlib-ng/test/fuzz/standalo=
ne_fuzz_target_runner.c":"f25649ed35b8b7a3899c8d7ff52f9972dfc7bf274889e0a7a=
77fbfdf1c1cfef0","src/zlib-ng/test/gh1235.c":"8310ef780dc483a1708750cd7c120=
b8e9cc0e1614767d24c01869e529074e981","src/zlib-ng/test/hash_head_0.c":"448d=
ef3e8ea13fbcac86202e50b8a71b6cea585d7bdbca0bc6cf6056e4059f98","src/zlib-ng/=
test/infcover.c":"9c0e8068fdc614b1852e8d274231b41ce3ce975d4419ed31e700a0b05=
e702303","src/zlib-ng/test/inflate_adler32.c":"ab430c97ae8f569784710118038e=
8ebf53f4136d1a957e1277c0904f9218340b","src/zlib-ng/test/minideflate.c":"34f=
dce39628ffd173f7736d9fb65dfa40d0b0289def64b935075f6c6cffe1999","src/zlib-ng=
/test/minigzip.c":"7dbce6528601f7fdd586280885ed439cb539e15f36dd3974274729bf=
cdd41928","src/zlib-ng/test/pigz/CMakeLists.txt":"aa70f1025adc004985bfe0acc=
ee9b7a80e04786d82705e27c377a5e8d4ecbaaa","src/zlib-ng/test/pkgcheck.sh":"58=
1b3de9c58e96038af94c73cbdb30eed32900f7abb8fa7692426fa68059b0ef","src/zlib-n=
g/test/switchlevels.c":"ceb6cc4d48a637562009d8f7f82635fa9942acd1bfd597acd99=
454a03a3a98e3","src/zlib-ng/test/testCVEinputs.sh":"5de6198444c16726f8e0a8f=
2beb5b89c5ae7e7e3736ce760b9fbc719493e7e4f","src/zlib-ng/tools/codecov-uploa=
d.sh":"ec7a8f1405820810e486e3d7e2fda7eb958c17877b0000b93abdf09d87732a2f","s=
rc/zlib-ng/tools/config.sub":"32186cfeb5db62c99e1dfbfb07f24c1a50977447b4c26=
d2907021c74422a70d2","src/zlib-ng/tools/makecrct.c":"55c8f7b8e29393e95988a2=
9de8cb1a1bdf2738a69d53627bd0f9d7bf169bf0a8","src/zlib-ng/tools/makefixed.c"=
:"bffd02540231304f9bcc755b8cb9ae5cfbc48975857bbb4547f1d6acce21ef57","src/zl=
ib-ng/tools/maketrees.c":"30e9f70addf691d1241e594a7f31fc78b119b65e8af9ac8e2=
0fe6da01635d3b3","src/zlib-ng/trees.c":"2cd9a1dc8d9231e9fc4e53e56b87307989c=
1b7f33212cde4ee434ef71c28af2a","src/zlib-ng/trees.h":"24174f3543b01ee1ef370=
bbf6d15551a21871cded18b2aadf09a71e7904b6f99","src/zlib-ng/trees_emit.h":"2e=
93093ae5362523a26877d6fd663bb05793795889d2bfb987cbada9a9dc4517","src/zlib-n=
g/trees_tbl.h":"35f4fd0ec080c1ade342e2dd1b0f5cdc7e9f18990faa48d7a8a69bc318e=
be607","src/zlib-ng/uncompr.c":"4ebb486b27930f8a6ec4a3cc90a207d0bcf8a4779d1=
dbf3b2184a2b2a5735cd1","src/zlib-ng/win32/DLL_FAQ.txt":"f17fd3823726adbae63=
b91c00d5db1dccae2e289258edabbbbebde04bb6e7e8c","src/zlib-ng/win32/Makefile.=
a64":"775d6902373d1583430b5d7467f001746be323610c89be27e02bbfe0205994f3","sr=
c/zlib-ng/win32/Makefile.arm":"7535e022f482920c3fa7a267e84e39ad790d150f72e5=
c30414baa156c2fdd9b6","src/zlib-ng/win32/Makefile.msc":"d769a00c0ad4cb5fc62=
4d2ae004dfa3785a2f4310324b03afd2156e759003a06","src/zlib-ng/win32/README-WI=
N32.txt":"cdcca6e7a5d2d23618a48fafb8eea347227f8ecf1f38a6aa90f0e7e455bc6574"=
,"src/zlib-ng/win32/zlib-ng.def":"f240276caf805a10d024fc6a66efe915c435734c6=
9732818d92fb04d08ab350c","src/zlib-ng/win32/zlib-ng1.rc":"ea0ea4d116b583510=
b113a27fdec2ad4f0890206963f0e3838f275b8005dde5d","src/zlib-ng/win32/zlib.de=
f":"d9c371ff2677567350386441a2e3d0258010d6502290bbac5ac42ea168bd5212","src/=
zlib-ng/win32/zlib1.rc":"ec5021dba35f9fae5f5f82ad6b6bd059928548e0608e4ede0b=
cffccf5c1210a1","src/zlib-ng/win32/zlibcompat.def":"73728b9df4379dc70ebd9b2=
a9f20d6e4ed7c031fa1f351cdeae1de7d1db05bd1","src/zlib-ng/zbuild.h":"d4d52d32=
96cc949a5d694e7349a8236854f2ec116c184a310e4e62b28caf5b63","src/zlib-ng/zcon=
f-ng.h.in":"f206ac69c1fa48c670648d26028263372a539ed1243a9a26e5b35bf52e2363f=
f","src/zlib-ng/zconf.h.in":"dbf08736c3bc5e41242b09e13d0a523b440250410476dd=
58747c14e28984f1e5","src/zlib-ng/zendian.h":"f5cfa865281d2c5d0b097d318500f2=
7daeec346e7882de68e279486d79c52e77","src/zlib-ng/zlib-ng.h":"d51896e8411868=
ed195d5cf41fda4f1c5a9c891832dfd16b559a5ed6beedd890","src/zlib-ng/zlib-ng.ma=
p":"03ef4439594619e215dbb1717f8c13e16159308ef3817761ba1a3cca7f7834df","src/=
zlib-ng/zlib.h":"7e3666971e08019fc7097f11d593aac9ff6824a1ecc945c48f76009f7c=
27d55a","src/zlib-ng/zlib.map":"9997aa913dec6da106ab2089d2a72ca5e1b7fafe080=
7ac0bc1318ce8c8defab9","src/zlib-ng/zlib.pc.cmakein":"17668e07edbe5971043be=
a26a2f2b92c4c7cf4724620f1156f3ea1436d2aac93","src/zlib-ng/zlib.pc.in":"cf94=
c9aa44878a62e27c2f75354c08326b3bb5250a9b11496855cf59691177bb","src/zlib-ng/=
zutil.c":"53418b23c7878e968b4d04df8ebac74f64f60d32277f2343d16da52059dbc782"=
,"src/zlib-ng/zutil.h":"a14c18dd4a96909aaf0aa016cb6df97d77cf5b735283527c906=
181eead22f0e9","src/zlib-ng/zutil_p.h":"c259b33614007463b41d4184e0bdf10d623=
25445ee9308e1e1885862d201657a","src/zlib/CMakeLists.txt":"d3ea46cd350c74c21=
c2dd97f6d0ad354db76b2b43cc91ec1144b88267f67a588","src/zlib/ChangeLog":"6933=
f4ab74360476bc80d9eda2afd98f93588a5d276e1197926267421dd6959e","src/zlib/FAQ=
":"1e8a0078be0ff1b60d57561a9e4a8cad72892318a8831946cba1abd30d65521c","src/z=
lib/INDEX":"3b4e325d47ae66456d43fcf143ba21ab67a02a4f81be7ef2da480ba30d77426=
6","src/zlib/LICENSE":"845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1=
ed2495753243","src/zlib/Makefile":"ef23b08ce01239843f1ded3f373bfc432627a477=
d62f945cbf63b2ac03db118a","src/zlib/Makefile.in":"77a662b885182111d7731eef7=
5176b4c5061002f278b58bf9bf217e2fa16cadb","src/zlib/README":"4bb4d5664fb9d06=
ef0d47e8ef73104bd545a5a57eb7241be4f2e0be904966322","src/zlib/adler32.c":"d7=
f1b6e44fee20ab41cef1d650776a039a2348935eb96bcbd294a4096139be3a","src/zlib/a=
miga/Makefile.pup":"a65cb3cd40b1b8ec77e288974dd9dc53d91ed78bbe495e94ccc84dd=
d423edf1f","src/zlib/amiga/Makefile.sas":"0e63cf88b505a1a04327bb666af3a985c=
5e11835c0c00aed4058c0dcc315d60e","src/zlib/compress.c":"6d0f0d0784744acca26=
78ce325c8d7c4c030e86f057adb78adcee111d2248c0d","src/zlib/configure":"2d964a=
697f9060d3a8fc5b4272c9d07b22e5fe6f5cf327e5c29f62f67d935759","src/zlib/contr=
ib/README.contrib":"b925ae08d371b33c4b5ffd67c707150729a476caf47cfe2eafc0022=
91f23f931","src/zlib/contrib/ada/buffer_demo.adb":"469cf566a6965767fee6b987=
a239ed8cedcc66614940d45a9b434331fbb435ce","src/zlib/contrib/ada/mtest.adb":=
"41b6f31684770334afdc4375871eb1408542f37a823a073556fdbfdb63753160","src/zli=
b/contrib/ada/read.adb":"fa5b989aef0c5715a3fcb15de93985f7f10aeb0a7f5716745c=
95ed820eb9af9c","src/zlib/contrib/ada/readme.txt":"8fe9e5303f2e8e8b746c7825=
0e74b7c4aeb7ce6212fdce751fc3a0ce56a47fe2","src/zlib/contrib/ada/test.adb":"=
5e3abe79b387e09a9a42bd0543105e228f39a335240cffc33d71f0ba66ff2511","src/zlib=
/contrib/ada/zlib-streams.adb":"f45988e2bac76eb25a0dc981f46576e7432c35dde17=
90bbc2b650f0090b7fa72","src/zlib/contrib/ada/zlib-streams.ads":"969e8edb061=
1810fb52159dcb7c40228f4e5da810a7a3576b778116a93038c6b","src/zlib/contrib/ad=
a/zlib-thin.adb":"03d89244ee5ec9771d9b5050e586c609f851af551b2e64eb151f1d5be=
0b63ae9","src/zlib/contrib/ada/zlib-thin.ads":"631ef170bde16c3ca8d412b54a0e=
519815b80197d208f8f393e6fe017bb0968e","src/zlib/contrib/ada/zlib.adb":"c9ca=
5dc34fbcdf06e2dc777b7e9dcd0ba31085b772b440eb0e12421323ab672c","src/zlib/con=
trib/ada/zlib.ads":"02634bec0d5e4c69d8d2859124380074a57de8d8bd928398379bfac=
c514236d2","src/zlib/contrib/ada/zlib.gpr":"859bb69dce38dbe9dca06753cf7ae7b=
d16d48f4fece8b87582dab8e30681d3de","src/zlib/contrib/blast/Makefile":"17d5d=
26c24bf51cad51045a38ffb73cc3539d29e89885aa249fcfd45a8659d5c","src/zlib/cont=
rib/blast/README":"baa763ae03d88ef7ece6eb80d9a099b43d0b57639d6d281e1c7c6ca7=
9d81daba","src/zlib/contrib/blast/blast.c":"1ab3e479d342bfc144167b808fb0014=
2264bc50f24a110ca88cc774e351c218e","src/zlib/contrib/blast/blast.h":"9c1c42=
2b76311d4cb06863ffc056668b6240f3dd998bc02e89ee590d482bfdc2","src/zlib/contr=
ib/blast/test.pk":"5f5c262c545574a5c221132d5ef832478d222d70b015341795b38602=
04140d7c","src/zlib/contrib/blast/test.txt":"9679b2c98e1283222d0782b25a1c19=
8dc64ba9ebd1addd6dc6f643a45947cda3","src/zlib/contrib/delphi/ZLib.pas":"6dc=
c65866e3fb3d33d2a2328c547458156883a3e6749d52ded209357a49d61de","src/zlib/co=
ntrib/delphi/ZLibConst.pas":"84bcc580bdf397e570f86f3f5a5b8c7bf537828f30b4b7=
2648b81911f6bf5095","src/zlib/contrib/delphi/readme.txt":"f7420ed2de77d4b49=
8eefbbe6402a1d17dc2d411735289c78a265c7f10fdaee5","src/zlib/contrib/delphi/z=
libd32.mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b7226988776f8d5=
11","src/zlib/contrib/dotzlib/DotZLib.build":"b96137097669644ecb9f42cdd3399=
d1fce9c512788374609303f7e50abf597f0","src/zlib/contrib/dotzlib/DotZLib.chm"=
:"20d0e3edd57f849143255a7f0df1cd59d41db464a72c0d5ab42846438a729579","src/zl=
ib/contrib/dotzlib/DotZLib.sln":"a979198c5b8d144c1ac8f993bfb6f4085d135aa58c=
a9dcf63ebabf52b5c695f7","src/zlib/contrib/dotzlib/DotZLib/AssemblyInfo.cs":=
"314afcfb339ea95f5431047b7ab24631b11c3532c7ce5dc2094ed0cf80a7c16d","src/zli=
b/contrib/dotzlib/DotZLib/ChecksumImpl.cs":"e7c047a2c3bcf88d3d002ee3d2d05af=
414acf53cb4451efacc0f2e95a474ea0f","src/zlib/contrib/dotzlib/DotZLib/Circul=
arBuffer.cs":"be84c9736fe7bdc2bfae70466d8fff582504e928d5b5e110fd758090090c8=
cb7","src/zlib/contrib/dotzlib/DotZLib/CodecBase.cs":"259bdda1b7d6052134e63=
1fa24bfd9dca6e2362563496c8b85257b56c848908c","src/zlib/contrib/dotzlib/DotZ=
Lib/Deflater.cs":"06ba6696a3c15c53ba5fd5a1c2bf50b51f217010228fc1e4c8495ee57=
8f480de","src/zlib/contrib/dotzlib/DotZLib/DotZLib.cs":"9837fe993fd631233cc=
5e53ff084d86754b97f05ec77c54b0764c2706f186134","src/zlib/contrib/dotzlib/Do=
tZLib/DotZLib.csproj":"21606db31dfef6410dd438b73f1db68856eacabcce6c0f0411fc=
4f17e17001f3","src/zlib/contrib/dotzlib/DotZLib/GZipStream.cs":"8d1de9755c7=
7046b4ac71340a0a54434ebf4fd11b085c44454d7663a9b4df1c5","src/zlib/contrib/do=
tzlib/DotZLib/Inflater.cs":"9016ca73818f5b6a28791abc3af6da7c4d2773b6a3804f5=
93f6d5737a62b99ad","src/zlib/contrib/dotzlib/DotZLib/UnitTests.cs":"c95048d=
763c7e367ba0bb7c31981e0610131fa12356bbd9bfdb13376778e9a0c","src/zlib/contri=
b/dotzlib/LICENSE_1_0.txt":"36266a8fd073568394cb81cdb2b124f7fdae2c64c1a7ed0=
9db34b4d22efa2951","src/zlib/contrib/dotzlib/readme.txt":"d04972a91b1563fb4=
b7acab4b9ff2b84e57368953cc0596d5f5ea17d97315fd0","src/zlib/contrib/gcc_gvma=
t64/gvmat64.S":"22ff411b8b1d1b04aeaa8418b68245400267dc43c6f44104f6ccd37f0da=
ee89f","src/zlib/contrib/infback9/README":"890288f02bb3b1f9cc654b87a07fcea6=
95f90f6b9bd672d25bf6be1da2ec1688","src/zlib/contrib/infback9/infback9.c":"0=
a715c85a1ce3bb8b5a18d60941ffabc0186a886bcc66ba2ee0c4115a8e274e9","src/zlib/=
contrib/infback9/infback9.h":"dda2302f28157fe43a6143f84802af1740393572c2766=
559593996fd7a5a3245","src/zlib/contrib/infback9/inffix9.h":"84a2ba4727767c1=
8af6505f0e81d9c814489c8b9ed330a25dad433db72997e43","src/zlib/contrib/infbac=
k9/inflate9.h":"32a907676cc36e27d0fdc0d99adb83a0b23f20ab61896269216d40fecf0=
8d349","src/zlib/contrib/infback9/inftree9.c":"1f262e5ae8094c9d8b172241e567=
c86be560327b840ca8fb771e98461bcb158a","src/zlib/contrib/infback9/inftree9.h=
":"145072793141cb313c91cdf9dee9d4b8e8a38d77099f87e9cd05c7b5ead8f099","src/z=
lib/contrib/iostream/test.cpp":"0f3c77e013949eb9c91e6b690ea894e19d97944d6b0=
885b82806fc3ad99680cf","src/zlib/contrib/iostream/zfstream.cpp":"8ebb9b3d52=
1cc3392953f27658cf1f6dcb763216079f69a1518ec5ca0e42a63b","src/zlib/contrib/i=
ostream/zfstream.h":"4369c35e66f63f52ca4a5e1759bf720507ccabb8f3f132e2f18e68=
686c812401","src/zlib/contrib/iostream2/zstream.h":"d0343e0c57ff58008b6f296=
43d289c72713aa2d653fe3dcd2e939fc77e7e20b6","src/zlib/contrib/iostream2/zstr=
eam_test.cpp":"f789df183cc58b78751985466380c656308490a9036eb48a7ef79704c3d3=
f229","src/zlib/contrib/iostream3/README":"43ec48ecbd95a8c45db20b107fac73b7=
40bb11595a4737329188f06b713972cc","src/zlib/contrib/iostream3/TODO":"af5ebc=
83fb88f69706c8af896733784753dead147687e1c046f410c0997fd88b","src/zlib/contr=
ib/iostream3/test.cc":"8e17fc48dfdbc6e268838b8b427491b5843b6d18bc97caa6924d=
e9fad7abe3da","src/zlib/contrib/iostream3/zfstream.cc":"8cdd67ed0b13c192c11=
e5ea90e9d5782d6627eb303fbc4aa5ebda2531ec00ff8","src/zlib/contrib/iostream3/=
zfstream.h":"1bd74778fac45ee090dfc0f182a23e8a849152deb630606884b2635987b357=
b1","src/zlib/contrib/minizip/Makefile":"0f59cf07531cf34cb359f9dbe26d8207a2=
bbbdad618557894eb629925f7e8899","src/zlib/contrib/minizip/Makefile.am":"231=
3a3480a2c3745fa7ce216829cd0367058907d3a0902e5832c66c84a2fdfc6","src/zlib/co=
ntrib/minizip/MiniZip64_Changes.txt":"302c62b328647f5472fb7755249a83459be7f=
8ffb1fae07e8ba318fce8f4126c","src/zlib/contrib/minizip/MiniZip64_info.txt":=
"122719c32ef1763a5f6ba9c8cdefc1d78a76f7156b09e7b6f69b73f968e0dac3","src/zli=
b/contrib/minizip/configure.ac":"959e4762ddcb36dcf30512611ca9fbcbcd0c943228=
a6ac2975708798ae09a438","src/zlib/contrib/minizip/crypt.h":"1d25a0fab3189dc=
3c6ae43c7813e1e5d07d0d049bd32bd7bd0e9ccd752bfdd5e","src/zlib/contrib/minizi=
p/ioapi.c":"f6878a3ecf6802f0f75cadb41a114fa274636c386bac794c66cbb27a24d9a29=
f","src/zlib/contrib/minizip/ioapi.h":"9f5448f8d5e8894d6f397dd09d24f7ff39cb=
818cd493a8bd90dda19553b814ea","src/zlib/contrib/minizip/iowin32.c":"103cdef=
91d57ceca7a1c1973772ff7e1d44c7b3e227a3640171957302bd9e974","src/zlib/contri=
b/minizip/iowin32.h":"586f22b9c3c64da253ce2b518e0fad61f19a7b47b289fc704cc97=
08242294c49","src/zlib/contrib/minizip/make_vms.com":"65736d9c4888f2373d3db=
0a13864d150c5040453f5bc2a5c8784379a7ea67590","src/zlib/contrib/minizip/mini=
unz.c":"b29dfb4cff9763497d8f0656c97027995e1ea0b4104e4a217ba7882337ae7a7a","=
src/zlib/contrib/minizip/miniunzip.1":"66d8684392167091ef0fe01598d6a0daa26e=
7e448e2df6c3cb257487735b83f7","src/zlib/contrib/minizip/minizip.1":"5404596=
e8e5587a52f563906119f32ceee30a6d97a966afa5c7afbe4d373e210","src/zlib/contri=
b/minizip/minizip.c":"b5b8f380297be0d90265356704df1e41bee0e903a2169263a2b50=
dc22cc3180a","src/zlib/contrib/minizip/minizip.pc.in":"8b6670b42d8e5e519e1c=
c89db093efc07ba23cb1ddfedd3c93ff2df08c3ce8ac","src/zlib/contrib/minizip/mzt=
ools.c":"cd887c4af6d20823bd15f24008b10acf01969b4165d7848656bde843a92428d7",=
"src/zlib/contrib/minizip/mztools.h":"6f82c52279e8f79165f4446be652e5741a499=
92ac58632470335aa34c564072a","src/zlib/contrib/minizip/unzip.c":"fc9e8d7526=
18a05c1f3a2ce61ebf76d0c8053dd5579458f836834a36e8690bbe","src/zlib/contrib/m=
inizip/unzip.h":"20cdc47658a3e41db897d31650e46cd2c8cca3c83ddaaeb6c7a48dd8b7=
f18e03","src/zlib/contrib/minizip/zip.c":"bee2d6fa310c9451b24c036d5840a8c7c=
90b7cf8d12d5767175c207e56fefcc3","src/zlib/contrib/minizip/zip.h":"75b635dc=
a8294790ab7ec1f72e9f1fd352d75b189c3c9b61c68f76bd7e612043","src/zlib/contrib=
/pascal/example.pas":"d842d456ecb6ff80e34cee2da31deb2072cc69ca837497bea8b8b=
ee203403474","src/zlib/contrib/pascal/readme.txt":"02f997c37991ddae0cb98603=
9f7b4f6fc816b3fd0ffd332cad371d04c12cf1b9","src/zlib/contrib/pascal/zlibd32.=
mak":"850e91b6c9ea05de61a411cbda16fa0f10118cd88bb32c4b7226988776f8d511","sr=
c/zlib/contrib/pascal/zlibpas.pas":"720346d2f40429de31bb16a895f42e878f259b1=
aff7d46c63e6616e629b3f7d5","src/zlib/contrib/puff/Makefile":"d9d738030464aa=
ae354196c14fd928adf591832fce7d71ac1977c1d8d4923a4b","src/zlib/contrib/puff/=
README":"c5b9852fb11e0d6b6e916e5134cf034524d901b95368972133e0381e480eb479",=
"src/zlib/contrib/puff/puff.c":"433f7f4495481dd95576dbb548b1bcfc5ca129d3042=
1695fa609f5f6c14908b6","src/zlib/contrib/puff/puff.h":"969b7be2a930db0cdcb1=
9b0e5b29ae6741f5a8f663b6dba6d647e12ec60cfa8e","src/zlib/contrib/puff/puffte=
st.c":"d24e31c1d277d07c268f34e9490050c6b53c68b128da3efbb1d05fc5b31004f7","s=
rc/zlib/contrib/puff/zeros.raw":"b7b0887089f7af1f6d1e0b4c0a1e8eddd10223b235=
54299455c6c9be71b653a3","src/zlib/contrib/testzlib/testzlib.c":"c6c37b35c6e=
cc9986a9041f86d879cc37a9e4d8315af9d725071eb3b2cade0c5","src/zlib/contrib/te=
stzlib/testzlib.txt":"2359bbdc84eb8a04e0f1cd16cd81a2896e957f2ad58dab3ca78ef=
55b7d0dc577","src/zlib/contrib/untgz/Makefile":"8f5ab1564813e091cea8f1bb63d=
a32fd80ac763d029277b0cabf50f60aceefe1","src/zlib/contrib/untgz/Makefile.msc=
":"d0f537de11d9e0e36e2a98b3971c537265f4b533b4c48797094365ad9ae8388b","src/z=
lib/contrib/untgz/untgz.c":"9a12d774301d252dcd38bba07ac369319da4c04c4fef8a5=
0fcbf40aebf29c2a1","src/zlib/contrib/vstudio/readme.txt":"df5fe112bef3c23d5=
767602736f6d0ce43cbb49b584210fe57f6f59e634a49d0","src/zlib/contrib/vstudio/=
vc10/miniunz.vcxproj":"dd607d43c64581172c20c22112821924dfe862f56b2e5eb8780b=
dd0714d9527b","src/zlib/contrib/vstudio/vc10/miniunz.vcxproj.filters":"4b84=
66bf00c70b81c31cc903e756e04151fd90fdcbe102f3568a2c8b6190ea27","src/zlib/con=
trib/vstudio/vc10/minizip.vcxproj":"af73f2cf8ae51e65e85342faeb40849a2310c97=
bc77def42b38d7070460a6cf0","src/zlib/contrib/vstudio/vc10/minizip.vcxproj.f=
ilters":"f2815f9e3386c393d0a351632823b221ef9689da1f422ecaa561dba2a612fb0a",=
"src/zlib/contrib/vstudio/vc10/testzlib.vcxproj":"c21e64259bf9efe97e1103212=
e7a6e1b7372b50067b4ba14cfa678e1f491095f","src/zlib/contrib/vstudio/vc10/tes=
tzlib.vcxproj.filters":"a7caddbac3ba90b5d482e6d926ef35cc40dc3553ed3776ef6b6=
8a528fd5b0631","src/zlib/contrib/vstudio/vc10/testzlibdll.vcxproj":"3f317d8=
964f17901c3e68bff5deaec10b6ccc50a572235999e8097292692984c","src/zlib/contri=
b/vstudio/vc10/testzlibdll.vcxproj.filters":"29c9535775aa76320ee4efd001d419=
61faf6c58cedd8b29d3986e85f73d2f6fb","src/zlib/contrib/vstudio/vc10/zlib.rc"=
:"6041a4727ea47520058a5b4bb8de87592883eb7f26dd39df62879c347f3888d1","src/zl=
ib/contrib/vstudio/vc10/zlibstat.vcxproj":"50402ab8c63f746c034d6ce51d9612af=
f5b6af9aa27790cffa4b7deed4b30eb8","src/zlib/contrib/vstudio/vc10/zlibstat.v=
cxproj.filters":"eeb1de64c252c46b822f73f272127f6f9f0570ef22d234e093070ba95a=
4dde24","src/zlib/contrib/vstudio/vc10/zlibvc.def":"a228e521a561d4456c83c70=
81b4e9950cfce99133af7d5fdd27f12a8fd53efde","src/zlib/contrib/vstudio/vc10/z=
libvc.sln":"e659860f705f31b87ea9139a3cb4ebe1561e120bce495383a54614fc82b4999=
0","src/zlib/contrib/vstudio/vc10/zlibvc.vcxproj":"efad8cb150c0e5122f8c700d=
95c5de659dff92b171917c66bdbd082fff500b58","src/zlib/contrib/vstudio/vc10/zl=
ibvc.vcxproj.filters":"c801732b7c7017796add50d2b71a228f99f95a46650baad307ff=
7e8358a2bfb0","src/zlib/contrib/vstudio/vc11/miniunz.vcxproj":"746e4c11fb8a=
f4bcd6a9d68ba81ed1dc366a5de3bed56b291ee969ad733a7bb0","src/zlib/contrib/vst=
udio/vc11/minizip.vcxproj":"340617cae9cf4fcb003308021d3782ec3639e60d62d79a3=
aafc0a50bb55b061e","src/zlib/contrib/vstudio/vc11/testzlib.vcxproj":"99eadf=
df2e41bc036141c174c4d0035d87572ce5795dcc28f39133f818a79d08","src/zlib/contr=
ib/vstudio/vc11/testzlibdll.vcxproj":"583bdef522b0176829f0d8139ea2a88b9cbc1=
4379d1334f3a863989ed3df9b67","src/zlib/contrib/vstudio/vc11/zlib.rc":"6041a=
4727ea47520058a5b4bb8de87592883eb7f26dd39df62879c347f3888d1","src/zlib/cont=
rib/vstudio/vc11/zlibstat.vcxproj":"b07f792843d05ac883391075bc3b9625437490d=
8d40944ad359aa2134a09a3aa","src/zlib/contrib/vstudio/vc11/zlibvc.def":"a228=
e521a561d4456c83c7081b4e9950cfce99133af7d5fdd27f12a8fd53efde","src/zlib/con=
trib/vstudio/vc11/zlibvc.sln":"27389b515997defd080519f95aff87e89fcbe8b26d73=
c5ebb73c544cfef4d60e","src/zlib/contrib/vstudio/vc11/zlibvc.vcxproj":"d02d0=
14ef957119a6fd0ab243c892b74d1592b117750b95fed21097c8ed922d9","src/zlib/cont=
rib/vstudio/vc12/miniunz.vcxproj":"1494af54570f6e93852932956d49a8c25e57b5ab=
c1ac979945605ca9143df9f8","src/zlib/contrib/vstudio/vc12/minizip.vcxproj":"=
9bf128ed6760ca5f019006f178b1c65f4c7ff122dba8d297b64b0eb72feeb120","src/zlib=
/contrib/vstudio/vc12/testzlib.vcxproj":"be88bc1220c0447c2379fdab3ac88055f5=
8a8a788d3e9cec494342187e760eaf","src/zlib/contrib/vstudio/vc12/testzlibdll.=
vcxproj":"93416510256935d79625dc9fd349cfce6968c062d42a138bec404a26b2f92f5e"=
,"src/zlib/contrib/vstudio/vc12/zlib.rc":"90067be57a8c5df594a850352642f8b1d=
cb32e3d088d3805ebafe75a27412b74","src/zlib/contrib/vstudio/vc12/zlibstat.vc=
xproj":"faa229a851c76b77d65bb4742d8369efe566652bb6a1447d1e3539f289b5313d","=
src/zlib/contrib/vstudio/vc12/zlibvc.def":"a228e521a561d4456c83c7081b4e9950=
cfce99133af7d5fdd27f12a8fd53efde","src/zlib/contrib/vstudio/vc12/zlibvc.sln=
":"162e0faa80a56d89eea71a0b89377708eec2faa0dc72091cc0abb07fbdea49a0","src/z=
lib/contrib/vstudio/vc12/zlibvc.vcxproj":"8ac8cb2d29b880a738011d29d0511af9b=
14f321bed90f674109c446f4108d442","src/zlib/contrib/vstudio/vc14/miniunz.vcx=
proj":"0312511d4a30cea979c4e36edf994a537ed8a9d924f6b5c536cbcd094773c11f","s=
rc/zlib/contrib/vstudio/vc14/minizip.vcxproj":"9e7bb7a6ac723e4b2db900627c36=
6f9bb93a351381995d9c69a50c0126f64233","src/zlib/contrib/vstudio/vc14/testzl=
ib.vcxproj":"88667873d9d61d65016b9501ca925532eb55f56230e5911d3e2a01cd8a9fb2=
a4","src/zlib/contrib/vstudio/vc14/testzlibdll.vcxproj":"69f544898b4275cd3d=
8e19b8f1f8cb39c1cb98a30cdb033242e4b94c57bfa150","src/zlib/contrib/vstudio/v=
c14/zlib.rc":"90067be57a8c5df594a850352642f8b1dcb32e3d088d3805ebafe75a27412=
b74","src/zlib/contrib/vstudio/vc14/zlibstat.vcxproj":"5629eb0cc30674a39aa3=
636f1cdd190393b0dbd4c69a35e36ad85b6340055605","src/zlib/contrib/vstudio/vc1=
4/zlibvc.def":"a228e521a561d4456c83c7081b4e9950cfce99133af7d5fdd27f12a8fd53=
efde","src/zlib/contrib/vstudio/vc14/zlibvc.sln":"47a50bbde8ca6336cecd8c0e4=
b65e515fc46ae84c7b61008ac9864162f777286","src/zlib/contrib/vstudio/vc14/zli=
bvc.vcxproj":"09f496a2ad3afdd5e3f36b7285440369dcac4559656edc00ed7a74c7ec9fa=
10f","src/zlib/contrib/vstudio/vc9/miniunz.vcproj":"7db9b2ef5ff05d3de4ba633=
feab10e85d45434c865d520ffa1974421904996f3","src/zlib/contrib/vstudio/vc9/mi=
nizip.vcproj":"7797a9ad3c0056f3a3cf8fcde7618acd1d151c65d15f841fccd8d9d878ae=
7bb0","src/zlib/contrib/vstudio/vc9/testzlib.vcproj":"8df405917800adccee6ba=
d2116022c2c82d661b37ea40ea16405fe4dbcb4b69f","src/zlib/contrib/vstudio/vc9/=
testzlibdll.vcproj":"cde6806f5c81d1fc311f9921c17ba56f8e386d097783a6a90875d3=
85837c47e7","src/zlib/contrib/vstudio/vc9/zlib.rc":"6041a4727ea47520058a5b4=
bb8de87592883eb7f26dd39df62879c347f3888d1","src/zlib/contrib/vstudio/vc9/zl=
ibstat.vcproj":"d393d418d827ad9fb9c6516f1a7620371d15e3f5afef8ba60b51e50acc7=
199e9","src/zlib/contrib/vstudio/vc9/zlibvc.def":"a228e521a561d4456c83c7081=
b4e9950cfce99133af7d5fdd27f12a8fd53efde","src/zlib/contrib/vstudio/vc9/zlib=
vc.sln":"26e58d4b2cfcd941c367fb2a18537b3b9f002f2ac1278b700ea1129c50501452",=
"src/zlib/contrib/vstudio/vc9/zlibvc.vcproj":"eaca98fcf166738b59fcdbd179dac=
9f98f985c6ba49212b186343a998816f081","src/zlib/crc32.c":"ec3ff0f97858b22851=
3027a490e4330cbb23c6fbdd24d839902ffa89854f209c","src/zlib/crc32.h":"9a22235=
75183ac2ee8a247f20bf3ac066e8bd0140369556bdbdffc777435749e","src/zlib/deflat=
e.c":"4470e36709ce7d6067fa3e8f60bb7f693b055bee42a0d6655ed71faa2db87fde","sr=
c/zlib/deflate.h":"0db1b5ef79ca6ba0f508b7b8bdaa11af45c5ebe2c89ab4f1086dc22b=
963a52fa","src/zlib/doc/algorithm.txt":"992590931e982c0765286c2d83f6e9ff0a9=
5aabb08e28c30c52bae3e8c4bd5ad","src/zlib/doc/crc-doc.1.0.pdf":"064f9252d6e2=
e15ea56c2bd18e160e5c9c84bcd137c11a7af497aaa511ace998","src/zlib/doc/rfc1950=
.txt":"8f0475a5c984657bf26277f73df9456c9b97f175084f0c1748f1eb1f0b9b10b9","s=
rc/zlib/doc/rfc1951.txt":"5ebf4b5b7fe1c3a0c0ab9aa3ac8c0f3853a7dc484905e76e0=
3b0b0f301350009","src/zlib/doc/rfc1952.txt":"164ef0897b4cbec63abf1b57f069f3=
599bd0fb7c72c2a4dee21bd7e03ec9af67","src/zlib/doc/txtvsbin.txt":"d1549fb751=
37f03102798f70fd34ff76285e717ddd520dd82274c1c0510eacf0","src/zlib/examples/=
README.examples":"1bc1c677bbebe1aa5e85015bb62f0cf3fcdbf95652d30494159bee616=
6c1854a","src/zlib/examples/enough.c":"c14a257c60bbe0d65bb54746dd97774a1853=
ef9e3f78db118a27d8bc0d26d738","src/zlib/examples/fitblk.c":"fd8aaaefd5eb3d9=
fc388bdc5b715d1c6993ecc9367f5432d3b120a0278904edc","src/zlib/examples/gun.c=
":"3bfd36b06284ba97d6105b8a6a5d18b2b34b75b3a1285f16d018680fb174915f","src/z=
lib/examples/gzappend.c":"6de91c8305e37560117bff44136abff72b16b028c0bda0bba=
c7ea07e4988b0ce","src/zlib/examples/gzjoin.c":"90b9d6c39a5fc91cf1cc9b96b025=
a508a8015dc502cd9374c754b44078593f57","src/zlib/examples/gzlog.c":"19687202=
1c96099fd30c880ac2cccd1350fdbd81179731f3914153a26ebf72e9","src/zlib/example=
s/gzlog.h":"681f280437f867820bf39880e2f4fc641d402879e399ba2e6a31d73feefe8ed=
c","src/zlib/examples/gznorm.c":"e5a8f5c3b107f27212f7d5fbfcf072a337a1b4ea32=
929ae31c168997438a5cc0","src/zlib/examples/zlib_how.html":"80fb647be8450bd7=
a07d8495244e1f061dfbdbdb53172ca24e7ffff8ace9c72f","src/zlib/examples/zpipe.=
c":"68140a82582ede938159630bca0fb13a93b4bf1cb2e85b08943c26242cf8f3a6","src/=
zlib/examples/zran.c":"10f9568b1f54cdb7474a38c5bc479aa0edb07a0eed2e999bdad4=
c521f6b25330","src/zlib/examples/zran.h":"9a0d4c15f898c43deae2c5e98a5c66c63=
7a1b25573d662fe91a789c386eaf971","src/zlib/gzclose.c":"94446cf8cde67c30e64d=
0a335b0c941fd3fbad2e77f30180d12e61f9c2a5a6b8","src/zlib/gzguts.h":"40d57fbc=
ef5d4d849e416e03b680026b18302e4b0da5907a96a012d7ced91b8c","src/zlib/gzlib.c=
":"635b7b6df79a5ce6e0f951669e4c82704d7972d8afb87278b9155c2cb4c5066f","src/z=
lib/gzread.c":"41c69d43fb3974bae58d9169aea3514221f70dc77bb7a35c79626dd3be01=
adf2","src/zlib/gzwrite.c":"c7454689751c8f41ec63a1381a0053fb149095abe1c3b89=
c8a996b2d7ac8adce","src/zlib/infback.c":"6a6cfe3d7e239d590692bc2664ac58d3ef=
92be30ff4cb3c6dbf5deed28f79eb5","src/zlib/inffast.c":"41d93aefdbfee54558091=
30af74fcc76cf7259b1aa8b34d0060d14e57463e8bb","src/zlib/inffast.h":"7d8c1c87=
3ce9bc346ad6005bb9d75cce5c6352aaf7395385be216a9452a34908","src/zlib/inffixe=
d.h":"237ba710f090e432b62ebf963bee8b302867e9691406b2d3f8ee89ee7bfef9b0","sr=
c/zlib/inflate.c":"f1679575fef1717d908dd09d7bfe8fff89c21941cadd7c255a2ccccf=
ba3a287e","src/zlib/inflate.h":"e8d4a51b07694bf48cb91979c19974cf6a5ab0b8a09=
d26ec0d14df349230673e","src/zlib/inftrees.c":"b9db40bbb68b63dccbcdfa78d6877=
51e33178af8669f1c1236309cfd5d2edc0e","src/zlib/inftrees.h":"44084a93673386d=
b6282dcb61d739c84518e10dff66d1c6850715137c827464c","src/zlib/make_vms.com":=
"14ed54bdd391c1648cedfb69d8a73a26dcc7f1187d59b0f18d944b7665cec85b","src/zli=
b/msdos/Makefile.bor":"292ab363f7ffbc4ae84d37cd9bdffd2dac1003bee52d223a8489=
844870f20702","src/zlib/msdos/Makefile.dj2":"9208450c2ae6dcbfcc25560b5b9ca7=
63f461e7246e37b0552474edf8fa898906","src/zlib/msdos/Makefile.emx":"c749d6ec=
7f88e8e639d4f03bdbdcbbe9d1c304210be4c4be621ceb22961d3d64","src/zlib/msdos/M=
akefile.msc":"0e021a6f42212415b060e4ad468eb415d0a8c1f343137fb9dff2cb8f9ead3=
027","src/zlib/msdos/Makefile.tc":"2ae12ee2a3e62f7c5a0520d0fbe4adee772bc07f=
e816002b07ccb43db3daa76a","src/zlib/nintendods/Makefile":"ea5823efe68301322=
94eddf2f56dbd7db8712244c210bb4968c431b1a91bd066","src/zlib/nintendods/READM=
E":"e362426c47b39ff6a7d6c75c6660b20abf076cdfa5e1e421716dc629a71aef95","src/=
zlib/old/Makefile.emx":"d811f032272aae50123a889297af3a02fbd60d1e42bbef11466=
462f627ff7b5b","src/zlib/old/Makefile.riscos":"d1a488b160fbfd53272b68a91328=
3a4be08ba9d490796b196dddb2ba535b41e0","src/zlib/old/README":"551a0f4d91fe0f=
827a31cbdfbb4a71d1f3dc4d06564d80a3f526b749dd104d11","src/zlib/old/descrip.m=
ms":"8ff08c35c056df9c986f23c09cf8936db63ccf12c3c42f7d18a48b36f060cff7","src=
/zlib/old/os2/Makefile.os2":"6ad247c00f00ff42fd2d62555e86251cef06e407937824=
1b5f320c227507d51d","src/zlib/old/os2/zlib.def":"ea9c61876d2e20b67ef2d94959=
91a32798eb40d13ede95859a2f4f03b65b9b61","src/zlib/old/visual-basic.txt":"17=
27650acbde9a9e6aec9438896377e46a12699cca5d46c5399cef524dedc614","src/zlib/o=
s400/README400":"5eb702a0dd460e2bea59ee83014c3f975e892057850c639f793bb74004=
4a38ba","src/zlib/os400/bndsrc":"3c36a17975eed5a8d33bc5443b39fead1e68c01393=
496be9c1f4a61444bcb0f6","src/zlib/os400/make.sh":"143394d1e3876c61c29078c0e=
47310e726e1f5bd42739fe92df9ece65711655f","src/zlib/os400/zlib.inc":"dede389=
61ae2e7a2590343bf1ff558c6f51e46714dec33f2d11d8c34899b3875","src/zlib/qnx/pa=
ckage.qpg":"d521336be75bdd145281c6d166241905751ec97093ecd6fec97a313f631ac0e=
1","src/zlib/test/example.c":"64ae90d60b40a8aec4700e5c4e7a71898ebb92948b7a0=
7f939b3e763cb3e8b35","src/zlib/test/infcover.c":"f654f3fcc74b33bd95cda63d13=
fe0ce589bcfe965544e0c17ee597d75efbd090","src/zlib/test/minigzip.c":"f9777d1=
e8b337573e12daa8091dcf22e88a9b155fc0acad15b8224c377bfe027","src/zlib/treebu=
ild.xml":"89b50165782643554a38d5c58c203d9648b540e5a455531dcb58b5676a019955"=
,"src/zlib/trees.c":"b338f1ec9038bd77efc09c8fdb99ef27b5db5b3da9baa301e544ad=
c8e3b6a662","src/zlib/trees.h":"bb0a9d3ca88ee00c81adb7c636e73b97085f6ef1b52=
d6d58edbe2b6dc3adeb4d","src/zlib/uncompr.c":"7b3d8ca0f10ef7c74044c3172ca8f9=
f50389cd0f270ee4517f438e7e06be5623","src/zlib/watcom/watcom_f.mak":"7e039b9=
12f9cffaa40835281430bb284fa9042b0a0d12f6b34700a06bca6576e","src/zlib/watcom=
/watcom_l.mak":"d11b4064604a034725860e63e3f6d347056372e4b1675b183e20a93533b=
20cc9","src/zlib/win32/DLL_FAQ.txt":"9e00778319381e6275691dd3a89410c99065b8=
c0c5db96473abe8c859cbdefd8","src/zlib/win32/Makefile.bor":"7d73a0d2c3e38b7c=
610bbc9c22f683a4fe1ab9b8b65649a3a8ac4ff7fcc14ba6","src/zlib/win32/Makefile.=
gcc":"97140c30506a8f6b2edb6b3d8a1b6b539d7929d4b957deba9950301090f579bf","sr=
c/zlib/win32/Makefile.msc":"235529bd529d4690d5d4b7871fdd0a1f118f2fe18862cbd=
ec5f5ac674c55a60d","src/zlib/win32/README-WIN32.txt":"f414b3702f8d3bf1de42e=
0f41604bd78c44e537aae16b6107e3cdaa5759caa16","src/zlib/win32/VisualC.txt":"=
9ec0babd46eaa012371dee2d3a8a55d9c7130f7895512c3371c737e4a7f6a997","src/zlib=
/win32/zlib.def":"c00693a5c825f8bfbdb68124fd03cb2fa5269338071147bdaa14434aa=
f3962b9","src/zlib/win32/zlib1.rc":"54e161029b59e99a4f9cb2281b956f00ecfb181=
4318ddef9c741ff4f832c5c1d","src/zlib/zconf.h":"80e0a31a4c0e6f20d1bad0df9927=
1b9d535aa9f7c4e62f1a54f643adb4c6dfa2","src/zlib/zconf.h.cmakein":"bb12900d3=
9488e6a9ed67ebd7cf5599f3ced8937b7077d4d5001e470c7a1392e","src/zlib/zconf.h.=
in":"80e0a31a4c0e6f20d1bad0df99271b9d535aa9f7c4e62f1a54f643adb4c6dfa2","src=
/zlib/zlib.3":"aefd0162070fcb0379dc18e27b039253cd98c148104c1097dd60e0d0b435=
e564","src/zlib/zlib.3.pdf":"91343dffd2876dcf4af567f299ce99872b066232451093=
d6d12e02e4654873d8","src/zlib/zlib.h":"a980a0d104198a53cc220c51ab5856e5be90=
1bec8a2d02e0ee79a8754219dfed","src/zlib/zlib.map":"33e2a7c4defd6222945bb0f7=
191b6380afb4f518e804af86a44aad4a9090bf9e","src/zlib/zlib.pc.cmakein":"2f1d0=
b18ce37c2af415a469857f02aee2c41a58877aff21d29e9c6db32b55cb7","src/zlib/zlib=
.pc.in":"04c01cc2e1a0ed123518b5855f585c93a24526dd88982c414111ea1fc9f07997",=
"src/zlib/zlib2ansi":"b3f9c88abbdf16143e5d5110e44fff198bcda9ee1358e036c8d44=
5e9d0cbce85","src/zlib/zutil.c":"8108af451ad14271065844736ac7c436275b92826c=
319318070508d769371428","src/zlib/zutil.h":"cf94d865e3a9162c0571cba7f74c8f0=
1efbdca26b981d6cc9c545d4c3991e3c2"},"package":"56ee889ecc9568871456d42f603d=
6a0ce59ff328d291063a45cbdf0036baf6db"}
+
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.70.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.73.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.70.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.70.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.73.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.70.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.70.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.73.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index e31a699d2e..8c153cb77e 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,51 +4,43 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.69.0"
+SNAPSHOT_VERSION =3D "1.72.0"
=20
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "b0ffb368d4e66a5808f96659cc5=
98030761cb06966ae8d5299596b14fbc09364"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "c3c5346b1e95ea9bd806b0dd=
9ff9aa618976fb38f4f3a615af4964bb4dd15633"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "d14166fa0b2832dd87b3f35c08d=
0bc829f83aa01a539b45df3d923469ee119be"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "95741a4cd2073adbd74a7c5596b=
b912abf4b2dfe00d70a9919cba4a836b7a0ff"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "41d259c6f84280fd0e7719fe=
a03a7583ba54e33e8ac32a2a7b703ffb0aebb7d9"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "1948a80453956d494457dcced19=
42e2e204fb26d4e57e718ef1c7aa378efbedb"
=20
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "4c9b1b2fb692bb0c81e524df636872=
3f061c8bb0d21a1f487eb8e5c2bdf323ab"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "bef330af5bfb381a01349186e05=
402983495a3e2d4d1c35723a8443039d19a2d"
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "788ff61555857680d5ea7cf76023f7=
4a7f4820dd1c26abf76536561d4de3cbe6"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "549eda5cda44750b0b2e6d3ce3f9c9=
0c3a133b695e4882b4c6b93e54d6e8a73a"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "536c5ec1403b55045a502af1d6f=
8af192b560fbf9a24874bce6d59163fb8a38a"
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "53c0e2045078326fd2ac9e77900a34=
b4ced1545a489b2a438deaebd2150cf543"
=20
-SRC_URI[cargo-snapshot-mips.sha256sum] =3D "bdaef2f95b0485dc2a5cde74c08bd2=
69174bbbb553226c5b5d2287e52841b061"
-SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "89849b93af9d4922554c938bc1c=
7641498d13c3a8b2b464f3bb7a060eae7a580"
-SRC_URI[rustc-snapshot-mips.sha256sum] =3D "ef17b364df355f7322c1fdd3b4cc42=
96d2d5d489b58fdd4b12374a1f2975a455"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "8a6452262e062be0e7eef92b2aa=
faa06caf0853b264a3fd337e92079a43f0a24"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "cca2897f091227cc53d63f3e=
efcfcb65f42d9e24a04a1b37a0d3ee36b7f84b5b"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "3a8f0f115ae2d599e1de12d38cb=
47bd7f9b508e213bf2f9a41efc136021c49a2"
=20
-SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "df114ac589fb50fcc3027e26c6e2=
01fc530aadef1bcc8f6396c761a457ba7bbb"
-SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "22bb266cf4e6da4d686714487=
3579b0da47e59c8ec9cb1a329ee8a7f418e8ee3"
-SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "9df4110f716a309323a776952fcf=
0dccaae878e7abf0d148c14a2a03c5170850"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "a24a385d9f403e0800adb4d83=
64e663e40a04663a18df8d8704a5156d4232a1b"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "4aa7b7e80a5c45825f01ae=
e96a88c5bcd56317c66298c4bd4ce99c80095e492e"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "f1863c033fa88ebb9628f3898=
8da54fadd16075b06765dc93abcd8b4f58f557b"
=20
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "26c774db5e21ddf66107b677d5c=
6612d50611186feaa68ff11c34a61e4d5a57e"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "6303fc2be557467af0f1ff9c=
c756fd14ae2b9db7f17f42a1d2238ed934351e56"
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "716e790b7658206c59dc8019c1b=
603f230c5ce945229463367fade862cea60b9"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "f659bf3ab70c376c736b7d7=
112d1fcee32a56dbfa66f6ef4fc039652f66c99e7"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "b6ef684ebf77063dbc1f=
f0abfe1316651fa73bbb95b023255b301b415867ff8b"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "20ed9ec0599e6582a218dae=
544566ddf7e2af46341705f35de874c90d7eecc0c"
=20
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "160692a0fc5fe1b48b617e063=
c6ce1d4546e108b32c0049dbde95602a30af133"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "6a4b8b5307141c8207ed67=
d4fbaf9345c42fb3662e389b9dd3d9a4086c1b6efe"
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "313d0944a1fc41c1c5ce0a054=
b3cebccd6f471ce8e8272e5e68f36b8d08e5bb1"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "43c89f16832e16fff0b2c51b9=
53c8295db97bc5623cb1bf0164d992a7f29af03"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "0208dd644f6e266cc7c076=
95889f1280e04be06672cb172a401a444b54ffa9e9"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "3a5a1dddf679720fec5c7af9e=
38f3ed5d7fe134c430458fae98f116da01becf6"
=20
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "9a3fe155d763b382ea18753=
133cb0e2186993e2850568134e2f7e468f2d07197"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "c44bcf91a9d13412a59b=
a75e7f8bd14c7f60d44cdb7b21916e502c90b4b378ce"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "1781b5be30fa4fadf7608cc=
9cd3a2de93b3671a09adfa98ae4d975f789ba2275"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "f2ce1bfc373efe162ca5b8ccfdb36=
6dd526710fac305c61ed0b582b9185d68e9"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "9ebe880ea998fc13d3ed9cbe71=
d26c69dd93859be8a8e582a8ddc5393400d4e5"
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "41a958bc4313fb0c0446376c84476=
818820cfe75937675a9594823b63dc9e219"
=20
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "9bc29f493c353313b968243fb=
df5147c9ca401f7f8205aed63f180b5757161e2"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "8c32a848e2688b2900c3e0=
73da8814ce5649ce6e0362be30d53517d7a9ef21ff"
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "03606f1ad3fd196e73e0d255a=
b6342e4e8fef2edaa1afcc577411aa8a68f0133"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "4a401dfe7b3056dc0d42acbcd380=
b2b90f936577706ca74ef5327af0f5abd0a0"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "36f27513a6e4381f15b0cd140=
97c885af537f990cb6193cec3337c429367bf23"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "5b5d7854a0d73368f15146c1aa47=
e4dbccf12762c93282f410a09a605929ce09"
=20
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "812907846a454a182b05eab76658b=
49eabd8d06d2b5e8df56f29d73971f91b03"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "5c98653199b89bff6f368bed61=
fca7860f7179364ce9e9474c90af38e2629baf"
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "3cef208c0761bc83d156a14a5a948=
21cc9421772f0f376ea54765a6d00842b21"
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "57df2bdcfb659cb34bcb199400e=
84eb09d564fc390e5f8d3b011a15955241266"
=20
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "336eeabf231a7665c26c127a37b8=
aefffe28cb087c5c8d4ba0460419f5f8eff2"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "4c95739e6f0f1d4defd937f6d=
60360b566e051dfb2fa71879d0f9751392f3709"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "70e97ab5b9600328b977268fc92c=
a4aa53064e4e97468df35215d4396e509279"
-
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "a8125d72e06f2d866472a7aca3b=
d20a247160171d23a75c4207761a05e00ed5b"
-
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "7d50ff8499d8925ea973aa65=
9e1a88190547615b3cfecb79e776ef8de953b755"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "b39c5d31ad61c5670a09dc4c=
8020f888e9b5be2dd0deec90899a7ed14b759488"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 4a720e645b..436802a075 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -2,13 +2,12 @@ RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
=20
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.=
tar.xz;name=3Drust \
             file://hardcodepaths.patch;patchdir=3D${RUSTSRC} \
-            file://getrandom-open64.patch;patchdir=3D${RUSTSRC} \
             file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=
=3D${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;p=
atchdir=3D${RUSTSRC} \
-            file://bootstrap_fail.patch;patchdir=3D${RUSTSRC} \
+            file://lib-test-features.patch;patchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "bb8e9c564566b2d3228d95de9063a9254182446a16135=
3f1d843bfbaf5c34639"
+SRC_URI[rust.sha256sum] =3D "6eaf672dbea2e6596af8c999f5e6924b9af4bb8b02166=
bfe0b928e68aa75ae62"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust_1.70.0.bb b/meta/recipes-devto=
ols/rust/rust_1.73.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.70.0.bb
rename to meta/recipes-devtools/rust/rust_1.73.0.bb
--=20
2.39.0


