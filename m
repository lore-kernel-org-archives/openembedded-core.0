Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2DFC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 13:07:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10919.1743772049744200620
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Apr 2025 06:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61897e9266=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534AdPVP028182
	for <openembedded-core@lists.openembedded.org>; Fri, 4 Apr 2025 06:07:29 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0ra9du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 06:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJBkMFSM5Co/TLNisXWlanp+pyECfn07oDpBLRs510sKFr9uXOpQMyq5qxDUPupso5oW3vqMLD7CzyKni/+OeWptfOkhWJtrYN8Owt7XvH2hCbk8ZNCCfXQvFqAvP+ap4/oCROLn47yxaqaggDgwT5IYeVOhQCvZWMwmh+1irPcsePC+8Mj93swjBx2s+gvUm2AlAA1K7fASl/z5+VwXpPeaylm1r8H4fOB2T8eG5kzMd5VSd0EOCFXk34XY9eDKgB6g+HFMZWSrZ6xYZdNhMZqMujLBuH3ualyzbfTkT2Apk3OYaPge1G1BVAII/KfQxfLvPety08iVYgYZ4BSlwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+r83IzCpsHgkWUIi7HG40OkAwHpKjGnoTdSsXpAiV0=;
 b=bvgqKhk2C8f8ypQMA5Ybq+rbbhpaoAUDh1gkY4YyuMWhfcr1kIdtIJW/UdKADQ5TyRmU9bhaEm51FSfSgBi0rlr6bjZIf7RYYKZtLbmd8DUSql3w6mByWHu1y2e+MxMuguabucPbe+dPj/PmEGIyYacisH/51X/t1DsHdzrgW+P1rH3DoEsymeUr+QwQk5cXbOtqBwZSBny4g0UeZIVsyb72jrfnWG3EonLtf2WjZgs3Ub1BlvdFCvSURHvl+9CnqE1vFSMidWNLoDJY+ll0qzdFinq/xcsmTmyUSxmM5Y6ZUMILRBhHYdOU0xv30Fg5xcqm1ILS0VayQea7wtFZaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.54; Fri, 4 Apr 2025 13:07:23 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 13:07:23 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xinetd: use monotonic time
Date: Fri,  4 Apr 2025 21:07:04 +0800
Message-Id: <20250404130704.453792-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0181.apcprd06.prod.outlook.com (2603:1096:4:1::13)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH7PR11MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d70786-3fd2-44fe-457b-08dd7379a349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nCqHZTxSw1TlHVYoh92VW9NOxA/NtfTCCv7+X9MW4mMi6e07LFaoaszQl3Ia?=
 =?us-ascii?Q?8vhhQgeu42tkT6X+DXDmnqX9jMnYFwUIa7j3qj/gEhxUvpuzXW+jj1LV6FAa?=
 =?us-ascii?Q?Bxw6hSEeGfGTFNIgjeCDhS2/0US+cANBwXjT15ZtsG8XqGeXcWeba+0f4laH?=
 =?us-ascii?Q?Z/SF2IVHchIFm83SMVEveXrnX3SbG/U0XCKIPcfyFEcpXOlQ9C7l0ia8/6Vb?=
 =?us-ascii?Q?Yp9GrzcJr0UzgubITXT1cCPFOMQKwC6qxMrUUatv1F4fxvjZ3hMEvQEYbieP?=
 =?us-ascii?Q?vKXfIXF/2xLpofeq0ST7TW09GVyfzg5A/vQ55WhDvKZAhiQuA+ox8A+4pXhe?=
 =?us-ascii?Q?/z15VCgtF4lSqTY/zA9/ubxke3FAeIdxAl5VCk96dUNqP9jRQk2iU/JZbIH5?=
 =?us-ascii?Q?hbrBp8eoo3FDs8MxQbi2jjltSHmh77lyLnx8m0iet1NmuJnnvDpzrSAfgi6D?=
 =?us-ascii?Q?JkaJ1R1JBlpSx9Z/G4Fj2tfG0MEdwcQa1G0LTsVneZ4t4jnsFXPlcClRwEkv?=
 =?us-ascii?Q?y0AQMJI7HGxc5txDHPWtb22HvWeV0HEtYTS0/1VnaOGFe67WUa8J5zHQnLwh?=
 =?us-ascii?Q?kMjPUPyzFmiRMZRn4jyUPrDnQYJBXTJm7a1dMHJ06VoYbYh9v+rxpdEzXYuK?=
 =?us-ascii?Q?3k6wcrF6Wd/zzqPLCRECs2fCVWY3vcllSK1mPQWa4AjQF+2s97PnRpvkFpl5?=
 =?us-ascii?Q?FST+614rN2ONC1JjvqHxLHAILZdLHIPwftwK6DwhHjHRCFFMWG37V34J6kp3?=
 =?us-ascii?Q?IixCoMovjQN4QmELw8XEsAdbl2RPltmzvicWAne1FQcBDid9zCwlbst+Tcue?=
 =?us-ascii?Q?3Z8HWNSIgoE2S7Mm5OgxoTADgX6uTS/fquErLobbOK1gPEN0SPjsxNiq+jdi?=
 =?us-ascii?Q?dhYcpAm0ua9yhNB1jYAGUlXE2T9Ryle7DBblQD22aBsJw5XpFB7a7fy8mmdM?=
 =?us-ascii?Q?f5X3fcsYeAsjJGf6sNukjmSGCG94ewUqy93vQnXwb00PSzdPrBuX6W5CtCvd?=
 =?us-ascii?Q?b6eyH9HCTLcY7bBiztAJ3F9J8N1zQbaDWHLVIiaggk8TKkXBVK22D1PeuumC?=
 =?us-ascii?Q?dTR0yoWP7/n39/W9xBwh56oldzGcHIe9A/tjujAH3RcKfU7RnDMgBnfqKsns?=
 =?us-ascii?Q?UrXTnthOL11Ig6Uqwc8ldPbLfTe7NwDqDiANrm4UTJM7559kvWks3kFAwDTb?=
 =?us-ascii?Q?A2rHmX82zm31QwqVgTeS9rJxZEkMjjXMsqeknDwKJe5XFRy9VJJFGVqDMqOE?=
 =?us-ascii?Q?Hl3pPNsNkQqiJahdJeHBZy08RDhr2SuwV2CkZ4aloP8X1pUas5Yu8gOfe9nG?=
 =?us-ascii?Q?Xf2s/G3CRKtQlYCLDLP0L30N/QidZCMEiuBXp5rM8x3RaUEe2YJiQMf8v830?=
 =?us-ascii?Q?yyUGlixbtAKTViDX3xMSlHcQPFRdQOUjk+ADZ+xDSMKEikI2ZSBktSh2W7Zf?=
 =?us-ascii?Q?rXsQHNxA7Zxe1SP7AuC+JZaTgZ7qpLNU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DPMFNvLfbqvZZCckJ5RSti8VIbUylKHottD9jkZXwEOg+F7Sd5GSyn+viijp?=
 =?us-ascii?Q?vg4olCojXvnWLYJ0214ufKBtZYI49+YWCzQPa+bBMXZNLzKkbj5DZaocO1V/?=
 =?us-ascii?Q?3AH+h4OAEFzdMF6Rgf+TeLwqMFCqV3Dp6hroABFt9fe204IwORQrgVgC+KTs?=
 =?us-ascii?Q?OQSYo6CJcFU+75XW7sZYAUfYoz32TXKcJUmIZEDFMWrLKj2mbWTXoOubBgOo?=
 =?us-ascii?Q?J0Mm2VWdoMpYoL4A+7KVEHqPZ1yBabqgY/TZrds7zdly7GFbS6TeuW0Huj7d?=
 =?us-ascii?Q?Bk7bnSMgiNt/CLbHSDMxQsjV8YtLM+OXdoepz6piEXDApMxefRVCc8noR3PX?=
 =?us-ascii?Q?2kGPvsF5LNgkSAcviFtyxTMcakT8IHo+esyhwl3XeS5XBqrmUlxta7I/wB5f?=
 =?us-ascii?Q?brEOPX3AL4vk1Qlwkj5wpgYLA4t4ZgjUVUknXbP3f7Q6uWeRb4COAS0nh/38?=
 =?us-ascii?Q?niAtuTjPsRepSfwxJcbcPjrmpOhLM8gqOb+K7mm+O3EqJ8luweMq9+qct2Ki?=
 =?us-ascii?Q?yJmTa3Ygk/AYsr/qCMQclMn8l4Vnrs02xxvHTJul2S0E3zC2E9zyQ7fnqSBi?=
 =?us-ascii?Q?ex6hhNZUDgM78kgYDJxtfZI5jwGG9BL1jeaYYc3MMr7sa8/SnrtoRvAaRxmx?=
 =?us-ascii?Q?E+wHpx73PHiYwkJVMW7Gw+IQOqwmHyvdw+duk6z4oz3wDs/kUdvi+Pwq6Gf0?=
 =?us-ascii?Q?nitsd1kVdgX7eqSkrqQB/3jdaGis06nrCRuzUof8aoluTppLuoXIOcio67h9?=
 =?us-ascii?Q?tRj9sYTYW/9ZwhTrJJ4ZJB2iL3/VAZP62dxmsHrQZM+Hj0NTsgc4uWuenJSZ?=
 =?us-ascii?Q?kKGIAE60uMcVfb56Z6KbxyXaAxL3L9WjU2TcxUNuwlSC9POjvu+1tJQQ1ZbD?=
 =?us-ascii?Q?E/R6jI5PRU31glHInxf8MMH2MYcMWMTtUcUGETXXqwWTxsVeZ8JgJDliBJzx?=
 =?us-ascii?Q?HzPjsnjnoEl6IRFDDR1ZR0ggmXB+KCTrnTMZPQysGX39NVmcRZljgIXiqJNd?=
 =?us-ascii?Q?xivq78IhiWHcJ7rETqH3+TBp8RHDHSj9c2XDC09+f1psBka9io1gB5zTSDJO?=
 =?us-ascii?Q?o81h/JNhmW3lEo+KwIdsOQ0ajWZerl0BzE9Z7x7QPMeMDP8epoHceufE4Pni?=
 =?us-ascii?Q?EsPBCHrX9wtqXKJBUAjJBNcWtwwSbfO2xggwDk5iUPHPbjqIJg6SGprHQK/o?=
 =?us-ascii?Q?zSbsgcsf69zY+cgHnGS7c83XKPlhUduE0PyPMkCtYzLosE6Iojm69M4iQEul?=
 =?us-ascii?Q?Ewh9hLmys3JAnSeAd0toRON+r2u4cKGFEbo9vTlv8KlNVbyCSJU31VgwlMHR?=
 =?us-ascii?Q?ZA0g1g88NZfQ+T4KY5H4UkC5I6shvIWSIEICryw5T4bF8lE3Sr+LyklivIXI?=
 =?us-ascii?Q?jbm6wiklgVjZ7Fv8xzd0RkLIiuc74VIu59W0NvNZjUDDZ2w554bVUAe2SfyN?=
 =?us-ascii?Q?R0Jj3H4pu61G7uVk0Cp/JoV9XRS/8IEyR19R9qb1avtQgqKDx7dScCbCC1IU?=
 =?us-ascii?Q?6itA/Z/MMPYlB8g5AsXjwh//TTPKJv9yqenoMHZOjpuW/PFXyz/qHH7xjmUR?=
 =?us-ascii?Q?UqhpdH8GFnYyojkkFZb91UAsJ5kyglJDxQ7sWcnZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d70786-3fd2-44fe-457b-08dd7379a349
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 13:07:22.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rSXT1NISJbA5o2UyNQeDIoh5EMR62dp831w8+w0YhS7hTcM4TCJ4hOh3JaeCf92CPS9jeAYNVGI5fi3dUDvkPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=67efd991 cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=2UhZ01NCCHTBb4c9ifcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qnyTUIIbxXgLjiB49KfvjzE2ULaCRgwL
X-Proofpoint-GUID: qnyTUIIbxXgLjiB49KfvjzE2ULaCRgwL
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504040091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Apr 2025 13:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214346

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


