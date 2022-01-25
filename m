Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3878AC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 08:43:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4598.1643100186155520344
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:43:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=UOV7J+Ig;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=802474a584=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20P8JWdb021743
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 08:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=7OQku45gjm/2rMrmXdQjcD/OEv3EkWWlYNaGONm+jQo=;
 b=UOV7J+IgLtHaO+hyv0dHQP8Lvg8o8STTfWTsjvUrL3Tuuq8J8CpkPsrMs9BffTkFCMGO
 qxowbEfGJqfQT2Ug9wxh8Ma14bYl4xEcxQJ/wql9d5c4PIkAEArg6mzj5ylmI4dcjuuO
 iPNDzPcTycTUsaB25YGmdY2zgGbNVCzWWuqdxurt93vh6gbXa8/O4dG6sZU8ZC/6ig7I
 4azpw2fkB7ji1tqDofFKC4UACtEqG2A8A+nBsQb5Cb2gCJlb9Bm7L62xMTWPfpGQkdIH
 O4B2a7ABRBHyP4ginuROOi01u9z0BpzsnQC8tnZdgDIAKQhNqsQoI10pvzFWWlyQow16 dQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsj6ks1pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 08:43:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NdlVl/kPhJa954vk0OHCGES3i7/nfj0flSc/v3iAdRnIWieUFEddOlm67FfdygvKUW/oUmEIa3TIwXkQInp0P0EwKSSObhZqrZGbLz4k+27elr1MqB3gqHU1nvfLTzDKBnDCT4Vd4eCFcR0G+d863nzaDteTjyeKgbsq7GMfoNWIcCa1Gqum5vIhf2Bul0bygu4weGRZP6rCXvkf4gyMj9aK5xoZlUcs6CK+Fgfq4+wC9TEx5LDas3UfX80Vuo/c6lZxItmSOY7pzKtYLgOvG0rp6pugSx0FG//ugtx93Ekfzh23+ekU1uBqyF521DfxoaMeZluqD9KoCTKxSCOmXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OQku45gjm/2rMrmXdQjcD/OEv3EkWWlYNaGONm+jQo=;
 b=GgyhEoJR1RT/2Ph27XFnhSsLhcuVBd3qh7O5pmg7YmRHNjdALhHcudpavwU3mT78+98Z6kOa0J2h20YxqrXYUchmnywLtTbIRmy281F9gPT0EfctTnKXikeOjCgkont3YmrCJug5Iqx3r4AUJhAcRdAB3OUV+c6zljcKoDG2VVXu0DNxUSKlEOIjB3hAl+/1ZPiHOz6bQSZPyQJo94/TRsO9zT770rJIXLGAuqfsh8whTikjeg28PMqlMiJL3FqbNn0F4gCVyMUCAqM4k8MACYi+0g7hyIVm4JRPrzLZEbY4+BoWzcpQubbkPVWkKUh+Yf3qNVzM9hoKYrBum7v5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by BN6PR11MB1634.namprd11.prod.outlook.com (2603:10b6:405:c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Tue, 25 Jan
 2022 08:43:02 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 08:43:02 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] mdadm: install mdcheck
Date: Tue, 25 Jan 2022 16:42:46 +0800
Message-Id: <20220125084246.27107-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0067.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:19::29) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3775f36e-5810-463e-03b2-08d9dfdeb2cd
X-MS-TrafficTypeDiagnostic: BN6PR11MB1634:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB163419731F8A0019C45DFA69ED5F9@BN6PR11MB1634.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WzO2fRRloqwk5ff7H2LT9+vOLGJK7ys07rEkPkoBFI4kPngJO6gRMPFfOGjxMx6ZFIxLlplcwJ/5BSUiyqXoE0O9GPgLngiEXT7+SZYder/Tv5QRcK3oSF3WKX7mrJBs8dnsCiOnDQw9eN8p52HV03RWQjeJwHVDXaHqL0dTY2tN8+5wyzq9fq3LlH/Dp3PUs3zi3K3YSYnmTA/7jPQAAsxomAEcZgNhw3wQtqaB1TGhSyw9RB1+IBewGpn6WreZR/lW7LUaRimuB1tidOhTOBj81cBDSo43IPa8G/fw+XyYHCyHQ07gKemddg+zmvgWTSVBUgEWf2oONsV4ybuIz8C6GjcNYHar6JCjIKHSq272SxyGpRzLyEVDZv+IVqKECKcXlsx1CjtCiwRleqqoeVPMIhvtAjyLbjHxOgm1yCDlnpuCLvMyuanczcj+mu8+93oxcnyksF5+A8yJ3xDKJIjnKhJfBoMRuIhfOTrNxwu5YAFr1l3LtDEmt880Ym7S+JChoJceb3//tSsebpHCPQU1dFzwidLjwlZr6yNY03yFGm6sylAq51/w7ZzFE3nwUrp5h48X9mcqEdl6mIRZt2qYrnM9dUMmzH3Q9HcPni1z8xN4ze9pKcK+kfncfirlWxq9la5dEr97VCW2LRhIuFZ5uSOLrHxozeAPb4wQpXXJy6KmHF3SVcZD0eh7qr2vSM4IaXSBq3c3r/uCBvGeyanCpxCAFKv7GbRWhTgD///eHJ+dcvSGtTvKGULCQ2VvM1EsTmgyqfaP+Trdss6lp2mSwduVauZh+JUintzgfkY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(83380400001)(1076003)(66946007)(26005)(52116002)(6486002)(6512007)(316002)(36756003)(6916009)(86362001)(186003)(2616005)(5660300002)(8936002)(6666004)(8676002)(38350700002)(38100700002)(6506007)(508600001)(66476007)(66556008)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cwilogPQldAJd7dYqJlg1u+bamEGMO8kfnON4t/curSHIpc29LQIqlVJpE46?=
 =?us-ascii?Q?izG9vULbjLBrGwx/5OMND1AGWHnKt6lyt5pPjfMLStNeKmBm5Jcjamx5E/pH?=
 =?us-ascii?Q?6u42c9Im1Jh9pRgxpGo6TcGerd4UFvX3nkwI0eyV0MxAfF5wzKbLv2gMUJNG?=
 =?us-ascii?Q?CuXfyjkkHeUfRast0YJxjXFhU8AUvfvewV7N2a9zg2cKM9t3QGHjspkVBN/f?=
 =?us-ascii?Q?Ssv4MbMEW3sqc7f918KPdPFu0ugvxRCQBqZsCwLQ24EqBRGmLoSSj46HJodG?=
 =?us-ascii?Q?Nuw333hK2sa8/xjl/fREv3mhHveUzaMtmTxvad+ubibGXZ0o+wu9gEUUAwVZ?=
 =?us-ascii?Q?/8cTge/yE/qEeE/C4BfDC+Bp84CaxqMytdTvrBtVjw3dnD01/EUM0TNFdfhP?=
 =?us-ascii?Q?IMAuCZmm0ybWCKRKch6Un82z+IuDU6wjUimj9LPaRKkxAagFEpOu5yoB9Ily?=
 =?us-ascii?Q?f51WDAOOnrExmNvrqx5uNsvSRpjEMnAVCR307ORsdbQh7R51lqm3zlGv3zyN?=
 =?us-ascii?Q?3Bya6TbdRJwgO8aydMHrATaVjuoRlnEjj0SQWccu8vxy27RUIu5epZ/qnaRW?=
 =?us-ascii?Q?XrTu3iB6DzfTzilQBjPCG1CcROKNjP2o8Mee/rb0n+MgmLsJzd+BdGVKtB3m?=
 =?us-ascii?Q?dT81Ew6yQzzKDygQTNdcUbxG0SKfvDs+QWZ/nnpwxQN0cuyK8m60VmPhiKGu?=
 =?us-ascii?Q?gXboBIlVIHeI+nMXw8FxnzBw79fVUhcGfqG2INEyqzRJ6FGk6mUNAOxDFYiV?=
 =?us-ascii?Q?MI0O6bk+reyLCL3ERaOFA8fNAheYsF0MD/kcGBF88wDbfTVvVoUU72zZG2js?=
 =?us-ascii?Q?FBzQv8Lrnklxrwi61kl3RguV5a1iiL91Pnagu8FfwXs4CjoR9s4IdEYOHVqo?=
 =?us-ascii?Q?+OJMkvttbOUCoYQ+YePMm9ZPO2BjIo73x/PvAYyvg6eYeeg7wJFt3rK7dmAs?=
 =?us-ascii?Q?z0Re2S1/pkF30/KpMSU3r7tY7dVjBif5VU5elqsOK72KP+jq0gpDeePL/Yl0?=
 =?us-ascii?Q?O1vebLJLzdTKLWncycMy/zjFbYwgJQi22F5Trgaw6UfURc1mF3XTVUapcdxB?=
 =?us-ascii?Q?BTNSgNIRCTNAKpde2rYS2RS71wEeWBbsKFhLWUAHBTEHghTgod3KnGpMiQIM?=
 =?us-ascii?Q?ZXLRObqY3ZsgZZHFgKC3zI34NcjM909LVFypctFjkjnl0T92s2TePq+hg9ZT?=
 =?us-ascii?Q?Y5JcSS4g9F57rOy5NbF+ukltl1hFfVJ9yJBKBwrzIPcaleUhwxUGHqFX9jOQ?=
 =?us-ascii?Q?KHHX9pceFrUyLGQobCeTj0rJxRpRAxybHRHhnO9UamL4sdQj4wJo1zkU6dm+?=
 =?us-ascii?Q?pkd2NF1uDOI2ET+1Q04ADABy+KkmAd9mbctS9J491VU7jP9wJK3agV9pXE4c?=
 =?us-ascii?Q?VGtI/HKmfuAKcFtUJZxnHE1pS4H97eNHCb6oDCpQDf92Jhs57ViH62WkGZan?=
 =?us-ascii?Q?digsODaZTNcnr5AaUjW0sZ/lo4gWbt9+83L5ACh9YMeIM1HJWdS4jF69cR0f?=
 =?us-ascii?Q?nfdQQwkihY3/kLkWfVR/Zgr46RMAxG9vpHSLOziEbpzU5SdNIXQpTsTudGh7?=
 =?us-ascii?Q?OTzxSRsODzfchp4bhk+Tefn1O0tOAmCrtFTau3YhQgnQ7sWVOjO86pr2UHUx?=
 =?us-ascii?Q?i5UfjN4ejT+CihHbycVpU9o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3775f36e-5810-463e-03b2-08d9dfdeb2cd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 08:43:02.7492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LwxKHYAKw5w4nqsFS2ZccbH4LVFUSyfx1ur1REg/mW6vmung9s2CK7OD8cQ7ojnm3KoLCBt29/A7OSpohsmobw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1634
X-Proofpoint-GUID: YGiQ6vGi_Pl7MfaowituN_FLK73wAYq6
X-Proofpoint-ORIG-GUID: YGiQ6vGi_Pl7MfaowituN_FLK73wAYq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-25_02,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 mlxlogscore=940 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201250057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 08:43:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160913

This script is used in mdcheck_xxx.service files. So we need to
install it. Also, as it requires bash, we add bash to RDEPENDS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/0001-Makefile-install-mdcheck.patch | 30 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
new file mode 100644
index 0000000000..3f76ef54d8
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-Makefile-install-mdcheck.patch
@@ -0,0 +1,30 @@
+From 97e776724ab9763c5bca9816370bb1635b7a8232 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 25 Jan 2022 16:25:01 +0800
+Subject: [PATCH] Makefile: install mdcheck
+
+The mdcheck_xxx.service files use mdcheck, but it's not installed.
+We need to install this script.
+
+Upstream-Status: Submitted [Sent patch to maintainer]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 2a51d813..db40c7fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -303,6 +303,7 @@ install-systemd: systemd/mdmon@.service
+ install-bin: mdadm mdmon
+ 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
+ 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
++	$(INSTALL) -D -m 755 misc/mdcheck $(DESTDIR)/usr/share/mdadm/mdcheck
+ 
+ uninstall:
+ 	rm -f $(DESTDIR)$(MAN8DIR)/mdadm.8 $(DESTDIR)$(MAN8DIR)/mdmon.8 $(DESTDIR)$(MAN4DIR)/md.4 $(DESTDIR)$(MAN5DIR)/mdadm.conf.5 $(DESTDIR)$(BINDIR)/mdadm
+-- 
+2.17.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fa51364283..4e477bd260 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
            file://0001-mdadm-skip-test-11spare-migration.patch \
+           file://0001-Makefile-install-mdcheck.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
@@ -92,7 +93,8 @@ do_install_ptest() {
 	done
 }
 
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
+RDEPENDS:${PN} += "bash"
+RDEPENDS:${PN}-ptest += "e2fsprogs-mke2fs"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
     util-linux \
-- 
2.17.1


