Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25140C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:41:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.369.1646847669868801414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:41:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=evfUBD1I;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=0067066b32=saul.wold@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 229DmZLV006465
	for <openembedded-core@lists.openembedded.org>; Wed, 9 Mar 2022 17:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=q8Qe6RMeWB1lecYC2C2Ijoy+vQissYGUjbcyc7DZl0Q=;
 b=evfUBD1IVMImtESKWE5gjYoT+f+s73FJ4PDhOTKzHBnj4103P8/z074J6pkSU6me3I9n
 2/VnmnRL2VgDIPgIuQCI2bfPm3FD18dH0gY9N7ImMaKn5eHkymCAtlJJO6cHCnVnamSO
 YbNwZKY7YQOOtPYEK/23hl7p7UF7wRsEhMV46Z654vprNTGIVgKX3EOMPsg+11QsNaAk
 5m1mUW8IgLzuS1vP98KR5dTu8BWfKJytpmD3Hu5uUDirwq3yXQyWip29U3qO5WArziGI
 qrFF6qpVG9K4RP4CieAbW5ZXH7cMnTOXVMLFTcEMO8+y77IDR3Ng8Wa86NuNXF5tkRf3 Pg==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ekw303ppq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 17:41:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN02HTV5ZC6D2PboL4zTF+etBGKPpDcsfK2vebN0zGAgv+OV6xVDxXZnXt9ISVmzPyt4biG78zSzimNa+3zAO3sMp6L4YcW2X2MSCmJW0//zakRXJhXXC9TYrbT6W1M2l/mz8CLaPxhJOk6qsPNyRPd8WI9xpunBBqPiCwhBRixp/yhMq0dH3bnt92owCHqSJU/sx95ZB7XWX5pxFOuMoYEEQHAPeEUYP7yzCORqCg1QW1isESjGpVN4/T7J05NLPOJ5DgbJAX56xvrXTi3/zdOEjBVPcC3L22BEfxvlT41n/RyEbicsYUIXmUQwOn0hWv2d4aPrya4Oj/tMlbygXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8Qe6RMeWB1lecYC2C2Ijoy+vQissYGUjbcyc7DZl0Q=;
 b=YsYNFGBefICzt7IH1IcntIICU5m71WgwfCEialiE2Mdk3hkY591scxqlhhx4flV6KhsDd+UHEBkYKJfs9olnWVVvHTf1sDSM7xlfBl7vLFXkPQNwyW678pHYqpM7OAQ4rLbKyx2xravT2croFr5DpHqJIOBGVKuARL5QAscdlw/Bm3vZAlOceL5SnIir/wzVKux7glSvAQig+kG3B9/4OEn+nRODu5v9Wdr1NM/bfX8oru8Iu0amkuzOk2rwqUhQYD7h1dy6Qm9NPGaty26OjoHJGisztugQsQN36zPLv57QXMQ59Ln62Vb0VC+fxpK6b3m2atS9WrbOcTYXTxSeHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by DM4PR11MB5328.namprd11.prod.outlook.com (2603:10b6:5:393::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Wed, 9 Mar
 2022 17:41:06 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5038.029; Wed, 9 Mar 2022
 17:41:05 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] Change internal variables
Date: Wed,  9 Mar 2022 09:40:52 -0800
Message-Id: <20220309174052.1997478-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0008.namprd21.prod.outlook.com
 (2603:10b6:a03:114::18) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc25dac2-b586-4d9e-1e72-08da01f3fcdb
X-MS-TrafficTypeDiagnostic: DM4PR11MB5328:EE_
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5328AB9D66F4055057BC7A48EE0A9@DM4PR11MB5328.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zR4Rx4VSp0jw/1wpDt5Vq92ayJ4oEtrDIjInN6Baj1dQPoZvNBjVGnPKnwxiulMR+93HP8HxvZgpZXvYQDmxaJnwolQdGxlne+2B1Lj9rGom6jQVKqHGWQ+0nanqyJAZisCT5D96cDfFaGVdSviNARSRM4xN/sdBiL9iD8eSKrIE3gHS2Bdq6BDcjyE1YJY7mhCMruE/j9F+CXPZ/bW2/V5CroZkFiPZ2Gs4sF/FV8PFyOaOU5CRiDyiS7aJTDyBnAeU+Tn0WJSZK2OkTYtfy6xlqnvcDyoNoRmc83JG7EFpuSCgaVnIevsfEkN2GTSfiSmC1l/7NrDRaWnAoLXsZ/64u184YWz3zUbQ6xgvh8jcXcG+8wAE/Xb2p9QbjczRcuo1zAe/LWbezQ2ZVyiXR9Hfyu/tiX3u9ohF2ZHkE8utyIsMXYcm5K6Gx08n3o5YESn3mTo0obhF8GqL0muQGoUVQd/eDUWEWL/30n8a2lUHkgpMG4yCHYpRc+09qjzjE9VgZ4jCRYvSDQJEu5XG5jp2wqifwqTcwiMZ2VvBs6UfjtjXra9FMQ+zsbQFkCrWsLiBw94BLRJhTQlA6iwm++o2LiDdlySt1SXIlph0CY7+9zAWbrHBS9cf5oATnP0VJer56Z6p9JSziNcMAGtUwg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(6486002)(316002)(508600001)(6666004)(6512007)(1076003)(2616005)(186003)(86362001)(83380400001)(38100700002)(8936002)(5660300002)(6506007)(8676002)(66946007)(66556008)(66476007)(30864003)(44832011)(36756003)(2906002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?aJ4E//xD7IznHr5C6y1YY59kuC9MjyHcQZQdaYLQ+RzYUoAbUEfzY8Ixklw7?=
 =?us-ascii?Q?UNjksFGSNBchu/THnnlir9XhyaswvqTMngi+EtonBBsM3I0SH8DuExY/nVUu?=
 =?us-ascii?Q?yrDVpIwgcA2beDJn3Wp9cgnbEstBOfaVVFzRfdSkwEqU2a1c5eYI5PK42rvJ?=
 =?us-ascii?Q?QGMz0Wke75sB6yAewbpUTg9XZfUwh1wl/i5UGDYtxjYKufwHJP9MqVGUmgki?=
 =?us-ascii?Q?LLH1FK4seMfiaiWblscBr599SVyltNZT/MY7e4As9to58QDGGFLK7tlaDty1?=
 =?us-ascii?Q?zPobyY0SUUjQy5wrPgZwcmidYzD2FeQQfSFjPtOXO+tTr/ESNK73OsoEjMqI?=
 =?us-ascii?Q?Pg4XP6ovWe4ICiI8ul6vjI8kb9zLQRgXOw4Yfs9ITbds3+60SKNocKyIgEwA?=
 =?us-ascii?Q?d9vOtatd1VKLULmBCkXWXukZuZjz0KE4upfAtrO0HL7AawK1S3EL/PG4LPym?=
 =?us-ascii?Q?TfnN6i2LSiQqL3v6qMQ11nnaXc1ZapL9dTtDEdCVMnsFZZjp6TYiEdAw0Hnr?=
 =?us-ascii?Q?o1HZeLmEdE5i8CnCnTkfm2ZhEyIJg1O8ke9YBvBiIK4AnLzYs0NkFYreysK2?=
 =?us-ascii?Q?c+r4fQFb2k/4Vo9kBj7h/u7GYyfeBwgcNkXJWhigDqg+uD8yzf0+77FU6Tdw?=
 =?us-ascii?Q?4ZGyoII4s0MFa/59mW+Jj+Cz2Ib3cRJqcZxec309+IDD2cBMHBZxl2NS23Xi?=
 =?us-ascii?Q?gJd2PnJxKUG7nNgGbHS59M3nSktL7NwXwqeanqQWHPZF2szDkp2EplEgKun0?=
 =?us-ascii?Q?D76nxLhdYsnNU4RRWHOmCioGQj20YV48rUCBE4MQziS7bTDpNKVZ617w5VHg?=
 =?us-ascii?Q?+5N2xRKq+Fd7DE/aRB80+hvrUmg0xwR6fSdxakS8xxdhNOI8nWs7tPjNL4Va?=
 =?us-ascii?Q?xWEM0MTy3eBCd3v7pUM/AsL9cZWmuudVYA3FiqlxqaxfJ327eyZw11gvsPxt?=
 =?us-ascii?Q?WtfqkiDlAmcy6aHfj4pJpHnp4lhO6x+95BCYAxSjItLUSZ1Oo9VNZoOtXUL2?=
 =?us-ascii?Q?+SVhEh+UDAi0puMKIFuAs9w8qobuWHU6NBPhiGAD9TCsfB4BlOzmhcS6FPDH?=
 =?us-ascii?Q?TmX2vUKOgJ+A19G0d8/KW3wVHUallqtub5MU0SbudrcPzl3BmAMvpYeY9FVK?=
 =?us-ascii?Q?XLNIUhmPp9VoCF1bgAYnKAQIW0nVKfS1XEbfMpFw5+KskzzAQMWsH2h6wsVS?=
 =?us-ascii?Q?sVjRMEwpBk7cvY76zZUvWYTi6ttJr0ES6dnZsyPu2O+z5tY2I2z0+kbJ/Jqn?=
 =?us-ascii?Q?Xc9ctn8n50jVHlZILO3TP6ifGw2qGM6c1ilFD1Fio/RzIC+Os2nzZYOkvSAo?=
 =?us-ascii?Q?IznF7G8fZi/0lBzgvyhLmnC/d2YKLM3xk94YtkBGTFS+JwlefKKsiIbKXDA1?=
 =?us-ascii?Q?lUSWWDObmSKiQvbHr+Efdn3HgkV/xyUPBwkTcVJ2O5uaTuSgyz+8LBSV1hvk?=
 =?us-ascii?Q?dMORTXIALqZJsuPU/R5JOsFt2gSE75pYF36rgEJl97SZc2p/cy6od0V8zIhg?=
 =?us-ascii?Q?sp6zVT1STu6TnM3wABZ3I/43Wzl3nVCNQKBONZiXO8lQ8mYK8POIv24OQo/k?=
 =?us-ascii?Q?uP9CURDA2q2rO8icDg7Xk0MNfhBBdwZ+BsqrTZAHwudHcrK5s4oT3sonU284?=
 =?us-ascii?Q?nh9YExO7/8qq1eoPVoXEyYLFpArK8Pu7GnP30eEkV9WcpjpXgVpML/m266A0?=
 =?us-ascii?Q?Z2TXpCQynoJoFnNCurNTDuQAB+s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fc25dac2-b586-4d9e-1e72-08da01f3fcdb
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 17:41:05.9121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0Rf0snhL3x11MxGHZiKzEXsJtklrlMU9MTeg4Ee5QdCVe7nYs7/FaQpIbR/Rq4y9XAdR1MF2x4HEzIAQyuEHjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5328
X-Proofpoint-ORIG-GUID: uN2xuRDaXh1wlbI8v7eKRymJVfC6hzEE
X-Proofpoint-GUID: uN2xuRDaXh1wlbI8v7eKRymJVfC6hzEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-09_07,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 17:41:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162985

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/base.bbclass                     |  4 +--
 meta/classes/cross-canadian.bbclass           |  6 ++--
 meta/classes/cve-check.bbclass                | 31 ++++++++++---------
 meta/classes/insane.bbclass                   |  7 +++--
 meta/classes/populate_sdk_ext.bbclass         | 18 +++++------
 meta/classes/sstate.bbclass                   |  4 +--
 .../distro/include/cve-extra-exclusions.inc   |  2 +-
 meta/conf/distro/include/security_flags.inc   |  2 +-
 meta/lib/oe/utils.py                          |  4 +--
 meta/lib/oeqa/manual/bsp-hw.json              |  2 +-
 .../lib/oeqa/selftest/cases/containerimage.py |  2 +-
 scripts/lib/checklayer/cases/bsp.py           |  2 +-
 scripts/verify-bashisms                       | 10 +++---
 13 files changed, 48 insertions(+), 46 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b7869da3b3..cc81461473 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -329,9 +329,9 @@ python base_eventhandler() {
         source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', False)
         if not source_mirror_fetch:
             provs = (d.getVar("PROVIDES") or "").split()
-            multiwhitelist = (d.getVar("BB_MULTI_PROVIDER_ALLOWED") or "").split()
+            multiprovidersallowed = (d.getVar("BB_MULTI_PROVIDER_ALLOWED") or "").split()
             for p in provs:
-                if p.startswith("virtual/") and p not in multiwhitelist:
+                if p.startswith("virtual/") and p not in multiprovidersallowed:
                     profprov = d.getVar("PREFERRED_PROVIDER_" + p)
                     if profprov and pn != profprov:
                         raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ac82e86356..a0e9d23836 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -36,7 +36,7 @@ python () {
         return
 
     tos = d.getVar("TARGET_OS")
-    whitelist = ["mingw32"]
+    tos_known = ["mingw32"]
     extralibcs = [""]
     if "musl" in d.getVar("BASECANADIANEXTRAOS"):
         extralibcs.append("musl")
@@ -51,8 +51,8 @@ python () {
                 entry = entry + "-gnu" + variant
             elif libc:
                 entry = entry + "-" + libc
-            whitelist.append(entry)
-    if tos not in whitelist:
+            tos_known.append(entry)
+    if tos not in tos_known:
         bb.fatal("Building cross-candian for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS"))
 
     for n in ["PROVIDES", "DEPENDS"]:
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 079d09a76f..dfad10c22b 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -43,11 +43,12 @@ CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 CVE_CHECK_REPORT_PATCHED ??= "1"
 
-# Whitelist for packages (PN)
+# Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?= ""
 
-# Whitelist for CVE. If a CVE is found, then it is considered patched.
-# The value is a string containing space separated CVE values:
+# Ingore the check for a given list of CVEs. If a CVE is found,
+# then it is considered patched. The value is a string containing
+# space separated CVE values:
 #
 # CVE_CHECK_IGNORE = 'CVE-2014-2524 CVE-2018-1234'
 #
@@ -101,10 +102,10 @@ python do_cve_check () {
             patched_cves = get_patched_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
-        whitelisted, patched, unpatched = check_cves(d, patched_cves)
+        ignored, patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
-            cve_write_data(d, patched, unpatched, whitelisted, cve_data)
+            cve_write_data(d, patched, unpatched, ignored, cve_data)
     else:
         bb.note("No CVE database found, skipping CVE check")
 
@@ -176,12 +177,12 @@ def check_cves(d, patched_cves):
         return ([], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
-    # If the recipe has been whitelisted we return empty lists
+    # If the recipe has been skipped/ignored we return empty lists
     if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
-        bb.note("Recipe has been whitelisted, skipping check")
+        bb.note("Recipe has been skipped by cve-check")
         return ([], [], [])
 
-    cve_whitelist = d.getVar("CVE_CHECK_IGNORE").split()
+    cve_ignore = d.getVar("CVE_CHECK_IGNORE").split()
 
     import sqlite3
     db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
@@ -198,9 +199,9 @@ def check_cves(d, patched_cves):
         for cverow in conn.execute("SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
             cve = cverow[0]
 
-            if cve in cve_whitelist:
-                bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
-                # TODO: this should be in the report as 'whitelisted'
+            if cve in cve_ignore:
+                bb.note("%s-%s has been ignored for %s" % (product, pv, cve))
+                # TODO: this should be in the report as 'ignored'
                 patched_cves.add(cve)
                 continue
             elif cve in patched_cves:
@@ -254,7 +255,7 @@ def check_cves(d, patched_cves):
 
     conn.close()
 
-    return (list(cve_whitelist), list(patched_cves), cves_unpatched)
+    return (list(cve_ignore), list(patched_cves), cves_unpatched)
 
 def get_cve_info(d, cves):
     """
@@ -279,7 +280,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
+def cve_write_data(d, patched, unpatched, ignored, cve_data):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -312,8 +313,8 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
-        if cve in whitelisted:
-            write_string += "CVE STATUS: Whitelisted\n"
+        if cve in ignored:
+            write_string += "CVE STATUS: Ignored\n"
         elif is_patched:
             write_string += "CVE STATUS: Patched\n"
         else:
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 270b7860c7..0deebdb148 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -441,7 +441,8 @@ def package_qa_hash_style(path, name, d, elf, messages):
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
 def package_qa_check_buildpaths(path, name, d, elf, messages):
     """
-    Check for build paths inside target files and error if not found in the whitelist
+    Check for build paths inside target files and error if paths are not
+    explicitly ignored.
     """
     # Ignore .debug files, not interesting
     if path.find(".debug") != -1:
@@ -1283,8 +1284,8 @@ Rerun configure task after fixing this."""
             options = set()
             for line in output.splitlines():
                 options |= set(line.partition(flag)[2].split())
-            whitelist = set(d.getVar("UNKNOWN_CONFIGURE_OPT_IGNORE").split())
-            options -= whitelist
+            ignore_opts = set(d.getVar("UNKNOWN_CONFIGURE_OPT_IGNORE").split())
+            options -= ignore_opts
             if options:
                 pn = d.getVar('PN')
                 error_msg = pn + ": configure was passed unrecognised options: " + " ".join(options)
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9c9561c5c6..e2019f9bbf 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -282,8 +282,8 @@ python copy_buildsystem () {
         bb.utils.mkdirhier(uninative_outdir)
         shutil.copy(uninative_file, uninative_outdir)
 
-    env_whitelist = (d.getVar('BB_ENV_PASSTHROUGH_ADDITIONS') or '').split()
-    env_whitelist_values = {}
+    env_passthrough = (d.getVar('BB_ENV_PASSTHROUGH_ADDITIONS') or '').split()
+    env_passthrough_values = {}
 
     # Create local.conf
     builddir = d.getVar('TOPDIR')
@@ -294,15 +294,15 @@ python copy_buildsystem () {
     if derivative:
         shutil.copyfile(builddir + '/conf/local.conf', baseoutpath + '/conf/local.conf')
     else:
-        local_conf_whitelist = (d.getVar('ESDK_LOCALCONF_ALLOW') or '').split()
-        local_conf_blacklist = (d.getVar('ESDK_LOCALCONF_REMOVE') or '').split()
+        local_conf_allowed = (d.getVar('ESDK_LOCALCONF_ALLOW') or '').split()
+        local_conf_remove = (d.getVar('ESDK_LOCALCONF_REMOVE') or '').split()
         def handle_var(varname, origvalue, op, newlines):
-            if varname in local_conf_blacklist or (origvalue.strip().startswith('/') and not varname in local_conf_whitelist):
+            if varname in local_conf_remove or (origvalue.strip().startswith('/') and not varname in local_conf_allowed):
                 newlines.append('# Removed original setting of %s\n' % varname)
                 return None, op, 0, True
             else:
-                if varname in env_whitelist:
-                    env_whitelist_values[varname] = origvalue
+                if varname in env_passthrough:
+                    env_passthrough_values[varname] = origvalue
                 return origvalue, op, 0, True
         varlist = ['[^#=+ ]*']
         oldlines = []
@@ -356,7 +356,7 @@ python copy_buildsystem () {
             # We want to be able to set this without a full reparse
             f.write('BB_HASHCONFIG_IGNORE_VARS:append = " SIGGEN_UNLOCKED_RECIPES"\n\n')
 
-            # Set up whitelist for run on install
+            # Set up which tasks are ignored for run on install
             f.write('BB_SETSCENE_ENFORCE_IGNORE_TASKS = "%:* *:do_shared_workdir *:do_rm_work wic-tools:* *:do_addto_recipe_sysroot"\n\n')
 
             # Hide the config information from bitbake output (since it's fixed within the SDK)
@@ -438,7 +438,7 @@ python copy_buildsystem () {
     # Ensure any variables set from the external environment (by way of
     # BB_ENV_PASSTHROUGH_ADDITIONS) are set in the SDK's configuration
     extralines = []
-    for name, value in env_whitelist_values.items():
+    for name, value in env_passthrough_values.items():
         actualvalue = d.getVar(name) or ''
         if value != actualvalue:
             extralines.append('%s = "%s"\n' % (name, actualvalue))
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 7aca415159..163bdf0b5f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -259,13 +259,13 @@ def sstate_install(ss, d):
                 shareddirs.append(dstdir)
 
     # Check the file list for conflicts against files which already exist
-    whitelist = (d.getVar("SSTATE_ALLOW_OVERLAP_FILES") or "").split()
+    overlap_allowed = (d.getVar("SSTATE_ALLOW_OVERLAP_FILES") or "").split()
     match = []
     for f in sharedfiles:
         if os.path.exists(f) and not os.path.islink(f):
             f = os.path.normpath(f)
             realmatch = True
-            for w in whitelist:
+            for w in overlap_allowed:
                 w = os.path.normpath(w)
                 if f.startswith(w):
                     realmatch = False
diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 85b40207bf..6c19cd293d 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -26,7 +26,7 @@ CVE_CHECK_IGNORE += "CVE-2000-0006"
 # There has been much discussion amongst the epiphany and webkit developers and
 # whilst there are improvements about how domains are handled and displayed to the user
 # there is unlikely ever to be a single fix to webkit or epiphany which addresses this
-# problem. Whitelisted as there isn't any mitigation or fix or way to progress this further
+# problem. Ignore this CVE as there isn't any mitigation or fix or way to progress this further
 # we can seem to take.
 CVE_CHECK_IGNORE += "CVE-2005-0238"
 
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e469eadca1..8374cb8544 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,6 +1,6 @@
 # Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These
 # don't work universally, there are recipes which can't use one, the other
-# or both so a blacklist is maintained here. The idea would be over
+# or both so an override is maintained here. The idea would be over
 # time to reduce this list to nothing.
 # From a Yocto Project perspective, this file is included and tested
 # in the DISTRO="poky" configuration.
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 84790b7dff..46fc76c261 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -221,12 +221,12 @@ def packages_filter_out_system(d):
     PN-dbg PN-doc PN-locale-eb-gb removed.
     """
     pn = d.getVar('PN')
-    blacklist = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src')]
+    pkgfilter = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src')]
     localepkg = pn + "-locale-"
     pkgs = []
 
     for pkg in d.getVar('PACKAGES').split():
-        if pkg not in blacklist and localepkg not in pkg:
+        if pkg not in pkgfilter and localepkg not in pkg:
             pkgs.append(pkg)
     return pkgs
 
diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index ca91987e31..308a0807f3 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -26,7 +26,7 @@
                     "expected_results": ""
                 },
                 "5": {
-                    "action": "Remove USB, and reboot into new installed system. \nNote:   If installation was successfully completed and received this message \"\"(sdx): Volume was not properly unmounted...Please run fsck.\"\" ignore it because this was whitelisted according to bug 9652.",
+                    "action": "Remove USB, and reboot into new installed system. \nNote:   If installation was successfully completed and received this message \"\"(sdx): Volume was not properly unmounted...Please run fsck.\"\" ignore it because this was allowed according to bug 9652.",
                     "expected_results": ""
                 }
             },
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 3068c9ba26..e0aea1a1ef 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -13,7 +13,7 @@ from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
 # The only package added to the image is container_image_testpkg, which
 # contains one file. However, due to some other things not cleaning up during
 # rootfs creation, there is some cruft. Ideally bugs will be filed and the
-# cruft removed, but for now we whitelist some known set.
+# cruft removed, but for now we ignore some known set.
 #
 # Also for performance reasons we're only checking the cruft when using ipk.
 # When using deb, and rpm it is a bit different and we could test all
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index 7fd56f5d36..a80a5844da 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -153,7 +153,7 @@ class BSPCheckLayer(OECheckLayerTestCase):
                 # do_build can be ignored: it is know to have
                 # different signatures in some cases, for example in
                 # the allarch ca-certificates due to RDEPENDS=openssl.
-                # That particular dependency is whitelisted via
+                # That particular dependency is marked via
                 # SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS, but still shows up
                 # in the sstate signature hash because filtering it
                 # out would be hard and running do_build multiple
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 14d8c298e9..ec2374f183 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -5,7 +5,7 @@
 
 import sys, os, subprocess, re, shutil
 
-whitelist = (
+allowed = (
     # type is supported by dash
     'if type systemctl >/dev/null 2>/dev/null; then',
     'if type systemd-tmpfiles >/dev/null 2>/dev/null; then',
@@ -19,8 +19,8 @@ whitelist = (
     '. $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE'
     )
 
-def is_whitelisted(s):
-    for w in whitelist:
+def is_allowed(s):
+    for w in allowed:
         if w in s:
             return True
     return False
@@ -49,7 +49,7 @@ def process(filename, function, lineno, script):
         output = e.output.replace(fn.name, function)
         if not output or not output.startswith('possible bashism'):
             # Probably starts with or contains only warnings. Dump verbatim
-            # with one space indention. Can't do the splitting and whitelist
+            # with one space indention. Can't do the splitting and allowed
             # checking below.
             return '\n'.join([filename,
                               ' Unexpected output from checkbashisms.pl'] +
@@ -65,7 +65,7 @@ def process(filename, function, lineno, script):
         #  ...
         #   ...
         result = []
-        # Check the results against the whitelist
+        # Check the results against the allowed list
         for message, source in zip(output[0::2], output[1::2]):
             if not is_whitelisted(source):
                 if lineno is not None:
-- 
2.25.1


