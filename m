Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66924CD68FD
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 08:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.85829.1696925127435055357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 01:05:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=R9iL5tN3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86479ee0b4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39A5S3RM025844
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 08:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=50mU9kZ9skcn7410Iq
	gtthJC/3mw5ZSuLRct0CWlVHg=; b=R9iL5tN3w0cHk4kIp9pGTatrF7SbYTeKy3
	MIRROKyfYBKe2xWekG4DLysDLZ0+Cs5oIABn7q4kKW2EQbwnoLewd6aQVFnSD0jO
	4JOspH4TK0SyLEbS8oB/Es2nS1ij+JbZL14Wimtk4EwjOfGPOYZaHwsRHm+BbMbj
	CzG0jyrRVUrFTt4kvru7senaC4jjQ/PTzrS8XWhA52D3IB+7IF+RAqvG38ew0DNU
	bGmTuMLpCMWiyFyPLif8Us+UQD467iDc0OMkx1Zs9BJCLTMTStH888PrPSg000Db
	l+p+snmObblfne7T8w9vDWg8cJv0vciNgm9nLBFlEzY3Rq6kIRZA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tjxa6ag7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 08:05:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WaFGPl+Gug/fnSjXX1geUTKsS1aicBjgl0t62XNYgNBBz/T7OYQnjv2mnLO1km1NqjssfhGGxDYFUBP/eu2FDHTN6A/0iOmJ456xAaKmSaeBWEgyyI46zIAgb7mpzXClkoQ+D9rTPTglJ8DelUeq9HGp/SNONHtPIp5YaEgXiidJgSJqUrjyKK26MoTEWO5s++FTPdYfrqMT4fTBeO0RWQkHNnN0mgEYvKuw1kv+MuMGynX7LYwQThtR1DoSLD7GOKng8cSt3kQ9VphxX5AGF1bZYb2RSlsMVrdg00I88AkkXGYTSBlhZOqbXweaMHAzVNZMA2GnDTYr8Oep41yREw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50mU9kZ9skcn7410IqgtthJC/3mw5ZSuLRct0CWlVHg=;
 b=Y1e0VyYlY0d08byS4ZIBtGUj+1vSIq2GiHkv6l/4sxzOuirBdNwO6REhQ+GkdOS7K6Af4mZLU0bXijcPcaTL4OG9qHVrfErCgPKhRLZBiUC+BVOCJYTdEfS+PN53JUh6EfHpTz2d6AKGHk2x0aaU/PhEYnNCOYpxFiL2xtVpXrwdPx51+rW4KDMxtNI8sMuiDNdo3yPfH8+wAoIYLkqnx58NYqB9Tpd1qaNYguygIpHtXGMxdGl9jPdOkF3oZPBh/iKsA7xY5uxTLN+QvZ4Q3GkHpRpC2hlHL1G9d6Ni12EpVD+fbctRgRCme/YPKcr90Vi4IiCyUEsmklT711oUAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MN2PR11MB4727.namprd11.prod.outlook.com (2603:10b6:208:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 08:05:24 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::96db:9814:2d71:a957%6]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 08:05:24 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][PATCH] openssl: Upgrade 3.1.2 -> 3.1.3
Date: Tue, 10 Oct 2023 16:05:13 +0800
Message-Id: <20231010080513.336253-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:404:f6::22) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|MN2PR11MB4727:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e9effa-f497-4f03-4f27-08dbc967a834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rpyan+yxUzzt692VIyJ5Z5IIm+9cOMYLyIujO0QMmjOev2HvfYwewD8OFOwDIkCYLl7s6lELeI1jUM1aGEsLj8OI5LCpZbzSQfYzxoFhiPn7H0dyLwCsZHKE2PEKEOnul6noSWwwWcfBydnuH5UZuf0tqvG1TW/lVKnaEZ+sWePbWuHvufwbjv84utaK5PQIZ1bpdRLODIMk6qIxuiQvdXnClxVyJd26Bz5Bw4hv7TiXriyMap89iWPEBGMYvv7z1Nu7uYxI28LPUVnc62R8Y0fLyZqchwRSnsBPI7WBoPy0FtgKMhCyBO4EHE/POzmtIxHDAOwGEcMdG7Eo9ySpP9vokiyy5dCI+g3njIwWx3ysC2Muk8S1eg0lPoXBz56zete82nQ++8qmX1dRkL2rHXLILHoq/dA8pMLhGq3FCL4A8FlNpLAyQ0P0yv0XERuyVEmIqJxOfumSl3i7tTStVXLEg5yDe7oeVzSGtaz/QZyoiUnOSPTxg1vbzi0+KLLCw0Ho6Pt7QvusF7KDg5GvtRyGczAevVxFWgiG9pQzL0OZiKtITiu1H3B3UihJMtzIe5DgBGVWyDsz9Vo6oDULR4kH8aoyHpK2i6QTvJlzPgw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39850400004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(5660300002)(41300700001)(8676002)(8936002)(44832011)(86362001)(2906002)(83380400001)(478600001)(36756003)(2616005)(1076003)(26005)(6666004)(52116002)(6506007)(6512007)(66556008)(66946007)(66476007)(38100700002)(6916009)(38350700002)(316002)(966005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o5QtINWUABqvotDKzE1XMzlsGYT9COQqIbUnYESujcKK1Zpg3Fe6ydHd98cI?=
 =?us-ascii?Q?x/6Shq04+Ebk6Jo39k44YJt1cqwwTskA2tRE0DsPDrsS7OrJiafMU9HVWvX2?=
 =?us-ascii?Q?0ufbmUGvTYda5+oaBoZLbtNuLu06hub8XQJI187zEXTljMMFmob60i0HAlhX?=
 =?us-ascii?Q?LZE9rUTJblFDj206rCRZqaaVqiUoMFLcZBhwaLcztxSn28/iUww6s4XwqnA/?=
 =?us-ascii?Q?LPWTgCkNmE3XpZaHwnghr8B2nrmm2RZgMZOVduMGmclWTq8dixNAsdthwJuy?=
 =?us-ascii?Q?UyQ54n8tB8Es4FJNB9rfAJ5Y4c2PwrzFdD27PahBgH9kRmzO6BJenkMG0Q7k?=
 =?us-ascii?Q?C3Ayw/Lppjad6L5qtBdxwsdodmplUlQ8JV4WNE298o6fRKT++vrNpI0oR8JO?=
 =?us-ascii?Q?rJGxAKsODlEOONVNfVbIHK2q7ORjeJSPQZjchK0GZuUUlXC59Z0Ti5srrOXs?=
 =?us-ascii?Q?Tc11mq0ltkWCBUptaxosOvlmJmYSl8OkY4pp6lJOVIrpinHWpBm3B0rjO01O?=
 =?us-ascii?Q?fbpTA7V2C5rnOgOEUJP7nhhMxotc0jJyDaTKDUfJpcUaQO2Y/EWNVNwqBnUC?=
 =?us-ascii?Q?n7mMwZLaVwNEmUPm0fxPLV3NJu0RuLSHpGwRdzMOdog4SyJK59SpQqadsl+k?=
 =?us-ascii?Q?+VsojII3/mqPAR1iYem6+tb0ePv3VOFM8X5md4RF0RZXGivMtLXSpKbF5jbx?=
 =?us-ascii?Q?xQ3QAa7AlsQEpscIrRsMkb3i2hrkJJx+mPgDjjqL2fNWtyEw/ky5s4FjCOuU?=
 =?us-ascii?Q?ErnvDNkBH5RoN63i4xZ/FQ/At1lefTTlqR2hnt/NoMgqSinQi8JxEZJQJ3nb?=
 =?us-ascii?Q?6ddOyg0U0Stdu0vdj57bbiRPQnVjrvqdPxVyjdgDeRVf/mtw5mLz+TVUvumI?=
 =?us-ascii?Q?5bCzztUxS2UdVfjMR5KTrH4XjH/+ANIbPjiDhiGJigaA9iWSOKKduyUQP2pT?=
 =?us-ascii?Q?8eA/IN0GlvdLspT3Exbut0UvoOcDjnf21DipA9vXaCaTNj69bbbpdRVFvmSc?=
 =?us-ascii?Q?feaCF+xqF2JlB97BS3tFLgtH0PGF5UyyCzz5jceAJTTCWb9aoQExspsX/tgG?=
 =?us-ascii?Q?Iq2o91qd69x1y9rM1nu9e/6AfZJx1VkTgkyqmEvf31nXSGcnt4QrZkW5e3Vj?=
 =?us-ascii?Q?vaSxis91kW1n6TXagRT+MyOQTAAWkIMYoNVWtht7FhwIGE2YSgQHoQ/SRRRG?=
 =?us-ascii?Q?XsGn4ERMeQ3DtPYvjYG9aUtbSgj+RCwA/vwvicKt/ggGZ0fLh1OdPX+RAol5?=
 =?us-ascii?Q?BKToAeGIMLHLo7EeoLlPVk8bpK5VEcjWd0eKxK5BSheHdtBE2LjRB+4Ps/SH?=
 =?us-ascii?Q?aG+FkNhkfbSr/LPkus6Hl+BN+guAn7QHnuhYvbKm/Vs60enrkuP7sdCvET8+?=
 =?us-ascii?Q?O3lyQwxML1mT/bSWCXzBa7XuANfF1kpaeu59iv/q+IIGzdlcuEpZDGN7T8ex?=
 =?us-ascii?Q?FM6obU2EagBRRLOPYsWMtbKKiYW2UNAAnLMweZTvTtRP7C4bSOmEMc3rEK3P?=
 =?us-ascii?Q?o2s5pfF29Gh2cd2OZxHtWDDL0bLBBmsxNwB8/k/ZcNZ77OxNduW5v//954+B?=
 =?us-ascii?Q?a5nGJ/uUm8DUBlm2bNbpX0m4FcKl4KVJk3dRkG7I?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e9effa-f497-4f03-4f27-08dbc967a834
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 08:05:24.5608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRFuuLmlPHolSXnInM+qeLrnibA9FATteRY58d8EGnv1vrawpn6b6fzuDLyQwAC4chX9FmVBaXkqtBFLbLIZsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4727
X-Proofpoint-GUID: QrgF-iaityvzVizZMSjnmIAyrdEcl8lC
X-Proofpoint-ORIG-GUID: QrgF-iaityvzVizZMSjnmIAyrdEcl8lC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_04,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 mlxlogscore=946 malwarescore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310100059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 08:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188871

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.1/NEWS.md#major-changes-between-openssl-312-and-openssl-313-19-sep-2023
Major changes between OpenSSL 3.1.2 and OpenSSL 3.1.3 [19 Sep 2023]
* Fix POLY1305 MAC implementation corrupting XMM registers on Windows (CVE-2023-4807)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../openssl/{openssl_3.1.2.bb => openssl_3.1.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.2.bb => openssl_3.1.3.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.2.bb b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.2.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.3.bb
index d55695dba4..e41bb78812 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.3.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539"
+SRC_URI[sha256sum] = "f0316a2ebd89e7f2352976445458689f80302093788c466692fb2a188b2eacf6"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


