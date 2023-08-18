Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99042C7113C
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 13:00:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10344.1692363615048270887
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 06:00:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hNbTJQ6f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75946b1a7c=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37ICTBjB029626
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 06:00:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=P2ArDd2LwzdrxVR1nG
	/tOCmBvcn15yXpp97SDv+7Y+U=; b=hNbTJQ6failN3aaWMAt397BMQYhy0lbcwU
	47LmqhSSXAj8m5owdOLwlthYAoAMPUk3/c7PoFpcLHAAoABw8bgWzrVo71Jwc8g5
	fenZSLyX5+tCFqri7Tg6X574iICEeKXRlEWyRQSNujRx8L/KEXZatxgZ9MOAKDF5
	Ig9RxXO21RN0YxoECaMPR2XNziiMJ829e00z7PcIX4kgrocnOetZVJJTZ5yhAAYg
	qAdXZD1G4oKAY875FUwjFF6/XUY+nXNBw986p+yU9dC/kiGeIAjAJp3SQNciIn3Z
	0M91vbSbCNgoR/gi8j7GJctl4AbBl9c7A4vAb60vl9Y/LxtzZRUA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sg0rrkp2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 06:00:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCyT5c89bUQmzTPeB4m+gfZgSXAnKj+1/UAuabHLz6kq9d9OZvFZmM3nicbpBmdYlcbKSiacEjv5toJLQQxxhPNEhuas+jhw7NoA+/On4wdXw5XdJeTMp30H57zpZMudp0SjU/y0eoq16dw7s/pU5U2xFhuBpbGiqh4KkbEKYVfEh0OPVJzrQ3nQVpKHymFU6KmybYIIiBPbj9hpYVUTwSFmbIW+ExDDbylpDnF0pZUYt0pDHjuL7pUgHLpZapKWq2R4aSig9AkOhbE5LYkiWFZhvwrUXgFYoPJlrxNFZzKlQ9bOixj+uY1RUQRUKafHYBWs9b006gUFfT+klmckzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P2ArDd2LwzdrxVR1nG/tOCmBvcn15yXpp97SDv+7Y+U=;
 b=THqL5Zd8MKA/v0z8qPUiUY+v9Rjy0FlxgkPkbc1qmOt0HjWchboW3nztii1QnaqqWRu3sGWKQLXW9chuE2nYv8kPx3QV+6BOAyxjuIJSvCO44tLDVyZX5vJekfeQx0Go1Q+ULxpG4q80GSI3GFLfbuAsayZvFUGnVMmLU9o86ONbY2IwlC1Cl6sCOVjfuStHntNyj8k9b+IlvhMZP3CqGSqPDElUEi4eGDyd8kDwRdK3GzdqR4BOukB4kqnZenK8SjAPLUyJRNJuIycWP7rEdbFF64S2CbL+l+iAZ4uUGJM6Q3usdmFZsRS8p+3T4Kdx0APcsKbzTP9ISBye2fbofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Fri, 18 Aug
 2023 12:59:55 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1f8b:45ed:dd21:9c99]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::1f8b:45ed:dd21:9c99%7]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 12:59:55 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mdadm: skip running 04update-uuid and 07revert-inplace testcases
Date: Fri, 18 Aug 2023 15:59:20 +0300
Message-Id: <20230818125920.3100226-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR02CA0068.eurprd02.prod.outlook.com
 (2603:10a6:802:14::39) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: 204cdbf2-e284-4fef-07cd-08db9feb04d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZYqF/VFVWqAfnl2KjmRJJCgKgtfzEDoAM81FVKTxNOO7MgolIy3yWJdmeSB7ant1ZfQe5uIgAyoD2u0GqgXNhFRjTumZT366A8mskBkZ2mAHWUBppB6V34+ZhZZaPI9vaC89MsH5/h5iaatXO4kJN2cAtJDnW8aNM0Y252vf37m6fdzN8DDbbup22fHMnb+HR1XEivcOYkiAPKW5pU+4sColD9ftim/i6sLb7r/nMUT3Z9eS2vlKPsq+jQU3rIkc6nglYGw6aIROLIv0HvI2NIWa6MQClEBt0HKiR5Y8SYlfI7QpV3neIzMsdCqeXQbO4IY9YuScyBLPaukzG1LDCJxSNZTCtqJCIM4mzASL+oTJLrK71VKrtvgH+7QNa31U2xzZ3rvMHdOkWxDgXnF6B+yI/FkwDsHOd3HCF4mMQhqn0zoypj8Wr9wgiqGRoazyTgKflSrtVyKvHD3kGUDftnaH0eMO8hpaq6meOwvrkcSgYoYw/uqxBP8UgHvyPPi+so2qTEy4sx/m6Y9jSmSg9Aj7lCsLV5Z9lWDtGvVcrSIxxRLf0kEKQKKkd/ByVETT1X93ikCH15hHOMJSsx4PyGPIpAZD8SNRxaFryzMQsAKUD4OEpM7bXNFKUiZpdxVC
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(366004)(396003)(376002)(346002)(186009)(1800799009)(451199024)(2906002)(83380400001)(478600001)(66556008)(66476007)(66946007)(6916009)(6506007)(52116002)(6666004)(316002)(6486002)(5660300002)(2616005)(1076003)(26005)(6512007)(9686003)(8676002)(8936002)(41300700001)(86362001)(36756003)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BOp5mSloZBNeZYexoziCgHsKpo1DNn7l4okFkq1ZpYLuOdu9UQ99RVK/+leY?=
 =?us-ascii?Q?xM4pUWLH6vjnSKmHYPaRGA+aZfcmNyeMn3lCKmXY+jrLUStgspX1T1pjEZBL?=
 =?us-ascii?Q?gUOJ/SBnJv+p01q5ON1gkiKhMw4aczZ+hB8V/PwKkB+kXhYxWlzWx32EHz7M?=
 =?us-ascii?Q?mTi/idQJFVQuZBZf0wcic9/gQdzP7k8lp0E3fRbxVJToIjtWlP8nTYQ4KswW?=
 =?us-ascii?Q?h5zWylENVx88CXSA0/AkQbnnxBFdcQR1dMn9878wjsbB+g7edsE2uZ0ZsXGd?=
 =?us-ascii?Q?rETI1S5pfi3JKUt3Qypu9zxBdtI4LEtm89QJ+fXj2Utw8I3vaq6Ji1nfG4S8?=
 =?us-ascii?Q?moxA2SKnmodTSDDsLTtECwqE7uv8saQr/YBj82KNR4G+janeASSLben0vPl0?=
 =?us-ascii?Q?HqIA8dMFrPlYYEt3bgKftUserThSZs4PYq0HsLZt4ALRgSzO7SVlx8q9zsMq?=
 =?us-ascii?Q?V66nATj51Kkbb4xAIkOGmi27vyORmIMHijEC3b4N5VajROpcuhuASw/K5tzH?=
 =?us-ascii?Q?E0VWgejJfFAID6/YzbEjl6hks4QJvCzUIwLagvrhFb2DEPiqCBlXgyJrMD5t?=
 =?us-ascii?Q?giDE+NgxsY96TjOFIN8sVUqVYJXejfMs/ocOynl2NZa9h358yX245eR8gurS?=
 =?us-ascii?Q?LuzwL94u3KabdpEC/vGjV0NWzn11cQw8K1X20PSKSOWO+t6720ElWpvfKQqK?=
 =?us-ascii?Q?S4EAcRl86gfEzsh+4M6aJUis9FIxVIYHJwGg9KoJKa74uxn6ax8eq15mtXwP?=
 =?us-ascii?Q?S587RiETqSoMET+vSwRg+LHzKcGIXyOvVbpUfAGzpcJVBCeJdTXvDI2A45Y7?=
 =?us-ascii?Q?8ixJTc2CJ/HpWen3co+iqg8uS2Bzo+jd/ULb6r0TzxWBWYKi1p9taFCa8Cgy?=
 =?us-ascii?Q?TjsflWoPOaLZp1jIvDN8WcF/GwtenZdJLuodHt7s+HjyJCVlgqCovgyRuQSO?=
 =?us-ascii?Q?SoF6Ur+8nAT6C9bvz6fAkiVbKst6VWBRz1rJGek+l4oqTtL1/Wp7MpD89oGw?=
 =?us-ascii?Q?c7UXJ1OS4cyHHD945UX3KnClmo30AzZWoxuEQegAN1Rpki2WRodSsHuDj1iE?=
 =?us-ascii?Q?i6wB/H14yNTJLZxW+yNMSxYC4oIQHm/b+1r9oAArwg1heCDuOSrE/uNUFTEB?=
 =?us-ascii?Q?9w0dUngjvJwWPA4De3Q6qnOBtRO7sR6GTw7vvQR11IdZdlT1RcxzwaGFlyY4?=
 =?us-ascii?Q?hqmxOJhlTwypduWw1mjQUZp1jO62G5EVB8fU/6P4WvrxbFPMrc0/AglwSuia?=
 =?us-ascii?Q?0AcpNKg0+4eLxdVikUvRnO4s2yjHokfWZiZ21rKefuP31iquaofaV5GBtmQH?=
 =?us-ascii?Q?1Sg3ujN0MLq2wBKZKrDFBV5WtGAdK1kBwIkqcj/LF+jmDbVp5MnoLaaUGo7w?=
 =?us-ascii?Q?wX02KbG9oDV2XMy6KROBMinb0pz74t+uMEOji3lSNAdQZrcxb/8i2uAzP3LO?=
 =?us-ascii?Q?+FwWTf5FWNvJK0qwRYngubv854CarOTUHOXy19TxuP5CZR29JAswU3hNmp5G?=
 =?us-ascii?Q?IprMe8Z9D+fu7BL1/Weisrvhisa680xNtmxJ6TVKMNI4HOO3zNWWAFY9P7+D?=
 =?us-ascii?Q?uSw9pCNxGX8L5i6HdZv/gPLNlbktvzVrNLpsiKZqEQtzjOr4k79L3v0UuxvY?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 204cdbf2-e284-4fef-07cd-08db9feb04d5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 12:59:55.4665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RcMiZdKcbCH34ByZKy0VxumCS5ASauKKmHmBZlOQNPm7h6616oGKUo+rNc3HfjE2znHEGlOqfA/mzdrqjp68XqAmCbn2RtCZrsJ3g1HT5UY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-Proofpoint-ORIG-GUID: MTAKzLtETCo_7VHkcGi3F5EQeHgt05n2
X-Proofpoint-GUID: MTAKzLtETCo_7VHkcGi3F5EQeHgt05n2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_16,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 mlxlogscore=557 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308180120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 13:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186367

From: Ovidiu Panait <ovidiu.panait@windriver.com>

04update-uuid and 07revert-inplace tests are unreliable and fail intermittently
on the autobuilder (BZ#15181 and BZ#15159). Unfortunately, the failures cannot
be reproduced locally and the logs cannot be retrieved from the AB.

Mark the testcases as BROKEN to skip them when running ptest.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...n-files-for-04update-uuid-and-07reve.patch | 39 +++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch

diff --git a/meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch b/meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch
new file mode 100644
index 0000000000..5a6bf9e4bd
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch
@@ -0,0 +1,39 @@
+From ee594b1a12833c06102de888248a361bc49cea09 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Fri, 18 Aug 2023 12:20:40 +0300
+Subject: [PATCH] tests: add .broken files for 04update-uuid and
+ 07revert-inplace
+
+04update-uuid and 07revert-inplace tests are unreliable and fail intermittently
+on the autobuilder. Unfortunately, the failures cannot be reproduced locally
+and the logs cannot be retrieved from the AB.
+
+Mark the testcases as BROKEN to skip them when running ptest.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ tests/04update-uuid.broken    | 1 +
+ tests/07revert-inplace.broken | 1 +
+ 2 files changed, 2 insertions(+)
+ create mode 100644 tests/04update-uuid.broken
+ create mode 100644 tests/07revert-inplace.broken
+
+diff --git a/tests/04update-uuid.broken b/tests/04update-uuid.broken
+new file mode 100644
+index 0000000..197b35b
+--- /dev/null
++++ b/tests/04update-uuid.broken
+@@ -0,0 +1 @@
++fails infrequently
+diff --git a/tests/07revert-inplace.broken b/tests/07revert-inplace.broken
+new file mode 100644
+index 0000000..197b35b
+--- /dev/null
++++ b/tests/07revert-inplace.broken
+@@ -0,0 +1 @@
++fails infrequently
+-- 
+2.39.1
+
diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index fa50325f1f..c367b633a3 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -38,6 +38,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0004-monitor-Avoid-segfault-when-calling-NULL-get_bad_blo.patch \
            file://0005-mdadm-test-Mark-and-ignore-broken-test-failures.patch \
            file://0006-tests-Add-broken-files-for-all-broken-tests.patch \
+           file://0001-tests-add-.broken-files-for-04update-uuid-and-07reve.patch \
            "
 
 SRC_URI[sha256sum] = "461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d"
-- 
2.39.1


