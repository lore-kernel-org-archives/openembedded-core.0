Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA381C54E49
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 04:33:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4954.1709699592884410657
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 20:33:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HsY92vby;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37950e620f=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4264Sf5o031527
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Mar 2024 20:33:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=RWRdfUUP+DIbsWtuRh
	N78i1KbN5XDtRHuB8CZHyCY7Y=; b=HsY92vbyOrzbp44l89Vn6XXLUakGSGivRE
	+H/AoCVik/smYuKZ76JZKc2I3lTd4RaAvl6jdjtqj8jWovDajjmzmAxxSurkwjz0
	Ch63I7MzJFvl1OoG0QriV5LxQtuCAFS40Tm3a8mVSq+zAzSTaRPUcoVvgrV6civ2
	xvllQTWnTmAg+7ZWz3J93B0ib5FU5yFlpfcyegYi3Jo8BdwvNUvVl0TsshuKv0VY
	b2Z9ygbYDecYSDVWFJoKscS8KXpmxOuacLQhE/3+EwUtBQb5/rC++3eWFe+ufk9t
	w5CVqIPLoEBr/8F5NuofmDdUMBWvOxh4zQVVusCW2l6LefJHfOiw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm38ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 20:33:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrfmWvTR2BM1VTe2GjLaiiUBPabZKNIRLp5eMq3BPt81XFWVKEwZZ+wISFyKl8FrWwd+Ms32toUOPwux557uZ88obvvFqpkD7JjmqztXmQVxRvy7pF/lwHBDXGqxPp7lOJjkZPZulySGV2aP2VVqaBrgefFKGKmmIsyR2+P3ROlb87zVYQ2VOufgp4YGzw96HG+JLqTuTAGA8slOcqwse7ZcAbtFNs4kDaMkUxzIsW6ho/BhR01jceyooQ7P0C9UYvstjjAY5ZftGtYG7X/OijCFC//r0xt7niv/0IEFY7cne6x6O0fMzfkH5RuTe6rq9HQlBlTTaBFr9kA1AWgG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWRdfUUP+DIbsWtuRhN78i1KbN5XDtRHuB8CZHyCY7Y=;
 b=Z/0wL/+xERymSPLATQPAAzGDCIginsVmYUgIhJCjcnxEFG9F6Fk272nLvi8W1NR+UIT/NIJ9RJ+kHwoh6zbuDCs2r8+Q1Ad6pzwdbNxCbkaTxRFIWs1rcOe8i1qxJguZC29/yNhPl0vCZRBdBz81qTQxOgKeFBiNktWFEb1yASuPcPQAn9+xMYPQqgoC5V364VGkm5PFmbQZIAAUnvQ01d/rOVlt59q4k5rmw1MYWdMpUtSFzhaLDbvBauqhkmCcghS1gFHyfZL/8UhNOoA4/Dfq1Th/rCVjiNRFbbjKDlgO9KPxPR/14lHhgLX11ztr6CTuYPUvL3Ua+PiYDUv7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN0PR11MB6136.namprd11.prod.outlook.com (2603:10b6:208:3c8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Wed, 6 Mar
 2024 04:33:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7bce:b7a0:1830:98d0%4]) with mapi id 15.20.7339.024; Wed, 6 Mar 2024
 04:33:05 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] ovmf: set CVE_PRODUCT and CVE_VERSION
Date: Wed,  6 Mar 2024 12:32:49 +0800
Message-Id: <20240306043249.2673982-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::7) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN0PR11MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 2402134d-5fe5-4170-c764-08dc3d968416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SQ3enOWHWmUemvaHoAWv9hadyX3JKGhqePr9eR2MnBBfHkvmP7Z72l/foaTT41Yo5KJesXlmR2kel3wi6rsbH9JEhNZpJDi5gJXIGEJTWpJpLuoMwtSz8yXPhzqqidTw9CYm3NfhoLlETU3oexz7rp3X2/7/ZzeQlC+P35/IzozPT2ThSQ2OuUKx+x6fCtQNwDJrdRSf44FGAoHrM+9wBAg7TUYyN+Ab82rkKUf0yQ4VfKyj52t4lE+fgrTpfUfAb4H6pnR/RZcwAXjG/a57/VRx8yTECbczq2ZO1f+1DZUKtNaOQAK9VLo4lkWe341SRKPWmolJ+eMsI+ys91UoAVsOokEGKMmDMTH1SMDa3A9N+MnvrRFvaDKMwTlXJEJtNz7EmzeGZVawOJDCNHMYy9xh4wXZcJ1xfZyW5GYAkYPJRUhAR8ImX5IiEeYqc9WBoL9GQwlF3a70zs98QArIfGh6LKYMQtIGul7xMY57cwliwemIPNPR3FaOA/MKwo5i40YvAalIwxj/84GQtgzErNH1S7Ek6YupIyqXYcd8xbx0eAVt/wuGYwKCCYKpaYCCvxjfDdAxWOdSQiXMVNLwptGh7qryv0e9Gc2IbjN6SXkoPyogSg0SM1VsAzCG4ns1sfkdVeQoFzrmQaykLFYrQinPGorBBNr5sB57cNbjFXA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w3Y7gUXZW8BMxm5zc0xkM4tGKA13n8Kol7ph094N626xQt+TFtsINwWYF2FR?=
 =?us-ascii?Q?lIpx46GHS7UAc7u8LBIF91rFXcEbnCR2DUWnh93UZTSu/NwzdtnyKe5qdsPJ?=
 =?us-ascii?Q?bgNoCC9bLNanj1iXy/KLLoCPM4aaw9kuNgggjFm+g6bGS4pFtgZLInZFBERb?=
 =?us-ascii?Q?3nAmZrK6Jlr6QL0DyEOLHKcyQ5T3alCP8Upeha3V8nQM3Da0E7Rvu3/NyTVQ?=
 =?us-ascii?Q?YGHB1AMpTp9tEuNA8pWU8bNjajcJZAMms4pndJY9ODevTNE1rNgsS7W4sIY3?=
 =?us-ascii?Q?iA+KwmqDjwdUmcW22Dsyjz1OVDOd/QR6mGBJAGm+bkwXEimQX/MHE7gQ1FIe?=
 =?us-ascii?Q?MUqEaaJW+xO0aJXxwNwHw7l5AWMcSBO1M7Pc18naVUOVmVR/Lv3eFLJzJz/r?=
 =?us-ascii?Q?X8XrRmQSf8eUDTgyQKlMkD8HyBSgG74W6gNQJy4XVLFNpqav8WCC8cyQv3Po?=
 =?us-ascii?Q?ADg87dF/9Wgbdyrf/9dLrdHQH7BHVObP5LWhbZ96ZnJBgSW+PWeXHI8SfB/h?=
 =?us-ascii?Q?txklv5HnQmFVZ/o+2Pwadcu4BysfcUnmtQeqPKdEs3VmeJAQN8FZNzNIQs7y?=
 =?us-ascii?Q?rF9KlEHHvblt/v0CH6r9nMTbvoAV13knBl6Y43UQTXii2Oo7tEPfl94rp6RZ?=
 =?us-ascii?Q?Xi11wCD8eg5V1x75skPg9zT4MeYxuhMpG4da7r4qqP1mGE5uM2FPdSqprx3w?=
 =?us-ascii?Q?G6ABbEL/0VlOYhbjS4ZhSdFMB3KIFDs7rxht2rJNFbHOyq95wW786FDIZUzr?=
 =?us-ascii?Q?lBbI9qvCRnyETtSx0R+8QpFkGL2mlx5XFXlH7TlwymFm51/227LiZ5EfPT8e?=
 =?us-ascii?Q?41YNUqXBRLi/hHvm32hffvraPkYN7dOiQi3ShCbFGMuzooIjWHXEIjP0UqtY?=
 =?us-ascii?Q?oPqJP+ffU0PShecQmHMOFk/Y+UaYQLXwhI7r6/udW9Y4+5It0lO49eZjxBCQ?=
 =?us-ascii?Q?7X4XZQH5Zm6yYsUHDLzvJV4i88ifnRNlOru65EKF+I0RnYAdhslSgQfVMMFg?=
 =?us-ascii?Q?LkaSLIGe3KfsiOBDmIo8+fUAGup9YM/UFllR2YNfXJq5FqNe6g9L4D9rWnIt?=
 =?us-ascii?Q?kg/m9nD/n8iNhry5nHWF2or3NQLpUAytOC4KqghdwXa7nMb2cgWrTvYaBnur?=
 =?us-ascii?Q?RTpEOm0rZvMr9A4r34iGhOOAA/5ZuKA7e6EEt3pL53QehNM5boi/MHSjdkfb?=
 =?us-ascii?Q?X9QPpS2wjntPy0h3JcpmcyIK+AMLYPHTMCniNrvMdjpLv7UC19e+LdVPTpFX?=
 =?us-ascii?Q?PiX230vs0tbPQ7rWn9DRxTtTWQTNWLx8bSB7cy167NBLpWlnX14g4HtyMiFf?=
 =?us-ascii?Q?mu8TGnKXanAhQux5kUx9Wseacb2j0M3IiSlU12tWr8mbg3lKX80XQJOOOXtk?=
 =?us-ascii?Q?Lyd9XGeDAsnt3eIGmZNPP6pMiIuCubaLpvTQJW0vZNbPrrXmInN5yoVuUEz1?=
 =?us-ascii?Q?IcRMlvPH5s+sY76wd3qCbNbymzORbe1L4tTZdx5f/xDC8TdT949sxdcrLR78?=
 =?us-ascii?Q?NzB26etLkAcKkPGTY77+cecgdjB++49w7QNUkeFA7jxsUI3ICkng1NOduoYA?=
 =?us-ascii?Q?Cg8PgRrd8Lw4Jt2yApI0ODA11fZq6Y3hckRXg/6D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2402134d-5fe5-4170-c764-08dc3d968416
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 04:33:05.2871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9CpFv+KQlHHqy+hxrq3OU7ug4oQ9CWFysBrEeUT7i/51yfILKX14SsL6ZfwsmvyaIRStU5w/K4vUj2aSnCUNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6136
X-Proofpoint-ORIG-GUID: xEwzgojeQ5p5qsu_lFFYjzP7PyySq4fS
X-Proofpoint-GUID: xEwzgojeQ5p5qsu_lFFYjzP7PyySq4fS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-06_01,2024-03-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=747 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403060034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196657

From: Chen Qi <Qi.Chen@windriver.com>

Set CVE_PRODUCT and CVE_VERSION for ovmf. NVD uses 'edk2' and the
version should be the date only. Here's an example:
https://nvd.nist.gov/vuln/detail/CVE-2023-45232

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 3dc031d3b6..6931536229 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -30,6 +30,9 @@ PV = "edk2-stable202308"
 SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
 
+CVE_PRODUCT = "edk2"
+CVE_VERSION = "202308"
+
 inherit deploy
 
 PARALLEL_MAKE = ""
-- 
2.34.1


