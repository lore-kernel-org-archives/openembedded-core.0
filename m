Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web11.5921.1630492246425677500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Sep 2021 03:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=RO+pjINL;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.50, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLkzs9c6N/2JuALiT25qdJLgdVjF3wAb1AtxLY2mQej8Ep4JZTw8uyGW1xY5gtSw8k6T1nw9yKeIzmNCERF4HRcA07wyeYa3jhmsukrakLZEHIhVasrj9cZmfHi6/+YatLuqpP2KwIHd8RpyCZRRwc5SCzCHpUoeR9Fed2Ls8KV0n4LQ6VxNFewy7FpAEuSsi1Lu4PIBw2Sk5sS/cIh5B7YAZvUTpdi7/RfhvaEhRPy65U5X9LOAeljnHbuw4StVmUsh2+8cSzyonNPE8CBIjd69L2AZOWuw8I21nekfvtMDqpbS0yhI4SiViPQW4iTCtkfF1TPV+RDaTDf4Lr3cfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=e4NWP2o4Az29MLlUDatq1Az73VWkBoqq4VGzPE5ATRU=;
 b=Rgjq7gYhU8crPJH3ezrbl7EAKbVT5ieCgkigXLkEarKax7FeJWvglJfqEs9xIkPIQl1ySWT4p1CWCobmbi2x0sU2Rlbwe4mW81dl4WUTjkknD/pGr5E4XmaoCQpd1hrLnzed5uoahDql9lZ5TJUXlVVJbkgtqW0bMVXasjGpHs5MglE69GyL186NdlgLjC7cHuXqs+dv6E6Re/Zn2j5LmUV3fkfd0PORbDT/rSauhwmMflRU4yAsKONzFVByuEPJn0hGA7rTPGtX6YYR/fXKFKy1SP2U3OJ9iSeRC9pb9Q56lBFWwBdRsXTHyvLRUEZxHOaKtgrbGedqZLjjfQcXDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4NWP2o4Az29MLlUDatq1Az73VWkBoqq4VGzPE5ATRU=;
 b=RO+pjINLCFJs/NOYc2inbk42n8gLQWnWdD9VxZXx7NoFP37UkdhfCvBNInFQeX+RZfqpPYqqnJXi3W1jcP7HXn6vyvoMmvPTmZALYT2vXXNFPgjBFYiFJnt/4l/SjRctMMq/gQbG5FCqN/EOPvl32Yul8YrW8xlqZ2PJav5S/mM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6735.eurprd08.prod.outlook.com (2603:10a6:102:138::12)
 by PA4PR08MB6207.eurprd08.prod.outlook.com (2603:10a6:102:f2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 1 Sep
 2021 10:30:42 +0000
Received: from PAXPR08MB6735.eurprd08.prod.outlook.com
 ([fe80::41d1:d9c4:c030:ec33]) by PAXPR08MB6735.eurprd08.prod.outlook.com
 ([fe80::41d1:d9c4:c030:ec33%9]) with mapi id 15.20.4478.019; Wed, 1 Sep 2021
 10:30:42 +0000
From: "Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 3/4] u-boot: Make UBOOT_BINARYNAME configurable
Date: Wed,  1 Sep 2021 12:29:53 +0200
Message-ID: <20210901102954.4629-3-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901102954.4629-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20210901102954.4629-1-stefan.herbrechtsmeier-oss@weidmueller.com>
X-ClientProxiedBy: PR3P251CA0006.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::24) To PAXPR08MB6735.eurprd08.prod.outlook.com
 (2603:10a6:102:138::12)
Return-Path: stefan.herbrechtsmeier-oss@weidmueller.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from DE10512.weidmueller.com (89.247.126.241) by PR3P251CA0006.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 10:30:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86aebbd6-cc2b-4d17-9dc7-08d96d338c8a
X-MS-TrafficTypeDiagnostic: PA4PR08MB6207:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PA4PR08MB6207A8FCC586EBBA3A0350B9D7CD9@PA4PR08MB6207.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DsqTeb6nEcQLMUAvUWlCYWRceXjywujdUJgNId8pKlFLt+VCiouCdrjlFEmuqqLjOHy72r+5Pk5EPi+3dVBYHSWd+IpNqY9Fy2LYghNW7CWn81Rd5UhZNoPxmNWSAp9B/zTrouJpe7SNhGw66ownEAtA0hK83hsUik2Zi69BSZu5QoORaDvlAevXnvc/0oDl/nvv+7e3RkF+gyuD8loNkbMeh3fptm/OnVvQf5qQGIPhBcsUs+dNSxJzCIkWzdyh8PZuH1AU7zmeYxDORhlkS5ioMs3TK2ObzqbogRbqfz4wZpJvEOO1PTO8xs15+c4z04vo+RrRRsLSoc+yrqS6162g3ztkscwecQbqXTHCZT+fJRphzs2eKy+hj+sGEOYg2FJF24f8g6Arg5qqhTLi3GDovRwt7ToYHMSyLk6MSa2h+w7fwGW9bTUkiV/2wQOwL3r/fVk1opj1VZZqFq1r8UDjN1eCTd1iIFy05lEKKQXPXqB8YfUOKZgqOjGRE+drsESr/4R68Mz+4MOmcdQy4LDAm74d7Tu3C+PXRcMGqARE9Ser0aTSnn7QpgYn4/9DWuZdgyNd3X1JVycRG5gYcIQjC5NX0cYrT5IZO0v3wsGq9zZ1WdfOII4A5+Ooa67rouWXMrUzropGN4mk34U5oX15ZgVGqvdjO2ZOZDCZtT/lJCedNHRgKO8dp9nI6dyPpmOVTbuOuXI1loWY96Y8dw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(2906002)(478600001)(83380400001)(4326008)(86362001)(107886003)(36756003)(38350700002)(38100700002)(52116002)(186003)(7696005)(26005)(316002)(1076003)(2616005)(956004)(6666004)(8676002)(66946007)(8936002)(6486002)(5660300002)(6916009)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nCGDObgP+4Xu+Qw1je4cZojI9FKQexvAfVfTThhQ0iZocNmYk+XPhBdjRn2c?=
 =?us-ascii?Q?8tDAPByPVlJfm8j3qp6xW0IKyZRg0OEIXe2nu3ztUrjCOiTzuRfz1oNVXpWg?=
 =?us-ascii?Q?+jSkrAZlXrg1Wv1di8AaL7H3avraOW6od3cAKy/kyPybqXZ+4IsLZdIG0/gU?=
 =?us-ascii?Q?owRlBqjXYMfxbOgrE+RQuyLvTQEzFehvQkEqykX3wcuPzx7R+DhH+1vV03+I?=
 =?us-ascii?Q?UDpP3fGe8K8tO74WcfdQO4dsXP/f1E7hHxJ7m2tDxcko3prihiQqCfYsQR4z?=
 =?us-ascii?Q?nb4eCybaqN4TEmCGdqAYtwdH06jfTOLKOOGHSJ9C2zGi3i8r6G+7/m3NoECB?=
 =?us-ascii?Q?zK4QfWkGFEvbPUtJ9lyxPVzPgYsu/05nAY0Stg1AkFyVQmZIH/lqt9iuIIjK?=
 =?us-ascii?Q?Jbg+rmFsCbNjNTsC9fIncqk6gUty3KjMNZlUW9mMfnRvkUiHf9c6dVUqaXpr?=
 =?us-ascii?Q?Wk2VFPtyNwxR0nZjy2RuqCBE/neIXoINCPX1oxrkCg8JYkD+Dhr3SjedIprS?=
 =?us-ascii?Q?wFwSr5As0iG6zgF+JT9wJER9g5epDGbZ+32W44EhDMkIe/4Uk0xepamxL4va?=
 =?us-ascii?Q?yMG3hHpYDDbaBBZmjJc951Fgjqzej0tdiMTQkDQOTAw26Bgcl8geB4ZXeCLb?=
 =?us-ascii?Q?RNdLqVtTO9+u3S0Rp40V9IzXWLblIxYAWPP8B2Meb/h9Dzj1T/3aeAubAZLS?=
 =?us-ascii?Q?b+B6NDUpUrAz9egvKYvOcFx/c8QeEs/TPdw98YCO7kSVCeRrM5bxAWZUeszz?=
 =?us-ascii?Q?xNleKbDEtf96l7VMDrMy+Wx7mCdGLaZiWJYRCNa4KpEBG0TlXy0GMwQpL/Qn?=
 =?us-ascii?Q?jIahpxqK4mKm2to4Xi/4usdIOkQgPeJP/DbD5skWd0vhgytHQ7mPXw3N+EfO?=
 =?us-ascii?Q?ChFTu4h5QG0aENbAp1HMJQNojv6brCovsQISHS5Y+S5BNgIEslJ+V/TVWzx/?=
 =?us-ascii?Q?QdrAiAx47qD6D9LASP9OWmxEmedzep4JKc0IzB7py/tcfLJzBtn+pFahomyu?=
 =?us-ascii?Q?V5KayKnJpM9Z2SO5vPmRF0Z/OjAHaPD7wN7H0B3QwOpvHIM0D0xN2J9Y62k+?=
 =?us-ascii?Q?1nmT7Kt2jLMpbW2Zs4cvwUrNE8Ww/uwk1ZZ/tbw5Ov+Y53WYK4vK1QaxHy9r?=
 =?us-ascii?Q?Y4eKi/E8/smdEORFB40zgctI1VcQtyUHDVAudyQQd+9mq1gYIMr9Yg7gwh4Y?=
 =?us-ascii?Q?aCHfBxRTzpUn1mQqtfe6HZ6WW42aMflW7ciEKy6NoLKnoDvaNRSZAOHbYT//?=
 =?us-ascii?Q?w/yc/29rN1JMIZhIlNslNh3hnFWJmc3lWmUIV8fx03oC4OO9nmDPsdq39xmi?=
 =?us-ascii?Q?WCoPGhqsT3hj1gCQpNR/dkit?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86aebbd6-cc2b-4d17-9dc7-08d96d338c8a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 10:30:41.9405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mk1RQApM2FavKY15CPXqHNM4ezWOe3rMZE7yxV0cLGikdO8nIvHQNINa40SubZauXYfwSj+iQaarJ+kuP2/wyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6207
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Make the u-boot binary name configurable. Use the existing variable
UBOOT_BINARYNAME which is evaluated from the UBOOT_BINARY.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes/uboot-config.bbclass  |  4 ++--
 meta/recipes-bsp/u-boot/u-boot.inc | 18 +++++++++---------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.=
bbclass
index 451db0c650..54efbd027a 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -16,8 +16,8 @@
 UBOOT_SUFFIX ??=3D "bin"
 UBOOT_BINARY ?=3D "u-boot.${UBOOT_SUFFIX}"
 UBOOT_BINARYNAME ?=3D "${@os.path.splitext(d.getVar("UBOOT_BINARY"))[0]}"
-UBOOT_IMAGE ?=3D "u-boot-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
-UBOOT_SYMLINK ?=3D "u-boot-${MACHINE}.${UBOOT_SUFFIX}"
+UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFI=
X}"
+UBOOT_SYMLINK ?=3D "${UBOOT_BINARYNAME}-${MACHINE}.${UBOOT_SUFFIX}"
 UBOOT_MAKE_TARGET ?=3D "all"
=20
 # Output the ELF generated. Some platforms can use the ELF file and direct=
ly
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc
index a8ebcc9ea0..f63f853583 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -82,7 +82,7 @@ do_compile () {
                     for binary in ${UBOOT_BINARIES}; do
                         k=3D$(expr $k + 1);
                         if [ $k -eq $i ]; then
-                            cp ${B}/${config}/${binary} ${B}/${config}/u-b=
oot-${type}.${UBOOT_SUFFIX}
+                            cp ${B}/${config}/${binary} ${B}/${config}/${U=
BOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
                         fi
                     done
=20
@@ -117,9 +117,9 @@ do_install () {
                 j=3D$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOO=
T_SUFFIX} ${D}/boot/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}=
/boot/${UBOOT_BINARY}-${type}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${D}=
/boot/${UBOOT_BINARY}
+                    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-$=
{type}.${UBOOT_SUFFIX} ${D}/boot/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${=
UBOOT_SUFFIX}
+                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT=
_SUFFIX} ${D}/boot/${UBOOT_BINARY}-${type}
+                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT=
_SUFFIX} ${D}/boot/${UBOOT_BINARY}
=20
                     # Install the uboot-initial-env
                     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
@@ -234,12 +234,12 @@ do_deploy () {
                 j=3D$(expr $j + 1);
                 if [ $j -eq $i ]
                 then
-                    install -D -m 644 ${B}/${config}/u-boot-${type}.${UBOO=
T_SUFFIX} ${DEPLOYDIR}/u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX}
+                    install -D -m 644 ${B}/${config}/${UBOOT_BINARYNAME}-$=
{type}.${UBOOT_SUFFIX} ${DEPLOYDIR}/${UBOOT_BINARYNAME}-${type}-${PV}-${PR}=
.${UBOOT_SUFFIX}
                     cd ${DEPLOYDIR}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UB=
OOT_SYMLINK}-${type}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UB=
OOT_SYMLINK}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UB=
OOT_BINARY}-${type}
-                    ln -sf u-boot-${type}-${PV}-${PR}.${UBOOT_SUFFIX} ${UB=
OOT_BINARY}
+                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT=
_SUFFIX} ${UBOOT_SYMLINK}-${type}
+                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT=
_SUFFIX} ${UBOOT_SYMLINK}
+                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT=
_SUFFIX} ${UBOOT_BINARY}-${type}
+                    ln -sf ${UBOOT_BINARYNAME}-${type}-${PV}-${PR}.${UBOOT=
_SUFFIX} ${UBOOT_BINARY}
=20
                     # Deploy the uboot-initial-env
                     if [ -n "${UBOOT_INITIAL_ENV}" ]; then
--=20
2.20.1

