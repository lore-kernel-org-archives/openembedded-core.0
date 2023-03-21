Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8F4C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 02:31:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4017.1679365872466289499
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 19:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2444f31f01=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32L2UGf3001413
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 02:31:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd49ath9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 02:31:11 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32L2R9E0026528
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 02:31:11 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd49ath9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Mar 2023 02:31:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2a9+j+n0JVwBisMZDiDDx/u9rFm3Qo4f/tErHRzWH0Hq9RjpD693W+ezozmW+mUY4zjzlElh+89DnavxjkZP3u/wSSCB/oXNdJboZDNcMB+tNnYd3T9ce7BlokvLkP2wNZ4yGiF8xYu1VWwtvi8xTZXAiWaU+3xy8eXS7DlZcQW5Fg1YN20/DMhNb7ZpBLZKbDvSNPatpGQGOU/K3grvCh2N+SWgI0c4h2iKmCM2gE2JxnoQEBeBQB4601nmLLHMAlX4gwl1pnllwQfCOcdUhlnEpWuvnzb1VmHezIBZTxIiZCqdx8eww2ImYi0WVxoeWI5NMO6B+VjeHwG86q4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aek9fik+mNlB9uJqP3puiULsQ+dca1cG+7NKk6dWgD4=;
 b=gdIe+BUb3TlyfUS4bkY7Y2MeBtdTHM8tmUMjEvFcfpoXK4i5GT/WnpvQSIiu6sAw22g5XeMircYdFB3cbpPwZpG3zOfXT+6PQ+ugWz8WTBPEWvDL4Zu6qv0Kzb7Qtg9Wm0ti3qKUnEk98uEPkortV+Skug0+xqsrRIWvj+uQhV0WmSrIaKoTTchCQihJQOZfFUa0tiNMHSVCSSZ5Pzqppn/akEZAoF6NCCStBIPf9U0wcIfxX8T6/MKbaB+Vth1mP4Y0yBzkUbPF8gaGuLcWn+c5UGqt+Z2lu+JASdzXVkY22+JRGGgkSjq3c/9uEPItEczFC9x9wmeNpgXOescmAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 02:31:09 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f952:3d02:d71:cc68%5]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 02:31:09 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] rng-tools: splitting the rng-tools systemd/sysvinit serivce as a package
Date: Tue, 21 Mar 2023 10:30:51 +0800
Message-Id: <20230321023051.1174961-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0134.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::16) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA3PR11MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e7535a9-d394-4dfb-a3c5-08db29b45444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PZmKJnJlxZe+Emg/MXeOyNHhGoUcREc3W5fKGfgAlCbm4e3jy29RrEMpbl7MrhY1YRAA15HoGTahVxC8bqzTy5XwwEqnbc+QT+EX9CTAVnf9OMMMAVbcsW+aKwBMPy9b+GbMGxbbjgUEG8l7hUpYQ5vUeWwPiz5sTjcQNHtX/mnwrIh2W2IqzJN8cc8o7YAMXlos+RY0y8E696DxvWo4EHx9V4ITrB4NtZIyuuNhcGxIhGjXrdeLfKQqpeaCZ3MoIplyW2jBdE7nxF6ZBtZlcr5QfYBfXIbHfuVL+P9jQ8iLe47NMld+Mo1NfDhYP46WXSB000xhVt5Fw7UMpWsPOFuoyOg+sa7SwWZGUKlOrGdLYtnbtdSRBwf1gljzL4UAkQaZOdjqhVStE3q+C1AcyUs8nxR74QeMirox7Kty3GdJ2YweWqMpf+V4yF65kyqRFlPnWgSbb3RRZLZhbqgZMtII4b/6Zd/eOVH74ZZHH0zPJbadxxLcw6yfG821g61G3WRlJ0WYijchQBP//LHnTc6xB3bKB4hrRQIjBInYLDr35h0prd7Uqww4A89Mzyqn+dx6fefDrHFMxYqWrCNMzhjrJuSCPE1+X1ekBlZfyYkPUo6UqoQaQa267bETJiyygT8HMXtPy4jIPIZLLlQ6wuqiA3DUpx7VI53/1i4KtEUIcrqxJwp7azeHGDaM9Kw9nEeFMIWOhk416IP28Mq9Gz11onJn0fHmfWzDydULVHM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(346002)(396003)(136003)(451199018)(316002)(6486002)(83380400001)(38100700002)(2616005)(38350700002)(83170400001)(966005)(478600001)(52116002)(1076003)(26005)(186003)(6506007)(6666004)(6512007)(6916009)(4326008)(2906002)(41300700001)(44832011)(8936002)(8676002)(5660300002)(66476007)(66556008)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DuLB6FcTIE4x+0+rH4EXPtGnXf6WtZiByew0yiy34Qfl6JMu85LHlL+Wp2HW?=
 =?us-ascii?Q?MQCFGDeL3Kh4r/FO3YOaKahUzwYTeAO4iT950w/zjtf3lcbvFupVT6HAEwBI?=
 =?us-ascii?Q?CmMAlMglIyxhOIqsWUgwTdvLKRBqRouCugs2HyCfAa9yPrbRhz5jiJr67RZ7?=
 =?us-ascii?Q?Clm0dAlCh0j9oH7WYH6+R1bzRJhSslxrm4j+r3ntM3xP6rwhi85t4SRee9ig?=
 =?us-ascii?Q?/wiNPt3hV5QO3nSXckdpKgLBoZm4G0YfttZa9MyBRjEfmm8w/Ltbddb28HKp?=
 =?us-ascii?Q?G7Csbs7hDMI0KQpeBJ5yT8rbnktj4MfBsRkCHHd2KpuR1SO0g/w0Y5krOGUs?=
 =?us-ascii?Q?03hsQf8539zR2dbDao5kwfLI3GJhclrah4qy+Um6CxpTOrR/Ny6MkXo1k2rc?=
 =?us-ascii?Q?INjjSuHohC1A4gWkDahFYdz9G5Ze2LZ7Bial4nKUUlIK79xc5gt5fnWzRY4u?=
 =?us-ascii?Q?J7196H7GnPufCoxp3qgY6rnnybsIX90CKjz77o5Ili5OEQpgHK7oqO2zF1an?=
 =?us-ascii?Q?p3JKTf/jCr11Y1kjL4U4mL6SN9S8LyZ8SvCM2c+uCefvxRW/3O2JQI3LHD9N?=
 =?us-ascii?Q?b6puQKkp1H1YQWnH23kp5/ZLecZ5W4W+frjP9GCktiJsjpEgaqR0Epf91wAp?=
 =?us-ascii?Q?wE3vuzTb5j+273ULVS4oJI2hR7DKWE04XZsvmEYaLvwSOZgitYPPADuSzTOm?=
 =?us-ascii?Q?ECJUo4TZj+KG8mJePKeAgxfO+stdzgUC3Lwrt5iLlmFjySl7576i0rs7a8dg?=
 =?us-ascii?Q?5HBxjelV1k8Szbl9tgjuxTTTctWXCgOKSy4Tx3D2dkIg6le73icTKbiGvGe8?=
 =?us-ascii?Q?ZFmugrKpEqQanMVpaC1jgi/3Es7J7ndGo3UTwG0Fn6ciRTJh/jhP8IyoIJEU?=
 =?us-ascii?Q?tM9xqa2jobuR8ss3MRnUowQ01AzR/CsMyFXcjeSQGSp5uxa7ayQv0Xm9s/um?=
 =?us-ascii?Q?nFqNXrIZ8gM/KQDXM5dbKfgSn3Lk+mB/AuHgj3jjaBAlXG2cFLmlzdyW2nMd?=
 =?us-ascii?Q?Bue4EHTQhi8XM8M0CYvoqNMuFXL5iBdYSKEA5WrolW7lnTJNPHRoVfUCB9jD?=
 =?us-ascii?Q?46mTiQE8NNfXM7izfxKsxqZy9piybtkk3+9AD7NgvRH1sFg3P7MSRh3LzfpJ?=
 =?us-ascii?Q?l9QOU8a7GVX1cw0upXijP421Mg4y179IUFVuHwgs3ofBpIbChi53omD3epq/?=
 =?us-ascii?Q?/z1zlIk/mfnf9o/HxHd3BqNznxK9/w+ILOsHr7x+2TfyuWE3wPYOUYEkt5MY?=
 =?us-ascii?Q?ICraeYGtR9K/jRVyc9sVIPE2v99ZHjnJmrRJqW3lFZuqE8VG52LSD4XJ9iux?=
 =?us-ascii?Q?88/vHA1f90GXoEne3c3xXgZt6Okw/69x5swOuIga8ow5Fto0sZdM/YP0WQfq?=
 =?us-ascii?Q?6HXBZuEDdtxZm6ptLTuamEQH9ctLHbZciecYV/N2xF6RO2NJe4Y4lOJl0Iey?=
 =?us-ascii?Q?tg9RTEwFF7Cu+mTzRMwXx66ng/dPzp0nDMpSNJyDvjhsqxhI2Cke6LRnecxx?=
 =?us-ascii?Q?TAPlDgY4Rn1sKYC6fqXpO6zFKLgcfems1pluci/F8H8JhWUZiioKmD7+Pn/h?=
 =?us-ascii?Q?8/Z0GPJ4m0+A7UKZmYVwLUc7Le9hxgsJjNf/11XxYQH3C4ABOr1tvXqipKYk?=
 =?us-ascii?Q?8w=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e7535a9-d394-4dfb-a3c5-08db29b45444
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 02:31:08.9412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VNw/Gjh/JYetRzmOqfZ6z+yF3Tv5FGcRyGMin7PSn5IqdLTqRynWcK+R8iepWvknJJeoMwH1Zg6NCMrKysg33jeBLxdFTzJ/Cbmif7617Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
X-Proofpoint-ORIG-GUID: f8etc6Dt66G_gV-76NakZifw1gOVAf7C
X-Proofpoint-GUID: ooJiX5bZYqCQWknRVPUKEo12M7zQRc_o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_18,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=997 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303210018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 02:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178846

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Since we removed the openssh dependency[1] on rng-tools, there are no package requiring
rng-tools in oe-core, meta-oe, meta-virt, and the /dev/random won't block anymore after
linux-5.6[2], one of the reasons for keeping rng-tools build into the image is that it
can be used to test[3], so splitting the rng-tools systemd/systvinit service as a package.
If someone needs rng-tools daemon service, they can enable the rng-tools-service package by 
directly.

Reference:
[1] https://git.openembedded.org/openembedded-core/commit/?id=868dfb46d96a27ec9041cb902fb769330277257d
[2] https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32
[3] https://linux.die.net/man/1/rngtest

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
V1 -> V2 changes:
according to the review comments, using FILES/PACKAGES to split the service package instead of adding 
a custom variable to disable the rngd daemon.
---

 meta/recipes-support/rng-tools/rng-tools_6.16.bb | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.16.bb b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
index 4e664a9145..7324e42e08 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.16.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.16.bb
@@ -31,13 +31,20 @@ PACKAGECONFIG[libp11] = "--with-pkcs11,--without-pkcs11,libp11 openssl"
 PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2"
 PACKAGECONFIG[qrypt] = "--with-qrypt,--without-qrypt,curl"
 
-INITSCRIPT_NAME = "rng-tools"
-INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
+INITSCRIPT_NAME:${PN}-service = "rng-tools"
+INITSCRIPT_PARAMS:${PN}-service = "start 03 2 3 4 5 . stop 30 0 6 1 ."
 
-SYSTEMD_SERVICE:${PN} = "rng-tools.service"
+SYSTEMD_SERVICE:${PN}-service = "rng-tools.service"
 
 CFLAGS += " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
 
+PACKAGES =+ "${PN}-service"
+
+FILES:${PN}-service += " \
+    ${sysconfdir}/init.d/rng-tools \
+    ${sysconfdir}/default/rng-tools \
+"
+
 # Refer autogen.sh in rng-tools
 do_configure:prepend() {
     cp ${S}/README.md ${S}/README
-- 
2.34.1


