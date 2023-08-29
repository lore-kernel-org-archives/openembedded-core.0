Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64EFC6FA8F
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 11:06:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14757.1693307210563178776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Aug 2023 04:06:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gI+QgT9t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7605aaace3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37TB0uS6019005
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 04:06:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=lQrDk/av4j6w4z+oWq
	Ielvs/r53pJUoxb0DppMqqvd0=; b=gI+QgT9tRGiPgqdLT3zOC0Ep4Q1o4lLNpl
	Y+noQtkUWw+ySJQdgxL5aQqDUj0ZA0C9g7RKRflx5x00yUUh339Qlj8b3SPpTkxa
	jUTW/qHEb7ADTqkTF79Ywl5qe4+zxjXHXkup7WeseLCPJxsK3CtIvrf1IMugs2nu
	dpukGEdcPzsIVgxqwunaM9e+P3RCzdTUNKdnB56bUkBg+fspiNYMTT6VTo9YsbX9
	Q+3bLkEoSR3i+ft8Qo3lJJ8mKi2lHcq0k2Xa8sMK7UneEkBllHB20cAhi0lTfJo6
	aGbi3HJ23klIjtv0S1Rgx8nfd5Tyb+2jNOn2QSAtuifWIDCRm5iQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqcp1adu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 04:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck7y5XfoYdjIlidB9+N9jJuBFtbSNKWNGF8rDwofjzP03o/lXpF4l7XDMbDE8keXMkJ7vXxJuO3mMpfdI8ALar+1DmWgpMpbEyFgUOop8CPjmh1PfuwVfKj0qO/dIwFt2UVUwQ9cEYfhLArA82uEcVZXv3dwRrQEPh3Rmev0hpNSRgw0s83gsWa6wWoP+6ApB/4DV5SHGEYW9xYVo055t7QhC/DMkhMv7WVKIhOghAzvpAOyu+8XuZC78CA+N/3LUlcja3fwA7P9WKFjAyPg7wy5nVQvM6p+tdpkoj5sigmvZcmIEV+QHFKB/9VRJmzQH7+bwZ3y54YAJ5hXjaQHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQrDk/av4j6w4z+oWqIelvs/r53pJUoxb0DppMqqvd0=;
 b=TmP5hZitOjW+Jgflk3cCOa2SPGFtt9VgwJgEzW0wS468PyUrCYUN0bZjZ1RzW42uR7LTih7lbWu7lYp7WVm4rvaXjn5cFoj+2cOZ8t+/IN/xMOh1SnKcyfywlr+ya/gT3a8A9PNKTtczxacBbY7SBMGBEU0u6ESYNIUb3xdwJIPpulgWuSoQRKZZwqHQvCz0WhoBi1MNuR7xKcJAawvnDMCqnG9kUSTE3UtgUd11JnA9/DmipcQA4Y4Cxry2VmHaVdygNfMyQuF6BMMcWgvr9ObQNC0sWC7EiLqmKxVpYzO5YFnfV8GKJ4f5gJIjrt+WOKQmSG52CGpSv36GfQIkFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB8522.namprd11.prod.outlook.com (2603:10b6:806:3b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Tue, 29 Aug
 2023 11:06:46 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 11:06:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] dhcpcd: upgrade 10.0.1 -> 10.0.2
Date: Tue, 29 Aug 2023 19:06:34 +0800
Message-Id: <20230829110635.1705607-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:404:42::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 22bb43df-ce49-471d-30ca-08dba88008f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zswpkZjpEiwW9OhBTfF8HogbSVRh4qaIqFGHfKFotJmZYlhKZrheoqZfcRa7dhALvNXT3X0HZWZdaJ3mSCjwmv2k74KNeCwSZnCy2IdJec8oszV7mq6sWeCM0hIeD4Z3UhNSZ02M6q1L/RQs4Eoz3prte+Vwl8N6r6u+yZoCEuv5dblda9BDXApgEQOUbt1+nFVAXChsnVsSCS4XCtkG3FbkEzP16iIcI1B8plrneZj1aKkcut34hAqpD5DDa1k6+JX6nh6P4KaqpVudwdw5tcAgKc3GR36bkGSppQgqOG3GV+KMWaXa2wLs14LlZL3y/keLmHpeWlLQhkPc1PiOuzbV8boRBDTBaVfEnWx1AFYThvxYjcdYbRvl0T/cinY4ZigVhNTaRgBbe0ewVkOPHaLweHVBkL0JKTthHT0x8xJPSKr8d9cKUNk/tH3zDIVJSZT4PVM8iFkzvz/syIB2up2yr/u9GQFellPps2kf0o5sQ07cyABKRycDHh1aeUdPNUZv5rdBXa1ZeAy5pJ8N5C+yDFgij4FiIP302aCT9+qZggodIi0KO6Ee6UzdZkBFG7EfLQf8IFLRCRGBPs2UkXDtsfMj5c31Ynx3fBD6iXQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39850400004)(346002)(366004)(136003)(396003)(451199024)(186009)(1800799009)(66946007)(1076003)(316002)(66556008)(6916009)(66476007)(5660300002)(41300700001)(38100700002)(44832011)(966005)(38350700002)(8936002)(8676002)(26005)(2906002)(2616005)(83380400001)(6486002)(86362001)(478600001)(6512007)(52116002)(6506007)(36756003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iTNyykUI/1nnlXuxCgh1cCEnAYIO/ef96cRdgQn2ZfpGxxKWC52SOoeNxOe1?=
 =?us-ascii?Q?BHiwtXtlRxwGeS0LvNSrbdj9FDkHb/LeooA5IHUghhlpffJ4nTSkjcd2Q9L7?=
 =?us-ascii?Q?Qcq9SqM1PSIQU2Iiu+IAifzNxwtqjcCMig3Ora75snS6rre897OBlWoGsF35?=
 =?us-ascii?Q?HIqD/jHm/slJsllbbXuFysrzfUm5ZwuUBW1yFI6nncHB80G4Y9vkvQJbLJRM?=
 =?us-ascii?Q?qKoD602blaN6R2qsSmDJjihtLOdee6fVaDSkMu1gPCSaMUf1xzZTb3vvFsQ/?=
 =?us-ascii?Q?XZ4ff904Rdhabnf299tbX5LUSaOHA5Xc2mXBJvB4FYgK+ygA0n9lSD6Q7PHM?=
 =?us-ascii?Q?oAbB2W1rfaGWCQ2klzN5QocNVtQPcTOq2qSmvI7lHUiQDc2BWsBUwwWjUA6+?=
 =?us-ascii?Q?Phpqbum06vzX/WzhKrRkg/jwViRKRpbyjJEhMe9CaCGsb7ENsHrpHBhiwr5y?=
 =?us-ascii?Q?Fp7/Ms+yHV4G2Lhqi2pR3E90Xs1uXI5Db7b5tPmcTGFJdJtBr0mV6n8JPr6m?=
 =?us-ascii?Q?DPFDjmAcYFfXtY+E9cfVRE8ND79364gsmnHNr2IyPt2o5rAanAqAcHCRVu7U?=
 =?us-ascii?Q?ohthVxtaric2bN5zfY+OzH99djEdkltl0FIjPLRZggRVo5ENyR2rgP7cjgG7?=
 =?us-ascii?Q?YJYdFh9dCbHQdq+70/BaZOgr0dsXH3egy1gG/ANG8OWl/WjWjds0qTVOnWjy?=
 =?us-ascii?Q?QjSiUORDCEjO6XfJx8HQYuB8U9vuvNlA4Gu8RuQLVDugvuXEiKxhr7WmhB/N?=
 =?us-ascii?Q?hYUOgjcARvcisQdhr6euLjOggPowTruGX6VFp3NpCul6HYWFpli9bMlmauoz?=
 =?us-ascii?Q?ZbBSgZndQxZJSre5WkFaAACI9AdxR7muWToS62b4sJA3zOyV5w0Zc7H+vDNw?=
 =?us-ascii?Q?usSjZPTIfnJZ7LpNwLXWT2jHPEfMNmbTO7rOwdNH3pmIrOFv4ubMKgoDjrxf?=
 =?us-ascii?Q?DOll2FRSHb26+vppJ/jqNZROSfJIrgvJ1LCLAsLIOI/9i0S0m0up6nj/WS0J?=
 =?us-ascii?Q?Eevq8Ui8Zv0cH3B4ALUOkzo15Bm9Zj/VvDquQhpTltXvx9Gl0nVmYGC/nN3V?=
 =?us-ascii?Q?J+wQL1y9E4hXZoAvrRtYgySTAm0yi5yJF0a/1r6OeWGJnw/yFdMU/UGzAnqd?=
 =?us-ascii?Q?qwL88PPa4JeL2+FDW3vbGak7UyXXvRzvFJu05VoRJ3wnfT2E7KLhifOR0DC5?=
 =?us-ascii?Q?tFQjDpGNZ5WNqopMtvhJDL8KafDgXvUX85uqQj8nv3pmyjcoqVyCXQ0mKkJ8?=
 =?us-ascii?Q?o0MjwntqcolR8HuTtOq0/tsszZYRDUbX25Uf24e3RuEz3Tj4OtlE2T0PTwEr?=
 =?us-ascii?Q?rAPDMUOITncLiw2UR0Imzv2s/HtZdzvp+V4zYyvFMr3fErDjBOhKYoitQlVt?=
 =?us-ascii?Q?GFNwz09RISVokDW7h6LjP74T9xa/ypPjYGNlmjBhwLDRYprRuoJ/tbW4Pf9J?=
 =?us-ascii?Q?u1eZgTRb0tmWBVwZ1nglkUbu+mLKjlXRzOvoY7BFhgUK0ZCPGpFQNnFXRwK4?=
 =?us-ascii?Q?i/3PT4UwAkODPAyxMWuuab71wps0oQkO+2iruihbIei8ZJGLJ6aIywQOdThI?=
 =?us-ascii?Q?y+YjGLplzOrmZd+nDj5usa16C7n4YHANSiRyXztu?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22bb43df-ce49-471d-30ca-08dba88008f6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 11:06:46.4728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y4xVX/JUelXxxyE/pg2ANJbkm/A8T4pE626uvMsaHr8UjMzaNqHERsCagBM4Tt3wgBeFctL4LQi5lbtjN24sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8522
X-Proofpoint-ORIG-GUID: aZq9v3VWjQud64_PzRqK9VkdirB1AECl
X-Proofpoint-GUID: aZq9v3VWjQud64_PzRqK9VkdirB1AECl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_07,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxlogscore=889 phishscore=0 clxscore=1015
 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308290096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Aug 2023 11:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186853

Changelog:
https://github.com/NetworkConfiguration/dhcpcd/releases/tag/v10.0.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcpcd/{dhcpcd_10.0.1.bb => dhcpcd_10.0.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.1.bb => dhcpcd_10.0.2.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.1.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
index de007a6e6c..9dccc93713 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.2.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "5d9bf80c26b4b7dc9d8aa175d96d5a24e75b4d48"
+SRCREV = "d2fbde99cf2d0072016af9dfe6a77032a5a9fc30"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.25.1


