Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829CCC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 05:58:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17084.1706853492300284971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 21:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Sn5umx4U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2762c4343e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4125cB9K032251
	for <openembedded-core@lists.openembedded.org>; Fri, 2 Feb 2024 05:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=aJTEmhdSSS1sjyzrji
	gKuCbt9rQnjX+DQHJXmP9juCs=; b=Sn5umx4UeBA0DB+lFTT1SLMYdkqu8cxNS9
	m+UNdpQD85/xRKExAMey2cqsyT+u3Aaix/bSz3nPCapCpIF416OXbjEbW+O6fV4i
	bfUttnJlGahy+jSnLwrGAFFIJILioFOjcTqcJKLke3sGH1z6uIManAqzQyrtEg/u
	9DSZ/wGqfQ3OP0ynOyUDugBnplFphAixIhyyk14qpeuveTYNrsLZk5T5TGN7us2i
	nuUMsJp6Ua3vt7XHJs97uEYVYHtDExw0lbveBIlG1qeV2B5KP2GDY28OEJ3VOqTC
	14w8Gurx9sGG6Vb6GeLX4t6be/NVQTLaoRVgNP9bIC7pIXQwdq+g==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w0pvcr4uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 05:58:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAGtkGgauWPIg1sQ45OOISMptQsjFuPdc1/b5r+oAp488q4YrEhsQOyzH+ibdDtu36ajAAZQq7kwiIJIxlIdDYaqAgSZEK/nAWLB49N4JhGgF23/GDjm/lYnfhbLhKYGmc8Y4q1jpYcM+8RA/lc1CDsWR/wEZEG+IaqejQwDsXVvf9Wk1SCzGtncbLfp7uNOefIa6iEUV5kSPbU0czJyFZq7OIuH6e3Xz48C/LhOCqaKRxQ5nifJPtFaO13Nkxa2G9EIsBXu8s2eD0/eyiPgM0buJesnCcVwLAx40HpjRdLP78gXyRjr9D01EWmCDlTWPrGOMp1JZ19WVQAreBsXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJTEmhdSSS1sjyzrjigKuCbt9rQnjX+DQHJXmP9juCs=;
 b=RjBU71qD6AxdUUC9kKzitM6SlwpKYSzyiPw8qRxGQ8cLqAjIEp68s/H+bWte1wHvCGjOVcye5+VgM2hHkGIJPJ3xKhtpzj7m8wRKVzLOscQ+7XYScRBf2q/iuJmJP+STs74tuzOERh4kUsHTIgCGpvVxZazebBIuMWRCbG0UgV11V5vT5glF6WCtvT7keScLhuWcpcr4el33mbGE/V3OamlywPlkp1AYgOHK7CxrflQurI8SUHy8sxbitCdVhjcJkTQuG8iddcUas39BbsDZiJ2TbHHinl1vLn3y+NEw94pUobQBfierqaYWkTX3a6qAlq7qgLStzYaCyFKqf9yUJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Fri, 2 Feb
 2024 05:58:09 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::6633:7d9f:8d6b:247b]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::6633:7d9f:8d6b:247b%7]) with mapi id 15.20.7228.029; Fri, 2 Feb 2024
 05:58:09 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] rpm: add missing dependencies for packageconfig
Date: Fri,  2 Feb 2024 13:57:59 +0800
Message-Id: <20240202055759.4060044-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::18) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|BL3PR11MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea61016-da42-4007-44ee-08dc23b3eecb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wkostp4lvs30Imp1ywBlM+/714G6QLXWuseWY6tT/UAQeHSQLwjwL6xkc/ve0OA3pK7NKpr4YNEyBECPe7oSuAhzybA7pF5moAvlruxIVPKRw2ASHDWJgry3UYmnUG1b0UfQTuKhUl98l1nKIHYoeQsZLVMmSHyh0BWSoViz73obViZYeu6RoslXUZpmDJkB6jCe67C7UNahJR0tZcdqYia+xVNa3Ndb/EwuJ6kttJzcO+jqKSDopEqJkUdS1qbti5fW7hWxI5MsNDKcTwbZH4HNti2wfaH8bLXNUFdp+KA/hrjxn1Gk9ebmYP1OhwP/aoRrBs/a153uQ7rVMQK2QIJqxoFuX+ES4PaF+yJLIcTg034c038HpDGvZOqdoDuqB6uPfkt1gKs5YhZ1aMEp+T29XepyPqgWgsSBlwemRh4KRL6yn0fyFywndprSqsVLRTkBptldOynVQ7jMaqFkBbWn65zwya2+yVe5lra1VSF6Y4aL63sgb6KCReeqfQ3wy9zWoMS6K7zgpkhfw1M5E5Uei2RkzGJTlbyisygW5PdVUyhmNLxfqD1FRQjOoN+WhTkLOMcXwIuXJ53lXNQFfwqcnpkrDRzBRs2pwleadbK00U+yu329KoC4wruC1+qk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(39850400004)(376002)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66556008)(38350700005)(41300700001)(8676002)(44832011)(2906002)(86362001)(5660300002)(8936002)(36756003)(66476007)(83380400001)(316002)(6916009)(38100700002)(6506007)(6486002)(478600001)(6512007)(52116002)(66946007)(6666004)(1076003)(26005)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kA5uzpgRpFAHTAyeCPgmAXxOJJVQgXDu7LRVwbu9NFi1lbauXpkssd9Ec/l0?=
 =?us-ascii?Q?HD3gsmGp+Mrn8xBdiZuwuQAgDL8ZD4qXiuit8W1kthKJ88jd0YNUKo9ALi75?=
 =?us-ascii?Q?HQiUCc9oLKqrTGfMiKHLaMraTB6TfgMibV7Mcr/KP+BPwjVaDfUIy8s4l3EP?=
 =?us-ascii?Q?Jz0ehLJ5qq9THd3ihZBEqT7CNhvJYygzMXJTnnWIrcuI2YO6UdMBvuI65fBS?=
 =?us-ascii?Q?cSOCBYvlf1hLZZy25ADRkS4J/jf5hoq3n7VtN4aGTGlQcnisSZrfnhTrEPqe?=
 =?us-ascii?Q?f6vcviJ9UjR74PKVcwEsir9XwQai/SgNlQYRGK0XU8E/TgQT92dbxpaHJiiJ?=
 =?us-ascii?Q?x94w/BvYa1rJLCXSREFoid65OxqbPcYiiFuNDkTfQvZ3Hijpf9Wo4rkgv5Gb?=
 =?us-ascii?Q?RbZgaJopDkKRkjbzPitXBFYQeyv5n3O8uR1HIgqR4z3t18gVrP07qM5KfZN2?=
 =?us-ascii?Q?8ot5zimevm0WV+ETByiqjJkLyl6o3KC9OwjA4WS8Gpzoq7FLmFgXvIwE8f/b?=
 =?us-ascii?Q?B0rAu1GOP3tx0zDR2LBc0JFhQwiHBf6NZoJqd83OPLm+dcl0uWbz/+h/ql8Q?=
 =?us-ascii?Q?UPwuUfg8QXcBIOZ0Mo/vbDlkyYuN/cx9IghB5JgMM9c1od0tK8oxHIKrcYnB?=
 =?us-ascii?Q?u/fDJ26j85A3F6tEauw80IPFak6/ZnrQzO10O+JxBsnjMxTyaoxy71ArgzcB?=
 =?us-ascii?Q?+Zk6wmy7f62Dy2Zm13N14Is93ZthwhyStMA0qdAiO8piBml/MIvI6si//Lz0?=
 =?us-ascii?Q?CEroojNGvAqsRHSep4RYWS4J/LlAIXSj/GJSlKPRFA1mBpN3LmMDc5+wa6hJ?=
 =?us-ascii?Q?D7KXVOmvvedmWqS2YbPfFfV9H5o8wRZFbk40x21u6tpAamayIc1GUOqTRB67?=
 =?us-ascii?Q?ZLzqBwaxavw7Fg2dhkPgRjcWaIDNdgh3HNSceo5YImfCZkkFWbyyrqKCCJ8+?=
 =?us-ascii?Q?nvzkwLT4gaxcs7gb7+PpxmNc97KRQsCyiVH3Lxyo5dwaB0fnAHpr3B05gmcF?=
 =?us-ascii?Q?/ymhWnDuPhGcKNz6EmFwtVwBJ7jChUwb63uJNBxwClXZh8sDXrEG+X7MVx9m?=
 =?us-ascii?Q?/UdrxyKKQZQKr3VxbNNsPHYTlKYfziPfw6m+hCOKhnuY5nxBBpzsgygyKv/A?=
 =?us-ascii?Q?yMlRqLFRgF8fnXwbPbTXtVipvbJ4KarpnZd+w2BM+3PGJWzbZsLzW4cApaK3?=
 =?us-ascii?Q?19E+xM+ddaznY7cy7FiLMMhLVBmxAxvEYe1yJXCMqkBMq8/0JEThwbtRK2AX?=
 =?us-ascii?Q?MgxC6XWsIYo5nLZzlmsz79WgpIKjeWJ3Yz2kh8eU6OQvX5ZE19nt5JXqUdgp?=
 =?us-ascii?Q?JetMKE2Z2Y9+xGkuzR6OPcpL5wmA7/059WtQsoh7w90maGpyh5VzeNznQ1EZ?=
 =?us-ascii?Q?Anq32G+X//WztUvVsS6S+ffX78OB1so53ikjWAbk7NhjEIsvNIZKzzQe6DkB?=
 =?us-ascii?Q?6TOVMORxWxHDJXNlsQdW7VdbNvwL20e4IFHYjRTvPqEDkk+W7g8+Yd8+AOZu?=
 =?us-ascii?Q?/qKPrS9omOscy20wGEkN+jFk6AkOPhL9C8JKBdhFajyXIATFoBTrA6Va6op3?=
 =?us-ascii?Q?JuWeLJXIKjWrvVyBK+KcslBJOyP931f7SZ3Q84qC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea61016-da42-4007-44ee-08dc23b3eecb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 05:58:09.4718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MJ2hhueOudtEikU+G6GpXvKKq3mTh5dzpMubJyPTx6o6hNEvRLNZwXpBTA2L3hfDPYl+TFIIs6+2nyjBpKAuIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
X-Proofpoint-GUID: 5uvdA7AjNREJBDbzTZfT25hdIpRXRqTL
X-Proofpoint-ORIG-GUID: 5uvdA7AjNREJBDbzTZfT25hdIpRXRqTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-01_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 clxscore=1011 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=658 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402020041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 05:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194784

Add depenency libselinux for PACKAGECONFIG[selinux].
Add depenency audit for PACKAGECONFIG[audit].

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_4.19.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm_4.19.1.bb b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
index af11dec5ef..2c56b4c60c 100644
--- a/meta/recipes-devtools/rpm/rpm_4.19.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.19.1.bb
@@ -74,9 +74,9 @@ PACKAGECONFIG[internal-openpgp] = "-DWITH_INTERNAL_OPENPGP=ON,-DWITH_INTERNAL_OP
 PACKAGECONFIG[cap] = "-DWITH_CAP=ON,-DWITH_CAP=OFF"
 PACKAGECONFIG[acl] = "-DWITH_ACL=ON,-DWITH_ACL=OFF"
 PACKAGECONFIG[archive] = "-DWITH_ARCHIVE=ON,-DWITH_ARCHIVE=OFF,libarchive"
-PACKAGECONFIG[selinux] = "-DWITH_SELINUX=ON,-DWITH_SELINUX=OFF"
+PACKAGECONFIG[selinux] = "-DWITH_SELINUX=ON,-DWITH_SELINUX=OFF,libselinux"
 PACKAGECONFIG[dbus] = "-DWITH_DBUS=ON,-DWITH_DBUS=OFF"
-PACKAGECONFIG[audit] = "-DWITH_AUDIT=ON,-DWITH_AUDIT=OFF"
+PACKAGECONFIG[audit] = "-DWITH_AUDIT=ON,-DWITH_AUDIT=OFF,audit"
 PACKAGECONFIG[fsverity] = "-DWITH_FSVERITY=ON,-DWITH_FSVERITY=OFF"
 PACKAGECONFIG[imaevm] = "-DWITH_IMAEVM=ON,-DWITH_IMAEVM=OFF"
 PACKAGECONFIG[fapolicyd] = "-DWITH_FAPOLICYD=ON,-DWITH_FAPOLICYD=OFF"
-- 
2.25.1


