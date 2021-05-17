Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.990.1621273146602589721
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 10:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UZ/BSF3i;
 spf=softfail (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0771996eca=stefan.ghinea@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14HHd5tr010671
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 17:39:05 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 38kuecr0px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 17:39:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3W19QEhOn2XCpHitheVCWFn6t0espfamU2+Hyxb+MYpvM29RvuviqJVi6zdRuVHhMqFbIkh07t/mX1Ql7ESApcr20yMk+jXFt98xZ0VV1T3aKBKiK0yZh+golSIsfEuV/gk4yZpGYKLSJoJe/M/B2cQXcCaQVYU0uDoH+6xJalXvzx5L95yIdTG7KXWL84O3XWmqYfaCLEyeYqti+5nOK4EG+zDib73bWB/vitsA68Dqz3rgKUGZbWZObmUJPmmwZys3JOIhYR7gP5J5ciNsekrNX6SnEtIquMXnRxxOxtbs7xYv2cNBIVBoo97V+lTMYRnY1813FeBXzxyY82dEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EqefUFRI9fa13xMmDL490Sakg3zbootL6HoIefin3Y=;
 b=QCrB2dPUOJuaRdFkUiuH33jLHiKd/RXgSm8WZEODP26c5FrUKWGEbOz3bmlyVVL5SoX0kNzhqAoWiTfv9iSQzW4gCBuet/6781BrPkmk1nBU75SnVXQOg8Dq0MzX4mgYuBFj60FSwXGkqe2QWeOmMBpf8pnFmQNtO8qY8M4HVyodnLOLNUJzrjz+SH1+cxWnmIilzYd42A3ZyU4vpkOEGHaW/myk4Ou1C5itsdl1nj5RutUKyDogcQlzi5qEUIX0AqFWaIbzqHxTFDpzTKTa79D2Z439yvzq9yi/8MGrC6JSLjkRCaroVpKtxdZXRT0pq+INZYnhf3Sy7veacNuO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5EqefUFRI9fa13xMmDL490Sakg3zbootL6HoIefin3Y=;
 b=UZ/BSF3iV27aoR515BAcPapE31u49LBSnMDBAucRxOdPMTeNHWQoDsyZbFlXiT8k0UYwQalkpnQMPc6N8Oq91M7uajKwYhKujf/dpvErmpwTwJLVqMRcsMDp6a9XlulTw5KFae3hdkXIFRzZs3w8X11HYgVSdenyX5SX2Ny7WO4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22)
 by BYAPR11MB3573.namprd11.prod.outlook.com (2603:10b6:a03:fe::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Mon, 17 May
 2021 17:39:02 +0000
Received: from SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb]) by SJ0PR11MB4989.namprd11.prod.outlook.com
 ([fe80::7037:7346:6da2:e8cb%7]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 17:39:02 +0000
From: "Stefan Ghinea" <stefan.ghinea@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] [OE-core] boost: fix do_fetch failure
Date: Mon, 17 May 2021 20:38:47 +0300
Message-Id: <20210517173847.2002-1-stefan.ghinea@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [89.137.231.29]
X-ClientProxiedBy: VI1PR04CA0085.eurprd04.prod.outlook.com
 (2603:10a6:803:64::20) To SJ0PR11MB4989.namprd11.prod.outlook.com
 (2603:10b6:a03:2d9::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (89.137.231.29) by VI1PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:803:64::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 17:39:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a983884-b6ef-4634-6a0b-08d9195aa904
X-MS-TrafficTypeDiagnostic: BYAPR11MB3573:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB35735B382858F54ACA56191EF22D9@BYAPR11MB3573.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:632;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	89Je0GhC0wwTDxN1iPSxHiWNurkaVxPiFv/lrcy8LlSKrHBJsMOmq/02cYDjMjOjf0+CaxLMl16baZYxexDFRZkypF18IF7a3sGrcZy2aX3IbrUEh4zB7Mg0bx8PE30zDqTog3AGbz8/HVyF3UY74j4tZI3M+EzdOKD6fDLf2DvopDzEbt4g7TkS7katdeJEi2eIexXAjGwshOjDRYBab6Z3OgXN//Ll3qx+NWsIlMnAcOTfGtrtLF2GAWHBc+AYWFiTbdqPTj2VoRNGdO+mo7wXIRsKn3CBdLMZjp3cQEdEHgx7cEw2l1qwDg0G8WLBzph0OO2m5j68cEkjSa0dtwi4n2KV6SRyCoG+Vlz8cP3TMFoiBje1GdJkzcmJqiQTSWYqkIX64YuL1i+UdYe8KFbnlXtWHoIkXfwiXHndVij7AcBTm1tLMoT6PA9Tknfv6M+RD9EYhIZUSdKEfWExavKQKieVa8tSwiC8FjZQJAW4iRido14OjZTaGEw5/zDIiivl/lyp917t3xzxpksEs+3W8W1Y2CbN2As/Z9SMRu9j5sEnvRjbgGkzyLOpLJQUgtmwmmqnVd2RF+86cz8Xu5J+y0BJV8wsi6i9EQmbS0JZ2teUwIt28/3URTbFRyZ6xGA3IafSBTXqSFeUEM3HBkYhAFLO73L5He3d+Q2DGdz8XaIbyvZ3nh4yFEQ/DuyT7sZVUC+grIRKwBN8MKcW8BhWE5xR8LTWqJPyLb++TtBurA5QNQyHCkkJRIqFBrx1kaAh/OgM0pu+KAluDUx92RoH69v4c4ZtlUOi4mvTYRHY70hzVb8429dUF0VCvNp4SBN1pyflLgESJK/zEillLw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4989.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(366004)(346002)(136003)(966005)(8936002)(66946007)(66556008)(66476007)(2906002)(36756003)(478600001)(86362001)(6666004)(186003)(6486002)(16526019)(1076003)(316002)(38350700002)(26005)(38100700002)(956004)(6512007)(2616005)(8676002)(6916009)(5660300002)(52116002)(83380400001)(44832011)(6506007)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?mm2ht2otZR9gsyv8Fq9f+ifW22RtMmg8iFZYogZGbK3xgZPtH5LurKFh7M6y?=
 =?us-ascii?Q?3/kiZ6yRzQ9Gm6CITj64MHsYXfET76Ij2mitplWrN/1lKY8SJzF0PIWsbllC?=
 =?us-ascii?Q?lQQs624FwNnkNelnaGE5HpokNBr75IAL+9bHWhoXEWcuZUCLeSaqZoEBmFhG?=
 =?us-ascii?Q?AVaGR2cRd1cKcDqr+7xmHMDNNkp0lJ/qVSyXkV/l6sb53QCI736VV+CfGjXb?=
 =?us-ascii?Q?myM33Zx/WJg/WUt+eNAGbw7RluM7YqbzzweLbJJHwTJnPB/g/IB66PKQr7n8?=
 =?us-ascii?Q?w470SR/Cr9MWBNfLslmLY8/kVWe9qcjSNjPgQ+Qh/2OXDtausNMMzOSm2j6a?=
 =?us-ascii?Q?L2MViEEVWqvN/E6iWvKSefP5GM3e1Kd760rONtxL6MIgMoHMJIN9MFh3OAmQ?=
 =?us-ascii?Q?93I4pNNEHXOMljMQUdhDO0yE2u4bzg2M3kTg6Y5QLgSN7lIwC/ohV1DFdIt6?=
 =?us-ascii?Q?dCc8aAMGg417DxoZnd/Ms3CDr1SSv1YpH+aT9HihSOefRQ9weTVL/WKPAFSF?=
 =?us-ascii?Q?RNld1uFZh7KR203rUEe8efNMCmhLcYjyc4vpzEzF8katUXaojterxmKZGPk3?=
 =?us-ascii?Q?3YP7aOBv5YQx4ooxgXwTtSVT7To4Ewdu/JzP9honBFQ/iffFg2jBDpI3Izdz?=
 =?us-ascii?Q?3HisTowU/4RLSmHmOoMiBVgwqbxxg9RnA8XjTYE5i+1vzLSxmGBG+R6zQAyk?=
 =?us-ascii?Q?UZ/k43sfm/T/wA+bhZMy7OWEg7tMD/ZUyhq7EFO6T5Px1RZbClUgc0nYM+GD?=
 =?us-ascii?Q?PCY9M5QDBdwzE4RGgWo1PZltbIxgXQxQbgsimKYNFi3elFM6+qpIKsVLe49Y?=
 =?us-ascii?Q?sJyQjaAKgSrXW1IobCsC3AhICd2Emv1bjKWtvQ0wEksfoUp40CKn04tHQcU0?=
 =?us-ascii?Q?p2/qHRyUCtcYaoDtfuNXOKPyWHiA38k+fsDNa6/ftR+sAWxlTjKZMo3E/z/a?=
 =?us-ascii?Q?Nl838irmk/yioCBcGQgO8w/uR7eku/Sj8+TCPEaRUiZcIGwHDRrxpzMXZ2If?=
 =?us-ascii?Q?kr/W1rnM9dCyPfQY6I8QkG4Df8nfwMK9vjnPEZD/QKPO8lvV5kWDajnMNvVn?=
 =?us-ascii?Q?kYrpfvl3AZva3OC6nkp55Qd6Ez4y7+lz459FBZbZqIZnvY+/F4YS5NgaWyWH?=
 =?us-ascii?Q?6Pfa+eL/4nXCITzMNraSg2W9M1uiQEL6Iu15W6Py3Px3whLrRumSs2Fdjcr8?=
 =?us-ascii?Q?pIh6f3DH+KWeQgZKKPnrWpsdiBwksNI/HauUYyia3o4K6aMlxily1ELq3kwY?=
 =?us-ascii?Q?C9jnXf6VMmNiY9gMi5jFYFbEc7ZqH4uCnaV5TZ1ddtVCkkSh85VK9T0GmiuV?=
 =?us-ascii?Q?EiKGaH/OvLlsGwF0fYt6rS2O?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a983884-b6ef-4634-6a0b-08d9195aa904
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4989.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 17:39:02.7575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JZFm2SlSApyM0uQNDJDXkw24Bgs90Ek7GXle8VGqTYCSc7PILGcNs5KSpJWIus33cL3gw/v2ldljk79KhQ6PYkUTdh8Cm+lA3ytUhg2RYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3573
X-Proofpoint-ORIG-GUID: uwQjOLrhSRtRh62PkEHhXA8wAlBGtko3
X-Proofpoint-GUID: uwQjOLrhSRtRh62PkEHhXA8wAlBGtko3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-17_08:2021-05-17,2021-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105170121
Content-Type: text/plain

Bintray service has been discontinued causing boost do_fetch to fail:
WARNING: boost-1.76.0-r0 do_fetch: Failed to fetch URL
https://dl.bintray.com/boostorg/release/1.76.0/source/boost_1_76_0.tar.bz2,
attempting MIRRORS if available

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
---
 meta/recipes-support/boost/boost-1.76.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost-1.76.0.inc b/meta/recipes-support/boost/boost-1.76.0.inc
index eb5d484976..c02f38b047 100644
--- a/meta/recipes-support/boost/boost-1.76.0.inc
+++ b/meta/recipes-support/boost/boost-1.76.0.inc
@@ -11,7 +11,7 @@ BOOST_VER = "${@"_".join(d.getVar("PV").split("."))}"
 BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
-SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
+SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
 SRC_URI[sha256sum] = "f0397ba6e982c4450f27bf32a2a83292aba035b827a5623a14636ea583318c41"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
-- 
2.17.1

