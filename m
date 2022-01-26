Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CA6C2BA4C
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 06:47:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.9358.1643179668839877685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CM4r5sxz;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8025fc1da3=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20Q6dFkq014775
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:47:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=WYvbAoTssazZSZ71wYeCvJwdNvBwWvoFyqEsPpOGdB8=;
 b=CM4r5sxzq8TfsK4Crn+Utc44s7q9IY/OuudSsnHiKIeviF+cse0n51r1nlhmHcLlrS6G
 nkBWA/wFstMuKkpoASAZUVfFDJWBqQQFQcwlVaTM8jzUiLogEAvWIRelfhU3TftBrPO7
 QPrTQDsP9A6ZgzbjAgmTpZUV+/mbKSX+BlvEpmT7uSlsEYRrfSDniarEJ1GI4SuXsET/
 dJgNyh+fM9MMGsmFhfRqMhzz7mdCSL4P1Emwz9g+UqA0yFrzmPZiQ5XJvQla0KIj3DTV
 37OYNGU5JCNXVG9NvpY532yhaQDc17Y3hQUHOZlSi/seJxdngq6zUxgIPH+21T2MCXBI Tg==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dsv6nsg4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 22:47:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c9+9dIJKYxnu6X5pIxZlBfc3cBK7XrKVhJHM9QqHHRQJG5uPVTteFxD5axrDtHXL95tLgnqzDbbB/OXk0E0+omxzfjQf+JALbqV0bs021wLMulGVunym32L0GW8msXwhe6bKvIiOR6zvilZqWmDO6Rv14OzoeKYryJUeX55Mw5d5PDxIGmayQF2w05u5wgNdCCmaSsVV2F+2jxdnM42Pu2B5gyA9W4MCJXkVb18xgMcwEvwmJwLwbkuN73PEuoAxdef57GgOe7geljimCoY6c4tRAyv1o3Vt5CRvRtdDu+08UMopjNPI1YN2alGNgNIppIbk8WIMuNzwFZxd1n1p9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYvbAoTssazZSZ71wYeCvJwdNvBwWvoFyqEsPpOGdB8=;
 b=Gr2s4CJenxLmKqLhKB71H5DvdAHsjvrBNerwmkwrLkBbj0msLXJlOhXNQWvDj/vmM0B2pVGgVjykEzyOqo80p/Gn4vO2S0cE1Y6sZtc/9uSn2E0sQY/zUGj9u8HM1o1zxIuYjVeL/mHkDC3n6OWPdKBMVyfcQKp9bam5pO+ZbMMjSt8f8Ol57vGMLkIcNwzqPG7/AfUGlbm0NIMbPyzrX3dAP9JukXRuPWxYUjjDKnT3Jll7C0y9DlkwoymsFUWd7CCbbscdlV/8QW2Ls660o21BO4auzSmoezmxRjmG70+uVKE2ox6DBevoEpi1Vf1YSSp2/NUrEDTgSIEAuFXXSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM4PR11MB5437.namprd11.prod.outlook.com (2603:10b6:5:398::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 06:47:46 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 06:47:46 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] mdadm: install mdcheck
Date: Tue, 25 Jan 2022 22:47:31 -0800
Message-Id: <20220126064731.44506-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0182.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8711861-9836-439a-320a-08d9e097c2d7
X-MS-TrafficTypeDiagnostic: DM4PR11MB5437:EE_
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5437D61E5EF3341E90B9D4D0ED209@DM4PR11MB5437.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nSr5CpseDfL2YHILL2gy65pUtoBN++/2NSXVY3yGuSr8Z/aGjvjQfwb8urno0xD3U5fld1KEZGKBCUw1hhFb/iN6f8luvOeKyzNAPmX2YQ5jWlLb2BbhKtz83O7Jp+vyIjScd0XdTelpkS6b619rhctLT8wOn4j/e+1V8mDDKfFSeYCFOBq1PjEcP5kDFZYU8ha23PxRY5XhyeYmmbtYtDntIUbWbP0TOokzwtxEm87aH02KEhTCuwtxcTWHVB8M6r12AbOTsKUx8JvNXw4m3jGxPt5t3judDDr5omVjnh8+Ve2+QPO7wNVLpkQXvzAUQjJiJ2lbVl+foMYy2Ztk8/ihQD2o4flHbkSiSrX+Jv6OB9aEU7Hxnn8X6eHjlG1VjIOMRZoMMvCkdkArXUlLnJrGOq+HggyxV/RusdF55uRGDc9EeOpixFY0f4s8eEvbFvgwYKeYdA0dQN8lKrMElgERSwZJl/zyG+G0r+/96GN0QV7kDkxo/5sFUaMF556Igtmq/VV0CBCOCflfz5TuB1PmxabYjNPXuY/rrhO3UbPZAagm4RHi34udhi0L3YQeWg4pBM5evsDMLE7Thy+JYlZTiqDXOo/NyRy1btQkVH+MT4L4Vjz1dpVHF33m8EZlzfDQLAyqndlGRC5/kBMX7vAtblfsxNjOBzIrVBBPJ2PWFmBjkmqIQxhGwe6hTGj67r+ayjr4EYqj7je9qW5Ds8vIBejNfoJkJtNYXOWW2MA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(6666004)(38350700002)(38100700002)(8676002)(86362001)(6916009)(66946007)(66476007)(66556008)(8936002)(316002)(26005)(36756003)(6506007)(52116002)(6512007)(186003)(1076003)(2616005)(5660300002)(2906002)(21314003)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b4y7A3btnmh2ukmEFjKDJaIG8zrgod0k6RRJVLAHJdJ1NrVynsDkWsW++nlQ?=
 =?us-ascii?Q?U31y6KlnKz/SSX9vnr4+7czGZNQKJJQbweBFTJ6pBjVJ9jgrd69V8Xor5GWE?=
 =?us-ascii?Q?GHq6Leb8YO2am+sdBc9D0xI/Uqi9cozVmfhJ0Nld/cU2j5QRdLdCue+h1GNc?=
 =?us-ascii?Q?CqA0i7cM5ijFle3kse4yLmL9v4CzLNPPTeY0+2jYStHEixqP0mVQhlWvkAX2?=
 =?us-ascii?Q?EnioC85pJqppBN7mK5S7ZEr/1p8MQvPQXEsFJJ5UvNTeOpjN6VXUeQ7PiKdH?=
 =?us-ascii?Q?8ezolbV7eFRwsUWPdH1ZjMbMFNApK1w3yyBHYr7kmBbJLAcIFeQgdVGRJmS1?=
 =?us-ascii?Q?3L+JzjR0saPHergs3UIritSnICA7jNGMv4fjEqGvXWz+yGdyalvXHBDiWGy9?=
 =?us-ascii?Q?zcZPsmFBKmP9N9ypUGIz6kog1Kd1PWBtJpbR1GJZa8ZcRrM68B+kYFQMW+eS?=
 =?us-ascii?Q?dP9BE+FKbOhrqCkeT5IBYb9BWAglUd8pVljU49vJ+88bZqpyz/hcaNb/mz2Y?=
 =?us-ascii?Q?LKhmRG9IcZlK7Mnw0FjOEV9DgBkUffYOf71CGs1vVYbnYauZi5WynZw2l3UW?=
 =?us-ascii?Q?3DZDV93z6Cqn25GDgsofAkFece7SxyTQPfAOVrkl8W4E2yZCJEV2UmBJqeT0?=
 =?us-ascii?Q?4CfMASXR57GV7WxP74yOOsxqyI7nU0QUrPl5PjOtcxGuqg2mbMieCfJ10B42?=
 =?us-ascii?Q?9Cc3oS7IAxnrtgzliN5sTJdvXLRT+24C3vObpj27OpTmUS7rIOMmdJvQVl2h?=
 =?us-ascii?Q?1xFt6L1LRRRK0hLMsiLBiuS52yPvveeLB0nMcyI4wgMeiYWUsALLL/0HDFXs?=
 =?us-ascii?Q?2VmFC1W/MQRJaa8x6DXnIMeIKCWWqPjW2ScdeVXWUBPfeVms+JL1ieygwcT9?=
 =?us-ascii?Q?oIxWpthddUHR8i9XGAb8WX0MO//+kaijgMdVuvRiadr7/Y+kGnKhUP2lzPqS?=
 =?us-ascii?Q?4VF2X/OMorUB5mB5YZ2r1ynymeQFBM0TchCDyy1mGWBtHzDtd+yQhlqvc5Yd?=
 =?us-ascii?Q?aKzhbWba01VVi0LEkWUa/x2dMTcETjABx4n32tGcLoXqRbrsbeC/m1iSszk8?=
 =?us-ascii?Q?9x501jZECE+TMX+F4Pz41/dtmFzBocQ1N5Tx6/jUsfNHNxSLDJNn2ia5jTcT?=
 =?us-ascii?Q?XnpeJuD7pQyqZEp73EHr/qLU3tBsyLWnvtoIY2H8oL8Rc5JqvIaKhbMjtecQ?=
 =?us-ascii?Q?3jjHeQjc+qOHeKy/9uLcX1N2okkuLKeH1bHMndpaq1Dmnatb4jsx2fGlAPxH?=
 =?us-ascii?Q?HU1DvFCKz8gtXQ8OvjwWDk7cZB0BkhJG7Xn2Dxpq7cJVMjPK8JazULylQUgy?=
 =?us-ascii?Q?PsdwEpOkLKQtCjTDfn9UI1jQDm5qYvSh2jECoxqmRL054vRgfCdF7HZwhOQP?=
 =?us-ascii?Q?zKN2NtS1G13HZgvzTGT2Mp1rFMmqXPEhyo043rD2mvE5Oncs4HAR+32pwprI?=
 =?us-ascii?Q?cvWTHouM6k5VDs61Vvv45jN8Ljaa68JdlsVsGmyiMqvJ9JVzKhkrC24I7GJq?=
 =?us-ascii?Q?H/BmXQ5rGVSVbrVJRttzirfUA444cdaN3VfRI102dZGczN9GLHRX10c8TFra?=
 =?us-ascii?Q?EdZcyTWkqv90tP/p1EsruW5RKb4bXiDCHV62uSFnlvHCkxJBQEGvjPFETOLy?=
 =?us-ascii?Q?87bowOQxoOyZ1oyGUuND/rs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8711861-9836-439a-320a-08d9e097c2d7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 06:47:46.5076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1pecdtVM9O9kWXC+Zin/a1t73hSwcLFIs658ghRL8F92f9q5q864ls2mgrDFyyrlY4AYQSKv0Xcw2ehrmVDmuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5437
X-Proofpoint-GUID: EEcwDl7zlKkybO9UN-3PitfIPY0pDzc4
X-Proofpoint-ORIG-GUID: EEcwDl7zlKkybO9UN-3PitfIPY0pDzc4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_01,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 mlxlogscore=939 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 06:47:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160958

This script is used in mdcheck_xxx.service files. So we need to
install it. Also, as it requires bash, we add bash to RDEPENDS.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/0001-Makefile-install-mdcheck.patch | 30 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  2 ++
 2 files changed, 32 insertions(+)
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
index fa51364283..e15f8aadab 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
            file://include_sysmacros.patch \
            file://0001-mdadm-skip-test-11spare-migration.patch \
+           file://0001-Makefile-install-mdcheck.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
@@ -92,6 +93,7 @@ do_install_ptest() {
 	done
 }
 
+RDEPENDS:${PN} += "bash"
 RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-- 
2.33.0


