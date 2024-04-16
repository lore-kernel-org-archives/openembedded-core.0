Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E409C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 11:52:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18769.1713268317064583820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Apr 2024 04:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IKV49Jd0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4836520bcd=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43G5bDHE002684
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 04:51:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=R6BmaIl86ZaTcMdiHV
	zIOY402gd9TB+i3Iy6NA3Ro9A=; b=IKV49Jd0Fj2G488doG48SJckYhuZGdINrN
	5KuSD8tVa+NpxqTQNVozRz04Bq/K1e2VhW56OWbp7wya+s6L1+AI7Ne5pUkFdMJW
	sGz4fRi22Ns19kPMJsxkVnChKZV8sAzHitqR16vre2jEWO8uPKtnl48mYRuaixOg
	iQM3ZmzDrLZ0BHMdPMC4tiQutYMlotmO8RWVWwyVd6Tk8IkQP+WuRw51uttwfOos
	8GXG4CbbWwMNPZedi0d1hf5k1jvFraml336tKEyw1RsCjStWqpssWI28VRLtJyCj
	vAcgzheqJy+oBN3ZKifzp8Jb6u3ruKmvZ8YKZEfs1xPu5gbRbwGQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xfsjgtegu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 04:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5MG7z/fJ7Gtt6nuuM7dToKs4/EZQR+b5pWaculzNxjaT7cE9noLAyPS1x3g0Th2eo7QfPypcqtF0Hb4HdZGPvH2XQ6qwmcRVvM/dwu9LI8KqDD59x+j7MnBe55lpL8gt+tYNch0uW9C14xGVkeiW4YeZElrPUpzaqlW4cz75nOOcEmPYiagyoIjZOhMxToqBRtfd0uVOJSVNJUXa8SMVPXmfJnTL/ESd/zFz0oi+hY9/aiBEFHSLpHaaEkuVsz3YESRfHvV7unUaDwvCmHS/Qm1qvO3tOZyaSYpUF/Ky1L9HOTkzEMQx8jivII/nj24J+kUUKm/PbA66JEWVlfEDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6BmaIl86ZaTcMdiHVzIOY402gd9TB+i3Iy6NA3Ro9A=;
 b=H0QhEYpUgwgox9bTUJCbb6yjm6b/naHO7pSGkoJYH4Kq+ZZjT9VEWwUCfEOORmdRccc07R4TiMIWM+qpkLLLO9ptKD9JrlTgbUbBppnwHU12D2xSjf9wsQyH2YZHpS8rqRzE556hy/x5jVc+FuCcNLdRp3Ls/yYiuLSSkaNX/cYRqZElTMtnHYoY9GmjeZt/tVv+ikNhqkSiAzHTQma8BEXeYfqxDabs+zAlM2JhC308w0HvtPJsyIH3CUSpHbQ8e7giZfjdhSyys5bqJO16MyPkt/hE7LCaCnVeUnLp3nW9zgOioqwH1F/Tc7E7UB+5LUtwGW/HPYJVmq7X0PdhBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH7PR11MB5795.namprd11.prod.outlook.com (2603:10b6:510:132::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.28; Tue, 16 Apr
 2024 11:51:51 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6748:b2ea:d62a:9d0f%4]) with mapi id 15.20.7472.027; Tue, 16 Apr 2024
 11:51:45 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [kirkstone][PATCH] rust: add CVE_CHECK_IGNORE for CVE-2024-24576
Date: Tue, 16 Apr 2024 04:51:31 -0700
Message-ID: <20240416115131.2102542-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::17) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH7PR11MB5795:EE_
X-MS-Office365-Filtering-Correlation-Id: eedfe18c-e951-4975-5e5d-08dc5e0b9744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	th8so6yV1bg/jOO0N/ZLB+kIctYgUY5lIdtoNawjIv9WvZDsXKxI/jvSt5W+P2CB4PzF6S9g8WSucig0ZolQXrlBwZrfD6UYQPCsS8pi0+Mmjbyek9JGWhgWUAASlZgd65K7Y07Rarj5CR6oBxwCpRAMUEpcLr8qBB0xc4jbPSX/LkpPd6nRsJcN2LbuMX34iufEraO3LY/KH1Tx1B4kpwYHw9Le4ucK0xAVXELib30cpFQufpzpFwLBefnK61NXwvlojdKTKj7cNj2nT9wvd5BXUem4L6Ojfnakwe9qlK07GUq/AHYeV7DsEUX0OpfjDvGDqIgRSxolJ6I+3j2b+riGITNGC9jaw5ZfceShmLNydFJnNBpHdm6V3XG8FceX7g7C55t6r4Jptt2xwdkF/VRNoB3/4SMK93hvVPYz7/9ntf+Oez1HQVQN+WhUvuO3fpdIM8Ad1yOm8KPRs7Ppya7s7KHlyGgt8fBJ4cZW7uspAskTNY2+B/GyMVFgttr0I6cIinFLh5u364Z/Nwtc6b9QeBpwBWwjy81z8RznY4cVULRnbdEjOCoXsYxYA0sZamiPLdBDwO1MqqHK4tDfueVlpggZtq+ZhID3tRRN8l5tk/MY1NJP/534lh6hx9R0Ne3HqjePM4VawCmI9Pg1wmMeiBIzeNmlsNwepDdVuRU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uGNuDN+U//FbzqJ89Qw69qHEfbhvUh8ohKEOcViIwbkUzmLhYE1bROFMqbcu?=
 =?us-ascii?Q?s+Kru9w1qxIoatEBghaC1VvKJW0o37jdJ8duZIyGfayAwyZZsbEqe+vbaPLi?=
 =?us-ascii?Q?wz+f+f8wKU3nIZ285o5lH6qFouLfitHwlPqwhzTBhVyKQ8FMnvwHFn0Qib5w?=
 =?us-ascii?Q?lAOp6/ZsEpxBq4mqUrjrtGxRBXOhT4Io/KgqzZvNowuF7//gZJv8O78Eflhm?=
 =?us-ascii?Q?ZJw4siGrmswEACV8crmyTv2rtJHmCSIe1rWI9QNFbaTsTqZ/ivwuavGsQZCY?=
 =?us-ascii?Q?3FZBK7D/r4d7TRpJc3sODA4ErEASPg3HCY8VYVi57lACPqaoxTu7NmHd2ff8?=
 =?us-ascii?Q?8aM9EoDmBYVHHe1NzPyMYILWkEca7XH9w5av85GS9W5QJs1GGjMJ5W81r0s2?=
 =?us-ascii?Q?GEm6/MLsBI7yOi3uSbbsSbBWVJakX/+Se2TvKYhBT9b8cafB+Je3SQJWq2Oz?=
 =?us-ascii?Q?WKULCMXkzXkiLcwVeZPwG6xuFOtqiWPPdrwhGk5hAsJFT+JnLrtl5Wn5CxaK?=
 =?us-ascii?Q?9VB6RLuAKMiCsKGz18WlaYOZoRQ4jtn/+LOuFr8XGHr27T5EhEuvom5BEz/j?=
 =?us-ascii?Q?ipmR2qq5esQ89w/4AnoUGVTuLg/aeTfYEdPNq5q/Wj+8TgN7nS1yKqE+dSTT?=
 =?us-ascii?Q?ra5+0x/Gn9Bjj4k87+6P4lSTk3U1Ihv3nvNDWIoAwazs6LinFdf04pzMo92S?=
 =?us-ascii?Q?cZ44MzBERi0WqC1yzOVj/pBdlPFJijXjcI4ZD78MHYFwydkKRj6fbpokUn/t?=
 =?us-ascii?Q?ZO/GHAR8ZpmIhNuhxCzkMWap8Oj9Kb1cUy9FOFdg16AVfJE3cgWgHfcSnWWi?=
 =?us-ascii?Q?YwgKk48bh0yRIvfUWcgwC7j26kv+z9GERdC7MPr3W2a6osATE38N0uw6x5EW?=
 =?us-ascii?Q?WSWjcilLP8od4KAxGhOC94hs62j/RbFVD+bbJz3/rIQyU4EpEKvA/ILcdYn+?=
 =?us-ascii?Q?Izhnni2HqB1WN0VrglZ+tHyBRoYB1UHGiyiYHGh5uZnabkJMRZTStjn0i0T7?=
 =?us-ascii?Q?sM0vJufG0YAajexZKTW4FQEBRGcaqT7Pad/R+mOi4rR8xQt0TKmCuTJSqhKv?=
 =?us-ascii?Q?EAykWXIACEs87hVVweCM+DEmZsSTKMI7Sl4im+V53raaTz91Hh2EtNLNfdmq?=
 =?us-ascii?Q?J19ZU4OI1wwPqRF7OyNoHJxuDjb/NP6cD4z+46u7f7gd2xRJ8ish/+PVZ8zx?=
 =?us-ascii?Q?a7sMilkBhMwndtBwic+WWLLiJ4x8I1XxGWu/bW3L0M+asAGJRvNasfYRbykH?=
 =?us-ascii?Q?j9PIALNfRB8hQQtZ/UcV+ttcrCGh6wnsDmO2k2tWvPzA7xwGhi6+NgYfQQf1?=
 =?us-ascii?Q?+v9nhSoCMJ+pHZtt0YumKs3IvgUyrkN0t0JHABG/epizm/zjR6UJdP6CGds8?=
 =?us-ascii?Q?ZVbjbloiyOksT0sAvdkR9e91S8IxxIRjs6WIjhzEItlTyZToYqVHBKEanAn8?=
 =?us-ascii?Q?sDmY8yjASTqDlFRc/AA2E43gASTeXRybnXl0uQQbp1LboWC0ND5Aa+IazjwL?=
 =?us-ascii?Q?8kfWBXTEywnThtsfqJJYHrKQhMj5oECvJOZwlpnXN8frT6mnGXYU/yaDZNSY?=
 =?us-ascii?Q?dI9Opt2HCX/UUoH+zUKE6bJZY2285a9rwPcf0leGQB83BwYpdnSoQjXRf3ih?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eedfe18c-e951-4975-5e5d-08dc5e0b9744
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 11:51:45.6527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: soqRjpsCFPfIxDdB582ATsarqqp8nKyhiXCDhDKlGKG/fZ/RouO9m3kv2p0rPpV6Wo8boW08epXCzzu12p/kc/0z+4/KKq1zga6WUXv9hHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5795
X-Proofpoint-ORIG-GUID: jcZs1IAsdrBRdsogGjObuzUztOo8fkHm
X-Proofpoint-GUID: jcZs1IAsdrBRdsogGjObuzUztOo8fkHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=765 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 11:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198436

From: Harish Sadineni <Harish.Sadineni@windriver.com>

CVE-2024-24576 only applies when invoking batch files (with the `bat` and `cmd` extensions) on Windows & No other platform or use is affected.
More details about CVE is here: https://nvd.nist.gov/vuln/detail/CVE-2024-24576

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-source.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index ea70ad786f..c377a680a7 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -5,3 +5,6 @@ RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
 
 UPSTREAM_CHECK_URI = "https://forge.rust-lang.org/infra/other-installation-methods.html"
 UPSTREAM_CHECK_REGEX = "rustc-(?P<pver>\d+(\.\d+)+)-src"
+
+#CVE-2024-24576 is specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2024-24576"
-- 
2.43.0


