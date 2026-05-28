Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509C1CD5BD0
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 01:27:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1818.1779931642705657375
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 18:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oT2kAxGR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96084cca59=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64RNu9vA551772
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 18:27:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7YJDlbNelM5CqqrGyGT+
	OP32PTZu+4zTdsOoIL1sgNM=; b=oT2kAxGRoLvUcH9ISMwV6WkbG5Sdh28NoiQA
	rhLo0BG443yK7CiTWFEuqpRxH7BTAmGhl+Jw/KwYHP2xmxoMzogdUaqR2Cyf3s8A
	/pNfY2+EaysVQ+sbuxozA5yOG0pO/kMybPlklH24bRM1zqqX1JDyr3fvncjNtdRW
	zDc0YIZXdgirmpMxRNct5vbTXw14gSqVyZA2WFYdTJPSQvOq1yq6E9SigJQ10dtC
	Wt50UrKzMPDnw4DdZmWTvxTtGW6Le4XWi9zs5unlrCf/S082mzvOa3irocRqM+24
	a6fuY4SMruMCIhPP9FAhVnnLsForPg9NX+ag3k3fUgYK550mVQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012003.outbound.protection.outlook.com [40.93.195.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6r6pa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 18:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDVHaBCqR4/92BMRe2pXYlcr2kH86PKBH/yQjSRiw+JAxMquULP4iL2O0zSNOg8p/NvdA1XO/QitWmTNXKjvh33dv+1TuhL3q7gHb5p91fUE8Hty9uzrJB/uqKK+iliJwWZRAHEB1D/xIj1nJrJB2rMA90RRaPmaO3HD+ooVY7Gy033xTGohPzPMTijzKoRjvIxbX1GuCYqRyEmX98hmX6fLUKWnEaEqaQbAEJnRilyzP31PmWBNITUuYa20mN4vSm2AgytYBsAi9EFlzNNOyFpfwIMTKH58YSGOO6I8I0cflGqTpSGz/XndzoS31U69hbOuOTvNs+MCDVD9NRXXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7YJDlbNelM5CqqrGyGT+OP32PTZu+4zTdsOoIL1sgNM=;
 b=tVwrQ6F12Va4BS7rXnq9DzVS0TNvGOcBvlFxqCs3Dt0wFwZAwMgKlYcSWFe8KGN5cSHowGErx0gnTsNpSZohWxYDYE5jYTVkm1jmfKx/f79BNbfEaXY3A+aoixpNr3veVagILbt6bcZy8L5X33OLWvLIYpOTbb0/UMtoB+ZSkdKz9ReMlekezZi2Q2bO/QqTRkwbIAbcjbG8VAv1NWmNv7K8ymW3WdRLkwewVrDZQfi/fTDbsh+LmmlLznGpcQRWYqYzGxaC3Gs4v/BcU5s12E/9hC3xKZXIpjCgKG/ypiizMszOkJAwmYqQFi1yRNukdJdoCO5ppRP4w4Je8R5gTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 01:27:19 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%5]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 01:27:18 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] subversion: fix svn-revision.txt conflict when building for qemux86-64
Date: Thu, 28 May 2026 09:27:01 +0800
Message-ID: <20260528012701.1834030-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0190.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::15) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA1PR11MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: bd05ae11-1cb8-4226-deb4-08debc58421c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|18002099003|38350700014|3023799007|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	DeftLCD/OAU3HBGUmi6KfFmRwOeMQh8ehiE+lSyHetiqzUAsWF48ARZ7RczBVWqdaEAP9hT9yelgXUWHbK2HWL/OFtsBn3ZUVlB/QWJI6FBfpG5z2ffTZQEM8BM4ADstVRCAkLjeaLD2QLP0fxlLqXkWItXVHIC8E/s4+fpKr4xauiZdaVfyJCtnikmYwfwGV7S9LmuwkP0z8QZKPuLa4OfE2xlLRrV0VOnvAQd9ltepFx7Y6suCEUW5q7+UUpdqXj9fJax70ClrJ0s97xjXkizXlCvqXg8YicvYx0ocjltCte2df/0OqL3mb3LayBu5aNTkSv7uMwv5LUjUlIyxuO1jtAoNzO03/r4p5Ghz4tIKHwgqo5/MdlS+3U3o2vOYdX6PUjSDhUthNzw8BNU7zlTdMWQiyx0qWwn7SJ13dRQcfN95xNj4eavNv8abCTaKBrYU1q3h+fHhl76dJDYZFzDwVdHFmK2K1YkksDBLbvOgck3y2jq7VaeP/VEG4tKxN6xPmEHkTdSgdX6R6sECoGnI7I0697XMdZEh+SpiiwcTBUZWj49uS3OJvmCoMaRueN+5hW/wdettYOQMmzRHzhxo1I/91Pzzk5yg2Pi+LjoEbDR/Zi4ORwcf+bZRiKz3aimkLCoTz195EUonO5h70jPEKbKkW8ugxg8LJQRTw/gch4cLH3HxVfDvOHQp1WeZBoBaL9YEGnFdVxID0N4bWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(18002099003)(38350700014)(3023799007)(56012099006)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q5lxfDG6Tu/gx0Ulggh+wzf3D9wFCs4SwDWniLY9Gh/TpiAy7dTYf4mVy3JX?=
 =?us-ascii?Q?TjJkq65hgvfGjwkR53q7PO1E9XaSnexHbUW6eZCGZvqOzkPVwpEwkL6y5nHO?=
 =?us-ascii?Q?gSfjCx2S4SFe/ZI2a+2P/IBVfYzBrGTXsR2u1WL/w641tWRtkycPZ0yU1W3f?=
 =?us-ascii?Q?07Y+1sRp2FJOUOKlz9RdhLHveiNRR9Tnq21riRNSUFlMDt4J3kMugSNga+pK?=
 =?us-ascii?Q?jEs2C6CQTwce1y97ZYaAMbqskn09h3qRbA6iz8gocxy5mtPUqsG9re2YmKWK?=
 =?us-ascii?Q?1905Nl4Jh4/QZGGl46NzKIefneFzoRrQtzCioK//zPW2eki5JUYeD7MX8+nV?=
 =?us-ascii?Q?Mf4aKMQ/JRipknzC99Ko5bJlaXq+s2IwjZxOiR8mC9WZ6reN3HTlUJcNCK+1?=
 =?us-ascii?Q?7MyPnDoQGWkhKWih5Lbvx3LsZY37A3VanrJx8CXMGjuBdrIIHbHMtlERvMh3?=
 =?us-ascii?Q?uXxxbF+A5++6Ep3Uq4nIMbMlKaxdEAaWLe4beOEHdJTzMmr9rfU28tF1oRhG?=
 =?us-ascii?Q?yZWvAFdCONOjyQzg6CEswHUMU/iBBpbMYJMGDrF/FHtzhOB92KQq2H79njl9?=
 =?us-ascii?Q?MKl6H9h0351kPMnuH/YP/piJcwtnzneOXRTwglwDcpSH2L5loG6foByl/iEH?=
 =?us-ascii?Q?Pe/+LydCCwxHVsf8MjaurepFhcSRvfTZk8Z00kERb+HNOeQ1fXmFMuHxlaoc?=
 =?us-ascii?Q?3NFOJcFFPZZbT5+0qN4CmiKhHW5cpMYeSVACQdJIOKVS1QJwv/evPPxOJU5m?=
 =?us-ascii?Q?Tw6NhC6j31mm+aXXrPg+kq3LfQD/Btm1ufwq7oQMYG7T/HDfva1N9v+5DojO?=
 =?us-ascii?Q?+8qSFWNKuUyy19SYeUdrciSXALufs57Ox2NPSoo55PhIVWJUEM2CL+oR0HNI?=
 =?us-ascii?Q?1M/pck0DvzCWJNbjwC2Pg0DJTl6H2W1+N/w6GOpyE2CFSkOg/AAQZpZ2xCKU?=
 =?us-ascii?Q?wJQ0yNzOGMwgr5t8/9/m/z0VQWSdyqMxhjQPebNT32UqQVkrSvw/io9rW2fP?=
 =?us-ascii?Q?Kikc/vN8RCqGqmwn/6KWnokJCIAXSFBJCjnFGrxwe/IWvRqTPT4X5vp2X3Td?=
 =?us-ascii?Q?MINrQ7d1afkwI/nyonB8S0OhmQG2BLAKI0ZCWYfJODqtDr6QlmoBxDi6jk3Y?=
 =?us-ascii?Q?4mOy+mUhGMEng9IW0H9YBCjbjpMZxYBiwJDphbIKAXAfuRgkxK/RGEfDpoLp?=
 =?us-ascii?Q?bTw+xJAvJWd4wEuf0M4BPtFd4849rjeKo40t8n/emGkoZWweLFnpCP2HnNvf?=
 =?us-ascii?Q?JXLvP9o3SAM+oxowFzNN63jGj+jjqeRKkc1aRqUem7H7mJJxjNsNEStKagsy?=
 =?us-ascii?Q?HdTSP3bMvWDOKB8wWbLE9v5mI5BOwRYdOVxXfN+Jc/89J2jLcHF3x6olj+qI?=
 =?us-ascii?Q?BmawUUS/34/5FnD4fKV95zXEJaTJCpny3gkOnnG5nKTmA4xD5H2AbXCuiBO2?=
 =?us-ascii?Q?9+MqWEt76qp4Lg5RJcQuTYVCw3yXaLcwOrQzBTL0pO9cpFqd4+q5rfjzWnpa?=
 =?us-ascii?Q?ojA7W4SOfmEv9MJ73NOisIdjhscn3g94HwkRqW/puD8JW2cmdQTtvpiFAGmN?=
 =?us-ascii?Q?kcbgjQGH6U9AbmcYPMXrnbPWhS4zDONyDMmtNYQq6DbYQlWTwVi0n+tF7Nz3?=
 =?us-ascii?Q?vEifoWB0zVIpmH925dFibzCBVOBiXL+eRUEx5MdMP/u7N34O87A9OiQ4uGv7?=
 =?us-ascii?Q?EUE2Chni8TIzqV+AE73oZTHXTLi96IUdeNZtvu/PH2WWQTf1IjXZNSIO121d?=
 =?us-ascii?Q?5xobQqPaVnAVv0HSbfZNInq4bhOJKQU=3D?=
X-Exchange-RoutingPolicyChecked: 
	PiuSPVdi0ades9LUksXdZyyamIfB9Oc1IW/MpaypIyjRvjIMV6tAxLwtil2gxMF/yVIlxMFBz/b7DqXrrG5wGI0ObYfft7B7NNNOtOv5hafjHHv50+WuJL4Gb7+YCzNbnAlcFTE+nXKZwgQwkwLlSaSG5mVjgPYEGGr+zGc5HXvyJLNqHM/XWBrH6MytYKCvhBHktvn3CjmMR9yxKkp29zy1BgXKZIWktuGcbzWp3oOjciZK6I7RZAb7000U1KFv3mdPf2E1e/ppxhKJ+FcL0NatP9xDbKp44ie3oE67AJ5IXQxQtForR0s4O3L7U6wLkj15t6aOD8+nG6CpuOS9nw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd05ae11-1cb8-4226-deb4-08debc58421c
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 01:27:18.8091
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Ia7Htea9Xa5Hx1UyI/wI3+S7GPow8rakUIcI4zQdfGjAmGlh8fqRcO1/X1hy1lp0vxbbOnfo1vK0tTsRqFzvSglFiHn+GaMmBWMIB1Rp9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8280
X-Proofpoint-GUID: -CdRKecCohVlB8kN2AfHWO7lPlDwX6vp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDAxMSBTYWx0ZWRfX+z2uHM741lVl
 BE4QxBFoAIYv2tO/EryEUlaai/CVvK4W1hQpsHiThQdbWi4VXQNg3nXC/30pK1+lk3B228yRJ27
 N64XIaO3ul9CUisB09jl5YrNzO1eSlq3TDM8tSFfEfym4WLt0fZnyBZv2W11K9xAasaasAZTvfY
 qX4v0P+Kdxh0z7wQChciZRDklrgWa5fJDg0leqSu3a26iGrDDpgzXLeqNR2sZV33ozrsHwz7UJ7
 tK+QnsIRSzIhzlCYi1z752SNPsMLX28Rh8SxAICHQZIZin3Wz2VkPQ0PETc4EUvEsPUuumDkyBw
 QiZngPBlQW9Gy71z6n0QBjPSsl8AFIlQxVFskuvv3LVG8zBmmJ1ycdSGzj94SZNfuGGX1tJjo8+
 Po/8foVBwGmrOkpEv5bu8S5lvsoIZooFL/Q48f/oyOqbx0U8Mu6HIK6hS6Tcyz7NEfxvmwiVbht
 PHOdrNforKzWZDK2Bjw==
X-Proofpoint-ORIG-GUID: -CdRKecCohVlB8kN2AfHWO7lPlDwX6vp
X-Authority-Analysis: v=2.4 cv=FcEHAp+6 c=1 sm=1 tr=0 ts=6a1799fa cx=c_pps
 a=4HEXQ/P5pkaUFkQJdDnQHg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Vt2AcnKqAAAA:8
 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=N5C7i6JgP_lGezvsZWMA:9
 a=v10HlyRyNeVhbzM4Lqgd:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 01:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237676

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

The revision-install target in Makefile.in generates svn-revision.txt
by first trying to run the cross-compiled svnversion binary on the host.
When the target architecture is x86-64 (same as the build host), the
cross-compiled binary can execute on the host. If the host has libapr1
installed, the 64-bit svnversion succeeds and outputs "Unversioned
directory", while the 32-bit (lib32) binary lacks the 32-bit libapr1
and fails, falling back to "unknown". The differing content causes an
RPM file conflict on /usr/include/subversion-1/svn-revision.txt when
lib32-subversion-dev and subversion-dev are installed together in
do_rootfs.

This does not affect non-x86-64 targets (e.g. ARM) because the
cross-compiled binary cannot execute on the x86-64 host, so both
64-bit and 32-bit builds fall through to the same fallback.

Since the source is a release tarball with no SVN metadata, the correct
value is always "unknown". Fix by patching Makefile.in to skip the
svnversion invocations entirely.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...-fix-svn-revision-host-contamination.patch | 44 +++++++++++++++++++
 .../subversion/subversion_1.14.5.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch

diff --git a/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
new file mode 100644
index 000000000000..9d5959c1276f
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/0001-fix-svn-revision-host-contamination.patch
@@ -0,0 +1,44 @@
+From 7e9e67b22a711e96739a74a06ef36ce4aa370a18 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Thu, 28 May 2026 09:20:59 +0800
+Subject: [PATCH] build: do not run svnversion during install
+
+The revision-install target generates svn-revision.txt by first trying
+to run the cross-compiled svnversion binary on the host. When the target
+architecture is x86-64 (same as the build host), the cross-compiled
+binary can execute on the host. If the host has libapr1 installed, the
+64-bit svnversion succeeds and outputs "Unversioned directory", while
+the 32-bit (lib32) binary lacks the 32-bit libapr1 and fails, falling
+back to "unknown". The differing content causes an RPM file conflict
+when lib32-subversion-dev and subversion-dev are installed together.
+
+Since the source is a release tarball with no SVN metadata, the correct
+value is always "unknown". Skip the svnversion invocations entirely.
+
+Upstream-Status: Inappropriate [issue reported at
+https://www.mail-archive.com/users@subversion.apache.org/msg30267.html]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ Makefile.in | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 7f0a37dd9a9b..914c1c37790c 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -499,10 +499,7 @@ local-install: @INSTALL_RULES@
+ revision-install:
+ 	test -d $(DESTDIR)$(includedir)/subversion-1 || \
+ 	  $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
+-	(subversion/svnversion/svnversion $(top_srcdir) 2> /dev/null ||  \
+-	 svnversion $(top_srcdir) 2> /dev/null ||                        \
+-	 echo "unknown";                                                 \
+-	) > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
++	echo "unknown" > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
+ 
+ install-static: @INSTALL_STATIC_RULES@
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.5.bb b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
index 13bec4ad5956..05f80b3319aa 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.5.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.5.bb
@@ -11,6 +11,7 @@ DEPENDS:append:class-native = " file-replacement-native"
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://serfmacro.patch \
            file://parallel.patch \
+           file://0001-fix-svn-revision-host-contamination.patch \
            "
 
 SRC_URI[sha256sum] = "e78a29e7766b8b7b354497d08f71a55641abc53675ce1875584781aae35644a1"
-- 
2.43.0


