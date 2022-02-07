Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB27C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 08:36:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.19890.1644222959818956401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 00:36:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s0aqRQRa;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=9037c3f122=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2178Zqdg007955
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Feb 2022 08:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=M1d9zg3iVMobj14jAx6p7+mYnGnJNr6WMlzXH4tGAUM=;
 b=s0aqRQRanGWYFKfCtF9AT3MEAQ/VorYSTBkMMloAzoSvmIMRHuwy0NLyquuFe/BkGSGH
 I99QT8LPlghth81gdhW5dcYE7YSFO1PIG7OlH9yazXCUnSpf6dHDiDwsa163O8wp18D1
 rinChR3l8AfUhK936JLtVgJwSRyMNhTcUpzDsCuGc3WOZv0IUkeGC1fUWtqQx0GXbJLR
 eFLecSkrv5jQa8EI5lXSER66G6pycHE45GQPpmYpOdV7Rjrd/XhdWMVm/YKcJOYqZpOk
 oUsgWMRIEVxoUZ2sCSY7n6xK6/U47vOjbWdVdd/ojGzvUju61s6/dyZ7/YI5bf11uduS rA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3e1g7817jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 08:35:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie5fCJ+bqwrH6Z6CtyiV45zwTE73xEWx/CnOzDzxKKJ7ueoNksK/VleeDMWnZaHTcdSL4BeWeRHW011NU8bP8QqsXIMVlZL66ihvmftFDbyvsb5CawBQC19ZSRV2Qcw1IsJzaZmc6PiDhiMP1n5PzMyVJ7HX3qppQ+bY4qn3cH1l6KwK2UelStlPzOupaQOcBsApn6g/X0EaIZbx4VsV3Cfah0xTMGn1ybS8E5C1bL124UGpqHluPTOl40sFyYlpvfdWScLdso1bCFmxYCgjMgUV92xu9pL8V+7CYLekXcrsnRh1slUdAk+lsPGm9ouOZq7Wk7eqmYUk7+iECDgCtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1d9zg3iVMobj14jAx6p7+mYnGnJNr6WMlzXH4tGAUM=;
 b=ldJ4Fbe+PtjG3gSk4fE7TwveprTceixbYJ9o/TGAs4b+rgrxtdHlZVUxsjb2lTciYYzrZFvNqg1ErYMEyT2T6wn130OlvdXwA2mLygABiif3A22FIrY1jMoI7yV0KuvIeT59yr5SAw6a3tDREExm/Zgn0p4PaH9ZkigaUGW37saA3Dx05Y2Y5OId/JN5KHt1adDeeCoVZuYB1AwCFmpQWCjuHY7jd8R9Y2dDIdy3TPDylFK7h4yvIvPvShK5j4LBhaHtM4hGLR3TJfG3bsIr87jVU96UPg1MMVsjcNZxXfVE5XoGzZVfhSJq9jbXuGDSJ8Yri5SfIZam9nQwGIlnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN6PR11MB3056.namprd11.prod.outlook.com (2603:10b6:805:d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 08:35:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%8]) with mapi id 15.20.4951.019; Mon, 7 Feb 2022
 08:35:56 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V3] mdadm: install mdcheck
Date: Mon,  7 Feb 2022 00:35:44 -0800
Message-Id: <20220207083544.19688-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0028.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::41) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76fec0a-79f8-429e-4ebe-08d9ea14dbd9
X-MS-TrafficTypeDiagnostic: SN6PR11MB3056:EE_
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB30566EBE463CEA767A1AF0BCED2C9@SN6PR11MB3056.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qefQmRYf8wo522DzFcDdk2IjcnCeRefPjj289tjM99efS9RliZYhq6rkydi+o3rc3SCQ56OM5rOKvd5vsxP1Gu7NMDc0OxVWfJ5WVtLJS97LLgzMPd4zi0htufPqKO2YVmM1jKP9vU2r2rQVhxcxVRJ2rivKfOpOilOcyT9aYxhc+1C7Bg6zSIKp7P+pwtyb/WJxB3IMwnYOSg5t2zfA9bE4vGbO1wYyJd9mNs9pwc74RmvqalG0FMd9IxLeCGRdj8lpJXHY6qio7nUdtNvjtk/6XOvcNqnH2SBSS8lHkriBqvhZ6+SNcU5aYLE5rJJkh/A+qLitMCeeW5s/iSjRH86AuTVFwDJlIiB0uXIeaVadXuxTPWEA+y16jPFMc8FxKJQBb9kvH3hR0FXqspeYqrhfo1lU6MgI9/wr8qsSTLd9W6HqZ6UM0GUPvn2GwAn+FM+xIcPYGdGNc1GxXmJxEQDmRQeZC1xPPbFUvYSk6PAoGcHWs5MDYICNHx/eds6EAnF9QzlpS1xLkkVAhEeqYSduDAA4HbZ4Pl/fpTQzfyvFZ8f9VmIJpTiO0MPzV2hqvaBkempKaWDV4OfyUaEdD+VhP9EaNFChUpTb/cqf9OjrWPwCZ2DrWwTfVnP4RHiOZX0APDFshC8jZd2Pa+W2U9oOvKv52o95RhcQhB04cD+xXNi4kOHidFN62pvwIhqig2IWUfudC7VoV34UTMEodNoVh3XNqZLOmA3ibkkwGCo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(6916009)(8676002)(508600001)(8936002)(66476007)(66556008)(6512007)(6506007)(316002)(6666004)(86362001)(36756003)(6486002)(38350700002)(52116002)(38100700002)(186003)(26005)(2616005)(1076003)(5660300002)(2906002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NMxMLutGynNowJVrxwNDvvjdVAVx6adJuPPBJIbau9L4xSvjWm2VMGgxv/6G?=
 =?us-ascii?Q?/ACQ4K3/apFD8ipbP65sZBwM6WCp7Kh4dzdCgJYb1O6fKYDt4fAjkZ5s7+VK?=
 =?us-ascii?Q?orLDKXlvXbF0mNA54AWkPWxqdkxlm9ErjzVkiUXtsIUsOdYv2lfr2OgVpp1i?=
 =?us-ascii?Q?5hyXg57/Tp95aIXHRVxwpc/kiQ5DMMMMAIN3kqETWAXaxlvsroZTrj18Ht5X?=
 =?us-ascii?Q?fgoKgq59/xjAw9da2m+uvc8CH5koi0QCwL8l9A62uc6o1F640x3fahzBTzdg?=
 =?us-ascii?Q?ixC3NMKMNOO3uTl5toVwsTp1Mkc5zqUn1BmvtFxHU2SafdDdRPnUmG6dDzDn?=
 =?us-ascii?Q?pvbDyb9NQzNJXn7buVCxNmNIjYo/o5+Obj4cZBvM4P2jps83shE/d9zlTi3m?=
 =?us-ascii?Q?adlCUpr1gb8XcYrTPIDVpEeN+WgdrKBNar46DsR/m8VLNbFm1/fzIPLEiPqD?=
 =?us-ascii?Q?5LrC2Se5TRUtzYdFHnTtFKZ+dUyvEZvfHO/fJLGJ4lKAMB/UtfUPLl9xswJg?=
 =?us-ascii?Q?d8XpZ+1i/gCT7/u8MFunT1Q5Abiw1Vh20ai5X1WWSv/JNJESIpgbdzVSl7B3?=
 =?us-ascii?Q?evEmpolJuCKsocAQPlW0383NiUL1ep3X+tSJ7pV8yjmsH9yxLir6OdOP7m21?=
 =?us-ascii?Q?LMvevqVJ2W6dQob1kwTgQ/wqyDKYAXWT5kKBWSxSrNIBq/yTcjtkxqvpOExI?=
 =?us-ascii?Q?JBQV5J6yQrWPbI+qSO/qpd446vAA5y9dASk2h/n8yHGD2UMSeQwrSORXsAc0?=
 =?us-ascii?Q?CifNO2OHfe5owUjcb+Mo3/kqYBZYcn0VOhL7OhLYxVD32G4NHZ8JpGvKK8av?=
 =?us-ascii?Q?/6cJpKp8INsJieYJJyrs6WVWIcq1jtVPW4naAmw2AxDGQbQ2U1xZSMM/8DK7?=
 =?us-ascii?Q?xTFlgi6nLkQpkLfvcnUmyj7LtLGYGzt0bbFw4R6t/lcKAI7TkoUyVYZvVQuy?=
 =?us-ascii?Q?z2Xz95vS/K64TosAVlLiOmaM2d1sh9s3vrg4clOQSGQCCQixW9p2h4uP38PN?=
 =?us-ascii?Q?1sQyCNb2QM/AOSnw6zf4BcyjILrpjr648SjVmD8ottDFzclwi1V+U+of0mqU?=
 =?us-ascii?Q?qzLDiZgtl7KTNNlkiIz4XkpRo8gyEMPeltrO2sWNveSVBp977ycH8ei6G4HX?=
 =?us-ascii?Q?KLIps6IHZAbFLlSCNdfWPNcVTQkttpJ22fWxHV+B5MMZxFN8II+1pIhzvS97?=
 =?us-ascii?Q?g3yDTqjcQXmGNj5CKcYZPApyDaLC7SPohwfTFbqvRwCb0BpfJyIkyWmsKoIn?=
 =?us-ascii?Q?EHN899iHFjEoNzFZOq44+BEE32UV7yst2lP4xAN7eCojvFMW4lFiaxzycGBU?=
 =?us-ascii?Q?vpaoJsM+SIiLpwxZMTMeb+Inr6eimw8oGJdgQXTlGMDz/q3ad+NfJV9v9kMf?=
 =?us-ascii?Q?HJa/sAuwlLyQk6JzE8w/HgilTok8VQFZnyzlYSWG1nWYsG70QccBKfcPhlTB?=
 =?us-ascii?Q?4AUyd9pfIVoefrAUrlwj4X3uWqQ6N3HlVs8NAetVyVNSXplciPeLJgD5eHz8?=
 =?us-ascii?Q?yLwAz1ve7GGC41Jgis9fNYr4zhVIzfkMdoKpb/xs0Cpd5/EAizHZXO3LRBlB?=
 =?us-ascii?Q?0l3pucWq6HuRB1ah1eTIERT2WsU8LQrH5TPVwlOnzZHa3AmsjxHjePPYlpf7?=
 =?us-ascii?Q?Her34wYwcTLDxDVZdGbpZCM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c76fec0a-79f8-429e-4ebe-08d9ea14dbd9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 08:35:55.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nzIC6SDgufoJrBFwjlXayasMfgvdLVj99gZEG1fED8YHXqOTfjVN8NigSGek6BzuzUE3WEBUYULz9/tCHn7CSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3056
X-Proofpoint-ORIG-GUID: pgTtiEhVWXJQK1ZqdKHJQg2HOEmhHEAn
X-Proofpoint-GUID: pgTtiEhVWXJQK1ZqdKHJQg2HOEmhHEAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxlogscore=739 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 08:36:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161442

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
index e3bbb4cf33..641b598f68 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -23,6 +23,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://include_sysmacros.patch \
            file://0001-mdadm-skip-test-11spare-migration.patch \
            file://0001-Fix-parsing-of-r-in-monitor-manager-mode.patch \
+           file://0001-Makefile-install-mdcheck.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
@@ -93,6 +94,7 @@ do_install_ptest() {
 	done
 }
 
+RDEPENDS:${PN} += "bash"
 RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-- 
2.33.0


