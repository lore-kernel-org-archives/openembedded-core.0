Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3366DC25B78
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 08:11:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56011.1716192666269848490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 01:11:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5870edb5a7=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K5gCSv000472
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:06 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y7c738pt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 01:11:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axQMRobEJ39656PQDx4pnhXItHVqD8GxYOLuPle3niW7jshxDP1zw7Jj6Wyh9wanQFCqZNwCVjJGj9B32vYjTopJrP2A0MqIcdnZJaW0vGGWOqPQVcZ/0RldVal/UwzhS4rAwkEZz+9pEBpedeOahXEFcmksOWH3X+0N5PCVpwYkLuO73CdRvQNd7tD5hloEojMMkAaGAuKbPU9bQQiPWhFOLYTmumRYmUKAZxVla4F/np82v9j/xmPc7L9+xVbVSIn6eb5p0pkcu4Ycu4tkBiDFSU7Iiv+IOxoDZ19nf1J+MnEzU5xJr1D8dgrAsa9Lnqqv+kH7n0U+/0DsoreSxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtlG6bD2USHsiUhek15j7em9sXCI76+5QORIiFqaGmI=;
 b=XMC0LRdUpUjCTDwlcjhzbCjIdm3QB5tZiM832InK2QY7+v+Ny+PvVfbZMEhilNx5kkwX9CDQ0uYaJvSnFIExmIsCnLrovmSntQm+IgNOKDLoPXZ8Do0H992wy6ABUsQmX6OHxQnR0K7ln4pt9AQn+fyzpgfstg324f/zg+NtLzqWPjASUnwhN2TW5haURjos9Bcgn3Sitph9jeuMJSBxXolsSh3lWGp5rpeHf1RwD3EZA8Ha7gDzMNV4Z5FrnE8ES/mic4iZuHSZ3ksDyHBIILexgdJE5HEULPyQEoltHCSYCDGzepWMFD6MwOE1//J8zsjtSkZSf6sGWwGeP++m7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO1PR11MB4882.namprd11.prod.outlook.com (2603:10b6:303:97::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 08:11:04 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7544.052; Mon, 20 May 2024
 08:11:04 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 6/6] kmod: upgrade from 31 to 32
Date: Mon, 20 May 2024 16:10:40 +0800
Message-Id: <20240520081040.2380736-6-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520081040.2380736-1-Qi.Chen@windriver.com>
References: <20240520081040.2380736-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CO1PR11MB4882:EE_
X-MS-Office365-Filtering-Correlation-Id: b18a7ed5-30c2-49fa-d71b-08dc78a46507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|376005|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0MR9BVExMHArDSjPR1gP+w2mBCOhefcz/DCyxuJLMPW05Zb9CNcYvBs48yHL?=
 =?us-ascii?Q?wOW1RzRMEkYylLSl6PLkX+MVYc9zy1SApD8abrm/NaiqtGYQsEvvNGYkFzqH?=
 =?us-ascii?Q?hWQbxWbNwBpAQpNYp7Y8YwnfxCgua96HMmF3UiSNERxgrKjp9uKAImoER7U8?=
 =?us-ascii?Q?gjq4IPp/q5r7lNGeTUS30Ak7BjQrW5u4UGmObDZDSD08TO+GM9vzAJNazyBL?=
 =?us-ascii?Q?rPfMuCOTOj3lIIHKD7ZA1m4bUhzDKjvhSfliFVGkD39Etc8c35FnOXDQNL8n?=
 =?us-ascii?Q?dhpSe7MntNYpIUcCCd//bEQMZ1O6zTve/ku0JZ94JDKIX8ErBEYnJ2XIP8jg?=
 =?us-ascii?Q?q4WG7NF469PI1cNM3RzvduFHWHQNg0YvXVnJ5PP+QynIsZ5MAWZMsUF8qgdD?=
 =?us-ascii?Q?x67XBG58d+GsoEkhCk0VusoMm1cn4BAjD7WelxS7I2QKQrcCeGfrTf+vUbDu?=
 =?us-ascii?Q?cu1iFdjLEN/rfjCmgZkiT6an6MkpiTD++NbZfH0MZ9auPvc0ZyHJWIKlGs4J?=
 =?us-ascii?Q?1sRA4m7vcFrHdcSm9krWtrH9vyZjCBLUM9EDvEAyXMuiVKCF2hJtzTPTphQy?=
 =?us-ascii?Q?J0KXYMz6QPeZMU/+781rcQ8KiPgMmMslDw7nn6kS4XtJyOdf53/SCNC4OOtT?=
 =?us-ascii?Q?11FKtsWB3ZhlDqvsK/8OnhPfh3I+5uG/Al+Vh2O1LRhgFhEfBNgndE6uu8v6?=
 =?us-ascii?Q?H+IlUAZPmtX5HQVWbIyPEujHJ3+jyqLrxk5zhV/6th/PACQxgZhdnb1p+bjj?=
 =?us-ascii?Q?m9AwT4mCXBdGMy2aFrjvhvTtmlUKRCUl0wOoSpzgsHNRyNBBTFQy7Dk3VJWd?=
 =?us-ascii?Q?VIeMw1Tdij/UDQI7aublWOxfcS/TFh4d+iy4cIHEfcxbpi6+W+x7IAHJaSKW?=
 =?us-ascii?Q?M48q9ltzG8XO3JMz1da/sSHGOQJaC7rAikQDVHT7HCyNtsVeWUUVHCNJyO5H?=
 =?us-ascii?Q?g/Irdh10HSAHo+Rw9q0Wfj21oNxjwc/CCTPB1JSegHCK9h5X08lK2fG0v5Q2?=
 =?us-ascii?Q?MgYiYh+K8Y8MuSPjAjQ8w2fc3QEcnAcVFrCGUgDtGL96nl2DHALm8MkDd7jt?=
 =?us-ascii?Q?66BTU3gYiCn3cRoZgrVdATEix1wjB+FjE2jQ8IDjFiLF9pUxwMQcNM39KvIm?=
 =?us-ascii?Q?BySFrbwa07QQyY5opwUhrJcHkgdikYc9cR2tFHvVidD7ePZ6hAS8eLKLoZhI?=
 =?us-ascii?Q?9PPnLBst0g2OssqdGQMbFlyfJ0OnioZK4poHMiq1Exe6zbyeltlIXGJv7ViG?=
 =?us-ascii?Q?etP4e4cxzyqgAC93Apg1KA2qL42jS442dH68O3M8ng=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RFWFb+3ZRFfKys6elrcBPZRYP6dL7zDG5wtp4GETRVnN7FceTC5lMEb4fOri?=
 =?us-ascii?Q?md23nK5SU40lllXRDPCYjX2FzMcaIsaNDU3BiKTD5bq37GK32yEI1alzhxna?=
 =?us-ascii?Q?WwA83nJCTB9E0ZwiBl2IM/wyW6qMCD3o9AvrWKSEoWLUiffty09vA9SP46RY?=
 =?us-ascii?Q?1S5grJlYq60iRQXaPEdgJ8+k3LtWOHoI2tMpT9Qpy0RKbBlUN5TSPOGchdmm?=
 =?us-ascii?Q?jMIz2awIP5Ce/DdUxTe3QCE8LqcgehWqPkd2a15pAnMbS+nsbcnyLjxcvp4V?=
 =?us-ascii?Q?GWg1or6ir2c6qBp2erujFWKRRqtu/xFdCLh7XYrPWaz7sMxyg2X+udYwRIWE?=
 =?us-ascii?Q?sHkcZhiDEZmX5S4J/B95aU8yT/51PC2p0X1wYg0ReL49c7zW4yZ2N/RRLE5Q?=
 =?us-ascii?Q?73CxmAhEPT8S8jEV6DVf8eK5zZfD9oTEmnxWmLtaBJSzZGNzNqYCKLQHq4Aa?=
 =?us-ascii?Q?13MHeyZc9ctYvvdMyZ17DglAoWkvOaUhKevCFyQEgDroUc6ECvXvGpGwoEFm?=
 =?us-ascii?Q?DeWMYAhqK/CxrzBt4vey6T1JSO7MEjQNTOAAtUpIIn3rV2WWe12km76PqRXI?=
 =?us-ascii?Q?QyRx2cM/5XYhf1PoD6twT0PXB9+ILiR7N2rzAAAYLXKNrAsDSESw01CpUO2y?=
 =?us-ascii?Q?BH3O33eG6FtiIDh3A/DfjLmDnPIpzogCOKpytAivBQznQRNQlFw/qh+mBJef?=
 =?us-ascii?Q?EeU2m74jsqZ1SxAee6D6N1T3+T30UGMrmVYQpLc6AtxsqmJJ2GXle0ahZijt?=
 =?us-ascii?Q?NuGaTM+baYtjctrZ2DadX8nqPzuRZIwovMStU6S+9dLKoYsKsYV2eUJYhFbR?=
 =?us-ascii?Q?gdkHXkPJZ7YTCztabCiKrvUelbc9bA3yJQA36SXA1p1detseDeieSBKVnyDG?=
 =?us-ascii?Q?EgUwGbnhrmMrVk+ZgEC5ne/S9Rs0s2Vt8k0E9IwfyE3dyTUm+k+Kl2CNLORy?=
 =?us-ascii?Q?IX81YUuH7bdOiqr53Gkr4TYDnlxbihKCLPtamj6/dnU8dpQc1xz+PGgNtAor?=
 =?us-ascii?Q?QGDsjPcW20fnjumxQ/YVGzqFc8AriBoAtbktAv/V9T3vEDja+UadYP5CawGM?=
 =?us-ascii?Q?PGpaxL8dkp/Yq1KMG/lVOt6W2Q+hPYgTnN6XzAvs2vhJtf9q3BDQgZC+kKON?=
 =?us-ascii?Q?/jfJaiUIiPU9Y+m6/cM9vaLa1SY7KdR81a6GzVTmQzqjEdi58Q0T00NEWrtq?=
 =?us-ascii?Q?fM0tmIa+dfTgrVLiNo5tjoudB0dnDA4zk9r3gLDhYUw/1HB13IzYFAGkGoZY?=
 =?us-ascii?Q?rP/AdFxGTnV7WZo5b9SZ6/uUYp2xFdI4YD3de7+wSZUzsEr/fQ9Ayhudgw91?=
 =?us-ascii?Q?7GtO/XtFZV1VcF4hK6m67zDikwTctsLE+g1Syn2cRXLsoHBtIl7ilGtiDjGI?=
 =?us-ascii?Q?E4FbOS0V8mESvtm3XYSP1FH/Qln78weEED/Zg3WoHYL1lN4KJomEelb3e70x?=
 =?us-ascii?Q?im6pXbZjJjW/ZOT82rkHgOTYhEyv8o3G2EySiukzLW6yaK/HjJX1BK2V/fUa?=
 =?us-ascii?Q?RsRAMdjWZukIzZdP1l9PaurRcpNm+MKFfgMqMnUKacVJlaWN7xx97qhGN16R?=
 =?us-ascii?Q?K0T/otNsaKYzgQNQ+/Hpo2hN7lGNb7QYDYi4xK2M?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18a7ed5-30c2-49fa-d71b-08dc78a46507
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 08:11:04.6837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A18JnTGdlPoN6EXirpGiFMjMoPBfng74uf1iIUQ+QVndZjLpHQQcqUFYJblSy7uwjxgCHlcA4WnZGEgy/zyPUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4882
X-Proofpoint-ORIG-GUID: MUMehhI7Ha9QTo_8P9hryjbBCxVKuE3T
X-Proofpoint-GUID: MUMehhI7Ha9QTo_8P9hryjbBCxVKuE3T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=944 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 08:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199561

From: Chen Qi <Qi.Chen@windriver.com>

kmod now installs symlinks in 'make install'.
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?
id=e98cef6f3f8cd6f8bfb26d147b2c209297453cca

With this change, we no longer need to deal with the symlinks in
do_install. Besides, as upstream chooses 'bin' instead of 'sbin'
to hold the tools, we'd better sync with it. That's the reason for
the sbindir -> bindir changes.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../kmod/{kmod_31.bb => kmod_32.bb}           | 24 +++++++------------
 1 file changed, 8 insertions(+), 16 deletions(-)
 rename meta/recipes-kernel/kmod/{kmod_31.bb => kmod_32.bb} (78%)

diff --git a/meta/recipes-kernel/kmod/kmod_31.bb b/meta/recipes-kernel/kmod/kmod_32.bb
similarity index 78%
rename from meta/recipes-kernel/kmod/kmod_31.bb
rename to meta/recipes-kernel/kmod/kmod_32.bb
index 718a5565b4..1235bc1bf8 100644
--- a/meta/recipes-kernel/kmod/kmod_31.bb
+++ b/meta/recipes-kernel/kmod/kmod_32.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
 
-SRCREV = "aff617ea871d0568cc491bd116c0be1e857463bb"
+SRCREV = "41faa59711742c1476d59985011ee0f27ed91d30"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
@@ -50,12 +50,6 @@ EXTRA_OECONF += "--bindir=${base_bindir} --sbindir=${base_sbindir}"
 
 do_install:append () {
         install -dm755 ${D}${base_bindir}
-        install -dm755 ${D}${base_sbindir}
-        # add symlinks to kmod
-        ln -rs ${D}${base_bindir}/kmod ${D}${base_bindir}/lsmod
-        for tool in insmod rmmod depmod modinfo modprobe; do
-                ln -rs ${D}${base_bindir}/kmod ${D}${base_sbindir}/${tool}
-        done
         # configuration directories
         install -dm755 ${D}${nonarch_base_libdir}/depmod.d
         install -dm755 ${D}${nonarch_base_libdir}/modprobe.d
@@ -71,16 +65,14 @@ do_install:append () {
 
 ALTERNATIVE_PRIORITY = "70"
 
-ALTERNATIVE:kmod = "insmod modprobe rmmod modinfo bin-lsmod lsmod depmod"
+ALTERNATIVE:kmod = "insmod modprobe rmmod modinfo lsmod depmod"
 
-ALTERNATIVE_LINK_NAME[depmod] = "${base_sbindir}/depmod"
-ALTERNATIVE_LINK_NAME[insmod] = "${base_sbindir}/insmod"
-ALTERNATIVE_LINK_NAME[modprobe] = "${base_sbindir}/modprobe"
-ALTERNATIVE_LINK_NAME[rmmod] = "${base_sbindir}/rmmod"
-ALTERNATIVE_LINK_NAME[modinfo] = "${base_sbindir}/modinfo"
-ALTERNATIVE_LINK_NAME[bin-lsmod] = "${base_bindir}/lsmod"
-ALTERNATIVE_LINK_NAME[lsmod] = "${base_sbindir}/lsmod"
-ALTERNATIVE_TARGET[lsmod] = "${base_bindir}/lsmod.${BPN}"
+ALTERNATIVE_LINK_NAME[depmod] = "${base_bindir}/depmod"
+ALTERNATIVE_LINK_NAME[insmod] = "${base_bindir}/insmod"
+ALTERNATIVE_LINK_NAME[modprobe] = "${base_bindir}/modprobe"
+ALTERNATIVE_LINK_NAME[rmmod] = "${base_bindir}/rmmod"
+ALTERNATIVE_LINK_NAME[modinfo] = "${base_bindir}/modinfo"
+ALTERNATIVE_LINK_NAME[lsmod] = "${base_bindir}/lsmod"
 
 PACKAGES =+ "libkmod"
 FILES:libkmod = "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkmod*${SOLIBS}"
-- 
2.34.1


