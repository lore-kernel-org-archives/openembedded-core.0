Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7378BC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 02:42:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1708.1655174565150836430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Dayj412V;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=3164603221=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25E2e6Yi017820
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:42:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=GssqXEj0ISQN+z4a+6AxUiVZANRLVXasQTWn3oZ01d4=;
 b=Dayj412VMex9I2SgH1PWxy4roOjXo5lb0dJR04l6j/QgELL6aKu/ZON7msykZhtcYeQQ
 kJaRudlNH1MMC+EWzhDXFgATyry1ymF4KWw7iZquOhgTXP+QGlFEm/rI48r8g7WOl520
 EgQJYSJ7/t8fJRHkGiVFJbG6RpJ4hGhYEDiKqgM4HNqfICQRCdpinxKkNYW8Mg8lg058
 XNGPgUE+rx0XApWWM2OZSxuKNmNAv1vhCnMlh2eV27fBlrpSKETdnj+rT77f4WN7MR5T
 YGdcikHfI+EkepRfOnDStpE1I/LKZWuo/s/jfTsTdeBdYoPq2YvX1SGR7tjmJyXsvs7j 5Q==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmtjkht7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 19:42:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXbXdl6huRbdiQ5iUktstWcXIpKxx8CR7Yz8sHwYAck4s38cez8xU+ufz3afIjca2vfJ5BIohMWG6nsAX6OIdd5pCIkaZsxblDGP9GbQkJnbdERllOI0SVqHN2RoyIdb7rzhGj6pzjKQYVQORjPv7HlCamJGg7WBq7cflQHU/7yGx4HDIEYSAVLDIuMGjmd1K+2uGmjA6+ZETZOnN6eG0KnmFuLD1B62PLA0RN4D9Ip7RUa6rVfZZZRY4zUAWReI0jFv9hyJ6au+OryC7ug7ur9lHhtNv/doVjEvhjxtsqOVOqrd2XdMGmaTa2tqn2QUMFEb6E0RWLJQSUxYiACXvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GssqXEj0ISQN+z4a+6AxUiVZANRLVXasQTWn3oZ01d4=;
 b=nDHqrRApYwz82YnSg/H7ixU5+LKe8DskHhxT/04e+F9asy1z+ZvQcVLLh4N5DBzOmSKF2y0Mx6t0FwivhQ9F+4f38y0f93TThXTTpa1NrpHiHyjz7Z8J1W344DY+7fCAjwtMUcu5kA2Wd+gQ8xMOUUhQniZf+Z2MwlYiB8mXEfDv4x91qv0X5S9fyLWC0DEDUDf3WGdq8SbrJ6bSCG2TuRrEeYRRhDtZ0nOSz8FEPrhkz1JyFImCYlmAEYwTmVSvkuI7YbU/svzz1VtR5H13trSsC7bdXhf1l4f7rRe5w/JY0eItDZTvxALm6viXFbXdXfmadacnsLklffoxFlQnWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
 by DS7PR11MB6102.namprd11.prod.outlook.com (2603:10b6:8:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Tue, 14 Jun
 2022 02:42:42 +0000
Received: from SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17]) by SA2PR11MB4875.namprd11.prod.outlook.com
 ([fe80::a8e3:9407:2650:5a17%5]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 02:42:42 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] popt: fix override syntax in RDEPENDS
Date: Tue, 14 Jun 2022 10:42:28 +0800
Message-Id: <20220614024229.806185-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8740b12e-de6a-4e19-f9bd-08da4daf8dbc
X-MS-TrafficTypeDiagnostic: DS7PR11MB6102:EE_
X-Microsoft-Antispam-PRVS: 
	<DS7PR11MB61023EC22A5B53AFE2594A64F9AA9@DS7PR11MB6102.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6vrCUNXnOGrqeyr6dtWbvHgJ3wOz1UKO5L6u7EHqVwGL8ymvUXFrgNVkaFZ0skAZd5kQu8wjaNTc929mpumfOoPTdxBLnSHT9V4vFOZZp5Sh8AkjMAdiEwPXIy/RHGvJpR0pFmPhkTxS2QoZlD6jOn/bYKOrbs+DnYT/aRiqDVWkt109p9X8LPc6DigeQ7Vfs8jCZI2yb2dG4G1BGTahtHqdLAkArtz8dLknGXUKZJF/ELrWv0gl7OC2H33oKu5yiwKeavRT4xPt8VW2D70fwSxgdtM2rkFbXZgcdatdMyDPCey3f+sA8DABzmFAFMMFRNx2rJQ4x2OD0F96UTfj8aLzdFFiwgoZzMFFB3cWwM/fWlyHveFBH7XuUIU+36oTbv7T/BasORRkvobDvNZCAgic4KMoc5r5bLAAcZI98bB8HhbTNShsA+2e+Ddx8ICCFMiauAP6joOBq0gloF76bd3pWcgDuUX1a+yzVy7ucMPADywkb4t9CkxGYf00O4z4rdZCf34RgDiEm/DQYa8i8t1KRYgYlhloOG+IAOl90E9CnPcZ4ede2+DHpCN9Vm0epZ4ZIWM1bvN7yywegzXGe07dTZvm4R86cIkRHy+pgKak7GoEbgO5EnaRn/cqGmd6yiIlkqEda04EQE3dCGiW8rlr644eyqU9BVtQR8zPaLICUkiLLmwyoA8cXnrs1FJfdfjhJDqmb/gFPRSKvh2D6Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4875.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(2906002)(26005)(83380400001)(66476007)(6666004)(6512007)(38350700002)(6916009)(2616005)(86362001)(8936002)(44832011)(186003)(66946007)(316002)(52116002)(36756003)(508600001)(38100700002)(66556008)(5660300002)(4744005)(1076003)(6486002)(8676002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ram5rQBhbW66JrSp19IM/F2DglLP5UfmecDT4oarWB32B8PgNBaboZpFTQQp?=
 =?us-ascii?Q?avG3UCC56+73ZOoG5Te6Hpope+w99JGgpg56EfAVxSio3jzBwjjNidyyymMW?=
 =?us-ascii?Q?cEaoh9Gswe/AyrKX3hXPDnyq2h1xro2LPUZgUV2nIPurhyEdHaLk5tNAuBBS?=
 =?us-ascii?Q?OWRo+0YOtDNYnKQkiW2096J2Ia3XLLkSdlyZmu4bkmoZtYdZynFdZnBVz22q?=
 =?us-ascii?Q?tkQjV3XY+L07WAVsB3PK8RUqFqTagcwgAbcY69btDulYWuo3U0iAXmiE05EG?=
 =?us-ascii?Q?RY73YgdOweMGGTTVqjfu1fXVcfk19xYR5FJXmax9soLwKWo43S2htawnJtwv?=
 =?us-ascii?Q?9TLRQx1+et5Lllm06NGNuYMAZPmLTAdeajOu600hO413+AOpknfBpacKfL4k?=
 =?us-ascii?Q?MhhBU1QsrI/mzloKybcx7Dv7EVVYChpI8Vy3xr2JkXN6lSJ3ZKJ9G96eqHUA?=
 =?us-ascii?Q?GBse0Qeo/iE9rz7nAVi8XZGcevYoSCS7xUoPDaI9nYQ6LB38FoyFTxmJmKRz?=
 =?us-ascii?Q?ZkGPlV4X7rbPCrvgBlyvgqOP7Kr1ktqAT5GfvHZGCKRBpWJmW3AcUL9PBDhY?=
 =?us-ascii?Q?jwL7U7JLedZey8y3TK0+UZgE0wd1+69ufQL1Dm0Ua26LAKB+EvViB4cyBqO8?=
 =?us-ascii?Q?Zh0OTGdyunWOb+o1IeGY1BzbdZi6U+zz1kXgg+1wdCqEOAfT40tUGuCH0Uxo?=
 =?us-ascii?Q?cvigOBl9xA50rb9+JHnnVET5GkhrPka/rZn9M4eM5MZZ6PZ7rvInqnl9bw/u?=
 =?us-ascii?Q?MtZi/C3K1tWPDMmk4/eTijHiFza7ppPvj4VNpPWnFTehrOmWvutO1iFyjTUU?=
 =?us-ascii?Q?tJ9YPyttw756T4fo+ETqj/GjoXSCeTw/APWd8fwdDyn4tqDjDmeDIyHfECtb?=
 =?us-ascii?Q?zQlSokYsG9YPlIPc7+y6aFwzVCKcVs96ZakCQn6wh+Vaf0P4T4nk//EtOkrf?=
 =?us-ascii?Q?obvKRwwvO/NhtGJnlu+7jgFISHPAbl4NwI/Zcc+JBqPyNqUhZYoGskYH2Vg2?=
 =?us-ascii?Q?FbV4v+XuuyaUwnOKI8G00Akqg0bcaDL1175uYn9gUs4CyIxQCDcJMl0az7at?=
 =?us-ascii?Q?YUnvvTeR/wlI4pbYqZozy2U5oxzgqgtFnaHuIx+VFvjRuLjElVhc6XQ9BM71?=
 =?us-ascii?Q?M+kfW8ID3C+NNnd/PiS84MTnlnCTPAldhyxTmbnYQKGh4XGEPL/OxhjfR5dv?=
 =?us-ascii?Q?GHSJi9wQ2FUQ9E3cYy060dnWelZZXuMXHBuWMip/9MoaYqfWGiwEivoAKcMr?=
 =?us-ascii?Q?Ee2nox9a7F2RNc6UXOgKxjWaQ6GtNGGeeUQcYzGiGXwRRR9+PI5ZnaZsGCyd?=
 =?us-ascii?Q?TGPgVUKB1Z/5A5ky54v8lNnVBqGCiglXhnHiA6QGfkAb9806//tqc3UBZAay?=
 =?us-ascii?Q?wl7WziVjphcUN+cLjS+ohizPLTTW2ihHUAnoPUZrdAEY84o4N9TBPdtPCHZA?=
 =?us-ascii?Q?eLgggRp0lNg/jnDS/v0xzuURpRaYDUK82Qdbuxn0fKWwsJ9R1/86NP2qM+6G?=
 =?us-ascii?Q?XtGT42Nskk1x7J49ThBbL2dZAsYa2jh3mFcmpjLtjsF4ETkEh+Y/00j/sG3b?=
 =?us-ascii?Q?g4wtRBpj1vJ0zmi6qw1YxF1qlR5qwcEIJ6Z1Cd8n8fvclxyFxWihuJ5giB5c?=
 =?us-ascii?Q?+i1/0ubsGHn1xSCjKaZoblMBDcFWfX2lpnHdj7H7vkhK63nneHhK8FeJvae/?=
 =?us-ascii?Q?Qu/naTAxqBvvRr83osxGQnqY1pfSpnmOD72uskHNVDz9IZMPUVnlNCEx0k+1?=
 =?us-ascii?Q?ex6fnfkJJWK1/hPs2JiT2ku/Zb24/Xk=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8740b12e-de6a-4e19-f9bd-08da4daf8dbc
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4875.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 02:42:42.2058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FO3qBHE10nvEouvKxGK1VpN2jgDEy95CWLYG+H5yEwcU/8tgucZut3go9TBjIvej/S6zL9Y1NOkdaeACd7A9eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6102
X-Proofpoint-GUID: LZSuA_IQvYHtGByrwa89rJu7oc_r9H1u
X-Proofpoint-ORIG-GUID: LZSuA_IQvYHtGByrwa89rJu7oc_r9H1u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_01,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 mlxlogscore=514 spamscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 adultscore=0 mlxscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206140009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jun 2022 02:42:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166873

RDEPENDS_${PN}-ptest -> RDEPENDS:${PN}-ptest

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/popt/popt_1.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.18.bb b/meta/recipes-support/popt/popt_1.18.bb
index af8add4ad6..b465f8817d 100644
--- a/meta/recipes-support/popt/popt_1.18.bb
+++ b/meta/recipes-support/popt/popt_1.18.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "5159bc03a20b28ce363aa96765f37df99ea4d8850b1ece17d1e6ad5c24
 
 inherit autotools gettext ptest
 
-RDEPENDS_${PN}-ptest += "bash"
+RDEPENDS:${PN}-ptest += "bash"
 
 do_compile_ptest() {
     sed 's#lt-test1#test1#g' ${S}/tests/testit.sh > ${B}/tests/testit.sh
-- 
2.25.1


