Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6412C02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 13:49:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.49151.1737035332538326116
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 05:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=311185faaa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GCwQGF011003
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 13:48:51 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2043.outbound.protection.outlook.com [104.47.51.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 446wf7ga9d-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 13:48:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmUV4a0DomCBnLHyutJlTa3a45TFZmmhB6y9r5J+vy8MrgH45noAnG1awLAaBwEGQS8SKOKzXDOmss7tOc5zpczL9m/dFnbsECJb+t3HS5+5P+QPTNVt1G882WqTU1oWeF+nykfC4nNWga/rsRUUcFzHjuqkMRRJDTYG/Vfu+oQMMp4FDa2SMLaqJXmLIiRESZ2qevWp/HCEmYa7DzvahMc9RVp8zGkU6RYsp53z+K3cHalmKThf89TMlF79ib74Emdx4TutvKtxGjsfNO9fask07WUNo7+O3YSIPQqePlvpHcmqRRzstZssPdFxL9YRdClOlhzhhzi/CA38/AHalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfrNexBnwo3KfamhR1JYabxj7KFILkxK5u+5JWsNt/Y=;
 b=JDIMHGRgZ8uC4mySioqkvoZUgbsoZO+2ArCH+fojvAbW8OutSWCh/EjolYhjqcke4kSYVKsnFpNbT9RYpagz094grxwBSqKRVqbAH76uY7vXaKxaPJ2wkjzhvujV6b+ouSNXfUFK30o8NtqBOTJJ2DNBawHC9/fX2vX6Ev3ihJHbQbAwwhhVD0/TvEWV2RRj19deYdN8BWZMp9HxVYtzzYwXdTkJxbpZX8Xli3d9DSBjdgke9Mv3fIDfrZblqWnf20RW1f6BLSwRBAh4x1z1sLKMh5o27nv+2V45f3XTbSnG1crXRyvo4gz7Sp2cyokPROOm+vyc11UxUmzwyJPl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CY8PR11MB7292.namprd11.prod.outlook.com (2603:10b6:930:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 13:48:50 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:48:50 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH V2 2/2] oeqa/sdk/context: fix for gtk3 test failure during do_testsdk
Date: Thu, 16 Jan 2025 05:48:32 -0800
Message-ID: <20250116134833.1838212-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116134833.1838212-1-Harish.Sadineni@windriver.com>
References: <20250116134833.1838212-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CY8PR11MB7292:EE_
X-MS-Office365-Filtering-Correlation-Id: 565f0fa8-96d0-43ca-18fb-08dd363481e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/ToYKEoUQOKxe0hDEXHfD8FZncFyN2JfPEqF/EflIUzl9Bx40C4Bq7AUTknL?=
 =?us-ascii?Q?DfIJvqRrqHiyJNBvg9ZUU6VZRWLbFbg8kKetVUsQ4099VomWhGd6u7pDZd+P?=
 =?us-ascii?Q?Y5JG3cVrbi5Dkmf1AsXKVUVEVytkbNHawghZ1t4TAbH4oChx/uiS/j4vnXAl?=
 =?us-ascii?Q?OBbCgvoNBepHOU8zt6Io1+ZaaeMYQuqQLRhiDebCujARiDgo3WAc+wSqeaF1?=
 =?us-ascii?Q?06bpW3xupQofx2jIlJRYh26Le8HIoB+BP/nj68tBihlDnFmvJI+gAOwF6QuQ?=
 =?us-ascii?Q?oA6OIZGtCOjjyg4ctSfBZaeqEjbsxVJlMSoPe+BHYulCwNiBS08SYYqkOzCG?=
 =?us-ascii?Q?GPSgnrUXFZgB7D2cnn5r4MzmGPUliX50PcxSq2zsx3saI2/k6JawRbG9GzNl?=
 =?us-ascii?Q?4mHSJ2CCUziT/eRILVF4Q+hITqvrLS6FIZipYNKZ5OZGdBgpklbVgYPjjQ5B?=
 =?us-ascii?Q?b/G1iBbvT0+TfsD40FZiEueluHzHIe9HRtiaH13eWiw6gUHrlj+pwEN7ET9t?=
 =?us-ascii?Q?lK6BsJQSGtHQBpoLMi35gxb0/ur1vNRRGaOcpYPBJvOJ8h2DwiciesYvf/ak?=
 =?us-ascii?Q?em6xywbQtqiHuJ+0oNvUOyiJd+4e9BTHDVeakQ6y+XLtgva0+Ne078Ekkjo0?=
 =?us-ascii?Q?penluEjnXN4zNwtL3Wp4RJfgM3dMr1/qqqDp3JuhT+Y/E36Kgie9kO3fPf8t?=
 =?us-ascii?Q?Bus2iyXix8nus13CyiUfd30BGhrJ5SV3GpPjerchl4l/Fm59cynfq++qdLhr?=
 =?us-ascii?Q?594FXsxzSl4W7Zv0Av0Wdnw/uwbPia54mJlzIWbQfkDa8P79yd9CYpVdVKdB?=
 =?us-ascii?Q?gzVZuNnuy1k/kx2vujvA4peSSMTjJvDLqQ5RQb1dDuN236pRlgHkbaqYogX2?=
 =?us-ascii?Q?L/5MZhauEkFNlQezy80i7K1Ndutsn70tIWsmUiHXdMZwJ7VxFp/RmoNIDfuX?=
 =?us-ascii?Q?vHAnxldZ7XG5iKDoyrm9Q61CMY5Wek5cs2WLENlS0Nia5ePTeXDEdh9Go/VD?=
 =?us-ascii?Q?2K9mz1ZsFhla/N5YuClX8qqcP36xls6B6oNSeafJYSCNYFrYxv2yu/rgLPnV?=
 =?us-ascii?Q?ChpUat7H7K8clWfwCDBWxqXj1d3TWxgbyxVHAeknTkhb7MhOmDzIM0w1/eFL?=
 =?us-ascii?Q?d3BAYrXinrY7TqUv4k4C1JmhNEQwq/7ebtL71CFMx+eCIftrt8SIq3J24DBL?=
 =?us-ascii?Q?yBqU7Ke68PC29DR+NJNvPWlqpfkBCHFSmGsjeCzwXhmaloex8+mID1h2tBP+?=
 =?us-ascii?Q?vyEC2MOYkJgOBbCg5X97eZz4IoJkMALofVeuJZgFZVFQfnf0KVVd/YjNcYrn?=
 =?us-ascii?Q?aKODn7oI9hb1sXhcsgEP78OBaxPYOryfA6hFbjP1JqUFp4glENpTqYO7Bzes?=
 =?us-ascii?Q?82srfDj8KPkt+QM83tNn620dNcUzb6a0da63ybmSFxl1JBeo2fCVBi3ezro0?=
 =?us-ascii?Q?BzLn7Q7E8d+NsFK0bHdvPvzEtreKc9UO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P0QkyUgTBdGuG59xxiHJjhvXY7AGf087ZNXzktHjW3VhlOzaKZR7hDiwJwX9?=
 =?us-ascii?Q?PBocmghiYiaB4XSOk0EW6bZ3s2mwrd+xkMDRWR/3rjz9sE7+qQqALIxnUlNS?=
 =?us-ascii?Q?HTlz5yudZY+H9Jq1YaiLiviItT+q7P9j+ijCS0MQWDSFpNV4B2Tv6BfMWZjS?=
 =?us-ascii?Q?B5+SOtzrrphzwIUhmNi8P/ZwZsHsqPf2NZKXBlaB/hGVWdKit8RruxeiFmjB?=
 =?us-ascii?Q?tpi2QeBC5lxMK/NrdkrzZvyRzOVIwAalzzOXSf+NXaxWP8R0w6a61rYvCfTH?=
 =?us-ascii?Q?lPn777nmEeRuzlvtBJjLw9FvhX0kjxAsgenoVEXvPfZIPCTdFvqOMhu1jfUY?=
 =?us-ascii?Q?SJBhpmnR4VPOqJcd4m4X3KGh9RZK1G3MiNi+dggfFhqEackMFIXabenS98m3?=
 =?us-ascii?Q?zgMPI6IUtGmvWBcnNPu8nWd1e3Gs6Ahg16qIRi4YqxzQDZfeqgXsgPiGA0d9?=
 =?us-ascii?Q?+bxs+YEl9g32O0n36/1qXCVd3euq7zYaMNlpVFAv/1bXjEH7049v0sL3MZcD?=
 =?us-ascii?Q?QaZZS1Af1w7sKlI5LZABGwxEm06SWxYtI/S3fxpbS4i7TYz73BNOYmJOQb4S?=
 =?us-ascii?Q?oAo9Uix/xZqJMXKwdbNzWa/YXBiLnV07418ZbLI4UXlKCRZtp3q9ofPyN05r?=
 =?us-ascii?Q?feLw1bZiYMFy0OgXP+m5aDnQc/HunJ+Tg1L9HsiyL25sydSuQyWppGZFlIYZ?=
 =?us-ascii?Q?7DhkZ0Ij2eCpFWdkrS7bxlnNq+p+2syaxL3n42e+ljX5kzkon2rT8KC07wC7?=
 =?us-ascii?Q?OSl0EuYkRUwXASir7zHwY75MEcSsPhDS0MFqZ66kN8rnrsjec7JvSOXdPnGx?=
 =?us-ascii?Q?Um9pkCrZu9CDCMnGZOHcdBAM5uWyeAImOk5TApo2vshxe0PSSlAqn4VR2Yws?=
 =?us-ascii?Q?CeAqpqVCsMg1Ja5HIS4khhMQaojxHKXYOHhYDX4vHJTt3xDyUdFnspLcpn2U?=
 =?us-ascii?Q?v63jWQinw5GpAkrHjUyZHIdHUdXToTAhO6yWDAhndzykEhhrbD+HiKbvywMf?=
 =?us-ascii?Q?3yLGaTgW56vWALiQ45HZCIGcu3kXTXw5E6XK4ah0wiTZ3/FFH1kSBWtAyIER?=
 =?us-ascii?Q?m9363UFpXE7tv7xpCLYtr3INcRrJVjXzKrHP2ReI2bTdK72mB94qZvX8cpMZ?=
 =?us-ascii?Q?JMMJH9QofFzrYy9/Y08BKUAUyOy0Ng7dvEOFv5UFxKNIIYny/Mgk4mdLexGV?=
 =?us-ascii?Q?0e60qAYc9y4Tk6XogS8BT/6SIvavt04BFAcpeDpqExHk73739yD6Bv+z3lZC?=
 =?us-ascii?Q?c2Z3bCFkGCA7XuJ0yZ/FdyIG25dY6uPTUUpW7idZo1Fjgkr1AeWcME9XxsXb?=
 =?us-ascii?Q?P3V0gLV7nOl6mDmjTq5N9COGYKk65l5SGNFRPhLpq/BS5nLiumEoRHmtFKhX?=
 =?us-ascii?Q?nx30PB9FYJBcEM8U7Zk5ggaAO/zL9nPyBBaphauYhxCU4z6y3GgBW3df8dDz?=
 =?us-ascii?Q?2WUjHl0WiUlZSl+C5S6pcWVy/MXacv/R78n5VpemXzKEKCrImmjOKEpI+u5J?=
 =?us-ascii?Q?btPTyPCNGppXMZNlRfM/8NHAGfxHzewHYXlCgs5LjEqV+vdVGZ9uGYx0hC8z?=
 =?us-ascii?Q?pa0WYZjPgX76rCsxMopadl1kxWi0EGTJVpn53OBQq54BlHOQlF9F+y4V7k+W?=
 =?us-ascii?Q?LfZYDh1YOZEpPBIgrY5oWZY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 565f0fa8-96d0-43ca-18fb-08dd363481e2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:48:50.2971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkZUcmgqFlF8T5Wl/ACROBBSOClNo78bHadaWJKO6eF+1c2maxf2gwnCSgqPcytjZ3W6O9m/a/SjjQoQLGJZm2Mvvi40pnDb7SvSxEbL3Yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7292
X-Proofpoint-ORIG-GUID: wAiDMMjANSo5Onk0R-YnmJj-u9hWprYW
X-Authority-Analysis: v=2.4 cv=X8moKHTe c=1 sm=1 tr=0 ts=67890e43 cx=c_pps a=BUR/PSeFfUFfX8a0VQYRdg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=XWm-v3C9gP5u2F3pDpUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wAiDMMjANSo5Onk0R-YnmJj-u9hWprYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 13:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209948

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The do_testsdk for lib32-core-image-sato aborts with below error:
configure: error: Package requirements (gtk+-3.0) were not met:
No package 'gtk+-3.0' found
Consider adjusting the PKG_CONFIG_PATH environment variable if you installed software in a non-standard prefix.

This cuases due to an absolute path name in 'sdk_env', which is now stripped to have only the environment name.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/sdk/context.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 01c38c24e6..77e6a98f39 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -41,11 +41,13 @@ class OESDKTestContext(OETestContext):
 
     def hasTargetPackage(self, pkg, multilib=False, regex=False):
         if multilib:
-            # match multilib according to sdk_env
-            mls = self.td.get('MULTILIB_VARIANTS', '').split()
-            for ml in mls:
-                if ('ml'+ml) in self.sdk_env:
-                    pkg = ml + '-' + pkg
+            stripped_sdk_env = os.path.basename(self.sdk_env)
+            if stripped_sdk_env.startswith('environment-setup-'):
+                # match multilib according to sdk_env
+                mls = self.td.get('MULTILIB_VARIANTS', '').split()
+                for ml in mls:
+                    if ('ml'+ml) in stripped_sdk_env:
+                        pkg = ml + '-' + pkg
         return self._hasPackage(self.target_pkg_manifest, pkg, regex=regex)
 
 class OESDKTestContextExecutor(OETestContextExecutor):
-- 
2.43.0


