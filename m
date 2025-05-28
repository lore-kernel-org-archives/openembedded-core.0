Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6762C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 08:36:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11124.1748421369195132910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 01:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7243b7192d=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S4AQIp004532
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 01:36:08 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d43p96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 01:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUHv5AJ441PiVE80jalOUBPvumtv+7Y/8+nhYQkYZcmfXAkhiFserVrtl5M1fEgJc+a7zVGNU6Ldr9pnJUrCj8QG8zbASPkp/YNKNRW3h5tD2VkN4oyYdoj6YBpLa5A2xffIkEROVbMx59/d4Z8Eps7PjSPWIKHw7VMG83ReBG6oYrMDxbF1EmOV3thtoBPlhwcmURC8f9VDq+fkEs40ZA6HtH/0lYJRxBEdjXKEONUhAVQW0hTvtIRSOTwNknzGDPBOgQOzWmdYq2iCz89oyfijKGNQM5zytWmfHXs/sHuMNzLKfp2yb5vYR6pSfvN7XU/ylsC/yAzoP3FG3WnXPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJI1F1BQ6CqTtPp8GoYE0zIg9DNkNxUg009hdVFIZ2s=;
 b=WcsTt1R2wU6VeqEmx53CTjiVUWm3DKLFFg7TBlvJL37qc5nq2EwFewmFrp6g9RbHQi0dHFuadkVo5TfuvZgH30GerPYKzgfHmg1drTsVCrS6NkQrVLoDbPYHeSrnQVVoAU2oAFONDvVVY9zCkASYBXo4FXZuGlYQTs9yWA8ne2FD72Bn+1fhWdPlXzNv60gNu9XLQ46/XXFnAuLiCNdy2ZnnMdHGRi67Q7t2C4jR0uG07izTD9bx/Y0AxF7CHGEGkjvG++q0A+8K1sUZHyMX/g/6OlYyfKhofdGMuYkQGq64o5qvCJDVbDQQOR5bZQ94AMyqqFQtS+dZmnfzLO4DCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB7407.namprd11.prod.outlook.com (2603:10b6:8:135::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 08:36:06 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 08:36:06 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][PATCH] nfs-utils: don't use signals to shut down nfs server.
Date: Wed, 28 May 2025 16:35:54 +0800
Message-Id: <20250528083554.3322125-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:403:a::36) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS0PR11MB7407:EE_
X-MS-Office365-Filtering-Correlation-Id: 858aa79a-bb68-4c69-28fd-08dd9dc2b014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mPjQAHSG0nK7vOnwk9SJoOKvMuyHvw4qkyQUduk8dY2eDTeXdqwYzTGc8UU8?=
 =?us-ascii?Q?R5JpuVdMc3vNh2FjuAUfFT3gg1ECz+9IE/TpltMxl1AyJiPTAWcjXN/h6KOH?=
 =?us-ascii?Q?0Uyvj62nVydpFzErHfvtsrTZ8EaZtATlXNvtzVfXXBVbZsKy9yjSzIlTHp+N?=
 =?us-ascii?Q?D/lrBckLXFH+0jicyg/jp9AM9rgMfomjfk3GsrUEe5cHfll0oANprEZ00ArN?=
 =?us-ascii?Q?3/+/s3Y+tOybP2frsGxI3jVL48gFGmfCoYENo3vgGSv7yBE+IclKwNcWoJl4?=
 =?us-ascii?Q?8ZfzWxfAXZua7HG1ddK6wgc3Q7Von4GHp52b9bO0U3VQ3F+hCgeH5YNS+NBY?=
 =?us-ascii?Q?mv7keeie/ASOeAesZPIcnYkdtmx5yAvoXRJnaBQnqcdzNUlZgFO6zAeqoalc?=
 =?us-ascii?Q?uJot3N4IZgmGhmRqGY6DiABz3DQJ9eTA/PkSr8t+0KevedH7EEuXTID4Xos6?=
 =?us-ascii?Q?Y928xLbmBFPOzJsJcw9lsKz7uvb2MLVe037yhR/NwTFy5i4dzIam1mnPm7P6?=
 =?us-ascii?Q?zRqvq6wtKqplPyBIfIupQGMriwo9QTUftyTeDo95Kfxjm+I0gqdFYSD2Mmye?=
 =?us-ascii?Q?EZgnGWZNwf8vzxBKm20m+/f2qMG5CSosn8j7ZKVfxRx7+qeH0Yr2SazZZ49K?=
 =?us-ascii?Q?hi5Lc1UGhF9gN0Vpnlpj5cSlLLgwlxfjGMfIH6f4qsPaB55M5l1xDV9Pd94I?=
 =?us-ascii?Q?T3VqBoYofofk3h2TLREujmupuJlSb/SyOWpKabUaq+cZtP9QPi77CFf9DURO?=
 =?us-ascii?Q?sEjEXM0jmb140/UHHey2QqoLZJSt8IkAha7SSDmF8DENIFT35brNKvHoZT4B?=
 =?us-ascii?Q?a7ltU7lSYvk28WNWSNoWdtBgdmAwke/qhKte3gW/rOL5BkYF8UzSJshaQlg/?=
 =?us-ascii?Q?ebmNKsF7DqAfSXUHfzKjp/bSTCrX4Lunc721gj6I34nplKeEd5u98HTEl8lm?=
 =?us-ascii?Q?g23D9syIRae2AQkszWxFAu4HNzFkJRr0hNHpK3OjhoE5f4wOhqqYsTmBqTf6?=
 =?us-ascii?Q?j3iXqj4VaYhc+3hOR3mnOFdbaohfsca40l8r8It4Y+k7bU9OfxOiX6iEwiZl?=
 =?us-ascii?Q?uQLiwRc28BvG+Zg0xnulY+HkipjBKgvhR0Ac94MxoDLSOVCUhSUHVBoDP6gM?=
 =?us-ascii?Q?qKhA9BtCTI/4gBSEcGAYfj39ZO1NGEhG/hR34FdfWGd+ce1EtGK9W7T44yzV?=
 =?us-ascii?Q?Awni+axxYsRlrAHnufKqv1FqmHaBpn26uFY+Kl9Z2jvBryO3ParIkNPsIAJZ?=
 =?us-ascii?Q?us+Ryi6vwEQeuZAfK3eE+KxC3FPMg0OyOJcYh3q9f8JH3czI3e4ZBd1UIv5c?=
 =?us-ascii?Q?FarKvhI2c1AhYD417L0x+4WoyKERQ8i1K/UdOPQ7WOx1s6O5wB/w5wBDR16d?=
 =?us-ascii?Q?XaVWhXCr9Q2rAAX1+NudsaYwCsD9GIPRcSUmolIULEsM1iYrf1XnpQk0Vo2S?=
 =?us-ascii?Q?pcUE8NWWYt1oTv37VMjaS3GVV20gMfHa2JmOqe9MooDy/ssu/rKfBw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB8200.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J9DCknidT7z3F9wJ7syHRBgq41Ey03ZOnQFxpWlJ3rfF9lMgYYDWq7sADBPn?=
 =?us-ascii?Q?7ZujcA20tMJJild7XlgRI/84aVORKkJNWmY6rv3cbmdQ5wLUbmGZotBuvqeR?=
 =?us-ascii?Q?D6GHI9y+DL1uefj52xpvi2bWbDXdJuer3aHs4lpKI4soUwvD7MbcX1z0Aura?=
 =?us-ascii?Q?aDvt4s0bRLIZrl08Uw1hFipY8or2cmAVH632zpYZ40v5TUpAJ+CbS2Km15BG?=
 =?us-ascii?Q?1qJ5RUEdS8u5aTJYU8ILXK0bRrt0kf01VS7j517F7tWDGaR63M2R4hV17AdE?=
 =?us-ascii?Q?a1GJ9AFsW5BNR6CyGLWUFJMIxjqSGYQwNLoZnANnZ0clXslxNeoHcDCzunjE?=
 =?us-ascii?Q?nTCloK6NWS2HNrNEh/JScaDf9hScizogB/piEWNo9fRCsrHNxviSZeq6QtoS?=
 =?us-ascii?Q?4fpgJ8q03p1+RC+E7KDZnkuNXC2rA2gLAg+4dHmO+UH8QgTrGkEj/OWUveeP?=
 =?us-ascii?Q?dQLcC99n/TpgEcOIOFvF1M2Uw+xtoIt5Ue0qw1I7bpncnWao2yWvu6TmF6Hh?=
 =?us-ascii?Q?Bpgx2MnsuiVx1Xou0C9htp10DgTnzWXEz5fTd7MAovlYVq3KJ5nmU9bbeN8s?=
 =?us-ascii?Q?mZ4ZtTIh024vuIN/aGohbMoyB0SZzyq6DZL26/4/s7RlHArBDEU53hKQBHok?=
 =?us-ascii?Q?43OBTg5Iw3+uoVGhHAuwaBcjYF96APvo4cWhOh1qJ8aKz0PAvTdjm29/jD72?=
 =?us-ascii?Q?rsFBfidi8iA4+LEy0ku9IJQheVxnskgunchIdFgJmDoFBla9kioLfI88hvTI?=
 =?us-ascii?Q?COk66DtWhqMG4rO0RuOR0P4Qj7YkAyy6JDuOGw+5D91SscpdHsuo9Itk63Wy?=
 =?us-ascii?Q?NDRJpG92tPxTBTn0f/mGkSOFV3dWV9GOp2dmv14DEpR+6t5sbKryQN1OXm+7?=
 =?us-ascii?Q?CaAHSUQ5P3oPB3YHRCPRrq4HncTljHO0OAo2Ob1TB8jbfAuJMUcVzrREkhwf?=
 =?us-ascii?Q?ZXZM0KvWpWWSZn74eoFyc+njZkb/WmugUQUwtbhyn3sKAQLiS7Km9CKNMLOl?=
 =?us-ascii?Q?YPNc3zEUAOJdNpAFUqC3VfNHE0rpRqJxfti25SGKe1i0hC3IbsmgXPgewpHS?=
 =?us-ascii?Q?bxCcwoW7pYnlO/9Zu/KK+macxe6MUmqab43/KS34nwAgjc94BgDVSIVPIO6+?=
 =?us-ascii?Q?xTOzYMqDsO1BDIyS+pQJNC9jDfKU2Y8AxQtYC/1il88Ksg2/Hys5+IuH9J80?=
 =?us-ascii?Q?oCX2lndcAupn1k4jU1EQGAs9sO2Ki/9U3cny4kfXzCg4OyHOVE4NQj7uRIl3?=
 =?us-ascii?Q?2UalHWIHXOoWNG7G9wbhIcjwlMkSqzGIkfNtq2iPAxZDX1KXBLn9e1bry6pe?=
 =?us-ascii?Q?DTlm8fniwAQm4AjTz1tulue+nTnc2NX5kwdKjDGI98iJGWMkZEdFqTS7DG1n?=
 =?us-ascii?Q?bidVCyOhh3lZJ/+Nyur99q13c+FTsVeeONhN4JNzZ/Ab/tNPmA9HfUFM+eYm?=
 =?us-ascii?Q?egRAOaX9Xr9P7Rwfqbg2mBsjxHzWwZy5uf07F0U4sV2IJJn5zhn/fWR3Xv/u?=
 =?us-ascii?Q?ieyVv9whu4SyguwTrPy545eDCnRYnDOm+pl2WuawmFKwDe3wggXCESGTfloK?=
 =?us-ascii?Q?Noyj0s5lpBBbtZlCsgR+4685RJmLWLdf3GZcmKj+L0qVT5tzg/2uipS5DB/o?=
 =?us-ascii?Q?Yw=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 858aa79a-bb68-4c69-28fd-08dd9dc2b014
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 08:36:06.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +xh7W2db2XWN5MUh2aSxKjxBcoohEiQkX8Lj+4jEnMyhS3bmcYr3FmACzgqsAm7wWq9AAu2/u1kverWISgJcSQp5iuV3gc2jTH2RN4Jhj5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7407
X-Proofpoint-GUID: 1R_8pRVSuhCI-iR4tVoeg4rrhqoJLfko
X-Proofpoint-ORIG-GUID: 1R_8pRVSuhCI-iR4tVoeg4rrhqoJLfko
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3MyBTYWx0ZWRfX6ib/L3IefmBH pYO9QTpoYUltd3SduUYAByZKd43GrXlmywwpaLBDuSb7SRRm0dMekKRm4ggdOFagW15dPSeKmFn X8lJTYuSpdm7pvOz7jntq1xu6ARMEE1aXbzr/tIVobIvwZapvg1lrVoKR957JUJ1T1q1gFNHGOW
 TPVC2R2tdbttrn1i8Wpdpj5JiuKL9gms+5/VPGuStswH1aa9oPfAyUH9HCOpF1ws2/KpSqsI4t4 FNBbD4cLOR6TlOCVmWVDUSR2duiBeWQo6CUN0x3XvMS07yHo34W7RZ4n1sIy8Og3eIwaslIjnfY TVuFz4Z5HpDyypJLSWq/il0kgOPZbcE1kBfc4YKUybS1VXw3i+onx0EMF9T2OHMmxvHX+PKXPKk
 7kINfBCy06MzYatyK/qu4DuBK7kmZIksTSGejul+JV+P6hXEDmmu2913o3g+XB17G8zU+dVF
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=6836caf8 cx=c_pps a=iNMpamO4ZYO2Dvx13ve0hg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=38rMEbfbbFn23TXZ:21 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=gbk0yKnyYj3XjN68PW4A:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505280073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:36:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217339

From: NeilBrown <neilb@suse.de>

Since Linux v2.4 it has been possible to stop all NFS server by running

   rpc.nfsd 0

i.e.  by requesting that zero threads be running.  This is preferred as
it doesn't risk killing some other process which happens to be called
"nfsd".

Since Linux v6.6 - and other stable kernels to which

  Commit: 390390240145 ("nfsd: don't allow nfsd threads to be
  signalled.")

has been backported - sending a signal no longer works to stop nfs server
threads.

This patch changes the nfsserver script to use "rpc.nfsd 0" to stop
server threads.

Signed-off-by: NeilBrown <neil@brown.name>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7b09ad289a36)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../nfs-utils/nfs-utils/nfsserver             | 28 +++----------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
index cb6c1b4d08d8..99ec280b3594 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
@@ -89,34 +89,14 @@ start_nfsd(){
 	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
 	echo done
 }
-delay_nfsd(){
-	for delay in 0 1 2 3 4 5 6 7 8 9 
-	do
-		if pidof nfsd >/dev/null
-		then
-			echo -n .
-			sleep 1
-		else
-			return 0
-		fi
-	done
-	return 1
-}
 stop_nfsd(){
-	# WARNING: this kills any process with the executable
-	# name 'nfsd'.
 	echo -n 'stopping nfsd: '
-	start-stop-daemon --stop --quiet --signal 1 --name nfsd
-	if delay_nfsd || {
-		echo failed
-		echo ' using signal 9: '
-		start-stop-daemon --stop --quiet --signal 9 --name nfsd
-		delay_nfsd
-	}
+	$NFS_NFSD 0
+	if pidof nfsd
 	then
-		echo done
-	else
 		echo failed
+	else
+		echo done
 	fi
 }
 
-- 
2.34.1


