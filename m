Return-Path: <bin.lan.cn@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E77FC25B7D
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 07:24:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10622.1716535448324137663
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 00:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5874dca73e=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O3C88j025258
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:24:07 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yaa9mgj5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:24:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUsflF6lDxtRasjPgSw1g22HQOxeJhaiCWQ92IZIjDkKqEf9Gf2MR7sUtFFrFrr5bUBXpPUjH/9vH1tevvtpe9e2S/RG9FMnHSpCgqTohUu3YTfConnqsner+RUfRkbjBI/CUfNdSdriwm+CjbcnoXokn8ICJmCSvyvhlkPeCkeIDAcxjv1F/UBplQZNtyumZUq3XiD6beNvMrfsyMbZRw8V2prxCsbc+lUBiLjA5s/k9fQk8hUWUdTsPr1nuRLULynXJADxK7SXTT0B4hcEYSANVTrxehIpEQffXnZLYkkQCjpCi/I3dhEaFsiYWi/Ke/OV9aID8PD+O+xYt9HVwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5Bc20QRFNOyiC20Tt2Bu5ZnFjRYkYNQ6EbqTF0SATw=;
 b=GbxMtcFvBfrLb8Uzws68IPOJ5UA2t7PNVF2AdRVCgJtWgzJEtslTfXIjGaO0wdsMukk8yh8BnRtM88Vi4aWPDS6NqarjfkIlgBo1/Q8jY7BEq1LVpXHhZaGjyRyD2D+0Frbbzp5ZAgShjdMgfA8PGFZNaiEPMPvMrpTNeTS8tRO8BZrh5ufVDEa2+4ch0Aq6lhcrqea39nl09aIiEoOeOKFN9mKH+TdIWc+QvNT1cT52GC6JsgoLaIcw4z3JHQVWCL1oMVBVKdljE+71K5AE/KmdhvF4nW1LMqsgvV/eLrkj+zpj0BSAHYqJg6jTCB2cVPTfadTzy2oSZ3yTxCNd9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from BN6PR11MB3940.namprd11.prod.outlook.com (2603:10b6:405:82::33)
 by PH8PR11MB8258.namprd11.prod.outlook.com (2603:10b6:510:1c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 07:24:04 +0000
Received: from BN6PR11MB3940.namprd11.prod.outlook.com
 ([fe80::a4ab:9a00:55e6:90e9]) by BN6PR11MB3940.namprd11.prod.outlook.com
 ([fe80::a4ab:9a00:55e6:90e9%4]) with mapi id 15.20.7611.016; Fri, 24 May 2024
 07:24:04 +0000
From: Bin Lan <bin.lan.cn@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: xiangyu.chen@windriver.com
Subject: [OE-core][scarthgap][PATCH 1/2] iputils: splitting the ping6 as a package
Date: Fri, 24 May 2024 15:23:44 +0800
Message-Id: <20240524072345.921885-1-bin.lan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0231.apcprd06.prod.outlook.com
 (2603:1096:4:ac::15) To BN6PR11MB3940.namprd11.prod.outlook.com
 (2603:10b6:405:82::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3940:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: dbd22410-3412-43eb-24cc-08dc7bc27d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|366007|52116005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5CEh0yAiYM7GQQ8/AoEIeekcpC2QehBFIbxMSTVC/zHzutbgMajiRJTBUcFp?=
 =?us-ascii?Q?+FHO1Q5gsMAfNy9360r3/7UK9SNUpdAcbdROC4EJrhepsiIezbH9mwx4/tH6?=
 =?us-ascii?Q?mWh4qIjb+8WZi78UjwpLlM00NsGgi00fKm4fPaFYPzOdi2UzOv9mdBrHZyoh?=
 =?us-ascii?Q?wJgqvtB3dMqxJU/i4SgIgtuusMmboBu8kDBVhACD8y13KZS380fHwK+uasWJ?=
 =?us-ascii?Q?3RT0LKDBsJW5zFh1GHtIt3q4NGdKIRxhw9vkNsMkLk5cdgvBcW8JQT6ErbEV?=
 =?us-ascii?Q?lmHdfsH4xLDbXnwDc2eLjbJ3elj/KE5HujXqAfdxnEPJyVZlULJ7SRbAQvar?=
 =?us-ascii?Q?O6Pu5XeSh9nBqaKEmB0s346aeqdwbKH63g/EzJZ5DjXMeVmpUo716V+7J8y+?=
 =?us-ascii?Q?id/Y7L+l3uCYChUTQuceaGFtXckVcC61IPMB7t7HOr/VHemJZA0vBmQUq0B1?=
 =?us-ascii?Q?rbHaB7yEAAE9vqfkKyUnQ+NXg0fQiDVactFF+rBRJ3H1yyAGaD2fPz+Z1hLO?=
 =?us-ascii?Q?JGkCMOJQ4CwuUdZcji9ebzRdEA2pmktdpzU8pOqvTVSs2cPUieXIze7Fm+FV?=
 =?us-ascii?Q?9dENfD53h9F2rnU8xWu2g7Hbzc5ai3Y2qOys0mL+JkO8a5v3gHitK8Zvic/n?=
 =?us-ascii?Q?o1s1TmXj0jMCOOSP3/iHVweywB3WjCKxbBcpDibVOZEJLUbBKvu+4mi5v7G9?=
 =?us-ascii?Q?fVVsrg3/UTUzLqG4G537Vb8xUsIJECHxDuTZaeenRRBayNQIAtDkIu8eP39x?=
 =?us-ascii?Q?lAcFG9p4jlBHpZpkV7bOnyy0/8BBv22f0wcUczggIYX7hJcfvGDF+AMJB+pB?=
 =?us-ascii?Q?rEbA/0SbsfqZBTiFRNJMxwiVdrOzE6towLT04brBkuCIQ09rWQtkDwoyAgVX?=
 =?us-ascii?Q?5dPKKlV3EIgrFR0mdP3EHT0AJG6GAAfYIPIQcKqW1i6Ukf9aev9ToIG1PTbn?=
 =?us-ascii?Q?Sn98JQOmj97JaJLByqN+PG8XB/xbrE1JUZiNIgCuLp2OFaC5x8L8jiDyarg1?=
 =?us-ascii?Q?StvlfEVP4JkGSeiikfGWl1xq9kjpSGtQNnnx3XP3Hl3kp7BRCGd0YGXmMReI?=
 =?us-ascii?Q?2+b+IY1q9nNs+UyPWBBc5DOygje2bnF1TUPs0BTVQU2nFxQF32G8CwwRHonj?=
 =?us-ascii?Q?VO1SRcxm/AEVuRhU8QOoANqhq/tFd+SgTy9Kcz9CUaqQckXNTUKQL2E7UbcS?=
 =?us-ascii?Q?ZWTCG7cni5rcvSJ1bIrPEb/K0XzuPJCjUu2rhvb6wSuuuo9Wt1lWdWYb6Kjy?=
 =?us-ascii?Q?HJo674RIv/500FWssavVUMABKEhg/WVbCQsV9vMoR7t6C8PReSSLEKyNDd4r?=
 =?us-ascii?Q?5Hk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB3940.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hQTyl4kKA4UwyRxn04RP0cOriP/lX+vjUawWjSZqno840eWzj1Gkm3/UShXg?=
 =?us-ascii?Q?pRcoAVuvJ6B6D2k/KtsTwZUmErpnA5jmJHq0Yk0a3Tbi1wmFmk3PmUhpS0+V?=
 =?us-ascii?Q?xnCIxApOMCQBeHMGliSXMB96kiMrqAcd+kKkEwrMd+yUN873MPvCtkuWce14?=
 =?us-ascii?Q?zTYf9Qlkr6cmhi8N/AaHdNcS8AEPCFEmxqVTr2FaOW2OKc5IXK6X4q/Lppoi?=
 =?us-ascii?Q?VYKGm7ObB/7La/2Ad55pEXYUwR1UDaVi+mxCz/CPK1wudeCF38qV02WVwo2K?=
 =?us-ascii?Q?yb9G9FMTRscgEo9jY6gkf43M6zIBVVQtDJ31JPyz8WvzlWwxVu5C7y3npGFS?=
 =?us-ascii?Q?EHC3V5SdVEm0I65ZUmKIp5KpyTvxaHwMXNU6ct1I0S7PSIMO1DwNxgFYOFMr?=
 =?us-ascii?Q?988KPlrXCWGe4KYSUtdLujMm5qn84cOFR0u30cqluVFqpqmnBR+NqrLTylvV?=
 =?us-ascii?Q?g2OBam/4u3p9GkUTqYNKZYq/4YzY8bkS/TQKyIdXghbkN53GFPkPTOWtPkd5?=
 =?us-ascii?Q?92m5IAp91oR397ykmLkV49qVt1/G9ZSSuNFDUb/6sgXCUhdjPNgBTLWuAiZK?=
 =?us-ascii?Q?eE68JYJZtJZlmBaTw5pgDA/o/+QRkA6kzIaJLZ4TdkCKu9dcWdQDMtbbpIs/?=
 =?us-ascii?Q?ReBrSAQ6uu93epzMqJ4dE81Nne5Db8o5VFXVBvgJMQsVRjkMbR/Wr/GW1wEz?=
 =?us-ascii?Q?OTslJkiux3BOvBtemU8BrpY75xFvz26pDmazqPccy8Jghf/6Qsn5FktqXjMK?=
 =?us-ascii?Q?5pEZr8dxmrKGRmC/EyghJRTCyUvKGDPiaLPyTwwEhtZMTp0TiNyG8pT4JnNW?=
 =?us-ascii?Q?Sb3UDU7WCmkD39SewnarWYACIn+bWB7GLABDvZr+y2OTEsqYdHg577NGDFPg?=
 =?us-ascii?Q?0D+fQ/nC4pEKLY+awwBj1PVlKfWUrGco/+ZcZbIp/R54hFw4hSuwdW+ehK1Q?=
 =?us-ascii?Q?HCeXETOpzEddUB0J/qbU2mKchIExQ3pZ4mo/y32MIfvoW+e3MDFdklE43rua?=
 =?us-ascii?Q?Wdutdz3j0csC23Og38vDkD8Fhid27Q1H7/75DFIIs8J6GivC1v7lyVSXfrpo?=
 =?us-ascii?Q?5uBlHoFWenrINVbJGOHZSy/c7NRe0hcmBMAdEp04TKso+BFnCK5OJnUG9sTZ?=
 =?us-ascii?Q?WZtZ/kgWyoay9dUFOV/jk02eCJCcTFd+bPQ+LewbWrsoQ1QCM0oV4xRRB8ef?=
 =?us-ascii?Q?tsZwx9KPnQ6pJCfWqkhZeSkXHC8AOwh/5PdoVX5SHKFat5wRwuTpxOEmOFH7?=
 =?us-ascii?Q?BpUvG/XT2nI3NympoSvO+JZ+Y7nSgrmfGQXe/Dik+iE2DO7ti5OCW6vH79/+?=
 =?us-ascii?Q?MsdHz/ONlEcacvG6I76Vg4bTOpTtmwKJhtqCemYEQiVVXKEzOyuVb4ApaIwS?=
 =?us-ascii?Q?LWgiN1zLAinsUTFUWPbYrzdCuHavg0wzJDN5Gk1bPcLlNoMvhhNDz61gnUdf?=
 =?us-ascii?Q?9v6wScZ2sCuady0UWL8n3r2QN5pMVv5kzdFDhSyYKj1F+xX+5T2F+NcjOzAJ?=
 =?us-ascii?Q?VDgdKkM7/NodjwjnwDR6kfnOzA4K4LUC+QB8I6zwUNcdeS1+JCOl6IFWlrLY?=
 =?us-ascii?Q?Mv0fAvbilglIVD/EguEFajp0wBhemoV/0hxr5cqnbQCXJN0OjsJ0ZzvPthee?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbd22410-3412-43eb-24cc-08dc7bc27d92
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 07:24:04.1815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zg+DBI6RBYqUmAeDFH28cbUWps/d++0k5k3C7P+R7m0Vb6UH+9cR1yb5nkDd9RXJ4RhBhqXehQ+BTgFe1Iy/i03oSNsM+gcp0nVICtamHm4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
X-Proofpoint-GUID: mc5R5ecSXsgsUPjQFK2eKk_y5ouu2Gd8
X-Proofpoint-ORIG-GUID: mc5R5ecSXsgsUPjQFK2eKk_y5ouu2Gd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_02,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=953 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 07:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199827

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The iputils merged the ping4 and ping6 command into the ping since the
commit ebad35fe[1], currently, iputils ping support being called using
"ping -6" or "ping6" symlinks.

In oe-core, there are two packages provide ipv6 ping, inetutils and iputils,
the inetutils-ping6 doesn't support "-I" option to bind the interface, that
cause some of scripts(e.g. LTP test[2]) which was based on iputils-ping6 fails.

If someone or a package needs iputils-ping6, they can enable it in local.conf
or add it into rdepends directly.

Ref:
[1] https://github.com/iputils/iputils/commit/e3de851b809c7b72ccc654a72b6af61d
[2] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/ \
    containers/netns/netns_comm.sh#L25

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 0b89bc2041f670af625829d061ce79e0840ac116)
Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 meta/recipes-extended/iputils/iputils_20240117.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_20240117.bb b/meta/recipes-extended/iputils/iputils_20240117.bb
index 5a5e15528e..3880689742 100644
--- a/meta/recipes-extended/iputils/iputils_20240117.bb
+++ b/meta/recipes-extended/iputils/iputils_20240117.bb
@@ -35,7 +35,11 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN}-ping = "ping"
 ALTERNATIVE_LINK_NAME[ping] = "${base_bindir}/ping"
 
-SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff"
+ALTERNATIVE:${PN}-ping6 = "ping6"
+ALTERNATIVE_LINK_NAME[ping6] = "${base_bindir}/ping6"
+
+SPLITPKGS = "${PN}-ping ${PN}-arping ${PN}-tracepath ${PN}-clockdiff \
+             ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '${PN}-ping6', '', d)}"
 PACKAGES += "${SPLITPKGS}"
 
 ALLOW_EMPTY:${PN} = "1"
@@ -43,6 +47,13 @@ RDEPENDS:${PN} += "${SPLITPKGS}"
 
 FILES:${PN} = ""
 FILES:${PN}-ping = "${base_bindir}/ping.${BPN}"
+FILES:${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
 FILES:${PN}-arping = "${base_bindir}/arping"
 FILES:${PN}-tracepath = "${base_bindir}/tracepath"
 FILES:${PN}-clockdiff = "${base_bindir}/clockdiff"
+
+do_install:append() {
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)}; then
+		ln -sf ping ${D}/${base_bindir}/ping6
+	fi
+}
-- 
2.34.1


