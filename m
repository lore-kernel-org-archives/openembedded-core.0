Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE09DC6FD1C
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 02:46:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11436.1678675609218228813
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 19:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2436e46f61=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32D2SNqZ007462
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 19:46:48 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p8t1r12dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 19:46:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCQ5BU0iD1DH3KjNR7ahsGLXcctQUZ7+k2pRhT/WQu6oIy0MQn7k7VtvAyqiQYFYC6p9v5gmdusXFtYNN/UzE+9QOU4j0S5r3ZzyRbiITgKgCORpVn0o6QEMXS2XJ3/AOCl3hmq7TBCLOzCF3NObdzSVUSSGHg8PqD38GYBJFTPW3i17e9rx+8QXcWGreceQ7EcY2BoALzvDaSF58U0cOHM5qiyTQP8qpcmwmeaLxxHXO1z/DcT4j9TSsmtdFbGktWJIK4SOGbg26+dV4oA4kVabWjvRDQxFdsgz1Dcu9JpT2Ps2ku5QlIKQ2/ZjpuC4zsRCSOT+6j5+R514LIYm6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z76g43zEF4MAMEMLxOvpkcpk/nTOAacmHb6Hiv64sdE=;
 b=nJapFBm0JHP4zx0fFPOXvGU6FlQ0lhCpM7fgL8j+EOboRJMrh+FdiXZuKsbeXGdzGbQ5zgIwTLAga5L1sRTiLe4oQFzDwCZCH8ynvJzumio/V3jt9cHB1AZhZwlaUW7QPXlqFxdIjBWuvZ62f/l3DOFespKwlgmBP6+FTIQG3vQAeizUT39i73JSHyEtJo8Xt/8wmX1jKFG/KuMfiyoaBFUeIu+evFhuyXBFq+c5xQTn+QV9pySFd3BRZKSA8cdbO4sfwqNdN8/mIV++zelBBEZLo5By9kQcz7LNVt7aS0urK3Hj8zcAc71RCKvrq0KEpm9IzLdRCb1BtD1B7tD9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 02:46:46 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%4]) with mapi id 15.20.6178.019; Mon, 13 Mar 2023
 02:46:46 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] sudo: update 1.9.12p2 -> 1.9.13p3
Date: Mon, 13 Mar 2023 10:46:18 +0800
Message-Id: <20230313024618.2537725-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: a031145e-58d9-4401-3821-08db236d2fae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aCMtpjZta5jHDo3iuqdZAxWdwon0QNC8aGAmZxvqnQ5lS+g5teLNuHuPF8wz3QQbvGragLgZMZqdTkb8euesf2gfbEFzwftf1DQlOBgpa9ZhBj+m7PwLHHBe3ImrNAvRTfpTAfVM7iGOHBDF63IiPiuUNu6EoKgZ5C59AOUJHzcEzIL63AcqCo543Ab3Y/cg3kwYkfJu1mKjdB0O6ktkXekUZtEQIBGpXCk2Alk0scmt511IJLxUFi/dydlTT9HARPwopbDDQri0FWd2xdrTEDHP+7jfMON4V2zD/qAgEz+O27v8lzYqQEZblgksiR1VHsJklTe+LurN4nNWqLCu9oNu7d5RwQPgH9lEfr/AZVfPwhgaxw481J7Gu+vXjb5fOL74eF1cJ50yTaG9vzFl/Bz3eWgr+jSePW1cXuHVlPn4Kh1iK/1LJcL7u/TtT8HsBKf/JsRhLo650VAvj+DhXiUKXpGnLv98om+3tt3bWzPeyaljlivbXI9jIhoqtV5iDf6VHIA0DCd2dlNc/5mXUao1mOiu5HCUD7KuqKxiXqAjL7ApLZy3khuCmeWDWBNfcAC4xjf4HY7l+q/3khOOk9jzSIQqtCD6TL8oiux8Zsq04Qcii1XNVV1fX0dMufT27s//S2ai6TQmLGI8Q+R8VCK/O22pEsDvsjKdHxiLiGi3mmXG6LhP9sD+D+9vzm1h
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39850400004)(376002)(136003)(396003)(451199018)(8936002)(41300700001)(478600001)(66556008)(66476007)(8676002)(66946007)(6916009)(83170400001)(38350700002)(38100700002)(26005)(1076003)(6512007)(52116002)(6486002)(6666004)(186003)(5660300002)(44832011)(2906002)(15650500001)(316002)(6506007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YJfgJfMzKhhJrCEDsuwD2b/xUN6NixFrkHpmNE+i0jWutYP7uGMguU7SInhf?=
 =?us-ascii?Q?ydPxYAf8yKbUcoaHLPuPPtnpu0Pt8HPZcA1xiGi+u9HSUVQm/gfnzl6X5yE7?=
 =?us-ascii?Q?pBD4eFRItPsCSm0NTK8EkIUkuYlIPG2A6wMPU2NFAKvk0phHEoTo256rp0Qx?=
 =?us-ascii?Q?pgRgU8rC5jInFzNhQjZewn+aeihAWUx0K/r3xCK/lJradgfZGE0b175nrkwC?=
 =?us-ascii?Q?aKIaOs5C2tdBoo++q4sLj4SLxL4072FWubgTZoTloifWfEm/p+LgfgLxFokp?=
 =?us-ascii?Q?obVol6sZZlKNd8rh9DwTkNKkyxsQQgys3GLVMTXgys25UZHiNRQ8F0vG5avI?=
 =?us-ascii?Q?W2ZRCXhm7nT9Vl7g/FuP0MpjGeYEYXfK2dLVa9Kps/Ku4mJr825b40gAyYTM?=
 =?us-ascii?Q?L56SCSgDvVwWqI5BZfd3igvTx5dQJ+ExXTq0UD4fQoaXHDpFX5lCNZcE10IG?=
 =?us-ascii?Q?8mARqhKf+mrQA9o6Bxz+/Urn2Hi2J1U75spTXW1iq+8mYphBAcJwHDqy8knI?=
 =?us-ascii?Q?KfPApDPvmYVJT+g4/F19VV0xxf55cDFJeUWyxDkE08/2fzpAAEFl0IXzrqs3?=
 =?us-ascii?Q?AT2artAYR1E1haGLNcoSqp1vUd5QN8TSJSnvKHLIceQZ8lJplnghfHfJ/NDF?=
 =?us-ascii?Q?Eyj7hk0VM7VZXgx6Y/5Pfohd3FRz+puJwykdLKr8IDJJs3BmULpITtVP4cD1?=
 =?us-ascii?Q?AuAVu5DathlT4hfF0TnASteq+yb5asVzHz5xDZosYAcX542vHwYYjXU3JZ3L?=
 =?us-ascii?Q?ITGezhZ5+CJnkBGOjkOx85NTZDiY96FVeXeuKzukstT0PwRLCtFFLRCaFY+g?=
 =?us-ascii?Q?kNripJQFWPiPiPRgg+NDXvl05MTOhE7gBfo1ntiuqM8+IJt2yQqC3QbLfC3X?=
 =?us-ascii?Q?BPlbkbQBqkKtzJeH18Fqwxie2yz08NA81bUyyI0dDP5CsGfDVUCHQRJ3bolZ?=
 =?us-ascii?Q?GGyfd0b+hOkKhPNWLT7VgETwhLh4m6Io6GA1GPDVG2srF4pJ4n3YxtQDP7o7?=
 =?us-ascii?Q?roT9xNIWg0JFiZhcZ9r30nM1uvh97X40L6pgfmDeuutG9ITmXSMZ2c8hce4g?=
 =?us-ascii?Q?ac1vu55J8AMubUOnWl2U6TwPpetsBy/xvlkBcDG31xFt47AtNlCNAsMSs90t?=
 =?us-ascii?Q?UCQyZZjLuD8oQW0jm6TmC6rrT4Bc8FJc+1AUBLJ74efGlNlbMlKUfGSFIrrv?=
 =?us-ascii?Q?W3vWYO2vzmfBaIixLj0tvnkTzg8rEL/8BSO/pdC7LHH+8EpNBsnwqQY5L7gp?=
 =?us-ascii?Q?Pni+mcizxfV/A67hoNAP7tHFXfdwAuxr+i8RfOVBOi+ggzH/OVfHo/AU9n6h?=
 =?us-ascii?Q?RrWwRJXpVpEmoFeVxstzoXVarGR+6R04jIDPDzJcEEhDPhOer7D5sPS7+jdV?=
 =?us-ascii?Q?fEzVvVY2bY6aP7Wtmbq5Xk7OBS5CdGlmafOqg7cEpUQnn+xmzgoKxPrqSiWL?=
 =?us-ascii?Q?cFs582t8YIwdoemFWpArRLvGNducn61/4UDGtnt7C7GvQtiTzawZV03NeZ8U?=
 =?us-ascii?Q?lXs29tiIitnd3MeEUtSPl3W8W45bZOs5Z7AHH/qHVqEdRz3v8L8r17IK5EMP?=
 =?us-ascii?Q?6MX0Ypow/MW0sSjOgZCBAHNAyefkHr83DO/k0KNe8O5TRYYPeDZt5kP4waea?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a031145e-58d9-4401-3821-08db236d2fae
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 02:46:46.5160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JNdMZ4ePUjWYzIiPLVrxUnZCUMl77+98ZE7DMQ5+bPgovRij8muYtRO11ZhlhT+iOTxLhW0J7DWmciCM0WA5lKeXWv78DoTilCm5f+vgp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
X-Proofpoint-ORIG-GUID: aoDfm5u4E8q6yrbE_jOR8yf3XiRfCO6Y
X-Proofpoint-GUID: aoDfm5u4E8q6yrbE_jOR8yf3XiRfCO6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_10,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=1 impostorscore=0 bulkscore=1 mlxlogscore=999
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303130022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 02:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178407

From: Xiangyu Chen <xiangyu.chen@windriver.com>

License-update: copyright years, formatting.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...o.conf.in-fix-conflict-with-multilib.patch | 21 ++++++++++---------
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb}    |  2 +-
 3 files changed, 13 insertions(+), 12 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index f4fc376bb8..041c717e00 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,7 @@
-sudo.conf.in: fix conflict with multilib
+From 6e835350b7413210c410d3578cfab804186b7a4f Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Tue, 17 Nov 2020 11:13:40 +0800
+Subject: [PATCH] sudo.conf.in: fix conflict with multilib
 
 When pass ${libdir} to --libexecdir of sudo, it fails to install sudo
 and lib32-sudo at same time:
@@ -12,12 +15,13 @@ Update the comments in sudo.conf.in to avoid the conflict.
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Upstream-Status: Inappropriate [OE configuration specific]
+
 ---
  examples/sudo.conf.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 6535d3a..50afc8f 100644
+index 2187457..0908d24 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -33,8 +37,8 @@ index 6535d3a..50afc8f 100644
  # The compiled-in value is usually sufficient and should only be changed
  # if you rename or move the sudo_intercept.so file.
  #
--#Path intercept @plugindir@/sudo_intercept.so
-+#Path intercept $plugindir/sudo_intercept.so
+-#Path intercept @intercept_file@
++#Path intercept $intercept_file
  
  #
  # Sudo noexec:
@@ -42,8 +46,8 @@ index 6535d3a..50afc8f 100644
  # The compiled-in value is usually sufficient and should only be changed
  # if you rename or move the sudo_noexec.so file.
  #
--#Path noexec @plugindir@/sudo_noexec.so
-+#Path noexec $plugindir/sudo_noexec.so
+-#Path noexec @noexec_file@
++#Path noexec $noexec_file
  
  #
  # Sudo plugin directory:
@@ -55,7 +59,4 @@ index 6535d3a..50afc8f 100644
 +#Path plugin_dir $plugindir
  
  #
- # Sudo developer mode:
---
-2.17.1
-
+ # Core dumps:
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index fd5bbf103d..f22b3eab99 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7aacba499777b719416b293d16f29c8c \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.12p2.bb b/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.12p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.13p3.bb
index ae7207c081..2e11739470 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.12p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.13p3.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "b9a0b1ae0f1ddd9be7f3eafe70be05ee81f572f6f536632c44cd4101bb2a8539"
+SRC_URI[sha256sum] = "92334a12bb93e0c056b09f53e255ccb7d6f67c6350e2813cd9593ceeca78560b"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


