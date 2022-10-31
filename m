Return-Path: <xiangyu.chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D368CC38A02
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 07:51:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6646.1667202663060013824
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 00:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Xj+IJ7VS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=830306a705=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 29V7oCdR029752
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 07:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jbt3jW/AkgEaa3ZQjFJBtNfADNDJR+UvDSRr5JkMccU=;
 b=Xj+IJ7VSVhEnx6FVj+Ds0zxzxAUkWwa8zPEh0UPeVWgETlAwkashmK32LKQEqoPqY4TS
 ghhcGXPS22LMoTqPWneh4dUGVc3MZ33gTzSKLLGIwIxCTEbsNwOVQyPL5eczogdx0mnI
 94t9QsKLd9l25JC6ugT/yPpoO3+WfB+zR3dSZGIcxLQoQ8Q4QGSCfrkt6cAJoL+2GA4g
 yYYEsXw5SP4IuAt4G+89sUGRE1Ot11Awo4VgNnx+D4b18bdlDJDK8Wapld7GjWyBBU2k
 huZBm1CEU8WehvcICSenmLsyjZ6Vz1gHPA+pWLr5WD/Hjs8J2tJzTUo7GS7tc0W2/4bL FQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kgsd1scsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 07:51:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gzk/4SNGAq6KssC/9bZcJNfxf5sA1WN0ic0MFiMjD7cugW8uz6WTrfht19A3tT8PNQvkZEyA9bnDow+wnxnF0mksxNwcZ217+BNwoShUMSYBgtRjnwBmHqk3+yBLpkK04NFXyguf13QAF9fIlEs4kRyPOONCqu43mKGK7LuRre7t2ERwdxwohYHopBVyo3f07fvNRoBjDO6x+zfvSuwDS96csgljZrmBUzp736Fv0sylItM/CpqpF2lFRNcZW6E2V3PmNgKgXym0Bc3B7WyeFi0NW2owobFTRW6Qs505DmjyzmKSxvUTVv0g8juoQXyiFbuUPbmEzGUIov7DuUB4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbt3jW/AkgEaa3ZQjFJBtNfADNDJR+UvDSRr5JkMccU=;
 b=FDkvxGfWr4S6tV4TxVYZs539SzkvnoHCooEEWVUVLQIOefZ+6AOQ4dxcp/oLH5YPabIzbXhXxmolQA4IZq5NyUaPUJE8ow1fIzSRhwR/xHs3GhUia0cvpfToYh4n9LRm/6cCxjAZ3Jo9P8axsY3WjuwfG+iTGnXdwm1kEJVUJSmSoKItHA37A49eOvYgR7FdiGuXsq/7CWSvSEp6B4sbi6F+06be15WfHCH7VT7Do12PasVrqpgKSPQeV2DnCJxjkZnsTvUqWaq5cjSuzkaDJJnwjyw/AWFf817RJcEEXmm1WqMYU7EZUP4zn0hzLL8G5zijrrM5vsrOng6j7TiryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Mon, 31 Oct
 2022 07:50:58 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::99b5:140d:8487:5f3%8]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 07:50:58 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][master][PATCH] rng-tools: Add Arm aarch64 CPU specific configuration to address excessive CPU usage on startup
Date: Mon, 31 Oct 2022 15:50:42 +0800
Message-Id: <20221031075042.224693-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::13) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA1PR11MB7014:EE_
X-MS-Office365-Filtering-Correlation-Id: 8146bbaf-9666-484f-1947-08dabb14a600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6jeqMPM6yT55nEaDmR+oZCR9FG+FomoSFwqqnfsmoc/G9TsAk+KfkIV75P2FWtqmhScbDVSoAabwBbZvgXkM4fccRYsPhY/6riEm9J1Co3gHoWK3C8wuCmDbp4MTEI2lf3bj+MnAcGYUwUWN/A333gdIXIG6u4X0OzDRE8wJ+wXowC1xjkgCULeVxZgRbV+rLq3YSnMSfOapKmOnxhuIcfGEARlJ2bFFgJ6aRH0meWLqFpMSMdS7roVHqEJ/Ocp4ioBLcMB6EJWLW4GMGwvJ/xjYIcToeyHxUTH/LppQL8tTaNNT78P6fwGaJ8g6YAbv5FPA+/DMeIxYLq/p7v3KO4k1IgDxQgyvfSM89kSrCGOwwqn6D/2aW2GVPWphRBU627bTRpaC7dbiDBkKwUlFVpGSnI0yLv/0uolEe/XblkbPLqqDq5DcyHolP+OfkGTvBQi6jRMaKpP+LkLoXsoC0li5Iry5bKoUGO93Q7gj62E/sdaI6u/S9ai3o0YYW33TrJhnclzYSI4M6V58JJizHSeQhMV5Pt5Pp3GYetGDNPTI7orxcE7gAEgABzwppuSV+EtUgNtzrmrJ/pQOLH2qDRMGWaOwJDiRE+k0DIVD86GvjHDwXQyxhOOIiPeKgE/keCNagQ6bkPeYDG+2YNTkTQ3Ozl5gHS3Dmg/HY566MZxqxeq9Wl56b6oWaR2jWgnP6hiEp/lRyGBBn0xlyE2nlZZUBUpkgGihmQyXtCfRpCZjjwezY9fQAUfNODjCZo/DcWdyNF7ljQt7cEv5aTWOEW25XnL7g/pHFAXceee2FfoBTPKFFHikQCS+62HG32JZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39840400004)(366004)(451199015)(36756003)(52116002)(6506007)(2616005)(1076003)(186003)(26005)(6512007)(478600001)(6666004)(2906002)(6486002)(966005)(38100700002)(38350700002)(86362001)(83380400001)(8936002)(66476007)(66556008)(66946007)(41300700001)(6916009)(316002)(8676002)(44832011)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uQj0Va4sCbwYxyAiqfNhmwGKSOnRmvLzUs7A9KubMf6uct+Kzuv2rluOBSAN?=
 =?us-ascii?Q?Hygy1fm8gqGhgxyhwg62z8wtTjrrCk2Sf83kj2MEFLu9sYD2i7pzye/rS5YT?=
 =?us-ascii?Q?KksWJhkpnURPkJV7VRiNhFuqe3ocBoMNJW072qlTuxSpE2DeDSknwU/Z4sft?=
 =?us-ascii?Q?t5tsZwFJF1yqrkt8sLyEIhQE3CPMPw1K0Cu1l9f92Gr/hQYEE2QvRgZsYgY7?=
 =?us-ascii?Q?RwVWJ3KHvGQk4oGuQ+Rx6+aIVxyeqk4kaFVe54a6bkTp85WvjmjaPBSMGcvF?=
 =?us-ascii?Q?jV/0XOGaMJu+sJ9SMu/j1z8om7mpgnpilCVKf6/OQXA4H9T8lnYQcL231pMH?=
 =?us-ascii?Q?D+XKvQdBG/5CM9dlx1D7YpKnbmRsx5+R6O250SbvptKe89RzK1/zwrNgqKaE?=
 =?us-ascii?Q?qZGEtbnNVvJZ4HWRac3GB9PZC6FBZNBEQXpTteOprUSayc0sF2gOPe2I/gbN?=
 =?us-ascii?Q?T7V9vFPUppplUolWMOiC+Vjg9uiQbaeGnnPtXxzwyvlQzx2t79NLo7UCSv+u?=
 =?us-ascii?Q?49AciLo+iYA/pbfAGW0eI3y6/CZpQIHc9c8BfBhdnhnrjzIlp/xmh1G5dG8b?=
 =?us-ascii?Q?d0tT671rzfdepwc8l7ezUzph8m9pf6HWLn9M5KQV5pNlvpWg0aPxRapqNzjq?=
 =?us-ascii?Q?X498YAie2sT+6MfDKjhLl5o8RnywtQodQwWYjhaCPGI8EzFGAEnze5cdBzYc?=
 =?us-ascii?Q?GOusdHQmbCaxCRLEQ4oogZMFGkOHwMSTS6O6Gjm+AWvhfrpa9WJh8IMk67C8?=
 =?us-ascii?Q?h6lbKGi2Gwt73EovigkOlcrq8eFv9eCKEAt7PsQor4kD865HxkDxna3FH3za?=
 =?us-ascii?Q?IqVmYnh28MCTNtFcIxY2SPTDlghnsILofWXaOazYp1hoWycjMzVw6mXZX+dC?=
 =?us-ascii?Q?WPTuAt6KslG5gSmgFTUCNZcObFrpE3UN1JxlCwnKtDokxHhR6rch1NvH2ma+?=
 =?us-ascii?Q?U6G4PuUtwB371+A1UUV3wINrfEcr1vhS4ddMC6YqlmyHdKwEseTCReJwz2pW?=
 =?us-ascii?Q?7fwcIwlaejAX1h/92GqU3W4R/cfsjLYo+W+5W0/OkCLNeuuC0D3dlTK5Od1R?=
 =?us-ascii?Q?U4QMD1BV+Mo41MiZiT2v/HSKh6xWl7/JmFTQK1qHi8gEBbLqxHmIOP+SRZK6?=
 =?us-ascii?Q?oRt/ru00CY7T4C+1bZ4DXEF2m5hb0g+QM6btCHtUWnWyXoDuG9Uz2EXQqryZ?=
 =?us-ascii?Q?733akjF4slcT0vrlEBtCg8yQa2IeSeHmjUwIxl8yqhmsazq64JfUlVSKWX3g?=
 =?us-ascii?Q?PhbbBhHuXh/e6ULXI5OSQ12bikq03BTzYmgDXGT2BA/30vPnACs5yrS8E2F2?=
 =?us-ascii?Q?kbuOMubMgZ26gJ0/2Ycu5qGaX6duvKgRg7KcuvW12Adf4HLFul4BMihBMWaD?=
 =?us-ascii?Q?HiZ6xEtGzAnj8O15eBFBoLNQZxUmhovUuexnZCNsWK7eVGpaWvBperT6qAB/?=
 =?us-ascii?Q?NPdl+pprg+ATzMXiv+ritejgaYNfqLs24cx0y3UxvLsEDhDoHUxm9LZupbvR?=
 =?us-ascii?Q?vwr8y82X6hzrQaZtvQyYlJBYHfE/XCiZ7rT5qoei3SJBf1T1vD3r8WW4UUhY?=
 =?us-ascii?Q?SNuHOKLw8FFpaF+ZH4NyxWiDIRcOElr4jv0Hh/EP3DkSNeZKZffSld7okRpE?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8146bbaf-9666-484f-1947-08dabb14a600
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 07:50:58.7454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Hgo8fX5uhImcLSWyRF4f33B+AnxBeXMH68jPZRAPP6wfWY6gId4NGvsIyHBVAwnTP1frOo+xMcHEVJLvPR4yexMVdSVebMJ6/B3niy4ThU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
X-Proofpoint-GUID: EemsRNJVWGeROc6inFSqon0OwTGU6ltG
X-Proofpoint-ORIG-GUID: EemsRNJVWGeROc6inFSqon0OwTGU6ltG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-31_05,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=808 malwarescore=0 adultscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210310050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 07:51:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172290

With the default jitter options aarch64 CPU-based devices typically experience continuous
high CPU utilisation for several minutes after rngd starts.

Accoring to the rng-tools issue #150[1] and comments[2],in order to address this,
the following configuration changes have been made, those configurations
also can be found on Alpine Linux[3]:

- reduce the number of threads used to 1 in total, rather than 1 per core.
- reduce the buffer size from 16535 to 4133 which reduces the time taken
  to fill the buffer (and so reduces the duration of CPU load).

[1] https://github.com/nhorman/rng-tools/issues/150
[2] https://github.com/nhorman/rng-tools/issues/150#issuecomment-953079212
[3] https://git.alpinelinux.org/aports/tree/main/rng-tools/rngd.confd-arm

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 .../rng-tools/rng-tools/default.aarch64               | 11 +++++++++++
 meta/recipes-support/rng-tools/rng-tools_6.15.bb      |  5 +++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/default.aarch64

diff --git a/meta/recipes-support/rng-tools/rng-tools/default.aarch64 b/meta/recipes-support/rng-tools/rng-tools/default.aarch64
new file mode 100644
index 0000000000..5a2fbcc9ef
--- /dev/null
+++ b/meta/recipes-support/rng-tools/rng-tools/default.aarch64
@@ -0,0 +1,11 @@
+# With the default jitter options Arm CPU-based devices typically experience
+# continuous high CPU utilisation for several minutes after rngd starts.
+# See https://gitlab.alpinelinux.org/alpine/aports/-/issues/13035 and
+# https://github.com/nhorman/rng-tools/issues/150
+# In order to address this the following configuration changes have been made:
+#
+#   - reduce the number of threads used to 1 in total, rather than 1 per core.
+#   - reduce the buffer size from 16535 to 4133 which reduces the time taken
+#     to fill the buffer (and so reduces the duration of CPU load).
+#
+EXTRA_ARGS="-r /dev/hwrng -O jitter:buffer_size:4133 -O jitter:refill_thresh:4133 -O jitter:thread_count:1"
diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
index 0696351903..e1f6b2ad77 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/nhorman/rng-tools.git;branch=master;protocol=https \
            file://init \
            file://default \
            file://rngd.service \
+           file://default.aarch64 \
            "
 SRCREV = "381f69828b782afda574f259c1b7549f48f9bb77"
 
@@ -59,3 +60,7 @@ do_install:append() {
             ${D}${systemd_system_unitdir}/rngd.service
     fi
 }
+
+do_install:append:aarch64() {
+    install -Dm 0644 ${WORKDIR}/default.aarch64 ${D}${sysconfdir}/default/rng-tools
+}
-- 
2.34.1


