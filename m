Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01BFC32789
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 07:55:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15768.1661154936193564318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NHpRCRrC;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=523303e571=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27M7MX1v000423
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:55:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=cvYLgtz5uKpo8FQib9s+ciEP5IfxRLmsnPhzllu1fBA=;
 b=NHpRCRrCSpVYNfepxxF/96aenXmjyI5jT1AfyeldIr6urYPJwyw5+/Hqj7fyqebOfexA
 auutkxXv2AEUOydDuEf5ZKoRDO9iBYZxgTZT8VKEwI+l3KJGiFyFn4FYjPIU6DwAPKFB
 yMgHe7AaV1GJFcLd+vlx4l3eyqIV+VaLvNnFf6HBLBHHJe9mg1iJMhnOuPvuSzuKDHW+
 bvI5G3Ppx3Fo438kD8b0tSIZkaP3bfr7BjGMk2XBkkmdg0M7SRh/ocj+fsg1gz7WF0WG
 dAuFoIJztkhJuW3Tb8YPpjfeaRBr8NSCiQdLkA7Cl7BSWrbA6IgiYcwC2GZHVj67JxDH CA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j2y4jhj1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 00:55:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lOim4Hv6AK75gSw4jAU/EkRYZ+MPT6qbOZIY+14h2b4JuQ8gIQUiMlOJ41gJnGMsBOX7edjxizsqqMypf7Hog/TjlKBVU8XJRSCgRpY9PWxpGfYScObueXPxE4hDkYi0ogypR8VtXC+rxc9TZKtE715/4fldo7t/mmYU9vMdwSKS9kIRj5yzKsqJVHg0FAhmbosks1NGFAUX+1Hvaya2Gnj/hEHrE2B1fTsajDu8RPYr0GZC0rOVMDcGGq0qp9GLaJURrD+Yojp4v/dDMmgltFH2RGRvuZk7JCqbcbgJajBjFKh9I1jjO+FftNKBZgbtU31cfnYR4DqaMtrJ7ixf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvYLgtz5uKpo8FQib9s+ciEP5IfxRLmsnPhzllu1fBA=;
 b=RohLIQO7oKlkF0ssWhb6pzsCjQu7s40ot+SS+5KoDhMD2gNQFnMCLAijAc5F8DE9949YUmQyYVKBHBnb680kxQYnwZkchJhdkulBq7z6hYFuvVVWrcqaFFUWe3Es0S9qdPRO4WzDYvYI6Z2I1vgujYELRVx5Map6zbfSSF/gqmZV/JckC0nICpwaa97jt5nMeLNqexUBN90UurvpT0qkqDg/lxoo45FJ8HopMBn/0frNleUc1TyYExMon0YZuMnD2gj+idS9X0Fnhe5tLCQ4S9thPeU/k4Z5EnjMmMHcy831dQIz98/8UlNT5rq6uV2v972bMNiK4T7GU5kXWPh8iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Mon, 22 Aug
 2022 07:55:34 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%3]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 07:55:33 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] python3-requests: add python3-compression dependency
Date: Mon, 22 Aug 2022 00:55:21 -0700
Message-Id: <20220822075521.89081-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:a03:60::16) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c94fd86-0606-4bce-4f9c-08da8413b0d9
X-MS-TrafficTypeDiagnostic: PH7PR11MB6932:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Jqn0mfTxDKRhaKXEQXcwxd5NXW0uf5U2/OfxMYoBxIdKSpUwWL0yHVxryet7FA7xBq4j8bcpaHYF8kphtEzNsdjRIL5Gb1IHQ2Z+PjB7k/Oowp4vZocM/xxtf5JzzxybQmfX4ZiQjgNinCLiIkfWs/NTaXbGR4suxDiImqoAOJV6P70CrPtegsZBuFS8VWQF7ciRqYElpeXhKl1JeYM7dFT4owczGAbBjBG0pUf+KYEZ2cM5EwDvdLdBO8Ua/DVQsH3rWsRCEKzYAMb8TKeW6RPteRB66wI0of7nz9Re6Gc+dvBq3OyLESuTrpLANISxclwod9Smw/zuY0j3b43X1wiiOIUEvZgZpV8v7OHcRda333H7+kgcXfksOcJqZlYP5Bjv6olOkjiobRlGZSvWb1srzyTZVG5QqYpwR+TJdIP/81KMvbT89Lwu/uRoKkNUA1Q9249DtNNP8bpEOIHYZxkEiH9P90b7o1EHPO8iKrtst3TY4XIA0xBKukQmbKen4GKYQ+JPcH9+Cmj27YcjHZiuUtTxskcgjhMnRFLy9fSufaD5wFiEFi9/SchyW4bgcZ4Lx5vGcKId5roa982GC7wcJMqFLBAmYK602sxR5q6aALaDXvS3B5tlN0Ssa8fqNAo6PrpHrpwKnm0Y5hn2Lu01H66GO7XzKSFMCGEGV57cJ4uX+Qf7aDUshSWf+BVMZZXzGRuYZ4uyVEHx42JTYhYXUSDMx/lZop6KTQMzYQEzQH9bmzpwWG5BfnH2/CkeXepF7+p7n2ar658gpPJCQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(366004)(39850400004)(6916009)(316002)(38350700002)(38100700002)(5660300002)(8676002)(66946007)(66476007)(66556008)(6666004)(41300700001)(4744005)(6486002)(8936002)(478600001)(36756003)(186003)(1076003)(6512007)(52116002)(83380400001)(2616005)(6506007)(2906002)(26005)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UFKxRcxzRukBw5pmL4DSZVaOCeulvSvB/mmSeS7Qa2MHIRF9p7mXTRXYV6Mc?=
 =?us-ascii?Q?Z+a2WclMcTPoVSMJPtTyc0zC/kAl0OibaTM/p0Onl7/t5NVf0Se6d60dBzvl?=
 =?us-ascii?Q?ykg/ZwHvJMPUrnrSzWDutZMeu7Tzq11esVGC1CYymBMMcpKGb3O1+YO3cF4i?=
 =?us-ascii?Q?0RzQdQNo97z3qoaE4sTTOSiup4vidKeWbxiHkWrqyFJ/xarT2Kn69g9YyCBj?=
 =?us-ascii?Q?ruM7+d4bmnHytCj1S/a3J722/FSX7W7jYINmF8nxljpPCi9hm+sNc3pBNiqX?=
 =?us-ascii?Q?FZNizxwmHCcJOLwHzuwIy52SwUylw1ZZVWT2ECR3nmY4wWpShUSu7gW+l9C2?=
 =?us-ascii?Q?KIPlHAjwurmoogOv23wynJuTDQRmaaYDg7J1WKHNkVc52bnobbSIt76rDRhD?=
 =?us-ascii?Q?VE4TnRF9BjHPsLvNXDd4vVpxft9vXXy3sUxmjrTFjO2YmtaanoXL4CeveNR8?=
 =?us-ascii?Q?arJi5m8e6cPOkXpsUWmorcciedkpigX1/QSoSBhmjV4jBR0kELb5uQOYHN/w?=
 =?us-ascii?Q?UPvgiUW70eSMY3JebXUw93wSwnd4Mk5c4zZGz2qpDR7KTPM5MJ+mZ/Hh/37M?=
 =?us-ascii?Q?vIXCfxysg9Mj6IW3aPIis4CEy2ZvRjvfiGSwVatXdpBZpI3vxUt2Jeacv3E1?=
 =?us-ascii?Q?80V2GHN75voKYWloLnzss57Ud74IESERyIXd4ax2JUYSDdGT4nBaZy2utSrf?=
 =?us-ascii?Q?IBAga+qrCUdVxTgjh6ZJrQAHYPGkUXiCOHj4dtuQtSZ8tZjESe9gFQbG9PpM?=
 =?us-ascii?Q?rxwzgoMeY5OifWg67/AuHNysDlvJDDeBUNsAvRU2qC3LaQbwawjFn+WKwFj+?=
 =?us-ascii?Q?/ExRguQKo9f2L0hcPIXJbfIjoAAu5z//RhctPZv7WsOB1aYirTdbqMWJRIyN?=
 =?us-ascii?Q?InjOu5Zd1q679OXkBGpyRg2OdMRSXX+PgCkiw9RoIjzh9YVKcm9PFXOH1pGv?=
 =?us-ascii?Q?e6tWcm6mELKcHyynNO1OClPHhIiv8ziGBVUQvo+RS7q1FPUj+W+fSiSFIvyt?=
 =?us-ascii?Q?CtkgChmKKrduiPP0cRoDt+qmjp/mcsSSyE1Pd8jM1UdCrdvF7PUc2/dcUSgQ?=
 =?us-ascii?Q?j3CC1VzuBmDIf9SmfDGo0vhw8glYx9ogDInVk4VhrJd77eaddqaiIvs1EnNZ?=
 =?us-ascii?Q?HFlAD/FDBzADvBYEhzo++0hFZl4TuSB7PsK6cJzwINPJ5kpyHIShQYCFtqD5?=
 =?us-ascii?Q?LTjgX9H7iuhwILV9+Sv3tZXTdNHdl717iYaM/2CrU1u30pb+Mnfu740Z77FO?=
 =?us-ascii?Q?No1BKCd526woWcRmmkKkqBuYPT/V+Ky5c9XQIk/ATjOyWUZ3ypUro5ndg/ui?=
 =?us-ascii?Q?DslMCfDBnpknF2WhdObiThpoBdjEUseE1/PknQxIwgQVwoitTw+u9RezKiAB?=
 =?us-ascii?Q?svVd7cWgfNg/r21uJGxAtFE1LR1e1d7ef8fk1uoZVBZ8eLr7PYAHVkHY+pA/?=
 =?us-ascii?Q?yX/+yxTisVPRbX9edgWbqdmnKHNlkFEpxo+v/5+CjDiJJ0VLZq0JdnX71855?=
 =?us-ascii?Q?KqmbZ5LQ1dblxO4U14bheAEsqH9cBtDF4zkYektczdNhu3TSyc++1SINUwIx?=
 =?us-ascii?Q?ZoW+PvU7d5Px2PtAzVlXPdfcP2uMioPk1V5QsREx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3c94fd86-0606-4bce-4f9c-08da8413b0d9
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 07:55:33.4341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 n6z52Y4q+4shoNC8jkyspSdnz9l/K9iFaNJM/nf7uA9PrzGR+jgOavPOKNWEg0qouW1gseW+D3ZGgiwtomjDqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-Proofpoint-ORIG-GUID: lJqDqfHBVOYCNQU27cRZNNBbYpV5opVa
X-Proofpoint-GUID: lJqDqfHBVOYCNQU27cRZNNBbYpV5opVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_04,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=687 bulkscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 07:55:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169663

python3-requests makes use of 'zipfile' module, so we need to add
python3-compression as a dependency, otherwise 'import requests'
errors out.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/python/python3-requests_2.28.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-requests_2.28.1.bb b/meta/recipes-devtools/python/python3-requests_2.28.1.bb
index ac8a570160..8de08d2620 100644
--- a/meta/recipes-devtools/python/python3-requests_2.28.1.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.28.1.bb
@@ -18,6 +18,7 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-urllib3 \
     ${PYTHON_PN}-chardet \
     ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-compression \
 "
 
 CVE_PRODUCT = "requests"
-- 
2.37.1


