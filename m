Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6F1C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 05:21:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4614.1743744084239410437
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 22:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61897e9266=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534501He027161
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Apr 2025 22:21:23 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2048.outbound.protection.outlook.com [104.47.57.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0r9v7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 22:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isaNhpTEYbbUukbJ9loWsvOfiCw2/8j0pHGId/99IrqyLYgdoYZiDDx3dmkuV+n0kxqFWPjT+vw5Bdkfc8RxkHzEltDurvXM5uEdUHMXUHr85+EPUbX5ajV+Nl3j1EKboqDfzCCOfgzG/45GTFOR80tYzm08w+kSScs7YG10V3spcaKSWld4Fj7uPSVkTTbAhpsO0zy/9b5LQ6Xjd2AkJomgKTua0cK3zaaoYNQIWRL4Frj1akDQ6E0ZvHBpEZZSUhLhQZEFof+BY8NJocw4+xmjDw2Ib/sasS1LtOYilUIpVBx0Eyh1FhIjAWia8F/23i7lkKsGsdbSK5ZjyER1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+r83IzCpsHgkWUIi7HG40OkAwHpKjGnoTdSsXpAiV0=;
 b=vj3Vwyaf0r5PymtkqQfaZ8T+15fcN6zlVlNf1vXEUqpWx/E7T+6KCyL397UhUO9FPPcuW+qkQ3pviJYOBElahHLmH55pfXZobv9lGuPAwGunk9X1KJjl+J4I1+47btbh8gyoDAaYhp+NugCpcwfqJ/vGbVushUge9zNWB5wP89YW8fIDvzRgaQ6xBwIHHANOYLkhSS2WBMPFucITIWXdn0y74RpC2ibcOY58xaqRddarx4Pk+tUYqJItwQsCTqlGU7Y4C940g1QyWdjASiqMCglUBQUEKdQfvfq/sceEhARy6Zry1ykGN+37jC+R3DIuOpDhcjdcO2ulbf0C9ciuxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.49; Fri, 4 Apr
 2025 05:21:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 05:21:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xinetd: use monotonic time
Date: Fri,  4 Apr 2025 13:21:06 +0800
Message-Id: <20250404052106.320043-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYXPR01CA0054.jpnprd01.prod.outlook.com
 (2603:1096:403:a::24) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b9e7eb-72cc-4f4c-54ee-08dd733888a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9mE7pXk5ejOJpK/1sFy6FDqOXvC97//RXWTLpcb9Zvq16894yYJKU5+s9MMQ?=
 =?us-ascii?Q?6rc58BeZpddTfT3ZEhEUDOqnGrNE7tx6+aZbO0UkM02XPL61Bf5s3Ca4W1Ey?=
 =?us-ascii?Q?klldq8lsOULRJdEoF0FvLj/cOykoHxJ5b5OE/pvaaO53OcV24AR+Z7FIRyeO?=
 =?us-ascii?Q?+5G/4j0ygqwXP5O5oVh3vNcQ9YJS47r3Z4FC3bNEaWna8LK3dfi93SkG0qMs?=
 =?us-ascii?Q?4h/epx71Qfq3hqdovckqibYzN42TWkRcVSbkihKJJMSwm2uTVGUshjc+U2Bk?=
 =?us-ascii?Q?QZtgexypk9d/JLPdFZSYAGdY24yO6L7+RHCaB9XQ8SaoaBWnePkaHueHZR1/?=
 =?us-ascii?Q?0tLSAoxOtNLpDYSYRUFYZ7CIIPaA0IKVfN3Pz10wr33bJFkBDUyFlIIQpF4Z?=
 =?us-ascii?Q?wE+PVZm7Eq4wMsww7QQmIkdY8jAcxf/tpU8vFEXHYDcFz+p8e216lI1XXMn/?=
 =?us-ascii?Q?Eg1vnNWlvskjK+qcsyJuW3jqVuQlAusZVciqFtl0tNmyj5wq9fsDm+OEBYiZ?=
 =?us-ascii?Q?Z/8n0oIX8pzN/KAECTb2YUkC+ay2pKgQczLFpz+GkKVV1mREFehDBAi4LuG7?=
 =?us-ascii?Q?4F8UFIkrb01EG9s99Gf9d8b4xTg9gqTuDp2c5F1AK08VdUVUJ9NMLku04d4E?=
 =?us-ascii?Q?6gJkgOYsv3Zev/haE+aMJ7WtPV4ySz8JVyNrhASt4YMi+9gz9//Ll9f85j4T?=
 =?us-ascii?Q?byvSGu4yNA16yNiULIEaArutSO/7K5FrHczj5xYPf5hRIBrMCLBfpkwuc+qq?=
 =?us-ascii?Q?n38Z8Q2Ngyg4FYj9iuacz062qIusnqPHUTtCJHnZspyR6ADA+nRsPC2PcadI?=
 =?us-ascii?Q?TPdA/u/m5Dtl3wEqZC7D/Eb7MO43/bQdOMB2zz9p7tURhApvYfyTwagJdi5c?=
 =?us-ascii?Q?GwAgUO/6sezGFgqKlQeiHp/GnE9JNSQGp7yfCmPJaXdEnh3PkeVMZz5J7gY3?=
 =?us-ascii?Q?BH8iqzfdCYIlMt8W5GqLhbekeQfqj+MHZg1KCWyENNYwpcZgyDpqpcISgAi8?=
 =?us-ascii?Q?ptNKiN26Ecf2J1qXjxZuCTQAccbLAOY4/8xBEtg4e6si5iLpx3AsPs7lcXUf?=
 =?us-ascii?Q?rLptKfYRtXjUN0IQMvTer6WkISaD0Iq+sUP4fWBVSyx6O/dZM7OaLclvhXUD?=
 =?us-ascii?Q?SXIE4Yh4tvdUB4R7ZqmC2zxXfrU0uFH1YMDXxlbZATvosCT7NvmUMIRWDlZp?=
 =?us-ascii?Q?BzBxrzOdCiUIPSHheKA8pVrJpc4vYjIF5zWDrwEUnQrVWw2RDrC8n/xJDD9E?=
 =?us-ascii?Q?9k+eVucBNqVQrkatzqFOLGqf1fCQqIZiZYEWu3etfmx/92R5ORecdQcmeR6J?=
 =?us-ascii?Q?eEY907MhBpswqeD6n0+ZGThPWQ+epFUXL3DfrIroBpQu0c4rmY0gcXuhdP1W?=
 =?us-ascii?Q?e4+VU+9antvlSFdz3rvP3w0u45NnZQQif/nHVs5fJHMyslWnUZfWcVIaoy7b?=
 =?us-ascii?Q?H1/Wwm2ktni64iQUH7dhYiILtIdlHTzl?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j64KEPKY+VRaICX1lZKPj4KM6HmjaoD4U37b8YZZsyjCJL+tSLt/y+Vm4418?=
 =?us-ascii?Q?Th6Ojz3DG0J+GiESgV35jWp9McYU9IPSvCvg+IZ+N9omesNOqr0938Zvllt7?=
 =?us-ascii?Q?2aCI7oVgPBG5Mp8ohhMvZ+Wla6bo2XWTel3OX8MX38CQEDUx/rDpwA07T8Hz?=
 =?us-ascii?Q?dzOoYRlvbcKIImH04h+YpoVw6jco+14wPm3HE0z0gdTtXGO7l6yqxiAcHFE1?=
 =?us-ascii?Q?uLk+QPCD8SEZXvk30IROMg80Go6lHEw+E8+k3ScjAbO41s7AWitNaMAW4dt3?=
 =?us-ascii?Q?WSsU71/GsMuK2gkae2O/EU+IvIxIOwRhFHw9EQTpfwDGYv0yP1801Jz7oBHG?=
 =?us-ascii?Q?rHC/ihVwWc6f9fB0LTlxPRYgugLzZAp4H6AAtIzZxLNCVdPwBvjkPjMUjXl4?=
 =?us-ascii?Q?8v1GAXVm12mqNpRG0QvfkMAMHw5KzoMCMA39ynAbc0o6Awv/UAlKAWEGRF1A?=
 =?us-ascii?Q?G/JRiO4E32IGk9TSsLcrMH58ffpWs5XtqmYXrQ6psk38PsT3JGJeGqb/maxo?=
 =?us-ascii?Q?ICgG95B74hNwlV+3VjTLiYDcTiBJ9zdhy1v3FNVhoZrq1R4+ZmsW15Ut9MCK?=
 =?us-ascii?Q?gggcSZruHf2j8olOiBDu+svQljpFz2oELa0v05gMh5xv7+uniHEuvSzhqYBX?=
 =?us-ascii?Q?A3v0xgeqJbDSRDV0A9qlvgD4fUziMcim+S2jqcg+t5Kbx4NBOUFWPi71hm1S?=
 =?us-ascii?Q?Pp52KNiuCEN+u15PcpgzF/U5eU59303QnIIGaQi220WMJie/cs9tJUQjMq+M?=
 =?us-ascii?Q?dI7CHDDqakfoPpQASOXYZkL4Gek8N7+xms7fOdcJb5b3t1+PFI3z3VebQrOL?=
 =?us-ascii?Q?ma/hEB0cTLFnlCyLB2l88OJuaROhE7w2KP6dIhxlVwqD9hvV0lgF5s4QiAX0?=
 =?us-ascii?Q?GOrhrIeMITrb5wCd+khNizFIm5K1D/L5yKwJSa1VafzPMVK+7OU53/Z0PSQk?=
 =?us-ascii?Q?7P0NaD12REQsDXpQ5BPgyoFdKZyntL7A4lvqqda0mjjGZHQUE9zH+DA2CDnC?=
 =?us-ascii?Q?6+a6MJsn6Wql1oSC/tAQ7vSossJ0CST28XLamF8pPjSLdRCICRVCnKm7vCK4?=
 =?us-ascii?Q?0tBAxCSYFOdxBaltMGlmB9de+ZEtKFoqGx0IdqEhLP9h0fPCQchSOIg3ab6i?=
 =?us-ascii?Q?/f86gsRWXyorYoU6iKhDyek6hT6m6Un3fDU5gZqjr8VJLJU9TIvbIOwlr85u?=
 =?us-ascii?Q?DybBtlgcxlmetwyHi4SywHAh/Tr2kZo4PnI7aKjqdTbK3F1S9vOAwVfyU/Vm?=
 =?us-ascii?Q?nY454RvZjfC4qi9+FRePAAEWG2rC0JtyRd9+T9MZ9OXvMyCtYB2hQkwgV24d?=
 =?us-ascii?Q?lo8Uorj/o7S7qd7DIuPvfr1MlnNXz4+xpqUXyFLYfkSH0KGp+2cREQmC3/z4?=
 =?us-ascii?Q?3mYe2KgUAYxCqGaocHARWO71KSlrxx6LzDR0o/BDIHUdobipNN17CCuaX7ef?=
 =?us-ascii?Q?I8mjcRcyxCk7q+chsu6AHoa6c01uUZFRXOgTVXjQwuIbDS72/mTu2gRRGVQD?=
 =?us-ascii?Q?iNyWm6604cyGA/uxtS+hBaY3aJ0j7j6bu4qjJVRhXxMzyCw2rth0TANZoHHJ?=
 =?us-ascii?Q?R8J0ip+7hKnaZUqdEGLyzkxm/+mMFw05WVFmAhZx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b9e7eb-72cc-4f4c-54ee-08dd733888a2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 05:21:20.6908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hC7xxlcaSliGrE1zlYvNzeFea53R9YduCDxruWyg07W876adUyJuq9UDcwN5nh0IZdbYMERzb8yzX8QZOl8ekA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=67ef6c53 cx=c_pps a=l5p8UTqLmUd1ApN92JXWiQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=2UhZ01NCCHTBb4c9ifcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: karsGCNY2hwBtB7A5sq4tUlbAUpuVTHn
X-Proofpoint-GUID: karsGCNY2hwBtB7A5sq4tUlbAUpuVTHn
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504040035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 05:21:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214335

From: Li Wang <li.wang@windriver.com>

When using xinet.d to limit rsync connections, it can't handle changes
in system time. When time is set back, the connection limit is reached
very quickly and rsync gets deactivated, if time is changed again, rsync
is never reactivated.

The current timer of xinet.d is based on the time() and is affected by
the system time. Use clock_gettime() with CLOCK_MONOTONIC as the new
timer because CLOCK_MONOTONIC clock is not affected by discontinuous
jumps in the system time.

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../xinetd/0001-Use-monotonic-time.patch      | 325 ++++++++++++++++++
 .../xinetd/xinetd_2.3.15.4.bb                 |   1 +
 2 files changed, 326 insertions(+)
 create mode 100644 meta/recipes-extended/xinetd/xinetd/0001-Use-monotonic-time.patch

diff --git a/meta/recipes-extended/xinetd/xinetd/0001-Use-monotonic-time.patch b/meta/recipes-extended/xinetd/xinetd/0001-Use-monotonic-time.patch
new file mode 100644
index 0000000000..ee997fd28f
--- /dev/null
+++ b/meta/recipes-extended/xinetd/xinetd/0001-Use-monotonic-time.patch
@@ -0,0 +1,325 @@
+From 753aa53e817d29e979c2a2fca7da40a3d115f93c Mon Sep 17 00:00:00 2001
+From: Li Wang <li.wang@windriver.com>
+Date: Tue, 3 Sep 2024 15:21:52 +0800
+Subject: [PATCH] Use monotonic time
+
+When using xinet.d to limit rsync connections, it can't handle changes
+in system time. When time is set back, the connection limit is reached
+very quickly and rsync gets deactivated, if time is changed again, rsync
+is never reactivated.
+
+The current timer of xinet.d is based on the time() and is affected by
+the system time. Use clock_gettime() with CLOCK_MONOTONIC as the new
+timer because CLOCK_MONOTONIC clock is not affected by discontinuous
+jumps in the system time.
+
+Upstream-Status: Submitted [https://github.com/openSUSE/xinetd/pull/48]
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ src/access.c       |  6 +++---
+ src/builtins.c     |  5 +++--
+ src/internals.c    |  2 +-
+ src/log.c          |  3 ++-
+ src/sensor.c       |  6 +++---
+ src/server.c       |  3 ++-
+ src/service.c      |  5 +++--
+ src/signals.c      |  2 +-
+ src/time.c         |  3 ++-
+ src/xlog/filelog.c |  3 ++-
+ src/xtimer.c       | 15 ++++++++++++---
+ src/xtimer.h       |  1 +
+ 12 files changed, 35 insertions(+), 19 deletions(-)
+
+diff --git a/src/access.c b/src/access.c
+index e942db7..eb9da6e 100644
+--- a/src/access.c
++++ b/src/access.c
+@@ -70,7 +70,7 @@ static void cps_service_restart(void)
+    time_t nowtime;
+    const char *func = "cps_service_restart";
+ 
+-   nowtime = time(NULL);
++   nowtime = _time(NULL);
+    for( i=0; i < pset_count( SERVICES(ps) ); i++ ) {
+       struct service *sp;
+       struct service_config *scp;
+@@ -104,7 +104,7 @@ void cps_service_stop(struct service *sp, const char *reason)
+    msg(LOG_ERR, "service_stop", 
+ 	"Deactivating service %s due to %s.  Restarting in %d seconds.", 
+ 	SC_NAME(scp), reason, (int)SC_TIME_WAIT(scp));
+-   nowtime = time(NULL);
++   nowtime = _time(NULL);
+    SC_TIME_REENABLE(scp) = nowtime + SC_TIME_WAIT(scp);
+    xtimer_add(cps_service_restart, SC_TIME_WAIT(scp));
+ }
+@@ -284,7 +284,7 @@ access_e parent_access_control( struct service *sp, const connection_s *cp )
+    /* CPS handler */
+    if( SC_TIME_CONN_MAX(scp) != 0 ) {
+       int time_diff;
+-      nowtime = time(NULL);
++      nowtime = _time(NULL);
+       time_diff = nowtime - SC_TIME_LIMIT(scp) ;
+ 
+       if( SC_TIME_CONN(scp) == 0 ) {
+diff --git a/src/builtins.c b/src/builtins.c
+index 042e5dc..c285a02 100644
+--- a/src/builtins.c
++++ b/src/builtins.c
+@@ -36,6 +36,7 @@
+ #include "nvlists.h"
+ #include "child.h"
+ #include "access.h"
++#include "xtimer.h"
+ 
+ #define BUFFER_SIZE               1024
+ 
+@@ -237,7 +238,7 @@ static void daytime_protocol( char *buf, unsigned int *buflen )
+    int         size = *buflen ;
+    int      cc ;
+ 
+-   (void) time( &now ) ;
++   (void) _time( &now ) ;
+    tmp = localtime( &now ) ;
+    cc = strx_nprint( buf, size,
+       "%02d %s %d %02d:%02d:%02d",
+@@ -308,7 +309,7 @@ static void time_protocol( unsigned char *timep )
+    time_t now ;
+    unsigned long base1900;
+ 
+-   (void) time( &now ) ;
++   (void) _time( &now ) ;
+    base1900 = (unsigned long)now + TIME_OFFSET ;
+    timep[0] = base1900 >> 24;
+    timep[1] = base1900 >> 16;
+diff --git a/src/internals.c b/src/internals.c
+index c5ed4f8..6a19207 100644
+--- a/src/internals.c
++++ b/src/internals.c
+@@ -85,7 +85,7 @@ void dump_internal_state(void)
+     * Print the program name, version, and timestamp.
+     * Note that the program_version variable contains the program name.
+     */
+-   (void) time( &current_time ) ;
++   (void) _time( &current_time ) ;
+    Sprint( dump_fd, "INTERNAL STATE DUMP: %s\n", program_version ) ;
+    Sprint( dump_fd, "Current time: %s\n", ctime( &current_time ) ) ;
+ 
+diff --git a/src/log.c b/src/log.c
+index b66ab24..7aba30d 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -21,6 +21,7 @@
+ #include "sconf.h"
+ #include "sconst.h"
+ #include "msg.h"
++#include "xtimer.h"
+ 
+ 
+ #define LOGBUF_SIZE                  1024
+@@ -202,7 +203,7 @@ void svc_log_exit( struct service *sp, const struct server *serp )
+    {
+       time_t current_time ;
+ 
+-      (void) time( &current_time ) ;
++      (void) _time( &current_time ) ;
+       cc = strx_nprint( &buf[ len ], bufsize, " duration=%ld(sec)",
+          (long)(current_time - SERVER_STARTTIME( serp )) ) ;
+       len += cc ;
+diff --git a/src/sensor.c b/src/sensor.c
+index cd85806..24bd816 100644
+--- a/src/sensor.c
++++ b/src/sensor.c
+@@ -68,7 +68,7 @@ void process_sensor( const struct service *sp, const union xsockaddr *addr)
+                time_t nowtime;
+                char time_buf[40], *tmp;
+ 
+-	       nowtime = time(NULL);
++	       nowtime = _time(NULL);
+ 	       msg(LOG_CRIT, func,
+ 	           "Adding %s to the global_no_access list for %d minutes",
+ 	            dup_addr, SC_DENY_TIME(SVC_CONF(sp)));
+@@ -113,7 +113,7 @@ void process_sensor( const struct service *sp, const union xsockaddr *addr)
+                {
+                   time_t nowtime, new_time;
+ 
+-                  nowtime = time(NULL);
++                  nowtime = _time(NULL);
+                   new_time = (time_t)nowtime+(60*SC_DENY_TIME(SVC_CONF(sp)));                     if (difftime(new_time, (time_t)stored_time) > 0.0)
+ 	          {   /* new_time is longer save it   */
+ 		     char time_buf[40], *new_exp_time;
+@@ -163,7 +163,7 @@ static void scrub_global_access_list( void )
+    {
+       int found_one = 0;
+       unsigned u;
+-      time_t nowtime = time(NULL);
++      time_t nowtime = _time(NULL);
+ 
+       for (u=0; u < count; u++)
+       {
+diff --git a/src/server.c b/src/server.c
+index 4c4a2b8..e201a57 100644
+--- a/src/server.c
++++ b/src/server.c
+@@ -30,6 +30,7 @@
+ #include "retry.h"
+ #include "child.h"
+ #include "signals.h"
++#include "xtimer.h"
+ 
+ 
+ #define NEW_SERVER()                NEW( struct server )
+@@ -228,7 +229,7 @@ status_e server_start( struct server *serp )
+          return( FAILED ) ;
+ 
+       default:
+-         (void) time( &SERVER_STARTTIME(serp) ) ;
++         (void) _time( &SERVER_STARTTIME(serp) ) ;
+          SVC_INC_RUNNING_SERVERS( sp ) ;
+ 
+          /*
+diff --git a/src/service.c b/src/service.c
+index 93c2162..04422c3 100644
+--- a/src/service.c
++++ b/src/service.c
+@@ -43,6 +43,7 @@
+ #include "logctl.h"
+ #include "xconfig.h"
+ #include "special.h"
++#include "xtimer.h"
+ 
+ 
+ #define NEW_SVC()              NEW( struct service )
+@@ -840,7 +841,7 @@ static status_e failed_service(struct service *sp,
+ 	       SVC_LAST_DGRAM_ADDR(sp) = (union xsockaddr *)last;
+             }
+ 
+-            (void) time( &current_time ) ;
++            (void) _time( &current_time ) ;
+             if ( sinp->sin_addr.s_addr == last->sin_addr.s_addr &&
+                                           sinp->sin_port == last->sin_port )
+             {
+@@ -867,7 +868,7 @@ static status_e failed_service(struct service *sp,
+ 	       SVC_LAST_DGRAM_ADDR( sp ) = (union xsockaddr *)last;
+             }
+ 
+-            (void) time( &current_time ) ;
++            (void) _time( &current_time ) ;
+             if ( IN6_ARE_ADDR_EQUAL(&(sinp->sin6_addr), &(last->sin6_addr)) && 
+                  sinp->sin6_port == last->sin6_port )
+             {
+diff --git a/src/signals.c b/src/signals.c
+index 3c42db3..4160e6d 100644
+--- a/src/signals.c
++++ b/src/signals.c
+@@ -301,7 +301,7 @@ static void bad_signal(void)
+    else if ( total_signal_count > MAX_SIGNAL_COUNT )
+       _exit( 1 ) ;      /* in case of a problem in exit(3) */
+    
+-   (void) time( &current_time ) ;
++   (void) _time( &current_time ) ;
+ 
+    if ( interval_signal_count > 0 &&
+             current_time - interval_start <= SIGNAL_INTERVAL )
+diff --git a/src/time.c b/src/time.c
+index a4d63fb..68142b0 100644
+--- a/src/time.c
++++ b/src/time.c
+@@ -16,6 +16,7 @@
+ #include "timex.h"
+ #include "msg.h"
+ #include "util.h"
++#include "xtimer.h"
+ 
+ 
+ #define IN_RANGE( val, low, high )     ( (low) <= (val) && (val) <= (high) )
+@@ -41,7 +42,7 @@ bool_int ti_current_time_check( const pset_h intervals )
+    int16_t     min_current ;
+    struct tm   *tmp ;
+ 
+-   (void) time( &current_time ) ;
++   (void) _time( &current_time ) ;
+    tmp = localtime( &current_time ) ;
+    min_current = tmp->tm_hour * 60 + tmp->tm_min ;
+ 
+diff --git a/src/xlog/filelog.c b/src/xlog/filelog.c
+index ee688e5..46cf1e2 100644
+--- a/src/xlog/filelog.c
++++ b/src/xlog/filelog.c
+@@ -25,6 +25,7 @@
+ #include "str.h"
+ #include "xlog.h"
+ #include "filelog.h"
++#include "xtimer.h"
+ 
+ static int filelog_init(xlog_s *, va_list) ;
+ static void filelog_fini(xlog_s *) ;
+@@ -190,7 +191,7 @@ static int filelog_write( xlog_s *xp, const char buf[], int len, int flags,
+ 	if ( flp->fl_state != FL_OPEN )
+ 		return( flp->fl_error ) ;
+ 
+-	(void) time( &current_time ) ;
++	(void) _time( &current_time ) ;
+ 	tmp = localtime( &current_time ) ;
+ 	cc = Sprint( flp->fl_fd, "%02d/%d/%d@%02d:%02d:%02d",
+ 		tmp->tm_year%100, tmp->tm_mon+1, tmp->tm_mday,
+diff --git a/src/xtimer.c b/src/xtimer.c
+index 2053ef4..7a125d8 100644
+--- a/src/xtimer.c
++++ b/src/xtimer.c
+@@ -11,6 +11,15 @@
+ #include "pset.h"
+ #include "msg.h"
+ 
++time_t _time(time_t *t)
++{
++	struct timespec ts;
++	clock_gettime(CLOCK_MONOTONIC, &ts);
++	if(t)
++		*t = ts.tv_sec;
++	return ts.tv_sec;
++}
++
+ /* A note on the usage of timers in these functions:
+  * The timers are composed of 3 elements, a pointer to a callback function,
+  * the expire time of the timer, and a unique (pseudo-monotomically increasing)
+@@ -68,7 +77,7 @@ int xtimer_add( void (*func)(void), time_t secs )
+ 		return -1;
+ 	}
+ 
+-	tmptime = time(NULL);
++	tmptime = _time(NULL);
+ 	if( tmptime == -1 ) {
+ 		free( new_xtimer );
+ 		return -1;
+@@ -107,7 +116,7 @@ int xtimer_poll(void)
+ 
+ 	for( i = 0; i < pset_count( xtimer_list ); i++ ) {
+ 		xtime_h *cur_timer = pset_pointer( xtimer_list, i );
+-		time_t cur_time    = time(NULL);
++		time_t cur_time    = _time(NULL);
+ 
+ 		/* The list is sorted, low to high.  If there's no
+ 		 * timers left, return.
+@@ -163,7 +172,7 @@ time_t xtimer_nexttime(void)
+ 	if( pset_count(xtimer_list) == 0 )
+ 		return -1;
+ 
+-	ret = ((xtime_h *)pset_pointer(xtimer_list, 0))->when - time(NULL) ;
++	ret = ((xtime_h *)pset_pointer(xtimer_list, 0))->when - _time(NULL) ;
+ 	if( ret < 0 )
+ 		ret = 0;
+ 	return( ret );
+diff --git a/src/xtimer.h b/src/xtimer.h
+index b0f8451..3ba0d0a 100644
+--- a/src/xtimer.h
++++ b/src/xtimer.h
+@@ -22,4 +22,5 @@ int xtimer_poll(void);
+ int xtimer_remove(int);
+ time_t xtimer_nexttime(void);
+ 
++time_t _time(time_t *t);
+ #endif /* _X_TIMER_H */
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
index d30f08dd72..111c50bdfe 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.4.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=55c5fdf02cfcca3fc9621b6f2ceae10f"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 SRC_URI = "git://github.com/openSUSE/xinetd.git;protocol=https;branch=master \
+           file://0001-Use-monotonic-time.patch \
            file://xinetd.init \
            file://xinetd.default \
            file://xinetd.service \
-- 
2.34.1


