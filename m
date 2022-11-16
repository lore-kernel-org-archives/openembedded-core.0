Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8126C4321E
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 10:42:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5902.1668595349129070296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 02:42:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Pm+e7DcJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=831974c6ea=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AG9XBsd021118
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 02:42:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=ZeZRihYogHJRqQrL1dIRfKB76px8eoPM7/bHyysKAEk=;
 b=Pm+e7DcJD810ncjTbeF05m64J/0IjE1qJu8iW44SMl77tZKtor9W/mS5/hHiGj3l7gIo
 yAguTEoMR4MS+tBlvIsyW0ps25CDt1iFDNSUOVRESraFv+9Y3ahEwDLrwelhOpTtVX3g
 wHl6TInCKx6riQwvShBNxeFlY9U6XXK/FER3ldDa6nzVzF4pF+1/D9fXqIp6CwPIXL8t
 k7spuAdnNmBdUZgr9/LKBEgXZoirGPB/mw7S9bnNKEvRiZVqK9wN08vpefaeubUP7ya6
 LC2ebjDeAgAVp8mc8vxzg6k9qu8Bx1assZjhrhpG8RudvnDZj0uhKUXsfOiA+6W4xQSt Ng== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt7n9b68d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 02:42:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sv6VEeFtvffXJJV77g7grA9f22qNSmW7Q0SXt1/SRC6wDPBACV3uq+JrxWXg1lukcniGXKJOA2vXKujekMSoIsVKnx80TKOa1+exL+Kt6aLUSkMlA2dpMPYJfh9EN+1sAALKRqqfwam0ziaF+vPXdlEIGVGLZxygPjvAIWhOoj01+TquRASvYGERiiIcNK9Dk0vKZmmIzYq9HBezxsN43boZ57GB/yfAzW0XLaCLXdpFHAAiePKPARNPP86FUii6kP98A5GmZwuaREyZcbEg86Pq5cAH0LTaxIod9eBBgtDQCLU1WSu7TsmYTACJNzRn0DJzqr1U76l2TgQpKtAO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZeZRihYogHJRqQrL1dIRfKB76px8eoPM7/bHyysKAEk=;
 b=OkGnyFgKg1eP4Ls6Drr1ghoW1jZy+NCngk2Xclf1ljZq9eO1t0sZzIfSK3FbA0BFboc+KKMbd+n8+TSCzuLcAWRsBnw0tiEuII2VBfphPl87osOXHUj3dZbll6qkdH6m7gA3eiJppxhiRe5v9UgvsC3fEBbMg7AWL5D/4VuCEunSMFx8gAX+j5eYIvW1DgrtwzXA5pcPpKAX1NH1Rnvmrq7YKSGfKc1A35fCl/dG0M63IOlpBqoQht2x4R/mumP9HimjnG8lwttun5AYER0Li3wvOXPu0U6kZ9e9UvRU6iz0IBCCKsFx9XGlFH+z7DpBPtmk0omMgnFLXDlxadiQrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Wed, 16 Nov
 2022 10:42:26 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%4]) with mapi id 15.20.5813.019; Wed, 16 Nov 2022
 10:42:26 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] resolvconf: make it work
Date: Wed, 16 Nov 2022 18:42:07 +0800
Message-Id: <20221116104207.21517-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db52e3d-782c-48ca-f31c-08dac7bf4075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UTiX7D3fC8eVvHQNT54qeyeAmgBBBnHcPnG7yhzC3/MOjV2BLObOfd+3X133VSNto9/RiW4vHH/qAvI43fsiJFVOlUJcxOAf6LxpfsZg/GTisMN6ZKwoXF3eLHFsTWbxBhmRVAo4JkD16BEntq2ualmzkOzHsEGXQkehvnTZkvF9P8SgQLBA/ysYiG2evEYN2SGAaEmxwVVRvWARcsxOg9NzhW3sVdPd5FYP62pasgl4Sa9ZcGC9WR8+c1fbQAMyYpLecy6S3igobmUWkjXBTrzPWnNjKPZjwseXVuK03zQ+fmGFor80ZlHfQAP+kwqhqexQJM517QJW/zpQoXtvZwGnF/WBnVgUeCPu0M/8o9wHrnisrLHvEOA5fTpf++5DFOgatoOsjtAo6CdbMeD7+gNUqCpxmaCivS2YOKvcEShT8VkKw4inYBL9iQ9RQ8H/CQCapgu8Kb4yF3KTDXsJXJgp0fdxDSwflPTpJ4IBlCD/vNyZZz2mOjzLfQwMrvUzMvG1NsDFvBAnjU5Kw7Qn8zro+3ClGE09Jxc6RXQKO5uxNx1dlo6RjHzgVhS1l59AbEgLJhqAqPA/E6WGMalXXgIu15m8PV0khkGaHgZGdP+CUoxjKDjtEbYe0VwXysr3AvFlq0T2HOC+57moPZmp2oA3Y3hnTpBB3kqyqqTOWzqKCQNa8kLvjqHpx0OGguQFOM8TG+igfkWxBhyo89a3ABFQ2AEH0t4X4UvOG2kHXLyW2hLQGy0Nlq2lfmVYkaaW/WB2ovrSwudyVB1YFwWw3La8pAjHMMtwzOwdh59yf6w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(366004)(376002)(136003)(396003)(451199015)(83380400001)(86362001)(8676002)(66946007)(66476007)(66556008)(5660300002)(8936002)(41300700001)(38350700002)(6512007)(26005)(38100700002)(186003)(2616005)(36756003)(6486002)(1076003)(478600001)(52116002)(6506007)(6666004)(316002)(6916009)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8IySmK3MWwbfcIrFb7SWNGdfvtKhL1TLIUnHe6cYuYfkARuFgwo/PVLNb5uK?=
 =?us-ascii?Q?aVLe5dLwfY9QxTLzufQnFo+s9I17sc2C4FOfhv0FWCY2wmrnvpIzHoL2vhF2?=
 =?us-ascii?Q?hiHL53jC8+a5+mnvPX4jBEKEmmW5MZk+iU63Fl5g4AGU6Cl6Oj12Q7WmeX7S?=
 =?us-ascii?Q?+LbmN/klrlO201ojKExEz8s5nvMBrojihihQpxv1Ta2jLPhNtORCPD2I7Uj9?=
 =?us-ascii?Q?ahU34ilYOiN0mQdzNuyaMK6I/XogSlDNGNEA9auoW1tL1zoAtb9VQfU0hOCm?=
 =?us-ascii?Q?ZeIia7jlu+/l3GVy+OcXqMgbMrdM1k71gB6luAddLMfGriaa+bjuLYqEGfeB?=
 =?us-ascii?Q?YcpoBNE1uxakqj8Yf17gIuU+GxvU+/8XJyUXgSQr9AlLcyAQDodgFkxxhUMA?=
 =?us-ascii?Q?6dCp2rVxMAEzlz4dS1/eMpjTKutl0vq5MLj+wHEVwLYdrJuf1LQXBAR6lsWy?=
 =?us-ascii?Q?WGfrWsXuo82ihI0QnKyVT4YyKvFHOu3Nw102si+TOF/urBQL/LVWBNDX1mtL?=
 =?us-ascii?Q?4KruLx3uGvo0YfFgnLnLFJl8lhwA7OBHrTIbbAlLb4DENd93HQgW9Oqnc22N?=
 =?us-ascii?Q?KMX2aIKRJ5xaopcX8CWLWKn5+8XbgdDbPALGw9flR6VoKME6OQhlRccvpEe1?=
 =?us-ascii?Q?Q63IwI23ebI12zp11TRejy+R8QDt7JzUjuukMXE9a6Q9NDmK+6LbFLqon1wZ?=
 =?us-ascii?Q?YedJgP25S7Rau5leGBccmMW+RqX+D5HIFWSvlRIW3pxKKDuO+NMBQn4QWm15?=
 =?us-ascii?Q?yO/fyI4dBwJpQ+jMmyTYJK2aEmdWlQWMsCjfzKLRecb1wq8f9VgchL66h/EF?=
 =?us-ascii?Q?aCxpqoT3+zpfzw5RrfoTOJC94aBmhOcgzuemtsuD+nSmM9mFJNDX5XuLRgp2?=
 =?us-ascii?Q?CXVgAxQgRx24Faodj2s+vdI25+tvKUbM98LECqF1fwAoHaTZ4/4Wv0Wj/8ao?=
 =?us-ascii?Q?xZz/kEO2dBv8Ea0XBJ5TbwEsS5nJg22lhorj1PhO5q4WlEa8KV/HQ8ec92kv?=
 =?us-ascii?Q?MC2WwtYyz7ZKDaOYIl4meovY1OXB0tFkHjtGkxwf1LkAD0mriGB7HfRQWjLf?=
 =?us-ascii?Q?IdfatbTKQ+FTfF3Zdc1xQjh+wQj74LYOfXFIESCTnGyG0mQ2/K/QSs9v0ZIc?=
 =?us-ascii?Q?oXCf++mCJabTuvTNxeyX7daEaGiPFL5wTUv559IxmzCu0Cesk+gIsLoWgRVd?=
 =?us-ascii?Q?gXj9CIyWcZbWjvCP16Z9WeXDA5VM4Oy3TcsFN3MaUl1vYnNYgbqSxiC6BMtM?=
 =?us-ascii?Q?gpjgToj9485ggl5mKoKVJfxD9RaRl6eZ5F7Oe55XXgjNQkCS2sTWcmszMZQ7?=
 =?us-ascii?Q?/pZxSqUeLT/TnhgBWu7mVYCjDenZfbdJ1SD/JVU/NA0lk4J7DMa03Q0mzs4T?=
 =?us-ascii?Q?2vxrWDUaLJ2ZJYG1FoJsTe6987hH3Pn1vpToupUub9agc7rIclHhS8ZRK/8b?=
 =?us-ascii?Q?PsHvbR2L/KL2X3NLzhqjaSXt5tMkVLKV5+G3CnRYiIyZ2HNmlrTSZ8D7IYaO?=
 =?us-ascii?Q?MHSsjMaVJlTo7mE1gCuQtLlL/kwuWG2Cd/G0O03uyTxnKIdSUOthTQzyboGr?=
 =?us-ascii?Q?kWklJNJwX36mOs3Mu8j8hJSE5NzyuUl1PMgHTVNq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db52e3d-782c-48ca-f31c-08dac7bf4075
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 10:42:26.2373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsMX+xY20dMr/pnnHBTSlhai1y6S7e9506b2pZ/3ufSJ/WgCF4JipCpPFp2rBNGLeLj7QJzSZz3lfPv94hESVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
X-Proofpoint-ORIG-GUID: zekTJteSn_a6Jrwoaf_3RqVUome7a3cZ
X-Proofpoint-GUID: zekTJteSn_a6Jrwoaf_3RqVUome7a3cZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-16_01,2022-11-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=838 lowpriorityscore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211160075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 10:42:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173382

The current resolvconf does not work. Make it work with the
following changes.
1. Install normalize-resolvconf, which is used by resolvconf.
2. Add dependencies sed, coreutils, util-linux-flock.
   util-linux-flock is needed by our busybox does not support '-w'
   by default. coreutils is needed by the busybox's readlink does
   not support '-m'. sed is needed because we want to avoid package
   QA issue complaining sed is needed by no one provides it.
3. Remove allarch inheritage. This is because the above RDEPENDS
   change does not allow this any more. test_sstate_allarch_samesigs
   would fail if we don't do this.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

remove from allarch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index 94fd2c1a70..c6f9cac862 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN} = "bash sed coreutils util-linux-flock"
 
 SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://99_resolvconf \
@@ -23,8 +23,6 @@ S = "${WORKDIR}/git"
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/"
 
-inherit allarch
-
 do_compile () {
 	:
 }
@@ -39,12 +37,14 @@ do_install () {
 	fi
 	install -d ${D}${base_libdir}/${BPN}
 	install -d ${D}${sysconfdir}/${BPN}
+	install -d ${D}${nonarch_base_libdir}/${BPN}
 	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
 	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/resolvconf ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
+	install -m 0755 bin/normalize-resolvconf ${D}${nonarch_base_libdir}/${BPN}
 	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
@@ -64,4 +64,4 @@ pkg_postinst:${PN} () {
 	fi
 }
 
-FILES:${PN} += "${base_libdir}/${BPN}"
+FILES:${PN} += "${base_libdir}/${BPN} ${nonarch_base_libdir}/${BPN}"
-- 
2.17.1


