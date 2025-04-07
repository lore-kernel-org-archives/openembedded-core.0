Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC181C36002
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 02:31:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.37660.1743993084512163074
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 19:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6192b69a25=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5371HA0k012505
	for <openembedded-core@lists.openembedded.org>; Sun, 6 Apr 2025 19:31:24 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m1bnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 19:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad5GyFV4jQowRqM9GiZjVXPze4InNq0oYIw83SaZ5QBRfQJ3ZvuCW5GFV2B9lN9oZtDQ9xkxBBSZ0tK/nFWHe+1JJHZ95Cz3INxRyDB1TSWFqy1q2dvyzZxBG6w449jZnOXh0EvBgB6WMgimesHT9D7sE5XpDPqgSo4cm+EehD91jEs3lRgeGUH2j9cq4ZEC1U03O2Iwe8K95NeHshG62o/394Qs1yKCUreQ75JG00DuKzQIwoeWJbVtf5i24ZJ1EZTPGq6KI5Lqn8eetOG6oxJXCQLEitvMHroABgBUny++c8T3BFqFhczK0TU2Tmpvgr1fflBjYQ96/IMp+nyI1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+r83IzCpsHgkWUIi7HG40OkAwHpKjGnoTdSsXpAiV0=;
 b=HjXaOCaFkII5WRVHur2vDQB/cTx7WwKDkjK49rioETljSm/ys3GLVPCRi712v6gPmehPwiX3I2eQHUbEUwDK0H/gs7hk/XFLuG2HUT7PHGNJZRVcaLI0lhYW0e+2oZ03sr30ObVzcRcu9s7HmVDPIhUDZaaBp/kj/rJARQ7+/QOF7bn9GecYRvb/vFeUh/Cqac6B519gyaopZBLMkY0g/N4oRQhGCaf8cjWRZLhtdByhD7NJEl2/uIarc93GvlWfsB5da4igKYgaEHVevR+6YbMfAobJ1yFM6ySMSpgrdR/NoGseD5XLZvay0AsNFo7wcDCqk+4YPKEuQNJ2xzKEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH2PR11MB8866.namprd11.prod.outlook.com (2603:10b6:610:281::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 02:31:16 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 02:31:16 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xinetd: use monotonic time
Date: Mon,  7 Apr 2025 10:31:06 +0800
Message-Id: <20250407023106.60325-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH2PR11MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c193349-a4c4-4f55-ca4b-08dd757c458a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JlmsjuAMicMmUXyjRuwM0TjPF7glHbrUBTCmvkQI92OasZJ/C9vEKRpeO6Dr?=
 =?us-ascii?Q?CAnhUbtoORS/OUn0DYtcZi0q2EHKJ82vyHnYmVbmBNml8SyIM+BMvmqtVgBK?=
 =?us-ascii?Q?eV2SXHYlet9A7F+wNEBxO2y4lKCuvZ85bqro5/698Vlsnzeuqp+L89dKhLgA?=
 =?us-ascii?Q?5EJIHnNV2MDUMZtuvYe1dFpP5cV0ZevCK6Pn5U/JO/QTZTLLweZBF2AKZt43?=
 =?us-ascii?Q?/+93qBkzPahWwOWsTR9MU8pvP7/fb2ZcDkpKYOJUoWdYv0K8A/g8PJJYkCLS?=
 =?us-ascii?Q?fCR6n5FhMnXs88oFsazITUAnxax+5fuU5qtWxYPTI87Rw5On759q8hD2+Ly4?=
 =?us-ascii?Q?X7F+FyZuYqgQr5pL7rUbdNrxJ1f19cfsnfuvRh0W1ixAcKs4sEwW2+t++lzH?=
 =?us-ascii?Q?YenTFnVfuan9I1kXUx9k+KlUSV3yB+lvdp+s0WtytCxbIZmcZVl2h0I3rH9a?=
 =?us-ascii?Q?vK+yLZzIARm4ubet1CMAHH4QxvVCHqEKeHKLvz1jRmSy3CsJUFHYaGLTwJQk?=
 =?us-ascii?Q?lsdx/5GfazmdM/5gqC7zwhAY2lV0RffJneqCp87VGQ9eYTasgngLOTaAylss?=
 =?us-ascii?Q?Bn0Kf/SNiWe61ZT6imL+gD0NN0RXrDrAlom7yQJDp3MN5hBJpCMIKe4VhjtE?=
 =?us-ascii?Q?dtr26NMjppssYgy9+/Ox0Qqu0gx82dc2ZO6CeV0PRqBw4Eo2rcM17i+7Ncbb?=
 =?us-ascii?Q?5L68pfwMQnuer80M6NnYNfSbmQghJzPPi87KHSROA0WKjxVgCCnQJZzDL0nG?=
 =?us-ascii?Q?+FD4SK27P1WSzzrOjLI53VxKThll62cNhu7vw4/Mex6aoQIionwQlzxP3qxY?=
 =?us-ascii?Q?kWHrrSQ3h/2omxCJe84SRS4x4bC1Xiw135qcKgmJKmupcaZKodk9DSFL1W2T?=
 =?us-ascii?Q?7wzoC/U+PvY8erF48i/8PlNViDWiLiCKebLV/NKY5WyNdbu0eG2oEZ65wGhA?=
 =?us-ascii?Q?Z+hkxnScEmFRnQYXxrMd+7xOJlBA+ttL2YhPGiZ7HXUm+jGkPEzvyuoUm0oS?=
 =?us-ascii?Q?rqMg4F56DoV4ttAWZBnT365RPVuYD+GR0wf9ELYBfWqYHZhRp9yOlup6m/Ou?=
 =?us-ascii?Q?dFnA8/ACNDfQIdHYEMdldNitvDUwnWkaRn+1GvKp8Hsxy58Q/B/sB5AWhNYk?=
 =?us-ascii?Q?35ScRgECEo+6W4TTwbAe4rmq9V84idI/kraOkkofdtHHedOQpcuvl1eRqloS?=
 =?us-ascii?Q?ajj2ExxaKsOGYdrV9xyJHNVGYRxfs5Im14uSa2YEbOl12DJfYCWGtqvA5OJN?=
 =?us-ascii?Q?TxNE1S43jO7cV7MMH3XmL6fIX/dgrXA08vBjc7/LE8YtooiW5BMf8Yw7Pc4X?=
 =?us-ascii?Q?mLQpSRLJemy1MX826OL1mwnr4eu1hrw7zw3JeiJw/yZfUrE/y9dJgym9JNrn?=
 =?us-ascii?Q?xKTC3jYFDbKnsoNWJZA7sRksPJ/QYY25qRB8mpQZsf9nKWkgJN6+6+APeloY?=
 =?us-ascii?Q?C70eAQZ87eRugutXVZVTj2sLRScP2LJp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?X56+SkCxThAlGZuqKqe3kF+AkowihAex/c8sXweWOmtHVIwwr595DXyhVymT?=
 =?us-ascii?Q?DzHeWY1fzSaeLtyQaieY+Yji/K5W9sJsSOXbSwTffQDI6sov9YwVDXa2qb/h?=
 =?us-ascii?Q?t3Q+80WIIwxPDJUuPwdjWm62IwNVNzNq2VB05jkBHBebK0Sd1brzrVBDp6Zj?=
 =?us-ascii?Q?snZPwMCmZjgtVqrtyQ/uav481G6j0rHmh35Vnn6TYNB+kKYkUxCEFHPBOnAW?=
 =?us-ascii?Q?pZdNfXZ5w/8hGPCV8SVGEsXDwASH+obFN0K8U+JlUmfkXFIdl4GLEOBetmKe?=
 =?us-ascii?Q?cmGLR2ivrwXMEVA9v/i8pUG5w31vUa0GoJpbPeIYLWJkXob+wy9hIJ8/rn5s?=
 =?us-ascii?Q?zg56HTdxgrvZJDym3l4iWVUx02RGSJxh4HM7PxfKcBt076Xp+0LeGqdsQc4u?=
 =?us-ascii?Q?7bH2Zx2DVKU9jA4W6BTGF5XeGUUqcg6b8y8e+y7/Go3ejwHRbyiLcoMbcYm2?=
 =?us-ascii?Q?dJb/qfyZxd9q+4doOoRYC5ELQI2iKeyV/wOb0aFI/uSDHdBeE1Vx9fBkDIyK?=
 =?us-ascii?Q?VzJXIjjjo+N9NVkC/0YaYuP1myR3LDkW+QdYbp6J9KRW9iSViVeWOb7Qda33?=
 =?us-ascii?Q?yxnvPul3vOid9F+tXAz+rZ8DbIkdyafLcoLqesIG7C1rQtzm7ntpXYKpK3RP?=
 =?us-ascii?Q?FAYd/maVnHWa+wMSvg7UGXDedE0WUJFEJE/u+zVQtOFSaHHAV6qJkc3Uw8GD?=
 =?us-ascii?Q?NrebUOwe7GEUzXNhvaOpHMIlQgIyainpPTcbKV1BFgI3x3B6whGGIK5THNtc?=
 =?us-ascii?Q?FDVT/rJxVJtZdWcNgyluesEZ2+r2z9ew/gnGd+1k1a/dsCMfUJUc1L6Gkghc?=
 =?us-ascii?Q?1ywwjenjrUqmA5xUt2HzLn0EIqNBR5kK69T51aKRJvyDfu2wJxURFxckDFzz?=
 =?us-ascii?Q?cmww9p0ZkQ5Pr7HhBmiqQwnXq0WakLX87U7//bHzySY1VM7I5ksUtNEh8BW0?=
 =?us-ascii?Q?ZUoibztYd04ObprTxS4exVlD2iQVd5qEdA5ax5lBj6oP6sCKKZjKIlEa0WoS?=
 =?us-ascii?Q?dkWzMfXBx3criizkskX/uQwC1vOaYTjiDIFbwZNRZ3M76/M396tPUxDSNRsn?=
 =?us-ascii?Q?3wzWJkXx9MiVouVebXCd8Xzf/Q/rDVAe0QZT+xpC6mUR/elH+X2XlDI1wBA9?=
 =?us-ascii?Q?z2ql93+Gb4TEtKxYClrD5+9O4FdzFnCKbTO8NcN33uUuXFUrWvVAcS8HOINN?=
 =?us-ascii?Q?YEpz00GY20XUTp1sKSdIHsdHTjUirmR0Le6puPqRp5ZdkStubRtTZmqFN86s?=
 =?us-ascii?Q?VnipvcaRc4VlmZQ4eXT28xF8wOmedCina3bREBZqDEjHcFK3MqvzbTsm9G+t?=
 =?us-ascii?Q?c9ALHb0TH7xsinAxH2NokyEzvi1btDZR+Nl5a+N0pfla5G+Fm2mWnzR3FaaM?=
 =?us-ascii?Q?ymTxOvpEBiQzQ6jM/1I77l9mhxd9Gcf/RSN2dewNwEdyApC/e2Rj5Q/M7g7g?=
 =?us-ascii?Q?gpBUDo42GjL7p9HMA5sG1Osa1ziknljWr2AqHb9H5Sn52rHSh5KCPp6zzyaW?=
 =?us-ascii?Q?TKjNBmcZjw10RW3PZM9aodMAHHjDyN/hhmqC1iuucDR5JMcI6vI+eoUxHxjm?=
 =?us-ascii?Q?boF0RBON3ILQ8nKtygwM5pb0lr4BajkXJzhwSzAW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c193349-a4c4-4f55-ca4b-08dd757c458a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 02:31:16.2561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9x/c0RZ6glfnBmYvSdxURL9BCsWHfQmzXvxOlzfLYz1nxn2ZdM+deN4cU08BJfDy9A6buHBmxxb51vYR+cELQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8866
X-Proofpoint-GUID: JCVul66swnJa2KidzdkM0jVcS64gNXs7
X-Proofpoint-ORIG-GUID: JCVul66swnJa2KidzdkM0jVcS64gNXs7
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f338fb cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=2UhZ01NCCHTBb4c9ifcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214392

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


